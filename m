Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC91208994
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836666; cv=none; b=E3DnSJBJErXyhySlfxivG5Pp2k0c0s0vSicY4YeR4QzkGzJ9WE92Mx598Cl1bZMDLVeZOKi47mVNnVfykc/lBNtDMshIavDCiEFk+KlYxPx0FANTmfo5T6UKN/5Xk1O/Qsf3WtqsGQTXgslRH0zFF6DK7nDOQWMHlbw/NoVhEoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836666; c=relaxed/simple;
	bh=enwc6siwWqejWvHg/8CXo0b19QI6VFOQvytZxc12OBk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aEtnN03Y4oc9J8/ZkuROkF+xeBWn8dZfDMWXUeDNiB+cvBDUV3DmLrCSKfiNOp1whVwnW8v5lb6D+wl7Tg6hFemmkNTwfETSjGfjCFq9Tbi0mp0y34CkAtxkaHRT3vsEZ1PWxa6yZEXvWH8Jf7rOEwBLSzWhKBggNJ5WyTVtFOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddcfea00afso86164995ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836664; x=1751441464;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tFSamtJJ14qgm2+T3W3VWjVLY8UZ9C/+LXnbFF3DDrM=;
        b=MFLxhSEDxpR5mMN8+105nQADn3DTNh+HUrEfFwbxus5Sqx4Ote7QnLrndXusEW3dfU
         sIkI0f97NSke2HgFpoYqHT83bMWl2Y0hMNEKlf/6qFJq2LOjH0z2f5v8oTU2ZIO/c3yQ
         Zgh63VxBIwamdfSmuFRXF1puKOwwQF1rixtPkK/a57+MZe9r5djrkeIdm07lf3Ornq3y
         TWclzLUE/KzaCJPD+FHn4zc+kgCv9H34GD8qrqTntMuDskfVYMsRvjqmEGmVWt2uwnH7
         fq2CYjr1sYBN1CYOcphgQvjfcWHIa33DDwNJjlyJsRylZvygsQx1piNok27lSKJaodCE
         GGPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJko11CXnKgD107bE/wY9WLrY8U0vHtVVrZvhZx3SMyhiji7svu8YfPIOJVOnGYD95uOIMJiPbqVxxXKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbZgcpD0+0PezTgKDF2Ks405pm5T62OsxmmNcBzVEXHmfVc1nU
	Amjm4zlZiy3tEviXVaR5k6BGyyXsqcHCQCeCBs0ECki9zpF6F0zfsqC5yOnfJsblwkxmF9ttKxX
	H9WcvwkfEWkefGgw5NXB2A1qQGZ0tfe0JMWn7jpaKPphUTEkJqyCKtaFEA+c=
X-Google-Smtp-Source: AGHT+IHky0SaAylPnmbt/AEjXVi+umOh4ZG85JXgF87TOEPV/yK1PJC+fYZQ7jFL4Z9MflUtAmKZb7toj/4EYGfZiQMfStcXo9+Z
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:248a:b0:3dd:cba4:bfec with SMTP id
 e9e14a558f8ab-3df32920ce0mr20475555ab.1.1750836663715; Wed, 25 Jun 2025
 00:31:03 -0700 (PDT)
Date: Wed, 25 Jun 2025 00:31:03 -0700
In-Reply-To: <20250625071208.1726-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <685ba5b7.a00a0220.2e5631.00bd.GAE@google.com>
Subject: Re: [syzbot] [hams?] KASAN: slab-use-after-free Read in rose_get_neigh
From: syzbot <syzbot+e04e2c007ba2c80476cb@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in rose_get_neigh

==================================================================
BUG: KASAN: slab-use-after-free in rose_get_neigh+0x48e/0xb20 net/rose/rose_route.c:695
Read of size 1 at addr ffff8880287d5430 by task syz.1.592/8046

