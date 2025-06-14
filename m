Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B5E78F2B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 06:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749882563; cv=none; b=V9n5LQiLTckBauzyLQ31XYaD5JBppLNzQsqi/W8PN74w2018m5kjCZZec0qqHtTRmI05h9MtVCkHjvrXDY3FDAn41waNzjvyH9zr79VmyeJQKFNXW6DTop/n6mfnhDotTNjGmDw+nLvuCPETsCwEtffKkU0NuOYrl5QaCAER9aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749882563; c=relaxed/simple;
	bh=Wp3j9rdFacpQqxklX4uir0gel5n0x7E4r7NiuhO41WE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Aks1D7eELexBzAX12bbhNCDumQAwXVY5H0p0b1Zt+lRBrfBx2JNnv8qKHg9sJ1SoJAdqi01fMwwwR6vUNnaDEG/iHeF7G9nJidKliPJXgZ5boNpOkptGUrgTdHEzrJ7P4ES646eJq/z1AVDxN075SkitxjkGqNACyF8vC6BsulU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ddcb80387dso26902955ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749882560; x=1750487360;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RoWfEbRuIwoHSSqwO0H4QyNnNt1jeR1C0ze3saklv2c=;
        b=cCSq7tBRuuop+v08E1ZJN8ZY42Wri48UP4ju8zuvmDfCGhMzVXb3ElT4gdPL+sDB4H
         BS1aqwi3c+dafceFnX5L0jTepND6+xfznZBJtt8ld2vVTpd0QI6WmK7UzxkERb/EiLty
         77+44dArYSmgYg3gchhnYIOvj3OIOmHv5Bx+S99sbhKDRnIJVGXP6qAP5n5xaGZRAkDR
         GNbPN0sVMxrzGMQGbGK8os5ww5uEhq3JhiuuKm/FlEDsoVJBkVjUu/ahvjG6ss4/h44b
         lW2YeC1uWRQHem9fXPaiW/FzaIJLO6Ibm2e34h9OOGI9GA/YEEuXuEc3mVgHLSwCZyyg
         Rp3w==
X-Forwarded-Encrypted: i=1; AJvYcCUUakoRY6/VKb9j+lEopCBHQ3+Y37gZ97oSLCTjwC4UTDEaM4e7K2656j2LvpgWsKssRTrBe6uIwz5XEPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3YVjJqagOEGp+aZZeUhGh8lL3POrBMlPAfZgHxaxAKAkfMlDR
	I2S4nqEGc28q2mJhlK6Kavy0f1lfvfX26r6t8m3t02TmvzvzbCMDUEsB/8/dzsYLRKMTgoKoVYS
	JJa1+XHR/7PuoqenB8YIRch5HZ9GhyxV7YzpAzfRKegcPJgiaisOpHJ4bFyA=
X-Google-Smtp-Source: AGHT+IFFobBnKh7vj03+nPhS+2zsD1k7nvV1qIUnvHMmQaX9FT6wRKSFsa7XcQz2TxYQz5Kmg0iuw6gp5XS8g0oer2iCQPEpq+fA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ce51:0:b0:3dd:c1d1:b6b3 with SMTP id
 e9e14a558f8ab-3de065e766emr28724685ab.6.1749882560587; Fri, 13 Jun 2025
 23:29:20 -0700 (PDT)
Date: Fri, 13 Jun 2025 23:29:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684d16c0.050a0220.be214.02ac.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: invalid-free in dev_free (2)
From: syzbot <syzbot+dd2af0b2069a926d6991@syzkaller.appspotmail.com>
To: andreyknvl@gmail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    19272b37aa4f Linux 6.16-rc1
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=16e80e82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4d9d9f47f21a57a6
dashboard link: https://syzkaller.appspot.com/bug?extid=dd2af0b2069a926d6991
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e543cc3aa537/disk-19272b37.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d10d00e58ed2/vmlinux-19272b37.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8fce30072145/bzImage-19272b37.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dd2af0b2069a926d6991@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: double-free in dev_free+0x47e/0x740 drivers/usb/gadget/legacy/raw_gadget.c:225
Free of addr ffff888105bccfa0 by task syz.6.761/10689

