Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B74B2E1737
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771688; cv=none; b=B797qt/eMsys/DNwSDIeM/wQGiPKLsdOhC6AhEE+0t+/S3AySOKo9UTJir5y2QZajaUw5ZUL8rpAS6DG2f5fBocuPJC1DqyzYpXrJ0glQpvDBBV9VsXLtpM916h2m5wkV7N1md6Y2VVtru/7ltPXkdwKp3jgFhDYu//hD3i0Ay4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771688; c=relaxed/simple;
	bh=uBY7xNQg+tNA03tvbkiMqws3tHpqhv0Lp7Ij1/nnI+M=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=tEa4MKnVzgB+XJ2LzVi3fnnCRjCI8Z3dCAEm7v30F3SvCMs1Lg1I7qnxCMGw5WWtVg0ExcxlXXiwPMC1oWyGOf9W/hCK67hfD53U/KvwPRK+wNGAM01dMHHuGhYxpj2sDVcLWP0rSMHxMhjkb160aakXhk7MHU0kKrW+8oipxIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ddb4a92e80so19494615ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749771686; x=1750376486;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/v3lXQnQAInhUGFEhB4ef/LPPi0XF9azlmNMfdlDeDc=;
        b=Ch3xumAVCkSmzkybTOZmf0G2NjtEy5GOsQswUGE3oZhdPuUnzf2Eyk28kBZdElvSIk
         nfs7GMn351rytbLLaS5tY/+tdHQ1FAHYpxJABpSFYDItkcD7VYQiO0/9qh6RaksVTrZJ
         afhKOFaM0/fDR/y/RxpN/I5HrOG7CGpkFU8aFsYgC1XRFNAz3n9YS2qWuCVAV8Sm0C6T
         ZUzmcy670sofTf4MMutfI2CH63fioHPSKIConMJanE3jDuXhQ4KGLmi1Z16G63SFlSYr
         5TMaROWC+a12NPMvM4QYa/4zTcEcQJ48yl3zMoIS6c3BvCVryaoT8ZZkRAZqc+thvjN4
         /cSw==
X-Forwarded-Encrypted: i=1; AJvYcCXzDuDCG7Emup93uItcqab2vMROE8fUrK2xENDfnmgRiDnfKLP0zujt7alSK7JYRy5x8xskCJhjUwPt1S0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGb4ojz6xOHPDkzjEuuwsUA5dE31XPdJ73YcDCvA6S2lgDGgbX
	9qvm12eZgoIctZueDtbMLJXfBPYazmgvEqYMjiPO0f8WTyEkRK5r0dQGVZozPAVbdo6tAFe29Da
	HopsomytGPs8Y1l66XSPslM1YX5PpmkXsZo6WHfBUmiLeKKv175JqyB8DYEw=
X-Google-Smtp-Source: AGHT+IHNW1jYIesUGOjqdbDQy35MMrSQ++myxvFepafLZ7BQnCBxgqG/kCFgc7gR9FKInPo6fjOE/kP3dpmUBb+Oo/BdaWuvO4Gv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12ee:b0:3dc:8423:5440 with SMTP id
 e9e14a558f8ab-3de00a151f1mr9928625ab.0.1749771686333; Thu, 12 Jun 2025
 16:41:26 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:41:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684b65a6.050a0220.be214.0295.GAE@google.com>
Subject: [syzbot] [atm?] KMSAN: uninit-value in atmtcp_c_send
From: syzbot <syzbot+1d3c235276f62963e93a@syzkaller.appspotmail.com>
To: 3chas3@gmail.com, linux-atm-general@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2c4a1f3fe03e Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1787d9d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=42d51b7b9f9e61d
dashboard link: https://syzkaller.appspot.com/bug?extid=1d3c235276f62963e93a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1195ed70580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16187682580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1313b3ad2bf4/disk-2c4a1f3f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/15f719cfdf88/vmlinux-2c4a1f3f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e7f531b0bef6/bzImage-2c4a1f3f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1d3c235276f62963e93a@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in atmtcp_c_send+0x255/0xed0 drivers/atm/atmtcp.c:294
 atmtcp_c_send+0x255/0xed0 drivers/atm/atmtcp.c:294
 vcc_sendmsg+0xd7c/0xff0 net/atm/common.c:644
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x330/0x3d0 net/socket.c:727
 ____sys_sendmsg+0x7e0/0xd80 net/socket.c:2566
 ___sys_sendmsg+0x271/0x3b0 net/socket.c:2620
 __sys_sendmsg net/socket.c:2652 [inline]
 __do_sys_sendmsg net/socket.c:2657 [inline]
 __se_sys_sendmsg net/socket.c:2655 [inline]
 __x64_sys_sendmsg+0x211/0x3e0 net/socket.c:2655
 x64_sys_call+0x32fb/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:47
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4154 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 kmem_cache_alloc_node_noprof+0x818/0xf00 mm/slub.c:4249
 kmalloc_reserve+0x13c/0x4b0 net/core/skbuff.c:579
 __alloc_skb+0x347/0x7d0 net/core/skbuff.c:670
 alloc_skb include/linux/skbuff.h:1336 [inline]
 vcc_sendmsg+0xb40/0xff0 net/atm/common.c:628
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x330/0x3d0 net/socket.c:727
 ____sys_sendmsg+0x7e0/0xd80 net/socket.c:2566
 ___sys_sendmsg+0x271/0x3b0 net/socket.c:2620
 __sys_sendmsg net/socket.c:2652 [inline]
 __do_sys_sendmsg net/socket.c:2657 [inline]
 __se_sys_sendmsg net/socket.c:2655 [inline]
 __x64_sys_sendmsg+0x211/0x3e0 net/socket.c:2655
 x64_sys_call+0x32fb/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:47
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 1 UID: 0 PID: 5798 Comm: syz-executor192 Not tainted 6.16.0-rc1-syzkaller-00010-g2c4a1f3fe03e #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
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
