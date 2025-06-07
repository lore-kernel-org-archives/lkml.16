Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354C212C544
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 09:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749287945; cv=none; b=tawl35nJJPR7hdy+bYRuhelSxzPBed7gAgk/i2gBBVRkezitbnUtywXhQ09Bf3Z07fQIl6waYYtm93ejyXDBpgPtXHubJHUTAznAsS6yjQvV0DAU6TZESEo4dTeAgfQE47h7DLoZI7ZZ4XOhrrdx+4Qd03eKpNrh18RUoRY2Wr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749287945; c=relaxed/simple;
	bh=us8UMFHrTvf/c4L/EDwQDzS0xj4wQ2c5EggbHgG7Gbg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jWukAlsQOpaC9H7F3Do62k3UTMa3g8q+NlqWGu4iC9mzzdOiLxGd/eZuw4Ca1tY2hricAOG7mr45s81KzJ3thq4c/4qsYah9zopRnzD9/IikDQ2CTZ/rxFMz1HdbT+hO18lw9cz1UVQOE0BD/ZbRX98G6G89Fge5TM/jTGT4E24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddc4908c4dso40183065ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749287943; x=1749892743;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4roFLiJYMHgUNdEwJKkOt4wXq+PypXCVtiuF3YXoMQg=;
        b=MiFRNDRsveDAc79ZDL9dwIaXenYjpmiifhBO5o1FtAe1xdyFTFGZlw63Wn/xk1AAFp
         OBRb9y5+aONKUDS4MWFRExAbsM3uGdvnOwznumHwH7bbCDGczqsp03cK3ZXDP9fqCUOq
         m65yg43ZXioRWWkSnwWz8eMi0My/Gw9IEgTgrO77leByMB1Qv1JGNB7lNZf+sMu6jmT9
         JIpglA16ZYtCVCP707BQ5sdUoSnDV56lHxlxdtOSgr2Hty/SKhE+1Zr1aCd0m3BoxM3Y
         44dvvM77iX2PKVvhZOgFYu2zhRBjzp1wlPF19/KeFm180jNmdgqBNskkYyU3dah9Bsud
         fAkA==
X-Forwarded-Encrypted: i=1; AJvYcCWDbTs/rMcO94DYR6sS9emmzu6/5E5ZNQ8aX85KgMgpJFOoz7qpRkfw76KD+rqVylh6cyDQfVMlSq6uljo=@vger.kernel.org
X-Gm-Message-State: AOJu0YweHJREzORyqgMaqWeNitlz1OmAIAryXfVkKQ1cKwX/j420jr7H
	JT6O9mVef6KubwUl7vptPkzpCJ5lzq4AHI1gJ/kChlq3R2cccAOb/mRYnr46Hn8TNk1du1FX4kH
	jtkboY3xaBcToDeoW3UjnAA2BwIecBc0Y1JQY3YZFX+Z48AQ8QIHlxxWe+SM=
X-Google-Smtp-Source: AGHT+IGuKL+xzHtA5diFin9yEKXyXD0VaC4tCliOb52ILtozMpZWyk4i6xQT6kbIVC9O2BQjLHrwuPHjh6fxoRKmJbyP3l1/JucW
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:378c:b0:3dc:7b3d:6a5a with SMTP id
 e9e14a558f8ab-3ddce40b5cbmr64650715ab.10.1749287943266; Sat, 07 Jun 2025
 02:19:03 -0700 (PDT)
Date: Sat, 07 Jun 2025 02:19:03 -0700
In-Reply-To: <20250607084517.897-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68440407.a00a0220.29ac89.0052.GAE@google.com>
Subject: Re: [syzbot] [usb?] stack segment fault in __usb_hcd_giveback_urb
From: syzbot <syzbot+9a4aec827829942045ff@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
stack segment fault in __usb_hcd_giveback_urb

