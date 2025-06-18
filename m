Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7961E258A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750229264; cv=none; b=QhyBMA/V0GVSeOkSDVN6UfSTQSYJbUytJpn1XoL96eEf8il4e3YPRv+HO2ybti591w0an07ceJOylhrNhIR4e5lN/R+Mh0Z1tNLxB/2nthJxuc+/kyaqUC2UrAyTC/Tyl6QgxAGikYrPR3ffIGBGmJPc8Qr+IIegSGtqyCCswgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750229264; c=relaxed/simple;
	bh=o+fYgj+qIOsDLGzPk6/O2jokCQcdZUGD2hUuzLr3PY0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Ek6M2HtXKswj6IkfM+bjFG7FElWFFQ7qvHfHwLqSGkEoTmdwZdlDEWK+05k22s68PAQ8YHuUmnjndqvLXorTxTwaEzNUxCyrg3seaUNZ87VkkO3/JzU6tSywOFcW1og/n2zyk4lK7SedkB3i782JiaBFh9k8JV7MMZxd8bTmq7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QL1wGG14; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QL1wGG14"
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-708d90aa8f9so65025097b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750229261; x=1750834061; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z+mwDwgQySD0BRlLJGc2eoF9Pr3gymBEMlnX6sBNIXY=;
        b=QL1wGG14ARMdhQxSA7i2o/kYU1sHDetEhWtAuJnP86Md6HjbaH46cCVLt3HqE30/D4
         GoTBltDxM8gL3SBqnV4nc4xBrMDnNe3nO6dc+pFSqE+b0k+nljyy9/ysjwL1+sSbbQmY
         4+bHc1v/lY6EqmzWu+wA3T/dzvZsLxOmJbjG0xnEna5EYO6REOasVtendo6OyjEjNEH/
         Ci6apiiAviwa3XodyulpXxDNbkx1th2sWcK8uWdWun1DoWslQpOH2bVyl05n0imXqjg2
         UcY3Ud/eXbSUyjsLRTB0dees1IhIR2F76C7UvjxW6Kg0ESF2usO6Wxl/5wC6tQ3P1Olr
         V7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750229261; x=1750834061;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+mwDwgQySD0BRlLJGc2eoF9Pr3gymBEMlnX6sBNIXY=;
        b=NkL02V58+EPo1SR2rAey6/l80tPSwZO2n258fv3QJpkhS17tZyAkkpRv+QO3UfbPVz
         ALwBuZWtcaXarkvvi/7o6dX2oKZSiUqx7/OQrBHS56tfHhdKtEtEs42va4r05JcbYXfU
         gxW0B3AmsTwTRo3bm8rT9PkseHs1S8Ru7ndblsqEvOSWwAF8r2CcKY8YviKkxRWi/iWn
         vbuoyROz+YnaQAzxCnYYFjqD+BL8wGU+CARN6LdlVjCIjyEkOe+bzMjyK85xX9kgSAPN
         McQKJ/niosGKgXbXJB28FgXaAlQI0PWrksL8czBzElvA3trgBRUIqVQNu9eGQRvbFBmp
         hZEw==
X-Gm-Message-State: AOJu0YwyNqbuefo3wHP6CkOJ51u+VqzlcT+NtxYemMXvOCeD9PUQ9VNJ
	83fAHnIMzzgqXokaCClF7VDMvwTQHflyqgtW4CllMJ5ePVTQn9cyZx7gCGZOKSnbx5S1fbU7kNm
	BHhciBG3KSP4fkipMkqO6HKQYDSNYOBhgsYRqsIa3mQ==
X-Gm-Gg: ASbGncs7hZ2atDmmD4Yg7xMsU8Ksj1KqXhhQbdhRSHL9ElHGNkG+KD3k2uooHIktm9m
	zm+7rEDard5SxeNvoUE2ELtpWpE3NVCw4w1kPfLPrS9L3KgUllUKV+5qlgVV0k5Dq1Exu6LIWB+
	SfBO7deVFigvhcJgrtbzFGIigHAZ+8k2HCgEr/5pslhfdY7xvhIDN+Qev+Y6/aOuKsRBED6faSK
	vsoJcpj61Ebvoei
X-Google-Smtp-Source: AGHT+IEYa8CeYMH0X/deMWd+A12fy5KUb/KnwI/PqQy+ANeqJST8TeKN4TnC+HRYpPEsULc5nQ43AxyxSlZMxBGjUxo=
X-Received: by 2002:a05:690c:4d09:b0:70d:f47a:7e3f with SMTP id
 00721157ae682-7117544b8aemr236513357b3.20.1750229260768; Tue, 17 Jun 2025
 23:47:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Wed, 18 Jun 2025 12:17:29 +0530
