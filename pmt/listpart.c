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
#include <stdlib.h>
#include <unistd.h>
#include <stdbool.h>
#include <errno.h>
#include <dirent.h>
#include <string.h>

#include "include/pmt.h"

extern bool pmt_use_cust_cxt;
extern bool pmt_ab;
extern bool pmt_logical;
extern bool pmt_force_mode;
extern char *cust_cxt;

/* list existing partitions */
void listpart() {
    DIR *dir;
    struct dirent *entry;

    if (pmt_use_cust_cxt)
    {
        dir = opendir(cust_cxt);
        if (dir == NULL)
        {
            if (!pmt_force_mode) {
                fprintf(stderr, "Could not open: `%s`. Error reason: %s\n", cust_cxt, strerror(errno));
                exit(62);
            } else {
                exit(62);
            }
        }
    } else {
        dir = opendir("/dev/block/by-name");
        if (dir == NULL)
        {
            if (!pmt_force_mode)
            {
                fprintf(stderr, "Could not open: `/dev/block/by-name`. Error reason: %s\n", strerror(errno));
                exit(63);
            } else {
                exit(63);
            }
        }
    }

    while ((entry = readdir(dir)) != NULL) {
        printf("%s\n", entry->d_name);
    }

    closedir(dir);

    if (pmt_logical)
    {
        printf("List of logical partitions (/dev/block/mapper): \n");
        if (system("ls /dev/block/mapper") != 0 && !pmt_force_mode)
        {
            error("An error occurred when the logical partition list appears!\n", 64);
        }
    }

    if (pmt_ab && !pmt_force_mode)
    {
        printf("%sWarning: device using A/B partition style.%s\n", ANSI_YELLOW, ANSI_RESET);
    }

    if (pmt_logical && !pmt_force_mode)
    {
        printf("%sWarning: device using logical partition type.%s\n", ANSI_YELLOW, ANSI_RESET);
    }
}

#ifdef __cplusplus
}
#endif

/* end of code */
