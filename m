Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DD81F1505
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749461318; cv=none; b=u77ykhFRXr7Du3KZQcFPDDUYP6KOGrVCZFZw0Jjbme3tjWCgi2SSgtLxx8LPJrN6mB3dHXmzMOBRS6ajNWK6fPoCJyZiwDY4ZzriIBnteyptzrvC6kg3ywuyxKY0zBa24dDHID4o5lrQZeMWrxSIYrcz6kx8hZPGH58LV5jmJco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749461318; c=relaxed/simple;
	bh=SP+Zz0yPxZlcVQLgL8QklXDqpi5XPLz/gvRyfMXXBg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKeNgLsD/O/ixIT8JnsGT2FTLkXzHoKkxio9x/FcsnJ8zXe0EXpu3Zn5n5KGV7Iq+BdA8ZdCAhNirMcdIkVKt6lwxLYNEp3/3xV96g1md3jVg7+DDuLvwZXio+dJurEp4G6B4zPJBiiNPqmROXPVAb2IGcO5VLrq2A8XVj1LNEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEzFI8ih; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEzFI8ih"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b019bdeaaso6688351fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 02:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749461315; x=1750066115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3RVTX224fxutsjQgCa0V5lUr5xGGcvXr8obuMTxYl4=;
        b=dEzFI8ihCNUtO2G8mH6mkZtzpR0WUlad4mk44XbfodNSRLPWO1Yhg1HlggZCiK/oJz
         S7xU5TmakXUCAStRkxi64BojmV/N446HjRl9Z8We49H/QI1r7xgAfr8Ee2OUtvpVlkkp
         uAT+4iPRscPrqP3vvmh2lG2yW3Os6zdgRmGq9yo3wC86xoqzFvHO5gWRocVwowdiEaHN
         fZisP23o7LR+zKEI6fy1erSNAyS3z5+eUaL6uO77aZOen2Tm5V9C+E4waoNJyNNi0MhT
         nlGbmpTxCFN1Ixr9mU81r5ccubTB/MeNZghKNNx9GBOCEevO7kHhvZ6moWhWMI2M9MfL
         jxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749461315; x=1750066115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3RVTX224fxutsjQgCa0V5lUr5xGGcvXr8obuMTxYl4=;
        b=U+WRM9pHEVWMW1zqSrtAhNdUPUdkaUarpPBoYBmTuZ0hfl/bJRRQv2Wk+U8L73CgXG
         5emxBH105EUC30U0ubiJdU2bzrIDqlkBSeoH+GMX5pmQ+6nZMwF1OrPWnxsrsnGivMCA
         1j3rs7IoFk0/ryRbXYYgTfG+554H17l9iuO1i0KdTyaGRNzc0Eoyfn91oZ2WbcuUvun8
         uhowjuzbKTIW7Tm5cb7dsr308VzSDNblIo+FdvgiVyabKvwLeHACoo/Ujxkt5j5B45NN
         EqOkqMTb25hu53IVb8x32ERj9WOzjMd8w7vt2H5bF3TgiiLaaDJ3MikGyvNirtVaE808
         ukVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7gV8ERenddr/q4RaQtKjEz7o4YLxqMXlt6x42guF5rMMjivibZ5XRfAGWTQapye4MtlNIgAeeWcISF0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcQjUQD/8ETAtVNRNbhKaiQQMLAIzMhP6VZ0JKoBh+hc62VglP
	xqlJB17P39LBoKef4r6gohVU77e9hoH/MYJ0mgPtDk8ACFxfj0iw0P8cSvJvgTu4DSSZRr+ZSKO
	XIKLIojPDvk4/QxBF/XoqaISbPbow3bBDs2XsNpk=
