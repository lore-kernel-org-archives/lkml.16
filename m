Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068001DE885
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750308106; cv=none; b=Ui0i5DeZtbm2weZ0aPOxOBJKBXhQFeN7INKnCX7W15IHmFqrpMqsbNK1eRrbE+sbsQuqTsx+vIRVt27W/EcjgezD4UI8uIvXRFGRlRc71TEa5dmcmIc7YcFyuNSy82jr8D1ziZluLt3BDN1r54IxW9754t6iz07FOfnXiTmGOV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750308106; c=relaxed/simple;
	bh=e2gNm/sRLOHorXu+vbqinOUyj1TAfLAqLN7p7lxnF38=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=V2aesHGITjkGQKycFa9sY2uyJDEy4q7WgHJsPR8cDwLCimUDy5S4/ma/q+ZYyQx4cYOXuPX9+U4vYRj8T587ZuFhfUrp3FvUbQpO4mrSfy7R1ImptgqxtIskHT8PAyt2NmQwXo9bimLoT1ns0UpLabGhuQ3po1W5k4buYRq3W4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScRZCak6; arc=none smtp.client-ip=209.85.128.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScRZCak6"
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-70f862dbeaeso3915717b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750308104; x=1750912904; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tnhTENPgNZ/R0ObSuFGCePwS00BmqcmGFq8ONsFMWHg=;
        b=ScRZCak6YTqMKzaFSlDSgb+wdO9P0hKHDfC+qp/qLpV+XJU5tt0gEmHUHUF+7tivqL
         k1lVHrktl19oxB/LEp0kMqIXJ4NdHDh5nnia+YyEThExlDOHD/aTcREehSSkkwCvemEV
         iS7ytGJB08daJeayxF1QqaGqbgla/YsbjnOKFfr9mQOSd+PoL55QjBWS7JMm4lNthfWx
         NZNqSmV0Q/LZRkd2W7/R5ZkUquXEwfJiNzCGeDG9hEzzfH1oGi0iAEbFCZ90Hh59yAN0
         1BUiOSegXrsNoz+RY66Z6OZfXWOs3YdVqLdDQyLkHCIv5CPIpsjKyImNwoUlnPpeovY2
         qnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750308104; x=1750912904;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tnhTENPgNZ/R0ObSuFGCePwS00BmqcmGFq8ONsFMWHg=;
        b=qT03b2/CHbaAxr0WUHCYnIvUPK+ZIub4+3W05ijpkPoxFgijNNKTauQK8ASperxkbU
         aAE7r1ICfNQdBO0aXlgwyVMJCoYN/3PErwGsJqCTSHatfWe4+ZzkSWDPFYoDwPfCu98S
         TT/M+BW4L97Rtao5oOm9IniKn85SzQfOIHhrPqQJmRqi7/DJ9Jvlw5lvOtP8+mzwUPVy
         xp3eANZCmKARjUfGEzi4uaIHNzrG0eeBbBwFi4lwBcMEXhuvhXaMN3Yyg32FZ0B4JwMh
         wTbrTEO5bx1AyctVy5FykPurD0qp+J11U3NBpXYvSEPxZADSgSuFDbKauGc47ehbY+ag
         yqnw==
X-Gm-Message-State: AOJu0YzT7JbHrpsTvwPdQnFQI6KrSqHNhPaa6bxdDx/N88Gqdb+NwXf+
	7dKnCWJpvqZm+IInNHZWK+oO2ULnoV0lC2Mc8l1SdLiqF88aR1VL7uiCsIJSPcvxBYIPVDik16V
	4O89VGDuzuh0x2H8w6xGLm5XP7V4BsY5754VF3QgDEg==
X-Gm-Gg: ASbGncu0wKxduOI6Z6Z4yumMQbEcJtaSxj9gVzjWr0WpHMxh+gFi+fqK8pZVX0TyrQ1
	knmCijEKfZBahhKzc3UqDReJfgsNqHRn5AC4aQ/PAJ2H0Tt2CKjpBkxtxStrSadLuWCN09eHeGj
	ZoxJRCzQKdvzHS6JH6/GefXkvemexWXdtDRyH7g5EvZn9ACUbRrxyGjR0rdMlGOlRrnM8Oy5Ida
	GbGcQ==
X-Google-Smtp-Source: AGHT+IH17geO9R9fMSXAR58M8flXmZICEU89/RxyxQ5wTO4kF4NYqCd8UoSGEJIiD90Fyg85kHT/o6CcGfafR8k/Kww=
X-Received: by 2002:a05:690c:60ca:b0:710:f564:5071 with SMTP id
 00721157ae682-7117538e19emr193359967b3.11.1750308103582; Wed, 18 Jun 2025
 21:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Thu, 19 Jun 2025 10:11:32 +0530
X-Gm-Features: AX0GCFtFwa5BiOhMDHc1y6g7A4kcG9wC3nJHF37V_aKxiSk8ufXJ9ACL5mq05MM
Message-ID: <CAFf+5zj-Wqdov_oCYB4OWXR++hv4mfQPXSiY3my0k_oJJ_2kuA@mail.gmail.com>
Subject: Bits Library (Two files: bits_library.c and bits_library.h).
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Bits Library (Two files: bits_library.c and bits_library.h).

