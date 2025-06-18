Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11926288C1A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242141; cv=none; b=WA6oYX+6g6SbSqnJ3qKyEvCWbo+1HcMBDlFwEt7WQW9DEGEP2LJkBBlZl0ZIh3T/fr4Wq9N8891o8TjaqkV5jqUwIoKzNqsLozajHh/UB7Tf2vs4SkqMx40qemGE+kwdoADRnShBex4sgH6D53YzONK6sEGyjoEwcUr/svVfke4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242141; c=relaxed/simple;
	bh=gagXRV4HnE51QrpMsDWghMxPXgbHAxikOYMmRU8F1/o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=sPXkGNx/54yscwZ/+fQtzh6V3vVRF+mmjt6xyYGSKwLWVnL+hGcjHt4IIiKFm8tfYJjuOQC17maNd6iVhsWtPyxOiZRPl9NsO8lwAAPEnGGcic4bj9Vy/9LOksRxCcMHkzySLVYf5bDaI62qRlpVM7hhyvlBMCcEBYeeIXuR3WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPAphW6/; arc=none smtp.client-ip=209.85.219.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPAphW6/"
Received: by mail-yb1-f194.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so5880455276.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 03:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750242138; x=1750846938; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lIgLwvf2hJLlx86dw4qDZMzeC9ho3E/koj0OVMetnkc=;
        b=kPAphW6/J3ZaWrLcm/1JXtXI1mszU+bgZF7TDRoSzvPg8uTWhjA6Qkg0Egh1k8vRIy
         HTSrIjsVvB4ES6GpdXIBZbzriyNPDy2upw1F7Yjcc71A+i49Xct51/Kvd3utm6Cgmax1
         wGgwe2aF1rXDQG8yYS2adwxA5bX2L9QTXA/i2gnACsdjQ/J8TwJd/7uG4Klp42K8CctW
         VsqpIUfVkliQKaXHDnbihsjjBkh7+NNWsdQTJ9F0eV99VN/Vy5xCL42D/A+3Dlp5cQFv
         IK8iPlNgLRuAlfNWiUfjyhakr7CdctKtRboCq2V7+9dzbxm2GiQArsKIWjtzjFmnFiXJ
         IYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750242138; x=1750846938;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lIgLwvf2hJLlx86dw4qDZMzeC9ho3E/koj0OVMetnkc=;
        b=SIxIKTnkYB8mbUTWBrkDII2L7VZEiuuatTrx0hZ60fymwYi41G9Tz88E/f7wLo5KD+
         WdSIUZ7gFBy5Ce45jO0M1oWJWTfC2xSrVwiPky01gpHwK13ERzSxLbE1WhwOxm8S0DaC
         qULOpC3YmnK3umctZcWhZnhMSEl3wb75X1b/uOqCaLjdarOL9YCJKCibb2Aw5FAIB8TE
         RwCh7Y8kaKALmvh1NvrZT/qFITK/frbLovMup229De7dl0BS/bqzUEmotH9fXq1tg/Q3
         IJZjNER8ZF7oKFl4wIHsIhR3vscsMROp4NFAf6aT/YgcgSE8s+3+CC7BdzEnl4qv1qrv
         50Ug==
X-Gm-Message-State: AOJu0YzcIW7WbbynoRo49ZvSIH26f8eSSS2dEk+G6rVkWKBjrRsdNl+B
	N/u9WiJA1rZdq+ZRxRpigOUFsvcn0zpcIJSIDzCOTJYFpNMrtQourxrpKLPeAb1REXg64iT5AK+
	A9O924YdFkfOdQ54fQY27dTIn9506E6j1QU4QJe/P7Q==
X-Gm-Gg: ASbGncvlRT4v8Orz4zxn2HaTrcMXArGE4OVz2R7rYljB9wubd778wxUJMtZpOR+lpLs
	XDu0HV8jXPYSR24goEjLMJzemJULgw2/PLzvu+CYVUiOQtT9eL08jbWk5jtsoz6AV5grHcbWU0b
	CEhDKV1oWV+2qp6dw1dj3cb7r3juF4CK4dO/70BggzdPZoHZOJgPcCYZU7Lyh5AVZtas4HNP5A/
	AYQVA==
