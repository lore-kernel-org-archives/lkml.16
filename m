Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBE74414
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 01:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738546858; cv=none; b=pEaVEFDWcanIbCWGn/z0x7DrYeYbnxY1PtOj98rll2DyG0gAOqSrTgx7h/r8ATs6nTbObjDYJMu+nUKrwvCyWBxZ6zzg3GrMCT+tkpKL8muzpQFS9VwbPnR5Rd/fxy+D4nGCUtQaMzL0qtvOqhvUYQfUiVLbD46BMdBe9pI2u2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738546858; c=relaxed/simple;
	bh=aJBFzAODxzcciGo776/0jsszI9MAswddRduaqx+oiIE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NkbGVDWSURdjr6F5gox/Bs32dxQ3EnIhET+UjzdfsKxWrg7C1h1ElmvrzW5B4F1+8Abzy41aTgJiOgo4uRasT0chLmqrptfK59dFxbiBsjBhQVryujry/4CAPbdno/Kcfgz9T+Ca4MIyHUWpoTCpPi1AsuHAjdNzLTKaoyhyxuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3cde3591dbfso23892865ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 17:40:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738546856; x=1739151656;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lYv5TEQyj8f/kzxVZqoOCkeZ8BGv/gcv0nR/mKYS8k0=;
        b=davmp55WWW7rwixYDY67ezLzL3Cj67GEw8wGlXb71UKgQamfqATvSJC2bP6rr/Qqfb
         PzdeiY+bEELEhcQZ+3uTnJT4gf53lKWYRVW4kQQQI7XtoL617hZ0+mWJUIzpF46F0Ilb
         EIHy58Cke4G8IPhCples/TFxSQPaMjVJ2bLlrc0TE/cdVBljjIXp9bOrFOWpcuBSNX3S
         Olq+h9BBcu9YU2R1624bJZnYmklRNc9UOBw5KyB7UPBr4KuuIcSwrJly8ZJWR+dxVwm/
         fxgI03LKb9m0x5lBdmQJ9Vv6D432IvCt9KT9lthsTXJ1g05l3WEVfxHk2tEKEpKn+5LK
         J+GQ==
X-Gm-Message-State: AOJu0YwWTtKKdgke5L+0jujC87uiUA/d3tQRPIrCGeOg4xoLOZTljBE9
	wRtsTZK6UrzKckb0BhkdLQ9/vcSrudjgjxRKRhQjC26gfBg/i7kXILtLiUBDQ7Q3YPeoD+bQRdE
	74aF0QHv/A7mpeMarZUkJeFZFhFadFq1trdQjDh1aLqtQafvDNKhMNch3qw==
X-Google-Smtp-Source: AGHT+IEEMSE6NUXdcYi7yzgciLOasY5FfCLdCRWueukPKt+9Vk/ofjpmrZLA3FTeMoUv+Fp45hYcTml0D8XQyWe39FEC42Vaapul
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:152d:b0:3cf:fd62:e39c with SMTP id
 e9e14a558f8ab-3d008eea445mr124152175ab.5.1738546856064; Sun, 02 Feb 2025
 17:40:56 -0800 (PST)
Date: Sun, 02 Feb 2025 17:40:56 -0800
In-Reply-To: <67a01871.050a0220.d7c5a.007b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a01ea8.050a0220.d7c5a.007c.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [fs?] KMSAN: uninit-value in full_proxy_poll
From: syzbot <syzbot+a84ce0b8e1f3da037bf7@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [fs?] KMSAN: uninit-value in full_proxy_poll
Author: charmitro@posteo.net


