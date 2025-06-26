Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7A12EAD05
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948866; cv=none; b=HHghJKdyEvvQpiPdIK554I2W3Gpi0qP0VCjLBa4oOGNISp6XR6dRg/IERosauuaiRERl6fMx1oFlAvQkgqC/poQyDS8hKw3FwSEyBeN4X1M7nDfUZn/1TJXIpC13MWYHmzL5QSqWFGgXfPhCrSqeqowkreeQW+jjAUlOEW7J95A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948866; c=relaxed/simple;
	bh=X1GESMzgSf3XVU7cK7/7HSiUJE6g/3qDjDJW50tWYGw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JgBJW5xkdnFoAKsTCOnysBaX3n8sqT+qvR+JefsTIUPDOwYS/5rFShKPFB+MdjGEZqa87jEQeyKh4kTtHoJfL64Fe8kgt9NJ8oPsoM/VYjKeU0+S8hxFNSGoMZ0QlNQzN8ZgqGVXQTbs7jN0vLNnslbZM87biAMJXgIQvCzmeX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3de3b5b7703so6767585ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948864; x=1751553664;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Kn0V+act1UzVo4L9sAQPQWX3NuE9xBcp5UEO0OZZJc=;
        b=wUlQmRvfkeCbutjbgqO8tjtZslUCqcuTOkyPVkKOZMueVcfkonmU9lpARrl80udaRh
         AeUiCNpM2ax6yXdCdh9Ic65S5NvGFy/ytHqi7yhhSnVETUzJgY556uNBNHDB9ii/TGRU
         cZ1NbfRtrpzTNIZN6LohrukO6GwFA1NLkdimwcIsBGrzlhklo/ybgYa6VRrcQN/zC85z
         ZXBw8ImRPs3ipeDkXY+2ZQ/FaOZr4TtqJmVmwcEjuEzfI1Lj2zMUcLBR3p0SgSLfFeSy
         eYOLvbgKGrq5YNiWcjoZ1X+8bZY7JMV0iLpKnK2SAbp3ywEwP5oCm7ZKVJjvfwF8Rs4n
         70EA==
X-Forwarded-Encrypted: i=1; AJvYcCXx1036nwHgOP5/vHya0qdfPj6IQHSNOjkmOSRPa7VHH9JrrhvgRkZY9ec8pB/euRDjfC/QPE2HTkI5wRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYIOcMPdIr1LTrzR3pZHFU2JubjRxMYSUUDb7//cBR1D8WA2uC
	24gDyx96jR8NTx/6YOnGDiWDXVDEM82moV9O/vnLPDuM77VTWyrxULfyOFL2+5nXpdsSS1IlKi5
	vnrKqHtBMTNHBsDZUg8b6t+AqM9PWyMfQ4RPeGPh3MaYHrdn/djRDk++LDMw=
X-Google-Smtp-Source: AGHT+IHRUO6EiXQpJ85SsvGMK+u+HpJlXirDfA5Z4OWIfWl82t0AnDjU9N7xcHTgcpd1NbAQWBsELsUCxQquhEWhxixlpsU9Ky+0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4518:20b0:3df:4024:9402 with SMTP id
 e9e14a558f8ab-3df402495a3mr26589995ab.8.1750948864113; Thu, 26 Jun 2025
 07:41:04 -0700 (PDT)
Date: Thu, 26 Jun 2025 07:41:04 -0700
In-Reply-To: <tencent_BE9E321B554B031B9E25CABA09BB2D338B08@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685d5c00.a00a0220.2e5631.02aa.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_ioctl (2)
From: syzbot <syzbot+14afda08dc3484d5db82@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
possible deadlock in nr_rt_device_down

