Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A62F1EBA1E
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746110383; cv=none; b=B4brTqP2PqW+1aq4EiGNqfkzoB2it9AkRaaCxJ15wZUaF6tuFeLTVq+dP1K9c5FB5l1d9SnxZ4wmHB4ri8mVqz6N8xM/VW8yHl6xkVc5vzHb5Fek0bUHiKfFU+pVkjuYfcwfgEfDYykjr5Sy+TqzbCFlolb0JMqBv8UTDldBEQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746110383; c=relaxed/simple;
	bh=cC4tLYskR/r25N8KWrIkgV2lt01GX7Wp9gCrh7yaAmE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=iCPiFP/rnlVIkSJcb8+gJ6uKoGOVWyh6gSO/wzhSmsYGvqPuX72UMF9tLaVtg90hQ56OR5I+PJCipOexTFG/jf0cJ3QNng2WxXm+NqQ7E10WBb4J30wGDCSNNnA/bFpmTsnRHzV0VJMOVWAk/8Tc2KiHFvUYtR1VIg92jlMVD/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-85b53875729so225907439f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746110381; x=1746715181;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDtHLTOgANglhZWMZnH1KuDkSzqNaY2KqFec35jXMMA=;
        b=evUv6n0C9tPScn8SMbRijX05NQheQEtx4dSj+paG6uMtVi5LdYuh/1dFJKwMgWrdQp
         JGeaQki9gOpECtMdnZJQI4K7h3P4U73QRon1ZYGrrlojgnewTQYTQzHWpx10kKiXavG8
         71uT42+5Rr1F72IaLusRtQeotiexpUSiBDIc6OMTRkECKXaQ5D3a/N9wLqcHqq4VqZmY
         +tVNdsKRM9jIK31aNjpCE/HTCfG/0oGOkn4lcNgmNbvPFgd6kz0Z3CP1vbn/7+DAJHwI
         CmLfcAVyPgsoEvcx5Tpc9m+XTwdgBBLp9k90PRt6283n4sShLkP76oXYbk7id19y6TqO
         y82Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoK3o2Lwr2EDTO+bhZwiVpJ4HmXEs3CgWnJ3VidEIc7YkJaLQFUSdpfMYxl1YSCEd2CmVYpQn5Dt0K+30=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbHZF0+ivuyWV5sfzxZPvts0BJdzMDZk6VJVzD3NLHH5c9hSng
	TEBRNEVDM1/OvYPEiUcQ96UqwSh7IDhhz+7ZZrXkxYIGnzNabJvuaCHAdVMKIe6rGM+9hwdelt8
	25RBwz0Lqq5qp4hevo7XRbK0lCvQcoz/6SJGYhFgOWXiOwOd/76kNQqE=
X-Google-Smtp-Source: AGHT+IEiMaEHO6bk+FEv3HTEUEsMBnz0eGZO5nBDJ6l53i5oZ3bJ3TDkuUeKuPcgmfwHyd9LLSUXjnXSQpvYn+7ZNUcBpQeJAQ9m
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:168a:b0:3d5:8103:1a77 with SMTP id
 e9e14a558f8ab-3d9701de3abmr37175595ab.1.1746110381090; Thu, 01 May 2025
 07:39:41 -0700 (PDT)
Date: Thu, 01 May 2025 07:39:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681387ad.050a0220.14dd7d.0013.GAE@google.com>
Subject: [syzbot] [net?] KASAN: global-out-of-bounds Read in __find_rr_leaf (2)
From: syzbot <syzbot+15cc51ab13a8d9e2adfe@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7a13c14ee59d Merge tag 'for-6.15-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14d5e39b980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4d6290f49c6ebe48
dashboard link: https://syzkaller.appspot.com/bug?extid=15cc51ab13a8d9e2adfe
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-7a13c14e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5fc0ea9b1119/vmlinux-7a13c14e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cbd619ca4f7e/bzImage-7a13c14e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+15cc51ab13a8d9e2adfe@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: global-out-of-bounds in fib6_check_expired include/net/ip6_fib.h:270 [inline]
BUG: KASAN: global-out-of-bounds in __find_rr_leaf+0xbcb/0xe00 net/ipv6/route.c:843
Read of size 4 at addr ffffffff9af7fbc4 by task kworker/3:4/5983

