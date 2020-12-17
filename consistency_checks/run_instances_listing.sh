#!/bin/bash
# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# To call: ./run_instance_listing.sh <target_path> <design_name> <sub_design_name> <output_path>

export TARGET_DIR=$1
export PDK_ROOT=$2
export DESIGN_NAME=$3
export SUB_DESIGN_NAME=$4
export OUT_DIR=$5
export SCRIPTS_ROOT=${6:-$(pwd)}

if ! [[ -d "$OUT_DIR" ]]
then
    mkdir $OUT_DIR
fi
echo "Running Magic..."
export MAGIC_MAGICRC=/usr/local/bin/tech-files/sky130A.magicrc

magic \
    -noconsole \
    -dnull \
    -rcfile $MAGIC_MAGICRC \
    $SCRIPTS_ROOT/magic_list_instances.tcl \
    </dev/null \
    |& tee $OUT_DIR/magic_extract.log

exit 0
