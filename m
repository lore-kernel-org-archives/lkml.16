Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E561EA7DF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748342555; cv=none; b=oBSlmDTku5B6WOlM8f/fx0SLrXyRwhaggYmZFfGKxK5dGgxw4EV2YH7mo4mjyVE+B62ajmjsuq78PGVwziekxzqFpwS9cMKAXeRqV+qx0RVO08tsdjzeUryvPRJb3P43Niw5RmJSO3c9mT96EgtBmAf6Ww1WC3QX9UNAYnVZWzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748342555; c=relaxed/simple;
	bh=ylnWf94hRcWdF9suXgclvU2TBgd4dHED5ATVeOE78X8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Ujl730QqSpjiBx0VWGWo4jtiaEXF5KJiXTyy1jsBCSyEsNMCfrxoxxjhR8c1GclXz2MgGrn/6+WJ7sRgCcRWrQIkus7/FAav7nPZbKecYPmMzF8SG+gqWypStj4paxKjGePTu0CzP9XGJpE5DgVHbhkU0Vd93vwtx7MeLcfg3nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3db9a090c15so31374885ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748342553; x=1748947353;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GGIsTS2/wv6irS0gyfFOTsWPvGOReKGkibrvBLKqwiE=;
        b=lZ58Hk+H1Mc9URMw7ky6epzYGToO27MfXjbVYzncG5KJTYfHOCF/uTllztHeICtqoN
         Hg4pYT+7MYhnedS9MSu6n5YQGQryRfvcLLCJFjzpXzQeENvRmaZetKgzo/eco16W42kj
         eRJ6J0Z7IT6ldn5+DJFpNDtQsoMZRdeYEEJVpYwD4Gwa5fETM6DPlYtrnNjcqLUz2kvw
         Kjjkv6RL8HK1qYLlJYgHV0kZ32GxCvLNT1h6jp0xKPy46MYh21dSdx9I8fxDBVCEauCJ
         VihBL0WdxjRisuNi8xnDNt55ourKTPmplU4ygUbqoyNbmavLSELszxthLRZHcbn1zdHw
         IAaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD59Nc1YbjL3RXOg4clGffUvqf/ApulEeenVfK/4OTHX3Yy3ci91IpuMt9n3rYrEMJxt9pekPpMdlvZUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXE1p2HiPkMxauhq+xQ3kF5liX+mkO5h6qaBAPFJ7g42J94Mnk
	4ggk+UM//LkF3Ng8wNAtGOtgJosc/D0rmVSrkXrc8qpyjCkzbDuja33EbgyFs3kT6QA6vlQXuMV
	0CKTUYnDHrCbpqVeDU2iJMe0jomem1aAJWshmHk3pBRoLwEba9pYKrWOBbmY=
X-Google-Smtp-Source: AGHT+IFDCtCDx4Vqo4IhyglYRG3TOIGyhhy1uH3mWj6eEwwTD74jWnMD9gubSNOGF8mEm2mNVoBUPGCdtwfFJCxk3+BMxrMmJlRV
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2221:b0:3dc:7d79:1a5c with SMTP id
 e9e14a558f8ab-3dc9b7097f0mr110772535ab.20.1748342553057; Tue, 27 May 2025
 03:42:33 -0700 (PDT)
Date: Tue, 27 May 2025 03:42:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68359719.a70a0220.253bc2.00ae.GAE@google.com>
Subject: [syzbot] [gfs2?] WARNING in gfs2_put_super
From: syzbot <syzbot+56182be23469e01affbc@syzkaller.appspotmail.com>
To: agruenba@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    176e917e010c Add linux-next specific files for 20250523
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14389170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e7902c752bef748
dashboard link: https://syzkaller.appspot.com/bug?extid=56182be23469e01affbc
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5f7692c642fa/disk-176e917e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/057a442d42d0/vmlinux-176e917e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8f8ebdb4dd96/bzImage-176e917e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+56182be23469e01affbc@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 13525 at fs/gfs2/super.c:608 gfs2_put_super+0x912/0x950 fs/gfs2/super.c:608
Modules linked in:
CPU: 0 UID: 0 PID: 13525 Comm: syz-executor Not tainted 6.15.0-rc7-next-20250523-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:gfs2_put_super+0x912/0x950 fs/gfs2/super.c:608
Code: ff e8 42 f2 f8 ff 4c 89 ff e8 5a 30 00 00 4c 89 ff 48 83 c4 38 5b 41 5c 41 5d 41 5e 41 5f 5d e9 44 1e fc ff e8 df 34 c8 fd 90 <0f> 0b 90 e9 4d fa ff ff e8 d1 34 c8 fd e9 9c f9 ff ff 44 89 f1 80
RSP: 0018:ffffc90004e77cb0 EFLAGS: 00010293
RAX: ffffffff83f80e51 RBX: 0000000000000000 RCX: ffff888029499e00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff888035c58818 R08: ffff888035c580af R09: 1ffff11006b8b015
R10: dffffc0000000000 R11: ffffed1006b8b016 R12: ffff888035c580a8
R13: ffff888035c58818 R14: 0000000000000800 R15: ffff888035c58000
FS:  0000555586d88500(0000) GS:ffff888125c56000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8ca2c3f000 CR3: 0000000041d1c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 000000000000f978 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 generic_shutdown_super+0x135/0x2c0 fs/super.c:643
 kill_block_super+0x44/0x90 fs/super.c:1753
 deactivate_locked_super+0xb9/0x130 fs/super.c:474
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1417
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xec/0x110 kernel/entry/common.c:114
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9a3158fc97
Code: a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 a8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffdc6205458 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007f9a3161089d RCX: 00007f9a3158fc97
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffdc6205510
RBP: 00007ffdc6205510 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffdc62065a0
R13: 00007f9a3161089d R14: 0000000000109e74 R15: 00007ffdc62065e0
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
