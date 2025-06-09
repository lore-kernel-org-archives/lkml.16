Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A97B19F11F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459336; cv=none; b=rdeJN+0C3KCYFewHigB/NAH3d8xahMPCTrP+XHs4SMi8PM7OXE3Zjb0fE1K1xrCX/Te68JeFsjSZaKlFaKakKP1Qg0Ge5UVTU+ECUp0wSxZIX0Bwf65R8RVXW0FaYI/8Joj9OvXWtyBMbJsGV+PgWUMATWgWPhHbdQtqqMxeZD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459336; c=relaxed/simple;
	bh=O28L8NaYFdHaeaVPrtevdTihwp3OriKkwD00zmuSrM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PykX32IapTKTNsDHQS+u5Wrrc+Kmw9xfeH3w5JcBvcmP/+emDPgFhSDZoPEVHv8tQJdJeOH0WzQih1DC3Y6Mye9ADFgd2isCIkBM5kfVXxuxuGc83Kku6g8gnOpcxFOeGaBeOWExWvREWfxL17hsf1t9cYkOjG5zIoG07Hkh8Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HroH0XIL; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HroH0XIL"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87eca1c19e2so193645241.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 01:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749459333; x=1750064133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWUCzRZgRJ5VFllFfaWokn2i/RsN736Y8YeRkYVNhCA=;
        b=HroH0XILZcEAjuyIqxHJscAabN5tOr3yTeY2bW8oIlao4IQRrnAoIPvfmc7i9U7LFU
         g7uSbZMafX4I//7AEfHXx+EBQKWnzeSemz4FAMGxjZjLKLNGb16tKG1A9tV1l7k+UFdp
         BlckFMW8LKIxgoFntf/6RE/fIHBd7wDrqp3AcxQmo9w7Plr3ujbofdpYaTarUyhWmzvt
         p0Jpvg2E4YUkr86hpjPdioxemKUim3FXfFI9yDJ9sjaD1B8/0Nb1wr/q3Qa90xXbvSMc
         vOTDkKdQPW6sgZmbc8xvMny3YYH389I3WN+09bZunOaDDzu1neI5xR6qVuswb6hbVECG
         mT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749459333; x=1750064133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWUCzRZgRJ5VFllFfaWokn2i/RsN736Y8YeRkYVNhCA=;
        b=FNNZjkax7q7rMVvUALwCNU99Qj7w6irhm/V47UXOgOUOONUcjowfMM6nuW21Z3ozgZ
         agmivDiA8NXxfeLmZx3LvVuhQXJs5lOF0/qEhfOA+DFszlwQqLwZSj+GUSofrmzjbpkI
         fTWc2wkJmIgW519alGzbAqkj6l8isGsB+tbenTrGLDfcMzD39SFytyk/Zh0lHCqVZEmO
         if53aXxcpYBZnwf/bmY+JIfdAl1MgT6gYykEabqbS5UpeRUn4UF+BM2aTKerJgHV8/mE
         3H9dyRAjsS9rsBrClgn8YMEUuBgDUmn07VcYz2PTnb+xbX8DX4r9qL/rZEevZ+Mfdadd
         tDMA==
X-Forwarded-Encrypted: i=1; AJvYcCXyJMXKY7GOQ4C84TV39lpJojwxYew922giezAn+BLIfCg2ZIwpHNRCAedjUTgP3HtjZ2zQ9767t/Xbn3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD8HEPhzatL8bs7eUBMnPpaVuaymecwuHqi0zFxRdUzhsmqS/4
	CxZ9Aydan77fQygY/SdFjT41aNAufj5CPyRd/14UK4ZYE2646wRYQTALe40JSv1ev4Acctb14vb
	FemxmoFuQgoF18XGW6lTkKfLZa5hxrv0=
X-Gm-Gg: ASbGncsWix1V6RIlO3pk2oJ9jleHA5+dppjjeJl4B/99Qad4OkWL8p8wMJAqrccWxF6
	ZtZcqgxumhTkG17ZtoZzCGNqp6qV3580Gq3ktxWIdCTI7VCo18kDTwsaouOVcPYl7+7jJ46Zrjq
	Legsbscs3NQ5niHiH24Ja7+YJGuiaIKEPy9g==
X-Google-Smtp-Source: AGHT+IGJNhTbIxn0fGn5LZK7I1+5VjM8COIwIWtxkknam96k2e+FoVcx5/oxLKqEf1OivZNvPQpHNNT7jQjqIo6VlmE=
X-Received: by 2002:a05:6102:3752:b0:4cb:5d6c:9946 with SMTP id
 ada2fe7eead31-4e7728badb7mr9695771137.10.1749459333277; Mon, 09 Jun 2025
 01:55:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608192713.95875-1-ryncsn@gmail.com> <36f52466-071a-4efb-adc2-8514b11f120c@linux.alibaba.com>
 <CAMgjq7AawxHKX8TRnshZzzUznCZbdfncThyLmA5URKBGq3r4Hw@mail.gmail.com> <1452d0c6-50ab-4680-9aa9-13290d51177d@linux.alibaba.com>
