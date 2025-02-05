Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4326121345
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768533; cv=none; b=gy7ZeIZccYOH4s37i57iXGnva8TjsNJo4PmUZbLIwno9HS4Mcm/PrscSKgKED20E027ZUcF+6o7OOFOMEmGvGJGJfY8JrAoUcbLfYvJDmt9JgODyvByj2PKbHvELJPJ0a6X9GsOpEvvCrc270r8xDUQMh8kqd/6uGP3FD+4G3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768533; c=relaxed/simple;
	bh=Q//J+e02VMCjSMlVEgDso77jCAMxFwJguw641V1T0NA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9mIcbECJh/FVulbRRuLlwsV9KzAHTrPzKpwGsNdiRkTNHtn/I/ZXgNS2XlKpUL8oFGetFZIaTnBiKh8bYnbqkq4ZjQIeKh3MofZqASJahqxGokKsvhjKL/+JhlwFXeGVAwnz+TvvbFEjXEs/QrCzqYVirzSv4O/XNi9HjXNVF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s1aEQq73; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s1aEQq73"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so22951a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738768529; x=1739373329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzGASh3W9m1TVW4vwU2r5PYBoXrMXzzzHc5NAqC4Qzw=;
        b=s1aEQq73QX+6fDFFJY8zactOwRGbzJ/KEIRa1dIE2HGypW+j67fA5z1l5vMy458rNx
         7LSmF5JJvwRhJ0wdQZdU/cCHXN78GJO16F6hz/8piTmFTbdfqyHHffk8x6Jzdb0uyHCc
         rM/k0M2y9pT/d3mjiPPWI7pTZcw0FnOMgSITLtvyrTFvD/keZk48LN5Hr0LRISQgRVIg
         rQ96DqGLPZVSNSIhzg+rxd6dPD9+knRdb9Ygal9N/haIAuKmcccmXBYSQa3zinFLjSPM
         l68IJFc55GNHOsrfjfOgp75qLAzdjQzNU4iT8bHWV1jiRL2aPXJK7NOpMqxeYt+3Czck
         Yq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738768529; x=1739373329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzGASh3W9m1TVW4vwU2r5PYBoXrMXzzzHc5NAqC4Qzw=;
        b=hHBs6a8Xo0EaVdAnJ4HhOf0zcuYuCwVfJinrGOvgNaSSC0vqNCn0dTE08GzZr3RuuZ
         BgEKJCUCRs1Xg8vmLr3CLVAFISSkJKA0UtiUbPoKewtL6PAQT5UkdT6ShQ9F9yQKjGoz
         8ffipdoKnjx4/7v58wkr9bWVQ/rhdccuVyaiY28d7vhKp4o/fkT+qysC7huBvaDjTE6u
         RNv1bcvudA7x51A/vxRqbepC3BC+OPwg98jrccFI1ODeO1dnmH32DFSr0tWZodnXOE/U
         bVK4SkriUGfPgVEkQ2RUlwkrygSPk5eiyMLycmv07xgb6vNNiWqrpDiqSc8B57igxcPI
         2lfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLHXDQibrYjZmx9S6cqgjCk4in66L39w3aV/vNlLOCrxWQs/QqQQUk50xheOAOiLhfmn7ayqFjPdgaMck=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOgQOnVm4KQISkrG9jyM8KArmZXD0rXc/I4//g1YG7dxJn5tjA
	OEfW6Od7mpo/IFi8/EPxuUTfPBr9wP/CROEFsJ260EP6OBUZ6E3iesjzmhg30B0a/8dMLkWzJwp
	r6gSOKgVEgPy9ZC9xj4Mn7q0J3Z2YhFOJjd3F
X-Gm-Gg: ASbGncuv+cqL1ufeL8s/dL6DlMnBPJD/B3StlDLtF/2Ire68kU4Oovz9wybjvYuEz7t
	hWiBzH6/tHUq978eDZZ1xtYubOHvEWZAQcc8l23xuvqa0UwuhKYpDyZv7ZzqsL9px3JtfEC/719
	+b1VxMNLhfQpE8YonPjAeiOGAHzw==
X-Google-Smtp-Source: AGHT+IHBJKU5GK02r293SVKE1mJWFB76itJDMaSC0okwjWJ+CuIMFM5+06Wl78dD75ZKA7qCTR1806E0wV6AqELhfk0=
X-Received: by 2002:a05:6402:294:b0:5dc:e09f:d069 with SMTP id
 4fb4d7f45d1cf-5dce0a00d6fmr56295a12.6.1738768528968; Wed, 05 Feb 2025
 07:15:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67a34e60.050a0220.50516.0040.GAE@google.com> <CAG48ez3KKEYRU+-Mkk+tq1Onv3QWg0jP6fEKYjNjRS+ziP5dAQ@mail.gmail.com>
 <13bb4bbf-92e7-4c45-a3a8-a52312015f92@lucifer.local>
