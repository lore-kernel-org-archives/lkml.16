Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0062354F8C
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433187; cv=none; b=f3FsU+daCjTBvmMxNVBqW1Q5G4ERNu9cYR4zBQdlZzdxUwdcGc33kdsKVf51T8zAF5wf12iSBXxuh1iSd8XmmiZgl+mh0durcWuS1xIAfnt/dR8vnEN0x/O9ODxBkaW0HLUNN8u31q07XuJkynsZMuIDliDF3nltfZCIo/6nUzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433187; c=relaxed/simple;
	bh=r9rYPVC2YF+ZjyEZ11V++8o29EOx6S04DHWNKd2FW1E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=no6hJVmoWPhkh2bUyVzD30EROUzM1iLI0ROrc3VOqMS+xYRwJ5DDYf19oSn4RAA8KIq2GF+svDf86aIaDihlfbLH968lIV/z0XTz8ig0sdNq1aU+1yfAwer/JGRq5NKZkU61mN7I3A8flh2Lm8DzYFObI6y5CneGwHXj4AfgxPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-85dad58e80fso1211267939f.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 01:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746433185; x=1747037985;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LCEX1EFRv238GEFwbV0ta+5g1/4AzphWXF1yuqUojmQ=;
        b=q+YDsDFMxRYHmwxpZmij6WXP0cfmILI0B6VpatpWnxbRBzQFtG98TmdUiwZ93rMwzg
         Kx3rZ+KYy7fmoJFXkA4aQ9DMYTjywKgNe7RoOVtqAPF+uhSYtvkiU42wBFZsLj9CE+FS
         pAwvP7xU1ppzM+XQ2GtyCgS5KMWDXZbP2RrYCGExmXawkpo5sQLaVGYdq3oPstYa2a7P
         +BHbD5LkFPQhdvmNXD+opgIlol+jPgEcLqX9sS6naCmkjQB8/818Pn4uxthiKrR8+Ka0
         fy2qVrJzsvpM4DtolPmPpegrFbNs9DN293FqmPd2lyr4nsVmUTK+qa1Q7ULyTdp9W20j
         TiRA==
X-Forwarded-Encrypted: i=1; AJvYcCXgJ33GWEV1wvTYWBxjnXoAfhUeAnpUNVM5+NoGB1erEZcQ4RRpFxHHU6PSVSCOeU17mC3FVzlIUjUc7Ec=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZmwNQfhYC9pN7xt/6SQMyH0JsnE/MSA8t0VHBw4whEaHt7GPF
	5xZdwh5+X5wp4PGPleH256B8BUpHauvhDmyXbFSg9p+Q7h+tXLkW/2tsG8ABiXh9PynOLeTOAuh
	UYhP1Y1iVmZYAzgVHK5RqrsJjcJu6K9X1R7XHD45j9WiZVXiFuDmTrDo=
X-Google-Smtp-Source: AGHT+IFcfEiDVC9durfNCBonV8iLmv00fPKHqCzuwev0MrP2Ul3bfDxrHJ6vnrFnx+uxZZfZZzOIg8HpckhJyp35Pz/r5SduMJi+
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:158b:b0:3d8:21ae:d9c with SMTP id
 e9e14a558f8ab-3da5b23bd5emr63649525ab.5.1746433185026; Mon, 05 May 2025
 01:19:45 -0700 (PDT)
Date: Mon, 05 May 2025 01:19:45 -0700
In-Reply-To: <62cfbaa1e97f658c2d0f87859919d59b5d88510c.camel@codeconstruct.com.au>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681874a1.a70a0220.254cdc.004a.GAE@google.com>
Subject: Re: [syzbot] [net?] upstream test error: KMSAN: use-after-free in mctp_dump_addrinfo
From: syzbot <syzbot+1065a199625a388fce60@syzkaller.appspotmail.com>
To: matt@codeconstruct.com.au
Cc: matt@codeconstruct.com.au, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz dup: [syzbot] [net?] upstream test error: KMSAN: uninit-value in

can't find the dup bug

