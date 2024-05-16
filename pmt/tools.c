/* By YZBruh */

/**
 * Copyright 2024 Partition Manager
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifdef __cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/statvfs.h>
#include <string.h>
#include <stdbool.h>
#include <stddef.h>
#include <errno.h>
#include <fcntl.h>

#include "include/pmt.h"

#define BFSIZE 1024

extern char *out;
extern char *outdir;
extern char *format_fs;
extern char *cust_cxt;
extern char *target_partition;
extern char *target_flash_file;
extern char *partition_type;
extern bool pmt_use_logical;
extern bool pmt_use_cust_cxt;
extern bool pmt_logical;
extern bool pmt_flash;
extern bool pmt_backup;
extern bool pmt_force_mode;

/**
 * 
 *    if progress_code is a
 * 1 = backup mode 
 * 
 * 2 = flash mode 
 * 
 * 3 = format mode
 */

void pmt(short progress_code)
{
    /* required variables */
    static int srcf, targetf;
    static char backupper_path[512];
    static char ppath[100];
    static char formatter_cmd[200];
    static char outf[512];
    static char flasher_path[512];
    static char buffer[BFSIZE];
    static ssize_t bytesRead;
    static unsigned long long bytesCopied = 0;
    static unsigned long long count = 1024 * 1024 * 1024;

    if (progress_code == 1)
    {
        if (!pmt_use_logical)
        {
            if (pmt_use_cust_cxt)
            {
                sprintf(backupper_path, "%s/%s", cust_cxt, target_partition);
            } else {
                sprintf(backupper_path, "/dev/block/by-name/%s", target_partition);
            }
        } else if (pmt_use_logical)
        {
            sprintf(backupper_path, "/dev/block/mapper/%s", target_partition);
        } else {
            if (!pmt_force_mode)
            {
                error("İnvalid partition type!\n", 28);
            } else {
                exit(28);
            }
        }

        if (access(backupper_path, F_OK) == -1)
        {
            if (!pmt_force_mode)
            {
                error("Partition not found!\n", 29);
            } else {
                exit(29);
            }
        }

        srcf = open(backupper_path, O_RDONLY);
        if (srcf == -1) {
            if (!pmt_force_mode)
            {
                fprintf(stderr, "Couldn't read: %s: %s", backupper_path, strerror(errno));
                exit(39);
            } else {
                exit(39);
            }
        }

        /* determine output */
        if (outdir != NULL)
        {
            if (out != NULL)
            {
                sprintf(outf, "%s/%s.img", outdir, out);
            } else {
                sprintf(outf, "%s/%s.img", outdir, target_partition);
            }
        } else {
            if (out != NULL)
            {
                sprintf(outf, "/storage/emulated/0/%s.img", out);
            } else {
                sprintf(outf, "/storage/emulated/0/%s.img", target_partition);
            }
        }

        targetf = open(outf, O_WRONLY | O_CREAT | O_TRUNC, 0666);
        if (targetf == -1) {
            if (!pmt_force_mode)
            {
                fprintf(stderr, "Couldn't generate: %s: %s", outf, strerror(errno));
                exit(37);
            } else {
                exit(37);
            }
        }


        /* start writing */
        while ((bytesRead = read(srcf, buffer, BFSIZE)) > 0 && bytesCopied < count)
        {
            ssize_t bytesWritten = write(targetf, buffer, bytesRead);
            if (bytesWritten != bytesRead)
            {
                fprintf(stderr, "Couldn't write: %s: %s", backupper_path, strerror(errno));
                close(srcf);
                close(targetf);
                exit(81);
            }

            bytesCopied += bytesWritten;
        }

        /* close files */
        close(srcf);
        close(targetf);

        /* Print the output information by evaluating all situations */
        if (outdir != NULL)
        {
            if (out != NULL)
            {
                printf("%sSuccess. Output: %s/%s.img%s\n", ANSI_GREEN, outdir, out, ANSI_RESET);
            } else {
                printf("%sSuccess. Output: %s/%s.img%s\n", ANSI_GREEN, outdir, target_partition, ANSI_RESET);
            }
        } else {
            if (out != NULL)
            {
                printf("%sSuccess. Output: /storage/emulated/0/%s.img%s\n", ANSI_GREEN, out, ANSI_RESET);
            } else {
                printf("%sSuccess. Output: /storage/emulated/0/%s.img%s\n", ANSI_GREEN, target_partition, ANSI_RESET);
            }
        }
    } else if (progress_code == 2)
    {
        /* determine device block */
        /* for classic */
        if (!pmt_use_logical)
        {
            if (pmt_use_cust_cxt)
            {
                sprintf(flasher_path, "%s/%s", cust_cxt, target_partition);
            } else {
                sprintf(flasher_path, "/dev/block/by-name/%s", target_partition);
            }
        /* for logical */
        } else if (pmt_use_logical)
        {
            sprintf(flasher_path, "/dev/block/mapper/%s", target_partition);
        } else {
            if (!pmt_force_mode)
            {
                error("İnvalid partition type!\n", 30);
            } else {
                exit(30);
            }
        }

        /* check partition */
        if (access(flasher_path, F_OK) == -1)
        {
            if (!pmt_force_mode)
            {
                error("Partition not found!\n", 31);
            } else {
                exit(31);
            }
        }

        srcf = open(target_flash_file, O_RDONLY);
        if (srcf == -1) {
            if (!pmt_force_mode)
            {
                fprintf(stderr, "Couldn't read: %s: %s", target_flash_file, strerror(errno));
                exit(39);
            } else {
                exit(39);
            }
        }

        targetf = open(target_partition, O_WRONLY | O_CREAT | O_TRUNC, 0666);
        if (targetf == -1) {
            if (!pmt_force_mode)
            {
                fprintf(stderr, "Couldn't read: %s: %s", target_partition, strerror(errno));
                exit(37);
            } else {
                exit(37);
            }
        }

        /* start writing */
        while ((bytesRead = read(srcf, buffer, BFSIZE)) > 0 && bytesCopied < count) {
            ssize_t bytesWritten = write(targetf, buffer, bytesRead);
            if (bytesWritten != bytesRead) {
                fprintf(stderr, "Couldn't write: %s: %s", backupper_path, strerror(errno));
                close(srcf);
                close(targetf);
                exit(81);
            }

            bytesCopied += bytesWritten;
        }

        close(srcf);
        close(targetf);

        if (!pmt_force_mode)
        {
            printf("%sSuccess.%s\n", ANSI_GREEN, ANSI_RESET);
        }
    } else if (progress_code == 3)
    {
        /* generate partition extn */
        if (!pmt_use_logical)
        {
            if (pmt_use_cust_cxt)
            {
                sprintf(ppath, "%s/%s", cust_cxt, target_partition);
            } else {
                sprintf(ppath, "/dev/block/by-name/%s", target_partition);
            }
        /* for logical */
        } else if (pmt_use_logical)
        {
            sprintf(ppath, "/dev/block/mapper/%s", target_partition);
        } else {
            if (!pmt_force_mode)
            {
                error("İnvalid partition type!\n", 30);
            } else {
                exit(49);
            }
        }

        /* check partition */
        if (access(ppath, F_OK) == -1)
        {
            if (!pmt_force_mode)
            {
                error("Partition not found!\n", 31);
            } else {
                exit(31);
            }
        }

        /* get target partition block size */
        struct statvfs file_sys_inf;
        if (statvfs(ppath, &file_sys_inf) != 0)
        {
            if (!pmt_force_mode)
            {
                fprintf(stderr, "The partition block size could not be obtained!\n");
                exit(49);
            } else {
                exit(49);
            }
        }

        /* generate mke2fs command */
        sprintf(formatter_cmd, "mke2fs -Fq -t %s -b %lu %s", format_fs, file_sys_inf.f_bsize, ppath);

        /* run command */
        if (system(formatter_cmd) != 0)
        {
            if (!pmt_force_mode)
            {
                error("Formatting failed! There may be a chance that something has been damaged!\n", 71);
            } else {
                exit(71);
            }
        }
    }
}

#ifdef __cplusplus
}
#endif

/* end of code */