CPU: 1 UID: 0 PID: 8046 Comm: syz.1.592 Not tainted 6.16.0-rc3-syzkaller-g7595b66ae9de-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 rose_get_neigh+0x48e/0xb20 net/rose/rose_route.c:695
 rose_connect+0x416/0x10a0 net/rose/af_rose.c:816
 __sys_connect_file net/socket.c:2038 [inline]
 __sys_connect+0x313/0x440 net/socket.c:2057
 __do_sys_connect net/socket.c:2063 [inline]
 __se_sys_connect net/socket.c:2060 [inline]
 __x64_sys_connect+0x7a/0x90 net/socket.c:2060
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f04d738e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f04d820b038 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: ffffffffffffffda RBX: 00007f04d75b5fa0 RCX: 00007f04d738e969
RDX: 000000000000001c RSI: 0000200000000040 RDI: 0000000000000008
RBP: 00007f04d7410ab1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f04d75b5fa0 R15: 00007fffa69f4f58
 </TASK>

Allocated by task 6760:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x230/0x3d0 mm/slub.c:4359
 kmalloc_noprof include/linux/slab.h:905 [inline]
 rose_add_node+0x23a/0xde0 net/rose/rose_route.c:85
 rose_rt_ioctl+0xa48/0xfb0 net/rose/rose_route.c:752
 rose_ioctl+0x3ce/0x8b0 net/rose/af_rose.c:1380
 sock_do_ioctl+0xd9/0x300 net/socket.c:1190
 sock_ioctl+0x576/0x790 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 8049:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2381 [inline]
 slab_free mm/slub.c:4643 [inline]
 kfree+0x18e/0x440 mm/slub.c:4842
 rose_rt_device_down+0x5e1/0x630 net/rose/rose_route.c:523
 rose_device_event+0x603/0x6a0 net/rose/af_rose.c:248
 notifier_call_chain+0x1b3/0x3e0 kernel/notifier.c:85
 call_netdevice_notifiers_extack net/core/dev.c:2268 [inline]
 call_netdevice_notifiers net/core/dev.c:2282 [inline]
 __dev_notify_flags+0x18d/0x2e0 net/core/dev.c:-1
 netif_change_flags+0xe8/0x1a0 net/core/dev.c:9526
 dev_change_flags+0x130/0x260 net/core/dev_api.c:68
 dev_ioctl+0x7b4/0x1150 net/core/dev_ioctl.c:823
 sock_do_ioctl+0x22c/0x300 net/socket.c:1204
 sock_ioctl+0x576/0x790 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880287d5400
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 48 bytes inside of
 freed 512-byte region [ffff8880287d5400, ffff8880287d5600)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff8880287d5800 pfn:0x287d4
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88801a441c80 ffffea00016abd10 ffffea0000a3c510
raw: ffff8880287d5800 000000000010000e 00000000f5000000 0000000000000000
head: 00fff00000000240 ffff88801a441c80 ffffea00016abd10 ffffea0000a3c510
head: ffff8880287d5800 000000000010000e 00000000f5000000 0000000000000000
head: 00fff00000000002 ffffea0000a1f501 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 13836989135, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x21d5/0x22b0 mm/page_alloc.c:3669
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4959
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2451 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2619
 new_slab mm/slub.c:2673 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3859
 __slab_alloc mm/slub.c:3949 [inline]
 __slab_alloc_node mm/slub.c:4024 [inline]
 slab_alloc_node mm/slub.c:4185 [inline]
 __kmalloc_cache_noprof+0x296/0x3d0 mm/slub.c:4354
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kmalloc_array_noprof include/linux/slab.h:948 [inline]
 dev_pm_qos_constraints_allocate+0x8f/0x3f0 drivers/base/power/qos.c:205
 __dev_pm_qos_add_request+0x123/0x4c0 drivers/base/power/qos.c:345
 dev_pm_qos_add_request+0x36/0x60 drivers/base/power/qos.c:395
 usb_hub_create_port_device+0x48f/0xb90 drivers/usb/core/port.c:783
 hub_configure drivers/usb/core/hub.c:1711 [inline]
 hub_probe+0x25af/0x36e0 drivers/usb/core/hub.c:1977
 usb_probe_interface+0x641/0xbc0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
page_owner free stack trace missing

Memory state around the buggy address:
 ffff8880287d5300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880287d5380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880287d5400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                     ^
 ffff8880287d5480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880287d5500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         7595b66a Merge tag 'selinux-pr-20250624' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10d21b70580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4ec8b4e4d31ae914
dashboard link: https://syzkaller.appspot.com/bug?extid=e04e2c007ba2c80476cb
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13284f0c580000

