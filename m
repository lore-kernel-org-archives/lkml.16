Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B579A18C011
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946405; cv=none; b=LlfrdypwN6Ku0giRhWyXVonuRpAIugnzpZNBnnSbnhM78Elq4iaTQO8gD4miPIHD2+XkrGBLX2sQLs89G2pQHa0njkJ5SuZITYEDy4f9xFOUfDASqaMh7x5aCDnqHzjBFqA/jVlHeEoWe/kDX49V8lB/k3xhm/+/tQEEkhqpJyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946405; c=relaxed/simple;
	bh=GgSEJHGGGIfYbQ0OCpKOCPSraSQvdK/GUcFscUDT7M4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NVrTqRz0uDtqzPlUrGuk2SC/cXmtrctMLYTvk5MxHMOf8CocmYzPJ1HOq5547jfNVTz9V1ykVGNdP1zfuq2XypmAJymGWssKbtHMxjbLq/JonG6/3puAqLG8XfO7eIgectMNbvwyRvjCaxhIMM/J51aTUKvNSDGqjIwXoJFUfoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d14a235594so1664785ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946403; x=1739551203;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPm30AHbJ/jUX1sW2k2palonDiWn2ruCia9urkwrC/U=;
        b=fzm/7hceD0190nS7BTTCMqeK+KXJPaEfsoXCOXsmKdboB068PwlMgMN1loZ5ZN6dPU
         bgX/7zOan5aPVmjwaoPt+FDKi1W2O1BGeOc4whTo8lx7mRsPwFT0JT2D3PxZeo94jy+G
         u2A7+E3ZkkpKLGhhXQvPSF4RpR8pI9LfD/T/kTqUODoWftEw0lccQWwZUu/AuWyWdXAB
         liop29P3bh+sPbCELycdKp+E6Ru9P9vwufI9UGaVx3nFQqiySc45yxJr5uejpwsWlkdr
         FqHC+uKn/bml2TCdCl0+SuXATnbIdiOem2KQ1U93lQUKTddzuEIxN+rPpD5FgUFX+0Z0
         IsEg==
X-Gm-Message-State: AOJu0YxRDkHhuLT10i07StKkLVpIqI8waTpghAOMjxs/nON93A28G06D
	p9/LIOeoETdB/SncYiUlyKJrA23cqpp29P00TwJdaigClwk2mefjvwhATJ+xX56eRUfBo8JNQE8
	NO7mHXRLZHBPUROKzs+73OmrNOeZ6Bb0Rmlpp1X3LbzhoLtMeBMu+x7Y=
X-Google-Smtp-Source: AGHT+IEwTRY2ZMvxgMPhnF3p0pgqYrKClQh8mBwnfEcgJPHc203cf6/LpQdPKQ1o6AuRj/iHQoHslq7sLF0EQsu9vkzleSEAplai
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20e8:b0:3ce:7a41:d885 with SMTP id
 e9e14a558f8ab-3d05a540706mr70875465ab.1.1738946402805; Fri, 07 Feb 2025
 08:40:02 -0800 (PST)
Date: Fri, 07 Feb 2025 08:40:02 -0800
In-Reply-To: <CABBYNZKiusks5ggjr_ZjidreAt=f89zNcpACjEhw-D_zBPUHVg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a63762.050a0220.f64af.0000.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] BUG: corrupted list in hci_chan_del (2)
From: syzbot <syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
BUG: corrupted list in hci_chan_del

 non-paged memory
list_del corruption, ffff88801251b500->prev is LIST_POISON2 (dead000000000122)
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:61!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 0 UID: 0 PID: 6801 Comm: syz.0.32 Not tainted 6.14.0-rc1-next-20250207-syzkaller-02219-ged58d103e6da-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
RIP: 0010:__list_del_entry_valid_or_report+0x12c/0x190 lib/list_debug.c:59
Code: 8c 4c 89 fe 48 89 da e8 a2 63 36 fc 90 0f 0b 48 89 df e8 27 e0 13 fd 48 c7 c7 a0 ce 60 8c 4c 89 fe 48 89 da e8 85 63 36 fc 90 <0f> 0b 4c 89 e7 e8 0a e0 13 fd 42 80 3c 2b 00 74 08 4c 89 e7 e8 db
RSP: 0018:ffffc900033b7878 EFLAGS: 00010246
RAX: 000000000000004e RBX: dead000000000122 RCX: 3b04728f07e88400
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffffffff819f3f6c R09: fffffbfff1cfa5b8
R10: dffffc0000000000 R11: fffffbfff1cfa5b8 R12: dead000000000122
R13: dffffc0000000000 R14: ffff8880285d88d8 R15: ffff88801251b500
FS:  00007fe19c9ff6c0(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe19c9ddf98 CR3: 00000000673a2000 CR4: 00000000003526f0
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
 l2cap_sock_shutdown+0xa6d/0x1070 net/bluetooth/l2cap_sock.c:1376
 l2cap_sock_release+0x79/0x1d0 net/bluetooth/l2cap_sock.c:1415
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
RIP: 0033:0x7fe19bb8cda9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fe19c9ff038 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: fffffffffffffffc RBX: 00007fe19bda5fa0 RCX: 00007fe19bb8cda9
RDX: 000000000000000e RSI: 0000000020000100 RDI: 0000000000000004
RBP: 00007fe19bc0e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fe19bda5fa0 R15: 00007ffdbd7c9148
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_del_entry_valid_or_report+0x12c/0x190 lib/list_debug.c:59
Code: 8c 4c 89 fe 48 89 da e8 a2 63 36 fc 90 0f 0b 48 89 df e8 27 e0 13 fd 48 c7 c7 a0 ce 60 8c 4c 89 fe 48 89 da e8 85 63 36 fc 90 <0f> 0b 4c 89 e7 e8 0a e0 13 fd 42 80 3c 2b 00 74 08 4c 89 e7 e8 db
RSP: 0018:ffffc900033b7878 EFLAGS: 00010246
RAX: 000000000000004e RBX: dead000000000122 RCX: 3b04728f07e88400
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: dffffc0000000000 R08: ffffffff819f3f6c R09: fffffbfff1cfa5b8
R10: dffffc0000000000 R11: fffffbfff1cfa5b8 R12: dead000000000122
R13: dffffc0000000000 R14: ffff8880285d88d8 R15: ffff88801251b500
FS:  00007fe19c9ff6c0(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe19c9ddf98 CR3: 00000000673a2000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


Tested on:

commit:         ed58d103 Add linux-next specific files for 20250207
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14509df8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=244a34ec1429746
dashboard link: https://syzkaller.appspot.com/bug?extid=10bd8fe6741eedd2be2e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15ff1df8580000

