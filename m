Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089C838F91
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 04:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746161548; cv=none; b=OZFkI3AI/d4aWAB983Jm2fSEcEhN8e7HFFWPvY8wK1FrgkquFEJU/svNU8iauo0rE8ZBv77RbKc6kjp+RiAGQJRfcGPdSWFQdcoTHYQq3y6obNY7gXxhEXLzhALLWZ66Z/m8Gmcdlb8ONElmV1P7bw7Av4jTqADjLR4EkuhzfqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746161548; c=relaxed/simple;
	bh=OTi7ApWMtPFOuHRDQfUrldYEWzBkLwCGcJMVwp68PQ8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=km91qvl36bk8U5Rb8fo30gnmVskHFujsyaVBO6RtqCvId3jDaYpMMBk460OUlXN5uWnejSY+y9R04+SzME6cOMTvic5pGoNDFDH2nZgoQiy2JNkQ92stAuQVX43XttLoL0Mbh9d+zzVCcv80bg7qynOgcfaiR3Qo59BdXoosK/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=lU2i+a1n; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="lU2i+a1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1746161360;
	bh=OTi7ApWMtPFOuHRDQfUrldYEWzBkLwCGcJMVwp68PQ8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=lU2i+a1nWXkmo3BYQ6WaTlCCBf1oj6HT1tgYzvRoJcCgkxD6umtFzNIjN1HSz/iV7
	 mGjEE69Mkf+POqG+SNRKLv3yvfb6q1/Mtqxdhl15Y/Tzf9wUVsfjDZjw5FhZQl0ZfQ
	 L7F45Wt1U6r0goeYC+Xf4x8DtiDUKFoXgRQBm0sY=
X-QQ-mid: zesmtpip3t1746161358tf79394f1
X-QQ-Originating-IP: hdQxLLQ+GVlQDxNtMWIJsoe5jeqhquoI7ZB2ZOBN+Io=
Received: from TYSPR06MB7158.apcprd06.prod.out ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 02 May 2025 12:49:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12450518463310796809
EX-QQ-RecipientCnt: 6
From: "huk23@m.fudan.edu.cn" <huk23@m.fudan.edu.cn>
To: Dave Kleikamp <shaggy@kernel.org>
CC: Jiaji Qin <jjtan24@m.fudan.edu.cn>, Shuoran Bai <baishuoran@hrbeu.edu.cn>,
	jfs-discussion <jfs-discussion@lists.sourceforge.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzkaller@googlegroups.com" <syzkaller@googlegroups.com>