X-Gm-Gg: ASbGncvm+66iVpI7vzRCwrcunPJ/+UxFNp/jrZ15GoWcXiStYjZ1MQ55TQaLpvOa4EK
	P38dNfMq2hYCbVR5O07fj1o+d2Pa/eqIuU4GVYVYs9V16rpvJhWhQuuUA1o/rTGdMsfe524zYDW
	B6FOs7RLo4+qxISZvuBqcyT2axcKlQ6/jWueyrYa3S460=
X-Google-Smtp-Source: AGHT+IEEHzBZkj3DwIgLxYH+JjYZ8FU+NrT9NolEs18qFDQfCm0isvA81b+m6nu6OIrFM7LDSx4TxLyE4cmpSG0XDNw=
X-Received: by 2002:a2e:be20:0:b0:32a:7e4c:e915 with SMTP id
 38308e7fff4ca-32adfe26f37mr35748801fa.29.1749461314445; Mon, 09 Jun 2025
 02:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608192713.95875-1-ryncsn@gmail.com> <36f52466-071a-4efb-adc2-8514b11f120c@linux.alibaba.com>
 <CAMgjq7AawxHKX8TRnshZzzUznCZbdfncThyLmA5URKBGq3r4Hw@mail.gmail.com>
 <1452d0c6-50ab-4680-9aa9-13290d51177d@linux.alibaba.com> <CAGsJ_4x5BKfcZk6CLu4uKChkjpuk+qYSxJgJ=8A+BM8FGhRyUA@mail.gmail.com>
In-Reply-To: <CAGsJ_4x5BKfcZk6CLu4uKChkjpuk+qYSxJgJ=8A+BM8FGhRyUA@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 9 Jun 2025 17:28:17 +0800
X-Gm-Features: AX0GCFvh0QgAg1TsYdwVqeLSHuvEeT4BuRW4TMbRfRIqqPSFtanIR30HYpz4buM
Message-ID: <CAMgjq7CVZmfU=wqihez=23L=tbhTJAgDhwj2LDJzuXDzjUaMSw@mail.gmail.com>
Subject: Re: [PATCH] mm/shmem, swap: fix softlockup with mTHP swapin
To: Barry Song <21cnbao@gmail.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Usama Arif <usamaarif642@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 4:55=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrote=
:
>
> On Mon, Jun 9, 2025 at 8:49=E2=80=AFPM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
> >
> >
> >
> > On 2025/6/9 16:36, Kairui Song wrote:
> > > On Mon, Jun 9, 2025 at 4:27=E2=80=AFPM Baolin Wang
> > > <baolin.wang@linux.alibaba.com> wrote:
> > >> On 2025/6/9 03:27, Kairui Song wrote:
> > >>> From: Kairui Song <kasong@tencent.com>
> > >>>
> > >>> Following softlockup can be easily reproduced on my test machine wi=
th:
> > >>>
> > >>> echo always > /sys/kernel/mm/transparent_hugepage/hugepages-64kB/en=
abled
> > >>> swapon /dev/zram0 # zram0 is a 48G swap device
> > >>> mkdir -p /sys/fs/cgroup/memory/test
> > >>> echo 1G > /sys/fs/cgroup/test/memory.max
> > >>> echo $BASHPID > /sys/fs/cgroup/test/cgroup.procs
> > >>> while true; do
> > >>>       dd if=3D/dev/zero of=3D/tmp/test.img bs=3D1M count=3D5120
> > >>>       cat /tmp/test.img > /dev/null
> > >>>       rm /tmp/test.img
> > >>> done
> > >>>
> > >>> Then after a while:
> > >>> watchdog: BUG: soft lockup - CPU#0 stuck for 763s! [cat:5787]
> > >>> Modules linked in: zram virtiofs
> > >>> CPU: 0 UID: 0 PID: 5787 Comm: cat Kdump: loaded Tainted: G         =
    L      6.15.0.orig-gf3021d9246bc-dirty #118 PREEMPT(voluntary)=C2=B7
