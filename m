Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9E91D63D8
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738502905; cv=none; b=P0j67TvdhuxvgN08qWNgRsXyHL1sZRBwl119NUGAyM4zBm9OkDywqFKD6VEJF00zBcvy8CSCeFwtf3ckYKDj+zQgxfuP7ZDz6VptBxuLJoswwXx7YOLMtR4mu3X8QYC0m6jCKTA68MAIczMYmfrIHj26w/XTU7FD8g+MWAfZel8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738502905; c=relaxed/simple;
	bh=kn5l0gneVe0zZ4DXhnKMCH24+iWF9D+5+910z3Zc9k0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ROjKNBeoo5P3z/MDSlAcVLwjYoX7KR1tEe/Or/p/GZZzo4hzP1cp+eyXhqGr7+yHGWav0iK0Sx52g5DogjQ59V5IlGI9GMSvM7mYUxzr2EhpZGXkz7CZIbcdgg6+psjgtVqtCjw/nUWGtLEQxQHhR2b4pgK2l+/3NbME/1Jk1mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ce7a0ec1easo25279145ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 05:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738502903; x=1739107703;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xl0sMhaXbmbPfjz2HyGqC5RKbLWo5pn7Jnp6FlIBrXo=;
        b=QbpcE7apNMD3NdDUP/dJY2ewoseaz/lEExi6lC//IVjT+tLFW70N0dmjONm43v4Vul
         DUdAchYSrBKS8UVDwvQQ88+JbHYv2lL0EmuLj9D258oV6yAu53hFxjCkb9ECv0aDdMRf
         cqllxodFpLdRfSuDSCpBO/kWKToUEKgSakl3k3tkbXGGHjzXq1Ooawwd1pzmUXzkI5G3
         Awkbj6qB1NMNgjKweljRj6/6kHQnH1tDQDe90u+/pM+VPb9Im2gv4paTvsLhhwAjOJXa
         5eWJ5Fhw/UE2nNmwNtb6oemRnoRijH8g+9+mBgw3csUgp9+tJnnENfIStASdEKv2QRBA
         Iybw==
X-Forwarded-Encrypted: i=1; AJvYcCUtcAYNfmilgR6R6z6iysQbqtnFAxaeRdSOM1WOSM2mI/KsFWSUq7bfQ56he6Dk7VHfdTSAHkl69ykAs8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIb2hLcDXSFojUqcpFQQAoJuYJbPaiC7nNk1QwK4PLLdC1q/BM
	yP9Fmw2IIeRR0VcJz57v9CSlhWJfrmioFffWvVNcLFrjgteQ8xvUscOQ+uVhtWEwE6ADHQsLV8v
	YkBsyeVnBYIXNbhsXE9vitXNhwiXaAgLrTddp4TomJMpu8BT82PpMgi8=
X-Google-Smtp-Source: AGHT+IGKHUofiWZx7kOlo+t+3SRSBumGMhohFTD+bwMXwlcEURTikGPPzATSuFsgfUIUfHQhj9VVZZ2woJGgBuRf9p7pFFrzfpEm
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3789:b0:3d0:124d:99e8 with SMTP id
 e9e14a558f8ab-3d0124da53emr81455305ab.13.1738502902902; Sun, 02 Feb 2025
 05:28:22 -0800 (PST)
Date: Sun, 02 Feb 2025 05:28:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679f72f6.050a0220.48cbc.000d.GAE@google.com>
Subject: [syzbot] [fs?] KMSAN: uninit-value in full_proxy_unlocked_ioctl
From: syzbot <syzbot+8928e473a91452caca2f@syzkaller.appspotmail.com>
To: dakr@kernel.org, gregkh@linuxfoundation.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b4b0881156fb Merge tag 'docs-6.14-2' of git://git.lwn.net/..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12a04518580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d0bb5e08cf54aa2
dashboard link: https://syzkaller.appspot.com/bug?extid=8928e473a91452caca2f
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=150776b0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16aaab64580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4dbe3cd3dcb8/disk-b4b08811.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/592d90859f86/vmlinux-b4b08811.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4cfde2b63c7f/bzImage-b4b08811.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8928e473a91452caca2f@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in full_proxy_unlocked_ioctl+0xed/0x3a0 fs/debugfs/file.c:399
 full_proxy_unlocked_ioctl+0xed/0x3a0 fs/debugfs/file.c:399
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0x246/0x440 fs/ioctl.c:892
 __x64_sys_ioctl+0x96/0xe0 fs/ioctl.c:892
 x64_sys_call+0x19f0/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:17
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 __debugfs_file_get+0xe59/0xef0 fs/debugfs/file.c:120
 full_proxy_open_regular+0x67/0xa00 fs/debugfs/file.c:447
 do_dentry_open+0x1bdd/0x26b0 fs/open.c:955
 vfs_open+0x53/0x5b0 fs/open.c:1085
 do_open fs/namei.c:3830 [inline]
 path_openat+0x56a1/0x6250 fs/namei.c:3989
 do_filp_open+0x268/0x600 fs/namei.c:4016
 do_sys_openat2+0x1bf/0x2f0 fs/open.c:1427
 do_sys_open fs/open.c:1442 [inline]
 __do_sys_openat fs/open.c:1458 [inline]
 __se_sys_openat fs/open.c:1453 [inline]
 __x64_sys_openat+0x2a1/0x310 fs/open.c:1453
 x64_sys_call+0x36f5/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:258
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 __debugfs_file_get+0xdff/0xef0 fs/debugfs/file.c:118
 full_proxy_open_regular+0x67/0xa00 fs/debugfs/file.c:447
 do_dentry_open+0x1bdd/0x26b0 fs/open.c:955
 vfs_open+0x53/0x5b0 fs/open.c:1085
 do_open fs/namei.c:3830 [inline]
 path_openat+0x56a1/0x6250 fs/namei.c:3989
 do_filp_open+0x268/0x600 fs/namei.c:4016
 do_sys_openat2+0x1bf/0x2f0 fs/open.c:1427
 do_sys_open fs/open.c:1442 [inline]
 __do_sys_openat fs/open.c:1458 [inline]
 __se_sys_openat fs/open.c:1453 [inline]
 __x64_sys_openat+0x2a1/0x310 fs/open.c:1453
 x64_sys_call+0x36f5/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:258
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4121 [inline]
 slab_alloc_node mm/slub.c:4164 [inline]
 __kmalloc_cache_noprof+0x8e3/0xdf0 mm/slub.c:4320
 kmalloc_noprof include/linux/slab.h:901 [inline]
 __debugfs_file_get+0x31d/0xef0 fs/debugfs/file.c:101
 full_proxy_open_regular+0x67/0xa00 fs/debugfs/file.c:447
 do_dentry_open+0x1bdd/0x26b0 fs/open.c:955
 vfs_open+0x53/0x5b0 fs/open.c:1085
 do_open fs/namei.c:3830 [inline]
 path_openat+0x56a1/0x6250 fs/namei.c:3989
 do_filp_open+0x268/0x600 fs/namei.c:4016
 do_sys_openat2+0x1bf/0x2f0 fs/open.c:1427
 do_sys_open fs/open.c:1442 [inline]
 __do_sys_openat fs/open.c:1458 [inline]
 __se_sys_openat fs/open.c:1453 [inline]
 __x64_sys_openat+0x2a1/0x310 fs/open.c:1453
 x64_sys_call+0x36f5/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:258
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 1 UID: 0 PID: 5781 Comm: syz-executor325 Not tainted 6.13.0-syzkaller-09585-gb4b0881156fb #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
