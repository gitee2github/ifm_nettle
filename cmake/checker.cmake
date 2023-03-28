# lcr: utils library for iSula
#
# Copyright (c) Huawei Technologies Co., Ltd. 2020. All rights reserved.
#
# Authors:
# Haozi007 <liuhao27@huawei.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
#

# check depends library and headers
find_package(PkgConfig REQUIRED)

macro(_CHECK)
if (${ARGV0} STREQUAL "${ARGV1}")
	message("error: can not find " ${ARGV2} " program")
	set(CHECKER_RESULT 1)
else()
	message("--  found " ${ARGV2} " --- works")
endif()
endmacro()

if (ENABLE_LIBLCR)
# check libnettle
pkg_check_modules(PC_LIBNETTLE REQUIRED "nettle>=3")
find_path(LIBNETTLE_INCLUDE_DIR nettle/sm3.h
	HINTS ${PC_LIBNETTLE_INCLUDEDIR} ${PC_LIBNETTLE_INCLUDE_DIRS})
_CHECK(LIBNETTLE_INCLUDE_DIR "LIBNETTLE_INCLUDE_DIR-NOTFOUND" "nettle/sm3.h")

find_library(LIBNETTLE_LIBRARY nettle
	HINTS ${PC_LIBNETTLE_LIBDIR} ${PC_LIBNETTLE_LIBRARY_DIRS})
_CHECK(LIBNETTLE_LIBRARY "LIBNETTLE_LIBRARY-NOTFOUND" "libnettle.so")
endif()


if (ENABLE_UT)
    pkg_check_modules(PC_GTEST "gtest")
    find_path(GTEST_INCLUDE_DIR gtest/gtest.h
        HINTS ${PC_GTEST_INCLUDEDIR} ${PC_GTEST_INCLUDE_DIRS})
    _CHECK(GTEST_INCLUDE_DIR "GTEST_INCLUDE_DIR-NOTFOUND" "gtest.h")
    find_library(GTEST_LIBRARY gtest
        HINTS ${PC_GTEST_LIBDIR} ${PC_GTEST_LIBRARY_DIRS})
    _CHECK(GTEST_LIBRARY "GTEST_LIBRARY-NOTFOUND" "libgtest.so")

    pkg_check_modules(PC_GMOCK "gmock")
    find_path(GMOCK_INCLUDE_DIR gmock/gmock.h
        HINTS ${PC_GMOCK_INCLUDEDIR} ${PC_GMOCK_INCLUDE_DIRS})
    _CHECK(GMOCK_INCLUDE_DIR "GMOCK_INCLUDE_DIR-NOTFOUND" "gmock.h")
    find_library(GMOCK_LIBRARY z
        HINTS ${PC_GMOCK_LIBDIR} ${PC_GMOCK_LIBRARY_DIRS})
    _CHECK(GMOCK_LIBRARY "GMOCK_LIBRARY-NOTFOUND" "libgmock.so")
endif()

if (ENABLE_GCOV)
    find_program(CMD_GCOV gcov)
    _CHECK(CMD_GCOV "CMD_GCOV-NOTFOUND" "gcov")

    find_program(CMD_LCOV lcov)
    _CHECK(CMD_LCOV "CMD_LCOV-NOTFOUND" "lcov")

    find_program(CMD_GENHTML genhtml)
    _CHECK(CMD_GENHTML "CMD_GENHTML-NOTFOUND" "genhtml")
endif()
