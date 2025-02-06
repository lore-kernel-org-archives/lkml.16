Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9922B23C380
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738881425; cv=none; b=tDhP3uOuHIeTd6rmRU7W8wYfSAY8F0GgeKWXb+V4CbWFoZW0eYmC7+e1e4ho5MIVfb8cXPmkTMko6urpfqJh5y0WH7tq63scpZ7NW1gHOfSWNyLv5up5MRs/i1zFfGh7Hr9FQBA/B76k+eIoSl0qE7eP801wmflPcSX9bA5B3YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738881425; c=relaxed/simple;
	bh=u4VJP2FAFxGPHrwoXVbQXyQoDIuME5+CymzpibKO9OM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LYo3EPBONmEiRbidMZFDJM0tJ9nuhZXKYCTtpEQP/YrBZO/jqGzfhR4tpIwuH+VACk3X94aqXUW1BDZdosD7mJT3Pjz4/hztQcAtwPBdQTJVXXrngO/Hqki1Y9tD5LuZYnkbGOxAV91klQn2BFcBBKEtYJQzN6Zq4X0wAMXpwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d0525b45ddso23896385ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 14:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738881422; x=1739486222;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/usgZQy+6kllkpfYtSQIQ7v5dGeOXRhu7AeEyYru8iE=;
        b=itIToDivPh/6KYw/u4H/SljGbAEWkFtXF/f1y3S5bYuDBUW4ERAh0MP2Vk1tEugamT
         9c2E0yk0yX5yFInlMVdqbBeAJ0sZwnEvxoTXF66YdAJ5fNrlOCjzCrTdWvp2MBOjcDcy
         /FAbKWMApWlHhK2Owrl8ROptzT32WZXFqxBwuWGFvyRzowydDurg75dw7Y7njm/fPQl8
         2lEX1EdVPpkLiCc7/zuhhC1KHDEl7KVbksFuv3a66QaApQI8Zfu1kT/ki6MCL6ld2fJQ
         0zKI7+WKIHgfuwCjVtYwxTWzWWF290QifPSw+IML+rt48Hrny0qTw6yUZdscNDZBlinT
         ol2A==
X-Gm-Message-State: AOJu0YzpCzWCpkE4eZke+xj4IIj0+Z9zdM31qbThWa0ctK9GkKiqYDAN
	kqjmEu4CTd4JMWb4u9yoJ892akPM+U8GyiqS94Fq8Y+qG89eEcuKXrjPv8pJoo32HBrqCB+IEi7
	iKwQV7hmdotZJ/KIKD7YpmaK6LdYz8bjjDdH2DyJtxscJ0T/qks0xvWw=
X-Google-Smtp-Source: AGHT+IGjZMaYjptvgqKCuWLqqPYBFrRND3rP4wG6YqO4e9mOhYJyP4GAu4mWQuKkCn3GeHC+RZkdwMqcNKP60RNU+nLUAW8p/C8a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fcb:b0:3d0:137a:8ca2 with SMTP id
 e9e14a558f8ab-3d13e00afcamr6481715ab.22.1738881422662; Thu, 06 Feb 2025
 14:37:02 -0800 (PST)
Date: Thu, 06 Feb 2025 14:37:02 -0800
In-Reply-To: <CABBYNZJ2bCo7-g75BZbP8Ch3FUVzLhXe05EonigSThuVyzfhLg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a5398e.050a0220.be3c3.0004.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] BUG: corrupted list in hci_chan_del (2)
From: syzbot <syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: corrupted list in hci_chan_del

 non-paged memory
list_del corruption, ffff88807b27ea00->prev is LIST_POISON2 (dead000000000122)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:61!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 1 UID: 0 PID: 6854 Comm: syz.0.27 Not tainted 6.14.0-rc1-next-20250206-syzkaller-01780-g808eb958781e-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
RIP: 0010:__list_del_entry_valid_or_report+0x12c/0x190 lib/list_debug.c:59
Code: 8c 4c 89 fe 48 89 da e8 f2 a9 36 fc 90 0f 0b 48 89 df e8 d7 18 14 fd 48 c7 c7 60 c9 60 8c 4c 89 fe 48 89 da e8 d5 a9 36 fc 90 <0f> 0b 4c 89 e7 e8 ba 18 14 fd 42 80 3c 2b 00 74 08 4c 89 e7 e8 6b
RSP: 0018:ffffc90003bcf878 EFLAGS: 00010246
RAX: 000000000000004e RBX: dead000000000122 RCX: a897bd044364c000
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffffffff819f3a7c R09: fffffbfff1cfa5b8
R10: dffffc0000000000 R11: fffffbfff1cfa5b8 R12: dead000000000122
R13: dffffc0000000000 R14: ffff8880799808d8 R15: ffff88807b27ea00
FS:  00007f75a3f576c0(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f75a3f35f98 CR3: 00000000352d6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:124 [inline]
 __list_del_entry include/linux/list.h:215 [inline]
 list_del_rcu include/linux/rculist.h:168 [inline]
 hci_chan_del+0x70/0x1b0 net/bluetooth/hci_conn.c:2858
 l2cap_conn_free net/bluetooth/l2cap_core.c:1805 [inline]
 kref_put include/linux/kref.h:65 [inline]
 l2cap_conn_put+0x70/0xe0 net/bluetooth/l2cap_core.c:1819
 l2cap_sock_shutdown+0xa8a/0x1020 net/bluetooth/l2cap_sock.c:1377
 l2cap_sock_release+0x79/0x1d0 net/bluetooth/l2cap_sock.c:1416
 __sock_release net/socket.c:647 [inline]
 sock_close+0xbc/0x240 net/socket.c:1398
 __fput+0x3e9/0x9f0 fs/file_table.c:464
 task_work_run+0x24f/0x310 kernel/task_work.c:227
 get_signal+0x15f7/0x1750 kernel/signal.c:2809
 arch_do_signal_or_restart+0x96/0x860 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0xce/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f75a318cda9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f75a3f57038 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: fffffffffffffffc RBX: 00007f75a33a5fa0 RCX: 00007f75a318cda9
RDX: 000000000000000e RSI: 0000000020000100 RDI: 0000000000000004
RBP: 00007f75a320e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f75a33a5fa0 R15: 00007fff4e4627b8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x12c/0x190 lib/list_debug.c:59
Code: 8c 4c 89 fe 48 89 da e8 f2 a9 36 fc 90 0f 0b 48 89 df e8 d7 18 14 fd 48 c7 c7 60 c9 60 8c 4c 89 fe 48 89 da e8 d5 a9 36 fc 90 <0f> 0b 4c 89 e7 e8 ba 18 14 fd 42 80 3c 2b 00 74 08 4c 89 e7 e8 6b
RSP: 0018:ffffc90003bcf878 EFLAGS: 00010246
RAX: 000000000000004e RBX: dead000000000122 RCX: a897bd044364c000
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffffffff819f3a7c R09: fffffbfff1cfa5b8
R10: dffffc0000000000 R11: fffffbfff1cfa5b8 R12: dead000000000122
R13: dffffc0000000000 R14: ffff8880799808d8 R15: ffff88807b27ea00
FS:  00007f75a3f576c0(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f75a3f36d58 CR3: 00000000352d6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         808eb958 Add linux-next specific files for 20250206
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1358d318580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=88b25e5d30d576e4
dashboard link: https://syzkaller.appspot.com/bug?extid=10bd8fe6741eedd2be2e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14b0d318580000

