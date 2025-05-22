Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DD824DCFB
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747958037; cv=none; b=ZEk3tmEJLD1AXFScvR6HRuKSuxM/qGu7YJJE3W0rYghucd5eP9otm6oRDuumCneGPTos7EhggFn41VDluuQmGiiNCaVxnSlUvW7qZSdcsDm+R5Um7klZNxO9p2uSMN/obDSux/o+do3LOlxpZkN/Ydl9hzOJxAkgDohIaUCCoM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747958037; c=relaxed/simple;
	bh=CIa3tYdfYMtVepR6fANANVjGVGgrf70eHODVW/Ivvkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CI6bh7ozEKsJEOEicVnOgz2a1zYYcIPqgh4BDSE24yH96Eg+2AeF0JUtARlO/hIyI290DjutprovWK8n+lrG/WXIP7PySv91QwsUMWvQd4rvPFd57CCNUH1Je52odKSMxnxqlSe+EQduOKShdnUr83DP0fwIgHfQ5y9fWqvSY9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0TUXisg; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0TUXisg"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-52f22008b6aso19688e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747958033; x=1748562833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXpfq0uRm2Z+89nrs/0r3k9mZyXxOjfYOncnGRVl1Tc=;
        b=H0TUXisgCwbcafQOMEje1cL7Gbt729Nfc+pE67nwqYDQjumW2Cx5NNlMBHOh92raD/
         AF2pMq/tcFFYOekfqv4O+MWcQ25GXbHIW85fSMatJXdGiNcjl/nnds/1ezy1EysQVIX+
         o1jttceqgzelanl/LC5xy3blBJk57fqOGPPzqz0D97RHsfGFKHk3L3xDHKNRFV7Z7x3E
         6bG6QUQpWIossiBiXL3icKL2OQIMAT/4kKcBPC3EggcL+VWxY2uAXeLzjVOjZI2oPTiY
         gUgrUsh67MY/muDJcwa3O6Kvdmf0z8/86wBb4VmrrpH1TEDRxy6MmFAwxL7O1Fjh+iVM
         Zucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747958033; x=1748562833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXpfq0uRm2Z+89nrs/0r3k9mZyXxOjfYOncnGRVl1Tc=;
        b=JbAUXlyGR02OrjzaqbEXIqP26sBHy4FYFWMOdYH2baxAqZsgm5eL4PeQtRDW8ISK4W
         bodNrneOGkq90aGh7Z3JnUeJBcvpizGCXBEFCBpScNO27DVXWefoBKR3yqemyotgd0CK
         z46+2o/mn+jYuxCGUSXAYVThDK3WyFJOpVz6znpOwLwpo5u+iogktl/Vej1dFzsnxufC
         scSVzrKUBNbnsYBcaFs8Zgla/RQCEoQ5gJkg374pbmmswSWjxR1zuQRkAfIG4SA7YRVT
         SjWUUoavJdb/g18h+4FTDaGv/RYjbr0hjiJi8yjUOTexzNKB1CdTyeshvtUDlogjz5ph
         ffVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXie8KyWk/I5Sgqsq0PxBLapm2v6aynn3NgpmuzFTNUz3sBCLidBhRBfGRmLS8XWf69bPAZVl8hCC1VVAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyGFG30JRPAT1FPQtspM5wRRr17RW+AJA4DFeDTLI8p1ktGvDK
	8laAg9n+wa3V8lcEFdGZggalihET8tT9eIfaqNd9RHyMaSeejPNB2y6BdUsT9QyW959mjaoggGV
	J58VR+HCaWC7rYely5zFW9j7FzKd65y0=
X-Gm-Gg: ASbGncuKNlwepNv08WErl36Y58eNrwuJaldrA3mQFcLEPxP1FttEtnrC5jZtOwBW6/D
	DwLhrenOG+m4xXi16+/a4GQxA8qc5A4H0Y6R69ctQEJAUuMyVBB6ma3nBJQ5aVKp4eDsG4ddFja
	p6F16dPoAKCNlvJgIsT3lBFXc2sl1kyzj66A==
