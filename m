Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0614654BC6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058585; cv=none; b=toauhW6OSup1oot6tlAXXa84ANZf2vvgFaJDvbejkFbHWOxUHkiIAdvavsPDGX74nwvGlTeoFiA28vyXvgFREfUyobvD+5YSWYnlY4mKjVkQ+VBs1pmN/ki13qEafFshSEutWmoJXnozjhGmkRaSUaKSiSSRXzaelqAXuwyExhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058585; c=relaxed/simple;
	bh=Do+yg2iCYskJKxUibD5C5iQE02k0C0vdSuU4K5doVCA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=CJw5G9rVUXC14ySUH9D7Wm3oLH1Uepa7K26phdSfVXKYVBsKyILv8jBo5qvN8f8vlLT/aqKy2iS3P5msDA1GAwr8vkQQMMiB408G+c7WSDX29RkBFz9ahRZjikTMD6Ac+RDTDx1MIm8TWxArzwEQp2lAtduzFV9OjY57GNZjGRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSmSeH+I; arc=none smtp.client-ip=209.85.219.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSmSeH+I"
Received: by mail-yb1-f194.google.com with SMTP id 3f1490d57ef6-e81a7d90835so3692677276.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750058582; x=1750663382; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+2nLI9huw6b6KbjZK5CWQHRad1r294pIX0EEkCgRgkg=;
        b=LSmSeH+Il8iiCddpUV3DCFgCYNnjKeUHCUONbbEdhXezFgP0eONLs84jZQs/Yy1ZyX
         Wzj4nmtQ5W7VKZGPq4gzE3poyJSwETOO22KMPs83D4Q2Vl76M2T+zB8scxLs9ZaFx20I
         dB/I0UFRfkJq1LFwLgj5W0GdkP9P6hDbM2TIq1A7TuV6i0BpBfyKtPPh7OkRSmYWtpzd
         Mnf5YKfuBKXJw8KY+a7/GnPKk6oqe9l/VEdJ6JBt+/wB7Oafgzuh65wdC4mkXHhs5VMm
         SPPRN1othkScrn44w8a7ChEs7p95JW/AWhxxnDujqMOo7vIde4wJBRfCdc+hT+ZdruPB
         6VkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058582; x=1750663382;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+2nLI9huw6b6KbjZK5CWQHRad1r294pIX0EEkCgRgkg=;
        b=pbSvQqORrvSYnFTFC8lq7pVFaC0L4zT01gwo7ZhXb/loI/mQMdvk/DeZy35eD8Yzep
         uQhVhFsMvEIhnBD/3pUL+LFynqh5pEaLhLktgICgHS7zeFTDGjiEtUIFzwYNJ1eU2w0B
         KONJkdBjUNs9Ab9inQv6+CMmzhOuRF99ntrK8Sz/fxZMtDvvkbYMHXfl/JH7LfwHr+1h
         7OpoZjmHE8eryWCiPr3QYFWquEfeoMYiZFEv9lF8R3r2tV2O94HQ455DXBmpZaZf3RoY
         RrfFhwz4kB7Mu2EshsTM3Le2laGSbqVGJNIyxzY+Fgtu3bWgNJmKlGUqnRbjksQ8TET8
         FRig==
X-Gm-Message-State: AOJu0Yx8e+GDiGz2FJvqxoj/IasUX8nadQMskhDLnn/W0aU8KGJcKm4S
	eLCdivQ8019ToFQO+3zj5uiKAOtzl9JRMPpDJYzSg1ZuDpkCK72eAtRT8EUcKsCZknf6ZuejbUB
	vz5ySRQ0XkYiIkjhAQKsTJNXMNYg3T7NGtOHWdWMJJQ==
X-Gm-Gg: ASbGncu7vFwpz1UuymNm8luVzKb7QroLKeVZzQ7c5DC76KZDgxwbBztopZKex8XorWc
	7iGv3ZR5uHqB9MPpipVFpd0Bq9fhT8ZvTYJo/Cj3KNAyu2Xshow7XDYimHyt1jzDfIeCAOhndXJ
	rOZZnm+PR+kDMGhVxB7er5SDcyxQWqy4bAuwqlhaFBDBXn6dKqJRisKnt1IlcS7pNmlOZExvSu0
	xqIaw==