> > >>> Tainted: [L]=3DSOFTLOCKUP
> > >>> Hardware name: Red Hat KVM/RHEL-AV, BIOS 0.0.0 02/06/2015
> > >>> RIP: 0010:mpol_shared_policy_lookup+0xd/0x70
> > >>> Code: e9 b8 b4 ff ff 31 c0 c3 cc cc cc cc 90 90 90 90 90 90 90 90 9=
0 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00 00 41 54 55 53 <48> 8b 1f=
 48 85 db 74 41 4c 8d 67 08 48 89 fb 48 89 f5 4c 89 e7 e8
> > >>> RSP: 0018:ffffc90002b1fc28 EFLAGS: 00000202
> > >>> RAX: 00000000001c20ca RBX: 0000000000724e1e RCX: 0000000000000001
> > >>> RDX: ffff888118e214c8 RSI: 0000000000057d42 RDI: ffff888118e21518
> > >>> RBP: 000000000002bec8 R08: 0000000000000001 R09: 0000000000000000
> > >>> R10: 0000000000000bf4 R11: 0000000000000000 R12: 0000000000000001
> > >>> R13: 00000000001c20ca R14: 00000000001c20ca R15: 0000000000000000
> > >>> FS:  00007f03f995c740(0000) GS:ffff88a07ad9a000(0000) knlGS:0000000=
000000000
> > >>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > >>> CR2: 00007f03f98f1000 CR3: 0000000144626004 CR4: 0000000000770eb0
> > >>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > >>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > >>> PKRU: 55555554
> > >>> Call Trace:
> > >>>    <TASK>
> > >>>    shmem_alloc_folio+0x31/0xc0
> > >>>    shmem_swapin_folio+0x309/0xcf0
> > >>>    ? filemap_get_entry+0x117/0x1e0
> > >>>    ? xas_load+0xd/0xb0
> > >>>    ? filemap_get_entry+0x101/0x1e0
> > >>>    shmem_get_folio_gfp+0x2ed/0x5b0
> > >>>    shmem_file_read_iter+0x7f/0x2e0
> > >>>    vfs_read+0x252/0x330
> > >>>    ksys_read+0x68/0xf0
> > >>>    do_syscall_64+0x4c/0x1c0
> > >>>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > >>> RIP: 0033:0x7f03f9a46991
> > >>> Code: 00 48 8b 15 81 14 10 00 f7 d8 64 89 02 b8 ff ff ff ff eb bd e=
8 20 ad 01 00 f3 0f 1e fa 80 3d 35 97 10 00 00 74 13 31 c0 0f 05 <48> 3d 00=
 f0 ff ff 77 4f c3 66 0f 1f 44 00 00 55 48 89 e5 48 83 ec
> > >>> RSP: 002b:00007fff3c52bd28 EFLAGS: 00000246 ORIG_RAX: 0000000000000=
000
> > >>> RAX: ffffffffffffffda RBX: 0000000000040000 RCX: 00007f03f9a46991
> > >>> RDX: 0000000000040000 RSI: 00007f03f98ba000 RDI: 0000000000000003
> > >>> RBP: 00007fff3c52bd50 R08: 0000000000000000 R09: 00007f03f9b9a380
> > >>> R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000040000
> > >>> R13: 00007f03f98ba000 R14: 0000000000000003 R15: 0000000000000000
> > >>>    </TASK>
> > >>>
> > >>> The reason is simple, readahead brought some order 0 folio in swap
> > >>> cache, and the swapin mTHP folio being allocated is in confict with=
 it,
