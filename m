Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E392D1907
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747956228; cv=none; b=igIsnVFBBRL+4urt3dw5yms65MQezU6hsntTP2oACY0TzfyhKGxe/eT8dGWl2SU70z8XGw7SYDWQsXx8D6O79YH2aEiR1/fW1DtgylH4erxiT4MjUqX7Hxx68ggrpKdXH91howjDr1D3LLfSisx8he9Gl1vL+ihbKuXehX2tj64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747956228; c=relaxed/simple;
	bh=8gmTxxIKyNVvPjoxt7c3wTrEiQthfgWCjYlGk2A+EYY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RqSiBgZqgytEhp4+1n28uKbCjm5ZTMk54BCq606+vCdgncvjEo0TGmGiwgq1inzlpBWkSG44mRRNjINr2fcirlUtGv06bfEZiK8EPnYY57Kspec43P02X+XaSURnUEb2j7NmRQ2GiiKZj2Z9dL35PT+GdY23nYZiqMSCjNDt7Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQf7yuff; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQf7yuff"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4dfa28eb4d8so222274137.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747956223; x=1748561023; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7KcXJ2DPXzVq8lrbGJG0sVpjLOo+LOMnIxDXjO83xdY=;
        b=mQf7yuffMtM4/f07y6VMAOmVPO/7xhqEPguoPtb7EHMMuDlcCokvOb6+IA68fpKBOI
         4og6nzbkCPRkJO1YC0zTlILvZCIVxAQbPTspiq2RuOfB3STpPU3pSMOSCee2pXt+lkjR
         XNCPM4IIoT1SXbyP0acI9VuRss5wgfQaHM2vtW7LqG+XcpE7eUb1cqhjUMRZIuTVRWy/
         giVXHmwqRdT0EIJ9BdkyE8wp3VVx41vxX5dGVwhv38iPq8fkpqJPyb6UyytlPvO+CFOW
         uOwOy8Pa2nB7xXaO3WS4UKxXwm3IjtWPMca24roj+62ZHkN45CSs9lcZalVm5SaGGhay
         laGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956223; x=1748561023;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KcXJ2DPXzVq8lrbGJG0sVpjLOo+LOMnIxDXjO83xdY=;
        b=GoRldXHwspD0fyo3dogcH2buWmVAWPwSSPqdsCaQ6rAcNJo9c5Kqubhj5wHJzirOsl
         BCeVxdd4fIg7+0BXO+2iAXWoXAaqiklFsDLsPPm9jorTPHxsN/B4nGFVH4aJgT54oJaw
         qZpMMJjdJvsp3KfTXgE6FfvLqVVhnosTEh3zbhougxLh7ZZu4eaFDsOJLa4LAM/wqPqY
         pQSWef0ruRoPbLawMYulWzxAMunolNsodB9qe+IhHy9fH7t8KDDF2hmx3ew94sLbb2cX
         fW31Ab4J9Bvpb8+GQpwvmYX5SnmpEDp0KO+D/Z2kBodOUJBU8uYpeKzP6IyserbHagne
         UKSw==
X-Forwarded-Encrypted: i=1; AJvYcCWn4I5/7jXT0d3V7j0psicPGN31x1Ji8R+nyIE7ZC+M9Pbe5lDhdFL/wcK7wTOQTImDTCWoSmF3CZF60YM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwx/Vv0OmbKr7P9SFBCRilsSrhRMpIQzLWbm5LrmDQmhb6LJcl
	9ZJmednzFm2Z4S+uLCLhHIUvQ1wFPAQkR5bLfqhqzWyLB95X2y6RiJ/vHzuDGUyStmkk6wXUxYq
	O3wev7KLn4Y8GE6ow8u45V09IlE7gpB4=
X-Gm-Gg: ASbGncsMRQXsDrnXOTb6OIZc8f5vLFJxhgwnVXJNM7UtGQVOLj4NnaI7bTFrs/cwR/j
	iDdXZXppBFrs04Hb6qXGmfwkaiG382PcUMek0KhlEYA1tkH+estlBIuaSFVGaUncpSrTppTVvYR
	9/3KBGxIVpEMAA4+LSdAzlbIr2Pe2tdrpkbyt8QeiHfUEa
