Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B4F9476
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748576405; cv=none; b=uAthDrEwc75XOf2pg0gUZtnrmxBTHjHWvsPg9tN8rqpNVkOaMDpaXLGWcB5o8Gxo/G+mfNvgvs1K+ODSiCpPAvcmpsvgtuZEbu8BQ2Aly+9Ys7YNIFE+tOyfkQWMjlnqUBwkvSohiKIx5SjZwaF5cO2L8kYjYf9B6ccVce5UAVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748576405; c=relaxed/simple;
	bh=GyUV7bLn/HTU22qbvo7UefZxU4nor3RjtCww2BGZTE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=MvRw95XAnL+8tnstmXkpehDHFcEE9zgVbSK8967ZikTEb2cGagoEAS+iBsAb2CuPs632DSPSUcFKt+eVQ08d2lENw7xZxwJzhEDj1acFpIWmoYidhxaxiYvdzv6S+4rTPF4mEp3qNlER0oi7tc1P/YgJmB4MvI8U4h7kV+B67r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aON8EjVJ; arc=none smtp.client-ip=209.85.219.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aON8EjVJ"
Received: by mail-yb1-f193.google.com with SMTP id 3f1490d57ef6-e7dc4e44b47so1475383276.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 20:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748576402; x=1749181202; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xraGzWdvUoorT3tZfXLJVMix4djMGCZ8PFJh4eGegvg=;
        b=aON8EjVJjN04y5hzChZnaaiEtSzq/v1wsKvoOyHnPGXgQkMnhn6vAGVwTTv8KcXSbg
         MAA9KQfrLvIKUEHpusAmmPlWflymGhchY5eU+oyowe8MJCtugsPs+RguY56C0pDO68aN
         WP2ZFlnLCjVAhSRvfrRHQ4I/2xJzVBQIyPNRGBm59g+0V3UJ8ibBJWm+n53MFF0FXStR
         ItF72vo3oo6Kd5uh89GRZiWY1P3nZUJo+IYvtYut30+C+/J7Pg8jTFCmzwABI3MW/7MU
         GB+qCG3gK8ZjUQRH6IgLQbJ+UwGOYLmxfgSjyXwRPOEO3Dk4sFCf7lKX8zP/E8t78eke
         wejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748576402; x=1749181202;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xraGzWdvUoorT3tZfXLJVMix4djMGCZ8PFJh4eGegvg=;
        b=ZBhzcV4uUC18Dnj1HI+IXhGMw4gNa3Lu8aa13zs6fiEAeANueQMxCar7zNAhH0PD/r
         SK059Cx/DA2rEjMFkZase0STIUJj3KWHB6QKZnsHnDL/1pFknPulKkExg4N09O8zZVSy
         PZwtv+GTBi+42NW8TLEqMNojLDs8Q1Z5VpWxBpl113Cfw64dFAHJXhGkVJLGbceanayo
         glWdAMAHxlRDlS0FSs0LJ+1HYBd2pIJiSPUay7bhR2f4ggyKvrvEVFjnndLuyzWnTrkH
         KD11nAelBalP92hb5cs48EeGeaBsPJxXq3qnTl53LetxrT20lHh4IGmZzb53uvt4YdvU
         r9Xg==
X-Gm-Message-State: AOJu0YxxYKYJP+bjo2nu7zVwbdk2Z2Vr5TuOkuzS1UnsOROs+iGVcMMl
	6MnBoNl0/5Kgx0ZGia0TiKRvAMYKWieTkMz8CWGyESN6PglCWaz5mcGIGBWoXKiUQikdLfKrHyZ
	kHFKbhYPc8yW1aS5ndkgvc+JIInh5G3uYFWaQ
X-Gm-Gg: ASbGncseIk/t8HndAEozTjyVd2Obj//ivpJ7pLGP4/4CS8tTRe2s9Qzj9qmocpSY24k
	626yDuI0xQgY1wQ6XizPkDc2lawB86WWliIcN7kvno8phNInY4El+6FfKW7CDxHkieWeTytU3k+
	XG1+dHm0IPnsjG6l1E1FJxkFc8nQ6azr44SJcQ/ovc+y1NM4tI4lksj4dK/7KbaHkewA==
X-Google-Smtp-Source: AGHT+IGtIrwM6ORdneipU3/f3bHIs5e0s0WIUNs89UfXFBEAt53vtfYj5RJogYhubfu2nFN1AniIHPRGOGzVVHCREGs=
X-Received: by 2002:a05:6902:461a:b0:e7d:6791:9c23 with SMTP id
 3f1490d57ef6-e7f81e0bb9emr2787305276.16.1748576401616; Thu, 29 May 2025
 20:40:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFf+5ziWAmgK=nPnh4ndLiefGNXYJqEM7moiq7UAQiui48=Vdw@mail.gmail.com>