------------------
bits_library.c
------------------

/*
 * License:
 *
 * This file has been released under "unlicense" license
 * (https://unlicense.org).
 *
 * This is free and unencumbered software released into the public domain.
 *
 * Anyone is free to copy, modify, publish, use, compile, sell, or distribute
 * this software, either in source code form or as a compiled binary, for any
 * purpose, commercial or non-commercial, and by any means.
 *
 * For more information about this license, please visit - https://unlicense.org
 */

/*
 * Author: Amit Choudhary
 * Email: amitchoudhary0523 AT gmail DOT com
 */

#include "bits_library.h"

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

char *convert_error_num_to_error_string(int error_num)
{

    switch (error_num) {

        case BL_BC_PTR_IS_NULL:
                return ("'bc_ptr' argument is NULL.");

        case BL_BIT_NUM_OUT_OF_RANGE:
                return ("'bit_num' value given by the user is out of range"
                        " (less than 0 or greater than 'last_bit_num').");

        case BL_VAL_IS_INVALID:
                return ("'val' argument is invalid, it is neither 0 nor 1.");

        case BL_FD_IS_INVALID:
                return ("'fd' argument is negative, hence invalid.");

        case BL_FAILURE:
                return("Some error happened. Function didn't complete"
                       " successfully.");
    }

    return("Invalid error number.");

} // end of function convert_error_num_to_error_string()

struct bits_container *bl_init_bits_container(long num_bits_required)
{

    struct bits_container *bc_ptr = NULL;
    long num_bytes_to_alloc = 0;

    if (num_bits_required <= 0) {
        return NULL;
    }

    bc_ptr = calloc(sizeof(*bc_ptr), 1);

    if (bc_ptr == NULL) {
        return NULL;
    }

    num_bytes_to_alloc = (num_bits_required/8);

    if ((num_bits_required % 8) != 0) {
        num_bits_required = num_bits_required + 1;
    }

    bc_ptr->bit_array_ptr = calloc((size_t)(num_bytes_to_alloc), 1);

    if (bc_ptr->bit_array_ptr == NULL) {
        free(bc_ptr);
        return NULL;
    }

    bc_ptr->last_bit_num = num_bits_required - 1;

    return bc_ptr;

} // end of function bl_init_bits_container()

// bl_set_bit(): We are not checking the function arguments in this function
//               because this function is just a wrapper function with only one
//               function call and no other line of code.
int bl_set_bit(struct bits_container *bc_ptr, long bit_num)
{

    return bl_set_bit_value(bc_ptr, bit_num, 1);

} // end of function bl_set_bit()

// bl_unset_bit(): We are not checking the function arguments in this function
//                 because this function is just a wrapper function with only
//                 one function call and no other line of code.
int bl_unset_bit(struct bits_container *bc_ptr, long bit_num)
{

    return bl_set_bit_value(bc_ptr, bit_num, 0);

} // end of function bl_unset_bit()

int bl_is_bit_set(struct bits_container *bc_ptr, long bit_num)
{

    int val = -1;

    if (bc_ptr == NULL) {
        return BL_BC_PTR_IS_NULL;
    }

    if ((bit_num < 0) || (bit_num > bc_ptr->last_bit_num)) {
        return BL_BIT_NUM_OUT_OF_RANGE;
    }

    val = bl_get_bit_value(bc_ptr, bit_num);

    if (val == 1) {
        return BL_TRUE;
    } else if (val == 0) {
        return BL_FALSE;
    }

    return BL_FAILURE;

} // end of function bl_is_bit_set()

int bl_set_bit_value(struct bits_container *bc_ptr, long bit_num, int val)
{

    long arr_index = -1;
    int bit_index = -1;
    int retval = -1;

    if (bc_ptr == NULL) {
        return BL_BC_PTR_IS_NULL;
    }

    if ((bit_num < 0) || (bit_num > bc_ptr->last_bit_num)) {
        return BL_BIT_NUM_OUT_OF_RANGE;
    }

    if ((val != 1) && (val != 0)) {
        return BL_VAL_IS_INVALID;
    }

    retval = get_arr_index_and_bit_index(bit_num, &arr_index, &bit_index);

    if (retval != BL_SUCCESS) {
        return BL_FAILURE;
    }

    if (val == 1) {
        val = (1 >> bit_index);
        bc_ptr->bit_array_ptr[arr_index] = bc_ptr->bit_array_ptr[arr_index] |
                                           (unsigned char)(val);
    } else { // val is 0
        val = ~(1 >> bit_index);
        bc_ptr->bit_array_ptr[arr_index] = bc_ptr->bit_array_ptr[arr_index] &
                                           (unsigned char)(val);
    }

    return BL_SUCCESS;

} // end of function bl_set_bit_value()

