Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCAC28C2CF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747957445; cv=none; b=QGTMiDPqT4Q0biqAzGepX2Y3wGvI+pgbxk3+X0721tcMUQFfR62AkdIn8WNjbjmHKDrrrpd0Jr+i3CpYcmKRKZ3MWdcc0XJ6uTJEYrYdKRv/61gT7v3OjajfCEGdqqZKQSssmHlmt6uKIqBSJhouefjNOdIMisbDcgIu0YJn2Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747957445; c=relaxed/simple;
	bh=eqUQOK68nUDANFTeSh409SkKdE9OJU323xf3HqLHh5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3R81XYuZcHsWB7swoU4TgWQ3rZ9ksqnAFjyPPqVXYokl0htPwZ4/VdX9gQ1XZNihRJw0ppoQZiEuN4hJP/Nnq3g1yL1XDwv2yDOOScA3hD8KbTFUrkyZXs0Crry/LR4UtstNkxZKGNNeJbcvNmw/0w4G4ztZbodtO6TWJq/uRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rR+vLswH; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rR+vLswH"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so2605a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957442; x=1748562242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4fiPb/UOCIao9WUneZWXqvmbFihzHoQr99jpS6Rj54=;
        b=rR+vLswHkzsopUCNiXzBvr6l6+YkmpkBbnohsJB+VrQEEX8SYoo6pUP130xDUSjYWJ
         6/irkQSDLGxdh1AswCLMz6jARGlGqOIwIBt1oEZAoNqYXmJfwMKRaSuonHPTQexQL3jf
         hbW2dXLfQNUzN05jvdXGqQiHXn63FucaBy2aR0lT6EGbvHfZ33lgSqBWUczBRTJU/5Q9
         DZruBOLfDldlYtzeug8gHq0evKHWTvHsdh1Ei2RDlbIAnAA4LfzMCP+zf5YDByYS8Xv2
         1dtg97EIi1Rqu3oEuq2WOtJURBVUlUvFE9tsmvOIz2cJqzkqZGavh0Mo20iFZtZU1qTa
         9yEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957442; x=1748562242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4fiPb/UOCIao9WUneZWXqvmbFihzHoQr99jpS6Rj54=;
        b=KVLnZ5uipXJgv5OxhpC9SrLbLisJOY2GX2w12PPwu0wXuTA74tBSBaZsVwKOyrKWIW
         5t/N+4CJK76z5kaJNnCOeHsBM4x6/Kn9HtWKAWuCoezm1wcw+3tUTjyHAHmJxUxRqniN
         P7yjwJcM/WgSnPCbRIjBAQaxbLDD2ViTUlA2h/cGkVcJubNv4Nl0ObkMOViDXr3E7/e8
         PHde2QtS7kg6ZjjxtlNBW/ThkyrDPETRtauu5vseSVVEKnPbdqLGrydSS5E5jlerAbBD
         iEti7lh95lFB/a6YICChYqScUyalfRQJFpgu2a1cQKZOPTYFzXUgki60LORf3ex2+udj
         GFOA==
X-Forwarded-Encrypted: i=1; AJvYcCXxVMJ7crZomBvphCkPcua4mR9Ks/MyFftuerxN78tVSQdHbSD3nv3k4VcQK4qg/Dr+6fG7eO6u82cKwNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV5JI/TTMLQrGx+HYA3Qvatg79G4QMZzdp3jWkfE5NC7nX1jFj
	gNcKyphwEknsOJC/eweuXx6DHzXxfX9KPrVrkB0gshqOSJnO031wrLkw3aLnrIiucM+mubKx6Bi
	aYihD7SM65Xs8lXH9KMQjS8rlfgSwzjsVA7fMjY8V
X-Gm-Gg: ASbGncsnv9NCpWF8XXUkm0+ouAN03DGdJKhiOuz9B9qA6vBwH23wvY6mAAeSyXiVG5b
	PHxpSnitL2qnzZy5rKoYSGCTVw4KTT9IF9PENSbnME4CeUuvBCFqkZOwIADzopY5YuSHzgJDAEH
	4I2SlFn2qyClxHdLdSPr/D0oNCFkfbPSvxl13ppE+8R2ScBua4fglWcWNf/n3MDjD9amquOfgfD
	w==
X-Google-Smtp-Source: AGHT+IF/egR4yp64IyXN39+uzCPNnsbCBon5KCZlz96v7UsAbEUt1hC00Ko3+8FhoiBAQTR9biQcSWL1DiqVJiyoocI=
X-Received: by 2002:a05:6402:206a:b0:5fd:28:c3f6 with SMTP id
 4fb4d7f45d1cf-60292d1f59amr21112a12.4.1747957441747; Thu, 22 May 2025
 16:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGsJ_4zMNaNjRXbtDD6xYfDhckcDCnTvv+4-yB1xpuYcur=fyw@mail.gmail.com>
