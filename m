Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B10D230D0E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152855; cv=none; b=fbewd39roHviZZwJf9dUJbC+QIktcf/UMETsFgeBHoiFRUl+8BhtbktdQi/1vpJHGIEOgPT7BIRTxytmUab9uUHX8vRN3b7NrRkEjCQAOld4+uHv4LaSfygfgy7PGtNfNnnW+u2aDZE4tPr6qCPJ6FS2UmyFXDPFtPMp1wipKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152855; c=relaxed/simple;
	bh=G5eezadzLBW93ru6voapn97o+0muFg8uZIO6GHGGoCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lPqKw+GJs0doQW0zMC+xutjeau6Xx8awToNg0ZSLT7TYNSYAepYsAqoiMFRJZRdMTQC2q+YosMWsdSNgQS45Xl5S/tCQ4oNh5ObAVjpMGaleH1ACoGfBrIXfWaAr605Y5a3I7bw0BweC8K1nzNMgD/pMWqhg7VsmuDWER3O1FzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WuJpyJsX; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WuJpyJsX"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3122a63201bso5132161a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750152852; x=1750757652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iy9ozREwXM6yajfHwp8sB5SkUjs9u/5sdv2yga+HurE=;
        b=WuJpyJsXBcG2MAKsFjqblnCmyc1coWOKTasu4l+akIP9qa+QVXKX0oBnpt8YYf9c0F
         o/4z9wknLKpvBExiM33lfoktXxoQvYyKV5FcW4G5dHn180f8a9HywDeI+5e8mKgp90ei
         IWWtbPnuqB7GCUH5NtzVlHKx9EHxdTEHZgwAqgi2wFohe4x9fm8jUXrkWrbSE8l5vTqI
         OfAWzDgKMJ3yIvV9Gci10BqmcgOYpwqD21wHcIRegVFv4jFMFTnWXNNg4yEFCmrxI0Rd
         oXmeLn+MHQWKA9+zPmRT5hJ3t7uVlf5cHDPYqPEKdOxTV+LVgHtWXZsVNQkSom/jWQqp
         x6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152852; x=1750757652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iy9ozREwXM6yajfHwp8sB5SkUjs9u/5sdv2yga+HurE=;
        b=s/zlSk6aRNcOOOHqOhsbaqfgX+bhARuH5tE/on+6a/SM/EAp+NyBgOej+yDGXzQcVX
         rNjP50JLUQP5gFWmNFyt92Yxl8yyo1NxV8abT7cmmlHSVi2MbCs8xfdvrBkznPAY+t5L
         fvBIFSy5aBH6iifWZvx5/o7erMEC6b6Dibdwb4lmrjz8CEn1KotSljkrYDoaZg+dAiUw
         b+B7levEMXGA/CRdurRJDjoBQOZaP0HkYALLZU8rg7G1s24dwdkbl6DQFinR60eZAqIE
         Ni31ZF/c6i0mSctBNIUWCTsz50EImw0ibJY/nR6DJqA7pSUtrR+cH/ycG6FCfNaCWTgw
         boMA==
X-Forwarded-Encrypted: i=1; AJvYcCXVRJX8a1dTNNWcmqwsquOKFfnGES8Qb6uuoTzMEXnZz2Uq+Ip9iZnKX1mVXtu02h4cRoQKoMN554od1uc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT3vYAVmyeuF93kzGRxHEuDDm11qB+s5DOr9MytQeRC6dmKId8
	aiYvkvIBO/y4oBTTS7htrfHVy6/uqP63eC7mUBIfj1euF0nRwl4pB8jigLMjQ+1w4BbsJZNVDCu
	jVDMXs5hCvBFB519id4PbHay265w+K609WY/V0PWIqJkx/mhhlSYB6KCg
X-Gm-Gg: ASbGnctGMZU6SIvnOsOoWewxthvp5OIrRh5m6Xae2OcqM//Gp5hfdT0JQQYiYNwDbGy
	SJMd6sSTfC97tq25cLXElfHPjDwa6OsLyPManIZWbMzOu+yzjoayP7iJViBi4wZWTOW/6RoDlmg
	X5iMxseh7j5OjIfhyQ8mE0PmHXQlX3/NCqlgdi4DHXsYCNx7clH8hkMbyW2xhUoa1ev8DQHMU7
X-Google-Smtp-Source: AGHT+IGmEOYrE0DsdOuE8bNLBAUcGIGtWS0fLaxdWfeUWjsCOySE0e4ca0Wc/AhJzhXC0KwRwmQwOczpGP+O7aLEQL8=
X-Received: by 2002:a17:90b:35ce:b0:311:d670:a10d with SMTP id
 98e67ed59e1d1-313f1d96b23mr16599599a91.26.1750152852309; Tue, 17 Jun 2025
 02:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68512333.a70a0220.395abc.0207.GAE@google.com>
In-Reply-To: <68512333.a70a0220.395abc.0207.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 17 Jun 2025 11:33:59 +0200
X-Gm-Features: AX0GCFt3-7Tensh_rDRvxoQAm3XeFrHhfv0OAVC0DXQfsgghdTDrMcup7qn11gs
Message-ID: <CANp29Y5oXu0WN79EOvCLAYy7-ThWQoz8vswCo0OTuS+5bhJkzQ@mail.gmail.com>
Subject: Re: [syzbot] [v9fs?] WARNING: mm/page_alloc.c:LINE at
 __alloc_frozen_pages_noprof, CPU: syz.NUM.NUM/NUM