X-Gm-Features: AX0GCFuUOnLiuR3FqH_CHmV-vF7ZsD2yCz3mNLRRFc2bOz6Xj-KKeqBtawYkI-o
Message-ID: <CAFf+5zhdK0v6BNXSLGbqmj0gvqqzPHa1rdAwixVeoquZ8E_fBg@mail.gmail.com>
Subject: Get a substring from a string (Four files: substr.c, substr.h,
 test_substr.c, and ReadMe.txt).
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Get a substring from a string (Four files: substr.c, substr.h,
test_substr.c, and ReadMe.txt).

-----------
substr.c
-----------

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

#include "substr.h"

#include <stdlib.h>
#include <string.h>

char *substr(const char *str, int start_index, int end_index)
{

    char *substring = NULL;
    int len = 0;
    int substr_len = 0;

    if ((str == NULL) || (str[0] == '\0')) {
        return NULL;
    }

    len = (int)(strnlen(str, STR_LIB_MAX_STR_SIZE_ALLOWED));

    if (len == STR_LIB_MAX_STR_SIZE_ALLOWED) {
        return NULL;
    }

    if ((end_index < 0) || (end_index > (len - 1))) {
        end_index = len - 1;
    }

    if ((start_index < 0) || (start_index > (len - 1)) ||
        (end_index < start_index)) {
        return NULL;
    }

    substr_len = end_index - start_index + 1;

    // extra 1 byte for null terminating character
    substring = calloc((size_t)(substr_len + 1), 1);

    if (substring == NULL) {
        return NULL;
    }

    memmove(substring, str + start_index, (size_t)(substr_len));

    substring[substr_len] = '\0';

    return substring;

} // end of function substr()

-----------
substr.h
-----------

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

#ifndef _SUBSTR_H_
#define _SUBSTR_H_

// Change this value to process more characters.
#define STR_LIB_MAX_STR_SIZE_ALLOWED 8192 // includes null terminating character

#define STR_LIB_MIN_STR_SIZE_ALLOWED 1 // includes null terminating character.
                                       // string returned will be empty if its
                                       // size is STR_LIB_MIN_STR_SIZE_ALLOWED

#define STR_LIB_SUCCESS  1
#define STR_LIB_FAILURE -1

#define STR_LIB_NUM_TRUE  2
#define STR_LIB_NUM_FALSE -2

// The size of the integer string is 10 (including null terminating character)
// so this means that the max number of digits in this string can be 9. If we
// keep the max number of digits as 10 then in some cases, all these digits can
// be 9 and in these cases when we convert the string to integer then there will
// be integer overflow because 9999999999 (9 is 10 times) is greater than
// INT_MAX. So, to prevent the integer overflow we have limited the max number
// of integer digits in the string to 9. Since the string will be null
// terminated, so accounting for the null terminating character, the size of the
// integer string becomes 10.
#define STR_LIB_INTEGER_STR_SIZE 10 // includes null terminating character

/*
 * char *substr(const char *str, int start_index, int end_index):
 *
 * Function substr() allocates memory for the substring and returns a pointer to
 * this substring which is a copy of characters of 'str' from 'start_index' to
 * 'end_index' (including the character at 'end_index'). This substring is
 * terminated by the null character.
 *
 * If the 'end_index' is negative or greater than the last index of 'str' then
 * 'end_index' is normalized which means that 'end_index' is set to the last
 * index of 'str' (length_of_str - 1).
 *
 * This function returns NULL in the following error cases:
 *
 *      ** 'str' is NULL.
 *      ** The first character of 'str' is the null terminating character (means
 *         that 'str' is an empty string).
 *      ** length of 'str' is greater than 'STR_LIB_MAX_STR_SIZE_ALLOWED - 1'.
 *      ** 'start_index' is less than zero (0).
 *      ** 'start_index' is greater than the last index of 'str' (length_of_str
 *         -1).
 *      ** After normalization of 'end_index' (as explained above), 'end_index'
 *         is less than 'start_index'.
 *
 * It is necessary to check the return value of this function for NULL before
 * proceeding ahead.
 *
 * The memory for the substring is allocated using calloc(), so it is the user's
 * responsibility to free this memory.
 */
char *substr(const char *str, int start_index, int end_index);

#endif

------------------
test_substr.c
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

#include "substr.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static char *get_input_from_stdin_and_discard_extra_characters(char *str,
                                                               int size);
