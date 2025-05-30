Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345118F40
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 00:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748565576; cv=none; b=IcoowT9y+1iontszupd0PTah0Y/m80pKGIj4lnJ/W37PNJHvSY7VB1PxhDjeW+B6kl6Ej/LGNR4MF6fEECY67tYIJ+wZCb2ro+hgztXtzgec5R1AJ+wR09nszcjdf8nqOndS/OlAjy+KasQF4vF2xR38OdTLJZ0cTInd780+4S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748565576; c=relaxed/simple;
	bh=E1ECU+2dzr5wcY3z0ihGGbIlbdEBpj7pRa5o2dHmg7M=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JWEZb0jZ+ErMztszX26ZGC60fK+g+he3pFa7Js+HFC0Mco5PwI2H6+8DXmIMMdKIk4O2+5zyGK+hCUdzF2NvkDiOQfCiQmn/qYm/6Y/2Hk6JzuWDYlxn9r9dZJ/eOUYQa7QyfE1OPKcdwncYgKKJ82Wc0khOHCAak099bE55F2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3dc9d335fffso27108455ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748565573; x=1749170373;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M30EKT760cGKOOI+8I493oqA67iAPVVj/IQG+o+sRcU=;
        b=Mmu0XbpNNgQgrLrMK3a7NDPmYP/RuVUs9b0Q67NxIhU6uIcp3L/MS/fbdL3er6N5nf
         3MfAeY/WIFWYJ1sGyhQrkQXE/goUW51pWaqvvWdj8pXO348g5IbTa43cbdfH5tztLa0f
         FQmTzPlIPgTeFNz1VQWh9b1oIHl5JAnJxhiS4l1+3nbd+U8k36Mz5Jgwq5A/F7tRzwXN
         oWC2nM4shbHWy5T0016V6rktxr6T5dLEQyn3s2mTQLO8XrOSiSYVrnahu1U7MAVaBw9R
         8bNACN8n1srtpUv29/MycxnteSBCpf4zb62gnlOho7CT+cbisd8QDiIFQrX8MFgk04o0
         pd7w==
X-Forwarded-Encrypted: i=1; AJvYcCUNzk2gTF5wZCGQstyT3xGI3RnEE3EdNxj0PA7RRocjrMlAj8512i/xfhcFBKW3CeZGQo/u3F+L8GlYuK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC0mspGjT9kl0/8KRiwHtHZhrxFkaX11kXSHEu4SJxxSlh48kV
	8ZAmAuy1SY5xAUiRIBOQAXINzOsY2DStP/1N5UPZYB2Z60/D8jky3im9VH0Q2zSjHPFTthtbxyG
	8bz061nyVq/nud98/Il1O4jzZZZl+0/MCuTYnTFiKo5ScJO5CnTEcy20UW+A=
X-Google-Smtp-Source: AGHT+IF0a/RnfqUXNEj13Nlxlv9I7+jfr8Kr9IVtshIBjwR2M5IZHBtNDt/H23mhT9iERwh792PYQM8KCM9zplvFT+u/TGLlT2ce
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3c04:b0:3dc:8b29:30a3 with SMTP id
 e9e14a558f8ab-3dd99c89caemr21727805ab.20.1748565573326; Thu, 29 May 2025
 17:39:33 -0700 (PDT)
Date: Thu, 29 May 2025 17:39:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6838fe45.a00a0220.d8eae.0001.GAE@google.com>
Subject: [syzbot] [bcachefs?] WARNING: locking bug in srcu_gp_start_if_needed (2)
From: syzbot <syzbot+d7546350ee1d5ab2f7a8@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=13d075f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=d7546350ee1d5ab2f7a8
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/disk-d7fa1af5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmlinux-d7fa1af5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e/Image-d7fa1af5.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d7546350ee1d5ab2f7a8@syzkaller.appspotmail.com

