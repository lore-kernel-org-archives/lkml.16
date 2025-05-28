Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2505522126F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748469210; cv=none; b=BRYcXcAjd/ClLqkbpMl7MWLUZ7U1Z8J2jyAcHobuNupBzEgx3zcWT4Rl/0IXz6B5xhh4/gG+E9Pm1TmhluSB5z6TQFEZIYqCkI37w2Yh6ZKQFzhChSOQvKdE7Gj0mqHxXJYlwyd418JuOZECcIuWp0WkZkilzMAr4rbt7q5qKG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748469210; c=relaxed/simple;
	bh=NSbqjUxsRy4mKYQML3irMFdvdS4gwI4tq2Eye2Ume50=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=nGNhSK5YQSHNC5YKr7ysAfUk4aKhQCbPsRvqWoux+uER9c7/VEus7L4OQbqjJvS1r4FlK6icY54Iamo2+mBF0XNbB3xtHeqpS1r46pey2ya3AqaU9jvUVUJid8/ZB7bgcZKgVt5hJPbH+ql25YLPE1KWEadbe8BfZr8YtQh3vHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3dd74e0f5c7so2671845ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748469208; x=1749074008;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KAmEaZEjQpx+xG/4gF7ATK1pixD46ZOK6jvHoM9aflc=;
        b=kK9XhsvjAmsLlw6pZWwZtygDEzVAuDaDijcp3YMtFDw8FQdhl+mROAYYsNUXbHygLU
         4Ycj07xu53avdaPU642R8pxCRvgTCWs4vEoREbAHTGNWhIgrr6cwHXJ9aIPf7PtKgDJD
         q9WMH0Pn6qT8BKDoYwlHJnXlezdQPZfW71sYmZqw2zhZY7sQfDvnSztJW1fbDFX8X//H
         vC/sJcX38SyuacmshkE8KFBLUk1JXReUU9P5PegBBL7U49mBIX1aRE9bbyFNfQ3qw+PL
         UbEVPHplrblxuqHcWIdiMy1yQbw8HeayvJhBYV8TrTWfyc9pd7SEjkVVqFAAwS/JLiat
         6AbA==
X-Forwarded-Encrypted: i=1; AJvYcCWhiITLlnHiHDqA6N4WsCZlPqtYAJvvNxuLB4Ut15QMe9SGXEi1PdYSAupAar3sbcqTCWC//VsVOspJE9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXBpRkoebyhWP8prsi0Le7nuTNgv4tL/6ycga6doJA7UFpibo4
	/vbMb1TXHtgAUcVhVBKvp9wbK83w+5qeJ5OlwvzlWE/PvFY2uZmo4A3mXEHmdWviOYWC9PH18gH
	AZkqhOrNH0d4B+5z1WHjd7QfDCtSVrG1/EBZzLkufbiCZ7hsUrh8KsZGx05o=
X-Google-Smtp-Source: AGHT+IFA+LCBnCbRCJMJafvXC6gTDOW+ac2cXhcKkNqa38o4akoDp03CrjXbETtz2dJMxr5sW5EsDJ26fr5cFu+hAsa/gYRn4WCG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1488:b0:3dc:89e3:b882 with SMTP id
 e9e14a558f8ab-3dc9b6d4de6mr186184055ab.8.1748469208258; Wed, 28 May 2025
 14:53:28 -0700 (PDT)