X-Google-Smtp-Source: AGHT+IGZ90eKfTF2xR04KDF9GIdlT1sUVq9qSUIZnSo/kKuMtCng66iiq5T/RZCFsV44Kev1fOCujilhfS74UtGt6Ks=
X-Received: by 2002:a05:6902:1387:b0:e81:87df:2178 with SMTP id
 3f1490d57ef6-e822acac6bemr10881738276.8.1750058581623; Mon, 16 Jun 2025
 00:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Mon, 16 Jun 2025 12:52:49 +0530
X-Gm-Features: AX0GCFvUh44WtEoSqCfApz7OubQwBHBvXoUX_jh5PdGTx8XmDAJzRJbUvdObGH8
Message-ID: <CAFf+5zgGuaQG=v+Fs5qgqbcfq+rAbuaz3OZm=mqLK6VpCQMsZw@mail.gmail.com>
Subject: Concatenate multiple strings (Four files: str_join.c, str_join.h,
 test_str_join.c, and ReadMe.txt).
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Concatenate multiple strings (Four files: str_join.c, str_join.h,
test_str_join.c, and ReadMe.txt).

-------------
str_join.c
-------------

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

#include "str_join.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

char *str_join(int skip_null_and_empty_strings, const char *delim,
               int num_args, ...)
{

    va_list valist;
    int i = 0;
    size_t iica = 0; // iica - index into character array
    size_t len = 0;
    size_t delim_len = 0;
    size_t total_len = 0;
    int num_delim_to_concat = -1;
    char *new_char_array = NULL;
    char *temp = NULL;

    if (num_args <= 0) {
        return NULL;
    }

    if (delim) {
        delim_len = strlen(delim);
    }

    va_start(valist, num_args);
    for (i = 0; i < num_args; i++) {

        temp = va_arg(valist, char *);

        if (skip_null_and_empty_strings) {
            if ((!temp) || (!*temp)) {
                continue;
            }
        }

        if ((!temp) || (!*temp)) {
            len = 0;
        } else {
            len = strlen(temp);
        }

        total_len = total_len + len;
        num_delim_to_concat = num_delim_to_concat + 1;
        if (num_delim_to_concat > 0) {
            total_len = total_len + delim_len;
        }

    }
    va_end(valist);

    if (total_len == 0) {
        return NULL;
    }

    total_len = total_len + 1; // 1 extra for terminating null byte

    new_char_array = malloc(total_len);
    if (!new_char_array) {
        return NULL;
    }

    va_start(valist, num_args);
    for (i = 0; i < num_args; i++) {

        temp = va_arg(valist, char *);

        if (skip_null_and_empty_strings) {
            if ((!temp) || (!*temp)) {
                continue;
            }
        }

        if ((!temp) || (!*temp)) {
            len = 0;
        } else {
            len = strlen(temp);
        }

        memmove(&(new_char_array[iica]), temp, len);
        iica = iica + len;

        if (num_delim_to_concat > 0) {
            memmove(&(new_char_array[iica]), delim, delim_len);
            iica = iica + delim_len;
            num_delim_to_concat = num_delim_to_concat - 1;
        }

    }
    va_end(valist);

    new_char_array[iica] = 0;

    return new_char_array;

} // end of function str_join()

-------------
str_join.h
-------------

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

#ifndef _STR_JOIN_H_
#define _STR_JOIN_H_

