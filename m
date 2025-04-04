Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45892E62B4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743751826; cv=none; b=flgIk3nwnxdOHV+rRhNi1mjx2EyOQiUpo3bFI8STrUJa0rSkk7/T71Zfkvb1NI6R84BAYV0ItETaPJ1VP8EcmwIDgpVybh4pdV56O7YvC3HhfHILa5JiZII1La84SeTwaQMeP75KsDws1gSWTUQ03RpSx6XpinPiaffze1z6W4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743751826; c=relaxed/simple;
	bh=t4PZRH7CoAePnxy7rgxp5zyxiJV7h46qjHHO4drjfqM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=uLPu0VrKePu23k4UUEvZK7xaoED6wj+LABvoC6zc8d3SczfYv3R+g1baWZWJAdZ3g/R+B8Uubac3H83miqTVqkc2AhgOlRtk1GGuAsviWl5zYAv3kK6W1PzsHrhJDKyL2Z/Mh0z0U3j9iCB7aZ/sq7sWxRVP+B5aO41YI5Z6J+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-85db3356bafso427423039f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 00:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743751824; x=1744356624;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gPCz0+43gqYBzB8+ltwHGQJNHwuVwFI52eCb+gwnK8=;
        b=b5lzlc4oG0uJuZEStZYeJwZnqZJSjGDNGNCTQ9tnwLmnA5nSgjwcQiVl72weS1X1sW
         UTBfkDNP+RZkiu1TpBUa3o2O+TtWL7O0laaRFQ+TOJcuIMhpGJNXGoB0A//howK22m/q
         IE+1TYo/oW0IyL5OPj3HGOH64SEtNKL7H0Zo1IrCOh7k+97pKt0NSiKWm+IIyeVggJ3S
         mOViqxzlaAPFzwiyVmELjphBctzL82ccY6lyUk9NBemqJxeaobbmZvF3C4me6BBWvbAS
         l+6gEFzp0xRfsPa8EJeKc9/6zsxtkwDyA3rQoOUo17oZ+L5R69vnJsj17Ux7q/NWTsQd
         j8Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUrQvdhrTlOXuVeGo1s3zSE2sbKJoNBRFLt2ikfkYtbEzGGh+k+Ri35K38sm5OdKPXEUsUobrqhO3+R6c8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRutEFM9GxIxaUyMfuyjAz58kF4CYsNDGfQkCry7aY9VZQl/ql
	+thlzsGS0RqXaX5gcBAe7n1h4+InQcLhIZTq+KqMTZsUcenvItXUPSv1dxkOTUurphZgWiC8gUT
	zgWAUutdIpdXQ4F3tgPjW/J1Wpdol4mxdeZSZjUwOSo+fz2ygEEkbBVM=
X-Google-Smtp-Source: AGHT+IEqC+/naV5h3ulq8iy4MxO0A+vT2N00sfSkpRRQKs6apOu7E3su+ybZ1V0o+rjI4Bu2VPSow5xRDvHB9yt7rZqyEfHZS3J9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:216b:b0:3d4:2306:6d6 with SMTP id
 e9e14a558f8ab-3d6e3f89f84mr31956945ab.21.1743751823820; Fri, 04 Apr 2025
 00:30:23 -0700 (PDT)
Date: Fri, 04 Apr 2025 00:30:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ef8a8f.050a0220.9040b.0375.GAE@google.com>
Subject: [syzbot] [kernel?] KCSAN: data-race in hash_net4_add / hash_net4_gc_do
From: syzbot <syzbot+78974ef5957119ce0f61@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a2cc6ff5ec8f Merge tag 'firewire-updates-6.15' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17d8194c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=878fb2f189a26734
dashboard link: https://syzkaller.appspot.com/bug?extid=78974ef5957119ce0f61
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6cdeb8c88045/disk-a2cc6ff5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/06bfec3b61f0/vmlinux-a2cc6ff5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b7367ea0d4e6/bzImage-a2cc6ff5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+78974ef5957119ce0f61@syzkaller.appspotmail.com

EXT4-fs (loop2): 1 truncate cleaned up
ext4 filesystem being mounted at /376/file0 supports timestamps until 2038-01-19 (0x7fffffff)
==================================================================
BUG: KCSAN: data-race in hash_net4_add / hash_net4_gc_do

read-write to 0xffff888120381268 of 4 bytes by task 23 on cpu 1:
 hash_net4_gc_do+0x908/0xf90 net/netfilter/ipset/ip_set_hash_gen.h:518
 hash_net4_gc+0x10d/0x280 net/netfilter/ipset/ip_set_hash_gen.h:583
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0x4de/0xa20 kernel/workqueue.c:3319
 worker_thread+0x52c/0x710 kernel/workqueue.c:3400
 kthread+0x4b7/0x540 kernel/kthread.c:464
 ret_from_fork+0x4b/0x60 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

read to 0xffff888120381268 of 4 bytes by task 9403 on cpu 0:
 hash_net4_add+0x292/0x1d50 net/netfilter/ipset/ip_set_hash_gen.h:869
 hash_net4_uadt+0x51d/0x5d0 net/netfilter/ipset/ip_set_hash_net.c:202
 call_ad+0x1a3/0x550 net/netfilter/ipset/ip_set_core.c:1751
 ip_set_ad+0x5a7/0x670 net/netfilter/ipset/ip_set_core.c:1841
 ip_set_uadd+0x41/0x50 net/netfilter/ipset/ip_set_core.c:1864
 nfnetlink_rcv_msg+0x4ba/0x580 net/netfilter/nfnetlink.c:302
 netlink_rcv_skb+0x12f/0x230 net/netlink/af_netlink.c:2534
 nfnetlink_rcv+0x187/0x1610 net/netfilter/nfnetlink.c:667
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x605/0x6c0 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x609/0x720 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x140/0x180 net/socket.c:727
 ____sys_sendmsg+0x350/0x4e0 net/socket.c:2566
 ___sys_sendmsg net/socket.c:2620 [inline]
 __sys_sendmsg+0x1a0/0x240 net/socket.c:2652
 __do_sys_sendmsg net/socket.c:2657 [inline]
 __se_sys_sendmsg net/socket.c:2655 [inline]
 __x64_sys_sendmsg+0x46/0x50 net/socket.c:2655
 x64_sys_call+0x26f3/0x2e10 arch/x86/include/generated/asm/syscalls_64.h:47
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0x1c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0x000003f4 -> 0x00000331

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 9403 Comm: syz.2.1855 Not tainted 6.14.0-syzkaller-12966-ga2cc6ff5ec8f #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
==================================================================
Set syz1 is full, maxelem 65536 reached


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
