vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO MartinHolcik/lely-canopen
  REF e2ca7cb9e719e3371b88c3441d7f66e54a1a408d
  SHA512 0
  HEAD_REF master
)

vcpkg_configure_make(
  SOURCE_PATH ${SOURCE_PATH}
  AUTOCONFIG
  BUILD_TRIPLET "--host=arm-linux-gnueabihf"
  OPTIONS
  ${OPTIONS}
  --disable-python
  --disable-tools
  --disable-tests
  --disable-daemon
  --disable-diag
)

vcpkg_install_make()
vcpkg_fixup_pkgconfig()

file(
  REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
  REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share"
)

# Handle copyright
file(
  INSTALL "${SOURCE_PATH}/COPYING"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright
)