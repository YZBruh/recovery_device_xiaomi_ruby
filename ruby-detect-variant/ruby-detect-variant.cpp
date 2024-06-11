/* ruby-detect-variant | ruby-set-variant.c */

/*
 * Copyright (C) 2024 The Android Open Source Project
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

#define __RUBY_VARIANT_SET_INCLUDED__
#define __IS_USES_LOGGING_FEATURES__

#include <iostream>
#include <cstdlib>
#include <unistd.h>
#include <cstdio>
#include <cstring>
#include <android-base/logging.h>
#include "log.h"
#include <getopt.h>
#include <resetprop.hpp>
#include <ruby-detect-variant.hpp>
#include <logging-ruby.hpp>
#include <variants-ruby.hpp>

int main(int argc, char *argv[])
{
    struct option long_options[] = {
        {"default", required_argument, 0, 0},
        {0, 0, 0, 0}
    };

    static char *default_device = nullptr;
    static char *default_devicetmp = nullptr;
    static int opt;

    while ((opt = getopt_long(argc, argv, "", long_options, nullptr)) != -1)
    {
        switch (opt)
        {
            case 0:
                default_devicetmp = strdup(optarg);
                if (strcmp(default_devicetmp, "ruby") == 0) default_device = default_devicetmp;
                else if (strcmp(default_devicetmp, "rubypro") == 0) default_device = default_devicetmp;
                else
                {
                    LOGERR("unknown default variant argument: " << default_devicetmp);
                    write_recovery_log("unknown default variant argument detected!", DETINF_ERR_TAG);
                    exit(21);
                }
                break;
        } 
    }

    /* if variant flag is not specified set ruby as current variant */
    if (argc == 1) default_device = "ruby";
    
    /* write current status */
    LOGINF("starting variant loader...");
    write_recovery_log("starting variant loader...", DETINF_INFO_TAG);

    /* wait 2 second */
    sleep(2);

    LOGINF("detecting device...");
    write_recovery_log("detecting device...", DETINF_INFO_TAG);
    static char hwname[25];

    /* reset ro.boot.hwname property and get output */
    FILE *hw = popen("resetprop ro.boot.hwname", "r");

    /* check status */
    if (hw == nullptr)
    {
        LOGERR("failed to reset ro.boot.hwname property");
        write_recovery_log("failed to reset ro.boot.hwname property", DETINF_ERR_TAG);
        exit(71);
    }

    /* detect variant */
    if (fgets(hwname, sizeof(hwname), hw) != nullptr)
    {
        pclose(hw);
        /* load ruby variant */
        if (strcmp(hwname, TARGET_1ND_DEVICE_NAME) == 0)
        {
            LOGINF("ruby variant detected.");
            write_recovery_log("ruby variant detected.", DETINF_INFO_TAG);
            load_variant(TARGET_1ND_DEVICE_NAME, TARGET_1ND_DEVICE_MODEL);
        /* load rubypro variant */
        }
        else if (strcmp(hwname, TARGET_2ND_DEVICE_NAME) == 0)
        {
            LOGINF("rubypro variant detected.");
            write_recovery_log("rubypro variant detected.", DETINF_INFO_TAG);
            load_variant(TARGET_2ND_DEVICE_NAME, TARGET_2ND_DEVICE_MODEL);
        /* load default variant. please see include/detector/variants-ruby.hpp */
        }
        else
        {
            LOGWARN("any device could not be detected. Using ruby variant.");
            write_recovery_log("any device could not be detected. Using default variant.", DETINF_WARN_TAG);
            load_variant(default_device, TARGET_1ND_DEVICE_MODEL);
        }
    }

    exit(0);
}

/* end */
