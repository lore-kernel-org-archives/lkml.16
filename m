Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF7A846F
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 03:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746846252; cv=none; b=jtnnkEfvN5CDh6iWZc9JVDDl1n75tc5iHwZXRj+lp+ZxNOoLyCMbVLKhi29dfrkpnpjoPDL2nKADQou1C9BAqg/3xLt4FP5yWG6Faucuebwq26LLHs78igFZu94f5UFo9Opi/Yy04diDGt7cgl/3NqKZ/MFkMhVZ2egYIGWG9K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746846252; c=relaxed/simple;
	bh=/ChQVtuifeLvNV+OhKSlhnIYf69DETTiawf9vc6SbIA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=joPmCoiqdos1UsRZ4eN8MHCrVHI02alqFYXMCkmg2j2sAeHlzEqVfUuduDqAQPebx/cdKpiliGwqqcXYEBa33uBhndkAyeH7yeCdl2rewl3eUwb7tPzhZLlfhoxF4tz7SD9hH8Nmy1UhJ9hb+YTjGsGAnUKOomKGBRZo/Nj6U9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhvXiebJ; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhvXiebJ"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-707d3c12574so23412137b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 20:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746846248; x=1747451048; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kYu/LA9AjdzrzJtWOjQsn3xYZ0icjSffhzd9xey+Pos=;
        b=EhvXiebJDgtdYS4AvLLv1Pp3kFjET7ukBFnxNcqIrM2BqmzvLnqSno3NU7VkE+niR2
         F9LpQfqiCQTFTQR7j1FiF6aZuPGILTAfOzf/QMXLqNnUetX9wAEG9VLR2SS7pS2rj15h
         8BfvMOsXJsTQ59zn4rwNy8pYWjb5qPj4m8iYu1NC607LECQPfhixt3BfZAm/Vglly1QD
         lcuBVCO/6j95BQ5z2Hdzy9fwisrOE+A7i384FKZ7StI7Y6bjJ0zPM0tPX999I+nYMzGy
         kSfgJ9qUrriygvfKeZ/Tb6XQWfIlhBf7L+GZmJoK8Xq2Nlim+KJWCtseWuloyUHHCN6T
         hWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746846248; x=1747451048;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYu/LA9AjdzrzJtWOjQsn3xYZ0icjSffhzd9xey+Pos=;
        b=tiC+kDpphhNFr32xs2LX/P2wmmkMYaYpiXlglLlTYhxerOe4V21wVqJCkSlXEJ+Gig
         Q0WKF7DU4NhIxDdHmzrpTGcDH5E3bEJIPYkjBUQNP4BvfBIhS16LR3TlKpHpp/P9eesp
         jUj//mRIZWHAgkuMGfbYANwZIOjlB+nJIro0k7tk4jskGJn1xdVDzpZqfYOE1CvzD7Eg
         +qgcWz5VNjIwN7SbQgKr4a53cUUmOpIIvNhK20WWjNc8GfxvKH3DM9Wtqz9IZEnlTA4W
         XVIWBAWZ2d+U91k/bsVO9HYD6R1VUDlVnC/XnQHS7wEUs+NklRVxcPTZTm6izNBvRZ5N
         EFAA==
X-Gm-Message-State: AOJu0Yy6JJLVyN7IdANKz8kH6h4od68nYNnd/lKhKAsbCVgSjRi+2Oqq
	tg9i3oM8B8oz4XJKBhblVHPh99I6+0RFlHuIADX6POmruzKXXKJAG9WpX+IoqKEv7hIXGTQ8ZS3
	cjrMHdr0gsXWZKN3ea4D640MJm4hKcrcIZxc=
X-Gm-Gg: ASbGncs9QuLaEMTleZ4Bwg+jdlIlIj3JLKHGZkO7qH7ICXOS/4TVxWu5e2KDV0J6dan
	JeIfwhQjyb5TALW6i5S9Hkh+ptOcW2o2ixDk6PWipgvpfovzozA1NEMUDesqJgaKnKx0b9qNEyU
	FnqCEoroTl7jsZ70vGkXNUjMrML56qniC8jknZr0wDLII+Y0UeO77ZYUn/X9sr9lynagIcRwOR
X-Google-Smtp-Source: AGHT+IHYxWhcpzljKG176acccY/5Q5mZL3/FlioJ5Lu9FcHW4hnklmyM+bFvbCUaE1xPFA9SRG8S+b/A4zlZFHxb3hI=
X-Received: by 2002:a05:690c:3749:b0:703:b8f7:a653 with SMTP id
 00721157ae682-70a2cae3e9emr142830437b3.9.1746846247819; Fri, 09 May 2025
 20:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Sat, 10 May 2025 08:33:57 +0530
X-Gm-Features: AX0GCFvg3HSQUhh4rq3BJfkJi18qjXTF10jsYbKeEq8Y1dvQ3ncSFyKGrjdZU5U
Message-ID: <CAFf+5zivvBhC3xjU0Eottf=BEJicH_DQeZhgN7-0OG2B9m=_rg@mail.gmail.com>
Subject: Alternate implementation of C standard library's getline() function
 which is much simpler to use than getline().
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

File get_line_from_file.c implements a function get_line_from_file() which is
an alternate implementation of C standard library's getline() function and this
function is much simpler to use than getline().

There are three files and their contents are listed below:

--------------------
get_line_from_file.c
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

#include "get_line_from_file.h"

#include <stddef.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>

#define NEW_LINE '\n'

#define BUF_SIZE_INCREMENT 1024

