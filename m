Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887DC14286
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747958648; cv=none; b=bhN+GX8YGvNuwEaDy/ayHa1m7FTIoyEc0Te/7sLICkApSTyjO5x05G1pICdS73te/nlc0xHS2JAljtutXDKst6Q52oBSUbgKMrTS+4d6P6PeT+s8HtubccieNLaGf6jDYiHkUIZYfBKDoPAMFtxAmxyj//YHVt/TiqfvIy+iNJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747958648; c=relaxed/simple;
	bh=vKCf4eXr12kYRxAx2Qu/jGrqXJTrV9G9aGm1c2GR+xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owkbIPtywYtYKvVaO9S5atIyH/6TDjl7Fy/4pRI7SCkH6jyK4sQtcuYB3ZIcIDOAgdLYheELDJDmDnUKQ6WCE3ZFxSlZ5Dl5G3x/Woo5eunCkPaNo8CsqYhBA7V+VOUFIuo887emZAhfTwQZWTs/2rKzGU5W8nA3fNv4+1YkwWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SS8HY5wd; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SS8HY5wd"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so2727a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747958645; x=1748563445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVD8X8AUvyybzarXJ5GC2U4oMyc/mzPDkV97mugri4c=;
        b=SS8HY5wdqfxTW5z8/lf6BH9nv2rWfjU9yeQ2W79EahdmhzjUQ3kOcsG9ga1ZgAkki9
         DFf6aWJH9wg0hCNNU92lOqA9ISOQXloTwLIPVxJFz8ylMGnU6/01giif+j4KtkCYBgHK
         9J7gBYXl04DSqvkpVwsUQ+HSiQ3th8+MGhPW4pFrFHCimZ8NuVE0io/UH+o8r1O2INAF
         SF3X8ACpEaaEqaOrH6/u9CQta+6s28S4kHRd+T5kJXEyFHSlfl4+8bRgyoef8WLvuKH5
         v/lc28cG7HJV3B4RieXwCHz+01ggdY5HleieIpth49G+6+BgciGprn5EuyjVgZ0YOOjf
         ULwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747958645; x=1748563445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVD8X8AUvyybzarXJ5GC2U4oMyc/mzPDkV97mugri4c=;
        b=o7My0VreblSNWKBfrRqN2wfUzEbZK/xU2NK9bza6znsO3orYQg+QfaxqlMDU/Iopo0
         aA9uBmgtZtdR+ojRoKiqM+tgPybEW+BavYcPsw2jNyI984XOBCvWwkAm9FbOwNh0tPPZ
         w7zC+YtJl6EJRRFGqZ2ybnQ08aHNWQflXYx1BciJzLeCU6OYBUUmhqYc6tbzMqwtURmg
         /Kiv7t7ENP+GTCUs5Q3SNcj0Oq5+R59YtGHmzXYLoO9tSLv9fch2LaJJYckocu3rMv8R
         PAu2Nsxq7AOh8em5Fk5Z+m/E4rkQ3hjS+EqW3gBDIb2Wfb9i983YU6vlFtgSGQpYV3m4
         XzrA==
X-Forwarded-Encrypted: i=1; AJvYcCVtueJB4NCXIiH2OpK9cJzBJnnCVWe0Hp9Js7dkbyjLjlwo0Zeuwa7btZ92mh5XhXhl/zD00EaH/iUEReE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRemIR1eWYj7VvUfYyqAe/J7CaoTQiZAOz3+sNV+KPYHAGeaqg
	bH/cyIiBFOV5rcXBLqqbCyGM9wESpDuS8K7EMSXGPoRleft6WpWHPGTSzfHiwtTxbRyX2Z8X+4e
	H+AScSG+LmP7W5qD4LkAgDAlR8E3T9GOVrjWb19Cx
X-Gm-Gg: ASbGncuqDbUmHLEat2BYKjabb8qj2Lxi8gdRY2yOqcnWAFk3NMX+E/nWGNlilgT6F7C
	9lnU078DycRqFgtcG+yqoXuuD0lfRYBrwiVJOA3u+IMiBbQyx0K30Ndhv5vscZ6HkGdnZxvsNCB
	/SuM4xtcg5JeNQhLg87eIGVDtmGGX0PTpL3+uf0LMSdBn9EX4LvfCEMhOS1dWxgxuXaYa2dwHhZ
	LNNrG06HaLu
