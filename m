Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72A6238178
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823131; cv=none; b=TQIpm5xUJe7viYU6kQDC87bJEgrwi/e6meJsjJrIzCmhxjX/ebqNH+g3KT+yJ/Ljq8XBsl+KFlV+L3Occms3enDFB8/2mNyPkeYU7yJAZFTfkvFenq5kbUK8roCignl7s9P66pRO9G6Z2UniYOEV6RYet7UZoXMHyBbJccELiAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823131; c=relaxed/simple;
	bh=bPtxSIHeXfRk2fFD9GTyvSolmpVtk1AfISyWbSNBcOg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DuO7g/JHx459U23AFY3PQZ4w8Itn1tMmlhdyFdd4QR/rmLSeBbDimu24oPeNkLmrGPcO2oeso3Z2ZcqC/3oj4eLExN3rQj4ynlRrvnPmFiDOiV/lYfqBAD82YdfcopGtugg70m+rZoncGdzEd9s7WMDW5ZEUYk/m7BEc2bqMtGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=PNDC6i+0; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="PNDC6i+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1747823091;
	bh=bPtxSIHeXfRk2fFD9GTyvSolmpVtk1AfISyWbSNBcOg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=PNDC6i+0RylxEcvq1qMSwSJ5aIJF6n3JWUtcs+rTbknVuXhg80GnhKVD3DWixJ1pg
	 VbwOjL+aPTFdEWXQQQU415EfK/lvwQZV8K6YlIcK2yALLmlWg6F9ycUGJSzk1eyXBI
	 P5noGwuThGoD0BbsT30d+3GRjXpN099QtsxpBt+I=
X-QQ-mid: zesmtpip4t1747823086tf86c74fb
X-QQ-Originating-IP: xhMogJyyTM+AczKW6FdC/7gER0+gTloj2scbaK7J81o=
Received: from TYSPR06MB7158.apcprd06.prod.out ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 May 2025 18:24:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6044898470580206771
EX-QQ-RecipientCnt: 5
From: "huk23@m.fudan.edu.cn" <huk23@m.fudan.edu.cn>
To: Dave Kleikamp <shaggy@kernel.org>
CC: syzkaller <syzkaller@googlegroups.com>, linux-kernel
	<linux-kernel@vger.kernel.org>, Jiaji Qin <jjtan24@m.fudan.edu.cn>, Shuoran
 Bai <baishuoran@hrbeu.edu.cn>
Subject: KASAN: slab-use-after-free Write in diWrite
Thread-Topic: KASAN: slab-use-after-free Write in diWrite
Thread-Index: AQHbyjTSTHHQxhWWQUa+tyf0H7Puhg==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Wed, 21 May 2025 10:24:43 +0000
Message-ID:
	<TYSPR06MB7158089CBC192CADDD09D323F69EA@TYSPR06MB7158.apcprd06.prod.outlook.com>
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
X-QQ-XMAILINFO: OeCnONXpg9q8R1iL928v/538343OaxHilJaQn/UwhoiyDJxIOj4RFLdO
	I0nrtdM76aaCgQbLu3BCXZZH0SHTVW/15P+5qhYP1W5ub0A6kb7C5KQ0FeztZufPHl4XPtW
	W0LGVnPJ9WfGOmUTJcnssVrKdsHiU/XuIhtfTaN23L0bZcRC7x28oDfPxF6JfuUEnKibWO8
	fhE0xt29l+wChuOGmHXiLMnDD4tOijkrtVsYmK0/q4MvBvaQzstdaj3FVuoZoM4Alzpn9t1
	vHxsn23B2RuTyZV1iXTURNQo2J1J8ABsNp1bqZeY9Xe3tZTS8jcnhiRXDi3hO2VIMPqJD+Y
	WQFSDAMtz7TYPkUjU8lcwLZHK4z1f8b6BPSZFxm46rOovXnWeilByJMX/nb05DcRvGAQyaj
	RwGjVSXroE5RA1JOWJBqfsUdAlSBPVs7eQmLqM9pGZVYGpTnKlsf4aHHofEJYaXELASlsvb
	Ft1wTk0yo76jzzsJYveDYcFeEUfr4rjSQErfXnHYBHApNPrLNiC7J3SjgmFp8FERajIk6kb
	ZzS/IRpydS8D+ATxVXpECZH2g7BGslKkh6wWrhoTqwfEv6dFXiNOq0J9hsPk/HOOyz8T6sV
	gnkHme69IAOx4W2L0riJviMleVIRl08YfD2Iau/iNB1yR42HSw1oXKnc2sLArTZC/7Mw3uk
	vwGPZbZQ7jFC1u0Pleavp7mmIY+hVMoYVuKc83IVoC0RCduDAXJpgiowyNLAsnn0S5Q8khK
	mL/M+X24fX0Vy6NCRpvQwZV92jVPE+pBpkeQpMyPk0s5IUzU/Psh3n1PmDioovy+F8cpwDF
	uyVz6YyylW4/jJoWP4nlOeUt7nzk7I4u6VkA7jEW712UPwp6TRQx097zZWDeWSlNri2rHyg
	9ANA3G3o9KuPL71pJD6k5bc128cn5BGmGP92TDtuEBcNPrEVmUyzKsu3O3PK3ao1BIZFRfY
	KyqSZL8E9mBZUzqZ2yz46eumJ1QUkUUtM17b+S90mvtbY/SLqgf0BQIoJkHfboz4rTqQRVj
	BpJNECIECk6OycHQBEy29QKN2X2G/gbnKWqUOqgmWtqvgZNpz2SqLeHNmywlFaCjVJG3CgL
	Q==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Dear Maintainers,=0A=
