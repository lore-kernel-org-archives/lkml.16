Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7EA2701BC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745439691; cv=none; b=X8934s6F75lKEoFvnzz7YSdCFYTuKc8/VlWoxBHKqpp85IG+3F2k1C3r7xPXd6MxiIPSeUibmFy4HQw/Np7I07Nd4VEQtPK+q24SZKL5jX0XULI6JSbM6hq4eIlmKujXojzTCjTVpIq+HPJVH1SYB1bsaACCMqayaRChahOAyKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745439691; c=relaxed/simple;
	bh=0doTzVKA4fJEPSKoKrcntZtcds7wpAFtkRgqCefpD9Y=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kFrq54c6a/GmHOum7ZvK2LymtvzHq9O10nq+uOpccSYO9lb75tmmE7hqioJ0vaoZj0yHZXMv+iZRLOVGKALJE9tYIYi+SF1QwrSBQ2YF9RldpNrZTqH9ralq4hSLAY1eikmXrhGjbNBYKknJImAUiji6ciccnVo3H9HGhMzwRBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-861d6e340e2so35756139f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745439688; x=1746044488;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jWLt3+c9Id7NuEwBmCm4dt6E6YWWdnbWt/aRMNsT/Fk=;
        b=Ap/p4wqPpDNvv8RkKD9N6R6LKpi+MB9BLOSnaql+CR8mh7LnEqJRy6Lrl07snzy2fx
         7+EFzc3SSU6sUZdHSiA1+cm1BtirjWcj1Gnb83agLFSnhBBIrC/pl7uiz1UhISuv0eHR
         IhIiJtumjo2KXBSibcMgcd+tXtIpzLQoktQHTXAuvIuhgiH1Feo3ZumtwNkpP+OAaHyA
         xVZ1UlOc5TMsjZ7srdqEAQK8j3pj3issIBofjImiJy5LLvBL5SJ0vuv2civ6GdnhXJjb
         ZKazwZl3omxtSP5HGhfj+NuoZJ4+9ENnTR5qJm4+dsEmZTQWt+ZdD302VOuG7YhTN3un
         iy7w==
X-Forwarded-Encrypted: i=1; AJvYcCVURFjfN5ipFuZpBH/PBvgg10fk5MAyjazVo9Dd7tcMG6iI1KN0k8i/tS11q13WJ7yxnwa1OsYcrjm+GI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyonFp1JFFjBb81Bf82EDfgT1qpYQHrGqcjRfMs+qMV0Ersz3KX
	9U3vaspdFf17DzBLzNB6cP+h40IyTYNwLblp5KOoQh+rK/BpFesE0sOakg550Ii/WXUkxFiZVmp
	F0qL+emNNMHocih5BrSFLbTGoibYBtswNdtnM7ZC41gDRFViZ1uB/nEc=
X-Google-Smtp-Source: AGHT+IFB6xBCNGVCnL/PaqFG14ZPz0iwioOHmRo4t/exUqiObkV4Tointrv18ym408c0pgw5lwlEVAR2nfsHxkQeg2Wuzp+mQst9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12ea:b0:3d8:1d34:4ee6 with SMTP id
 e9e14a558f8ab-3d93041e2f4mr138595ab.17.1745439688738; Wed, 23 Apr 2025
 13:21:28 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:21:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68094bc8.050a0220.2c0118.0ac0.GAE@google.com>
Subject: [syzbot] [jfs?] UBSAN: array-index-out-of-bounds in dbAllocAG
From: syzbot <syzbot+cffd18309153948f3c3e@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8560697b23dc Merge tag '6.15-rc2-smb3-client-fixes' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=133fbbac580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a31f7155996562
dashboard link: https://syzkaller.appspot.com/bug?extid=cffd18309153948f3c3e
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14708c70580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=115dd204580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-8560697b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2acea3e6b668/vmlinux-8560697b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d2542a0d2bcd/bzImage-8560697b.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/2b4250dbd0ba/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=10708c70580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cffd18309153948f3c3e@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 32768
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in fs/jfs/jfs_dmap.c:1397:14
index 65877 is out of range for type 's8[1365]' (aka 'signed char[1365]')
CPU: 0 UID: 0 PID: 5308 Comm: syz-executor181 Not tainted 6.15.0-rc2-syzkaller-00404-g8560697b23dc #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:453
 dbAllocAG+0x704/0x1130 fs/jfs/jfs_dmap.c:1397
 dbAlloc+0x65c/0xcb0 fs/jfs/jfs_dmap.c:873
 xtSplitUp+0x554/0x21c0 fs/jfs/jfs_xtree.c:745
 xtInsert+0x5ba/0x11a0 fs/jfs/jfs_xtree.c:593
 extAlloc+0xae7/0x10a0 fs/jfs/jfs_extent.c:150
 jfs_get_block+0x41d/0xe60 fs/jfs/inode.c:248
 get_more_blocks fs/direct-io.c:648 [inline]
 do_direct_IO fs/direct-io.c:936 [inline]
 __blockdev_direct_IO+0x1add/0x4540 fs/direct-io.c:1243
 blockdev_direct_IO include/linux/fs.h:3422 [inline]
 jfs_direct_IO+0xf7/0x1e0 fs/jfs/inode.c:331
 generic_file_direct_write+0x1e8/0x400 mm/filemap.c:4037
 __generic_file_write_iter+0x126/0x230 mm/filemap.c:4206
 generic_file_write_iter+0x10e/0x5e0 mm/filemap.c:4246
 new_sync_write fs/read_write.c:591 [inline]
 vfs_write+0x70f/0xd10 fs/read_write.c:684
 ksys_write+0x19d/0x2d0 fs/read_write.c:736
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2346650b59
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffd3c588a8 EFLAGS: 00000206 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0073746e6576652e RCX: 00007f2346650b59
RDX: 00000000fffffdaf RSI: 0000200000000000 RDI: 0000000000000005
RBP: 652e79726f6d656d R08: 00005555682c24c0 R09: 00005555682c24c0
R10: 00005555682c24c0 R11: 0000000000000206 R12: 00007fffd3c588d0
R13: 00007fffd3c58af8 R14: 431bde82d7b634db R15: 00007f234669903b
 </TASK>
---[ end trace ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