Oops: stack segment: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 5953 Comm: kworker/0:3 Not tainted 6.15.0-syzkaller-13655-gbdc7f8c5adad-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:__queue_work+0x9e/0xfe0 kernel/workqueue.c:2256
Code: 8b 1d fe 53 12 11 31 ff 89 de e8 5d 97 35 00 85 db 0f 85 fc 0c 00 00 e8 10 93 35 00 49 8d 97 c0 01 00 00 48 89 d5 48 c1 ed 03 <42> 0f b6 44 25 00 84 c0 48 89 54 24 08 0f 85 44 0d 00 00 8b 1a 89
RSP: 0018:ffffc90000007708 EFLAGS: 00010002
RAX: ffffffff818ac910 RBX: 0000000000000000 RCX: ffff88802f028000
RDX: 00000000000001c0 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000038 R08: ffff88807cca3bf7 R09: 1ffff1100f99477e
R10: dffffc0000000000 R11: ffffed100f99477f R12: dffffc0000000000
R13: ffff88807cca3bf0 R14: 0000000000000008 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125c52000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2c1ba76e90 CR3: 000000007655c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 queue_work_on+0x181/0x270 kernel/workqueue.c:2392
 __usb_hcd_giveback_urb+0x41a/0x690 drivers/usb/core/hcd.c:1650
 dummy_timer+0x862/0x4550 drivers/usb/gadget/udc/dummy_hcd.c:1994
 __run_hrtimer kernel/time/hrtimer.c:1761 [inline]
 __hrtimer_run_queues+0x52c/0xc60 kernel/time/hrtimer.c:1825
 hrtimer_run_softirq+0x187/0x2b0 kernel/time/hrtimer.c:1842
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1050
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:check_kcov_mode kernel/kcov.c:194 [inline]
RIP: 0010:write_comp_data kernel/kcov.c:246 [inline]
RIP: 0010:__sanitizer_cov_trace_const_cmp4+0x37/0x90 kernel/kcov.c:314
Code: 08 e0 9c 92 65 8b 0d b8 7f dc 10 81 e1 00 01 ff 00 74 11 81 f9 00 01 00 00 75 5b 83 ba 3c 16 00 00 00 74 52 8b 8a 18 16 00 00 <83> f9 03 75 47 48 8b 8a 20 16 00 00 44 8b 8a 1c 16 00 00 49 c1 e1
RSP: 0018:ffffc90003fdf4d0 EFLAGS: 00000246
RAX: ffffffff825d79a5 RBX: ffffffff825d787c RCX: 0000000000000000
RDX: ffff88802f028000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000000 R09: ffffffff825d787c
R10: dffffc0000000000 R11: ffffed100e5500d3 R12: dffffc0000000000
R13: 0000000000000001 R14: ffff88801b2ff000 R15: ffff88802fa68e10
 rcu_read_unlock include/linux/rcupdate.h:869 [inline]
 class_rcu_destructor include/linux/rcupdate.h:1155 [inline]
 kernfs_root+0x145/0x230 fs/kernfs/kernfs-internal.h:80
 kernfs_put+0x57/0x480 fs/kernfs/dir.c:571
 device_del+0x251/0x8e0 drivers/base/core.c:3856
 device_unregister+0x20/0xc0 drivers/base/core.c:3922
 usb_remove_ep_devs+0x50/0x80 drivers/usb/core/endpoint.c:189
 remove_intf_ep_devs drivers/usb/core/message.c:1266 [inline]
 usb_disable_device+0x36b/0x8a0 drivers/usb/core/message.c:1417
 usb_disconnect+0x304/0x8f0 drivers/usb/core/hub.c:2314
 hub_port_connect drivers/usb/core/hub.c:5373 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5673 [inline]
 port_event drivers/usb/core/hub.c:5833 [inline]
 hub_event+0x1cdb/0x4a00 drivers/usb/core/hub.c:5915
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__queue_work+0x9e/0xfe0 kernel/workqueue.c:2256
Code: 8b 1d fe 53 12 11 31 ff 89 de e8 5d 97 35 00 85 db 0f 85 fc 0c 00 00 e8 10 93 35 00 49 8d 97 c0 01 00 00 48 89 d5 48 c1 ed 03 <42> 0f b6 44 25 00 84 c0 48 89 54 24 08 0f 85 44 0d 00 00 8b 1a 89
RSP: 0018:ffffc90000007708 EFLAGS: 00010002
RAX: ffffffff818ac910 RBX: 0000000000000000 RCX: ffff88802f028000
RDX: 00000000000001c0 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000038 R08: ffff88807cca3bf7 R09: 1ffff1100f99477e
R10: dffffc0000000000 R11: ffffed100f99477f R12: dffffc0000000000
R13: ffff88807cca3bf0 R14: 0000000000000008 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125c52000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2c1ba76e90 CR3: 000000007655c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	8b 1d fe 53 12 11    	mov    0x111253fe(%rip),%ebx        # 0x11125404
   6:	31 ff                	xor    %edi,%edi
   8:	89 de                	mov    %ebx,%esi
   a:	e8 5d 97 35 00       	call   0x35976c
   f:	85 db                	test   %ebx,%ebx
  11:	0f 85 fc 0c 00 00    	jne    0xd13
  17:	e8 10 93 35 00       	call   0x35932c
  1c:	49 8d 97 c0 01 00 00 	lea    0x1c0(%r15),%rdx
  23:	48 89 d5             	mov    %rdx,%rbp
  26:	48 c1 ed 03          	shr    $0x3,%rbp
* 2a:	42 0f b6 44 25 00    	movzbl 0x0(%rbp,%r12,1),%eax <-- trapping instruction
  30:	84 c0                	test   %al,%al
  32:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
  37:	0f 85 44 0d 00 00    	jne    0xd81
  3d:	8b 1a                	mov    (%rdx),%ebx
  3f:	89                   	.byte 0x89


Tested on:

commit:         bdc7f8c5 Merge tag 'mm-stable-2025-06-06-16-09' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1052e20c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fd0cea6d0f67318f
dashboard link: https://syzkaller.appspot.com/bug?extid=9a4aec827829942045ff
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=155f5570580000

