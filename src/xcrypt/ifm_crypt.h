/******************************************************************************
 * This is an adaptation file for the crypt interface in libxcrpt
 *
 * Copyright (c) Huawei Technologies Co., Ltd. 2020. All rights reserved.
 *
 * Authors:
 * huangduirong <huangduirong@huawei.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 ********************************************************************************/
#ifndef IFM_LIBXCRYPT_H
#define IFM_LIBXCRYPT_H

#include <stdint.h>
#include <crypt.h>

#ifdef __cplusplus
extern "C" {
#endif

#define crypt ifm_crypt

char *crypt (const char *__phrase, const char *__setting);

#ifdef __cplusplus
}
#endif

#endif /* IFM_LIBXCRYPT_H */