X-Google-Smtp-Source: AGHT+IHBth5spvkJRNVTYpcrGMyCdif5hg4R526MGORYh/cPMJqnxvQzgoXWYmoKGZJ5EkgJ5yIGlh4nFs4tRkiixWs=
X-Received: by 2002:a05:6902:2493:b0:e82:fd2:717f with SMTP id
 3f1490d57ef6-e822acab893mr23641704276.4.1750242137542; Wed, 18 Jun 2025
 03:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Wed, 18 Jun 2025 15:52:06 +0530
X-Gm-Features: Ac12FXzOnsTNhXwUPG5Q5Mgv1dTrNPZzIHPONaDnRhMay6cKk8-uWx6DuT0rwAs
Message-ID: <CAFf+5zgVYZGRhbEb4-Mn1o2s=Qj+DTK7w2Uit8+q9WgFw3PHbQ@mail.gmail.com>
Subject: Program (basically, a framework) to present a text menu to the user
 and get the user input and process the user input (Two files:
 text_menu_for_user.c and ReadMe.txt).
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Program (basically, a framework) to present a text menu to the user
and get the user input and process the user input (Two files:
text_menu_for_user.c and ReadMe.txt).

------------------------------
text_menu_for_user.c
------------------------------

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

/*
 * ==== README ====
 *
 * You can use this program if you want to present a text menu to the user and
 * process the user input and keep repeating this cycle until the user exits
 * this program.
 *
 * If you want to use this program according to your requirements then you have
 * to make some changes in this program. These changes are not a lot. You need
 * to make the changes listed below:
 *
 *      ** Change the value of 'TOTAL_NUMBER_OF_MENU_ITEMS' according to the
 *         number of menu items that you have.
 *
 *      ** Change the value of 'MENU_ITEM_STRING_SIZE' according to your
 *         requirements.
 *
 *      ** Check other defined constants to see if you need to modify their
 *         values because of your requirements.
 *
 *      ** Modify the menu items details in create_menu() function according
 *         to your requirements and implement your new functions.
 *
 *      ** Delete dummy_function() and its declaration.
 *
 * This program presents a menu to the user and asks the user to input a valid
 * menu option. After the user has inputted a valid menu option, this program
 * executes the function associated with that menu option. After the associated
 * function finishes, this program presents the menu again to the user and this
 * goes on in a cycle until the user exits this program.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

// Change this value to process more characters.
#define MAX_STR_SIZE_ALLOWED 8192 // including null terminating character

#define MIN_STR_SIZE_ALLOWED 2 // including null terminating character

#define STR_NUM_TRUE  1
#define STR_NUM_FALSE 0

// TM stands for Text Menu
#define TM_TRUE  1
#define TM_FALSE 0

#define TM_SUCCESS  0
#define TM_FAILURE -1

// Menu starts with option number 1. Change the below value to the number of
// menu items that you have.
#define TOTAL_NUMBER_OF_MENU_ITEMS 5

// change this value according to your requirements
#define MENU_ITEM_STRING_SIZE 1024 // including null terminating character

// You don't need to change this value because the value of '8' can handle
// (10^7 - 1) option numbers (that is, (10^7 - 1) menu items).
#define OPTION_NUMBER_SIZE 8 // including null terminating character

#define CONFIRMATION_STR_SIZE 8 // including null terminating character

#define NUMERIC_INPUT_STR_SIZE 5 // including null terminating character

struct menu_item
{
    // string that will be displayed when this menu item is displayed
    char menu_item_string[MENU_ITEM_STRING_SIZE];

    // You can set and use 'arg' whenever you want. You can set it at init time
    // in create_menu() function or at run time.
    void *arg;

    // Function that will be called when the user inputs a valid menu option
    // number. 'func' is a function pointer.
    void *(*func)(struct menu_item *mis_arr, int index_in_mis_arr);
};

// function prototypes for gcc flag -Werror-implicit-function-declaration
static char *get_input_from_stdin_and_discard_extra_characters(char *str,
                                                               int size);
static void discard_all_characters_from_stdin(void);
static int is_str_a_number(const char *str);
static char *get_string_input_from_user(char *str, int size);
static int get_numeric_input_from_user(char *str, int size,
                                       int *number_ptr);
static int get_valid_option_from_user(void);

// mis_arr means menu items array
static void print_menu(struct menu_item *mis_arr);
static void create_menu(struct menu_item *mis_arr);
static void create_and_display_menu_and_process_user_input(void);

static void *get_number_from_user(struct menu_item *mis_arr,
                                  int index_in_mis_arr);
static void *show_saved_number(struct menu_item *mis_arr, int index_in_mis_arr);
static void *show_sum_of_digits_of_number(struct menu_item *mis_arr,
                                          int index_in_mis_arr);
static void *delete_saved_number(struct menu_item *mis_arr,
                                 int index_in_mis_arr);
static void *exit_program(struct menu_item *mis_arr, int index_in_mis_arr);

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
 *      If 'size' is greater than 'MAX_STR_SIZE_ALLOWED' or less than
 *      'MIN_STR_SIZE_ALLOWED' then it is an error and nothing is read from
 *      stdin and NULL is returned.
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

/*
 * is_str_a_number():
 *
 *      Function is_str_a_number() expects only numeric characters in 'str'.
 *
 *      This function returns STR_NUM_TRUE only when all the following
 *      conditions are met:
 *
 *              ** 'str' is not null.
 *              ** The first character of 'str' is not the null terminating
 *                 character.
 *              ** Length of 'str' is less than MAX_STR_SIZE_ALLOWED.
 *              ** 'str' contains only numeric characters before the null
 *                 terminating character.
 *
 *      In all other cases, this function returns STR_NUM_FALSE.
 */
