Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E9B183CA6
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 17:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747243111; cv=none; b=Qqyet3IQwW6+UeWUwJsi6J9yYlL0IhpMm+sVo1BgV1sGnEGnN6hxeG+X9NN+IEKXvt6SxN+XXcdh2DzopXTYEN0oBGPNTERf+JA3nxAcD5SEtP+ffc3WQB4b2GRhF6TyQ7+2nLgnc5LffgTCXddhrvj99GHJrXKdfQilTE/TuWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747243111; c=relaxed/simple;
	bh=950u9k10sGSQ6JHvizfXzyLXwASdjZUis65ZscnM0XU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Zpbl66vQ0FYDuHMWaKG8neugK0KN5GL/f8mub8LQxo6l6fOhd9prHgqKsvHuNqmsxyfKju7W6gfUcUkjvhWHJR+8ib0r4wrWIGX8cmATWkQn+bmiqolOCpl/eF5Bevmh3n8O5gfCJKydi1dlhyCAg8Wvr8dvx+KaJw/sa55TraI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3db6f98ddf7so251295ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747243109; x=1747847909;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VTKwZzlkl/upe8s+kS5zSf2fAUZ81UUbirQjiUx/qCM=;
        b=H4gNcBahFKp19NPOInI7E3XZev6pI9veyZaAi46lIjGyGIHqwnd9hRXmPxDMTu/hCP
         uAgQkKJT7MH2lkByMjoYf06ANSQxRz+wMjA7S3laA3khv4hZ1Hbt9fug2WLeQjj9osCe
         NiUYaeF3uRS5XdosrtAU4v3q790NkHz8A9s9nkaXdU/0qHyu7cgINEkaPMUfHNaLpzob
         3x1szoLNmcdB/anVy2/pl53tNoeXnSiJFMoXV1MtJmR8lpDfjRtaAWFtuAFrYQZ5TJFx
         k24PX4wPJ6G/E1bjm0ueZOdxoJmfZuh2sfsfiiTT5gGTwZ4crhCHoa4T4wegdBpfmGae
         YwnA==
X-Forwarded-Encrypted: i=1; AJvYcCV0m11KLH6m/7f0h0tF2uVyWJ+4Dmdb+lDCC8pKBb3QgsoaVqv0rWWzkFCpAtGGasZ2vEqfPicIq3FPEIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3WEH6Rrvg/ggPrRio+ecUquobXaAT69hrCMV5NdktSfCbjmH
	gflGzhacwLx7kK2QwggQUoyC6EiCdhDgXH2sIooUT+1BA5DO4yqo4nY97lZ7WjaHWnJXkZbeqi4
	ZxzJEQW/ppcfekPmnu5zptsrcVKpAQ+QNPMZh89gFhETHP1vJYEGLFb8=
X-Google-Smtp-Source: AGHT+IE/xoceW5JkXxGnNDL6ugE+2kMibT8CAUQEjcqiEwWKmIYmFWGmvh6/E6/VjSCisbq3jwFJPt0RuvkYQZbdVK8zY/fthU9r
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d97:b0:3d9:3e8e:60da with SMTP id
 e9e14a558f8ab-3db6f7f4164mr48323125ab.17.1747243108927; Wed, 14 May 2025
 10:18:28 -0700 (PDT)
Date: Wed, 14 May 2025 10:18:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6824d064.a70a0220.3e9d8.001a.GAE@google.com>
Subject: [syzbot] [net?] KASAN: use-after-free Read in __linkwatch_run_queue
From: syzbot <syzbot+1ec2f6a450f0b54af8c8@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9f35e33144ae x86/its: Fix build errors when CONFIG_MODULES=n
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=107f56f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c9b33a466dfee330
dashboard link: https://syzkaller.appspot.com/bug?extid=1ec2f6a450f0b54af8c8
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/136b6fd9c02c/disk-9f35e331.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1db87e48df97/vmlinux-9f35e331.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9588fd34964c/bzImage-9f35e331.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1ec2f6a450f0b54af8c8@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in netdev_need_ops_lock include/net/netdev_lock.h:30 [inline]
BUG: KASAN: use-after-free in netdev_unlock_ops include/net/netdev_lock.h:47 [inline]
BUG: KASAN: use-after-free in __linkwatch_run_queue+0x7d8/0x8a0 net/core/link_watch.c:245
Read of size 8 at addr ffff88807a5ecb88 by task kworker/u8:9/6112

CPU: 0 UID: 0 PID: 6112 Comm: kworker/u8:9 Not tainted 6.15.0-rc6-syzkaller-00052-g9f35e33144ae #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: events_unbound linkwatch_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xc3/0x670 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 netdev_need_ops_lock include/net/netdev_lock.h:30 [inline]
 netdev_unlock_ops include/net/netdev_lock.h:47 [inline]
 __linkwatch_run_queue+0x7d8/0x8a0 net/core/link_watch.c:245
 linkwatch_event+0x8f/0xc0 net/core/link_watch.c:304
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88807a5efc00 pfn:0x7a5ec
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 ffffea0001aedf08 ffff8880b853fa00 0000000000000000
raw: ffff88807a5efc00 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as freed
page last allocated via order 2, migratetype Unmovable, gfp_mask 0x446dc0(GFP_KERNEL_ACCOUNT|__GFP_ZERO|__GFP_NOWARN|__GFP_RETRY_MAYFAIL|__GFP_COMP), pid 13363, tgid 13353 (syz.0.2160), ts 637147906784, free_ts 639281975158
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1718
 prep_new_page mm/page_alloc.c:1726 [inline]
 get_page_from_freelist+0x135c/0x3920 mm/page_alloc.c:3688
 __alloc_frozen_pages_noprof+0x263/0x23a0 mm/page_alloc.c:4970
 __alloc_pages_noprof+0xb/0x1b0 mm/page_alloc.c:5004
 __alloc_pages_node_noprof include/linux/gfp.h:284 [inline]
 alloc_pages_node_noprof include/linux/gfp.h:311 [inline]
 ___kmalloc_large_node+0x82/0x1e0 mm/slub.c:4271
 __kmalloc_large_node_noprof+0x1c/0x70 mm/slub.c:4299
 __do_kmalloc_node mm/slub.c:4315 [inline]
 __kvmalloc_node_noprof.cold+0xb/0x65 mm/slub.c:5012
 alloc_netdev_mqs+0xd2/0x1570 net/core/dev.c:11604
 tun_set_iff drivers/net/tun.c:2752 [inline]
 __tun_chr_ioctl+0x1964/0x4740 drivers/net/tun.c:3048
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 13353 tgid 13353 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0x69d/0xff0 mm/page_alloc.c:2725
 __folio_put+0x329/0x450 mm/swap.c:112
 device_release+0xa4/0x240 drivers/base/core.c:2568
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1e7/0x5a0 lib/kobject.c:737
 netdev_run_todo+0x7e9/0x1320 net/core/dev.c:11305
 tun_detach drivers/net/tun.c:639 [inline]
 tun_chr_close+0xea/0x230 drivers/net/tun.c:3390
 __fput+0x402/0xb70 fs/file_table.c:465
 task_work_run+0x150/0x240 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x27b/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x260 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88807a5eca80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88807a5ecb00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff88807a5ecb80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                      ^
 ffff88807a5ecc00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88807a5ecc80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
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
