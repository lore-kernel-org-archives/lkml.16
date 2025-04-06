Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDDE946F
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 03:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743910649; cv=none; b=JBALwmDIcvLRdGTHA7Fcr+zjWNF0Z/geu35b2HbbD+Vt8rJXMSiyTAJvtTrJwQyplEvgkWR8aUkSNXld0AMDCiePDjOH6xGFxENsx5B3g0C7SmyqTZjreu2TB5xI/9f9s3/ZTY5Ywd5q5HWKNAk8DsFNt1tfFMysQKqQrbYZG/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743910649; c=relaxed/simple;
	bh=g5IzFTUnKR5UvoGu+V+sxDXvaLE7NcYOz50+qQ4B7C4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Q955HJqlgAF5wHxT0RouNRnDAulgqcC+Kq7XR4TwillgoytJQHS0ITan2uePp4LUzWVEAyKj97UZemO6Ewj4az1wEO5JDamIDGVx+8e6SxAZihOhAO7aiHlMtUyXlm6ePZuEYGrsJkCOR1cUTsvNLyyk8FlFw5Z0CIEB8LVqBm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d5b38276deso58618365ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 20:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743910646; x=1744515446;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E0odGEKAx756n1dt05eWXNWz4yifqqgUVnuGuaxDaPI=;
        b=P1OFuyZ5RNa2oPPkqgANYLx/Fj4MbjYfjGPpYcNZsgw/YKlPcqkYJimM92UFyPVDea
         uCkCYbBlJhpBfC9FuHaugTQtTRqqP21lCnU0EshMx/KTq7Et1niWwW7OBgY85lN01peA
         L7msi1qO5BwbLLcnf/57bVElY1oKLe778iVdps5AkxAq/abu2+CFQvrw2YUkS9Ijip6S
         Mshnm0u7FSLKpgt1r0fMWCXQOVVjW06IDxXsbd+5D3QepsJpFSpneGKnz7lRMYOrEM5C
         bp3yXbsiMJOE8f2wBuxKkNEg3SqmodpPunGqHO4JttOMWx5qOvS6ACpScu4lGaT/pfqK
         dfLw==
X-Gm-Message-State: AOJu0YwCbCoPmXRz/xw3X0hWCyGk3GE91PIowQF7dvuFVDemHsr/DP4Y
	SDivzbgILky+jRynqNSh/ACnUXmLH2wx9o9Ln1O4K7bdwRHNt4rO0qd1IkQYs8DuLU8XOF06KD+
	DMPJ6Tlcr7QSuuoV0VyViuykHuh6Bn+hpAF2T6KCC0tlDd8jhrlZm44Rsow==
X-Google-Smtp-Source: AGHT+IFCm9Nfrrm/BxqmD1EqWneUyqOqBfbOJB4Q+fMoNVX/rHNwLEKGZx/eyLboaQeFDapryl9We+rczx7azy8jKxXB3vZPg33V
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3089:b0:3d1:7835:1031 with SMTP id
 e9e14a558f8ab-3d6e53181dfmr95521865ab.7.1743910646552; Sat, 05 Apr 2025
 20:37:26 -0700 (PDT)
Date: Sat, 05 Apr 2025 20:37:26 -0700
In-Reply-To: <67f0dd7a.050a0220.0a13.0230.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f1f6f6.050a0220.0a13.025a.GAE@google.com>
Subject: Re: [syzbot] [squashfs?] UBSAN: shift-out-of-bounds in squashfs_bio_read
From: syzbot <syzbot+65761fc25a137b9c8c6e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, phillip@squashfs.org.uk, 
	squashfs-devel-owner@lists.sourceforge.net, 
	squashfs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    56f944529ec2 Merge tag 'input-for-v6.15-rc0' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=167eab4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f2054704dd53fb80
dashboard link: https://syzkaller.appspot.com/bug?extid=65761fc25a137b9c8c6e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1775dd98580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=113787e4580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-56f94452.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c6da83e5191b/vmlinux-56f94452.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5c060438ea13/bzImage-56f94452.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f9d150e929ed/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+65761fc25a137b9c8c6e@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 8
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in fs/squashfs/block.c:195:36
shift exponent 64 is too large for 64-bit type 'u64' (aka 'unsigned long long')
CPU: 0 UID: 0 PID: 5472 Comm: syz-executor224 Not tainted 6.14.0-syzkaller-13443-g56f944529ec2 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_shift_out_of_bounds+0x3c8/0x420 lib/ubsan.c:492
 squashfs_bio_read+0xf7e/0x10b0 fs/squashfs/block.c:195
 squashfs_read_data+0x2e7/0xba0 fs/squashfs/block.c:333
 squashfs_read_table+0x338/0x390 fs/squashfs/cache.c:436
 squashfs_fill_super+0x238/0x21e0 fs/squashfs/super.c:216
 get_tree_bdev_flags+0x490/0x5c0 fs/super.c:1636
 vfs_get_tree+0x90/0x2b0 fs/super.c:1759
 do_new_mount+0x2cf/0xb70 fs/namespace.c:3879
 do_mount fs/namespace.c:4219 [inline]
 __do_sys_mount fs/namespace.c:4430 [inline]
 __se_sys_mount+0x38c/0x400 fs/namespace.c:4407
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbefca8001a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 5e 04 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcb4b512c8 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffcb4b512e0 RCX: 00007fbefca8001a
RDX: 0000200000000240 RSI: 0000200000000280 RDI: 00007ffcb4b512e0
RBP: 0000200000000280 R08: 00007ffcb4b51320 R09: 0000000000000220
R10: 0000000000000000 R11: 0000000000000282 R12: 0000200000000240
R13: 00007ffcb4b51320 R14: 0000000000000003 R15: 0000000000000000
 </TASK>
---[ end trace ]---


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