Date: Wed, 28 May 2025 14:53:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683785d8.a70a0220.1765ec.017d.GAE@google.com>
Subject: [syzbot] [net?] KMSAN: uninit-value in mkiss_receive_buf
From: syzbot <syzbot+dca31068cff20d2ad44d@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0f8c0258bf04 Merge tag 'mm-hotfixes-stable-2025-05-25-00-5..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=151b0df4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a423536a47898618
dashboard link: https://syzkaller.appspot.com/bug?extid=dca31068cff20d2ad44d
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/29899159fd0d/disk-0f8c0258.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5559f4a31e21/vmlinux-0f8c0258.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7fe7bf82ed6b/bzImage-0f8c0258.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dca31068cff20d2ad44d@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in kiss_unesc drivers/net/hamradio/mkiss.c:303 [inline]
BUG: KMSAN: uninit-value in mkiss_receive_buf+0x5a6/0x23c0 drivers/net/hamradio/mkiss.c:901
 kiss_unesc drivers/net/hamradio/mkiss.c:303 [inline]
 mkiss_receive_buf+0x5a6/0x23c0 drivers/net/hamradio/mkiss.c:901
 tty_ldisc_receive_buf+0x1f4/0x2c0 drivers/tty/tty_buffer.c:391
 tty_port_default_receive_buf+0xd7/0x1a0 drivers/tty/tty_port.c:37
 receive_buf drivers/tty/tty_buffer.c:445 [inline]
 flush_to_ldisc+0x44f/0xdb0 drivers/tty/tty_buffer.c:495
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb9a/0x1d90 kernel/workqueue.c:3319
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3400
 kthread+0xd5c/0xf00 kernel/kthread.c:464
 ret_from_fork+0x71/0x90 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was stored to memory at:
 mkiss_receive_buf+0x59f/0x23c0 drivers/net/hamradio/mkiss.c:901
 tty_ldisc_receive_buf+0x1f4/0x2c0 drivers/tty/tty_buffer.c:391
 tty_port_default_receive_buf+0xd7/0x1a0 drivers/tty/tty_port.c:37
 receive_buf drivers/tty/tty_buffer.c:445 [inline]
 flush_to_ldisc+0x44f/0xdb0 drivers/tty/tty_buffer.c:495
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb9a/0x1d90 kernel/workqueue.c:3319
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3400
 kthread+0xd5c/0xf00 kernel/kthread.c:464
 ret_from_fork+0x71/0x90 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4153 [inline]
 slab_alloc_node mm/slub.c:4196 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kmalloc_noprof+0x95f/0x1310 mm/slub.c:4339
 kmalloc_noprof include/linux/slab.h:909 [inline]
 tty_buffer_alloc drivers/tty/tty_buffer.c:180 [inline]
 __tty_buffer_request_room+0x3d4/0x7a0 drivers/tty/tty_buffer.c:273
 __tty_insert_flip_string_flags+0x157/0x6f0 drivers/tty/tty_buffer.c:309
 tty_insert_flip_char include/linux/tty_flip.h:77 [inline]
 uart_insert_char+0x368/0x930 drivers/tty/serial/serial_core.c:3515
 serial8250_read_char+0x1ba/0x670 drivers/tty/serial/8250/8250_port.c:1764
 serial8250_rx_chars drivers/tty/serial/8250/8250_port.c:1781 [inline]
 serial8250_handle_irq+0x930/0x1110 drivers/tty/serial/8250/8250_port.c:1945
 serial8250_default_handle_irq+0x116/0x2b0 drivers/tty/serial/8250/8250_port.c:1970
 serial8250_interrupt+0xc8/0x400 drivers/tty/serial/8250/8250_core.c:86
 __handle_irq_event_percpu+0x11c/0xbf0 kernel/irq/handle.c:158
 handle_irq_event_percpu kernel/irq/handle.c:193 [inline]
 handle_irq_event+0xe0/0x2a0 kernel/irq/handle.c:210
 handle_edge_irq+0x450/0xfd0 kernel/irq/chip.c:831
 generic_handle_irq_desc include/linux/irqdesc.h:173 [inline]
 handle_irq arch/x86/kernel/irq.c:254 [inline]
 call_irq_handler arch/x86/kernel/irq.c:266 [inline]
 __common_interrupt+0xa2/0x220 arch/x86/kernel/irq.c:292
 common_interrupt+0x94/0xb0 arch/x86/kernel/irq.c:285
 asm_common_interrupt+0x2b/0x40 arch/x86/include/asm/idtentry.h:693

CPU: 0 UID: 0 PID: 4519 Comm: kworker/u8:20 Not tainted 6.15.0-rc7-syzkaller-00175-g0f8c0258bf04 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: events_unbound flush_to_ldisc
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
