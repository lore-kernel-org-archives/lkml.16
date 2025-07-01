Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996CB26463B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751356707; cv=none; b=gE+EmpO+JnpaYtPiO88tl6O7iHrDDEHc7QCTqNdMe9mPRFOR50kYuMa6c8B8EWJxyyweVbXfq5aGNVUuW8QhJXAGdQeOFF6gnhvHciE/hYRBDD0YD2nMCeKlPMzuC/xB7LJHKkeXLfaAJGSEC3McxjRoPKslxLsPs2YdU8evjEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751356707; c=relaxed/simple;
	bh=4SsDlEVv4NoG1n9s/poSP1xARWhi2AB4r0FKgcDoBAo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=jLKVCFlX144hgJoiTygHTqc4aiX0rD4Q3pJrjPFaa5S6T07Terr7y9WYqOENx5jPAtLgYxS5AmCEd0ywDpcoSamZ9E7G7HHoThc/LB3RO+qdYXzluUw3/PTJOPDVwCEd+ewURgOB/6o5+zN4cI+aMvkggS5Ki2qOJMo109rjzqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3df3b71b987so26001165ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 00:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356705; x=1751961505;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+CLVQD3LnpmiHjpHVQmScdzZclDfnwrqpmpY5qBYtNM=;
        b=OWDtKEJlQFesTnqjqf+E1B0g7wRAiBuYpPt3tmYQb+JjU19cpRQjoO3NvpEhj8LP6U
         2URAf96s3GPFJ+uogdUIkE8tiCqiTE0xa7/l3UXaeBhDoUGhClQemjpFbsGPOSUFiWc+
         FqDxBM+9tTAaEAjngm7w/TBbbbWF8atiEF6vcirj/wmvLBOnFdUfulsAxxrX8dlWFnAT
         vy3JZrGw6iQ686Q3+7+vhzzIcuec9VCEOcS0WjBDAI5+ky4frlPT/FAVUZvH+SrHuYeU
         dh7lDNP3GianQID13/9z8sv8EO9MI+XYTV9H3GnkHM1KebtqRSX0w6dlx4O1szylehgz
         KHTg==
X-Forwarded-Encrypted: i=1; AJvYcCVAJoVWxi3NVmOXBBo94aqnLAYHzIfgNki4TKBjYOAkaNqR129OmgAdzpTjmCkmRrP3srXm3r6Av227irI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy273nYuU8HhWtQwtcyuJvJxA4onp0qiM/ovCd424Bgx8X9vgsq
	wuQ16vM1LGosSEr+TxD8Xp2hJ6Kn6loxCu7BWBCy0Yz9t5GLdAC3yPopKYfNhTLBJdp6MsYfccL
	NeNp4hSlA2aIpFps0WluMzHoFnQw0uCqTscEdiFSPYfNSbY261QoKIsMoSeg=
X-Google-Smtp-Source: AGHT+IEcB8LepVGB5wtxw5BKfJ9I8GpscC9V+PYsDaWVWZuuA+linCaw8tr9p2nd4DKfx/Z4dw65m45nHOomThcm1O32dzyoUkEu
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1847:b0:3dd:c946:a273 with SMTP id
 e9e14a558f8ab-3df4ab865f0mr180191355ab.9.1751356704669; Tue, 01 Jul 2025
 00:58:24 -0700 (PDT)
Date: Tue, 01 Jul 2025 00:58:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68639520.a70a0220.3b7e22.17e6.GAE@google.com>
Subject: [syzbot] [f2fs?] kernel BUG in do_write_page
From: syzbot <syzbot+9201a61c060513d4be38@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2aeda9592360 Add linux-next specific files for 20250627
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=152363d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7f5c1d958b70bf47
dashboard link: https://syzkaller.appspot.com/bug?extid=9201a61c060513d4be38
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d532560074a3/disk-2aeda959.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/483001f76864/vmlinux-2aeda959.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8f233cdc1c77/bzImage-2aeda959.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9201a61c060513d4be38@syzkaller.appspotmail.com