In-Reply-To: <CAFf+5ziWAmgK=nPnh4ndLiefGNXYJqEM7moiq7UAQiui48=Vdw@mail.gmail.com>
From: Amit <amitchoudhary0523@gmail.com>
Date: Fri, 30 May 2025 09:09:49 +0530
X-Gm-Features: AX0GCFv3kPbsDZeZTQO0-uZgqShNViD-VRuhuIo1HjrqME6LZp2Y3bwCZMwmylk
Message-ID: <CAFf+5ziw9MZ9VOx27XFy=4B6BwsacvsKDcg7USjqK4wJeYFUwg@mail.gmail.com>
Subject: Simple tcp client and server (Four files: simple_tcp_server.c,
 simple_tcp_client.c, simple_tcp_client_server_common.h, and README).
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Simple tcp client and server (Four files: simple_tcp_server.c,
simple_tcp_client.c, simple_tcp_client_server_common.h, and README).

---------------------------
simple_tcp_server.c
---------------------------

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

#include "simple_tcp_client_server_common.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <sys/socket.h>
#include <arpa/inet.h>

static void print_usage_and_exit(int argc, char *argv[], FILE *out);
static char *get_input_from_stdin_and_discard_extra_characters(char *str,
                                        int size, int min_size, int max_size);
static void recv_and_send(int newsockfd, FILE *out);

static void recv_and_send(int newsockfd, FILE *out)
{

    char msg[MAX_MSG_SIZE] = {0};
    int retval_int = -1;
    char *retval_char_ptr = NULL;

    fprintf(out, "\nWaiting for a message from the client...\n");

    while (1) {

        memset(msg, 0, MAX_MSG_SIZE);

        retval_int = (int)(recv(newsockfd, msg, MAX_MSG_SIZE, 0));

        msg[MAX_MSG_SIZE - 1] = '\0';

        fprintf(out, "\nMessage received from the client: %s\n", msg);

        if (retval_int < 0) { // some error happened
            fprintf(out, "\nError: recv() returned error: %s. Closing the"
                         " server socket.\n", strerror(errno));
            close(newsockfd);
            return;
        }

        if (retval_int == 0) { // client socket is closed
            fprintf(out, "\nError: Client socket is closed. Closing the server"
                         " socket.\n");
            close(newsockfd);
            return;
        }

        fprintf(out, "\nPlease input a message to send to the client(max %d"
                     " characters else the input message will be truncated to"
                     " %d characters): ", MAX_MSG_SIZE - 1, MAX_MSG_SIZE - 1);

        memset(msg, 0, MAX_MSG_SIZE);

        retval_char_ptr = get_input_from_stdin_and_discard_extra_characters(msg,
                                    MAX_MSG_SIZE, MIN_MSG_SIZE, MAX_MSG_SIZE);

        if (retval_char_ptr == NULL) {
            fprintf(out, "\nError: No input received. Sending null byte to the"
                         " client.\n");
            msg[0] = '\0';
        }

        // At this point, msg is null terminated, so strlen can be used safely.
        // Extra 1 byte for null terminating character.
        retval_int = (int)(send(newsockfd, msg, strlen(msg) + 1, 0));

        if (retval_int < 0) { // some error happened
            fprintf(out, "\nError: send() returned error: %s. Closing the"
                         " server socket.\n", strerror(errno));
            close(newsockfd);
            return;
        }

        fprintf(out, "\nMessage sent to the client. Waiting for a message from"
                     " the client...\n");

    } // end of outer while (1) loop

    return;

} // end of function recv_and_send()

