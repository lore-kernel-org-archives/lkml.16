Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A6F2472AD
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 19:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746385836; cv=none; b=nTGQsGQqz84MY/IbbGJK9ITLOoBVKwQ+xlzbw2NoeBVpm+XFggUcCTQcY+cpRh7F1M7M3XBVRef9rHg5XjDR28G+/hGvKw9KQagUMkRNteZiZZTKdO6J991o8XPJdzHqvDVuXGlJFOtBG7vec6FNPA4GzrTccBPhAFMYKtH3HEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746385836; c=relaxed/simple;
	bh=3zAgqqtA0AMRd9qyRHevjG9yE+3r521V08jZKLBStEE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=XvbQF+IpxFJe4z1ymvywEsiQYzygJD5PZ+EbnfaXEjET9vBO7Ki+5Ww97M0iNfn5Uq0a4ejtcOmgTC+cMgXWGOXoBybWQwpepmi3tEvW3ZZGX8MDzOriQlsVoJ/tONXR128KF+qnpKYgPcvrVX1wzojxS8NwRq5JYslLtx3s5BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d81bc8ec0cso76537665ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 12:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746385833; x=1746990633;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MMcxMbEuZiJqh9QiS4uKoP4TMrBGA20OQC7YOcSvR2g=;
        b=G6ft2R4zFEd1SHFDGe7SF3VFIkea42NGzZjQfWi5XW1XcOiD2nN+Y3VkKueTzEVJYM
         b44agiKG5Z7h2B6pqa9etSc/KnB8vF6rMdYKFv9UZ2vhhjEpvla/3b3urR/P8itWYIGN
         EgZ/3yWCXWMlNq4HXycMvLPdAV+qmepZpvFqvJxDbWrknIY+WUXreSoz9RgI+xJCf/0O
         PtCxV72dQ4gRr3K0UWgz6qxHvkRhrGMMKA/TlLwFfVJaDJHGq8SOm9YkowBdMcabpsGu
         Im8lRXT3OpW0dM8kDCyHeNcHwXOMlrICknVgLr3Fg5FJZHtE2laXW0aLSMZOul7Kp5mB
         7Q6g==
X-Forwarded-Encrypted: i=1; AJvYcCXPOyUlSaWyG8MAEau3OC0sqMYyspkf/+FgxHus6/F/oMzWG3F+d1z4RI7cp9dS4fsikTMCig7GloWynR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0lw+dTVnbhavAm2M+AeQBUZBM9tPIF650tnxRjtFBN1Opqwaz
	LynIv1HeHUrCkVHIwuYVcBArRu1HBaqHvVUdmndEKfaf2/uAuIF/E8jsMZu0YXCgC5Cy7Cs1Hop
	pAjrzOq/m33BPrknfJWLke5lKl7j+IkEoq3rQRy7WgEKp+XJKZsVRi5M=
X-Google-Smtp-Source: AGHT+IEGcBEwm7i2C3AM+UVkygEdXHc1Mt/bJ8Usyh436EErjPdhUpacnPIgRBOtjz3pnP/UGycP2mWoEo6ALIfikqa+L7h4m2Xe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b46:b0:3d9:6c9a:f363 with SMTP id
 e9e14a558f8ab-3d97c1998d2mr99672485ab.6.1746385833554; Sun, 04 May 2025
 12:10:33 -0700 (PDT)
Date: Sun, 04 May 2025 12:10:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6817bba9.050a0220.11da1b.0036.GAE@google.com>
Subject: [syzbot] [wireguard?] INFO: rcu detected stall in wg_packet_handshake_receive_worker
 (3)
From: syzbot <syzbot+48f45f6dd79ca20c3283@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
	wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ebd297a2affa Merge tag 'net-6.15-rc5' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=152b41cc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=541aa584278da96c
