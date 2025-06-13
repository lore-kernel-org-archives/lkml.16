Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DA22DA747
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749801273; cv=none; b=TF0Kb9tmRfDLTqCB1efT1CjLE/gBvviCQRCFQhXa0nGu7pcffkzWTFwbC2zqFQzUxzr/evWRy0tf3TdEq8/VkHl+tbXVLMlY3S/Q5+2ZT6na0JIZnVz5p7ZD/+QbJfNkavpBcxbv2t3fy8Gy0jNrqe81FkSf896BG6QU7vd5O6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749801273; c=relaxed/simple;
	bh=/ydbkO75fzGLscwLK3Yw2uuWmHPl1Pq9m04VzIquLYs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=cgudAL0olTpsLJKuI4HOqfXhQdP6O6XCwIX0pBBNnHq2xde4NUiD0WX+9fHrxoDNNNrLhIXBLRpiekqItyHIcVvw5B/VK4Lmxtk/NRfACcHgRuyUhoqDrvyXx6BA80cFZ7WduF+WjtfQe7Lc6ptk4771z97oQbPEivaqWgK2etc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/7gpIeE; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/7gpIeE"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-70e3c6b88dbso12513687b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749801270; x=1750406070; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IrUHRxNvC5qvMfk9+A3Zb0lL6rMECA5ZyykCitO0g80=;
        b=l/7gpIeE7/SsdQVEUeFgpOsH71CXStBAo8pjvHdmJ3sG5GjN9dN7OmFbj7k2AJKrxT
         yO/7RCGzTed1n5JgkgYGRNa+IUqInVY/BP6tbvvXEqIQi4yVXGENgN3Z1PoPSahKhSoV
         hvihsvJk9bC9loO/8CSW8e2Sa6IjluZA5Zs7Ct1hwM5cUzKYUCCkuVF9JImoaphRrEjQ
         rFT+YlFqC6IzX5xmbcdkqnFRg9MvwzSLpVLejWvX0GQlcKl5HABus7X5pBB0okVFoZlN
         RNLJp3qi00I0YljOMqjtcWhkecHN7XzZvcFxYip0VVCCoO5dh2j+d9Ancrw7WligWG5k
         vrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749801270; x=1750406070;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IrUHRxNvC5qvMfk9+A3Zb0lL6rMECA5ZyykCitO0g80=;
        b=c5cQbPnumBH9iGosoc+4r4DAVb/ODkTVGlWEW3GxYmPiY5L6mX+fd7/+u6vxoHaG1P
         UawGiUWqkjlOlkrhHhGVI0Ry16x99e+u0QeAi9ga7N68HzVql+01a0iKqnkTLf8tsEPT
         G5vwqDJl9HAbhTT/NeHDYBBLzBY6x1n4RMcywlYwocwzWCuXuYvGkXVkwm/6pWFaZ6kE
         A/dXPN40HvAXzepUifmMrXJZXc2gBoBIqHsNdExH3LaySytX88MVPwBssWDszQ6p6XyR
         9nhxOJRu55ZWlsrJu0vGxd0NdNekaE6hIUo/4NpH/KuMMfnlt7CIaRRIcaksm62YXsId
         wuwQ==
X-Gm-Message-State: AOJu0YzLuwU/Sz4E9ilkEyEL88AYPOjPTnmZktjZLUnkwsEjucrB3q+x
	VVfM0rxrQn1jFExUVfUreJQMWDh0auYf4aVacUFj89pVyQJ+N2c5jCT/l/asOerZPW6dATAD02+
	LgF/6RvP9lTun25CEVBHhyR6W9ZKEVpO2Z0QSzgWQkg==
X-Gm-Gg: ASbGncvjY3ZrEHTSlAhe0a6aI3f13BTkX6FhQjbCG/+S8AprX/mKASIu6Jj4r6ui3Tt
	EIFToUct4iDBWwLz1tr4rvH5WDiScM3Wefzhl0Hb7Abidwix0Om2wIqnaeONUsytKD9YdDTbCp1
	waedzHPZ5Ru93L3B1Yc0kaVlPaD6VCJfui0zm8e8GkozPgIrPEK1LS5ju+ZL+gCccI2y0PpS/61
	7V4fA==
X-Google-Smtp-Source: AGHT+IGWv6jnHW3oq82KZZlgIjYkS1Cs2TxKg0swUyDrqfnyO2Yev8NersGkidaUACQUb6EGcAH5ekQ9j7Xdq+Nejdo=
X-Received: by 2002:a05:690c:368f:b0:710:f46d:cec0 with SMTP id
 00721157ae682-71163605f78mr33626217b3.1.1749801269129; Fri, 13 Jun 2025
 00:54:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Fri, 13 Jun 2025 13:24:17 +0530
X-Gm-Features: AX0GCFvC1-KZ7dAjj639U8_rmfO-UxiX4Qk4TBB4jfoUr-EUzSrPS9sEf3kr1q4
Message-ID: <CAFf+5zi918RpvzgqmeZBJ6OkBOWzXD-KK4fP0nxNzvqXnF7jkQ@mail.gmail.com>
Subject: Generic Doubly Linked List Library (Five Files: generic_doubly_linked_list_library.c,
 generic_doubly_linked_list_library.h, test_generic_doubly_linked_list_library_as_map.c,
 test_generic_doubly_linked_list_library_as_list.c, and ReadMe.txt).
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Generic Doubly Linked List Library (Five Files:
generic_doubly_linked_list_library.c,
generic_doubly_linked_list_library.h,
test_generic_doubly_linked_list_library_as_map.c,
test_generic_doubly_linked_list_library_as_list.c, and ReadMe.txt).

----
"generic_doubly_linked_list_library.c" can be used as a C++ STL list,
map, set,
stack, queue, deque, multimap, multiset, unordered_map, unordered_set,
unordered_multimap, and unordered_multiset (basically as all C++ STL
data
structures except vector).
----

