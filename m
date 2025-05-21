Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29DD2627EC
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827283; cv=none; b=fo9kd33HC55wVeou/zglb/lddRO9oyB0jPyPmKVWPHbBoBA3jwFojqLmJ46iez0wibxn6vpo9XCsOthA4zUBj/J+aMiYQyNGS0rPF7ew3JxRNVXJ9APFw2KZ8YyLGGLoAOe9+9cD2GqLtFTSyXbviXom0j/I/yOoKCVIOD8wcqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827283; c=relaxed/simple;
	bh=O3JulolCoLIen+HyLdDNi0RsEwcFDXakNukbyj+e7js=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GPu6KKzLqgdzZp8fBBvz6sghp9BGaRSLHBbpUU+IfDvvYyIVGs/gYoQnToTWRXXRfeK6UmVAoldZgP5KYjTPlJOSZlBW6eQQYdvq8cyQ+Ud94jtT5lSbHIi482+w+B/xNBN0j1tItaqBsaAl6sBeh2vTSh6MiX91QLUisZUHbkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=Yp9CVrde; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="Yp9CVrde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1747827261;
	bh=O3JulolCoLIen+HyLdDNi0RsEwcFDXakNukbyj+e7js=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Yp9CVrde41xaHO+xKunEJgxtNbFHpmmBw30eVpNNK4lhr+TiRQ/4u45yuwAfakeOn
	 uZyqKwM43+FwO5H/a1GCRN/qdBIWgD29cpED4vNwCxedqrSBakUjwUGB29nTkMYhlz
	 G7INrvjh/sSRW+q94sqaHXKAenDJ1uSZhio86zpk=
X-QQ-mid: zesmtpip2t1747827257t51c78ed5
X-QQ-Originating-IP: G5bXLVmyVvZLFo+rcf6O5AO7UqnBfLenfM9iE/lTwOo=
Received: from TYSPR06MB7158.apcprd06.prod.out ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 May 2025 19:34:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16999447756897464558
EX-QQ-RecipientCnt: 5
From: "huk23@m.fudan.edu.cn" <huk23@m.fudan.edu.cn>
To: Andrew Morton <akpm@linux-foundation.org>
CC: syzkaller <syzkaller@googlegroups.com>, linux-kernel
	<linux-kernel@vger.kernel.org>, Jiaji Qin <jjtan24@m.fudan.edu.cn>, Shuoran
 Bai <baishuoran@hrbeu.edu.cn>
Subject: KASAN: slab-use-after-free Read in isolate_folios
Thread-Topic: KASAN: slab-use-after-free Read in isolate_folios
Thread-Index: AQHbykJWGlboQojfQ0KePAsF+1Mm9A==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Wed, 21 May 2025 11:34:15 +0000
Message-ID:
	<TYSPR06MB7158FCD2657E6FDDEF2EDBF8F69EA@TYSPR06MB7158.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M9S9ZqPKjxj8A9S+CxbUUvBN44aiJcn0GybD7CUOc3CuWNtg0Fw0NCvQ
	DTLUubRxRHqxqyBQ0L/bu9GNIEr1HLRQma0/CtbEl5YWKtQs0HxFf8C602DZwQahsNwOmPg
	/JrNk3Kqw9GTuIHFkz5ZUAIUb+Q443x5zXrINR7u6dj4L2VmiXcf8lM7XaRM0jwTBzWTRhO
	TfHJUi+BDYZ37BsNrzuuAzyjObKheFEn82WXP3xpQGkr5vuJUVRrhbHMWA4iFHaY83EbCvW
	R8vemhbQIarj9TlWzJ+i5DpglXPL6bF/cXeq1pRV30bQiePi4wSGm67miNmgpHytDlzHBqM
	lVbwbbDlZ7eOO3t08pVN0sUnb+4OMDdq3D7PjtbnkriYhBXe7o9XNpbsIfsOzSj0xD7hXY1
	eHiOKRoQ/JovFNWCyu/sGRwpuBTz6GFrs3HSMQvW7e0abgytGw8AJuQNUOXXoi+tXEvTR+D
	m8gI5Xf8fbY5h6wuU3phSCZFflHFm+m7IftSEDXKbiVCUFzje1P9CdBEcYGTRNR/1DR8UVl
	wuVrvYgJ14sGgus6fQtkb33W0+XZ9leqKq6LoS7wvcveRXUfEQyxXnzp/wjjocKQS5xKHV9
	fFnIk1vcybs1rNsWzrqSRl4XPOdvQhFQp3C+s4AdKRnk+ZyTAmgnL6wNOOt7g2afgbw2ltl
	iyjknqJECuO67A3x9P0HL5gJeLSix5B81hCkWbREFescqhkl8UX5nJZEWF3LGoepPmaYPaW
	Er+2Zy/NNB64oXizUDkbORA+Cz+hSjpcOKsAMU1KIoRB7cEPf4VwTOnrMHrmzyq6myg/0Vl
	F1ksnDmvABWqVfzylYIZ8WfaDgytHKAclKRDTO43BEe1Y4y2zd3DxrLovc1Chfieh8gU+F3
	ODUAq4q8yUYsffgeZYdD94U4HQTd877lKcQzdwkwzeUabTkllJrytkMjhKwZPC+aYgBhFuJ
	QcUMC57dlxjOY8mrPBFR3JQXJaoGd/DWeFzsekB+9YVBaNylJXqvbVLuTgNPgIhT8WFb0IE
	OBOS9+H5rQRI6vKwn7T/9/MgQ8widECpIlnqtitiZFJH0iZytpAeu+3duxdUY=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

