Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD49B225A40
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750043664; cv=none; b=TdJ2kI+hOXey/1zFe2E4tj7EWDR0ZdRoXa2eupW0jSJVe7yeBIjAD+4MvnjkPh9hk4tMIVSml5nLrCntghtpDSxH7deeDWiR/IJ0qvSxdnFXsZepMjhGGL24aWRLjpzkLkOAR4FLPhmKMJaH7JVmRjVpHFBZJHYmjDZoBqfe9JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750043664; c=relaxed/simple;
	bh=XvuZmmeruYaRH0yTxYdWfpYdDy/+01e0SIdNe4fy9AA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=rn2msPzfvKtd9Xv/SPB8qt+Fyqs3RAhacyhJpaTr01INx/nUukdw8vn6EwFHgUq9+xbZvaJbHonPLp1uM0cEOTj9PbWakCfuEWn0S34jQfG7aiL3D9CkomBlqSUY8Jdh22Yvjyu3kvcpjagFX/zTkOvuhr2Wio3WXjd4MNIj1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYaCIsw7; arc=none smtp.client-ip=209.85.219.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYaCIsw7"
Received: by mail-yb1-f196.google.com with SMTP id 3f1490d57ef6-e75668006b9so3663203276.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 20:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750043662; x=1750648462; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lKVufWHigQ6UCQA2cwa1GN0nrLnP5W5BJseaDzSFxSY=;
        b=JYaCIsw7EuOu5DICegAPfkcankpOIPPArq5kTmgkWiaxVv+9u4d5Jfszbf5MZM1PuP
         K2tWBgE8SNb/q3ZbQ0rXvVcILPl6L8PHKss6+YGft4E97joHa2qWa55TuV3kLa661mKo
         ia5YzzDea3MpXTMP7Z04X6TfV6vGSpD99JoPYqOd1K2smHxdgG8zI4HIiSRzioqD/1GX
         9gYyxhfXaRo5EdEXk7CBZjwfx0rG4q8/9l/d9jiF/LYLeztZdR8g1E965l2NNVgB1GqA
         m5UWtJ+wC3kHpE6nxHzsSt6z4GvV65xyLmydfCfZEJk4CKXaMS2B5WU3LDmvzG9cozFV
         r9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750043662; x=1750648462;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lKVufWHigQ6UCQA2cwa1GN0nrLnP5W5BJseaDzSFxSY=;
        b=dMJ3jpcdV8j+P/tw9+41XZv0FYsC6ceFvyLaX0E93Cz6DxAkp+EJ8tlVnQunvxFW57
         sUXJNmT/vlidz3df86T2md1r6Qf3Vl5l8X4iOcL2Xu9l62eO7DP1t0wl6CLzNTb0Qzfl
         GPv1dADYgX/MeyrjhCi4VllsVI+0f0UxddnNUIHUs7qe3+AKFe66y0sqUoiQ/ZlKL3Ed
         LFl7BfuLKqJkNwBCW9Wa4b/qTjrN+FbCXCIzRfQDJKR190wtpCxXTNixLHqlBtn9CdjG
         dPEDsr5f3RBybrv0EQJpBoWdYNoRG5Lbmmv/5CSo2gpvb9y29ldd+ewrrMDpN/CxKo4b
         ZRmw==
X-Gm-Message-State: AOJu0Yxm11u264A0De0nvYC824/Z3xkERFxjFwW5kwgZhjW926cwPHat
	henEjQzMq/2R/zCPhotzvTIaJWCtuyGQUe+3HQDAoBdCDlDUIE+5ydqCRPa0yA5SW7UerLjOv20
	qF9YKX00MYiygwU9CLwPZ8JQWXHA3vsC8H+8IbKXVBg==
X-Gm-Gg: ASbGnctBTXrfsryuGwlP/9P3l6ON3aPDa+mBofm+ea7LtJyvjbZCKfiWQr3qhAfnr+t
	UbrkzX8WVi6B5JhNSU1rJwXupyfzMj3M8FwDydowwI1Sr1ko1/AlD33Mq1ZYqiRvh9tm0wRY5lO
	JL43ODZOnNJ77ICirCYYX8q/CJ2cpVt3jui7dKS5k0QK/yTUO1C3p7dZmdbkE5X+mJ/pqJJkexX
	/B1xA==
