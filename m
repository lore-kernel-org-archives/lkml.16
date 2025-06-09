Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E6C27F160
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 04:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749443403; cv=none; b=J15t8+p/dqYGmP73d8wXpxQGlU/qe5+ftsHwOgLC7WNyrhyOC0ZiAqV+ISOEHzbim4briqzBiLNlOQLNSxL1tCDVDxJaOcj7Ap5oUynmFBRhcKSol843W1N+PHRsXbTGO8htKyjGkRWp9hFk1aVy0/Mu502GQnpEvpYaqGlmwc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749443403; c=relaxed/simple;
	bh=RUAu8a8o6viQov+T+0ZK1Z4Oqq/Sk7p4H+rW4de+U2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nv8FiQnntK365w0vvsID/eM+gMNXSxvtlTW3JAHyA/FX/cqEgKe++4DDcU/ghVeeVga9ZcOpiD+HIcF6gq/eKUWZUKxtr0rOlGTMhsfDzIBVrMfpgsSe+hgJKblGSL/n/eFXdjLgXVGW6hxJSEH+RUhqUmnQ+FOuBoQOZpC+anU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaOQtIgi; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaOQtIgi"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52b2290e28eso1009076e0c.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 21:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749443401; x=1750048201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=retmcKtILXm+Ch153nL5bk1V574vggL5lmZxDYU9rSc=;
        b=jaOQtIgiid5ZLE9tACNX/THJp6mjq/RmlVDPA/ZRlggcIwKvynnD2sdViNCMh+xvFu
         tyDcNkHfrv6DoL9Ic4/83detvL/cV8uZPzr5eXNwESIZLVZuQcm37BSsCNy0XqOzn0S1
         hhyg14BOAV33LVGrKF8R06niYIzLZuk/mak8FR+jdDWm+LZUKZH80OcovIF7dbFDiBYc
         RGRgdT2I29dmN7Yg1FqA4+mN7Ax6YWbgel5YMp5C3Iy7cFv3fYfvTda9eFC5beyVpeOt
         eJ4paFSz8ee7/ol1vmaiHmZo7SdFDNd2SnNnx0qV06oasklNuOgR6LwfbAETffipcBIm
         0Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749443401; x=1750048201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=retmcKtILXm+Ch153nL5bk1V574vggL5lmZxDYU9rSc=;
        b=PSNnWuXtSW8GkJtAO4Nvjd3NKhdV4ylC+sgRT+IbTyeMymPmhF8WE3JQSnBcLoK3cl
         qyjI0mC4mSuLef1vWAr6HrSMQbfnn07qtbk+GM43OSbzH9X2g0FoMAYhaR3eG9BoGiTe
         xiVo8TJg9mtJDuv3X2yzNfRdJ9K4oGA+075uBOTBnYw3uJzhN8i1AntB896oa4mnvuwf
         AjdNst+izv5x6mK/gDZ+iiYcn9L+/SN3ezO9up950QphwXRMLBoaLZKkkpO08bz4cJwc
         YBqMLzx+04YsgoSzwaP82jmzxoibmdljsx0Peonup+Yj3NvmI0xlNv7fIaet31IwFOvx
         NaVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqypiycWMwRX2Nb4OpF6DPsbEAiszvipik/s8rz4G47HVJITQOc/ZXdB9CooCkLINuJZ4/h5fbXhjHmb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyGCN5Ocb8X8gTJFZYSbOkEGJYH94/iHezWuQtledhGhQQKVHF
	Azrf0rquTN/yPZr/slXQSSNTautRnST1R9DqkbqulhSSpua3qvkkRJIep3hdxY7BwECzbItPKJ7
	ozulUMGy387BUWKhV5QX1ahDphBjqGgc=
X-Gm-Gg: ASbGncvx42OyY/9YyGjnw5LvlCRBXGRYMPlpNRzdn6YBJ3eTj2u16UD1rZH0pwbS9yo
	g315/Cgde9li1qQx6SWmuzCFJ+UnchJaJs6UDUyU85HQS/zJR+byOJhxb9NqGDvtpTDYX5S2YyK
	C/4kh2wjwdt94Fn3OZyTFYn6ZyCCtfAJFCc5GtKFBkUnc2