X-Google-Smtp-Source: AGHT+IH60rSOSX+rc4TTvMJGX2pQCK/hAkkHSqTtX0JBYMZU5cuqslXT+gzwlQx19EUBERl3CIldLFT285mFFU69vpg=
X-Received: by 2002:a05:6122:3bcb:b0:529:2644:5eec with SMTP id
 71dfb90a1353d-52f1fe8b532mr823753e0c.8.1747958033419; Thu, 22 May 2025
 16:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGsJ_4zMNaNjRXbtDD6xYfDhckcDCnTvv+4-yB1xpuYcur=fyw@mail.gmail.com>
 <CA+EESO5BafvOpcbEX1g3ELPMCUdVQ9TFBGKH-sD3OiJvofMkAg@mail.gmail.com>
In-Reply-To: <CA+EESO5BafvOpcbEX1g3ELPMCUdVQ9TFBGKH-sD3OiJvofMkAg@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 23 May 2025 11:53:42 +1200
X-Gm-Features: AX0GCFuurE5qCxKrv05NKItqW8eq670GGZ0BjGoj5mEVeN7x03OFx_RNPfBpsAU
Message-ID: <CAGsJ_4zKZKjABBXGnPbfudPN0ShnKEsNozaSQHtwDFj_-vv7bA@mail.gmail.com>
Subject: Re: [BUG]userfaultfd_move fails to move a folio when swap-in occurs
 concurrently with swap-out
To: Lokesh Gidra <lokeshgidra@google.com>
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
	Suren Baghdasaryan <surenb@google.com>, Andrea Arcangeli <aarcange@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>, 
	Kairui Song <ryncsn@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 11:44=E2=80=AFAM Lokesh Gidra <lokeshgidra@google.c=