X-Google-Smtp-Source: AGHT+IGLv3eH9r6qTqBMd86odoBCuJZrqVQ2y5V7njWaRRKxWikbVw3CUkxDm0+7r7Cc3uLVrFB/+FWEXBkcqLTcujE=
X-Received: by 2002:a05:6902:2806:b0:e81:78c2:7326 with SMTP id
 3f1490d57ef6-e822aea1e4cmr10501437276.43.1750043661358; Sun, 15 Jun 2025
 20:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Mon, 16 Jun 2025 08:44:09 +0530
X-Gm-Features: AX0GCFsxQGU0kOJNqvhXLE_Z6wpSVPdKC7f_V_Y83MUPHbMNpXUA28gh6u0AjQo
Message-ID: <CAFf+5zgoWzHA87nQ+N1L1qaghAKNQsBLuGxV3eeVi0eg_fSvgw@mail.gmail.com>
Subject: pthread producer consumer program (Two files: pthread_producer_consumer_program.c
 and ReadMe.txt).
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

pthread producer consumer program (Two files:
pthread_producer_consumer_program.c and ReadMe.txt).

------------------------------------------------------
pthread_producer_consumer_program.c
------------------------------------------------------

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

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <sched.h>
#include <errno.h>
#include <pthread.h>

#define NUM_ITEMS 10

#define PTHREAD_MUTEX_LOCK pthread_mutex_lock
#define PTHREAD_MUTEX_UNLOCK pthread_mutex_unlock

#define PTHREAD_COND_WAIT pthread_cond_wait
#define PTHREAD_COND_BROADCAST pthread_cond_broadcast

struct common_vars {
    pthread_mutex_t *mutex;
    pthread_cond_t *cond_var;
    int items_queue[NUM_ITEMS];
    int current_num_items_in_queue;
};

static void check_retval_and_exit_on_error(int retval, const char *msg);
static void *producer(void *arg);
static void *consumer(void *arg);

static void check_retval_and_exit_on_error(int retval, const char *msg)
{

    if (retval != 0) {
        printf("\nError: %s. The error number is: %d. Now, there is no point in"
               " running this program. This program is now exiting..\n\n",
               ((msg != NULL) ? msg : ""), retval);
        exit(1);
    }

    return;

} // end of function check_retval_and_exit_on_error()

static void *producer(void *arg)
{

    struct common_vars *cv_ptr = arg;
    int current_index_in_queue = 0;
    int num = 0;
    int to_yield = 0;
    int retval = -1;

    if (arg == NULL) {
        printf("\nError: 'arg' argument is NULL in producer thread. Now, there"
               " is no point in running this program. This program is now"
               " exiting..\n\n");
        exit(1);
    }

    srand((unsigned int)(time(NULL)));

    while (1) {

        num = rand();

        retval = PTHREAD_MUTEX_LOCK(cv_ptr->mutex);

        check_retval_and_exit_on_error(retval, "pthread_mutex_lock() failed in"
                                               " producer thread");

        while (cv_ptr->current_num_items_in_queue == NUM_ITEMS) {

            printf("\nProducer is going to sleep because the queue is full.."
                   "\n\n");
            retval = PTHREAD_COND_WAIT(cv_ptr->cond_var, cv_ptr->mutex);
            check_retval_and_exit_on_error(retval, "pthread_cond_wait() failed"
                                                   " in producer thread");
        }

        cv_ptr->items_queue[current_index_in_queue] = num;
        current_index_in_queue = (current_index_in_queue + 1) % NUM_ITEMS;
        cv_ptr->current_num_items_in_queue++;

        printf("Producer added number %d to the queue. Current number of items"
               " in the queue = %d\n", num, cv_ptr->current_num_items_in_queue);

        retval = PTHREAD_MUTEX_UNLOCK(cv_ptr->mutex);

        check_retval_and_exit_on_error(retval, "pthread_mutex_unlock() failed"
                                               " in producer thread");

        retval = PTHREAD_COND_BROADCAST(cv_ptr->cond_var);

        check_retval_and_exit_on_error(retval, "pthread_cond_broadcast() failed"
                                               " in producer thread");

        // To introduce some randomness, we will do sched_yield() here in some
        // cases.
        to_yield = rand();
        to_yield = to_yield % 100;
        if (to_yield > 25) {
            retval = sched_yield();
        }
        if (retval != 0) {
            printf("\nError: sched_yield() failed in producer thread. The error"
                   " number is: %d\n\n", errno);
        }

    } // end of while (1) loop

    return NULL;

} // end of function producer()