static int is_str_a_number(const char *str)
{

    char c = -1;

    if (str == NULL) {
        return STR_NUM_FALSE;
    }

    if (str[0] == '\0') { // empty string
        return STR_NUM_FALSE;
    }

    // If length of 'str' is not less than MAX_STR_SIZE_ALLOWED then it is an
    // error and in this case, return STR_NUM_FALSE.
    if (strnlen(str, MAX_STR_SIZE_ALLOWED) == MAX_STR_SIZE_ALLOWED) {
        return STR_NUM_FALSE;
    }

    while ((c = *str)) {
        if ((c < '0') || (c > '9')) {
            return STR_NUM_FALSE;
        }
        str++;
    }

    return STR_NUM_TRUE;

} // end of function is_str_a_number()

static char *get_string_input_from_user(char *str, int size)
{

    char *retval = NULL;

    if (str == NULL) {
        return NULL;
    }

    if ((size < MIN_STR_SIZE_ALLOWED) || (size > MAX_STR_SIZE_ALLOWED)) {
        return NULL;
    }

    retval = get_input_from_stdin_and_discard_extra_characters(str, size);

    // If retval is NULL then print an error message and exit.
    if (retval == NULL) {
        printf("\n\nError: %s(): %s() returned NULL. Some BUG in this program."
               " Exiting..\n\n", __FUNCTION__,
               "get_input_from_stdin_and_discard_extra_characters");

        exit(1);
    }

    return str;

} // end of function get_string_input_from_user()

static int get_numeric_input_from_user(char *str, int size,
                                       int *number_ptr)
{

    char *retval = NULL;

    if ((str == NULL) || (number_ptr == NULL)) {
        return TM_FAILURE;
    }

    if ((size < MIN_STR_SIZE_ALLOWED) || (size > MAX_STR_SIZE_ALLOWED)) {
        return TM_FAILURE;
    }

    retval = get_string_input_from_user(str, size);

    // If retval is NULL then print an error message and exit.
    if (retval == NULL) {
        printf("\n\nError: %s(): get_string_input_from_user() returned NULL."
               " Some BUG in this program. Exiting..\n\n", __FUNCTION__);
        exit(1);
    }

    if (is_str_a_number(str) != STR_NUM_TRUE) {
        return TM_FAILURE;
    }

    // convert string to int
    (*number_ptr) = atoi(str);

    return TM_SUCCESS;

} // end of function get_numeric_input_from_user()

