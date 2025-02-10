Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86331C3BF9
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 21:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223746; cv=none; b=tJEPFPo1Om2KRNn0KC72RVKDAQ2nh19LaGAMmNdfBPqzrDcf7Wu0IRQXu/MryRRWOjK5WPeLQ9vdF2oTrLxckNbdn+4dIIJpWeHYSLo5hJWVhkUoPsa/yZbEP7042aVQgQgTx7Ifo6droPAEXfB4Tp22rwHj65sN14n8jbPA9hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223746; c=relaxed/simple;
	bh=MwWf12XRx2g6cZdRWuoLJpi6I2Na37C1aI5DGJAjOPY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=u7plCspHa7Q1gJ/OloXQfg024oQ0RVtgKmEyOsQ3Gjb4uzQanWZeALOFM5n6OZWfmM+Ia7Grg66BwzF8ZdbWtlrGD16aUBrs2Q2Qgvwcfg8dubK8+pqO+rA4dmC/sLdAmuD79VIU3qy4rmGXtHYR1jALOgaM4xQeHkPwC+EZyvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d0225c44e8so98291295ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223744; x=1739828544;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqQhy0Y5TgYDcezr1M85ge+33MjYrfp7G29IZMuuK4o=;
        b=cezZ4Quqp1r9l//i1Gt8iOxi+DCUWMjsYYSte+NgNwdhkJCsxbqPvYtNXP+LjOin/s
         DeOWQdxbUEqZXiIeZK+Nss8N0h7qB5XSVb2rlXVnsq6JEJFrglkt/zVEz+fWUZc89r3X
         EQaja8oxSRmk5gDfMQ0KNWMaXHZBb5s23owujI+2vKZQp2KMP3tHpgW1SD7NiJjjBr6x
         8QxqzKaXvABKncVz5fvwHzu2UdqlrNF+bPZlsYfa2BbwAS3xLYUvJQdEaLhnnMqEWmHO
         fBoeMUm4YDBSiyXpzyMjQK15a+OYPFNuXaoesI1YXc9RdEMf5mKZIr1+wbgS8oacpwz8
         lllw==
X-Forwarded-Encrypted: i=1; AJvYcCUkdtUYEXJ1lk5CrRD4IkDj8rCIG+wcgScr+ggUnb0evtgMvTPOO2R/rW3LPNSmyFlAqmnh5GNP8n8w33k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo5iLfTuacDdrN4R7jM2U+aUnMq15eGAlZ/MIq0HKXEw1tgwx/
	RK4Mp4NRQwwyjL6sDy1Q4dVSv/9mxcFk1X/iXq1Ckui3YY6cLR41HXgQwZ7ZpJqp5yBoSDSdcrW
	VQVCLWBrPVvGohjJRqOXKJGtHlWdiWksCIw5s0YkF/wKUhzZNs/mXVJ8=
X-Google-Smtp-Source: AGHT+IF/4qbOPnFVF9FI6fwKawHD7t0BOiqv2OpCMB0bJaybSvZMmJzf5ueFPa+4k+L7aSw0dBP8zRZhH7Avosa5X9pA0o6IcVNf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3421:b0:3d0:3851:c3cc with SMTP id
 e9e14a558f8ab-3d13df2249bmr135265685ab.16.1739223743937; Mon, 10 Feb 2025
 13:42:23 -0800 (PST)
Date: Mon, 10 Feb 2025 13:42:23 -0800
In-Reply-To: <675cd64e.050a0220.37aaf.00bb.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67aa72bf.050a0220.110943.0035.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] kernel BUG in new_curseg (2)
From: syzbot <syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    a64dcfb451e2 Linux 6.14-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17297b18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7f246b548ed0635a
dashboard link: https://syzkaller.appspot.com/bug?extid=15669ec8c35ddf6c3d43
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103943f8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12da1bdf980000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-a64dcfb4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6a816640d31b/vmlinux-a64dcfb4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b5cb42ffa4f6/bzImage-a64dcfb4.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/caba9b9b8f24/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=14da1bdf980000)
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/270c3c4c1558/mount_6.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=121672a4580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com

F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Start checkpoint disabled!
F2FS-fs (loop0): Mounted with checkpoint version = 48b305e6
------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:2809!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5304 Comm: syz-executor274 Not tainted 6.14.0-rc2-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:get_new_segment fs/f2fs/segment.c:2809 [inline]
RIP: 0010:new_curseg+0x1f52/0x1f70 fs/f2fs/segment.c:2939
Code: fb fd e9 1a fa ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 4c fa ff ff 48 89 df e8 59 4e fb fd e9 3f fa ff ff e8 5f b5 94 fd 90 <0f> 0b e8 57 b5 94 fd 90 0f 0b e8 4f b5 94 fd 90 0f 0b e8 47 b5 94
RSP: 0018:ffffc9000d0af4a8 EFLAGS: 00010293
RAX: ffffffff842a9a41 RBX: 0000000000000018 RCX: ffff88801ede4880
RDX: 0000000000000000 RSI: 0000000000000018 RDI: 0000000000000018
RBP: dffffc0000000000 R08: ffffffff842a8875 R09: fffff52001a15e84
R10: dffffc0000000000 R11: fffff52001a15e84 R12: 0000000000000018
R13: ffff888043de5101 R14: 0000000000000018 R15: ffff888038298f58
FS:  000055556f014380(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000042a82000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __allocate_new_segment+0x1ce/0x940 fs/f2fs/segment.c:3273
 f2fs_allocate_new_section fs/f2fs/segment.c:3287 [inline]
 f2fs_allocate_pinning_section+0xfa/0x4e0 fs/f2fs/segment.c:3301
 f2fs_expand_inode_data+0x696/0xca0 fs/f2fs/file.c:1849
 f2fs_fallocate+0x537/0xa10 fs/f2fs/file.c:1959
 vfs_fallocate+0x623/0x7a0 fs/open.c:338
 do_vfs_ioctl+0x258c/0x2e40 fs/ioctl.c:885
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x80/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ffbafdefd99
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffecbc98b98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000400000000080 RCX: 00007ffbafdefd99
RDX: 00004000000000c0 RSI: 0000000040305828 RDI: 0000000000000005
RBP: 0030656c69662f2e R08: 000055556f0154c0 R09: 000055556f0154c0
R10: 0000000000000000 R11: 0000000000000246 R12: 00004000000000c0
R13: 00004000000000e0 R14: 00004000000000c2 R15: 00007ffbafe3903b
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:get_new_segment fs/f2fs/segment.c:2809 [inline]
RIP: 0010:new_curseg+0x1f52/0x1f70 fs/f2fs/segment.c:2939
Code: fb fd e9 1a fa ff ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 4c fa ff ff 48 89 df e8 59 4e fb fd e9 3f fa ff ff e8 5f b5 94 fd 90 <0f> 0b e8 57 b5 94 fd 90 0f 0b e8 4f b5 94 fd 90 0f 0b e8 47 b5 94
RSP: 0018:ffffc9000d0af4a8 EFLAGS: 00010293
RAX: ffffffff842a9a41 RBX: 0000000000000018 RCX: ffff88801ede4880
RDX: 0000000000000000 RSI: 0000000000000018 RDI: 0000000000000018
RBP: dffffc0000000000 R08: ffffffff842a8875 R09: fffff52001a15e84
R10: dffffc0000000000 R11: fffff52001a15e84 R12: 0000000000000018
R13: ffff888043de5101 R14: 0000000000000018 R15: ffff888038298f58
FS:  000055556f014380(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000042a82000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
