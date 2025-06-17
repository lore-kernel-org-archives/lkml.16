Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F2128A73A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750141637; cv=none; b=GqupPJbISiXi08ud8u8yGZNSmI+Ze+YSawbkmLN7T+nabSCadDBhxsGuZffFVK4uCc+KJo+n3h0Dg+xsu4Rhn5ve1xVPIdfnCYS0GPR6zMr7wROCFNEXX6Ppa8TYkQ5ZdPB/2F6CG8A8s7Lw+v0n4DHaAziGbsyphyqyjw4gORg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750141637; c=relaxed/simple;
	bh=CkKX5ZUwpZMBfbRSNVtmm8xmSZeDEhtOJBgswIf4zPE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=qLuLCdeEyTCq4My+4JNJ5sYwTsVONNS3sC2UwuKm7DAgRmD/5Ocov3ynbFZaQ0qyWJtd27MMmVIKs8ihHixfif929Jzgrn+biVmGsyoOTA05NhcWH2OyMygJg3rVBOMvkFPxXFWxLWH3fRhv0GmTyiv6kCjYtIB2cdUfNAOyvMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpwHKJCo; arc=none smtp.client-ip=209.85.219.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpwHKJCo"
Received: by mail-yb1-f196.google.com with SMTP id 3f1490d57ef6-e740a09eae0so5096129276.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 23:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750141634; x=1750746434; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0OBnUnPsiiEApkoO/4v+mLaltlnQNQRIsdN+TSNPuQ8=;
        b=FpwHKJCosYlSHHgtwz580tN6xACMn2UY2WN+OBUVznhkBIEtAcpLorNbovXcICXCkM
         ZZIU+OkniVNTGSlYHnHPvGYSONjSFOeiraZVJDTi/vON44NpDM71iJ1qHGNES4yVeqR4
         8zDdUNI4IyfxngaeLwJ5pFMGbrO6IKu1Hx7f/jzwVMsmva4JKzAj9yZ2H7j4nMDceZzB
         qs3shL3WD9cMRyF/JDY4ZZS25QftBjgK5dxiAG/GSwzM4Cj5K0bLwWtCVADgMgFgKwjd
         5WOKUOSWxNf7LdfnKboN/YAOU+MfdxCEQFwG+35LhzGqA44B7TFwlYaYf31p4T2RI3pP
         7EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750141634; x=1750746434;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OBnUnPsiiEApkoO/4v+mLaltlnQNQRIsdN+TSNPuQ8=;
        b=lP5onfkRYMDMDLcxOXG5ZFW1A2r6xZ7cta5bcKBOc9SrKB0FkVF7M5MgV9YagJ3QUR
         oGB2mphGSV4vk4trkyFDfSBRGdHTqw0U4lguEP9vJyIqux8XaS1E7BiM9wGiKkiXdLAR
         iGRMSIwUi5zKlg2jHlNuhgLPYnPG12AdNpCGcT5Jch+7+2LfYqlbFkB9DPumylJt4/r4
         MvgPxd7Z27Eq8mKYsBl9pLCJzjnMyZOoIyyMp7x0WYt5wqmKjkKdzyhs39h+m7x/uxp3
         W83akp7A1Itf0yZzkIktIWeZkIowxBaknvnWRqIgnfdgDrAw/spKvhWH8NkFIL4+0O35
         uylQ==
X-Gm-Message-State: AOJu0YxXJdQQxHcC8rdn4ejUnHbC8oNxY4AzLgxVCRJzYzeF492tAswP
	I6z56yJyiqvyipkOyf3t7Dbhgb8hv8GFLRx94lFWjzER3t7DnGWpR61iGcVZ3WTEGvbrRqLA7Mo
	5W5oy2NC1ktVV6LYqm07EoC60r3feFHu5EEJXjfqQRQ==
X-Gm-Gg: ASbGncs1+grU7W32FDR+oVmG2d3oPJjMJ/XLvkOVrZY9f3DauSpoL5FnvzewL5EBvf3
	zRZiiRrchPrGFIqcFcexpkgV5KQIbFg6lF1s4zVJ8cKQLJ0zDIFzxAiNbw2Sg8XpQZ301aDWPBb
	JJ1d711x2T4j4o1FDxFOn7PHPCvjeKto04vjwu8yhEocvJQp/hyNXCwIeDBjr47ZmavKY8f2r3v
	VmXQw==
