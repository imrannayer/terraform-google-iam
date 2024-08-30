/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************
  Module pubsub_subscription_iam_binding calling
 *****************************************/
module "storage_buckets_iam_binding" {
  source  = "terraform-google-modules/iam/google//modules/storage_buckets_iam"
  version = "~> 8.0"

  storage_buckets = [var.storage_bucket_one, var.storage_bucket_two]
  mode            = "additive"

  bindings = {
    "roles/storage.legacyBucketReader" = [
      "serviceAccount:${var.sa_email}",
      "group:${var.group_email}",
      "user:${var.user_email}",
    ]
    "roles/storage.legacyBucketWriter" = [
      "serviceAccount:${var.sa_email}",
      "group:${var.group_email}",
      "user:${var.user_email}",
    ]
  }
}
