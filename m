Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E4B27604F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744402049; cv=none; b=ggrFLpArKb3t7TjmUHqABNZraWbhkXuLxP5rxLWC19A/iiHiwaGdFqXcfMpIscDHjM1Up2kBlvRcLZ11RPmuRxI73nPlGHAL5GCxlHWWU7kKFYGIPBCz2N82pV587pppGhf9u1LUf4JWmv3sd9abkFPTfvNUN1VmytqY6eV08cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744402049; c=relaxed/simple;
	bh=MC1GxL3YNgplNVXsU7o24+sQqmgQXfDMNauEZcGstVE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=jzI1sy9b1xxMq8hV6f5dY5SidlmRzmE0hIUQVkVHHYFAun6VN+Uc19IEkiN0ABZN6PCRE944TBQCUGBKe84fL/ymVwEed8pSHxXBFnUEcJQY5VAyzjiavt0PpqfDNaE6cTnANIvm1jLhzJDdpZrhvUzpUV1p66mhukJRbjfmM78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d43c0dbe6aso46859335ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744402047; x=1745006847;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHWntVF7Lj9UqD4Jmbr2lpcm7Lsg+sulLP9wseK5UK8=;
        b=Yqzjeqdc5p///fIVkwapa4w8xjtLzoD/erfPNpm8s7oHRczND3FezTtY0cytyBWBGK
         wHXZY+n4PXp7nLUaWeL2c+6GQEYa3QeK20O4uKNJwSq4xa0dorGRqy+EyamoaIoeTqle
         d26eaq8HLOlqtfE3eC4i+VwEP3gGbvOlcig/Jj2WHoN/O/+cJiuZSTUpErWqA39z0uMC
         Y9em7g6GVDHxeXZICFNjOCttRtWndqA6S0+IqlDj4xD4JpCsBLFOuD4XkKNQW/IPpIFY
         GcMq1AXTAuANntYCozF6GFT5/8zie7ArmZZ1Mkv9VTsKGAxzaNzuStlx1IcXMmExkXZQ
         iw+A==
X-Forwarded-Encrypted: i=1; AJvYcCVqM5y14t5wm2lamxlM6+1ptnR3uW3dK7lTbqYKfvEqikje37anttwQ0/PSlgsHbfYO9hOAq+gzJkruovA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx4VaoDaExXxHi9b6LBBeszPy1NEBmspOm4USfRV/8VuM1sppX
	5+XJcGbCL6sjS9RDj6IMLzTpvDSenZM7j9uu1wS2h1brS2aylC61A9DKvv4jjH1eviZjPxLUnbN
	20GYx4bNp9UW6nCERUTjMN5whevml4ILOPl+gf12ovAb7YTUBtcAW3wI=
X-Google-Smtp-Source: AGHT+IFt0RFpOsth3RSP9XD28/8HE4I6EKvTyTaa7qsdjH0oA2BN9IKKV2+cqrfSuNjPF9dz+31fybHGGIBF2XcnMVWmutII2eyO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f0e:b0:3d5:8103:1a77 with SMTP id
 e9e14a558f8ab-3d7ec1dc7d5mr49842395ab.1.1744402047375; Fri, 11 Apr 2025
 13:07:27 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:07:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f9767f.050a0220.379d84.0003.GAE@google.com>
Subject: [syzbot] [openvswitch?] KMSAN: uninit-value in validate_set (2)
From: syzbot <syzbot+b07a9da40df1576b8048@syzkaller.appspotmail.com>
To: aconole@redhat.com, davem@davemloft.net, dev@openvswitch.org, 
	echaudro@redhat.com, edumazet@google.com, horms@kernel.org, 
	i.maximets@ovn.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, pshelar@ovn.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0af2f6be1b42 Linux 6.15-rc1
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14e26d78580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7cfe1169d7fc8523
dashboard link: https://syzkaller.appspot.com/bug?extid=b07a9da40df1576b8048
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1367bb4c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1495d23f980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7526e189e315/disk-0af2f6be.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/60a25cc98e41/vmlinux-0af2f6be.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2d7bf8af0faf/bzImage-0af2f6be.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b07a9da40df1576b8048@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in validate_set+0x1a2/0x1640 net/openvswitch/flow_netlink.c:2879
 validate_set+0x1a2/0x1640 net/openvswitch/flow_netlink.c:2879
 __ovs_nla_copy_actions+0x2efc/0x61a0 net/openvswitch/flow_netlink.c:3383
 ovs_nla_copy_actions+0x36b/0x550 net/openvswitch/flow_netlink.c:3543
 get_flow_actions+0x99/0x1d0 net/openvswitch/datapath.c:1148
 ovs_nla_init_match_and_action+0x221/0x420 net/openvswitch/datapath.c:1198
 ovs_flow_cmd_set+0x320/0xec0 net/openvswitch/datapath.c:1236
 genl_family_rcv_msg_doit net/netlink/genetlink.c:1115 [inline]
 genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
 genl_rcv_msg+0x1214/0x12c0 net/netlink/genetlink.c:1210
 netlink_rcv_skb+0x375/0x650 net/netlink/af_netlink.c:2534
 genl_rcv+0x40/0x60 net/netlink/genetlink.c:1219
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0xf52/0x1260 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x10da/0x11e0 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x30f/0x380 net/socket.c:727
 ____sys_sendmsg+0x890/0xda0 net/socket.c:2566
 ___sys_sendmsg+0x28d/0x3c0 net/socket.c:2620
 __sys_sendmsg net/socket.c:2652 [inline]
 __do_sys_sendmsg net/socket.c:2657 [inline]
 __se_sys_sendmsg net/socket.c:2655 [inline]
 __x64_sys_sendmsg+0x212/0x3c0 net/socket.c:2655
 x64_sys_call+0x2e0f/0x3c80 arch/x86/include/generated/asm/syscalls_64.h:47
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:4157 [inline]
 slab_alloc_node mm/slub.c:4200 [inline]
 kmem_cache_alloc_node_noprof+0x921/0xe10 mm/slub.c:4252
 kmalloc_reserve+0x13d/0x4a0 net/core/skbuff.c:577
 __alloc_skb+0x366/0x7b0 net/core/skbuff.c:668
 alloc_skb include/linux/skbuff.h:1340 [inline]
 netlink_alloc_large_skb+0x1b4/0x280 net/netlink/af_netlink.c:1187
 netlink_sendmsg+0xa96/0x11e0 net/netlink/af_netlink.c:1858
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x30f/0x380 net/socket.c:727
 ____sys_sendmsg+0x890/0xda0 net/socket.c:2566
 ___sys_sendmsg+0x28d/0x3c0 net/socket.c:2620
 __sys_sendmsg net/socket.c:2652 [inline]
 __do_sys_sendmsg net/socket.c:2657 [inline]
 __se_sys_sendmsg net/socket.c:2655 [inline]
 __x64_sys_sendmsg+0x212/0x3c0 net/socket.c:2655
 x64_sys_call+0x2e0f/0x3c80 arch/x86/include/generated/asm/syscalls_64.h:47
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 1 UID: 0 PID: 5787 Comm: syz-executor365 Not tainted 6.15.0-rc1-syzkaller #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
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