On 3/2/25 3:14 AM, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    b4b0881156fb Merge tag 'docs-6.14-2' of git://git.lwn.net/..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=146c5ddf980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7d0bb5e08cf54aa2
> dashboard link: https://syzkaller.appspot.com/bug?extid=a84ce0b8e1f3da037bf7
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10cb8518580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=122a0b24580000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/4dbe3cd3dcb8/disk-b4b08811.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/592d90859f86/vmlinux-b4b08811.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/4cfde2b63c7f/bzImage-b4b08811.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+a84ce0b8e1f3da037bf7@syzkaller.appspotmail.com
>
> =====================================================
> BUG: KMSAN: uninit-value in full_proxy_poll+0xdf/0x3b0 fs/debugfs/file.c:411
>   full_proxy_poll+0xdf/0x3b0 fs/debugfs/file.c:411
>   vfs_poll include/linux/poll.h:82 [inline]
>   ep_item_poll fs/eventpoll.c:1060 [inline]
>   ep_insert+0x19c7/0x2740 fs/eventpoll.c:1736
>   do_epoll_ctl+0xd83/0x17f0 fs/eventpoll.c:2394
>   __do_sys_epoll_ctl fs/eventpoll.c:2445 [inline]
>   __se_sys_epoll_ctl fs/eventpoll.c:2436 [inline]
>   __x64_sys_epoll_ctl+0x1b5/0x210 fs/eventpoll.c:2436
>   x64_sys_call+0x1658/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:234
>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>   do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Uninit was stored to memory at:
>   __debugfs_file_get+0xe86/0xef0 fs/debugfs/file.c:122
>   full_proxy_open_regular+0x67/0xa00 fs/debugfs/file.c:447
>   do_dentry_open+0x1bdd/0x26b0 fs/open.c:955
>   vfs_open+0x53/0x5b0 fs/open.c:1085
>   do_open fs/namei.c:3830 [inline]
>   path_openat+0x56a1/0x6250 fs/namei.c:3989
>   do_filp_open+0x268/0x600 fs/namei.c:4016
>   do_sys_openat2+0x1bf/0x2f0 fs/open.c:1427
>   do_sys_open fs/open.c:1442 [inline]
>   __do_sys_openat fs/open.c:1458 [inline]
>   __se_sys_openat fs/open.c:1453 [inline]
>   __x64_sys_openat+0x2a1/0x310 fs/open.c:1453
>   x64_sys_call+0x36f5/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:258
>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>   do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Uninit was stored to memory at:
>   __debugfs_file_get+0xe59/0xef0 fs/debugfs/file.c:120
>   full_proxy_open_regular+0x67/0xa00 fs/debugfs/file.c:447
>   do_dentry_open+0x1bdd/0x26b0 fs/open.c:955
>   vfs_open+0x53/0x5b0 fs/open.c:1085
>   do_open fs/namei.c:3830 [inline]
>   path_openat+0x56a1/0x6250 fs/namei.c:3989
>   do_filp_open+0x268/0x600 fs/namei.c:4016
>   do_sys_openat2+0x1bf/0x2f0 fs/open.c:1427
>   do_sys_open fs/open.c:1442 [inline]
>   __do_sys_openat fs/open.c:1458 [inline]
>   __se_sys_openat fs/open.c:1453 [inline]
>   __x64_sys_openat+0x2a1/0x310 fs/open.c:1453
>   x64_sys_call+0x36f5/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:258
>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>   do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Uninit was stored to memory at:
>   __debugfs_file_get+0xdff/0xef0 fs/debugfs/file.c:118
>   full_proxy_open_regular+0x67/0xa00 fs/debugfs/file.c:447
>   do_dentry_open+0x1bdd/0x26b0 fs/open.c:955
>   vfs_open+0x53/0x5b0 fs/open.c:1085
>   do_open fs/namei.c:3830 [inline]
>   path_openat+0x56a1/0x6250 fs/namei.c:3989
>   do_filp_open+0x268/0x600 fs/namei.c:4016
>   do_sys_openat2+0x1bf/0x2f0 fs/open.c:1427
>   do_sys_open fs/open.c:1442 [inline]
>   __do_sys_openat fs/open.c:1458 [inline]
>   __se_sys_openat fs/open.c:1453 [inline]
>   __x64_sys_openat+0x2a1/0x310 fs/open.c:1453
>   x64_sys_call+0x36f5/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:258
>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>   do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Uninit was created at:
>   slab_post_alloc_hook mm/slub.c:4121 [inline]
>   slab_alloc_node mm/slub.c:4164 [inline]
>   __kmalloc_cache_noprof+0x8e3/0xdf0 mm/slub.c:4320
>   kmalloc_noprof include/linux/slab.h:901 [inline]
>   __debugfs_file_get+0x31d/0xef0 fs/debugfs/file.c:101
>   full_proxy_open_regular+0x67/0xa00 fs/debugfs/file.c:447
>   do_dentry_open+0x1bdd/0x26b0 fs/open.c:955
>   vfs_open+0x53/0x5b0 fs/open.c:1085
>   do_open fs/namei.c:3830 [inline]
>   path_openat+0x56a1/0x6250 fs/namei.c:3989
>   do_filp_open+0x268/0x600 fs/namei.c:4016
>   do_sys_openat2+0x1bf/0x2f0 fs/open.c:1427
>   do_sys_open fs/open.c:1442 [inline]
>   __do_sys_openat fs/open.c:1458 [inline]
>   __se_sys_openat fs/open.c:1453 [inline]
>   __x64_sys_openat+0x2a1/0x310 fs/open.c:1453
>   x64_sys_call+0x36f5/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:258
>   do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>   do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> CPU: 0 UID: 0 PID: 5778 Comm: syz-executor303 Not tainted 6.13.0-syzkaller-09585-gb4b0881156fb #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
> =====================================================
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
#syz test: 
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
57b314752ec0ad42685bc78b376326f1f4c04669
