Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C7E157A67
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749661893; cv=none; b=mreD74M6L3th1OEtK/7Pj0sXtkR7nRkgzp2N2SHPycRGaQ2cYpFsauTcHgmb0AFu13FgnjH36C40OvSAGKE6qpiXCh7pWIexql0YD7fcAHzCta/C5sT0TJtULfv2XUY1GI7GyiGjngRAoBt3HrQQdVVHIvqGuRBU7++EuIHaKXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749661893; c=relaxed/simple;
	bh=QSvOOWtJuIfjCJoBL0OeEuYhKXRsvAxL1NMhQtkpLIE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kE62Gug5KL2OiN6LmhNtA8wA1kDK2bvugncOXwDK3TPKh9zqhqA17ed5f4nbCFIjGLjr51bFr5aGFPqAXGUlWx33ozRg7W6eEqGDAWYd3dvQ4S6XHf6KlSi6GbmcaPMLBP17INeqEG2E9Gm6ilwvM6KljygC7zWfvRAUkwuYBkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-86d1218df67so8093839f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749661891; x=1750266691;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+K6Kx1kOSQm1j6AFupjyRqIrRPupxlxYt0QZP8QvpM=;
        b=SzjGuW+AI04RoOZyp6AMyKtQdaI3vlbiuNfuAUxSQOeZF3cMgU6gwWtYngcnNPAWk7
         k81yJJHh0Zhtv6vEBfxpFh6w6VakWpvxy+229fMY6cn4xfRJq1EYL0Gf3eKuAGR2SQqE
         Lp9qTJ05h/vxPWkApR9mLrRALyPW5fTZf0fFxAmy8zGVHNjxQwXpEmhK+izhGpiinyM1
         vfyuzKy0mHJuqFbacFsnrTRDRbmxdmZhYAttKNeMWFjXg+tLh80R2iVKpRKoWefBd8UQ
         +3ja2fUDxdSfb0P58tfc/RMcBTqNMHY+kYW6FNuShhfPnMcsAz/AahFPjfHmrYNzIupp
         wX4A==
X-Forwarded-Encrypted: i=1; AJvYcCUAziPxrOOo+6zWlMvNQettS2fM8qJ+sfUSj/zSuGFaK9O96Uz0sE49vAm5I5vlQaLsYcsuI44iaAKWYuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpOtvmSWVXjLWTKOYr/0g9ek/EeaPx85sxAY7GHRrG2oFrwj66
	oq6juAkQu3SmtiU27ET5tSm5VmZDjJdYOBjZC8Rrk2Cik9pjl/VIPBR4ZecSXAich9myriLYh0p
	NIn5v8t2Y2IeI5GpdEohiqbhP/be5PHnV67boKOCJ/FYLNuBzUTxvE4oYdyU=
X-Google-Smtp-Source: AGHT+IHlv/eHUy36bYNYYEhpPRJd73Rsq3ggZvS8irzQdhSmr3jVWcH32BzcPmsCfAipjJUFhoM4O7Q9sRK81rYd7pZcaPoGIdgX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2701:b0:3dc:7fa4:823 with SMTP id
 e9e14a558f8ab-3ddf42fe5e7mr48967045ab.16.1749661891154; Wed, 11 Jun 2025
 10:11:31 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:11:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6849b8c3.a00a0220.1eb5f5.00f0.GAE@google.com>
Subject: [syzbot] [net?] UBSAN: array-index-out-of-bounds in ip6_route_info_create
From: syzbot <syzbot+4c2358694722d304c44e@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    19272b37aa4f Linux 6.16-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
console output: https://syzkaller.appspot.com/x/log.txt?x=145fa60c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=476ea327030dfdb4
dashboard link: https://syzkaller.appspot.com/bug?extid=4c2358694722d304c44e
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-19272b37.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c2cd09d10344/vmlinux-19272b37.xz
kernel image: https://storage.googleapis.com/syzbot-assets/94da7167c434/Image-19272b37.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4c2358694722d304c44e@syzkaller.appspotmail.com