------------------------------------------------
generic_doubly_linked_list_library.c
------------------------------------------------


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

#include "generic_doubly_linked_list_library.h"

#include <stdlib.h>
#include <string.h>

static struct element *gdlll_create_standalone_element(void *data_ptr,
                                                       long data_size);
static void gdlll_remove_element_from_list(struct gdll_container *gdllc_ptr,
                                           struct element *elem_ptr);
static void gdlll_insert_element_before_element(
                            struct gdll_container *gdllc_ptr,
                            struct element *elem_to_insert_ptr,
                            struct element *elem_before_which_to_insert_ptr);

struct gdll_container *gdlll_init_gdll_container(
                            void *function_ptr_to_call_before_deleting_data)
{

    struct gdll_container *gdllc_ptr = calloc(sizeof(*gdllc_ptr), 1);

    if (!gdllc_ptr)
        return NULL;

    gdllc_ptr->first = NULL;
    gdllc_ptr->last = NULL;
    gdllc_ptr->total_number_of_elements = 0;
    gdllc_ptr->call_function_before_deleting_data =
                                    function_ptr_to_call_before_deleting_data;

    return gdllc_ptr;

} // end of gdlll_init_gdll_container() function

long gdlll_get_total_number_of_elements_in_gdll_container(
                                            struct gdll_container *gdllc_ptr)
{

    if (!gdllc_ptr) {
        return 0;
    }

    return (gdllc_ptr->total_number_of_elements);

} // end of gdlll_get_total_number_of_elements_in_gdll_container() function

int gdlll_add_element_to_front(struct gdll_container *gdllc_ptr, void *data_ptr,
                               long data_size)
{

    struct element *elem_ptr = NULL;

    if (!gdllc_ptr) {
        return GDLLL_GDLLC_PTR_IS_NULL;
    }

    if (!data_ptr) {
        return GDLLL_DATA_PTR_IS_NULL;
    }

    if (data_size <= 0) {
        return GDLLL_DATA_SIZE_IS_INVALID;
    }

    elem_ptr = gdlll_create_standalone_element(data_ptr, data_size);

    if (!elem_ptr) {
        return GDLLL_NO_MEMORY;
    }

    if (gdllc_ptr->first == NULL) {
        gdllc_ptr->first = elem_ptr;
        gdllc_ptr->last = elem_ptr;
    } else {
        elem_ptr->next = gdllc_ptr->first;
        elem_ptr->next->prev = elem_ptr;
        gdllc_ptr->first = elem_ptr;
    }

    gdllc_ptr->total_number_of_elements =
                                    gdllc_ptr->total_number_of_elements + 1;

    return GDLLL_SUCCESS;

} // end of gdlll_add_element_to_front() function

int gdlll_add_element_to_back(struct gdll_container *gdllc_ptr, void *data_ptr,
                              long data_size)
{

    struct element *elem_ptr = NULL;

    if (!gdllc_ptr) {
        return GDLLL_GDLLC_PTR_IS_NULL;
    }

    if (!data_ptr) {
        return GDLLL_DATA_PTR_IS_NULL;
    }

    if (data_size <= 0) {
        return GDLLL_DATA_SIZE_IS_INVALID;
    }

    elem_ptr = gdlll_create_standalone_element(data_ptr, data_size);

    if (!elem_ptr) {
        return GDLLL_NO_MEMORY;
    }

    if (gdllc_ptr->first == NULL) {
        gdllc_ptr->first = elem_ptr;
        gdllc_ptr->last = elem_ptr;
    } else {
        gdllc_ptr->last->next = elem_ptr;
        elem_ptr->prev = gdllc_ptr->last;
        gdllc_ptr->last = elem_ptr;
    }

    gdllc_ptr->total_number_of_elements =
                                    gdllc_ptr->total_number_of_elements + 1;

    return GDLLL_SUCCESS;

} // end of gdlll_add_element_to_back() function

int gdlll_add_element_sorted_ascending(struct gdll_container *gdllc_ptr,
                                       void *data_ptr, long data_size,
                                       compare_elements_function comp_func)
{

    struct element *elem_ptr = NULL;

    if (!gdllc_ptr) {
        return GDLLL_GDLLC_PTR_IS_NULL;
    }

    if (!data_ptr) {
        return GDLLL_DATA_PTR_IS_NULL;
    }

    if (data_size <= 0) {
        return GDLLL_DATA_SIZE_IS_INVALID;
    }

    if (!comp_func) {
        return GDLLL_COMPARE_ELEMENTS_FUNC_PTR_IS_NULL;
    }

    elem_ptr = gdlll_create_standalone_element(data_ptr, data_size);

    if (!elem_ptr) {
        return GDLLL_NO_MEMORY;
    }

    if (gdllc_ptr->first == NULL) {
        gdllc_ptr->first = elem_ptr;
        gdllc_ptr->last = elem_ptr;
    } else {
        struct element *temp = gdllc_ptr->first;
        while ((temp) && (comp_func(elem_ptr, temp) > 0)) {
            temp = temp->next;
        }
        // insert elem_ptr before temp
        gdlll_insert_element_before_element(gdllc_ptr, elem_ptr, temp);
    }

    gdllc_ptr->total_number_of_elements =
                                    gdllc_ptr->total_number_of_elements + 1;

    return GDLLL_SUCCESS;

} // end of gdlll_add_element_sorted_ascending() function

