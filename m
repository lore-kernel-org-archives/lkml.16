Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063BE176FB0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896965; cv=none; b=ccOlfGUOy7ifc0VYLFk1I2O6WGPwQ4BD66k4Bks2Dc1DAPApPdPOKB2CLC1Orf9UQUK3ia/CCPBnlb/3r6D5qHQ1xidr8MbHg/IvEqbV6PVcGl5DvaPoQpwjGz1MxrUVrC3h89V42RUMhSgsARJKW1rxY6laA9S1dzIF+TbURBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896965; c=relaxed/simple;
	bh=o9ZeezjJsT3lAyb621/ethWqhjfAimNvqRwVaQcfLTU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lH6AQW+EoAeQifHLWuXo4ALhnq0tpkP22ZnxjUMZGa7ZHNEefGc0T3qFUh7T4muJdwWzh1n6yQ3c7p0g0Gp7Uprv1jDvrt7v6wsAthfw/uhgXEmkAWeuX2fVKZLTf7c0e/tbcd6Ase4sXWw5uQqX5JRorz1e49uA7PNRmW4qzp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d13fb2256fso1104115ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:56:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896963; x=1739501763;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qlUXiyFNpUmUbPlnygKt7sdunJALk/JyuTyaXRZKtfo=;
        b=MwQWXMnouCuzVPC++NgVO9cx9DN3L9ZpNICmPieIefQCUFZQsHAYuIskgcU9VHyTkK
         9uJDBGJh38zcOvvDJZgWBs3T3rqnqexH0s4Y/sFAbNRxKc6TqgACa3lOwKovrJK5O5C3
         k9DIFFlRw2sqKangBj7qgXqOyc/Qe9sEkXS/MioSqSSG32Z04Rp6NkS7M5LBGpj1eSw0
         qp+gTUfOzqcpN9Vy1mTPO8epVX87qPI3LtUl/+3dGG2e9n9YkjAjXA9zJiIS+XHnOMmY
         1EOfBl1Dk+kvyDAStq76zw5/rRPDH4NGTtTSFsXh+GDWlrSeUfKjhFNScgJrQnddkHxs
         qWBg==
X-Gm-Message-State: AOJu0YzgEH6ccrdJJUoUWn/CT+JRuWbP4ELRhG3W+jG4B1Vm/+z0VThX
	BL9LhrcfZA+YdkwmBm8x0qpT9/WULPBtqghtHY2+wguNboEUVE1fiuIpRVnYrU8e+yxIV3ZpA9o
	byKTLLFN22JV6U1AmFkaNqNEtMpwZJRuipzKOwsZZ01uCoXegDZVwrvU=
X-Google-Smtp-Source: AGHT+IGDvo/8usILOkSSlyv4c5VjUhrdRHVPPvCn5LB9f2h1A+Pewq+jScscEKuGo0TiXaw1BcJIBOqHxDvrPqzq5a2RZV4N0YcZ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a05:b0:3d0:4b0d:b226 with SMTP id
 e9e14a558f8ab-3d13df7f5a9mr12615295ab.21.1738896963164; Thu, 06 Feb 2025
 18:56:03 -0800 (PST)
Date: Thu, 06 Feb 2025 18:56:03 -0800
In-Reply-To: <20250207022033.2444682-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a57643.050a0220.2b1e6.0009.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] BUG: corrupted list in hci_chan_del (2)
From: syzbot <syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: corrupted list in hci_chan_del

 non-paged memory
list_del corruption, ffff88803376b300->prev is LIST_POISON2 (dead000000000122)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:61!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 0 UID: 0 PID: 6908 Comm: syz.0.37 Not tainted 6.14.0-rc1-next-20250206-syzkaller-01780-g808eb958781e-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
RIP: 0010:__list_del_entry_valid_or_report+0x12c/0x190 lib/list_debug.c:59
Code: 8c 4c 89 fe 48 89 da e8 f2 a9 36 fc 90 0f 0b 48 89 df e8 d7 18 14 fd 48 c7 c7 60 c9 60 8c 4c 89 fe 48 89 da e8 d5 a9 36 fc 90 <0f> 0b 4c 89 e7 e8 ba 18 14 fd 42 80 3c 2b 00 74 08 4c 89 e7 e8 6b
RSP: 0018:ffffc90003367878 EFLAGS: 00010246
RAX: 000000000000004e RBX: dead000000000122 RCX: 3ae993622551b200
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffffffff819f3a7c R09: fffffbfff1cfa5b8
R10: dffffc0000000000 R11: fffffbfff1cfa5b8 R12: dead000000000122
R13: dffffc0000000000 R14: ffff8880294f48d8 R15: ffff88803376b300
FS:  00007fcb961fe6c0(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b31920220 CR3: 000000002f686000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __list_del_entry_valid include/linux/list.h:124 [inline]
 __list_del_entry include/linux/list.h:215 [inline]
 list_del_rcu include/linux/rculist.h:168 [inline]
 hci_chan_del+0x70/0x1b0 net/bluetooth/hci_conn.c:2858
 l2cap_conn_free net/bluetooth/l2cap_core.c:1816 [inline]
 kref_put include/linux/kref.h:65 [inline]
 l2cap_conn_put+0x70/0xe0 net/bluetooth/l2cap_core.c:1830
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
RIP: 0033:0x7fcb96f8cda9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fcb961fe038 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: fffffffffffffffc RBX: 00007fcb971a5fa0 RCX: 00007fcb96f8cda9
RDX: 000000000000000e RSI: 0000000020000100 RDI: 0000000000000004
RBP: 00007fcb9700e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fcb971a5fa0 R15: 00007ffd560c8528
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x12c/0x190 lib/list_debug.c:59
Code: 8c 4c 89 fe 48 89 da e8 f2 a9 36 fc 90 0f 0b 48 89 df e8 d7 18 14 fd 48 c7 c7 60 c9 60 8c 4c 89 fe 48 89 da e8 d5 a9 36 fc 90 <0f> 0b 4c 89 e7 e8 ba 18 14 fd 42 80 3c 2b 00 74 08 4c 89 e7 e8 6b
RSP: 0018:ffffc90003367878 EFLAGS: 00010246
RAX: 000000000000004e RBX: dead000000000122 RCX: 3ae993622551b200
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffffffff819f3a7c R09: fffffbfff1cfa5b8
R10: dffffc0000000000 R11: fffffbfff1cfa5b8 R12: dead000000000122
R13: dffffc0000000000 R14: ffff8880294f48d8 R15: ffff88803376b300
FS:  00007fcb961fe6c0(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcb961dcf98 CR3: 000000002f686000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         808eb958 Add linux-next specific files for 20250206
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14b164a4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=88b25e5d30d576e4
dashboard link: https://syzkaller.appspot.com/bug?extid=10bd8fe6741eedd2be2e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=158c73df980000