> > >>> so swapcache_prepare fails and causes shmem_swap_alloc_folio to ret=
urn
> > >>> -EEXIST, and shmem simply retries again and again causing this loop=
.
> > >>
> > >> If swapcache_prepare() fails and retries, the folio's order (order 0=
)
> > >> getting from swapcache will be different from the order stored in th=
e
> > >> shmem mapping, so we will split the large swap entry by the followin=
g
> > >> logic in shmem_swapin_folio(). So I am not sure why causing a softlo=
ckup?
> > >>
> > >>          } else if (order !=3D folio_order(folio)) {
> > >>                  /*
> > >>                   * Swap readahead may swap in order 0 folios into s=
wapcache
> > >>                   * asynchronously, while the shmem mapping can stil=
l stores
> > >>                   * large swap entries. In such cases, we should spl=
it the
> > >>                   * large swap entry to prevent possible data corrup=
tion.
> > >>                   */
> > >>                  split_order =3D shmem_split_large_entry(inode, inde=
x, swap, gfp);
> > >>                  if (split_order < 0) {
> > >>                          error =3D split_order;
> > >>                          goto failed;
> > >>                  }
> > >>
> > >>                  /*
> > >>                   * If the large swap entry has already been split, =
it is
> > >>                   * necessary to recalculate the new swap entry base=
d on
> > >>                   * the old order alignment.
> > >>                   */
> > >>                  if (split_order > 0) {
> > >>                          pgoff_t offset =3D index - round_down(index=
, 1 << split_order);
> > >>
> > >>                          swap =3D swp_entry(swp_type(swap), swp_offs=
et(swap) + offset);
> > >>                  }
> > >>          }
> > >
> > > For example if the swap entry is 0x0 in shmem with order 4 (so it
> > > corresponds to swap entries 0x0 - 0x10), and a order 0 folio is
> > > currently cached with swap entry 0xa, then shmem swapin will try to
> > > use a folio with order 4, that will always fails swapcache_prepare,
> > > but filemap/swapcache lookup use entry 0x0 will return NULL, causing =
a
> > > loop.
> >
> > OK. Thanks for the explanation.
> >
> > >>> Fix it by applying a similar fix for anon mTHP swapin.
> > >>>
> > >>> The performance change is very slight, time of swapin 10g zero foli=
os
> > >>> (test for 12 times):
> > >>> Before:  2.49s
> > >>> After:   2.52s
> > >>>
> > >>> Fixes: 1dd44c0af4fa1 ("mm: shmem: skip swapcache for swapin of sync=
hronous swap device")
> > >>> Signed-off-by: Kairui Song <kasong@tencent.com>
> > >>>
> > >>> ---
> > >>>
> > >>> I found this issue while doing a performance comparing of mm-new wi=
th
> > >>> swap table series [1] on top of mm-new. This issue no longer exists
> > >>> if the swap table series is applied, because it elimated both
> > >>> SWAP_HAS_CACHE and SWP_SYNCHRONOUS_IO swapin completely while impro=
ving
> > >>> the performance and simplify the code, and the race swapin is solve=
d
> > >>> differently by then.
> > >>>
> > >>> (The zero map fix might still need to stay for a while, but could b=
e
> > >>> optimized too later with swap table).
> > >>
> > >> I don't understand why adding zeromap changes, and should explain th=
is
> > >> explicitly.
> > >
> > > To stay in consistency with anon mTHP swapin, swap_zeromap_batch have
> > > it's own comments that a hybird folio with zero and non-zero pages
> > > can't be brought back as a whole. I can mention that in the commit
> > > message.
>
> For mTHP swapin, we need the zeromap check because we have no way to reco=
rd
> whether there was a prior mTHP swap-out. So we rely on checking the
> continuity of swap offsets.
>
> It=E2=80=99s entirely possible that, in the past, several small folios we=
re
> swapped out to consecutive locations, and one of them happened to be a
> zero folio, while the others were not.
>
> But for shmem, we have a place to record that information -   we swapped-=
out
> a mTHP, right?
>
> Regarding zeromap: for an mTHP swap-out, we currently can't mark subpages
> individually as zeromap=E2=80=94it=E2=80=99s either all-zero for every su=
bpage or none are.

Thanks for the declaration! Yes, that's correct, I wasn't sure if zero
map will mark subpages so just left the check there. Will remove the
check in V2.

> So maybe we don't need swap_zeromap_batch()  for shmem?

Right, it's not needed here, the fix will be simpler.