F2FS-fs (loop9): inject invalid blkaddr in f2fs_is_valid_blkaddr of do_write_page+0x277/0xb10 fs/f2fs/segment.c:3956
------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:3957!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 10538 Comm: syz-executor Not tainted 6.16.0-rc3-next-20250627-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:do_write_page+0xa44/0xb10 fs/f2fs/segment.c:3956
Code: 82 7f ad fd 49 89 ed 48 89 e8 48 25 ff 0f 00 00 74 1a e8 8f 7a ad fd e9 9f 00 00 00 e8 85 7a ad fd 90 0f 0b e8 7d 7a ad fd 90 <0f> 0b 4d 89 ee 4c 89 ef be 08 00 00 00 e8 7a 7c 11 fe 49 c1 ee 03
RSP: 0018:ffffc90004f2ec58 EFLAGS: 00010293
RAX: ffffffff841257e3 RBX: ffffc90004f2ef40 RCX: ffff88802f493c00
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: ffffc90004f2ef5c R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bfa428 R12: ffff888042d28000
R13: 1ffff920009e5deb R14: dffffc0000000000 R15: ffffc90004f2ef5c
FS:  000055555f3a1500(0000) GS:ffff888125c1e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2ce7b71d60 CR3: 0000000031b0e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 f2fs_outplace_write_data+0x11a/0x220 fs/f2fs/segment.c:4017
 f2fs_do_write_data_page+0x12ea/0x1a40 fs/f2fs/data.c:2752
 f2fs_write_single_data_page+0xa68/0x1680 fs/f2fs/data.c:2851
 f2fs_write_cache_pages fs/f2fs/data.c:3133 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3282 [inline]
 f2fs_write_data_pages+0x195b/0x3000 fs/f2fs/data.c:3309
 do_writepages+0x32b/0x550 mm/page-writeback.c:2636
 filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
 __filemap_fdatawrite_range mm/filemap.c:419 [inline]
 __filemap_fdatawrite mm/filemap.c:425 [inline]
 filemap_fdatawrite+0x199/0x240 mm/filemap.c:430
 f2fs_sync_dirty_inodes+0x31f/0x830 fs/f2fs/checkpoint.c:1108
 block_operations fs/f2fs/checkpoint.c:1247 [inline]
 f2fs_write_checkpoint+0x95a/0x1df0 fs/f2fs/checkpoint.c:1638
 kill_f2fs_super+0x2c3/0x6c0 fs/f2fs/super.c:5081
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
RIP: 0033:0x7f85f3d8fc57
Code: a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 a8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffc395e64c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007f85f3e10925 RCX: 00007f85f3d8fc57
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffc395e6580
RBP: 00007ffc395e6580 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffc395e7610
R13: 00007f85f3e10925 R14: 00000000000c355a R15: 00007ffc395e7650
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:do_write_page+0xa44/0xb10 fs/f2fs/segment.c:3956
Code: 82 7f ad fd 49 89 ed 48 89 e8 48 25 ff 0f 00 00 74 1a e8 8f 7a ad fd e9 9f 00 00 00 e8 85 7a ad fd 90 0f 0b e8 7d 7a ad fd 90 <0f> 0b 4d 89 ee 4c 89 ef be 08 00 00 00 e8 7a 7c 11 fe 49 c1 ee 03
RSP: 0018:ffffc90004f2ec58 EFLAGS: 00010293
RAX: ffffffff841257e3 RBX: ffffc90004f2ef40 RCX: ffff88802f493c00
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: ffffc90004f2ef5c R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bfa428 R12: ffff888042d28000
R13: 1ffff920009e5deb R14: dffffc0000000000 R15: ffffc90004f2ef5c
FS:  000055555f3a1500(0000) GS:ffff888125c1e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff1d4e5ef40 CR3: 0000000031b0e000 CR4: 00000000003526f0


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