To: syzbot <syzbot+c44c80c9d28ec68d1c06@syzkaller.appspotmail.com>
Cc: asmadeus@codewreck.org, ericvh@kernel.org, linux-kernel@vger.kernel.org, 
	linux_oss@crudebyte.com, lucho@ionkov.net, syzkaller-bugs@googlegroups.com, 
	v9fs@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz dup: WARNING in __alloc_frozen_pages_noprof


On Tue, Jun 17, 2025 at 10:11=E2=80=AFAM syzbot
<syzbot+c44c80c9d28ec68d1c06@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    050f8ad7b58d Add linux-next specific files for 20250616
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D17949e8258000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd2efc7740224b=
93a
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc44c80c9d28ec68=
d1c06
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e0775=
7-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D14fd95d4580=
000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/49faa18d2f53/dis=
k-050f8ad7.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/7c6f9cd7fe5d/vmlinu=
x-050f8ad7.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/84a08d6403ee/b=
zImage-050f8ad7.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+c44c80c9d28ec68d1c06@syzkaller.appspotmail.com
>
> ------------[ cut here ]------------
> WARNING: mm/page_alloc.c:4935 at __alloc_frozen_pages_noprof+0x2c8/0x370 =
mm/page_alloc.c:4935, CPU#1: syz.0.16/6030
> Modules linked in:
> CPU: 1 UID: 0 PID: 6030 Comm: syz.0.16 Not tainted 6.16.0-rc2-next-202506=
16-syzkaller #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 05/07/2025
> RIP: 0010:__alloc_frozen_pages_noprof+0x2c8/0x370 mm/page_alloc.c:4935
> Code: 74 10 4c 89 e7 89 54 24 0c e8 d4 12 0d 00 8b 54 24 0c 49 83 3c 24 0=
0 0f 85 a5 fe ff ff e9 a6 fe ff ff c6 05 f3 c0 73 0d 01 90 <0f> 0b 90 e9 18=
 ff ff ff a9 00 00 08 00 48 8b 4c 24 10 4c 8d 44 24
> RSP: 0018:ffffc90003cdf9c0 EFLAGS: 00010246
> RAX: ffffc90003cdfa00 RBX: 000000000000002a RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc90003cdfa28
> RBP: ffffc90003cdfaa8 R08: ffffc90003cdfa27 R09: 0000000000000000
> R10: ffffc90003cdfa00 R11: fffff5200079bf45 R12: 0000000000000000
> R13: 1ffff9200079bf3c R14: 0000000000040d40 R15: dffffc0000000000
> FS:  000055557e5fb500(0000) GS:ffff888125d40000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fff1db25138 CR3: 00000000762fa000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  __alloc_pages_noprof+0xa/0x30 mm/page_alloc.c:4993
>  __alloc_pages_node_noprof include/linux/gfp.h:284 [inline]
>  alloc_pages_node_noprof include/linux/gfp.h:311 [inline]
>  ___kmalloc_large_node+0x85/0x210 mm/slub.c:4272
>  __kmalloc_large_node_noprof+0x18/0x90 mm/slub.c:4300
>  __do_kmalloc_node mm/slub.c:4316 [inline]
>  __kmalloc_noprof+0x36f/0x4f0 mm/slub.c:4340
>  kmalloc_noprof include/linux/slab.h:909 [inline]
>  kzalloc_noprof include/linux/slab.h:1039 [inline]
>  v9fs_fid_get_acl+0x4f/0x100 fs/9p/acl.c:32
>  __v9fs_get_acl fs/9p/acl.c:66 [inline]
>  v9fs_get_acl+0x9a/0x360 fs/9p/acl.c:92
>  v9fs_qid_iget_dotl fs/9p/vfs_inode_dotl.c:131 [inline]
>  v9fs_inode_from_fid_dotl+0x221/0x2b0 fs/9p/vfs_inode_dotl.c:154
>  v9fs_get_new_inode_from_fid fs/9p/v9fs.h:251 [inline]
>  v9fs_mount+0x6eb/0xa50 fs/9p/vfs_super.c:144
>  legacy_get_tree+0xfa/0x1a0 fs/fs_context.c:666
>  vfs_get_tree+0x92/0x2b0 fs/super.c:1802
>  do_new_mount+0x24a/0xa40 fs/namespace.c:3885
>  do_mount fs/namespace.c:4222 [inline]
>  __do_sys_mount fs/namespace.c:4433 [inline]
>  __se_sys_mount+0x317/0x410 fs/namespace.c:4410
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f87d618e929
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffe32d1a898 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
> RAX: ffffffffffffffda RBX: 00007f87d63b5fa0 RCX: 00007f87d618e929
> RDX: 0000200000000b80 RSI: 00002000000003c0 RDI: 0000000000000000
> RBP: 00007f87d6210b39 R08: 0000200000000580 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007f87d63b5fa0 R14: 00007f87d63b5fa0 R15: 0000000000000005
>  </TASK>
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
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
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
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/68512333.a70a0220.395abc.0207.GAE%40google.com.
