Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA2928CF7F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557253; cv=none; b=rtMYPjkd+/WteEsBW4BPgyutVXzz1NxaoxuQlaTF8EyuYDg7WQ++ZT9gjoJwXiQ35oBvTjN59BBSnxv8bAkF2+DhlBd2emh5yquUstsgk/s/x7y3qJdf/aVvwQ/wh5FzMhwDbgWSVjuhJWKivyzdivdfcBoNOWETNpqnnTmFI8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557253; c=relaxed/simple;
	bh=ouyzXuBF+fVbp+yOqabfIpHEJ6bpxZbs6bw2CP6uQL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5J1I8ioh1fTojfMArhYQ8IsiNrkS3bDF3M3PHQCNwJdpOO7XaijW0LPuM/Q/matSa8h9cSYeqQio7Q3FggIQPJiWWaHwqHOxHQgo9emACKaqN0beTYkkI3XepCs1ukDcpQbLoubwzHM7do2nd06ehw+YMDpjRc0TnSbfWIT/dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOi6nFDt; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOi6nFDt"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32ac52f78c1so54256651fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749557250; x=1750162050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80j8xEIjFLLgM50tb0hHAecK03VFnu4CWMtVgyhnh6w=;
        b=jOi6nFDtp2HLOjjgfO4QQDtmLhDS/v21s6Ot8ESV3CWY1wF2GHWsI0hZYvIiK8pABQ
         xPN+3Yksq+x6Ufo9eqSKi7sG70/XP0CDve9zGqCGvNzHkjtqqymXKO8HFtDHG7YLVQjd
         r7tlbGVAam1lz+/QO9wVKO0/2YP9970jbI2FJWudb3x9Fub0okBCPJ9HOZq9D20THSMm
         po1UVowOXZFxapHtehRyTl1FZwud0n2Tx98ii7Wrl3J7dv2JyVPOsKDzCo8PUCo8hYFW
         89NaISq6DwnF9YzjIornO/mUF4U5reqpz5lvMCklGOm/6I37qDl4f+sfEiuw9bWRutAi
         nB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557250; x=1750162050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80j8xEIjFLLgM50tb0hHAecK03VFnu4CWMtVgyhnh6w=;
        b=S8T8oo0m26j+Gs/cRVB1jbMwhLjQjEsX7T/DAs1AmCxeomcNTW3iz14e1f8fTA3ieG
         lcR1x7QMAYJsxLlzWUe4o61flm09e8R0loiQ4NTPoTvXIN00CDgEkkv9SdFqkaFd1wQT
         ZMrIQnbk6CbcDNyXZg1mcu+3p+NRc4LkVQ51oxGAzz9FfejryrUfeWKCrzoerhLhV2/2
         kKoqVWsjLQjTnUZypbyyXGLB3Ldtkv0elOLscOYIfVX3dcN/bYyer2jiRWvbkogDDRhU
         MMkiQOJhPBR4o59HpDqCLwyt7ZPY0bxC/n4bWEtWywh9ibcP2hx6c5Lpl8LqG6qaTGri
         5fWA==
X-Forwarded-Encrypted: i=1; AJvYcCUfsYP0y76L37jWrhfGyzxwGfSDPpK/AGRnpj6p+dVsFT3Utc2NtMcNB0OihXOZ2qnpBLo4V++ch7aX6Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeW0l2czdW1HDHYJkctnwkEbgWbLQfA81MlYVlaH0RUInmAAH7
	vAaECuxCqxUUKdoMhE272LxRps+swP3rK+HUcwZMFv8pd7q8Her6AgFXYw34tpd88EZlXJGfoGd
	GGFn3UL0Qxi4p3ZqyhkplbQMbIAyqVdw=
X-Gm-Gg: ASbGnct+uhFWDDeX2bYz0xwn4YS2+DbjRRKzR7RlUNrc/kDaAxN5tEYjjE4ca7t/GCs
	kJgJLoxxcvyexFc47/YoANeGxvce+Sg6i5WrhhOLm8wdRWliihi/wUkgnl8AJwrsPcTONfPQeEw
	j9rljaLXPxPa/xSvfvs1DGUwQqr1UwXbZs2/4ZVOKRqlQ=
X-Google-Smtp-Source: AGHT+IHdzD2n5YjHYhzbVVkX3fKJUE+A2OkJ4mjr5AkBQUC8WdSHmJZHPK//RHgUOKLItQTzNye2FqMINr82G7CYBko=
X-Received: by 2002:a2e:be9e:0:b0:30c:aae:6d61 with SMTP id
 38308e7fff4ca-32adfdebf59mr50516841fa.30.1749557249169; Tue, 10 Jun 2025
 05:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609171751.36305-1-ryncsn@gmail.com> <CAKEwX=Pz7kbvvgfBmspS8L5XKHv6cQ3B1Yvx=Tm1metQXEEW+A@mail.gmail.com>