======================================================
WARNING: possible circular locking dependency detected
6.16.0-rc3-syzkaller-gee88bddf7f2f-dirty #0 Not tainted
------------------------------------------------------
syz.1.46/6768 is trying to acquire lock:
ffff888105e21e70 (&nr_node->node_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffff888105e21e70 (&nr_node->node_lock){+...}-{3:3}, at: nr_node_lock include/net/netrom.h:152 [inline]
ffff888105e21e70 (&nr_node->node_lock){+...}-{3:3}, at: nr_rt_device_down+0x18e/0x810 net/netrom/nr_route.c:518

but task is already holding lock:
ffffffff90595058 (nr_node_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
ffffffff90595058 (nr_node_list_lock){+...}-{3:3}, at: nr_rt_device_down+0xd3/0x810 net/netrom/nr_route.c:516

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (nr_node_list_lock){+...}-{3:3}:
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_del_node net/netrom/nr_route.c:347 [inline]
       nr_rt_ioctl+0x210f/0x29a0 net/netrom/nr_route.c:677
       nr_ioctl+0x19a/0x2e0 net/netrom/af_netrom.c:1254
       sock_do_ioctl+0x115/0x280 net/socket.c:1190
       sock_ioctl+0x227/0x6b0 net/socket.c:1311
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl fs/ioctl.c:893 [inline]
       __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:893
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&nr_node->node_lock){+...}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3168 [inline]
       check_prevs_add kernel/locking/lockdep.c:3287 [inline]
       validate_chain kernel/locking/lockdep.c:3911 [inline]
       __lock_acquire+0x126f/0x1c90 kernel/locking/lockdep.c:5240
       lock_acquire kernel/locking/lockdep.c:5871 [inline]
       lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5828
       __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
       _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
       spin_lock_bh include/linux/spinlock.h:356 [inline]
       nr_node_lock include/net/netrom.h:152 [inline]
       nr_rt_device_down+0x18e/0x810 net/netrom/nr_route.c:518
       nr_device_event+0x126/0x170 net/netrom/af_netrom.c:126
       notifier_call_chain+0xb9/0x410 kernel/notifier.c:85
       call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2230
       call_netdevice_notifiers_extack net/core/dev.c:2268 [inline]
       call_netdevice_notifiers net/core/dev.c:2282 [inline]
       __dev_notify_flags+0x1f7/0x2e0 net/core/dev.c:9499
       netif_change_flags+0x108/0x160 net/core/dev.c:9526
       dev_change_flags+0xba/0x250 net/core/dev_api.c:68
       dev_ifsioc+0x1498/0x1f70 net/core/dev_ioctl.c:565
       dev_ioctl+0x223/0x10e0 net/core/dev_ioctl.c:823
       sock_do_ioctl+0x19d/0x280 net/socket.c:1204
       sock_ioctl+0x227/0x6b0 net/socket.c:1311
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl fs/ioctl.c:893 [inline]
       __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:893
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(nr_node_list_lock);
                               lock(&nr_node->node_lock);
                               lock(nr_node_list_lock);
  lock(&nr_node->node_lock);

 *** DEADLOCK ***

3 locks held by syz.1.46/6768:
 #0: ffffffff9033f628 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #0: ffffffff9033f628 (rtnl_mutex){+.+.}-{4:4}, at: dev_ioctl+0x212/0x10e0 net/core/dev_ioctl.c:822
 #1: ffffffff90594ff8 (nr_neigh_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #1: ffffffff90594ff8 (nr_neigh_list_lock){+...}-{3:3}, at: nr_rt_device_down+0x2c/0x810 net/netrom/nr_route.c:513
 #2: ffffffff90595058 (nr_node_list_lock){+...}-{3:3}, at: spin_lock_bh include/linux/spinlock.h:356 [inline]
 #2: ffffffff90595058 (nr_node_list_lock){+...}-{3:3}, at: nr_rt_device_down+0xd3/0x810 net/netrom/nr_route.c:516

stack backtrace:
CPU: 3 UID: 0 PID: 6768 Comm: syz.1.46 Not tainted 6.16.0-rc3-syzkaller-gee88bddf7f2f-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_circular_bug+0x275/0x350 kernel/locking/lockdep.c:2046
 check_noncircular+0x14c/0x170 kernel/locking/lockdep.c:2178
 check_prev_add kernel/locking/lockdep.c:3168 [inline]
 check_prevs_add kernel/locking/lockdep.c:3287 [inline]
 validate_chain kernel/locking/lockdep.c:3911 [inline]
 __lock_acquire+0x126f/0x1c90 kernel/locking/lockdep.c:5240
 lock_acquire kernel/locking/lockdep.c:5871 [inline]
 lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5828
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
 _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:356 [inline]
 nr_node_lock include/net/netrom.h:152 [inline]
 nr_rt_device_down+0x18e/0x810 net/netrom/nr_route.c:518
 nr_device_event+0x126/0x170 net/netrom/af_netrom.c:126
 notifier_call_chain+0xb9/0x410 kernel/notifier.c:85
 call_netdevice_notifiers_info+0xbe/0x140 net/core/dev.c:2230
 call_netdevice_notifiers_extack net/core/dev.c:2268 [inline]
 call_netdevice_notifiers net/core/dev.c:2282 [inline]
 __dev_notify_flags+0x1f7/0x2e0 net/core/dev.c:9499
 netif_change_flags+0x108/0x160 net/core/dev.c:9526
 dev_change_flags+0xba/0x250 net/core/dev_api.c:68
 dev_ifsioc+0x1498/0x1f70 net/core/dev_ioctl.c:565
 dev_ioctl+0x223/0x10e0 net/core/dev_ioctl.c:823
 sock_do_ioctl+0x19d/0x280 net/socket.c:1204
 sock_ioctl+0x227/0x6b0 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6abb785d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6abc617038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f6abb975fa0 RCX: 00007f6abb785d29
RDX: 0000000020000000 RSI: 0000000000008914 RDI: 0000000000000006
RBP: 00007f6abb801b08 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f6abb975fa0 R15: 00007ffc3bc2e9c8
 </TASK>


Tested on:

commit:         ee88bddf Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1007b182580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=644a0493ff5118b1
dashboard link: https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14217dd4580000