int main(int argc, char *argv[])
{

    FILE *out = stdout;
    int sockfd = -1;
    int newsockfd = -1;
    struct sockaddr_in serv_addr, client_addr;
    int client_addr_len = -1;
    int reuse_addr = 1;
    char client_ipv4_address[IPv4_ADDR_LEN] = {0};

    if (argc != 3) {
        print_usage_and_exit(argc, argv, out);
    }

    //create socket
    if((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        fprintf(out, "\nError: Could not create socket: %s. Exiting..\n\n",
                strerror(errno));
        exit(1);
    }

    // Set SO_REUSEADDR on the socket so that the server's address is available
    // immediately to reuse, in case the server restarts or is restarted.
    // Normally, the TCP connection will enter TIME_WAIT/CLOSE_WAIT state on
    // connection close and the server's address will not be available
    // immediately for reuse. But setting SO_REUSEADDR on the socket makes the
    // server's address available immediately for reuse. For setting
    // SO_REUSEADDR, setsockopt() should be called before bind(). Actually, it
    // is best to call setsockopt() just after the socket has been created using
    // the socket() call.
    if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR,
                   (const char *)(&reuse_addr), sizeof(reuse_addr)) < 0) {
        fprintf(out, "\nError: Could not set SO_REUSEADDR on the socket: %s."
                     " Exiting..\n\n", strerror(errno));
        exit(1);
    }

    // fill in the server's address
    memset(&serv_addr, 0, sizeof(serv_addr));
    serv_addr.sin_addr.s_addr = inet_addr(argv[1]);
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons((uint16_t)(atoi(argv[2])));

    // bind the server's address to the socket
    if (bind(sockfd, (struct sockaddr *)(&serv_addr), sizeof(serv_addr)) < 0) {
        fprintf(out, "\nError: Could not bind the server's address to the"
                     " socket: %s. Exiting..\n\n", strerror(errno));
        exit(1);
    }

    // enable sockfd for accepting new incoming connection requests using
    // accept()
    if (listen(sockfd, 5) < 0) {
        fprintf(out, "\nError: listen() call failed: %s. Exiting..\n\n",
                strerror(errno));
        exit(1);
    }

    memset(&client_addr, 0, sizeof(client_addr));
    client_addr_len = sizeof(client_addr);

    while (1) {

        fprintf(out, "\nWaiting for a new connection...\n");

        // accept new incoming connection
        newsockfd = accept(sockfd, (struct sockaddr *)(&client_addr),
                           (socklen_t *)(&client_addr_len));

        if (newsockfd < 0)
        {
            fprintf(out, "\nError: accept() call failed: %s. Exiting..\n\n",
                    strerror(errno));
            exit(1);
        }

        fprintf(out, "\nGot a new connection.\n");

        if (inet_ntop(AF_INET, &client_addr.sin_addr.s_addr,
                      client_ipv4_address, IPv4_ADDR_LEN) != NULL) {
            client_ipv4_address[IPv4_ADDR_LEN - 1] = '\0';
            fprintf(out, "\nClient's IPv4 address: %s\n", client_ipv4_address);
            fprintf(out, "Client's port number: %d\n",
                    ntohs(client_addr.sin_port));
        }

        // communicate with the client
        recv_and_send(newsockfd, out);

    } // end of while(1) loop

    // close the socket
    close(sockfd);

    return 0;

} // end of function main()

static void print_usage_and_exit(int argc, char *argv[], FILE *out)
{

    if (argc != 3) {
        fprintf(out, "\nError: Incorrect usage.\n\n");
        fprintf(out, "USAGE: %s server_ipv4_address server_port_number\n\n",
                argv[0]);
        fprintf(out, "This program takes two arguments. The first is the TCP"
                     " server's IPv4 address and the second is the port number"
                     " on which the TCP server will listen for new"
                     " connections.\n\n");
        fprintf(out, "This program doesn't check the validity of the arguments."
                     " So, please give valid arguments else this program may"
                     " behave in unexpected manner and it may crash also.\n\n");
        fprintf(out, "Please try again. Exiting..\n\n");
        exit(1);
    }

} // end of function print_usage_and_exit()

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
 *      If 'size' is greater than 'max_size' or less than 'min_size' then it is
 *      an error and nothing is read from stdin and NULL is returned.
 */
