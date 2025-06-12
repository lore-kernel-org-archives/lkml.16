Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B23E2036EC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713826; cv=none; b=GX0DJNusG/1dpvdRYr4C8cMJBX6t5vfpvFgtXeEocZ3oMFmo3t/+0xMvFVaYERqsOgR+xvQzd+5PsRBk91OqCY4+EwsIizeZyIb1pXoWvCmlCeo0CQGSnUma1dZSpNx2nG4k2Ranvz6jHe3oePXnCfxP7J9+NO3d8u+syPuqqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713826; c=relaxed/simple;
	bh=KBn+MeQXFoE2AML8UxtcE3n9z866MyK7/9UveNtFzm4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JVC2vV+CQOuSPIEpPgmVfJJlkWbP87aFREl2SJhnVLyb1zYrTCESJKltQsGJI7ieHvoUIfkhJmwCBjNKK+F/AB3hO4EdGjQZdQK+3zj8VT6E27Y8wZT/caGJgI1MwlWtV0gYtjrxEZFsMgxDzdofD6msupHG6EExV/gp0RxWSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddcc7e8266so17623685ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749713823; x=1750318623;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aatQYN0QixykDIqcNbepmcOIFrIXybGJrPQWZA4St8M=;
        b=q/UbMNdSmyhdGed57Y8XThG+KWlGztZpfqwr22021ExazBwskDKZylNiGsy90H0ld5
         bukJKlYE/yimx83g1IdtPgjPeFwS46nannN4Pp4rw5ORHJvHzNJ8dVs4p85kVKZH5uLq
         uYgMJMjXjfhrzay/BfphqTJi8nQyGVSxZ2jOs/XxjOGT32H+io/k9jCNcUsvGP6CfIma
         I5LgXfp872ZgvBR0SNVjEw9laHUfrheBz9yJ8Mi7C8hHTbmai+iUXE2dxDbX1PNq2lwR
         26R8eIsIzBvRlf51yh0ZRGxVbAtnJpU/tzvSr4r4Wjn5SE9Ft/XdEthewTANWvWldV+0
         StZA==
X-Gm-Message-State: AOJu0Ywpt71rCkQ3djjQ1mR7CXKyTlBOLRKZAXmkiLGLFEDpnanBYJfL
	zChEKX5jGqIawxa44QuL+j8Tppy33BaK620IgtIopTWzIU+i+3xuBMEHlXsGES4YIMUpd08Yx7a
	XGD47ODMfaul18hEzfmI4iRGgLT1Zda5EK8UUDKWNkOsTkipH4z60pJ6wjVQ=
X-Google-Smtp-Source: AGHT+IEgnThMoLQG6Te+tUzIECh3rC+RueX1hXJY1GQBMiKGAIN7ciwE75vC2T+BlddSEbFGt2xMZd0MGNkc0kpMrL6YR8lcRopK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1687:b0:3d4:2ea4:6b87 with SMTP id
 e9e14a558f8ab-3ddfadf0f80mr25935485ab.11.1749713823504; Thu, 12 Jun 2025
 00:37:03 -0700 (PDT)
Date: Thu, 12 Jun 2025 00:37:03 -0700
In-Reply-To: <20250612071417.2222649-1-lizhi.xu@windriver.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684a839f.050a0220.be214.028c.GAE@google.com>
Subject: Re: [syzbot] [overlayfs?] WARNING in ovl_listxattr
From: syzbot <syzbot+4125590f2a9f5b3cdf43@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, lizhi.xu@windriver.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in ovl_listxattr

WARNING: The mand mount option has been deprecated and
         and is ignored by this kernel. Remove the mand
         option from the mount to silence this warning.
=======================================================
buf: system.posix_acl_access, size: 182, res: 17, ovl_listxattr
s: system.posix_acl_access, len: 17, slen: 18, ovl_listxattr
------------[ cut here ]------------
WARNING: CPU: 1 PID: 6633 at fs/overlayfs/xattrs.c:138 ovl_listxattr+0x3db/0x430 fs/overlayfs/xattrs.c:138
Modules linked in:
CPU: 1 UID: 0 PID: 6633 Comm: syz.0.16 Not tainted 6.16.0-rc1-syzkaller-g2c4a1f3fe03e-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:ovl_listxattr+0x3db/0x430 fs/overlayfs/xattrs.c:138
Code: 05 f2 fe e9 47 ff ff ff e8 02 b9 90 fe 4c 89 f8 48 83 c4 10 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc cc e8 e6 b8 90 fe 90 <0f> 0b 90 49 c7 c7 fb ff ff ff eb d7 e8 d4 b8 90 fe 90 0f 0b 90 e9
RSP: 0018:ffffc900033a7d98 EFLAGS: 00010293
RAX: ffffffff832f950a RBX: ffff888077ba4200 RCX: ffff88802d620000
RDX: 0000000000000000 RSI: 0000000000000011 RDI: 0000000000000012
RBP: ffff88802a27de01 R08: ffffc900033a7ac7 R09: 1ffff92000674f58
R10: dffffc0000000000 R11: fffff52000674f59 R12: ffffffffffffffff
R13: 0000000000000012 R14: ffff8880787a3c88 R15: 0000000000000011
FS:  00007f48fba146c0(0000) GS:ffff888125d86000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000001000 CR3: 000000007c3f0000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 vfs_listxattr fs/xattr.c:493 [inline]
 listxattr+0x10a/0x2a0 fs/xattr.c:924
 filename_listxattr fs/xattr.c:958 [inline]
 path_listxattrat+0x179/0x3a0 fs/xattr.c:988
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f48fab8e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f48fba14038 EFLAGS: 00000246 ORIG_RAX: 00000000000000c3
RAX: ffffffffffffffda RBX: 00007f48fadb5fa0 RCX: 00007f48fab8e969
RDX: 00000000000000b6 RSI: 0000200000000200 RDI: 00002000000001c0
RBP: 00007f48fac10ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f48fadb5fa0 R15: 00007ffea266aa98
 </TASK>


Tested on:

commit:         2c4a1f3f Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15676e0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
dashboard link: https://syzkaller.appspot.com/bug?extid=4125590f2a9f5b3cdf43
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=117b6e0c580000