static int get_valid_option_from_user(void)
{

    char str[OPTION_NUMBER_SIZE] = {0};
    int option = -1;
    int retval = -1;

    printf("\n");

    // keep looping until a valid option is received
    do {

        printf("Please enter a valid option (1 - %d) (only numeric characters"
               " allowed): ", TOTAL_NUMBER_OF_MENU_ITEMS);

        retval = get_numeric_input_from_user(str, OPTION_NUMBER_SIZE, &option);

        if (retval != TM_SUCCESS) {
            continue;
        }

    } while ((option < 1) || (option > TOTAL_NUMBER_OF_MENU_ITEMS));

    return option;

} // end of function get_valid_option_from_user()

// mis_arr means menu items array
static void print_menu(struct menu_item *mis_arr)
{

    int i = 0;

    if (mis_arr == NULL) {
        printf("\n\nError: %s(): Argument 'mis_arr' is NULL. Some BUG in this"
               " program. Exiting..\n\n", __FUNCTION__);
        exit(1);
    }

    printf("\n\n");

    printf("----\n");
    printf("Menu\n");
    printf("----\n");
    printf("\n");

    for (i = 0; i < TOTAL_NUMBER_OF_MENU_ITEMS; i++) {
        printf("%d. %s\n", (i + 1), mis_arr[i].menu_item_string);
    }

    return;

} // end of function print_menu()

static void create_menu(struct menu_item *mis_arr)
{

    if (mis_arr == NULL) {
        printf("\n\nError: %s(): Argument 'mis_arr' is NULL. Some BUG in this"
               " program. Exiting..\n\n", __FUNCTION__);
        exit(1);
    }

    // 1st menu item
    strncpy(mis_arr[0].menu_item_string, "Input a number (this number will be"
            " saved)", MENU_ITEM_STRING_SIZE);
    mis_arr[0].menu_item_string[MENU_ITEM_STRING_SIZE - 1] = 0;
    mis_arr[0].arg = NULL;
    mis_arr[0].func = get_number_from_user;

    // 2nd menu item
    strncpy(mis_arr[1].menu_item_string, "Show the saved number",
            MENU_ITEM_STRING_SIZE);
    mis_arr[1].menu_item_string[MENU_ITEM_STRING_SIZE - 1] = 0;
    mis_arr[1].arg = NULL;
    mis_arr[1].func = show_saved_number;

    // 3rd menu item
    strncpy(mis_arr[2].menu_item_string, "Show the sum of the digits of the"
            " saved number", MENU_ITEM_STRING_SIZE);
    mis_arr[2].menu_item_string[MENU_ITEM_STRING_SIZE - 1] = 0;
    mis_arr[2].arg = NULL;
    mis_arr[2].func = show_sum_of_digits_of_number;

    // 4th menu item
    strncpy(mis_arr[3].menu_item_string, "Delete the saved number",
            MENU_ITEM_STRING_SIZE);
    mis_arr[3].menu_item_string[MENU_ITEM_STRING_SIZE - 1] = 0;
    mis_arr[3].arg = NULL;
    mis_arr[3].func = delete_saved_number;

    // 5th menu item
    strncpy(mis_arr[4].menu_item_string, "Exit this program",
            MENU_ITEM_STRING_SIZE);
    mis_arr[4].menu_item_string[MENU_ITEM_STRING_SIZE - 1] = 0;
    mis_arr[4].arg = NULL;
    mis_arr[4].func = exit_program;

    return;

} // end of function create_menu()