int gdlll_add_element_sorted_descending(struct gdll_container *gdllc_ptr,
                                        void *data_ptr, long data_size,
                                        compare_elements_function comp_func)
{

    struct element *elem_ptr = NULL;

    if (!gdllc_ptr) {
        return GDLLL_GDLLC_PTR_IS_NULL;
    }

    if (!data_ptr) {
        return GDLLL_DATA_PTR_IS_NULL;
    }

    if (data_size <= 0) {
        return GDLLL_DATA_SIZE_IS_INVALID;
    }

    if (!comp_func) {
        return GDLLL_COMPARE_ELEMENTS_FUNC_PTR_IS_NULL;
    }

    elem_ptr = gdlll_create_standalone_element(data_ptr, data_size);

    if (!elem_ptr) {
        return GDLLL_NO_MEMORY;
    }

    if (gdllc_ptr->first == NULL) {
        gdllc_ptr->first = elem_ptr;
        gdllc_ptr->last = elem_ptr;
    } else {
        struct element *temp = gdllc_ptr->first;
        while ((temp) && (comp_func(elem_ptr, temp) < 0)) {
            temp = temp->next;
        }
        // insert elem_ptr before temp
        gdlll_insert_element_before_element(gdllc_ptr, elem_ptr, temp);
    }

    gdllc_ptr->total_number_of_elements =
                                    gdllc_ptr->total_number_of_elements + 1;

    return GDLLL_SUCCESS;

} // end of gdlll_add_element_sorted_descending() function

struct element *gdlll_get_front_element(struct gdll_container *gdllc_ptr)
{

    struct element *temp = NULL;

    if (!gdllc_ptr) {
        return NULL;
    }

    if (gdllc_ptr->total_number_of_elements == 0) {
        return NULL;
    }

    temp = gdllc_ptr->first;

    gdlll_remove_element_from_list(gdllc_ptr, gdllc_ptr->first);

    gdllc_ptr->total_number_of_elements =
                                    gdllc_ptr->total_number_of_elements - 1;

    return temp;

} // end of gdlll_get_front_element() function

struct element *gdlll_get_last_element(struct gdll_container *gdllc_ptr)
{

    struct element *temp = NULL;

    if (!gdllc_ptr) {
        return NULL;
    }

    if (gdllc_ptr->total_number_of_elements == 0) {
        return NULL;
    }

    temp = gdllc_ptr->last;

    gdlll_remove_element_from_list(gdllc_ptr, gdllc_ptr->last);

    gdllc_ptr->total_number_of_elements =
                                    gdllc_ptr->total_number_of_elements - 1;

    return temp;

} // end of gdlll_get_last_element() function

struct element *gdlll_get_matching_element(struct gdll_container *gdllc_ptr,
                                           void *data_ptr, long data_size,
                                           compare_elements_function comp_func)
{

    struct element *matching_elem_ptr = NULL;

    if (!gdllc_ptr) {
        return NULL;
    }

    if (!data_ptr) {
        return NULL;
    }

    if (data_size <= 0) {
        return NULL;
    }

    if (!comp_func) {
        return NULL;
    }

    if (gdllc_ptr->total_number_of_elements == 0) {
        return NULL;
    }

    matching_elem_ptr = gdlll_peek_matching_element(gdllc_ptr, data_ptr,
                                                    data_size, comp_func);

    if (matching_elem_ptr == NULL) {
        return NULL;
    }

    gdlll_remove_element_from_list(gdllc_ptr, matching_elem_ptr);

    gdllc_ptr->total_number_of_elements =
                                    gdllc_ptr->total_number_of_elements - 1;

    return matching_elem_ptr;

} // end of gdlll_get_matching_element() function

// This function doesn't check the validity of its arguments. It is the
// responsibility of the calling function to check the arguments it is passing
// to this function.
static struct element *gdlll_create_standalone_element(void *data_ptr,
                                                       long data_size)
{
    struct element *elem_ptr = NULL;

    elem_ptr = calloc(sizeof(*elem_ptr), 1);
    if (!elem_ptr) {
        return NULL;
    }

    elem_ptr->data_ptr = calloc((size_t)(data_size), 1);
    if (!(elem_ptr->data_ptr)) {
        free(elem_ptr);
        return NULL;
    }

    memmove(elem_ptr->data_ptr, data_ptr, (size_t)(data_size));
    elem_ptr->data_size = data_size;

    elem_ptr->prev = NULL;
    elem_ptr->next = NULL;

    return elem_ptr;

} // end of gdlll_create_standalone_element() function

// This function doesn't check the validity of its arguments. It is the
// responsibility of the calling function to check the arguments it is passing
// to this function. This function just removes the element from the list,
// it doesn't decrement total_number_of_elements by 1. Decrementing has to be
// done in the calling function. This function should not be called if the
// number of elements in the container is 0. The calling function should first
// check whether the number of elements in the container is 0 or not.
static void gdlll_remove_element_from_list(struct gdll_container *gdllc_ptr,
                                           struct element *elem_ptr)
{

    if (elem_ptr == gdllc_ptr->first) {
        gdllc_ptr->first = elem_ptr->next;
        if (gdllc_ptr->first == NULL) {
            gdllc_ptr->last = NULL;
        } else {
            gdllc_ptr->first->prev = NULL;
        }
    } else if (elem_ptr == gdllc_ptr->last) {
        gdllc_ptr->last = elem_ptr->prev;
        if (gdllc_ptr->last == NULL) {
            gdllc_ptr->first = NULL;
        } else {
            gdllc_ptr->last->next = NULL;
        }
    } else {
        elem_ptr->prev->next = elem_ptr->next;
        elem_ptr->next->prev = elem_ptr->prev;
    }

    elem_ptr->prev = NULL;
    elem_ptr->next = NULL;

} // end of gdlll_remove_element_from_list() function

// This function doesn't check the validity of its arguments. It is the
// responsibility of the calling function to check the arguments it is passing
// to this function. This function just inserts the element in the list at the
// appropriate place, it doesn't increment total_number_of_elements by 1.
// Incrementing has to be done in the calling function. This function should not
// be called if the number of elements in the container is 0. The calling
// function should first check whether the number of elements in the container
// is 0 or not.
static void gdlll_insert_element_before_element(
                                            struct gdll_container *gdllc_ptr,
                                          struct element *elem_to_insert_ptr,
                             struct element *elem_before_which_to_insert_ptr)
{

