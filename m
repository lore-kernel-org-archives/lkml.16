Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEEA26B772
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358886; cv=none; b=CsbNBvmwquOGHKURhH1HgcNTsnOfaA17MgfHK8Gu6+DwUf41EZfahykBZ3fL+5JblqQSdXOaNxvglc3qOZqjxz4QCw7kyXNil81oSQPTwf19HJX+9CAjhBdrdeMrEBZDGcxortHxzTlYlVPn1x1tusWQbaGPLp6KvPfA+dVqs5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358886; c=relaxed/simple;
	bh=tePumcfgYM4yfA1zn/OepsW4Fes5VB99oPMwomROmQQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=dFvteH5fIWk8p5xejgAeIMCN5aZv4ix/Q0/Cbj+TwD64ahfi2mAna41OTvj2ofqy+cs2IX+sgepV0rN1Zt4M9ImTCo01kxmbNfoviFqeJ+8F4tPA/tTowbQOOBKrQ4y05M+iAyIq6SxZl2/oqWC9f8sBDYvg8lwP/iTuXyVyOMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-86a5def8869so469646839f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751358884; x=1751963684;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P/RpZV1Tkb3Ci7/HwJluY5QW3M0f7S/ytspF8Tb+Pss=;
        b=NtxSEyEKwUIoC4CrgXj4AlwTo5L3zcclH6BBVBaCTZBTq7ISAEx+br6dzDSVt5aXZT
         A659cq0mGUM3//VOe8LVgWfd1BCD9/bu9lF5Tog0TyzGGUrkuYTFGOqSQw+o+qs/b2IK
         NKDp+5aOs4K1W92CDQEXqhDFmS+82gdFSivF8+1iJ5xUoedAYUCwS9zeIsj55ICWBMbs
         Ze0ogRQ7Hb1YP6p4siPD/1PKhV2JFPqlj1PsE89h69jnbP56NQLhnidRBXCchUgHuyiY
         MiSW2+9koYBgdLmfUw96gIMA15w0jneMjWnmhiS6y7C6TqqfcD40bzeBEJwIkbSlqLLO
         DRnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFFME8+HAVjiU51KOBhdTPLWVkGKEfrkbhXCtbsmGRfJysBpW6i5qfMei4MDLj6PMlC3gDt8ZQVaT4PP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyobd9H+DreFJOnfv3sq0Thh+LBapPCTdUXo8vZScSr/eJowckR
	o1ahQuyKT52ys5fkwHYjV4vV0DzVFfd9KvpHi6Z71jzE9BykKegSNw6Y6T7TDmFh7p8TL6Rfx9U
	8afaKpKVZW9ERG20MG3ReYrAfjBonDpzDn/8tlrVDh5xXk0gyLO+u9s8cD10=
X-Google-Smtp-Source: AGHT+IHb+E+e0leBAbi1q+D8Aa3gv08f1YWG9uYDktjngdyqIf2V7FSezpr5bV7XhVEvAkeoPB6pVb11n/m3ecz01m0bjSke9USB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6d83:b0:861:d8ca:3587 with SMTP id
 ca18e2360f4ac-876882a82acmr2241987739f.4.1751358884145; Tue, 01 Jul 2025
 01:34:44 -0700 (PDT)
Date: Tue, 01 Jul 2025 01:34:44 -0700
In-Reply-To: <a0abb368-1871-49e9-8f6b-ff78f543c808@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68639da4.a70a0220.3b7e22.189f.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] kernel BUG in do_write_page
From: syzbot <syzbot+9201a61c060513d4be38@syzkaller.appspotmail.com>
To: chao@kernel.org
Cc: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common

This crash does not have a reproducer. I cannot test it.

