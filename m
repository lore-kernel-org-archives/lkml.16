Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C937478F3E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750901321; cv=none; b=gPRc+rFJr/MeVVXxXf0O3tLQT6lTn+CLMj5E+JS/mqE9qtCe6xa62IOq8XJ52LE60x+q9JNdLt8JITq/ZMMBXhU7mToSUw+gcHFrjuEu+jCCwTnIP/A7PlcnIQSzudKs80w6gFQYdvQ3/mvx8AZ6etyuE4C4fLorjS0oBXXy5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750901321; c=relaxed/simple;
	bh=sHjv7IWkUY57cLWo1PjOtwxG5WKFc8B1iVTdXPQEm5M=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=P1aJkHy9CGNhqWsgoaC+fHsucW2JLR16C/HJozISF3/CdT8i+AZ+ZoQnwwW394waPUQb31Na6yatou6uPUb2Sn3OYorNQaS+Y2Of8CJPi8I+am5AaFyk80hg4hBR/wXCAzHGa7wpQ/aHc34sFn95cxWG94Ghl19JUlN9g1Z+m70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-876074516b3so67745139f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750901319; x=1751506119;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pVRXyuQwIn0aOvrK7ZIzo769T205ERiT+I9VHfc9VtY=;
        b=cRoEIhKe2PJ7qk8EQXTg1NeNQxxVs1Atassnd0LYJNK0N9Ec83RORb0zTwqldiJVtm
         86fW3oLYMaKxRxmQ5fssMKRAulg7Q0lSwvKw9ttJByIauvgLy+U9b/uqKjacNozjbz4o
         ME4TQcl9yfCO1AzViWP/r4H5ca8kF88WqVzzUIGLqAybvm/AR6buJ5JZn2EfdMgBZMNT
         K9qZ4GzgYW+WY8AHpVv9Ck2+O08F4z0vFHu8yCeiMU4Uo8lj6iYVhdE8uaXY6FIDBFaT
         KDamPnEieGRo4dsCxu3HyIdIegis9KyWxkwaaJfbZi4Ns3ZLREwnq/2ha2AuS92Y3SyM
         gnwA==
X-Forwarded-Encrypted: i=1; AJvYcCUwfgX4q0WxFDRwDbE1wbAHdEaBoArtOlQfvp4CVdpqs//wKXwLuQagjef2Zp2rRbOLJEOhKqh9Aq85mNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Qqel7C+cfMS3FfEtyavqMFVMQL4Ovzz0yyZ170CVWjh+T0Ai
	pQ3sGYeYeKAj/yn9EFprKHwuK6BoM7i+VUPGtkF74qkI08LOPC3iYHKnkN2x8168tGhg1Cu3jI/
	ppTyHMcbq/6DxdMsqi2uTU5J4vCYedXqrZWXzQxAUQY6ckHkUaZQvh/sZvbE=
X-Google-Smtp-Source: AGHT+IGZqoR5UoNwk2u+w1U4+NM3RXqVlnWkyZFrMD5Q0jVJHWI1hG09nZqlbPq2JhnmQlVyhhZVUBgqCjD13YLcyE7/SFOKSUNF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:23c1:b0:3df:4234:df71 with SMTP id
 e9e14a558f8ab-3df4234e31fmr4915055ab.10.1750901319015; Wed, 25 Jun 2025
 18:28:39 -0700 (PDT)
