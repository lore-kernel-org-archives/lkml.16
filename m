Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D492DC770
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 11:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746098073; cv=none; b=J4SkGDny+hjEZV1C7f15GpxqUc9dg0W6T8hEptVF9j5Az7WhAnBHe9GDWXSYYAnMlOrw7J0WHg5aAc99zehnq+GNuxktjYsbjwjBeSqqdllOH+Y/TXexWUVczkCts/izACFre6tigZE5QtR7PBXxa5dHp0jBtimznFsnh0fA+aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746098073; c=relaxed/simple;
	bh=y8hqJIlndHYbsl9eoslP8KaEevFA0Ieph7FXsqfUPIk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=aCj6xib4Ms6f6jiViriTkW0navjV2fP9DnXEduU8C5ZUwu1GCgsqrKYxdPW/9Ody9O/d0Gsebt+EcWWIgj7HAkV8eZOXGKNRK4stca/tHtZhFMId6xTdxfx2oOb3CsAHZjrPKuwLfvPSGh1EO/C1UnDaH6p6i284PQOf1D//JIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-86465e3f1c6so188767239f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 04:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746098070; x=1746702870;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMPiJijWx9vrckpE3iK0FzKjeylUc+9q4dGwOk8CemY=;
        b=GrLftEWPez0IT4d+fv1vjvAOjAe92erHZgNeB+E0DfWPZV6vFSCkVvkhQTX7/4pUZA
         NmziFQ+cMIAelgqNDbk4FrXR7iUO/Eg29Jufv7rqZWFC/brOCyqYfXZcGzzergT9w7uq
         TDcF7qqhizMk/4rD4s66RfHyj2zo53RrM3XcnSCg5U6ST7KAD2tGYQpdohALzWF0hcpf
         QxcNSMrTyFAKcEUvuToAcu2Shyowmtr+QVU0RpqTuvwkkjoKFfNGDMXt8A+AlvnYf15k
         Ob1t4XH0x0MUIGMoWhYPxMw1P39znpGbwEyavmXZ9dl+rY5Bf/F1XPTssxSPRp7wIKso
         FE5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1HZAbrHgDDkku88JqYYLljdp1vb6P0vPSfNCNgEQOLzqPq1FUV1gF/q9LTPRgwQkbwfGYQOrTkuNB/tA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzna+/1yqml+Q7R37wditRC3ucBIp9zTUI5WWi7OV//DSC3X3/S
	nJKLGOKeM165sMfP66JMfkxMO7CFVfZHsAzUPFMvIfAWdXwoAn8se9QrFDZl+fiQIHvIpeffGi8
	dw0rCkjJsqO6cgwBHVV/miVh/97KmmDCm0icVhFfRAaZSiUEW8zd+dUs=
X-Google-Smtp-Source: AGHT+IHeyhAZh27kMnh+RFIJF2L76LD932qqTZ9Dx5YWDQiL1ooEE3cnBKiX0nufn831g6+eLmc37zGpJQzzUX36UNTJQIvbhSpl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:184e:b0:3d0:26a5:b2c with SMTP id
 e9e14a558f8ab-3d970df8da1mr16155415ab.8.1746098070617; Thu, 01 May 2025
 04:14:30 -0700 (PDT)
Date: Thu, 01 May 2025 04:14:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68135796.050a0220.14dd7d.0008.GAE@google.com>
Subject: [syzbot] [net?] UBSAN: array-index-out-of-bounds in ip6_rt_copy_init
From: syzbot <syzbot+8f8024317adff163ec5a@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	elver@google.com, horms@kernel.org, justinstitt@google.com, 
	keescook@chromium.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cc17b4b9c332 Merge branch 'io_uring-zcrx-fix-selftests-and..
git tree:       net-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10ab50d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7e367ce4a19f69ba
dashboard link: https://syzkaller.appspot.com/bug?extid=8f8024317adff163ec5a
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17e2a270580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=145a9d74580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0e09cf367bdd/disk-cc17b4b9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4ab63344d74c/vmlinux-cc17b4b9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/14915e0e32b3/bzImage-cc17b4b9.xz

