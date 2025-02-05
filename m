Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C36718BC26
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767647; cv=none; b=mf0iCFe3NxRPeA5G93s+T2TQ1OtEGzsthxbRZ1Coirc2skzMc0utTyUMq8/y6JQw0RIa0Ieu5SllyeBbRzzurtdc1fo/sFdoE1PbG60wbHFIuAgOWk/ViLwvXzu5O2RwLMRxOyP8ZH25v3IV2j5EtyQiIR4kdodL3DtftWljTq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767647; c=relaxed/simple;
	bh=ZqxIPxkD1UfdMbx6FC7fyU0rmhf4o9frfUHSPNLu7gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pu1XnsQQlghLWrbhcZ02NawzlM1vLi2uj8AVrPZR4C678w60IUZUuKfO27iZhKVvosIvXeBzCOZQhy6LhoEsK0AOQe0cwsZkt08gGyCJcADf1xXjZzag4NFt/+mtcZnxPvF/mriNMB/kEGri8iZc/eIbqedcaiqgaFuch9yI0eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HmMeRI/C; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HmMeRI/C"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dcd43726ecso13569a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738767643; x=1739372443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bh4SFstw4Y2Mzl5Q95yQLXnvJ0oL3/7dIeDylh0bX7c=;
        b=HmMeRI/Cci08+ahT6hSGGw/Ecg3OSlsiqYXaxHXqQBpN2BXa4DNuU+j6MPWGQRSLJ6
         Kel8/k5HGbtYARTO44VRBw5evhSeUyWBx21j4/6GkbxQaGvyq1a7eP/gGSh2WiuoMiz8
         ohatAifzQDaiuNB5RqKVsA+qwbpKlryLm+tt144ikJacG1F+B50itsS77srvV4Sj1NbI
         KDalEGBgNKpzS3JoD0e6SPaYNUBwSfFQ2igYzO2y/olUgs3O1wwkUKmw9xQPLA3mupuy
         Do5jiszzbxYdp442ltt/DAVcFrXXgCjI1R3XpFFJeYNrne2tmnCWJnH0cBp0sVUxXiyr
         oSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738767643; x=1739372443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bh4SFstw4Y2Mzl5Q95yQLXnvJ0oL3/7dIeDylh0bX7c=;
        b=GoGCP53s8gAANoQmTmXNPCA/fgvEQoW5sr08QB0QqGZObtR7a7wekZHKqAb0oCkudJ
         rsZ25Q67SEiVCHrPiKIpmEH90buWM6rKNc+5o72Euld42RUnBJArAMsPDtH4afpZINRL
         6Buv2+Hq7CSUM20gvxXox8vvwhOY6481UkK/Wq73VYfFt/6gLSJro1WyBTtPo/bTMFYc
         d/jSoBGQiDMXTAM3dKEyy7Go079FsI48C30IdFYciq6kUW5FGAiB8FoXtL9z7EpvZr+3
         FpIi47Yb7goZi2TUSEF3WohnCRIVvm4ijq3R81Gc96gnxpEv7tjdzGudUnlSv461Flj4
         U0zA==
X-Forwarded-Encrypted: i=1; AJvYcCXLVGX2R/L4c2ArNVlzfkZvyozNkwuptWTOQMA6RnCFj1D1Zz4gIDl2JAc1xpVV7tqTjfemS3+sIDEcYhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxyBkkuYvFCSHxyi4R/5oxd7wJ2LJZKFIxc4/mmVqr4OhxZk3h
	/YPgj9Le5NW1q0ZPlzFbypcmkhFmNxeIXPrZy0WSos3elBoB9yb1gvbHgrpTDQNCEFLO4VdhBM+
	uvAYCBT/N/9wsrXYsNvd0BCPez37bGakhuvxA
X-Gm-Gg: ASbGncuWekwECBFeMw1+lyxi8gSetl0wTMSKgjt2MmLYJE/qQ4Mtw0paizuUKeKunaG
	BrbVvO7jeaSux0DrTm1DYe5ldewlUJKMIPcuLmyc5zyl9X7tgf1or0SDFq3zAQMu4i2n1lV0bIv
	PJVsTuY84lCLhK46MqCjmwlEI4Qg==
X-Google-Smtp-Source: AGHT+IHGno0gpGGbYBLkdSrCpQQ3wx/4MXbBdtqd22IKoXvDe8XdvZM0XE8liXtix/aEe3SL3z4+Ye2lu1R6RPBOKXg=
X-Received: by 2002:aa7:d7d3:0:b0:5dc:d909:3109 with SMTP id
 4fb4d7f45d1cf-5dcd9093251mr160600a12.7.1738767642585; Wed, 05 Feb 2025
 07:00:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67a34e60.050a0220.50516.0040.GAE@google.com>