Date: Wed, 25 Jun 2025 18:28:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685ca247.a00a0220.2e5631.01be.GAE@google.com>
Subject: [syzbot] [net?] INFO: rcu detected stall in linkwatch_event (5)
From: syzbot <syzbot+bee5156c0b574d986bb8@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3f75bfff44be Merge tag 'mtd/fixes-for-6.16-rc3' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=172dfd0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4130f4d8a06c3e71
dashboard link: https://syzkaller.appspot.com/bug?extid=bee5156c0b574d986bb8
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=124f330c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c7c40e7590a7/disk-3f75bfff.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/72789e04c1ce/vmlinux-3f75bfff.xz
kernel image: https://storage.googleapis.com/syzbot-assets/21a0b3ad49c2/bzImage-3f75bfff.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bee5156c0b574d986bb8@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	(detected by 0, t=10502 jiffies, g=8865, q=697 ncpus=2)
rcu: All QSes seen, last rcu_preempt kthread activity 10500 (4294960814-4294950314), jiffies_till_next_fqs=1, root ->qsmask 0x0
rcu: rcu_preempt kthread starved for 10500 jiffies! g8865 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=1
rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_preempt     state:R  running task     stack:27672 pid:16    tgid:16    ppid:2      task_flags:0x208040 flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5396 [inline]
 __schedule+0x116a/0x5de0 kernel/sched/core.c:6785
 __schedule_loop kernel/sched/core.c:6863 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6878
 schedule_timeout+0x123/0x290 kernel/time/sleep_timeout.c:99
 rcu_gp_fqs_loop+0x1ea/0xb00 kernel/rcu/tree.c:2054
 rcu_gp_kthread+0x270/0x380 kernel/rcu/tree.c:2256
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
rcu: Stack dump where RCU GP kthread last ran:
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 3539 Comm: kworker/u8:11 Not tainted 6.16.0-rc2-syzkaller-00278-g3f75bfff44be #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: events_unbound linkwatch_event
RIP: 0010:its_return_thunk+0x0/0x10 arch/x86/lib/retpoline.S:412
Code: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc <c3> cc 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 e9 5b fd a8 f5 cc
RSP: 0018:ffffc90000a08df8 EFLAGS: 00000046
RAX: 0000000000000000 RBX: ffff888033695370 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffff8880b8527c98 RDI: ffff888033695370
RBP: ffff8880b8527c98 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: ffffffff9b00b188 R12: ffff888033694880
R13: ffff888033695370 R14: 00000000ffffffff R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888124853000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa82f551f98 CR3: 000000007f635000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 __lock_is_held kernel/locking/lockdep.c:5604 [inline]
 lock_is_held_type+0xb0/0x150 kernel/locking/lockdep.c:5943
 lock_is_held include/linux/lockdep.h:249 [inline]
 __run_hrtimer kernel/time/hrtimer.c:1727 [inline]
 __hrtimer_run_queues+0x86a/0xad0 kernel/time/hrtimer.c:1825
 hrtimer_interrupt+0x397/0x8e0 kernel/time/hrtimer.c:1887
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1039 [inline]
 __sysvec_apic_timer_interrupt+0x108/0x3f0 arch/x86/kernel/apic/apic.c:1056
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0x9f/0xc0 arch/x86/kernel/apic/apic.c:1050
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:152 [inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x31/0x80 kernel/locking/spinlock.c:194
Code: f5 53 48 8b 74 24 10 48 89 fb 48 83 c7 18 e8 76 c0 15 f6 48 89 df e8 5e 14 16 f6 f7 c5 00 02 00 00 75 23 9c 58 f6 c4 02 75 37 <bf> 01 00 00 00 e8 95 34 06 f6 65 8b 05 8e 1a 4a 08 85 c0 74 16 5b
RSP: 0018:ffffc9000cf57308 EFLAGS: 00000246
RAX: 0000000000000006 RBX: ffffffff9b059128 RCX: 0000000000000006
RDX: 0000000000000000 RSI: ffffffff8de19fc0 RDI: ffffffff8c157960
RBP: 0000000000000286 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff90a81557 R11: 0000000000000001 R12: dffffc0000000000
R13: 0000000000000002 R14: 0000000000000002 R15: ffff88804f378000
 __debug_check_no_obj_freed lib/debugobjects.c:1108 [inline]
 debug_check_no_obj_freed+0x31f/0x600 lib/debugobjects.c:1129
 slab_free_hook mm/slub.c:2312 [inline]
 slab_free mm/slub.c:4643 [inline]
 kfree+0x28f/0x4d0 mm/slub.c:4842
 skb_kfree_head net/core/skbuff.c:1048 [inline]
 skb_free_head+0x114/0x210 net/core/skbuff.c:1060
 pskb_expand_head+0x3c4/0x1030 net/core/skbuff.c:2273
 netlink_trim+0x22d/0x310 net/netlink/af_netlink.c:1295
 netlink_broadcast_filtered+0xca/0xf10 net/netlink/af_netlink.c:1501
 nlmsg_multicast_filtered include/net/netlink.h:1151 [inline]
 genlmsg_multicast_netns_filtered include/net/genetlink.h:495 [inline]
 genlmsg_multicast_netns include/net/genetlink.h:512 [inline]
 team_nl_send_multicast+0xef/0x170 drivers/net/team/team_core.c:2841
 team_nl_send_port_list_get+0x68a/0x750 drivers/net/team/team_core.c:2793
 team_nl_send_event_port_get drivers/net/team/team_core.c:2855 [inline]
 __team_port_change_send+0x242/0x560 drivers/net/team/team_core.c:2913
 __team_port_change_check drivers/net/team/team_core.c:2945 [inline]
 team_port_change_check drivers/net/team/team_core.c:2967 [inline]
 team_device_event+0x61b/0x770 drivers/net/team/team_core.c:2996
 notifier_call_chain+0xb9/0x410 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2230
 netif_state_change+0x165/0x3b0 net/core/dev.c:1584
 linkwatch_do_dev+0x12b/0x160 net/core/link_watch.c:186
 __linkwatch_run_queue+0x2aa/0x8a0 net/core/link_watch.c:244
 linkwatch_event+0x8f/0xc0 net/core/link_watch.c:304
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


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
