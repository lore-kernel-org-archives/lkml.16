Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5810189F56
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948085; cv=none; b=ojE1wieLsBz+jk00T5kwrWhhxOQyN8077E4IVET8XmufdIHqquRKLuwXF3vtMNjFdOd1NmZNeg6nBwVLeBBwdv6kdsRdNtUdQd/NBzM4KYrf1EriPrj131tVod8tvBhWdONdot3IE5+/O1T4JoJ4F9oBwT4Rmid4ByIl7/7HIq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948085; c=relaxed/simple;
	bh=ktzW2OhkXnYljKjLdNLNOdVGTFmZPmWeSJDJY+2l0/Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pCooUsv8/K096fwQuk6tTs+ZSCHiWDNAPZqqOS+iLoNB6RIwZ1psXWBCFX1Jq9DosHH5N3tnlBBYgdqQf2Y7XNcP66NPrmY4rbBXjW9rOQzZCVouida+fMa/QMAA56HFDbPVU32dJw3biGiHTqFhRt2K7S68r57oUcPskwCx1W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3df33f39384so5457365ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948083; x=1751552883;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gO38/4M06l5OKkUA2reeIgi0o0RwwUe+Rrp/9eUtlKE=;
        b=aPv0YQ0EI63I1a2XnVDmT/lAHmapbomOKQHc9hO2okE6WeiepfLOnjZHfngdWKQjoj
         m7GvwJT9pBzTxzsBz0AGwSrGpMJXYCy+GxOTdk/r6sYOzvGgCH0ZzGZfXKUVibiTWn8N
         a50Fqh5B80ZD4r3F08Jti76hV2V9QDpBvp4mcAOnP4hElGCGCwaOO0mQ9Iy+aXUyuZXI
         IkKpK3hUtNq/ul6rUHCew0UIpjKeVRo3rd2MVqJq6Nfof4fkv63EBXVaEl+oVonUSKXK
         u+awfyiL0uSH2YdjC6PLDSisecJEym6i6xPPH1tgbid7PjIDcrZH4vPtEyCETJUoh99o
         3bLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV51lWtA3oaAZfIBhfu9MSMexahkzq3sduX1FB3EoVIAUB+gsNI5cbL2TDpkfDlxbpYT9GZ0zdIZDOMj38=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXvJrCiLqcM/jj6U0pqiaQbtuStvoOeYD3sFEhgWNY/TobezTq
	MscKpZfui2DooHHbrWjgKt2RZQCiMjjFMvHrblei6XF5AQv8I+kD8b092jZn8hfqxJAd4p0HJA8
	t/n03kX4oSA+gUu6pCjJKlgIe4WhPy6Ffo9dj+Jn+lqokXauVp31eF4tHGbQ=
X-Google-Smtp-Source: AGHT+IGdo+TlcpnMqEleSm+ikDun13c/8HBGvo1Sw6ciGGLXHawtIDl28GZsukwkiYQdptRPLatY5Ze27xrXjtxaveI6zTxRITc+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16cb:b0:3df:3be7:59d1 with SMTP id
 e9e14a558f8ab-3df3be7658cmr60854735ab.11.1750948082845; Thu, 26 Jun 2025
 07:28:02 -0700 (PDT)
Date: Thu, 26 Jun 2025 07:28:02 -0700
In-Reply-To: <tencent_26A1A453D76CD76066C3D37FE3604966C305@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685d58f2.a00a0220.34b642.0110.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_ioctl (2)
From: syzbot <syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in nr_remove_node_locked

------------[ cut here ]------------
WARNING: CPU: 2 PID: 6679 at net/netrom/nr_route.c:290 nr_remove_node_locked+0x1b3/0x200 net/netrom/nr_route.c:290
Modules linked in:
CPU: 2 UID: 0 PID: 6679 Comm: syz.0.45 Not tainted 6.16.0-rc3-syzkaller-gee88bddf7f2f-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:nr_remove_node_locked+0x1b3/0x200 net/netrom/nr_route.c:290
Code: be ff ff ff ff 48 c7 c7 58 50 59 90 e8 46 dc 10 01 31 ff 89 c5 89 c6 e8 6b 65 4f f7 85 ed 0f 85 a4 fe ff ff e8 1e 6a 4f f7 90 <0f> 0b 90 e9 96 fe ff ff 48 c7 c7 44 2d a7 90 e8 e9 47 b6 f7 e9 6e
RSP: 0018:ffffc90003b47ab0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888025854f00 RCX: ffffffff8a6cb3d5
RDX: ffff8880442a0000 RSI: ffffffff8a6cb3e2 RDI: 0000000000000005
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
R13: ffff88803c362000 R14: ffff888026762c00 R15: 0000000000000000
FS:  00007f21787756c0(0000) GS:ffff8880d6974000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2e55ffff CR3: 000000004f9b7000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 nr_del_node net/netrom/nr_route.c:347 [inline]
 nr_rt_ioctl+0x1fc7/0x26f0 net/netrom/nr_route.c:675
 nr_ioctl+0x19a/0x2e0 net/netrom/af_netrom.c:1254
 sock_do_ioctl+0x115/0x280 net/socket.c:1190
 sock_ioctl+0x227/0x6b0 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2177985d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2178775038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f2177b75fa0 RCX: 00007f2177985d29
RDX: 0000000020000180 RSI: 000000000000890c RDI: 0000000000000005
RBP: 00007f2177a01b08 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f2177b75fa0 R15: 00007fff2cb7c2d8
 </TASK>


Tested on:

commit:         ee88bddf Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=170adb70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=644a0493ff5118b1
dashboard link: https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=116bb182580000

