Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B281DF26B
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748261383; cv=none; b=bPWKFh888TS6YBDkzhfkLBcuGhd8PdSQuWQ14FaBkCb6ox1KbRLS1ucPa6Av8364B2ADSRlEMZq0NeWVnIuPzWdDppNpEM5ZLfug23M5MC3oMRIBQaq7abS7+rxs+qPfLqbCiW3MoWfX3sg4sxMlI/ZQsQWg6meQThnMVFsfeUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748261383; c=relaxed/simple;
	bh=r307oOav27bh/GCtWSjsyjOv2ysXRUjLoCTrGOgjejs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=WPeO7dz6nDRqQqDXN12N/+nZoTjQo3Gm4QnOro11bZxGkRsTFnKFSIUwYymAzaMGOUlB2NZOde5FxsHCKr/RKQj4bhldnvoWaW4mNkABvh8yGVuY94ZZAXr16qSlsGWxNlX0ey15ghVNpOTrVsRr9qmT4cnPehO7PT23RPomzgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3dc6e2441caso43592805ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748261380; x=1748866180;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bc8m3uNBk63pQUs0Jd3xv2CJLuGkI7NaSEPp2nrSNRA=;
        b=fSXNHwly9gRMLUGu61gASQWvnwrRbMojg4XFwfbe3dOPvsRxt/Xz6LPrBM25AGLlvO
         hb+9STFiBtFw/gz4rFOK573a9ZrQ1btXNRsIBOWXs42EbMtVweIhVJ6U2YYGllMrD5Tk
         2BA5yjHq+qplSwYooTasmky+OAyhB1/s2O/RyKdKjnSw4sUCpzhE2kTJH/3EVLAZaQOg
         x5BFezWKzFQVgIYjfqWxtjI4erct9VlGJB0QiiQ65xn+YUG5TUjtO9nzFhhV4sDZCfVi
         zmQlGau69sWI6i8UgpC93LfY0tWkHh6v5Cqxkj/EOlW6i+RAqXMMUPgIVabdpETi3fJW
         +PLg==
X-Forwarded-Encrypted: i=1; AJvYcCW+UOPNnakbs2RHg4EZGoTELrnGJz96NvNccPdxLrnuDzrciYCq0w1uaalbMWfB6gtu3dPjGliqCUtQChw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxGtNxDb6e4NRHL5fKUrQ7yygBzmX5rXhCXmxYrH1L8yXfBcLU
	kRvOeC+usyTtFAWP6c3rRn/Ymq0quJMyMg7vSY70k6cHr1m+u+sIXOReWCDj5bb3y+BXamSepn5
	ShS4NROmcAO1HZlrfoiNmzya3VRyBP3AB9toZkeIEBQ3WCZGK3qGCO1aXP8U=
X-Google-Smtp-Source: AGHT+IGvaYFtuaWbLF8NbZasy9S/7LrbIMg8qGIOkMvKzUGj72+KOaJCK9nruNqiA0FvdcTdrIACw8gIyvwCPvtC5jHPwDgZPcBi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:7211:b0:864:a1e9:f07 with SMTP id
 ca18e2360f4ac-86cbb80a7ecmr1015145839f.8.1748261370375; Mon, 26 May 2025
 05:09:30 -0700 (PDT)
Date: Mon, 26 May 2025 05:09:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683459fa.a70a0220.29d4a0.0805.GAE@google.com>
Subject: [syzbot] [net?] KMSAN: uninit-value in neigh_parms_release (2)
From: syzbot <syzbot+e92e583f97128c407c8f@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d608703fcdd9 Merge tag 'clk-fixes-for-linus' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14faaad4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a423536a47898618
dashboard link: https://syzkaller.appspot.com/bug?extid=e92e583f97128c407c8f
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1fda1290c911/disk-d608703f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4551a247db11/vmlinux-d608703f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3d7ce8478d11/bzImage-d608703f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e92e583f97128c407c8f@syzkaller.appspotmail.com

