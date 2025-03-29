Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E882B2D7
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743242588; cv=none; b=TsFkK5fZJ04+5Xy8ICK+dpqIExQfR4xVfREvXlNqf6S2xfWv4WOjCBjf6eeIJQuBXluZFksaoJH42WVnvPuXNV7AMpnj+lXB4IoAED49UQ6w+0bZB4MuDFcGRj0doDimFUdWlF3n47aqps6QHMtporYv0fmrjy7RQ2l2uy9BaPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743242588; c=relaxed/simple;
	bh=4BGhT6qNdP7Cy1tqF06zIULPCvGOl86++tyGHuJovXo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cbPxbIlJE9btB1s0o0FA+eH2E6CDzZHauIasmSABiGMnJHY7cri+ZQGkZxCf0kia1TYgrIpthl/66EP4Vyu9zRfxigzPKqZb+8cQ1gfgkDoteEXOZgUI2w/Vy1zTBRuMPciGeQ1lzCFWH/Hz8+tZ/eQtF1HYcVmijCAgT2VElW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d43541a706so28942185ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 03:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743242586; x=1743847386;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ox5FFkr2twoGUxOvBLmv3DfSm4qVY63WeVAMKw6rYoE=;
        b=wuuZ6LacoLRj1uLWOzc9ijYAaJc5BCXdXZk3VPAAetWnkptYTTlCIyHhteu0a0RXWT
         71GSh0+GFwUD98battLuFCDY1iQLSmvUN3AK21PA/009IRVgiai+uhjM5Doq8bFN19QC
         ebBOmSX/arVZxzSxn3/T4qrQfPfvgsUjA2nvtzmUsE+2EMazkR5W/J+3z9kMyzKoGLnE
         N20mkiJfN0NHj8o60ukUOt+knjv4FiP2Pqj6H+BCgVyyglNhyozOhkpp+RQV5Ods7GrP
         Xi1fUO7Jl0+hQfnRRBjDGOLiQ7r+CBAyJvnF1AQtaN1dzTYMRaeDRNE35EuPQ5PGEZx1
         ADEw==
X-Forwarded-Encrypted: i=1; AJvYcCWCIXSCzMJXW0WLB40yzZhETLFC8xmkMnmpPdM3i0MwzNl0j0knPzfIFM5CJEJPqWP/VUq9EMWr12bLZbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/KApor4NUSI0ySpYNhry4gUPQIFI4RG71L7XxqnDM449f1LCR
	HNe1r8cm8ExVuxcZsf6NFtWqUWiveJzAQGkS8cwxOWqFAaa8NYCfKGojMTFjOS0nQY8MhMSTT7u
	LB1gKAc5NKvk+mPDetV3XmPxkjqiip7syyBwm2pKJfbrFS1ASiAlKlGA=
X-Google-Smtp-Source: AGHT+IHQHs3XfHbBWYxW2kQFMuXxIOHsINyhGKNl+0nyLpoCPcKyg35esQOO02gDgcgC14Ua92xWd+fnWHWjQqFRV72pe7nCGz20
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca09:0:b0:3d3:f19c:77c7 with SMTP id
 e9e14a558f8ab-3d5e09c8d9fmr21736625ab.16.1743242585813; Sat, 29 Mar 2025
 03:03:05 -0700 (PDT)
Date: Sat, 29 Mar 2025 03:03:05 -0700
In-Reply-To: <tencent_FA76EF66A63CD7369E971636784A0074D509@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e7c559.050a0220.1547ec.0029.GAE@google.com>
Subject: Re: [syzbot] [afs?] BUG: sleeping function called from invalid
 context in __alloc_frozen_pages_noprof
From: syzbot <syzbot+3b6c5c6a1d0119b687a1@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering=
 an issue:
WARNING in inode_set_cached_link

------------[ cut here ]------------
bad length passed for symlink [/tmp/syz-imagegen2884317625/=08] (got 39, ex=
pected 29)
WARNING: CPU: 0 PID: 6579 at ./include/linux/fs.h:803 inode_set_cached_link=
+0xd0/0x110 include/linux/fs.h:802
Modules linked in:
CPU: 0 UID: 0 PID: 6579 Comm: syz-executor Not tainted 6.14.0-rc4-syzkaller=
-00172-g1d0b929fc070-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 02/12/2025
RIP: 0010:inode_set_cached_link+0xd0/0x110 include/linux/fs.h:802
Code: 41 5f 5d c3 cc cc cc cc e8 3d ef 44 ff c6 05 e0 41 a8 0d 01 90 48 c7 =
c7 e0 23 3e 8c 4c 89 f6 44 89 fa 89 e9 e8 21 79 03 ff 90 <0f> 0b 90 90 e9 6=
a ff ff ff 89 f9 80 e1 07 80 c1 03 38 c1 7c a1 e8
RSP: 0018:ffffc90003667698 EFLAGS: 00010246
RAX: 720c93d201fc4800 RBX: ffff888063c302b0 RCX: ffff88807b148000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 000000000000001d R08: ffffffff81819472 R09: 1ffff110170c519a
R10: dffffc0000000000 R11: ffffed10170c519b R12: ffff888063c302b0
R13: dffffc0000000000 R14: ffff888063c30000 R15: 0000000000000027
FS:  000055558945a500(0000) GS:ffff8880b8600000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffe2a3a0da8 CR3: 0000000033d6c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __ext4_iget+0x2ea4/0x3f30 fs/ext4/inode.c:5012
 ext4_lookup+0x3e3/0x750 fs/ext4/namei.c:1813
 __lookup_slow+0x296/0x400 fs/namei.c:1793
 lookup_slow+0x53/0x70 fs/namei.c:1810
 walk_component+0x2ea/0x410 fs/namei.c:2114
 lookup_last fs/namei.c:2612 [inline]
 path_lookupat+0x16f/0x450 fs/namei.c:2636
 filename_lookup+0x2a3/0x670 fs/namei.c:2665
 user_path_at+0x3a/0x60 fs/namei.c:3072
 ksys_umount fs/namespace.c:2071 [inline]
 __do_sys_umount fs/namespace.c:2079 [inline]
 __se_sys_umount fs/namespace.c:2077 [inline]
 __x64_sys_umount+0xf1/0x170 fs/namespace.c:2077
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdcbc38e497
Code: a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 0f 1f 44 00 00 31 f6 e9 09 =
00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff f=
f 77 01 c3 48 c7 c2 a8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffe2a3a1558 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: ffffffffffffffda RBX: 00007fdcbc40e08c RCX: 00007fdcbc38e497
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffe2a3a1610
RBP: 00007ffe2a3a1610 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffe2a3a2700
R13: 00007fdcbc40e08c R14: 000000000001bcfe R15: 00007ffe2a3a48c0
 </TASK>


Tested on:

commit:         1d0b929f afs: Change dynroot to create contents on dem..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
console output: https://syzkaller.appspot.com/x/log.txt?x=3D17fb7804580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Db1debf8c2c3d28b=
1
dashboard link: https://syzkaller.appspot.com/bug?extid=3D3b6c5c6a1d0119b68=
7a1
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1514864c5800=
00

