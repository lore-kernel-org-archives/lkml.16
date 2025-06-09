Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE8B4D8CE
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749458209; cv=none; b=AEloFEd9LrC6UXyRMjVD39kyRi+C0mnUWZRrM5fkc6PhfwndMlx7ZBIEwvr976Q9ne9bCXkLUCXuu2rsLBxOy3VpW8jrLVUsmWkApXkMyfkKfk8Erz0x5+DH42qnkBpTfjxMtqs/Jzt6C83lxvtaMrCbI/XUVFsFiuMuUIo5epA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749458209; c=relaxed/simple;
	bh=x1drpJBj8efTTOkDhwW9cCwgUOSvpXrUvg5k60+AWm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jydYb5z3kzSUkTA67hkwjmN/pkKTT0KizB9AmJ4YpzLPkoCPqpQgzJTObBHYLZWDRFi6MxwqT2vnNgPzCAQOuTwiEPoPeB0DYquokn7fRZjDicf7yPbQbt/d+p9tUZyu758Ox2BUOI+7FRtd6RjSDt+x45yyt2BTaq7qIo3Oxb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dwc7u3v2; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dwc7u3v2"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55324062ea8so5387141e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 01:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749458206; x=1750063006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLzi7fkNUKLm1NFUE1B8JtpmPKupcs+RTSliBUZkKYw=;
        b=Dwc7u3v2Pv8cuHRifI87D/Z4BO5JKERK1Q/d0vgcadrt3NSdFMzK6/qNoAsNnH19wx
         V6OQbSgFpCH6CnoCHjzkeOgaRAwqPxlt/CINzABFFSDmVKFkfyfhQ/cc10u2oh0SCdK/
         8LoFLBiUFTyccYn/M655WtJ/PVjOX20C0zeVUf05Vp3Nz88s92Dgq2fPnggw0kZ6am8O
         57PIwd7YcghuJOINBbwD6Al01iHleOKfM+kCncRE23YPLE/Fm18LaTE5Ix1abL3y56mn
         yAchW8a1VwuDhruHKNqc1YnDx00pToX1Mq8k0oAQGnUohBFlFiu0oAxJAm1YgGkGkTV+
         mSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749458206; x=1750063006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLzi7fkNUKLm1NFUE1B8JtpmPKupcs+RTSliBUZkKYw=;
        b=tgeySNcxugQ26a/ytVZUfcu6hPq8bbQgvvofbeJnB6qem2jC2Z7leD6/Vkos2b82Zx
         xbdu1Chn3RyG5grT9yQhTHrAY98XsckcCB/3diwk5C+Anw607Kj6loi31Z52C7n4kXPJ
         m4avzwnCFGmAb6tLjMLFUQbsKkLkwY3EZa09or4c2fcrQGKZ2HamgV7K+pThUGzkcQY7
         yVTrTfWUwUQhrlLOVAQRy/w/xFOzmD8e8yLG5hRA0syFmmfmaA62bUNiOZMXX91g4lld
         1qUl47adrwLHPzE1VDrLkNEIDPJ6Caq5fTg3k+qAvj2NHkVn2HmYN1LQupazZMgNcx9M
         UTAg==
X-Forwarded-Encrypted: i=1; AJvYcCW+eNcyVA5psZAOac/xYxzlzln/qTzxGiIQa8poU0hLgahtCi2sUvfZc0i+IbZWl+dP9/jDkrfPw3T1ERU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/g7T3+pMt05wqkfLOBwGmy0a1IZ1ZvTJZTQfMpdlmq+kqwTwT
	NEz5W5ft9GDzXjnpsPQXZlHJue/q7FtJobPSUT7f+BeVbIZiNq3Gh9Yw3/Yp6djrGja+cwplsXg
	Qi8dT4ztwScCN4ctgodUhWMtw+nBZNjU=
X-Gm-Gg: ASbGncu2FcyXrBuTbk58GaFmRcV1NbvovDTtQJ/LiZzv9Y/XmTFzS2IAdgFj/Hcntm4
	PzuSn/zMwQKyWTQhcBu+tCSGW2/w5IDb27ImogwVsoWkCSET8oN7cX/72213BIZVJKdDw0oF9uN
	jitWs/4pWKPvbDbphoGhC9DI5egwa2Gy9pL74PD8YIkw==
X-Google-Smtp-Source: AGHT+IGh894TOutDJ+yYWqn0fKVtXB7CWf9dsr1yJMZL1VvZK7zfESmiug7tJSAkL3q8fdEnsS2Bf443sA42klfDmdA=
X-Received: by 2002:a2e:be20:0:b0:32a:739d:fad with SMTP id
 38308e7fff4ca-32adfd43234mr34711291fa.36.1749458205221; Mon, 09 Jun 2025
 01:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608192713.95875-1-ryncsn@gmail.com> <36f52466-071a-4efb-adc2-8514b11f120c@linux.alibaba.com>