------------[ cut here ]------------
Looking for class "ACCESS_PRIVATE(sdp, lock)" with key init_srcu_struct_data.__key, but found a different class "&ACCESS_PRIVATE(sdp, lock)" with the same key
WARNING: CPU: 0 PID: 6492 at kernel/locking/lockdep.c:944 look_up_lock_class+0xf0/0x168 kernel/locking/lockdep.c:941
Modules linked in:
CPU: 0 UID: 0 PID: 6492 Comm: syz-executor Not tainted 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : look_up_lock_class+0xf0/0x168 kernel/locking/lockdep.c:941
lr : look_up_lock_class+0xf0/0x168 kernel/locking/lockdep.c:941
sp : ffff8000a2697520
x29: ffff8000a2697520 x28: 0000000000000000 x27: fffffdffbf6fe598
x26: ffff8000805a0df0 x25: 0000000000000001 x24: 0000000000000000
x23: ffff800096f71000 x22: 0000000000000000 x21: ffff800096fb4780
x20: fffffdffbf6fe598 x19: ffff800092b75178 x18: 1fffe0003386aa76
x17: 0000000000000000 x16: ffff80008adbe9e4 x15: 0000000000000001
x14: 1fffe0003386aae2 x13: 0000000000000000 x12: 0000000000000000
x11: ffff60003386aae3 x10: 0000000000ff0100 x9 : 75d53356a95e1300
x8 : 75d53356a95e1300 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff8000a2696e78 x4 : ffff80008f415ba0 x3 : ffff8000807b4b68
x2 : 0000000000000001 x1 : 0000000100000001 x0 : 0000000000000000
Call trace:
 look_up_lock_class+0xf0/0x168 kernel/locking/lockdep.c:941 (P)
 register_lock_class+0x48/0x348 kernel/locking/lockdep.c:1295
 __lock_acquire+0xa8/0x3058 kernel/locking/lockdep.c:5110
 lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5866
 __raw_spin_trylock include/linux/spinlock_api_smp.h:90 [inline]
 _raw_spin_trylock+0x58/0xb0 kernel/locking/spinlock.c:138
 spin_lock_irqsave_sdp_contention kernel/rcu/srcutree.c:375 [inline]
 srcu_gp_start_if_needed+0x2c0/0x10d0 kernel/rcu/srcutree.c:1275
 __call_srcu kernel/rcu/srcutree.c:1389 [inline]
 __synchronize_srcu+0x2b8/0x348 kernel/rcu/srcutree.c:1441
 synchronize_srcu_expedited+0x24/0x34 kernel/rcu/srcutree.c:1467
 bch2_fs_btree_iter_exit+0x378/0x420 fs/bcachefs/btree_iter.c:3616
 __bch2_fs_free fs/bcachefs/super.c:564 [inline]
 bch2_fs_release+0x24c/0x72c fs/bcachefs/super.c:618
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x2b0/0x438 lib/kobject.c:737
 bch2_fs_free+0x308/0x378 fs/bcachefs/super.c:681
 bch2_kill_sb+0x48/0x58 fs/bcachefs/fs.c:2623
 deactivate_locked_super+0xc4/0x12c fs/super.c:473
 deactivate_super+0xe0/0x100 fs/super.c:506
 cleanup_mnt+0x31c/0x3ac fs/namespace.c:1431
 __cleanup_mnt+0x20/0x30 fs/namespace.c:1438
 task_work_run+0x1dc/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 do_notify_resume+0x16c/0x1ec arch/arm64/kernel/entry-common.c:151
 exit_to_user_mode_prepare arch/arm64/kernel/entry-common.c:169 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:178 [inline]
 el0_svc+0xb4/0x17c arch/arm64/kernel/entry-common.c:768
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
irq event stamp: 942766
hardirqs last  enabled at (942765): [<ffff80008addfa48>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
hardirqs last  enabled at (942765): [<ffff80008addfa48>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:194
hardirqs last disabled at (942766): [<ffff8000805a0de0>] spin_lock_irqsave_sdp_contention kernel/rcu/srcutree.c:375 [inline]
hardirqs last disabled at (942766): [<ffff8000805a0de0>] srcu_gp_start_if_needed+0x2b0/0x10d0 kernel/rcu/srcutree.c:1275
softirqs last  enabled at (940014): [<ffff8000803cf71c>] softirq_handle_end kernel/softirq.c:425 [inline]
softirqs last  enabled at (940014): [<ffff8000803cf71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
softirqs last disabled at (939939): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
---[ end trace 0000000000000000 ]---


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
