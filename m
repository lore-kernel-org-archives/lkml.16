Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F27C20DD64
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070292; cv=none; b=DaH5R4bvx9eYWzVu864rsoHw/qp6vHk+klFL+R5Ny5HFXK8AAjHPfznGJCUkhMFJtWbn3bCfLz1PW0dnmDxBR9PldKk+e/9QiTtrXKcIA0lcG7tmuDRCYsx+Ab8TxJC9qUq73+QECqcehohodUZ1Hp8/3DlhcHUh/rRVUYL15Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070292; c=relaxed/simple;
	bh=mh8mxc7xkwF3GzKx9RFVG5s75OVH4KYLbVgPP2yKX+0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=i0e7zUNFEVYhIjkC7X5L/kzQa8AFX9nCZ3jyILvm4DyjYvyyrvFFq9qSGk5OFCdkC7bmtsDFk+US6Jfe3QTGfvhKE5IEqCAMDREIQN9I0qo0W42ykl1pUA49ga0N3kLsD2F3XcFAqnGGUIVxPcR3FbpUtJQQgfYoqQ95MOpXtbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d443811ed2so13348755ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070289; x=1743675089;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4vd34mksmrGkcPb8UoyRb6EpdkySIXEbcVIfIkuwRk=;
        b=E8nddi9oZ8fV12p3wagL+4AzPSSITFK+VOY/r/0clsKDDCCXFxUvLKg13ckgf/wYyh
         tM3oLESogOWGEEjetanokuUO7H5qEpybTLGXyBkZDpPcKtQSANcwC+m/uJVsxR9dx489
         EXd/6fYc8t7RcsDWMm0+UgfqCzI7wUrMXbcIeIE160IPZDRB3lFOXeViTlQWayJcCrG5
         vZky2JODSZS+zNRS7m5V2lAhHGeVZIe4PbvKnP9bDICJR3UT1oTxuVONs6LRtFS13NpZ
         1GxuHftdxXYf6pwoxB+OV8CkwlnjuzAmTFIv6zrU0uJfPqrfAziWwDtLKjZbZSZM7zJP
         P1HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcGiAso5ldojLvzwW2YMlBNkBJy3KvvxdQSFoh7jusnTlsPtb06vzDaUM/J3OteNebhIsYvtrFHJ6wc8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpsZsrEm3DsRjZVp2XDIqH1cC5+lxh/MIlAA6xudu/FV+WGPyM
	8+gOGGFyVaTyUPiGxeaBJstZJL9vObt3fKw+/gqMnUQM9Ampg7flsVhz2yCn+sQc3Iqh2TciX7u
	BJ8vhlyjMgIS9DSjBCSkjUBBZP6p9XLBn8647e9GqZxqVXvRrG8QNrfc=
X-Google-Smtp-Source: AGHT+IG6PgXq81OiO0E6EEtzwKRmlWkzkJfSUJUPrAagLFRwK/E6ZWJoBi7QjGbrbdEct5hGUJvhYVgRqcdh7o2zn71qESAPNh+v
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:164c:b0:3d4:6dcf:d8f5 with SMTP id
 e9e14a558f8ab-3d5ccdc1f92mr33182915ab.1.1743070289383; Thu, 27 Mar 2025
 03:11:29 -0700 (PDT)
Date: Thu, 27 Mar 2025 03:11:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e52451.050a0220.2f068f.0027.GAE@google.com>
Subject: [syzbot] [kernel?] KMSAN: uninit-value in timerqueue_del
From: syzbot <syzbot+d5e61dcfda08821a226d@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1e1ba8d23dae Merge tag 'timers-clocksource-2025-03-26' of ..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1357abb0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=887673359f1a92bf
dashboard link: https://syzkaller.appspot.com/bug?extid=d5e61dcfda08821a226d
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/721f329c0fc6/disk-1e1ba8d2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4bc26a0ed6a7/vmlinux-1e1ba8d2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/09d5f4dc3101/bzImage-1e1ba8d2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d5e61dcfda08821a226d@syzkaller.appspotmail.com

ffff88813fc04fc0: ffff88813115aac8 (0xffff88813115aac8)
ffff88813fc04fc8: 0000000000000000 ...
ffff88813fc04fe8: ffff88813115aab8 (0xffff88813115aab8)
ffff88813fc04ff0: ffffffff904ecdee (instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline])
ffff88813fc04ff0: ffffffff904ecdee (sysvec_apic_timer_interrupt+0x7e/0x90 arch/x86/kernel/apic/apic.c:1049)
ffff88813fc04ff8: ffff88813115aaa8 (0xffff88813115aaa8)
BUG: KMSAN: uninit-value in rb_next+0x200/0x210 lib/rbtree.c:505
 rb_next+0x200/0x210 lib/rbtree.c:505
 rb_erase_cached include/linux/rbtree.h:124 [inline]
 timerqueue_del+0xee/0x1a0 lib/timerqueue.c:57
 __remove_hrtimer kernel/time/hrtimer.c:1123 [inline]
 __run_hrtimer kernel/time/hrtimer.c:1771 [inline]
 __hrtimer_run_queues+0x3b7/0xe40 kernel/time/hrtimer.c:1855
 hrtimer_interrupt+0x41b/0xb10 kernel/time/hrtimer.c:1917
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1038 [inline]
 __sysvec_apic_timer_interrupt+0xa7/0x420 arch/x86/kernel/apic/apic.c:1055
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0x7e/0x90 arch/x86/kernel/apic/apic.c:1049

Local variable set_tid.i created at:
 __do_sys_clone3 kernel/fork.c:3098 [inline]
 __se_sys_clone3+0x60/0x590 kernel/fork.c:3093
 __ia32_sys_clone3+0x6b/0xa0 kernel/fork.c:3093

CPU: 0 UID: 0 PID: 13379 Comm: syz.1.2969 Not tainted 6.14.0-syzkaller-03576-g1e1ba8d23dae #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
=====================================================


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