The issue was bisected to:

commit 557f8c582a9ba8abe6aa0fd734b6f342af106b26
Author: Kees Cook <keescook@chromium.org>
Date:   Thu Jan 18 23:06:05 2024 +0000

    ubsan: Reintroduce signed overflow sanitizer

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1685d270580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1585d270580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1185d270580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8f8024317adff163ec5a@syzkaller.appspotmail.com
Fixes: 557f8c582a9b ("ubsan: Reintroduce signed overflow sanitizer")

------------[ cut here ]------------
UBSAN: array-index-out-of-bounds in net/ipv6/route.c:1095:9
index 255 is out of range for type 'const int[12]'
CPU: 1 UID: 0 PID: 5835 Comm: kworker/1:3 Not tainted 6.15.0-rc3-syzkaller-00584-gcc17b4b9c332 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
Workqueue: mld mld_ifc_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x40 lib/ubsan.c:231
 __ubsan_handle_out_of_bounds+0xe9/0xf0 lib/ubsan.c:453
 ip6_rt_type_to_error net/ipv6/route.c:1095 [inline]
 ip6_rt_init_dst_reject net/ipv6/route.c:1112 [inline]
 ip6_rt_init_dst net/ipv6/route.c:1137 [inline]
 ip6_rt_copy_init+0x8e7/0x970 net/ipv6/route.c:1175
 ip6_rt_pcpu_alloc net/ipv6/route.c:1424 [inline]
 rt6_make_pcpu_route net/ipv6/route.c:1467 [inline]
 ip6_pol_route+0xbac/0x1180 net/ipv6/route.c:2302
 pol_lookup_func include/net/ip6_fib.h:617 [inline]
 fib6_rule_lookup+0x348/0x6f0 net/ipv6/fib6_rules.c:125
 ip6_route_output_flags_noref net/ipv6/route.c:2674 [inline]
 ip6_route_output_flags+0x364/0x5d0 net/ipv6/route.c:2686
 ip6_route_output include/net/ip6_route.h:93 [inline]
 ip6_dst_lookup_tail+0x1ae/0x1510 net/ipv6/ip6_output.c:1128
 ip6_dst_lookup_flow+0x47/0xe0 net/ipv6/ip6_output.c:1259
 udp_tunnel6_dst_lookup+0x231/0x3c0 net/ipv6/ip6_udp_tunnel.c:165
 geneve6_xmit_skb drivers/net/geneve.c:957 [inline]
 geneve_xmit+0xd2e/0x2b70 drivers/net/geneve.c:1043
 __netdev_start_xmit include/linux/netdevice.h:5203 [inline]
 netdev_start_xmit include/linux/netdevice.h:5212 [inline]
 xmit_one net/core/dev.c:3828 [inline]
 dev_hard_start_xmit+0x2d4/0x830 net/core/dev.c:3844
 __dev_queue_xmit+0x1adf/0x3a70 net/core/dev.c:4681
 dev_queue_xmit include/linux/netdevice.h:3349 [inline]
 neigh_hh_output include/net/neighbour.h:523 [inline]
 neigh_output include/net/neighbour.h:537 [inline]
 ip6_finish_output2+0x11bc/0x16a0 net/ipv6/ip6_output.c:141
 __ip6_finish_output net/ipv6/ip6_output.c:-1 [inline]
 ip6_finish_output+0x234/0x7d0 net/ipv6/ip6_output.c:226
 NF_HOOK+0x9e/0x380 include/linux/netfilter.h:314
 mld_sendpack+0x800/0xd80 net/ipv6/mcast.c:1868
 mld_send_cr net/ipv6/mcast.c:2169 [inline]
 mld_ifc_work+0x835/0xde0 net/ipv6/mcast.c:2702
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
---[ end trace ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