Dear Maintainers,=0A=
=0A=
=0A=
=0A=
When using our customized Syzkaller to fuzz the latest Linux kernel, the fo=
llowing crash (103th)was triggered.=0A=
=0A=
=0A=
HEAD commit: 6537cfb395f352782918d8ee7b7f10ba2cc3cbf2=0A=
git tree: upstream=0A=
Output:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6/103_KAS=
AN%3A%20slab-use-after-free%20Read%20in%20isolate_folios/103report.txt=0A=
Kernel config:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6/=
config.txt=0A=
C reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6/1=
03_KASAN%3A%20slab-use-after-free%20Read%20in%20isolate_folios/103repro.c=
=0A=
Syzlang reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15=
-rc6/103_KASAN%3A%20slab-use-after-free%20Read%20in%20isolate_folios/103rep=
ro.txt=0A=
=0A=
=0A=
This BUG should be a kernel concurrency and memory management issue. GFS2 f=
ile system uses RCU mechanism when it releases the gfs2_lock object. In the=
 meantime, the memory reclamation subsystem (kswapd) may meet a folio which=
 is still associated with this gfs2_glock that is to be released or has bee=
n released (but RCU has not completed the clean up) while scanning the LRU =
list to reclaim pages. The isolate_folios function accesses the area of the=
 gfs2_glock object which has been released by mistake while handling this f=