team0 (unregistering): Port device team_slave_1 removed
team0 (unregistering): Port device team_slave_0 removed
=====================================================
BUG: KMSAN: uninit-value in ref_tracker_free+0x4fa/0xe80 lib/ref_tracker.c:228
 ref_tracker_free+0x4fa/0xe80 lib/ref_tracker.c:228
 netdev_tracker_free include/linux/netdevice.h:4351 [inline]
 netdev_put include/linux/netdevice.h:4368 [inline]
 neigh_parms_release+0x20d/0x3e0 net/core/neighbour.c:1709
 addrconf_ifdown+0x2e39/0x32e0 net/ipv6/addrconf.c:4011
 addrconf_notify+0x183/0x1d10 net/ipv6/addrconf.c:3780
 notifier_call_chain kernel/notifier.c:85 [inline]
 raw_notifier_call_chain+0xe0/0x410 kernel/notifier.c:453
 call_netdevice_notifiers_info+0x1ac/0x2b0 net/core/dev.c:2176
 call_netdevice_notifiers_extack net/core/dev.c:2214 [inline]
 call_netdevice_notifiers net/core/dev.c:2228 [inline]
 unregister_netdevice_many_notify+0x2cc8/0x4980 net/core/dev.c:11972
 unregister_netdevice_many net/core/dev.c:12036 [inline]
 default_device_exit_batch+0x1186/0x1250 net/core/dev.c:12530
 ops_exit_list net/core/net_namespace.c:177 [inline]
 cleanup_net+0x1218/0x1de0 net/core/net_namespace.c:654
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xb9a/0x1d90 kernel/workqueue.c:3319
 worker_thread+0xedf/0x1590 kernel/workqueue.c:3400
 kthread+0xd5c/0xf00 kernel/kthread.c:464
 ret_from_fork+0x71/0x90 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was created at:
 __alloc_frozen_pages_noprof+0x689/0xf00 mm/page_alloc.c:4989
 alloc_pages_mpol+0x328/0x860 mm/mempolicy.c:2301
 alloc_frozen_pages_noprof+0xf7/0x200 mm/mempolicy.c:2372
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab+0x24d/0x1210 mm/slub.c:2618
 new_slab mm/slub.c:2672 [inline]
 ___slab_alloc+0xfec/0x3480 mm/slub.c:3858
 __slab_alloc mm/slub.c:3948 [inline]
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kmalloc_noprof+0xa96/0x1310 mm/slub.c:4339
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 new_dir fs/proc/proc_sysctl.c:963 [inline]
 get_subdir fs/proc/proc_sysctl.c:1007 [inline]
 sysctl_mkdir_p fs/proc/proc_sysctl.c:1317 [inline]
 __register_sysctl_table+0x1988/0x2b90 fs/proc/proc_sysctl.c:1392
 register_net_sysctl_sz+0x3dc/0x3f0 net/sysctl_net.c:171
 neigh_sysctl_register+0x18bb/0x1b30 net/core/neighbour.c:3793
 devinet_sysctl_register+0x164/0x420 net/ipv4/devinet.c:2715
 inetdev_init+0x5f8/0x970 net/ipv4/devinet.c:291
 inetdev_event+0x1162/0x25e0 net/ipv4/devinet.c:1591
 notifier_call_chain kernel/notifier.c:85 [inline]
 raw_notifier_call_chain+0xe0/0x410 kernel/notifier.c:453
 call_netdevice_notifiers_info+0x1ac/0x2b0 net/core/dev.c:2176
 call_netdevice_notifiers_extack net/core/dev.c:2214 [inline]
 call_netdevice_notifiers net/core/dev.c:2228 [inline]
 register_netdevice+0x22d4/0x2610 net/core/dev.c:11037
 ipvlan_link_new+0x619/0x1090 drivers/net/ipvlan/ipvlan_main.c:592
 rtnl_newlink_create+0x416/0x1230 net/core/rtnetlink.c:3833
 __rtnl_newlink net/core/rtnetlink.c:3950 [inline]
 rtnl_newlink+0x2f13/0x3a90 net/core/rtnetlink.c:4065
 rtnetlink_rcv_msg+0x106c/0x14b0 net/core/rtnetlink.c:6955
 netlink_rcv_skb+0x54a/0x680 net/netlink/af_netlink.c:2534
 rtnetlink_rcv+0x35/0x40 net/core/rtnetlink.c:6982
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0xed5/0x1290 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x10b3/0x1250 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x333/0x3d0 net/socket.c:727
 __sys_sendto+0x590/0x710 net/socket.c:2180
 __do_sys_sendto net/socket.c:2187 [inline]
 __se_sys_sendto net/socket.c:2183 [inline]
 __x64_sys_sendto+0x130/0x200 net/socket.c:2183
 x64_sys_call+0x3c0b/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:45
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 0 UID: 0 PID: 4200 Comm: kworker/u8:17 Not tainted 6.15.0-rc7-syzkaller-00014-gd608703fcdd9 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: netns cleanup_net
=====================================================


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