static void *consumer(void *arg)
{

    struct common_vars *cv_ptr = arg;
    int current_index_in_queue = 0;
    int num = 0;
    int to_yield = 0;
    int retval = -1;

    if (arg == NULL) {
        printf("\nError: 'arg' argument is NULL in consumer thread. Now, there"
               " is no point in running this program. This program is now"
               " exiting..\n\n");
        exit(1);
    }

    while (1) {

        retval = PTHREAD_MUTEX_LOCK(cv_ptr->mutex);

        check_retval_and_exit_on_error(retval, "pthread_mutex_lock() failed in"
                                               " consumer thread");

        while (cv_ptr->current_num_items_in_queue == 0) {

            printf("\nConsumer is going to sleep because the queue is empty.."
                   "\n\n");
            retval = PTHREAD_COND_WAIT(cv_ptr->cond_var, cv_ptr->mutex);
            check_retval_and_exit_on_error(retval, "pthread_cond_wait() failed"
                                                   " in consumer thread");
        }

        num = cv_ptr->items_queue[current_index_in_queue];
        current_index_in_queue = (current_index_in_queue + 1) % NUM_ITEMS;
        cv_ptr->current_num_items_in_queue--;

        printf("Consumer removed number %d from the queue. Number of items"
               " remaining in the queue = %d\n", num,
               cv_ptr->current_num_items_in_queue);

        retval = PTHREAD_MUTEX_UNLOCK(cv_ptr->mutex);

        check_retval_and_exit_on_error(retval, "pthread_mutex_unlock() failed"
                                               " in consumer thread");

        retval = PTHREAD_COND_BROADCAST(cv_ptr->cond_var);

        check_retval_and_exit_on_error(retval, "pthread_cond_broadcast() failed"
                                               " in consumer thread");

        // To introduce some randomness, we will do sched_yield() here in some
        // cases.
        to_yield = rand();
        to_yield = to_yield % 100;
        if (to_yield > 25) {
            retval = sched_yield();
        }
        if (retval != 0) {
            printf("\nError: sched_yield() failed in consumer thread. The error"
                   " number is: %d\n\n", errno);
        }

    } // end of while (1) loop

    return NULL;

} // end of function consumer()

int main(void)
{

    struct common_vars cv;
    pthread_t ptid = 0; // producer thread id
    pthread_t ctid = 0; // consumer thread id
    int retval = -1;

    memset(&cv, 0, sizeof(cv));

    cv.mutex = calloc(1, sizeof(*(cv.mutex)));

    if (cv.mutex == NULL) {
        printf("\nError: No memory available. Exiting..\n\n");
        exit(1);
    }

    cv.cond_var = calloc(1, sizeof(*(cv.cond_var)));

    if (cv.cond_var == NULL) {
        free(cv.mutex);
        printf("\nError: No memory available. Exiting..\n\n");
        exit(1);
    }

    retval = pthread_create(&ptid, NULL, producer, &cv);

    if (retval != 0) {
        free(cv.mutex);
        free(cv.cond_var);
        printf("\nError: Could not create producer thread. Exiting..\n\n");
        exit(1);
    }

    retval = pthread_create(&ctid, NULL, consumer, &cv);

    if (retval != 0) {
        free(cv.mutex);
        free(cv.cond_var);
        printf("\nError: Could not create consumer thread. Exiting..\n\n");
        exit(1);
    }

    retval = pthread_join(ptid, NULL);

    if (retval != 0) {
        printf("\nError: Joining on producer thread returned error. Error"
               " number is: %d\n\n", retval);
    }

    retval = pthread_join(ctid, NULL);

    if (retval != 0) {
        printf("\nError: Joining on consumer thread returned error. Error"
               " number is: %d\n\n", retval);
    }

    free(cv.mutex);
    free(cv.cond_var);

    return 0;

} // end of function main()

----------------
ReadMe.txt
----------------

File "pthread_producer_consumer_program.c" uses pthread library to implement a
producer thread and a consumer thread. The producer thread puts items in the
items queue and the consumer thread consumes items from the items queue.

Since the items queue is used by both the producer thread and the consumer
thread, a mutex (from pthread library) is used for synchronization between these
two threads.

A condition variable (from pthread library) is also used for the following two
purposes:

    * If the items queue is full then the producer thread waits on the condition
      variable for the signal from the consumer thread signifying that the items
      queue is no more full because the consumer thread had consumed at least
      one item from the items queue and now the producer thread can again start
      putting item(s) in the items queue.

    * If the items queue is empty then the consumer thread waits on the
      condition variable for the signal from the producer thread signifying that
      the items queue is no more empty because the producer thread had put at
      least one item in the items queue and now the consumer thread can again
      start consuming item(s) from the items queue.

This program should link with the pthread library, so the option -lpthread
should be passed to gcc for compiling this program.

---- End of ReadMe ----