/*
 * char *str_join(int skip_null_and_empty_strings, const char *delim,
 *                int num_args, ...):
 *
 * Function str_join() concatenates all the strings passed to it. If 'delim' is
 * not NULL and not empty then the 'delim' is concatenated between every two
 * strings.
 *
 * Argument 'num_args' is the total number of strings passed to this function.
 *
 * This function expects that all arguments after 'num_args' should be either
 * pointers to null-terminated strings or a mix of null-terminated strings,
 * NULL, and empty strings. Any other type(s) of argument may make this function
 * behave strangely and this function may even crash also.
 *
 * If 'skip_null_and_empty_strings' is true then this means that NULL/empty
 * strings should be considered valid strings for the purpose of concatenating
 * 'delim' string - this means that if there is a NON-NULL/non-empty string in
 * the variable arguments list which is then followed or preceded by a
 * NULL/empty string then one 'delim' string will be concatenated between
 * NON-NULL/non-empty string and NULL/empty string. This can be useful in case
 * columns of a database are concatenated to form a record which will then be
 * written in a file - so here, a column containing NULL/empty value will be
 * represented as empty by having two consecutive 'delim' strings.
 *
 * If 'skip_null_and_empty_strings' is not true then this means that
 * NULL/empty strings should be skipped and no 'delim' string should be
 * concatenated for them.
 *
 * This function allocates a new character array whose size is equal to the sum
 * of the lengths of all strings passed to it plus 1 (extra 1 for the
 * terminating null character). It then concatenates all the strings passed to
 * it (these strings are separated by 'delim' string but please see above for
 * NULL/empty strings) into the newly allocated character array and then returns
 * the pointer to the newly allocated character array. If memory allocation
 * fails then NULL is returned.
 *
 * It is necessary to check the return value of this function for NULL before
 * proceeding ahead.
 *
 * The memory for the returned string is allocated using malloc(), so it is the
 * user's responsibility to free this memory.
 */
char *str_join(int skip_null_and_empty_strings, const char *delim,
               int num_args, ...);

#endif

-------------------
test_str_join.c
-------------------

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

#include "str_join.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int mystrcmp(const char *result, const char *expected);
static void verify_result(char *result, const char *expected, int line_num,
                          const char *file_name);

int main(void)
{

    char *result = NULL;
    char *expected = NULL;

    printf("\n");
    printf("-----------------------------\n");
    printf("Running automated test cases.\n");
    printf("-----------------------------\n");

    result = str_join(0, "-", 0);
    expected = NULL;
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 0, "abc");
    expected = NULL;
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 0, "");
    expected = NULL;
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 0, NULL);
    expected = NULL;
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 1, "abc");
    expected = "abc";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 1, "");
    expected = NULL;
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 1, NULL);
    expected = NULL;
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 2, "abc", "123");
    expected = "abc-123";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 2, "abc", "");
    expected = "abc-";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 2, NULL, "abc");
    expected = "-abc";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 2, "", NULL);
    expected = "-";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 3, "abc", "123", "fgh");
    expected = "abc-123-fgh";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 3, "", "123", "fgh");
    expected = "-123-fgh";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 3, "abc", NULL, "fgh");
    expected = "abc--fgh";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 3, "abc", "123", "");
    expected = "abc-123-";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 3, NULL, "NULL", "");
    expected = "-NULL-";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 3, "abc", "", NULL);
    expected = "abc--";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-", 3, "", NULL, "abc");
    expected = "--abc";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-?-", 4, "a", "b", "cd", "e");
    expected = "a-?-b-?-cd-?-e";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-?-", 4, "a", NULL, "cd", "e");
    expected = "a-?--?-cd-?-e";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-?-", 4, "a", "", "cd", "");
    expected = "a-?--?-cd-?-";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "-?-", 10, "1", "2", "3", "4", "5", "6", "7", "8", "9",
                      "10");
    expected = "1-?-2-?-3-?-4-?-5-?-6-?-7-?-8-?-9-?-10";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "", 4, "a", "b", "cd", "e");
    expected = "abcde";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, NULL, 4, "a", NULL, "cd", "e");
    expected = "acde";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, NULL, 4, "a", "", "cd", "");
    expected = "acd";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(0, "", 10, "1", "2", "3", "4", "5", "6", "7", "8", "9",
                      "10");
    expected = "12345678910";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 0);
    expected = NULL;
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 0, "abc");
    expected = NULL;
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 0, "");
    expected = NULL;
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 0, NULL);
    expected = NULL;
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 1, "abc");
    expected = "abc";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 1, "");
    expected = NULL;
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 1, NULL);
    expected = NULL;
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 2, "abc", "123");
    expected = "abc-123";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 2, "abc", "");
    expected = "abc";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 2, NULL, "abc");
    expected = "abc";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 2, "", NULL);
    expected = NULL;
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 3, "abc", "123", "fgh");
    expected = "abc-123-fgh";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 3, "", "123", "fgh");
    expected = "123-fgh";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 3, "abc", NULL, "fgh");
    expected = "abc-fgh";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 3, "abc", "123", "");
    expected = "abc-123";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 3, NULL, "NULL", "");
    expected = "NULL";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 3, "abc", "", NULL);
    expected = "abc";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-", 3, "", NULL, "abc");
    expected = "abc";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-?-", 4, "a", "b", "cd", "e");
    expected = "a-?-b-?-cd-?-e";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-?-", 4, "a", NULL, "cd", "e");
    expected = "a-?-cd-?-e";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-?-", 4, "a", "", "cd", "");
    expected = "a-?-cd";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "-?-", 10, "1", "2", "3", "4", "5", "6", "7", "8", "9",
                      "10");
    expected = "1-?-2-?-3-?-4-?-5-?-6-?-7-?-8-?-9-?-10";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "", 4, "a", "b", "cd", "e");
    expected = "abcde";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, NULL, 4, "a", NULL, "cd", "e");
    expected = "acde";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, NULL, 4, "a", "", "cd", "");
    expected = "acd";
    verify_result(result, expected, __LINE__, __FILE__);

    result = str_join(1, "", 10, "1", "2", "3", "4", "5", "6", "7", "8", "9",
                      "10");
    expected = "12345678910";
    verify_result(result, expected, __LINE__, __FILE__);

    printf("\n------------------------------------\n");
    printf("Success: All test cases have passed.\n");
    printf("------------------------------------\n\n");

    return 0;

} // end of function main()

