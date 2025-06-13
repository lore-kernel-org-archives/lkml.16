Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E721F417F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749794435; cv=none; b=iaXg5/mado1KaqwaV/JSd2/wPNovd7KKYeR95cGfU/TG7RfHdLKJLbXy1yLgWtRApRKS3RU0wgOHUdt3Se2zcHT6jhIP5XEk0Sugx9ygxhY+joxsxua5sr89ezy/Cy6zOs/vYdzOnHRg8UZDU7ZLrg26F7l5olgNHoJ84DQ1kpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749794435; c=relaxed/simple;
	bh=Qcyg4oKXmveRRL5/wUGf6i4AqWso+juS7205KjxaqMY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=AJcwbzHNSAYX2CLMvkC/WpxSKWJX93Si9PgW4lg6YNKUzB5XEIBus1jOKQqm+pabtQGlHoC27/8Ov+QWVpfFnc95GK4jmLX4pI+UftGw1iKcBn1fSNAcPAJNeBXLPSiwsVPlFQr7pN3GpTg6JRNzEs9PoyYAGqg1jSDFNs1VWQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRml+Df0; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRml+Df0"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-70f862dbeaeso17609827b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749794432; x=1750399232; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UdAuus+V3ncYAWQ1nX9T/ixpywkErDlu57Fpe1EDJJw=;
        b=CRml+Df0nkj4ubPPuv6JEg/3h1eu+x7tI9Y7LtZPahrZafXG1UI/n78Qpg+Mxq0MeF
         fgf/OiJALn+IDrv0x6VwDpdGOcvcHlmmcHl9y54NmRuvXoCEUrq5RnkvbqS49EabZQIX
         YU4s7ieV7iT7P9vrcbDbm5Z+QGeB0hqm/9bBvjrX/NfpQn/7ik3g6eI8BQL06uousWi8
         53MfoujUUj3fXlQQZLkaQrFXkFu8KrD+7cbjGHZ7+HNpSHzIrKOKLqyPmrlshYDzvpfG
         yU4ad9+MMcRuFCGy0WOXxr4Bj12YZyu7lT+gO2cx9jKU4xsbn7bxzTCjX7P9aV1x354I
         gJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749794432; x=1750399232;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UdAuus+V3ncYAWQ1nX9T/ixpywkErDlu57Fpe1EDJJw=;
        b=lTz5OOwIHtOeXWpW0K+oxAqI9r885GnrIZucG6fGCjHeDto08BgQBqN8HjpXJU0LSQ
         LDxx23RyyyeATkZ8nQ1iurGyv2kmRB6OYX6uovucFTjEol9wFy5+E76CmZ2T56CEKwLQ
         9QvWk8+esFNrA4dKuPjyqt7eR3a7bISO8tbRKIzML2NWqPJaR7U85NRmTt4h34gGwGY1
         /yoKUgm3fKN9N1iF+Ox9vt61p2M8BCol7YqIE0bI2EeI69pJo+uW7vFCd3DEYPrJfi6J
         c7YiOldGtRnKAPJmUslOojtVYqLSLEmt0UGmVBuXyIbeJ7mk1JdWqixNFYFAiwbPuOrr
         39XQ==
X-Gm-Message-State: AOJu0YxdVDMRg2akmJ+atzdFTiA4ZpOLWP/vpZ75mwHI0+rxKoeo05tQ
	Yj9EwWm/Am0JBaEDWTLxCEgQ4S3HUXrzh1y4MSeqDl6Xx21PUCmZ56pqWYDx0lRGilOTNkCdC+I
	JU9tda62wKsgce24tiaSvoPWQRKOvrIoDy1gwemKhdg==
X-Gm-Gg: ASbGncvBxZxSY9/eVS21R4QvD4xcGDTC14K65GbgOlQNOXJUBwHqZLjIXgM0ptOi/1v
	BDA1zNSD2+kU7cdFu8P9ySU9y8/gUaLslSv2YNGYxWpgPHUHWj3LRT16JW4yHq9MCgg+Cu5+/2j
	k7PYOdRR3w1u0OgX/OT0h1gsqGxk3z4N3oJWNveNJmvtRLMiLPoxOYZ2rVshFTfi9TQx+/yoZDO
	jS8SQ==
