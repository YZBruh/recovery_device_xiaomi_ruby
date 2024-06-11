/* ruby-detect-variant | writelog.c */

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

#define __LOG_WRITER_INCLUDED__
#define __IS_USES_LOGGING_FEATURES__

#include <android-base/logging.h>
#include "log.h"
#include <unistd.h>
#include <cstdlib>
#include <cstdio>
#include <string>
#include <fstream>
#include <sstream>
#include <ruby-detect-variant.hpp>
#include <logging-ruby.hpp>
#include <recovery-logging-ruby.hpp>

using namespace std;

void write_recovery_log(const char* logmessage, const char* type)
{
    static char *logtype = nullptr;
    ofstream reclogs;

    /* if recovery logs not found, exit */
    if (access(DETINF_RECOVERY_LOGS, F_OK) != 0)
    {
        LOGERR("no recovery logs were found. the target path: " << DETINF_RECOVERY_LOGS);
        exit(9);
    }

    /* detect log tag */
    if (strcmp(type, DETINF_INFO_TAG) == 0) logtype = DETINF_INFO_TAG;
    else if (strcmp(type, DETINF_ERR_TAG) == 0) logtype = DETINF_ERR_TAG;
    else if (strcmp(type, DETINF_WARN_TAG) == 0) logtype = DETINF_WARN_TAG;
    else
    {
        LOGWARN("no matching tag was found (I, W or E). Currently, W is used. Please inform the developer.");
        logtype = DETINF_WARN_TAG;
    }

    /* generate recovery log message */
    stringstream recovery_logs_msg;
    recovery_logs_msg << logtype << ":" << DETINF_LOG_TAG << ": " << logmessage;

    /* open recovery log with adding mode */
    reclogs.open(DETINF_RECOVERY_LOGS, ios::app);

    if (!reclogs.is_open())
    {
        LOGERR("Failed to open recovery logs!");
        exit(4);
    }

    /* write log */
    if (!(reclogs << recovery_logs_msg.str() << endl))
    {
        reclogs.close();
        LOGERR("Failed to write recovery logs!");
        exit(3);
    }

    /* close recovery log */
    reclogs.close();
}

/* end */