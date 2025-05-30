Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A8F2D600
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748626026; cv=none; b=GAbJaaXt+sQc98shXwURggJA0X1MjHwqCDqnc9jd1jbuDAWgux54Ne3QplztsE3vDFhVUCYn6e9SWWn4SDoUJmPN1KR9tV02cOHAdawx1zo0q7A6JU6FQTPT43D1/HOBCgKDGHk0ZK/jr3Qna+pR7v7BaUieRgWGKU/RTgO7ayY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748626026; c=relaxed/simple;
	bh=QnFT4UTcUmVIF557XHeZIxprQLC4uimKa9zu22sXfkw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=StsB+VG41qdPYRtFCNjR9PQ8VeN1pgAbgtptIJGHpUe2QBuY84Jvo0KM5qyNFkN4Sm9CQYjulCdFQkQJXrwDITgi2/SEu/PdkPtXZ7ls342sZW+ay13hyvgQZf8A5m0jH3BmBcDY6RYNxiueJFQg8gCeo6y3YQ76HK11P6R5hAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3dd7587af8dso20062675ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626024; x=1749230824;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEnE3UPKhcy+AwEGJgtE9Olu+DiLoFVrDFd7ZrO9MFg=;
        b=I/iXJyU3gEEf1LXG92eeJfn6eWM8P65tFmVdrmsW3rzUTfxH5k2mzkU12zAxNreoU9
         ZQwNh6FRcKoXn2CMmfzoUzF8ROTeVZXkLt8ew2ZTL7hCdXyzNIy/3XieGP7RelyI3gvC
         ELgi7l4Dm/5SbP+oHS3VGZ9FlQQulLb15SFKnOL6WzquAfHmktUCLOpQSSfSWBmm3li/
         GyEyi4YPJjeDeMIR87EIyMMQH76yeWyM1QNaq7893vpPZWkCHmxhTdEvPtDD8Ho6me3y
         PhNA2Jx26mvPHtt6PnW7lteIt8CjFLUwMKY/rw9M1DfR9djvXxO1cYchQLjQ4+Fb8ekT
         UmfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvGySoMr6rYeJO/r2IoD+iIxBCcSme5Q2tfUHwotSrCNvSAU/aXAD0KRv6hPpGMGnT28GVnFpDQe6ViXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ZKHRtb4IRvS5VoPetRaO5q4f3gmVdgca7HfzQylnNMzFiKfd
	GSHZ8VGLzZuvKjLFi2SM53Xu/i6ldpI2usr420UZuXtlXZlBIEdSwUUbpaTrN4JOeWmYLs/4fKK
	HstqAEEAfS5R8uTUrQ5pEiWEBA6TPbI74DR8fQGQGCWqRFG0sWac+ULReG6k=
X-Google-Smtp-Source: AGHT+IGLEwYnF4NLSDCGONGXRq9cSsMDPGPvX/rO+eobb5oy+6F/LXDkf3vpZt1ktE3onG9mjJtHCD8NWls3pJa9JWvUafFgsj94
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2789:b0:3d9:6cb6:fa52 with SMTP id
 e9e14a558f8ab-3dd99bf713dmr49207495ab.12.1748626023784; Fri, 30 May 2025
 10:27:03 -0700 (PDT)
Date: Fri, 30 May 2025 10:27:03 -0700
In-Reply-To: <87r006nj7e.fsf@posteo.net>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6839ea67.a00a0220.d8eae.000c.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING in nsim_fib_event_nb
From: syzbot <syzbot+a259a17220263c2d73fc@syzkaller.appspotmail.com>
To: andrew@lunn.ch, charmitro@posteo.net, davem@davemloft.net, 
	dsahern@kernel.org, edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	kuniyu@amazon.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
unregister_netdevice: waiting for DEV to become free

unregister_netdevice: waiting for lo to become free. Usage count = 601
ref_tracker: lo@ffff888031d42610 has 600/600 users at
     __netdev_tracker_alloc include/linux/netdevice.h:4330 [inline]
     netdev_tracker_alloc include/linux/netdevice.h:4342 [inline]
     netdev_get_by_index+0x79/0xb0 net/core/dev.c:1006
     fib6_nh_init+0x1c4/0x2030 net/ipv6/route.c:3590
     ip6_route_info_create_nh+0x139/0x870 net/ipv6/route.c:3866
     ip6_route_mpath_info_create_nh net/ipv6/route.c:5429 [inline]
     ip6_route_multipath_add net/ipv6/route.c:5544 [inline]
     inet6_rtm_newroute+0x8ca/0x1d90 net/ipv6/route.c:5729
     rtnetlink_rcv_msg+0x7cc/0xb70 net/core/rtnetlink.c:6955
     netlink_rcv_skb+0x219/0x490 net/netlink/af_netlink.c:2534
     netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
     netlink_unicast+0x758/0x8d0 net/netlink/af_netlink.c:1339
     netlink_sendmsg+0x805/0xb30 net/netlink/af_netlink.c:1883
     sock_sendmsg_nosec net/socket.c:712 [inline]
     __sock_sendmsg+0x219/0x270 net/socket.c:727
     ____sys_sendmsg+0x505/0x830 net/socket.c:2566
     ___sys_sendmsg+0x21f/0x2a0 net/socket.c:2620
     __sys_sendmsg net/socket.c:2652 [inline]
     __do_sys_sendmsg net/socket.c:2657 [inline]
     __se_sys_sendmsg net/socket.c:2655 [inline]
     __x64_sys_sendmsg+0x19b/0x260 net/socket.c:2655
     do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
     do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
     entry_SYSCALL_64_after_hwframe+0x77/0x7f



Tested on:

commit:         a5ecfdd9 ipv6: Fix ECMP validation for multipath routes
git tree:       https://github.com/charmitro/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1151bff4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5a1787205a40c165
dashboard link: https://syzkaller.appspot.com/bug?extid=a259a17220263c2d73fc
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
