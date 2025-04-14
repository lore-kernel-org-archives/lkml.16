Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A7A1C84BB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625792; cv=none; b=kSVIF8fFe5w76n8oF0QFf+PzisPCZL/v9bnVg3nkkpm10Pd/eoKh2StGK+K+9ngsBrkGwth2QORaG5C3cJ6Krv3D44+czu1P2uFW6rcxThM63fDJyCNDhzyNIhMisybhOf5DAKDYrKEWkYnXSipbAzadFRCoWadWgLUtAqeoEi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625792; c=relaxed/simple;
	bh=ekCZbBCos0S4Puu581P14EFgtTwWWhyh9SvLVtgvp1I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bitwvysBHcXTgkCNwa5AP2o9aRRMJL8zMiM7tUQFnG8OHsQLTyQcvJx3s5jG/Bj8dJ2Ofwodrtik5uRPIFSozyb9X1L2fteqpW2ggni2ER+IhL725o0IarZyPUNuFLgovveyi5UeMzpMu0kT7VT1YOvs5zZxds2fMh8UJyjdquU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d438be189bso37252165ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625789; x=1745230589;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmYDgpn0/9Z8AFIpfjgX1QLlrbCO0Q5CPYFxV/DJ7mE=;
        b=V+w0laNUW3gy/1y2lS/OhSLtDTU9kvfTR+Z1XvS2d/zcDwMhGD+RqJH0HIo3tfCZjw
         7YwexXSxI7Tks/SwVIQrR4q0ZlDWPxXpjwzYZ0wHLnXdEkMhASv1qTK3U4P5hjfazDYA
         5jyFMuY72Bwhk/1lej5VBeCO1nsSvfQmpGbWAvpR1XcZmWLvjtRZ2G1CMLKuqcs3zPwh
         6Z5xVlOkVMo7E+Pr9fmyvREpqFuJRVDA5rgvTlB0z9FZBSI94v3BzNf64nC0Iz8Rh/Z5
         7sjOAHXduo2bB+bv9wgT505kCrWy9WzG09x36GKM2zCX+1ccbs+x2Gvp+E5fMEAvtHbJ
         6dVw==
X-Forwarded-Encrypted: i=1; AJvYcCX6kAkBArpvnFdQvgaILFb5fW5z54PtagsMFFBV8wxfMl8j+mklyqNTY1aZNGrUh5AkToe1FswjAWYUfeg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDN0DH1I6YnsknHZ2yzNB0nmfyd/BvJXzGbWbFGKKZjsmqLSXX
	udlRa0uCxMRhb5+fIg1nSK5v/c9RaTfqwKav3LCJvYeI1vImekZH/GXN4qpcIV1bTN+DboNINnI
	zKvXZrOO+QbRNpOug5z/fxLxy99bJIJQzkGd4AeOMRrCSkKVUYwkD+JA=
X-Google-Smtp-Source: AGHT+IEKncKMpvOAJujFDMTYAE0QLqvzTwv2Kfq+arFgnX1L3ZLUBdopA0CLq9aMMnfKiOyLKd05SMgtnjmqKNxUOSSMeR7XZjbm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:190f:b0:3d4:3eed:2755 with SMTP id
 e9e14a558f8ab-3d7ec225f65mr125717715ab.12.1744625789522; Mon, 14 Apr 2025
 03:16:29 -0700 (PDT)
Date: Mon, 14 Apr 2025 03:16:29 -0700
In-Reply-To: <67eaa161.050a0220.3c3d88.0043.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67fce07d.050a0220.3483fc.0023.GAE@google.com>
Subject: Re: [syzbot] [hfs?] KMSAN: uninit-value in hfs_bnode_dump
From: syzbot <syzbot+efd267470a41bc34bd98@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    8ffd015db85f Linux 6.15-rc2
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=105820cc580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e30b69a28cc940e1
dashboard link: https://syzkaller.appspot.com/bug?extid=efd267470a41bc34bd98
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=107c0470580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=158a6a3f980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b099795f8c63/disk-8ffd015d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a10b15dc31a5/vmlinux-8ffd015d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/24a20f2e33c6/bzImage-8ffd015d.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/c80aacb02924/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+efd267470a41bc34bd98@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in hfs_bnode_read_u8 fs/hfs/bnode.c:54 [inline]
BUG: KMSAN: uninit-value in hfs_bnode_dump+0x30e/0x4c0 fs/hfs/bnode.c:172
 hfs_bnode_read_u8 fs/hfs/bnode.c:54 [inline]
 hfs_bnode_dump+0x30e/0x4c0 fs/hfs/bnode.c:172
 hfs_brec_remove+0x868/0x9a0 fs/hfs/brec.c:225
 hfs_cat_move+0xfc9/0x12e0 fs/hfs/catalog.c:364
 hfs_rename+0x344/0x500 fs/hfs/dir.c:299
 vfs_rename+0x1d9d/0x2280 fs/namei.c:5086
 do_renameat2+0x1577/0x1b80 fs/namei.c:5235
 __do_sys_rename fs/namei.c:5282 [inline]
 __se_sys_rename fs/namei.c:5280 [inline]
 __x64_sys_rename+0xe8/0x140 fs/namei.c:5280
 x64_sys_call+0x3a1e/0x3c80 arch/x86/include/generated/asm/syscalls_64.h:83
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable data.i created at:
 hfs_bnode_read_u16 fs/hfs/bnode.c:-1 [inline]
 hfs_bnode_dump+0x3c5/0x4c0 fs/hfs/bnode.c:156
 hfs_brec_remove+0x868/0x9a0 fs/hfs/brec.c:225

CPU: 0 UID: 0 PID: 5792 Comm: syz-executor395 Not tainted 6.15.0-rc2-syzkaller #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
=====================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
