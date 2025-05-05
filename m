Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95309188734
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 01:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746409867; cv=none; b=GaEbm/x5kZAnf87sk62FMKv6elA9+HZGtabPy8AlMQsXUmPipYvhCAplpEWYFIRakgSK7lBYWJ1yOGdyGdvf2xo5l5DRBqI2bQccjuFPXX86uBwv2GD3hp/UViYRF+ivkODyXSHBxhUtiGtlmNb48CTFCyCUcjElc5mMh9nQacE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746409867; c=relaxed/simple;
	bh=/zxXcudAC3USU0Myg7NamjLqk38VadwZ+MOk6BLOT7k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mc6L/tFcb7U6ou6P6aFog+weXMdfYW6fb+lTxQRgdTvl405pRoa4ymcjim2vIPOIH+RjMGQg0DpVUdiUTHMdjdzQZvU2vvF3pUnO4fz4COgo5rdCtxL4x9laft9i+9pJ/n0wCn14S7mYRrcLWH69v0ZdCao3OVQW37itr1aWj0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d90a7e86f7so99624955ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 18:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409864; x=1747014664;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Omr8NBlu9s1uI7PUp0u09UHHIzG6Tvl5NHpwldDgkw=;
        b=ovWpGyAeUYLtVlwZNc8smFhMA4AjWCYN4imbhGgh7F1nSIc55myyzY1Gtuoji4PfZE
         wUTG+Rhtszg5l8cWF0MirbAfcV4eah73TqtDgFKc5GhXLGvsvD4LiUH5JhBDrEgnpimu
         1qmECcnDyoTXPfbadpVI9gqauea8kmyMomGh7+Yad4B66GJQLUUdzMyg+mMr+kKxDqbz
         mBVpMJNEiKa2XHz92C9L7SJ5ATxFbAKe5WhrYiFHg9/DvWaEurdhJgJ0JmNDhTwkf/I8
         UEJ8neoahEgnSwStrZTPuZaeEwIWEGWrDiSPdcW2BetGJCRLXIRgnQmPqTrOkpgP/j63
         1ewg==
X-Forwarded-Encrypted: i=1; AJvYcCVRSx88Uh34PcvNYU97++zsVYJK+qxHV9bqt8y4RZUFlvJ4xxItqg4WjsnlS5IkWB8khFAghe277UplcgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwAsFPlLeoi/k4cXb0tE2DPzJWYqZko78dVv2+sjc7mwn55Xco
	Oud2bCm/mI3N/vFn6jU7hiuD6FnxwmHCQeVwKzWu4mT9TtVEre/R7Zfh0weZTyMKMEZYQLx9fs4
	AeuR7pou9DwHxK1yW8bw8+ZoSwUyLcJnfkvY8g/zESiUosqSPe7N28zw=
X-Google-Smtp-Source: AGHT+IFPbO5dRT0QEi+WIFL1hPbj8goirNs0DCmiir3fVK8mQiL0qaDOacHTuCELNEqnG7tRs9wuL6WiCjYynAnwET5SybnlLCUB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:178f:b0:3d8:1d7c:e192 with SMTP id
 e9e14a558f8ab-3da5b271827mr55397525ab.7.1746409864757; Sun, 04 May 2025
 18:51:04 -0700 (PDT)
Date: Sun, 04 May 2025 18:51:04 -0700
In-Reply-To: <20250505013634.1675-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68181988.a70a0220.254cdc.003e.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-out-of-bounds Read in hci_cmd_sync_alloc
From: syzbot <syzbot+5fe2d5bfbfbec0b675a0@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KASAN: slab-out-of-bounds Read in hci_cmd_sync_alloc

==================================================================
BUG: KASAN: slab-out-of-bounds in skb_put_data include/linux/skbuff.h:2752 [inline]
BUG: KASAN: slab-out-of-bounds in hci_cmd_sync_alloc+0x300/0x3a0 net/bluetooth/hci_sync.c:67
Read of size 7 at addr ffff888025df4ee6 by task kworker/u33:1/5283

