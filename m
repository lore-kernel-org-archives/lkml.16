Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C70157A67
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 02:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749436334; cv=none; b=YpjYPRIxhpX2sbnVQz/e1/zjZsv5r5v+iCfVfHELt9Od2tc6c2pyuS5YDgilWLt7LtTG+R3t/ohgNQRMlCv3IUQtYZ5ykRbPYLDdVaqzblES++V6T+rbvEnIlhN7Gmc7f6orhf/EchdQfzxOfFAR9oVESvR5rLl5DkRj3Wwa+C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749436334; c=relaxed/simple;
	bh=n1u04fGUjxsZj088Ha5FNUu8XHQMEq5Kxeu7eVUBTTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VxZlhNmGadC+vnwEN3ORJ6I2VthwPEcGsGclasAjTCY6KQ8BS6cKj+0ekSzRy4U9UECFKNJWIMUI9aUZRPsQ4NMJj3Fd5PteQSDhl9WjgC/wnxNlcaujHSY4XeR3E/Mc5crVCeIc0GZWd80q9WlZO3AsO9DnWGgkPPpLXbZN8Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATJwLFIj; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATJwLFIj"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3105ef2a071so41725931fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 19:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749436330; x=1750041130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+x5kDxkUqYTRERjo2DCogvWV0p7sKGQlKnir/kOwee4=;
        b=ATJwLFIjcxxoN3NIMXuWjJZTFBF/C6MEkOtY538u0EggdRU8/OUragrFtZPIwYzW3o
         TPJM+R0M7X185lRIGXVjEgMW1a/1ZDYsOZgz7NFs/X/dcSG0lFpoEGAVAe+wiJpgA3sD
         LD+bi7n2xriq+vaIPBGVmw+kegTiE3BqI44334jecwCeka7kVfJmQ9Jx+q5ivjh3W4ef
         sRbv+cj/36TZgCHMGpuI2pKpnJMrxT/2rP0hxErWMXeaBaO/zuDEh08gqEvWTLQuvlaK
         yy66F+N1xNq85pf6YXLhd5+yDEv7cMZIBqAh19+qV/AB4HGyBjMoQBljRvZJsKR0aFhS
         Hc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749436330; x=1750041130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+x5kDxkUqYTRERjo2DCogvWV0p7sKGQlKnir/kOwee4=;
        b=j8K9aO4fASsqqkglJxPibCegg1SPfrDZdfxAaqjtPOy9/8WW4R+XxkF+LprIDZSYzv
         Qc6WvRaamZfDZVlJLd4nTlNcoFgPbbEm/ehA/mnvnqLfpJX89TcuIfP7iIt5/DkMkCDA
         01JKcMwSRo5Tl3kKRLPzVYpVNMQcCbWb792ADduTa0drARiZ/18+vUEBrfI6VniFwIHN
         7l2G3piGagV8x12kno4mX9wPZCn6rCrN5Ck/D2zg7DVSrR0M5nf3eR7fOvL8WK1DDNJ5
         0PoXuhnSQj22XgEtGpAoYKSTglCKy2N8Q0dNeAIsNKk9vIe/nb8i6SwipVA05HnjJfCf
         TLvw==
X-Forwarded-Encrypted: i=1; AJvYcCWaKyJ+/puJv9x9Gmwqgi5PbRdhrWZOtpv/yDevxLA6Ks3uG7VQqizi/WAfdRYaZUeklpLJvReRXVddvmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHVxY6u7XSX/qeXxdkV9ALmTZ8vHHZdeKxyYlhwAHOb1DvWPPP
	eIaSO8O+tvj/3Ltoj44uzNL8EmJ7/L3vcX+5dbtEjHbKPL0t/PkMlJWJwUYvpJww6zuwZFiXAl1
	ntW42ZkHc0lN57O5OWy+FIedjNqkSCEL5nQf6kuk4Lw==
X-Gm-Gg: ASbGnctfXFwzmyjE0cEC7SgDIsiONwt1GNixDO4nEMPvdCyBJ4GzSp4jIInujYt8XtX
	brdkolMRZd2JkrNIQZt+XHMk9dKicuRIKoMkDB1lSfAR0X4uuNjW8/cmSZMA3nCdduOxcfQq6kP
	BvxYR/APY5MK6u578DUOMCUwfcz8TnAiVBFJUzGRQHeg==