    if (elem_before_which_to_insert_ptr == NULL) {

        // add elem_to_insert_ptr to back
        gdllc_ptr->last->next = elem_to_insert_ptr;
        elem_to_insert_ptr->prev = gdllc_ptr->last;
        gdllc_ptr->last = elem_to_insert_ptr;

    } else if (elem_before_which_to_insert_ptr == gdllc_ptr->first) {

        // add elem_to_insert_ptr to front
        elem_to_insert_ptr->next = gdllc_ptr->first;
        elem_to_insert_ptr->next->prev = elem_to_insert_ptr;
        gdllc_ptr->first = elem_to_insert_ptr;

    } else {

        // insert elem_to_insert_ptr before elem_before_which_to_insert_ptr
        elem_to_insert_ptr->next = elem_before_which_to_insert_ptr;
        elem_to_insert_ptr->prev = elem_before_which_to_insert_ptr->prev;
        elem_before_which_to_insert_ptr->prev = elem_to_insert_ptr;
        elem_to_insert_ptr->prev->next = elem_to_insert_ptr;

    }

} // end of gdlll_insert_element_before_element() function

struct element *gdlll_peek_front_element(struct gdll_container *gdllc_ptr)
{

    if (!gdllc_ptr) {
        return NULL;
    }

    return (gdllc_ptr->first);

} // end of gdlll_peek_front_element() function

struct element *gdlll_peek_last_element(struct gdll_container *gdllc_ptr)
{

    if (!gdllc_ptr) {
        return NULL;
    }

    return (gdllc_ptr->last);

} // end of gdlll_peek_last_element() function

struct element *gdlll_peek_matching_element(struct gdll_container *gdllc_ptr,
                                            void *data_ptr, long data_size,
                                            compare_elements_function comp_func)
{

    struct element *elem_ptr = NULL;
    struct element *temp = NULL;

    if (!gdllc_ptr) {
        return NULL;
    }

    if (!data_ptr) {
        return NULL;
    }

    if (data_size <= 0) {
        return NULL;
    }

    if (!comp_func) {
        return NULL;
    }

    if (gdllc_ptr->total_number_of_elements == 0) {
        return NULL;
    }

    elem_ptr = gdlll_create_standalone_element(data_ptr, data_size);

    if (!elem_ptr) {
        return NULL;
    }

    temp = gdllc_ptr->first;

    while ((temp) && (comp_func(elem_ptr, temp) != 0)) {
        temp = temp->next;
    }

    // free the memory allocated in gdlll_create_standalone_element()
    free(elem_ptr->data_ptr);
    free(elem_ptr);

    return temp;

} // end of gdlll_peek_matching_element() function

int gdlll_replace_data_in_matching_element(struct gdll_container *gdllc_ptr,
                                         void *old_data_ptr, long old_data_size,
                                         void *new_data_ptr, long new_data_size,
                                         compare_elements_function comp_func)
{

    struct element *matching_elem_ptr = NULL;
    void *temp_data_ptr = NULL;

    if (!gdllc_ptr) {
        return GDLLL_GDLLC_PTR_IS_NULL;
    }

    if (!old_data_ptr) {
        return GDLLL_DATA_PTR_IS_NULL;
    }

    if (old_data_size <= 0) {
        return GDLLL_DATA_SIZE_IS_INVALID;
    }

    if (!new_data_ptr) {
        return GDLLL_DATA_PTR_IS_NULL;
    }

    if (new_data_size <= 0) {
        return GDLLL_DATA_SIZE_IS_INVALID;
    }

    if (!comp_func) {
        return GDLLL_COMPARE_ELEMENTS_FUNC_PTR_IS_NULL;
    }

    if (gdllc_ptr->total_number_of_elements == 0) {
        return GDLLL_CONTAINER_IS_EMPTY;
    }

    matching_elem_ptr = gdlll_peek_matching_element(gdllc_ptr, old_data_ptr,
                                                    old_data_size, comp_func);

    if (matching_elem_ptr == NULL) {
        return GDLLL_MATCHING_ELEMENT_NOT_FOUND;
    }

    temp_data_ptr = calloc((size_t)(new_data_size), 1);
    if (!temp_data_ptr) {
        return GDLLL_NO_MEMORY;
    }

    // Now, call the call_function_before_deleting_data() for 'data_ptr' of the
    // matching element and then free the 'data_ptr' of the matching element
    if (gdllc_ptr->call_function_before_deleting_data) {
        gdllc_ptr->call_function_before_deleting_data(
                                                matching_elem_ptr->data_ptr);
    }
    free(matching_elem_ptr->data_ptr);

    matching_elem_ptr->data_ptr = temp_data_ptr;
    memmove(matching_elem_ptr->data_ptr, new_data_ptr, (size_t)(new_data_size));
    matching_elem_ptr->data_size = new_data_size;

    return GDLLL_SUCCESS;

} // end of gdlll_replace_data_in_matching_element() function

void gdlll_delete_front_element(struct gdll_container *gdllc_ptr)
{

    struct element *temp_elem_ptr = NULL;

    if (!gdllc_ptr) {
        return;
    }

    temp_elem_ptr = gdllc_ptr->first;

    if (temp_elem_ptr) {
        gdlll_remove_element_from_list(gdllc_ptr, temp_elem_ptr);
        gdlll_delete_standalone_element(gdllc_ptr, temp_elem_ptr);
        gdllc_ptr->total_number_of_elements =
                                    gdllc_ptr->total_number_of_elements - 1;
    }

    return;

} // end of gdlll_delete_front_element() function

void gdlll_delete_last_element(struct gdll_container *gdllc_ptr)
{

    struct element *temp_elem_ptr = NULL;

    if (!gdllc_ptr) {
        return;
    }

    temp_elem_ptr = gdllc_ptr->last;

    if (temp_elem_ptr) {
        gdlll_remove_element_from_list(gdllc_ptr, temp_elem_ptr);
        gdlll_delete_standalone_element(gdllc_ptr, temp_elem_ptr);
        gdllc_ptr->total_number_of_elements =
                                    gdllc_ptr->total_number_of_elements - 1;
    }

    return;

} // end of gdlll_delete_last_element() function