X-Google-Smtp-Source: AGHT+IGmburMNxf5+RZRib//J9NiriQvjFKR67a4FB0siQW6JID4SPlBV2vhYBtofNCs8QPDpbCL8gcw7p/I3zA7Ivs=
X-Received: by 2002:a05:6102:32d3:b0:4da:fd05:ab54 with SMTP id
 ada2fe7eead31-4e2f084e683mr1736684137.10.1747956223271; Thu, 22 May 2025
 16:23:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 23 May 2025 11:23:31 +1200
X-Gm-Features: AX0GCFt1qCsNq-elq-LrmaW6O194sA1P-LLSdIo3pdhE2DulCnlX_0nm5pUCwP0
Message-ID: <CAGsJ_4zMNaNjRXbtDD6xYfDhckcDCnTvv+4-yB1xpuYcur=fyw@mail.gmail.com>
Subject: [BUG]userfaultfd_move fails to move a folio when swap-in occurs
 concurrently with swap-out
To: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
	Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra <lokeshgidra@google.com>, 
	Andrea Arcangeli <aarcange@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>, 
	Kairui Song <ryncsn@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi All,

I'm encountering another bug that can be easily reproduced using the small
program below[1], which performs swap-out and swap-in in parallel.

The issue occurs when a folio is being swapped out while it is accessed
concurrently. In this case, do_swap_page() handles the access. However,
because the folio is under writeback, do_swap_page() completely removes
its exclusive attribute.

do_swap_page:
               } else if (exclusive && folio_test_writeback(folio) &&
                          data_race(si->flags & SWP_STABLE_WRITES)) {
                        ...
                        exclusive = false;

As a result, userfaultfd_move() will return -EBUSY, even though the
folio is not shared and is in fact exclusively owned.

                        folio = vm_normal_folio(src_vma, src_addr,
orig_src_pte);
                        if (!folio || !PageAnonExclusive(&folio->page)) {
                                spin_unlock(src_ptl);
+                               pr_err("%s %d folio:%lx exclusive:%d
swapcache:%d\n",
+                                       __func__, __LINE__, folio,
PageAnonExclusive(&folio->page),
+                                       folio_test_swapcache(folio));
                                err = -EBUSY;
                                goto out;
                        }

I understand that shared folios should not be moved. However, in this
case, the folio is not shared, yet its exclusive flag is not set.

Therefore, I believe PageAnonExclusive is not a reliable indicator of
whether a folio is truly exclusive to a process.

The kernel log output is shown below:
[   23.009516] move_pages_pte 1285 folio:fffffdffc01bba40 exclusive:0
swapcache:1

I'm still struggling to find a real fix; it seems quite challenging.
Please let me know if you have any ideas. In any case It seems
userspace should fall back to userfaultfd_copy.



[1] The small program:

//Just in a couple of seconds, we are running into
//"UFFDIO_MOVE: Device or resource busy"

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <sys/syscall.h>
#include <linux/userfaultfd.h>
#include <fcntl.h>
#include <pthread.h>
#include <unistd.h>
#include <poll.h>
#include <errno.h>

#define PAGE_SIZE 4096
#define REGION_SIZE (512 * 1024)

#ifndef UFFDIO_MOVE
struct uffdio_move {
    __u64 dst;
    __u64 src;
    __u64 len;
    #define UFFDIO_MOVE_MODE_DONTWAKE        ((__u64)1<<0)
    #define UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES ((__u64)1<<1)
    __u64 mode;
    __s64 move;
};

#define _UFFDIO_MOVE  (0x05)
#define UFFDIO_MOVE   _IOWR(UFFDIO, _UFFDIO_MOVE, struct uffdio_move)
#endif


void *src, *dst;
int uffd;

void *madvise_thread(void *arg) {
    for (size_t i = 0; i < REGION_SIZE; i += PAGE_SIZE) {
    madvise(src + i, PAGE_SIZE, MADV_PAGEOUT);
    usleep(100);
    }
    return NULL;
}

void *swapin_thread(void *arg) {
    volatile char dummy;
    for (size_t i = 0; i < REGION_SIZE; i += PAGE_SIZE) {
        dummy = ((char *)src)[i];
        usleep(100);
    }
    return NULL;
}


void *fault_handler_thread(void *arg) {

    struct uffd_msg msg;
    struct uffdio_move move;
    struct pollfd pollfd = { .fd = uffd, .events = POLLIN };
    pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
    pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, NULL);

    while (1) {
        if (poll(&pollfd, 1, -1) == -1) {
            perror("poll");
            exit(EXIT_FAILURE);
        }

        if (read(uffd, &msg, sizeof(msg)) <= 0) {
            perror("read");
            exit(EXIT_FAILURE);
        }


        if (msg.event != UFFD_EVENT_PAGEFAULT) {
            fprintf(stderr, "Unexpected event\n");
            exit(EXIT_FAILURE);
        }

        move.src = (unsigned long)src + (msg.arg.pagefault.address -
(unsigned long)dst);
        move.dst = msg.arg.pagefault.address & ~(PAGE_SIZE - 1);
        move.len = PAGE_SIZE;
        move.mode = 0;

        if (ioctl(uffd, UFFDIO_MOVE, &move) == -1) {
            perror("UFFDIO_MOVE");
            exit(EXIT_FAILURE);
        }
    }
    return NULL;
}