X-Google-Smtp-Source: AGHT+IGpt4T2Pn3BeWXlmr2xpIM8zjST5bW3t6pvsJBdhqJsJ+S2ldG/s80oP1voXpbJoYoiAZ5gPk2qmTy3So3/yn4=
X-Received: by 2002:a05:690c:670a:b0:70d:fe09:9b18 with SMTP id
 00721157ae682-71175385147mr189265037b3.2.1750141633960; Mon, 16 Jun 2025
 23:27:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Tue, 17 Jun 2025 11:57:02 +0530
X-Gm-Features: AX0GCFszeHwKATkz9KMLFmb8AbNccVyEGd22800kIT8HcUWZg19yFvkqgPgiK50
Message-ID: <CAFf+5zj=HzH0EKkw0tM_WenRdLtBMJLVUkMBit6Hz_zkppWsFg@mail.gmail.com>
Subject: Split a string into an array of string tokens based on a string
 delimiter (Four files: str_split.c, str_split.h, test_str_split.c, ReadMe.txt).
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Split a string into an array of string tokens based on a string
delimiter (Four files: str_split.c, str_split.h, test_str_split.c,
ReadMe.txt).

--------------
str_split.c
--------------

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

#include "str_split.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Change this value to process more characters.
#define MAX_STR_SIZE_ALLOWED 8192 // including null terminating character

#define MIN_STR_SIZE_ALLOWED 2 // including null terminating character

static void free_all_allocated_memory(char **tokens_array, long n);

char **str_split(const char *str, const char *delim, long max_splits)
{

    char **output_tokens_array = NULL;
    char *temp = NULL;
    char *prev_temp = NULL;
    long num_tokens = 0;
    size_t delim_len = 0;
    size_t len = 0;
    long i = 0;

    if ((str == NULL) || (str[0] == '\0') ||
        (delim == NULL) || (delim[0] == '\0')) {
        return NULL;
    }

    if (strnlen(str, MAX_STR_SIZE_ALLOWED) == MAX_STR_SIZE_ALLOWED) {
        return NULL;
    }

    if (strnlen(delim, MAX_STR_SIZE_ALLOWED) == MAX_STR_SIZE_ALLOWED) {
        return NULL;
    }

    // At this point, it is guaranteed that both 'str' and 'delim' are null
    // terminated. If either or both of them were not null terminated then
    // strnlen() above would have returned 'MAX_STR_SIZE_ALLOWED' and this
    // function would have returned from there.
    //
    // So, from here onwards, using all string functions is safe.

    // Handle the cases where either 'max_splits' is 0 or 'delim' does not occur
    // in 'str'.
    if ((max_splits == 0) || (strstr(str, delim) == NULL)) {

        output_tokens_array = calloc(2, (sizeof(*output_tokens_array)));

        if (output_tokens_array == NULL) {
            return NULL;
        }

        len = strlen(str);

        // allocate 1 extra byte for null terminator
        output_tokens_array[0] = calloc(1, (len + 1));

        if (output_tokens_array[0] == NULL) {
            free(output_tokens_array);
            return NULL;
        }

        memmove(output_tokens_array[0], str, len);
        (output_tokens_array[0])[len] = '\0';

        output_tokens_array[1] = NULL;

        return output_tokens_array;

    }

    delim_len = strlen(delim);

    temp = (char *)(str);
    prev_temp = (char *)(str);

    while (1) {

        temp = strstr(temp, delim);

        num_tokens = num_tokens + 1;

        if (temp == NULL) {
            break;
        }

        temp = temp + delim_len;
        prev_temp = temp;

    } // end of while (1) loop

    if ((max_splits > 0) && (max_splits < num_tokens)) {
        num_tokens = max_splits + 1;
    }

    // allocate 1 extra character pointer to terminate output_tokens_array with
    // a NULL pointer.
    output_tokens_array = calloc((size_t)(num_tokens) + 1,
                                  (sizeof(*output_tokens_array)));

    if (output_tokens_array == NULL) {
        return NULL;
    }

    temp = (char *)(str);
    prev_temp = (char *)(str);
    i = 0;

    while (1) {

        temp = strstr(temp, delim);

        len = (size_t)(temp - prev_temp);

        // allocate 1 extra byte for null terminator
        output_tokens_array[i] = calloc(1, (len + 1));

        if (output_tokens_array[i] == NULL) {
            free_all_allocated_memory(output_tokens_array, i);
            return NULL;
        }

        memmove(output_tokens_array[i], prev_temp, len);
        (output_tokens_array[i])[len] = '\0';

        i = i + 1;

        temp = temp + delim_len;
        prev_temp = temp;

        if ((num_tokens - i) == 1) { // last token

            len = (size_t)(str + strlen(str) - prev_temp);

            // allocate 1 extra byte for null terminator
            output_tokens_array[i] = calloc(1, (len + 1));

            if (output_tokens_array[i] == NULL) {
                free_all_allocated_memory(output_tokens_array, i);
                return NULL;
            }

            memmove(output_tokens_array[i], prev_temp, len);
            (output_tokens_array[i])[len] = '\0';

            i = i + 1;

            break;

        } // end of if ((num_tokens - i) == 1)

    } // end of while (1) loop

    output_tokens_array[i] = NULL;

    return output_tokens_array;

} // end of function str_split()