void gdlll_delete_matching_element(struct gdll_container *gdllc_ptr,
                                   void *data_ptr, long data_size,
                                   compare_elements_function comp_func)
{

    struct element *matching_elem_ptr = NULL;

    if (!gdllc_ptr) {
        return;
    }

    if (!data_ptr) {
        return;
    }

    if (data_size <= 0) {
        return;
    }

    if (!comp_func) {
        return;
    }

    if (gdllc_ptr->total_number_of_elements == 0) {
        return;
    }

    matching_elem_ptr = gdlll_peek_matching_element(gdllc_ptr, data_ptr,
                                                    data_size, comp_func);

    if (matching_elem_ptr == NULL) {
        return;
    }

    gdlll_remove_element_from_list(gdllc_ptr, matching_elem_ptr);
    gdlll_delete_standalone_element(gdllc_ptr, matching_elem_ptr);
    gdllc_ptr->total_number_of_elements =
                                    gdllc_ptr->total_number_of_elements - 1;

    return;

} // end of gdlll_delete_matching_element() function

void gdlll_delete_standalone_element(struct gdll_container *gdllc_ptr,
                                     struct element *element_to_delete)
{

    if (!gdllc_ptr) {
        return;
    }

    if (!element_to_delete) {
        return;
    }

    // Call the call_function_before_deleting_data() for 'data_ptr' of
    // 'element_to_delete' and then free the 'data_ptr' of 'element_to_delete'.
    // Then free the 'element_to_delete'.
    if (gdllc_ptr->call_function_before_deleting_data) {
        gdllc_ptr->call_function_before_deleting_data(
                                                element_to_delete->data_ptr);
    }

    free(element_to_delete->data_ptr);

    free(element_to_delete);

    return;

} // end of gdlll_delete_standalone_element() function

void gdlll_delete_all_elements_in_gdll_container(
                                            struct gdll_container *gdllc_ptr)
{

    struct element *temp_elem_ptr = NULL;

    if (!gdllc_ptr) {
        return;
    }

    if (gdllc_ptr->total_number_of_elements == 0) {
        return;
    }

    temp_elem_ptr = gdllc_ptr->first;

    while (temp_elem_ptr) {
        gdlll_delete_front_element(gdllc_ptr);
        temp_elem_ptr = gdllc_ptr->first;
    }

    return;

} // end of gdlll_delete_all_elements_in_gdll_container() function

void gdlll_delete_gdll_container(struct gdll_container *gdllc_ptr)
{

    if (!gdllc_ptr) {
        return;
    }

    gdlll_delete_all_elements_in_gdll_container(gdllc_ptr);

    free(gdllc_ptr);

    return;

} // end of gdlll_delete_gdll_container() function

------------------------------------------------
generic_doubly_linked_list_library.h
------------------------------------------------

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

#ifndef _GENERIC_DOUBLY_LINKED_LIST_LIBRARY_H_
#define _GENERIC_DOUBLY_LINKED_LIST_LIBRARY_H_

// gdlll means generic doubly linked list library.
// gdllc means generic doubly linked list container.
// gdll means generic doubly linked list.

// Everything happened successfully.
#define GDLLL_SUCCESS 0

// 'gdllc_ptr' argument is NULL.
#define GDLLL_GDLLC_PTR_IS_NULL -1

// 'data_ptr' argument is NULL.
#define GDLLL_DATA_PTR_IS_NULL -2

// 'data_size' argument is <= 0.
#define GDLLL_DATA_SIZE_IS_INVALID -3

// There are no elements in the container.
#define GDLLL_CONTAINER_IS_EMPTY -4

// No memory available.
#define GDLLL_NO_MEMORY -5

// Matching element was not found in the list.
#define GDLLL_MATCHING_ELEMENT_NOT_FOUND -6

// The function pointer given by the user for comparing elements is NULL.
#define GDLLL_COMPARE_ELEMENTS_FUNC_PTR_IS_NULL -7

// This is used only for initializing error variables.
#define GDLLL_ERROR_INIT_VALUE -99

struct element
{
    void *data_ptr;
    long data_size;
    struct element *prev;
    struct element *next;
};

/*
 * The user needs to give a function pointer to compare elements in some
 * functions of this library. Below is the signature of the elements comparator
 * function.
 *
 * The return value of this function should be -1 if 'first' is less than the
 * 'second', 0 if 'first' is equal to the 'second', and 1 if 'first' is greater
 * than the 'second'.
 */
typedef int (*compare_elements_function)(struct element *first,
                                         struct element *second);

struct gdll_container
{
    struct element *first;
    struct element *last;
    long total_number_of_elements;
    // This function pointer will be called before freeing 'data_ptr' member of
    // the element structure. This will be needed if the user has allocated some
    // memory in 'data_ptr' and the user wants to free it before the 'data_ptr'
    // member is freed by this library. So, if the user has a need for it then
    // the user can give a valid function pointer to call when initializing this
    // library (by calling the function 'gdlll_init_gdll_container'). The user
    // may also give NULL function pointer if the user doesn't need this
    // functionality.
    void (*call_function_before_deleting_data)(void *data_ptr);
};

struct gdll_container *gdlll_init_gdll_container(
                            void *function_ptr_to_call_before_deleting_data);

// If gdllc_ptr is NULL, then this function returns 0
long gdlll_get_total_number_of_elements_in_gdll_container(
                                            struct gdll_container *gdllc_ptr);

int gdlll_add_element_to_front(struct gdll_container *gdllc_ptr, void *data_ptr,
                               long data_size);

int gdlll_add_element_to_back(struct gdll_container *gdllc_ptr, void *data_ptr,
                              long data_size);