Subject: BUG:read_message failed in LogSyncRelease
Thread-Topic: BUG:read_message failed in LogSyncRelease
Thread-Index: AQHbuxzN08Vq1io1BUKiwvicApeecg==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Fri, 2 May 2025 04:49:16 +0000
Message-ID:
	<TYSPR06MB7158A2235E4058D3E32818A5F68D2@TYSPR06MB7158.apcprd06.prod.outlook.com>
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
X-QQ-XMAILINFO: MyirvGjpKb1jhWkj0AFLoslnFQ0/aHTiJlAsblNXmjsc5flbYYrtBON/
	KR5mdThTLLIhGD2gOdeZYF+8Pl7Ah5NlHsh1HD94SiK2XqB4fO0bgMUMFuHnjy1vbTkcISx
	UoI4KM8W6yr/kj+2BhM+RVUX4/Ms44jREt6JJyd5SLe9t4kgrCynRdL815QWnaR9EmpegBR
	SK7TLG0oy/PbDdV1JJmlKDBEDwG3B9Q5ZMhhZQwGfbnfGPe7hekkvgC+iUF0qj9Nu3HRzYZ
	ckA+jVVTCwDPiQBIjQ5GAOa1XSQMSgRLZ1bv2NgsRzltZDrXNZKwp/4Kd7Mf5vonSz+BmwC
	MsAb+OeWodA/UVXhcXz5AIMBEkKvPPEWTnxs1jkLw/I+Dis+GxiARqe/cAzfq/YQJqM1Kng
	l7TcenAh2QzaGpsBAZFS1GefgF2zH8tjcvBC4B1FaFl3X7uUUMhzVfJ4gjZ+6rp8Vo8wDwg
	kWiOrvYXq7rEI9voLFaWFDcr7F3kxesu1CRQPaNH13dsDT14BhvNqtxo1UvzuMXy4SoS63v
	3OphvE/N+BUDmCmKYjVz1/pxOJ6S7zJ5HzpmpqlcsKseGtKjCNyofFfs29UuWtLx06aDhrL
	BFg9VJy9ncmPotnQ1Nms+WbHh9E+EpNlKCEyhpOKY5WQYL0+ym8r3m41OuQCr044F1O1Lz5
	Lxx84wWwFxWO47Jm7JY1KRc72HtRbxIQdtWQFLhqZTQd0YoDIrLYf6XRrLBD85jacBOnBHU
	A8rRr2ujvx4p+l2p6S1pVxSFuVWPOsXhW5dsO86H6j0uAddMGVWwBRI0NlS8Vf/un2nAST0
	1ouqkghJRDj6UhN2iB2GnnnIVwXU+iQML8Q9612QWj6g9VJCzKtllqlXZvMo5/lyrN5kyD7
	D7Sju7mt52XNUTpxn1a1KhWeH8Dkzw691IPGaeNaZ2Ggya8nhlszjMNAaX4o7CRhBZBU0MI
	lSBqWKVi68aheIqod8llGBx2QTHr2hlmYh1nOwqxjuFTpU9+zVuKmOlsSZF83UJRvLCYsWC
	Q6bQ8bAR1XqrTB8R+sxirejH6zdYaZSXPJr1ICfdzfaXXhQ2ud
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Dear Maintainers,=0A=
=0A=
=0A=
=0A=
=0A=
When using our customized Syzkaller to fuzz the latest Linux kernel, the fo=
llowing crash (36th)was triggered.=0A=
=0A=
=0A=
=0A=
=0A=
HEAD commit: 6537cfb395f352782918d8ee7b7f10ba2cc3cbf2=0A=
git tree: upstream=0A=
Output:https://github.com/pghk13/Kernel-Bug/blob/main/0103_6.13rc5_%E6%9C%A=
A%E6%8A%A5%E5%91%8A/%E6%9C%89%E7%9B%B8%E4%BC%BC%E6%A3%80%E7%B4%A2%E8%AE%B0%=
E5%BD%95/36-kernel%20BUG%20in%20txAbort/36call_trace.txt=0A=
Kernel config:https://github.com/pghk13/Kernel-Bug/blob/main/config.txt=0A=
C reproducer:https://github.com/pghk13/Kernel-Bug/blob/main/0103_6.13rc5_%E=
6%9C%AA%E6%8A%A5%E5%91%8A/%E6%9C%89%E7%9B%B8%E4%BC%BC%E6%A3%80%E7%B4%A2%E8%=
AE%B0%E5%BD%95/36-kernel%20BUG%20in%20txAbort/36repro.c=0A=
Syzlang reproducer: https://github.com/pghk13/Kernel-Bug/blob/main/0103_6.1=
3rc5_%E6%9C%AA%E6%8A%A5%E5%91%8A/%E6%9C%89%E7%9B%B8%E4%BC%BC%E6%A3%80%E7%B4=
%A2%E8%AE%B0%E5%BD%95/36-kernel%20BUG%20in%20txAbort/36repro.txt=0A=
=0A=
=0A=
=0A=
This error is triggered in the transaction abort function txAbort, which is=
 located in the JFS transaction manager code. The error occurs on line 2796=
 of the fs/jfs/jfs_txnmgr.c file, asserting that mp->nohomeok failed. This =