In-Reply-To: <1452d0c6-50ab-4680-9aa9-13290d51177d@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 9 Jun 2025 20:55:22 +1200
X-Gm-Features: AX0GCFtwjg5yReDZoYlFbo8C3roBLm3Ns6Rs-JPeJ52ef1McoWGV3BSOrdcrQu8
Message-ID: <CAGsJ_4x5BKfcZk6CLu4uKChkjpuk+qYSxJgJ=8A+BM8FGhRyUA@mail.gmail.com>
Subject: Re: [PATCH] mm/shmem, swap: fix softlockup with mTHP swapin
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Usama Arif <usamaarif642@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 8:49=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/6/9 16:36, Kairui Song wrote:
> > On Mon, Jun 9, 2025 at 4:27=E2=80=AFPM Baolin Wang
> > <baolin.wang@linux.alibaba.com> wrote:
> >> On 2025/6/9 03:27, Kairui Song wrote:
> >>> From: Kairui Song <kasong@tencent.com>
> >>>
> >>> Following softlockup can be easily reproduced on my test machine with=
:
> >>>
> >>> echo always > /sys/kernel/mm/transparent_hugepage/hugepages-64kB/enab=
led
> >>> swapon /dev/zram0 # zram0 is a 48G swap device
> >>> mkdir -p /sys/fs/cgroup/memory/test
> >>> echo 1G > /sys/fs/cgroup/test/memory.max
> >>> echo $BASHPID > /sys/fs/cgroup/test/cgroup.procs
> >>> while true; do
> >>>       dd if=3D/dev/zero of=3D/tmp/test.img bs=3D1M count=3D5120
> >>>       cat /tmp/test.img > /dev/null
> >>>       rm /tmp/test.img
> >>> done
> >>>
> >>> Then after a while:
> >>> watchdog: BUG: soft lockup - CPU#0 stuck for 763s! [cat:5787]
> >>> Modules linked in: zram virtiofs
> >>> CPU: 0 UID: 0 PID: 5787 Comm: cat Kdump: loaded Tainted: G           =
  L      6.15.0.orig-gf3021d9246bc-dirty #118 PREEMPT(voluntary)=C2=B7