X-Google-Smtp-Source: AGHT+IHxtm87Sj/NjmF3Ha6g397nLkq4FED4+G7i1tl+68+hVe5Q4idxLG6nzb3LEXeOEWQysSzWzNsIGu15BxwAl6Q=
X-Received: by 2002:a05:6122:32c9:b0:530:81ad:1d79 with SMTP id
 71dfb90a1353d-530e488e8a2mr9588428e0c.6.1749443400763; Sun, 08 Jun 2025
 21:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608192713.95875-1-ryncsn@gmail.com> <CAGsJ_4xSRdjVac_UdUKBk2-5upeHMEEow3_Q-F_VSa8HYj0mtw@mail.gmail.com>
 <CAMgjq7CZD_otTdhKhsUgoMgLiB8+3ipEFNyTkN_zxnbQECiJNw@mail.gmail.com>
In-Reply-To: <CAMgjq7CZD_otTdhKhsUgoMgLiB8+3ipEFNyTkN_zxnbQECiJNw@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 9 Jun 2025 16:29:49 +1200
X-Gm-Features: AX0GCFtD4GIgaLFa8EXNiuFg--SAoYJ74GK5RhOehvgQd7z2YtKQgLTNXes9H1M
Message-ID: <CAGsJ_4yGa3+V9NcePuKe3pKO79A1Gd=p+ZZ8SjEwgmfR79KyTA@mail.gmail.com>
Subject: Re: [PATCH] mm/shmem, swap: fix softlockup with mTHP swapin
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Usama Arif <usamaarif642@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 2:32=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrote=
:
>
> On Mon, Jun 9, 2025 at 7:58=E2=80=AFAM Barry Song <21cnbao@gmail.com> wro=
te:
> >
> > On Mon, Jun 9, 2025 at 7:27=E2=80=AFAM Kairui Song <ryncsn@gmail.com> w=
rote:
> > >
> > > From: Kairui Song <kasong@tencent.com>
> > >
> > > Following softlockup can be easily reproduced on my test machine with=
:
> > >
> > > echo always > /sys/kernel/mm/transparent_hugepage/hugepages-64kB/enab=
led
> > > swapon /dev/zram0 # zram0 is a 48G swap device
> > > mkdir -p /sys/fs/cgroup/memory/test
> > > echo 1G > /sys/fs/cgroup/test/memory.max
> > > echo $BASHPID > /sys/fs/cgroup/test/cgroup.procs
> > > while true; do
> > >     dd if=3D/dev/zero of=3D/tmp/test.img bs=3D1M count=3D5120
> > >     cat /tmp/test.img > /dev/null
> > >     rm /tmp/test.img
> > > done
> > >
> > > Then after a while:
> > > watchdog: BUG: soft lockup - CPU#0 stuck for 763s! [cat:5787]
> > > Modules linked in: zram virtiofs
> > > CPU: 0 UID: 0 PID: 5787 Comm: cat Kdump: loaded Tainted: G           =
  L      6.15.0.orig-gf3021d9246bc-dirty #118 PREEMPT(voluntary)=C2=B7
