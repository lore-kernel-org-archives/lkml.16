Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EB02AE77
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252792; cv=none; b=jDOejJGYdbHNkJs+2ZqQuMq6Wv62wntj5rbZw/MtA33EK3enDtJIHMts1oHolkiB2PZm27WhQXYmyLzhhB9GFQJkbODWZIzN1x3o7fWKlC6SFJ0YntsWPeMh2gmSE+0fEXKYhX74b6Q6q2j5k3bd1/4MSB7MxvO96Khh/Iu24yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252792; c=relaxed/simple;
	bh=J/2U5ygWmFZJKLZmX+Jtuf3ZhsntBVbSf2wYzr5Oznc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=trOAgJwZQMk60Xn4wjNQFYKdBnwflIs7igWgpvVJ2EwJybOSR+lAkusPv4kSEsgMKnzGF5jg6OgFBjUy2bUGEBfcyqvzt/P/vdNCUtP/XrGeYeaLRH8WncfoaYbvL+eXbtN6YinOosV7+5nDaZCd+x5z9Fkd9XY6983tgPXWA/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-85e15e32379so185679239f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252789; x=1748857589;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J2IyipFEPL0z+ERgd2x0s09sX2Hk/O2ukCWICkgOitA=;
        b=Pvw6VgKq5BszltkmzWqlPuT3/4emyNhg9P+4RFMsmR0tCi61KsW8xKwUuLbsRs9w6v
         CUfT2t4YqmVp9mx3ZhB70GuRVwLMFZbMO7e5dxxD51pStoIDK0VPb+UoS+dxKnTq4ATG
         8O9CI1NyqAmwr4sURjjt9wXqTQfrfP2TDjDRUJwCjbKAujOBPI0bVxUjUqpPe9Jo7oMY
         AZVpIHjjvAFPURN9Xm+CABvPRVAGlUwsi/s63wMlLHTGYgbTGDT0MKgvtgT2tNZufAp3
         Ljc22jhoYepgVEtEzFnrpfwYCp0UCF5cEgeLsKkMTZO/btQbOsc3JFS7YgTGlOCGeHzI
         c77g==
X-Forwarded-Encrypted: i=1; AJvYcCXeZ6s4ftT/s/XlI9o7DLNX6Q5atukCIp29q/YSZex9zN/wkvp+Dak8EKMwGxPHJdn+awnmESFvKKUzndE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2hZWeeZD9ONheYSxN+a0jIznEveGFTTH/ltYAfFVH/xOjYUiG
	tA8IqBPT1mLYEBioHOi3uay0EY2BPmlmHy0DlkUwRnaS7OO4RKgfE1tST7a7iJc3uvokGzzVa04
	UBUAoyzFbLtvWgdxJAVinA9dv7MqIfes4q5tM4EhGXxO5COdKWFjrHmbWZ0w=
X-Google-Smtp-Source: AGHT+IEWtqtlLOiYjqHDijhvnwX2CIDvFHmSWYb7uykY6s36bXcQLq/BxnEd1D+KAyBGKj8GcN7M8vMJiNehQp5OU2FAZWtAxSbF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4896:b0:864:a2e4:5fff with SMTP id
 ca18e2360f4ac-86cbb7eca3fmr978312639f.4.1748252789167; Mon, 26 May 2025
 02:46:29 -0700 (PDT)
Date: Mon, 26 May 2025 02:46:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68343875.a70a0220.253bc2.0094.GAE@google.com>
Subject: [syzbot] [mm?] WARNING in folio_add_file_rmap_ptes
From: syzbot <syzbot+18bba5153739c29b88c5@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, david@redhat.com, 
	harry.yoo@oracle.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	lorenzo.stoakes@oracle.com, riel@surriel.com, syzkaller-bugs@googlegroups.com, 
	vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    187899f4124a Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=12f7f9f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=18bba5153739c29b88c5
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ab8c5d5c6c34/disk-187899f4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d67a1d9c9f04/vmlinux-187899f4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/074a891b2686/Image-187899f4.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+18bba5153739c29b88c5@syzkaller.appspotmail.com

