Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824D72DC799
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746122550; cv=none; b=sNxrXhCQ2E+2vw3a44PDy3ZcQl3tOpnVLJl9rPwmzfw9keBVUFv9E/XxbvfW8ap+gDDRBLz24mM5115XArjYQGv2uMF3frXvLNnrdVqsuozkwGogxAOb98TJYWKOgahLW7rkOsJX36QMuTW+ZaFl2bVFZdsyDDyfFVg281iWPJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746122550; c=relaxed/simple;
	bh=vO3ZY3zaojpbXyFFriv+iIx8/YlkFruAstxxUiukRis=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=uJJwJ0VrSKFdWHD+mG9YLSK+VyFgn+XsV50of1oEzT39Tg+UC7ByjeytLSTZDtYnHhiJByv/N7OauDbPkntMAY2xMzNH2Z4uz/yoqejGi0ZBkl1y0tImM9t1SZLvc/wnTMiUs/bYt98yBbwiEizgLzn2fRkofUuJopuPWiSIBRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d8dd0c9143so19507195ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 11:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746122547; x=1746727347;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VgpqyE4FJN1BhirzIfJwvdlpr+35hhPYLMw/Cn5F5zs=;
        b=Knr+rDVx33EK4M//LQq7ayRKI+Zdg5v/wJseARgD0IV4xrMZv8sq33+zajr55/faBt
         JvRayaPCJAqi+4eTgIeoOUsksEwpCd6805/ZyH0Pk2hZlCORfOW5SG2wrHiiDFD0GR+L
         Fru/V7aiJrAbVKh8Jcrj4EEqJICDq9mp5iSI9tkDEe8vI82LYxBe41KinAZOi7s4CMqD
         Ha6GUngjEloCW0vjGtlSMcMzd0D+VyI4f5tktDnugSdBNLpFbdhw9rBB403rGAcVNkbG
         A84oqFP60VK6c4JhEaW6geHFLbmmNLDOxIo4gIwbQ3NkSliyCg5YNEDGnPweYYa+S2E7
         zA7g==
X-Forwarded-Encrypted: i=1; AJvYcCUDuFKKgr3ZTd75dAsch6JnmrxR15NK3Z6fpFlU7atCVLjVMNY5kUhlJXor7mxsycLHp/A2Rld5ZLpfRVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo+LZo7/UI0+sy/zbCxcLOuyDRybYm055V6jiLTuTcLX8IyNpn
	zPLWRIxe8yYdW2H6erwjJJY/VX05RCLkgVPSDHAiwGMeTzfietL30FNVFt0YCA3287s2nsMZOrN
	7nUJWpTAsQtblD9bBlGVEszlJuez5IdaVlgEzT+XRxUh3gLycVrkzPE4=
X-Google-Smtp-Source: AGHT+IF8WztUPZpDgnBMpHkdA2a/MC7o3YN9yI2obZxt5nqxz/9Ps7fkjGTq1LJDjcgiB3kYfoZ+bTVu11B71jXtWGhzCdQmp2NX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16ca:b0:3d9:6cd9:5079 with SMTP id
 e9e14a558f8ab-3d970266decmr41710745ab.14.1746122547632; Thu, 01 May 2025
 11:02:27 -0700 (PDT)
Date: Thu, 01 May 2025 11:02:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6813b733.050a0220.53db9.0000.GAE@google.com>
Subject: [syzbot] [mm?] INFO: rcu detected stall in nsim_fib_event_work
From: syzbot <syzbot+5cf89626ecd9d0007691@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, pasha.tatashin@soleen.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5bc1018675ec Merge tag 'pci-v6.15-fixes-3' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15f130d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9f5bd2a76d9d0b4e
dashboard link: https://syzkaller.appspot.com/bug?extid=5cf89626ecd9d0007691
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=126c4374580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f130d4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/33f182866e0b/disk-5bc10186.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/103760a3e862/vmlinux-5bc10186.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9954dc25ed1d/bzImage-5bc10186.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5cf89626ecd9d0007691@syzkaller.appspotmail.com

bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:12:9a:a3:e5:33:d9, vlan:0)
rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1): P9/1:b..l
rcu: 	(detected by 0, t=10503 jiffies, g=6869, q=616 ncpus=2)
task:kworker/0:0     state:R  running task     stack:25496 pid:9     tgid:9     ppid:2      task_flags:0x4208060 flags:0x00004000
Workqueue: events nsim_fib_event_work
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 preempt_schedule_irq+0x51/0x90 kernel/sched/core.c:7090
 irqentry_exit+0x36/0x90 kernel/entry/common.c:354
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:__kasan_check_read+0x0/0x20 mm/kasan/shadow.c:30
Code: c3 cc cc cc cc 48 83 c4 60 48 c7 c7 90 22 a3 8d 5b 5d 41 5c e9 a1 c9 79 ff 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 <f3> 0f 1e fa 48 8b 0c 24 89 f6 31 d2 e9 7f f0 ff ff 66 66 2e 0f 1f
RSP: 0018:ffffc900000e78c8 EFLAGS: 00000293
RAX: 0000000000000000 RBX: ffff88801ed4d3d8 RCX: ffffffff822c44d1
RDX: ffff88801c6f4880 RSI: 0000000000000004 RDI: ffff88801ed4d3dc
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88801ed4d390
R13: ffff88801ed4d3dc R14: 0000000000000000 R15: dffffc0000000000
 instrument_atomic_read include/linux/instrumented.h:68 [inline]
 atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
 __page_table_check_zero+0x260/0x5b0 mm/page_table_check.c:143
 page_table_check_free include/linux/page_table_check.h:41 [inline]
 free_pages_prepare mm/page_alloc.c:1263 [inline]
 __free_frozen_pages+0x704/0xff0 mm/page_alloc.c:2725
 discard_slab mm/slub.c:2730 [inline]
 __put_partials+0x16d/0x1c0 mm/slub.c:3199
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4e/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_kmalloc+0x8a/0xb0 mm/kasan/common.c:385
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 nsim_fib6_rt_nh_add+0x4a/0x290 drivers/net/netdevsim/fib.c:500
 nsim_fib6_rt_create drivers/net/netdevsim/fib.c:562 [inline]
 nsim_fib6_rt_insert drivers/net/netdevsim/fib.c:752 [inline]
 nsim_fib6_event drivers/net/netdevsim/fib.c:856 [inline]
 nsim_fib_event drivers/net/netdevsim/fib.c:889 [inline]
 nsim_fib_event_work+0x196a/0x2e80 drivers/net/netdevsim/fib.c:1493
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
net_ratelimit: 14203 callbacks suppressed
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:12:9a:a3:e5:33:d9, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:12:9a:a3:e5:33:d9, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:12:9a:a3:e5:33:d9, vlan:0)
net_ratelimit: 16086 callbacks suppressed
bridge0: received packet on veth0_to_bridge with own address as source address (addr:12:9a:a3:e5:33:d9, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:12:9a:a3:e5:33:d9, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source address (addr:aa:aa:aa:aa:aa:0c, vlan:0)


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
