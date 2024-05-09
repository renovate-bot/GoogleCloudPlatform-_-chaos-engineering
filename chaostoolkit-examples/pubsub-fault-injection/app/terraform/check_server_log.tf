#
# Copyright 2023 Google LLC
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
resource "local_file" "check_server_log" {

  filename = "${var.folder}/check_server_log.sh"

  content = <<-EOT
    gcloud compute ssh --zone "${google_compute_instance.pubsubtestserver.zone}"  "${google_compute_instance.pubsubtestserver.name}"  --tunnel-through-iap --project "${var.project_id}" --command "cat /var/log/syslog | grep Failed; tail -f /var/log/syslog"
  EOT

}