int gdlll_add_element_sorted_ascending(struct gdll_container *gdllc_ptr,
                                       void *data_ptr, long data_size,
                                       compare_elements_function comp_func);

int gdlll_add_element_sorted_descending(struct gdll_container *gdllc_ptr,
                                        void *data_ptr, long data_size,
                                        compare_elements_function comp_func);

// All gdlll_get_* functions remove the element from the list and then return
// the element. If you don't want the element to be removed from the list then
// use gdlll_peek_* functions. If there are no elements in the container
// then NULL is returned.
struct element *gdlll_get_front_element(struct gdll_container *gdllc_ptr);

struct element *gdlll_get_last_element(struct gdll_container *gdllc_ptr);

struct element *gdlll_get_matching_element(struct gdll_container *gdllc_ptr,
                                           void *data_ptr, long data_size,
                                           compare_elements_function comp_func);

// All gdlll_peek_* functions return the element without removing it from the
// list. If there are no elements in the container then NULL is returned.
struct element *gdlll_peek_front_element(struct gdll_container *gdllc_ptr);

struct element *gdlll_peek_last_element(struct gdll_container *gdllc_ptr);

struct element *gdlll_peek_matching_element(struct gdll_container *gdllc_ptr,
                                            void *data_ptr, long data_size,
                                           compare_elements_function comp_func);

int gdlll_replace_data_in_matching_element(struct gdll_container *gdllc_ptr,
                                         void *old_data_ptr, long old_data_size,
                                         void *new_data_ptr, long new_data_size,
                                         compare_elements_function comp_func);

void gdlll_delete_front_element(struct gdll_container *gdllc_ptr);

void gdlll_delete_last_element(struct gdll_container *gdllc_ptr);

void gdlll_delete_matching_element(struct gdll_container *gdllc_ptr,
                                   void *data_ptr, long data_size,
                                   compare_elements_function comp_func);

void gdlll_delete_standalone_element(struct gdll_container *gdllc_ptr,
                                     struct element *element_to_delete);

void gdlll_delete_all_elements_in_gdll_container(
                                            struct gdll_container *gdllc_ptr);

void gdlll_delete_gdll_container(struct gdll_container *gdllc_ptr);

#endif

-------------------------------------------------------------------
test_generic_doubly_linked_list_library_as_map.c
-------------------------------------------------------------------

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

#include "generic_doubly_linked_list_library.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_STR_SIZE 256
#define NUM_ELEMENTS 5

#define ASC  1 // ascending order.
#define DESC 2 // descending order. Any value other than 1 (ASC).

struct mymap {
    char *key_str;
    long val;
};

// function prototypes for gcc flag -Werror-implicit-function-declaration
static char *get_input_from_stdin_and_discard_extra_characters(char *str,
                                                               long size);
static int compare_elems(struct element *first, struct element *second);
static void free_key_str(struct mymap *mm);
static void populate_map(struct gdll_container *gc, struct mymap *mm,
                         long count, int sorting_order);
static void print_key_and_value_without_removing_elements(
                                                    struct gdll_container *gc);
static void print_key_and_value_by_removing_elements(struct gdll_container *gc);
static void populate_and_print_map(struct gdll_container *gc, struct mymap *mm,
                                   long count, int sorting_order);

static char *get_input_from_stdin_and_discard_extra_characters(char *str,
                                                               long size)
{

    int c = 0;
    long i = 0;

    // If 'size' is 0 then this function will discard all input and return NULL.
    // No need to check 'str' if 'size' is 0.
    if (size == 0) {
        // discard all input
        while ((c = getchar()) && (c != '\n') && (c != EOF));
        return NULL;
    }

    if (str == NULL)
        return NULL;

    if (size < 0)
        return NULL;

    for (i = 0; i < (size - 1); i = i + 1) {

        c = getchar();

        if ((c == '\n') || (c == EOF)) {
            str[i] = 0;
            return str;
        }

        str[i] = (char)(c);

    } // end of for loop

    str[i] = 0;

    // discard rest of input
    while ((c = getchar()) && (c != '\n') && (c != EOF));

    return str;

} // end of function get_input_from_stdin_and_discard_extra_characters()

static int compare_elems(struct element *first, struct element *second)
{

    if ((first == NULL) || (second == NULL)) {
        printf("Error: %s(): One or more arguments are NULL. Exiting..\n\n",
               __FUNCTION__);
        exit(1);
    }

    char *i = ((struct mymap *)(first->data_ptr))->key_str;
    char *j = ((struct mymap *)(second->data_ptr))->key_str;

    return strcmp(i, j);

} // end of function compare_elems()

static void free_key_str(struct mymap *mm)
{

    if (mm == NULL) {
        printf("Error: %s(): Argument 'mm' is NULL.\n", __FUNCTION__);
        return;
    }

    //printf("DEBUG: Freeing key_str.\n");

    free(mm->key_str);

    return;

} // end of function free_key_str()