int main() {
again:
    pthread_t thr, madv_thr, swapin_thr;
    struct uffdio_api uffdio_api = { .api = UFFD_API, .features = 0 };
    struct uffdio_register uffdio_register;

    src = mmap(NULL, REGION_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE
| MAP_ANONYMOUS, -1, 0);

    if (src == MAP_FAILED) {
        perror("mmap src");
        exit(EXIT_FAILURE);
    }

    memset(src, 1, REGION_SIZE);

    dst = mmap(NULL, REGION_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE
| MAP_ANONYMOUS, -1, 0);

    if (dst == MAP_FAILED) {
        perror("mmap dst");
        exit(EXIT_FAILURE);
    }


    uffd = syscall(SYS_userfaultfd, O_CLOEXEC | O_NONBLOCK);
    if (uffd == -1) {
        perror("userfaultfd");
        exit(EXIT_FAILURE);
    }


    if (ioctl(uffd, UFFDIO_API, &uffdio_api) == -1) {
        perror("UFFDIO_API");
        exit(EXIT_FAILURE);
    }

    uffdio_register.range.start = (unsigned long)dst;
    uffdio_register.range.len = REGION_SIZE;
    uffdio_register.mode = UFFDIO_REGISTER_MODE_MISSING;

    if (ioctl(uffd, UFFDIO_REGISTER, &uffdio_register) == -1) {
        perror("UFFDIO_REGISTER");
        exit(EXIT_FAILURE);

    }

    if (pthread_create(&madv_thr, NULL, madvise_thread, NULL) != 0) {
        perror("pthread_create madvise_thread");
        exit(EXIT_FAILURE);
    }

    if (pthread_create(&swapin_thr, NULL, swapin_thread, NULL) != 0) {
        perror("pthread_create swapin_thread");
        exit(EXIT_FAILURE);
    }

    if (pthread_create(&thr, NULL, fault_handler_thread, NULL) != 0) {
        perror("pthread_create fault_handler_thread");
        exit(EXIT_FAILURE);
    }

    for (size_t i = 0; i < REGION_SIZE; i += PAGE_SIZE) {
        char val = ((char *)dst)[i];
        printf("Accessing dst at offset %zu, value: %d\n", i, val);
    }

    pthread_join(madv_thr, NULL);
    pthread_join(swapin_thr, NULL);
    pthread_cancel(thr);
    pthread_join(thr, NULL);
    munmap(src, REGION_SIZE);
    munmap(dst, REGION_SIZE);
    close(uffd);
    goto again;

    return 0;
}

Thanks
Barry
