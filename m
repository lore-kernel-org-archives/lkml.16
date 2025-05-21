Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9C525A2C5
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826406; cv=none; b=JioiAYhLWCfEau2rRsT0/XjdC3DSPnlDnysOMiNIezOFqZq4PfVQQeTBJV1CAIhoCPCZIEyOGQ0neWLns9WSyO0qMGgACO7XeHd2oPvk04ARgmRw9NyBsv/7RJErtj6D7EWlUB9/FGunzqaKtziTqKIgY/RQWs9E9tGU+mA0GEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826406; c=relaxed/simple;
	bh=g6A67r3lx5NE4Cf7U6BOeLu0hAWS9J0OX6bfKgwgxPM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uchvFJNm82x6OyNIHAbi4IXA9i4KrXPxHzxza6ZyUjOgPcQjJRLUk40LNmbmGT7eDi2vIHzp7PKfzETkOu5MSOSvHNtTHPis73fsK6269vOc31bBL8HCP6m50RCI3f2ZlcTDCV8b39rcqaDPyVUQ1hJNIzhvbO92n7XYPa/ua6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=mo/j6lU5; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="mo/j6lU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1747826376;
	bh=vNb6nPyrHCd1zE6lS97OOCE/KROw2RLPReFEDtFNmZc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mo/j6lU5um6wx6aor3zzYpVrCuTHS3ve7nz7eEMo0PozgAseeROm+XmnAicc5Wnxd
	 Vsu6M5fpAUl32PJaUEl6JcMrVGPSvM3ILzNWSgIj9yQjUXNqo6ZyWrAs2GBVv5IJ3l
	 +yjUj9gUsBdx6mI4z+O6bDq3LS65jymPLkziirwM=
X-QQ-mid: zesmtpip4t1747826371t1a2cabd3
X-QQ-Originating-IP: T0a8iiM67sjqmGsIz5JEpp58qo1b9U2bDXOJSfCxubg=
Received: from TYSPR06MB7158.apcprd06.prod.out ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 21 May 2025 19:19:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9234854677814978668
EX-QQ-RecipientCnt: 5
From: "huk23@m.fudan.edu.cn" <huk23@m.fudan.edu.cn>
To: Dave Kleikamp <shaggy@kernel.org>
CC: Jiaji Qin <jjtan24@m.fudan.edu.cn>, Shuoran Bai <baishuoran@hrbeu.edu.cn>,
	syzkaller <syzkaller@googlegroups.com>, linux-kernel
	<linux-kernel@vger.kernel.org>
Subject: KASAN: slab-out-of-bounds Read in dbAllocBits
Thread-Topic: KASAN: slab-out-of-bounds Read in dbAllocBits
Thread-Index: AQHbyjq01DJqSgbzGkGdgzUDrtQ/lQ==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Wed, 21 May 2025 11:19:29 +0000
Message-ID:
	<TYSPR06MB715891CFDFE828006F96F88FF69EA@TYSPR06MB7158.apcprd06.prod.outlook.com>
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
X-QQ-XMAILINFO: MkpNHbQT2yp/RDztyKQecDNpGs6C2vpPQRhsmtptx2xNcITpwA9cEkbv
	piEvfaMIlx+JuanKYc7nrd5lYzSk9k6jnbPwqWWe+uw+uo0jDtp+YBdcTesaXlL93Gvbc2z
	tDaohav8e03R5XZp2UlSVnLmbFoBDQXMe7L7bUXmvjO1ntVM/r3yzyp4b7uDZR3o/uPff0k
	oklcThTFLlmbeARoMdp4nXnKJR2eWtHkP6RqaswBu06H8qMUEfBCCUGs5SgdL7f57fwa8KA
	6XlZNj+Oz2L+/3RWsnKA+2xdqJV6jXZYkmVT6LPsheJL+lPIt5E53bOar2Kqe0uVgLEwUnY
	p90Bai18/Yf/WaoBumVREjvGEPOpQiO1TM2PPOCp8xr590kTnGivAyBgynAbYPom3uVLWYN
	MDoVG6dWI7fJiSQp4EN48nmSRqeOalIqB6qHXA9VJmIOw6t7LSFw2/OhJqh2PCvaakPrMch
	XnbbKulR3UFVRzMuc294P7SldIgg7bQH8McdB91b4gNplbpBkNScD5tXzSjMSpgvQdYu/yL
	q4FSm/bpo/phdgDNO59Pi/hDAZ/kIbSk2fJ+FahqPG61lfuCW9h2RonMuPBBOSdHXKf32hW
	wx7LaK4xyUPp8GDGwXjPx8inOR/lk9VRyqqaGMqTZhaMdWXJkVUg/A+kG2R0pHCW2YPRSRx
	BH0MKBo5h4+QwiYSknCIGTOLtI1hdRixptTKBxPMlJ8thJ7XEt9+hj4R5dbNis9ryW5sOkJ
	n0/ACjkZdGisHBjnj63SMOCGFKt4Psja5mipxtGPfO2M1Pj7GStqRbHIcQQo9MqiOrsR6rp
	+joNG53YcAybfe9cDuqQCgq46O78NA2Ie8QAZWin4VwHx2LJvzABHKHI0HYZOIZsV1N8aUy
	uFw1axxqNzuUyank8MM7m54SSvkC14AYEHATq60A/Q7Fe48jElzvcNPzkRh3UdJzgDalyYJ
	uUza85bJqhaK67kpDFKuTEwQdFYKeU4vQWZDxFOCklpFbMQ2vWH96lQPfjlBP1C+sL+C81l
	DVAtpaonYYlyJDAdVDpTQjtN9op+22kDsQfsjmNQ==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Dear Maintainers,=0A=