int bl_get_bit_value(struct bits_container *bc_ptr, long bit_num)
{

    long arr_index = -1;
    int bit_index = -1;
    int val = -1;
    int retval = -1;

    if (bc_ptr == NULL) {
        return BL_BC_PTR_IS_NULL;
    }

    if ((bit_num < 0) || (bit_num > bc_ptr->last_bit_num)) {
        return BL_BIT_NUM_OUT_OF_RANGE;
    }

    retval = get_arr_index_and_bit_index(bit_num, &arr_index, &bit_index);

    if (retval != BL_SUCCESS) {
        return BL_FAILURE;
    }

    val = bc_ptr->bit_array_ptr[arr_index] & (1 >> bit_index);

    if (val) {
        return 1;
    }

    return 0;

} // end of function bl_get_bit_value()

int bl_print_all_bits_values(struct bits_container *bc_ptr, int fd)
{
#define STR_SIZE 256

    char str[STR_SIZE] = {0};

    long i = 0;
    int val = -1;

    if (bc_ptr == NULL) {
        return BL_BC_PTR_IS_NULL;
    }

    if (fd < 0) {
        return BL_FD_IS_INVALID;
    }

    for (i = 0; i <= bc_ptr->last_bit_num; i++) {
        snprintf(str, STR_SIZE, "%s", "bit_");
        write(fd, str, strlen(str));
        snprintf(str, STR_SIZE, "%ld", i);
        write(fd, str, strlen(str));
        snprintf(str, STR_SIZE, "%s", " = ");
        write(fd, str, strlen(str));
        val = bl_get_bit_value(bc_ptr, i);
        if (val < 0) {
            snprintf(str, STR_SIZE, "%s\n", "Error. Some error happened.");
            write(fd, str, strlen(str));
            fflush(NULL);
            return BL_FAILURE;
        }
        snprintf(str, STR_SIZE, "%d\n", val);
        write(fd, str, strlen(str));
    } // end of for loop

    fflush(NULL);

    return BL_SUCCESS;

} // end of function bl_print_all_bits_values()

void bl_delete_bits_container(struct bits_container *bc_ptr)
{

    if (bc_ptr == NULL) {
        return;
    }

    free(bc_ptr->bit_array_ptr);

    free(bc_ptr);

    return;

} // end of function bl_delete_bits_container()

static int get_arr_index_and_bit_index(long bit_num, long *arr_index,
                                       int *bit_index)
{

    if ((bit_num < 0) || (arr_index == NULL) || (bit_index == NULL)) {
        return BL_FAILURE;
    }

    *arr_index = bit_num/8;

    *bit_index = (int)(bit_num % 8);

    return BL_SUCCESS;

} // end of function get_arr_index_and_bit_index()

------------------
bits_library.h
------------------

/*
 * License:
 *
 * This file has been released under "unlicense" license
 * (https://unlicense.org).
 *
 * This is free and unencumbered software released into the public domain.
 *
 * Anyone is free to copy, modify, publish, use, compile, sell, or distribute
 * this software, either in source code form or as a compiled binary, for any
 * purpose, commercial or non-commercial, and by any means.
 *
 * For more information about this license, please visit - https://unlicense.org
 */

/*
 * Author: Amit Choudhary
 * Email: amitchoudhary0523 AT gmail DOT com
 */

#ifndef _BITS_LIBRARY_H_
#define _BITS_LIBRARY_H_

// 'bl' and 'BL' mean bits library
// 'bc' and 'BC' mean bits container

#define BL_TRUE 1
#define BL_FALSE 2

// Everything happened successfully.
#define BL_SUCCESS 0

// 'bc_ptr' argument is NULL.
#define BL_BC_PTR_IS_NULL -1

// 'bit_num' value given by the user is out of range (less than 0 or greater
// than 'last_bit_num').
#define BL_BIT_NUM_OUT_OF_RANGE -2

// 'val' argument is invalid, it is neither 0 nor 1.
#define BL_VAL_IS_INVALID -3

// 'fd' argument is negative, hence invalid.
#define BL_FD_IS_INVALID -4

// Some error happened. Function didn't complete successfully.
#define BL_FAILURE -5

struct bits_container
{
    unsigned char *bit_array_ptr;
    long last_bit_num;
};

// Functions
char *convert_error_num_to_error_string(int error_num);

struct bits_container *bl_init_bits_container(long num_bits_required);

int bl_set_bit(struct bits_container *bc_ptr, long bit_num);

int bl_unset_bit(struct bits_container *bc_ptr, long bit_num);

int bl_is_bit_set(struct bits_container *bc_ptr, long bit_num);

int bl_set_bit_value(struct bits_container *bc_ptr, long bit_num, int val);

int bl_get_bit_value(struct bits_container *bc_ptr, long bit_num);

int bl_print_all_bits_values(struct bits_container *bc_ptr, int fd);

void bl_delete_bits_container(struct bits_container *bc_ptr);

// Static functions
static int get_arr_index_and_bit_index(long bit_num, long *arr_index,
                                       int *bit_index);

#endif