X-Google-Smtp-Source: AGHT+IE396iTBd2yIKfx0dITBTCjzMVwQa1V/FQ3s2hz0oQ9q+ejedqRFeG5F3O45Ex1bFCi4ZsWtS1AO3lgzu3rEE8=
X-Received: by 2002:a2e:3c08:0:b0:32a:6026:ec08 with SMTP id
 38308e7fff4ca-32adfd8cd04mr20171441fa.18.1749436329647; Sun, 08 Jun 2025
 19:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608192713.95875-1-ryncsn@gmail.com> <CAGsJ_4xSRdjVac_UdUKBk2-5upeHMEEow3_Q-F_VSa8HYj0mtw@mail.gmail.com>
In-Reply-To: <CAGsJ_4xSRdjVac_UdUKBk2-5upeHMEEow3_Q-F_VSa8HYj0mtw@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 9 Jun 2025 10:31:52 +0800
X-Gm-Features: AX0GCFu9LMLdhUDTBTM8GexzDRVKpwCpAG3xj_ASQJVltOBiRCCZSagqesmTyg4
Message-ID: <CAMgjq7CZD_otTdhKhsUgoMgLiB8+3ipEFNyTkN_zxnbQECiJNw@mail.gmail.com>
Subject: Re: [PATCH] mm/shmem, swap: fix softlockup with mTHP swapin
To: Barry Song <21cnbao@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Usama Arif <usamaarif642@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 7:58=E2=80=AFAM Barry Song <21cnbao@gmail.com> wrote=
:
>
> On Mon, Jun 9, 2025 at 7:27=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wro=
te:
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
> >
> > It will be good if the swap table series could get reviewed and merged
> > to avoid more fixes like this. SWAP_HAS_CACHE and SWP_SYNCHRONOUS_IO ha=
s
> > a history of causing many issues. I'll do a swap table rebase on top of
> > this fix, if this one is accepted.
> >
> > And for a comparision, swap in 10G into shmem:
> >
> > Before this patch:  2.49s
> > After this patch:   2.52s
> > After swap table:   2.37s (Removing SWAP_HAS_CACHE and SWP_SYNCHRONOUS_=
IO,
> >                            still not in the best shape but looking good=
)
> >
> > Link: https://lore.kernel.org/linux-mm/20250514201729.48420-1-ryncsn@gm=
ail.com/ [1]
> >
> >  mm/memory.c | 20 --------------------
> >  mm/shmem.c  | 12 +++++++++++-
> >  mm/swap.h   | 19 +++++++++++++++++++
> >  3 files changed, 30 insertions(+), 21 deletions(-)
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
> > index 73182e904f9c..484cd3043a78 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -1995,6 +1995,14 @@ static struct folio *shmem_swap_alloc_folio(stru=
ct inode *inode,
> >          */
> >         if (swapcache_prepare(entry, nr_pages)) {
> >                 folio_put(new);
> > +
> > +               /*
> > +                * A smaller folio is in the swap cache, mTHP swapin wi=
ll always fail
> > +                * until it's gone. Return -EINVAL to fallback to order=
 0.
> > +                */
> > +               if (non_swapcache_batch(entry, nr_pages) !=3D nr_pages)
> > +                       return ERR_PTR(-EINVAL);
> > +

Hi Barry,

> We're doing this before swapcache_prepare() for mTHP swapin. Why does it
> happen after swapcache_prepare() in the shmem case?

`non_swapcache_batch(entry, nr_pages) !=3D nr_pages` is unlikely, that's
the reason why no one noticed this issue so far, so moving it after
swapcache_prepare can help avoid overhead caused by it in the common
case. swapcache_prepare already implies this check, but
swapcache_prepare can fall for multiple reasons, and shmem should and
only should fallback to order 0 swapin if it's caused by an existing
cache. (currently shmem unconditionally retry)

And non_swapcache_batch might not be the best solution here, it also
might have false positives, we can add a full filemap lookup here, but
might be overkill for a corner case like this. I still think merge
swap cache with swap_map using swap table is the long term solution.

Maybe I'm premature optimizing it, I can use the easier to review
implementation (same way with anon mTHP) and do a quick benchmark, if
there is no obvious performance change I'll use that style in V2.