void print_tokens_array(char **tokens_array)
{

    long i = 0;

    printf("\n");

    if (tokens_array == NULL) {
        printf("Error: Argument 'tokens_array' is NULL.\n\n");
        return;
    }

    printf("Tokens are printed below (within single quotes):\n\n");
    printf("---- Start of Tokens ----\n");

    while (tokens_array[i]) {
        printf("'%s'\n", tokens_array[i]);
        i = i + 1;
    }

    printf("---- End of Tokens ----\n\n");

    return;

} // end of function print_tokens_array()

long get_total_number_of_tokens_in_tokens_array(char **tokens_array)
{

    long i = 0;

    if (tokens_array == NULL) {
        return 0;
    }

    while (tokens_array[i]) {
        i = i + 1;
    }

    return i;

} // end of function get_total_number_of_tokens_in_tokens_array()

void free_tokens_array(char **tokens_array)
{

    long i = 0;

    if (tokens_array == NULL) {
        return;
    }

    while (tokens_array[i]) {
        free(tokens_array[i]);
        i = i + 1;
    }

    free(tokens_array);

    return;

} // end of function free_tokens_array()

/*
 * static void free_all_allocated_memory(char **tokens_array, long n):
 *
 * Function free_all_allocated_memory() frees the tokens in the array of
 * tokens ('tokens_array') from index '0' to 'n - 1'. It also frees
 * 'tokens_array'.
 */
static void free_all_allocated_memory(char **tokens_array, long n)
{

    long i = 0;

    if (tokens_array == NULL) {
        return;
    }

    for (i = 0; i < n; i = i + 1) {
        free(tokens_array[i]);
    }

    free(tokens_array);

    return;

} // end of function free_all_allocated_memory()

--------------
str_split.h
--------------

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

#ifndef STR_SPLIT_H
#define STR_SPLIT_H

/*
 * char **str_split(const char *str, const char *delim, long max_splits):
 *
 * Function str_split() splits a string ('str') into an array of string tokens
 * (a token is also a string). This function uses the 'delim' string to split
 * 'str' into tokens. If a 'delim' is found at position "i", then the token ends
 * at the position "i - 1".
 *
 * 'max_splits' argument is used to control how many times 'str' should be
 * split. For example, if 'max_splits' is 1, then 'str' will be split one time
 * only. So, if 'str' is "a;b;c" and 'delim' is ";" and 'max_splits' is 1 then
 * 'str' will be split one time only and two tokens will be generated - "a" and
 * "b;c".
 *
 * If 'max_splits' is zero (0) then an array of tokens is returned whose first
 * token (at index 0) is a copy of 'str' and the second token (at index 1) is
 * NULL.
 *
 * If 'max_splits' is negative then it means that all tokens should be returned.
 *
 * In some (error/invalid, etc.) cases NULL is returned. If NULL is returned
 * then this means that 'str' was not split and nothing was done. The cases
 * where NULL will be returned are listed below:
 *
 *      ** 'str' is NULL.
 *      ** 'str' is an empty string.
 *      ** 'str' size (including null terminating character) is greater than
 *          'MAX_STR_SIZE_ALLOWED'.
 *      ** 'delim' is NULL.
 *      ** 'delim' is an empty string.
 *      ** 'delim' size (including null terminating character) is greater than
 *          'MAX_STR_SIZE_ALLOWED'.
 *
 * In successful cases, the return value of this function is a pointer to an
 * array of string tokens. This array of tokens is terminated by a NULL token.
 *
 * The pseudocode of looping through this array of tokens is:
 *
 *          long i = 0;
 *          while (tokens_array[i]) {
 *              ..do stuff here..
 *              i = i + 1;
 *          }
 *
 * All these tokens had been allocated using calloc(), so when these tokens
 * are no longer needed then the user should free these tokens by calling the
 * function 'free_tokens_array()'.
 *
 * If 'delim' is not found in 'str' then an array of tokens is returned whose
 * first token (at index 0) is a copy of 'str' and the second token (at index
 * 1) is NULL.
 *
 * Sometimes, depending on 'str' and 'delim', it is quite possible that in the
 * returned array of tokens, some tokens are empty tokens (means that the first
 * character of the token is a null character). For example, if there are two
 * consecutive 'delim', then one empty token will be generated.
 *
 * This function returns empty tokens because some users may want them. One use
 * case is the following - if the user is splitting records from a file to
 * insert in a database, then when an empty token is found, then the user can
 * insert NULL or 0, etc. in that column.
 *
 * In case, empty tokens are of no use then they can be skipped by using the
 * following line of code: "if ((tokens_array[i])[0] == '\0') { continue; }".
 *
 * There are two more functions available that you can use:
 * print_tokens_array() and get_total_number_of_tokens_in_tokens_array().
 */