=0A=
=0A=
=0A=
When using our customized Syzkaller to fuzz the latest Linux kernel, the fo=
llowing crash (102th)was triggered.=0A=
=0A=
=0A=
HEAD commit: 6537cfb395f352782918d8ee7b7f10ba2cc3cbf2=0A=
git=A0tree: upstream=0A=
Output:https:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6/1=
02_KASAN%3A%20slab-out-of-bounds%20Read%20in%20dbAllocBits/102report.txt=0A=
Kernel config:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6/=
config.txt=0A=
C reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15-rc6/1=
02_KASAN%3A%20slab-out-of-bounds%20Read%20in%20dbAllocBits/102repro.c=0A=
Syzlang reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0520_6.15=
-rc6/102_KASAN%3A%20slab-out-of-bounds%20Read%20in%20dbAllocBits/102repro_b=
ug_title.txt=0A=
=0A=
=0A=
=0A=
The issue with this bug could be that the JFS file system fails to correctl=
y synchronize or update its internal block allocation metadata (bmap struct=
ure) when underlying loop device backend storage is dynamically changed by =
LOOP_SET_FD. This leads to the dbAllocBits function using outdated or corru=
pted bmap information, specifically the db_l2size field, when trying to all=
ocate a block, resulting in a wrong, oversized agno value being calculated,=
 which eventually causes an out-of-bounds read when accessingmp->db_agfree[=
agno].=0A=
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
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
BUG: KASAN: slab-out-of-bounds in dbAllocBits+0x629/0x640=0A=
Read of size 8 at addr ffff888000efbeb8 by task syz.4.23/14569=0A=
=0A=
CPU: 2 UID: 0 PID: 14569 Comm: syz.4.23 Not tainted 6.15.0-rc6 #1 PREEMPT(f=
ull) =0A=
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1=
.1 04/01/2014=0A=
Call Trace:=0A=
 <TASK>=0A=
 dump_stack_lvl+0x116/0x1b0=0A=
 print_report+0xc1/0x630=0A=
 kasan_report+0x96/0xd0=0A=
 dbAllocBits+0x629/0x640=0A=
 dbAllocDmap+0x61/0x120=0A=
 dbAlloc+0x7a1/0xac0=0A=
 ea_get+0xc8e/0x1380=0A=
 __jfs_setxattr+0x1af/0xfa0=0A=
 __jfs_set_acl+0x119/0x1b0=0A=
 jfs_set_acl+0x1e9/0x350=0A=
 set_posix_acl+0x261/0x330=0A=
 vfs_set_acl+0x5ad/0x920=0A=
 do_set_acl+0xd9/0x1a0=0A=
 do_setxattr+0xc2/0x190=0A=
 filename_setxattr+0x159/0x1c0=0A=
 path_setxattrat+0x1cc/0x290=0A=
 __x64_sys_lsetxattr+0xc9/0x140=0A=
 do_syscall_64+0xcf/0x260=0A=
 entry_SYSCALL_64_after_hwframe+0x77/0x7f=0A=
RIP: 0033:0x7fd8b7bacadd=0A=
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48=0A=
RSP: 002b:00007fd8b89f2ba8 EFLAGS: 00000246 ORIG_RAX: 00000000000000bd=0A=
RAX: ffffffffffffffda RBX: 00007fd8b7da5fa0 RCX: 00007fd8b7bacadd=0A=
RDX: 0000000020000180 RSI: 0000000020000040 RDI: 0000000020000000=0A=
RBP: 00007fd8b7c2ab8f R08: 0000000000000000 R09: 0000000000000000=0A=
R10: 0000000000000024 R11: 0000000000000246 R12: 0000000000000000=0A=
R13: 00007fd8b7da5fac R14: 00007fd8b7da6038 R15: 00007fd8b89f2d40=0A=
 </TASK>=0A=