> mctp_dump_addrinfo
>
> On Thu, 2025-05-01 at 04:15 -0700, syzbot wrote:
>> Hello,
>> 
>> syzbot found the following issue on:
>> 
>> HEAD commit:    4f79eaa2ceac kbuild: Properly disable -Wunterminated-strin..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=15bc71b3980000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=53c85d265a8f3692
>> dashboard link: https://syzkaller.appspot.com/bug?extid=1065a199625a388fce60
>> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
>> 
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/3594998c29f0/disk-4f79eaa2.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/2cd908ac5281/vmlinux-4f79eaa2.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/5ea15b7bacde/bzImage-4f79eaa2.xz
>> 
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+1065a199625a388fce60@syzkaller.appspotmail.com
>> 
>> =====================================================
>> BUG: KMSAN: use-after-free in mctp_dump_addrinfo+0x208/0xac0 net/mctp/device.c:128
>>  mctp_dump_addrinfo+0x208/0xac0 net/mctp/device.c:128
>>  rtnl_dump_all+0x3ec/0x5b0 net/core/rtnetlink.c:4380
>>  rtnl_dumpit+0xd5/0x2f0 net/core/rtnetlink.c:6824
>>  netlink_dump+0x97b/0x1690 net/netlink/af_netlink.c:2309
>>  __netlink_dump_start+0x716/0xd60 net/netlink/af_netlink.c:2424
>>  netlink_dump_start include/linux/netlink.h:340 [inline]
>>  rtnetlink_dump_start net/core/rtnetlink.c:6853 [inline]
>>  rtnetlink_rcv_msg+0x1262/0x14b0 net/core/rtnetlink.c:6920
>>  netlink_rcv_skb+0x54a/0x680 net/netlink/af_netlink.c:2534
>>  rtnetlink_rcv+0x35/0x40 net/core/rtnetlink.c:6982
>>  netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
>>  netlink_unicast+0xed5/0x1290 net/netlink/af_netlink.c:1339
>>  netlink_sendmsg+0x10b3/0x1250 net/netlink/af_netlink.c:1883
>>  sock_sendmsg_nosec net/socket.c:712 [inline]
>>  __sock_sendmsg+0x330/0x3d0 net/socket.c:727
>>  __sys_sendto+0x590/0x710 net/socket.c:2180
>>  __do_sys_sendto net/socket.c:2187 [inline]
>>  __se_sys_sendto net/socket.c:2183 [inline]
>>  __x64_sys_sendto+0x130/0x200 net/socket.c:2183
>>  x64_sys_call+0x3c0b/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:45
>>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>>  do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
>>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> 
>> Uninit was created at:
>>  slab_free_hook mm/slub.c:2324 [inline]
>>  slab_free mm/slub.c:4656 [inline]
>>  kmem_cache_free+0x286/0xf00 mm/slub.c:4758
>>  skb_kfree_head net/core/skbuff.c:1056 [inline]
>>  skb_free_head net/core/skbuff.c:1070 [inline]
>>  skb_release_data+0xe56/0x1110 net/core/skbuff.c:1097
>>  skb_release_all net/core/skbuff.c:1162 [inline]
>>  __kfree_skb+0x6b/0x260 net/core/skbuff.c:1176
>>  consume_skb+0x83/0x230 net/core/skbuff.c:1408
>>  netlink_broadcast_filtered+0x21b6/0x2370 net/netlink/af_netlink.c:1524
>>  nlmsg_multicast_filtered include/net/netlink.h:1129 [inline]
>>  nlmsg_multicast include/net/netlink.h:1148 [inline]
>>  nlmsg_notify+0x15b/0x2f0 net/netlink/af_netlink.c:2577
>>  rtnl_notify+0xba/0x100 net/core/rtnetlink.c:958
>>  inet6_rt_notify+0x27d/0x4a0 net/ipv6/route.c:6270
>>  fib6_add_rt2node net/ipv6/ip6_fib.c:1259 [inline]
>>  fib6_add+0x33c7/0x6c70 net/ipv6/ip6_fib.c:1488
>>  __ip6_ins_rt net/ipv6/route.c:1351 [inline]
>>  ip6_ins_rt+0xc0/0x170 net/ipv6/route.c:1361
>>  __ipv6_ifa_notify+0x851/0x1990 net/ipv6/addrconf.c:6283
>>  ipv6_ifa_notify net/ipv6/addrconf.c:6322 [inline]
>>  add_addr+0x301/0x4c0 net/ipv6/addrconf.c:3206
>>  init_loopback net/ipv6/addrconf.c:3289 [inline]
>>  addrconf_init_auto_addrs+0xb53/0x10e0 net/ipv6/addrconf.c:3564
>>  addrconf_notify+0x1643/0x1d10 net/ipv6/addrconf.c:3741
>>  notifier_call_chain kernel/notifier.c:85 [inline]
>>  raw_notifier_call_chain+0xdd/0x410 kernel/notifier.c:453
>>  call_netdevice_notifiers_info+0x1ac/0x2b0 net/core/dev.c:2176
>>  call_netdevice_notifiers_extack net/core/dev.c:2214 [inline]
>>  call_netdevice_notifiers net/core/dev.c:2228 [inline]
>>  __dev_notify_flags+0x20d/0x3c0 net/core/dev.c:-1
>>  netif_change_flags+0x162/0x1e0 net/core/dev.c:9434
>>  dev_change_flags+0x18c/0x320 net/core/dev_api.c:68
>>  devinet_ioctl+0x1186/0x2500 net/ipv4/devinet.c:1200
>>  inet_ioctl+0x4c0/0x6f0 net/ipv4/af_inet.c:1001
>>  sock_do_ioctl+0x9c/0x480 net/socket.c:1190
>>  sock_ioctl+0x70b/0xd60 net/socket.c:1311
>>  vfs_ioctl fs/ioctl.c:51 [inline]
>>  __do_sys_ioctl fs/ioctl.c:906 [inline]
>>  __se_sys_ioctl+0x239/0x400 fs/ioctl.c:892
>>  __x64_sys_ioctl+0x97/0xe0 fs/ioctl.c:892
>>  x64_sys_call+0x1ebe/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:17
>>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>>  do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
>>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> 
>> CPU: 1 UID: 0 PID: 5440 Comm: dhcpcd Not tainted 6.15.0-rc4-syzkaller-00052-g4f79eaa2ceac #0 PREEMPT(undef) 
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
>> =====================================================
>> 
>> 
>> ---
>> This report is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>> 
>> syzbot will keep track of this issue. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>> 
>> If the report is already addressed, let syzbot know by replying with:
>> #syz fix: exact-commit-title
>> 
>> If you want to overwrite report's subsystems, reply with:
>> #syz set subsystems: new-subsystem
>> (See the list of subsystem names on the web dashboard)
>> 
>> If the report is a duplicate of another one, reply with:
>> #syz dup: exact-subject-of-another-report
>> 
>> If you want to undo deduplication, reply with:
>> #syz undup
>