olio, resulting in a slab-use-after-free read.=0A=
=0A=
We have reproduced this issue several times on 6.15-rc6 again.=0A=
=0A=
=0A=
If you fix this issue, please add the following tag to the commit:=0A=
Reported-by: Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.edu.=
cn>, Shuoran Bai <baishuoran@hrbeu.edu.cn>=0A=
=0A=
=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
BUG: KASAN: slab-use-after-free in isolate_folios+0x157e/0x3fa0=0A=
Read of size 8 at addr ffff888029da93a0 by task kswapd0/123=0A=
=0A=
CPU: 0 UID: 0 PID: 123 Comm: kswapd0 Not tainted 6.15.0-rc6 #1 PREEMPT(full=
)=0A=
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1=
.1 04/01/2014=0A=
Call Trace:=0A=
=A0<TASK>=0A=
=A0dump_stack_lvl+0x116/0x1b0=0A=
=A0print_report+0xc1/0x630=0A=
=A0kasan_report+0x96/0xd0=0A=
=A0kasan_check_range+0xed/0x1a0=0A=
=A0isolate_folios+0x157e/0x3fa0=0A=
=A0evict_folios+0x19f/0x2060=0A=
=A0try_to_shrink_lruvec+0x604/0x9b0=0A=
=A0shrink_one+0x412/0x7c0=0A=
=A0shrink_node+0x2378/0x3bf0=0A=
=A0balance_pgdat+0xa7d/0x1750=0A=
=A0kswapd+0x4aa/0xb80=0A=
=A0kthread+0x447/0x8a0=0A=
=A0ret_from_fork+0x48/0x80=0A=
=A0ret_from_fork_asm+0x1a/0x30=0A=
=A0</TASK>=0A=
=0A=
Allocated by task 14332:=0A=
=A0kasan_save_stack+0x24/0x50=0A=
=A0kasan_save_track+0x14/0x30=0A=
=A0__kasan_slab_alloc+0x87/0x90=0A=
=A0kmem_cache_alloc_noprof+0x166/0x4a0=0A=
=A0gfs2_glock_get+0x203/0x11d0=0A=
=A0gfs2_inode_lookup+0x266/0x8f0=0A=
=A0gfs2_dir_search+0x215/0x2d0=0A=
=A0gfs2_lookupi+0x496/0x650=0A=
=A0init_inodes+0x6e3/0x2be0=0A=
=A0gfs2_fill_super+0x1bd1/0x2d00=0A=
=A0get_tree_bdev_flags+0x38a/0x620=0A=
=A0gfs2_get_tree+0x4e/0x280=0A=
=A0vfs_get_tree+0x93/0x340=0A=
=A0path_mount+0x1270/0x1b90=0A=
=A0do_mount+0xb3/0x110=0A=
=A0__x64_sys_mount+0x193/0x230=0A=
=A0do_syscall_64+0xcf/0x260=0A=
=A0entry_SYSCALL_64_after_hwframe+0x77/0x7f=0A=
=0A=
Freed by task 28:=0A=
=A0kasan_save_stack+0x24/0x50=0A=
=A0kasan_save_track+0x14/0x30=0A=
=A0kasan_save_free_info+0x3a/0x60=0A=
=A0__kasan_slab_free+0x54/0x70=0A=
=A0kmem_cache_free+0x14d/0x550=0A=
=A0gfs2_glock_dealloc+0xd0/0x150=0A=
=A0rcu_core+0x7a4/0x1660=0A=
=A0handle_softirqs+0x1be/0x850=0A=
=A0run_ksoftirqd+0x3a/0x60=0A=
=A0smpboot_thread_fn+0x3d2/0xaa0=0A=
=A0kthread+0x447/0x8a0=0A=
=A0ret_from_fork+0x48/0x80=0A=
=A0ret_from_fork_asm+0x1a/0x30=0A=
=0A=
Last potentially related work creation:=0A=
=A0kasan_save_stack+0x24/0x50=0A=
=A0kasan_record_aux_stack+0xb0/0xc0=0A=
=A0__call_rcu_common.constprop.0+0x99/0x820=0A=
=A0gfs2_glock_free+0x35/0xa0=0A=
=A0gfs2_glock_put+0x32/0x40=0A=
=A0gfs2_glock_put_eventually+0x73/0x90=0A=
=A0gfs2_evict_inode+0x8ff/0x15f0=0A=
=A0evict+0x3db/0x830=0A=
=A0iput+0x513/0x820=0A=
=A0gfs2_jindex_free+0x3a6/0x5a0=0A=
=A0init_inodes+0x1385/0x2be0=0A=
=A0gfs2_fill_super+0x1bd1/0x2d00=0A=
=A0get_tree_bdev_flags+0x38a/0x620=0A=
=A0gfs2_get_tree+0x4e/0x280=0A=
=A0vfs_get_tree+0x93/0x340=0A=
=A0path_mount+0x1270/0x1b90=0A=
=A0do_mount+0xb3/0x110=0A=
=A0__x64_sys_mount+0x193/0x230=0A=
=A0do_syscall_64+0xcf/0x260=0A=
=A0entry_SYSCALL_64_after_hwframe+0x77/0x7f=0A=
=0A=
Second to last potentially related work creation:=0A=
=A0kasan_save_stack+0x24/0x50=0A=
=A0kasan_record_aux_stack+0xb0/0xc0=0A=
=A0insert_work+0x36/0x240=0A=
=A0__queue_work+0x868/0x1240=0A=
=A0__queue_delayed_work+0x36b/0x460=0A=
=A0queue_delayed_work_on+0x12c/0x140=0A=
=A0gfs2_glock_queue_work+0x73/0x110=0A=
=A0do_xmote+0x7a0/0xf00=0A=
=A0run_queue+0x2ec/0x6a0=0A=
=A0glock_work_func+0x127/0x470=0A=
=A0process_scheduled_works+0x5de/0x1bd0=0A=
=A0worker_thread+0x5a9/0xd10=0A=
=A0kthread+0x447/0x8a0=0A=
=A0ret_from_fork+0x48/0x80=0A=
=A0ret_from_fork_asm+0x1a/0x30=0A=
=0A=
The buggy address belongs to the object at ffff888029da8fd8=0A=
=A0which belongs to the cache gfs2_glock(aspace) of size 1224=0A=
The buggy address is located 968 bytes inside of=0A=
=A0freed 1224-byte region [ffff888029da8fd8, ffff888029da94a0)=0A=
=0A=
The buggy address belongs to the physical page:=0A=
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x29da8=
=0A=
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0=0A=
flags: 0xfff00000000040(head|node=3D0|zone=3D1|lastcpupid=3D0x7ff)=0A=
page_type: f5(slab)=0A=
raw: 00fff00000000040 ffff888043a36dc0 dead000000000122 0000000000000000=0A=
raw: 0000000000000000 0000000080180018 00000000f5000000 0000000000000000=0A=
head: 00fff00000000040 ffff888043a36dc0 dead000000000122 0000000000000000=
=0A=
head: 0000000000000000 0000000080180018 00000000f5000000 0000000000000000=
=0A=
head: 00fff00000000003 ffffea0000a76a01 00000000ffffffff 00000000ffffffff=
=0A=
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008=
=0A=
page dumped because: kasan: bad access detected=0A=
page_owner tracks the page as allocated=0A=
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__=
GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 14332, =
tgid 14329 (syz.3.4), ts 153619422108, free_ts 153579612259=0A=
=A0prep_new_page+0x1b0/0x1e0=0A=
=A0get_page_from_freelist+0x1c80/0x3a40=0A=
=A0__alloc_frozen_pages_noprof+0x2fd/0x6d0=0A=
=A0alloc_pages_mpol+0x209/0x550=0A=
=A0new_slab+0x254/0x350=0A=
=A0___slab_alloc+0xf0c/0x17c0=0A=
=A0__slab_alloc.isra.0+0x56/0xb0=0A=
=A0kmem_cache_alloc_noprof+0x273/0x4a0=0A=
=A0gfs2_glock_get+0x203/0x11d0=0A=
=A0gfs2_inode_lookup+0x266/0x8f0=0A=
=A0gfs2_lookup_root+0x57/0x120=0A=
=A0init_sb+0xa2a/0x11d0=0A=
=A0gfs2_fill_super+0x195a/0x2d00=0A=
=A0get_tree_bdev_flags+0x38a/0x620=0A=
=A0gfs2_get_tree+0x4e/0x280=0A=
=A0vfs_get_tree+0x93/0x340=0A=
page last free pid 13807 tgid 13807 stack trace:=0A=
=A0__free_frozen_pages+0x7cd/0x1320=0A=
=A0__put_partials+0x14c/0x170=0A=
=A0qlist_free_all+0x50/0x130=0A=
=A0kasan_quarantine_reduce+0x168/0x1c0=0A=
=A0__kasan_slab_alloc+0x67/0x90=0A=
=A0__kmalloc_noprof+0x1c8/0x600=0A=
=A0tomoyo_encode2.part.0+0xec/0x3c0=0A=
=A0tomoyo_encode+0x2c/0x60=0A=
=A0tomoyo_realpath_from_path+0x187/0x600=0A=
=A0tomoyo_path_perm+0x235/0x440=0A=
=A0security_inode_getattr+0x122/0x2b0=0A=
=A0vfs_getattr+0x26/0x70=0A=
=A0vfs_fstat+0x50/0xa0=0A=
=A0__do_sys_newfstat+0x83/0x100=0A=
=A0do_syscall_64+0xcf/0x260=0A=
=A0entry_SYSCALL_64_after_hwframe+0x77/0x7f=0A=
=0A=
Memory state around the buggy address:=0A=
=A0ffff888029da9280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0A=
=A0ffff888029da9300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0A=
>ffff888029da9380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0^=0A=
=A0ffff888029da9400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0A=
=A0ffff888029da9480: fb fb fb fb fc fc fc fc fc fc fc fc fc fc fc fc=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
thanks,=0A=
Kun Hu=0A=