=0A=
=0A=
=0A=
When using our customized Syzkaller to fuzz the latest Linux kernel, the fo=
llowing crash (101th)was triggered.=0A=
=0A=
=0A=
HEAD commit: 6537cfb395f352782918d8ee7b7f10ba2cc3cbf2=0A=
git tree: upstream=0A=
Output:https:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6/1=
01_KASAN%3A%20slab-use-after-free%20Write%20in%20diWrite/101report.txt=0A=
Kernel config:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6/=
config.txt=0A=
C reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6/1=
01_KASAN%3A%20slab-use-after-free%20Write%20in%20diWrite/101repro.c=0A=
Syzlang reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15=
-rc6/101_KASAN%3A%20slab-use-after-free%20Write%20in%20diWrite/101repro.txt=
=0A=
=0A=
=0A=
=0A=
This is a slab-use-after-free bug in the JFS filesystem driver, inside the =
diWrite function. When JFS is mounted over loop device and the backend stor=
age of that loop device is changed via the LOOP_SET_FD ioctl, JFS may not c=
orrectly invalidate its internal cache.=0A=
triggering procedure: JFS filesystem is mounted over a loop device. The bac=
kend file of that loop device is changed and operations (such as jfs_readdi=
r triggered by the getents64 system call here, which further calls txCommit=
 and diWrite) on the JFS filesystem try to write back inode data. The diWri=
te function tries to write a memory address that it thinks is still valid, =
but that address belongs to a slab object that has been freed (by some ext4=
 related operations) and possibly reallocated.=0A=