=0A=
Allocated by task 9812:=0A=
 kasan_save_stack+0x24/0x50=0A=
 kasan_save_track+0x14/0x30=0A=
 __kasan_kmalloc+0xaa/0xb0=0A=
 __kmalloc_noprof+0x214/0x600=0A=
 sk_prot_alloc+0x192/0x280=0A=
 sk_alloc+0x3a/0x1380=0A=
 __netlink_create+0x5d/0x2c0=0A=
 __netlink_kernel_create+0xea/0x770=0A=
 genl_pernet_init+0xbe/0x170=0A=
 ops_init+0x1e1/0x640=0A=
 setup_net+0x21e/0x880=0A=
 copy_net_ns+0x2e3/0x640=0A=
 create_new_namespaces+0x3f6/0xaf0=0A=
 unshare_nsproxy_namespaces+0xc0/0x200=0A=
 ksys_unshare+0x40e/0x940=0A=
 __x64_sys_unshare+0x31/0x40=0A=
 do_syscall_64+0xcf/0x260=0A=
 entry_SYSCALL_64_after_hwframe+0x77/0x7f=0A=
=0A=
The buggy address belongs to the object at ffff888000efb000=0A=
 which belongs to the cache kmalloc-2k of size 2048=0A=
The buggy address is located 1920 bytes to the right of=0A=
 allocated 1848-byte region [ffff888000efb000, ffff888000efb738)=0A=
=0A=
The buggy address belongs to the physical page:=0A=
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xef8=0A=
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0=0A=
anon flags: 0x7ff00000000040(head|node=3D0|zone=3D0|lastcpupid=3D0x7ff)=0A=
page_type: f5(slab)=0A=
raw: 007ff00000000040 ffff88801b442f00 0000000000000000 dead000000000001=0A=
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000=0A=
head: 007ff00000000040 ffff88801b442f00 0000000000000000 dead000000000001=
=0A=
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000=
=0A=
head: 007ff00000000003 ffffea000003be01 00000000ffffffff 00000000ffffffff=
=0A=
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008=
=0A=
page dumped because: kasan: bad access detected=0A=
page_owner tracks the page as allocated=0A=
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__=
GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 9700, t=
gid 9700 (dhclient-script), ts 110050809934, free_ts 90102811247=0A=
 prep_new_page+0x1b0/0x1e0=0A=
 get_page_from_freelist+0x1c80/0x3a40=0A=
 __alloc_frozen_pages_noprof+0x2fd/0x6d0=0A=
 alloc_pages_mpol+0x209/0x550=0A=
 new_slab+0x254/0x350=0A=
 ___slab_alloc+0xf0c/0x17c0=0A=
 __slab_alloc.isra.0+0x56/0xb0=0A=
 __kmalloc_noprof+0x2d3/0x600=0A=
 tomoyo_init_log+0x1204/0x1e20=0A=
 tomoyo_supervisor+0x2e6/0x1320=0A=
 tomoyo_env_perm+0x185/0x200=0A=
 tomoyo_find_next_domain+0x154c/0x20a0=0A=
 tomoyo_bprm_check_security+0x13a/0x1d0=0A=
 security_bprm_check+0x8b/0x210=0A=
 bprm_execve+0x832/0x1630=0A=
 do_execveat_common.isra.0+0x4ce/0x630=0A=
page last free pid 7296 tgid 7296 stack trace:=0A=
 __free_frozen_pages+0x7cd/0x1320=0A=
 __put_partials+0x14c/0x170=0A=
 qlist_free_all+0x50/0x130=0A=
 kasan_quarantine_reduce+0x168/0x1c0=0A=
 __kasan_slab_alloc+0x67/0x90=0A=
 kmem_cache_alloc_noprof+0x166/0x4a0=0A=
 security_inode_alloc+0x3e/0x2c0=0A=
 inode_init_always_gfp+0xd15/0x1090=0A=
 alloc_inode+0x8d/0x1f0=0A=
 new_inode+0x16/0x40=0A=
 shmem_get_inode+0x1ba/0xaa0=0A=
 shmem_mknod+0x1a8/0x450=0A=
 lookup_open+0x11ba/0x15f0=0A=
 path_openat+0xed3/0x2980=0A=
 do_filp_open+0x1f9/0x2f0=0A=
 do_sys_openat2+0x4e3/0x710=0A=
=0A=
Memory state around the buggy address:=0A=
 ffff888000efbd80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc=0A=
 ffff888000efbe00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc=0A=
>ffff888000efbe80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc=0A=
                                        ^=0A=
 ffff888000efbf00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc=0A=
 ffff888000efbf80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
thanks,=0A=
Kun Hu=0A=