In-Reply-To: <13bb4bbf-92e7-4c45-a3a8-a52312015f92@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Wed, 5 Feb 2025 16:14:52 +0100
X-Gm-Features: AWEUYZmfrAzMR4mwPkULpHDw3YfNuu69wMoCjFYNLfVJwTJu4pJ0Qh11OJMIpvg
Message-ID: <CAG48ez2sSCkrv2L3ZHjHdPf0hLeyD=4K7ab5icpOF5MXp4MrCw@mail.gmail.com>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup / try_to_migrate_one
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>, 
	Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 4:11=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Wed, Feb 05, 2025 at 04:00:06PM +0100, Jann Horn wrote:
> > On Wed, Feb 5, 2025 at 12:41=E2=80=AFPM syzbot
> > <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com> wrote:
> > > syzbot found the following issue on:
> > >
> > > HEAD commit:    d009de7d5428 Merge tag 'livepatching-for-6.14-rc2' of=
 git:..
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=3D12b678a45=
80000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9e757e376=
2bd630b
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc2e5712cbb1=
4c95d4847
> > > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for=
 Debian) 2.40
> > >
> > > Unfortunately, I don't have any reproducer for this issue yet.
> > >
> > > Downloadable assets:
> > > disk image: https://storage.googleapis.com/syzbot-assets/9235000a1b88=
/disk-d009de7d.raw.xz
> > > vmlinux: https://storage.googleapis.com/syzbot-assets/098ef82f8ab3/vm=
linux-d009de7d.xz
> > > kernel image: https://storage.googleapis.com/syzbot-assets/4f51f5eb57=
82/bzImage-d009de7d.xz
> > >
> > > IMPORTANT: if you fix the issue, please add the following tag to the =
commit:
> > > Reported-by: syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > BUG: KCSAN: data-race in mprotect_fixup / try_to_migrate_one
> > >
> > > write to 0xffff888114b41700 of 8 bytes by task 6432 on cpu 1:
> > >  vm_flags_init include/linux/mm.h:875 [inline]
> > >  vm_flags_reset include/linux/mm.h:887 [inline]
> > >  mprotect_fixup+0x419/0x5e0 mm/mprotect.c:679
> > >  do_mprotect_pkey+0x6cc/0x9a0 mm/mprotect.c:840
> >
> > This is one side changing the VMA flags under the mmap lock in write mo=
de...
> >
> > >  __do_sys_mprotect mm/mprotect.c:861 [inline]
> > >  __se_sys_mprotect mm/mprotect.c:858 [inline]
> > >  __x64_sys_mprotect+0x48/0x60 mm/mprotect.c:858
> > >  x64_sys_call+0x2770/0x2dc0 arch/x86/include/generated/asm/syscalls_6=
4.h:11
> > >  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> > >  do_syscall_64+0xc9/0x1c0 arch/x86/entry/common.c:83
> > >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > >
> > > read to 0xffff888114b41700 of 8 bytes by task 6418 on cpu 0:
> > >  try_to_migrate_one+0xb5a/0x12e0 mm/rmap.c:2321
> > >  rmap_walk_anon+0x28f/0x440 mm/rmap.c:2646
> >
> > ... while the other side comes through the rmap, which does not
> > involve the mmap lock. Yes, that does not have any mutual locking by
> > design, I think.
> >
> > The comments in the VMA flags code incorrectly assume that no
> > concurrency is possible here; and I think the comment in
> > mprotect_fixup() about protection by the mmap_lock has also been kinda
> > wrong since the beginning of git history.
> >
> > The VM_LOCKED check in the migration code was added by Hugh in commit
> > b74355078b655, but that's just one example syzbot stumbled over; we
> > have similar racy vm_flags reads through the rmap on other paths like:
> >
> > unmap_mapping_range_tree -> unmap_mapping_range_vma ->
> > zap_page_range_single -> unmap_single_vma -> unmap_page_range -> ...
> > -> zap_pte_range -> zap_present_ptes -> vm_normal_page
> >
> > I think the right fix might just be to make sure that we use
> > WRITE_ONCE() for these vm_flags updates, and READ_ONCE() around
> > ->vm_flags reads that can happen in rmap walk paths, though we should
> > think about the consequences of concurrently changing flags in every
> > place that gets a READ_ONCE()...
>
> Yup cool similar to my thread on this.
>
> I hate that we have these landmines waiting for us. Be good to find a way
> to explicitly annotate this, or at least comment somehow.
>
> But agreed, probably adding a READ_ONCE()/WRITE_ONCE() is appropriate at
> least for the proximate thing.
>
> It's a wonder these things don't trigger more, except you need probably
> very precise timing to do it...
>
> I can do a quick cheeky patch.

Thanks!
