Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108771EA6F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744754826; cv=none; b=uTrIem9D/Ov2NhWL80wVNj1nIGOGuuRcBg7j9ZdAjBKtJizUManMFam8YKQZp597mHz6hWTfUlZl9jIUkWYxSSofWgK8visBN95sflJ8GRYf1SOdHbNdn9VuaRnHbc45fouyGXAJPbRpvNgSlUvYQw7ZSTvXGk0uaiBVeksFhl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744754826; c=relaxed/simple;
	bh=kL9VGDkvpQr1zYUWJsPtGOLBKMYThDkkMOywfyWHTzo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Af/MTTUl0zN3TAVI54D0Qh2MdR/ZSiJVi2U8b84lGEOMhnBV9Hk+XvTG28E0kFFCbLHNDHssydvnJ6ZTt185mRE4xbal4XTeYDbFND9PVJSSWIdIhqqhdlQ45xvYKNXvQ8qoJT1XIEeorvEAMEvgRFU+ivIu/rgzPHQORaKEFg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d6e10f8747so58082075ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744754822; x=1745359622;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDf58XDHmqtv5dlJHeZuOlpCr06VfE29Urc6uWgfJtg=;
        b=mxh+KMq2FH1gpARtDWACn2oLS9heD1XVnJ+52AhROUyH31viOZndY7N4WSGectAxtu
         o9DICuqxtvxpuzFRNPJwotGAV8GzBK0nOACfTzBBaUNHdneLK3FXZnoEITXuJpMuYCOx
         TpPn3Gq2pOzH+i6DpEfxKPKLMIIiZoRbBcKY/tEjbQbbI96FNspqQvLRyM9CSuWix7jc
         imjJeWzwwBeHkhsc3fO73kk0hswevpjYe/SyMmYsoOJ4Nt8SbVx0GTu3y4+dTmxvqMEl
         o8oeMUdm8h88WnR5ZZHcbVzMeT1mjy+qqgGh75pbip5EKqwEJHaz01TQZ3NplLT4CQFG
         JkHg==
X-Forwarded-Encrypted: i=1; AJvYcCVaWb4qCO3rMPoBRAigeZ4GjGKVQ/5HNj2jrjYr50B0Hc9FsvFTLGV8OvV2NjKIhpmjyu87w+/rU+aB6Oc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb2KxxlBUJOd8AeYZA8EBdahkJvStneEjpDJrVnXyDAxZlYEVc
	T151KQdl+X//raQ5AEGt0JJ9UDFEQ3Dd0BH10aSab/PTHR6k0EbAknraRFOcDgufqRFBoBNwuOm
	tLDzNAiEPfZ/c/0ZgnYpGNnwnc523051Y0YTinFnXeqcvK6v9j/LlrxE=
X-Google-Smtp-Source: AGHT+IF33MlQi6q8VLJpn2mQHScuY6OVhRvsfgZfrPeNZOZTSiboFK7cco4G9ng2ybMd6fPkByFvjrzfiHDDTeKSLaPwA9396hTm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1746:b0:3d6:d162:be02 with SMTP id
 e9e14a558f8ab-3d812592679mr14177415ab.21.1744754821977; Tue, 15 Apr 2025
 15:07:01 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:07:01 -0700
In-Reply-To: <20250415174725.369628-1-duttaditya18@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fed885.050a0220.d2ea7.0000.GAE@google.com>
Subject: Re: [syzbot] [jfs?] UBSAN: array-index-out-of-bounds in add_missing_indices
From: syzbot <syzbot+b974bd41515f770c608b@syzkaller.appspotmail.com>
To: duttaditya18@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, syzkaller-lts-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
UBSAN: array-index-out-of-bounds in add_missing_indices

 ... Log Wrap ... Log Wrap ... Log Wrap ...