> >>> Tainted: [L]=3DSOFTLOCKUP
> >>> Hardware name: Red Hat KVM/RHEL-AV, BIOS 0.0.0 02/06/2015
> >>> RIP: 0010:mpol_shared_policy_lookup+0xd/0x70
> >>> Code: e9 b8 b4 ff ff 31 c0 c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 =
90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f 44 00 00 41 54 55 53 <48> 8b 1f 4=
8 85 db 74 41 4c 8d 67 08 48 89 fb 48 89 f5 4c 89 e7 e8
> >>> RSP: 0018:ffffc90002b1fc28 EFLAGS: 00000202
> >>> RAX: 00000000001c20ca RBX: 0000000000724e1e RCX: 0000000000000001
> >>> RDX: ffff888118e214c8 RSI: 0000000000057d42 RDI: ffff888118e21518
> >>> RBP: 000000000002bec8 R08: 0000000000000001 R09: 0000000000000000
> >>> R10: 0000000000000bf4 R11: 0000000000000000 R12: 0000000000000001
> >>> R13: 00000000001c20ca R14: 00000000001c20ca R15: 0000000000000000
> >>> FS:  00007f03f995c740(0000) GS:ffff88a07ad9a000(0000) knlGS:000000000=
0000000
> >>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>> CR2: 00007f03f98f1000 CR3: 0000000144626004 CR4: 0000000000770eb0
> >>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> >>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> >>> PKRU: 55555554
> >>> Call Trace:
> >>>    <TASK>
> >>>    shmem_alloc_folio+0x31/0xc0
> >>>    shmem_swapin_folio+0x309/0xcf0
> >>>    ? filemap_get_entry+0x117/0x1e0
> >>>    ? xas_load+0xd/0xb0
> >>>    ? filemap_get_entry+0x101/0x1e0
> >>>    shmem_get_folio_gfp+0x2ed/0x5b0
> >>>    shmem_file_read_iter+0x7f/0x2e0
> >>>    vfs_read+0x252/0x330
> >>>    ksys_read+0x68/0xf0
> >>>    do_syscall_64+0x4c/0x1c0
> >>>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >>> RIP: 0033:0x7f03f9a46991
> >>> Code: 00 48 8b 15 81 14 10 00 f7 d8 64 89 02 b8 ff ff ff ff eb bd e8 =
20 ad 01 00 f3 0f 1e fa 80 3d 35 97 10 00 00 74 13 31 c0 0f 05 <48> 3d 00 f=
0 ff ff 77 4f c3 66 0f 1f 44 00 00 55 48 89 e5 48 83 ec
> >>> RSP: 002b:00007fff3c52bd28 EFLAGS: 00000246 ORIG_RAX: 000000000000000=
0
> >>> RAX: ffffffffffffffda RBX: 0000000000040000 RCX: 00007f03f9a46991
> >>> RDX: 0000000000040000 RSI: 00007f03f98ba000 RDI: 0000000000000003
> >>> RBP: 00007fff3c52bd50 R08: 0000000000000000 R09: 00007f03f9b9a380
> >>> R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000040000
> >>> R13: 00007f03f98ba000 R14: 0000000000000003 R15: 0000000000000000
> >>>    </TASK>
> >>>
> >>> The reason is simple, readahead brought some order 0 folio in swap
> >>> cache, and the swapin mTHP folio being allocated is in confict with i=
t,
> >>> so swapcache_prepare fails and causes shmem_swap_alloc_folio to retur=
n
> >>> -EEXIST, and shmem simply retries again and again causing this loop.
> >>
> >> If swapcache_prepare() fails and retries, the folio's order (order 0)
> >> getting from swapcache will be different from the order stored in the
> >> shmem mapping, so we will split the large swap entry by the following
> >> logic in shmem_swapin_folio(). So I am not sure why causing a softlock=
up?
> >>
> >>          } else if (order !=3D folio_order(folio)) {
> >>                  /*
> >>                   * Swap readahead may swap in order 0 folios into swa=
pcache
> >>                   * asynchronously, while the shmem mapping can still =
stores
> >>                   * large swap entries. In such cases, we should split=
 the
> >>                   * large swap entry to prevent possible data corrupti=
on.
> >>                   */
> >>                  split_order =3D shmem_split_large_entry(inode, index,=
 swap, gfp);
> >>                  if (split_order < 0) {
> >>                          error =3D split_order;
> >>                          goto failed;
> >>                  }
> >>
> >>                  /*
> >>                   * If the large swap entry has already been split, it=
 is
> >>                   * necessary to recalculate the new swap entry based =
on
> >>                   * the old order alignment.
> >>                   */
> >>                  if (split_order > 0) {
> >>                          pgoff_t offset =3D index - round_down(index, =
1 << split_order);
> >>
> >>                          swap =3D swp_entry(swp_type(swap), swp_offset=
(swap) + offset);
> >>                  }
> >>          }
> >
> > For example if the swap entry is 0x0 in shmem with order 4 (so it
> > corresponds to swap entries 0x0 - 0x10), and a order 0 folio is
> > currently cached with swap entry 0xa, then shmem swapin will try to
> > use a folio with order 4, that will always fails swapcache_prepare,
> > but filemap/swapcache lookup use entry 0x0 will return NULL, causing a
> > loop.
>
> OK. Thanks for the explanation.
>
> >>> Fix it by applying a similar fix for anon mTHP swapin.
> >>>
> >>> The performance change is very slight, time of swapin 10g zero folios
> >>> (test for 12 times):
> >>> Before:  2.49s
> >>> After:   2.52s
> >>>
> >>> Fixes: 1dd44c0af4fa1 ("mm: shmem: skip swapcache for swapin of synchr=
onous swap device")
> >>> Signed-off-by: Kairui Song <kasong@tencent.com>
> >>>
> >>> ---
> >>>
> >>> I found this issue while doing a performance comparing of mm-new with
> >>> swap table series [1] on top of mm-new. This issue no longer exists
> >>> if the swap table series is applied, because it elimated both
> >>> SWAP_HAS_CACHE and SWP_SYNCHRONOUS_IO swapin completely while improvi=
ng
> >>> the performance and simplify the code, and the race swapin is solved
> >>> differently by then.
> >>>
> >>> (The zero map fix might still need to stay for a while, but could be
> >>> optimized too later with swap table).
> >>
> >> I don't understand why adding zeromap changes, and should explain this
> >> explicitly.
> >
> > To stay in consistency with anon mTHP swapin, swap_zeromap_batch have
> > it's own comments that a hybird folio with zero and non-zero pages
> > can't be brought back as a whole. I can mention that in the commit
> > message.

For mTHP swapin, we need the zeromap check because we have no way to record
whether there was a prior mTHP swap-out. So we rely on checking the
continuity of swap offsets.

It=E2=80=99s entirely possible that, in the past, several small folios were
swapped out to consecutive locations, and one of them happened to be a
zero folio, while the others were not.

But for shmem, we have a place to record that information -   we swapped-ou=
t
a mTHP, right?

Regarding zeromap: for an mTHP swap-out, we currently can't mark subpages
individually as zeromap=E2=80=94it=E2=80=99s either all-zero for every subp=
age or none are.

So maybe we don't need swap_zeromap_batch()  for shmem?

>
> Yes. Thanks.

Thanks
Barry