CPU: 0 UID: 0 PID: 10689 Comm: syz.6.761 Not tainted 6.16.0-rc1-syzkaller #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xcd/0x680 mm/kasan/report.c:521
 kasan_report_invalid_free+0xb8/0xe0 mm/kasan/report.c:596
 check_slab_allocation+0xe8/0x110 mm/kasan/common.c:225
 kasan_slab_pre_free include/linux/kasan.h:198 [inline]
 slab_free_hook mm/slub.c:2326 [inline]
 slab_free mm/slub.c:4643 [inline]
 kfree+0xf3/0x470 mm/slub.c:4842
 dev_free+0x47e/0x740 drivers/usb/gadget/legacy/raw_gadget.c:225
 kref_put include/linux/kref.h:65 [inline]
 raw_release+0x168/0x2b0 drivers/usb/gadget/legacy/raw_gadget.c:473
 __fput+0x402/0xb70 fs/file_table.c:465
 task_work_run+0x14d/0x240 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x864/0x2bd0 kernel/exit.c:955
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1104
 get_signal+0x2673/0x26d0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x8f/0x7d0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x7c/0xe0 kernel/entry/common.c:111
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x3e9/0x4b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5e0825d58a
Code: Unable to access opcode bytes at 0x7f5e0825d560.
RSP: 002b:00007f5e068c6ff0 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 00007f5e08485fa0 RCX: 00007f5e0825d58a
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007f5e082e0b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000004 R11: 0000000000000293 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f5e08485fa0 R15: 00007ffcf639b2e8
 </TASK>

Allocated by task 10692:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4328 [inline]
 __kmalloc_node_track_caller_noprof+0x212/0x4c0 mm/slub.c:4347
 memdup_user+0x2a/0xe0 mm/util.c:220
 raw_ioctl_ep_enable drivers/usb/gadget/legacy/raw_gadget.c:847 [inline]
 raw_ioctl+0xc1f/0x2c30 drivers/usb/gadget/legacy/raw_gadget.c:1318
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x18b/0x210 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 10689:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x37/0x50 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2381 [inline]
 slab_free mm/slub.c:4643 [inline]
 kfree+0x283/0x470 mm/slub.c:4842
 dev_free+0x47e/0x740 drivers/usb/gadget/legacy/raw_gadget.c:225
 kref_put include/linux/kref.h:65 [inline]
 raw_release+0x168/0x2b0 drivers/usb/gadget/legacy/raw_gadget.c:473
 __fput+0x402/0xb70 fs/file_table.c:465
 fput_close_sync+0x118/0x260 fs/file_table.c:570
 __do_sys_close fs/open.c:1589 [inline]
 __se_sys_close fs/open.c:1574 [inline]
 __x64_sys_close+0x8b/0x120 fs/open.c:1574
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888105bccfa0
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 0 bytes inside of
 16-byte region [ffff888105bccfa0, ffff888105bccfb0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888105bcc640 pfn:0x105bcc
flags: 0x200000000000200(workingset|node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000200 ffff888100041640 ffff888100040408 ffffea00040bfd10
raw: ffff888105bcc640 0000000000800045 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 10228667957, free_ts 0
 create_dummy_stack mm/page_owner.c:94 [inline]
 register_dummy_stack+0x89/0xd0 mm/page_owner.c:100
 init_page_owner+0x48/0x7b0 mm/page_owner.c:118
 invoke_init_callbacks mm/page_ext.c:148 [inline]
 page_ext_init+0x7aa/0xcc0 mm/page_ext.c:497
 mm_core_init+0x211/0x250 mm/mm_init.c:2783
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888105bcce80: fa fb fc fc 00 00 fc fc 00 00 fc fc 00 00 fc fc
 ffff888105bccf00: 00 00 fc fc 00 00 fc fc 00 00 fc fc 00 00 fc fc
>ffff888105bccf80: 00 00 fc fc fa fb fc fc 00 00 fc fc 00 00 fc fc
                               ^
 ffff888105bcd000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888105bcd080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
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