static char *get_input_from_stdin_and_discard_extra_characters(char *str,
                                        int size, int min_size, int max_size)
{

    int c = 0;
    int i = 0;

    if (str == NULL) {
        return NULL;
    }

    if ((size < min_size) || (size > max_size)) {
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

--------------------------
simple_tcp_client.c
--------------------------

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

#include "simple_tcp_client_server_common.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <sys/socket.h>
#include <arpa/inet.h>

static void print_usage_and_exit(int argc, char *argv[], FILE *out);
static char *get_input_from_stdin_and_discard_extra_characters(char *str,
                                        int size, int min_size, int max_size);
static void send_and_recv(int sockfd, FILE *out);

static void send_and_recv(int sockfd, FILE *out)
{

    char msg[MAX_MSG_SIZE] = {0};
    int retval_int = -1;
    char *retval_char_ptr = NULL;

    while (1) {

        fprintf(out, "\nPlease input a message to send to the server(max %d"
                     " characters else the input message will be truncated to"
                     " %d characters): ", MAX_MSG_SIZE - 1, MAX_MSG_SIZE - 1);

        memset(msg, 0, MAX_MSG_SIZE);

        retval_char_ptr = get_input_from_stdin_and_discard_extra_characters(msg,
                                    MAX_MSG_SIZE, MIN_MSG_SIZE, MAX_MSG_SIZE);

        if (retval_char_ptr == NULL) {
            fprintf(out, "\nError: No input received. Sending null byte to the"
                         " server.\n");
            msg[0] = '\0';
        }

        // At this point, msg is null terminated, so strlen can be used safely.
        // Extra 1 byte for null terminating character.
        retval_int = (int)(send(sockfd, msg, strlen(msg) + 1, 0));

        if (retval_int < 0) { // some error happened
            fprintf(out, "\nError: send() returned error: %s.\n",
                    strerror(errno));
            return;
        }

        fprintf(out, "\nMessage sent to the server. Waiting for a message from"
                     " the server...\n");

        memset(msg, 0, MAX_MSG_SIZE);

        retval_int = (int)(recv(sockfd, msg, MAX_MSG_SIZE, 0));

        msg[MAX_MSG_SIZE - 1] = '\0';

        fprintf(out, "\nMessage received from the server: %s\n", msg);

        if (retval_int < 0) { // some error happened
            fprintf(out, "\nError: recv() returned error: %s.\n",
                    strerror(errno));
            return;
        }

        if (retval_int == 0) { // server socket is closed
            fprintf(out, "\nError: Server socket is closed.\n");
            return;
        }

    } // end of outer while (1) loop

    return;

} // end of function recv_and_send()

int main(int argc, char *argv[])
{

    FILE *out = stdout;
    int sockfd = -1;
    struct sockaddr_in server;

    if (argc != 3) {
        print_usage_and_exit(argc, argv, out);
    }

    fprintf(out, "\n");

    //create socket
    if((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        fprintf(out, "\nError: Could not create socket: %s. Exiting..\n\n",
                strerror(errno));
        exit(1);
    }

    // fill in the server's address
    memset(&server, 0, sizeof(server));
    server.sin_addr.s_addr = inet_addr(argv[1]);
    server.sin_family = AF_INET;
    server.sin_port = htons((uint16_t)(atoi(argv[2])));

    fprintf(out, "Initiating connection with the server...\n");

    // connect to server
    if (connect(sockfd, (struct sockaddr *)(&server), sizeof(server)) < 0) {
        fprintf(out, "\nError: Could not connect to server: %s. Exiting..\n\n",
                strerror(errno));
        exit(1);
    }

    fprintf(out, "\nConnected with the server...\n");

    // communicate with the server
    send_and_recv(sockfd, out);

    // close the socket
    fprintf(out, "\nClosing the client socket.\n\n");

    close(sockfd);

    return 0;

} // end of function main()

static void print_usage_and_exit(int argc, char *argv[], FILE *out)
{

    if (argc != 3) {
        fprintf(out, "\nError: Incorrect usage.\n\n");
        fprintf(out, "USAGE: %s server_ipv4_address server_port_number\n\n",
                argv[0]);
        fprintf(out, "This program takes two arguments. The first is the TCP"
                     " server's IPV4 address and the second is the port number"
                     " on which the TCP server is listening for new"
                     " connections.\n\n");
        fprintf(out, "This program doesn't check the validity of the arguments."
                     " So, please give valid arguments else this program may"
                     " behave in unexpected manner and it may crash also.\n\n");
        fprintf(out, "Please try again. Exiting..\n\n");
        exit(1);
    }

} // end of function print_usage_and_exit()

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
 *      If 'size' is greater than 'max_size' or less than 'min_size' then it is
 *      an error and nothing is read from stdin and NULL is returned.
 */
static char *get_input_from_stdin_and_discard_extra_characters(char *str,
                                        int size, int min_size, int max_size)
{

    int c = 0;
    int i = 0;

    if (str == NULL) {
        return NULL;
    }

    if ((size < min_size) || (size > max_size)) {
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

-------------------------------------------------
simple_tcp_client_server_common.h
-------------------------------------------------

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

#ifndef _SIMPLE_TCP_CLIENT_SERVER_COMMON_H_
#define _SIMPLE_TCP_CLIENT_SERVER_COMMON_H_

#define IPv4_ADDR_LEN 16 // includes null terminating character

#define MAX_MSG_SIZE 1024 // includes null terminating character

#define MIN_MSG_SIZE 1 // includes null terminating character

#endif

-------------
README
-------------

File simple_tcp_client.c implements a simple tcp client and file
simple_tcp_server.c implements a simple tcp server.

Both programs take the same two arguments: server's IPv4 address and the
server's port number on which the server will/is listen/listening for new
connections.

The user can connect the server and the client and then send messages to each
other.

Although the tcp server runs in an infinite loop, it accepts only one connection
at a time and communicates with that client only at a time. Only when this
client closes the connection, then the tcp server will accept another
connection.

However, when you try to connect the second client to the server, the
connection will succeed but you won't be able to send/recv messages to/from the
server. The second client will connect to the server because the linux kernel
will complete TCP's 3-way handshake between the client and the server and then
put this connection in the server's backlog queue for the sever to accept. But
this tcp server won't accept any new connection until the current client has
closed the connection, so the second client won't be able to communicate with
the server. Same will be the case for all other clients.

---- End of README ----
