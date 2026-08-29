#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'vendor/amlogic/ne-common',
]

blob_fixups: blob_fixups_user_type = {
    'vendor/bin/hw/android.hardware.security.keymint-service.amlogic': blob_fixup()
        .replace_needed('lib_android_keymaster_keymint_utils.so', 'lib_android_keymaster_akeymint_utils.so')
        .replace_needed('libkeymint.so', 'libakeymint.so')
        .replace_needed('libkeymint_remote_prov_support.so', 'libakeymint_remote_prov_support.so'),
    'vendor/lib/libakeymint.so': blob_fixup()
        .replace_needed('lib_android_keymaster_keymint_utils.so', 'lib_android_keymaster_akeymint_utils.so'),
    'vendor/lib/libakeymint_remote_prov_support.so': blob_fixup()
         .replace_needed('libcppcose_rkp.so', 'libacppcose_rkp.so')
         .replace_needed('libbase.so', 'libbase-v33.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'tifa',
    'sdmc',
    blob_fixups=blob_fixups,
    namespace_imports=namespace_imports,
    add_firmware_proprietary_file=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, '../amlogic/ne-common', module.vendor)
    utils.run()