static void create_and_display_menu_and_process_user_input(void)
{

    struct menu_item *mis_arr = NULL;
    char confirm_str[CONFIRMATION_STR_SIZE] = {0};
    int option = -1;
    char *retval = NULL;
    char confirmation = -1;

    // Allocate memory for the array of menu items.
    // This memory will be freed automatically by the system when this program
    // exits. As long as this program is running, this memory will not be freed.
    mis_arr = calloc(TOTAL_NUMBER_OF_MENU_ITEMS, sizeof(*mis_arr));

     if (mis_arr == NULL) {
        printf("\n\nError: %s(): No memory available. Exiting..\n\n",
               __FUNCTION__);
        exit(1);
    }

    // create menu
    create_menu(mis_arr);

    // infinite loop, keep processing until user exits
    while (1) {

        print_menu(mis_arr);

        option = get_valid_option_from_user();

        printf("\n");

        // confirm that the user want to proceed with the selected option
        while (1) {

            printf("You selected option number %d (\"%s\"). Do you want to"
                   " proceed (only 'y' and 'n' allowed): ", option,
                   mis_arr[option - 1].menu_item_string);

            retval = get_string_input_from_user(confirm_str,
                                                CONFIRMATION_STR_SIZE);

            // If retval is NULL then print an error message and exit.
            if (retval == NULL) {
                printf("\n\nError: %s(): get_string_input_from_user() returned"
                       " NULL. Some BUG in this program. Exiting..\n\n",
                       __FUNCTION__);
                exit(1);
            }

            if ((strncmp(confirm_str, "y", CONFIRMATION_STR_SIZE) == 0) ||
                (strncmp(confirm_str, "n", CONFIRMATION_STR_SIZE) == 0)) {
                confirmation = confirm_str[0];
                break;
            }

        } // end of inner while (1) loop

        if (confirmation == 'n') {
            // Wait for the user to press the ENTER key before showing the menu
            // again.
            printf("\n\nPress the ENTER key to see the menu again.. ");
            discard_all_characters_from_stdin();
            continue;
        }

        // call the appropriate function
        (mis_arr[option - 1].func)(mis_arr, option - 1);

        // Wait for the user to press the ENTER key before showing the menu
        // again.
        printf("\n\nPress the ENTER key to see the menu again.. ");

        discard_all_characters_from_stdin();

    } // end of outer while (1) loop

    // unreachable code
    return;

} // end of function create_and_display_menu_and_process_user_input()

static void *get_number_from_user(struct menu_item *mis_arr,
                                  int index_in_mis_arr)
{

    char str[NUMERIC_INPUT_STR_SIZE] = {0};
    int number = -1;
    int retval = -1;
    int i = 0;

    if (mis_arr == NULL) {
        printf("\n\nError: %s(): Argument 'mis_arr' is NULL. Some BUG in this"
               " program. Exiting..\n\n", __FUNCTION__);
        exit(1);
    }

    if (index_in_mis_arr < 0) {
        printf("\n\nError: %s(): Argument 'index_in_mis_arr' is less than zero."
               " Some BUG in this program. Exiting..\n\n", __FUNCTION__);
        exit(1);
    }

    printf("\n");

    // keep looping until a positive number is received
    while (1) {

        printf("Please enter a positive number (only numeric characters"
               " allowed) (the number will be truncated to 4 digits)(the"
               " previously saved number will be replaced): ");

        retval = get_numeric_input_from_user(str, NUMERIC_INPUT_STR_SIZE,
                                             &number);

        if (retval == TM_SUCCESS) {
            break;
        }

    } // end of while (1) loop

    // Make the number available to all menu items functions.
    for (i = 0; i < TOTAL_NUMBER_OF_MENU_ITEMS; i++) {
           mis_arr[i].arg = (void *)((long)(number));
    }

    printf("\n\nThe number you entered is: %d\n", number);

    return NULL;

} // end of function get_number_from_user()

static void *show_saved_number(struct menu_item *mis_arr, int index_in_mis_arr)
{

    if (mis_arr == NULL) {
        printf("\n\nError: %s(): Argument 'mis_arr' is NULL. Some BUG in this"
               " program. Exiting..\n\n", __FUNCTION__);
        exit(1);
    }

    if (index_in_mis_arr < 0) {
        printf("\n\nError: %s(): Argument 'index_in_mis_arr' is less than zero."
               " Some BUG in this program. Exiting..\n\n", __FUNCTION__);
        exit(1);
    }

    if (mis_arr[index_in_mis_arr].arg == NULL) {
        printf("\n\nThere is no saved number. Please first input a number by"
               " selecting menu option 1.\n");
        return NULL;
    }

    printf("\n\nThe saved number is: %d\n",
           (int)((long)(mis_arr[index_in_mis_arr].arg)));

    return NULL;

} // end of function show_saved_number()

