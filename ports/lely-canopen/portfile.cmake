vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO MartinHolcik/lely-canopen
    REF 7f34918395f539a4e37d4a2aff100b222b1d28e7
    SHA512 0ebc79b310c03a3f7c984578fe1cdec964496fc7faba99068f6618de555574aac19cdc51d08197238fc24e950df3e96d7548fffc120892442e48da085739f2ef
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