char **str_split(const char *str, const char *delim, long max_splits);

/*
 * void print_tokens_array(char **tokens_array):
 *
 * Function print_tokens_array() prints all the tokens in the 'tokens_array'.
 */
void print_tokens_array(char **tokens_array);

/*
 * long get_total_number_of_tokens_in_tokens_array(char **tokens_array):
 *
 * Function get_total_number_of_tokens_in_tokens_array() returns the count of
 * the number of tokens in the 'tokens_array'. It is assumed that the
 * 'tokens_array' is terminated by a NULL token.
 */
long get_total_number_of_tokens_in_tokens_array(char **tokens_array);

/*
 * void free_tokens_array(char **tokens_array):
 *
 * Function free_tokens_array() frees all the tokens in the 'tokens_array'.
 * It also frees the 'tokens_array'.
 */
void free_tokens_array(char **tokens_array);

#endif

--------------------
test_str_split.c
--------------------

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

#include "str_split.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Change this value to process more characters.
#define MAX_STR_SIZE_ALLOWED 8192 // including null terminating character

#define MIN_STR_SIZE_ALLOWED 2 // including null terminating character

#define ARRAY_SIZE 256 // including null terminating character

static char *get_input_from_stdin_and_discard_extra_characters(char *str,
                                                               int size);
static void discard_all_characters_from_stdin(void);

int main(void)
{

    char str[ARRAY_SIZE] = {0};
    char delim[ARRAY_SIZE] = {0};
    long max_splits = 0;
    char **tokens_array = NULL;
    char *arg_str = NULL;
    char *arg_delim = NULL;

    while (1) {

        arg_str = str;
        arg_delim = delim;

        printf("\n");

        printf("Please input a string to split (max %d characters) (To enter"
               " NULL string, type NULL (in capital letters) and press ENTER):"
               " ", ARRAY_SIZE - 1);

        get_input_from_stdin_and_discard_extra_characters(str, ARRAY_SIZE);

        if (strncmp(str, "NULL", (strlen("NULL") + 1)) == 0) {
            arg_str = NULL;
        }

        printf("\nPlease input a delimiter for splitting the string (max %d"
               " characters) (To enter NULL delimiter, type NULL (in capital"
               " letters) and press ENTER): ", ARRAY_SIZE - 1);

        get_input_from_stdin_and_discard_extra_characters(delim, ARRAY_SIZE);

        if (strncmp(delim, "NULL", (strlen("NULL") + 1)) == 0) {
            arg_delim = NULL;
        }

        printf("\nPlease input maximum number of splits (a negative value means"
               " to split the string as many times as possible): ");

        scanf("%ld", &max_splits);

        // now clear the stdin input buffer
        discard_all_characters_from_stdin();

        printf("\n------\n");
        printf("Output\n");
        printf("------\n\n");
        printf("Input parameters: str=\"%s\", delim=\"%s\", max_splits=%ld\n\n",
               arg_str ? arg_str: "(null string)",
               arg_delim ? arg_delim: "(null delimiter)", max_splits);

        tokens_array = str_split(arg_str, arg_delim, max_splits);

        if (tokens_array == NULL) {
            printf("\n**Function str_split() returned NULL. The input string"
                   " was not split.**\n");
        }

        if (tokens_array) {
            printf("Number of tokens = %ld\n",
                   get_total_number_of_tokens_in_tokens_array(tokens_array));
            print_tokens_array(tokens_array);
            free_tokens_array(tokens_array);
        }

        printf("\nPlease press ENTER to continue..");

        // now clear the stdin input buffer
        discard_all_characters_from_stdin();

    } // end of while(1) loop

} // end of function main()

