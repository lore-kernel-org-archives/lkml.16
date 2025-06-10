Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF44280A52
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546905; cv=none; b=Gx6IV8pXXp1wtyedRaLkmKdz/wbNfMvStknVCV+z4sYwbnJHCyQ7IRQGcMPp7VAcE6QQyH+E7N++saB/6WzOdtulzeS1q+vua1I7ZxYHrgKZLMhAWowiCj/qJ5w8ZwGJ0N7egK8m/SEahZhVJW8HW5lNPym2odRGvGIeQWxMxVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546905; c=relaxed/simple;
	bh=P6LhM9/l0rs9DQVKYhhQ2tbIg6uzs/sL4IyI1kUMnKw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=anohbf+Js5k3M1Up0bejJLzP4seNI2snZx7ymkNb8ag7NdATFnZI4HvEEJSZLzsuEaumq3Y6zSAv2/JNAH5nyjATg/uqh+Ui7RYlNCzDeHN74Q9mhtGOss3NCOHeCn0/47IcXWLmJVQwRwKsWGGQ5Ixzus/3TBOoN+DnYsYz+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86cff1087deso1044131739f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546903; x=1750151703;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQSk6w2yBl8lFt0UEzey/IqRcxZcVfuFyzMQckSyiYw=;
        b=KKWk/iHV/ClZMCNAqyaAwCKWTuIqZn8WlEjtAhS6tIoTgutV1BHJbIfeguNj5/ifn+
         VxTEuq7B+CE25PsnnCUbQ0EuT0pHoGGtYgdycmtYbA39sk4Qg4GVhs26tRLqSVutcrGz
         ZNqF0TvxOwUL7J4jDdmGRM9GmBYCRp3+fZoIJsYIxiCFb9LUjLrrMbaN8YTiGa8FzD6l
         jaCQZqbwnd0M5vSK8J9kWTqGE5WfSE/MuK83KebzSPkh5JsJOMYsBuLENrMF/3mf9Aw+
         zwqbKAVxxZMqUQrJ6jjtxkKC8ppeJx4hKjIMNCUXO1YZSKb6hE6TbRMK9MDiwvEXy91L
         NLYg==
X-Forwarded-Encrypted: i=1; AJvYcCVHEHj9W9EEcXl2OxOwfeKK49AwlSTRCI5kg2sgCCqInUAaMTqnG57638Q7MekD7m8+Na9c1tz2xU422lA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjH1kzAfGF7upjayzvPqmvgDQ/XPI8WmTRr73tSbg7kY7JRD13
	PlWfv4Uw2A9SZMRamq05wb5mZrWORVzDzMcd1HN5cg/bJ2or3Xwp9XgORhmunVNzm/eCOsAN9Th
	luYRNipQ4LoY8oOOsftlia3SPCJ/mNmyYyywJI29VOJkUfbYboYaQd1OTNEI=
X-Google-Smtp-Source: AGHT+IHZjWfbdccPS9aJrzEtv4WuRG9ttq28Gf3X+3iV8yTYC6318LP5y13VYe41Nla7vkpK/i9OWUVCvGSXaRfvbgr3MjdFfv5C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4513:b0:3dd:d746:25eb with SMTP id
 e9e14a558f8ab-3ddd74626f0mr90927555ab.16.1749546903072; Tue, 10 Jun 2025
 02:15:03 -0700 (PDT)
Date: Tue, 10 Jun 2025 02:15:03 -0700
In-Reply-To: <20250610085513.1045-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6847f797.a70a0220.27c366.0062.GAE@google.com>
Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_device_down (3)
From: syzbot <syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-use-after-free Write in nr_neigh_put

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
BUG: KASAN: slab-use-after-free in atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
BUG: KASAN: slab-use-after-free in __refcount_sub_and_test include/linux/refcount.h:389 [inline]
BUG: KASAN: slab-use-after-free in __refcount_dec_and_test include/linux/refcount.h:432 [inline]
BUG: KASAN: slab-use-after-free in refcount_dec_and_test include/linux/refcount.h:450 [inline]
BUG: KASAN: slab-use-after-free in nr_neigh_put+0x21/0x170 include/net/netrom.h:139
Write of size 4 at addr ffff8880532bfdbc by task syz.2.169/6376

