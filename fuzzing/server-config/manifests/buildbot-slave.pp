# Puppet manifest -- buildbot worker
#
# Copyright (C) 2017, ARM Limited, All Rights Reserved
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This file is part of mbed TLS (https://tls.mbed.org)

class { 'sudo':
	purge => false,
	config_file_replace => false,
}

sudo::conf { 'buildbot':
	priority => 50,
	content => "buildbot ALL=(ALL) NOPASSWD: ALL",
}

buildbot::slave { 'build': botname=>"build", botpass=>"pass" }

buildbot::slave { 'fuzzer0': botname=>"fuzzer0", botpass=>"pass2" }

package { 'docker.io':
	ensure => 'installed',
}