In-Reply-To: <CAKEwX=Pz7kbvvgfBmspS8L5XKHv6cQ3B1Yvx=Tm1metQXEEW+A@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 10 Jun 2025 20:07:11 +0800
X-Gm-Features: AX0GCFuWYIwav4rBaHsjrNi9kdwf54qgTpqYzrPnbbTLYKH9o3hXXphGU3Ij5ME
Message-ID: <CAMgjq7Akg4HOOPNamgMw+3cNc9-oFzT8Jv9r25Sk0EdGcR3SrA@mail.gmail.com>
Subject: Re: [PATCH v2] mm/shmem, swap: fix softlockup with mTHP swapin
To: Nhat Pham <nphamcs@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, Usama Arif <usamaarif642@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:16=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Mon, Jun 9, 2025 at 10:18=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > From: Kairui Song <kasong@tencent.com>
> >
> > Following softlockup can be easily reproduced on my test machine with:
> >
> > echo always > /sys/kernel/mm/transparent_hugepage/hugepages-64kB/enable=
d
> > swapon /dev/zram0 # zram0 is a 48G swap device
> > mkdir -p /sys/fs/cgroup/memory/test
> > echo 1G > /sys/fs/cgroup/test/memory.max
> > echo $BASHPID > /sys/fs/cgroup/test/cgroup.procs
> > while true; do
> >     dd if=3D/dev/zero of=3D/tmp/test.img bs=3D1M count=3D5120
> >     cat /tmp/test.img > /dev/null
> >     rm /tmp/test.img
> > done
> >
> > Then after a while:
> > watchdog: BUG: soft lockup - CPU#0 stuck for 763s! [cat:5787]
> > Modules linked in: zram virtiofs
> > CPU: 0 UID: 0 PID: 5787 Comm: cat Kdump: loaded Tainted: G             =
L      6.15.0.orig-gf3021d9246bc-dirty #118 PREEMPT(voluntary)=C2=B7
> > Tainted: [L]=3DSOFTLOCKUP
> > Hardware name: Red Hat KVM/RHEL-AV, BIOS 0.0.0 02/06/2015
> > RIP: 0010:mpol_shared_policy_lookup+0xd/0x70
> > Code: e9 b8 b4 ff ff 31 c0 c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 90=
 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00 00 41 54 55 53 <48> 8b 1f 48 =
85 db 74 41 4c 8d 67 08 48 89 fb 48 89 f5 4c 89 e7 e8
> > RSP: 0018:ffffc90002b1fc28 EFLAGS: 00000202
> > RAX: 00000000001c20ca RBX: 0000000000724e1e RCX: 0000000000000001
> > RDX: ffff888118e214c8 RSI: 0000000000057d42 RDI: ffff888118e21518
> > RBP: 000000000002bec8 R08: 0000000000000001 R09: 0000000000000000
> > R10: 0000000000000bf4 R11: 0000000000000000 R12: 0000000000000001
> > R13: 00000000001c20ca R14: 00000000001c20ca R15: 0000000000000000
> > FS:  00007f03f995c740(0000) GS:ffff88a07ad9a000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00007f03f98f1000 CR3: 0000000144626004 CR4: 0000000000770eb0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > PKRU: 55555554
> > Call Trace:
> >  <TASK>
> >  shmem_alloc_folio+0x31/0xc0
> >  shmem_swapin_folio+0x309/0xcf0
> >  ? filemap_get_entry+0x117/0x1e0
> >  ? xas_load+0xd/0xb0
> >  ? filemap_get_entry+0x101/0x1e0
> >  shmem_get_folio_gfp+0x2ed/0x5b0
> >  shmem_file_read_iter+0x7f/0x2e0
> >  vfs_read+0x252/0x330
> >  ksys_read+0x68/0xf0
> >  do_syscall_64+0x4c/0x1c0
> >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > RIP: 0033:0x7f03f9a46991
> > Code: 00 48 8b 15 81 14 10 00 f7 d8 64 89 02 b8 ff ff ff ff eb bd e8 20=
 ad 01 00 f3 0f 1e fa 80 3d 35 97 10 00 00 74 13 31 c0 0f 05 <48> 3d 00 f0 =