static int mystrcmp(const char *result, const char *expected)
{

    if ((!result) && (!expected)) {
        return 0;
    } else if ((!result) || (!expected)) {
        return 1;
    }

    return strcmp(result, expected);

} // end of function mystrcmp()

static void verify_result(char *result, const char *expected, int line_num,
                          const char *file_name)
{

    int ret_val = -1;

    printf("\n");

    if (result) {
        printf("Result = \"%s\"\n", result);
    } else {
        printf("Result = NULL\n");
    }

    if (expected) {
        printf("Expected = \"%s\"\n", expected);
    } else {
        printf("Expected = NULL\n");
    }

    ret_val = mystrcmp(result, expected);

    free(result);

    if (ret_val != 0) {
        printf("Test case failed. Check the test case just before the line"
               " number %d in the file \"%s\".\n", line_num, file_name);
        printf("\nExiting ..\n\n");
        exit(1);
    } else {
        printf("Test case passed.\n");
    }

    return;

} // end of function verify_result()

----------------
ReadMe.txt
----------------

File "str_join.c" implements a function called str_join() that concatenates all
the strings passed to it. The signature of this function is:

        char *str_join(int skip_null_and_empty_strings, const char *delim,
                       int num_args, ...)

Function str_join() concatenates all the strings passed to it. If 'delim' is not
NULL and not empty then the 'delim' is concatenated between every two strings.

Argument 'num_args' is the total number of strings passed to this function.

This function expects that all arguments after 'num_args' should be either
pointers to null-terminated strings or a mix of null-terminated strings, NULL,
and empty strings. Any other type(s) of argument may make this function behave
strangely and this function may even crash also.

If 'skip_null_and_empty_strings' is true then this means that NULL/empty strings
should be considered valid strings for the purpose of concatenating 'delim'
string - this means that if there is a NON-NULL/non-empty string in the variable
arguments list which is then followed or preceded by a NULL/empty string then
one 'delim' string will be concatenated between NON-NULL/non-empty string and
NULL/empty string. This can be useful in case columns of a database are
concatenated to form a record which will then be written in a file - so here, a
column containing NULL/empty value will be represented as empty by having two
consecutive 'delim' strings.

If 'skip_null_and_empty_strings' is not true then this means that NULL/empty
strings should be skipped and no 'delim' string should be concatenated for them.

This function allocates a new character array whose size is equal to the sum of
the lengths of all strings passed to it plus 1 (extra 1 for the terminating null
character). It then concatenates all the strings passed to it (these strings are
separated by 'delim' string but please see above for NULL/empty strings) into
the newly allocated character array and then returns the pointer to the newly
allocated character array. If memory allocation fails then NULL is returned.

It is necessary to check the return value of this function for NULL before
proceeding ahead.

The memory for the returned string is allocated using malloc(), so it is the
user's responsibility to free this memory.

---- End of ReadMe ----