CPU: 2 UID: 0 PID: 5283 Comm: kworker/u33:1 Not tainted 6.15.0-rc5-syzkaller-g92a09c47464d-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: hci0 hci_cmd_sync_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xc3/0x670 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0xef/0x1a0 mm/kasan/generic.c:189
 __asan_memcpy+0x23/0x60 mm/kasan/shadow.c:105
 skb_put_data include/linux/skbuff.h:2752 [inline]
 hci_cmd_sync_alloc+0x300/0x3a0 net/bluetooth/hci_sync.c:67
 hci_cmd_sync_add net/bluetooth/hci_sync.c:99 [inline]
 __hci_cmd_sync_sk+0x157/0xc90 net/bluetooth/hci_sync.c:168
 __hci_cmd_sync_ev+0x3e/0x50 net/bluetooth/hci_sync.c:250
 send_hci_cmd_sync+0x152/0x3a0 net/bluetooth/mgmt.c:2540
 hci_cmd_sync_work+0x1a8/0x430 net/bluetooth/hci_sync.c:332
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 6492:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_node_track_caller_noprof+0x221/0x510 mm/slub.c:4346
 kmemdup_noprof+0x29/0x60 mm/util.c:137
 kmemdup_noprof include/linux/fortify-string.h:765 [inline]
 mgmt_pending_new+0x10b/0x290 net/bluetooth/mgmt_util.c:259
 mgmt_hci_cmd_sync net/bluetooth/mgmt.c:2574 [inline]
 mgmt_hci_cmd_sync+0x58/0x1c0 net/bluetooth/mgmt.c:2562
 hci_mgmt_cmd net/bluetooth/hci_sock.c:1712 [inline]
 hci_sock_sendmsg+0x151f/0x25e0 net/bluetooth/hci_sock.c:1832
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg net/socket.c:727 [inline]
 sock_write_iter+0x4fc/0x5b0 net/socket.c:1131
 new_sync_write fs/read_write.c:591 [inline]
 vfs_write+0x5ba/0x1180 fs/read_write.c:684
 ksys_write+0x205/0x240 fs/read_write.c:736
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888025df4ee0
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 6 bytes inside of
 allocated 7-byte region [ffff888025df4ee0, ffff888025df4ee7)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x25df4
anon flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801b442500 0000000000000000 dead000000000001
raw: 0000000000000000 0000000080800080 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 1, tgid 1 (swapper/0), ts 8545114296, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1718
 prep_new_page mm/page_alloc.c:1726 [inline]
 get_page_from_freelist+0x135c/0x3920 mm/page_alloc.c:3688
 __alloc_frozen_pages_noprof+0x263/0x23a0 mm/page_alloc.c:4970
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab mm/slub.c:2618 [inline]
 new_slab+0x244/0x340 mm/slub.c:2672
 ___slab_alloc+0xd9c/0x1940 mm/slub.c:3858
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3948
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kmalloc_node_track_caller_noprof+0x2ee/0x510 mm/slub.c:4346
 kvasprintf+0xbc/0x160 lib/kasprintf.c:25
 kvasprintf_const+0x66/0x1a0 lib/kasprintf.c:49
 kobject_set_name_vargs+0x5a/0x140 lib/kobject.c:274
 kobject_add_varg lib/kobject.c:368 [inline]
 kobject_add+0x129/0x240 lib/kobject.c:426
 blk_mq_register_hctx+0x264/0x470 block/blk-mq-sysfs.c:172
 blk_mq_sysfs_register+0x208/0x5f0 block/blk-mq-sysfs.c:234
 blk_register_queue+0xe5/0x560 block/blk-sysfs.c:852
 add_disk_fwnode+0x911/0x13a0 block/genhd.c:505
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888025df4d80: 05 fc fc fc 05 fc fc fc 05 fc fc fc 05 fc fc fc
 ffff888025df4e00: 05 fc fc fc 05 fc fc fc 05 fc fc fc 07 fc fc fc
>ffff888025df4e80: 07 fc fc fc 07 fc fc fc 00 fc fc fc 07 fc fc fc
                                                       ^
 ffff888025df4f00: 06 fc fc fc 02 fc fc fc 02 fc fc fc 05 fc fc fc
 ffff888025df4f80: 05 fc fc fc 05 fc fc fc 05 fc fc fc 05 fc fc fc
==================================================================


Tested on:

commit:         92a09c47 Linux 6.15-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=145bdb68580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b39cb28b0a399ed3
dashboard link: https://syzkaller.appspot.com/bug?extid=5fe2d5bfbfbec0b675a0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1325b8d4580000

