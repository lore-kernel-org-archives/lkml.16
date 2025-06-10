Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B8C1F0984
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549425; cv=none; b=PNcSjQwUpQ+R6aurBqYNy/qeS6dRNZ8I2AxbStu9fyg2GDcdg+gDybQnaww84pwziuQ7EkyrouFtgWu4rXqJmpQfsH6a5cyjH6w7LxIDGhD/lpB5FDDHiP4OPdbwkafEzqw5HMK4mUSssJe47qH00Ova1ZajTnyxgwaQTB42ayA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549425; c=relaxed/simple;
	bh=4iYm8X5bJ2rlc0I4nMwgRn//UtiJJfnmFPuX6LV6oDQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LEcTPlq5JwpL6q+bXVrGLvV6dOkvPEvYrcM0Vh4o67WmMjMDy7oLMvFYbQZozf4lbihAdLzuLkaBWPg2j+8rZMC3cCfk6N7juMILKXevhGo/W/36TMwsOdxVhu/9Srg/XtzcP89qfQLcE0fPtBDW2xzL0YxAWbxsHSgIsuHvsCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddd90ca184so18477535ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549423; x=1750154223;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akStvc82a3aT2IUHxWiGSkI1qBs7xOXRpp2fq3Jcy7g=;
        b=tYpBf24NW3g0kE+l+dRWT8V0OciCl12D/tS9MVpnaFoOGMw/4O+Qv6c1BxkGPaHltx
         5U6oMJqgitV8FOzhnyM2s2ESB0gCNYj1zujMGGo7pIbCwO4uEjVZ5F2XurHj6fkHFixF
         5Fk9lMjGOL/3ge7TMegN/3EeWmZjONpB2G+IOEGdl/7yL0XUhCYp0VZhYsjM4ns8JD0P
         Ntq5WL6c8JcQcMJmkr4e12BfkiRS4hNym/uG4TOmcFNTeFWeTREbM8Tir9TFUetAOhY0
         m4GTVGiYFPrk303F9Rj38uvgyILRuru+oyCz/T551ZqHW/XOubZ1EewVZieAqYuzGV1u
         PyFA==
X-Forwarded-Encrypted: i=1; AJvYcCWrU4ketxivjV82KD0K8DXbnhHVC6+fcli8jy49s359co1Zim5baZHnEXSP8HCILJ81iCwTnDaVgR+yPw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfeqhDR5pag6W4qGRrLHxdJfQvB4REY3RuedAqtM65V/cQOVCk
	IK253NMN8o0abFz2np6pdzTf07e8aGBdhlR9UBIhMTy/RWnTnRCtASgQ4RXnOom57hQGcUlF9fH
	jVB222Q714PwfKMbwGs7Zc/wwKkSKG/NMV4sfRe/U3F2xS08ZSKFivILgf/Q=
X-Google-Smtp-Source: AGHT+IHbF/Tp6eaieimxvIgHOVl/u8Rjnj4jLqDUr8jJDOnvnM+WPw9hUY6KRKSslC4Hf/mSt+KuGyJSJsdjutWl1thRrbQcP+Dl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fc4:b0:3dd:c18b:c03e with SMTP id
 e9e14a558f8ab-3ddce3e0344mr205779705ab.5.1749549422940; Tue, 10 Jun 2025
 02:57:02 -0700 (PDT)
Date: Tue, 10 Jun 2025 02:57:02 -0700
In-Reply-To: <e648f349-6bad-44fb-a5f6-5a72a4cc2953@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6848016e.050a0220.33aa0e.033a.GAE@google.com>
Subject: Re: [syzbot] [usb?] stack segment fault in __usb_hcd_giveback_urb
From: syzbot <syzbot+9a4aec827829942045ff@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in carl9170_usb_rx_complete