dashboard link: https://syzkaller.appspot.com/bug?extid=48f45f6dd79ca20c3283
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=170e1f74580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6ddda4d4b637/disk-ebd297a2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e2a2d6ca1abd/vmlinux-ebd297a2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1b7bc593408e/bzImage-ebd297a2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+48f45f6dd79ca20c3283@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	0-...!: (3 ticks this GP) idle=f5e4/1/0x4000000000000000 softirq=17502/17502 fqs=0
rcu: 	(detected by 1, t=10503 jiffies, g=8145, q=1636 ncpus=2)
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 5843 Comm: kworker/0:3 Not tainted 6.15.0-rc4-syzkaller-00147-gebd297a2affa #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
Workqueue: wg-kex-wg0 wg_packet_handshake_receive_worker
RIP: 0010:bytes_is_nonzero mm/kasan/generic.c:89 [inline]
RIP: 0010:memory_is_nonzero mm/kasan/generic.c:104 [inline]
RIP: 0010:memory_is_poisoned_n mm/kasan/generic.c:129 [inline]
RIP: 0010:memory_is_poisoned mm/kasan/generic.c:161 [inline]
RIP: 0010:check_region_inline mm/kasan/generic.c:180 [inline]
RIP: 0010:kasan_check_range+0x105/0x1a0 mm/kasan/generic.c:189
Code: 75 0a b8 01 00 00 00 45 3a 11 7c 0b 44 89 c2 e8 61 ec ff ff 83 f0 01 5b 5d 41 5c c3 cc cc cc cc 48 85 d2 74 4f 48 01 ea eb 09 <48> 83 c0 01 48 39 d0 74 41 80 38 00 74 f2 eb b2 41 bc 08 00 00 00
RSP: 0018:ffffc90000007d00 EFLAGS: 00000046
RAX: ffffed100f465a10 RBX: ffffed100f465a11 RCX: ffffffff89808340
RDX: ffffed100f465a11 RSI: 0000000000000004 RDI: ffff88807a32d080
RBP: ffffed100f465a10 R08: 0000000000000001 R09: ffffed100f465a10
R10: ffff88807a32d083 R11: 0000000000000000 R12: 0000000000000000
R13: ffff88807a32d000 R14: 0000000000000000 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8881249e2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000560c50fa2060 CR3: 0000000029abe000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 instrument_atomic_write include/linux/instrumented.h:82 [inline]
 atomic_set include/linux/atomic/atomic-instrumented.h:67 [inline]
 taprio_set_budgets+0x1a0/0x310 net/sched/sch_taprio.c:672
 advance_sched+0x5f6/0xc80 net/sched/sch_taprio.c:977
 __run_hrtimer kernel/time/hrtimer.c:1761 [inline]
 __hrtimer_run_queues+0x1ff/0xad0 kernel/time/hrtimer.c:1825
 hrtimer_interrupt+0x397/0x8e0 kernel/time/hrtimer.c:1887
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1038 [inline]
 __sysvec_apic_timer_interrupt+0x108/0x3f0 arch/x86/kernel/apic/apic.c:1055
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0x9f/0xc0 arch/x86/kernel/apic/apic.c:1049
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_acquire+0x62/0x350 kernel/locking/lockdep.c:5870
Code: ce 0b 12 83 f8 07 0f 87 bc 02 00 00 89 c0 48 0f a3 05 42 ea ec 0e 0f 82 74 02 00 00 8b 35 da 19 ed 0e 85 f6 0f 85 8d 00 00 00 <48> 8b 44 24 30 65 48 2b 05 19 ce 0b 12 0f 85 c7 02 00 00 48 83 c4
RSP: 0018:ffffc90003537850 EFLAGS: 00000206
RAX: 0000000000000046 RBX: ffffffff8e588130 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffffffff8dbbb25f RDI: ffffffff8bf47e20
RBP: 0000000000000002 R08: 52b2bffd12c8faba R09: ffffffff968457c8
R10: 0000000000000004 R11: 0000000000002bc0 R12: 0000000000000001
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 srcu_lock_acquire include/linux/srcu.h:161 [inline]
 srcu_read_lock include/linux/srcu.h:253 [inline]
 kasan_quarantine_reduce+0x8e/0x1e0 mm/kasan/quarantine.c:259
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4161 [inline]
 slab_alloc_node mm/slub.c:4210 [inline]
 __kmalloc_cache_noprof+0x1f1/0x3e0 mm/slub.c:4367
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 keypair_create drivers/net/wireguard/noise.c:100 [inline]
 wg_noise_handshake_begin_session+0xe5/0xe80 drivers/net/wireguard/noise.c:827
 wg_packet_send_handshake_response+0x216/0x310 drivers/net/wireguard/send.c:96
 wg_receive_handshake_packet+0x247/0xbf0 drivers/net/wireguard/receive.c:154
 wg_packet_handshake_receive_worker+0x17f/0x3a0 drivers/net/wireguard/receive.c:213
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
rcu: rcu_preempt kthread timer wakeup didn't happen for 10502 jiffies! g8145 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
rcu: 	Possible timer handling issue on cpu=0 timer-softirq=4379
rcu: rcu_preempt kthread starved for 10503 jiffies! g8145 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=0
rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_preempt     state:I stack:28728 pid:16    tgid:16    ppid:2      task_flags:0x208040 flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x116f/0x5de0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6860
 schedule_timeout+0x123/0x290 kernel/time/sleep_timeout.c:99
 rcu_gp_fqs_loop+0x1ea/0xb00 kernel/rcu/tree.c:2046
 rcu_gp_kthread+0x270/0x380 kernel/rcu/tree.c:2248
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
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