=0A=
=0A=
We have reproduced this issue several times on 6.15-rc6 again.=0A=
=0A=
=0A=
This is the URL of the 2024 syzbot report of this bug:https://groups.google=
.com/g/syzkaller-lts-bugs/c/CVD1uqZnFPA/m/P4-Bi8BmAwAJ=0A=
=0A=
If you fix this issue, please add the following tag to the commit:=0A=
Reported-by: Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.edu.=
cn>, Shuoran Bai <baishuoran@hrbeu.edu.cn>=0A=
=0A=
=0A=
loop4: detected capacity change from 0 to 32768=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
BUG: KASAN: slab-use-after-free in diWrite+0xeb0/0x1930=0A=
Write of size 32 at addr ffff888052f700c0 by task syz.4.12/14401=0A=
=0A=
CPU: 2 UID: 0 PID: 14401 Comm: syz.4.12 Not tainted 6.15.0-rc6 #1 PREEMPT(f=
ull)=0A=
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1=
.1 04/01/2014=0A=
Call Trace:=0A=
=A0<TASK>=0A=
=A0dump_stack_lvl+0x116/0x1b0=0A=
=A0print_report+0xc1/0x630=0A=
=A0kasan_report+0x96/0xd0=0A=
=A0kasan_check_range+0xed/0x1a0=0A=
=A0__asan_memcpy+0x3d/0x60=0A=
=A0diWrite+0xeb0/0x1930=0A=
=A0txCommit+0x6c2/0x4720=0A=
=A0jfs_readdir+0x2afa/0x44a0=0A=
=A0wrap_directory_iterator+0xa1/0xe0=0A=
=A0iterate_dir+0x2a5/0xab0=0A=
=A0__x64_sys_getdents64+0x153/0x2e0=0A=
=A0do_syscall_64+0xcf/0x260=0A=
=A0entry_SYSCALL_64_after_hwframe+0x77/0x7f=0A=
RIP: 0033:0x7fb8ca9acadd=0A=
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48=0A=
RSP: 002b:00007fb8c87f5ba8 EFLAGS: 00000246 ORIG_RAX: 00000000000000d9=0A=
RAX: ffffffffffffffda RBX: 00007fb8caba5fa0 RCX: 00007fb8ca9acadd=0A=
RDX: 000000000000009e RSI: 0000000020000280 RDI: 0000000000000005=0A=
RBP: 00007fb8caa2ab8f R08: 0000000000000000 R09: 0000000000000000=0A=
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000=0A=
R13: 00007fb8caba5fac R14: 00007fb8caba6038 R15: 00007fb8c87f5d40=0A=
=A0</TASK>=0A=
=0A=
Allocated by task 84:=0A=
=A0kasan_save_stack+0x24/0x50=0A=
=A0kasan_save_track+0x14/0x30=0A=
=A0__kasan_slab_alloc+0x87/0x90=0A=
=A0kmem_cache_alloc_noprof+0x166/0x4a0=0A=
=A0mempool_alloc_noprof+0x159/0x360=0A=
=A0bvec_alloc+0x171/0x1e0=0A=
=A0bio_alloc_bioset+0x4aa/0x920=0A=
=A0ext4_bio_write_folio+0xcb6/0x1a90=0A=
=A0mpage_submit_folio+0x1bf/0x350=0A=
=A0mpage_process_page_bufs+0x6cc/0x870=0A=
=A0mpage_prepare_extent_to_map+0x75c/0x1360=0A=
=A0ext4_do_writepages+0xc96/0x35c0=0A=
=A0ext4_writepages+0x371/0x7b0=0A=
=A0do_writepages+0x1ac/0x810=0A=
=A0__writeback_single_inode+0x12e/0xf50=0A=
=A0writeback_sb_inodes+0x5f5/0xee0=0A=
=A0__writeback_inodes_wb+0xbe/0x270=0A=
=A0wb_writeback+0x728/0xb50=0A=
=A0wb_workfn+0x96e/0xe90=0A=
=A0process_scheduled_works+0x5de/0x1bd0=0A=
=A0worker_thread+0x5a9/0xd10=0A=
=A0kthread+0x447/0x8a0=0A=
=A0ret_from_fork+0x48/0x80=0A=
=A0ret_from_fork_asm+0x1a/0x30=0A=
=0A=
Freed by task 0:=0A=
=A0kasan_save_stack+0x24/0x50=0A=
=A0kasan_save_track+0x14/0x30=0A=
=A0kasan_save_free_info+0x3a/0x60=0A=
=A0__kasan_slab_free+0x54/0x70=0A=
=A0kmem_cache_free+0x14d/0x550=0A=
=A0mempool_free+0xe9/0x3a0=0A=
=A0bvec_free+0xbd/0xf0=0A=
=A0bio_free+0xaa/0x130=0A=
=A0bio_put+0x35c/0x590=0A=
=A0ext4_end_bio+0x45b/0x6e0=0A=
=A0bio_endio+0x795/0xab0=0A=
=A0blk_update_request+0x5b6/0x17a0=0A=
=A0scsi_end_request+0x7a/0x7c0=0A=
=A0scsi_io_completion+0x17b/0x1560=0A=
=A0scsi_complete+0x12a/0x260=0A=
=A0blk_complete_reqs+0xb2/0xf0=0A=
=A0handle_softirqs+0x1be/0x850=0A=
=A0irq_exit_rcu+0xfd/0x150=0A=
=A0sysvec_call_function_single+0xde/0x100=0A=
=A0asm_sysvec_call_function_single+0x1a/0x20=0A=
=0A=
The buggy address belongs to the object at ffff888052f70000=0A=
=A0which belongs to the cache biovec-max of size 4096=0A=
The buggy address is located 192 bytes inside of=0A=
=A0freed 4096-byte region [ffff888052f70000, ffff888052f71000)=0A=
=0A=
The buggy address belongs to the physical page:=0A=
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888052f700=
00 pfn:0x52f70=0A=
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0=0A=
flags: 0x4fff00000000240(workingset|head|node=3D1|zone=3D1|lastcpupid=3D0x7=
ff)=0A=
page_type: f5(slab)=0A=
raw: 04fff00000000240 ffff888041346a00 ffffea0001197810 ffffea00011c6010=0A=
raw: ffff888052f70000 0000000000070000 00000000f5000000 0000000000000000=0A=
head: 04fff00000000240 ffff888041346a00 ffffea0001197810 ffffea00011c6010=
=0A=
head: ffff888052f70000 0000000000070000 00000000f5000000 0000000000000000=
=0A=
head: 04fff00000000003 ffffea00014bdc01 00000000ffffffff 00000000ffffffff=
=0A=
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008=
=0A=
page dumped because: kasan: bad access detected=0A=
page_owner tracks the page as allocated=0A=
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2800(GF=
P_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 92, tgid 92 (kwork=
er/u19:1), ts 99474904265, free_ts 99384964285=0A=
=A0prep_new_page+0x1b0/0x1e0=0A=
=A0get_page_from_freelist+0x1c80/0x3a40=0A=
=A0__alloc_frozen_pages_noprof+0x2fd/0x6d0=0A=
=A0alloc_pages_mpol+0x209/0x550=0A=
=A0new_slab+0x254/0x350=0A=
=A0___slab_alloc+0xf0c/0x17c0=0A=
=A0__slab_alloc.isra.0+0x56/0xb0=0A=
=A0kmem_cache_alloc_noprof+0x273/0x4a0=0A=
=A0mempool_alloc_noprof+0x159/0x360=0A=
=A0bvec_alloc+0x171/0x1e0=0A=
=A0bio_alloc_bioset+0x4aa/0x920=0A=
=A0ext4_bio_write_folio+0xcb6/0x1a90=0A=
=A0mpage_submit_folio+0x1bf/0x350=0A=
=A0mpage_process_page_bufs+0x6cc/0x870=0A=
=A0mpage_prepare_extent_to_map+0x75c/0x1360=0A=
=A0ext4_do_writepages+0xc96/0x35c0=0A=
page last free pid 9470 tgid 9470 stack trace:=0A=
=A0__free_frozen_pages+0x7cd/0x1320=0A=
=A0__put_partials+0x14c/0x170=0A=
=A0qlist_free_all+0x50/0x130=0A=
=A0kasan_quarantine_reduce+0x168/0x1c0=0A=
=A0__kasan_slab_alloc+0x67/0x90=0A=
=A0kmem_cache_alloc_noprof+0x166/0x4a0=0A=
=A0vm_area_alloc+0x20/0x170=0A=
=A0do_brk_flags+0x293/0x13a0=0A=
=A0vm_brk_flags+0x3a8/0x5f0=0A=
=A0elf_load+0x3eb/0x760=0A=
=A0load_elf_binary+0x34ed/0x50c0=0A=
=A0bprm_execve+0x8df/0x1630=0A=
=A0do_execveat_common.isra.0+0x4ce/0x630=0A=
=A0__x64_sys_execve+0x8e/0xb0=0A=
=A0do_syscall_64+0xcf/0x260=0A=
=A0entry_SYSCALL_64_after_hwframe+0x77/0x7f=0A=
=0A=
Memory state around the buggy address:=0A=
=A0ffff888052f6ff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=0A=
=A0ffff888052f70000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0A=
>ffff888052f70080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0^=0A=
=A0ffff888052f70100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0A=
=A0ffff888052f70180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
thanks,=0A=
Kun Hu=0A=
=0A=
