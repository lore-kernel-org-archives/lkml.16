Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49786288539
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623219; cv=none; b=NP+mMTwA8yCU3QT/CTp6c+dZ7exUOm/SFpg4y+TtWnTaOvFiYu9W7JZiOeNhDAH9H/NF0XyRYwoR4XbSlsjwGrVZbS1tqPxTlvMUh2lPHvQ4lNGpkE0eC0K2jLvwf9qjvJz2Bi9oCdw19L5CpfxYBWM9EhfjhmNTA6LRpoUN3y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623219; c=relaxed/simple;
	bh=TAd+JTO2l43/RDd65HB3pxW8cUKNxoQ+7QawlyuvKj4=;
	h=From:Subject:To:CC:Message-ID:Date:MIME-Version:Content-Type; b=lM0RI7CsIhkk9xB+d2rHdWX4jX9J1kWGnZIbluZ5rxk4B35bHxphJWZk3AVwbt1PkfGTSDgTr9jm0GK14tMPko6mCWGHWvf8l8KKEbOXVLAQaO3otuKJ1W3zpWVD9nNcY/PxCZX9my5AAMgsU+LkqqDcBWwmV5V0dCiaXN4Vy5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZswVy4Y58z26grK;
	Wed,  7 May 2025 21:06:02 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id CA34D1A0190;
	Wed,  7 May 2025 21:06:36 +0800 (CST)
Received: from kwepemn500018.china.huawei.com (7.202.194.159) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 7 May 2025 21:06:36 +0800
Received: from [10.174.179.79] (10.174.179.79) by
 kwepemn500018.china.huawei.com (7.202.194.159) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 7 May 2025 21:06:35 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
Subject: WARNING in try_grab_folio caused by vmw_vmci
To: <bryan-bt.tan@broadcom.com>, <vishnu.dasa@broadcom.com>,
	<bcm-kernel-feedback-list@broadcom.com>
CC: LKML <linux-kernel@vger.kernel.org>, <mawupeng1@huawei.com>
Message-ID: <e91da589-ad57-3969-d979-879bbd10dddd@huawei.com>
Date: Wed, 7 May 2025 21:06:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemn500018.china.huawei.com (7.202.194.159)

Hello=EF=BC=8C

 =C2=A0=C2=A0=C2=A0 Our syzkaller report a problem=C2=A0 in the lasted up=
stream caused by=20
vmw_vmci=EF=BC=8Cit seems that when

vmci_host_setup_notify call get_user_pages_fast=EF=BC=8Cthe page's refere=
nce=20
count already decreased to 0.

Maybe concurrent with put_page in vmci_ctx_unset_notify?

------------[ cut here ]------------
WARNING: CPU: 0 PID: 2234 at mm/gup.c:142 try_grab_folio+0x225/0x2c0=20
mm/gup.c:142
Modules linked in:
CPU: 0 PID: 2234 Comm: syz.3.236 Not tainted 6.6.0+ #50
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS=20
rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
RIP: 0010:try_grab_folio+0x225/0x2c0 mm/gup.c:142
Code: 5d 41 5c 41 5d 41 5e c3 cc cc cc cc e8 24 78 b7 ff be 04 00 00 00=20
4c 89 e7 e8 e7 22 18 00 f0 44 01 6b 34 eb cd e8 0b 78 b7 ff <0f> 0b bb=20
f4 ff ff ff eb c1 e8 fd 77 b7 ff be 04 00 00 00 4c 89 e7
RSP: 0018:ffff88800364f838 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffffea0000530000 RCX: ffffffff9930ee05
RDX: ffff888010892340 RSI: 0000000000000000 RDI: 0000000000000005
RBP: 0000000000210003 R08: 0000000000000000 R09: fffff940000a6006
R10: 0000000000000000 R11: 0000000000000000 R12: ffffea0000530034
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
FS:=C2=A0 00007f71153246c0(0000) GS:ffff888119800000(0000) knlGS:00000000=
00000000
CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7115323fa8 CR3: 000000000f5e8004 CR4: 0000000000770ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 80000000
Call Trace:
 =C2=A0<TASK>
 =C2=A0follow_trans_huge_pmd+0x727/0x1290 mm/huge_memory.c:2151
 =C2=A0follow_pmd_mask.isra.0+0x5ed/0xae0 mm/gup.c:648
 =C2=A0follow_pud_mask mm/gup.c:677 [inline]
 =C2=A0follow_p4d_mask.constprop.0+0x309/0x6e0 mm/gup.c:694
 =C2=A0follow_page_mask+0x209/0x350 mm/gup.c:744
 =C2=A0__get_user_pages+0x21e/0xc20 mm/gup.c:1165
 =C2=A0__get_user_pages_locked mm/gup.c:1431 [inline]
 =C2=A0__gup_longterm_locked+0x178/0x1360 mm/gup.c:2124
 =C2=A0internal_get_user_pages_fast+0x2df/0x3b0 mm/gup.c:3232
 =C2=A0get_user_pages_fast+0xad/0x100 mm/gup.c:3310
 =C2=A0vmci_host_setup_notify drivers/misc/vmw_vmci/vmci_host.c:246 [inli=
ne]
 =C2=A0vmci_host_do_set_notify drivers/misc/vmw_vmci/vmci_host.c:798 [inl=
ine]
 =C2=A0vmci_host_unlocked_ioctl+0x3d8/0x15c0=20
