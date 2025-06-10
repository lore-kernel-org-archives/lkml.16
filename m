Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D9521B9FF
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544144; cv=none; b=HkpMgcVwbGVLnpW2Su99+B46yBKHSkYEWBzzjAOHlH+ASfXT9IBYFX/xtrvJ1R6p0ZjpuM4BPVtLXvs+18u34RLnOX+11lPfm8CsbE4NWNy6mXnnbC57bLpXOH3xrPZD9xpPd+t+frsnXOxMIXe0WxQ3ehuC7rucpurZRa/Mw7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544144; c=relaxed/simple;
	bh=qyQMrstKtEdojLEVv3ULza0hkNOhUy+7prtXx4DsI9k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=oRORF3nec+K0mYSDNuYBjWNUgdvyvh10lw8IaaXc58A1gfsNdaoYbEdyCToAiDxQL6D2hbZweKEwGyAq2X/moJV03vyFjXRM4l/JYyrdn9ldhKIDMG4Afzl7MK1LGQqO93QeYOyi0s5FQFfw+/ZUAFdDmvZJlnPnom/UVgiUyNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddc5137992so69768805ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544142; x=1750148942;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0SpBoEFeQ/cPJ9ggbkYJRFNlVvB4EZzWbQyys7hB4qY=;
        b=CpqJtMzYOsb9cmy/Wj5X8NlN8jRazPKgvQhIVqeVpgKjROQ/gbNRFus13Yp4+Ga1YS
         lPKBrOtCZl8Pnvdygj2+5EGeXsSf6bPT9zVriJG+Goy83TPfP/54a0HRKh4uxVgKeZcL
         IALOC16XFnvpxwU/HUI5KdgPAhpw8Kvoodu+ExrdE2160lJmlxygaUFWD2Q69DDTq/PQ
         JqCX7oJEK/wwC5H716H6jlb20hNPlbK7vCR4S+3RFkRZfLDOmxn69ajTto5tQdNXw8Pi
         3hJVIm//ptYbd7/aAInFcuw4KCw1ZvB+ILBcLrPMQIsIKpqCwP69VqwDAD0ZbwlsBEed
         1vFg==
X-Forwarded-Encrypted: i=1; AJvYcCVs7a/OEx0R+juzRnS8v8KQ4oVf/cUpNBQv+sggkMIMZlkvbMs0h6PSx+aTIix3lbq+MLhxFSvcfxfkDjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEgm4uDVhc2Kpk1t+LmUKGinELHJoZNVR5Eff9yxyNESCZSXvI
	qzSb5y4t+UHdqqxF8MX8B+hOxXVFkQPZINDoA28eZ/PgJFpDaYFZ0CoQ7h/JH5YhXf+RNaLoj8r
	2KIXC4+O2dhjuxYBeAh8V1X6dookLDUUcj/FybHwJd8qhK5yT4hMh80+//FA=
X-Google-Smtp-Source: AGHT+IEJSg/MGs1wwu9IIDGmOXe6jZohdmdgUkDefG0DVsYi1VkIQsebEuT2Jp+g7XlUoAYk24MxEXezRftxAOLcoQg4W+oJNYLH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cdad:0:b0:3dd:892d:b26d with SMTP id
 e9e14a558f8ab-3ddce4957bcmr166520625ab.17.1749544141825; Tue, 10 Jun 2025
 01:29:01 -0700 (PDT)
Date: Tue, 10 Jun 2025 01:29:01 -0700
In-Reply-To: <20250610080907.998-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6847eccd.a70a0220.27c366.0060.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_device_down (3)
From: syzbot <syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Read in nr_rt_ioctl

==================================================================
BUG: KASAN: slab-use-after-free in nr_dec_obs net/netrom/nr_route.c:471 [inline]
BUG: KASAN: slab-use-after-free in nr_rt_ioctl+0x594/0xd50 net/netrom/nr_route.c:694
Read of size 2 at addr ffff888040d20132 by task syz.2.93/6316

CPU: 0 UID: 0 PID: 6316 Comm: syz.2.93 Not tainted 6.16.0-rc1-syzkaller-gf09079bd04a9-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 nr_dec_obs net/netrom/nr_route.c:471 [inline]
 nr_rt_ioctl+0x594/0xd50 net/netrom/nr_route.c:694
 sock_do_ioctl+0xd9/0x300 net/socket.c:1190
 sock_ioctl+0x576/0x790 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9434b8e169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f943596d038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f9434db5fa0 RCX: 00007f9434b8e169
RDX: 0000000000000000 RSI: 00000000000089e2 RDI: 0000000000000004
RBP: 00007f9434c10a68 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f9434db5fa0 R15: 00007fff7f6ce348
 </TASK>

Allocated by task 6316:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x230/0x3d0 mm/slub.c:4359
 kmalloc_noprof include/linux/slab.h:905 [inline]
 nr_add_node+0x7f8/0x2570 net/netrom/nr_route.c:146
 nr_rt_ioctl+0xc12/0xd50 net/netrom/nr_route.c:653
 sock_do_ioctl+0xd9/0x300 net/socket.c:1190
 sock_ioctl+0x576/0x790 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6316:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2381 [inline]
 slab_free mm/slub.c:4643 [inline]
 kfree+0x18e/0x440 mm/slub.c:4842
 nr_dec_obs net/netrom/nr_route.c:469 [inline]
 nr_rt_ioctl+0x2e7/0xd50 net/netrom/nr_route.c:694
 sock_do_ioctl+0xd9/0x300 net/socket.c:1190
 sock_ioctl+0x576/0x790 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888040d20100
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 50 bytes inside of
 freed 64-byte region [ffff888040d20100, ffff888040d20140)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x40d20
flags: 0x4fff00000000000(node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000000 ffff88801a4418c0 ffffea00014bc540 dead000000000002
raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 6118, tgid 6118 (dhcpcd-run-hook), ts 179889213292, free_ts 179877692964
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1704
 prep_new_page mm/page_alloc.c:1712 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3669
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4959
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
 alloc_slab_page mm/slub.c:2451 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2619
 new_slab mm/slub.c:2673 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3859
 __slab_alloc mm/slub.c:3949 [inline]
 __slab_alloc_node mm/slub.c:4024 [inline]
 slab_alloc_node mm/slub.c:4185 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_noprof+0x305/0x4f0 mm/slub.c:4340
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 tomoyo_encode2 security/tomoyo/realpath.c:45 [inline]
 tomoyo_encode+0x28b/0x550 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x58d/0x5d0 security/tomoyo/realpath.c:283
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x1c1/0x3b0 security/tomoyo/file.c:771
 security_file_open+0xb1/0x270 security/security.c:3114
 do_dentry_open+0x35e/0x1970 fs/open.c:941
 vfs_open+0x3b/0x340 fs/open.c:1094
 do_open fs/namei.c:3887 [inline]
 path_openat+0x2ee5/0x3830 fs/namei.c:4046
 do_filp_open+0x1fa/0x410 fs/namei.c:4073
 do_sys_openat2+0x121/0x1c0 fs/open.c:1437
page last free pid 6118 tgid 6118 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0xc71/0xe70 mm/page_alloc.c:2706
 rcu_do_batch kernel/rcu/tree.c:2576 [inline]
 rcu_core+0xca5/0x1710 kernel/rcu/tree.c:2832
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1050
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702

Memory state around the buggy address:
 ffff888040d20000: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888040d20080: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff888040d20100: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                     ^
 ffff888040d20180: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888040d20200: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         f09079bd Merge tag 'powerpc-6.16-2' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1746fa0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5080a302f3378422
dashboard link: https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1102aa82580000

