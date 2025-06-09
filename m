Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163E02940D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 22:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749507212; cv=none; b=S4s3P6YCiZ5+Vlv3PVnuHfli/woz8ghHiK86Vd7WhCbq1LL1cnyEFJkQM1cKkQT954tstI3/n8OUuOtV3AKquFz+Z5eVx4+HAnSVenv3iJqo+iy8HD41ZAkgkMgNTupjMS3XiA5RT8aC2zOHEpHRwdRmWjwW2aBjAMomaq0Jc70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749507212; c=relaxed/simple;
	bh=ytlzuee4rDPuIGa2UVQR03yMdxLBLr8xbkyynu7GXts=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CkZr6QTnvj/GOP4woFMF/bGf0OJLhVs1HWKDVWxADSnLlq+aU+ZKE8ZCwEmw2AuiQJB6I7eV6upL78HgHkfRzhRsfKhQ18iw6z5MA94e6JJceTcZVA4dVeQT/xPZIyMhrQ/PKwArJe/dRV7SCo1+n985Hq5cM2/FujYuNxqY+cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ddd03db21cso60262845ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749507210; x=1750112010;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/Tb61AbMmp8Nwd6jGDkvTOW8acnUsz+vTcdcrETAb4=;
        b=YzHkllMI5tY0U6xBxFoF/JQFug9Bb73rzYci34LibkeWHS/yqI4IqJv+OybAyU1Q2/
         IEZx1IlVemeb5XxMEPakGqfWf/cHXoR8MAY/8h9JZjvNrE0SeGFUNuezOLXb5vMSb7c9
         LlNIXoAQECh7x1VKo+glSI8pWMkxF1Vf5wy4gEFCx7wrvGE5h8SJJxPpfswG/FZb4Im/
         fNmKS4TbqvXu7oC6miNblhJQtsrb5N8EGoBjYruZh+3DfGkRcnbCPN5iTVQpfmIvFYnp
         jo3W3uUCKwju2YNZQm5PcM3HNkTb2isGJO8hiZsJ/cjjV9rXuLKA7ASXe7AraKcJxqjq
         2Jug==
X-Forwarded-Encrypted: i=1; AJvYcCX4Ma3xA36xkTwN2ScXBj+2e+1Ro4FgHI9yXQHoh6S7TziDdljPaklXXNUwt8C4j4wqsjGCX9QqtbdinHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXm4mXV6y+tto4uL+LPJCmPyTsT5K8x1YTB404bsld7mfvNfJS
	thR5PjIa3Do1ZBSaBt79wload48mV+X5z2cCTugMxR4oaozWQo90ty51X4qc3/JTugQ1jJudswZ
	7TphGged9r7YMuHhf1jQJUhJU8bYo2y+xVvhwQh61nPtET0L+pge3XOAa0X8=
X-Google-Smtp-Source: AGHT+IHGbYG+mMUIc+tIpOdTlUQvzscipVLqGzBw/vwownm3QvniRhEefneb43kYEX7L2frjYNAzmuq14YjboQBkM8BosPsQdc8F
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:318e:b0:3dd:bb64:d850 with SMTP id
 e9e14a558f8ab-3ddeddc6565mr2822385ab.11.1749507210210; Mon, 09 Jun 2025
 15:13:30 -0700 (PDT)
Date: Mon, 09 Jun 2025 15:13:30 -0700
In-Reply-To: <68122507.050a0220.3a872c.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68475c8a.050a0220.33aa0e.02e4.GAE@google.com>
Subject: Re: [syzbot] [jfs?] UBSAN: shift-out-of-bounds in jfs_statfs (3)
From: syzbot <syzbot+13ba7f3e9a17f77250fe@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    475c850a7fdd Add linux-next specific files for 20250606
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=11fe2a82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=28859360c84ac63d
dashboard link: https://syzkaller.appspot.com/bug?extid=13ba7f3e9a17f77250fe
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11c79a0c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=162aa9d4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2f1cf8485b7a/disk-475c850a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/976adb9f739e/vmlinux-475c850a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0ac20b1308b7/bzImage-475c850a.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/fad6178a795b/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=122aa9d4580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+13ba7f3e9a17f77250fe@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 32768
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in fs/jfs/super.c:140:14
shift exponent 115 is too large for 64-bit type 's64' (aka 'long long')
CPU: 1 UID: 0 PID: 5841 Comm: syz-executor190 Not tainted 6.15.0-next-20250606-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x40 lib/ubsan.c:233
 __ubsan_handle_shift_out_of_bounds+0x386/0x410 lib/ubsan.c:494
 jfs_statfs+0x4d1/0x550 fs/jfs/super.c:140
 statfs_by_dentry fs/statfs.c:66 [inline]
 vfs_statfs+0x144/0x2d0 fs/statfs.c:90
 ovl_check_namelen fs/overlayfs/super.c:388 [inline]
 ovl_lower_dir fs/overlayfs/super.c:404 [inline]
 ovl_get_lowerstack fs/overlayfs/super.c:1150 [inline]
 ovl_fill_super+0x9d9/0x35d0 fs/overlayfs/super.c:1416
 vfs_get_super fs/super.c:1323 [inline]
 get_tree_nodev+0xbb/0x150 fs/super.c:1342
 vfs_get_tree+0x8f/0x2b0 fs/super.c:1802
 do_new_mount+0x24a/0xa40 fs/namespace.c:3874
 do_mount fs/namespace.c:4211 [inline]
 __do_sys_mount fs/namespace.c:4422 [inline]
 __se_sys_mount+0x317/0x410 fs/namespace.c:4399
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8347037a39
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdd0158b28 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000200000000000 RCX: 00007f8347037a39
RDX: 0000200000000000 RSI: 0000200000000140 RDI: 0000000000000000
RBP: 00007f834708005e R08: 00002000000003c0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0030656c69662f2e
R13: 65756e69746e6f63 R14: 633d73726f727265 R15: 0000000000000001
 </TASK>
---[ end trace ]---


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