X-Google-Smtp-Source: AGHT+IGtOPOFXtk1qE/7IEW4P2AJsydCtXrkOUOUl0Enemtp8TWCRM8K7TT/r/fI+huGk4Dy+j0mrDWosz8K71gJVTs=
X-Received: by 2002:aa7:d402:0:b0:601:7b94:b80e with SMTP id
 4fb4d7f45d1cf-60293687eebmr19829a12.3.1747958644620; Thu, 22 May 2025
 17:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGsJ_4zMNaNjRXbtDD6xYfDhckcDCnTvv+4-yB1xpuYcur=fyw@mail.gmail.com>
 <CA+EESO5BafvOpcbEX1g3ELPMCUdVQ9TFBGKH-sD3OiJvofMkAg@mail.gmail.com> <CAGsJ_4zKZKjABBXGnPbfudPN0ShnKEsNozaSQHtwDFj_-vv7bA@mail.gmail.com>
In-Reply-To: <CAGsJ_4zKZKjABBXGnPbfudPN0ShnKEsNozaSQHtwDFj_-vv7bA@mail.gmail.com>
From: Lokesh Gidra <lokeshgidra@google.com>
Date: Thu, 22 May 2025 17:03:53 -0700
X-Gm-Features: AX0GCFub2LNXdE27Lps7e6Sh6Q4ceuCxqOiksfPw9_HxO430FqsU3Za9VZxlalg
Message-ID: <CA+EESO6VgQaHqZq9earDSMyxg2pqjPtUAL74ndN8TUOnLY=c7g@mail.gmail.com>
Subject: Re: [BUG]userfaultfd_move fails to move a folio when swap-in occurs
 concurrently with swap-out
To: Barry Song <21cnbao@gmail.com>
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
	Suren Baghdasaryan <surenb@google.com>, Andrea Arcangeli <aarcange@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>, 
	Kairui Song <ryncsn@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 4:53=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Fri, May 23, 2025 at 11:44=E2=80=AFAM Lokesh Gidra <lokeshgidra@google=