/*
 * static char *get_input_from_stdin_and_discard_extra_characters(char *str,
 *                                                                int size):
 *
 * Function get_input_from_stdin_and_discard_extra_characters() reads at most
 * (size - 1) characters from stdin and stores them in 'str'. One character is
 * used to null terminate 'str'. The rest of the remaining characters in stdin
 * are read and discarded, they are not stored in 'str'. So, when this function
 * returns then there is no input/characters left in stdin.
 *
 * If 'str' is NULL then it is an error and nothing is read from stdin and NULL
 * is returned.
 *
 * If 'size' is greater than 'MAX_STR_SIZE_ALLOWED' or less than
 * 'MIN_STR_SIZE_ALLOWED' then it is an error and nothing is read from stdin
 * and NULL is returned.
 */
static char *get_input_from_stdin_and_discard_extra_characters(char *str,
                                                               int size)
{

    int c = 0;
    int i = 0;

    if (str == NULL) {
        return NULL;
    }

    if ((size < MIN_STR_SIZE_ALLOWED) || (size > MAX_STR_SIZE_ALLOWED)) {
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

----------------
ReadMe.txt
----------------

File "str_split.c" implements a function called str_split() which splits a
string into an array of string tokens based on a string delimiter. The signature
of this function is:

        char **str_split(const char *str, const char *delim, long max_splits)

Function str_split() splits a string ('str') into an array of string tokens (a
token is also a string). This function uses the 'delim' string to split 'str'
into tokens. If a 'delim' is found at position "i", then the token ends at the
position "i - 1".

'max_splits' argument is used to control how many times 'str' should be split.
For example, if 'max_splits' is 1, then 'str' will be split one time only. So,
if 'str' is "a;b;c" and 'delim' is ";" and 'max_splits' is 1 then 'str' will be
split one time only and two tokens will be generated - "a" and "b;c".

If 'max_splits' is zero (0) then an array of tokens is returned whose first
token (at index 0) is a copy of 'str' and the second token (at index 1) is NULL.

If 'max_splits' is negative then it means that all tokens should be returned.

In some (error/invalid, etc.) cases NULL is returned. If NULL is returned then
this means that 'str' was not split and nothing was done. The cases where NULL
will be returned are listed below:

     ** 'str' is NULL.
     ** 'str' is an empty string.
     ** 'str' size (including null terminating character) is greater than
         'MAX_STR_SIZE_ALLOWED'.
     ** 'delim' is NULL.
     ** 'delim' is an empty string.
     ** 'delim' size (including null terminating character) is greater than
         'MAX_STR_SIZE_ALLOWED'.

In successful cases, the return value of this function is a pointer to an array
of string tokens. This array of tokens is terminated by a NULL token.

The pseudocode of looping through this array of tokens is:

         long i = 0;
         while (tokens_array[i]) {
             ..do stuff here..
             i = i + 1;
         }

All these tokens had been allocated using calloc(), so when these tokens are no
longer needed then the user should free these tokens by calling the function
'free_tokens_array()'.

If 'delim' is not found in 'str' then an array of tokens is returned whose
first token (at index 0) is a copy of 'str' and the second token (at index 1) is
NULL.

Sometimes, depending on 'str' and 'delim', it is quite possible that in the
returned array of tokens, some tokens are empty tokens (means that the first
character of the token is a null character). For example, if there are two
consecutive 'delim', then one empty token will be generated.

This function returns empty tokens because some users may want them. One use
case is the following - if the user is splitting records from a file to insert
in a database, then when an empty token is found, then the user can insert NULL
or 0, etc. in that column.

In case, empty tokens are of no use then they can be skipped by using the
following line of code: "if ((tokens_array[i])[0] == '\0') { continue; }".

There are two more functions available that you can use: print_tokens_array()
and get_total_number_of_tokens_in_tokens_array().

---- End of README ----