>
> On 7/1/25 15:58, syzbot wrote:
>> Hello,
>> 
>> syzbot found the following issue on:
>> 
>> HEAD commit:    2aeda9592360 Add linux-next specific files for 20250627
>> git tree:       linux-next
>> console output: https://syzkaller.appspot.com/x/log.txt?x=152363d4580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=7f5c1d958b70bf47
>> dashboard link: https://syzkaller.appspot.com/bug?extid=9201a61c060513d4be38
>> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
>> 
>> Unfortunately, I don't have any reproducer for this issue yet.
>> 
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/d532560074a3/disk-2aeda959.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/483001f76864/vmlinux-2aeda959.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/8f233cdc1c77/bzImage-2aeda959.xz
>> 
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+9201a61c060513d4be38@syzkaller.appspotmail.com
>> 
>> F2FS-fs (loop9): inject invalid blkaddr in f2fs_is_valid_blkaddr of do_write_page+0x277/0xb10 fs/f2fs/segment.c:3956
>> ------------[ cut here ]------------
>> kernel BUG at fs/f2fs/segment.c:3957!
>> Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
>> CPU: 0 UID: 0 PID: 10538 Comm: syz-executor Not tainted 6.16.0-rc3-next-20250627-syzkaller #0 PREEMPT(full) 
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
>> RIP: 0010:do_write_page+0xa44/0xb10 fs/f2fs/segment.c:3956
>> Code: 82 7f ad fd 49 89 ed 48 89 e8 48 25 ff 0f 00 00 74 1a e8 8f 7a ad fd e9 9f 00 00 00 e8 85 7a ad fd 90 0f 0b e8 7d 7a ad fd 90 <0f> 0b 4d 89 ee 4c 89 ef be 08 00 00 00 e8 7a 7c 11 fe 49 c1 ee 03
>> RSP: 0018:ffffc90004f2ec58 EFLAGS: 00010293
>> RAX: ffffffff841257e3 RBX: ffffc90004f2ef40 RCX: ffff88802f493c00
>> RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
>> RBP: ffffc90004f2ef5c R08: 0000000000000003 R09: 0000000000000004
>> R10: dffffc0000000000 R11: fffffbfff1bfa428 R12: ffff888042d28000
>> R13: 1ffff920009e5deb R14: dffffc0000000000 R15: ffffc90004f2ef5c
>> FS:  000055555f3a1500(0000) GS:ffff888125c1e000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007f2ce7b71d60 CR3: 0000000031b0e000 CR4: 00000000003526f0
>> Call Trace:
>>  <TASK>
>>  f2fs_outplace_write_data+0x11a/0x220 fs/f2fs/segment.c:4017
>>  f2fs_do_write_data_page+0x12ea/0x1a40 fs/f2fs/data.c:2752
>>  f2fs_write_single_data_page+0xa68/0x1680 fs/f2fs/data.c:2851
>>  f2fs_write_cache_pages fs/f2fs/data.c:3133 [inline]
>>  __f2fs_write_data_pages fs/f2fs/data.c:3282 [inline]
>>  f2fs_write_data_pages+0x195b/0x3000 fs/f2fs/data.c:3309
>>  do_writepages+0x32b/0x550 mm/page-writeback.c:2636
>>  filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
>>  __filemap_fdatawrite_range mm/filemap.c:419 [inline]
>>  __filemap_fdatawrite mm/filemap.c:425 [inline]
>>  filemap_fdatawrite+0x199/0x240 mm/filemap.c:430
>>  f2fs_sync_dirty_inodes+0x31f/0x830 fs/f2fs/checkpoint.c:1108
>>  block_operations fs/f2fs/checkpoint.c:1247 [inline]
>>  f2fs_write_checkpoint+0x95a/0x1df0 fs/f2fs/checkpoint.c:1638
>>  kill_f2fs_super+0x2c3/0x6c0 fs/f2fs/super.c:5081
>>  deactivate_locked_super+0xb9/0x130 fs/super.c:474
>>  cleanup_mnt+0x425/0x4c0 fs/namespace.c:1417
>>  task_work_run+0x1d4/0x260 kernel/task_work.c:227
>>  resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
>>  exit_to_user_mode_loop+0xec/0x110 kernel/entry/common.c:114
>>  exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
>>  syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
>>  syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
>>  do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
>>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> RIP: 0033:0x7f85f3d8fc57
>> Code: a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 a8 ff ff ff f7 d8 64 89 02 b8
>> RSP: 002b:00007ffc395e64c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
>> RAX: 0000000000000000 RBX: 00007f85f3e10925 RCX: 00007f85f3d8fc57
>> RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffc395e6580
>> RBP: 00007ffc395e6580 R08: 0000000000000000 R09: 0000000000000000
>> R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffc395e7610
>> R13: 00007f85f3e10925 R14: 00000000000c355a R15: 00007ffc395e7650
>>  </TASK>
>> Modules linked in:
>> ---[ end trace 0000000000000000 ]---
>> RIP: 0010:do_write_page+0xa44/0xb10 fs/f2fs/segment.c:3956
>> Code: 82 7f ad fd 49 89 ed 48 89 e8 48 25 ff 0f 00 00 74 1a e8 8f 7a ad fd e9 9f 00 00 00 e8 85 7a ad fd 90 0f 0b e8 7d 7a ad fd 90 <0f> 0b 4d 89 ee 4c 89 ef be 08 00 00 00 e8 7a 7c 11 fe 49 c1 ee 03
>> RSP: 0018:ffffc90004f2ec58 EFLAGS: 00010293
>> RAX: ffffffff841257e3 RBX: ffffc90004f2ef40 RCX: ffff88802f493c00
>> RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
>> RBP: ffffc90004f2ef5c R08: 0000000000000003 R09: 0000000000000004
>> R10: dffffc0000000000 R11: fffffbfff1bfa428 R12: ffff888042d28000
>> R13: 1ffff920009e5deb R14: dffffc0000000000 R15: ffffc90004f2ef5c
>> FS:  000055555f3a1500(0000) GS:ffff888125c1e000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007ff1d4e5ef40 CR3: 0000000031b0e000 CR4: 00000000003526f0
>> 
>> 
>> ---
>> This report is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>> 
>> syzbot will keep track of this issue. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>> 
>> If the report is already addressed, let syzbot know by replying with:
>> #syz fix: exact-commit-title
>> 
>> If you want to overwrite report's subsystems, reply with:
>> #syz set subsystems: new-subsystem
>> (See the list of subsystem names on the web dashboard)
>> 
>> If the report is a duplicate of another one, reply with:
>> #syz dup: exact-subject-of-another-report
>> 
>> If you want to undo deduplication, reply with:
>> #syz undup
>