static void discard_all_characters_from_stdin(void);
static int is_str_an_integer(const char *str);
static int get_integer_input_from_user(char *str, int size, int *integer_ptr);

int main(void)
{

    char str[STR_LIB_MAX_STR_SIZE_ALLOWED] = {0};
    char num_str[STR_LIB_INTEGER_STR_SIZE] = {0};
    int start_index = -1;
    int end_index = -1;
    char *arg_str = NULL;
    char *sub_str = NULL;
    char *retval_char = NULL;
    int retval_num = STR_LIB_FAILURE;

    while (1) {

        // get the string from the user
        while (1) {

            printf("\nPlease input a string from which to get the substring"
                    " (max %d characters else the input string will be"
                    " truncated to %d characters) (To enter NULL string, type"
                    " NULL (in capital letters)): ",
                    STR_LIB_MAX_STR_SIZE_ALLOWED - 1,
                    STR_LIB_MAX_STR_SIZE_ALLOWED - 1);

            retval_char = get_input_from_stdin_and_discard_extra_characters(str,
                                                STR_LIB_MAX_STR_SIZE_ALLOWED);

            if (retval_char == NULL) {
                printf("\n\nNo input received. Please try again..\n");
                continue;
            }

            if (strncmp(str, "NULL", (strlen("NULL") + 1)) == 0) {
                arg_str = NULL;
            } else {
                arg_str = str;
            }

            break;

        } // end of while (1) loop for getting the string

        printf("\n");

        // get the start_index from the user
        while (1) {

            printf("Please input the start index from which to start copying"
                   " the substring: ");

            retval_num = get_integer_input_from_user(num_str,
                                    STR_LIB_INTEGER_STR_SIZE, &start_index);

            if (retval_num != STR_LIB_SUCCESS) {
                continue;
            }

            break;

        } // end of while (1) loop for getting the start_index

        printf("\n");

        // get the end_index from the user
        while (1) {

            printf("Please input the end index at which to stop copying"
                   " the substring: ");

            retval_num = get_integer_input_from_user(num_str,
                                    STR_LIB_INTEGER_STR_SIZE, &end_index);

            if (retval_num != STR_LIB_SUCCESS) {
                continue;
            }

            break;

        } // end of while (1) loop for getting the end_index

        printf("\n");
        printf("\n-------\n");
        printf("Output:");
        printf("\n-------\n");

        // using strlen() here is safe because it is guaranteed that 'str' is
        // null terminated.
        printf("\nInput parameters: str=\"%s\", start_index=%d, end_index=%d"
               " (length_of_str = ", arg_str ? arg_str: "(null string)",
               start_index, end_index);
        if (arg_str) {
            printf("%d)\n", (int)(strlen(arg_str)));
        } else {
            printf("INVALID)\n");
        }
        printf("\n");
        sub_str = substr(arg_str, start_index, end_index);
        if (sub_str) {
            // using strlen() here is safe because it is guaranteed that sub_str
            // is null terminated.
            printf("** substr = \"%s\" (length_of_substr = %d)\n", sub_str,
                   (int)(strlen(sub_str)));
            free(sub_str);
            sub_str = NULL;
        } else {
            printf("** substr() returned NULL. It looks like one or more user"
                   " inputs were invalid. **\n");
        }

        printf("\nPlease press ENTER to continue..");
        // now clear the stdin input buffer
        discard_all_characters_from_stdin();

    } // end of outermost while(1) loop

} // end of main

/*
 * get_input_from_stdin_and_discard_extra_characters():
 *
 *      Function get_input_from_stdin_and_discard_extra_characters() reads at
 *      most (size - 1) characters from stdin and stores them in 'str'.
 *      One character is used to null terminate 'str'. The rest of the
 *      remaining characters in stdin are read and discarded, they are not
 *      stored in 'str'. So, when this function returns then there is no
 *      input/characters left in stdin.
 *
 *      If 'str' is NULL then it is an error and nothing is read from stdin and
 *      NULL is returned.
 *
 *      If 'size' is greater than 'STR_LIB_MAX_STR_SIZE_ALLOWED' or less than
 *      'STR_LIB_MIN_STR_SIZE_ALLOWED' then it is an error and nothing is read
 *      from stdin and NULL is returned.
 */
