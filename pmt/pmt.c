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

/* force use C std (if default is C++) */
#ifdef __cplusplus
extern "C" {
#endif

/* include needed libs (headers) */
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <string.h>
#include <stdbool.h>
#include <getopt.h>
#include <errno.h>

/* include custom pmt header */
#include "include/pmt.h"

/* add value to variables that are added globally and are not worth */
char *out = NULL;
char *outdir = NULL;
char *cust_cxt = NULL;
char *target_partition = NULL;
char *target_flash_file = NULL;
char *partition_type = NULL;
char *format_fs = NULL;
bool pmt_use_logical = NULL;
bool pmt_use_cust_cxt = NULL;
bool pmt_ab = false;
bool pmt_logical = false;
bool pmt_flash = false;
bool pmt_backup = false;
bool pmt_format = false;
bool pmt_force_mode = false;

/* classic main function (C binary here xd) */
int main(int argc, char *argv[])
{
    /* check argument total */
    if (argc < 2)
    {
        fprintf(stderr, "%s: missing operand\nTry `%s --help' for more information.\n", argv[0], argv[0]);
        exit(44);
    }

    /* a structure for long arguments... */
    struct option long_options[] = {
        {"backup", no_argument, 0, 'b'},
        {"flash", required_argument, 0, 'F'},
        {"format", required_argument, 0, 'r'},
        {"partition", required_argument, 0, 'p'},
        {"logical", no_argument, 0, 'l'},
        {"out", required_argument, 0, 'o'},
        {"outdir", required_argument, 0, 'd'},
        {"context", required_argument, 0, 'c'},
        {"list", no_argument, 0, 'D'},
        {"force", no_argument, 0, 'f'},
        {"version", no_argument, 0, 'v'},
        {"help", no_argument, 0, 0},
        {"license", no_argument, 0, 'L'},
        {0, 0, 0, 0}
    };

    /* boolean statements (only valid in this file) to distinguish. and pointer from a shortcut for the symbol rule */
    static bool wiew_help = false;
    static bool wiew_licenses = false;
    static bool wiew_version = false;
    static bool list_partitions = false;
    static bool combo_wiewers = false;
    static bool use_cust_outdir = false;
    static char *opt_symbol = "-";
    static char *common_symbol_rule;
    common_symbol_rule = "When entering the attached argument of an option, an argument of another option type cannot be used. In short, the rule is: there can be no '-' at the beginning of the attached argument.\n";

    int opt;

    /* control for each argument */
    while ((opt = getopt_long(argc, argv, "bF:rp:lo:d:c:DfvL", long_options, NULL)) != -1)
    {
        /* process arguments */
        switch (opt)
        {
            /* backup mode */
            case 'b':
                pmt_backup = true;
                break;
            /* flash mode */
            case 'F':
                target_flash_file = strdup(optarg);
                if (strncmp(target_flash_file, opt_symbol, 1) == 0)
                {
                    if (!pmt_force_mode)
                    {
                        error(common_symbol_rule, 19);
                    } else {
                        exit(19);
                    }
                }
                pmt_flash = true;
                break;
            /* format mode */
            case 'r':
                format_fs = strdup(optarg);
                if (strncmp(format_fs, opt_symbol, 1) == 0)
                {
                    if (!pmt_force_mode)
                    {
                        fprintf(stderr, "%s", common_symbol_rule);
                        exit(71);
                    } else {
                        exit(71);
                    }
                }
                pmt_format = true;
                break;
            /* partition selector option */
            case 'p':
                target_partition = strdup(optarg);
                if (strncmp(target_partition, opt_symbol, 1) == 0)
                {
                    if (!pmt_force_mode)
                    {
                        error(common_symbol_rule, 19);
                    } else {
                        exit(19);
                    }
                }
                break;
            /* logical partitions option */
            case 'l':
                check_root();
                check_psf();
                if (pmt_logical)
                {
                    pmt_use_logical = true;
                } else {
                    if (!pmt_force_mode)
                    {
                        error("This device does not have logical partitions!\n", 17);
                    } else {
                        exit(17);
                    }
                }
                break;
            /* output file option */
            case 'o':
                out = strdup(optarg);
                if (strncmp(out, opt_symbol, 1) == 0)
                {
                    if (!pmt_force_mode)
                    {
                        error(common_symbol_rule, 19);
                    } else {
                        exit(19);
                    }
                }
                break;
            /* output dir option */
            case 'd':
                use_cust_outdir = true;
                outdir = strdup(optarg);
                break;
            /* context selector option */
            case 'c':
                pmt_use_cust_cxt = true;
                cust_cxt = strdup(optarg);
                if (strncmp(cust_cxt, opt_symbol, 1) == 0)
                {
                    if (!pmt_force_mode)
                    {
                        error(common_symbol_rule, 19);
                    } else {
                        exit(19);
                    }
                }
                break;
            /* partition lister function */
            case 'D':
                list_partitions = true;
                /* check combo wiewer options and progress */
                if (wiew_version || wiew_help || wiew_licenses)
                {
                    combo_wiewers = true;
                }
                break;
            /* force mode option */
            case 'f':
                pmt_force_mode = true;
                break;
            /* version info option */
            case 'v':
                wiew_version = true;
                /* check combo wiewer options and progress */
                if (list_partitions || wiew_help || wiew_licenses)
                {
                    combo_wiewers = true;
                }
                break;
            /* help message opption */
            case 0:
                wiew_help = true;
                /* check combo wiewer options and progress */
                if (wiew_version || list_partitions || wiew_licenses)
                {
                    combo_wiewers = true;
                }
                break;
            /* license wiewer option */
            case 'L':
                wiew_licenses = true;
                /* check combo wiewer options and progress */
                if (wiew_version || wiew_help || list_partitions)
                {
                    combo_wiewers = true;
                }
                break;
            /* for invalid options */
            case '?':
                printf("Try `%s --help' for more information.\n", argv[0]);
                exit(43);
                break;
            default:
                printf("Usage: %s [-b | --backup] [-f | --flash FILE] [-r | --format FS_TYPE] [-p | --partition PARTITION] [-l | --logical] [-o | --out OUTNAME] [-d | --outdir OUTDIR] [-c | --context] [-D | --list] [-v | --version] [--help] [-L | --license]\n", argv[0]);
                exit(44);
        }
    }

    /* stop the program if multiple viewer is used */
    if (combo_wiewers)
    {
        fprintf(stderr, "%s: Multiple wiewers cannot be used at the same line.\n", argv[0]);
        exit(81);
    }

    /* controller to handle viewer */
    if (wiew_help)
    {
        help();
        exit(EXIT_SUCCESS);
    } else if (wiew_version)
    {
        version();
        exit(EXIT_SUCCESS);
    } else if (wiew_licenses)
    {
        licenses();
        exit(EXIT_SUCCESS);
    } else if (list_partitions)
    {
        check_root();
        listpart();
        exit(EXIT_SUCCESS);
    }

    /* target control is done */
    if (!pmt_backup && !pmt_flash && !pmt_format)
    {
        fprintf(stderr, "%s: missing operand.\nTry `%s --help` for more information.\n", argv[0], argv[0]);
        exit(3);
    }

    /* prevent multiple mode use */
    if (pmt_backup && pmt_flash)
    {
        if (!pmt_force_mode)
        {
            error("Backup and flash functions cannot be used in the same command.\n", 9);
        } else {
            exit(9);
        }
    }

    /* checks */
    check_root();
    check_psf();

    if (pmt_format)
    {
        if (strcmp(format_fs, "ext4") != 0 || strcmp(format_fs, "ext3") != 0 || strcmp(format_fs, "ext2") != 0)
        {
            if (!pmt_force_mode)
            {
                fprintf(stderr, "%s: formatter: unsupported filesystem: %s", argv[0], format_fs);
                exit(41);
            } else {
                exit(41);
            }
        }
    }

    if (use_cust_outdir)
    {
        if (strncmp(outdir, opt_symbol, 1) == 0)
        {
            if (!pmt_force_mode)
            {
                error(common_symbol_rule, 19);
            } else {
                exit(19);
            }
        }
        struct stat out_info;
        if (stat(outdir, &out_info) != 0)
        {
            if (!pmt_force_mode)
            {
                fprintf(stderr, "%s: cannot stat '%s': %s\n", argv[0], outdir, strerror(errno));
                exit(18);
            } else {
                exit(18);
            }
        } else {
            if (!S_ISDIR(out_info.st_mode))
            {
                if (!pmt_force_mode)
                {
                    fprintf(stderr, "%s: %s: is a not directory.\n", argv[0], outdir);
                    exit(20);
                } else {
                    exit(20);
                }
            }
        }
    }

    if (pmt_flash)
    {
        struct stat flashf_info;
        if (stat(target_flash_file, &flashf_info) != 0)
        {
            if (!pmt_force_mode)
            {
                fprintf(stderr, "%s: cannot stat '%s': %s\n", argv[0], target_flash_file, strerror(errno));
                exit(15);
            } else {
                exit(15);
            }
        } else {
            if (!S_ISREG(flashf_info.st_mode))
            {
                if (!pmt_force_mode)
                {
                    fprintf(stderr, "%s: %s: is a not file.\n", argv[0], target_flash_file);
                    exit(16);
                } else {
                    exit(16);
                }
            }
        }
    }

    /* custom context checker */
    if (pmt_use_cust_cxt)
    {
        struct stat cxtinfo;
        if (stat(cust_cxt, &cxtinfo) == 0)
        {
            if (!S_ISREG(cxtinfo.st_mode))
            {
                if (!pmt_force_mode)
                {
                    fprintf(stderr, "%s: %s: is a not directory.\n", argv[0], cust_cxt);
                    exit(8);
                } else {
                    exit(8);
                }
            }
        } else {
            if (!pmt_force_mode)
            {
                fprintf(stderr, "%s: %s: %s\n", argv[0], cust_cxt, strerror(errno));
                exit(6);
            } else {
                exit(6);
            }
        }
        if (strstr(cust_cxt, "/dev") == NULL && !pmt_force_mode)
        {
            fprintf(stderr, "%sYou're going through my wave? There's nothing about this /dev. Use force mode if you don't want this error%s\n", ANSI_YELLOW, ANSI_RESET);
            exit(81);
        } 
    }

    if (target_partition == NULL)
    {
        if (!pmt_force_mode)
        {
            fprintf(stderr, "%s: required partition name.\nTry `%s --help' for more information.\n", argv[0], argv[0]);
            exit(5);
        } else {
            exit(5);
        }
    } else {
        /**
         * 
         * 1 = backup mode 
         * 
         * 2 = flash mode 
         * 
         * 3 = format
         */
        if (pmt_backup)
        {
            pmt(1);
            exit(EXIT_SUCCESS);
        } else if (pmt_flash)
        {
            pmt(2);
            exit(EXIT_SUCCESS);
        } else if (pmt_format)
        {
            pmt(3);
        } else {
            fprintf(stderr, "%s: no target (backup or flash).\nTry `%s --help` for more information.\n", argv[0], argv[0]);
            exit(3);
        }
    }
}

#ifdef __cplusplus
}
#endif

/* end of code */