------------[ cut here ]------------
WARNING: CPU: 1 PID: 6612 at drivers/net/wireless/ath/carl9170/usb.c:448 carl9170_usb_rx_complete+0x28a/0x2d0 drivers/net/wireless/ath/carl9170/usb.c:448
Modules linked in:
CPU: 1 UID: 0 PID: 6612 Comm: kworker/1:3 Not tainted 6.16.0-rc1-syzkaller-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:carl9170_usb_rx_complete+0x28a/0x2d0 drivers/net/wireless/ath/carl9170/usb.c:448
Code: 5d e9 2a 04 27 04 44 89 e1 80 e1 07 80 c1 03 38 c1 0f 8c 05 fe ff ff 4c 89 e7 e8 c1 da 62 fb e9 f8 fd ff ff e8 77 63 ff fa 90 <0f> 0b 90 e9 f7 fe ff ff 44 89 f1 80 e1 07 80 c1 03 38 c1 0f 8c 4c
RSP: 0018:ffffc90000a08868 EFLAGS: 00010046
RAX: ffffffff86c0fb79 RBX: ffff8880775430a0 RCX: ffff88802f255a00
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffff888077543a6b R09: 1ffff1100eea874d
R10: dffffc0000000000 R11: ffffed100eea874e R12: 00000000ffffffb9
R13: dffffc0000000000 R14: ffff88807754358c R15: ffff8880664d9600
FS:  0000000000000000(0000) GS:ffff888125d52000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff0496217d0 CR3: 0000000078f80000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 __usb_hcd_giveback_urb+0x41a/0x690 drivers/usb/core/hcd.c:1650
 dummy_timer+0x862/0x4550 drivers/usb/gadget/udc/dummy_hcd.c:1995
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
RIP: 0010:console_flush_all+0x7f7/0xc40 kernel/printk/printk.c:3227
Code: 48 21 c3 0f 85 e9 01 00 00 e8 b5 23 1f 00 48 8b 5c 24 20 4d 85 f6 75 07 e8 a6 23 1f 00 eb 06 e8 9f 23 1f 00 fb 48 8b 44 24 28 <42> 80 3c 20 00 74 08 48 89 df e8 fa 9a 82 00 48 8b 1b 48 8b 44 24
RSP: 0018:ffffc90003e4f0a0 EFLAGS: 00000293
RAX: 1ffffffff1d36a1f RBX: ffffffff8e9b50f8 RCX: ffff88802f255a00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90003e4f1f0 R08: ffffffff8fa108f7 R09: 1ffffffff1f4211e
R10: dffffc0000000000 R11: fffffbfff1f4211f R12: dffffc0000000000
R13: 0000000000000001 R14: 0000000000000200 R15: ffffffff8e9b50a0
 __console_flush_and_unlock kernel/printk/printk.c:3285 [inline]
 console_unlock+0xc4/0x270 kernel/printk/printk.c:3325
 vprintk_emit+0x5b7/0x7a0 kernel/printk/printk.c:2450
 dev_vprintk_emit+0x337/0x3f0 drivers/base/core.c:4917
 dev_printk_emit+0xe0/0x130 drivers/base/core.c:4928
 _dev_info+0x10a/0x160 drivers/base/core.c:4986
 usb_disconnect+0xdd/0x910 drivers/usb/core/hub.c:2298
 hub_port_connect drivers/usb/core/hub.c:5375 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
 port_event drivers/usb/core/hub.c:5835 [inline]
 hub_event+0x1cdb/0x4a00 drivers/usb/core/hub.c:5917
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	48 21 c3             	and    %rax,%rbx
   3:	0f 85 e9 01 00 00    	jne    0x1f2
   9:	e8 b5 23 1f 00       	call   0x1f23c3
   e:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  13:	4d 85 f6             	test   %r14,%r14
  16:	75 07                	jne    0x1f
  18:	e8 a6 23 1f 00       	call   0x1f23c3
  1d:	eb 06                	jmp    0x25
  1f:	e8 9f 23 1f 00       	call   0x1f23c3
  24:	fb                   	sti
  25:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
* 2a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	48 89 df             	mov    %rbx,%rdi
  34:	e8 fa 9a 82 00       	call   0x829b33
  39:	48 8b 1b             	mov    (%rbx),%rbx
  3c:	48                   	rex.W
  3d:	8b                   	.byte 0x8b
  3e:	44                   	rex.R
  3f:	24                   	.byte 0x24


Tested on:

commit:         19272b37 Linux 6.16-rc1
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1489c60c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c07f08ee4bcfb276
dashboard link: https://syzkaller.appspot.com/bug?extid=9a4aec827829942045ff
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11aac60c580000