================================================================================
UBSAN: array-index-out-of-bounds in fs/jfs/jfs_dtree.c:2946:28
index -128 is out of range for type 'struct dtslot[128]'
CPU: 1 PID: 5111 Comm: syz.0.16 Not tainted 5.15.180-syzkaller-07499-gf7347f400572-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call trace:
 dump_backtrace+0x0/0x530 arch/arm64/kernel/stacktrace.c:152
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:216
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x108/0x170 lib/dump_stack.c:106
 dump_stack+0x1c/0x58 lib/dump_stack.c:113
 ubsan_epilogue lib/ubsan.c:151 [inline]
 __ubsan_handle_out_of_bounds+0x108/0x15c lib/ubsan.c:282
 add_missing_indices+0x6d0/0xaac fs/jfs/jfs_dtree.c:2946
 jfs_readdir+0x1974/0x31dc fs/jfs/jfs_dtree.c:3316
 iterate_dir+0x1f4/0x4ec fs/readdir.c:-1
 __do_sys_getdents64 fs/readdir.c:369 [inline]
 __se_sys_getdents64 fs/readdir.c:354 [inline]
 __arm64_sys_getdents64+0x1c4/0x4c4 fs/readdir.c:354
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:52
 el0_svc_common+0x138/0x258 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x58/0x14c arch/arm64/kernel/syscall.c:181
 el0_svc+0x7c/0x1f0 arch/arm64/kernel/entry-common.c:608
 el0t_64_sync_handler+0x84/0xe4 arch/arm64/kernel/entry-common.c:626
 el0t_64_sync+0x1a0/0x1a4 arch/arm64/kernel/entry.S:584
================================================================================
==================================================================
BUG: KASAN: slab-out-of-bounds in diWrite+0xb48/0x1604 fs/jfs/jfs_imap.c:753
Read of size 32 at addr ffffff80e1ab4130 by task syz.0.16/5111

CPU: 1 PID: 5111 Comm: syz.0.16 Not tainted 5.15.180-syzkaller-07499-gf7347f400572-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call trace:
 dump_backtrace+0x0/0x530 arch/arm64/kernel/stacktrace.c:152
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:216
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x108/0x170 lib/dump_stack.c:106
 print_address_description+0x7c/0x3f0 mm/kasan/report.c:248
 __kasan_report mm/kasan/report.c:434 [inline]
 kasan_report+0x174/0x1e4 mm/kasan/report.c:451
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x274/0x2b4 mm/kasan/generic.c:189
 memcpy+0x90/0xe8 mm/kasan/shadow.c:65
 diWrite+0xb48/0x1604 fs/jfs/jfs_imap.c:753
 txCommit+0x748/0x5548 fs/jfs/jfs_txnmgr.c:1255
 add_missing_indices+0x74c/0xaac fs/jfs/jfs_dtree.c:2960
 jfs_readdir+0x1974/0x31dc fs/jfs/jfs_dtree.c:3316
 iterate_dir+0x1f4/0x4ec fs/readdir.c:-1
 __do_sys_getdents64 fs/readdir.c:369 [inline]
 __se_sys_getdents64 fs/readdir.c:354 [inline]
 __arm64_sys_getdents64+0x1c4/0x4c4 fs/readdir.c:354
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:52
 el0_svc_common+0x138/0x258 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x58/0x14c arch/arm64/kernel/syscall.c:181
 el0_svc+0x7c/0x1f0 arch/arm64/kernel/entry-common.c:608
 el0t_64_sync_handler+0x84/0xe4 arch/arm64/kernel/entry-common.c:626
 el0t_64_sync+0x1a0/0x1a4 arch/arm64/kernel/entry.S:584

Allocated by task 0:
(stack is not available)

The buggy address belongs to the object at ffffff80e1ab40c0
 which belongs to the cache jfs_ip of size 2240
The buggy address is located 112 bytes inside of
 2240-byte region [ffffff80e1ab40c0, ffffff80e1ab4980)
The buggy address belongs to the page:
page:000000008771d7e4 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x121ab0
head:000000008771d7e4 order:3 compound_mapcount:0 compound_pincount:0
memcg:ffffff80c76f5501
flags: 0x5ffc00000010200(slab|head|node=0|zone=2|lastcpupid=0x7ff)
raw: 05ffc00000010200 0000000000000000 dead000000000122 ffffff80c6707680
raw: 0000000000000000 00000000800d000d 00000001ffffffff ffffff80c76f5501
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffffff80e1ab4000: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
 ffffff80e1ab4080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffffff80e1ab4100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                     ^
 ffffff80e1ab4180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffffff80e1ab4200: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================

 ... Log Wrap ... Log Wrap ... Log Wrap ...


 ... Log Wrap ... Log Wrap ... Log Wrap ...


 ... Log Wrap ... Log Wrap ... Log Wrap ...

ERROR: (device loop0): jfs_readdir: JFS:Dtree error: ino = 2, bn=0, index = 0

ERROR: (device loop0): remounting filesystem as read-only
JFS: Invalid stbl[1] = -128 for inode 2, block = 0


Tested on:

commit:         f7347f40 Linux 5.15.180
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-5.15.y
console output: https://syzkaller.appspot.com/x/log.txt?x=132e08cc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e433a356d25f60cb
dashboard link: https://syzkaller.appspot.com/bug?extid=b974bd41515f770c608b
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12762470580000