indicates that in the specified "metapage" (MP) object, the value of the no=
homeok flag does not meet the expected condition (possibly 0 or false, whil=
e the assertion requires it to be non-zero or true).=0A=
We have reproduced this issue several times on 6.15-rc1 again.=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
If you fix this issue, please add the following tag to the commit:=0A=
Reported-by: Kun Hu <huk23@m.fudan.edu.cn>,=A0Jiaji Qin <jjtan24@m.fudan.ed=
u.cn>, Shuoran Bai <baishuoran@hrbeu.edu.cn>=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A=
read_mapping_page failed!=0A=
BUG at fs/jfs/jfs_txnmgr.c:2796 assert(mp->nohomeok)=0A=
------------[ cut here ]------------=0A=
kernel BUG at fs/jfs/jfs_txnmgr.c:2796!=0A=
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI=0A=
CPU: 1 UID: 0 PID: 9491 Comm: syz-executor237 Not tainted 6.15.0-rc1 #1 PRE=
EMPT(full)=0A=
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1=
.1 04/01/2014=0A=
RIP: 0010:txAbort+0x51e/0x570=0A=
Code: e9 96 fd ff ff e8 22 2c 73 fe 48 c7 c1 00 4f cd 8b ba ec 0a 00 00 48 =
c7 c6 e0 41 cd 8b 48 c7 c7 20 42 cd 8b e8 23 5d 52 fe 90 <0f> 0b e8 fb 2b 7=
3 fe 48 c7 c1 40 4f cd 8b ba ed 0a 00 00 48 c7 c6=0A=
RSP: 0018:ffffc90014c7f4c0 EFLAGS: 00010286=0A=
RAX: 0000000000000034 RBX: dffffc0000000000 RCX: ffffffff819a5799=0A=
RDX: 0000000000000000 RSI: ffff888022bc0000 RDI: 0000000000000002=0A=
RBP: 0000000000000003 R08: fffffbfff1c4bb00 R09: ffffed100fdc47ba=0A=
R10: ffffed100fdc47b9 R11: ffff88807ee23dcb R12: 0000000000000000=0A=
R13: ffffc90001b69110 R14: ffff8880548a2ba0 R15: ffff8880548a2c48=0A=
FS: =A0000055558797f880(0000) GS:ffff8880eb36b000(0000) knlGS:0000000000000=
000=0A=
CS: =A00010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
CR2: 00007f5264200058 CR3: 0000000023ba8000 CR4: 0000000000750ef0=0A=
PKRU: 55555554=0A=
Call Trace:=0A=
=A0<TASK>=0A=
=A0txCommit+0x2149/0x4720=0A=
=A0jfs_create+0x808/0xb40=0A=
=A0lookup_open+0x11ba/0x15f0=0A=
=A0path_openat+0xed3/0x2980=0A=
=A0do_filp_open+0x1f9/0x2f0=0A=
=A0do_sys_openat2+0x4e3/0x710=0A=
=A0do_sys_open+0xc6/0x150=0A=
=A0__x64_sys_openat+0x9d/0x110=0A=
=A0do_syscall_64+0xcf/0x260=0A=
=A0entry_SYSCALL_64_after_hwframe+0x77/0x7f=0A=
RIP: 0033:0x7fbeaee100bd=0A=
Code: c3 e8 17 2c 00 00 0f 1f 80 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48=0A=
RSP: 002b:00007ffebb56d188 EFLAGS: 00000246 ORIG_RAX: 0000000000000101=0A=
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fbeaee100bd=0A=
RDX: 000000000000275a RSI: 0000000020000040 RDI: 00000000ffffff9c=0A=
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001=0A=
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffebb56d19c=0A=
R13: 00007ffebb56d1a0 R14: 0000000000000000 R15: 0000000000000000=0A=
=A0</TASK>=0A=
Modules linked in:=0A=
---[ end trace 0000000000000000 ]---=0A=
RIP: 0010:txAbort+0x51e/0x570=0A=
Code: e9 96 fd ff ff e8 22 2c 73 fe 48 c7 c1 00 4f cd 8b ba ec 0a 00 00 48 =
c7 c6 e0 41 cd 8b 48 c7 c7 20 42 cd 8b e8 23 5d 52 fe 90 <0f> 0b e8 fb 2b 7=
3 fe 48 c7 c1 40 4f cd 8b ba ed 0a 00 00 48 c7 c6=0A=
RSP: 0018:ffffc90014c7f4c0 EFLAGS: 00010286=0A=
RAX: 0000000000000034 RBX: dffffc0000000000 RCX: ffffffff819a5799=0A=
RDX: 0000000000000000 RSI: ffff888022bc0000 RDI: 0000000000000002=0A=
RBP: 0000000000000003 R08: fffffbfff1c4bb00 R09: ffffed100fdc47ba=0A=
R10: ffffed100fdc47b9 R11: ffff88807ee23dcb R12: 0000000000000000=0A=
R13: ffffc90001b69110 R14: ffff8880548a2ba0 R15: ffff8880548a2c48=0A=
FS: =A0000055558797f880(0000) GS:ffff8880eb36b000(0000) knlGS:0000000000000=
000=0A=
CS: =A00010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
CR2: 00007f5264200058 CR3: 0000000023ba8000 CR4: 0000000000750ef0=0A=
PKRU: 55555554=0A=
2025/04/23 15:35:05 reproducing crash 'kernel BUG in txAbort': final repro =
crashed as (corrupted=3Dfalse):=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A=
=0A=
=0A=
thanks,=0A=
Kun Hu=0A=
=0A=
=0A=