.com> wrote:
> >
> > Thanks Barry for stress testing MOVE ioctl. It's really helpful :)
> >
> > On Thu, May 22, 2025 at 4:23=E2=80=AFPM Barry Song <21cnbao@gmail.com> =
wrote:
> > >
> > > Hi All,
> > >
> > > I'm encountering another bug that can be easily reproduced using the =
small
> > > program below[1], which performs swap-out and swap-in in parallel.
> > >
> > > The issue occurs when a folio is being swapped out while it is access=
ed
> > > concurrently. In this case, do_swap_page() handles the access. Howeve=
r,
> > > because the folio is under writeback, do_swap_page() completely remov=
es
> > > its exclusive attribute.
> > >
> > > do_swap_page:
> > >                } else if (exclusive && folio_test_writeback(folio) &&
> > >                           data_race(si->flags & SWP_STABLE_WRITES)) {
> > >                         ...
> > >                         exclusive =3D false;
> > >
> > > As a result, userfaultfd_move() will return -EBUSY, even though the
> > > folio is not shared and is in fact exclusively owned.
> > >
> > >                         folio =3D vm_normal_folio(src_vma, src_addr,
> > > orig_src_pte);
> > >                         if (!folio || !PageAnonExclusive(&folio->page=
)) {
> > >                                 spin_unlock(src_ptl);
> > > +                               pr_err("%s %d folio:%lx exclusive:%d
> > > swapcache:%d\n",
> > > +                                       __func__, __LINE__, folio,
> > > PageAnonExclusive(&folio->page),
> > > +                                       folio_test_swapcache(folio));
> > >                                 err =3D -EBUSY;
> > >                                 goto out;
> > >                         }
> > >
> > > I understand that shared folios should not be moved. However, in this
> > > case, the folio is not shared, yet its exclusive flag is not set.
> > >
> > > Therefore, I believe PageAnonExclusive is not a reliable indicator of
> > > whether a folio is truly exclusive to a process.
> > >
> > > The kernel log output is shown below:
> > > [   23.009516] move_pages_pte 1285 folio:fffffdffc01bba40 exclusive:0
> > > swapcache:1
> > >
> > > I'm still struggling to find a real fix; it seems quite challenging.
> > > Please let me know if you have any ideas. In any case It seems
> > > userspace should fall back to userfaultfd_copy.
> > >
> > I'm not sure this is really a bug. A page under write-back is in a way
> > 'busy' isn't it? I am not an expert of anon-exclusive, but it seems to
> > me that an exclusively mapped anonymous page would have it true. So,
> > isn't it expected that a page under write-back will not have it set as
> > the page isn't mapped?
>
> We have two return codes: -EAGAIN and -EBUSY. In many cases, we return
> -EAGAIN, which is transparent to userspace because the syscall is retried=
.
>
> Therefore, I expect -EAGAIN or a similar code here to avoid userspace noi=
se,
> since we handle other cases where folios are undergoing transitions to
> become stable again by -EAGAIN.

I agree, this case probably should be -EAGAIN. OTOH, with -EBUSY, we
know that a userfaultfd_copy fallback or some other operation needs to
be performed before retrying. In most of the -EAGAIN cases, we simply
have to retry without taking any additional steps.
>
> >
> > I have observed this in my testing as well, and there are a couple of
> > ways to deal with it in userspace. As you suggested, falling back to
> > userfaultfd_copy on receiving -EBUSY is one option. In my case, making
> > a fake store on the src page and then retrying has been working fine.
>
> Good to know you have some fallbacks implemented in userspace.
> That makes the issue less serious now.

I have been assuming so far that the reason I'm getting -EBUSY is
because somehow the page is COW shared with zygote. But what you
pointed out makes a lot more sense.
>
> > >
> > >
> > > [1] The small program:
> > >
> > > //Just in a couple of seconds, we are running into
> > > //"UFFDIO_MOVE: Device or resource busy"
> > >
> > > #define _GNU_SOURCE
> > > #include <stdio.h>
> > > #include <stdlib.h>
> > > #include <string.h>
> > > #include <sys/mman.h>
> > > #include <sys/ioctl.h>
> > > #include <sys/syscall.h>
> > > #include <linux/userfaultfd.h>
> > > #include <fcntl.h>
> > > #include <pthread.h>
> > > #include <unistd.h>
> > > #include <poll.h>
> > > #include <errno.h>
> > >
> > > #define PAGE_SIZE 4096
> > > #define REGION_SIZE (512 * 1024)
> > >
> > > #ifndef UFFDIO_MOVE
> > > struct uffdio_move {
> > >     __u64 dst;
> > >     __u64 src;
> > >     __u64 len;
> > >     #define UFFDIO_MOVE_MODE_DONTWAKE        ((__u64)1<<0)
> > >     #define UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES ((__u64)1<<1)
> > >     __u64 mode;
> > >     __s64 move;
> > > };
> > >
> > > #define _UFFDIO_MOVE  (0x05)
> > > #define UFFDIO_MOVE   _IOWR(UFFDIO, _UFFDIO_MOVE, struct uffdio_move)
> > > #endif
> > >
> > >
> > > void *src, *dst;
> > > int uffd;
> > >
> > > void *madvise_thread(void *arg) {
> > >     for (size_t i =3D 0; i < REGION_SIZE; i +=3D PAGE_SIZE) {
> > >     madvise(src + i, PAGE_SIZE, MADV_PAGEOUT);
> > >     usleep(100);
> > >     }
> > >     return NULL;
> > > }
> > >
> > > void *swapin_thread(void *arg) {
> > >     volatile char dummy;
> > >     for (size_t i =3D 0; i < REGION_SIZE; i +=3D PAGE_SIZE) {
> > >         dummy =3D ((char *)src)[i];
> > >         usleep(100);
> > >     }
> > >     return NULL;
> > > }
> > >
> > >
> > > void *fault_handler_thread(void *arg) {
> > >
> > >     struct uffd_msg msg;
> > >     struct uffdio_move move;
> > >     struct pollfd pollfd =3D { .fd =3D uffd, .events =3D POLLIN };
> > >     pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
> > >     pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, NULL);
> > >
> > >     while (1) {
> > >         if (poll(&pollfd, 1, -1) =3D=3D -1) {
> > >             perror("poll");
> > >             exit(EXIT_FAILURE);
> > >         }
> > >
> > >         if (read(uffd, &msg, sizeof(msg)) <=3D 0) {
> > >             perror("read");
> > >             exit(EXIT_FAILURE);
> > >         }
> > >
> > >
> > >         if (msg.event !=3D UFFD_EVENT_PAGEFAULT) {
> > >             fprintf(stderr, "Unexpected event\n");
> > >             exit(EXIT_FAILURE);
> > >         }
> > >
> > >         move.src =3D (unsigned long)src + (msg.arg.pagefault.address =
-
> > > (unsigned long)dst);
> > >         move.dst =3D msg.arg.pagefault.address & ~(PAGE_SIZE - 1);
> > >         move.len =3D PAGE_SIZE;
> > >         move.mode =3D 0;
> > >
> > >         if (ioctl(uffd, UFFDIO_MOVE, &move) =3D=3D -1) {
> > >             perror("UFFDIO_MOVE");
> > >             exit(EXIT_FAILURE);
> > >         }
> > >     }
> > >     return NULL;
> > > }
> > >
> > > int main() {
> > > again:
> > >     pthread_t thr, madv_thr, swapin_thr;
> > >     struct uffdio_api uffdio_api =3D { .api =3D UFFD_API, .features =
=3D 0 };
> > >     struct uffdio_register uffdio_register;
> > >
> > >     src =3D mmap(NULL, REGION_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVA=
TE
> > > | MAP_ANONYMOUS, -1, 0);
> > >
> > >     if (src =3D=3D MAP_FAILED) {
> > >         perror("mmap src");
> > >         exit(EXIT_FAILURE);
> > >     }
> > >
> > >     memset(src, 1, REGION_SIZE);
> > >
> > >     dst =3D mmap(NULL, REGION_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVA=
TE
> > > | MAP_ANONYMOUS, -1, 0);
> > >
> > >     if (dst =3D=3D MAP_FAILED) {
> > >         perror("mmap dst");
> > >         exit(EXIT_FAILURE);
> > >     }
> > >
> > >
> > >     uffd =3D syscall(SYS_userfaultfd, O_CLOEXEC | O_NONBLOCK);
> > >     if (uffd =3D=3D -1) {
> > >         perror("userfaultfd");
> > >         exit(EXIT_FAILURE);
> > >     }
> > >
> > >
> > >     if (ioctl(uffd, UFFDIO_API, &uffdio_api) =3D=3D -1) {
> > >         perror("UFFDIO_API");
> > >         exit(EXIT_FAILURE);
> > >     }
> > >
> > >     uffdio_register.range.start =3D (unsigned long)dst;
> > >     uffdio_register.range.len =3D REGION_SIZE;
> > >     uffdio_register.mode =3D UFFDIO_REGISTER_MODE_MISSING;
> > >
> > >     if (ioctl(uffd, UFFDIO_REGISTER, &uffdio_register) =3D=3D -1) {
> > >         perror("UFFDIO_REGISTER");
> > >         exit(EXIT_FAILURE);
> > >
> > >     }
> > >
> > >     if (pthread_create(&madv_thr, NULL, madvise_thread, NULL) !=3D 0)=
 {
> > >         perror("pthread_create madvise_thread");
> > >         exit(EXIT_FAILURE);
> > >     }
> > >
> > >     if (pthread_create(&swapin_thr, NULL, swapin_thread, NULL) !=3D 0=
) {
> > >         perror("pthread_create swapin_thread");
> > >         exit(EXIT_FAILURE);
> > >     }
> > >
> > >     if (pthread_create(&thr, NULL, fault_handler_thread, NULL) !=3D 0=
) {
> > >         perror("pthread_create fault_handler_thread");
> > >         exit(EXIT_FAILURE);
> > >     }
> > >
> > >     for (size_t i =3D 0; i < REGION_SIZE; i +=3D PAGE_SIZE) {
> > >         char val =3D ((char *)dst)[i];
> > >         printf("Accessing dst at offset %zu, value: %d\n", i, val);
> > >     }
> > >
> > >     pthread_join(madv_thr, NULL);
> > >     pthread_join(swapin_thr, NULL);
> > >     pthread_cancel(thr);
> > >     pthread_join(thr, NULL);
> > >     munmap(src, REGION_SIZE);
> > >     munmap(dst, REGION_SIZE);
> > >     close(uffd);
> > >     goto again;
> > >
> > >     return 0;
> > > }
> > >
>
> Thanks
> Barry