ff ff 77 4f c3 66 0f 1f 44 00 00 55 48 89 e5 48 83 ec
> > RSP: 002b:00007fff3c52bd28 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> > RAX: ffffffffffffffda RBX: 0000000000040000 RCX: 00007f03f9a46991
> > RDX: 0000000000040000 RSI: 00007f03f98ba000 RDI: 0000000000000003
> > RBP: 00007fff3c52bd50 R08: 0000000000000000 R09: 00007f03f9b9a380
> > R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000040000
> > R13: 00007f03f98ba000 R14: 0000000000000003 R15: 0000000000000000
> >  </TASK>
> >
> > The reason is simple, readahead brought some order 0 folio in swap
> > cache, and the swapin mTHP folio being allocated is in confict with it,
> > so swapcache_prepare fails and causes shmem_swap_alloc_folio to return
> > -EEXIST, and shmem simply retries again and again causing this loop.
> >
> > Fix it by applying a similar fix for anon mTHP swapin.
> >
> > The performance change is very slight, time of swapin 10g zero folios
> > with shmem (test for 12 times):
> > Before:  2.47s
> > After:   2.48s
> >
> > Fixes: 1dd44c0af4fa1 ("mm: shmem: skip swapcache for swapin of synchron=
ous swap device")
> > Signed-off-by: Kairui Song <kasong@tencent.com>
>
> LGTM.
> Acked-by: Nhat Pham <nphamcs@gmail.com>
>
> >
> > ---
> >
> > V1: https://lore.kernel.org/linux-mm/20250608192713.95875-1-ryncsn@gmai=
l.com/
> > Updates:
> > - Move non_swapcache_batch check before swapcache_prepare, I was
> >   expecting this could improve the performance, turns out it barely
> >   helps and may even cause more overhead in some cases. [ Barry Song ]
> > - Remove zero map check, no need to do that for shmem [ Barry Song,
> >   Baolin Wang ]
> > - Fix build bot error.
> >
> >  mm/memory.c | 20 --------------------
> >  mm/shmem.c  |  4 +++-
> >  mm/swap.h   | 23 +++++++++++++++++++++++
> >  3 files changed, 26 insertions(+), 21 deletions(-)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 9ead7ab07e8e..3845ed068d74 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4313,26 +4313,6 @@ static struct folio *__alloc_swap_folio(struct v=
m_fault *vmf)
> >  }
> >
> >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > -static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
> > -{
> > -       struct swap_info_struct *si =3D swp_swap_info(entry);
> > -       pgoff_t offset =3D swp_offset(entry);
> > -       int i;
> > -
> > -       /*
> > -        * While allocating a large folio and doing swap_read_folio, wh=
ich is
> > -        * the case the being faulted pte doesn't have swapcache. We ne=
ed to
> > -        * ensure all PTEs have no cache as well, otherwise, we might g=
o to
> > -        * swap devices while the content is in swapcache.
> > -        */
> > -       for (i =3D 0; i < max_nr; i++) {
> > -               if ((si->swap_map[offset + i] & SWAP_HAS_CACHE))
> > -                       return i;
> > -       }
> > -
> > -       return i;
> > -}
> > -
> >  /*
> >   * Check if the PTEs within a range are contiguous swap entries
> >   * and have consistent swapcache, zeromap.
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 73182e904f9c..a4fdfbd086f1 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -2256,6 +2256,7 @@ static int shmem_swapin_folio(struct inode *inode=
, pgoff_t index,
> >         folio =3D swap_cache_get_folio(swap, NULL, 0);
> >         order =3D xa_get_order(&mapping->i_pages, index);
> >         if (!folio) {
> > +               int nr_pages =3D 1 << order;
> >                 bool fallback_order0 =3D false;
> >
> >                 /* Or update major stats only when swapin succeeds?? */
> > @@ -2271,7 +2272,8 @@ static int shmem_swapin_folio(struct inode *inode=
, pgoff_t index,
> >                  * to swapin order-0 folio, as well as for zswap case.
>
> nit: maybe update the above comment?

Good idea. There are already some comments in non_swapcache_batch and
I've updated it for this commit, but mentioning it here definitely
helps more.


>
> >                  */
> >                 if (order > 0 && ((vma && unlikely(userfaultfd_armed(vm=
a))) ||
> > -                                 !zswap_never_enabled()))
> > +                                 !zswap_never_enabled() ||
> > +                                 non_swapcache_batch(swap, nr_pages) !=
=3D nr_pages))
> >                         fallback_order0 =3D true;
> >
> >                 /* Skip swapcache for synchronous device. */
> > diff --git a/mm/swap.h b/mm/swap.h
> > index e87a0f19a0ee..911ad5ff0f89 100644
> > --- a/mm/swap.h
> > +++ b/mm/swap.h
> > @@ -108,6 +108,25 @@ static inline int swap_zeromap_batch(swp_entry_t e=
ntry, int max_nr,
> >                 return find_next_bit(sis->zeromap, end, start) - start;
> >  }
> >
>
