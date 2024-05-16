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

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#include "include/pmt.h"

void version()
{
    printf("Version: %s (code %s) ", PMT_VERSION, PMT_VERSION_CODE);

    #if __SIZEOF_POINTER__ == 4
        printf("32-bit binary\n");
    #elif __SIZEOF_POINTER__ == 8
        printf("64-bit binary\n");
    #else
        printf("\n");
    #endif

    #ifdef __clang__
        printf("Compiler: clang %s ", __clang_version__);
    #endif

    #ifdef __GNUC__
        printf("(GNUC %d.%d.%d)\n", __GNUC__, __GNUC_MINOR__, __GNUC_PATCHLEVEL__);
    #else
        printf("\n");
    #endif

    printf("See licenses with -L argument.\n");
}

#ifdef __cplusplus
}
#endif

/* end of code */