om> wrote:
>
> Thanks Barry for stress testing MOVE ioctl. It's really helpful :)
>
> On Thu, May 22, 2025 at 4:23=E2=80=AFPM Barry Song <21cnbao@gmail.com> wr=
ote:
> >
> > Hi All,
> >
> > I'm encountering another bug that can be easily reproduced using the sm=
all
> > program below[1], which performs swap-out and swap-in in parallel.
> >
> > The issue occurs when a folio is being swapped out while it is accessed
> > concurrently. In this case, do_swap_page() handles the access. However,
> > because the folio is under writeback, do_swap_page() completely removes
> > its exclusive attribute.
> >
> > do_swap_page:
> >                } else if (exclusive && folio_test_writeback(folio) &&
> >                           data_race(si->flags & SWP_STABLE_WRITES)) {
> >                         ...
> >                         exclusive =3D false;
> >
> > As a result, userfaultfd_move() will return -EBUSY, even though the
> > folio is not shared and is in fact exclusively owned.
> >
> >                         folio =3D vm_normal_folio(src_vma, src_addr,
> > orig_src_pte);
> >                         if (!folio || !PageAnonExclusive(&folio->page))=
 {
> >                                 spin_unlock(src_ptl);
> > +                               pr_err("%s %d folio:%lx exclusive:%d
> > swapcache:%d\n",
> > +                                       __func__, __LINE__, folio,
> > PageAnonExclusive(&folio->page),
> > +                                       folio_test_swapcache(folio));
> >                                 err =3D -EBUSY;
> >                                 goto out;
> >                         }
> >
> > I understand that shared folios should not be moved. However, in this
> > case, the folio is not shared, yet its exclusive flag is not set.
> >
> > Therefore, I believe PageAnonExclusive is not a reliable indicator of
> > whether a folio is truly exclusive to a process.
> >
> > The kernel log output is shown below:
> > [   23.009516] move_pages_pte 1285 folio:fffffdffc01bba40 exclusive:0
> > swapcache:1
> >
> > I'm still struggling to find a real fix; it seems quite challenging.
> > Please let me know if you have any ideas. In any case It seems
> > userspace should fall back to userfaultfd_copy.
> >
> I'm not sure this is really a bug. A page under write-back is in a way
> 'busy' isn't it? I am not an expert of anon-exclusive, but it seems to
> me that an exclusively mapped anonymous page would have it true. So,
> isn't it expected that a page under write-back will not have it set as
> the page isn't mapped?

We have two return codes: -EAGAIN and -EBUSY. In many cases, we return
-EAGAIN, which is transparent to userspace because the syscall is retried.

Therefore, I expect -EAGAIN or a similar code here to avoid userspace noise=
,
since we handle other cases where folios are undergoing transitions to
become stable again by -EAGAIN.

>
> I have observed this in my testing as well, and there are a couple of
> ways to deal with it in userspace. As you suggested, falling back to
> userfaultfd_copy on receiving -EBUSY is one option. In my case, making
> a fake store on the src page and then retrying has been working fine.

Good to know you have some fallbacks implemented in userspace.
That makes the issue less serious now.

> >
> >
> > [1] The small program:
> >
> > //Just in a couple of seconds, we are running into
> > //"UFFDIO_MOVE: Device or resource busy"
> >
> > #define _GNU_SOURCE
> > #include <stdio.h>
> > #include <stdlib.h>
> > #include <string.h>
> > #include <sys/mman.h>
> > #include <sys/ioctl.h>
> > #include <sys/syscall.h>
> > #include <linux/userfaultfd.h>
> > #include <fcntl.h>
> > #include <pthread.h>
> > #include <unistd.h>
> > #include <poll.h>
> > #include <errno.h>
> >
> > #define PAGE_SIZE 4096
> > #define REGION_SIZE (512 * 1024)
> >
> > #ifndef UFFDIO_MOVE
> > struct uffdio_move {
> >     __u64 dst;
> >     __u64 src;
> >     __u64 len;
> >     #define UFFDIO_MOVE_MODE_DONTWAKE        ((__u64)1<<0)
> >     #define UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES ((__u64)1<<1)
> >     __u64 mode;
> >     __s64 move;
> > };
> >
> > #define _UFFDIO_MOVE  (0x05)
> > #define UFFDIO_MOVE   _IOWR(UFFDIO, _UFFDIO_MOVE, struct uffdio_move)
> > #endif
> >
> >
> > void *src, *dst;
> > int uffd;
> >
> > void *madvise_thread(void *arg) {
> >     for (size_t i =3D 0; i < REGION_SIZE; i +=3D PAGE_SIZE) {
> >     madvise(src + i, PAGE_SIZE, MADV_PAGEOUT);
> >     usleep(100);
> >     }
> >     return NULL;
> > }
> >
> > void *swapin_thread(void *arg) {
> >     volatile char dummy;
> >     for (size_t i =3D 0; i < REGION_SIZE; i +=3D PAGE_SIZE) {
> >         dummy =3D ((char *)src)[i];
> >         usleep(100);
> >     }
> >     return NULL;
> > }
> >
> >
> > void *fault_handler_thread(void *arg) {
> >
> >     struct uffd_msg msg;
> >     struct uffdio_move move;
> >     struct pollfd pollfd =3D { .fd =3D uffd, .events =3D POLLIN };
> >     pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
> >     pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, NULL);
> >
> >     while (1) {
> >         if (poll(&pollfd, 1, -1) =3D=3D -1) {
> >             perror("poll");
> >             exit(EXIT_FAILURE);
> >         }
> >
> >         if (read(uffd, &msg, sizeof(msg)) <=3D 0) {
> >             perror("read");
> >             exit(EXIT_FAILURE);
> >         }
> >
> >
> >         if (msg.event !=3D UFFD_EVENT_PAGEFAULT) {
> >             fprintf(stderr, "Unexpected event\n");
> >             exit(EXIT_FAILURE);
> >         }
> >
> >         move.src =3D (unsigned long)src + (msg.arg.pagefault.address -
> > (unsigned long)dst);
> >         move.dst =3D msg.arg.pagefault.address & ~(PAGE_SIZE - 1);
> >         move.len =3D PAGE_SIZE;
> >         move.mode =3D 0;
> >
> >         if (ioctl(uffd, UFFDIO_MOVE, &move) =3D=3D -1) {
> >             perror("UFFDIO_MOVE");
> >             exit(EXIT_FAILURE);
> >         }
> >     }
> >     return NULL;
> > }
> >
> > int main() {
> > again:
> >     pthread_t thr, madv_thr, swapin_thr;
> >     struct uffdio_api uffdio_api =3D { .api =3D UFFD_API, .features =3D=
 0 };
> >     struct uffdio_register uffdio_register;
> >
> >     src =3D mmap(NULL, REGION_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE
> > | MAP_ANONYMOUS, -1, 0);
> >
> >     if (src =3D=3D MAP_FAILED) {
> >         perror("mmap src");
> >         exit(EXIT_FAILURE);
> >     }
> >
> >     memset(src, 1, REGION_SIZE);
> >
> >     dst =3D mmap(NULL, REGION_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE
> > | MAP_ANONYMOUS, -1, 0);
> >
> >     if (dst =3D=3D MAP_FAILED) {
> >         perror("mmap dst");
> >         exit(EXIT_FAILURE);
> >     }
> >
> >
> >     uffd =3D syscall(SYS_userfaultfd, O_CLOEXEC | O_NONBLOCK);
> >     if (uffd =3D=3D -1) {
> >         perror("userfaultfd");
> >         exit(EXIT_FAILURE);
> >     }
> >
> >
> >     if (ioctl(uffd, UFFDIO_API, &uffdio_api) =3D=3D -1) {
> >         perror("UFFDIO_API");
> >         exit(EXIT_FAILURE);
> >     }
> >
> >     uffdio_register.range.start =3D (unsigned long)dst;
> >     uffdio_register.range.len =3D REGION_SIZE;
> >     uffdio_register.mode =3D UFFDIO_REGISTER_MODE_MISSING;
> >
> >     if (ioctl(uffd, UFFDIO_REGISTER, &uffdio_register) =3D=3D -1) {
> >         perror("UFFDIO_REGISTER");
> >         exit(EXIT_FAILURE);
> >
> >     }
> >
> >     if (pthread_create(&madv_thr, NULL, madvise_thread, NULL) !=3D 0) {
> >         perror("pthread_create madvise_thread");
> >         exit(EXIT_FAILURE);
> >     }
> >
> >     if (pthread_create(&swapin_thr, NULL, swapin_thread, NULL) !=3D 0) =
{
> >         perror("pthread_create swapin_thread");
> >         exit(EXIT_FAILURE);
> >     }
> >
> >     if (pthread_create(&thr, NULL, fault_handler_thread, NULL) !=3D 0) =
{
> >         perror("pthread_create fault_handler_thread");
> >         exit(EXIT_FAILURE);
> >     }
> >
> >     for (size_t i =3D 0; i < REGION_SIZE; i +=3D PAGE_SIZE) {
> >         char val =3D ((char *)dst)[i];
> >         printf("Accessing dst at offset %zu, value: %d\n", i, val);
> >     }
> >
> >     pthread_join(madv_thr, NULL);
> >     pthread_join(swapin_thr, NULL);
> >     pthread_cancel(thr);
> >     pthread_join(thr, NULL);
> >     munmap(src, REGION_SIZE);
> >     munmap(dst, REGION_SIZE);
> >     close(uffd);
> >     goto again;
> >
> >     return 0;
> > }
> >

Thanks
Barry