------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in ./include/net/ipv6.h:616:34
index 20 is out of range for type '__u8 [16]'
CPU: 1 UID: 0 PID: 7444 Comm: syz.0.708 Not tainted 6.16.0-rc1-syzkaller-g19272b37aa4f #0 PREEMPT 
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<ffffffff80078a80>] dump_backtrace+0x2e/0x3c arch/riscv/kernel/stacktrace.c:132
[<ffffffff8000327a>] show_stack+0x30/0x3c arch/riscv/kernel/stacktrace.c:138
[<ffffffff80061012>] __dump_stack lib/dump_stack.c:94 [inline]
[<ffffffff80061012>] dump_stack_lvl+0x12e/0x1a6 lib/dump_stack.c:120
[<ffffffff800610a6>] dump_stack+0x1c/0x24 lib/dump_stack.c:129
[<ffffffff8001c0ea>] ubsan_epilogue+0x14/0x46 lib/ubsan.c:233
[<ffffffff819ba290>] __ubsan_handle_out_of_bounds+0xf6/0xf8 lib/ubsan.c:455
[<ffffffff85b363a4>] ipv6_addr_prefix include/net/ipv6.h:616 [inline]
[<ffffffff85b363a4>] ip6_route_info_create+0x8f8/0x96e net/ipv6/route.c:3793
[<ffffffff85b635da>] ip6_route_add+0x2a/0x1aa net/ipv6/route.c:3889
[<ffffffff85b02e08>] addrconf_prefix_route+0x2c4/0x4e8 net/ipv6/addrconf.c:2487
[<ffffffff85b23bb2>] addrconf_prefix_rcv+0x1720/0x1e62 net/ipv6/addrconf.c:2878
[<ffffffff85b92664>] ndisc_router_discovery+0x1a06/0x3504 net/ipv6/ndisc.c:1570
[<ffffffff85b99038>] ndisc_rcv+0x500/0x600 net/ipv6/ndisc.c:1874
[<ffffffff85bc2c18>] icmpv6_rcv+0x145e/0x1e0a net/ipv6/icmp.c:988
[<ffffffff85af6798>] ip6_protocol_deliver_rcu+0x18a/0x1976 net/ipv6/ip6_input.c:436
[<ffffffff85af8078>] ip6_input_finish+0xf4/0x174 net/ipv6/ip6_input.c:480
[<ffffffff85af8262>] NF_HOOK include/linux/netfilter.h:317 [inline]
[<ffffffff85af8262>] NF_HOOK include/linux/netfilter.h:311 [inline]
[<ffffffff85af8262>] ip6_input+0x16a/0x70c net/ipv6/ip6_input.c:491
[<ffffffff85af8dcc>] ip6_mc_input+0x5c8/0x1268 net/ipv6/ip6_input.c:588
[<ffffffff85af6112>] dst_input include/net/dst.h:469 [inline]
[<ffffffff85af6112>] ip6_rcv_finish net/ipv6/ip6_input.c:79 [inline]
[<ffffffff85af6112>] NF_HOOK include/linux/netfilter.h:317 [inline]
[<ffffffff85af6112>] NF_HOOK include/linux/netfilter.h:311 [inline]
[<ffffffff85af6112>] ipv6_rcv+0x5ae/0x6e0 net/ipv6/ip6_input.c:309
[<ffffffff85087e84>] __netif_receive_skb_one_core+0x106/0x16e net/core/dev.c:5977
[<ffffffff85088104>] __netif_receive_skb+0x2c/0x144 net/core/dev.c:6090
[<ffffffff850883c6>] netif_receive_skb_internal net/core/dev.c:6176 [inline]
[<ffffffff850883c6>] netif_receive_skb+0x1aa/0xbf2 net/core/dev.c:6235
[<ffffffff8328656e>] tun_rx_batched.isra.0+0x430/0x686 drivers/net/tun.c:1485
[<ffffffff8329ed3a>] tun_get_user+0x2952/0x3d6c drivers/net/tun.c:1938
[<ffffffff832a21e0>] tun_chr_write_iter+0xc4/0x21c drivers/net/tun.c:1984
[<ffffffff80b9b9ae>] new_sync_write fs/read_write.c:593 [inline]
[<ffffffff80b9b9ae>] vfs_write+0x56c/0xa9a fs/read_write.c:686
[<ffffffff80b9c2be>] ksys_write+0x126/0x228 fs/read_write.c:738
[<ffffffff80b9c42e>] __do_sys_write fs/read_write.c:749 [inline]
[<ffffffff80b9c42e>] __se_sys_write fs/read_write.c:746 [inline]
[<ffffffff80b9c42e>] __riscv_sys_write+0x6e/0x94 fs/read_write.c:746
[<ffffffff80076912>] syscall_handler+0x94/0x118 arch/riscv/include/asm/syscall.h:112
[<ffffffff8637e31e>] do_trap_ecall_u+0x396/0x530 arch/riscv/kernel/traps.c:341
[<ffffffff863a69e2>] handle_exception+0x146/0x152 arch/riscv/kernel/entry.S:197
---[ end trace ]---


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
