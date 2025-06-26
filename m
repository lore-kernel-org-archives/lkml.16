Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33922248B0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979345; cv=none; b=rvOkiYroSToP/7PBa7FjzYGQW2X3tOjAvimzhvx2gatorBpo84pWTUPodLvuvwXl/PkuRiTcCN9EG9LHVSeOzBI+jXqyLYb10Fk4XPdJlUOTv5Ap5X6HVSLnv/CcbRvsllgaGrSAOfubdvoh47ZHthUdRBbJC26Vl1BDzcUMstU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979345; c=relaxed/simple;
	bh=SaiMvf0QIsnsjPYNJJlgOig5FOT8xxYY+A0eHMeBf7s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZEFbF7p5LrSQ2T/8I7ldvc+6y1qQoOyFiULjmM0rwYlBTn59t1Vm259wmaaopXESBJMDZb17G8mo2FzaiSz064zCs3rN9H3rfxxZxZ5lZ3Jri53gFFON/kQr/HMDebyx7WI70D+XBPR6DIkDqeTXOvvHWkZo2dA3Vl3Tqd0CFQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddafe52d04so37235795ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979343; x=1751584143;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6XgX3w4+dt/shPHb/cqrupX6BHtHSMszwKNRKm1TVO4=;
        b=LG/S+T2fOArNyxlBTXhkOIE4fNuSS7xg8MqoZEVWS5AJrslASPfQ7y0Ix1498MrS4R
         8iA52CHRAs9o+xOlrR7XjLrM95Scq1eTHfdyfV99m8xGOd+xcuRPCgbIhgNhIZJ5Hnpx
         AnQRIkRE7ln7610GXyVbuq+ZbtAeiZsopDSmqDPoFJOffpA3dp0NqAUlOz3t3DteUpEK
         HbpShgYIOzjfFW4uY5ACjdxYJg1hDYtHYsJqVdbnIv3i8lB02W7rHKR/5wRGg84lO26q
         PNvOoa2EsKnH1AjniVgA0XiJhz8VtpEctKxtBDJ1/hxC7/kxF0Uw1aAAbqJNkzISozp2
         /o5w==
X-Forwarded-Encrypted: i=1; AJvYcCUqnMxgQQ6Q/JZha0yYBDrZIN+6DBH0mhYL9+R13AK2sXti6b0PNNqdY8NMe+UasO2QI8xq3jxh6tYU1AA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE8VHYPcL45RWc4jHArqfktdGGJHHX3upTrP6RpUSjkUTdgCzI
	pMzviZNtZxw8OJFH3kOfkNNka2Fs6Dg2u0MkcSh9I2qlZVh8XcgyUk8f06JFxMicoWBSjkJrzvV
	Rjhw2lqXi9QasjiK3NE2kKLfbll5cN/vlK6zeFOrYkywO7p9LcLf0mF/n2YE=
X-Google-Smtp-Source: AGHT+IFyWjwoTS+TP+icDo+mFvUezoIYSka9m5lFmfsgpu49z8rnX0MJlzzLOrgIpaoiUKf+tlCIBY5DQtC6/F1sdCl63KOwQIB9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2589:b0:3df:460a:ec3c with SMTP id
 e9e14a558f8ab-3df4acc520fmr18776735ab.22.1750979343102; Thu, 26 Jun 2025
 16:09:03 -0700 (PDT)
Date: Thu, 26 Jun 2025 16:09:03 -0700
In-Reply-To: <20250626225210.1924-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685dd30f.a00a0220.2e5631.0390.GAE@google.com>
Subject: Re: [syzbot] [rdma?] WARNING in rxe_skb_tx_dtor
From: syzbot <syzbot+8425ccfb599521edb153@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in rxe_skb_tx_dtor

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1038 at drivers/infiniband/sw/rxe/rxe_net.c:357 rxe_skb_tx_dtor+0x8b/0x2a0 drivers/infiniband/sw/rxe/rxe_net.c:357
Modules linked in:
CPU: 0 UID: 0 PID: 1038 Comm: kworker/u4:6 Not tainted 6.16.0-rc3-syzkaller-gf02769e7f272-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: rxe_wq do_work
RIP: 0010:rxe_skb_tx_dtor+0x8b/0x2a0 drivers/infiniband/sw/rxe/rxe_net.c:357
Code: 80 3c 20 00 74 08 4c 89 ff e8 d1 64 81 f9 4d 8b 37 44 89 f6 83 e6 01 31 ff e8 e1 e5 1d f9 41 f6 c6 01 75 0e e8 f6 e0 1d f9 90 <0f> 0b 90 e9 b4 01 00 00 4c 89 ff e8 35 94 fd 01 48 89 c7 be 0e 00
RSP: 0018:ffffc900000079e8 EFLAGS: 00010246
RAX: ffffffff88a26d7a RBX: ffff888055e923c0 RCX: ffff8880330c2440
RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff887bc1c4
R10: dffffc0000000000 R11: ffffffff88a26cf0 R12: dffffc0000000000
R13: 1ffff1100abd2483 R14: 0000000000025820 R15: ffff888033808000
FS:  0000000000000000(0000) GS:ffff88808d250000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f08899dcfc8 CR3: 0000000032fcf000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 skb_release_head_state+0xfe/0x250 net/core/skbuff.c:1139
 napi_consume_skb+0xd2/0x1e0 net/core/skbuff.c:-1
 e1000_unmap_and_free_tx_resource drivers/net/ethernet/intel/e1000/e1000_main.c:1972 [inline]
 e1000_clean_tx_irq drivers/net/ethernet/intel/e1000/e1000_main.c:3864 [inline]
 e1000_clean+0x49d/0x2b00 drivers/net/ethernet/intel/e1000/e1000_main.c:3805
 __napi_poll+0xc4/0x480 net/core/dev.c:7414
 napi_poll net/core/dev.c:7478 [inline]
 net_rx_action+0x707/0xe30 net/core/dev.c:7605
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 do_softirq+0xec/0x180 kernel/softirq.c:480
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0x17d/0x1c0 kernel/softirq.c:407
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 __neigh_event_send+0x9b/0x1560 net/core/neighbour.c:1194
 neigh_event_send_probe include/net/neighbour.h:463 [inline]
 neigh_event_send include/net/neighbour.h:469 [inline]
 neigh_resolve_output+0x198/0x750 net/core/neighbour.c:1496
 neigh_output include/net/neighbour.h:539 [inline]
 ip6_finish_output2+0x11fe/0x16a0 net/ipv6/ip6_output.c:141
 __ip6_finish_output net/ipv6/ip6_output.c:-1 [inline]
 ip6_finish_output+0x234/0x7d0 net/ipv6/ip6_output.c:226
 rxe_send drivers/infiniband/sw/rxe/rxe_net.c:391 [inline]
 rxe_xmit_packet+0x79e/0xa30 drivers/infiniband/sw/rxe/rxe_net.c:450
 rxe_requester+0x1fea/0x3d20 drivers/infiniband/sw/rxe/rxe_req.c:805
 rxe_sender+0x16/0x50 drivers/infiniband/sw/rxe/rxe_req.c:839
 do_task drivers/infiniband/sw/rxe/rxe_task.c:127 [inline]
 do_work+0x1b1/0x6c0 drivers/infiniband/sw/rxe/rxe_task.c:187
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         f02769e7 Merge tag 'devicetree-fixes-for-6.16-1' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1693008c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79da270cec5ffd65
dashboard link: https://syzkaller.appspot.com/bug?extid=8425ccfb599521edb153
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13283b70580000