static char *get_input_from_stdin_and_discard_extra_characters(char *str,
                                                               int size)
{

    int c = 0;
    int i = 0;

    if (str == NULL) {
        return NULL;
    }

    if ((size < STR_LIB_MIN_STR_SIZE_ALLOWED) ||
        (size > STR_LIB_MAX_STR_SIZE_ALLOWED)) {
        return NULL;
    }

    for (i = 0; i < (size - 1); i = i + 1) {

        c = getchar();

        if ((c == '\n') || (c == EOF)) {
            str[i] = 0;
            return str;
        }

        str[i] = (char)(c);

    } // end of for loop

    str[i] = 0;

    // discard the rest of the input
    while ((c = getchar()) && (c != '\n') && (c != EOF));

    return str;

} // end of function get_input_from_stdin_and_discard_extra_characters()

static void discard_all_characters_from_stdin(void)
{

    int c = 0;

    // discard all characters from stdin
    while ((c = getchar()) && (c != '\n') && (c != EOF));

    return;

} // end of function discard_all_characters_from_stdin()

/*
 * is_str_an_integer():
 *
 *      Function is_str_an_integer() expects only numeric characters in 'str'
 *      and optionally a leading '+' or '-' character.
 *
 *      This function returns STR_LIB_NUM_TRUE when all of the following
 *      conditions are met:
 *
 *              ** 'str' is not null.
 *              ** The first character of 'str' is not the null terminating
 *                 character (means 'str' is not an empty string).
 *              ** Length of 'str' is less than 'STR_LIB_INTEGER_STR_SIZE'.
 *              ** 'str' contains only numeric characters and optionally a
 *                 leading '+' or '-' character.
 *
 *      In all other cases, this function returns STR_LIB_NUM_FALSE.
 */
static int is_str_an_integer(const char *str)
{

    char c = -1;

    if (str == NULL) {
        return STR_LIB_NUM_FALSE;
    }

    if (str[0] == '\0') { // empty string
        return STR_LIB_NUM_FALSE;
    }

    // If length of 'str' is not less than 'STR_LIB_INTEGER_STR_SIZE' then it is
    // an error and in this case, return STR_LIB_NUM_FALSE.
    if (strnlen(str, STR_LIB_INTEGER_STR_SIZE) == STR_LIB_INTEGER_STR_SIZE) {
        return STR_LIB_NUM_FALSE;
    }

    if ((*str == '+') || (*str == '-')) {
        str++;
    }

    while ((c = *str)) {
        if ((c < '0') || (c > '9')) {
            return STR_LIB_NUM_FALSE;
        }
        str++;
    }

    return STR_LIB_NUM_TRUE;

} // end of function is_str_an_integer()

static int get_integer_input_from_user(char *str, int size, int *integer_ptr)
{

    char *retval = NULL;

    if ((str == NULL) || (integer_ptr == NULL)) {
        return STR_LIB_FAILURE;
    }

    if ((size < STR_LIB_MIN_STR_SIZE_ALLOWED) ||
        (size > STR_LIB_INTEGER_STR_SIZE)) {
        return STR_LIB_FAILURE;
    }

    retval = get_input_from_stdin_and_discard_extra_characters(str, size);

    if (retval == NULL) {
        return STR_LIB_FAILURE;
    }

    if (is_str_an_integer(str) != STR_LIB_NUM_TRUE) {
        return STR_LIB_FAILURE;
    }

    // convert string to int
    (*integer_ptr) = atoi(str);

    return STR_LIB_SUCCESS;

} // end of function get_integer_input_from_user()

----------------
ReadMe.txt
----------------

File "substr.c" implements a function called substr() to get a substring from a
string. The signature of this function is:

        char *substr(const char *str, int start_index, int end_index)

Function substr() allocates memory for the substring and returns a pointer to
this substring which is a copy of characters of 'str' from 'start_index' to
'end_index' (including the character at 'end_index'). This substring is
terminated by the null character.

If the 'end_index' is negative or greater than the last index of 'str' then
'end_index' is normalized which means that 'end_index' is set to the last index
of 'str' (length_of_str - 1).

This function returns NULL in the following error cases:

     ** 'str' is NULL.
     ** The first character of 'str' is the null terminating character (means
        that 'str' is an empty string).
     ** length of 'str' is greater than 'STR_LIB_MAX_STR_SIZE_ALLOWED - 1'.
     ** 'start_index' is less than zero (0).
     ** 'start_index' is greater than the last index of 'str' (length_of_str
        -1).
     ** After normalization of 'end_index' (as explained above), 'end_index'
        is less than 'start_index'.

It is necessary to check the return value of this function for NULL before
proceeding ahead.

The memory for the substring is allocated using calloc(), so it is the user's
responsibility to free this memory.

---- End of ReadMe ----