CPU: 3 UID: 0 PID: 5983 Comm: kworker/3:4 Not tainted 6.15.0-rc4-syzkaller-00051-g7a13c14ee59d #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: mld mld_ifc_work
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xc3/0x670 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 fib6_check_expired include/net/ip6_fib.h:270 [inline]
 __find_rr_leaf+0xbcb/0xe00 net/ipv6/route.c:843
 find_rr_leaf net/ipv6/route.c:899 [inline]
 rt6_select net/ipv6/route.c:934 [inline]
 fib6_table_lookup+0x7b3/0xa30 net/ipv6/route.c:2230
 ip6_pol_route+0x1cc/0x1230 net/ipv6/route.c:2266
 pol_lookup_func include/net/ip6_fib.h:616 [inline]
 fib6_rule_lookup+0x536/0x720 net/ipv6/fib6_rules.c:120
 ip6_route_input_lookup net/ipv6/route.c:2335 [inline]
 ip6_route_input+0x662/0xc00 net/ipv6/route.c:2631
 ip6_rcv_finish_core.constprop.0+0x1a0/0x5d0 net/ipv6/ip6_input.c:66
 ip6_list_rcv_finish.constprop.0+0x20f/0xb50 net/ipv6/ip6_input.c:130
 ip6_sublist_rcv net/ipv6/ip6_input.c:319 [inline]
 ipv6_list_rcv+0x339/0x450 net/ipv6/ip6_input.c:353
 __netif_receive_skb_list_ptype net/core/dev.c:5930 [inline]
 __netif_receive_skb_list_core+0x556/0x950 net/core/dev.c:5977
 __netif_receive_skb_list net/core/dev.c:6029 [inline]
 netif_receive_skb_list_internal+0x752/0xdb0 net/core/dev.c:6120
 netif_receive_skb_list net/core/dev.c:6172 [inline]
 netif_receive_skb_list+0x4d/0x4b0 net/core/dev.c:6162
 ieee80211_rx_napi+0x384/0x410 net/mac80211/rx.c:5443
 ieee80211_rx include/net/mac80211.h:5179 [inline]
 ieee80211_handle_queued_frames+0xd5/0x130 net/mac80211/main.c:441
 tasklet_action_common+0x281/0x400 kernel/softirq.c:829
 handle_softirqs+0x216/0x8e0 kernel/softirq.c:579
 do_softirq kernel/softirq.c:480 [inline]
 do_softirq+0xb2/0xf0 kernel/softirq.c:467
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0x100/0x120 kernel/softirq.c:407
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 rcu_read_unlock_bh include/linux/rcupdate.h:910 [inline]
 __dev_queue_xmit+0x8ab/0x43e0 net/core/dev.c:4656
 dev_queue_xmit include/linux/netdevice.h:3350 [inline]
 neigh_resolve_output net/core/neighbour.c:1512 [inline]
 neigh_resolve_output+0x53a/0x940 net/core/neighbour.c:1492
 neigh_output include/net/neighbour.h:539 [inline]
 ip6_finish_output2+0xaeb/0x2020 net/ipv6/ip6_output.c:141
 __ip6_finish_output net/ipv6/ip6_output.c:215 [inline]
 ip6_finish_output+0x3f9/0x1360 net/ipv6/ip6_output.c:226
 NF_HOOK_COND include/linux/netfilter.h:303 [inline]
 ip6_output+0x1f9/0x540 net/ipv6/ip6_output.c:247
 dst_output include/net/dst.h:459 [inline]
 NF_HOOK include/linux/netfilter.h:314 [inline]
 NF_HOOK include/linux/netfilter.h:308 [inline]
 mld_sendpack+0x9e9/0x1220 net/ipv6/mcast.c:1868
 mld_send_cr net/ipv6/mcast.c:2169 [inline]
 mld_ifc_work+0x740/0xca0 net/ipv6/mcast.c:2702
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

The buggy address belongs to the variable:
 binder_deferred_list+0x24/0x40

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1af7f
flags: 0xfff00000002000(reserved|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000002000 ffffea00006bdfc8 ffffea00006bdfc8 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner info is not present (never set?)

Memory state around the buggy address:
 ffffffff9af7fa80: f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9 00 f9 f9 f9
 ffffffff9af7fb00: f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9 00 f9 f9 f9
>ffffffff9af7fb80: f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9 00 00 f9 f9
                                           ^
 ffffffff9af7fc00: f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9 00 00 00 00
 ffffffff9af7fc80: 00 00 00 00 00 00 00 00 00 00 00 f9 f9 f9 f9 f9
==================================================================


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