CPU: 0 UID: 0 PID: 6376 Comm: syz.2.169 Not tainted 6.16.0-rc1-syzkaller-gf09079bd04a9-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xd2/0x2b0 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x2b0/0x2c0 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
 __refcount_sub_and_test include/linux/refcount.h:389 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 nr_neigh_put+0x21/0x170 include/net/netrom.h:139
 nr_dec_obs net/netrom/nr_route.c:470 [inline]
 nr_rt_ioctl+0x450/0xd50 net/netrom/nr_route.c:692
 sock_do_ioctl+0xd9/0x300 net/socket.c:1190
 sock_ioctl+0x576/0x790 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f409d98e169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f409e7ce038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f409dbb5fa0 RCX: 00007f409d98e169
RDX: 0000000000000000 RSI: 00000000000089e2 RDI: 0000000000000004
RBP: 00007f409da10a68 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f409dbb5fa0 R15: 00007ffd35252ff8
 </TASK>

Allocated by task 6376:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x230/0x3d0 mm/slub.c:4359
 kmalloc_noprof include/linux/slab.h:905 [inline]
 nr_add_node+0x7f8/0x2570 net/netrom/nr_route.c:146
 nr_rt_ioctl+0xc15/0xd50 net/netrom/nr_route.c:651
 sock_do_ioctl+0xd9/0x300 net/socket.c:1190
 sock_ioctl+0x576/0x790 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6376:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2381 [inline]
 slab_free mm/slub.c:4643 [inline]
 kfree+0x18e/0x440 mm/slub.c:4842
 __nr_remove_neigh net/netrom/nr_route.c:299 [inline]
 nr_remove_neigh net/netrom/nr_route.c:308 [inline]
 nr_dec_obs net/netrom/nr_route.c:469 [inline]
 nr_rt_ioctl+0x43c/0xd50 net/netrom/nr_route.c:692
 sock_do_ioctl+0xd9/0x300 net/socket.c:1190
 sock_ioctl+0x576/0x790 net/socket.c:1311
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8880532bfd80
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 60 bytes inside of
 freed 64-byte region [ffff8880532bfd80, ffff8880532bfdc0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x532bf
anon flags: 0x4fff00000000000(node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000000 ffff88801a4418c0 0000000000000000 dead000000000001
raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 5661, tgid 5661 (udevd), ts 182084382126, free_ts 182082569600
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
 tomoyo_path_perm+0x213/0x4b0 security/tomoyo/file.c:822
 security_inode_getattr+0x12f/0x330 security/security.c:2377
 vfs_getattr fs/stat.c:259 [inline]
 vfs_fstat fs/stat.c:281 [inline]
 __do_sys_newfstat fs/stat.c:555 [inline]
 __se_sys_newfstat fs/stat.c:550 [inline]
 __x64_sys_newfstat+0xfc/0x200 fs/stat.c:550
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 6053 tgid 6053 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0xc71/0xe70 mm/page_alloc.c:2706
 tlb_batch_list_free mm/mmu_gather.c:159 [inline]
 tlb_finish_mmu+0x112/0x1d0 mm/mmu_gather.c:500
 exit_mmap+0x44c/0xb50 mm/mmap.c:1297
 __mmput+0x118/0x420 kernel/fork.c:1121
 exit_mm+0x1da/0x2c0 kernel/exit.c:581
 do_exit+0x640/0x22e0 kernel/exit.c:943
 do_group_exit+0x21c/0x2d0 kernel/exit.c:1104
 __do_sys_exit_group kernel/exit.c:1115 [inline]
 __se_sys_exit_group kernel/exit.c:1113 [inline]
 __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1113
 x64_sys_call+0x21ba/0x21c0 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880532bfc80: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
 ffff8880532bfd00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>ffff8880532bfd80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                        ^
 ffff8880532bfe00: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff8880532bfe80: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
==================================================================


Tested on:

commit:         f09079bd Merge tag 'powerpc-6.16-2' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=146efa0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5080a302f3378422
dashboard link: https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=102e69d4580000

