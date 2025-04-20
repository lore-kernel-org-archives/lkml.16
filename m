Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A788F1172A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745125715; cv=none; b=GI4APXMSskpuQrIgp4uqvP9jIPSDFwCTUCouLPbGCY1GF/UuQqEy2BP+QqMT0Qmdg/MaD3xAnjiisA1uPJKITKVu7SQ1X/Mr3KN1VQZTfPGZWBhHIiF1p5MtU+qJTr4Ss4FDZ9YEq9DazfOpN6wPs/zCVZm9fFBiqXOYnH79klY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745125715; c=relaxed/simple;
	bh=TvXBhYRSSyEB6EKDntIvEWblh+5xsRUnlpUBDpwjdbU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qKxAsKH++0dvLrqDd3rExR5dLI99leOogaDZl4fRS8G1JdK+noPb9bn6eHYu2Q9k2xAztuslOnAScgd1lqjz4P5Bxolhbj0DKpNn/vGG3KC7YNemWRGW36zIO6ibrFFfkMH0bxXVDTsZIL5E9T6WyhCwDxyjODQThzNeg1NCG+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d458e61faaso29433195ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 22:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745125713; x=1745730513;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQX+jv59tgpRqpD0EYwsyWJnJfK5pmHBBVBwOs6IvkU=;
        b=RlSeHXrE74y8lvnuvPsrCVGffdY93540oUezmXJmT8p7sbCt8cOvAbEBOZXCfU7BWq
         nBLMoX1In+faNzteOYDOrTz2ifUMk5FFuEI1BQw7fAYY/q+pt4dRhYjd6xjmM9XAe0gv
         Bnh5u50E/JZ1g5MZ13KD6NR0bVYmRu/ppatr1Fa+M2/mmOIhtjjQBjJhbUHBb/8jXSS2
         yqdq3+chmUDbNL6KCtX7vrrTtvihhJTo9PLPbfMy1SsBtpdeim50SU7DAP+pcjQufY3r
         0pzSSYJtm43z+xyqqkORmbd9yggQWmDDsJya1loy3LvzQYtlQiyZmvdOtyXZh+ZPbv+S
         XMqw==
X-Gm-Message-State: AOJu0YwpADWgKTYQmshYmT/MO/ZmKG9aOTDKT6UhmeLmira97h+EGx0D
	8Xk1RGVVYSdsuIQxGUA1qrv8icokIhYgqrXgrly8phQjxfhtgVXiCxc/8aIAiDOMkf4eEeDRItC
	ZAgBma2qTtsdbtpy8yW+EwEOQcTfpcF0bI7n1h6dzXjoqajPBX8OkGELAWA==
X-Google-Smtp-Source: AGHT+IHxm769bLjKAg1TK2mUl+JgBZ1NkTxqPIerPazrSZwpwXmSQbJjIexgbuGduwD2UiVruAPdLSpCn6wgQt90zeaaFo3QKA29
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18ce:b0:3d3:d1a8:8e82 with SMTP id
 e9e14a558f8ab-3d8bf2aac57mr60102315ab.9.1745125712812; Sat, 19 Apr 2025
 22:08:32 -0700 (PDT)
Date: Sat, 19 Apr 2025 22:08:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68048150.050a0220.243d89.002d.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING in flush_cpu_slab (3)
From: syzbot <syzbot+afe67af73c98d3d293a6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c72692105976 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10e39a3f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3074fa928809af2b
dashboard link: https://syzkaller.appspot.com/bug?extid=afe67af73c98d3d293a6
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/02d65c9d9776/disk-c7269210.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/caf24085c451/vmlinux-c7269210.xz
kernel image: https://storage.googleapis.com/syzbot-assets/92025d8a23a1/Image-c7269210.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+afe67af73c98d3d293a6@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(l->owner)
WARNING: CPU: 1 PID: 26 at ./include/linux/local_lock_internal.h:35 local_lock_acquire+0x90/0x98 include/linux/local_lock_internal.h:35
Modules linked in:
CPU: 1 UID: 0 PID: 26 Comm: kworker/1:1 Not tainted 6.15.0-rc2-syzkaller-gc72692105976 #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: slub_flushwq flush_cpu_slab
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : local_lock_acquire+0x90/0x98 include/linux/local_lock_internal.h:35
lr : local_lock_acquire+0x90/0x98 include/linux/local_lock_internal.h:35
sp : ffff8000983379f0
x29: ffff8000983379f0 x28: ffff80008ff3e648 x27: 1fffe000183737a2
x26: ffff0000c1bc9010 x25: ffff0000c1bc9018 x24: fffffdffbf6cf7f0
x23: 0000000000000000 x22: ffff80008ff41df0 x21: 00007dfe9be4a810
x20: 0000000000000001 x19: fffffdffbf6cf810 x18: 0000000000000008
x17: 0000000000000000 x16: ffff80008333704c x15: 0000000000000001
x14: 1fffe000366e2322 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000002 x10: 0000000000ff0100 x9 : 4f8cb6cfde49a800
x8 : 4f8cb6cfde49a800 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff800098337178 x4 : ffff800090035460 x3 : ffff800080750da0
x2 : 0000000000000001 x1 : 0000000100000000 x0 : 0000000000000000
Call trace:
 local_lock_acquire+0x90/0x98 include/linux/local_lock_internal.h:35 (P)
 flush_slab mm/slub.c:3283 [inline]
 flush_cpu_slab+0x80/0x270 mm/slub.c:3341
 process_one_work+0x810/0x1638 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x97c/0xf08 kernel/workqueue.c:3400
 kthread+0x674/0x7dc kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862
irq event stamp: 150562
hardirqs last  enabled at (150561): [<ffff80008b9be67c>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
hardirqs last  enabled at (150561): [<ffff80008b9be67c>] _raw_spin_unlock_irq+0x30/0x80 kernel/locking/spinlock.c:202
hardirqs last disabled at (150562): [<ffff800080b8a5a0>] flush_slab mm/slub.c:3283 [inline]
hardirqs last disabled at (150562): [<ffff800080b8a5a0>] flush_cpu_slab+0x5c/0x270 mm/slub.c:3341
softirqs last  enabled at (150272): [<ffff80008031aaf8>] softirq_handle_end kernel/softirq.c:425 [inline]
softirqs last  enabled at (150272): [<ffff80008031aaf8>] handle_softirqs+0xb44/0xd34 kernel/softirq.c:607
softirqs last disabled at (150243): [<ffff800080020dbc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
---[ end trace 0000000000000000 ]---
IPVS: Schedule: port zero only supported in persistent services, check your ipvs configuration
IPVS: Schedule: port zero only supported in persistent services, check your ipvs configuration
IPVS: Schedule: port zero only supported in persistent services, check your ipvs configuration
IPVS: Schedule: port zero only supported in persistent services, check your ipvs configuration
IPVS: Schedule: port zero only supported in persistent services, check your ipvs configuration
IPVS: Schedule: port zero only supported in persistent services, check your ipvs configuration


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