In-Reply-To: <CAGsJ_4zMNaNjRXbtDD6xYfDhckcDCnTvv+4-yB1xpuYcur=fyw@mail.gmail.com>
From: Lokesh Gidra <lokeshgidra@google.com>
Date: Thu, 22 May 2025 16:43:50 -0700
X-Gm-Features: AX0GCFsbtviWjkD6bterSDea-aJcibsxg37Dvva7AcHKzf-PvFffIiYv1agOzAM
Message-ID: <CA+EESO5BafvOpcbEX1g3ELPMCUdVQ9TFBGKH-sD3OiJvofMkAg@mail.gmail.com>
Subject: Re: [BUG]userfaultfd_move fails to move a folio when swap-in occurs
 concurrently with swap-out
To: Barry Song <21cnbao@gmail.com>
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
	Suren Baghdasaryan <surenb@google.com>, Andrea Arcangeli <aarcange@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>, 
	Kairui Song <ryncsn@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Barry for stress testing MOVE ioctl. It's really helpful :)

On Thu, May 22, 2025 at 4:23=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> Hi All,
>
> I'm encountering another bug that can be easily reproduced using the smal=
l
> program below[1], which performs swap-out and swap-in in parallel.
>
> The issue occurs when a folio is being swapped out while it is accessed
> concurrently. In this case, do_swap_page() handles the access. However,
> because the folio is under writeback, do_swap_page() completely removes
> its exclusive attribute.
>
> do_swap_page:
>                } else if (exclusive && folio_test_writeback(folio) &&
>                           data_race(si->flags & SWP_STABLE_WRITES)) {
>                         ...
>                         exclusive =3D false;
>
> As a result, userfaultfd_move() will return -EBUSY, even though the
> folio is not shared and is in fact exclusively owned.
>
>                         folio =3D vm_normal_folio(src_vma, src_addr,
> orig_src_pte);
>                         if (!folio || !PageAnonExclusive(&folio->page)) {
>                                 spin_unlock(src_ptl);
> +                               pr_err("%s %d folio:%lx exclusive:%d
> swapcache:%d\n",
> +                                       __func__, __LINE__, folio,
> PageAnonExclusive(&folio->page),
> +                                       folio_test_swapcache(folio));
>                                 err =3D -EBUSY;
>                                 goto out;
>                         }
>
> I understand that shared folios should not be moved. However, in this
> case, the folio is not shared, yet its exclusive flag is not set.
>
> Therefore, I believe PageAnonExclusive is not a reliable indicator of
> whether a folio is truly exclusive to a process.
>
> The kernel log output is shown below:
> [   23.009516] move_pages_pte 1285 folio:fffffdffc01bba40 exclusive:0
> swapcache:1
>
> I'm still struggling to find a real fix; it seems quite challenging.
> Please let me know if you have any ideas. In any case It seems
> userspace should fall back to userfaultfd_copy.
>
I'm not sure this is really a bug. A page under write-back is in a way
'busy' isn't it? I am not an expert of anon-exclusive, but it seems to
me that an exclusively mapped anonymous page would have it true. So,
isn't it expected that a page under write-back will not have it set as
the page isn't mapped?

I have observed this in my testing as well, and there are a couple of
ways to deal with it in userspace. As you suggested, falling back to
userfaultfd_copy on receiving -EBUSY is one option. In my case, making
a fake store on the src page and then retrying has been working fine.
>
>
> [1] The small program:
>
> //Just in a couple of seconds, we are running into
> //"UFFDIO_MOVE: Device or resource busy"
>
> #define _GNU_SOURCE
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <sys/mman.h>
> #include <sys/ioctl.h>
> #include <sys/syscall.h>
> #include <linux/userfaultfd.h>
> #include <fcntl.h>
> #include <pthread.h>
> #include <unistd.h>
> #include <poll.h>
> #include <errno.h>
>
> #define PAGE_SIZE 4096
> #define REGION_SIZE (512 * 1024)
>
> #ifndef UFFDIO_MOVE
> struct uffdio_move {
>     __u64 dst;
>     __u64 src;
>     __u64 len;
>     #define UFFDIO_MOVE_MODE_DONTWAKE        ((__u64)1<<0)
>     #define UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES ((__u64)1<<1)
>     __u64 mode;
>     __s64 move;
> };
>
> #define _UFFDIO_MOVE  (0x05)
> #define UFFDIO_MOVE   _IOWR(UFFDIO, _UFFDIO_MOVE, struct uffdio_move)
> #endif
>
>
> void *src, *dst;
> int uffd;
>
> void *madvise_thread(void *arg) {
>     for (size_t i =3D 0; i < REGION_SIZE; i +=3D PAGE_SIZE) {
>     madvise(src + i, PAGE_SIZE, MADV_PAGEOUT);
>     usleep(100);
>     }
>     return NULL;
> }
>
> void *swapin_thread(void *arg) {
>     volatile char dummy;
>     for (size_t i =3D 0; i < REGION_SIZE; i +=3D PAGE_SIZE) {
>         dummy =3D ((char *)src)[i];
>         usleep(100);
>     }
>     return NULL;
> }
>
>
> void *fault_handler_thread(void *arg) {
>
>     struct uffd_msg msg;
>     struct uffdio_move move;
>     struct pollfd pollfd =3D { .fd =3D uffd, .events =3D POLLIN };
>     pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
>     pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, NULL);
>
>     while (1) {
>         if (poll(&pollfd, 1, -1) =3D=3D -1) {
>             perror("poll");
>             exit(EXIT_FAILURE);
>         }
>
>         if (read(uffd, &msg, sizeof(msg)) <=3D 0) {
>             perror("read");
>             exit(EXIT_FAILURE);
>         }
>
>
>         if (msg.event !=3D UFFD_EVENT_PAGEFAULT) {
>             fprintf(stderr, "Unexpected event\n");
>             exit(EXIT_FAILURE);
>         }
>
>         move.src =3D (unsigned long)src + (msg.arg.pagefault.address -
> (unsigned long)dst);
>         move.dst =3D msg.arg.pagefault.address & ~(PAGE_SIZE - 1);
>         move.len =3D PAGE_SIZE;
>         move.mode =3D 0;
>
>         if (ioctl(uffd, UFFDIO_MOVE, &move) =3D=3D -1) {
>             perror("UFFDIO_MOVE");
>             exit(EXIT_FAILURE);
>         }
>     }
>     return NULL;
> }
>
> int main() {
> again:
>     pthread_t thr, madv_thr, swapin_thr;
>     struct uffdio_api uffdio_api =3D { .api =3D UFFD_API, .features =3D 0=
 };
>     struct uffdio_register uffdio_register;
>
>     src =3D mmap(NULL, REGION_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE
> | MAP_ANONYMOUS, -1, 0);
>
>     if (src =3D=3D MAP_FAILED) {
>         perror("mmap src");
>         exit(EXIT_FAILURE);
>     }
>
>     memset(src, 1, REGION_SIZE);
>
>     dst =3D mmap(NULL, REGION_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE
> | MAP_ANONYMOUS, -1, 0);
>
>     if (dst =3D=3D MAP_FAILED) {
>         perror("mmap dst");
>         exit(EXIT_FAILURE);
>     }
>
>
>     uffd =3D syscall(SYS_userfaultfd, O_CLOEXEC | O_NONBLOCK);
>     if (uffd =3D=3D -1) {
>         perror("userfaultfd");
>         exit(EXIT_FAILURE);
>     }
>
>
>     if (ioctl(uffd, UFFDIO_API, &uffdio_api) =3D=3D -1) {
>         perror("UFFDIO_API");
>         exit(EXIT_FAILURE);
>     }
>
>     uffdio_register.range.start =3D (unsigned long)dst;
>     uffdio_register.range.len =3D REGION_SIZE;
>     uffdio_register.mode =3D UFFDIO_REGISTER_MODE_MISSING;
>
>     if (ioctl(uffd, UFFDIO_REGISTER, &uffdio_register) =3D=3D -1) {
>         perror("UFFDIO_REGISTER");
>         exit(EXIT_FAILURE);
>
>     }
>
>     if (pthread_create(&madv_thr, NULL, madvise_thread, NULL) !=3D 0) {
>         perror("pthread_create madvise_thread");
>         exit(EXIT_FAILURE);
>     }
>
>     if (pthread_create(&swapin_thr, NULL, swapin_thread, NULL) !=3D 0) {
>         perror("pthread_create swapin_thread");
>         exit(EXIT_FAILURE);
>     }
>
>     if (pthread_create(&thr, NULL, fault_handler_thread, NULL) !=3D 0) {
>         perror("pthread_create fault_handler_thread");
>         exit(EXIT_FAILURE);
>     }
>
>     for (size_t i =3D 0; i < REGION_SIZE; i +=3D PAGE_SIZE) {
>         char val =3D ((char *)dst)[i];
>         printf("Accessing dst at offset %zu, value: %d\n", i, val);
>     }
>
>     pthread_join(madv_thr, NULL);
>     pthread_join(swapin_thr, NULL);
>     pthread_cancel(thr);
>     pthread_join(thr, NULL);
>     munmap(src, REGION_SIZE);
>     munmap(dst, REGION_SIZE);
>     close(uffd);
>     goto again;
>
>     return 0;
> }
>
> Thanks
> Barry