X-Google-Smtp-Source: AGHT+IFbhyQqdbWhnNzRMg4pYVKmK1pv6V6c5WK48+TJXR56fumijHPMZ501J2kQ9t2Yr8KVIGxN1KmwPmkHJ6KiIlk=
X-Received: by 2002:a05:690c:6e03:b0:70c:90af:154 with SMTP id
 00721157ae682-711637a827emr28517537b3.20.1749794431687; Thu, 12 Jun 2025
 23:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Fri, 13 Jun 2025 11:30:20 +0530
X-Gm-Features: AX0GCFtJ7yuG4pgAOltHo0eRleJPYwkEXHy0zwRK2BbgTF0rPMEClbAGVnFj1lE
Message-ID: <CAFf+5zgks3YqBph7UhXhGn8JKwK6005eNXY-eG077UvQLxmE2A@mail.gmail.com>
Subject: Check that lengths of lines in a file don't exceed 80 characters (Two
 files: check_line_length_80_characters.c and ReadMe.txt).
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Check that lengths of lines in a file don't exceed 80 characters (Two
files: check_line_length_80_characters.c and ReadMe.txt).

-----------------------------------------------
check_line_length_80_characters.c
-----------------------------------------------


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
 * Description of this program:
 *
 *  This program takes a file as an argument (only one file) and then reads this
 *  file line by line and checks whether the length of the lines is at most 80
 *  characters or not. If some line's length is more than 80 characters then the
 *  line number is printed on the output screen. Also, the total number of lines
 *  having more than 80 characters is also printed at the end of the output.
 */

#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <stddef.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define NEW_LINE '\n'

#define NO_ERROR 0 // no error happened.
#define INVALID_FD -1 // fd is less than 0.
#define NO_MEMORY -2 // memory not available.
#define FILE_LSEEK_ERROR -3 // error in seeking file

#define BUF_SIZE_INCREMENT 1024

// function prototypes for gcc flag -Werror-implicit-function-declaration
static char *get_line_from_file(int fd, int *error_num);

static char *get_line_from_file(int fd, int *error_num)
{

    char *buf = NULL;
    char *buf_temp = NULL;

    long curr_buf_size = 0;
    long curr_data_len = 0;

    ssize_t bytes_read = -1;
    int end_of_file_reached_or_error = 0;
    int new_line_found = 0;
    long i = 0;

    if (error_num == NULL) {
        printf("\nError: Argument 'error_num' is NULL.\n");
        return NULL;
    }

    *error_num = NO_ERROR;

    if (fd < 0) {
        printf("\nError: Argument 'fd' is less than zero.\n");
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

} // end of function get_line_from_file()

int main(int argc, char *argv[])
{

    int fd = -1;
    char *line = NULL;
    long line_num = 0;
    long printed = 0;
    int error_num = 0;

    if (argc != 2) {
        printf("\n");
        printf("Error: Incorrect usage.\n");
        printf("\n");
        printf("This program takes only one argument which is the name of a"
               " file whose line lengths have to be checked.\n");
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

    printf("\n");

    while ((line = get_line_from_file(fd, &error_num)) != NULL) {

        line_num = line_num + 1;

        if (strnlen(line, 81) == 81) {
            printed = printed + 1;
            printf("The length of the line at line number %ld is greater than"
                   " 80 characters.\n", line_num);
        }

        free(line);

    } // end of while loop

    if (printed) {
        printf("\nTotal %ld lines have a length of more than 80"
               " characters.\n\n", printed);
    } else {
        printf("No lines have a length of more than 80 characters.\n\n");
    }

    if (error_num != 0) {
        printf("\n\nError happened: Error number = %d\n\n", error_num);
    }

    close(fd);

} // end of function main()

----------------
ReadMe.txt
----------------

This program takes a file as an argument (only one file) and then reads this
file line by line and checks whether the length of the lines is at most 80
characters or not. If some line's length is more than 80 characters then the
line number is printed on the output screen. Also, the total number of lines
having more than 80 characters is also printed at the end of the output.

---- End of ReadMe ----