// populate the map
static void populate_map(struct gdll_container *gc, struct mymap *mm,
                         long count, int sorting_order)
{

    struct element *dup_elem = NULL;

    if ((gc == NULL) || (mm == NULL) || (count <= 0)) {
        printf("Error: %s(): One or more arguments are invalid.\n",
               __FUNCTION__);
        return;
    }

    printf("\n");

    printf("---------------------------------------------------\n");
    printf("Please input the data.\n");
    printf("You will be asked to input the data for %ld elements.\n", count);
    printf("The map elements will be stored in \"%s\" order of keys.\n",
            (sorting_order == ASC) ? "ASCENDING" : "DESCENDING");
    printf("---------------------------------------------------\n");

    while (count-- > 0) {

        printf("\n");

        // Don't free mm->key_str. It will be freed by your callback function
        // when the element will be deleted.
        mm->key_str = calloc(MAX_STR_SIZE, 1);
        if ((mm->key_str) == NULL) {
            printf("No memory..Exiting..\n\n");
            free(mm); // free it here as this one isn't in the library yet
            gdlll_delete_gdll_container(gc);
            exit(1);
        }

        mm->val = -1;

        printf("Please enter a valid string (key) (input is not checked): ");
        get_input_from_stdin_and_discard_extra_characters(mm->key_str,
                                                          MAX_STR_SIZE);
        printf("Please enter a valid integer (input is not checked): ");
        scanf("%ld", &(mm->val));
        get_input_from_stdin_and_discard_extra_characters(NULL, 0);
        dup_elem = gdlll_peek_matching_element(gc, mm, sizeof(*mm),
                                               compare_elems);
        if (dup_elem == NULL) {
            if (sorting_order == ASC) {
                gdlll_add_element_sorted_ascending(gc, mm, sizeof(*mm),
                                                   compare_elems);
            } else {
                gdlll_add_element_sorted_descending(gc, mm, sizeof(*mm),
                                                    compare_elems);
            }
        } else { // if you want to replace the exisiting value of the key
            gdlll_replace_data_in_matching_element(gc, dup_elem->data_ptr,
                                 sizeof (*(struct mymap *)(dup_elem->data_ptr)),
                                 mm, sizeof(*mm), compare_elems);
        }

    } // end of while loop

    return;

} // end of function populate_map()

static void print_key_and_value_without_removing_elements(
                                                    struct gdll_container *gc)
{

    struct element *elem = NULL;
    struct mymap *elem_mm = NULL;

    if (gc == NULL) {
        printf("%s(): Argument 'gc' is NULL.\n", __FUNCTION__);
        return;
    }

    printf("\n");

    printf("--------------------------------------\n");
    printf("Printing keys and values from the map without removing the elements"
           " from the map.\n");
    printf("--------------------------------------\n");

    for (elem = gc->first; elem != NULL; elem=elem->next) {
        elem_mm = (struct mymap *)(elem->data_ptr);
        printf("key:%s, value:%ld\n", elem_mm->key_str, elem_mm->val);
    }

} // end of function print_key_and_value_without_removing_elements()

static void print_key_and_value_by_removing_elements(struct gdll_container *gc)
{

    struct element *elem = NULL;
    struct mymap *elem_mm = NULL;

    if (gc == NULL) {
        printf("%s(): Argument 'gc' is NULL.\n", __FUNCTION__);
        return;
    }

    printf("\n");

    printf("--------------------------------------\n");
    printf("Printing keys and values from the map by removing the elements"
           " from the map.\n");
    printf("--------------------------------------\n");

    elem = gdlll_get_front_element(gc);
    while (elem != NULL) {
        elem_mm = (struct mymap *)(elem->data_ptr);
        printf("key:%s, value:%ld\n", elem_mm->key_str, elem_mm->val);
        gdlll_delete_standalone_element(gc, elem);
        elem = gdlll_get_front_element(gc);
    }

} // end of function print_key_and_value_by_removing_elements()

static void populate_and_print_map(struct gdll_container *gc, struct mymap *mm,
                                   long count, int sorting_order)
{

    if ((gc == NULL) || (mm == NULL) || (count <= 0)) {
        printf("Error: %s(): One or more arguments are invalid.\n",
               __FUNCTION__);
        return;
    }

    // populate the map
    populate_map(gc, mm, count, sorting_order);

    printf("\n\n");

    printf("-------------------------------------------\n");
    printf("Total number of elements in the map = %ld\n",
            gdlll_get_total_number_of_elements_in_gdll_container(gc));
    printf("-------------------------------------------\n");

    // print all keys and values from the map without removing the elements
    // from the map
    print_key_and_value_without_removing_elements(gc);

    // print all keys and values from the map by removing the elements
    // from the map
    print_key_and_value_by_removing_elements(gc);

} // end of function populate_and_print_map()

int main (void)
{

    struct gdll_container *gc = NULL;
    struct mymap *mm = {0};
    long count = NUM_ELEMENTS;

    gc = gdlll_init_gdll_container(free_key_str);
    if (gc == NULL) {
        printf("No memory..Exiting..\n\n");
        exit(1);
    }

    // free 'mm' before exiting the program.
    mm = calloc(1, sizeof(*mm));
    if (mm == NULL) {
        printf("No memory..Exiting..\n\n");
        gdlll_delete_gdll_container(gc);
        exit(1);
    }

    // populate and print the map (in ascending order of keys)
    populate_and_print_map(gc, mm, count, ASC);

    printf("\n\n\n");

    // populate and print the map (in descending order of keys)
    populate_and_print_map(gc, mm, count, DESC);

    printf("\n");

    free(mm);

    gdlll_delete_gdll_container(gc);

    return 0;

} // end of function main()

-----------------------------------------------------------------
test_generic_doubly_linked_list_library_as_list.c
-----------------------------------------------------------------

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

#include "generic_doubly_linked_list_library.h"

#include <stdio.h>

// function prototype for gcc flag -Werror-implicit-function-declaration
static int compare(struct element *first, struct element *second);

static int compare(struct element *first, struct element *second)
{
    long i = *(long *)(first->data_ptr);
    long j = *(long *)(second->data_ptr);

    if (i < j) {
        return -1;
    } else if (i == j) {
        return 0;
    } else {
        return 1;
    }

} // end of function compare()