drivers/misc/vmw_vmci/vmci_host.c:953
 =C2=A0vfs_ioctl fs/ioctl.c:51 [inline]
 =C2=A0__do_sys_ioctl fs/ioctl.c:871 [inline]
 =C2=A0__se_sys_ioctl+0x12d/0x190 fs/ioctl.c:857
 =C2=A0do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 =C2=A0do_syscall_64+0x59/0x110 arch/x86/entry/common.c:81
 =C2=A0entry_SYSCALL_64_after_hwframe+0x78/0xe2


Can reproduce with following syzkaller log in latest upstream:

0s ago: executing program 4 (id=3D414):
kexec_load(0x0, 0x1, &(0x7f0000001740)=3D[{0x0, 0x0, 0x0, 0x2000000}],=20
0x4) (async)
r0 =3D openat$vmci(0xffffffffffffff9c, &(0x7f0000000000), 0x2, 0x0)
ioctl$IOCTL_VMCI_VERSION2(r0, 0x7a7, &(0x7f0000000080)=3D0x80000)
ioctl$IOCTL_VMCI_INIT_CONTEXT(r0, 0x7a0, &(0x7f0000000180)=3D{@local}) (a=
sync)
ioctl$IOCTL_VMCI_DATAGRAM_RECEIVE(r0, 0x7cb,=20
&(0x7f0000000040)=3D{&(0x7f00000001c0)=3D{{@my=3D0x1}, {@hyper}, 0x400,=20
"b27f0c7fac7b2b58bb0c2d60a35fa17e8d9e6687dc17565d50a0513736cf17a87d5258de=
c6a1b1504690b21862e189865885ef358a65b1b49291bad5b1f9fabc39d8aa399fba1aa26=
9c986f57bb9d8333297da82457a7f63dc5c96e4b5641d90023c09ea4691fbe0b44b679634=
ac1125741501157e6121641e4975afea4631704276c8c0fd4a22fadc829908ce722077001=
b4a0828549a623c92d4ca4185609858a29f1d07bbcfe31d2b0291d5c10a14311f8f3b7004=
b550ed6aeff007cd0886f9efca0801f79d1cfe3f0c4c3d1bbc41464567004cb971ed6939e=
7022664a121298d737ebcd87e09bd85070382c8b2fcaeab407f44ae8a92ba9fdfbc6d2e69=
1314846efa87d98a938d4034b51de9a036d57c819cb5043f77c58bf608ea58b53b8d83cc8=
1e18e2795ecba0c054e896262ef5e37db3cbee41f82b1b58794794554718afcf64b2e25f4=
6064d61c8346961a9622143993f1ed9f32e08c9b523acd7c427efc12982b1f93ef26be22f=
b91a476b075083c2ee370e0c4a4c34aaaf0f6643282cc5bc7ad58d15289bde617d5f0f558=
e7482050a8e7999c3e8e9bce1c3f20920ee01d00d90341c143ed42ed9e858ed608be4e02d=
95c280fc11a21ff6b6ffbf80c96c290da121bda783dd5d59fe922c61dd55725b7a1298c27=
ff5c15c279c6da7a7a6bc327a22ee6d15de543916cc4791dedd45c02c211b75803430d1d3=
b9c9a9880c7e8af22991b9006eff113008f5ff59d5cced6ca5e1f6492fc20624cabcfac4d=
fa6556236db6b3c0f15785007980b6e2b9fb5eca8672927ccdde6e254e70d718e42ad0c75=
abf5dcfe010824e5420ec7f52470523686e968725e81df54899a3a2c0b5be4aa9ab604130=
fbf3b95b1ba806d82aef887034405ef5f1123922c90953cfdedf34b77076bc252b33764ee=
921b757c07962ea620c5f6ee0129229ce0321e8db6a4b506323340a55a74f71b76c912698=
803cdf9e5827a2a60a2e88cae0f305e0feba117376584fcd1190e411f9211424b13f30654=
f27271c07102c998eded3a147b17eac2530cdcf353a7ae22483a3bf5d89dfc1ba9c9f6ba4=
2ac566193bf4902ce5df3cbae9d90417326cbc2ad3f1cb9e000f040b810dbdfa99f97f29f=
e9e546cf3c99d2cb0cf18dda392f036ac99b3d7448da79eb5e755f8a72906f3349e927a67=
880b7995fe95916bd3f9b0575c93b46281f99f193d0e7a9662d98ee7072cd299b0a8a34ca=
40e8853cac51b3f57c5f4350f35a2682c88b02e47dee72ae7665185742a4046ad7e547529=
8000e48f8dc3ffb66826fd509e7088e7d9e5180385e66ec34e3928e2b5762d284be23cb4d=
9c90a7d31efbf8645222391efb47f2951b7142c055c7a23344b81dffdd21d21e850de7eb5=
37c1023fc375c266dd55e9c27c8391b923363ffc0cfc6914e1af2e7b88e04ebc3bc1fee90=
e55cd"},=20
0x418, 0x4b}) (async)
ioctl$IOCTL_VMCI_SET_NOTIFY(r0, 0x7cb, &(0x7f0000000140))
socketpair$unix(0x1, 0x2, 0x0,=20
&(0x7f0000000040)=3D{<r1=3D>0xffffffffffffffff, <r2=3D>0xffffffffffffffff=
})
r3 =3D dup2(r1, r2)
write$P9_RREMOVE(r3, 0x0, 0x65) (async)
ioctl$KVM_CAP_X86_APIC_BUS_CYCLES_NS(r3, 0x4068aea3,=20
&(0x7f00000000c0)=3D{0xed, 0x0, 0x1e90}) (async)
r4 =3D socket$nl_generic(0x10, 0x3, 0x10) (async, rerun: 32)
sendmsg$nl_xfrm(r3, &(0x7f0000000840)=3D{&(0x7f0000000600)=3D{0x10, 0x0, =

0x0, 0x80000000}, 0xc,=20
&(0x7f0000000800)=3D{&(0x7f0000000640)=3D@getae=3D{0x1b0, 0x1f, 0x4, 0x70=
bd2c,=20
0x25dfdbfb, {{@in=3D@loopback, 0x4d5, 0x2, 0xff}, @in6=3D@local, 0x2,=20
0x3503}, [@lifetime_val=3D{0x24, 0x9, {0x2, 0x5, 0x2, 0x81}},=20
@lifetime_val=3D{0x24, 0x9, {0xfffffffffffffffb, 0x10, 0x10000, 0x6fc}}, =

@sa=3D{0xe4, 0x6, {{@in6=3D@local, @in6=3D@private0=3D{0xfc, 0x0, '\x00',=
 0x93},=20
0x4e20, 0x84f, 0x4e23, 0x800, 0xa, 0xa0, 0x0, 0x3a, 0x0, 0xee01},=20
{@in6=3D@initdev=3D{0xfe, 0x88, '\x00', 0x1, 0x0}, 0x4d2, 0x3c},=20
@in6=3D@empty, {0x100000000, 0x5, 0x4, 0x3ff, 0x7, 0x80000000, 0xa, 0x8},=
=20
{0x8, 0x8, 0x745, 0x6}, {0x16, 0x6, 0x8}, 0x70bd2c, 0x34ff, 0xa, 0x0,=20
0x3, 0x2}}, @tmpl=3D{0x44, 0x5, [{{@in6=3D@private1, 0x4d6, 0x6c}, 0xa,=20
@in6=3D@local, 0x3505, 0x4, 0x3, 0x7, 0xfffdf801, 0x3, 0x9}]}]}, 0x1b0}, =

0x1, 0x0, 0x0, 0x20000010}, 0x9b65ab93687f8eff) (async, rerun: 32)
r5 =3D syz_genetlink_get_family_id$mptcp(&(0x7f0000000180),=20
0xffffffffffffffff)
sendmsg$MPTCP_PM_CMD_SET_LIMITS(r4, &(0x7f0000000940)=3D{0x0, 0x0,=20
&(0x7f0000000900)=3D{&(0x7f0000000880)=3DANY=3D[@ANYBLOB=3D"18000000",=20
@ANYRES16=3Dr5,=20
@ANYBLOB=3D"01d400000a00000004aaf299ec81e1e91be9d0b73bea05462c25f60180f30=
000000000003a853e014f626cef36b2afcfa4b1a96e5403ab2c8a04"],=20
0xfffffffffffffecd}}, 0x0) (async)
kexec_load(0x0, 0x0, &(0x7f0000000140), 0x150000)

441.49334ms ago: executing program 3 (id=3D409):
ioctl$TCSETAW(0xffffffffffffffff, 0x5407, &(0x7f0000000100)=3D{0x0, 0x0, =

0x0, 0x0, 0x0, "2c62506e4daaa49f"})
r0 =3D syz_open_dev$tty20(0xc, 0x4, 0x0)
ioctl$KDSETKEYCODE(r0, 0x4b4d, &(0x7f0000000080)=3D{0x6, 0x941})
ioctl$KDGKBMODE(r0, 0x80045440, &(0x7f0000000600))
perf_event_open$cgroup(&(0x7f0000000140)=3D{0x0, 0x80, 0x9, 0x0, 0xf3,=20
0x0, 0x0, 0x83, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,=20
0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,=20
0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,=20
0x0, 0x0, 0x0, @perf_bp=3D{0x0}, 0x0, 0x0, 0x8, 0x8}, 0xffffffffffffffff,=
=20
0x0, 0xffffffffffffffff, 0x0)
r1 =3D syz_open_dev$sg(&(0x7f0000000000), 0x1, 0x0)
pipe(&(0x7f0000000000)=3D{<r2=3D>0xffffffffffffffff, <r3=3D>0xfffffffffff=
fffff})
writev(r3, &(0x7f0000000640)=3D[{&(0x7f0000000040)=3D"f7", 0xfffffdef}], =
0x1)
poll(&(0x7f0000000140)=3D[{r3}], 0x1, 0x3ff)
readv(r2, &(0x7f00000002c0)=3D[{&(0x7f0000000080)=3D""/104, 0xfffffdef}],=
 0x1)
r4 =3D socket$nl_generic(0x10, 0x3, 0x10)
sendmsg$nl_generic(r4, &(0x7f0000002d80)=3D{0x0, 0x0,=20
&(0x7f0000000000)=3D{&(0x7f0000000080)=3DANY=3D[@ANYBLOB=3D"1400000021000=
1000010000000000007000000"],=20
0x14}}, 0x0)
ioctl$SCSI_IOCTL_SEND_COMMAND(r1, 0x1,=20
&(0x7f0000000140)=3DANY=3D[@ANYBLOB=3D"c101000002000000a30c"])
io_setup(0x7fc, &(0x7f0000000140)=3D<r5=3D>0x0)
r6 =3D openat$sndtimer(0xffffffffffffff9c, &(0x7f0000000040), 0x0)
r7 =3D dup(r6)
io_submit(r5, 0x1, &(0x7f00000006c0)=3D[&(0x7f0000000340)=3D{0x0, 0x0, 0x=
0,=20
0x5, 0x0, r7, 0x0}])
r8 =3D socket$nl_netfilter(0x10, 0x3, 0xc)
sendmsg$IPSET_CMD_CREATE(r8, &(0x7f0000000280)=3D{0x0, 0x0,=20
&(0x7f0000000000)=3D{&(0x7f00000001c0)=3DANY=3D[@ANYBLOB=3D"1400000002060=
109000000000000001ea9048a0d88fd"],=20
0x14}}, 0x0)
syz_open_dev$tty20(0xc, 0x4, 0x1)


