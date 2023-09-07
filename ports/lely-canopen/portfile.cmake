vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO MartinHolcik/lely-canopen
  REF e2ca7cb9e719e3371b88c3441d7f66e54a1a408d # pointer to commit (ID) of lely-canopen library repository
  SHA512 6e81617b1eab5c5cc21bdb292d5d483b7ca7d58411aac31596d83ad54046208ab86b211b28045a71e44e0e6086603ec097dd25f00ec0b688da268f5b9af70f49
  HEAD_REF master
)

vcpkg_configure_make(
  SOURCE_PATH ${SOURCE_PATH}
  AUTOCONFIG
  BUILD_TRIPLET "--host=x64" # arm-linux-gnueabihf"
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
  REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin"
  REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/bin"
  REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
  REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share"
)

# # Handle copyright - not working
# file(
# INSTALL "${SOURCE_PATH}/COPYING"
# DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
# RENAME copyright
# )

# Handle copyright
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")