int main (void)
{

    int c = 0;
    long i = 0;
    long count = 5;
    struct element *elem = NULL;

    struct gdll_container * gc = gdlll_init_gdll_container(NULL);

    printf("\n");

    printf("---------------------------------------------------\n");
    printf("Please input the data.\n");
    printf("You will be asked to input the data for %ld elements.\n", count);
    printf("The list elements will be stored in \"DESCENDING\" order.\n");
    printf("---------------------------------------------------\n");

    while (count-- > 0) {
        i = -1;
        printf("\n");
        printf("Please enter a valid integer (input is not checked): ");
        scanf("%ld", &i);
        // discard extra characters from stdin
        while ((c = getchar()) && (c != '\n') && (c != EOF));
        gdlll_add_element_sorted_descending(gc, &i, sizeof(i), compare);
    }

    printf("\n\n");

    printf("Total number of elements in the list = %ld\n\n",
                gdlll_get_total_number_of_elements_in_gdll_container(gc));

    printf("------------------------------\n");
    printf("Printing values from the list:\n");
    printf("------------------------------\n");

    elem = gdlll_get_front_element(gc);
    while (elem != NULL) {
        printf("%ld\n", *(long *)(elem->data_ptr));
        gdlll_delete_standalone_element(gc, elem);
        elem = gdlll_get_front_element(gc);
    }

    printf("\n");

    gdlll_delete_gdll_container(gc);

    return 0;

} // end of function main()

----------------
ReadMe.txt
----------------

"generic_doubly_linked_list_library.c" can be used as a C++ STL list, map, set,
stack, queue, deque, multimap, multiset, unordered_map, unordered_set,
unordered_multimap, and unordered_multiset (basically as all C++ STL data
structures except vector).

For using this library as different C++ STL data structures you have to use
different combinations of functions provided in this library. This library has
only 22 functions (including 3 static functions).

So, now the developers don't need to write code for implementing data
structure(s) (like list, etc.), they can simply use this library and speed up
their development.

Another unique feature of this library is that it copies user's data into its
elements, so the user doesn't have to keep his/her copy of data around. User's
data safely resides in the elements. However, the library can't do deep copy
because it doesn't know whether the user data has pointers. So, the user can
free its top level data but the user should not free embedded pointers. These
embedded pointers will be freed by the user's callback function when an element
is getting deleted.

Example:

Let's say that you have a structure (as shown below) that you are storing in the
element.

struct mydata {
  char *str;
  int val;
}

struct mydata *md = malloc(sizeof(*md));
md->str = malloc(10);
gdlll_add_element_to_front(..., md, ...);
free(md);

Now, you can free 'md' but you should not free 'md->str'. 'md->str' will be
freed by calling your free function (function_ptr_to_call_before_deleting_data)
when the element is getting deleted. This function was provided by you when you
initialized the container:
gdlll_init_gdll_container(void *function_ptr_to_call_before_deleting_data).

I have uploaded the code of the C library (generic_doubly_linked_list_library.c)
and also the code of the test programs that show how to use this library as a
'sorted list' and as a 'map'.


----------------------------------------
The source files in this repository are:

generic_doubly_linked_list_library.c
generic_doubly_linked_list_library.h
test_generic_doubly_linked_list_library_as_list.c
test_generic_doubly_linked_list_library_as_map.c

The functions available in this library are:

gdlll_init_gdll_container()
gdlll_get_total_number_of_elements_in_gdll_container()
gdlll_add_element_to_front()
gdlll_add_element_to_back()
gdlll_add_element_sorted_ascending()
gdlll_add_element_sorted_descending()
gdlll_get_front_element()
gdlll_get_last_element()
gdlll_get_matching_element()
gdlll_peek_front_element()
gdlll_peek_last_element()
gdlll_peek_matching_element()
gdlll_replace_data_in_matching_element()
gdlll_delete_front_element()
gdlll_delete_last_element()
gdlll_delete_matching_element()
gdlll_delete_standalone_element()
gdlll_delete_all_elements_in_gdll_container()
gdlll_delete_gdll_container()

/* static functions */
gdlll_create_standalone_element()
gdlll_remove_element_from_list()
gdlll_insert_element_before_element()
----------------------------------------


----------------------------------------
Some pseudocode for using this library as a 'list' is:

gdlll_add_element_to_front(...);
or,
gdlll_add_element_to_back(...);
...
...
elem = gdlll_get_front_element(...);
or,
elem = gdlll_get_last_element(...);
or,
elem = gdlll_get_matching_element(...);
----------------------------------------


----------------------------------------
Some pseudocode for using this library as a 'sorted list' is:

gdlll_add_element_sorted_ascending(...);
or,
gdlll_add_element_sorted_descending(...);
...
...
elem = gdlll_get_front_element(...);
or,
elem = gdlll_get_last_element(...);
or,
elem = gdlll_get_matching_element(...);
----------------------------------------


----------------------------------------
Some pseudocode for using this library as a 'set' is:


if (gdlll_peek_matching_element(...) == NULL) {
    gdlll_add_element_sorted_ascending(...);
    or,
    gdlll_add_element_sorted_descending(...);
}
----------------------------------------


----------------------------------------
Some pseudocode for using this library as an 'unordered_set' is:


if (gdlll_peek_matching_element(...) == NULL) {
    gdlll_add_element_to_front(...);
    or,
    gdlll_add_element_to_back(...);
}
----------------------------------------


----------------------------------------
Some pseudocode for using this library as a 'map' is:

For using this library as a 'map', etc, your 'data_ptr' must point to a
structure that has a 'key' member and a 'value' member.

struct mymap
{
    char *key;
    int value;
};

struct mymap *mm;
mm = malloc(sizeof(*mm));
mm->key = malloc(10);
strncpy(mm->key, "abcd", 10);
mm->key[4] = 0;
mm->value = 20;

dup_elem = gdlll_peek_matching_element(gc, mm, sizeof(*mm), compare_elems);
if (dup_elem == NULL) {
    gdlll_add_element_sorted_ascending(gc, mm, sizeof(*mm), compare_elems);
} else { // if you want to replace exisiting value of the key
    gdlll_replace_data_in_matching_element(gc, dup_elem->data_ptr,
                               sizeof (*(struct mymap *)(dup_elem->data_ptr)),
                               mm, sizeof(*mm), compare_elems);
}
...
...
elem = gdlll_get_front_element(...);
or,
elem = gdlll_get_last_element(...);
or,
elem = gdlll_get_matching_element(...);
----------------------------------------

---- End of ReadMe ----