char *get_line_from_file(int fd, int *error_num)
{

    char *buf = NULL;
    char *buf_temp = NULL;

    long curr_buf_size = 0;
    long curr_data_len = 0;

    ssize_t bytes_read = -1;
    int end_of_file_reached_or_error = 0;
    int new_line_found = 0;
    long i = 0;

    *error_num = NO_ERROR;

    if (fd < 0) {
        *error_num = INVALID_FD;
        return NULL;
    }

    while (1) {

        buf_temp = buf;

        buf = realloc(buf, (size_t)(curr_buf_size + BUF_SIZE_INCREMENT));

        if (!buf) {
            free(buf_temp);
            *error_num = NO_MEMORY;
            return NULL;
        }

        curr_buf_size = curr_buf_size + BUF_SIZE_INCREMENT;

        // read data from file
        while (curr_data_len != curr_buf_size) {

            bytes_read = read(fd, buf + curr_data_len,
                              (size_t)(curr_buf_size - curr_data_len));

            if (bytes_read == 0) { // end of file reached
                // Check if no bytes were read earlier also in this call to
                // get_line_from_file(). If yes, then this means that end of
                // test file was reached (but not actually read) in the last
                // call to get_line_from_file(). So, this time end of file was
                // read and 0 was returned by read. So, since there are no bytes
                // to process, free the buffer and return NULL.
                if (curr_data_len == 0) {
                    free(buf);
                    return NULL;
                }
            } // end of if bytes_read == 0

            if (bytes_read <= 0) {
                end_of_file_reached_or_error = 1;
                break;
            } // end of if bytes_read <= 0

            curr_data_len = curr_data_len + bytes_read;

        } // end of inner while (1) loop

        new_line_found = 0;

        for (i = 0; i < curr_data_len; i++) {
            if (buf[i] == NEW_LINE) {
                buf[i] = 0;
                new_line_found = 1;
                break;
            }
        } // end of for loop

        if (new_line_found) {

            // realloc and seek
            buf_temp = buf;

            buf = realloc(buf, (size_t)(i + 1));

            if (!buf) {
                free(buf_temp);
                *error_num = NO_MEMORY;
                return NULL;
            }

            if (lseek(fd, (i + 1) - curr_data_len, SEEK_CUR) < 0) {
                *error_num = FILE_LSEEK_ERROR;
                free(buf);
                return NULL;
            }

            return buf;

        } else { // new line not found

            // NEW_LINE not found and end of file has been reached or some
            // error happened. So, allocate one extra byte for terminating
            // null byte and return.
            if (end_of_file_reached_or_error) {

                buf_temp = buf;

                buf = realloc(buf, (size_t)(curr_data_len + 1));

                if (!buf) {
                    free(buf_temp);
                    *error_num = NO_MEMORY;
                    return NULL;
                }

                buf[curr_data_len] = 0;

                return buf;

            } // end of if end_of_file_reached_or_error

        } // end of if - else (new_line_found)

    } // end of outer while (1) loop

} // end of get_line_from_file

--------------------
get_line_from_file.h
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

#ifndef _GET_LINE_FROM_FILE_H_
#define _GET_LINE_FROM_FILE_H_

#define NO_ERROR 0 // no error happened.
#define INVALID_FD -1 // fd is less than 0.
#define NO_MEMORY -2 // memory not available.
#define FILE_LSEEK_ERROR -3 // error in seeking file

/*
 * char *get_line_from_file(int fd, int *error_num):
 *
 * Function get_line_from_file() is an alternate implementation of C standard
 * library's getline() function and this function is much simpler to use than
 * getline().
 *
 * Function get_line_from_file() returns a line from the file represented by fd.
 *
 * This function supports only regular files (no pipes, sockets, etc).
 *
 * If fd is less than 0 then NULL is returned and *error_num is assigned the
 * appropriate error value (INVALID_FD in this case).
 *
 * In case of any error, *error_num is assigned the appropriate error value.
 *
 * The high level algorithm of this function is:
 *
 *      The function get_line_from_file() reads some bytes in a buffer from the
 *      file and tries to find the newline in the buffer. If the newline is not
 *      found then it reads more bytes from the file in the buffer. When the
 *      newline is found in the buffer, then the newline is replaced with the
 *      null terminating character and the buffer is reallocated to the correct
 *      size. Then the file offset for reading is set to the start of the next
 *      line. And then the buffer is returned to the user.
 *
 * Please note that the returned line/buffer doesn't contain any newlines.
 *
 * The line/buffer returned by this function is allocated using realloc(),
 * so it is user's responsibility to free the line (free memory).
 */

char *get_line_from_file(int fd, int *error_num);

#endif

-------------------------
test_get_line_from_file.c
-------------------------

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

#include "get_line_from_file.h"

#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{

    int fd = -1;
    char *line = NULL;
    int error_num = 0;

    if (argc != 2) {
        printf("\n");
        printf("Error: Incorrect usage.\n");
        printf("\n");
        printf("This program takes only one argument which is the name of a"
               " file whose contents have to be printed.\n");
        printf("\n");
        printf("Usage: %s file_name\n", argv[0]);
        printf("\n");
        printf("Please try again. Exiting..\n");
        printf("\n");
        exit(1);
    }

    fd = open(argv[1], O_RDONLY);

    if (fd < 0) {
        printf("\n%s: File \"%s\" could not be opened. Exiting..\n\n",
               __FILE__, argv[1]);
        exit(1);
    }

    while ((line = get_line_from_file(fd, &error_num)) != NULL) {
        printf("%s\n", line);
        free(line);
    }

    if (error_num != 0) {
        printf("\nError number returned = %d\n\n", error_num);
    }

    close(fd);

} // end of function main()
