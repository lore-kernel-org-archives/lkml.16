Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5F5156C6F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252298; cv=none; b=EU+F0kB1ei+T0JSgcCP6FtKutXeYpoK2AKH5H62LlpfT2/gBchjq+L0G9n9v2GllYhRx5+J2nl8wrspO1qXJTN/FT2Ga78IAlAYpZBKNGvLRToYI1butSP7sBfQiatNgAY0WTId9ZWJys22D66Msxs48DPLGhPkB3xcBw+TwAcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252298; c=relaxed/simple;
	bh=650WkzGzXzfRNpSJ0M/yIuySfZ42hmp3ZkQvxVRCZLc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=CAPWDrGc01qTXqI7bujXnBbm0RieFVXzaRxbi6fRSRMd6K52IlhY9jJ/YDduimMJ0M1JOJKAQWVmV9abrr7igEJYWl9xrxal53/M7BDMsnJROLePuwQxz0H52xmCIAr7vIrUFG2vmLxSwKxX4EfXM6ueKrdmNyGH55DQOOEY5cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d6c613bd79so1597825ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747252296; x=1747857096;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MtvhusWw88lZCsB7Q9g6i+PXiLbp/uslfFEIk4Ma3Jw=;
        b=dad8ErfauyiuVRJdIqPGQsXmlXL8mUUGIVQQAoKxGafQfIl6jQFumi6sxqemFRsqvT
         7phc+B0cGJkF39N6Cu3ceCvatGa6kinPXHMPWBASQYCIKH/M1avnm38CMPDYM2VRPsnl
         LDeh/E5wFjsZKGxsA45P0CzkOgirhQSouKK30QjCNpCOtQcpW67ch6RMRZ0OvW+fsWJa
         H5IQ4zVevkFBKDW4RCGCipY/WvEvWl6/nz7KxM+QAsXhADz+5W6S3LZUw5NYqOAIXT/5
         9Y3G6hjPSVN3kQgO00uIuE2EuFbj5CVhrlu6CTUNu36j/jG1Vs3z9/veXlAq3hjbqp1J
         5YzA==
X-Forwarded-Encrypted: i=1; AJvYcCUr3FSe/57akor5BNtbPgSCvEIXv8t3fvammbJAWJkPeHODOSW0Uxisqh4KG/LxCohI8tCzVyZY2ZpjcGY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn72H6ZW7xmKC/WRcUvBScG1UNIeFnTStK4Y4puBVw7j829CqJ
	cBgDabfQtIphYACBGq4rfAwa3qtdAlETluRmBK6BL1cZAI3o5P6m7Prb+WyiGarPDewyc2ghscC
	Lvl/7LbwYICAeAhiPud4pg5t38HzO5IdmA+DEeY3A42BDMjRoJKcDF5Q=
X-Google-Smtp-Source: AGHT+IEeHfaHv5AKwjhKg3IHx97n/uvmwk4fbdnKk92J4Rftvu+8KyNkNjytAT+g0wi8TNl0bBLw0k+cxgwqT2P9p0HSP3KwDEAA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2146:b0:3d8:20fb:f060 with SMTP id
 e9e14a558f8ab-3db6f793796mr54666585ab.4.1747252295728; Wed, 14 May 2025
 12:51:35 -0700 (PDT)
Date: Wed, 14 May 2025 12:51:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6824f447.a70a0220.3e9d8.001d.GAE@google.com>
Subject: [syzbot] [net?] possible deadlock in ptp_clock_unregister
From: syzbot <syzbot+eb6f218811a9d721fd53@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, richardcochran@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    405e6c37c89e Merge tag 'probes-fixes-v6.15-rc6' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=132f4af4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7819b10245b63b3d
dashboard link: https://syzkaller.appspot.com/bug?extid=eb6f218811a9d721fd53
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/62d60a45311f/disk-405e6c37.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/63f63df5f19f/vmlinux-405e6c37.xz
kernel image: https://storage.googleapis.com/syzbot-assets/89438849afbb/bzImage-405e6c37.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+eb6f218811a9d721fd53@syzkaller.appspotmail.com