page dumped because: VM_WARN_ON_FOLIO((_Generic((page), const struct page *: (const struct folio *)_compound_head(page), struct page *: (struct folio *)_compound_head(page))) != folio)
------------[ cut here ]------------
WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:426 __folio_rmap_sanity_checks include/linux/rmap.h:426 [inline]
WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:426 __folio_add_rmap mm/rmap.c:1252 [inline]
WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:426 __folio_add_file_rmap mm/rmap.c:1620 [inline]
WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:426 folio_add_file_rmap_ptes+0x864/0xa80 mm/rmap.c:1642
Modules linked in:
CPU: 1 UID: 0 PID: 10255 Comm: syz.0.668 Not tainted 6.15.0-rc7-syzkaller-g187899f4124a #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __folio_rmap_sanity_checks include/linux/rmap.h:426 [inline]
pc : __folio_add_rmap mm/rmap.c:1252 [inline]
pc : __folio_add_file_rmap mm/rmap.c:1620 [inline]
pc : folio_add_file_rmap_ptes+0x864/0xa80 mm/rmap.c:1642
lr : __folio_rmap_sanity_checks include/linux/rmap.h:426 [inline]
lr : __folio_add_rmap mm/rmap.c:1252 [inline]
lr : __folio_add_file_rmap mm/rmap.c:1620 [inline]
lr : folio_add_file_rmap_ptes+0x864/0xa80 mm/rmap.c:1642
sp : ffff80009ea777f0
x29: ffff80009ea77830 x28: ffff0000d89a43c0 x27: 0000000020010000
x26: 002000013aaf4bc3 x25: 00000000000001f0 x24: fffffdffc3eaba30
x23: fffffdffc3eabd00 x22: dfff800000000000 x21: 000000000020b68f
x20: fffffdffc3eabd48 x19: fffffdffc3eaba00 x18: 00000000ffffffff
x17: 0000000000000000 x16: ffff80008ad27e48 x15: ffff700011e740c0
x14: 1ffff00011e740c0 x13: 0000000000000004 x12: ffffffffffffffff
x11: 0000000000080000 x10: 000000000000b6d5 x9 : c4bcfe0a46a0cd00
x8 : c4bcfe0a46a0cd00 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff80009ea76ef8 x4 : ffff80008f415ba0 x3 : ffff800080548ef0
x2 : 0000000000000000 x1 : 0000000000000001 x0 : 00000000000000b8
Call trace:
 __folio_rmap_sanity_checks include/linux/rmap.h:426 [inline] (P)
 __folio_add_rmap mm/rmap.c:1252 [inline] (P)
 __folio_add_file_rmap mm/rmap.c:1620 [inline] (P)
 folio_add_file_rmap_ptes+0x864/0xa80 mm/rmap.c:1642 (P)
 set_pte_range+0x28c/0x434 mm/memory.c:5256
 filemap_map_folio_range mm/filemap.c:3631 [inline]
 filemap_map_pages+0xb50/0x1558 mm/filemap.c:3740
 do_fault_around mm/memory.c:5476 [inline]
 do_read_fault mm/memory.c:5509 [inline]
 do_fault mm/memory.c:5652 [inline]
 do_pte_missing mm/memory.c:4160 [inline]
 handle_pte_fault mm/memory.c:5997 [inline]
 __handle_mm_fault mm/memory.c:6140 [inline]
 handle_mm_fault+0x2b84/0x4d18 mm/memory.c:6309
 do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
 do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
 do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
 el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:789
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
irq event stamp: 292
hardirqs last  enabled at (291): [<ffff80008055041c>] __up_console_sem kernel/printk/printk.c:344 [inline]
hardirqs last  enabled at (291): [<ffff80008055041c>] __console_unlock+0x70/0xc4 kernel/printk/printk.c:2885
hardirqs last disabled at (292): [<ffff80008adb9eb8>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
softirqs last  enabled at (8): [<ffff8000801fbf10>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (6): [<ffff8000801fbedc>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
---[ end trace 0000000000000000 ]---
page: refcount:10 mapcount:1 mapping:00000000dc26ff10 index:0x4 pfn:0x13aae8
head: order:2 mapcount:4 entire_mapcount:0 nr_pages_mapped:4 pincount:0
memcg:ffff0000d4838000
aops:bch_address_space_operations ino:1002 dentry name(?):"file1"
flags: 0x5ffc0000000516d(locked|referenced|uptodate|lru|active|arch_1|private|head|node=0|zone=2|lastcpupid=0x7ff)
raw: 05ffc0000000516d fffffdffc3e1bf08 fffffdffc3d17508 ffff0000f1fd18e8
raw: 0000000000000004 ffff0000d4c1f300 0000000a00000000 ffff0000d4838000
head: 05ffc0000000516d fffffdffc3e1bf08 fffffdffc3d17508 ffff0000f1fd18e8
head: 0000000000000004 ffff0000d4c1f300 0000000a00000000 ffff0000d4838000
head: 05ffc00000000202 fffffdffc3eaba01 0000000400000003 00000000ffffffff
head: ffffffff00000003 000000000000003d 0000000000000000 0000000000000004
page dumped because: VM_WARN_ON_FOLIO((_Generic((page + nr_pages - 1), const struct page *: (const struct folio *)_compound_head(page + nr_pages - 1), struct page *: (struct folio *)_compound_head(page + nr_pages - 1))) != folio)
------------[ cut here ]------------
WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:427 __folio_rmap_sanity_checks include/linux/rmap.h:427 [inline]
WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:427 __folio_add_rmap mm/rmap.c:1252 [inline]
WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:427 __folio_add_file_rmap mm/rmap.c:1620 [inline]
WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:427 folio_add_file_rmap_ptes+0x890/0xa80 mm/rmap.c:1642
Modules linked in:
CPU: 1 UID: 0 PID: 10255 Comm: syz.0.668 Tainted: G        W           6.15.0-rc7-syzkaller-g187899f4124a #0 PREEMPT 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __folio_rmap_sanity_checks include/linux/rmap.h:427 [inline]
pc : __folio_add_rmap mm/rmap.c:1252 [inline]
pc : __folio_add_file_rmap mm/rmap.c:1620 [inline]
pc : folio_add_file_rmap_ptes+0x890/0xa80 mm/rmap.c:1642
lr : __folio_rmap_sanity_checks include/linux/rmap.h:427 [inline]
lr : __folio_add_rmap mm/rmap.c:1252 [inline]
lr : __folio_add_file_rmap mm/rmap.c:1620 [inline]
lr : folio_add_file_rmap_ptes+0x890/0xa80 mm/rmap.c:1642
sp : ffff80009ea777f0
x29: ffff80009ea77830 x28: ffff0000d89a43c0 x27: 0000000020010000
x26: 002000013aaf4bc3 x25: 00000000000001f0 x24: fffffdffc3eaba30
x23: fffffdffc3eabd00 x22: dfff800000000000 x21: fffffdffc3eb3900
x20: fffffdffc3eb3801 x19: fffffdffc3eaba00 x18: 00000000ffffffff
x17: 0000000000000000 x16: ffff80008ad27e48 x15: ffff700011e740c0
x14: 1ffff00011e740c0 x13: 0000000000000004 x12: ffffffffffffffff
x11: 0000000000080000 x10: 000000000002ce5f x9 : c4bcfe0a46a0cd00
x8 : c4bcfe0a46a0cd00 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff80009ea76ef8 x4 : ffff80008f415ba0 x3 : ffff800080548ef0
x2 : 0000000000000000 x1 : 0000000000000001 x0 : 00000000000000e5
Call trace:
 __folio_rmap_sanity_checks include/linux/rmap.h:427 [inline] (P)
 __folio_add_rmap mm/rmap.c:1252 [inline] (P)
 __folio_add_file_rmap mm/rmap.c:1620 [inline] (P)
 folio_add_file_rmap_ptes+0x890/0xa80 mm/rmap.c:1642 (P)
 set_pte_range+0x28c/0x434 mm/memory.c:5256
 filemap_map_folio_range mm/filemap.c:3631 [inline]
 filemap_map_pages+0xb50/0x1558 mm/filemap.c:3740
 do_fault_around mm/memory.c:5476 [inline]
 do_read_fault mm/memory.c:5509 [inline]
 do_fault mm/memory.c:5652 [inline]
 do_pte_missing mm/memory.c:4160 [inline]
 handle_pte_fault mm/memory.c:5997 [inline]
 __handle_mm_fault mm/memory.c:6140 [inline]
 handle_mm_fault+0x2b84/0x4d18 mm/memory.c:6309
 do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
 do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
 do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
 el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:789
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
irq event stamp: 928
hardirqs last  enabled at (927): [<ffff80008055041c>] __up_console_sem kernel/printk/printk.c:344 [inline]
hardirqs last  enabled at (927): [<ffff80008055041c>] __console_unlock+0x70/0xc4 kernel/printk/printk.c:2885
hardirqs last disabled at (928): [<ffff80008adb9eb8>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
softirqs last  enabled at (830): [<ffff8000803cf71c>] softirq_handle_end kernel/softirq.c:425 [inline]
softirqs last  enabled at (830): [<ffff8000803cf71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
softirqs last disabled at (727): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: CPU: 1 PID: 10255 at ./include/linux/rmap.h:214 __folio_large_mapcount_sanity_checks+0x3d4/0x5dc include/linux/rmap.h:214
Modules linked in:
CPU: 1 UID: 0 PID: 10255 Comm: syz.0.668 Tainted: G        W           6.15.0-rc7-syzkaller-g187899f4124a #0 PREEMPT 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __folio_large_mapcount_sanity_checks+0x3d4/0x5dc include/linux/rmap.h:214
lr : __folio_large_mapcount_sanity_checks+0x3d4/0x5dc include/linux/rmap.h:214
sp : ffff80009ea77790
x29: ffff80009ea77790 x28: 0000000080000000 x27: 1fffffbff87d574f
x26: 1fffffbff87d5740 x25: 1fffffbff87d5741 x24: dfff800000000000
x23: 00000000000001f0 x22: fffffdffc3eaba78 x21: 0000000000000004
x20: fffffdffc3eaba08 x19: fffffdffc3eaba00 x18: 00000000ffffffff
x17: 0000000000000000 x16: ffff80008ad27e48 x15: 0000000000000001
x14: 1fffffbff87d574d x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000080000 x10: 0000000000049002 x9 : ffff8000aa342000
x8 : 0000000000049003 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff80009ea76ef8 x4 : ffff80008f415ba0 x3 : ffff800080b2596c
x2 : 000000000000003d x1 : 00000000000001f0 x0 : 0000000000000004
Call trace:
 __folio_large_mapcount_sanity_checks+0x3d4/0x5dc include/linux/rmap.h:214 (P)
 folio_add_return_large_mapcount include/linux/rmap.h:250 [inline]
 __folio_add_rmap mm/rmap.c:1279 [inline]
 __folio_add_file_rmap mm/rmap.c:1620 [inline]
 folio_add_file_rmap_ptes+0x47c/0xa80 mm/rmap.c:1642
 set_pte_range+0x28c/0x434 mm/memory.c:5256
 filemap_map_folio_range mm/filemap.c:3631 [inline]
 filemap_map_pages+0xb50/0x1558 mm/filemap.c:3740
 do_fault_around mm/memory.c:5476 [inline]
 do_read_fault mm/memory.c:5509 [inline]
 do_fault mm/memory.c:5652 [inline]
 do_pte_missing mm/memory.c:4160 [inline]
 handle_pte_fault mm/memory.c:5997 [inline]
 __handle_mm_fault mm/memory.c:6140 [inline]
 handle_mm_fault+0x2b84/0x4d18 mm/memory.c:6309
 do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
 do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
 do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
 el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:789
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
irq event stamp: 1044
hardirqs last  enabled at (1043): [<ffff80008adbc380>] __exit_to_kernel_mode arch/arm64/kernel/entry-common.c:85 [inline]
hardirqs last  enabled at (1043): [<ffff80008adbc380>] exit_to_kernel_mode+0xc0/0xf0 arch/arm64/kernel/entry-common.c:95
hardirqs last disabled at (1044): [<ffff80008adb9eb8>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:511
softirqs last  enabled at (1042): [<ffff8000803cf71c>] softirq_handle_end kernel/softirq.c:425 [inline]
softirqs last  enabled at (1042): [<ffff8000803cf71c>] handle_softirqs+0xaf8/0xc88 kernel/softirq.c:607
softirqs last disabled at (933): [<ffff800080020efc>] __do_softirq+0x14/0x20 kernel/softirq.c:613
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
kernel BUG at mm/page_table_check.c:120!
Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 10255 Comm: syz.0.668 Tainted: G        W           6.15.0-rc7-syzkaller-g187899f4124a #0 PREEMPT 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : page_table_check_set+0x56c/0x590 mm/page_table_check.c:120
lr : page_table_check_set+0x56c/0x590 mm/page_table_check.c:120
sp : ffff80009ea776a0
x29: ffff80009ea776b0 x28: ffff80008f63c000 x27: 0000000000000001
x26: ffff0000c08158c8 x25: 0000000000000006 x24: 0000000000000001
x23: ffff0000c08158c8 x22: 000000000013ab14 x21: 0000000000000000
x20: 0000000000000010 x19: 1ffff00012dfca50 x18: 00000000ffffffff
x17: 0000000000000000 x16: ffff80008051c10c x15: 0000000000000001
x14: 1fffe00018102b19 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000080000 x10: 00000000000632c3 x9 : ffff8000aa342000
x8 : 00000000000632c4 x7 : ffff800080cd13e4 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff800080cd0928
x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000
Call trace:
 page_table_check_set+0x56c/0x590 mm/page_table_check.c:120 (P)
 __page_table_check_ptes_set+0x2a8/0x2e0 mm/page_table_check.c:209
 page_table_check_ptes_set include/linux/page_table_check.h:76 [inline]
 __set_ptes_anysz arch/arm64/include/asm/pgtable.h:724 [inline]
 __set_ptes+0x4a0/0x504 arch/arm64/include/asm/pgtable.h:756
 contpte_set_ptes+0x120/0x188 arch/arm64/mm/contpte.c:273
 set_ptes arch/arm64/include/asm/pgtable.h:1807 [inline]
 set_pte_range+0x39c/0x434 mm/memory.c:5258
 filemap_map_folio_range mm/filemap.c:3631 [inline]
 filemap_map_pages+0xb50/0x1558 mm/filemap.c:3740
 do_fault_around mm/memory.c:5476 [inline]
 do_read_fault mm/memory.c:5509 [inline]
 do_fault mm/memory.c:5652 [inline]
 do_pte_missing mm/memory.c:4160 [inline]
 handle_pte_fault mm/memory.c:5997 [inline]
 __handle_mm_fault mm/memory.c:6140 [inline]
 handle_mm_fault+0x2b84/0x4d18 mm/memory.c:6309
 do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
 do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
 do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
 el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:789
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
Code: aa1603e0 97fd6781 17fffee6 97e91fd8 (d4210000) 
---[ end trace 0000000000000000 ]---


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
