Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3782949F1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859869; cv=none; b=PEIkrHin1DeHD8eEwkfOZSbkM/p7p/rowd2dcfqsRI7orc2xmkNNo2hBlcD+cCI4wtTE6kdM3WVtP9+eQ1YQCJfpfgSXYhUjaMwFFmliCRdVSNfmK6/N4Cetwn7iJJjkOqIP1gIX9ba/8KVwGmpQ1NN6HIzp/md+VzFVDjYt+eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859869; c=relaxed/simple;
	bh=BWHyuvUoZT2bskvNWVJjqQNAlrunlerkR7eMbBPnN7E=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fiJtuwgxLfa+g1cbbNazY22r7Z8TdOcWa366Qq+wuJrdc7rXe5NMcyN/h3obJlP0u5erpq0TzHYyKwcMybQVJ6vEcLAaSam91w0O8/DiUz+2QaMpBLAHWJgMDoGBW5IyQ6IrpSpY9Qm2fd9pegMs59JY2IJprMkptpOtAmR+wRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-72e1e89b532so1565956a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745859867; x=1746464667;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PxzWN3h+2PvuN1coXgBqPFuzfd3YBoa6GHZMWyw1Jr0=;
        b=EsBhJ//klzBBJAwcLj1BeNrSY/KJzCDLth3OKJBH/HJWJGFTFd58lYy7RAOnAqmQsv
         pXur19cpZ79t97aV3ImVTukgvGExdG56gC6913bpt1A5obzJUzlY82FDOtkXojroTYhV
         u9rhAjnddfaWOB66emsuuTkGu8JAwSlgrWUeqawZzkL4qx4wOGVRCbM5OYBuSZnrnsIo
         2JgcDEIJSJo/GltVaQCZs4uhWSuzrF/0Oam+EReuOjOBDGvwxL5vQsAhWd6avQL5z5hm
         2qgH4jm2FMmeGLun2C6OpF0Q3dDFAShrYFGMMCChMXQ5nglFK80D33m87bx8+8TgdmZ1
         NJng==
X-Forwarded-Encrypted: i=1; AJvYcCXCjtA5BYI0IKyPr8HEmBfzzOhaVmdzp0vwKmyL7EaDP0mRxdxBqMO662UTTA6EKYepMZfi++P/DZoJhiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgpYzfa8aIDE0HGULhWdkjfvaWJIww/wp0cRrRvRHhauwmDeL/
	2zPntXRGjr8n5rkU5UjtdC7PuFzQnd3qribQnD9hhLnsGN/f98dHIvqQpvt8vAoqPSYxStITPda
	4Jf9qQQ+Kr2H3hbnj78KQ8VE1zJS2YRJRSx50lqi0s1aPpn0HVQAIC8s=
X-Google-Smtp-Source: AGHT+IFN74c8ZXC61kxCCsgumxuvENWZzE9KSvuTB6tnVdpim5tR7ajf/NPmv6uSWZEg2e5AldllzsBcpdnrdsZgsIdF1MUZqtmb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6830:3883:b0:72a:1dfc:c981 with SMTP id
 46e09a7af769-730897c5cffmr31658a34.25.1745859866817; Mon, 28 Apr 2025
 10:04:26 -0700 (PDT)
Date: Mon, 28 Apr 2025 10:04:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680fb51a.a70a0220.23e4d2.0033.GAE@google.com>
Subject: [syzbot] [bcachefs?] UBSAN: array-index-out-of-bounds in bch2_sb_downgrade_update
From: syzbot <syzbot+14c52d86ddbd89bea13e@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e72e9e693307 Merge tag 'net-6.15-rc4' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11ef21b3980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4f9c44a22d09fd53
dashboard link: https://syzkaller.appspot.com/bug?extid=14c52d86ddbd89bea13e
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11777d9b980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15ef21b3980000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-e72e9e69.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2bee8b8591c3/vmlinux-e72e9e69.xz
kernel image: https://storage.googleapis.com/syzbot-assets/97a6564905c3/bzImage-e72e9e69.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/067449ccbbaf/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+14c52d86ddbd89bea13e@syzkaller.appspotmail.com

bcachefs (loop0): bucket 0:26 gen 0 data type btree sector count overflow: 0 + -256 > U32_MAX
  while marking u64s 11 type btree_ptr_v2 SPOS_MAX len 0 ver 0: seq ac62141f8dc7e261 written 24 min_key POS_MIN durability: 1 ptr: 0:26:0 gen 0
  
------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in fs/bcachefs/sb-downgrade.c:268:4
index 0 is out of range for type '__le16[] __counted_by(nr_errors)' (aka 'unsigned short[]')
CPU: 0 UID: 0 PID: 1037 Comm: kworker/u4:6 Not tainted 6.15.0-rc3-syzkaller-00076-ge72e9e693307 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: btree_update btree_interior_update_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x40 lib/ubsan.c:231
 __ubsan_handle_out_of_bounds+0xe9/0xf0 lib/ubsan.c:453
 downgrade_table_extra fs/bcachefs/sb-downgrade.c:268 [inline]
 bch2_sb_downgrade_update+0xb10/0xcc0 fs/bcachefs/sb-downgrade.c:388
 bch2_write_super+0xbf4/0x2cc0 fs/bcachefs/super-io.c:1071
 btree_update_new_nodes_mark_sb fs/bcachefs/btree_update_interior.c:608 [inline]
 btree_update_nodes_written fs/bcachefs/btree_update_interior.c:678 [inline]
 btree_interior_update_work+0x441/0x25e0 fs/bcachefs/btree_update_interior.c:843
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
---[ end trace ]---
Kernel panic - not syncing: UBSAN: panic_on_warn set ...
CPU: 0 UID: 0 PID: 1037 Comm: kworker/u4:6 Not tainted 6.15.0-rc3-syzkaller-00076-ge72e9e693307 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: btree_update btree_interior_update_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x99/0x250 lib/dump_stack.c:120
 panic+0x2db/0x790 kernel/panic.c:354
 check_panic_on_warn+0x89/0xb0 kernel/panic.c:243
 __ubsan_handle_out_of_bounds+0xe9/0xf0 lib/ubsan.c:453
 downgrade_table_extra fs/bcachefs/sb-downgrade.c:268 [inline]
 bch2_sb_downgrade_update+0xb10/0xcc0 fs/bcachefs/sb-downgrade.c:388
 bch2_write_super+0xbf4/0x2cc0 fs/bcachefs/super-io.c:1071
 btree_update_new_nodes_mark_sb fs/bcachefs/btree_update_interior.c:608 [inline]
 btree_update_nodes_written fs/bcachefs/btree_update_interior.c:678 [inline]
 btree_interior_update_work+0x441/0x25e0 fs/bcachefs/btree_update_interior.c:843
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Kernel Offset: disabled
Rebooting in 86400 seconds..


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