static void *show_sum_of_digits_of_number(struct menu_item *mis_arr,
                                          int index_in_mis_arr)
{

    int num = -1;
    int sum_of_digits = 0;

    if (mis_arr == NULL) {
        printf("\n\nError: %s(): Argument 'mis_arr' is NULL. Some BUG in this"
               " program. Exiting..\n\n", __FUNCTION__);
        exit(1);
    }

    if (index_in_mis_arr < 0) {
        printf("\n\nError: %s(): Argument 'index_in_mis_arr' is less than zero."
               " Some BUG in this program. Exiting..\n\n", __FUNCTION__);
        exit(1);
    }

    if (mis_arr[index_in_mis_arr].arg == NULL) {
        printf("\n\nThere is no saved number. Please first input a number by"
               " selecting menu option 1.\n");
        return NULL;
    }

    num = (int)((long)(mis_arr[index_in_mis_arr].arg));

    while (num) {
        sum_of_digits = sum_of_digits + (num % 10);
        num = num/10;
    }

    printf("\n\nThe sum of the digits of the saved number (%d) is: %d\n",
           (int)((long)(mis_arr[index_in_mis_arr].arg)), sum_of_digits);

    return NULL;

} // end of function show_sum_of_digits_of_number()

static void *delete_saved_number(struct menu_item *mis_arr,
                                 int index_in_mis_arr)
{

    int i = 0;

    if (mis_arr == NULL) {
        printf("\n\nError: %s(): Argument 'mis_arr' is NULL. Some BUG in this"
               " program. Exiting..\n\n", __FUNCTION__);
        exit(1);
    }

    if (index_in_mis_arr < 0) {
        printf("\n\nError: %s(): Argument 'index_in_mis_arr' is less than zero."
               " Some BUG in this program. Exiting..\n\n", __FUNCTION__);
        exit(1);
    }

    if (mis_arr[index_in_mis_arr].arg == NULL) {
        printf("\n\nThere is no saved number. Please first input a number by"
               " selecting menu option 1.\n");
        return NULL;
    }

    // Remove the number from all mis_arr array elements
    for (i = 0; i < TOTAL_NUMBER_OF_MENU_ITEMS; i++) {
           mis_arr[i].arg = NULL;
    }

    printf("\n\nThe saved number has been deleted.\n");

    return NULL;

} // end of function delete_saved_number()

static void *exit_program(struct menu_item *mis_arr, int index_in_mis_arr)
{

    if (mis_arr == NULL) {
        printf("\n\nError: %s(): Argument 'mis_arr' is NULL. Some BUG in this"
               " program. Exiting..\n\n", __FUNCTION__);
        exit(1);
    }

    if (index_in_mis_arr < 0) {
        printf("\n\nError: %s(): Argument 'index_in_mis_arr' is less than zero."
               " Some BUG in this program. Exiting..\n\n", __FUNCTION__);
        exit(1);
    }

    printf("\n\nYou chose the option number: %d\n", index_in_mis_arr + 1);

    printf("The text of this option is: \"%s\"\n",
           mis_arr[index_in_mis_arr].menu_item_string);

    printf("\n\nExiting..\n\n\n");

    exit(0);

} // end of function exit_program()

int main(void)
{

    create_and_display_menu_and_process_user_input();

    return 0;

} // end of function main()

-----------------
ReadMe.txt
-----------------

You can use this program (text_menu_for_user.c) if you want to present a text
menu to the user and process the user input and keep repeating this cycle until
the user exits this program.

If you want to use this program according to your requirements then you have
to make some changes in this program. These changes are not a lot. You need
to make the changes listed below:

     ** Change the value of 'TOTAL_NUMBER_OF_MENU_ITEMS' according to the
        number of menu items that you have.

     ** Change the value of 'MENU_ITEM_STRING_SIZE' according to your
        requirements.

     ** Check other defined constants to see if you need to modify their
        values because of your requirements.

     ** Modify the menu items details in create_menu() function according
        to your requirements and implement your new functions.

     ** Delete dummy_function() and its declaration.

This program presents a menu to the user and asks the user to input a valid
menu option. After the user has inputted a valid menu option, this program
executes the function associated with that menu option. After the associated
function finishes, this program presents the menu again to the user and this
goes on in a cycle until the user exits this program.

---- End of ReadMe ----
