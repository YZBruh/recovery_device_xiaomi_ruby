/* ruby-detect-variant | ruby-detect-variant.h */

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

#if !defined(__RUBY_DETECT_VARIANT__)
#define __RUBY_DETECT_VARIANT__

void write_recovery_log(const char* logmessage, const char* type);
void load_variant(const char* target_variant, const char* target_model);

bool static_prop_svc = true;

#endif /* __RUBY_DETECT_VARIANT__ */

/* end */