ptp ptp0: delete virtual clock ptp1
============================================
WARNING: possible recursive locking detected
6.15.0-rc6-syzkaller-00051-g405e6c37c89e #0 Not tainted
--------------------------------------------
syz.0.550/8873 is trying to acquire lock:
ffff88802a6c4868 (&ptp->n_vclocks_mux){+.+.}-{4:4}, at: ptp_vclock_in_use drivers/ptp/ptp_private.h:103 [inline]
ffff88802a6c4868 (&ptp->n_vclocks_mux){+.+.}-{4:4}, at: ptp_clock_unregister+0x21/0x250 drivers/ptp/ptp_clock.c:415

but task is already holding lock:
ffff88814c752868 (&ptp->n_vclocks_mux){+.+.}-{4:4}, at: n_vclocks_store+0xf1/0x6d0 drivers/ptp/ptp_sysfs.c:215

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&ptp->n_vclocks_mux);
  lock(&ptp->n_vclocks_mux);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

5 locks held by syz.0.550/8873:
 #0: ffff8880290f0b78 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x2a2/0x370 fs/file.c:1213
 #1: ffff888035f5e420 (sb_writers#7){.+.+}-{0:0}, at: ksys_write+0x12a/0x240 fs/read_write.c:736
 #2: ffff888059fa1488 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x28f/0x510 fs/kernfs/file.c:325
 #3: ffff88814c93c878 (kn->active#100){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x2b2/0x510 fs/kernfs/file.c:326
 #4: ffff88814c752868 (&ptp->n_vclocks_mux){+.+.}-{4:4}, at: n_vclocks_store+0xf1/0x6d0 drivers/ptp/ptp_sysfs.c:215

stack backtrace:
CPU: 1 UID: 0 PID: 8873 Comm: syz.0.550 Not tainted 6.15.0-rc6-syzkaller-00051-g405e6c37c89e #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_deadlock_bug+0x1e9/0x240 kernel/locking/lockdep.c:3042
 check_deadlock kernel/locking/lockdep.c:3094 [inline]
 validate_chain kernel/locking/lockdep.c:3896 [inline]
 __lock_acquire+0xff7/0x1ba0 kernel/locking/lockdep.c:5235
 lock_acquire kernel/locking/lockdep.c:5866 [inline]
 lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5823
 __mutex_lock_common kernel/locking/mutex.c:601 [inline]
 __mutex_lock+0x199/0xb90 kernel/locking/mutex.c:746
 ptp_vclock_in_use drivers/ptp/ptp_private.h:103 [inline]
 ptp_clock_unregister+0x21/0x250 drivers/ptp/ptp_clock.c:415
 ptp_vclock_unregister+0x11a/0x160 drivers/ptp/ptp_vclock.c:228
 unregister_vclock+0x108/0x1a0 drivers/ptp/ptp_sysfs.c:177
 device_for_each_child_reverse+0x136/0x1a0 drivers/base/core.c:4051
 n_vclocks_store+0x4b6/0x6d0 drivers/ptp/ptp_sysfs.c:241
 dev_attr_store+0x58/0x80 drivers/base/core.c:2440
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x351/0x510 fs/kernfs/file.c:334
 new_sync_write fs/read_write.c:591 [inline]
 vfs_write+0x5bd/0x1180 fs/read_write.c:684
 ksys_write+0x12a/0x240 fs/read_write.c:736
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f234fb8e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2350ade038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f234fdb5fa0 RCX: 00007f234fb8e969
RDX: 0000000000000004 RSI: 0000200000000100 RDI: 0000000000000005
RBP: 00007f234fc10ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f234fdb5fa0 R15: 00007ffea4834d58
 </TASK>
ptp ptp0: only physical clock in use now


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