> > > Tainted: [L]=3DSOFTLOCKUP
> > > Hardware name: Red Hat KVM/RHEL-AV, BIOS 0.0.0 02/06/2015
> > > RIP: 0010:mpol_shared_policy_lookup+0xd/0x70
> > > Code: e9 b8 b4 ff ff 31 c0 c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 =
90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00 00 41 54 55 53 <48> 8b 1f 4=
8 85 db 74 41 4c 8d 67 08 48 89 fb 48 89 f5 4c 89 e7 e8
> > > RSP: 0018:ffffc90002b1fc28 EFLAGS: 00000202
> > > RAX: 00000000001c20ca RBX: 0000000000724e1e RCX: 0000000000000001
> > > RDX: ffff888118e214c8 RSI: 0000000000057d42 RDI: ffff888118e21518
> > > RBP: 000000000002bec8 R08: 0000000000000001 R09: 0000000000000000
> > > R10: 0000000000000bf4 R11: 0000000000000000 R12: 0000000000000001
> > > R13: 00000000001c20ca R14: 00000000001c20ca R15: 0000000000000000
> > > FS:  00007f03f995c740(0000) GS:ffff88a07ad9a000(0000) knlGS:000000000=
0000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 00007f03f98f1000 CR3: 0000000144626004 CR4: 0000000000770eb0
> > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > PKRU: 55555554
> > > Call Trace:
> > >  <TASK>
> > >  shmem_alloc_folio+0x31/0xc0
> > >  shmem_swapin_folio+0x309/0xcf0
> > >  ? filemap_get_entry+0x117/0x1e0
> > >  ? xas_load+0xd/0xb0
> > >  ? filemap_get_entry+0x101/0x1e0
> > >  shmem_get_folio_gfp+0x2ed/0x5b0
> > >  shmem_file_read_iter+0x7f/0x2e0
> > >  vfs_read+0x252/0x330
> > >  ksys_read+0x68/0xf0
> > >  do_syscall_64+0x4c/0x1c0
> > >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > RIP: 0033:0x7f03f9a46991
> > > Code: 00 48 8b 15 81 14 10 00 f7 d8 64 89 02 b8 ff ff ff ff eb bd e8 =
20 ad 01 00 f3 0f 1e fa 80 3d 35 97 10 00 00 74 13 31 c0 0f 05 <48> 3d 00 f=
0 ff ff 77 4f c3 66 0f 1f 44 00 00 55 48 89 e5 48 83 ec
> > > RSP: 002b:00007fff3c52bd28 EFLAGS: 00000246 ORIG_RAX: 000000000000000=
0
> > > RAX: ffffffffffffffda RBX: 0000000000040000 RCX: 00007f03f9a46991
> > > RDX: 0000000000040000 RSI: 00007f03f98ba000 RDI: 0000000000000003
> > > RBP: 00007fff3c52bd50 R08: 0000000000000000 R09: 00007f03f9b9a380
> > > R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000040000
> > > R13: 00007f03f98ba000 R14: 0000000000000003 R15: 0000000000000000
> > >  </TASK>
> > >
> > > The reason is simple, readahead brought some order 0 folio in swap
> > > cache, and the swapin mTHP folio being allocated is in confict with i=
t,
> > > so swapcache_prepare fails and causes shmem_swap_alloc_folio to retur=
n
> > > -EEXIST, and shmem simply retries again and again causing this loop.
> > >
> > > Fix it by applying a similar fix for anon mTHP swapin.
> > >
> > > The performance change is very slight, time of swapin 10g zero folios
> > > (test for 12 times):
> > > Before:  2.49s
> > > After:   2.52s
> > >
> > > Fixes: 1dd44c0af4fa1 ("mm: shmem: skip swapcache for swapin of synchr=
onous swap device")
> > > Signed-off-by: Kairui Song <kasong@tencent.com>
> > >
> > > ---
> > >
> > > I found this issue while doing a performance comparing of mm-new with
> > > swap table series [1] on top of mm-new. This issue no longer exists
> > > if the swap table series is applied, because it elimated both
> > > SWAP_HAS_CACHE and SWP_SYNCHRONOUS_IO swapin completely while improvi=
ng
> > > the performance and simplify the code, and the race swapin is solved
> > > differently by then.
> > >
> > > (The zero map fix might still need to stay for a while, but could be
> > > optimized too later with swap table).
> > >
> > > It will be good if the swap table series could get reviewed and merge=
d
> > > to avoid more fixes like this. SWAP_HAS_CACHE and SWP_SYNCHRONOUS_IO =
has
> > > a history of causing many issues. I'll do a swap table rebase on top =
of
> > > this fix, if this one is accepted.
> > >
> > > And for a comparision, swap in 10G into shmem:
> > >
> > > Before this patch:  2.49s
> > > After this patch:   2.52s
> > > After swap table:   2.37s (Removing SWAP_HAS_CACHE and SWP_SYNCHRONOU=
S_IO,
> > >                            still not in the best shape but looking go=
od)
> > >
> > > Link: https://lore.kernel.org/linux-mm/20250514201729.48420-1-ryncsn@=
gmail.com/ [1]
> > >
> > >  mm/memory.c | 20 --------------------
> > >  mm/shmem.c  | 12 +++++++++++-
> > >  mm/swap.h   | 19 +++++++++++++++++++
> > >  3 files changed, 30 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 9ead7ab07e8e..3845ed068d74 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -4313,26 +4313,6 @@ static struct folio *__alloc_swap_folio(struct=
 vm_fault *vmf)
> > >  }
> > >
> > >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > > -static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
> > > -{
> > > -       struct swap_info_struct *si =3D swp_swap_info(entry);
> > > -       pgoff_t offset =3D swp_offset(entry);
> > > -       int i;
> > > -
> > > -       /*
> > > -        * While allocating a large folio and doing swap_read_folio, =
which is
> > > -        * the case the being faulted pte doesn't have swapcache. We =
need to
> > > -        * ensure all PTEs have no cache as well, otherwise, we might=
 go to
> > > -        * swap devices while the content is in swapcache.
> > > -        */
> > > -       for (i =3D 0; i < max_nr; i++) {
> > > -               if ((si->swap_map[offset + i] & SWAP_HAS_CACHE))
> > > -                       return i;
> > > -       }
> > > -
> > > -       return i;
> > > -}
> > > -
> > >  /*
> > >   * Check if the PTEs within a range are contiguous swap entries
> > >   * and have consistent swapcache, zeromap.
> > > diff --git a/mm/shmem.c b/mm/shmem.c
> > > index 73182e904f9c..484cd3043a78 100644
> > > --- a/mm/shmem.c
> > > +++ b/mm/shmem.c
> > > @@ -1995,6 +1995,14 @@ static struct folio *shmem_swap_alloc_folio(st=
ruct inode *inode,
> > >          */
> > >         if (swapcache_prepare(entry, nr_pages)) {
> > >                 folio_put(new);
> > > +
> > > +               /*
> > > +                * A smaller folio is in the swap cache, mTHP swapin =
will always fail
> > > +                * until it's gone. Return -EINVAL to fallback to ord=
er 0.
> > > +                */
> > > +               if (non_swapcache_batch(entry, nr_pages) !=3D nr_page=
s)
> > > +                       return ERR_PTR(-EINVAL);
> > > +
>
> Hi Barry,
>
> > We're doing this before swapcache_prepare() for mTHP swapin. Why does i=
t
> > happen after swapcache_prepare() in the shmem case?
>
> `non_swapcache_batch(entry, nr_pages) !=3D nr_pages` is unlikely, that's
> the reason why no one noticed this issue so far, so moving it after
> swapcache_prepare can help avoid overhead caused by it in the common
> case. swapcache_prepare already implies this check, but
> swapcache_prepare can fall for multiple reasons, and shmem should and
> only should fallback to order 0 swapin if it's caused by an existing
> cache. (currently shmem unconditionally retry)

Maybe it's because people are running it on systems with plenty of memory?
Once we run it on a system with limited memory, we might see more failures
allocating large folios and fall back to order-0 more often?
For example, what if there's a 50% chance of failing to allocate large
folios?

>
> And non_swapcache_batch might not be the best solution here, it also
> might have false positives, we can add a full filemap lookup here, but
> might be overkill for a corner case like this. I still think merge
> swap cache with swap_map using swap table is the long term solution.
>
> Maybe I'm premature optimizing it, I can use the easier to review
> implementation (same way with anon mTHP) and do a quick benchmark, if
> there is no obvious performance change I'll use that style in V2.

Right, the current approach is a bit hard to follow, since we ultimately
change the return value from -EEXIST to -EINVAL. It does feel like there=E2=
=80=99s
some back-and-forth. But anyway, let=E2=80=99s look at the data=E2=80=94if =
the current
approach yields better results, we can refine the code comments to make
it easier to understand.

Thanks
Barry