In-Reply-To: <67a34e60.050a0220.50516.0040.GAE@google.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 5 Feb 2025 16:00:06 +0100
X-Gm-Features: AWEUYZlZucCQVL5QWy9q08RV8uJzfYam-zAdITGASXdZWg06IzTeZfBp52gAsb0
Message-ID: <CAG48ez3KKEYRU+-Mkk+tq1Onv3QWg0jP6fEKYjNjRS+ziP5dAQ@mail.gmail.com>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup / try_to_migrate_one
To: syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 12:41=E2=80=AFPM syzbot
<syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com> wrote:
> syzbot found the following issue on:
>
> HEAD commit:    d009de7d5428 Merge tag 'livepatching-for-6.14-rc2' of git=
:..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D12b678a458000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D9e757e3762bd6=
30b
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc2e5712cbb14c95=
d4847
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Deb=
ian) 2.40
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/9235000a1b88/dis=
k-d009de7d.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/098ef82f8ab3/vmlinu=
x-d009de7d.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/4f51f5eb5782/b=
zImage-d009de7d.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KCSAN: data-race in mprotect_fixup / try_to_migrate_one
>
> write to 0xffff888114b41700 of 8 bytes by task 6432 on cpu 1:
>  vm_flags_init include/linux/mm.h:875 [inline]
>  vm_flags_reset include/linux/mm.h:887 [inline]
>  mprotect_fixup+0x419/0x5e0 mm/mprotect.c:679
>  do_mprotect_pkey+0x6cc/0x9a0 mm/mprotect.c:840

This is one side changing the VMA flags under the mmap lock in write mode..=
.

>  __do_sys_mprotect mm/mprotect.c:861 [inline]
>  __se_sys_mprotect mm/mprotect.c:858 [inline]
>  __x64_sys_mprotect+0x48/0x60 mm/mprotect.c:858
>  x64_sys_call+0x2770/0x2dc0 arch/x86/include/generated/asm/syscalls_64.h:=
11
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xc9/0x1c0 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> read to 0xffff888114b41700 of 8 bytes by task 6418 on cpu 0:
>  try_to_migrate_one+0xb5a/0x12e0 mm/rmap.c:2321
>  rmap_walk_anon+0x28f/0x440 mm/rmap.c:2646

... while the other side comes through the rmap, which does not
involve the mmap lock. Yes, that does not have any mutual locking by
design, I think.

The comments in the VMA flags code incorrectly assume that no
concurrency is possible here; and I think the comment in
mprotect_fixup() about protection by the mmap_lock has also been kinda
wrong since the beginning of git history.

The VM_LOCKED check in the migration code was added by Hugh in commit
b74355078b655, but that's just one example syzbot stumbled over; we
have similar racy vm_flags reads through the rmap on other paths like:

unmap_mapping_range_tree -> unmap_mapping_range_vma ->
zap_page_range_single -> unmap_single_vma -> unmap_page_range -> ...
-> zap_pte_range -> zap_present_ptes -> vm_normal_page

I think the right fix might just be to make sure that we use
WRITE_ONCE() for these vm_flags updates, and READ_ONCE() around
->vm_flags reads that can happen in rmap walk paths, though we should
think about the consequences of concurrently changing flags in every
place that gets a READ_ONCE()...


>  try_to_migrate+0x11f/0x150
>  migrate_folio_unmap mm/migrate.c:1320 [inline]
>  migrate_pages_batch+0x786/0x1930 mm/migrate.c:1866
>  migrate_pages_sync mm/migrate.c:1989 [inline]
>  migrate_pages+0xf02/0x1840 mm/migrate.c:2098
>  do_mbind mm/mempolicy.c:1394 [inline]
>  kernel_mbind mm/mempolicy.c:1537 [inline]
>  __do_sys_mbind mm/mempolicy.c:1611 [inline]
>  __se_sys_mbind+0xfd1/0x11c0 mm/mempolicy.c:1607
>  __x64_sys_mbind+0x78/0x90 mm/mempolicy.c:1607
>  x64_sys_call+0x2662/0x2dc0 arch/x86/include/generated/asm/syscalls_64.h:=
238
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xc9/0x1c0 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> value changed: 0x0000000000102077 -> 0x0000000000102071
>
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 0 UID: 0 PID: 6418 Comm: syz.0.1339 Not tainted 6.14.0-rc1-syzkaller=
-00026-gd009de7d5428 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 12/27/2024
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
