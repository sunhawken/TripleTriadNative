# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "G:/SteamLibrary/steamapps/common/MO2 2.5.2 for SkyrimVR/mods/Triple Triad in Skyrim - Tweaked/SKSE_Plugin_Source/build/_deps/commonlibsse-src")
  file(MAKE_DIRECTORY "G:/SteamLibrary/steamapps/common/MO2 2.5.2 for SkyrimVR/mods/Triple Triad in Skyrim - Tweaked/SKSE_Plugin_Source/build/_deps/commonlibsse-src")
endif()
file(MAKE_DIRECTORY
  "G:/SteamLibrary/steamapps/common/MO2 2.5.2 for SkyrimVR/mods/Triple Triad in Skyrim - Tweaked/SKSE_Plugin_Source/build/_deps/commonlibsse-build"
  "G:/SteamLibrary/steamapps/common/MO2 2.5.2 for SkyrimVR/mods/Triple Triad in Skyrim - Tweaked/SKSE_Plugin_Source/build/_deps/commonlibsse-subbuild/commonlibsse-populate-prefix"
  "G:/SteamLibrary/steamapps/common/MO2 2.5.2 for SkyrimVR/mods/Triple Triad in Skyrim - Tweaked/SKSE_Plugin_Source/build/_deps/commonlibsse-subbuild/commonlibsse-populate-prefix/tmp"
  "G:/SteamLibrary/steamapps/common/MO2 2.5.2 for SkyrimVR/mods/Triple Triad in Skyrim - Tweaked/SKSE_Plugin_Source/build/_deps/commonlibsse-subbuild/commonlibsse-populate-prefix/src/commonlibsse-populate-stamp"
  "G:/SteamLibrary/steamapps/common/MO2 2.5.2 for SkyrimVR/mods/Triple Triad in Skyrim - Tweaked/SKSE_Plugin_Source/build/_deps/commonlibsse-subbuild/commonlibsse-populate-prefix/src"
  "G:/SteamLibrary/steamapps/common/MO2 2.5.2 for SkyrimVR/mods/Triple Triad in Skyrim - Tweaked/SKSE_Plugin_Source/build/_deps/commonlibsse-subbuild/commonlibsse-populate-prefix/src/commonlibsse-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "G:/SteamLibrary/steamapps/common/MO2 2.5.2 for SkyrimVR/mods/Triple Triad in Skyrim - Tweaked/SKSE_Plugin_Source/build/_deps/commonlibsse-subbuild/commonlibsse-populate-prefix/src/commonlibsse-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "G:/SteamLibrary/steamapps/common/MO2 2.5.2 for SkyrimVR/mods/Triple Triad in Skyrim - Tweaked/SKSE_Plugin_Source/build/_deps/commonlibsse-subbuild/commonlibsse-populate-prefix/src/commonlibsse-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