In-Reply-To: <36f52466-071a-4efb-adc2-8514b11f120c@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 9 Jun 2025 16:36:27 +0800
X-Gm-Features: AX0GCFukoYe3lPMV878LXiNa2Z7NA0RD89DuQGcCeXScy3od6gKXTvbWZSg57aA
Message-ID: <CAMgjq7AawxHKX8TRnshZzzUznCZbdfncThyLmA5URKBGq3r4Hw@mail.gmail.com>
Subject: Re: [PATCH] mm/shmem, swap: fix softlockup with mTHP swapin
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
	Barry Song <baohua@kernel.org>, Usama Arif <usamaarif642@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 4:27=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
> On 2025/6/9 03:27, Kairui Song wrote:
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
> >      dd if=3D/dev/zero of=3D/tmp/test.img bs=3D1M count=3D5120
> >      cat /tmp/test.img > /dev/null
> >      rm /tmp/test.img
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
> >   <TASK>
> >   shmem_alloc_folio+0x31/0xc0
> >   shmem_swapin_folio+0x309/0xcf0
> >   ? filemap_get_entry+0x117/0x1e0
> >   ? xas_load+0xd/0xb0
> >   ? filemap_get_entry+0x101/0x1e0
> >   shmem_get_folio_gfp+0x2ed/0x5b0
> >   shmem_file_read_iter+0x7f/0x2e0
> >   vfs_read+0x252/0x330
> >   ksys_read+0x68/0xf0
> >   do_syscall_64+0x4c/0x1c0
> >   entry_SYSCALL_64_after_hwframe+0x76/0x7e
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
> >   </TASK>
> >
> > The reason is simple, readahead brought some order 0 folio in swap
> > cache, and the swapin mTHP folio being allocated is in confict with it,
> > so swapcache_prepare fails and causes shmem_swap_alloc_folio to return
> > -EEXIST, and shmem simply retries again and again causing this loop.
>
> If swapcache_prepare() fails and retries, the folio's order (order 0)
> getting from swapcache will be different from the order stored in the
> shmem mapping, so we will split the large swap entry by the following
> logic in shmem_swapin_folio(). So I am not sure why causing a softlockup?
>
>         } else if (order !=3D folio_order(folio)) {
>                 /*
>                  * Swap readahead may swap in order 0 folios into swapcac=
he
>                  * asynchronously, while the shmem mapping can still stor=
es
>                  * large swap entries. In such cases, we should split the
>                  * large swap entry to prevent possible data corruption.
>                  */
>                 split_order =3D shmem_split_large_entry(inode, index, swa=
p, gfp);
>                 if (split_order < 0) {
>                         error =3D split_order;
>                         goto failed;
>                 }
>
>                 /*
>                  * If the large swap entry has already been split, it is
>                  * necessary to recalculate the new swap entry based on
>                  * the old order alignment.
>                  */
>                 if (split_order > 0) {
>                         pgoff_t offset =3D index - round_down(index, 1 <<=
 split_order);
>
>                         swap =3D swp_entry(swp_type(swap), swp_offset(swa=
p) + offset);
>                 }
>         }

For example if the swap entry is 0x0 in shmem with order 4 (so it
corresponds to swap entries 0x0 - 0x10), and a order 0 folio is
currently cached with swap entry 0xa, then shmem swapin will try to
use a folio with order 4, that will always fails swapcache_prepare,
but filemap/swapcache lookup use entry 0x0 will return NULL, causing a
loop.

>
> >
> > Fix it by applying a similar fix for anon mTHP swapin.
> >
> > The performance change is very slight, time of swapin 10g zero folios
> > (test for 12 times):
> > Before:  2.49s
> > After:   2.52s
> >
> > Fixes: 1dd44c0af4fa1 ("mm: shmem: skip swapcache for swapin of synchron=
ous swap device")
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> >
> > ---
> >
> > I found this issue while doing a performance comparing of mm-new with
> > swap table series [1] on top of mm-new. This issue no longer exists
> > if the swap table series is applied, because it elimated both
> > SWAP_HAS_CACHE and SWP_SYNCHRONOUS_IO swapin completely while improving
> > the performance and simplify the code, and the race swapin is solved
> > differently by then.
> >
> > (The zero map fix might still need to stay for a while, but could be
> > optimized too later with swap table).
>
> I don't understand why adding zeromap changes, and should explain this
> explicitly.

To stay in consistency with anon mTHP swapin, swap_zeromap_batch have
it's own comments that a hybird folio with zero and non-zero pages
can't be brought back as a whole. I can mention that in the commit
message.
