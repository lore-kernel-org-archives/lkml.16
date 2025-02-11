Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FC426BD84
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739238678; cv=none; b=JhbH+R1awla/Xfngb8uafaSvnNuWcL5VqlvvbFHL8JmqiqlbPNUDwHFPCbuKsKy9isOiAH9dFamNTo7H1VyYfczdCtIpnaTVJLwCAUye1nNv8NRsdgrt1+cwrYMWS/MyFAfBZEi+nEvpgYtYpXjy2aOWa9I0IBRto6k+4HyWx0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739238678; c=relaxed/simple;
	bh=j3JqG5ZaGLIhuq5osnMekIPQv/lGibacWk+KwDczXM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEz18bcCyN96q/qOZC4NcMXpSqx0ifBixui5H/Docjwbyy9CqfWPGnu0DzasNC2E9cGISIURJdrbPuxVHN16wmHw7JoQtY/uGRTvBL3R/wPXVxyqU9Yk9DsCTWgP95zTPDEorDu0WpNtJoMpzrmq2CPxMu+tHMup6i9qm4yCmP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=GhJcVBwZ; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="GhJcVBwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739238570;
	bh=3LPU7mfZfYOlwDSHzeNI5AAdPsLqvyta+axcHU72NoU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GhJcVBwZb5nwn+W26HgjaeGpy/69WDXKswBF8E5betld8mj76XjOc1AiW81Qah+oI
	 F8R7ZLJMVnl0EDkEWWfTnXv8cxbDUexqphCpCt65MHnH9ZcWpKm7Z0c8DMGLWiSACd
	 xIXFNotWVonDuceWWDkwS2AUST/JLjbWvyq1uuVg=
X-QQ-mid: bizesmtpip3t1739238558ts4qgy3
X-QQ-Originating-IP: O/MiIoy/XKSqsDdv44mG7pnePMHSUqn65T9pdvCqxcs=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Feb 2025 09:49:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1398223011583114035
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: chenhuacai@kernel.org,
	chenlinxuan@uniontech.com,
	guanwentao@uniontech.com,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	zhanjun@uniontech.com
Subject: Re: [PATCH] LoongArch: Enable Undefined Behavior Sanitizer UBSAN
Date: Tue, 11 Feb 2025 09:49:15 +0800
Message-ID: <2BFA4897BC57C689+20250211014915.1356669-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <10CEA19AD9D3FA2A+20250206063820.30558-1-wangyuli@uniontech.com>
References: <10CEA19AD9D3FA2A+20250206063820.30558-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NTA/F5hzAX/xYRMwQBhUvFckZGK7He3GDuN7qmqHjdi8kkPA3il1DVfs
	iJQAK0f9SFo6X8sFlw6KqN0z4XaZZjb+ycpv9QQRDS/Ss3bR+nh3Ew41qcBV4fX+3SVsklK
	vJ4Hfn/QkaBWOWibhdAdv+AoIgeY39S0LEAMK18QP4hC2M4FXHLadYrY7XWtGV2wGMVM0PT
	ZAkr4d9t2AXqu3B9OOsyfFlTWU0Hnpg5SItxM2gSDxga/OoFGAtA9voOJOXnpK8loNT9eH+
	aOIO+PivXz6O7Gup860AU9PnV87Zm3W/nsf/7HKWTU3hTlziSUyO/I5XYQ1fbRMehiWd9qJ
	gnwKfrhc7iOeU19F2Bljek1mRwx2quDAejepg26MGD8NC+pWQzky3R/ccj6M6vH5nXGngp/
	4EtRwky1U9oUM8TMSrpXVd4tVKxoSXG65ERquMXxCFDF+mE3XE8UHcRDaqQ1etB6AHkCl5q
	Pj1VpE9E4HssNoafUe90c1gZKd+sTxRmxcXay/7v/CqJny2L+aYU2fzA/K7MwFlaXf50/wn
	bVB9pIDcxb1XlQaPIUIg/IXvAblKXcO9OslUQLmSFrxxn3flmz/7lVI1XcKQ0muUFjlhx4u
	BaMo+Z8MPF6f43qVSxhlvvoCcF05K1B1woajK8W/Tq+yR+wLTA2SIEJu4a0KVEYvBzevsS9
	ndwGW2LLc7jco6LDm6OEpbAav94vmd7O9EpTBVjhCJvyuMynh2sE7YTMQHQhZB9zwg+Rtcb
	iwJnTKGrYv2UdcYZWyvnAMZdAmFxLNn4K0GKH/+abrvximbo453Y/4//sPEtjxv8m0ZcJR9
	zsjCyX5OzfNFnNDAJHoi+0i2/wcUgElVwHR2zdmaZ7X1EgDEDGK8XrwSZEZhgfkGmUOTSB3
	sa1KoImBpyIwItpc+E86V8bgTg0bptDx9VQpojV+cGa7bkHJ3QUwyRmu57yAW/yfdnyerEl
	qMSyo1lS+IDAmOwZafRUn3faQVZvdZ6d52Jk=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

Hi all,

Kernel logs with UBSAN on Loongson XA61200 (3A6000 CPU) below.
The complete log is pretty long, so I didn't paste it into the
commit message.

[    0.000000] Linux version 6.13.0-rc7+ (avenger@avenger-CostalHouse) (gcc (Debian 14.2.0-14) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.50.20250108) #2 SMP Sun Jan 19 15:42:14 CST 2025
[    0.000000] Loongson-64bit Processor probed (LA664 Core)
[    0.000000] ------------[ cut here ]------------
[    0.000000] UBSAN: misaligned-access in arch/loongarch/kernel/cpu-probe.c:276:11
[    0.000000] store to misaligned address (____ptrval____) for type 'uint64_t'
[    0.000000] which requires 8 byte alignment
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.13.0-rc7+ #2
[    0.000000] Stack : 0000000000000000 0000000000000000 900000000023aae8 900000000294c000
[    0.000000]         900000000294fb90 900000000294fb98 0000000000000000 0000000000000000
[    0.000000]         900000000294fb98 0000000000000000 900000000294fc68 9000000002805d80
[    0.000000]         9000000003f35ab0 0000000000000000 0000000000000000 fffffffffffffffe
[    0.000000]         0000000000000007 0000000000000000 0000000000000000 0000000000000000
[    0.000000]         000000000000001f ffffffffffffffff 0000000000000000 00000000fe44b938
[    0.000000]         0000000000000000 0000000000000000 9000000002805d80 900000000294fb98
[    0.000000]         900000000296c000 9000000003f04088 482d303030364133 00000000fe44b790
[    0.000000]         00000000f9e75670 0000000000000000 900000000023aba4 0000000000000000
[    0.000000]         00000000000000b0 0000000000000004 0000000000000000 0000000000070800
[    0.000000]         ...
[    0.000000] Call Trace:
[    0.000000] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.000000] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.000000] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.000000] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.000000] [<90000000002368b4>] cpu_probe+0x954/0xba0
[    0.000000] [<9000000002505130>] setup_arch+0x40/0x64c
[    0.000000] [<9000000002500b3c>] start_kernel+0x90/0xa30
[    0.000000] [<90000000024c90cc>] kernel_entry+0xcc/0xd0

[    0.000000] ---[ end trace ]---
[    0.000000] CPU0 revision is: 0014d000 (Loongson-64bit)
[    0.000000] FPU0 revision is: 00000000
[    0.000000] efi: EFI v2.7 by EDK II
[    0.000000] efi: ACPI 2.0=0xf9f30000 SMBIOS 3.0=0xfe220000 INITRD=0xf9e4e798 MEMRESERVE=0xf9e4e218 MEMMAP=0xf763e998 
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000F9F30000 000024 (v02 LOONGS)
[    0.000000] ACPI: XSDT 0x00000000F9F20000 000064 (v01 LOONGS LOONGSON 00000002      01000013)
[    0.000000] ------------[ cut here ]------------
[    0.000000] UBSAN: misaligned-access in drivers/acpi/acpica/tbutils.c:181:3
[    0.000000] load of misaligned address (____ptrval____) for type 'u64'
[    0.000000] which requires 8 byte alignment
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.13.0-rc7+ #2
[    0.000000] Stack : 0000000000000000 0000000000000000 900000000023aae8 900000000294c000
[    0.000000]         900000000294fa70 900000000294fa78 0000000000000000 0000000000000000
[    0.000000]         900000000294fa78 0000000000000000 900000000294fb48 9000000002805d80
[    0.000000]         9000000003f35ab0 0000000000000000 0000000000000000 fffffffffffffffe
[    0.000000]         0000000000000029 0000000000000000 0000000000000000 0000000000000000
[    0.000000]         000000000000001f ffffffffffffffff 0000000000000000 900000000294fc84
[    0.000000]         0000000000000000 0000000000000000 9000000002805d80 900000000294fa78
[    0.000000]         900000000296c000 0000000000000000 900000000294fd70 00000000fe44b790
[    0.000000]         9000000003fc5000 0000000000000000 900000000023aba4 0000000000000000
[    0.000000]         00000000000000b0 0000000000000004 0000000000000000 0000000000070800
[    0.000000]         ...
[    0.000000] Call Trace:
[    0.000000] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.000000] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.000000] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.000000] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.000000] [<90000000025503cc>] acpi_tb_parse_root_table+0x284/0x378
[    0.000000] [<900000000254c23c>] acpi_locate_initial_tables+0x80/0xa0
[    0.000000] [<900000000254c54c>] acpi_table_init+0x18/0x38
[    0.000000] [<9000000002506610>] acpi_boot_table_init+0x48/0x1f4
[    0.000000] [<9000000002505030>] platform_init+0x1c0/0x280
[    0.000000] [<90000000025052d0>] setup_arch+0x1e0/0x64c
[    0.000000] [<9000000002500b3c>] start_kernel+0x90/0xa30
[    0.000000] [<90000000024c90cc>] kernel_entry+0xcc/0xd0

[    0.000000] ---[ end trace ]---
[    0.000000] ACPI: FACP 0x00000000F9EF0000 0000F4 (v03 LOONGS LOONGSON 00000002 LIUX 01000013)
[    0.000000] ACPI: DSDT 0x00000000F9EC0000 0026D0 (v02 LOONGS LOONGSON 00000002 INTL 20180629)
[    0.000000] ACPI: FACS 0x00000000F9F00000 000040
[    0.000000] ACPI: APIC 0x00000000F9F10000 0000FA (v06 LOONGS LOONGSON 00000002 LIUX 01000013)
[    0.000000] ACPI: IVRS 0x00000000F9EE0000 00004C (v01 LARCH  LOONGSON 00000001 LIUX 00000001)
[    0.000000] ACPI: MCFG 0x00000000F9ED0000 00003C (v01 LOONGS LOONGSON 00000001 LIUX 01000013)
[    0.000000] ACPI: SRAT 0x00000000F9EB0000 000100 (v02 LOONGS LOONGSON 00000002 LIUX 01000013)
[    0.000000] ACPI: SLIT 0x00000000F9EA0000 00002D (v01 LOONGS LOONGSON 00000002 LIUX 01000013)
[    0.000000] ACPI: VIAT 0x00000000F9E90000 00002C (v01 LOONGS LOONGSON 00000002 LIUX 01000013)
[    0.000000] ACPI: PPTT 0x00000000F9E80000 000128 (v03 LOONGS LOONGSON 00000002 LIUX 01000013)
[    0.000000] SRAT: PXM 0 -> CPU 0x00 -> Node 0
[    0.000000] SRAT: PXM 0 -> CPU 0x01 -> Node 0
[    0.000000] SRAT: PXM 0 -> CPU 0x02 -> Node 0
[    0.000000] SRAT: PXM 0 -> CPU 0x03 -> Node 0
[    0.000000] SRAT: PXM 0 -> CPU 0x04 -> Node 0
[    0.000000] SRAT: PXM 0 -> CPU 0x05 -> Node 0
[    0.000000] SRAT: PXM 0 -> CPU 0x06 -> Node 0
[    0.000000] SRAT: PXM 0 -> CPU 0x07 -> Node 0
[    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x00000000-0x0fffffff]
[    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x90000000-0x87fffffff]
[    0.000000] Node0: mem_type:2, mem_start:0x200000, mem_size:0x3de0000 Bytes
[    0.000000]        start_pfn:0x80, end_pfn:0xff8, num_physpages:0xf78
[    0.000000] Node0: mem_type:7, mem_start:0x3fe0000, mem_size:0xae20000 Bytes
[    0.000000]        start_pfn:0xff8, end_pfn:0x3b80, num_physpages:0x3b00
[    0.000000] Resvd: mem_type:6, mem_start:0x10000000, mem_size:0x10000000 Bytes
[    0.000000] Node0: mem_type:7, mem_start:0x90400000, mem_size:0x2fcc0000 Bytes
[    0.000000]        start_pfn:0x24100, end_pfn:0x30030, num_physpages:0xfa30
[    0.000000] Node0: mem_type:4, mem_start:0xc00c0000, mem_size:0x580000 Bytes
[    0.000000]        start_pfn:0x30030, end_pfn:0x30190, num_physpages:0xfb90
[    0.000000] Node0: mem_type:7, mem_start:0xc0640000, mem_size:0x2c270000 Bytes
[    0.000000]        start_pfn:0x30190, end_pfn:0x3b22c, num_physpages:0x1ac2c
[    0.000000] Node0: mem_type:2, mem_start:0xec8b0000, mem_size:0xad80000 Bytes
[    0.000000]        start_pfn:0x3b22c, end_pfn:0x3dd8c, num_physpages:0x1d78c
[    0.000000] Node0: mem_type:9, mem_start:0xf7630000, mem_size:0x10000 Bytes
[    0.000000]        start_pfn:0x3dd8c, end_pfn:0x3dd90, num_physpages:0x1d790
[    0.000000] Resvd: mem_type:9, mem_start:0xf7630000, mem_size:0x10000 Bytes
[    0.000000] Node0: mem_type:7, mem_start:0xf7640000, mem_size:0x8000 Bytes
[    0.000000]        start_pfn:0x3dd90, end_pfn:0x3dd92, num_physpages:0x1d792
[    0.000000] Node0: mem_type:1, mem_start:0xf7648000, mem_size:0x1423000 Bytes
[    0.000000]        start_pfn:0x3dd92, end_pfn:0x3e29a, num_physpages:0x1dc9a
[    0.000000] Node0: mem_type:2, mem_start:0xf8a6b000, mem_size:0x13e4000 Bytes
[    0.000000]        start_pfn:0x3e29a, end_pfn:0x3e793, num_physpages:0x1e193
[    0.000000] Node0: mem_type:7, mem_start:0xf9e4f000, mem_size:0x4000 Bytes
[    0.000000]        start_pfn:0x3e793, end_pfn:0x3e794, num_physpages:0x1e194
[    0.000000] Node0: mem_type:2, mem_start:0xf9e53000, mem_size:0x2000 Bytes
[    0.000000]        start_pfn:0x3e794, end_pfn:0x3e795, num_physpages:0x1e194
[    0.000000] Node0: mem_type:1, mem_start:0xf9e55000, mem_size:0x2b000 Bytes
[    0.000000]        start_pfn:0x3e795, end_pfn:0x3e7a0, num_physpages:0x1e19e
[    0.000000] Node0: mem_type:9, mem_start:0xf9e80000, mem_size:0x80000 Bytes
[    0.000000]        start_pfn:0x3e7a0, end_pfn:0x3e7c0, num_physpages:0x1e1be
[    0.000000] Resvd: mem_type:9, mem_start:0xf9e80000, mem_size:0x80000 Bytes
[    0.000000] Node0: mem_type:9, mem_start:0xf9f10000, mem_size:0x30000 Bytes
[    0.000000]        start_pfn:0x3e7c4, end_pfn:0x3e7d0, num_physpages:0x1e1ca
[    0.000000] Resvd: mem_type:9, mem_start:0xf9f10000, mem_size:0x30000 Bytes
[    0.000000] Node0: mem_type:7, mem_start:0xf9f40000, mem_size:0xed3000 Bytes
[    0.000000]        start_pfn:0x3e7d0, end_pfn:0x3eb84, num_physpages:0x1e57e
[    0.000000] Node0: mem_type:4, mem_start:0xfae13000, mem_size:0x212d000 Bytes
[    0.000000]        start_pfn:0x3eb84, end_pfn:0x3f3d0, num_physpages:0x1edc9
[    0.000000] Node0: mem_type:7, mem_start:0xfcf40000, mem_size:0x721000 Bytes
[    0.000000]        start_pfn:0x3f3d0, end_pfn:0x3f598, num_physpages:0x1ef91
[    0.000000] Node0: mem_type:3, mem_start:0xfd661000, mem_size:0x7df000 Bytes
[    0.000000]        start_pfn:0x3f598, end_pfn:0x3f790, num_physpages:0x1f188
[    0.000000] Resvd: mem_type:5, mem_start:0xfde40000, mem_size:0x1c0000 Bytes
[    0.000000] Resvd: mem_type:6, mem_start:0xfe000000, mem_size:0x400000 Bytes
[    0.000000] Node0: mem_type:7, mem_start:0xfe400000, mem_size:0x2b000 Bytes
[    0.000000]        start_pfn:0x3f900, end_pfn:0x3f90a, num_physpages:0x1f192
[    0.000000] Node0: mem_type:4, mem_start:0xfe42b000, mem_size:0x21000 Bytes
[    0.000000]        start_pfn:0x3f90a, end_pfn:0x3f913, num_physpages:0x1f19a
[    0.000000] Node0: mem_type:3, mem_start:0xfe44c000, mem_size:0x20000 Bytes
[    0.000000]        start_pfn:0x3f913, end_pfn:0x3f91b, num_physpages:0x1f1a2
[    0.000000] Node0: mem_type:4, mem_start:0xfe46c000, mem_size:0xb81000 Bytes
[    0.000000]        start_pfn:0x3f91b, end_pfn:0x3fbfb, num_physpages:0x1f482
[    0.000000] Node0: mem_type:3, mem_start:0xfefed000, mem_size:0x11000 Bytes
[    0.000000]        start_pfn:0x3fbfb, end_pfn:0x3fbff, num_physpages:0x1f486
[    0.000000] Node0: mem_type:4, mem_start:0xfeffe000, mem_size:0x2000 Bytes
[    0.000000]        start_pfn:0x3fbff, end_pfn:0x3fc00, num_physpages:0x1f486
[    0.000000] Node0: mem_type:7, mem_start:0xff000000, mem_size:0x77db00000 Bytes
[    0.000000]        start_pfn:0x3fc00, end_pfn:0x21f2c0, num_physpages:0x1feb46
[    0.000000] Node0: mem_type:1, mem_start:0x87cb00000, mem_size:0x3500000 Bytes
[    0.000000]        start_pfn:0x21f2c0, end_pfn:0x220000, num_physpages:0x1ff886
[    0.000000] Resvd: mem_type:0, mem_start:0xee00000, mem_size:0x1200000 Bytes
[    0.000000] Resvd: mem_type:0, mem_start:0x90000000, mem_size:0x400000 Bytes
[    0.000000] Node0's addrspace_offset is 0x0
[    0.000000] Node0: start_pfn=0x80, end_pfn=0x220000
[    0.000000] NODE_DATA(0) allocated [mem 0x87fffb980-0x87ffffcbf]
[    0.000000] ------------[ cut here ]------------
[    0.000000] UBSAN: misaligned-access in drivers/firmware/dmi_scan.c:421:23
[    0.000000] load of misaligned address (____ptrval____) for type 'u16'
[    0.000000] which requires 2 byte alignment
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.13.0-rc7+ #2
[    0.000000] Stack : 0000000000000000 0000000000000000 900000000023aae8 900000000294c000
[    0.000000]         900000000294fa00 900000000294fa08 0000000000000000 0000000000000000
[    0.000000]         900000000294fa08 0000000000000000 900000000294fad8 9000000002805d80
[    0.000000]         9000000003f35ab0 0000000000000000 0000000000000000 fffffffffffffffe
[    0.000000]         000000000000009d 0000000000000000 0000000000000000 0000000000000000
[    0.000000]         000000000000001f ffffffffffffffff 0000000000000000 00000000fe44b938
[    0.000000]         0000000000000000 0000000000000000 9000000002805d80 900000000294fa08
[    0.000000]         900000000296c000 0000000000000008 90000000fe210320 9000000003fcae00
[    0.000000]         0000000000000003 0000000000000000 900000000023aba4 0000000000000000
[    0.000000]         00000000000000b0 0000000000000004 0000000000000000 0000000000070800
[    0.000000]         ...
[    0.000000] Call Trace:
[    0.000000] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.000000] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.000000] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.000000] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.000000] [<900000000255dedc>] dmi_decode+0x33c/0x68c
[    0.000000] [<9000000001b61d4c>] dmi_decode_table+0x10c/0x150
[    0.000000] [<900000000255e270>] dmi_walk_early.isra.0+0x44/0x60
[    0.000000] [<900000000255e3d8>] dmi_smbios3_present+0x14c/0x1a0
[    0.000000] [<900000000255e788>] dmi_setup+0x88/0x260
[    0.000000] [<9000000002505040>] platform_init+0x1d0/0x280
[    0.000000] [<90000000025052d0>] setup_arch+0x1e0/0x64c
[    0.000000] [<9000000002500b3c>] start_kernel+0x90/0xa30
[    0.000000] [<90000000024c90cc>] kernel_entry+0xcc/0xd0

[    0.000000] ---[ end trace ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] UBSAN: misaligned-access in drivers/firmware/dmi_scan.c:421:42
[    0.000000] load of misaligned address (____ptrval____) for type 'u16'
[    0.000000] which requires 2 byte alignment
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.13.0-rc7+ #2
[    0.000000] Stack : 0000000000000000 0000000000000000 900000000023aae8 900000000294c000
[    0.000000]         900000000294fa00 900000000294fa08 0000000000000000 0000000000000000
[    0.000000]         900000000294fa08 0000000000000000 900000000294fad8 9000000002805d80
[    0.000000]         9000000003f35ab0 0000000000000000 0000000000000000 fffffffffffffffe
[    0.000000]         00000000000000bd 0000000000000000 0000000000000000 0000000000000000
[    0.000000]         000000000000001f ffffffffffffffff 0000000000000000 00000000fe44b938
[    0.000000]         0000000000000000 0000000000000000 9000000002805d80 900000000294fa08
[    0.000000]         900000000296c000 0000000000000008 90000000fe210320 9000000003fcae00
[    0.000000]         0000000000000003 0000000000000000 900000000023aba4 0000000000000000
[    0.000000]         00000000000000b0 0000000000000004 0000000000000000 0000000000070800
[    0.000000]         ...
[    0.000000] Call Trace:
[    0.000000] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.000000] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.000000] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.000000] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.000000] [<900000000255defc>] dmi_decode+0x35c/0x68c
[    0.000000] [<9000000001b61d4c>] dmi_decode_table+0x10c/0x150
[    0.000000] [<900000000255e270>] dmi_walk_early.isra.0+0x44/0x60
[    0.000000] [<900000000255e3d8>] dmi_smbios3_present+0x14c/0x1a0
[    0.000000] [<900000000255e788>] dmi_setup+0x88/0x260
[    0.000000] [<9000000002505040>] platform_init+0x1d0/0x280
[    0.000000] [<90000000025052d0>] setup_arch+0x1e0/0x64c
[    0.000000] [<9000000002500b3c>] start_kernel+0x90/0xa30
[    0.000000] [<90000000024c90cc>] kernel_entry+0xcc/0xd0

[    0.000000] ---[ end trace ]---
[    0.000000] SMBIOS 3.2.0 present.
[    0.000000] DMI: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.000000] DMI: Memory slots populated: 2/2
[    0.000000] CpuClock = 2500000000
[    0.000000] The BIOS Version: Loongson-UDK2018-V4.0.05692-stable202402
[    0.000000] software IO TLB: area num 8.
[    0.000000] software IO TLB: mapped [mem 0x0000000003fe0000-0x0000000007fe0000] (64MB)
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x02950000-0x02953fff]
[    0.000000] Detected 8 available CPU(s)
[    0.000000] SMP: Allowing 8 CPUs, 0 hotplug CPUs
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000000200000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000087fffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000200000-0x000000000edfffff]
[    0.000000]   node   0: [mem 0x0000000090400000-0x00000000f9efffff]
[    0.000000]   node   0: [mem 0x00000000f9f10000-0x00000000fde3ffff]
[    0.000000]   node   0: [mem 0x00000000fe400000-0x000000087fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000200000-0x000000087fffffff]
[    0.000000] On node 0, zone DMA32: 128 pages in unavailable ranges
[    0.000000] On node 0, zone DMA32: 34176 pages in unavailable ranges
[    0.000000] On node 0, zone DMA32: 4 pages in unavailable ranges
[    0.000000] On node 0, zone DMA32: 368 pages in unavailable ranges
[    0.000000] percpu: Embedded 8 pages/cpu s87640 r8192 d35240 u4194304
[    0.000000] pcpu-alloc: s87640 r8192 d35240 u4194304 alloc=1*33554432
[    0.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc7+ root=UUID=d149b841-069b-402d-b6f0-db175be33e3d ro loglevel=7 verbose log_buf_len=4M resume=UUID=be645d72-53a2-4764-aba3-6a9b47fd1c31
[    0.000000] Unknown kernel command line parameters "verbose BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc7+", will be passed to user space.
[    0.000000] printk: log buffer data + meta data: 4194304 + 14680064 = 18874368 bytes
[    0.000000] printk: early log buf free: 114488(87%)
[    0.000000] Dentry cache hash table entries: 4194304 (order: 11, 33554432 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2097152 (order: 10, 16777216 bytes, linear)
[    0.000000] Fallback order for Node 0: 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 2095244
[    0.000000] Policy zone: Normal
[    0.000000] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.000000] ------------[ cut here ]------------
[    0.000000] UBSAN: misaligned-access in mm/percpu.c:1824:3
[    0.000000] member access within misaligned address (____ptrval____) for type 'struct pcpu_chunk'
[    0.000000] which requires 64 byte alignment
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.13.0-rc7+ #2
[    0.000000] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.000000] Stack : 0000000000000000 0000000000000000 900000000023aae8 900000000294c000
[    0.000000]         900000000294f9c0 900000000294f9c8 0000000000000000 0000000000000000
[    0.000000]         900000000294f9c8 0000000000000000 900000000294fa98 9000000002805d80
[    0.000000]         9000000003f35ab0 0000000000000000 0000000000000000 fffffffffffffffe
[    0.000000]         0000000000000104 0000000000000000 0000000000000000 0000000000000000
[    0.000000]         000000000000001f 9000000003f3aa60 0000000007a08000 0000000000000030
[    0.000000]         0000000000000000 0000000000000000 9000000002805d80 900000000294f9c8
[    0.000000]         900000000296c000 0000000000000030 0000000000000003 9000000003f69418
[    0.000000]         90000000080a0470 0000000000000000 900000000023aba4 0000000000000000
[    0.000000]         00000000000000b0 0000000000000004 0000000000000000 0000000000070800
[    0.000000]         ...
[    0.000000] Call Trace:
[    0.000000] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.000000] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.000000] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.000000] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.000000] [<9000000000a765b4>] pcpu_alloc_noprof+0xdf4/0x1078
[    0.000000] [<9000000000b9b330>] do_kmem_cache_create+0x4c0/0x1648
[    0.000000] [<900000000252b654>] create_boot_cache+0x114/0x190
[    0.000000] [<900000000252f100>] kmem_cache_init+0xdc/0x220
[    0.000000] [<90000000025280cc>] mm_core_init+0x1c8/0x21c
[    0.000000] [<900000000250106c>] start_kernel+0x5c0/0xa30
[    0.000000] [<90000000024c90cc>] kernel_entry+0xcc/0xd0

[    0.000000] ---[ end trace ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] UBSAN: misaligned-access in mm/percpu.c:1824:3
[    0.000000] member access within misaligned address (____ptrval____) for type 'struct pcpu_chunk'
[    0.000000] which requires 64 byte alignment
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.13.0-rc7+ #2
[    0.000000] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.000000] Stack : 0000000000000000 0000000000000000 900000000023aae8 900000000294c000
[    0.000000]         900000000294f9c0 900000000294f9c8 0000000000000000 0000000000000000
[    0.000000]         900000000294f9c8 0000000000000000 900000000294fa98 9000000002805d80
[    0.000000]         9000000003f35ab0 0000000000000000 0000000000000000 fffffffffffffffe
[    0.000000]         0000000000000123 0000000000000000 0000000000000000 0000000000000000
[    0.000000]         000000000000001f 9000000003f3aa60 0000000007a08000 0000000000000030
[    0.000000]         0000000000000000 0000000000000000 9000000002805d80 900000000294f9c8
[    0.000000]         900000000296c000 0000000000000030 0000000000000003 9000000003f69418
[    0.000000]         90000000080a0470 0000000000000000 900000000023aba4 0000000000000000
[    0.000000]         00000000000000b0 0000000000000004 0000000000000000 0000000000070800
[    0.000000]         ...
[    0.000000] Call Trace:
[    0.000000] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.000000] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.000000] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.000000] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.000000] [<9000000000a76584>] pcpu_alloc_noprof+0xdc4/0x1078
[    0.000000] [<9000000000b9b330>] do_kmem_cache_create+0x4c0/0x1648
[    0.000000] [<900000000252b654>] create_boot_cache+0x114/0x190
[    0.000000] [<900000000252f100>] kmem_cache_init+0xdc/0x220
[    0.000000] [<90000000025280cc>] mm_core_init+0x1c8/0x21c
[    0.000000] [<900000000250106c>] start_kernel+0x5c0/0xa30
[    0.000000] [<90000000024c90cc>] kernel_entry+0xcc/0xd0

[    0.000000] ---[ end trace ]---
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.000000] ftrace: allocating 37562 entries in 37 pages
[    0.000000] ftrace: allocated 37 pages with 3 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=8.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.000000] RCU Tasks Rude: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
[    0.000000] RCU Tasks Trace: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
[    0.000000] NR_IRQS: 16960, nr_irqs: 320, preallocated irqs: 16
[    0.000000] ------------[ cut here ]------------
[    0.000000] UBSAN: misaligned-access in lib/vsprintf.c:1846:7
[    0.000000] load of misaligned address (____ptrval____) for type 'const phys_addr_t'
[    0.000000] which requires 8 byte alignment
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.000000] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.000000] Stack : 0000000000000000 0000000000000000 900000000023aae8 900000000294c000
[    0.000000]         900000000294f640 900000000294f648 0000000000000000 0000000000000000
[    0.000000]         900000000294f648 0000000000000000 900000000294f718 9000000002805d80
[    0.000000]         9000000003f35ab0 0000000000000000 0000000000000000 fffffffffffffffe
[    0.000000]         000000000000014e 0000000000000000 0000000000000000 0000000000000000
[    0.000000]         000000000000001f 9000000003f3aa60 0000000007a08000 0000000000000005
[    0.000000]         0000000000000000 0000000000000000 9000000002805d80 900000000294f648
[    0.000000]         900000000296c000 0000000000000000 900000000294f8b0 900000000294f970
[    0.000000]         90000000027ae592 0000000000000000 900000000023aba4 0000000000000000
[    0.000000]         00000000000000b0 0000000000000004 0000000000000000 0000000000070000
[    0.000000]         ...
[    0.000000] Call Trace:
[    0.000000] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.000000] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.000000] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.000000] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.000000] [<90000000024add18>] address_val+0x1b0/0x1b8
[    0.000000] [<90000000024b31fc>] vsnprintf+0x1c4/0x538
[    0.000000] [<90000000013bf700>] kvasprintf+0x40/0xe0
[    0.000000] [<90000000013bf8b0>] kasprintf+0x40/0x70
[    0.000000] [<90000000004c9bf4>] __irq_domain_alloc_fwnode+0xf4/0x130
[    0.000000] [<90000000025483e8>] liointc_acpi_init+0xc4/0x1a8
[    0.000000] [<90000000025477e8>] acpi_parse_entries_array+0x26c/0x420
[    0.000000] [<900000000254baac>] acpi_table_parse_entries_array+0xe4/0x130
[    0.000000] [<900000000254bb70>] acpi_table_parse_entries+0x78/0xac
[    0.000000] [<9000000002547be4>] cpuintc_acpi_init+0x118/0x19c
[    0.000000] [<900000000254dfd8>] acpi_match_madt+0x90/0xf4
[    0.000000] [<90000000025477e8>] acpi_parse_entries_array+0x26c/0x420
[    0.000000] [<900000000254baac>] acpi_table_parse_entries_array+0xe4/0x130
[    0.000000] [<900000000254bb70>] acpi_table_parse_entries+0x78/0xac
[    0.000000] [<900000000254e4f4>] __acpi_probe_device_table+0xdc/0x16c
[    0.000000] [<9000000002505a94>] init_IRQ+0x8c/0x2bc
[    0.000000] [<9000000002501140>] start_kernel+0x694/0xa30
[    0.000000] [<90000000024c90cc>] kernel_entry+0xcc/0xd0

[    0.000000] ---[ end trace ]---
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] Constant clock event device register
[    0.000000] clocksource: Constant: mask: 0xffffffffffffffff max_cycles: 0x171024e7e0, max_idle_ns: 440795205315 ns
[    0.000000] sched_clock: 64 bits at 100MHz, resolution 10ns, wraps every 4398046511100ns
[    0.000002] Constant clock source device register
[    0.000169] Console: colour dummy device 80x25
[    0.000175] printk: legacy console [tty0] enabled
[    0.004275] ACPI: Core revision 20240827
[    0.004801] ------------[ cut here ]------------
[    0.004808] UBSAN: misaligned-access in drivers/acpi/acpica/nsaccess.c:584:3
[    0.004815] load of misaligned address (____ptrval____) for type 'u32'
[    0.004822] which requires 4 byte alignment
[    0.004828] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.004836] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.004847] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000000294c000
[    0.004862]         900000000294fa20 900000000294fa28 0000000000000000 0000000000000000
[    0.004876]         900000000294fa28 0000000000000000 900000000294faf8 9000000002805d80
[    0.004890]         9000000003f35ab0 747e13a118945c77 747e13a118945c77 fffffffffffffffe
[    0.004904]         0000000000000180 0000000000000000 0000000000000000 0000000000000000
[    0.004918]         0000000000000032 0000000000000006 0000000007a08000 900000010002e3f9
[    0.004932]         0000000000000000 0000000000000000 9000000002805d80 900000000294fa28
[    0.004946]         900000000296c000 900000000294fc60 9000000003fc50a0 0000000000000002
[    0.004960]         0000000000000015 0000000000000000 900000000023aba4 0000000000000000
[    0.004974]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.004988]         ...
[    0.004995] Call Trace:
[    0.004996] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.005010] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.005020] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.005029] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.005039] [<90000000017d07ac>] acpi_ns_lookup+0x6a4/0x918
[    0.005049] [<90000000017dcdac>] acpi_ns_get_node_unlocked+0x104/0x200
[    0.005058] [<90000000017dcf00>] acpi_ns_get_node+0x58/0x98
[    0.005067] [<90000000017cfb04>] acpi_ns_root_initialize+0x64/0x668
[    0.005076] [<9000000002550b80>] acpi_initialize_subsystem+0xa8/0x10c
[    0.005085] [<900000000254d870>] acpi_early_init+0x74/0xac
[    0.005095] [<9000000002501464>] start_kernel+0x9b8/0xa30
[    0.005104] [<90000000024c90cc>] kernel_entry+0xcc/0xd0

[    0.005119] ---[ end trace ]---
[    0.005131] Calibrating delay loop (skipped), value calculated using timer frequency.. 200.00 BogoMIPS (lpj=400000)
[    0.005146] pid_max: default: 32768 minimum: 301
[    0.006721] LSM: initializing lsm=lockdown,capability,landlock,yama,apparmor,tomoyo,bpf,ipe,ima,evm
[    0.007608] landlock: Up and running.
[    0.007611] Yama: becoming mindful.
[    0.007678] AppArmor: AppArmor initialized
[    0.007695] TOMOYO Linux initialized
[    0.007812] LSM support for eBPF active
[    0.008111] ------------[ cut here ]------------
[    0.008114] UBSAN: misaligned-access in net/core/net_namespace.c:1266:3
[    0.008118] member access within misaligned address (____ptrval____) for type 'struct net'
[    0.008122] which requires 64 byte alignment
[    0.008125] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.008129] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.008134] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000000294c000
[    0.008142]         900000000294fb40 900000000294fb48 0000000000000000 900000000294fc88
[    0.008150]         900000000294fc80 900000000294fc80 9000000100045ef8 072007200720075b
[    0.008157]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.008165]         00000000000001a8 0000000000000000 0000000000000000 0000000000000000
[    0.008172]         0755072d076e076f 0000000000000006 0000000007a08000 9000000003fccbe8
[    0.008180]         0000000000000000 0000000000000000 9000000002805d80 900000000294fb48
[    0.008187]         900000000296c000 0000000000000000 9000000003a0dac0 9000000003a0e040
[    0.008194]         900000000296c000 0000000000000000 900000000023aba4 0000000000000000
[    0.008202]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.008209]         ...
[    0.008213] Call Trace:
[    0.008214] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.008220] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.008225] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.008229] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.008235] [<9000000001c21838>] register_pernet_operations+0x320/0x5e0
[    0.008240] [<9000000001c21b38>] register_pernet_subsys+0x40/0x68
[    0.008245] [<90000000025685a4>] net_ns_init+0x1ac/0x1f8
[    0.008249] [<90000000025014a4>] start_kernel+0x9f8/0xa30
[    0.008254] [<90000000024c90cc>] kernel_entry+0xcc/0xd0

[    0.008261] ---[ end trace ]---
[    0.008266] ------------[ cut here ]------------
[    0.008268] UBSAN: misaligned-access in net/core/dev.c:10911:2
[    0.008272] member access within misaligned address (____ptrval____) for type 'struct net_device'
[    0.008276] which requires 64 byte alignment
[    0.008278] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.008282] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.008286] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000000294c000
[    0.008294]         900000000294fac0 900000000294fac8 0000000000000000 900000000294fc08
[    0.008302]         900000000294fc00 900000000294fc00 9000000100045ef8 0730073007300730
[    0.008309]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.008317]         00000000000001c5 0000000000000000 0000000000000000 0000000000000000
[    0.008324]         0755072d076e076f 0000000000000006 0000000007a08000 0000000000000000
[    0.008332]         0000000000000000 0000000000000000 9000000002805d80 900000000294fac8
[    0.008339]         900000000296c000 9000000100025a40 900000000294fd28 0000000000000000
[    0.008347]         90000000025ea8c8 0000000000000000 900000000023aba4 0000000000000000
[    0.008354]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.008362]         ...
[    0.008365] Call Trace:
[    0.008366] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.008371] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.008376] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.008381] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.008385] [<9000000001c77db0>] netdev_run_todo+0xe68/0x1000
[    0.008392] [<9000000001ca9e28>] __rtnl_register_many+0x1d8/0x678
[    0.008396] [<90000000025014a4>] start_kernel+0x9f8/0xa30
[    0.008401] [<90000000024c90cc>] kernel_entry+0xcc/0xd0

[    0.008407] ---[ end trace ]---
[    0.008409] ------------[ cut here ]------------
[    0.008412] UBSAN: misaligned-access in net/core/dev.c:10911:2
[    0.008415] member access within misaligned address (____ptrval____) for type 'struct net_device'
[    0.008419] which requires 64 byte alignment
[    0.008421] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.008425] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.008429] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000000294c000
[    0.008437]         900000000294fac0 900000000294fac8 0000000000000000 900000000294fc08
[    0.008444]         900000000294fc00 900000000294fc00 9000000100045ef8 072007200720075b
[    0.008452]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.008459]         00000000000001e1 0000000000000000 0000000000000000 0000000000000000
[    0.008467]         0755072d076e076f 0000000000000006 0000000007a08000 0000000000000000
[    0.008474]         0000000000000000 0000000000000000 9000000002805d80 900000000294fac8
[    0.008482]         900000000296c000 9000000100025a40 900000000294fd28 0000000000000000
[    0.008489]         90000000025ea8c8 0000000000000000 900000000023aba4 0000000000000000
[    0.008497]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.008504]         ...
[    0.008508] Call Trace:
[    0.008509] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.008513] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.008519] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.008523] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.008528] [<9000000001c77e90>] netdev_run_todo+0xf48/0x1000
[    0.008533] [<9000000001ca9e28>] __rtnl_register_many+0x1d8/0x678
[    0.008537] [<90000000025014a4>] start_kernel+0x9f8/0xa30
[    0.008541] [<90000000024c90cc>] kernel_entry+0xcc/0xd0

[    0.008547] ---[ end trace ]---
[    0.009059] Mount-cache hash table entries: 65536 (order: 5, 524288 bytes, linear)
[    0.009094] Mountpoint-cache hash table entries: 65536 (order: 5, 524288 bytes, linear)
[    0.011280] ------------[ cut here ]------------
[    0.011285] UBSAN: misaligned-access in kernel/sched/fair.c:9797:2
[    0.011289] member access within misaligned address (____ptrval____) for type 'struct cfs_rq'
[    0.011293] which requires 64 byte alignment
[    0.011297] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.011301] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.011305] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.011313]         900000010025f670 900000010025f678 0000000000000000 900000010025f7b8
[    0.011321]         900000010025f7b0 900000010025f7b0 9000000100045ef8 072007200720075b
[    0.011329]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.011336]         00000000000001ff 0000000000000000 0000000000000000 0000000000000000
[    0.011343]         0755072d076e076f 0000000000000006 0000000007a08000 0000000000000000
[    0.011351]         0000000000000000 0000000000000000 9000000002805d80 900000010025f678
[    0.011358]         900000000296c000 900000000a014958 0000000000000000 900000000a014208
[    0.011366]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    0.011373]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.011380]         ...
[    0.011384] Call Trace:
[    0.011385] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.011391] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.011396] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.011400] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.011405] [<90000000003c8bbc>] sched_balance_update_blocked_averages+0xdd4/0x21f8
[    0.011410] [<90000000003f4020>] sched_balance_newidle+0x1c0/0xc68
[    0.011415] [<90000000003f4b9c>] pick_next_task_fair+0x64/0x950
[    0.011419] [<90000000024ce660>] __schedule+0x260/0x30d8
[    0.011424] [<90000000024d1530>] schedule+0x58/0x450
[    0.011429] [<90000000024ef744>] schedule_hrtimeout_range_clock+0x134/0x270
[    0.011434] [<900000000039aa10>] wait_task_inactive+0x2f8/0xa28
[    0.011440] [<900000000036bcf8>] kthread_bind_mask+0x38/0x268
[    0.011444] [<900000000033dcd0>] init_rescuer+0x1a8/0x370
[    0.011447] [<900000000250b920>] workqueue_init+0x390/0x6cc
[    0.011451] [<9000000002501a18>] kernel_init_freeable+0x4c8/0x730
[    0.011456] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.011461] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.011468] ---[ end trace ]---
[    0.011471] ------------[ cut here ]------------
[    0.011473] UBSAN: misaligned-access in kernel/sched/fair.c:9797:2
[    0.011476] member access within misaligned address (____ptrval____) for type 'struct cfs_rq'
[    0.011480] which requires 64 byte alignment
[    0.011482] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.011486] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.011490] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.011498]         900000010025f670 900000010025f678 0000000000000000 900000010025f7b8
[    0.011505]         900000010025f7b0 900000010025f7b0 9000000100045ef8 072007200720075b
[    0.011513]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.011520]         0000000000000224 0000000000000000 0000000000000000 0000000000000000
[    0.011528]         0755072d076e076f 0000000000000006 0000000007a08000 0000000000000000
[    0.011535]         0000000000000000 0000000000000000 9000000002805d80 900000010025f678
[    0.011542]         900000000296c000 900000000a014958 0000000000000000 900000000a014208
[    0.011550]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    0.011557]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.011564]         ...
[    0.011568] Call Trace:
[    0.011569] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.011574] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.011578] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.011583] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.011588] [<90000000003c8b2c>] sched_balance_update_blocked_averages+0xd44/0x21f8
[    0.011592] [<90000000003f4020>] sched_balance_newidle+0x1c0/0xc68
[    0.011596] [<90000000003f4b9c>] pick_next_task_fair+0x64/0x950
[    0.011600] [<90000000024ce660>] __schedule+0x260/0x30d8
[    0.011605] [<90000000024d1530>] schedule+0x58/0x450
[    0.011610] [<90000000024ef744>] schedule_hrtimeout_range_clock+0x134/0x270
[    0.011614] [<900000000039aa10>] wait_task_inactive+0x2f8/0xa28
[    0.011618] [<900000000036bcf8>] kthread_bind_mask+0x38/0x268
[    0.011622] [<900000000033dcd0>] init_rescuer+0x1a8/0x370
[    0.011626] [<900000000250b920>] workqueue_init+0x390/0x6cc
[    0.011629] [<9000000002501a18>] kernel_init_freeable+0x4c8/0x730
[    0.011634] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.011638] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.011645] ---[ end trace ]---
[    0.019998] ------------[ cut here ]------------
[    0.020002] UBSAN: misaligned-access in kernel/workqueue.c:7907:2
[    0.020005] member access within misaligned address (____ptrval____) for type 'struct workqueue_struct'
[    0.020009] which requires 64 byte alignment
[    0.020013] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.020016] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.020021] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.020029]         900000010025fbc0 900000010025fbc8 0000000000000000 900000010025fd08
[    0.020036]         900000010025fd00 900000010025fd00 9000000100045ef8 072007200720075b
[    0.020044]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.020051]         0000000000000249 0000000000000000 0000000000000000 0000000000000000
[    0.020059]         0755072d076e076f 0000000000000006 0000000007a08000 9000000002875000
[    0.020066]         0000000000000000 0000000000000000 9000000002805d80 900000010025fbc8
[    0.020073]         900000000296c000 0000000000000030 900000000260ba00 0000000000000038
[    0.020081]         0000000009608000 0000000000000000 900000000023aba4 0000000000000000
[    0.020088]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.020096]         ...
[    0.020099] Call Trace:
[    0.020100] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.020106] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.020110] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.020115] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.020120] [<900000000250b910>] workqueue_init+0x380/0x6cc
[    0.020123] [<9000000002501a18>] kernel_init_freeable+0x4c8/0x730
[    0.020128] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.020133] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.020140] ---[ end trace ]---
[    0.020333] rcu: Hierarchical SRCU implementation.
[    0.020338] rcu: 	Max phase no-delay instances is 1000.
[    0.020406] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
[    0.028011] smp: Bringing up secondary CPUs ...
[    0.044021] Booting CPU#1...
[    0.044042] Loongson-64bit Processor probed (LA664 Core)
[    0.044045] CPU1 revision is: 0014d000 (Loongson-64bit)
[    0.044047] FPU1 revision is: 00000000
[    0.044055] CPU#1 finished
[    0.044099] ------------[ cut here ]------------
[    0.044103] UBSAN: misaligned-access in kernel/workqueue.c:6665:2
[    0.044106] member access within misaligned address (____ptrval____) for type 'struct workqueue_struct'
[    0.044110] which requires 64 byte alignment
[    0.044113] CPU: 1 UID: 0 PID: 21 Comm: cpuhp/1 Not tainted 6.13.0-rc7+ #2
[    0.044116] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.044120] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000100458000
[    0.044128]         900000010045ba30 900000010045ba38 0000000000000000 900000010045bb78
[    0.044135]         900000010045bb70 900000010045bb70 9000000100045ef8 072007200720075b
[    0.044142]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.044149]         000000000000026e 0000000000000000 0000000000000000 0000000000000000
[    0.044155]         0755072d076e076f 0000000000000006 0000000007e08000 9000000002c69d80
[    0.044162]         0000000000000000 0000000000000000 9000000002805d80 900000010045ba38
[    0.044168]         900000000296c000 9000000002c6a238 0000000000000040 0000000000000000
[    0.044175]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    0.044181]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.044188]         ...
[    0.044191] Call Trace:
[    0.044192] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.044198] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.044203] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.044207] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.044212] [<9000000000358eec>] workqueue_online_cpu+0x5f4/0xee0
[    0.044216] [<90000000002e0e18>] cpuhp_invoke_callback+0x520/0xef0
[    0.044221] [<90000000002e2efc>] cpuhp_thread_fun+0x19c/0x760
[    0.044224] [<9000000000378b1c>] smpboot_thread_fn+0x19c/0x840
[    0.044228] [<9000000000367010>] kthread+0x1a0/0x3c0
[    0.044233] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.044239] ---[ end trace ]---
[    0.064017] Booting CPU#2...
[    0.064033] Loongson-64bit Processor probed (LA664 Core)
[    0.064036] CPU2 revision is: 0014d000 (Loongson-64bit)
[    0.064038] FPU2 revision is: 00000000
[    0.064044] CPU#2 finished
[    0.080012] Booting CPU#3...
[    0.080027] Loongson-64bit Processor probed (LA664 Core)
[    0.080029] CPU3 revision is: 0014d000 (Loongson-64bit)
[    0.080031] FPU3 revision is: 00000000
[    0.080036] CPU#3 finished
[    0.096039] Booting CPU#4...
[    0.096056] Loongson-64bit Processor probed (LA664 Core)
[    0.096059] CPU4 revision is: 0014d000 (Loongson-64bit)
[    0.096061] FPU4 revision is: 00000000
[    0.096068] CPU#4 finished
[    0.116011] Booting CPU#5...
[    0.116026] Loongson-64bit Processor probed (LA664 Core)
[    0.116028] CPU5 revision is: 0014d000 (Loongson-64bit)
[    0.116030] FPU5 revision is: 00000000
[    0.116035] CPU#5 finished
[    0.132038] Booting CPU#6...
[    0.132053] Loongson-64bit Processor probed (LA664 Core)
[    0.132055] CPU6 revision is: 0014d000 (Loongson-64bit)
[    0.132058] FPU6 revision is: 00000000
[    0.132063] CPU#6 finished
[    0.144013] Booting CPU#7...
[    0.144027] Loongson-64bit Processor probed (LA664 Core)
[    0.144029] CPU7 revision is: 0014d000 (Loongson-64bit)
[    0.144031] FPU7 revision is: 00000000
[    0.144036] CPU#7 finished
[    0.144072] smp: Brought up 1 node, 8 CPUs
[    0.144305] ------------[ cut here ]------------
[    0.144309] UBSAN: misaligned-access in kernel/workqueue.c:8027:2
[    0.144312] member access within misaligned address (____ptrval____) for type 'struct workqueue_struct'
[    0.144316] which requires 64 byte alignment
[    0.144319] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.144322] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.144326] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.144333]         900000010025fbd0 900000010025fbd8 0000000000000000 900000010025fd18
[    0.144340]         900000010025fd10 900000010025fd10 9000000100045ef8 072007200720075b
[    0.144347]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.144353]         00000000000002ab 0000000000000000 0000000000000000 0000000000000000
[    0.144360]         0755072d076e076f 0000000000000006 0000000007a08000 9000000002c6f828
[    0.144366]         0000000000000000 0000000000000000 9000000002805d80 900000010025fbd8
[    0.144373]         900000000296c000 9000000002c6a238 9000000002c6f908 900000000296c000
[    0.144379]         9000000002c69e50 0000000000000000 900000000023aba4 0000000000000000
[    0.144386]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.144392]         ...
[    0.144395] Call Trace:
[    0.144396] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.144401] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.144406] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.144410] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.144415] [<900000000250bd30>] workqueue_init_topology+0xd4/0x23c
[    0.144418] [<9000000002501a60>] kernel_init_freeable+0x510/0x730
[    0.144423] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.144427] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.144434] ---[ end trace ]---
[    0.144450] ------------[ cut here ]------------
[    0.144453] UBSAN: misaligned-access in kernel/workqueue.c:5641:3
[    0.144455] member access within misaligned address (____ptrval____) for type 'struct pool_workqueue'
[    0.144459] which requires 256 byte alignment
[    0.144462] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.144465] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.144469] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.144475]         900000010025fb80 900000010025fb88 0000000000000000 900000010025fcc8
[    0.144482]         900000010025fcc0 900000010025fcc0 9000000100045ef8 072007200720075b
[    0.144488]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.144495]         00000000000002c7 0000000000000000 0000000000000000 0000000000000000
[    0.144501]         0755072d076e076f 0000000000000006 0000000007a08000 0000000000000000
[    0.144508]         0000000000000000 0000000000000000 9000000002805d80 900000010025fb88
[    0.144514]         900000000296c000 90000001006b4800 0000000000000000 0000000000000000
[    0.144521]         900000010022a468 0000000000000000 900000000023aba4 0000000000000000
[    0.144527]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.144533]         ...
[    0.144537] Call Trace:
[    0.144538] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.144542] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.144547] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.144550] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.144555] [<9000000000345634>] wq_adjust_max_active+0x2a4/0x558
[    0.144559] [<900000000035673c>] workqueue_set_min_active+0x94/0x188
[    0.144563] [<9000000002501a64>] kernel_init_freeable+0x514/0x730
[    0.144567] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.144571] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.144578] ---[ end trace ]---
[    0.159989] node 0 deferred pages initialised in 12ms
[    0.160024] Memory: 32972848K/33523904K available (35712K kernel code, 22173K rwdata, 3296K rodata, 1088K init, 938K bss, 541040K reserved, 0K cma-reserved)
[    0.160577] devtmpfs: initialized
[    0.161895] Performance counters: loongarch/loongson64 PMU enabled, 4 64-bit counters available to each CPU.
[    0.162041] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.162057] futex hash table entries: 2048 (order: 3, 131072 bytes, linear)
[    0.163690] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.163848] audit: initializing netlink subsys (disabled)
[    0.163904] audit: type=2000 audit(0.000:1): state=initialized audit_enabled=0 res=1
[    0.164037] thermal_sys: Registered thermal governor 'fair_share'
[    0.164040] thermal_sys: Registered thermal governor 'bang_bang'
[    0.164046] thermal_sys: Registered thermal governor 'step_wise'
[    0.164051] thermal_sys: Registered thermal governor 'user_space'
[    0.164056] thermal_sys: Registered thermal governor 'power_allocator'
[    0.164132] hw-breakpoint: Found 8 breakpoint and 4 watchpoint registers.
[    0.172615] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 pages
[    0.172622] HugeTLB: 0 KiB vmemmap can be freed for a 32.0 MiB page
[    0.177721] ------------[ cut here ]------------
[    0.177727] UBSAN: misaligned-access in mm/percpu.c:1966:2
[    0.177732] member access within misaligned address (____ptrval____) for type 'struct pcpu_chunk'
[    0.177739] which requires 64 byte alignment
[    0.177745] CPU: 1 UID: 0 PID: 24 Comm: kworker/1:0 Not tainted 6.13.0-rc7+ #2
[    0.177752] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.177760] Workqueue: events pcpu_balance_workfn
[    0.177770] Stack : 90000000080a05a0 0000000000000000 900000000023aae8 9000000100464000
[    0.177782]         90000001004679c0 90000001004679c8 0000000000000000 9000000100467b08
[    0.177792]         9000000100467b00 9000000100467b00 9000000100045ef8 07640769075f0778
[    0.177803]         0720072007200720 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.177813]         00000000000002f6 0000000000000000 0000000000000000 0000000000000000
[    0.177823]         076e0766076b0772 0000000000000006 0000000007e08000 90000000080a05a0
[    0.177833]         0000000000000000 0000000000000000 9000000002805d80 90000001004679c8
[    0.177843]         900000000296c000 0000000000000000 0000000000000000 9000000100467be8
[    0.177853]         0000000000000020 0000000000000000 900000000023aba4 0000000000000000
[    0.177863]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.177874]         ...
[    0.177878] Call Trace:
[    0.177881] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.177891] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.177898] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.177904] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.177913] [<9000000000a74aec>] pcpu_balance_free+0x69c/0x828
[    0.177919] [<9000000000a74d24>] pcpu_balance_workfn+0xac/0xb48
[    0.177925] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[    0.177932] [<9000000000350d94>] worker_thread+0x314/0x1240
[    0.177938] [<9000000000367010>] kthread+0x1a0/0x3c0
[    0.177945] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.177955] ---[ end trace ]---
[    0.177958] ------------[ cut here ]------------
[    0.177962] UBSAN: misaligned-access in mm/percpu.c:1966:2
[    0.177966] member access within misaligned address (____ptrval____) for type 'struct pcpu_chunk'
[    0.177971] which requires 64 byte alignment
[    0.177975] CPU: 1 UID: 0 PID: 24 Comm: kworker/1:0 Not tainted 6.13.0-rc7+ #2
[    0.177981] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.177987] Workqueue: events pcpu_balance_workfn
[    0.177993] Stack : 90000000080a05a0 0000000000000000 900000000023aae8 9000000100464000
[    0.178004]         90000001004679c0 90000001004679c8 0000000000000000 9000000100467b08
[    0.178014]         9000000100467b00 9000000100467b00 9000000100045ef8 072007200720075b
[    0.178023]         0720072007200720 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.178033]         0000000000000315 0000000000000000 0000000000000000 0000000000000000
[    0.178043]         076e0766076b0772 0000000000000006 0000000007e08000 90000000080a05a0
[    0.178053]         0000000000000000 0000000000000000 9000000002805d80 90000001004679c8
[    0.178063]         900000000296c000 0000000000000000 0000000000000000 9000000100467be8
[    0.178072]         0000000000000020 0000000000000000 900000000023aba4 0000000000000000
[    0.178082]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.178092]         ...
[    0.178097] Call Trace:
[    0.178098] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.178105] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.178111] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.178117] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.178124] [<9000000000a74abc>] pcpu_balance_free+0x66c/0x828
[    0.178130] [<9000000000a74d24>] pcpu_balance_workfn+0xac/0xb48
[    0.178135] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[    0.178141] [<9000000000350d94>] worker_thread+0x314/0x1240
[    0.178147] [<9000000000367010>] kthread+0x1a0/0x3c0
[    0.178153] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.178162] ---[ end trace ]---
[    0.178166] ------------[ cut here ]------------
[    0.178170] UBSAN: misaligned-access in mm/percpu.c:2044:3
[    0.178174] member access within misaligned address (____ptrval____) for type 'struct pcpu_chunk'
[    0.178179] which requires 64 byte alignment
[    0.178183] CPU: 1 UID: 0 PID: 24 Comm: kworker/1:0 Not tainted 6.13.0-rc7+ #2
[    0.178188] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.178194] Workqueue: events pcpu_balance_workfn
[    0.178201] Stack : 90000000080a0510 0000000000000000 900000000023aae8 9000000100464000
[    0.178211]         9000000100467a60 9000000100467a68 0000000000000000 9000000100467ba8
[    0.178220]         9000000100467ba0 9000000100467ba0 9000000100045ef8 072007200720075b
[    0.178230]         0720072007200720 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.178240]         0000000000000334 0000000000000000 0000000000000000 0000000000000000
[    0.178250]         076e0766076b0772 0000000000000006 0000000007e08000 90000000080a0510
[    0.178260]         0000000000000000 0000000000000000 9000000002805d80 9000000100467a68
[    0.178269]         900000000296c000 0000000000000000 0000000000000004 9000000002875818
[    0.178279]         0000000000000010 0000000000000000 900000000023aba4 0000000000000000
[    0.178289]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.178299]         ...
[    0.178303] Call Trace:
[    0.178305] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.178311] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.178317] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.178323] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.178330] [<9000000000a754d4>] pcpu_balance_workfn+0x85c/0xb48
[    0.178336] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[    0.178342] [<9000000000350d94>] worker_thread+0x314/0x1240
[    0.178347] [<9000000000367010>] kthread+0x1a0/0x3c0
[    0.178353] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.178363] ---[ end trace ]---
[    0.178960] ------------[ cut here ]------------
[    0.178965] UBSAN: misaligned-access in mm/percpu.c:1966:2
[    0.178969] member access within misaligned address (____ptrval____) for type 'struct pcpu_chunk'
[    0.178975] which requires 64 byte alignment
[    0.178979] CPU: 1 UID: 0 PID: 24 Comm: kworker/1:0 Not tainted 6.13.0-rc7+ #2
[    0.178985] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.178991] Workqueue: events pcpu_balance_workfn
[    0.178998] Stack : 90000000080a05a0 0000000000000000 900000000023aae8 9000000100464000
[    0.179008]         90000001004679c0 90000001004679c8 0000000000000000 9000000100467b08
[    0.179018]         9000000100467b00 9000000100467b00 9000000100045ef8 0730073007300730
[    0.179028]         0720072007200720 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.179038]         0000000000000352 0000000000000000 0000000000000000 0000000000000000
[    0.179048]         076e0766076b0772 0000000000000006 0000000007e08000 90000000080a05a0
[    0.179058]         0000000000000000 0000000000000000 9000000002805d80 90000001004679c8
[    0.179068]         900000000296c000 0000000000000001 0000000000000001 9000000100467be8
[    0.179078]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    0.179088]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.179098]         ...
[    0.179103] Call Trace:
[    0.179105] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.179111] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.179118] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.179124] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.179131] [<9000000000a7494c>] pcpu_balance_free+0x4fc/0x828
[    0.179137] [<9000000000a75400>] pcpu_balance_workfn+0x788/0xb48
[    0.179143] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[    0.179149] [<9000000000350d94>] worker_thread+0x314/0x1240
[    0.179154] [<9000000000367010>] kthread+0x1a0/0x3c0
[    0.179161] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.179170] ---[ end trace ]---
[    0.179174] ------------[ cut here ]------------
[    0.179177] UBSAN: misaligned-access in mm/percpu.c:1966:2
[    0.179181] member access within misaligned address (____ptrval____) for type 'struct pcpu_chunk'
[    0.179186] which requires 64 byte alignment
[    0.179190] CPU: 1 UID: 0 PID: 24 Comm: kworker/1:0 Not tainted 6.13.0-rc7+ #2
[    0.179196] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.179202] Workqueue: events pcpu_balance_workfn
[    0.179208] Stack : 90000000080a05a0 0000000000000000 900000000023aae8 9000000100464000
[    0.179219]         90000001004679c0 90000001004679c8 0000000000000000 9000000100467b08
[    0.179229]         9000000100467b00 9000000100467b00 9000000100045ef8 072007200720075b
[    0.179238]         0720072007200720 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.179248]         0000000000000371 0000000000000000 0000000000000000 0000000000000000
[    0.179258]         076e0766076b0772 0000000000000006 0000000007e08000 90000000080a05a0
[    0.179268]         0000000000000000 0000000000000000 9000000002805d80 90000001004679c8
[    0.179277]         900000000296c000 0000000000000001 0000000000000001 9000000100467be8
[    0.179287]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    0.179297]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.179307]         ...
[    0.179311] Call Trace:
[    0.179312] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.179319] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.179326] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.179331] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.179338] [<9000000000a74994>] pcpu_balance_free+0x544/0x828
[    0.179344] [<9000000000a75400>] pcpu_balance_workfn+0x788/0xb48
[    0.179350] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[    0.179356] [<9000000000350d94>] worker_thread+0x314/0x1240
[    0.179361] [<9000000000367010>] kthread+0x1a0/0x3c0
[    0.179368] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.179377] ---[ end trace ]---
[    0.182929] ACPI: Added _OSI(Module Device)
[    0.182933] ACPI: Added _OSI(Processor Device)
[    0.182936] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.182939] ACPI: Added _OSI(Processor Aggregator Device)
[    0.183000] ------------[ cut here ]------------
[    0.183002] UBSAN: misaligned-access in drivers/acpi/acpica/psargs.c:397:3
[    0.183006] load of misaligned address (____ptrval____) for type 'u32'
[    0.183009] which requires 4 byte alignment
[    0.183012] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.183015] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.183019] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.183026]         900000010025f810 900000010025f818 0000000000000000 900000010025f958
[    0.183033]         900000010025f950 900000010025f950 9000000100045ef8 072007200720075b
[    0.183040]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.183046]         0000000000000393 0000000000000000 0000000000000000 0000000000000000
[    0.183053]         0755072d076e076f 0000000000000006 0000000007e08000 0000000000000006
[    0.183059]         0000000000000000 0000000000000000 9000000002805d80 900000010025f818
[    0.183066]         900000000296c000 0000000000000000 900000010025fa68 900000010136f170
[    0.183072]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    0.183079]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.183085]         ...
[    0.183088] Call Trace:
[    0.183089] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.183094] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.183098] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.183102] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.183107] [<90000000017e0774>] acpi_ps_get_next_simple_arg+0x33c/0x3e8
[    0.183112] [<90000000017e21d0>] acpi_ps_parse_loop+0x190/0x16c0
[    0.183116] [<90000000017e6750>] acpi_ps_parse_aml+0xe0/0xb30
[    0.183120] [<90000000017e932c>] acpi_ps_execute_table+0x194/0x3c8
[    0.183124] [<90000000017d6cc0>] acpi_ns_execute_table+0x180/0x2b0
[    0.183128] [<90000000017d4bcc>] acpi_ns_load_table+0x4c/0x100
[    0.183131] [<90000000017f4ef4>] acpi_tb_load_namespace+0x14c/0x4d8
[    0.183136] [<9000000002550850>] acpi_load_tables+0x44/0x9c
[    0.183140] [<900000000254d9c8>] acpi_init+0xb4/0x634
[    0.183145] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.183150] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.183155] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.183161] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.183167] ---[ end trace ]---
[    0.183173] ------------[ cut here ]------------
[    0.183175] UBSAN: misaligned-access in drivers/acpi/acpica/psargs.c:406:3
[    0.183178] load of misaligned address (____ptrval____) for type 'u64'
[    0.183181] which requires 8 byte alignment
[    0.183183] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.183187] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.183190] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.183197]         900000010025f810 900000010025f818 0000000000000000 900000010025f958
[    0.183204]         900000010025f950 900000010025f950 9000000100045ef8 072007200720075b
[    0.183210]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.183217]         00000000000003b8 0000000000000000 0000000000000000 0000000000000000
[    0.183223]         0755072d076e076f 0000000000000006 0000000007e08000 0000000000000011
[    0.183230]         0000000000000000 0000000000000000 9000000002805d80 900000010025f818
[    0.183237]         900000000296c000 0000000000000000 900000010025fa68 900000010136f170
[    0.183243]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    0.183250]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.183256]         ...
[    0.183259] Call Trace:
[    0.183260] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.183264] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.183269] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.183273] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.183277] [<90000000017e07b4>] acpi_ps_get_next_simple_arg+0x37c/0x3e8
[    0.183281] [<90000000017e21d0>] acpi_ps_parse_loop+0x190/0x16c0
[    0.183285] [<90000000017e6750>] acpi_ps_parse_aml+0xe0/0xb30
[    0.183289] [<90000000017e932c>] acpi_ps_execute_table+0x194/0x3c8
[    0.183293] [<90000000017d6cc0>] acpi_ns_execute_table+0x180/0x2b0
[    0.183296] [<90000000017d4bcc>] acpi_ns_load_table+0x4c/0x100
[    0.183299] [<90000000017f4ef4>] acpi_tb_load_namespace+0x14c/0x4d8
[    0.183304] [<9000000002550850>] acpi_load_tables+0x44/0x9c
[    0.183307] [<900000000254d9c8>] acpi_init+0xb4/0x634
[    0.183312] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.183316] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.183320] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.183325] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.183331] ---[ end trace ]---
[    0.183360] ------------[ cut here ]------------
[    0.183363] UBSAN: misaligned-access in drivers/acpi/acpica/psargs.c:525:3
[    0.183366] load of misaligned address (____ptrval____) for type 'u32'
[    0.183369] which requires 4 byte alignment
[    0.183371] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.183375] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.183378] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.183385]         900000010025f7d0 900000010025f7d8 0000000000000000 900000010025f918
[    0.183392]         900000010025f910 900000010025f910 9000000100045ef8 072007200720075b
[    0.183398]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.183405]         00000000000003dd 0000000000000000 0000000000000000 0000000000000000
[    0.183411]         0755072d076e076f 0000000000000006 0000000007e08000 0000000000000011
[    0.183418]         0000000000000000 0000000000000000 9000000002805d80 900000010025f7d8
[    0.183424]         900000000296c000 900000010136d650 0000000000000002 0000000000000003
[    0.183431]         ffff8000120280a7 0000000000000000 900000000023aba4 0000000000000000
[    0.183437]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.183443]         ...
[    0.183446] Call Trace:
[    0.183447] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.183452] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.183457] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.183460] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.183465] [<90000000017e18f4>] acpi_ps_get_next_arg+0x10d4/0x1820
[    0.183469] [<90000000017e25cc>] acpi_ps_parse_loop+0x58c/0x16c0
[    0.183473] [<90000000017e6750>] acpi_ps_parse_aml+0xe0/0xb30
[    0.183476] [<90000000017e932c>] acpi_ps_execute_table+0x194/0x3c8
[    0.183480] [<90000000017d6cc0>] acpi_ns_execute_table+0x180/0x2b0
[    0.183484] [<90000000017d4bcc>] acpi_ns_load_table+0x4c/0x100
[    0.183487] [<90000000017f4ef4>] acpi_tb_load_namespace+0x14c/0x4d8
[    0.183491] [<9000000002550850>] acpi_load_tables+0x44/0x9c
[    0.183494] [<900000000254d9c8>] acpi_init+0xb4/0x634
[    0.183499] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.183503] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.183507] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.183511] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.183518] ---[ end trace ]---
[    0.183740] ------------[ cut here ]------------
[    0.183742] UBSAN: misaligned-access in drivers/acpi/acpica/nsaccess.c:584:3
[    0.183746] load of misaligned address (____ptrval____) for type 'u32'
[    0.183748] which requires 4 byte alignment
[    0.183751] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.183754] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.183758] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.183765]         900000010025f740 900000010025f748 0000000000000000 900000010025f888
[    0.183771]         900000010025f880 900000010025f880 9000000100045ef8 072007200720075b
[    0.183778]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.183784]         0000000000000402 0000000000000000 0000000000000000 0000000000000000
[    0.183791]         0755072d076e076f 0000000000000006 0000000007e08000 ffff8000120286ae
[    0.183798]         0000000000000000 0000000000000000 9000000002805d80 900000010025f748
[    0.183804]         900000000296c000 900000010025f980 900000010025f9f0 0000000000000002
[    0.183810]         0000000000000015 0000000000000000 900000000023aba4 0000000000000000
[    0.183817]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.183823]         ...
[    0.183826] Call Trace:
[    0.183827] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.183832] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.183836] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.183840] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.183845] [<90000000017d076c>] acpi_ns_lookup+0x664/0x918
[    0.183848] [<90000000017dff78>] acpi_ps_get_next_namepath+0xa0/0x560
[    0.183852] [<90000000017e2500>] acpi_ps_parse_loop+0x4c0/0x16c0
[    0.183856] [<90000000017e6750>] acpi_ps_parse_aml+0xe0/0xb30
[    0.183859] [<90000000017e932c>] acpi_ps_execute_table+0x194/0x3c8
[    0.183864] [<90000000017d6cc0>] acpi_ns_execute_table+0x180/0x2b0
[    0.183867] [<90000000017d4bcc>] acpi_ns_load_table+0x4c/0x100
[    0.183870] [<90000000017f4ef4>] acpi_tb_load_namespace+0x14c/0x4d8
[    0.183875] [<9000000002550850>] acpi_load_tables+0x44/0x9c
[    0.183878] [<900000000254d9c8>] acpi_init+0xb4/0x634
[    0.183882] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.183887] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.183891] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.183895] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.183901] ---[ end trace ]---
[    0.184028] ------------[ cut here ]------------
[    0.184032] UBSAN: misaligned-access in drivers/acpi/acpica/psargs.c:388:3
[    0.184035] load of misaligned address (____ptrval____) for type 'u16'
[    0.184037] which requires 2 byte alignment
[    0.184040] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.184043] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.184046] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.184053]         900000010025f810 900000010025f818 0000000000000000 900000010025f958
[    0.184060]         900000010025f950 900000010025f950 9000000100045ef8 072007200720075b
[    0.184066]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.184073]         0000000000000428 0000000000000000 0000000000000000 0000000000000000
[    0.184079]         0755072d076e076f 0000000000000006 0000000007e08000 0000000000000010
[    0.184086]         0000000000000000 0000000000000000 9000000002805d80 900000010025f818
[    0.184092]         900000000296c000 0000000000000000 900000010025fa68 900000010136fc28
[    0.184099]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    0.184105]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.184112]         ...
[    0.184115] Call Trace:
[    0.184116] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.184120] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.184124] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.184128] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.184133] [<90000000017e07f4>] acpi_ps_get_next_simple_arg+0x3bc/0x3e8
[    0.184137] [<90000000017e21d0>] acpi_ps_parse_loop+0x190/0x16c0
[    0.184140] [<90000000017e6750>] acpi_ps_parse_aml+0xe0/0xb30
[    0.184144] [<90000000017e932c>] acpi_ps_execute_table+0x194/0x3c8
[    0.184148] [<90000000017d6cc0>] acpi_ns_execute_table+0x180/0x2b0
[    0.184152] [<90000000017d4bcc>] acpi_ns_load_table+0x4c/0x100
[    0.184155] [<90000000017f4ef4>] acpi_tb_load_namespace+0x14c/0x4d8
[    0.184160] [<9000000002550850>] acpi_load_tables+0x44/0x9c
[    0.184163] [<900000000254d9c8>] acpi_init+0xb4/0x634
[    0.184167] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.184172] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.184175] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.184180] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.184190] ---[ end trace ]---
[    0.185592] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    0.190546] ACPI Error: Could not enable GlobalLock event (20240827/evxfevnt-182)
[    0.190554] ACPI Warning: Could not enable fixed event - GlobalLock (1) (20240827/evxface-618)
[    0.190559] ACPI Error: No response from Global Lock hardware, disabling lock (20240827/evglock-59)
[    0.190659] ------------[ cut here ]------------
[    0.190662] UBSAN: misaligned-access in drivers/acpi/acpica/utpredef.c:87:7
[    0.190665] load of misaligned address (____ptrval____) for type 'u32'
[    0.190668] which requires 4 byte alignment
[    0.190670] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.190674] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.190678] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.190685]         900000010025f900 900000010025f908 0000000000000000 900000010025fa48
[    0.190692]         900000010025fa40 900000010025fa40 9000000100045ef8 072007200720075b
[    0.190698]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.190705]         0000000000000451 0000000000000000 0000000000000000 0000000000000000
[    0.190711]         0755072d076e076f 0000000000000006 0000000007a08000 9000000100230000
[    0.190717]         0000000000000000 0000000000000000 9000000002805d80 900000010025f908
[    0.190724]         900000000296c000 900000000296c000 900000010019de60 0000000000000000
[    0.190730]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    0.190737]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.190743]         ...
[    0.190746] Call Trace:
[    0.190747] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.190752] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.190757] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.190761] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.190765] [<90000000017ffdb4>] acpi_ut_match_predefined_method+0x104/0x120
[    0.190770] [<90000000017d3240>] acpi_ns_evaluate+0xa0/0xaa0
[    0.190773] [<90000000017d3de4>] acpi_ns_init_one_device+0x1a4/0x370
[    0.190777] [<90000000017dd2c8>] acpi_ns_walk_namespace+0x1c8/0x420
[    0.190781] [<90000000017d44ec>] acpi_ns_initialize_devices+0x244/0x350
[    0.190784] [<9000000002550cf4>] acpi_initialize_objects+0x34/0x44
[    0.190788] [<900000000254da00>] acpi_init+0xec/0x634
[    0.190792] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.190797] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.190801] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.190805] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.190811] ---[ end trace ]---
[    0.191094] ACPI: Interpreter enabled
[    0.191121] ACPI: PM: (supports S0 S3 S4 S5)
[    0.191125] ACPI: Using LPIC for interrupt routing
[    0.191138] ACPI: MCFG table detected, 1 entries
[    0.191453] ------------[ cut here ]------------
[    0.191456] UBSAN: misaligned-access in drivers/acpi/acpica/rsutils.c:126:4
[    0.191460] store to misaligned address (____ptrval____) for type 'u16'
[    0.191463] which requires 2 byte alignment
[    0.191466] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.191469] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.191473] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.191480]         900000010025f500 900000010025f508 0000000000000000 900000010025f648
[    0.191487]         900000010025f640 900000010025f640 9000000100045ef8 072007200720075b
[    0.191494]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.191500]         0000000000000478 0000000000000000 0000000000000000 0000000000000000
[    0.191507]         0755072d076e076f 0000000000000006 0000000007a08000 90000001008c5146
[    0.191514]         0000000000000000 0000000000000000 9000000002805d80 900000010025f508
[    0.191520]         900000000296c000 0000000000000000 90000001006e7811 90000000026859b0
[    0.191527]         0000000000000007 0000000000000000 900000000023aba4 0000000000000000
[    0.191533]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.191540]         ...
[    0.191543] Call Trace:
[    0.191544] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.191549] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.191554] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.191558] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.191563] [<90000000017edad0>] acpi_rs_move_data+0x270/0x2c0
[    0.191567] [<90000000017ec140>] acpi_rs_convert_aml_to_resource+0x180/0xeb0
[    0.191572] [<90000000017ebb14>] acpi_rs_convert_aml_to_resources+0x74/0x210
[    0.191576] [<900000000180037c>] acpi_ut_walk_aml_resources+0x124/0x2d8
[    0.191580] [<90000000017eabbc>] acpi_rs_create_resource_list+0xe4/0x138
[    0.191584] [<90000000017ee288>] acpi_rs_get_method_data+0x50/0x88
[    0.191589] [<90000000017ee9b4>] acpi_walk_resources+0xc4/0x1e8
[    0.191593] [<90000000017699dc>] acpi_mipi_check_crs_csi2+0x54/0x378
[    0.191599] [<9000000001768160>] acpi_bus_check_add+0x428/0x790
[    0.191603] [<90000000017dd2c8>] acpi_ns_walk_namespace+0x1c8/0x420
[    0.191607] [<90000000017ddb38>] acpi_walk_namespace+0x160/0x1a0
[    0.191611] [<9000000001768760>] acpi_bus_scan+0x280/0x438
[    0.191615] [<900000000254e228>] acpi_scan_init+0x1ec/0x3dc
[    0.191620] [<900000000254debc>] acpi_init+0x5a8/0x634
[    0.191625] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.191629] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.191633] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.191638] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.191644] ---[ end trace ]---
[    0.191647] ------------[ cut here ]------------
[    0.191650] UBSAN: misaligned-access in drivers/acpi/acpica/rsutils.c:138:4
[    0.191653] load of misaligned address (____ptrval____) for type 'u64'
[    0.191655] which requires 8 byte alignment
[    0.191658] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.191661] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.191664] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.191671]         900000010025f500 900000010025f508 0000000000000000 900000010025f648
[    0.191678]         900000010025f640 900000010025f640 9000000100045ef8 072007200720075b
[    0.191684]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.191691]         00000000000004a2 0000000000000000 0000000000000000 0000000000000000
[    0.191697]         0755072d076e076f 0000000000000006 0000000007a08000 90000001008c5156
[    0.191704]         0000000000000000 0000000000000000 9000000002805d80 900000010025f508
[    0.191710]         900000000296c000 0000000000000000 90000001006e7839 90000000026859c0
[    0.191717]         0000000000000007 0000000000000000 900000000023aba4 0000000000000000
[    0.191723]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.191730]         ...
[    0.191733] Call Trace:
[    0.191734] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.191738] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.191743] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.191746] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.191751] [<90000000017eda58>] acpi_rs_move_data+0x1f8/0x2c0
[    0.191755] [<90000000017ec140>] acpi_rs_convert_aml_to_resource+0x180/0xeb0
[    0.191759] [<90000000017ebb14>] acpi_rs_convert_aml_to_resources+0x74/0x210
[    0.191763] [<900000000180037c>] acpi_ut_walk_aml_resources+0x124/0x2d8
[    0.191767] [<90000000017eabbc>] acpi_rs_create_resource_list+0xe4/0x138
[    0.191771] [<90000000017ee288>] acpi_rs_get_method_data+0x50/0x88
[    0.191776] [<90000000017ee9b4>] acpi_walk_resources+0xc4/0x1e8
[    0.191780] [<90000000017699dc>] acpi_mipi_check_crs_csi2+0x54/0x378
[    0.191784] [<9000000001768160>] acpi_bus_check_add+0x428/0x790
[    0.191788] [<90000000017dd2c8>] acpi_ns_walk_namespace+0x1c8/0x420
[    0.191792] [<90000000017ddb38>] acpi_walk_namespace+0x160/0x1a0
[    0.191796] [<9000000001768760>] acpi_bus_scan+0x280/0x438
[    0.191800] [<900000000254e228>] acpi_scan_init+0x1ec/0x3dc
[    0.191804] [<900000000254debc>] acpi_init+0x5a8/0x634
[    0.191809] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.191813] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.191817] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.191821] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.191828] ---[ end trace ]---
[    0.191830] ------------[ cut here ]------------
[    0.191832] UBSAN: misaligned-access in drivers/acpi/acpica/rsutils.c:138:4
[    0.191834] store to misaligned address (____ptrval____) for type 'u64'
[    0.191837] which requires 8 byte alignment
[    0.191839] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.191842] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.191846] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.191852]         900000010025f500 900000010025f508 0000000000000000 900000010025f648
[    0.191859]         900000010025f640 900000010025f640 9000000100045ef8 072007200720075b
[    0.191865]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.191872]         00000000000004cc 0000000000000000 0000000000000000 0000000000000000
[    0.191878]         0755072d076e076f 0000000000000006 0000000007a08000 90000001008c5156
[    0.191885]         0000000000000000 0000000000000000 9000000002805d80 900000010025f508
[    0.191892]         900000000296c000 0000000000000000 90000001006e7839 90000000026859c0
[    0.191898]         0000000000000007 0000000000000000 900000000023aba4 0000000000000000
[    0.191904]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.191911]         ...
[    0.191914] Call Trace:
[    0.191915] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.191919] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.191924] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.191928] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.191932] [<90000000017edaa8>] acpi_rs_move_data+0x248/0x2c0
[    0.191936] [<90000000017ec140>] acpi_rs_convert_aml_to_resource+0x180/0xeb0
[    0.191941] [<90000000017ebb14>] acpi_rs_convert_aml_to_resources+0x74/0x210
[    0.191945] [<900000000180037c>] acpi_ut_walk_aml_resources+0x124/0x2d8
[    0.191948] [<90000000017eabbc>] acpi_rs_create_resource_list+0xe4/0x138
[    0.191953] [<90000000017ee288>] acpi_rs_get_method_data+0x50/0x88
[    0.191957] [<90000000017ee9b4>] acpi_walk_resources+0xc4/0x1e8
[    0.191961] [<90000000017699dc>] acpi_mipi_check_crs_csi2+0x54/0x378
[    0.191965] [<9000000001768160>] acpi_bus_check_add+0x428/0x790
[    0.191970] [<90000000017dd2c8>] acpi_ns_walk_namespace+0x1c8/0x420
[    0.191973] [<90000000017ddb38>] acpi_walk_namespace+0x160/0x1a0
[    0.191977] [<9000000001768760>] acpi_bus_scan+0x280/0x438
[    0.191982] [<900000000254e228>] acpi_scan_init+0x1ec/0x3dc
[    0.191986] [<900000000254debc>] acpi_init+0x5a8/0x634
[    0.191991] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.191995] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.191999] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.192003] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.192014] ---[ end trace ]---
[    0.192017] ------------[ cut here ]------------
[    0.192020] UBSAN: misaligned-access in drivers/acpi/acpica/rsutils.c:132:4
[    0.192023] store to misaligned address (____ptrval____) for type 'u32'
[    0.192025] which requires 4 byte alignment
[    0.192028] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.192031] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.192035] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.192041]         900000010025f500 900000010025f508 0000000000000000 900000010025f648
[    0.192048]         900000010025f640 900000010025f640 9000000100045ef8 072007200720075b
[    0.192058]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.192069]         00000000000004f6 0000000000000000 0000000000000000 0000000000000000
[    0.192076]         0755072d076e076f 0000000000000006 0000000007a08000 90000001008c5184
[    0.192082]         0000000000000000 0000000000000000 9000000002805d80 900000010025f508
[    0.192089]         900000000296c000 0000000000000000 90000001006e7881 90000000026859b8
[    0.192095]         0000000000000007 0000000000000000 900000000023aba4 0000000000000000
[    0.192102]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.192108]         ...
[    0.192112] Call Trace:
[    0.192113] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.192117] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.192122] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.192126] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.192130] [<90000000017edaf8>] acpi_rs_move_data+0x298/0x2c0
[    0.192134] [<90000000017ec140>] acpi_rs_convert_aml_to_resource+0x180/0xeb0
[    0.192139] [<90000000017ebb14>] acpi_rs_convert_aml_to_resources+0x74/0x210
[    0.192143] [<900000000180037c>] acpi_ut_walk_aml_resources+0x124/0x2d8
[    0.192146] [<90000000017eabbc>] acpi_rs_create_resource_list+0xe4/0x138
[    0.192151] [<90000000017ee288>] acpi_rs_get_method_data+0x50/0x88
[    0.192155] [<90000000017ee9b4>] acpi_walk_resources+0xc4/0x1e8
[    0.192159] [<90000000017699dc>] acpi_mipi_check_crs_csi2+0x54/0x378
[    0.192164] [<9000000001768160>] acpi_bus_check_add+0x428/0x790
[    0.192168] [<90000000017dd2c8>] acpi_ns_walk_namespace+0x1c8/0x420
[    0.192172] [<90000000017ddb38>] acpi_walk_namespace+0x160/0x1a0
[    0.192175] [<9000000001768760>] acpi_bus_scan+0x280/0x438
[    0.192180] [<900000000254e228>] acpi_scan_init+0x1ec/0x3dc
[    0.192184] [<900000000254debc>] acpi_init+0x5a8/0x634
[    0.192189] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.192193] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.192197] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.192201] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.192208] ---[ end trace ]---
[    0.192316] ------------[ cut here ]------------
[    0.192320] UBSAN: misaligned-access in drivers/acpi/acpica/rscalc.c:509:4
[    0.192323] load of misaligned address (____ptrval____) for type 'u16'
[    0.192326] which requires 2 byte alignment
[    0.192328] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.192331] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.192335] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.192342]         900000010025f620 900000010025f628 0000000000000000 900000010025f768
[    0.192349]         900000010025f760 900000010025f760 9000000100045ef8 072007200720075b
[    0.192355]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.192362]         0000000000000520 0000000000000000 0000000000000000 0000000000000000
[    0.192368]         0755072d076e076f 0000000000000006 0000000007a08000 0000000000000000
[    0.192375]         0000000000000000 0000000000000000 9000000002805d80 900000010025f628
[    0.192381]         900000000296c000 90000001008e5e75 9000000002685360 900000010025f847
[    0.192388]         0000000000000003 0000000000000000 900000000023aba4 0000000000000000
[    0.192394]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.192401]         ...
[    0.192404] Call Trace:
[    0.192405] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.192410] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.192414] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.192418] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.192422] [<90000000017ea3dc>] acpi_rs_get_list_length+0x63c/0x7a8
[    0.192426] [<90000000017eab3c>] acpi_rs_create_resource_list+0x64/0x138
[    0.192431] [<90000000017ee288>] acpi_rs_get_method_data+0x50/0x88
[    0.192435] [<90000000017ee9b4>] acpi_walk_resources+0xc4/0x1e8
[    0.192439] [<90000000017699dc>] acpi_mipi_check_crs_csi2+0x54/0x378
[    0.192444] [<9000000001768160>] acpi_bus_check_add+0x428/0x790
[    0.192448] [<90000000017dd2c8>] acpi_ns_walk_namespace+0x1c8/0x420
[    0.192452] [<90000000017ddb38>] acpi_walk_namespace+0x160/0x1a0
[    0.192456] [<9000000001768760>] acpi_bus_scan+0x280/0x438
[    0.192460] [<900000000254e228>] acpi_scan_init+0x1ec/0x3dc
[    0.192464] [<900000000254debc>] acpi_init+0x5a8/0x634
[    0.192469] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.192473] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.192477] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.192481] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.192488] ---[ end trace ]---
[    0.192491] ------------[ cut here ]------------
[    0.192494] UBSAN: misaligned-access in drivers/acpi/acpica/rsmisc.c:370:4
[    0.192496] load of misaligned address (____ptrval____) for type 'u16'
[    0.192499] which requires 2 byte alignment
[    0.192501] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.192504] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.192508] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.192515]         900000010025f580 900000010025f588 0000000000000000 900000010025f6c8
[    0.192521]         900000010025f6c0 900000010025f6c0 9000000100045ef8 072007200720075b
[    0.192528]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.192534]         0000000000000547 0000000000000000 0000000000000000 0000000000000000
[    0.192540]         0755072d076e076f 0000000000000006 0000000007a08000 90000001006b8fae
[    0.192547]         0000000000000000 0000000000000000 9000000002805d80 900000010025f588
[    0.192553]         900000000296c000 9000000002ab2e6c 0000000000000020 9000000002685770
[    0.192560]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    0.192566]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.192573]         ...
[    0.192576] Call Trace:
[    0.192577] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.192581] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.192585] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.192589] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.192593] [<90000000017eccfc>] acpi_rs_convert_aml_to_resource+0xd3c/0xeb0
[    0.192598] [<90000000017ebb14>] acpi_rs_convert_aml_to_resources+0x74/0x210
[    0.192602] [<9000000001800304>] acpi_ut_walk_aml_resources+0xac/0x2d8
[    0.192605] [<90000000017eabbc>] acpi_rs_create_resource_list+0xe4/0x138
[    0.192609] [<90000000017ee288>] acpi_rs_get_method_data+0x50/0x88
[    0.192614] [<90000000017ee9b4>] acpi_walk_resources+0xc4/0x1e8
[    0.192618] [<90000000017699dc>] acpi_mipi_check_crs_csi2+0x54/0x378
[    0.192622] [<9000000001768160>] acpi_bus_check_add+0x428/0x790
[    0.192627] [<90000000017dd2c8>] acpi_ns_walk_namespace+0x1c8/0x420
[    0.192630] [<90000000017ddb38>] acpi_walk_namespace+0x160/0x1a0
[    0.192634] [<9000000001768760>] acpi_bus_scan+0x280/0x438
[    0.192638] [<900000000254e228>] acpi_scan_init+0x1ec/0x3dc
[    0.192642] [<900000000254debc>] acpi_init+0x5a8/0x634
[    0.192647] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.192651] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.192655] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.192659] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.192665] ---[ end trace ]---
[    0.192835] ACPI: \_SB_.PCI0.PCIB.XHCI.PUBS: New power resource
[    0.194473] ------------[ cut here ]------------
[    0.194477] UBSAN: misaligned-access in drivers/acpi/acpica/rsutils.c:132:4
[    0.194480] load of misaligned address (____ptrval____) for type 'u32'
[    0.194482] which requires 4 byte alignment
[    0.194485] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.194488] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.194492] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.194499]         900000010025f500 900000010025f508 0000000000000000 900000010025f648
[    0.194505]         900000010025f640 900000010025f640 9000000100045ef8 072007200720075b
[    0.194512]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.194518]         0000000000000571 0000000000000000 0000000000000000 0000000000000000
[    0.194525]         0755072d076e076f 0000000000000006 0000000007a08000 9000000100976f73
[    0.194531]         0000000000000000 0000000000000000 9000000002805d80 900000010025f508
[    0.194538]         900000000296c000 0000000000000000 90000001006fb361 90000000026859b8
[    0.194544]         0000000000000007 0000000000000000 900000000023aba4 0000000000000000
[    0.194551]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.194557]         ...
[    0.194560] Call Trace:
[    0.194561] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.194566] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.194570] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.194574] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.194578] [<90000000017edb14>] acpi_rs_move_data+0x2b4/0x2c0
[    0.194583] [<90000000017ec140>] acpi_rs_convert_aml_to_resource+0x180/0xeb0
[    0.194587] [<90000000017ebb14>] acpi_rs_convert_aml_to_resources+0x74/0x210
[    0.194591] [<900000000180037c>] acpi_ut_walk_aml_resources+0x124/0x2d8
[    0.194595] [<90000000017eabbc>] acpi_rs_create_resource_list+0xe4/0x138
[    0.194599] [<90000000017ee288>] acpi_rs_get_method_data+0x50/0x88
[    0.194603] [<90000000017ee9b4>] acpi_walk_resources+0xc4/0x1e8
[    0.194607] [<90000000017699dc>] acpi_mipi_check_crs_csi2+0x54/0x378
[    0.194612] [<9000000001768160>] acpi_bus_check_add+0x428/0x790
[    0.194616] [<90000000017dd2c8>] acpi_ns_walk_namespace+0x1c8/0x420
[    0.194620] [<90000000017ddb38>] acpi_walk_namespace+0x160/0x1a0
[    0.194624] [<9000000001768760>] acpi_bus_scan+0x280/0x438
[    0.194628] [<900000000254e228>] acpi_scan_init+0x1ec/0x3dc
[    0.194633] [<900000000254debc>] acpi_init+0x5a8/0x634
[    0.194637] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.194642] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.194646] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.194650] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.194657] ---[ end trace ]---
[    0.195613] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.195622] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.195631] acpi PNP0A08:00: _OSC: OS requested [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR]
[    0.195636] acpi PNP0A08:00: _OSC: platform willing to grant [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR]
[    0.195639] acpi PNP0A08:00: _OSC: platform retains control of PCIe features (AE_NOT_FOUND)
[    0.195644] acpi PNP0A08:00: MCFG quirk: ECAM at [mem 0xefe00000000-0xefe0fffffff] for [bus 00-ff] with 0x900000000372f8f0
[    0.195907] acpi PNP0A08:00: ECAM at [mem 0xefe00000000-0xefe1fffffff] for [bus 00-ff]
[    0.195930] ACPI: Remapped I/O 0x0000000018000000 to [io  0x0000-0xffff window]
[    0.196047] PCI host bridge to bus 0000:00
[    0.196056] pci_bus 0000:00: root bus resource [io  0x0000-0xffff window]
[    0.196061] pci_bus 0000:00: root bus resource [mem 0xe0030000000-0xe007fffffff window] (bus address [0x30000000-0x7fffffff])
[    0.196066] pci_bus 0000:00: root bus resource [mem 0xe8000000000-0xefcffffffff window] (bus address [0x8000000000-0xfcffffffff])
[    0.196071] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.196091] pci 0000:00:00.0: [0014:7a00] type 00 class 0x060000 conventional PCI endpoint
[    0.196174] pci 0000:00:00.1: [0014:7a10] type 00 class 0x060000 conventional PCI endpoint
[    0.196216] pci 0000:00:00.2: [0014:7a20] type 00 class 0x060000 conventional PCI endpoint
[    0.196260] pci 0000:00:00.3: [0014:7a30] type 00 class 0x060000 conventional PCI endpoint
[    0.196310] pci 0000:00:03.0: [0014:7a13] type 00 class 0x020000 conventional PCI endpoint
[    0.196319] pci 0000:00:03.0: BAR 0 [mem 0xe8015160000-0xe8015167fff 64bit]
[    0.196401] pci 0000:00:04.0: [0014:7a24] type 00 class 0x0c0310 conventional PCI endpoint
[    0.196409] pci 0000:00:04.0: BAR 0 [mem 0xe8015158000-0xe801515ffff 64bit]
[    0.196485] pci 0000:00:04.1: [0014:7a14] type 00 class 0x0c0320 conventional PCI endpoint
[    0.196493] pci 0000:00:04.1: BAR 0 [mem 0xe8015150000-0xe8015157fff 64bit]
[    0.196569] pci 0000:00:05.0: [0014:7a24] type 00 class 0x0c0310 conventional PCI endpoint
[    0.196578] pci 0000:00:05.0: BAR 0 [mem 0xe8015148000-0xe801514ffff 64bit]
[    0.196654] pci 0000:00:05.1: [0014:7a14] type 00 class 0x0c0320 conventional PCI endpoint
[    0.196662] pci 0000:00:05.1: BAR 0 [mem 0xe8015140000-0xe8015147fff 64bit]
[    0.196738] pci 0000:00:06.0: [0014:7a25] type 00 class 0x040000 conventional PCI endpoint
[    0.196746] pci 0000:00:06.0: BAR 0 [mem 0xe8015172000-0xe80151720ff 64bit]
[    0.196752] pci 0000:00:06.0: BAR 2 [mem 0xe8000000000-0xe800fffffff 64bit]
[    0.196758] pci 0000:00:06.0: BAR 4 [mem 0xe8015130000-0xe801513ffff 64bit]
[    0.196800] pci 0000:00:06.1: [0014:7a36] type 00 class 0x030000 conventional PCI endpoint
[    0.196808] pci 0000:00:06.1: BAR 0 [mem 0xe8015120000-0xe801512ffff 64bit]
[    0.196854] pci 0000:00:06.2: [0014:7a37] type 00 class 0x040300 conventional PCI endpoint
[    0.196862] pci 0000:00:06.2: BAR 0 [mem 0xe8015110000-0xe801511ffff 64bit]
[    0.196906] pci 0000:00:07.0: [0014:7a07] type 00 class 0x040300 conventional PCI endpoint
[    0.196914] pci 0000:00:07.0: BAR 0 [mem 0xe8015100000-0xe801510ffff 64bit]
[    0.196962] pci 0000:00:08.0: [0014:7a18] type 00 class 0x010601 conventional PCI endpoint
[    0.196976] pci 0000:00:08.0: BAR 5 [mem 0xe0030200000-0xe00302003ff]
[    0.197043] pci 0000:00:09.0: [0014:7a49] type 01 class 0x060400 PCIe Root Port
[    0.197054] pci 0000:00:09.0: BAR 0 [mem 0xe8015171000-0xe8015171fff 64bit]
[    0.197061] pci 0000:00:09.0: PCI bridge to [bus 01]
[    0.197095] pci 0000:00:09.0: supports D1 D2
[    0.197098] pci 0000:00:09.0: PME# supported from D0 D1 D3hot D3cold
[    0.197167] pci 0000:00:0a.0: [0014:7a39] type 01 class 0x060400 PCIe Root Port
[    0.197177] pci 0000:00:0a.0: BAR 0 [mem 0xe8015170000-0xe8015170fff 64bit]
[    0.197184] pci 0000:00:0a.0: PCI bridge to [bus 02]
[    0.197189] pci 0000:00:0a.0:   bridge window [io  0x20000-0x20fff]
[    0.197193] pci 0000:00:0a.0:   bridge window [mem 0xe0030100000-0xe00301fffff]
[    0.197221] pci 0000:00:0a.0: supports D1 D2
[    0.197224] pci 0000:00:0a.0: PME# supported from D0 D1 D3hot D3cold
[    0.197312] pci 0000:00:0b.0: [0014:7a39] type 01 class 0x060400 PCIe Root Port
[    0.197323] pci 0000:00:0b.0: BAR 0 [mem 0xe801516f000-0xe801516ffff 64bit]
[    0.197329] pci 0000:00:0b.0: PCI bridge to [bus 03]
[    0.197359] pci 0000:00:0b.0: supports D1 D2
[    0.197363] pci 0000:00:0b.0: PME# supported from D0 D1 D3hot D3cold
[    0.197427] pci 0000:00:0c.0: [0014:7a39] type 01 class 0x060400 PCIe Root Port
[    0.197437] pci 0000:00:0c.0: BAR 0 [mem 0xe801516e000-0xe801516efff 64bit]
[    0.197444] pci 0000:00:0c.0: PCI bridge to [bus 04]
[    0.197474] pci 0000:00:0c.0: supports D1 D2
[    0.197477] pci 0000:00:0c.0: PME# supported from D0 D1 D3hot D3cold
[    0.197541] pci 0000:00:0d.0: [0014:7a49] type 01 class 0x060400 PCIe Root Port
[    0.197549] pci 0000:00:0d.0: BAR 0 [mem 0xe801516d000-0xe801516dfff 64bit]
[    0.197554] pci 0000:00:0d.0: PCI bridge to [bus 05]
[    0.197559] pci 0000:00:0d.0:   bridge window [mem 0xe0030000000-0xe00300fffff]
[    0.197580] pci 0000:00:0d.0: supports D1 D2
[    0.197584] pci 0000:00:0d.0: PME# supported from D0 D1 D3hot D3cold
[    0.197638] pci 0000:00:0f.0: [0014:7a69] type 01 class 0x060400 PCIe Root Port
[    0.197648] pci 0000:00:0f.0: BAR 0 [mem 0xe801516c000-0xe801516cfff 64bit]
[    0.197655] pci 0000:00:0f.0: PCI bridge to [bus 06]
[    0.197684] pci 0000:00:0f.0: supports D1 D2
[    0.197688] pci 0000:00:0f.0: PME# supported from D0 D1 D3hot D3cold
[    0.197750] pci 0000:00:10.0: [0014:7a59] type 01 class 0x060400 PCIe Root Port
[    0.197761] pci 0000:00:10.0: BAR 0 [mem 0xe801516b000-0xe801516bfff 64bit]
[    0.197767] pci 0000:00:10.0: PCI bridge to [bus 07]
[    0.197797] pci 0000:00:10.0: supports D1 D2
[    0.197800] pci 0000:00:10.0: PME# supported from D0 D1 D3hot D3cold
[    0.197859] pci 0000:00:13.0: [0014:7a59] type 01 class 0x060400 PCIe Root Port
[    0.197869] pci 0000:00:13.0: BAR 0 [mem 0xe801516a000-0xe801516afff 64bit]
[    0.197876] pci 0000:00:13.0: PCI bridge to [bus 08]
[    0.197906] pci 0000:00:13.0: supports D1 D2
[    0.197909] pci 0000:00:13.0: PME# supported from D0 D1 D3hot D3cold
[    0.197968] pci 0000:00:16.0: [0014:7a1b] type 00 class 0x088000 conventional PCI endpoint
[    0.197976] pci 0000:00:16.0: BAR 0 [mem 0xe8015169000-0xe8015169fff 64bit]
[    0.197982] pci 0000:00:16.0: BAR 2 [mem 0xe8014000000-0xe8014ffffff 64bit]
[    0.198027] pci 0000:00:19.0: [0014:7a34] type 00 class 0x0c0330 conventional PCI endpoint
[    0.198035] pci 0000:00:19.0: BAR 0 [mem 0xe8015000000-0xe80150fffff 64bit]
[    0.198078] pci 0000:00:1a.0: [0014:7a1f] type 00 class 0x080600 conventional PCI endpoint
[    0.198086] pci 0000:00:1a.0: BAR 0 [mem 0xe8015168000-0xe80151683ff 64bit]
[    0.198092] pci 0000:00:1a.0: BAR 2 [mem 0xe8010000000-0xe8013ffffff 64bit]
[    0.198099] pci 0000:00:1a.0: ROM [mem 0xfffff800-0xffffffff pref]
[    0.198235] pci 0000:02:00.0: [10ec:8168] type 00 class 0x020000 PCIe Endpoint
[    0.198264] pci 0000:02:00.0: BAR 0 [io  0x20000-0x200ff]
[    0.198299] pci 0000:02:00.0: BAR 2 [mem 0xe0030104000-0xe0030104fff 64bit]
[    0.198322] pci 0000:02:00.0: BAR 4 [mem 0xe0030100000-0xe0030103fff 64bit]
[    0.198466] pci 0000:02:00.0: supports D1 D2
[    0.198470] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.204108] pci 0000:05:00.0: [1bb1:5021] type 00 class 0x010802 PCIe Endpoint
[    0.204142] pci 0000:05:00.0: BAR 0 [mem 0xe0030000000-0xe0030003fff 64bit]
[    0.204433] pci 0000:05:00.0: 31.504 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x4 link at 0000:00:0d.0 (capable of 63.012 Gb/s with 16.0 GT/s PCIe x4 link)
[    0.212114] pci 0000:00:06.0: BAR 2 [mem 0xe8000000000-0xe800fffffff 64bit]: assigned
[    0.212122] pci 0000:00:1a.0: BAR 2 [mem 0xe8010000000-0xe8013ffffff 64bit]: assigned
[    0.212127] pci 0000:00:16.0: BAR 2 [mem 0xe8014000000-0xe8014ffffff 64bit]: assigned
[    0.212133] pci 0000:00:0a.0: bridge window [mem 0xe0030000000-0xe00300fffff]: assigned
[    0.212137] pci 0000:00:0d.0: bridge window [mem 0xe0030100000-0xe00301fffff]: assigned
[    0.212141] pci 0000:00:19.0: BAR 0 [mem 0xe8015000000-0xe80150fffff 64bit]: assigned
[    0.212147] pci 0000:00:06.0: BAR 4 [mem 0xe8015100000-0xe801510ffff 64bit]: assigned
[    0.212152] pci 0000:00:06.1: BAR 0 [mem 0xe8015110000-0xe801511ffff 64bit]: assigned
[    0.212158] pci 0000:00:06.2: BAR 0 [mem 0xe8015120000-0xe801512ffff 64bit]: assigned
[    0.212163] pci 0000:00:07.0: BAR 0 [mem 0xe8015130000-0xe801513ffff 64bit]: assigned
[    0.212169] pci 0000:00:03.0: BAR 0 [mem 0xe8015140000-0xe8015147fff 64bit]: assigned
[    0.212174] pci 0000:00:04.0: BAR 0 [mem 0xe8015148000-0xe801514ffff 64bit]: assigned
[    0.212180] pci 0000:00:04.1: BAR 0 [mem 0xe8015150000-0xe8015157fff 64bit]: assigned
[    0.212185] pci 0000:00:05.0: BAR 0 [mem 0xe8015158000-0xe801515ffff 64bit]: assigned
[    0.212190] pci 0000:00:05.1: BAR 0 [mem 0xe8015160000-0xe8015167fff 64bit]: assigned
[    0.212195] pci 0000:00:09.0: BAR 0 [mem 0xe8015168000-0xe8015168fff 64bit]: assigned
[    0.212202] pci 0000:00:0a.0: BAR 0 [mem 0xe8015169000-0xe8015169fff 64bit]: assigned
[    0.212208] pci 0000:00:0a.0: bridge window [io  0x4000-0x4fff]: assigned
[    0.212211] pci 0000:00:0b.0: BAR 0 [mem 0xe801516a000-0xe801516afff 64bit]: assigned
[    0.212218] pci 0000:00:0c.0: BAR 0 [mem 0xe801516b000-0xe801516bfff 64bit]: assigned
[    0.212224] pci 0000:00:0d.0: BAR 0 [mem 0xe801516c000-0xe801516cfff 64bit]: assigned
[    0.212229] pci 0000:00:0f.0: BAR 0 [mem 0xe801516d000-0xe801516dfff 64bit]: assigned
[    0.212236] pci 0000:00:10.0: BAR 0 [mem 0xe801516e000-0xe801516efff 64bit]: assigned
[    0.212242] pci 0000:00:13.0: BAR 0 [mem 0xe801516f000-0xe801516ffff 64bit]: assigned
[    0.212249] pci 0000:00:16.0: BAR 0 [mem 0xe8015170000-0xe8015170fff 64bit]: assigned
[    0.212254] pci 0000:00:1a.0: ROM [mem 0xe0030200000-0xe00302007ff pref]: assigned
[    0.212258] pci 0000:00:08.0: BAR 5 [mem 0xe0030200800-0xe0030200bff]: assigned
[    0.212263] pci 0000:00:1a.0: BAR 0 [mem 0xe8015171000-0xe80151713ff 64bit]: assigned
[    0.212269] pci 0000:00:06.0: BAR 0 [mem 0xe8015171400-0xe80151714ff 64bit]: assigned
[    0.212277] pci 0000:00:09.0: PCI bridge to [bus 01]
[    0.212285] pci 0000:02:00.0: BAR 4 [mem 0xe0030000000-0xe0030003fff 64bit]: assigned
[    0.212301] pci 0000:02:00.0: BAR 2 [mem 0xe0030004000-0xe0030004fff 64bit]: assigned
[    0.212317] pci 0000:02:00.0: BAR 0 [io  0x4000-0x40ff]: assigned
[    0.212324] pci 0000:00:0a.0: PCI bridge to [bus 02]
[    0.212327] pci 0000:00:0a.0:   bridge window [io  0x4000-0x4fff]
[    0.212332] pci 0000:00:0a.0:   bridge window [mem 0xe0030000000-0xe00300fffff]
[    0.212337] pci 0000:00:0b.0: PCI bridge to [bus 03]
[    0.212343] pci 0000:00:0c.0: PCI bridge to [bus 04]
[    0.212350] pci 0000:05:00.0: BAR 0 [mem 0xe0030100000-0xe0030103fff 64bit]: assigned
[    0.212365] pci 0000:00:0d.0: PCI bridge to [bus 05]
[    0.212369] pci 0000:00:0d.0:   bridge window [mem 0xe0030100000-0xe00301fffff]
[    0.212374] pci 0000:00:0f.0: PCI bridge to [bus 06]
[    0.212380] pci 0000:00:10.0: PCI bridge to [bus 07]
[    0.212386] pci 0000:00:13.0: PCI bridge to [bus 08]
[    0.213262] iommu: Default domain type: Translated
[    0.213267] iommu: DMA domain TLB invalidation policy: strict mode
[    0.213390] pps_core: LinuxPPS API ver. 1 registered
[    0.213394] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.213400] PTP clock support registered
[    0.213523] efivars: Registered efivars operations
[    0.213616] ------------[ cut here ]------------
[    0.213620] UBSAN: misaligned-access in net/netlink/genetlink.c:510:3
[    0.213623] member access within misaligned address (____ptrval____) for type 'struct net'
[    0.213627] which requires 64 byte alignment
[    0.213630] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.213634] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.213637] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.213645]         900000010025fad0 900000010025fad8 0000000000000000 900000010025fc18
[    0.213652]         900000010025fc10 900000010025fc10 9000000100045ef8 072007200720075b
[    0.213659]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.213665]         0000000000000631 0000000000000000 0000000000000000 0000000000000000
[    0.213672]         0755072d076e076f 0000000000000006 0000000007a08000 9000000003a0dac0
[    0.213678]         0000000000000000 0000000000000000 9000000002805d80 900000010025fad8
[    0.213685]         900000000296c000 0000000000000000 9000000002af0950 900000000296c000
[    0.213691]         9000000003a0dac0 0000000000000000 900000000023aba4 0000000000000000
[    0.213698]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.213704]         ...
[    0.213708] Call Trace:
[    0.213709] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.213714] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.213719] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.213723] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.213728] [<9000000001e2b7f0>] genl_register_family+0x2a0/0xab8
[    0.213732] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.213737] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.213741] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.213746] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.213753] ---[ end trace ]---
[    0.213759] ------------[ cut here ]------------
[    0.213761] UBSAN: misaligned-access in net/netlink/genetlink.c:1936:2
[    0.213764] member access within misaligned address (____ptrval____) for type 'struct net'
[    0.213767] which requires 64 byte alignment
[    0.213770] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.213773] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.213777] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.213783]         900000010025fa60 900000010025fa68 0000000000000000 900000010025fba8
[    0.213790]         900000010025fba0 900000010025fba0 9000000100045ef8 0730073007300730
[    0.213796]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.213803]         000000000000064e 0000000000000000 0000000000000000 0000000000000000
[    0.213810]         0755072d076e076f 0000000000000006 0000000007a08000 0000000000000000
[    0.213816]         0000000000000000 0000000000000000 9000000002805d80 900000010025fa68
[    0.213823]         900000000296c000 900000010072f100 0000000000000000 0000000000000000
[    0.213829]         9000000003fccbc0 0000000000000000 900000000023aba4 0000000000000000
[    0.213836]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.213842]         ...
[    0.213845] Call Trace:
[    0.213846] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.213851] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.213855] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.213859] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.213864] [<9000000001e25be8>] genlmsg_multicast_allns+0x2c8/0x3b8
[    0.213870] [<9000000001e2b8c8>] genl_register_family+0x378/0xab8
[    0.213873] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.213877] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.213882] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.213886] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.213892] ---[ end trace ]---
[    0.214034] ------------[ cut here ]------------
[    0.214038] UBSAN: misaligned-access in net/core/dev.c:1757:2
[    0.214041] member access within misaligned address (____ptrval____) for type 'struct net_device'
[    0.214045] which requires 64 byte alignment
[    0.214047] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.214051] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.214055] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.214062]         900000010025fa90 900000010025fa98 0000000000000000 900000010025fbd8
[    0.214069]         900000010025fbd0 900000010025fbd0 9000000100045ef8 072007200720075b
[    0.214075]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.214082]         000000000000066c 0000000000000000 0000000000000000 0000000000000000
[    0.214089]         0755072d076e076f 0000000000000006 0000000007a08000 9000000003aa8a48
[    0.214095]         0000000000000000 0000000000000000 9000000002805d80 900000010025fa98
[    0.214102]         900000000296c000 0000000000000000 9000000003fccbc0 900000010025fc98
[    0.214109]         0000000000000038 0000000000000000 900000000023aba4 0000000000000000
[    0.214115]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.214122]         ...
[    0.214125] Call Trace:
[    0.214126] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.214130] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.214135] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.214139] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.214144] [<9000000001c34d70>] call_netdevice_register_net_notifiers+0x1d0/0x2f8
[    0.214150] [<9000000001c40b84>] register_netdevice_notifier+0x9c/0x318
[    0.214155] [<90000000025693a4>] netdev_genl_init+0x28/0x64
[    0.214160] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.214165] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.214169] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.214173] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.214180] ---[ end trace ]---
[    0.214182] ------------[ cut here ]------------
[    0.214184] UBSAN: misaligned-access in net/core/dev.c:1808:2
[    0.214187] member access within misaligned address (____ptrval____) for type 'struct net'
[    0.214190] which requires 64 byte alignment
[    0.214192] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.214195] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.214199] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.214206]         900000010025fb10 900000010025fb18 0000000000000000 900000010025fc58
[    0.214212]         900000010025fc50 900000010025fc50 9000000100045ef8 072007200720075b
[    0.214219]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.214225]         000000000000068b 0000000000000000 0000000000000000 0000000000000000
[    0.214232]         0755072d076e076f 0000000000000006 0000000007a08000 9000000003a0d000
[    0.214238]         0000000000000000 0000000000000000 9000000002805d80 900000010025fb18
[    0.214245]         900000000296c000 0000000000000000 900000000296c000 9000000003a0dac0
[    0.214251]         9000000003fcdec8 0000000000000000 900000000023aba4 0000000000000000
[    0.214258]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.214264]         ...
[    0.214267] Call Trace:
[    0.214268] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.214272] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.214277] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.214281] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.214285] [<9000000001c40cf0>] register_netdevice_notifier+0x208/0x318
[    0.214290] [<90000000025693a4>] netdev_genl_init+0x28/0x64
[    0.214294] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.214298] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.214302] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.214307] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.214313] ---[ end trace ]---
[    0.214405] ------------[ cut here ]------------
[    0.214408] UBSAN: misaligned-access in net/wireless/wext-core.c:352:2
[    0.214411] member access within misaligned address (____ptrval____) for type 'struct net'
[    0.214415] which requires 64 byte alignment
[    0.214417] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.214421] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.214424] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.214431]         900000010025fa50 900000010025fa58 0000000000000000 900000010025fb98
[    0.214438]         900000010025fb90 900000010025fb90 9000000100045ef8 072007200720075b
[    0.214445]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.214452]         00000000000006a9 0000000000000000 0000000000000000 0000000000000000
[    0.214458]         0755072d076e076f 0000000000000006 0000000007a08000 9000000003e360e8
[    0.214465]         0000000000000000 0000000000000000 9000000002805d80 900000010025fa58
[    0.214471]         900000000296c000 0000000000000000 9000000003fccbc0 900000010025fc98
[    0.214477]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    0.214484]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.214490]         ...
[    0.214494] Call Trace:
[    0.214494] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.214499] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.214504] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.214508] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.214512] [<900000000236c068>] wireless_nlevent_flush+0xb0/0x120
[    0.214517] [<900000000236c0ec>] wext_netdev_notifier_call+0x14/0x28
[    0.214520] [<9000000001c34c40>] call_netdevice_register_net_notifiers+0xa0/0x2f8
[    0.214525] [<9000000001c40b84>] register_netdevice_notifier+0x9c/0x318
[    0.214530] [<900000000256eca8>] wireless_nlevent_init+0x40/0x6c
[    0.214535] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.214539] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.214543] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.214548] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.214554] ---[ end trace ]---
[    0.214556] NetLabel: Initializing
[    0.214558] NetLabel:  domain hash size = 128
[    0.214561] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.214582] NetLabel:  unlabeled traffic allowed by default
[    0.214671] pci 0000:00:06.1: vgaarb: setting as boot VGA device
[    0.214676] pci 0000:00:06.1: vgaarb: bridge control possible
[    0.214679] pci 0000:00:06.1: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.214688] vgaarb: loaded
[    0.214750] clocksource: Switched to clocksource Constant
[    0.216740] VFS: Disk quotas dquot_6.6.0
[    0.216840] VFS: Dquot-cache hash table entries: 2048 (order 0, 16384 bytes)
[    0.217064] AppArmor: AppArmor Filesystem Enabled
[    0.217096] pnp: PnP ACPI init
[    0.217408] pnp: PnP ACPI: found 7 devices
[    0.219821] NET: Registered PF_INET protocol family
[    0.219970] IP idents hash table entries: 262144 (order: 7, 2097152 bytes, linear)
[    0.223534] tcp_listen_portaddr_hash hash table entries: 16384 (order: 4, 262144 bytes, linear)
[    0.223654] Table-perturb hash table entries: 65536 (order: 4, 262144 bytes, linear)
[    0.223784] TCP established hash table entries: 262144 (order: 7, 2097152 bytes, linear)
[    0.224320] TCP bind hash table entries: 65536 (order: 7, 2097152 bytes, linear)
[    0.224588] TCP: Hash tables configured (established 262144 bind 65536)
[    0.224617] ------------[ cut here ]------------
[    0.224620] UBSAN: misaligned-access in net/ipv4/tcp_cong.c:69:2
[    0.224623] member access within misaligned address (____ptrval____) for type 'struct tcp_congestion_ops'
[    0.224628] which requires 64 byte alignment
[    0.224631] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.224634] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.224638] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.224647]         900000010025fa70 900000010025fa78 0000000000000000 900000010025fbb8
[    0.224654]         900000010025fbb0 900000010025fbb0 9000000100045ef8 072007200720075b
[    0.224660]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.224667]         00000000000006df 0000000000000000 0000000000000000 0000000000000000
[    0.224673]         0755072d076e076f 0000000000000006 0000000007a08000 9000000003fcf480
[    0.224680]         0000000000000000 0000000000000000 9000000002805d80 900000010025fa78
[    0.224687]         900000000296c000 0000000000000000 ffffffffc80d7a74 9000000003c0e158
[    0.224693]         900000000296c000 0000000000000000 900000000023aba4 0000000000000000
[    0.224699]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.224706]         ...
[    0.224709] Call Trace:
[    0.224710] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.224716] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.224721] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.224725] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.224730] [<9000000001fa4080>] tcp_register_congestion_control+0x2f0/0x4e8
[    0.224735] [<900000000256a8e4>] tcp_init+0x49c/0x4f0
[    0.224739] [<900000000256bdbc>] inet_init+0x240/0x328
[    0.224743] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.224747] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.224752] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.224757] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.224763] ---[ end trace ]---
[    0.224900] ------------[ cut here ]------------
[    0.224903] UBSAN: misaligned-access in net/mptcp/sched.c:44:2
[    0.224906] member access within misaligned address (____ptrval____) for type 'struct mptcp_sched_ops'
[    0.224910] which requires 64 byte alignment
[    0.224913] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    0.224916] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    0.224920] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    0.224927]         900000010025fa90 900000010025fa98 0000000000000000 900000010025fbd8
[    0.224934]         900000010025fbd0 900000010025fbd0 9000000100045ef8 0730073007300730
[    0.224940]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    0.224947]         00000000000006fe 0000000000000000 0000000000000000 0000000000000000
[    0.224954]         0755072d076e076f 0000000000000006 0000000007a08000 900000000296c000
[    0.224960]         0000000000000000 0000000000000000 9000000002805d80 900000010025fa98
[    0.224967]         900000000296c000 9000000003ea4f00 9000000003fd9990 9000000003ea4bc0
[    0.224973]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    0.224980]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    0.224986]         ...
[    0.224989] Call Trace:
[    0.224990] [<900000000023aba4>] show_stack+0x10c/0x228
[    0.224995] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    0.225000] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    0.225004] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    0.225008] [<900000000242d71c>] mptcp_register_scheduler+0x1f4/0x2f0
[    0.225013] [<900000000256f620>] mptcp_proto_init+0x1e4/0x244
[    0.225018] [<900000000256fccc>] mptcp_init+0x18/0x44
[    0.225022] [<900000000256bdbc>] inet_init+0x240/0x328
[    0.225026] [<9000000000235398>] do_one_initcall+0x90/0x538
[    0.225031] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    0.225035] [<90000000024c92a4>] kernel_init+0x24/0x120
[    0.225039] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    0.225045] ---[ end trace ]---
[    0.225105] MPTCP token hash table entries: 32768 (order: 5, 786432 bytes, linear)
[    0.225308] UDP hash table entries: 16384 (order: 6, 1048576 bytes, linear)
[    0.225652] UDP-Lite hash table entries: 16384 (order: 6, 1048576 bytes, linear)
[    0.226084] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.226095] NET: Registered PF_XDP protocol family
[    0.226136] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226140] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226143] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226146] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226149] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226151] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226154] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226157] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226159] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226162] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226165] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226167] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226170] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226173] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226175] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226178] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226181] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226183] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226186] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226188] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226191] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226193] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226196] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226198] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226201] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226204] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226206] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226209] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226211] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226214] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226216] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226219] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226222] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226224] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226227] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226229] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226232] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226234] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226237] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226240] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226242] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226245] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226247] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226250] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226252] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226255] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226257] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226260] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226262] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226265] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226268] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226270] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226273] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226275] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226278] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226280] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226283] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226285] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226288] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226290] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226293] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226296] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226298] pci 0000:00:04.1: EHCI: unrecognized capability ff
[    0.226301] pci 0000:00:04.1: EHCI: capability loop?
[    0.226322] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226326] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226329] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226331] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226334] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226336] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226339] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226342] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226344] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226347] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226350] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226352] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226355] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226357] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226360] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226363] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226365] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226368] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226370] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226373] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226375] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226378] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226380] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226383] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226386] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226388] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226391] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226393] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226396] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226398] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226401] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226403] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226406] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226408] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226411] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226413] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226416] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226418] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226421] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226423] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226426] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226428] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226431] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226433] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226436] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226439] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226441] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226444] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226446] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226449] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226451] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226454] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226456] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226459] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226461] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226464] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226466] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226469] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226471] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226474] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226476] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226479] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226482] pci 0000:00:05.1: EHCI: unrecognized capability ff
[    0.226484] pci 0000:00:05.1: EHCI: capability loop?
[    0.226522] PCI: CLS 0 bytes, default 64
[    0.226621] Trying to unpack rootfs image as initramfs...
[    0.231962] Initialise system trusted keyrings
[    0.231984] Key type blacklist registered
[    0.232073] workingset: timestamp_bits=40 max_order=21 bucket_order=0
[    0.232094] zbud: loaded
[    0.233464] fuse: init (API version 7.41)
[    0.233964] integrity: Platform Keyring initialized
[    0.233981] integrity: Machine keyring initialized
[    0.281633] Key type asymmetric registered
[    0.281649] Asymmetric key parser 'x509' registered
[    2.858767] ------------[ cut here ]------------
[    2.858790] UBSAN: misaligned-access in kernel/sched/fair.c:4165:21
[    2.858795] member access within misaligned address (____ptrval____) for type 'struct cfs_rq'
[    2.858802] which requires 64 byte alignment
[    2.858808] CPU: 3 UID: 0 PID: 0 Comm: swapper/3 Not tainted 6.13.0-rc7+ #2
[    2.858814] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    2.858820] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000100440000
[    2.858833]         9000000100217ba0 9000000100217ba8 0000000000000000 9000000100217ce8
[    2.858840]         9000000100217ce0 9000000100217ce0 9000000100045ef8 072007200720075b
[    2.858847]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    2.858854]         00000000000007ae 0000000000000000 0000000000000000 0000000000000000
[    2.858860]         0755072d076e076f 0000000000000006 0000000008608000 0000000000000000
[    2.858867]         0000000000000000 0000000000000000 9000000002805d80 9000000100217ba8
[    2.858874]         900000000296c000 900000000ac14958 0000000000000001 900000000ac14208
[    2.858880]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    2.858888]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    2.858894]         ...
[    2.858897] Call Trace:
[    2.858901] [<900000000023aba4>] show_stack+0x10c/0x228
[    2.858914] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    2.858921] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    2.858926] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    2.858934] [<90000000003c9bfc>] sched_balance_update_blocked_averages+0x1e14/0x21f8
[    2.858940] [<90000000003f6a2c>] sched_balance_softirq+0x6c/0x128
[    2.858946] [<90000000002f40cc>] handle_softirqs+0x1ec/0xaf0
[    2.858952] [<90000000002f4ccc>] __irq_exit_rcu+0x24c/0x4b8
[    2.858957] [<90000000024c4568>] do_vint+0xc8/0x198
[    2.858962] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[    2.858967] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[    2.858973] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[    2.858977] [<9000000000413344>] do_idle+0x124/0x258
[    2.858983] [<9000000000413954>] cpu_startup_entry+0x6c/0xa0
[    2.858988] [<9000000000256dc4>] start_secondary+0xb4/0xe0
[    2.858994] [<90000000024c9138>] smpboot_entry+0x68/0x6c

[    2.859002] ---[ end trace ]---
[    2.859004] ------------[ cut here ]------------
[    2.859007] UBSAN: misaligned-access in kernel/sched/fair.c:4165:25
[    2.859010] member access within misaligned address (____ptrval____) for type 'struct task_group'
[    2.859014] which requires 64 byte alignment
[    2.859022] CPU: 3 UID: 0 PID: 0 Comm: swapper/3 Not tainted 6.13.0-rc7+ #2
[    2.859029] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    2.859034] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000100440000
[    2.859043]         9000000100217ba0 9000000100217ba8 0000000000000000 9000000100217ce8
[    2.859050]         9000000100217ce0 9000000100217ce0 9000000100045ef8 072007200720075b
[    2.859057]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    2.859065]         00000000000007d2 0000000000000000 0000000000000000 0000000000000000
[    2.859072]         0755072d076e076f 0000000000000006 0000000008608000 0000000000000000
[    2.859079]         0000000000000000 0000000000000000 9000000002805d80 9000000100217ba8
[    2.859087]         900000000296c000 900000000ac14958 0000000000000001 900000000ac14208
[    2.859095]         0000000000000000 0000000000000000 900000000023aba4 0000000000000000
[    2.859102]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    2.859108]         ...
[    2.859111] Call Trace:
[    2.859112] [<900000000023aba4>] show_stack+0x10c/0x228
[    2.859118] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    2.859123] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    2.859127] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    2.859132] [<90000000003c9be0>] sched_balance_update_blocked_averages+0x1df8/0x21f8
[    2.859136] [<90000000003f6a2c>] sched_balance_softirq+0x6c/0x128
[    2.859139] [<90000000002f40cc>] handle_softirqs+0x1ec/0xaf0
[    2.859143] [<90000000002f4ccc>] __irq_exit_rcu+0x24c/0x4b8
[    2.859147] [<90000000024c4568>] do_vint+0xc8/0x198
[    2.859151] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[    2.859157] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[    2.859161] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[    2.859166] [<9000000000413344>] do_idle+0x124/0x258
[    2.859170] [<9000000000413954>] cpu_startup_entry+0x6c/0xa0
[    2.859174] [<9000000000256dc4>] start_secondary+0xb4/0xe0
[    2.859179] [<90000000024c9138>] smpboot_entry+0x68/0x6c

[    2.859185] ---[ end trace ]---
[    2.869895] Freeing initrd memory: 177600K
[    2.872054] ------------[ cut here ]------------
[    2.872067] ------------[ cut here ]------------
[    2.872067] UBSAN: misaligned-access in kernel/exit.c:773:2
[    2.872070] member access within misaligned address (____ptrval____) for type 'struct task_struct'
[    2.872074] UBSAN: misaligned-access in kernel/sched/cputime.c:341:3
[    2.872077] which requires 64 byte alignment
[    2.872079] member access within misaligned address (____ptrval____) for type 'struct task_struct'
[    2.872084] which requires 64 byte alignment
[    2.872083] CPU: 6 UID: 0 PID: 89 Comm: modprobe Not tainted 6.13.0-rc7+ #2
[    2.872089] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    2.872094] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010096c000
[    2.872104]         900000010096fb30 900000010096fb38 0000000000000000 900000010096fc78
[    2.872111]         900000010096fc70 900000010096fc70 9000000100045ef8 072007200720075b
[    2.872118]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    2.872124]         00000000000007fb 0000000000000000 0000000000000000 0000000000000000
[    2.872131]         0755072d076e076f 0000000000000006 0000000009208000 9000000002c740d8
[    2.872138]         0000000000000000 0000000000000000 9000000002805d80 900000010096fb38
[    2.872145]         900000000296c000 0000000000000010 90000001007f87a8 90000001009b3ed8
[    2.872151]         0000000000000000 0000000000000000 900000000023aba4 00007ffff136cf58
[    2.872158]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[    2.872165]         ...
[    2.872168] Call Trace:
[    2.872170] [<900000000023aba4>] show_stack+0x10c/0x228
[    2.872179] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    2.872185] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    2.872189] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    2.872196] [<90000000002ef18c>] do_exit+0x244c/0x28c0
[    2.872200] [<90000000002efaf0>] do_group_exit+0x70/0x2f8
[    2.872204] [<90000000002efd94>] sys_exit_group+0x1c/0x20
[    2.872207] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[    2.872216] ---[ end trace ]---
[    2.872217] CPU: 5 UID: 0 PID: 58 Comm: kworker/u35:0 Not tainted 6.13.0-rc7+ #2
[    2.872219] ------------[ cut here ]------------
[    2.872220] UBSAN: misaligned-access in kernel/exit.c:773:2
[    2.872222] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    2.872224] member access within misaligned address (____ptrval____) for type 'struct task_struct'
[    2.872226] Workqueue: events_unbound call_usermodehelper_exec_work
[    2.872231] which requires 64 byte alignment

[    2.872237] Stack : 900000010087f978 0000000000000000 900000000023aae8 900000010087c000
[    2.872245]         900000010087f740 900000010087f748 0000000000000000 900000010087f888
[    2.872252]         900000010087f880 900000010087f880 9000000100045ef8 0730073007300730
[    2.872259]         0720072007200720 0000000000000000 747e13a118945c77 fffffffffffffffe
[    2.872266]         0000000000000819 0000000000000000 0000000000000000 0000000000000000
[    2.872272]         0720072007200720 0000000000000006 0000000008e08000 900000010087f978
[    2.872279]         0000000000000000 0000000000000000 9000000002805d80 900000010087f748
[    2.872285]         900000000296c000 0000000000000000 9000000104c79e38 0000000000000038
[    2.872292]         900000010087f980 0000000000000000 900000000023aba4 0000000000000000
[    2.872298]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    2.872305]         ...
[    2.872308] Call Trace:
[    2.872309] [<900000000023aba4>] show_stack+0x10c/0x228
[    2.872315] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    2.872319] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    2.872324] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    2.872328] [<9000000000428400>] thread_group_cputime+0x420/0x878
[    2.872335] [<90000000004288ac>] thread_group_cputime_adjusted+0x54/0xe0
[    2.872340] [<90000000002e9d48>] wait_consider_task+0xad0/0x3498
[    2.872344] [<90000000002f0438>] __do_wait+0x408/0x828
[    2.872347] [<90000000002f0928>] do_wait+0xd0/0x480
[    2.872350] [<90000000002f1b5c>] kernel_wait+0x74/0x100
[    2.872354] [<9000000000335eb0>] call_usermodehelper_exec_work+0x120/0x268
[    2.872359] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[    2.872363] [<9000000000350d94>] worker_thread+0x314/0x1240
[    2.872367] [<9000000000367010>] kthread+0x1a0/0x3c0
[    2.872371] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    2.872378] ---[ end trace ]---
[    2.872378] CPU: 6 UID: 0 PID: 89 Comm: modprobe Not tainted 6.13.0-rc7+ #2
[    2.872383] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    2.872386] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010096c000
[    2.872393]         900000010096fb30 900000010096fb38 0000000000000000 900000010096fc78
[    2.872400]         900000010096fc70 900000010096fc70 9000000100045ef8 072007200720075b
[    2.872406]         0720072007200732 0000000000000000 747e13a118945c77 fffffffffffffffe
[    2.872413]         0000000000000838 0000000000000000 0000000000000000 0000000000000000
[    2.872420]         0755072d076e076f 0000000000000006 0000000009208000 9000000002c740d8
[    2.872426]         0000000000000000 0000000000000000 9000000002805d80 900000010096fb38
[    2.872433]         900000000296c000 0000000000000010 90000001007f87a8 90000001009b3ed8
[    2.872439]         900000010096f7d0 0000000000000000 900000000023aba4 00007ffff136cf58
[    2.872446]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[    2.872452]         ...
[    2.872455] Call Trace:
[    2.872456] [<900000000023aba4>] show_stack+0x10c/0x228
[    2.872461] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    2.872465] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    2.872469] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    2.872473] [<90000000002ef170>] do_exit+0x2430/0x28c0
[    2.872477] [<90000000002efaf0>] do_group_exit+0x70/0x2f8
[    2.872480] [<90000000002efd94>] sys_exit_group+0x1c/0x20
[    2.872484] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[    2.872489] ---[ end trace ]---
[    2.875007] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    2.875066] io scheduler mq-deadline registered
[    2.877076] ledtrig-cpu: registered to indicate activity on CPUs
[    2.878528] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    2.878649] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
[    2.879546] ACPI: button: Power Button [PWRF]
[    2.880282] Serial: 8250/16550 driver, 16 ports, IRQ sharing enabled
[    2.880377] 00:02: ttyS0 at MMIO 0x1fe001e0 (irq = 36, base_baud = 6250000) is a ST16650
[    2.900682] 00:03: ttyS1 at MMIO 0x10080000 (irq = 37, base_baud = 3125000) is a 16550A
[    2.920952] 00:04: ttyS2 at MMIO 0x10080100 (irq = 37, base_baud = 3125000) is a 16550A
[    2.941233] 00:05: ttyS3 at MMIO 0x10080200 (irq = 37, base_baud = 3125000) is a 16550A
[    2.961501] 00:06: ttyS4 at MMIO 0x10080300 (irq = 37, base_baud = 3125000) is a 16550A
[    2.963110] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 34,35
[    3.470221] i8042: Can't read CTR while initializing i8042
[    3.470227] i8042 i8042: probe with driver i8042 failed with error -5
[    3.470334] mousedev: PS/2 mouse device common for all mice
[    3.472414] rtc-efi rtc-efi.0: registered as rtc0
[    3.472862] rtc-efi rtc-efi.0: setting system clock to 2025-02-11T01:35:57 UTC (1739237757)
[    3.473045] efifb: probing for efifb
[    3.473057] efifb: framebuffer at 0xe8000000000, using 8112k, total 8100k
[    3.473061] efifb: mode is 1920x1080x32, linelength=7680, pages=1
[    3.473065] efifb: scrolling: redraw
[    3.473067] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    3.728456] Console: switching to colour frame buffer device 240x67
[    3.983941] fb0: EFI VGA frame buffer device
[    3.984844] ------------[ cut here ]------------
[    3.985679] UBSAN: misaligned-access in net/ipv4/tcp_cong.c:69:2
[    3.986771] member access within misaligned address (____ptrval____) for type 'struct tcp_congestion_ops'
[    3.988502] which requires 64 byte alignment
[    3.989274] CPU: 5 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    3.990533] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    3.993034] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[    3.994485]         900000010025fb20 900000010025fb28 0000000000000000 900000010025fc68
[    3.995937]         900000010025fc60 900000010025fc60 0000000000000000 0000000000000007
[    3.997417]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[    3.998867]         000000000000086d 0000000000000000 0000000000000000 0000000000000000
[    4.000317]         0000000000000000 0000000000000010 0000000008e08000 9000000003fcf480
[    4.001768]         0000000000000000 0000000000000000 9000000002805d80 900000010025fb28
[    4.003218]         900000000296c000 0000000000000000 ffffffffbb9b30f0 9000000002973018
[    4.004669]         900000000296c000 0000000000000000 900000000023aba4 0000000000000000
[    4.006119]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    4.007569]         ...
[    4.008011] Call Trace:
[    4.008012] [<900000000023aba4>] show_stack+0x10c/0x228
[    4.009397] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    4.010375] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    4.011335] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    4.012611] [<9000000001fa3f04>] tcp_register_congestion_control+0x174/0x4e8
[    4.013916] [<9000000000235398>] do_one_initcall+0x90/0x538
[    4.014925] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    4.016029] [<90000000024c92a4>] kernel_init+0x24/0x120
[    4.016975] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    4.018336] ---[ end trace ]---
[    4.019213] NET: Registered PF_INET6 protocol family
[    4.024072] Segment Routing with IPv6
[    4.024751] In-situ OAM (IOAM) with IPv6
[    4.025477] mip6: Mobile IPv6
[    4.026016] NET: Registered PF_PACKET protocol family
[    4.026964] mpls_gso: MPLS GSO support
[    4.028291] ACPI S3 supported with Loongson ACPI SADR extension
[    4.031660] registered taskstats version 1
[    4.032460] Loading compiled-in X.509 certificates
[    4.051846] Loaded X.509 cert 'Build time autogenerated kernel key: b2357c66d0b90c6723ed6444f3205ee5d92620ed'
[    4.056280] Demotion targets for Node 0: null
[    4.057407] Key type .fscrypt registered
[    4.114190] Key type fscrypt-provisioning registered
[    4.184316] Key type encrypted registered
[    4.239774] AppArmor: AppArmor sha256 policy hashing enabled
[    4.312369] ima: No TPM chip found, activating TPM-bypass!
[    4.367674] ima: Allocated hash algorithm: sha256
[    4.422514] ima: No architecture policies found
[    4.476894] evm: Initialising EVM extended attributes:
[    4.531009] evm: security.selinux
[    4.584374] evm: security.SMACK64 (disabled)
[    4.637221] evm: security.SMACK64EXEC (disabled)
[    4.689424] evm: security.SMACK64TRANSMUTE (disabled)
[    4.740970] evm: security.SMACK64MMAP (disabled)
[    4.791710] evm: security.apparmor
[    4.841811] evm: security.ima
[    4.891231] evm: security.capability
[    4.940072] evm: HMAC attrs: 0x1
[    4.988492] ------------[ cut here ]------------
[    5.037065] UBSAN: misaligned-access in kernel/sched/fair.c:9517:2
[    5.085764] member access within misaligned address (____ptrval____) for type 'struct task_struct'
[    5.135750] which requires 64 byte alignment
[    5.185452] CPU: 4 UID: 0 PID: 37 Comm: migration/4 Not tainted 6.13.0-rc7+ #2
[    5.235832] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    5.288965] Stopper: active_load_balance_cpu_stop+0x0/0xe88 <- sched_balance_rq+0x10ac/0x2bd0
[    5.342729] Stack : 0000000000000051 0000000000000000 900000000023aae8 9000000100504000
[    5.396775]         9000000100507a30 9000000100507a38 0000000000000000 9000000100507b78
[    5.450459]         9000000100507b70 9000000100507b70 0000000000000040 0000000000000000
[    5.503828]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[    5.557121]         00000000000008a7 0000000000000000 0000000000000000 0000000000000000
[    5.609666]         0000000000000000 0000000000000010 0000000008a08000 0000000000000000
[    5.660964]         0000000000000000 0000000000000000 9000000002805d80 9000000100507a38
[    5.711551]         900000000296c000 900000000296c1d8 0000000000000002 900000000b014af0
[    5.760392]         9000000100507c70 0000000000000000 900000000023aba4 0000000000000000
[    5.807587]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    5.854625]         ...
[    5.901468] Call Trace:
[    5.901469] [<900000000023aba4>] show_stack+0x10c/0x228
[    5.994698] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    6.041748] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    6.088971] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    6.136885] [<90000000003d8078>] active_load_balance_cpu_stop+0xd90/0xe88
[    6.185127] [<9000000000636164>] cpu_stopper_thread+0x1c4/0x828
[    6.233652] [<9000000000378b1c>] smpboot_thread_fn+0x19c/0x840
[    6.281740] [<9000000000367010>] kthread+0x1a0/0x3c0
[    6.330028] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    6.426607] ---[ end trace ]---
[    6.475888] ------------[ cut here ]------------
[    6.478822] ------------[ cut here ]------------
[    6.524278] UBSAN: misaligned-access in kernel/workqueue.c:3862:2
[    6.524282] member access within misaligned address (____ptrval____) for type 'struct pool_workqueue'
[    6.524284] which requires 256 byte alignment
[    6.571987] UBSAN: misaligned-access in crypto/drbg.c:280:19
[    6.620087] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[    6.620091] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    6.669562] member access within misaligned address (____ptrval____) for type 'struct s'
[    6.718949] Stack : 000000000000008e
[    6.768756] which requires 4 byte alignment
[    6.818894]  0000000000000000 900000000023aae8 900000010025c000
[    6.978747] ------------[ cut here ]------------

[    7.033471] UBSAN: misaligned-access in kernel/sched/fair.c:9797:2
[    7.087954]        
[    7.142415] member access within misaligned address (____ptrval____) for type 'struct cfs_rq'
[    7.196181]  900000010025f930
[    7.250875] which requires 64 byte alignment
[    7.274747] ------------[ cut here ]------------
[    7.274750] UBSAN: misaligned-access in kernel/sched/fair.c:9797:2
[    7.274752] member access within misaligned address (____ptrval____) for type 'struct cfs_rq'
[    7.274754] which requires 64 byte alignment
[    7.304925]  900000010025f938 0000000000000000 900000010025fa78
[    7.744509]         900000010025fa70 900000010025fa70 0000000000000040 0000000000000000
[    7.800899]         0000000000000000 0000000000000000 747e13a118945c77 0000000000000001
[    7.857295]         9000000003f3aab8 0000000000aaaaaa ffff8000339d8220 000000000000001f
[    7.913540]         0000000000000000 0000000000000010 0000000008208000 0000000000000004
[    7.969685]         0000000000000000 0000000000000000 9000000002805d80 900000010025f938
[    8.025781]         900000000296c000 0000000000000000 0000000000000001 0000000000000000
[    8.081947]         0000000000000001 0000000000000000 900000000023aba4 00007fffeff9cf58
[    8.138238]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    8.194549]         ...
[    8.250538] Call Trace:
[    8.250540] [<900000000023aba4>] show_stack+0x10c/0x228
[    8.363626] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[    8.420775] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[    8.477770] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[    8.534948] [<900000000033e9a0>] flush_workqueue_prep_pwqs+0x3c8/0x980
[    8.591524] [<900000000033f1c8>] __flush_workqueue+0x270/0x1218
[    8.647358] [<9000000000340230>] drain_workqueue+0xc0/0x848
[    8.702765] [<9000000000357130>] destroy_workqueue+0xb0/0xb50
[    8.756427] [<900000000251cdf4>] trace_eval_sync+0x18/0x30
[    8.808473] [<9000000000235398>] do_one_initcall+0x90/0x538
[    8.859747] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[    8.911117] [<90000000024c92a4>] kernel_init+0x24/0x120
[    8.962520] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[    9.064835] ---[ end trace ]---
[    9.064835] CPU: 3 UID: 0 PID: 146 Comm: cryptomgr_test Not tainted 6.13.0-rc7+ #2
[    9.168989] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[    9.224702] Stack : 000000000000008e 0000000000000000 900000000023aae8 90000001042c4000
[    9.281027]         90000001042c7640 90000001042c7648 0000000000000000 90000001042c7788
[    9.337611]         90000001042c7780 90000001042c7780 0000000000000040 0000000000000000
[    9.393419]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[    9.449820]         00000000000008f1 0000000000000000 0000000000000000 0000000000000000
[    9.506158]         0000000000000000 0000000000000010 0000000008608000 900000000296c000
[    9.562354]         0000000000000000 0000000000000000 9000000002805d80 90000001042c7648
[    9.618380]         900000000296c000 90000001042c78f8 9000000123402cc0 900000000296c000
[    9.674093]         90000001042c78f8 0000000000000000 900000000023aba4 00007ffff160cf58
[    9.729678]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[    9.785055]         ...
[    9.839844] Call Trace:
[    9.839845] [<900000000023aba4>] show_stack+0x10c/0x228
[    9.949324] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   10.003883] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   10.058615] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   10.113919] [<9000000001201ea4>] drbg_hash_df+0xcc/0x3f8
[   10.169667] [<9000000001202fb4>] drbg_hash_update+0x124/0x8a8
[   10.224983] [<900000000120667c>] drbg_seed+0x28c/0x7d8
[   10.279385] [<9000000001207ecc>] drbg_kcapi_seed+0x42c/0x1130
[   10.333112] [<90000000011fea08>] crypto_rng_reset+0x58/0x128
[   10.386509] [<90000000011de598>] drbg_cavs_test+0x158/0x978
[   10.439451] [<90000000011dee48>] alg_test_drbg+0x90/0x118
[   10.490677] [<90000000011e7768>] alg_test+0x240/0xbc8
[   10.539971] [<90000000011da340>] cryptomgr_test+0x40/0xc8
[   10.588623] [<9000000000367010>] kthread+0x1a0/0x3c0
[   10.637214] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[   10.733558] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[   10.733561] ---[ end trace ]---
[   10.831080] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   10.882778] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000000294c000
[   10.934369]         900000010020bba0 900000010020bba8 0000000000000000 900000010020bce8
[   10.985360]         900000010020bce0 900000010020bce0 0000000000000040 0000000000000000
[   11.036045]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[   11.086929]         0000000000000910 0000000000000000 0000000000000000 0000000000000000
[   11.137548]         0000000000000000 0000000000000010 0000000007a08000 0000000000000000
[   11.187176]         0000000000000000 0000000000000000 9000000002805d80 900000010020bba8
[   11.235894]         900000000296c000 0000000000000001 90000000025f8588 9000000002960080
[   11.284155]         900000000a014040 0000000000000000 900000000023aba4 00007ffff349cf58
[   11.331881]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[   11.379533]         ...
[   11.426677] Call Trace:
[   11.426679] [<900000000023aba4>] show_stack+0x10c/0x228
[   11.521353] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   11.569170] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   11.616989] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   11.665516] [<90000000003c975c>] sched_balance_update_blocked_averages+0x1974/0x21f8
[   11.713979] [<90000000003f6a2c>] sched_balance_softirq+0x6c/0x128
[   11.762648] [<90000000002f40cc>] handle_softirqs+0x1ec/0xaf0
[   11.811140] [<90000000002f4ccc>] __irq_exit_rcu+0x24c/0x4b8
[   11.859690] [<90000000024c4568>] do_vint+0xc8/0x198
[   11.908157] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[   11.956571] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[   12.004706] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[   12.052824] [<9000000000413344>] do_idle+0x124/0x258
[   12.100737] [<9000000000413954>] cpu_startup_entry+0x6c/0xa0
[   12.148807] [<90000000024c9280>] kernel_init+0x0/0x120
[   12.196748] [<90000000025014dc>] console_on_rootfs+0x0/0x74
[   12.244816] [<90000000024c90cc>] kernel_entry+0xcc/0xd0

[   12.340322] ---[ end trace ]---
[   12.340322] CPU: 7 UID: 0 PID: 0 Comm: swapper/7 Not tainted 6.13.0-rc7+ #2
[   12.387885] ------------[ cut here ]------------
[   12.436029] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   12.436031] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000100450000
[   12.436036]         9000000100227ba0 9000000100227ba8 0000000000000000 9000000100227ce8
[   12.484470] UBSAN: misaligned-access in kernel/workqueue.c:4115:2
[   12.535852]         9000000100227ce0 9000000100227ce0 90000000080c8e70 6572617764726148
[   12.586028] member access within misaligned address (____ptrval____) for type 'struct pool_workqueue'

[   12.634562]         203a656d616e2065 0000000000000000
[   12.683337] which requires 256 byte alignment
[   12.733350]  747e13a118945c77 0000000000000001
[   12.733353]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   13.040706]         000000000000001f 9000000003f3aa60 0000000009608000 0000000000000000
[   13.092973]         0000000000000000 0000000000000000 9000000002805d80 9000000100227ba8
[   13.144594]         900000000296c000 0000000000000001 900000000bc14958 9000000002960080
[   13.196385]         900000000bc14040 0000000000000000 900000000023aba4 00007ffff276cf58
[   13.247959]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[   13.299612]         ...
[   13.350805] Call Trace:
[   13.350806] [<900000000023aba4>] show_stack+0x10c/0x228
[   13.452425] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   13.503460] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   13.554449] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   13.606144] [<90000000003c973c>] sched_balance_update_blocked_averages+0x1954/0x21f8
[   13.658314] [<90000000003f6a2c>] sched_balance_softirq+0x6c/0x128
[   13.710354] [<90000000002f40cc>] handle_softirqs+0x1ec/0xaf0
[   13.762368] [<90000000002f4ccc>] __irq_exit_rcu+0x24c/0x4b8
[   13.814474] [<90000000024c4568>] do_vint+0xc8/0x198
[   13.866563] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[   13.918811] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[   13.970974] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[   14.022875] [<9000000000413344>] do_idle+0x124/0x258
[   14.074293] [<9000000000413950>] cpu_startup_entry+0x68/0xa0
[   14.125473] [<9000000000256dc4>] start_secondary+0xb4/0xe0
[   14.174988] [<90000000024c9138>] smpboot_entry+0x68/0x6c

[   14.270179] ---[ end trace ]---
[   14.270180] CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[   14.366299] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   14.417696] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[   14.470053]         900000010025fa90 900000010025fa98 0000000000000000 900000010025fbd8
[   14.522694]         900000010025fbd0 900000010025fbd0 0000000000000040 0000000000000000
[   14.575257]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[   14.628135]         0000000000000957 0000000000000000 0000000000000000 0000000000000000
[   14.681173]         0000000000000000 0000000000000010 0000000008a08000 ffffffffc28f5c29
[   14.733545]         0000000000000000 0000000000000000 9000000002805d80 900000010025fa98
[   14.786149]         900000000296c000 0000000000000004 900000010070fe20 0000000000000000
[   14.838433]         000000000000000a 0000000000000000 900000000023aba4 0000000000000000
[   14.890606]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[   14.942606]         ...
[   14.993816] Call Trace:
[   14.993818] [<900000000023aba4>] show_stack+0x10c/0x228
[   15.095324] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   15.146175] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   15.196994] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   15.248362] [<9000000000340400>] drain_workqueue+0x290/0x848
[   15.299760] [<9000000000357130>] destroy_workqueue+0xb0/0xb50
[   15.351158] [<900000000251cdf4>] trace_eval_sync+0x18/0x30
[   15.402511] [<9000000000235398>] do_one_initcall+0x90/0x538
[   15.453847] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[   15.505280] [<90000000024c92a4>] kernel_init+0x24/0x120
[   15.556479] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[   15.658928] ---[ end trace ]---
[   15.709822] ------------[ cut here ]------------
[   15.709824] UBSAN: misaligned-access in kernel/workqueue.c:5878:2
[   15.709826] member access within misaligned address (____ptrval____) for type 'struct pool_workqueue'
[   15.709827] which requires 256 byte alignment
[   15.709829] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[   15.709831] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   15.709832] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010025c000
[   16.071122]         900000010025fb20 900000010025fb28 0000000000000000 900000010025fc68
[   16.123106]         900000010025fc60 900000010025fc60 90000000080ca078 6572617764726148
[   16.174115]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   16.224634]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   16.275222]         000000000000001f 9000000003f3aa60 0000000008208000 900000010070fd78
[   16.325572]         0000000000000000 0000000000000000 9000000002805d80 900000010025fb28
[   16.375687]         900000000296c000 0000000000000000 9000000002c5fa58 900000010070fe20
[   16.425078]         900000000296c000 0000000000000000 900000000023aba4 00007ffff292cf58
[   16.474471]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[   16.523894]         ...
[   16.572980] Call Trace:
[   16.572982] [<900000000023aba4>] show_stack+0x10c/0x228
[   16.671396] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   16.720317] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   16.769454] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   16.819048] [<9000000000357a8c>] destroy_workqueue+0xa0c/0xb50
[   16.868845] [<900000000251cdf4>] trace_eval_sync+0x18/0x30
[   16.918686] [<9000000000235398>] do_one_initcall+0x90/0x538
[   16.968249] [<9000000002501bf8>] kernel_init_freeable+0x6a8/0x730
[   17.017545] [<90000000024c92a4>] kernel_init+0x24/0x120
[   17.066477] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[   17.164371] ---[ end trace ]---
[   17.213156] clk: Disabling unused clocks
[   17.262690] Freeing unused kernel image (initmem) memory: 1088K
[   17.312080] This architecture does not have kernel memory protection.
[   17.361927] Run /init as init process
[   17.411592]   with arguments:
[   17.411594]     /init
[   17.411596]     verbose
[   17.411598]   with environment:
[   17.411599]     HOME=/
[   17.411600]     TERM=linux
[   17.411601]     BOOT_IMAGE=/boot/vmlinuz-6.13.0-rc7+
[   17.412047] ------------[ cut here ]------------
[   17.461952] UBSAN: misaligned-access in kernel/signal.c:4318:4
[   17.512329] member access within misaligned address (____ptrval____) for type 'struct task_struct'
[   17.564039] which requires 64 byte alignment
[   17.615449] CPU: 3 UID: 0 PID: 1 Comm: init Not tainted 6.13.0-rc7+ #2
[   17.667900] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   17.723038] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[   17.777033]         900000010025f7a0 900000010025f7a8 0000000000000000 900000010025f8e8
[   17.829454]         900000010025f8e0 900000010025f8e0 0000000000000040 0000000000000000
[   17.881564]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[   17.934144]         000000000000099f 0000000000000000 0000000000000000 0000000000000000
[   17.986552]         0000000000000000 0000000000000010 0000000008608000 0000000000000003
[   18.038522]         0000000000000000 0000000000000000 9000000002805d80 900000010025f7a8
[   18.090380]         900000000296c000 900000000296c000 9000000100429f90 900000010025f9e0
[   18.142177]         0000000000000000 0000000000000000 900000000023aba4 0000555575a09358
[   18.194188]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[   18.246250]         ...
[   18.298092] Call Trace:
[   18.298093] [<900000000023aba4>] show_stack+0x10c/0x228
[   18.401093] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   18.452823] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   18.504570] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   18.556960] [<9000000000325458>] do_sigaction+0x7c0/0x1158
[   18.609139] [<9000000000326714>] sys_rt_sigaction+0x1ec/0x390
[   18.661041] [<90000000024c659c>] do_syscall+0x11c/0x3b8
[   18.712912] [<900000000032669c>] sys_rt_sigaction+0x174/0x390
[   18.764812] [<90000000024c65f8>] do_syscall+0x178/0x3b8

[   18.868020] ---[ end trace ]---
[   18.919668] ------------[ cut here ]------------
[   18.971376] UBSAN: misaligned-access in kernel/exit.c:1538:2
[   19.023194] member access within misaligned address (____ptrval____) for type 'struct task_struct'
[   19.076669] which requires 64 byte alignment
[   19.130020] CPU: 3 UID: 0 PID: 1 Comm: init Not tainted 6.13.0-rc7+ #2
[   19.183905] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   19.240105] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[   19.296134]         900000010025f710 900000010025f718 0000000000000000 900000010025f858
[   19.351810]         900000010025f850 900000010025f850 0000000000000040 0000000000000000
[   19.405586]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[   19.458103]         00000000000009bc 0000000000000000 0000000000000000 0000000000000000
[   19.510620]         0000000000000000 0000000000000010 0000000008608000 9000000100381688
[   19.562986]         0000000000000000 0000000000000000 9000000002805d80 900000010025f718
[   19.614749]         900000000296c000 0000000020000000 9000000100381130 9000000100381688
[   19.666312]         0000000000000030 0000000000000000 900000000023aba4 0000555575a0582c
[   19.717901]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   19.769557]         ...
[   19.820991] Call Trace:
[   19.820992] [<900000000023aba4>] show_stack+0x10c/0x228
[   19.924309] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   19.975665] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   20.027254] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   20.079349] [<90000000002f0170>] __do_wait+0x140/0x828
[   20.131503] [<90000000002f0928>] do_wait+0xd0/0x480
[   20.183594] [<90000000002f16d4>] kernel_wait4+0xe4/0x2f0
[   20.234762] random: crng init done
[   20.235405] [<90000000002f1a34>] __do_sys_wait4+0x154/0x208
[   20.338847] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   20.442393] ---[ end trace ]---
[   20.494063] ------------[ cut here ]------------
[   20.545905] UBSAN: misaligned-access in kernel/exit.c:1552:2
[   20.597874] member access within misaligned address 0000000010f805eb for type 'struct task_struct'
[   20.651434] which requires 64 byte alignment
[   20.705019] CPU: 3 UID: 0 PID: 1 Comm: init Not tainted 6.13.0-rc7+ #2
[   20.759138] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   20.815927] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[   20.872981]         900000010025f710 900000010025f718 0000000000000000 900000010025f858
[   20.929977]         900000010025f850 900000010025f850 0000000000000040 0000000000000000
[   20.986455]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[   21.042366]         00000000000009da 0000000000000000 0000000000000000 0000000000000000
[   21.097621]         0000000000000000 0000000000000010 0000000008608000 9000000100381130
[   21.152253]         0000000000000000 0000000000000000 9000000002805d80 900000010025f718
[   21.204884]         900000000296c000 0000000020000000 90000001003816b0 9000000100381688
[   21.255710]         0000000000000030 0000000000000000 900000000023aba4 0000555575a0582c
[   21.306467]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   21.357337]         ...
[   21.407484] Call Trace:
[   21.407485] [<900000000023aba4>] show_stack+0x10c/0x228
[   21.507955] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   21.558791] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   21.609705] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   21.661183] [<90000000002f04d0>] __do_wait+0x4a0/0x828
[   21.712757] [<90000000002f0928>] do_wait+0xd0/0x480
[   21.763655] [<90000000002f16d4>] kernel_wait4+0xe4/0x2f0
[   21.814853] [<90000000002f1a34>] __do_sys_wait4+0x154/0x208
[   21.865939] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   21.967997] ---[ end trace ]---
[   22.018625] ------------[ cut here ]------------
[   22.069257] UBSAN: misaligned-access in kernel/exit.c:1538:2
[   22.120312] member access within misaligned address 0000000010f805eb for type 'struct task_struct'
[   22.172720] which requires 64 byte alignment
[   22.225048] CPU: 2 UID: 0 PID: 1 Comm: init Not tainted 6.13.0-rc7+ #2
[   22.278190] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   22.334207] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[   22.390997]         900000010025f9f0 900000010025f9f8 0000000000000000 900000010025fb38
[   22.447774]         900000010025fb30 900000010025fb30 0000000000000040 0000000000000000
[   22.504078]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[   22.559799]         00000000000009f7 0000000000000000 0000000000000000 0000000000000000
[   22.614840]         0000000000000000 0000000000000010 0000000008208000 9000000100381688
[   22.669232]         0000000000000000 0000000000000000 9000000002805d80 900000010025f9f8
[   22.721611]         900000000296c000 0000000020000000 9000000100381130 0000000000000000
[   22.772261]         0000000000000030 0000000000000000 900000000023aba4 00007ffff292cf58
[   22.822803]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[   22.873438]         ...
[   22.923332] Call Trace:
[   22.923333] [<900000000023aba4>] show_stack+0x10c/0x228
[   23.023144] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   23.073665] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   23.124262] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   23.175491] [<90000000002f0498>] __do_wait+0x468/0x828
[   23.226781] [<90000000002f0928>] do_wait+0xd0/0x480
[   23.277378] [<90000000002f16d4>] kernel_wait4+0xe4/0x2f0
[   23.328276] [<90000000002f1a34>] __do_sys_wait4+0x154/0x208
[   23.379062] [<90000000024c659c>] do_syscall+0x11c/0x3b8
[   23.429970] [<90000000002376bc>] handle_syscall+0xbc/0x158

[   23.531155] ---[ end trace ]---
[   23.697295] ------------[ cut here ]------------
[   23.697435] ------------[ cut here ]------------
[   23.747676] UBSAN: misaligned-access in kernel/sched/autogroup.c:184:2
[   23.797283] UBSAN: misaligned-access in kernel/exit.c:579:2
[   23.847629] member access within misaligned address 00000000c20c7da7 for type 'struct task_struct'
[   23.897506] member access within misaligned address 00000000865f600f for type 'struct task_struct'
[   23.948967] which requires 64 byte alignment
[   24.000051] which requires 64 byte alignment
[   24.050804] CPU: 4 UID: 0 PID: 214 Comm: systemd-udevd Not tainted 6.13.0-rc7+ #2
[   24.150204] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   24.202469] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000101750000
[   24.253591]         9000000101753760 9000000101753768 0000000000000000 90000001017538a8
[   24.303157]         90000001017538a0 90000001017538a0 0000000000000040 0000000000000000
[   24.352453]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[   24.402271]         0000000000000a19 0000000000000000 0000000000000000 0000000000000000
[   24.451912]         0000000000000000 0000000000000010 0000000008a08000 9000000101753ec0
[   24.501211]         0000000000000000 0000000000000000 9000000002805d80 9000000101753768
[   24.550429]         900000000296c000 0000000000000000 900000000296c000 900000014c497018
[   24.599695]         0000000000000000 0000000000000000 900000000023aba4 00005555574ef6c0
[   24.649034]         00000000000000b0 0000000000000007 0000000000000000 0000000000071c1d
[   24.698286]         ...
[   24.747185] Call Trace:
[   24.747186] [<900000000023aba4>] show_stack+0x10c/0x228
[   24.844264] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   24.893060] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   24.941907] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   24.991400] [<90000000004441f0>] autogroup_move_group+0x2f8/0x578
[   25.040730] [<900000000044453c>] sched_autogroup_create_attach+0xcc/0x240
[   25.090105] [<90000000003309f8>] ksys_setsid+0x188/0x350
[   25.139519] [<9000000000330bd4>] sys_setsid+0x14/0x20
[   25.188938] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   25.287228] ---[ end trace ]---
[   25.287229] CPU: 1 UID: 0 PID: 213 Comm: systemd-udevd Not tainted 6.13.0-rc7+ #2
[   25.386210] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   25.439211] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000145a30000
[   25.492528]         9000000145a337b0 9000000145a337b8 0000000000000000 9000000145a338f8
[   25.545139]         9000000145a338f0 9000000145a338f0 0000000000000040 0000000000000000
[   25.596762]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[   25.648291]         0000000000000a32 0000000000000000 0000000000000000 0000000000000000
[   25.698185]         0000000000000000 0000000000000010 0000000007e08000 9000000002c740d8
[   25.746178]         0000000000000000 0000000000000000 9000000002805d80 9000000145a337b8
[   25.793899]         900000000296c000 0000000000000000 0000000000000000 900000014c6383d8
[   25.841639]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0bfc008
[   25.889004]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[   25.936161]         ...
[   25.983079] Call Trace:
[   25.983080] [<900000000023aba4>] show_stack+0x10c/0x228
[   26.077624] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   26.125300] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   26.173052] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   26.220824] [<90000000002e6754>] find_alive_thread+0xd4/0x198
[   26.268999] [<90000000002ed3ec>] do_exit+0x6ac/0x28c0
[   26.316953] [<90000000002efaf0>] do_group_exit+0x70/0x2f8
[   26.364974] [<90000000002efd94>] sys_exit_group+0x1c/0x20
[   26.412986] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   26.507659] ---[ end trace ]---
[   26.554796] ------------[ cut here ]------------
[   26.602281] UBSAN: misaligned-access in kernel/exit.c:706:3
[   26.650269] member access within misaligned address 00000000c20c7da7 for type 'struct task_struct'
[   26.699576] which requires 64 byte alignment
[   26.748805] CPU: 1 UID: 0 PID: 213 Comm: systemd-udevd Not tainted 6.13.0-rc7+ #2
[   26.798962] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   26.852171] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000145a30000
[   26.906038]         9000000145a337f0 9000000145a337f8 0000000000000000 9000000145a33938
[   26.959998]         9000000145a33930 9000000145a33930 0000000000000040 0000000000000000
[   27.013489]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[   27.067841]         0000000000000a4f 0000000000000000 0000000000000000 0000000000000000
[   27.121880]         0000000000000000 0000000000000010 0000000007e08000 9000000100381140
[   27.175765]         0000000000000000 0000000000000000 9000000002805d80 9000000145a337f8
[   27.228644]         900000000296c000 0000000000000001 0000000000000000 900000014c496a40
[   27.281727]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0bfc008
[   27.333946]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[   27.386489]         ...
[   27.438011] Call Trace:
[   27.438012] [<900000000023aba4>] show_stack+0x10c/0x228
[   27.536123] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   27.584474] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   27.633011] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   27.681880] [<90000000002edfc4>] do_exit+0x1284/0x28c0
[   27.730577] [<90000000002efaf0>] do_group_exit+0x70/0x2f8
[   27.779491] [<90000000002efd94>] sys_exit_group+0x1c/0x20
[   27.828677] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   27.927009] ---[ end trace ]---
[   27.976190] ------------[ cut here ]------------
[   28.025137] UBSAN: misaligned-access in kernel/exit.c:705:2
[   28.074838] member access within misaligned address 000000004a062849 for type 'struct task_struct'
[   28.125769] which requires 64 byte alignment
[   28.176774] CPU: 1 UID: 0 PID: 213 Comm: systemd-udevd Not tainted 6.13.0-rc7+ #2
[   28.228962] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   28.283769] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000145a30000
[   28.338849]         9000000145a337f0 9000000145a337f8 0000000000000000 9000000145a33938
[   28.393830]         9000000145a33930 9000000145a33930 0000000000000040 0000000000000000
[   28.448342]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[   28.503261]         0000000000000a6b 0000000000000000 0000000000000000 0000000000000000
[   28.558321]         0000000000000000 0000000000000010 0000000007e08000 9000000100381140
[   28.612928]         0000000000000000 0000000000000000 9000000002805d80 9000000145a337f8
[   28.667546]         900000000296c000 0000000000000001 0000000000000030 900000014c637b70
[   28.721506]         900000010180e300 0000000000000000 900000000023aba4 00007ffff0bfc008
[   28.773709]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[   28.824238]         ...
[   28.874186] Call Trace:
[   28.874187] [<900000000023aba4>] show_stack+0x10c/0x228
[   28.974154] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.024074] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.074187] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.125099] [<90000000002ef4ec>] do_exit+0x27ac/0x28c0
[   29.176200] [<90000000002efaf0>] do_group_exit+0x70/0x2f8
[   29.227348] [<90000000002efd94>] sys_exit_group+0x1c/0x20
[   29.278605] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.379799] ---[ end trace ]---
[   29.505585] ------------[ cut here ]------------
[   29.506219] ------------[ cut here ]------------
[   29.510056] ------------[ cut here ]------------
[   29.510061] UBSAN: misaligned-access in kernel/module/main.c:3211:45
[   29.510064] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.510068] which requires 64 byte alignment
[   29.510071] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.510075] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.510077] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.510086]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.510091]         900000014c043750 900000014c043750 90000000080ce958 6572617764726148
[   29.510095]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.510098]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.510102]         000000000000001f 9000000003f3aa60 0000000008608000 ffff80003315f7c8
[   29.510106]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.510109]         900000000296c000 ffff800033155dcd 0000000000000021 9000000002d9cbf0
[   29.510114]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0080070
[   29.510121]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[   29.510127]         ...
[   29.510132] Call Trace:
[   29.510133] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.510142] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.510147] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.510151] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.510157] [<900000000055406c>] load_module+0x54d4/0x5d30
[   29.510163] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.510167] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.510172] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.510180] ---[ end trace ]---
[   29.510182] ------------[ cut here ]------------
[   29.510183] UBSAN: misaligned-access in kernel/module/main.c:387:2
[   29.510185] member access within misaligned address 00000000b7f2f1ff for type 'struct module'
[   29.510188] which requires 64 byte alignment
[   29.510189] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.510192] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.510194] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.510200]         900000014c043530 900000014c043538 0000000000000000 900000014c043678
[   29.510206]         900000014c043670 900000014c043670 90000000080cf100 6572617764726148
[   29.510212]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.510217]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.510223]         000000000000001f 9000000003f3aa60 0000000008608000 9000000002d9d750
[   29.510229]         0000000000000000 0000000000000000 9000000002805d80 900000014c043538
[   29.510235]         900000000296c000 ffff800033155dcd ffff8000331572fb 9000000002d9dbf0
[   29.510241]         0000000000000010 0000000000000000 900000000023aba4 00007ffff0080070
[   29.510246]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[   29.510252]         ...
[   29.510254] Call Trace:
[   29.510255] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.510259] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.510263] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.510266] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.510271] [<900000000054ce14>] find_module_all+0x1e4/0x220
[   29.510275] [<900000000054cf98>] module_patient_check_exists.isra.0+0x40/0x268
[   29.510279] [<900000000054f338>] load_module+0x7a0/0x5d30
[   29.510283] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.510287] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.510291] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.510296] ---[ end trace ]---
[   29.510299] ------------[ cut here ]------------
[   29.510300] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:115:24
[   29.510302] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.510304] which requires 64 byte alignment
[   29.510306] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.510308] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.510309] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.510313]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.510317]         900000014c043680 900000014c043680 90000000080cf948 6572617764726148
[   29.510320]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.510324]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.510327]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000000
[   29.510331]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.510334]         900000000296c000 0000000000000023 ffff800033154000 0000000000000000
[   29.510337]         ffff80003315f660 0000000000000000 900000000023aba4 00007ffff0080070
[   29.510341]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[   29.510344]         ...
[   29.510346] Call Trace:
[   29.510347] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.510349] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.510351] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.510354] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.510357] [<9000000000252c9c>] module_frob_arch_sections+0x61c/0xfe0
[   29.510360] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.510363] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.510365] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.510368] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.510371] ---[ end trace ]---
[   29.510372] ------------[ cut here ]------------
[   29.510373] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:117:24
[   29.510374] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.510375] which requires 64 byte alignment
[   29.510376] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.510377] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.510378] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.510382]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.510386]         900000014c043680 900000014c043680 90000000080d0148 6572617764726148
[   29.510389]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.510393]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.510396]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000000
[   29.510400]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.510403]         900000000296c000 0000000000000023 ffff800033154000 0000000000000000
[   29.510406]         ffff80003315f660 0000000000000000 900000000023aba4 00007ffff0080070
[   29.510410]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[   29.510413]         ...
[   29.510415] Call Trace:
[   29.510416] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.510417] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.510420] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.510423] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.510425] [<9000000000253148>] module_frob_arch_sections+0xac8/0xfe0
[   29.510428] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.510430] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.510433] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.510435] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.510439] ---[ end trace ]---
[   29.510441] ------------[ cut here ]------------
[   29.510442] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:119:28
[   29.510444] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.510446] which requires 64 byte alignment
[   29.510448] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.510450] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.510452] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.510458]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.510464]         900000014c043680 900000014c043680 90000000080d0948 6572617764726148
[   29.510470]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.510476]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.510482]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000000
[   29.510488]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.510494]         900000000296c000 0000000000000023 ffff800033154000 0000000000000000
[   29.510501]         ffff80003315f660 0000000000000000 900000000023aba4 00007ffff0080070
[   29.510507]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[   29.510513]         ...
[   29.510515] Call Trace:
[   29.510517] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.510520] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.510524] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.510528] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.510532] [<9000000000253560>] module_frob_arch_sections+0xee0/0xfe0
[   29.510537] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.510541] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.510545] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.510549] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.510554] ---[ end trace ]---
[   29.510557] ------------[ cut here ]------------
[   29.510558] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:124:20
[   29.510560] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.510562] which requires 64 byte alignment
[   29.510564] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.510566] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.510568] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.510573]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.510579]         900000014c043680 900000014c043680 90000000080d1148 6572617764726148
[   29.510584]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.510590]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.510597]         000000000000001f 9000000003f3aa60 0000000008608000 ffff80003315fd08
[   29.510603]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.510608]         900000000296c000 0000000000000023 ffff800033154000 0000000000000000
[   29.510612]         ffff80003315f660 0000000000000000 900000000023aba4 00007ffff0080070
[   29.510615]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[   29.510619]         ...
[   29.510620] Call Trace:
[   29.510621] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.510623] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.510626] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.510628] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.510631] [<9000000000253348>] module_frob_arch_sections+0xcc8/0xfe0
[   29.510634] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.510636] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.510639] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.510641] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.510645] ---[ end trace ]---
[   29.510645] ------------[ cut here ]------------
[   29.510646] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:128:20
[   29.510647] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.510648] which requires 64 byte alignment
[   29.510649] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.510651] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.510652] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.510655]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.510659]         900000014c043680 900000014c043680 90000000080d1948 6572617764726148
[   29.510662]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.510666]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.510669]         000000000000001f 9000000003f3aa60 0000000008608000 ffff80003315fd08
[   29.510673]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.510676]         900000000296c000 0000000000000023 ffff800033154000 0000000000000000
[   29.510680]         ffff80003315f660 0000000000000000 900000000023aba4 00007ffff0080070
[   29.510683]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[   29.510686]         ...
[   29.510688] Call Trace:
[   29.510689] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.510690] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.510693] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.510696] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.510698] [<90000000002533f4>] module_frob_arch_sections+0xd74/0xfe0
[   29.510701] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.510703] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.510706] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.510708] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.510711] ---[ end trace ]---
[   29.510712] ------------[ cut here ]------------
[   29.510713] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:132:24
[   29.510714] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.510715] which requires 64 byte alignment
[   29.510715] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.510717] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.510718] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.510721]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.510725]         900000014c043680 900000014c043680 90000000080d2148 6572617764726148
[   29.510728]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.510732]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.510735]         000000000000001f 9000000003f3aa60 0000000008608000 ffff80003315fd08
[   29.510739]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.510742]         900000000296c000 0000000000000023 ffff800033154000 0000000000000000
[   29.510746]         ffff80003315f660 0000000000000000 900000000023aba4 00007ffff0080070
[   29.510751]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[   29.510755]         ...
[   29.510757] Call Trace:
[   29.510757] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.510759] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.510762] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.510765] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.510768] [<90000000002533b0>] module_frob_arch_sections+0xd30/0xfe0
[   29.510770] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.510773] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.510775] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.510778] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.510792] ---[ end trace ]---
[   29.510802] ------------[ cut here ]------------
[   29.510803] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:153:35
[   29.510804] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.510805] which requires 64 byte alignment
[   29.510807] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.510808] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.510809] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.510813]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.510816]         900000014c043680 900000014c043680 90000000080d2948 6572617764726148
[   29.510820]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.510823]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.510827]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000002
[   29.510830]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.510834]         900000000296c000 0000000000000023 0000000000000000 000000000000001f
[   29.510837]         0000000000000018 0000000000000000 900000000023aba4 00007ffff0080070
[   29.510841]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.510844]         ...
[   29.510845] Call Trace:
[   29.510846] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.510848] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.510851] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.510853] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.510856] [<9000000000253128>] module_frob_arch_sections+0xaa8/0xfe0
[   29.510858] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.510861] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.510863] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.510866] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.510869] ---[ end trace ]---
[   29.510870] ------------[ cut here ]------------
[   29.510871] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:158:28
[   29.510872] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.510873] which requires 64 byte alignment
[   29.510874] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.510875] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.510876] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.510880]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.510883]         900000014c043680 900000014c043680 90000000080d3148 6572617764726148
[   29.510887]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.510890]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.510894]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000002
[   29.510897]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.510900]         900000000296c000 0000000000000023 0000000000000000 000000000000001f
[   29.510904]         0000000000000018 0000000000000000 900000000023aba4 00007ffff0080070
[   29.510907]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.510911]         ...
[   29.510912] Call Trace:
[   29.510913] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.510915] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.510918] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.510920] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.510923] [<90000000002534d8>] module_frob_arch_sections+0xe58/0xfe0
[   29.510925] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.510928] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.510930] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.510933] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.510936] ---[ end trace ]---
[   29.510936] ------------[ cut here ]------------
[   29.510937] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:159:28
[   29.510938] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.510939] which requires 64 byte alignment
[   29.510940] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.510941] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.510942] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.510946]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.510950]         900000014c043680 900000014c043680 90000000080d3948 6572617764726148
[   29.510953]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.510956]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.510960]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000002
[   29.510963]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.510967]         900000000296c000 0000000000000023 0000000000000000 000000000000001f
[   29.510970]         0000000000000018 0000000000000000 900000000023aba4 00007ffff0080070
[   29.510974]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.510977]         ...
[   29.510979] Call Trace:
[   29.510979] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.510981] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.510984] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.510986] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.510989] [<90000000002534b0>] module_frob_arch_sections+0xe30/0xfe0
[   29.510991] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.510994] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.510996] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.510999] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511002] ---[ end trace ]---
[   29.511002] ------------[ cut here ]------------
[   29.511003] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:161:35
[   29.511004] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.511005] which requires 64 byte alignment
[   29.511006] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511008] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511009] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511012]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.511016]         900000014c043680 900000014c043680 90000000080d4148 6572617764726148
[   29.511019]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511023]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511026]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000002
[   29.511029]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.511033]         900000000296c000 0000000000000023 0000000000000000 000000000000001f
[   29.511036]         0000000000000018 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511040]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511043]         ...
[   29.511045] Call Trace:
[   29.511045] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511047] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.511050] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.511052] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.511055] [<9000000000253488>] module_frob_arch_sections+0xe08/0xfe0
[   29.511057] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.511060] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.511062] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.511065] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511068] ---[ end trace ]---
[   29.511069] ------------[ cut here ]------------
[   29.511069] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:166:28
[   29.511070] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.511071] which requires 64 byte alignment
[   29.511072] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511074] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511075] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511078]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.511082]         900000014c043680 900000014c043680 90000000080d4948 6572617764726148
[   29.511085]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511089]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511092]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000002
[   29.511096]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.511099]         900000000296c000 0000000000000023 0000000000000000 000000000000001f
[   29.511103]         0000000000000018 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511106]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511109]         ...
[   29.511111] Call Trace:
[   29.511112] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511113] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.511116] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.511118] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.511121] [<90000000002532f8>] module_frob_arch_sections+0xc78/0xfe0
[   29.511124] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.511126] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.511128] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.511131] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511134] ---[ end trace ]---
[   29.511135] ------------[ cut here ]------------
[   29.511135] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:167:28
[   29.511136] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.511137] which requires 64 byte alignment
[   29.511138] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511140] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511141] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511144]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.511148]         900000014c043680 900000014c043680 90000000080d5148 6572617764726148
[   29.511151]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511155]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511158]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000002
[   29.511162]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.511165]         900000000296c000 0000000000000023 0000000000000000 000000000000001f
[   29.511168]         0000000000000018 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511172]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511175]         ...
[   29.511177] Call Trace:
[   29.511177] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511179] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.511182] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.511184] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.511187] [<90000000002532d8>] module_frob_arch_sections+0xc58/0xfe0
[   29.511189] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.511192] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.511194] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.511197] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511200] ---[ end trace ]---
[   29.511200] ------------[ cut here ]------------
[   29.511201] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:169:43
[   29.511202] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.511203] which requires 64 byte alignment
[   29.511204] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511205] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511207] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511210]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.511214]         900000014c043680 900000014c043680 90000000080d5948 6572617764726148
[   29.511217]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511220]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511224]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000002
[   29.511227]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.511231]         900000000296c000 0000000000000023 0000000000000000 000000000000001f
[   29.511234]         0000000000000018 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511238]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511241]         ...
[   29.511243] Call Trace:
[   29.511243] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511245] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.511248] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.511250] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.511253] [<90000000002532b8>] module_frob_arch_sections+0xc38/0xfe0
[   29.511255] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.511258] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.511260] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.511263] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511266] ---[ end trace ]---
[   29.511266] ------------[ cut here ]------------
[   29.511267] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:174:32
[   29.511268] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.511269] which requires 64 byte alignment
[   29.511270] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511272] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511273] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511276]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.511280]         900000014c043680 900000014c043680 90000000080d6148 6572617764726148
[   29.511283]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511287]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511290]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000002
[   29.511294]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.511297]         900000000296c000 0000000000000023 0000000000000000 000000000000001f
[   29.511300]         0000000000000018 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511304]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511309]         ...
[   29.511312] Call Trace:
[   29.511313] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511317] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.511321] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.511325] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.511329] [<9000000000253218>] module_frob_arch_sections+0xb98/0xfe0
[   29.511333] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.511337] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.511341] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.511346] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511352] ---[ end trace ]---
[   29.511353] ------------[ cut here ]------------
[   29.511354] UBSAN: misaligned-access in arch/loongarch/kernel/module-sections.c:175:32
[   29.511356] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.511358] which requires 64 byte alignment
[   29.511359] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511362] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511364] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511370]         900000014c043540 900000014c043548 0000000000000000 900000014c043688
[   29.511375]         900000014c043680 900000014c043680 90000000080d6948 6572617764726148
[   29.511380]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511386]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511392]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000002
[   29.511398]         0000000000000000 0000000000000000 9000000002805d80 900000014c043548
[   29.511404]         900000000296c000 0000000000000023 0000000000000000 000000000000001f
[   29.511409]         0000000000000018 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511415]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511422]         ...
[   29.511425] Call Trace:
[   29.511426] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511430] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.511434] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.511438] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.511442] [<90000000002531f8>] module_frob_arch_sections+0xb78/0xfe0
[   29.511446] [<900000000054f368>] load_module+0x7d0/0x5d30
[   29.511450] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.511454] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.511457] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511463] ---[ end trace ]---
[   29.511466] ------------[ cut here ]------------
[   29.511467] UBSAN: misaligned-access in kernel/module/main.c:1564:16
[   29.511469] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.511471] which requires 64 byte alignment
[   29.511472] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511474] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511476] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511479]         900000014c0434f0 900000014c0434f8 0000000000000000 900000014c043638
[   29.511483]         900000014c043630 900000014c043630 90000000080d7138 6572617764726148
[   29.511486]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511490]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511493]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.511496]         0000000000000000 0000000000000000 9000000002805d80 900000014c0434f8
[   29.511500]         900000000296c000 0000000000000000 90000000026144d0 ffff80003315f808
[   29.511503]         0000000000000023 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511507]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511510]         ...
[   29.511512] Call Trace:
[   29.511512] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511514] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.511517] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.511519] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.511522] [<900000000054e628>] module_get_offset_and_type+0x1b0/0x278
[   29.511525] [<900000000054e8f8>] __layout_sections+0x1c8/0x3f8
[   29.511527] [<900000000054f4c0>] load_module+0x928/0x5d30
[   29.511530] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.511532] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.511535] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511538] ---[ end trace ]---
[   29.511539] ------------[ cut here ]------------
[   29.511540] UBSAN: misaligned-access in kernel/module/main.c:1564:22
[   29.511541] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.511542] which requires 64 byte alignment
[   29.511543] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511544] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511545] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511549]         900000014c0434f0 900000014c0434f8 0000000000000000 900000014c043638
[   29.511552]         900000014c043630 900000014c043630 90000000080d7968 6572617764726148
[   29.511556]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511559]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511562]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.511566]         0000000000000000 0000000000000000 9000000002805d80 900000014c0434f8
[   29.511569]         900000000296c000 0000000000000000 90000000026144d0 ffff80003315f808
[   29.511573]         0000000000000023 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511576]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511580]         ...
[   29.511581] Call Trace:
[   29.511582] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511583] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.511586] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.511589] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.511591] [<900000000054e6a0>] module_get_offset_and_type+0x228/0x278
[   29.511594] [<900000000054e8f8>] __layout_sections+0x1c8/0x3f8
[   29.511596] [<900000000054f4c0>] load_module+0x928/0x5d30
[   29.511599] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.511601] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.511604] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511607] ---[ end trace ]---
[   29.511608] ------------[ cut here ]------------
[   29.511608] UBSAN: misaligned-access in kernel/module/main.c:1565:11
[   29.511609] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.511610] which requires 64 byte alignment
[   29.511611] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511612] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511613] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511617]         900000014c0434f0 900000014c0434f8 0000000000000000 900000014c043638
[   29.511620]         900000014c043630 900000014c043630 90000000080d8198 6572617764726148
[   29.511624]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511627]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511631]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.511634]         0000000000000000 0000000000000000 9000000002805d80 900000014c0434f8
[   29.511638]         900000000296c000 0000000000000000 90000000026144d0 ffff80003315f808
[   29.511641]         0000000000000023 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511644]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511648]         ...
[   29.511649] Call Trace:
[   29.511650] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511652] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.511654] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.511657] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.511659] [<900000000054e658>] module_get_offset_and_type+0x1e0/0x278
[   29.511662] [<900000000054e8f8>] __layout_sections+0x1c8/0x3f8
[   29.511664] [<900000000054f4c0>] load_module+0x928/0x5d30
[   29.511667] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.511669] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.511672] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511675] ---[ end trace ]---
[   29.511675] ------------[ cut here ]------------
[   29.511676] UBSAN: misaligned-access in kernel/module/main.c:1566:22
[   29.511677] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.511678] which requires 64 byte alignment
[   29.511679] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511680] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511681] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511685]         900000014c0434f0 900000014c0434f8 0000000000000000 900000014c043638
[   29.511688]         900000014c043630 900000014c043630 90000000080d89c8 6572617764726148
[   29.511692]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511695]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511699]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000000
[   29.511702]         0000000000000000 0000000000000000 9000000002805d80 900000014c0434f8
[   29.511706]         900000000296c000 0000000000000000 0000000000000000 ffff80003315f808
[   29.511709]         0000000000000023 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511713]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511716]         ...
[   29.511717] Call Trace:
[   29.511718] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511720] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.511722] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.511725] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.511727] [<900000000054e670>] module_get_offset_and_type+0x1f8/0x278
[   29.511730] [<900000000054e8f8>] __layout_sections+0x1c8/0x3f8
[   29.511732] [<900000000054f4c0>] load_module+0x928/0x5d30
[   29.511735] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.511737] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.511740] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511743] ---[ end trace ]---
[   29.511747] ------------[ cut here ]------------
[   29.511748] UBSAN: misaligned-access in kernel/module/kallsyms.c:119:24
[   29.511749] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.511750] which requires 64 byte alignment
[   29.511751] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511753] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511754] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511757]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.511761]         900000014c043690 900000014c043690 90000000080d91f8 6572617764726148
[   29.511764]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511767]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511771]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.511774]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.511778]         900000000296c000 0000000000000021 000000000000001f 0000000000000000
[   29.511781]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511785]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511788]         ...
[   29.511789] Call Trace:
[   29.511790] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511792] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.511795] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.511797] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.511800] [<9000000000559a18>] layout_symtab+0x788/0xb18
[   29.511803] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.511805] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.511807] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.511810] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511813] ---[ end trace ]---
[   29.511814] ------------[ cut here ]------------
[   29.511814] UBSAN: misaligned-access in kernel/module/kallsyms.c:120:24
[   29.511815] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.511816] which requires 64 byte alignment
[   29.511817] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511819] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511820] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511823]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.511827]         900000014c043690 900000014c043690 90000000080d99d8 6572617764726148
[   29.511830]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511833]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511837]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.511840]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.511844]         900000000296c000 0000000000000021 000000000000001f 0000000000000000
[   29.511847]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511851]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511854]         ...
[   29.511856] Call Trace:
[   29.511856] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511858] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.511861] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.511863] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.511866] [<9000000000559bac>] layout_symtab+0x91c/0xb18
[   29.511868] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.511871] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.511873] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.511876] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511879] ---[ end trace ]---
[   29.511886] ------------[ cut here ]------------
[   29.511887] UBSAN: misaligned-access in kernel/module/kallsyms.c:142:18
[   29.511888] member access within misaligned address 000000004e8f69b4 for type 'struct module_memory'
[   29.511889] which requires 8 byte alignment
[   29.511890] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511892] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511893] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511896]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.511900]         900000014c043690 900000014c043690 90000000080da1c0 6572617764726148
[   29.511903]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511906]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511910]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.511913]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.511917]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.511920]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511924]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511927]         ...
[   29.511929] Call Trace:
[   29.511929] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511931] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.511934] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.511936] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.511939] [<9000000000559b18>] layout_symtab+0x888/0xb18
[   29.511941] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.511944] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.511946] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.511949] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.511952] ---[ end trace ]---
[   29.511953] ------------[ cut here ]------------
[   29.511953] UBSAN: misaligned-access in kernel/module/kallsyms.c:143:37
[   29.511954] member access within misaligned address 000000004e8f69b4 for type 'struct module_memory'
[   29.511955] which requires 8 byte alignment
[   29.511956] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.511958] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.511959] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.511962]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.511966]         900000014c043690 900000014c043690 90000000080da9a8 6572617764726148
[   29.511969]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.511973]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.511976]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.511980]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.511983]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.511987]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.511990]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.511994]         ...
[   29.511995] Call Trace:
[   29.511996] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.511997] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512000] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512002] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512005] [<9000000000559a9c>] layout_symtab+0x80c/0xb18
[   29.512008] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512010] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512013] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512015] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512018] ---[ end trace ]---
[   29.512019] ------------[ cut here ]------------
[   29.512019] UBSAN: misaligned-access in kernel/module/kallsyms.c:143:30
[   29.512020] member access within misaligned address 000000004e8f69b4 for type 'struct module_memory'
[   29.512022] which requires 8 byte alignment
[   29.512022] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512024] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512025] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512028]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512032]         900000014c043690 900000014c043690 90000000080db190 6572617764726148
[   29.512035]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512039]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512042]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512046]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512049]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512052]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512056]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512059]         ...
[   29.512061] Call Trace:
[   29.512061] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512063] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512066] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512068] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512071] [<9000000000559a84>] layout_symtab+0x7f4/0xb18
[   29.512074] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512076] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512078] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512081] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512084] ---[ end trace ]---
[   29.512085] ------------[ cut here ]------------
[   29.512085] UBSAN: misaligned-access in kernel/module/kallsyms.c:144:14
[   29.512086] member access within misaligned address 000000004e8f69b4 for type 'struct module_memory'
[   29.512087] which requires 8 byte alignment
[   29.512088] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512089] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512090] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512094]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512097]         900000014c043690 900000014c043690 90000000080db978 6572617764726148
[   29.512101]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512104]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512108]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512111]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512115]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512118]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512121]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512125]         ...
[   29.512126] Call Trace:
[   29.512127] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512129] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512131] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512134] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512136] [<9000000000559a54>] layout_symtab+0x7c4/0xb18
[   29.512139] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512141] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512144] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512146] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512149] ---[ end trace ]---
[   29.512150] ------------[ cut here ]------------
[   29.512151] UBSAN: misaligned-access in kernel/module/kallsyms.c:144:21
[   29.512152] member access within misaligned address 000000004e8f69b4 for type 'struct module_memory'
[   29.512153] which requires 8 byte alignment
[   29.512154] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512155] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512156] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512160]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512163]         900000014c043690 900000014c043690 90000000080dc160 6572617764726148
[   29.512167]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512170]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512174]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512177]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512180]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512184]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512187]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512191]         ...
[   29.512192] Call Trace:
[   29.512193] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512194] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512197] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512200] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512202] [<9000000000559cec>] layout_symtab+0xa5c/0xb18
[   29.512205] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512207] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512210] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512212] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512215] ---[ end trace ]---
[   29.512216] ------------[ cut here ]------------
[   29.512216] UBSAN: misaligned-access in kernel/module/kallsyms.c:146:36
[   29.512217] member access within misaligned address 000000004e8f69b4 for type 'struct module_memory'
[   29.512218] which requires 8 byte alignment
[   29.512219] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512221] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512222] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512225]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512229]         900000014c043690 900000014c043690 90000000080dc948 6572617764726148
[   29.512232]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512235]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512239]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512242]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512246]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512249]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512253]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512256]         ...
[   29.512257] Call Trace:
[   29.512258] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512260] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512262] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512265] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512267] [<9000000000559cd4>] layout_symtab+0xa44/0xb18
[   29.512270] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512272] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512275] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512277] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512280] ---[ end trace ]---
[   29.512281] ------------[ cut here ]------------
[   29.512282] UBSAN: misaligned-access in kernel/module/kallsyms.c:147:14
[   29.512283] member access within misaligned address 000000004e8f69b4 for type 'struct module_memory'
[   29.512284] which requires 8 byte alignment
[   29.512285] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512286] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512287] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512291]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512294]         900000014c043690 900000014c043690 90000000080dd130 6572617764726148
[   29.512297]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512301]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512304]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512308]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512311]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512315]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512318]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512321]         ...
[   29.512323] Call Trace:
[   29.512324] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512325] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512328] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512330] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512333] [<9000000000559ca4>] layout_symtab+0xa14/0xb18
[   29.512336] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512338] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512340] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512343] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512346] ---[ end trace ]---
[   29.512347] ------------[ cut here ]------------
[   29.512347] UBSAN: misaligned-access in kernel/module/kallsyms.c:147:21
[   29.512348] member access within misaligned address 000000004e8f69b4 for type 'struct module_memory'
[   29.512349] which requires 8 byte alignment
[   29.512350] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512352] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512353] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512356]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512360]         900000014c043690 900000014c043690 90000000080dd918 6572617764726148
[   29.512363]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512366]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512370]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512373]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512377]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512380]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512384]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512387]         ...
[   29.512388] Call Trace:
[   29.512389] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512391] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512394] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512396] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512398] [<9000000000559c8c>] layout_symtab+0x9fc/0xb18
[   29.512401] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512404] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512406] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512409] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512412] ---[ end trace ]---
[   29.512413] ------------[ cut here ]------------
[   29.512413] UBSAN: misaligned-access in kernel/module/kallsyms.c:156:28
[   29.512414] member access within misaligned address 00000000ac77b025 for type 'struct module_memory'
[   29.512415] which requires 8 byte alignment
[   29.512416] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512418] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512419] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512422]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512426]         900000014c043690 900000014c043690 90000000080de100 6572617764726148
[   29.512429]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512432]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512436]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512439]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512443]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512446]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512450]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512453]         ...
[   29.512455] Call Trace:
[   29.512455] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512457] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512460] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512462] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512465] [<9000000000559998>] layout_symtab+0x708/0xb18
[   29.512467] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512470] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512472] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512475] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512478] ---[ end trace ]---
[   29.512478] ------------[ cut here ]------------
[   29.512479] UBSAN: misaligned-access in kernel/module/kallsyms.c:156:26
[   29.512480] member access within misaligned address 00000000ac77b025 for type 'struct module_memory'
[   29.512481] which requires 8 byte alignment
[   29.512482] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512483] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512484] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512488]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512491]         900000014c043690 900000014c043690 90000000080de8e8 6572617764726148
[   29.512495]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512498]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512502]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512505]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512508]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512512]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512515]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512519]         ...
[   29.512520] Call Trace:
[   29.512521] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512523] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512525] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512528] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512530] [<9000000000559980>] layout_symtab+0x6f0/0xb18
[   29.512533] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512535] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512538] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512540] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512543] ---[ end trace ]---
[   29.512544] ------------[ cut here ]------------
[   29.512545] UBSAN: misaligned-access in kernel/module/kallsyms.c:158:49
[   29.512546] member access within misaligned address 00000000ac77b025 for type 'struct module_memory'
[   29.512547] which requires 8 byte alignment
[   29.512548] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512549] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512550] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512553]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512557]         900000014c043690 900000014c043690 90000000080df0d0 6572617764726148
[   29.512560]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512564]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512567]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512571]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512574]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512578]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512581]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512584]         ...
[   29.512586] Call Trace:
[   29.512587] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512588] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512591] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512593] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512596] [<9000000000559968>] layout_symtab+0x6d8/0xb18
[   29.512599] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512601] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512604] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512606] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512609] ---[ end trace ]---
[   29.512610] ------------[ cut here ]------------
[   29.512610] UBSAN: misaligned-access in kernel/module/kallsyms.c:160:19
[   29.512611] member access within misaligned address 00000000ac77b025 for type 'struct module_memory'
[   29.512613] which requires 8 byte alignment
[   29.512613] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512615] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512616] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512619]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512622]         900000014c043690 900000014c043690 90000000080df8b8 6572617764726148
[   29.512626]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512629]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512633]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512636]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512640]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512643]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512647]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512650]         ...
[   29.512652] Call Trace:
[   29.512652] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512654] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512657] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512659] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512661] [<9000000000559938>] layout_symtab+0x6a8/0xb18
[   29.512664] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512667] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512669] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512671] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512675] ---[ end trace ]---
[   29.512675] ------------[ cut here ]------------
[   29.512676] UBSAN: misaligned-access in kernel/module/kallsyms.c:160:26
[   29.512677] member access within misaligned address 00000000ac77b025 for type 'struct module_memory'
[   29.512678] which requires 8 byte alignment
[   29.512679] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512680] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512681] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512685]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512688]         900000014c043690 900000014c043690 90000000080e00a0 6572617764726148
[   29.512692]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512695]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512698]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512702]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512705]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512709]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512712]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512716]         ...
[   29.512717] Call Trace:
[   29.512718] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512719] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512722] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512724] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512727] [<9000000000559920>] layout_symtab+0x690/0xb18
[   29.512730] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512732] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512735] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512737] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512740] ---[ end trace ]---
[   29.512741] ------------[ cut here ]------------
[   29.512741] UBSAN: misaligned-access in kernel/module/kallsyms.c:161:41
[   29.512742] member access within misaligned address 00000000ac77b025 for type 'struct module_memory'
[   29.512744] which requires 8 byte alignment
[   29.512744] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512746] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512747] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512750]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512754]         900000014c043690 900000014c043690 90000000080e0888 6572617764726148
[   29.512757]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512761]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512764]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512768]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512771]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512774]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512778]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512781]         ...
[   29.512783] Call Trace:
[   29.512783] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512785] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512788] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512790] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512793] [<9000000000559908>] layout_symtab+0x678/0xb18
[   29.512795] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512798] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512800] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512803] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512806] ---[ end trace ]---
[   29.512807] ------------[ cut here ]------------
[   29.512807] UBSAN: misaligned-access in kernel/module/kallsyms.c:162:19
[   29.512808] member access within misaligned address 00000000ac77b025 for type 'struct module_memory'
[   29.512809] which requires 8 byte alignment
[   29.512810] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512812] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512812] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512817]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512823]         900000014c043690 900000014c043690 90000000080e1070 6572617764726148
[   29.512830]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512836]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512842]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512847]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512852]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512857]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512863]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512868]         ...
[   29.512871] Call Trace:
[   29.512873] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512876] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512880] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512883] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512887] [<90000000005598d8>] layout_symtab+0x648/0xb18
[   29.512891] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.512894] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.512897] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.512901] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.512906] ---[ end trace ]---
[   29.512907] ------------[ cut here ]------------
[   29.512908] UBSAN: misaligned-access in kernel/module/kallsyms.c:162:26
[   29.512911] member access within misaligned address 00000000ac77b025 for type 'struct module_memory'
[   29.512913] which requires 8 byte alignment
[   29.512915] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.512917] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.512919] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.512924]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.512930]         900000014c043690 900000014c043690 90000000080e1858 6572617764726148
[   29.512936]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.512942]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.512948]         000000000000001f 9000000003f3aa60 0000000008608000 900000014c043998
[   29.512954]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.512960]         900000000296c000 0000000000000e46 00000000000001a5 0000000000000000
[   29.512965]         ffff8000331572e3 0000000000000000 900000000023aba4 00007ffff0080070
[   29.512971]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.512976]         ...
[   29.512978] Call Trace:
[   29.512979] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.512982] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.512986] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.512990] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.512994] [<90000000005598c0>] layout_symtab+0x630/0xb18
[   29.512999] [<900000000054f4f0>] load_module+0x958/0x5d30
[   29.513003] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.513007] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.513010] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.513016] ---[ end trace ]---
[   29.513017] ------------[ cut here ]------------
[   29.513018] UBSAN: misaligned-access in kernel/module/main.c:2562:22
[   29.513020] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.513022] which requires 64 byte alignment
[   29.513024] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.513026] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.513028] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.513035]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.513041]         900000014c043750 900000014c043750 90000000080e2038 6572617764726148
[   29.513046]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.513051]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.513057]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000007
[   29.513063]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.513069]         900000000296c000 ffff8000331572e3 0000000000000000 9000000002d9cbf0
[   29.513075]         ffff800033157423 0000000000000000 900000000023aba4 00007ffff0080070
[   29.513081]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.513086]         ...
[   29.513087] Call Trace:
[   29.513088] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.513090] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.513093] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.513095] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.513098] [<900000000055419c>] load_module+0x5604/0x5d30
[   29.513101] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.513103] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.513106] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.513109] ---[ end trace ]---
[   29.513110] ------------[ cut here ]------------
[   29.513111] UBSAN: misaligned-access in kernel/module/main.c:1238:22
[   29.513112] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.513113] which requires 64 byte alignment
[   29.513114] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.513116] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.513117] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.513120]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.513124]         900000014c043750 900000014c043750 90000000080e27e0 6572617764726148
[   29.513127]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.513131]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.513134]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000007
[   29.513137]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.513141]         900000000296c000 ffff8000331572e3 0000000000000000 9000000002d9cbf0
[   29.513144]         ffff800033157423 0000000000000000 900000000023aba4 00007ffff0080070
[   29.513148]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.513151]         ...
[   29.513153] Call Trace:
[   29.513153] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.513155] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.513158] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.513160] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.513163] [<9000000000554434>] load_module+0x589c/0x5d30
[   29.513165] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.513168] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.513170] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.513173] ---[ end trace ]---
[   29.513174] ------------[ cut here ]------------
[   29.513175] UBSAN: misaligned-access in kernel/module/main.c:1242:22
[   29.513176] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.513177] which requires 64 byte alignment
[   29.513178] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.513179] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.513180] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.513184]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.513187]         900000014c043750 900000014c043750 90000000080e2f88 6572617764726148
[   29.513190]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.513194]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.513197]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000007
[   29.513201]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.513204]         900000000296c000 ffff8000331572e3 0000000000000000 9000000002d9cbf0
[   29.513208]         ffff800033157423 0000000000000000 900000000023aba4 00007ffff0080070
[   29.513211]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.513215]         ...
[   29.513216] Call Trace:
[   29.513217] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.513218] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.513221] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.513224] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.513226] [<900000000055446c>] load_module+0x58d4/0x5d30
[   29.513229] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.513231] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.513234] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.513237] ---[ end trace ]---
[   29.513242] ------------[ cut here ]------------
[   29.513243] UBSAN: misaligned-access in kernel/module/main.c:1253:22
[   29.513244] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.513245] which requires 64 byte alignment
[   29.513246] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.513247] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.513248] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.513255]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.513260]         900000014c043750 900000014c043750 90000000080e3730 6572617764726148
[   29.513267]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.513272]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.513278]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000007
[   29.513283]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.513288]         900000000296c000 ffff8000331572e3 0000000000000000 9000000002d9cbf0
[   29.513293]         ffff800033157423 0000000000000000 900000000023aba4 00007ffff0080070
[   29.513299]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.513306]         ...
[   29.513308] Call Trace:
[   29.513309] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.513312] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.513316] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.513319] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.513323] [<900000000055265c>] load_module+0x3ac4/0x5d30
[   29.513326] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.513330] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.513333] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.513339] ---[ end trace ]---
[   29.513340] ------------[ cut here ]------------
[   29.513341] UBSAN: misaligned-access in kernel/module/main.c:1266:42
[   29.513343] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.513345] which requires 64 byte alignment
[   29.513346] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.513348] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.513350] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.513356]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.513361]         900000014c043750 900000014c043750 90000000080e3ed8 6572617764726148
[   29.513367]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.513373]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.513379]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000007
[   29.513384]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.513390]         900000000296c000 ffff8000331572e3 0000000000000000 9000000002d9cbf0
[   29.513395]         ffff800033157423 0000000000000000 900000000023aba4 00007ffff0080070
[   29.513400]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.513405]         ...
[   29.513407] Call Trace:
[   29.513408] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.513412] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.513417] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.513420] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.513424] [<9000000000552758>] load_module+0x3bc0/0x5d30
[   29.513428] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.513432] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.513436] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.513441] ---[ end trace ]---
[   29.513442] ------------[ cut here ]------------
[   29.513443] UBSAN: misaligned-access in kernel/module/main.c:1266:26
[   29.513445] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.513447] which requires 64 byte alignment
[   29.513450] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.513452] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.513454] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.513459]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.513465]         900000014c043750 900000014c043750 90000000080e4680 6572617764726148
[   29.513470]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.513476]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.513482]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000007
[   29.513488]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.513494]         900000000296c000 ffff8000331572e3 ffff800002010000 9000000002d9cbf0
[   29.513499]         ffff800033157423 0000000000000000 900000000023aba4 00007ffff0080070
[   29.513502]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.513506]         ...
[   29.513507] Call Trace:
[   29.513508] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.513510] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.513513] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.513516] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.513518] [<9000000000552740>] load_module+0x3ba8/0x5d30
[   29.513521] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.513524] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.513526] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.513529] ---[ end trace ]---
[   29.513530] ------------[ cut here ]------------
[   29.513531] UBSAN: misaligned-access in kernel/module/main.c:1267:3
[   29.513532] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.513533] which requires 64 byte alignment
[   29.513534] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.513536] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.513537] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.513540]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.513544]         900000014c043750 900000014c043750 90000000080e4e28 6572617764726148
[   29.513547]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.513551]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.513554]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000007
[   29.513557]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.513561]         900000000296c000 ffff8000331572e3 ffff800002010000 9000000002d9cbf0
[   29.513564]         ffff800033157423 0000000000000000 900000000023aba4 00007ffff0080070
[   29.513568]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.513571]         ...
[   29.513573] Call Trace:
[   29.513573] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.513575] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.513578] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.513580] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.513583] [<9000000000552770>] load_module+0x3bd8/0x5d30
[   29.513585] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.513588] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.513590] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.513593] ---[ end trace ]---
[   29.513594] ------------[ cut here ]------------
[   29.513595] UBSAN: misaligned-access in kernel/module/main.c:1267:3
[   29.513596] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.513597] which requires 64 byte alignment
[   29.513598] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.513599] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.513600] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.513604]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.513607]         900000014c043750 900000014c043750 90000000080e55d0 6572617764726148
[   29.513611]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.513614]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.513617]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000007
[   29.513621]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.513624]         900000000296c000 ffff8000331572e3 ffff800002010000 9000000002d9cbf0
[   29.513628]         ffff800033157423 0000000000000000 900000000023aba4 00007ffff0080070
[   29.513631]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.513635]         ...
[   29.513636] Call Trace:
[   29.513637] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.513639] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.513641] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.513644] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.513646] [<9000000000551ce4>] load_module+0x314c/0x5d30
[   29.513649] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.513651] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.513654] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.513657] ---[ end trace ]---
[   29.513658] ------------[ cut here ]------------
[   29.513658] UBSAN: misaligned-access in kernel/module/main.c:1267:3
[   29.513659] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.513660] which requires 64 byte alignment
[   29.513661] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.513663] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.513664] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.513667]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.513671]         900000014c043750 900000014c043750 90000000080e5d78 6572617764726148
[   29.513674]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.513677]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.513681]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000007
[   29.513684]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.513688]         900000000296c000 ffff8000331572e3 ffff800002010000 9000000002d9cbf0
[   29.513691]         ffff800033157423 0000000000000000 900000000023aba4 00007ffff0080070
[   29.513695]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.513698]         ...
[   29.513700] Call Trace:
[   29.513700] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.513702] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.513706] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.513710] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.513714] [<9000000000553fd4>] load_module+0x543c/0x5d30
[   29.513719] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.513722] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.513726] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.513731] ---[ end trace ]---
[   29.513746] ------------[ cut here ]------------
[   29.513748] UBSAN: misaligned-access in kernel/module/main.c:2563:24
[   29.513749] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.513751] which requires 64 byte alignment
[   29.513753] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.513755] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.513756] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.513763]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.513769]         900000014c043750 900000014c043750 90000000080e6520 6572617764726148
[   29.513774]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.513779]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.513784]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000007
[   29.513789]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.513794]         900000000296c000 ffff8000331572e3 ffff80000202c000 9000000002d9cbf0
[   29.513800]         ffff800033157563 0000000000000000 900000000023aba4 00007ffff0080070
[   29.513806]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.513811]         ...
[   29.513814] Call Trace:
[   29.513815] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.513818] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.513822] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.513825] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.513829] [<900000000055416c>] load_module+0x55d4/0x5d30
[   29.513833] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.513837] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.513841] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.513845] ---[ end trace ]---
[   29.513846] ------------[ cut here ]------------
[   29.513847] UBSAN: misaligned-access in kernel/module/main.c:2564:27
[   29.513849] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.513851] which requires 64 byte alignment
[   29.513852] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.513854] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.513856] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.513862]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.513867]         900000014c043750 900000014c043750 90000000080e6cc8 6572617764726148
[   29.513873]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.513879]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.513885]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000007
[   29.513891]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.513897]         900000000296c000 ffff8000331572e3 ffff80000202c000 9000000002d9cbf0
[   29.513903]         ffff800033157563 0000000000000000 900000000023aba4 00007ffff0080070
[   29.513908]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.513913]         ...
[   29.513916] Call Trace:
[   29.513917] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.513921] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.513925] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.513929] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.513933] [<9000000000554184>] load_module+0x55ec/0x5d30
[   29.513937] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.513940] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.513944] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.513948] ---[ end trace ]---
[   29.513954] ------------[ cut here ]------------
[   29.513955] UBSAN: misaligned-access in kernel/module/main.c:2608:40
[   29.513957] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.513958] which requires 64 byte alignment
[   29.513959] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.513960] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.513962] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.513968]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.513974]         900000014c043750 900000014c043750 90000000080e7470 6572617764726148
[   29.513979]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.513985]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.513991]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000000007
[   29.513996]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.514002]         900000000296c000 ffff80003315f7c8 ffff80003315f808 0000000000000000
[   29.514008]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0080070
[   29.514013]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.514019]         ...
[   29.514022] Call Trace:
[   29.514023] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.514026] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.514031] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.514034] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.514038] [<900000000055410c>] load_module+0x5574/0x5d30
[   29.514042] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.514046] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.514049] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.514054] ---[ end trace ]---
[   29.514055] ------------[ cut here ]------------
[   29.514056] UBSAN: misaligned-access in kernel/module/main.c:2609:25
[   29.514058] member access within misaligned address 00000000ffee6ab6 for type 'struct module'
[   29.514060] which requires 64 byte alignment
[   29.514062] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.514064] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.514066] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.514072]         900000014c043610 900000014c043618 0000000000000000 900000014c043758
[   29.514078]         900000014c043750 900000014c043750 90000000080e7c18 6572617764726148
[   29.514084]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.514090]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.514096]         000000000000001f 9000000003f3aa60 0000000008608000 ffff800002010000
[   29.514102]         0000000000000000 0000000000000000 9000000002805d80 900000014c043618
[   29.514108]         900000000296c000 ffff80003315f7c8 ffff80003315f808 0000000000000000
[   29.514114]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0080070
[   29.514120]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.514126]         ...
[   29.514128] Call Trace:
[   29.514130] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.514133] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.514138] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.514141] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.514146] [<90000000005540cc>] load_module+0x5534/0x5d30
[   29.514149] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.514153] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.514158] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.514163] ---[ end trace ]---
[   29.514285] ------------[ cut here ]------------
[   29.514287] UBSAN: misaligned-access in kernel/module/main.c:354:2
[   29.514288] member access within misaligned address 00000000b7f2f1ff for type 'struct module'
[   29.514290] which requires 64 byte alignment
[   29.514291] CPU: 3 UID: 0 PID: 237 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.514292] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.514294] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014c040000
[   29.514298]         900000014c043550 900000014c043558 0000000000000000 900000014c043698
[   29.514301]         900000014c043690 900000014c043690 90000000080e83c0 6572617764726148
[   29.514305]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.514308]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.514312]         000000000000001f 9000000003f3aa60 0000000008608000 9000000002d9d758
[   29.514315]         0000000000000000 0000000000000000 9000000002805d80 900000014c043558
[   29.514319]         900000000296c000 0000000000000001 900000014c043788 900000014c043768
[   29.514322]         900000000296c000 0000000000000000 900000000023aba4 00007ffff0080070
[   29.514326]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.514329]         ...
[   29.514331] Call Trace:
[   29.514331] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.514334] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.514337] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.514339] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.514342] [<900000000054bf98>] find_symbol+0x238/0x348
[   29.514345] [<9000000000550d9c>] load_module+0x2204/0x5d30
[   29.514348] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.514352] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.514356] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.514361] ---[ end trace ]---
[   29.556488] ------------[ cut here ]------------
[   29.556490] UBSAN: misaligned-access in kernel/module/main.c:387:2
[   29.556492] member access within misaligned address 00000000b7f2f1ff for type 'struct module'
[   29.556494] UBSAN: misaligned-access in kernel/module/version.c:38:25
[   29.556497] member access within misaligned address 00000000921296aa for type 'struct modversion_info'
[   29.556499] which requires 8 byte alignment
[   29.556501] CPU: 7 UID: 0 PID: 222 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   29.556503] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   29.556505] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000145e74000
[   29.556511]         9000000145e77800 9000000145e77808 0000000000000000 9000000145e77948
[   29.556515]         9000000145e77940 9000000145e77940 90000000080e8c50 6572617764726148
[   29.556519]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[   29.556523]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[   29.556526]         000000000000001f 9000000003f3aa60 0000000009608000 ffff80003313f498
[   29.556530]         0000000000000000 0000000000000000 9000000002805d80 9000000145e77808
[   29.556534]         900000000296c000 0000000000000004 ffff800033136694 0000000000000000
[   29.556537]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0080070
[   29.556541]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[   29.556545]         ...
[   29.556546] Call Trace:
[   29.556548] [<900000000023aba4>] show_stack+0x10c/0x228
[   29.556551] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[   29.556555] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[   29.556557] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[   29.556561] [<900000000055edac>] check_version+0x1dc/0x2f0
[   29.556565] [<900000000055ef3c>] check_modstruct_version+0x7c/0xc0
[   29.556568] [<900000000054f280>] load_module+0x6e8/0x5d30
[   29.556571] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[   29.556574] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[   29.556577] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[   29.556581] ---[ end trace ]---
[   29.606904] UBSAN: misaligned-access in kernel/module/version.c:42:18
[   29.606907] member access within misaligned address 00000000f4f5994d for type 'struct modversion_info'
[   29.656586] which requires 64 byte alignment
[   29.706631] which requires 8 byte alignment
[   29.706633] CPU: 6 UID: 0 PID: 218 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   48.118746] watchdog: Watchdog detected hard LOCKUP on cpu 6
[   48.138234] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   50.506746] rcu: INFO: rcu_sched self-detected stall on CPU
[   50.528052] Stack : 000000000000008e
[   50.577284] rcu: 	1-....: (5203 ticks this GP) idle=b7bc/1/0x4000000000000000 softirq=349/349 fqs=2413
[   50.626668]  0000000000000000
[   50.676071] rcu: 	(t=5293 jiffies g=-579 q=2316 ncpus=8)
[   50.726494]  900000000023aae8
[   50.777625] CPU: 1 UID: 0 PID: 223 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[   50.777628] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[   50.777629] pc 900000000048a888 ra 9000000000233dd0 tp 9000000145ea0000 sp 9000000145ea3790
[   50.777631] a0 0000000000000000 a1 9000000145ea0000 a2 9000000145ea34d8 a3 ffffffffffffffff
[   50.777632] a4 0000000000000000 a5 0000000000000040 a6 0000000000000000 a7 0000000000000000
[   50.777634] t0 0000000000000006 t1 9000000002987aa0 t2 ffffffffffffffff t3 0000000000000001
[   50.777635] t4 ffffffffffffffff t5 ffff8000339d8220 t6 000000000000001f t7 0000000000000000
[   50.777637] t8 0000000000000010 u0 0000000000000037 s9 9000000002d9d750 s0 00000000000000b0
[   50.777638] s1 0000000000000000 s2 9000000002805d80 s3 0000000000000004 s4 0000000000000000
[   50.777639] s5 0000000000000003 s6 ffff800002085618 s7 9000000002d9dbf0 s8 0000000000000010
[   50.777641]    ra: 9000000000233dd0 dump_stack_lvl+0x54/0xa0
[   50.777644]   ERA: 900000000048a888 __printk_cpu_sync_wait+0x18/0x28
[   50.777647]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[   50.777652]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[   50.777655]  EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
[   50.777658]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[   50.777661] ESTAT: 00000800 [INT] (IS=11 ECode=0 EsubCode=0)
[   50.777664]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
[   64.098746] watchdog: Watchdog detected hard LOCKUP on cpu 5
[   64.100929]  900000014c744000
[   76.026746] watchdog: Watchdog detected hard LOCKUP on cpu 1
[   76.039451]         900000014c7476e0
[   84.082746] watchdog: Watchdog detected hard LOCKUP on cpu 4
[   84.119938]  900000014c7476e8 0000000000000000
[   88.146752] watchdog: Watchdog detected hard LOCKUP on cpu 0
[   88.200308]  900000014c747828
[  108.066746] watchdog: Watchdog detected hard LOCKUP on cpu 3

[  108.079856]         900000014c747820 900000014c747820 0000000000000040 0000000000000000
[  112.386902]         0000000000000000 0000000000000000 747e13a118945c77 0000000000000001
[  112.442658]         9000000003f3aab8 0000000000aaaaaa ffff8000339d8220 000000000000001f
[  112.498450]         0000000000000000 0000000000000010 0000000009208000 ffff80003314b948
[  112.554472]         0000000000000000 0000000000000000 9000000002805d80 900000014c7476e8
[  112.610008]         900000000296c000 0000000000000003 ffff800033148fbb 0000000000000000
[  112.665588]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0080070
[  112.721106]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[  112.776547]         ...
[  112.831636] Call Trace:
[  112.831638] [<900000000023aba4>] show_stack+0x10c/0x228
[  112.942315] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  112.997566] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  113.053078] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  113.109079] [<900000000055edc4>] check_version+0x1f4/0x2f0
[  113.165254] [<900000000055ef3c>] check_modstruct_version+0x7c/0xc0
[  113.221619] [<900000000054f280>] load_module+0x6e8/0x5d30
[  113.277777] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[  113.333824] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[  113.389997] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  113.501727] Modules linked in: nvme_auth(+)
[  113.501732] ------------[ cut here ]------------
[  113.614058] UBSAN: misaligned-access in kernel/module/main.c:3758:2
[  113.670832] member access within misaligned address 00000000b7f2f1ff for type 'struct module'
[  113.729016] which requires 64 byte alignment
[  113.786745] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.13.0-rc7+ #2
[  113.844662] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  113.904692] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000000294c000
[  113.965490]         900000010020b9a0 900000010020b9a8 0000000000000000 900000010020bae8
[  114.025834]         900000010020bae0 900000010020bae0 0000000000000040 0000000000000000
[  114.085384]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[  114.143447]         00000000000010e0 0000000000000000 0000000000000000 0000000000000000
[  114.199781]         0000000000000000 0000000000000010 0000000007a08000 900000010020bd18
[  114.255633]         0000000000000000 0000000000000000 9000000002805d80 900000010020b9a8
[  114.310349]         900000000296c000 9000000002da2848 9000000002d9d758 0000000000000010
[  114.364125]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0e30040
[  114.417711]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  114.470997]         ...
[  114.523307] Call Trace:
[  114.523309] [<900000000023aba4>] show_stack+0x10c/0x228
[  114.623006] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  114.672098] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  114.721046] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  114.770590] [<90000000002245b4>] print_modules+0x9c/0x178
[  114.819928] [<900000000066da38>] watchdog_hardlockup_check+0x380/0x520
[  114.869519] [<900000000066d1e0>] watchdog_timer_fn+0xb0/0x518
[  114.919140] [<900000000057292c>] __hrtimer_run_queues+0x1bc/0x860
[  114.969093] [<9000000000576de4>] hrtimer_interrupt+0x1ec/0x9f8
[  115.018591] [<9000000000244450>] constant_timer_interrupt+0x60/0xc8
[  115.068247] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  115.117855] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  115.167510] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  115.217213] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  115.267261] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  115.317154] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  115.366980] [<90000000024c4568>] do_vint+0xc8/0x198
[  115.416303] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[  115.465563] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[  115.514559] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[  115.563462] [<9000000000413344>] do_idle+0x124/0x258
[  115.612003] [<9000000000413954>] cpu_startup_entry+0x6c/0xa0
[  115.660419] [<90000000024c9280>] kernel_init+0x0/0x120
[  115.708534] [<90000000025014dc>] console_on_rootfs+0x0/0x74

[  115.803772] ---[ end trace ]---

[  115.897119] CPU: 1 UID: 0 PID: 223 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[  115.897119] Sending NMI from CPU 0 to CPUs 1:
[  115.897121] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  115.897123] Stack : 0000000000000000 0000000000000000 900000000023aae8 9000000145ea0000
[  115.897126]         900000010020f910 900000010020f918 0000000000000000 900000010020fa58
[  115.897129]         900000010020fa50 900000010020fa50 90000000080eb018 6572617764726148
[  115.897132]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a400790
[  115.897135]         000000000000110a 0000000000000000 0000000000000000 0000000000000000
[  115.897139]         000000000000001f 9000000003f3aa60 0000000007e08000 9000000002d88500
[  115.897142]         0000000000000000 0000000000000000 9000000002805d80 900000010020f918
[  115.897145]         900000000296c000 0000000000000000 00000000000000b0 000000000000003f
[  115.897148]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0080070
[  115.897151]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[  115.897154]         ...
[  115.897155] Call Trace:
[  115.897156] [<900000000023aba4>] show_stack+0x10c/0x228
[  115.897158] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  115.897161] [<90000000004ff88c>] rcu_dump_cpu_stacks+0x1c4/0x570
[  115.897165] [<90000000005219e8>] rcu_sched_clock_irq+0x728/0x1c80
[  115.897168] [<900000000056ffa0>] update_process_times+0xb0/0x1d0
[  115.897171] [<90000000005a21b4>] tick_nohz_handler+0xe4/0x4b0
[  115.897173] [<900000000057292c>] __hrtimer_run_queues+0x1bc/0x860
[  115.897175] [<9000000000576de4>] hrtimer_interrupt+0x1ec/0x9f8
[  115.897178] [<9000000000244450>] constant_timer_interrupt+0x60/0xc8
[  115.897180] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  115.897183] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  115.897186] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  115.897188] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  115.897191] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  115.897194] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  115.897197] [<90000000024c4568>] do_vint+0xc8/0x198
[  115.897199] [<900000000048a888>] __printk_cpu_sync_wait+0x18/0x28
[  115.897201] [<9000000000233dd0>] dump_stack_lvl+0x54/0xa0
[  115.897204] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  115.897206] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  115.897209] [<900000000054cdac>] find_module_all+0x17c/0x220
[  115.897211] [<900000000054cf98>] module_patient_check_exists.isra.0+0x40/0x268
[  115.897214] [<900000000054f720>] load_module+0xb88/0x5d30
[  115.897217] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[  115.897220] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[  115.897222] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  115.897226] Modules linked in:
[  115.897239] ---[ end trace ]---
[  117.987867]  nvme_auth(+)
[  118.031075] Modules linked in: nvme_auth(+)
[  118.074606] NMI backtrace for cpu 1
[  118.117910] CPU: 1 UID: 0 PID: 223 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[  118.162363] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  118.209568] pc 900000000048a888 ra 9000000000233dd0 tp 9000000145ea0000 sp 9000000145ea3790
[  118.257303] a0 0000000000000000 a1 9000000145ea0000 a2 9000000145ea34d8 a3 ffffffffffffffff
[  118.305103] a4 0000000000000000 a5 0000000000000040 a6 0000000000000000 a7 0000000000000000
[  118.353013] t0 0000000000000002 t1 9000000002987aa0 t2 ffffffffffffffff t3 0000000000000001
[  118.400828] t4 ffffffffffffffff t5 ffff8000339d8220 t6 000000000000001f t7 0000000000000000
[  118.448784] t8 0000000000000010 u0 0000000000000037 s9 9000000002d9d750 s0 00000000000000b0
[  118.496967] s1 0000000000000000 s2 9000000002805d80 s3 0000000000000004 s4 0000000000000000
[  118.545018] s5 0000000000000003 s6 ffff800002085618 s7 9000000002d9dbf0 s8 0000000000000010
[  118.592957]    ra: 9000000000233dd0 dump_stack_lvl+0x54/0xa0
[  118.640947]   ERA: 900000000048a888 __printk_cpu_sync_wait+0x18/0x28
[  118.689171]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[  118.737633]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[  118.785873]  EUEN: 00000007 (+FPE +SXE +ASXE -BTE)
[  118.834054]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[  118.882185] ESTAT: 00001000 [INT] (IS=12 ECode=0 EsubCode=0)
[  118.930400]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
[  118.979087] CPU: 1 UID: 0 PID: 223 Comm: (udev-worker) Not tainted 6.13.0-rc7+ #2
[  119.028818] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  119.081052] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000145ea0000
[  119.133398]         900000010020fb90 900000010020fb98 0000000000000000 900000010020fcd8
[  119.184187]         900000010020fcd0 900000010020fcd0 0000000000000040 0000000000000000
[  119.233158]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[  119.282345]         000000000000114a 0000000000000000 0000000000000000 0000000000000000
[  119.331751]         0000000000000000 0000000000000010 0000000007e08000 0000000000000000
[  119.380529]         0000000000000000 0000000000000000 9000000002805d80 900000010020fb98
[  119.429016]         900000000296c000 0000000000000000 0000000000000000 9000000145ea3650
[  119.477552]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0080070
[  119.526176]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[  119.574892]         ...
[  119.623352] Call Trace:
[  119.623354] [<900000000023aba4>] show_stack+0x10c/0x228
[  119.720242] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  119.769048] [<90000000024949e4>] nmi_cpu_backtrace+0x1a4/0x1e0
[  119.817852] [<900000000023b244>] handle_backtrace+0x24/0x98
[  119.866895] [<90000000005c81e8>] __flush_smp_call_function_queue+0x1e8/0xd68
[  119.916460] [<90000000002559c4>] loongson_ipi_interrupt+0x1d4/0x3a0
[  119.966227] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  120.016163] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  120.066167] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  120.116059] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  120.166168] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  120.216179] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  120.266164] [<90000000024c4568>] do_vint+0xc8/0x198
[  120.315914] [<900000000048a888>] __printk_cpu_sync_wait+0x18/0x28
[  120.366007] [<9000000000233dd0>] dump_stack_lvl+0x54/0xa0
[  120.415991] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  120.465788] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  120.516232] [<900000000054cdac>] find_module_all+0x17c/0x220
[  120.566752] [<900000000054cf98>] module_patient_check_exists.isra.0+0x40/0x268
[  120.617806] [<900000000054f720>] load_module+0xb88/0x5d30
[  120.668765] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[  120.719976] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[  120.771033] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  120.871854] Modules linked in: nvme_auth(+)
[  120.922092] Modules linked in:
[  120.922092] Sending NMI from CPU 7 to CPUs 0:
[  121.021854]  nvme_auth(+)
[  121.071464] Modules linked in: nvme_auth(+)
[  121.121184] watchdog: BUG: soft lockup - CPU#4 stuck for 57s! [swapper/4:0]
[  121.172113] Modules linked in: nvme_auth(+)
[  121.223217] CPU: 4 UID: 0 PID: 0 Comm: swapper/4 Not tainted 6.13.0-rc7+ #2
[  121.275451] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  121.330594] pc 90000000002378a0 ra 90000000024c896c tp 9000000100444000 sp 9000000100447dd0
[  121.386428] a0 0000000000000005 a1 900000000b00f7d8 a2 0000000000000018 a3 90000000024d1530
[  121.441834] a4 9000000114157d70 a5 900000000b0006c8 a6 900000000b0006c4 a7 900000000b0006cc
[  121.495479] t0 0000000000000000 t1 000000000002d3cc t2 9000000002962000 t3 9000000003f5e2b8
[  121.547585] t4 9000000002962000 t5 0000000000000000 t6 0000000000000002 t7 0000000000000000
[  121.599473] t8 0000000e783c3d64 u0 0000000000000000 s9 90000000013c0000 s0 0000000000000004
[  121.651155] s1 0000000000000000 s2 900000000296c000 s3 0000000000000000 s4 0000000000000004
[  121.702725] s5 900000000296c000 s6 0000000000000000 s7 0000000000000002 s8 0000000000000000
[  121.753796]    ra: 90000000024c896c arch_cpu_idle+0x1c/0x50
[  121.804711]   ERA: 90000000002378a0 __arch_cpu_idle+0x20/0x24
[  121.855824]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[  121.907356]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[  121.958101]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
[  122.008720]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[  122.059034] ESTAT: 00000800 [INT] (IS=11 ECode=0 EsubCode=0)
[  122.109567]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
[  122.160462] CPU: 4 UID: 0 PID: 0 Comm: swapper/4 Not tainted 6.13.0-rc7+ #2
[  122.212001] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  122.266347] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000100444000
[  122.321050]         900000010021bab0 900000010021bab8 0000000000000000 900000010021bbf8
[  122.375345]         900000010021bbf0 900000010021bbf0 0000000000000040 0000000000000000
[  122.427593]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[  122.478494]         0000000000001189 0000000000000000 0000000000000000 0000000000000000
[  122.529380]         0000000000000000 0000000000000010 0000000008a08000 900000010038c508
[  122.580308]         0000000000000000 0000000000000000 9000000002805d80 900000010021bab8
[  122.630723]         900000000296c000 9000000100447c90 0000000000000000 0000000000000000
[  122.680979]         0000000000000039 0000000000000000 900000000023aba4 00007ffff1063238
[  122.731581]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  122.782308]         ...
[  122.832717] Call Trace:
[  122.832718] [<900000000023aba4>] show_stack+0x10c/0x228
[  122.933875] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  122.984219] [<900000000066d4f8>] watchdog_timer_fn+0x3c8/0x518
[  123.035019] [<900000000057292c>] __hrtimer_run_queues+0x1bc/0x860
[  123.085860] [<9000000000576de4>] hrtimer_interrupt+0x1ec/0x9f8
[  123.136897] [<9000000000244450>] constant_timer_interrupt+0x60/0xc8
[  123.188071] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  123.239331] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  123.290399] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  123.341121] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  123.392016] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  123.442754] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  123.493620] [<90000000024c4568>] do_vint+0xc8/0x198
[  123.544199] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[  123.594784] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[  123.645367] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[  123.696044] [<9000000000413344>] do_idle+0x124/0x258
[  123.746517] [<9000000000413950>] cpu_startup_entry+0x68/0xa0
[  123.797021] [<9000000000256dc4>] start_secondary+0xb4/0xe0
[  123.847587] [<90000000024c9138>] smpboot_entry+0x68/0x6c

[  123.947347] watchdog: BUG: soft lockup - CPU#5 stuck for 71s! [swapper/5:0]
[  123.997916] Modules linked in: nvme_auth(+)
[  124.048106] CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Tainted: G             L     6.13.0-rc7+ #2
[  124.099509] Tainted: [L]=SOFTLOCKUP
[  124.150347] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  124.204686] pc 90000000002378a0 ra 90000000024c896c tp 9000000100448000 sp 900000010044bdd0
[  124.259524] a0 0000000000000005 a1 900000000b40f7d8 a2 0000000000000018 a3 90000000024d1530
[  124.314488] a4 90000001008f7cf0 a5 900000000b4006c8 a6 900000000b4006c4 a7 900000000b4006cc
[  124.369721] t0 0000000000000000 t1 0000000000022114 t2 9000000002962000 t3 9000000003f5e2b8
[  124.425146] t4 9000000002962000 t5 0000000000000000 t6 0000000000000002 t7 0000000000000000
[  124.480569] t8 0000000b1db0a162 u0 0000000000000000 s9 9000000000231380 s0 0000000000000004
[  124.535978] s1 0000000000000000 s2 900000000296c000 s3 0000000000000000 s4 0000000000000004
[  124.590880] s5 900000000296c000 s6 900000000023137c s7 90000000013c0000 s8 9000000001635000
[  124.645288]    ra: 90000000024c896c arch_cpu_idle+0x1c/0x50
[  124.699435]   ERA: 90000000002378a0 __arch_cpu_idle+0x20/0x24
[  124.751934]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[  124.803058]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[  124.853877]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
[  124.904682]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[  124.955343] ESTAT: 00000800 [INT] (IS=11 ECode=0 EsubCode=0)
[  125.006354]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
[  125.057755] CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Tainted: G             L     6.13.0-rc7+ #2
[  125.110158] Tainted: [L]=SOFTLOCKUP
[  125.162326] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  125.217498] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000100448000
[  125.273160]         900000010021fab0 900000010021fab8 0000000000000000 900000010021fbf8
[  125.328678]         900000010021fbf0 900000010021fbf0 0000000000000040 0000000000000000
[  125.383880]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[  125.439385]         00000000000011c2 0000000000000000 0000000000000000 0000000000000000
[  125.495015]         0000000000000000 0000000000000010 0000000008e08000 9000000100399408
[  125.550237]         0000000000000000 0000000000000000 9000000002805d80 900000010021fab8
[  125.604973]         900000000296c000 900000010044bc90 0000000000000000 0000000000000000
[  125.659222]         0000000000000047 0000000000000000 900000000023aba4 00007ffff0a97e10
[  125.711756]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  125.762554]         ...
[  125.812745] Call Trace:
[  125.812746] [<900000000023aba4>] show_stack+0x10c/0x228
[  125.913362] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  125.963681] [<900000000066d4f8>] watchdog_timer_fn+0x3c8/0x518
[  126.014340] [<900000000057292c>] __hrtimer_run_queues+0x1bc/0x860
[  126.065507] [<9000000000576de4>] hrtimer_interrupt+0x1ec/0x9f8
[  126.116780] [<9000000000244450>] constant_timer_interrupt+0x60/0xc8
[  126.168272] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  126.220066] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  126.271417] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  126.323007] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  126.374720] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  126.426560] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  126.478445] [<90000000024c4568>] do_vint+0xc8/0x198
[  126.530036] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[  126.581701] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[  126.633212] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[  126.684689] [<9000000000413344>] do_idle+0x124/0x258
[  126.735897] [<9000000000413950>] cpu_startup_entry+0x68/0xa0
[  126.787270] [<9000000000256dc4>] start_secondary+0xb4/0xe0
[  126.838497] [<90000000024c9138>] smpboot_entry+0x68/0x6c

[  126.940138] CPU: 1 UID: 0 PID: 223 Comm: (udev-worker) Tainted: G             L     6.13.0-rc7+ #2
[  126.940166] ------------[ cut here ]------------
[  126.992500] Tainted: [L]=SOFTLOCKUP
[  126.992501] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  126.992503] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000145ea0000
[  127.044497] UBSAN: misaligned-access in kernel/hung_task.c:207:2

[  127.096362]         9000000145ea3610 9000000145ea3618
[  127.151678] member access within misaligned address 00000000ab39bd96 for type 'struct task_struct'
[  127.207500]  0000000000000000 9000000145ea3758
[  127.263673] which requires 64 byte alignment
[  127.319264]         9000000145ea3750 9000000145ea3750 90000000080eed30 6572617764726148
[  127.604615]         203a656d616e2065 0000000000000000 747e13a118945c77 0000000000000001
[  127.662287]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  127.718260]         000000000000001f 9000000003f3aa60 0000000007e08000 9000000002d9d750
[  127.772477]         0000000000000000 0000000000000000 9000000002805d80 9000000145ea3618
[  127.826567]         900000000296c000 0000000000000003 ffff800002085618 9000000002d9dbf0
[  127.880578]         0000000000000010 0000000000000000 900000000023aba4 00007ffff0080070
[  127.934478]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[  127.988210]         ...
[  128.041570] Call Trace:
[  128.041571] [<900000000023aba4>] show_stack+0x10c/0x228
[  128.148453] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  128.201522] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  128.254466] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  128.307790] [<900000000054cdac>] find_module_all+0x17c/0x220
[  128.361047] [<900000000054cf98>] module_patient_check_exists.isra.0+0x40/0x268
[  128.414965] [<900000000054f720>] load_module+0xb88/0x5d30
[  128.468881] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[  128.522777] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[  128.576475] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  128.681852] NMI backtrace for cpu 0
[  128.681856] ---[ end trace ]---
[  128.732588] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G             L     6.13.0-rc7+ #2
[  128.732592] Tainted: [L]=SOFTLOCKUP
[  128.881464] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  128.934659] pc 90000000002378a0 ra 90000000024c896c tp 900000000294c000 sp 900000000294fd60
[  128.988494] a0 0000000000000005 a1 900000000a00f7d8 a2 0000000000000018 a3 90000000024d1530
[  129.042611] a4 9000000100863d70 a5 900000000a0006c8 a6 900000000a0006c4 a7 900000000a0006cc
[  129.096980] t0 0000000000000000 t1 000000000003c07c t2 9000000002962000 t3 9000000003f5e2b8
[  129.151491] t4 9000000002962000 t5 0000000000000000 t6 0000000000000002 t7 0000000000000000
[  129.205986] t8 0000001c2494411c u0 0000000000000000 s9 90000000028365a0 s0 0000000000000004
[  129.260547] s1 0000000000000000 s2 900000000296c000 s3 0000000000000000 s4 0000000000000004
[  129.314556] s5 900000000296c000 s6 0000000000000000 s7 0000000000000000 s8 90000000028365a0
[  129.368754]    ra: 90000000024c896c arch_cpu_idle+0x1c/0x50
[  129.422933]   ERA: 90000000002378a0 __arch_cpu_idle+0x20/0x24
[  129.477321]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[  129.531961]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[  129.586230]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
[  129.640387]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[  129.694349] ESTAT: 00001000 [INT] (IS=12 ECode=0 EsubCode=0)
[  129.748484]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
[  129.802791] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G             L     6.13.0-rc7+ #2
[  129.858022] Tainted: [L]=SOFTLOCKUP
[  129.912640] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  129.970683] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000000294c000
[  130.029265]         900000010020bb90 900000010020bb98 0000000000000000 900000010020bcd8
[  130.087960]         900000010020bcd0 900000010020bcd0 0000000000000040 0000000000000000
[  130.146294]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[  130.204876]         000000000000121b 0000000000000000 0000000000000000 0000000000000000
[  130.263509]         0000000000000000 0000000000000010 0000000007a08000 0000000000000000
[  130.321825]         0000000000000000 0000000000000000 9000000002805d80 900000010020bb98
[  130.379860]         900000000296c000 0000000000000000 0000000000000000 900000000294fc20
[  130.437678]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0e30040
[  130.495363]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  130.552720]         ...
[  130.609133] Call Trace:
[  130.609135] [<900000000023aba4>] show_stack+0x10c/0x228
[  130.721012] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  130.775505] [<90000000024949e4>] nmi_cpu_backtrace+0x1a4/0x1e0
[  130.828591] [<900000000023b244>] handle_backtrace+0x24/0x98
[  130.881010] [<90000000005c81e8>] __flush_smp_call_function_queue+0x1e8/0xd68
[  130.933715] [<90000000002559c4>] loongson_ipi_interrupt+0x1d4/0x3a0
[  130.986531] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  131.038673] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  131.090106] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  131.141414] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  131.192326] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  131.242835] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  131.293389] [<90000000024c4568>] do_vint+0xc8/0x198
[  131.343873] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[  131.394600] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[  131.445388] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[  131.496287] [<9000000000413344>] do_idle+0x124/0x258
[  131.547215] [<9000000000413950>] cpu_startup_entry+0x68/0xa0
[  131.597762] [<90000000024c9280>] kernel_init+0x0/0x120
[  131.648507] [<90000000025014dc>] console_on_rootfs+0x0/0x74

[  131.749566] watchdog: BUG: soft lockup - CPU#3 stuck for 35s! [swapper/3:0]
[  131.801329] Modules linked in: nvme_auth
[  131.852716] CPU: 3 UID: 0 PID: 0 Comm: swapper/3 Tainted: G             L     6.13.0-rc7+ #2
[  131.905031] Tainted: [L]=SOFTLOCKUP
[  131.956619] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  132.011462] pc 90000000002378a0 ra 90000000024c896c tp 9000000100440000 sp 9000000100443dd0
[  132.067042] a0 0000000000000005 a1 900000000ac0f7d8 a2 0000000000000018 a3 90000000024d1530
[  132.122525] a4 900000011415fd70 a5 900000000ac006c8 a6 900000000ac006c4 a7 900000000ac006cc
[  132.134746] watchdog: Watchdog detected hard LOCKUP on cpu 7
[  132.177993] t0 0000000000000000 t1 000000000004642c t2 9000000002962000 t3 9000000003f5e2b8
[  132.290375] t4 9000000002962000 t5 0000000000000000 t6 0000000000000002 t7 0000000000000000
[  132.347430] t8 000000139287dd9a u0 0000000000000000 s9 0000000000000001 s0 0000000000000004
[  132.403872] s1 0000000000000000 s2 900000000296c000 s3 0000000000000000 s4 0000000000000004
[  132.459810] s5 900000000296c000 s6 90000000013c0000 s7 0000000000000001 s8 90000000013bfb98
[  132.513932]    ra: 90000000024c896c arch_cpu_idle+0x1c/0x50
[  132.566447]   ERA: 90000000002378a0 __arch_cpu_idle+0x20/0x24
[  132.618996]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[  132.671880]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[  132.724427]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
[  132.777023]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[  132.829631] ESTAT: 00000800 [INT] (IS=11 ECode=0 EsubCode=0)
[  132.882582]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
[  132.935930] CPU: 3 UID: 0 PID: 0 Comm: swapper/3 Tainted: G             L     6.13.0-rc7+ #2
[  132.989654] Tainted: [L]=SOFTLOCKUP
[  133.042840] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  133.099423] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000100440000
[  133.156448]         9000000100217ab0 9000000100217ab8 0000000000000000 9000000100217bf8
[  133.213660]         9000000100217bf0 9000000100217bf0 0000000000000040 0000000000000000
[  133.270640]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[  133.327712]         0000000000001255 0000000000000000 0000000000000000 0000000000000000
[  133.384662]         0000000000000000 0000000000000010 0000000008608000 9000000100383b08
[  133.440843]         0000000000000000 0000000000000000 9000000002805d80 9000000100217ab8
[  133.496338]         900000000296c000 9000000100443c90 0000000000000000 0000000000000000
[  133.550053]         0000000000000023 0000000000000000 900000000023aba4 00007ffff0080070
[  133.602148]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  133.653973]         ...
[  133.705609] Call Trace:
[  133.705610] [<900000000023aba4>] show_stack+0x10c/0x228
[  133.808368] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  133.860262] [<900000000066d4f8>] watchdog_timer_fn+0x3c8/0x518
[  133.912510] [<900000000057292c>] __hrtimer_run_queues+0x1bc/0x860
[  133.965135] [<9000000000576de4>] hrtimer_interrupt+0x1ec/0x9f8
[  134.017887] [<9000000000244450>] constant_timer_interrupt+0x60/0xc8
[  134.071049] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  134.123833] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  134.177040] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  134.230013] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  134.283347] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  134.336618] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  134.389903] [<90000000024c4568>] do_vint+0xc8/0x198
[  134.442793] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[  134.495546] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[  134.548173] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[  134.600755] [<9000000000413344>] do_idle+0x124/0x258
[  134.653206] [<9000000000413950>] cpu_startup_entry+0x68/0xa0
[  134.705629] [<9000000000256dc4>] start_secondary+0xb4/0xe0
[  134.757939] [<90000000024c9138>] smpboot_entry+0x68/0x6c

[  134.861946] CPU: 5 UID: 0 PID: 69 Comm: khungtaskd Tainted: G             L     6.13.0-rc7+ #2
[  134.915329] Tainted: [L]=SOFTLOCKUP
[  134.968252] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  135.024727] Stack : 000000000000008e 0000000000000000 900000000023aae8 90000001008c0000
[  135.081789]         90000001008c3ba0 90000001008c3ba8 0000000000000000 90000001008c3ce8
[  135.138905]         90000001008c3ce0 90000001008c3ce0 0000000000000040 0000000000000000
[  135.195744]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[  135.252822]         0000000000001279 0000000000000000 0000000000000000 0000000000000000
[  135.309780]         0000000000000000 0000000000000010 0000000008e08000 90000001004299b8
[  135.366131]         0000000000000000 0000000000000000 9000000002805d80 90000001008c3ba8
[  135.421792]         900000000296c000 00000000003fffff 0000000000000000 9000000100381598
[  135.476885]         0000000000000038 0000000000000000 900000000023aba4 00007ffff0a97e10
[  135.531557]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  135.584407]         ...
[  135.635064] Call Trace:
[  135.635065] [<900000000023aba4>] show_stack+0x10c/0x228
[  135.736306] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  135.786458] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  135.835766] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  135.885711] [<900000000066c97c>] watchdog+0x654/0xc58
[  135.935726] [<9000000000367010>] kthread+0x1a0/0x3c0
[  135.985730] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  136.085457] Modules linked in: nvme_auth
[  136.085462] ---[ end trace ]---
[  136.184221] Sending NMI from CPU 6 to CPUs 7:
[  136.233472] NMI backtrace for cpu 7
[  136.282660] CPU: 7 UID: 0 PID: 218 Comm: (udev-worker) Tainted: G             L     6.13.0-rc7+ #2
[  136.333418] Tainted: [L]=SOFTLOCKUP
[  136.383544] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  136.437031] pc 900000000046a7f0 ra 90000000024d8f30 tp 900000014c744000 sp 900000014c747840
[  136.490649] a0 9000000002d9d2f8 a1 900000014c744008 a2 0000000000000000 a3 900000014c747920
[  136.543860] a4 900000010067fdb0 a5 900000000bc006c8 a6 900000000bc006c4 a7 900000000bc006cc
[  136.595447] t0 0000000000000000 t1 747e13a118945c77 t2 0000004100000000 t3 90000001009a8a00
[  136.645687] t4 90000001009b5900 t5 0000000000000000 t6 900000014c747920 t7 900000014c40f338
[  136.696036] t8 0000000000000418 u0 0000000000000000 s9 90000001009a8a03 s0 90000001009a8a00
[  136.746631] s1 9000000002d9d2f8 s2 900000014c744000 s3 9000000145e74000 s4 0000000000000000
[  136.797040] s5 0000000000000000 s6 fffffffffffffff8 s7 0000000000000000 s8 90000001009a8a1c
[  136.847539]    ra: 90000000024d8f30 __mutex_lock.constprop.0+0xb68/0x2090
[  136.898545]   ERA: 900000000046a7f0 mutex_spin_on_owner+0x128/0x368
[  136.949923]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[  137.001655]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[  137.053164]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
[  137.104816]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[  137.155902] ESTAT: 00001000 [INT] (IS=12 ECode=0 EsubCode=0)
[  137.207614]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
[  137.259454] CPU: 7 UID: 0 PID: 218 Comm: (udev-worker) Tainted: G             L     6.13.0-rc7+ #2
[  137.312471] Tainted: [L]=SOFTLOCKUP
[  137.364985] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  137.420943] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000014c744000
[  137.477346]         9000000100227b90 9000000100227b98 0000000000000000 9000000100227cd8
[  137.533696]         9000000100227cd0 9000000100227cd0 0000000000000040 0000000000000000
[  137.589628]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[  137.645650]         00000000000012a7 0000000000000000 0000000000000000 0000000000000000
[  137.701793]         0000000000000000 0000000000000010 0000000009608000 0000000000000000
[  137.757440]         0000000000000000 0000000000000000 9000000002805d80 9000000100227b98
[  137.812678]         900000000296c000 0000000000000000 0000000000000000 900000014c747700
[  137.867767]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0080070
[  137.922690]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  137.977424]         ...
[  138.031696] Call Trace:
[  138.031697] [<900000000023aba4>] show_stack+0x10c/0x228
[  138.140163] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  138.194627] [<90000000024949e4>] nmi_cpu_backtrace+0x1a4/0x1e0
[  138.249201] [<900000000023b244>] handle_backtrace+0x24/0x98
[  138.303791] [<90000000005c81e8>] __flush_smp_call_function_queue+0x1e8/0xd68
[  138.358713] [<90000000002559c4>] loongson_ipi_interrupt+0x1d4/0x3a0
[  138.413380] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  138.467691] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  138.520397] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  138.571368] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  138.622549] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  138.673974] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  138.725231] [<90000000024c4568>] do_vint+0xc8/0x198
[  138.776256] [<900000000046a7f0>] mutex_spin_on_owner+0x128/0x368
[  138.827777] [<90000000024d8f30>] __mutex_lock.constprop.0+0xb68/0x2090
[  138.879898] [<900000000054f314>] load_module+0x77c/0x5d30
[  138.932101] [<9000000000554d88>] init_module_from_file+0xa0/0x100
[  138.984414] [<90000000005550e0>] sys_finit_module+0x2d0/0x918
[  139.036899] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  139.159404] SCSI subsystem initialized
[  139.160468] nvme nvme0: pci function 0000:05:00.0
[  139.263875] ACPI: bus type USB registered
[  139.265476] r8169 0000:02:00.0: can't disable ASPM; OS doesn't have ASPM control
[  139.316577] usbcore: registered new interface driver usbfs
[  139.372086] ------------[ cut here ]------------
[  139.422863] usbcore: registered new interface driver hub
[  139.476037] UBSAN: misaligned-access in block/blk-mq.c:4432:2
[  139.529519] usbcore: registered new device driver usb
[  139.582901] member access within misaligned address 00000000ed7ad0e9 for type 'struct blk_mq_hw_ctx'
[  139.691793] which requires 64 byte alignment
[  139.747051] CPU: 0 UID: 0 PID: 107 Comm: kworker/0:5 Tainted: G             L     6.13.0-rc7+ #2
[  139.803585] Tainted: [L]=SOFTLOCKUP
[  139.859173] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  139.917754] Workqueue: events work_for_cpu_fn
[  139.974682] Stack : 0000000000000000 0000000000000000 900000000023aae8 9000000104544000
[  140.031308]         9000000104547630 9000000104547638 0000000000000000 9000000104547778
[  140.087988]         9000000104547770 9000000104547770 0000000000000040 0000000000000000
[  140.144342]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[  140.200704]         00000000000012d6 0000000000000000 0000000000000000 0000000000000000
[  140.256986]         0000000000000000 0000000000000010 0000000007a08000 0000000000000000
[  140.312938]         0000000000000000 0000000000000000 9000000002805d80 9000000104547638
[  140.368610]         900000000296c000 0000000000000000 0000000000000000 900000000296c000
[  140.423905]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0e30040
[  140.478598]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  140.532904]         ...
[  140.586483] Call Trace:
[  140.586485] [<900000000023aba4>] show_stack+0x10c/0x228
[  140.693500] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  140.747301] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  140.800848] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  140.854791] [<9000000001278954>] blk_mq_alloc_and_init_hctx+0xf1c/0x10a8
[  140.908448] [<900000000127b214>] blk_mq_realloc_hw_ctxs+0x4dc/0xb98
[  140.961555] [<90000000012948e8>] blk_mq_init_allocated_queue+0x190/0x10b8
[  141.013202] [<90000000012958dc>] blk_mq_alloc_queue+0xcc/0x208
[  141.063185] [<ffff8000021b6650>] nvme_alloc_admin_tag_set+0x1a8/0x460 [nvme_core]
[  141.113932] [<ffff8000024087e8>] nvme_probe+0x4d0/0x13d0 [nvme]
[  141.164855] [<90000000016791fc>] local_pci_probe+0x7c/0x1a8
[  141.215626] [<90000000003378e0>] work_for_cpu_fn+0x38/0xa8
[  141.266223] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  141.317227] [<9000000000350d94>] worker_thread+0x314/0x1240
[  141.368433] [<9000000000367010>] kthread+0x1a0/0x3c0
[  141.419642] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  141.522529] ---[ end trace ]---
[  141.573792] ------------[ cut here ]------------
[  141.625201] UBSAN: misaligned-access in block/blk-mq.c:3786:2
[  141.676984] member access within misaligned address 0000000092e34d2f for type 'struct blk_mq_hw_ctx'
[  141.730307] which requires 64 byte alignment
[  141.783520] CPU: 0 UID: 0 PID: 107 Comm: kworker/0:5 Tainted: G             L     6.13.0-rc7+ #2
[  141.837989] Tainted: [L]=SOFTLOCKUP
[  141.891700] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  141.948731] Workqueue: events work_for_cpu_fn
[  142.005664] Stack : 0000000000000028 0000000000000000 900000000023aae8 9000000104544000
[  142.063807]         90000001045476c0 90000001045476c8 0000000000000000 9000000104547808
[  142.122046]         9000000104547800 9000000104547800 0000000000000040 0000000000000000
[  142.179897]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[  142.237840]         00000000000012fc 0000000000000000 0000000000000000 0000000000000000
[  142.295866]         0000000000000000 0000000000000010 0000000007a08000 0000000000000028
[  142.353522]         0000000000000000 0000000000000000 9000000002805d80 90000001045476c8
[  142.410837]         900000000296c000 0000000000000000 90000000035358c0 9000000104547728
[  142.467697]         9000000104c39620 0000000000000000 900000000023aba4 00007ffff0e30040
[  142.524305]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  142.580835]         ...
[  142.636810] Call Trace:
[  142.636812] [<900000000023aba4>] show_stack+0x10c/0x228
[  142.748368] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  142.804410] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  142.860279] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  142.916636] [<900000000127b68c>] blk_mq_realloc_hw_ctxs+0x954/0xb98
[  142.972713] [<90000000012948e8>] blk_mq_init_allocated_queue+0x190/0x10b8
[  143.028485] [<90000000012958dc>] blk_mq_alloc_queue+0xcc/0x208
[  143.083995] [<ffff8000021b6650>] nvme_alloc_admin_tag_set+0x1a8/0x460 [nvme_core]
[  143.140176] [<ffff8000024087e8>] nvme_probe+0x4d0/0x13d0 [nvme]
[  143.196058] [<90000000016791fc>] local_pci_probe+0x7c/0x1a8
[  143.251778] [<90000000003378e0>] work_for_cpu_fn+0x38/0xa8
[  143.306578] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  143.360623] [<9000000000350d94>] worker_thread+0x314/0x1240
[  143.414131] [<9000000000367010>] kthread+0x1a0/0x3c0
[  143.466997] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  143.567660] ---[ end trace ]---
[  143.616393] ------------[ cut here ]------------
[  143.665190] UBSAN: misaligned-access in net/core/dev.c:1150:2
[  143.714737] member access within misaligned address 000000000506229a for type 'struct net_device'
[  143.765290] which requires 64 byte alignment
[  143.815691] CPU: 0 UID: 0 PID: 106 Comm: kworker/0:4 Tainted: G             L     6.13.0-rc7+ #2
[  143.867725] Tainted: [L]=SOFTLOCKUP
[  143.919513] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  143.975044] Workqueue: events work_for_cpu_fn
[  144.030667] Stack : 900000010454bac4 0000000000000000 900000000023aae8 9000000104548000
[  144.087847]         900000010454b890 900000010454b898 0000000000000000 900000010454b9d8
[  144.144414]         900000010454b9d0 900000010454b9d0 0000000000000040 0000000000000000
[  144.201109]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[  144.257945]         0000000000001321 0000000000000000 0000000000000000 0000000000000000
[  144.315016]         0000000000000000 0000000000000010 0000000007a08000 900000010454bac4
[  144.371933]         0000000000000000 0000000000000000 9000000002805d80 900000010454b898
[  144.428251]         900000000296c000 0000000000020000 0000000000000000 9000000003fccc50
[  144.484190]         0000000000000001 0000000000000000 900000000023aba4 00007ffff0e30040
[  144.539946]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  144.595443]         ...
[  144.650350] Call Trace:
[  144.650352] [<900000000023aba4>] show_stack+0x10c/0x228
[  144.758991] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  144.813227] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  144.867444] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  144.922221] [<9000000001c49ed4>] dev_prep_valid_name.isra.0+0x574/0x658
[  144.977172] [<9000000001c7a480>] register_netdevice+0x170/0x1790
[  145.032242] [<9000000001c7bac8>] register_netdev+0x28/0x68
[  145.086938] [<ffff8000026cc91c>] rtl_init_one+0xdb4/0x3778 [r8169]
[  145.141747] [<90000000016791fc>] local_pci_probe+0x7c/0x1a8
[  145.196774] [<90000000003378e0>] work_for_cpu_fn+0x38/0xa8
[  145.251628] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  145.306293] [<9000000000350d94>] worker_thread+0x314/0x1240
[  145.360143] [<9000000000367010>] kthread+0x1a0/0x3c0
[  145.413003] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  145.517223] ---[ end trace ]---
[  145.567505] r8169 0000:02:00.0 eth0: RTL8168h/8111h, 00:26:f8:90:3c:34, XID 541, IRQ 55
[  145.617293] r8169 0000:02:00.0 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
[  145.690062] nvme nvme0: allocated 64 MiB host memory buffer (2 segments).
[  145.759181] nvme nvme0: 8/0/0 default/read/poll queues
[  145.847566]  nvme0n1: p1 p2 p3
[  145.900127] r8169 0000:02:00.0 enp2s0: renamed from eth0
[  145.955885] ehci-pci 0000:00:04.1: EHCI Host Controller
[  146.006543] ehci-pci 0000:00:04.1: new USB bus registered, assigned bus number 1
[  146.057958] ehci-pci 0000:00:04.1: irq 64, io mem 0xe8015150000
[  146.109816] libata version 3.00 loaded.
[  146.118756] ehci-pci 0000:00:04.1: USB f.f started, EHCI 1.00
[  146.170267] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[  146.222894] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[  146.275165] usb usb1: Product: EHCI Host Controller
[  146.327733] usb usb1: Manufacturer: Linux 6.13.0-rc7+ ehci_hcd
[  146.380458] usb usb1: SerialNumber: 0000:00:04.1
[  146.433350] hub 1-0:1.0: USB hub found
[  146.485976] hub 1-0:1.0: 4 ports detected
[  146.538571] ehci-pci 0000:00:05.1: EHCI Host Controller
[  146.590858] ehci-pci 0000:00:05.1: new USB bus registered, assigned bus number 2
[  146.643610] ehci-pci 0000:00:05.1: irq 65, io mem 0xe8015160000
[  146.697190] ------------[ cut here ]------------
[  146.749232] UBSAN: misaligned-access in drivers/usb/host/ehci-timer.c:300:2
[  146.801922] member access within misaligned address 000000002c97ace4 for type 'struct ehci_itd'
[  146.855491] which requires 32 byte alignment
[  146.909100] CPU: 0 UID: 0 PID: 107 Comm: kworker/0:5 Tainted: G             L     6.13.0-rc7+ #2
[  146.964004] Tainted: [L]=SOFTLOCKUP
[  147.018402] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  147.076444] Workqueue: pm pm_runtime_work
[  147.134270] Stack : 0000000000000010 0000000000000000 900000000023aae8 9000000104544000
[  147.193209]         90000001045475a0 90000001045475a8 0000000000000000 90000001045476e8
[  147.252391]         90000001045476e0 90000001045476e0 0000000000000040 0000000000000000
[  147.311334]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[  147.370261]         000000000000135a 0000000000000000 0000000000000000 0000000000000000
[  147.428570]         0000000000000000 0000000000000010 0000000007a08000 0000000000000010
[  147.485771]         0000000000000000 0000000000000000 9000000002805d80 90000001045475a8
[  147.542277]         900000000296c000 9000000101932000 90000001019323f0 9000000101a84a80
[  147.598173]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0e30040
[  147.652357]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  147.704687]         ...
[  147.755859] Call Trace:
[  147.755861] [<900000000023aba4>] show_stack+0x10c/0x228
[  147.858457] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  147.909796] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  147.960976] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  148.012912] [<ffff8000022e6dac>] end_free_itds+0x6f4/0x8f8 [ehci_hcd]
[  148.065543] [<ffff8000022fbb80>] ehci_bus_suspend+0x680/0x17c0 [ehci_hcd]
[  148.118547] [<ffff8000028204d4>] hcd_bus_suspend+0xc4/0x5c0 [usbcore]
[  148.171881] [<ffff8000028565ec>] usb_generic_driver_suspend+0xc4/0x100 [usbcore]
[  148.225782] [<ffff800002832bc0>] usb_suspend_both+0x2c0/0x708 [usbcore]
[  148.279289] [<ffff80000283711c>] usb_runtime_suspend+0x3c/0x188 [usbcore]
[  148.333236] [<90000000019f2c48>] __rpm_callback+0x88/0x778
[  148.386965] [<90000000019f346c>] rpm_callback+0x134/0x230
[  148.440775] [<90000000019f4dc4>] rpm_suspend+0x114/0x1320
[  148.494498] [<90000000019f7364>] __pm_runtime_suspend+0xb4/0x360
[  148.548124] [<ffff8000028372cc>] usb_runtime_idle+0x4c/0x60 [usbcore]
[  148.602024] [<90000000019f65c0>] rpm_idle+0x290/0x8e0
[  148.655595] [<90000000019fa72c>] pm_runtime_work+0x174/0x2f0
[  148.709412] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  148.763183] [<9000000000350d94>] worker_thread+0x314/0x1240
[  148.816718] [<9000000000367010>] kthread+0x1a0/0x3c0
[  148.870218] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  148.977051] ---[ end trace ]---
[  149.030362] ------------[ cut here ]------------
[  149.083910] UBSAN: misaligned-access in drivers/usb/host/ehci-timer.c:300:2
[  149.138087] member access within misaligned address 000000002c97ace4 for type 'struct ehci_itd'
[  149.193521] which requires 32 byte alignment
[  149.248298] CPU: 0 UID: 0 PID: 107 Comm: kworker/0:5 Tainted: G             L     6.13.0-rc7+ #2
[  149.304065] Tainted: [L]=SOFTLOCKUP
[  149.358678] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  149.416578] Workqueue: pm pm_runtime_work
[  149.474223] Stack : 0000000000000010 0000000000000000 900000000023aae8 9000000104544000
[  149.533068]         90000001045475a0 90000001045475a8 0000000000000000 90000001045476e8
[  149.591898]         90000001045476e0 90000001045476e0 0000000000000040 0000000000000000
[  149.650296]         0000000000000000 0000000000000000 747e13a118945c77 fffffffffffffffe
[  149.708810]         0000000000001385 0000000000000000 0000000000000000 0000000000000000
[  149.767562]         0000000000000000 0000000000000010 0000000007a08000 0000000000000010
[  149.767566]         0000000000000000 0000000000000000 9000000002805d80 90000001045475a8
[  149.767570]         900000000296c000 9000000101932000 90000001019323f0 9000000101a84a80
[  149.767573]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0e30040
[  149.767577]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  149.767580]         ...
[  149.767582] Call Trace:
[  149.767583] [<900000000023aba4>] show_stack+0x10c/0x228
[  149.767585] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  149.767588] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  149.767590] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  149.767594] [<ffff8000022e6d94>] end_free_itds+0x6dc/0x8f8 [ehci_hcd]
[  149.767706] [<ffff8000022fbb80>] ehci_bus_suspend+0x680/0x17c0 [ehci_hcd]
[  149.767817] [<ffff8000028204d4>] hcd_bus_suspend+0xc4/0x5c0 [usbcore]
[  149.767995] [<ffff8000028565ec>] usb_generic_driver_suspend+0xc4/0x100 [usbcore]
[  149.768172] [<ffff800002832bc0>] usb_suspend_both+0x2c0/0x708 [usbcore]
[  149.768350] [<ffff80000283711c>] usb_runtime_suspend+0x3c/0x188 [usbcore]
[  150.707885] [<90000000019f2c48>] __rpm_callback+0x88/0x778
[  150.707888] [<90000000019f346c>] rpm_callback+0x134/0x230
[  150.707890] [<90000000019f4dc4>] rpm_suspend+0x114/0x1320
[  150.707891] [<90000000019f7364>] __pm_runtime_suspend+0xb4/0x360
[  150.707893] [<ffff8000028372cc>] usb_runtime_idle+0x4c/0x60 [usbcore]
[  150.708070] [<90000000019f65c0>] rpm_idle+0x290/0x8e0
[  150.708072] [<90000000019fa72c>] pm_runtime_work+0x174/0x2f0
[  150.708074] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  150.708076] [<9000000000350d94>] worker_thread+0x314/0x1240
[  150.708078] [<9000000000367010>] kthread+0x1a0/0x3c0
[  150.708081] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  150.708086] ---[ end trace ]---
[  150.708138] ehci-pci 0000:00:05.1: USB f.f started, EHCI 1.00
[  150.708206] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[  150.708208] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[  150.708210] usb usb2: Product: EHCI Host Controller
[  150.708211] usb usb2: Manufacturer: Linux 6.13.0-rc7+ ehci_hcd
[  150.708213] usb usb2: SerialNumber: 0000:00:05.1
[  150.708343] hub 2-0:1.0: USB hub found
[  150.708353] hub 2-0:1.0: 4 ports detected
[  150.710425] dwmac-loongson-pci 0000:00:03.0: User ID: 0xd1, Synopsys ID: 0x37
[  150.710431] dwmac-loongson-pci 0000:00:03.0: DMA HW capability register supported
[  150.710433] dwmac-loongson-pci 0000:00:03.0: RX Checksum Offload Engine supported
[  150.710435] dwmac-loongson-pci 0000:00:03.0: COE Type 2
[  150.710438] dwmac-loongson-pci 0000:00:03.0: TX Checksum insertion supported
[  150.710439] dwmac-loongson-pci 0000:00:03.0: Wake-Up On Lan supported
[  150.710442] dwmac-loongson-pci 0000:00:03.0: Enhanced/Alternate descriptors
[  150.710444] dwmac-loongson-pci 0000:00:03.0: Enabled extended descriptors
[  150.710446] dwmac-loongson-pci 0000:00:03.0: Ring mode enabled
[  150.710448] dwmac-loongson-pci 0000:00:03.0: Enable RX Mitigation via HW Watchdog Timer
[  150.710451] dwmac-loongson-pci 0000:00:03.0: device MAC address 00:55:7b:b5:7d:f7
[  150.710896] xhci_hcd 0000:00:19.0: xHCI Host Controller
[  150.710984] xhci_hcd 0000:00:19.0: new USB bus registered, assigned bus number 3
[  150.711099] xhci_hcd 0000:00:19.0: hcc params 0x0238fe6d hci version 0x110 quirks 0x0000000000000010
[  150.711179] xhci_hcd 0000:00:19.0: xHCI Host Controller
[  150.711182] xhci_hcd 0000:00:19.0: new USB bus registered, assigned bus number 4
[  150.711191] xhci_hcd 0000:00:19.0: Host supports USB 3.0 SuperSpeed
[  150.711239] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.13
[  150.711241] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[  150.711243] usb usb3: Product: xHCI Host Controller
[  150.711244] usb usb3: Manufacturer: Linux 6.13.0-rc7+ xhci-hcd
[  150.711246] usb usb3: SerialNumber: 0000:00:19.0
[  150.711313] ohci-pci 0000:00:04.0: OHCI PCI host controller
[  150.711641] hub 3-0:1.0: USB hub found
[  150.711651] hub 3-0:1.0: 4 ports detected
[  150.711881] ohci-pci 0000:00:04.0: new USB bus registered, assigned bus number 5
[  150.711910] ohci-pci 0000:00:04.0: irq 68, io mem 0xe8015148000
[  150.711938] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
[  150.711973] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.13
[  150.711976] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[  150.711978] usb usb4: Product: xHCI Host Controller
[  150.711979] usb usb4: Manufacturer: Linux 6.13.0-rc7+ xhci-hcd
[  150.711980] usb usb4: SerialNumber: 0000:00:19.0
[  150.712096] hub 4-0:1.0: USB hub found
[  150.712106] hub 4-0:1.0: 4 ports detected
[  150.713110] mdio_bus stmmac-18:02: attached PHY driver [unbound] (mii_bus:phy_addr=stmmac-18:02, irq=POLL)
[  150.715555] dwmac-loongson-pci 0000:00:03.0 enp0s3f0: renamed from eth0
[  150.716577] ahci 0000:00:08.0: version 3.0
[  150.716613] ahci 0000:00:08.0: SSS flag set, parallel bus scan disabled
[  150.716627] ahci 0000:00:08.0: AHCI vers 0001.0300, 32 command slots, 6 Gbps, SATA mode
[  150.716630] ahci 0000:00:08.0: 4/4 ports implemented (port mask 0xf)
[  150.716632] ahci 0000:00:08.0: flags: 64bit ncq sntf stag pm led clo only pmp pio slum part ccc apst 
[  150.717250] scsi host0: ahci
[  150.717461] scsi host1: ahci
[  150.717610] scsi host2: ahci
[  150.717756] scsi host3: ahci
[  150.717808] ata1: SATA max UDMA/133 abar m1024@0xe0030200800 port 0xe0030200900 irq 69 lpm-pol 3
[  150.717811] ata2: SATA max UDMA/133 abar m1024@0xe0030200800 port 0xe0030200980 irq 69 lpm-pol 3
[  150.717813] ata3: SATA max UDMA/133 abar m1024@0xe0030200800 port 0xe0030200a00 irq 69 lpm-pol 3
[  150.717814] ata4: SATA max UDMA/133 abar m1024@0xe0030200800 port 0xe0030200a80 irq 69 lpm-pol 3
[  150.770817] usb usb5: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 6.13
[  151.028863] ata1: SATA link down (SStatus 0 SControl 300)
[  151.058971] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[  151.428862] ata2: SATA link down (SStatus 0 SControl 300)
[  151.463785] usb usb5: Product: OHCI PCI host controller
[  151.825601] ata3: SATA link down (SStatus 0 SControl 300)
[  151.872939] usb usb5: Manufacturer: Linux 6.13.0-rc7+ ohci_hcd
[  152.236861] ata4: SATA link down (SStatus 0 SControl 300)
[  152.273685] usb usb5: SerialNumber: 0000:00:04.0
[  154.668641] hub 5-0:1.0: USB hub found
[  154.719098] hub 5-0:1.0: 4 ports detected
[  154.719578] ohci-pci 0000:00:05.0: OHCI PCI host controller
[  154.719586] ohci-pci 0000:00:05.0: new USB bus registered, assigned bus number 6
[  154.719615] ohci-pci 0000:00:05.0: irq 70, io mem 0xe8015158000
[  154.778815] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 6.13
[  154.975432] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[  154.975435] usb usb6: Product: OHCI PCI host controller
[  154.975436] usb usb6: Manufacturer: Linux 6.13.0-rc7+ ohci_hcd
[  154.975438] usb usb6: SerialNumber: 0000:00:05.0
[  154.975444] usb 2-1: new high-speed USB device number 2 using ehci-pci
[  154.975637] hub 6-0:1.0: USB hub found
[  155.289981] hub 6-0:1.0: 4 ports detected
[  155.371340] usb 2-1: New USB device found, idVendor=1a40, idProduct=0101, bcdDevice= 1.11
[  155.448705] usb 2-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[  155.448707] usb 2-1: Product: USB 2.0 Hub
[  155.449129] hub 2-1:1.0: USB hub found
[  155.611602] hub 2-1:1.0: 4 ports detected
[  156.062755] usb 2-1.1: new low-speed USB device number 3 using ehci-pci
[  156.278502] usb 2-1.1: New USB device found, idVendor=2188, idProduct=0ae1, bcdDevice= 1.00
[  156.278505] usb 2-1.1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[  156.278507] usb 2-1.1: Product: USB OPTICAL MOUSE 
[  156.290735] hid: raw HID events driver (C) Jiri Kosina
[  156.298366] usbcore: registered new interface driver usbhid
[  156.298369] usbhid: USB HID core driver
[  156.300342] input: USB OPTICAL MOUSE  as /devices/pci0000:00/0000:00:05.1/usb2/2-1/2-1.1/2-1.1:1.0/0003:2188:0AE1.0001/input/input1
[  156.300453] hid-generic 0003:2188:0AE1.0001: input,hidraw0: USB HID v1.11 Mouse [USB OPTICAL MOUSE ] on usb-0000:00:05.1-1.1/input0
[  156.474751] usb 2-1.2: new full-speed USB device number 4 using ehci-pci
[  156.741771] usb 2-1.2: New USB device found, idVendor=25a7, idProduct=fa71, bcdDevice= 1.50
[  156.741774] usb 2-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[  156.741776] usb 2-1.2: Product: Keyboard
[  156.741778] usb 2-1.2: Manufacturer: Compx
[  156.743747] input: Compx Keyboard as /devices/pci0000:00/0000:00:05.1/usb2/2-1/2-1.2/2-1.2:1.0/0003:25A7:FA71.0002/input/input2
[  157.490811] hid-generic 0003:25A7:FA71.0002: input,hidraw1: USB HID v1.10 Keyboard [Compx Keyboard] on usb-0000:00:05.1-1.2/input0
[  157.495403] input: Compx Keyboard Mouse as /devices/pci0000:00/0000:00:05.1/usb2/2-1/2-1.2/2-1.2:1.1/0003:25A7:FA71.0003/input/input3
[  157.495493] input: Compx Keyboard as /devices/pci0000:00/0000:00:05.1/usb2/2-1/2-1.2/2-1.2:1.1/0003:25A7:FA71.0003/input/input4
[  157.495562] input: Compx Keyboard as /devices/pci0000:00/0000:00:05.1/usb2/2-1/2-1.2/2-1.2:1.1/0003:25A7:FA71.0003/input/input5
[  157.554914] hid-generic 0003:25A7:FA71.0003: input,hiddev0,hidraw2: USB HID v1.10 Mouse [Compx Keyboard] on usb-0000:00:05.1-1.2/input1
[  160.114752] raid6: lasx     gen() 16445 MB/s
[  160.186753] raid6: lsx      gen() 15106 MB/s
[  160.354775] raid6: int64x8  gen()  4173 MB/s
[  160.422770] raid6: int64x4  gen()  4101 MB/s
[  160.586758] raid6: int64x2  gen()  2358 MB/s
[  160.654779] raid6: int64x1  gen()  2198 MB/s
[  160.756362] raid6: using algorithm lasx gen() 16445 MB/s
[  160.822754] raid6: .... xor() 18277 MB/s, rmw enabled
[  160.822756] raid6: using lasx recovery algorithm
[  160.827998] xor: measuring software checksum speed
[  160.828347]    8regs           :  9468 MB/sec
[  160.828711]    8regs_prefetch  :  9056 MB/sec
[  160.829087]    32regs          :  8769 MB/sec
[  160.829469]    32regs_prefetch :  8604 MB/sec
[  160.829650]    lsx             : 18296 MB/sec
[  160.829797]    lasx            : 22465 MB/sec
[  160.829798] xor: using function: lasx (22465 MB/sec)
[  161.479947] Btrfs loaded, zoned=yes, fsverity=yes
[  161.530052] PM: Image not found (code -22)
[  161.541923] ------------[ cut here ]------------
[  161.638005] UBSAN: misaligned-access in kernel/sys.c:1844:3
[  161.638008] member access within misaligned address 00000000210e68bf for type 'struct task_struct'
[  161.638010] which requires 64 byte alignment
[  161.638013] CPU: 4 UID: 0 PID: 316 Comm: fsck Tainted: G             L     6.13.0-rc7+ #2
[  161.638017] Tainted: [L]=SOFTLOCKUP
[  161.638018] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  161.638020] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000151e88000
[  162.026073]         9000000151e8b530 9000000151e8b538 0000000000000000 9000000151e8b678
[  162.026078]         9000000151e8b670 9000000151e8b670 90000000080f89d0 6572617764726148
[  162.026081]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000b000790
[  162.026085]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  162.026089]         000000000000001f 9000000003f3aa60 0000000008a08000 90000001017bba80
[  162.261907]         0000000000000000 0000000000000000 9000000002805d80 9000000151e8b538
[  162.378307]         900000000296c000 900000014c469b40 900000000296c000 0000000000000000
[  162.378312]         fffffffffffffffe 0000000000000000 900000000023aba4 0000555558dd0060
[  162.378315]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  162.378319]         ...
[  162.378321] Call Trace:
[  162.378323] [<900000000023aba4>] show_stack+0x10c/0x228
[  162.378329] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  162.378334] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  162.378337] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  162.378341] [<9000000000332788>] getrusage+0x520/0x1658
[  162.378345] [<90000000002e9a7c>] wait_consider_task+0x804/0x3498
[  162.378348] [<90000000002f0144>] __do_wait+0x114/0x828
[  162.378350] [<90000000002f0928>] do_wait+0xd0/0x480
[  162.378352] [<90000000002f16d4>] kernel_wait4+0xe4/0x2f0
[  162.378355] [<90000000002f1948>] __do_sys_wait4+0x68/0x208
[  162.378357] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  162.378372] ---[ end trace ]---
[  163.110106] SGI XFS with ACLs, security attributes, realtime, quota, no debug enabled
[  163.511985] XFS (nvme0n1p2): Mounting V5 Filesystem d149b841-069b-402d-b6f0-db175be33e3d
[  163.516162] ------------[ cut here ]------------
[  163.516165] UBSAN: misaligned-access in fs/xfs/libxfs/xfs_ialloc_btree.c:273:18
[  163.516167] member access within misaligned address 0000000070248e98 for type 'const union xfs_btree_key'
[  163.516169] which requires 8 byte alignment
[  163.516172] CPU: 1 UID: 0 PID: 318 Comm: mount Tainted: G             L     6.13.0-rc7+ #2
[  163.516176] Tainted: [L]=SOFTLOCKUP
[  163.516177] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  163.516179] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000151e7c000
[  163.516185]         9000000151e7f1a0 9000000151e7f1a8 0000000000000000 9000000151e7f2e8
[  163.516189]         9000000151e7f2e0 9000000151e7f2e0 90000000080f9310 6572617764726148
[  163.516192]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a400790
[  163.516196]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  163.516200]         000000000000001f 9000000003f3aa60 0000000007e08000 ffff8000046d7280
[  163.516203]         0000000000000000 0000000000000000 9000000002805d80 9000000151e7f1a8
[  163.516207]         900000000296c000 900000000296c1d8 00000000000000d9 900000013561e7a8
[  163.516210]         0000000000000000 0000000000000000 900000000023aba4 00007ffff283c9c8
[  163.516214]         00000000000000b0 0000000000000007 0000000000000000 0000000000071c1d
[  163.516218]         ...
[  163.516219] Call Trace:
[  163.516221] [<900000000023aba4>] show_stack+0x10c/0x228
[  163.516227] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  163.516232] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  163.516235] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  163.516242] [<ffff80000454318c>] xfs_inobt_key_diff+0x6c/0x90 [xfs]
[  163.517353] [<ffff8000044e2d34>] xfs_btree_lookup+0x46c/0x1178 [xfs]
[  163.518439] [<ffff80000453e0f8>] xfs_imap_lookup+0xf0/0x3a8 [xfs]
[  163.519522] [<ffff80000453e6a0>] xfs_imap+0x2f0/0xb40 [xfs]
[  163.520601] [<ffff8000045e4a14>] xfs_iget+0x404/0x3148 [xfs]
[  163.521682] [<ffff80000461cc20>] xfs_mountfs+0x890/0x1cf0 [xfs]
[  163.522763] [<ffff80000462d750>] xfs_fs_fill_super+0xaa0/0x1a88 [xfs]
[  163.523842] [<9000000000d08128>] get_tree_bdev_flags+0x1d0/0x498
[  163.523846] [<9000000000d0161c>] vfs_get_tree+0x4c/0x3c0
[  163.523849] [<9000000000d9902c>] path_mount+0xbd4/0x1a10
[  163.523853] [<9000000000d9b250>] sys_mount+0x240/0x530
[  163.523857] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  163.523869] ---[ end trace ]---
[  163.523872] ------------[ cut here ]------------
[  163.523873] UBSAN: misaligned-access in fs/xfs/libxfs/xfs_btree.c:335:5
[  163.523874] member access within misaligned address 0000000010d0871d for type 'const union xfs_btree_ptr'
[  163.523876] which requires 8 byte alignment
[  163.523878] CPU: 1 UID: 0 PID: 318 Comm: mount Tainted: G             L     6.13.0-rc7+ #2
[  163.523881] Tainted: [L]=SOFTLOCKUP
[  163.523882] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  163.523883] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000151e7c000
[  163.523888]         9000000151e7f0e0 9000000151e7f0e8 0000000000000000 9000000151e7f228
[  163.523891]         9000000151e7f220 9000000151e7f220 90000000080f9d00 6572617764726148
[  163.523895]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a400790
[  163.523899]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  163.523902]         000000000000001f 9000000003f3aa60 0000000007e08000 ffff8000046d7280
[  163.523906]         0000000000000000 0000000000000000 9000000002805d80 9000000151e7f0e8
[  163.523909]         900000000296c000 900000012aeab600 0000000000000000 ffff80000476e548
[  163.523913]         0000000000000000 0000000000000000 900000000023aba4 00007ffff283c9c8
[  163.523917]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  163.523920]         ...
[  163.523922] Call Trace:
[  163.523922] [<900000000023aba4>] show_stack+0x10c/0x228
[  163.523925] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  163.523928] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  163.523931] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  163.523934] [<ffff8000044cd7dc>] xfs_btree_ptr_to_daddr+0x7a4/0xa20 [xfs]
[  163.525018] [<ffff8000044e0fac>] xfs_btree_lookup_get_block+0x94/0x690 [xfs]
[  163.526098] [<ffff8000044e2b4c>] xfs_btree_lookup+0x284/0x1178 [xfs]
[  163.527181] [<ffff80000453e0f8>] xfs_imap_lookup+0xf0/0x3a8 [xfs]
[  163.528261] [<ffff80000453e6a0>] xfs_imap+0x2f0/0xb40 [xfs]
[  163.529339] [<ffff8000045e4a14>] xfs_iget+0x404/0x3148 [xfs]
[  163.530419] [<ffff80000461cc20>] xfs_mountfs+0x890/0x1cf0 [xfs]
[  163.531501] [<ffff80000462d750>] xfs_fs_fill_super+0xaa0/0x1a88 [xfs]
[  163.532580] [<9000000000d08128>] get_tree_bdev_flags+0x1d0/0x498
[  163.532583] [<9000000000d0161c>] vfs_get_tree+0x4c/0x3c0
[  163.532585] [<9000000000d9902c>] path_mount+0xbd4/0x1a10
[  163.532588] [<9000000000d9b250>] sys_mount+0x240/0x530
[  163.532591] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  163.532600] ---[ end trace ]---
[  163.532601] ------------[ cut here ]------------
[  163.532602] UBSAN: misaligned-access in fs/xfs/libxfs/xfs_btree.c:1083:5
[  163.532604] member access within misaligned address 0000000010d0871d for type 'const union xfs_btree_ptr'
[  163.532605] which requires 8 byte alignment
[  163.532607] CPU: 1 UID: 0 PID: 318 Comm: mount Tainted: G             L     6.13.0-rc7+ #2
[  163.532609] Tainted: [L]=SOFTLOCKUP
[  163.532610] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  163.532611] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000151e7c000
[  163.532615]         9000000151e7f0e0 9000000151e7f0e8 0000000000000000 9000000151e7f228
[  163.532618]         9000000151e7f220 9000000151e7f220 90000000080fa740 6572617764726148
[  163.532622]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a400790
[  163.532626]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  163.532629]         000000000000001f 9000000003f3aa60 0000000007e08000 ffff8000046d7280
[  163.532633]         0000000000000000 0000000000000000 9000000002805d80 9000000151e7f0e8
[  163.532636]         900000000296c000 900000012aeab600 0000000000000000 900000013561e7a8
[  163.532640]         0000000000000000 0000000000000000 900000000023aba4 00007ffff283c9c8
[  163.532643]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  163.532647]         ...
[  163.532649] Call Trace:
[  163.532649] [<900000000023aba4>] show_stack+0x10c/0x228
[  163.532651] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  163.532654] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  163.532657] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  163.532660] [<ffff8000044cd788>] xfs_btree_ptr_to_daddr+0x750/0xa20 [xfs]
[  163.533744] [<ffff8000044e0fac>] xfs_btree_lookup_get_block+0x94/0x690 [xfs]
[  163.534826] [<ffff8000044e2b4c>] xfs_btree_lookup+0x284/0x1178 [xfs]
[  163.535906] [<ffff80000453e0f8>] xfs_imap_lookup+0xf0/0x3a8 [xfs]
[  169.098690] [<ffff80000453e6a0>] xfs_imap+0x2f0/0xb40 [xfs]
[  169.099775] [<ffff8000045e4a14>] xfs_iget+0x404/0x3148 [xfs]
[  169.100857] [<ffff80000461cc20>] xfs_mountfs+0x890/0x1cf0 [xfs]
[  169.101936] [<ffff80000462d750>] xfs_fs_fill_super+0xaa0/0x1a88 [xfs]
[  169.103017] [<9000000000d08128>] get_tree_bdev_flags+0x1d0/0x498
[  169.103021] [<9000000000d0161c>] vfs_get_tree+0x4c/0x3c0
[  169.103023] [<9000000000d9902c>] path_mount+0xbd4/0x1a10
[  169.103026] [<9000000000d9b250>] sys_mount+0x240/0x530
[  169.103030] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  169.103056] ---[ end trace ]---
[  169.133479] XFS (nvme0n1p2): Ending clean mount
[  170.251703] Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
[  170.381737] systemd[1]: Inserted module 'autofs4'
[  170.734656] systemd[1]: systemd 257.2-3 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +IPE +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK -BTF -XKBCOMMON -UTMP +SYSVINIT +LIBARCHIVE)
[  170.734662] systemd[1]: Detected architecture loongarch64.
[  170.921024] systemd[1]: Hostname set to <avenger-CostalHouse>.
[  170.922047] ------------[ cut here ]------------
[  170.922049] UBSAN: misaligned-access in net/ipv4/devinet.c:1420:2
[  170.922052] member access within misaligned address 000000000506229a for type 'const struct net_device'
[  170.922054] which requires 64 byte alignment
[  170.922057] CPU: 5 UID: 0 PID: 1 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  170.922061] Tainted: [L]=SOFTLOCKUP
[  170.922062] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  170.922064] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010025c000
[  170.922071]         900000010025ec80 900000010025ec88 0000000000000000 900000010025edc8
[  170.922075]         900000010025edc0 900000010025edc0 90000000080fb428 6572617764726148
[  170.922078]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000b400790
[  170.922082]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  170.922085]         000000000000001f 9000000003f3aa60 0000000008e08000 0000000000000000
[  170.922089]         0000000000000000 0000000000000000 9000000002805d80 900000010025ec88
[  170.922092]         900000000296c000 9000000003fccc50 0000000000000038 00000000000000fd
[  170.922096]         00000000000000fd 0000000000000000 900000000023aba4 00007ffff15cbf48
[  170.922100]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  170.922103]         ...
[  170.922105] Call Trace:
[  170.922107] [<900000000023aba4>] show_stack+0x10c/0x228
[  170.922112] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  170.922116] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  170.922119] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  170.922123] [<9000000002011038>] inet_select_addr+0x260/0x6e8
[  170.922128] [<9000000002051b5c>] fib_create_info+0x154c/0x36e0
[  170.922131] [<9000000002064044>] fib_table_insert+0xc4/0x19b8
[  170.922133] [<9000000002042484>] fib_magic+0x1b4/0x340
[  170.922136] [<90000000020474e0>] fib_add_ifaddr+0x228/0x450
[  170.922139] [<90000000020478f8>] fib_netdev_event+0x1f0/0x528
[  170.922142] [<900000000036fdb4>] notifier_call_chain+0xb4/0x2e0
[  170.922146] [<9000000001c6faa4>] __dev_notify_flags+0x74/0x198
[  170.922149] [<9000000001c71994>] dev_change_flags+0x84/0x120
[  170.922152] [<9000000001cb2234>] do_setlink.isra.0+0x37c/0x2d38
[  170.922154] [<9000000001cb4e6c>] rtnl_setlink+0x27c/0x668
[  170.922157] [<9000000001cacf04>] rtnetlink_rcv_msg+0x2a4/0x928
[  170.922159] [<9000000001e22858>] netlink_rcv_skb+0xe0/0x310
[  170.922163] [<9000000001e20814>] netlink_unicast+0x48c/0xbe0
[  170.922166] [<9000000001e2122c>] netlink_sendmsg+0x2c4/0xba8
[  170.922169] [<9000000001babdf4>] __sock_sendmsg+0xc4/0x1d0
[  170.922172] [<9000000001bb2f28>] __sys_sendto+0x188/0x2c8
[  170.922175] [<9000000001bb3088>] sys_sendto+0x20/0x30
[  170.922177] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  170.922184] ---[ end trace ]---
[  170.922564] ------------[ cut here ]------------
[  170.922566] UBSAN: misaligned-access in kernel/cgroup/cgroup.c:6347:2
[  170.922568] member access within misaligned address 00000000372eb2cb for type 'struct cgroup_root'
[  170.922569] which requires 64 byte alignment
[  170.922571] CPU: 5 UID: 0 PID: 1 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  170.922573] Tainted: [L]=SOFTLOCKUP
[  170.922574] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  170.922575] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010025c000
[  170.922579]         900000010025f620 900000010025f628 0000000000000000 900000010025f768
[  170.922583]         900000010025f760 900000010025f760 90000000080fbfa8 6572617764726148
[  170.922587]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000b400790
[  170.922590]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  170.922594]         000000000000001f 9000000003f3aa60 0000000008e08000 9000000002dfce88
[  170.922597]         0000000000000000 0000000000000000 9000000002805d80 900000010025f628
[  170.922601]         900000000296c000 90000000027f7b10 9000000002805d80 fffffffffffff000
[  170.922604]         9000000002e03700 0000000000000000 900000000023aba4 00007ffff13d9eb8
[  170.922608]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  170.922611]         ...
[  170.922613] Call Trace:
[  170.922614] [<900000000023aba4>] show_stack+0x10c/0x228
[  170.922616] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  170.922619] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  170.922622] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  170.922625] [<90000000005ffa94>] proc_cgroup_show+0x6dc/0x878
[  170.922627] [<9000000000f1b2e0>] proc_single_show+0xa0/0x1f8
[  170.922632] [<9000000000da877c>] seq_read_iter+0x1f4/0x1180
[  170.922635] [<9000000000da9898>] seq_read+0x190/0x328
[  170.922637] [<9000000000cf8b80>] vfs_read+0x150/0xb90
[  170.922641] [<9000000000cfb374>] ksys_read+0x9c/0x1e0
[  170.922644] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  170.922647] ---[ end trace ]---
[  171.110770] ------------[ cut here ]------------
[  175.616543] UBSAN: misaligned-access in kernel/cgroup/cgroup.c:2590:3
[  175.616545] member access within misaligned address 0000000005190f82 for type 'struct task_struct'
[  175.616547] which requires 64 byte alignment
[  175.616548] CPU: 0 UID: 0 PID: 1 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  175.616551] Tainted: [L]=SOFTLOCKUP
[  175.616552] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  175.616553] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010025c000
[  175.616558]         900000010025f720 900000010025f728 0000000000000000 900000010025f868
[  175.616562]         900000010025f860 900000010025f860 90000000080fc838 6572617764726148
[  175.982151]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a000790
[  175.982155]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  175.982159]         000000000000001f 9000000003f3aa60 0000000007a08000 9000000002dea778
[  175.982162]         0000000000000000 0000000000000000 9000000002805d80 900000010025f728
[  175.982166]         900000000296c000 0000000000000001 9000000002dea6d8 0000000000000038
[  175.982170]         9000000002dea6d8 0000000000000000 900000000023aba4 00007ffff17f9160
[  176.274204]         00000000000000b0 0000000000000007 0000000000000000 0000000000071c1d
[  176.370615]         ...
[  176.370617] Call Trace:
[  176.370618] [<900000000023aba4>] show_stack+0x10c/0x228
[  176.370622] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  176.370625] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  176.370628] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  176.370631] [<90000000005f4868>] cgroup_migrate_execute+0x7d8/0x1120
[  176.370635] [<90000000005f5520>] cgroup_attach_task+0x118/0x4b8
[  176.370639] [<90000000005f5ad0>] __cgroup_procs_write+0x210/0x3a8
[  176.370642] [<90000000005f5cc0>] cgroup_procs_write+0x20/0x38
[  176.370645] [<9000000000f56e70>] kernfs_fop_write_iter+0x1b8/0x578
[  176.370648] [<9000000000cfa820>] vfs_write+0x400/0xeb8
[  176.370651] [<9000000000cfb564>] ksys_write+0x9c/0x1f0
[  176.370654] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  176.370658] ---[ end trace ]---
[  176.370659] ------------[ cut here ]------------
[  176.370659] UBSAN: misaligned-access in kernel/cgroup/cgroup.c:2590:3
[  176.370661] member access within misaligned address 0000000005190f82 for type 'struct task_struct'
[  176.370662] which requires 64 byte alignment
[  176.370664] CPU: 0 UID: 0 PID: 1 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  176.370666] Tainted: [L]=SOFTLOCKUP
[  176.370667] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  176.370668] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010025c000
[  176.370672]         900000010025f720 900000010025f728 0000000000000000 900000010025f868
[  176.370675]         900000010025f860 900000010025f860 90000000080fd118 6572617764726148
[  176.370679]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a000790
[  176.370682]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  176.370686]         000000000000001f 9000000003f3aa60 0000000007a08000 9000000002dea778
[  176.370689]         0000000000000000 0000000000000000 9000000002805d80 900000010025f728
[  176.370693]         900000000296c000 0000000000000001 9000000002dea6d8 0000000000000038
[  176.370697]         9000000002dea6d8 0000000000000000 900000000023aba4 00007ffff17f9160
[  176.370700]         00000000000000b0 0000000000000007 0000000000000000 0000000000071c1d
[  176.370704]         ...
[  176.370705] Call Trace:
[  176.370706] [<900000000023aba4>] show_stack+0x10c/0x228
[  176.370708] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  176.370711] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  176.370714] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  176.370717] [<90000000005f484c>] cgroup_migrate_execute+0x7bc/0x1120
[  176.370720] [<90000000005f5520>] cgroup_attach_task+0x118/0x4b8
[  176.370723] [<90000000005f5ad0>] __cgroup_procs_write+0x210/0x3a8
[  176.370726] [<90000000005f5cc0>] cgroup_procs_write+0x20/0x38
[  176.370729] [<9000000000f56e70>] kernfs_fop_write_iter+0x1b8/0x578
[  176.370731] [<9000000000cfa820>] vfs_write+0x400/0xeb8
[  176.370734] [<9000000000cfb564>] ksys_write+0x9c/0x1f0
[  176.370737] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  176.370740] ---[ end trace ]---
[  176.370922] ------------[ cut here ]------------
[  176.370924] UBSAN: misaligned-access in fs/proc/array.c:561:4
[  176.370926] member access within misaligned address 00000000f5409c17 for type 'struct task_struct'
[  176.370928] which requires 64 byte alignment
[  176.370930] CPU: 6 UID: 0 PID: 1 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  176.370933] Tainted: [L]=SOFTLOCKUP
[  176.370934] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  176.370935] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010025c000
[  176.370940]         900000010025f6d0 900000010025f6d8 0000000000000000 900000010025f818
[  176.370944]         900000010025f810 900000010025f810 90000000080fd9f0 6572617764726148
[  176.370948]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000b800790
[  176.370951]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  176.370955]         000000000000001f 9000000003f3aa60 0000000009208000 900000010042a400
[  176.370959]         0000000000000000 0000000000000000 9000000002805d80 900000010025f6d8
[  176.370962]         900000000296c000 0000000000000038 0000000000000000 0000000000000000
[  176.370966]         9000000100388a00 0000000000000000 900000000023aba4 00007ffff226d22b
[  176.370969]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  176.370973]         ...
[  176.370975] Call Trace:
[  176.370975] [<900000000023aba4>] show_stack+0x10c/0x228
[  176.370979] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  176.370982] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  176.370985] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  176.370988] [<9000000000f2eb98>] do_task_stat.isra.0+0xec0/0x1cd0
[  176.370990] [<9000000000f31608>] proc_tgid_stat+0x18/0x28
[  176.370993] [<9000000000f1b2e0>] proc_single_show+0xa0/0x1f8
[  176.370996] [<9000000000da877c>] seq_read_iter+0x1f4/0x1180
[  176.370998] [<9000000000da9898>] seq_read+0x190/0x328
[  176.371000] [<9000000000cf8b80>] vfs_read+0x150/0xb90
[  176.371003] [<9000000000cfb374>] ksys_read+0x9c/0x1e0
[  176.371006] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  176.371009] ---[ end trace ]---
[  180.621242] systemd[1]: Queued start job for default target graphical.target.
[  180.906798] ------------[ cut here ]------------
[  180.906802] UBSAN: misaligned-access in kernel/cgroup/cgroup.c:3085:3
[  180.906804] member access within misaligned address 00000000db1cdc7f for type 'struct task_struct'
[  180.906806] which requires 64 byte alignment
[  180.906810] CPU: 0 UID: 0 PID: 1 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  180.906813] Tainted: [L]=SOFTLOCKUP
[  180.906814] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  180.906816] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010025c000
[  180.906822]         900000010025f8a0 900000010025f8a8 0000000000000000 900000010025f9e8
[  180.906826]         900000010025f9e0 900000010025f9e0 90000000080fe308 6572617764726148
[  180.906829]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a000790
[  180.906833]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  180.906837]         000000000000001f 9000000003f3aa60 0000000007a08000 0000000000000010
[  180.906840]         0000000000000000 0000000000000000 9000000002805d80 900000010025f8a8
[  180.906844]         900000000296c000 9000000150bb5400 9000000003f5e3d0 9000000002ca5808
[  180.906847]         9000000150bb55f0 0000000000000000 900000000023aba4 00007ffff14af950
[  180.906851]         00000000000000b0 0000000000000007 0000000000000000 0000000000071c1d
[  180.906855]         ...
[  180.906856] Call Trace:
[  180.906858] [<900000000023aba4>] show_stack+0x10c/0x228
[  180.906864] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  180.906868] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  180.906871] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  180.906876] [<90000000005f60d4>] cgroup_update_dfl_csses+0x3fc/0x5b8
[  180.906880] [<90000000005f7928>] cgroup_subtree_control_write+0x598/0xb50
[  180.906884] [<9000000000f56e70>] kernfs_fop_write_iter+0x1b8/0x578
[  180.906887] [<9000000000cfa820>] vfs_write+0x400/0xeb8
[  180.906891] [<9000000000cfb564>] ksys_write+0x9c/0x1f0
[  180.906893] [<90000000024c659c>] do_syscall+0x11c/0x3b8
[  180.906897] [<9000000000aecfb8>] sys_brk+0x0/0x7c0

[  180.906903] ---[ end trace ]---
[  180.906904] ------------[ cut here ]------------
[  180.906904] UBSAN: misaligned-access in kernel/cgroup/cgroup.c:3085:3
[  180.906906] member access within misaligned address 00000000db1cdc7f for type 'struct task_struct'
[  180.906907] which requires 64 byte alignment
[  180.906909] CPU: 0 UID: 0 PID: 1 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  180.906911] Tainted: [L]=SOFTLOCKUP
[  180.906911] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  180.906913] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010025c000
[  180.906916]         900000010025f8a0 900000010025f8a8 0000000000000000 900000010025f9e8
[  180.906920]         900000010025f9e0 900000010025f9e0 90000000080feba0 6572617764726148
[  180.906923]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a000790
[  180.906927]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  180.906931]         000000000000001f 9000000003f3aa60 0000000007a08000 0000000000000010
[  180.906934]         0000000000000000 0000000000000000 9000000002805d80 900000010025f8a8
[  180.906938]         900000000296c000 9000000150bb5400 9000000003f5e3d0 9000000002ca5808
[  180.906941]         9000000150bb55f0 0000000000000000 900000000023aba4 00007ffff14af950
[  180.906945]         00000000000000b0 0000000000000007 0000000000000000 0000000000071c1d
[  180.906948]         ...
[  180.906950] Call Trace:
[  180.906951] [<900000000023aba4>] show_stack+0x10c/0x228
[  180.906953] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  180.906956] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  180.906958] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  180.906961] [<90000000005f6104>] cgroup_update_dfl_csses+0x42c/0x5b8
[  180.906964] [<90000000005f7928>] cgroup_subtree_control_write+0x598/0xb50
[  180.906968] [<9000000000f56e70>] kernfs_fop_write_iter+0x1b8/0x578
[  180.906969] [<9000000000cfa820>] vfs_write+0x400/0xeb8
[  180.906972] [<9000000000cfb564>] ksys_write+0x9c/0x1f0
[  180.906975] [<90000000024c659c>] do_syscall+0x11c/0x3b8
[  180.906978] [<9000000000aecfb8>] sys_brk+0x0/0x7c0

[  180.906981] ---[ end trace ]---
[  180.906993] ------------[ cut here ]------------
[  180.906994] UBSAN: misaligned-access in kernel/cgroup/cgroup.c:2527:7
[  180.906996] member access within misaligned address 0000000071475197 for type 'struct task_struct'
[  180.906997] which requires 64 byte alignment
[  180.906999] CPU: 0 UID: 0 PID: 1 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  180.907001] Tainted: [L]=SOFTLOCKUP
[  180.907001] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  180.907002] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010025c000
[  180.907007]         900000010025f760 900000010025f768 0000000000000000 900000010025f8a8
[  180.907010]         900000010025f8a0 900000010025f8a0 90000000080ff438 6572617764726148
[  180.907014]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a000790
[  180.907017]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  180.907021]         000000000000001f 9000000003f3aa60 0000000007a08000 900000010025faf0
[  180.907025]         0000000000000000 0000000000000000 9000000002805d80 900000010025f768
[  180.907028]         900000000296c000 0000000000000000 9000000150bb5000 900000010025f9b0
[  180.907032]         0000000000000102 0000000000000000 900000000023aba4 00007ffff14af950
[  180.907036]         00000000000000b0 0000000000000007 0000000000000000 0000000000071c1d
[  180.907039]         ...
[  180.907041] Call Trace:
[  180.907041] [<900000000023aba4>] show_stack+0x10c/0x228
[  180.907043] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  180.907046] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  180.907049] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  180.907052] [<90000000005eeb2c>] cgroup_taskset_next+0x204/0x3c0
[  180.907055] [<90000000003a5860>] cpu_cgroup_attach+0x50/0x80
[  180.907059] [<90000000005f465c>] cgroup_migrate_execute+0x5cc/0x1120
[  180.907062] [<90000000005f5fac>] cgroup_update_dfl_csses+0x2d4/0x5b8
[  180.907065] [<90000000005f7928>] cgroup_subtree_control_write+0x598/0xb50
[  180.907069] [<9000000000f56e70>] kernfs_fop_write_iter+0x1b8/0x578
[  180.907070] [<9000000000cfa820>] vfs_write+0x400/0xeb8
[  180.907073] [<9000000000cfb564>] ksys_write+0x9c/0x1f0
[  180.907076] [<90000000024c659c>] do_syscall+0x11c/0x3b8
[  180.907079] [<9000000000aecfb8>] sys_brk+0x0/0x7c0

[  180.907082] ---[ end trace ]---
[  180.907339] ------------[ cut here ]------------
[  180.907340] UBSAN: misaligned-access in kernel/sched/core.c:1384:2
[  180.907342] member access within misaligned address 00000000537d5ec6 for type 'struct task_group'
[  180.907343] which requires 64 byte alignment
[  180.907345] CPU: 0 UID: 0 PID: 1 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  180.907347] Tainted: [L]=SOFTLOCKUP
[  180.907348] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  180.907349] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010025c000
[  180.907353]         900000010025f7a0 900000010025f7a8 0000000000000000 900000010025f8e8
[  180.907357]         900000010025f8e0 900000010025f8e0 90000000080ffd98 6572617764726148
[  180.907360]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a000790
[  180.907364]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  180.907367]         000000000000001f 9000000003f3aa60 0000000007a08000 0000000005f5e100
[  180.907371]         0000000000000000 0000000000000000 9000000002805d80 900000010025f7a8
[  180.907375]         900000000296c000 9000000002c90b58 900000000296c000 0000000000000000
[  180.907378]         900000012340ebc0 0000000000000000 900000000023aba4 00007ffff14af950
[  180.907382]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  180.907385]         ...
[  180.907387] Call Trace:
[  180.907388] [<900000000023aba4>] show_stack+0x10c/0x228
[  180.907390] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  180.907393] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  180.907396] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  180.907399] [<9000000000393808>] tg_set_cfs_bandwidth+0x718/0xd98
[  180.907401] [<9000000000394268>] cpu_max_write+0x148/0x188
[  180.907404] [<9000000000f56e70>] kernfs_fop_write_iter+0x1b8/0x578
[  180.907406] [<9000000000cfa820>] vfs_write+0x400/0xeb8
[  180.907409] [<9000000000cfb564>] ksys_write+0x9c/0x1f0
[  180.907411] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  180.907415] ---[ end trace ]---
[  180.907417] ------------[ cut here ]------------
[  180.907417] UBSAN: misaligned-access in kernel/sched/core.c:1384:2
[  180.907419] member access within misaligned address 0000000077a8e450 for type 'struct task_group'
[  180.907420] which requires 64 byte alignment
[  180.907421] CPU: 0 UID: 0 PID: 1 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  180.907423] Tainted: [L]=SOFTLOCKUP
[  180.907423] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  180.907424] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010025c000
[  180.907428]         900000010025f7a0 900000010025f7a8 0000000000000000 900000010025f8e8
[  180.907432]         900000010025f8e0 900000010025f8e0 90000000081005e8 6572617764726148
[  180.907435]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a000790
[  180.907439]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  180.907442]         000000000000001f 9000000003f3aa60 0000000007a08000 0000000005f5e100
[  180.907446]         0000000000000000 0000000000000000 9000000002805d80 900000010025f7a8
[  180.907449]         900000000296c000 9000000002c90b58 900000000296c000 0000000000000000
[  180.907453]         9000000003f38680 0000000000000000 900000000023aba4 00007ffff14af950
[  180.907456]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  180.907460]         ...
[  180.907461] Call Trace:
[  180.907462] [<900000000023aba4>] show_stack+0x10c/0x228
[  180.907464] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  180.907467] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  180.907469] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  180.907472] [<9000000000393a54>] tg_set_cfs_bandwidth+0x964/0xd98
[  180.907474] [<9000000000394268>] cpu_max_write+0x148/0x188
[  180.907476] [<9000000000f56e70>] kernfs_fop_write_iter+0x1b8/0x578
[  180.907478] [<9000000000cfa820>] vfs_write+0x400/0xeb8
[  180.907481] [<9000000000cfb564>] ksys_write+0x9c/0x1f0
[  180.907483] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  180.907487] ---[ end trace ]---
[  180.908087] ------------[ cut here ]------------
[  180.908089] UBSAN: misaligned-access in mm/percpu.c:1824:3
[  180.908090] member access within misaligned address 00000000b2156333 for type 'struct pcpu_chunk'
[  180.908092] which requires 64 byte alignment
[  180.908093] CPU: 0 UID: 0 PID: 1 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  180.908095] Tainted: [L]=SOFTLOCKUP
[  180.908096] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  180.908097] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010025c000
[  180.908102]         900000010025f750 900000010025f758 0000000000000000 900000010025f898
[  180.908105]         900000010025f890 900000010025f890 9000000008100e30 6572617764726148
[  180.908109]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a000790
[  180.908112]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  180.908116]         000000000000001f 9000000003f3aa60 0000000007a08000 0000000000000000
[  180.908119]         0000000000000000 0000000000000000 9000000002805d80 900000010025f758
[  180.908123]         900000000296c000 0000000000000050 0000000000000005 9000000003f69418
[  180.908126]         90000000080a0490 0000000000000000 900000000023aba4 00007ffff14af950
[  180.908130]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  180.908133]         ...
[  180.908135] Call Trace:
[  180.908135] [<900000000023aba4>] show_stack+0x10c/0x228
[  180.908138] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  180.908141] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  180.908143] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  180.908146] [<9000000000a7642c>] pcpu_alloc_noprof+0xc6c/0x1078
[  180.908150] [<9000000000607238>] cgroup_rstat_init+0xf0/0x1e0
[  180.908152] [<90000000005fc980>] cgroup_mkdir+0x140/0xe40
[  180.908155] [<9000000000f51eac>] kernfs_iop_mkdir+0xac/0x2b8
[  180.908157] [<9000000000d308fc>] vfs_mkdir+0x2a4/0x6f8
[  180.908159] [<9000000000d3abe4>] do_mkdirat+0x1c4/0x318
[  180.908162] [<9000000000d3adb0>] sys_mkdirat+0x78/0x108
[  180.908164] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  180.908167] ---[ end trace ]---
[  180.908168] ------------[ cut here ]------------
[  180.908169] UBSAN: misaligned-access in mm/percpu.c:1824:3
[  180.908170] member access within misaligned address 00000000b2156333 for type 'struct pcpu_chunk'
[  180.908171] which requires 64 byte alignment
[  180.908172] CPU: 0 UID: 0 PID: 1 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  180.908174] Tainted: [L]=SOFTLOCKUP
[  180.908174] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  180.908175] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010025c000
[  180.908179]         900000010025f750 900000010025f758 0000000000000000 900000010025f898
[  180.908182]         900000010025f890 900000010025f890 90000000081016f0 6572617764726148
[  180.908186]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a000790
[  180.908189]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  180.908193]         000000000000001f 9000000003f3aa60 0000000007a08000 90000000080a0b40
[  180.908196]         0000000000000000 0000000000000000 9000000002805d80 900000010025f758
[  180.908200]         900000000296c000 0000000000000050 0000000000000005 9000000003f69418
[  180.908203]         90000000080a0490 0000000000000000 900000000023aba4 00007ffff14af950
[  180.908207]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  180.908210]         ...
[  180.908212] Call Trace:
[  180.908212] [<900000000023aba4>] show_stack+0x10c/0x228
[  180.908214] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  180.908217] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  180.908220] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  180.908222] [<9000000000a76444>] pcpu_alloc_noprof+0xc84/0x1078
[  180.908225] [<9000000000607238>] cgroup_rstat_init+0xf0/0x1e0
[  180.908227] [<90000000005fc980>] cgroup_mkdir+0x140/0xe40
[  180.908230] [<9000000000f51eac>] kernfs_iop_mkdir+0xac/0x2b8
[  180.908232] [<9000000000d308fc>] vfs_mkdir+0x2a4/0x6f8
[  180.908233] [<9000000000d3abe4>] do_mkdirat+0x1c4/0x318
[  180.908235] [<9000000000d3adb0>] sys_mkdirat+0x78/0x108
[  180.908237] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  180.908240] ---[ end trace ]---
[  180.908882] systemd[1]: Created slice system-getty.slice - Slice /system/getty.
[  192.279260] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
[  192.330660] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
[  192.432333] systemd[1]: Created slice system-xfs_scrub.slice - xfs_scrub background service slice.
[  192.484939] systemd[1]: Created slice user.slice - User and Session Slice.
[  192.585905] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
[  192.637678] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
[  192.740862] systemd[1]: Expecting device dev-disk-by\x2duuid-779B\x2d937F.device - /dev/disk/by-uuid/779B-937F...
[  192.796264] systemd[1]: Expecting device dev-disk-by\x2duuid-be645d72\x2d53a2\x2d4764\x2daba3\x2d6a9b47fd1c31.device - /dev/disk/by-uuid/be645d72-53a2-4764-aba3-6a9b47fd1c31...
[  192.908356] systemd[1]: Reached target nss-user-lookup.target - User and Group Name Lookups.
[  192.968833] systemd[1]: Reached target remote-fs.target - Remote File Systems.
[  193.029903] systemd[1]: Reached target slices.target - Slice Units.
[  193.119064] systemd[1]: Listening on systemd-creds.socket - Credential Encryption/Decryption.
[  193.218624] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
[  193.284603] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[  193.414802] systemd[1]: Listening on systemd-journald.socket - Journal Sockets.
[  193.482064] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[  193.482079] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[  193.482166] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[  193.758428] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[  193.833104] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File System...
[  194.150941] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
[  194.283573] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory /run/lock...
[  194.364076] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
[  194.522387] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[  194.603067] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
[  194.761490] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
[  194.841365] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
[  194.996919] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
[  195.077802] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
[  195.143919] ACPI: bus type drm_connector registered
[  195.316121] systemd[1]: systemd-fsck-root.service - File System Check on Root Device was skipped because of an unmet condition check (ConditionPathExists=!/run/initramfs/fsck-root).
[  195.316183] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hibernate Storage Info was skipped because of an unmet condition check (ConditionPathExists=/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[  195.674085] systemd[1]: Starting systemd-journald.service - Journal Service...
[  195.859035] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
[  195.859994] ------------[ cut here ]------------
[  196.046669] UBSAN: misaligned-access in kernel/signal.c:1019:4
[  196.046672] member access within misaligned address 000000000baf46de for type 'struct task_struct'
[  196.046676] which requires 64 byte alignment
[  196.046679] CPU: 7 UID: 0 PID: 374 Comm: (journald) Tainted: G             L     6.13.0-rc7+ #2
[  196.141179] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[  196.236567] Tainted: [L]=SOFTLOCKUP
[  196.236568] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  196.236570] Stack : 9000000002805d80
[  196.332641] systemd[1]: Starting systemd-remount-fs.service - Remount Root and Kernel File Systems...
[  196.428035]  0000000000000000 900000000023aae8 900000010ece0000
[  196.428039]         900000010ece35f0 900000010ece35f8 0000000000000000 900000010ece3738
[  196.428043]         900000010ece3730 900000010ece3730 9000000008102e88 6572617764726148
[  197.146421]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000bc00790
[  197.146425]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  197.146429]         000000000000001f 9000000003f3aa60 0000000009608000 0000000000000008
[  197.146433]         0000000000000000 0000000000000000 9000000002805d80 900000010ece35f8
[  197.146436]         900000000296c000 0000000000200000 0000000000000109 900000014c20b190
[  197.146440]         900000014c62a320 0000000000000000 900000000023aba4 000055555c9e0c38
[  197.765214]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  197.963820]         ...
[  197.963823] Call Trace:
[  197.963824] [<900000000023aba4>] show_stack+0x10c/0x228
[  197.963830] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  197.963834] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  197.963838] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  197.963842] [<9000000000312ed8>] complete_signal+0xbb0/0x10b8
[  197.963846] [<9000000000314490>] __send_signal_locked+0x3a8/0x1178
[  197.963848] [<900000000031a744>] do_send_sig_info+0xdc/0x428
[  197.963850] [<900000000031b234>] kill_pid_info_type+0x94/0xc8
[  197.963853] [<900000000032393c>] sys_kill+0x28c/0x4a8
[  197.963855] [<90000000024c659c>] do_syscall+0x11c/0x3b8
[  197.963859] [<9000000000c90d30>] __memcg_slab_free_hook+0x178/0x490
[  197.963863] [<9000000000b89f9c>] kmem_cache_free+0x6d4/0xeb8

[  197.963869] ---[ end trace ]---
[  197.975404] systemd-journald[374]: Collecting audit messages is disabled.
[  199.536631] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[  199.703822] systemd[1]: Starting systemd-udev-load-credentials.service - Load udev Rules from Credentials...
[  199.861379] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[  199.945511] systemd[1]: Started systemd-journald.service - Journal Service.
[  201.034881] systemd-journald[374]: Received client request to flush runtime journal.
[  201.171273] ------------[ cut here ]------------
[  201.253546] UBSAN: misaligned-access in fs/xfs/libxfs/xfs_rmap_btree.c:283:29
[  201.253550] member access within misaligned address 0000000001052bb3 for type 'const union xfs_btree_key'
[  201.253553] which requires 8 byte alignment
[  201.253558] CPU: 7 UID: 0 PID: 374 Comm: systemd-journal Tainted: G             L     6.13.0-rc7+ #2
[  201.526941] Tainted: [L]=SOFTLOCKUP
[  201.526942] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  201.526944] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010ece0000
[  201.526950]         900000010ece2970 900000010ece2978 0000000000000000 900000010ece2ab8
[  201.526954]         900000010ece2ab0 900000010ece2ab0 9000000008103a68 6572617764726148
[  201.526958]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000bc00790
[  201.526961]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  201.940526]         000000000000001f 9000000003f3aa60 0000000009608000 0000000000000001
[  202.008550]         0000000000000000 0000000000000000 9000000002805d80 900000010ece2978
[  202.008556]         900000000296c000 0000000000000004 900000014c345000 00000000000000c4
[  202.008563]         0000000000000000 0000000000000000 900000000023aba4 00007ffff136c010
[  202.262381]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  202.262387]         ...
[  202.262389] Call Trace:
[  202.262390] [<900000000023aba4>] show_stack+0x10c/0x228
[  202.496744] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  202.496749] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  202.496752] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  202.496760] [<ffff80000456c7cc>] xfs_rmapbt_diff_two_keys+0x32c/0x388 [xfs]
[  202.497883] [<ffff8000044d3bd4>] __xfs_btree_updkeys.isra.0+0x1fc/0x570 [xfs]
[  202.792339] [<ffff8000044d41b8>] xfs_btree_update_keys.isra.0+0x270/0x3f0 [xfs]
[  202.793422] [<ffff8000044e5c84>] xfs_btree_insrec+0x5e4/0x1628 [xfs]
[  202.794503] [<ffff8000044e6dd8>] xfs_btree_insert+0x110/0x550 [xfs]
[  202.795587] [<ffff8000045643c0>] xfs_rmap_map+0x200/0xb10 [xfs]
[  202.796672] [<ffff80000456a77c>] xfs_rmap_finish_one+0x18c/0x4e8 [xfs]
[  202.797753] [<ffff80000468209c>] xfs_rmap_update_finish_item+0x24/0x48 [xfs]
[  202.798834] [<ffff8000044fd254>] xfs_defer_finish_one+0x1b4/0x990 [xfs]
[  202.799918] [<ffff8000044fdf08>] xfs_defer_finish_noroll+0x2a8/0xce8 [xfs]
[  202.800998] [<ffff80000463994c>] xfs_trans_commit+0x64/0x140 [xfs]
[  202.802077] [<ffff8000044c491c>] xfs_bmapi_convert_one_delalloc+0x524/0xa88 [xfs]
[  202.803163] [<ffff8000044c4f10>] xfs_bmapi_convert_delalloc+0x90/0xf8 [xfs]
[  202.804243] [<ffff800004598924>] xfs_map_blocks+0x264/0x988 [xfs]
[  202.805326] [<9000000000ed4b74>] iomap_writepages+0x34c/0x3150
[  202.805332] [<ffff80000459916c>] xfs_vm_writepages+0x124/0x298 [xfs]
[  202.806413] [<90000000009eb364>] do_writepages+0x12c/0x980
[  202.806416] [<90000000009bac38>] filemap_fdatawrite_wbc+0xc8/0x168
[  202.806420] [<90000000009c5740>] __filemap_fdatawrite_range+0x78/0xa8
[  202.806423] [<90000000009c6094>] file_write_and_wait_range+0x84/0x170
[  202.806427] [<ffff8000045cc4b4>] xfs_file_fsync+0x8c/0xa48 [xfs]
[  202.807508] [<9000000000deb008>] do_fsync+0x68/0xe0
[  202.807513] [<9000000000deb594>] sys_fsync+0x1c/0x28
[  202.807516] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  202.807559] ---[ end trace ]---
[  202.807562] ------------[ cut here ]------------
[  202.807563] UBSAN: misaligned-access in fs/xfs/libxfs/xfs_rmap_btree.c:284:29
[  202.807565] member access within misaligned address 000000002b89903d for type 'const union xfs_btree_key'
[  202.807568] which requires 8 byte alignment
[  202.807570] CPU: 7 UID: 0 PID: 374 Comm: systemd-journal Tainted: G             L     6.13.0-rc7+ #2
[  202.807573] Tainted: [L]=SOFTLOCKUP
[  202.807574] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  202.807576] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010ece0000
[  202.807580]         900000010ece2970 900000010ece2978 0000000000000000 900000010ece2ab8
[  202.807584]         900000010ece2ab0 900000010ece2ab0 90000000081047f8 6572617764726148
[  202.807588]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000bc00790
[  202.807591]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  202.807595]         000000000000001f 9000000003f3aa60 0000000009608000 0000000000000001
[  202.807598]         0000000000000000 0000000000000000 9000000002805d80 900000010ece2978
[  202.807602]         900000000296c000 0000000000000004 900000014c345000 00000000000000c4
[  202.807605]         0000000000000000 0000000000000000 900000000023aba4 00007ffff136c010
[  202.807609]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  202.807613]         ...
[  202.807614] Call Trace:
[  202.807615] [<900000000023aba4>] show_stack+0x10c/0x228
[  202.807617] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  202.807620] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  202.807623] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  202.807627] [<ffff80000456c7a8>] xfs_rmapbt_diff_two_keys+0x308/0x388 [xfs]
[  202.808709] [<ffff8000044d3bd4>] __xfs_btree_updkeys.isra.0+0x1fc/0x570 [xfs]
[  202.809794] [<ffff8000044d41b8>] xfs_btree_update_keys.isra.0+0x270/0x3f0 [xfs]
[  202.810880] [<ffff8000044e5c84>] xfs_btree_insrec+0x5e4/0x1628 [xfs]
[  202.811962] [<ffff8000044e6dd8>] xfs_btree_insert+0x110/0x550 [xfs]
[  202.813043] [<ffff8000045643c0>] xfs_rmap_map+0x200/0xb10 [xfs]
[  202.814125] [<ffff80000456a77c>] xfs_rmap_finish_one+0x18c/0x4e8 [xfs]
[  202.815205] [<ffff80000468209c>] xfs_rmap_update_finish_item+0x24/0x48 [xfs]
[  202.816283] [<ffff8000044fd254>] xfs_defer_finish_one+0x1b4/0x990 [xfs]
[  202.817366] [<ffff8000044fdf08>] xfs_defer_finish_noroll+0x2a8/0xce8 [xfs]
[  202.818447] [<ffff80000463994c>] xfs_trans_commit+0x64/0x140 [xfs]
[  202.819528] [<ffff8000044c491c>] xfs_bmapi_convert_one_delalloc+0x524/0xa88 [xfs]
[  202.820612] [<ffff8000044c4f10>] xfs_bmapi_convert_delalloc+0x90/0xf8 [xfs]
[  202.821693] [<ffff800004598924>] xfs_map_blocks+0x264/0x988 [xfs]
[  202.822777] [<9000000000ed4b74>] iomap_writepages+0x34c/0x3150
[  202.822782] [<ffff80000459916c>] xfs_vm_writepages+0x124/0x298 [xfs]
[  202.823862] [<90000000009eb364>] do_writepages+0x12c/0x980
[  202.823864] [<90000000009bac38>] filemap_fdatawrite_wbc+0xc8/0x168
[  202.823866] [<90000000009c5740>] __filemap_fdatawrite_range+0x78/0xa8
[  202.823869] [<90000000009c6094>] file_write_and_wait_range+0x84/0x170
[  202.823872] [<ffff8000045cc4b4>] xfs_file_fsync+0x8c/0xa48 [xfs]
[  202.824952] [<9000000000deb008>] do_fsync+0x68/0xe0
[  202.824955] [<9000000000deb594>] sys_fsync+0x1c/0x28
[  202.824959] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  202.824971] ---[ end trace ]---
[  202.832511] ------------[ cut here ]------------
[  202.832517] UBSAN: misaligned-access in net/ipv4/devinet.c:2365:2
[  202.832519] member access within misaligned address 000000000506229a for type 'struct net_device'
[  202.832522] which requires 64 byte alignment
[  202.832525] CPU: 0 UID: 0 PID: 405 Comm: systemd-sysctl Tainted: G             L     6.13.0-rc7+ #2
[  202.832528] Tainted: [L]=SOFTLOCKUP
[  202.832529] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  202.832531] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000111788000
[  202.832538]         900000011178b6a0 900000011178b6a8 0000000000000000 900000011178b7e8
[  202.832542]         900000011178b7e0 900000011178b7e0 9000000008105578 6572617764726148
[  202.832546]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a000790
[  202.832549]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  202.832553]         000000000000001f 9000000003f3aa60 0000000007a08000 0000000000000000
[  202.832556]         0000000000000000 0000000000000000 9000000002805d80 900000011178b6a8
[  202.832560]         900000000296c000 0000000000000000 0000000000000002 0000000000000038
[  202.832564]         0000000000000000 0000000000000000 900000000023aba4 00007ffff0a71788
[  202.832567]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  202.832571]         ...
[  202.832573] Call Trace:
[  202.832574] [<900000000023aba4>] show_stack+0x10c/0x228
[  202.832580] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  202.832584] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  202.832587] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  202.832591] [<9000000002017b1c>] devinet_conf_proc+0x31c/0x928
[  202.832594] [<9000000000f3ca34>] proc_sys_call_handler+0x22c/0x510
[  202.832598] [<9000000000cfa820>] vfs_write+0x400/0xeb8
[  202.832602] [<9000000000cfb564>] ksys_write+0x9c/0x1f0
[  202.832605] [<90000000024c659c>] do_syscall+0x11c/0x3b8
[  202.832608] [<90000000024d1af0>] __cond_resched+0x40/0x148
[  202.832611] [<90000000024df970>] down_write+0x30/0x168
[  202.832613] [<9000000000cf1414>] default_llseek+0xb4/0x2d0

[  202.832619] ---[ end trace ]---
[  203.209576] ------------[ cut here ]------------
[  203.223568] ------------[ cut here ]------------
[  203.279690] UBSAN: misaligned-access in kernel/exit.c:773:2
[  203.341033] UBSAN: misaligned-access in kernel/exit.c:773:2
[  203.341036] member access within misaligned address 00000000589e8113 for type 'struct task_struct'
[  203.402170] member access within misaligned address 0000000024c37b49 for type 'struct task_struct'
[  203.463693] which requires 64 byte alignment
[  203.463697] CPU: 0 UID: 0 PID: 410 Comm: journal-offline Tainted: G             L     6.13.0-rc7+ #2
[  203.463700] Tainted: [L]=SOFTLOCKUP
[  203.525071] which requires 64 byte alignment
[  203.586506] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  203.586508] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000150438000
[  209.096720]         900000015043bab0 900000015043bab8 0000000000000000 900000015043bbf8
[  209.096728]         900000015043bbf0 900000015043bbf0 9000000008105f48 6572617764726148
[  209.198513]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a000790
[  209.198519]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  209.198523]         000000000000001f 9000000003f3aa60 0000000007a08000 9000000002c740d8
[  209.198527]         0000000000000000 0000000000000000 9000000002805d80 900000015043bab8
[  209.198531]         900000000296c000 0000000000000000 900000015043bcd0 900000015043bcd0
[  209.452198]         900000015043b750 0000000000000000 900000000023aba4 00007ffff08ce1e8
[  209.452205]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  209.452211]         ...
[  209.452214] Call Trace:
[  209.452216] [<900000000023aba4>] show_stack+0x10c/0x228
[  209.452223] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  209.452229] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  209.452233] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  209.452238] [<90000000002ee044>] do_exit+0x1304/0x28c0
[  209.452242] [<90000000002efa7c>] sys_exit+0x1c/0x20
[  209.452245] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  209.452255] CPU: 6 UID: 0 PID: 409 Comm: journal-offline Tainted: G             L     6.13.0-rc7+ #2
[  209.452260] Tainted: [L]=SOFTLOCKUP
[  209.452262] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  209.452264] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000153880000
[  209.452271]         9000000153883b50 9000000153883b58 0000000000000000
[  209.452275] ---[ end trace ]---
[  209.452276]  9000000153883c98
[  209.452279]         9000000153883c90 9000000153883c90 90000000081065c0 6572617764726148
[  209.452285]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000b800790
[  209.452290]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  209.452296]         000000000000001f 9000000003f3aa60 0000000009208000 9000000002c740d8
[  209.452303]         0000000000000000 0000000000000000 9000000002805d80 9000000153883b58
[  209.452309]         900000000296c000 0000000000000000 9000000153883d70 9000000153883d70
[  209.452315]         90000001538837f0 0000000000000000 900000000023aba4 00007ffff0da1180
[  209.452322]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[  209.452328]         ...
[  209.452331] Call Trace:
[  209.452332] [<900000000023aba4>] show_stack+0x10c/0x228
[  209.452338] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  209.452343] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  209.452347] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  209.452352] [<90000000002ee060>] do_exit+0x1320/0x28c0
[  209.452356] [<90000000002efa7c>] sys_exit+0x1c/0x20
[  209.452360] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  209.452366] ---[ end trace ]---
[  211.682234] ------------[ cut here ]------------
[  211.682239] UBSAN: misaligned-access in fs/fs_struct.c:65:2
[  211.682241] member access within misaligned address 00000000ab39bd96 for type 'struct task_struct'
[  211.682244] which requires 64 byte alignment
[  211.682246] CPU: 3 UID: 0 PID: 418 Comm: (imesyncd) Tainted: G             L     6.13.0-rc7+ #2
[  211.682250] Tainted: [L]=SOFTLOCKUP
[  211.682251] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  211.682253] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000014cb3c000
[  211.682259]         900000014cb3f910 900000014cb3f918 0000000000000000 900000014cb3fa58
[  211.682263]         900000014cb3fa50 900000014cb3fa50 9000000008106d88 6572617764726148
[  211.682267]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000ac00790
[  211.682270]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  211.682274]         000000000000001f 9000000003f3aa60 0000000008608000 0000000000001000
[  211.682278]         0000000000000000 0000000000000000 9000000002805d80 900000014cb3f918
[  211.682282]         900000000296c000 9000000100381598 0000000000000001 900000014cb3fc88
[  211.682285]         0000000000000000 0000000000000000 900000000023aba4 0000555567f50078
[  211.682289]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  211.682293]         ...
[  211.682294] Call Trace:
[  211.682296] [<900000000023aba4>] show_stack+0x10c/0x228
[  211.682301] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  211.682305] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  211.682308] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  211.682313] [<9000000000def2e0>] chroot_fs_refs+0x668/0xee8
[  211.682317] [<9000000000d9dacc>] sys_pivot_root+0xa74/0x2470
[  211.682319] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  211.682325] ---[ end trace ]---
[  211.695919] ------------[ cut here ]------------
[  211.695921] UBSAN: misaligned-access in net/ipv6/addrconf.c:1881:3
[  211.695923] member access within misaligned address 000000000506229a for type 'struct net_device'
[  211.695925] which requires 64 byte alignment
[  211.695927] CPU: 5 UID: 989 PID: 426 Comm: sd-resolve Tainted: G             L     6.13.0-rc7+ #2
[  211.695929] Tainted: [L]=SOFTLOCKUP
[  211.695930] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  211.695931] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000110e18000
[  211.695936]         9000000110e1b390 9000000110e1b398 0000000000000000 9000000110e1b4d8
[  211.695940]         9000000110e1b4d0 9000000110e1b4d0 9000000008107538 6572617764726148
[  211.695944]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000b400790
[  211.695948]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  211.695951]         000000000000001f 9000000003f3aa60 0000000008e08000 0000000000000038
[  211.695955]         0000000000000000 0000000000000000 9000000002805d80 9000000110e1b398
[  211.695958]         900000000296c000 9000000003fccbc0 9000000110e1b5a0 900000000296c000
[  211.695962]         9000000003fccc50 0000000000000000 900000000023aba4 00007ffff00d4190
[  211.695965]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  211.695969]         ...
[  211.695971] Call Trace:
[  211.695971] [<900000000023aba4>] show_stack+0x10c/0x228
[  211.695975] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  211.695978] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  211.695981] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  211.695984] [<90000000021a4fc0>] ipv6_dev_get_saddr+0x360/0x588
[  211.695987] [<9000000002186654>] ip6_dst_lookup_tail.constprop.0+0x664/0x1a78
[  211.695990] [<9000000002187ab8>] ip6_dst_lookup_flow+0x50/0x138
[  211.695991] [<9000000002290e3c>] ip6_datagram_dst_update+0x27c/0xa28
[  211.695994] [<9000000002291b14>] __ip6_datagram_connect+0x2c4/0x1198
[  211.695997] [<900000000222a320>] udpv6_connect+0x40/0x328
[  211.696000] [<9000000001bb2918>] __sys_connect+0xf0/0x108
[  211.696004] [<9000000001bb294c>] sys_connect+0x1c/0x28
[  211.696006] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  211.696010] ---[ end trace ]---
[  215.526539] Adding 32441328k swap on /dev/nvme0n1p3.  Priority:-2 extents:1 across:32441328k SS
[  215.553358] snd_hda_intel 0000:00:06.2: Force to snoop mode by module option
[  215.553474] snd_hda_intel 0000:00:07.0: Force to snoop mode by module option
[  215.625072] input: HDA Loongson HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:06.2/sound/card0/input6
[  215.718690] snd_hda_codec_conexant hdaudioC1D0: CX20632: BIOS auto-probing.
[  215.768932] input: HDA Loongson HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:06.2/sound/card0/input7
[  215.821765] snd_hda_codec_conexant hdaudioC1D0: autoconfig for CX20632: line_outs=1 (0x1c/0x0/0x0/0x0/0x0) type:line
[  215.925219] snd_hda_codec_conexant hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[  215.925224] snd_hda_codec_conexant hdaudioC1D0:    hp_outs=1 (0x19/0x0/0x0/0x0/0x0)
[  215.925227] snd_hda_codec_conexant hdaudioC1D0:    mono: mono_out=0x0
[  215.925229] snd_hda_codec_conexant hdaudioC1D0:    inputs:
[  215.926767] snd_hda_codec_conexant hdaudioC1D0:      Front Mic=0x1a
[  216.192065] snd_hda_codec_conexant hdaudioC1D0:      Rear Mic=0x1b
[  216.192067] snd_hda_codec_conexant hdaudioC1D0:      Line=0x1d
[  216.202685] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:07.0/sound/card1/input8
[  216.350881] input: HDA Loongson Front Mic as /devices/pci0000:00/0000:00:07.0/sound/card1/input9
[  216.351053] input: HDA Loongson Rear Mic as /devices/pci0000:00/0000:00:07.0/sound/card1/input10
[  216.351195] input: HDA Loongson Line as /devices/pci0000:00/0000:00:07.0/sound/card1/input11
[  216.351353] input: HDA Loongson Line Out as /devices/pci0000:00/0000:00:07.0/sound/card1/input12
[  216.352964] input: HDA Loongson Front Headphone as /devices/pci0000:00/0000:00:07.0/sound/card1/input13
[  217.433020] audit: type=1400 audit(1739237971.456:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-senddoc" pid=536 comm="apparmor_parser"
[  217.440102] audit: type=1400 audit(1739237971.464:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-oosplash" pid=535 comm="apparmor_parser"
[  217.447045] audit: type=1400 audit(1739237971.468:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=531 comm="apparmor_parser"
[  217.456089] audit: type=1400 audit(1739237971.480:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-xpdfimport" pid=539 comm="apparmor_parser"
[  217.466625] audit: type=1400 audit(1739237971.488:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=532 comm="apparmor_parser"
[  217.467663] audit: type=1400 audit(1739237971.492:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=532 comm="apparmor_parser"
[  217.471102] audit: type=1400 audit(1739237971.496:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/man" pid=534 comm="apparmor_parser"
[  217.471637] audit: type=1400 audit(1739237971.496:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_filter" pid=534 comm="apparmor_parser"
[  217.472518] audit: type=1400 audit(1739237971.496:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="man_groff" pid=534 comm="apparmor_parser"
[  217.488957] audit: type=1400 audit(1739237971.500:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/cups-browsed" pid=542 comm="apparmor_parser"
[  221.739910] ------------[ cut here ]------------
[  221.739915] UBSAN: misaligned-access in lib/rhashtable.c:202:12
[  221.739918] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  221.739921] which requires 64 byte alignment
[  221.739924] CPU: 0 UID: 0 PID: 105 Comm: kworker/0:3 Tainted: G             L     6.13.0-rc7+ #2
[  221.739928] Tainted: [L]=SOFTLOCKUP
[  221.739929] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  221.739931] Workqueue: events rht_deferred_worker
[  221.739938] Stack : 0000000000400000 0000000000000000 900000000023aae8 900000010454c000
[  221.739943]         900000010454f9b0 900000010454f9b8 0000000000000000 900000010454faf8
[  221.739947]         900000010454faf0 900000010454faf0 900000010454f9e8 756575716b726f57
[  221.739951]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a000790
[  221.739954]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  221.739958]         900000000274b680 0000000000000000 0000000007a08000 0000000000400000
[  221.739962]         0000000000000000 0000000000000000 9000000002805d80 900000010454f9b8
[  221.739965]         900000000296c000 0000000000000010 0000000000000003 900000010006ec70
[  221.739969]         9000000100193005 0000000000000000 900000000023aba4 000055556f386b40
[  221.739972]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  221.739976]         ...
[  221.739978] Call Trace:
[  221.739979] [<900000000023aba4>] show_stack+0x10c/0x228
[  221.739985] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  221.739988] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  221.739992] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  221.739996] [<90000000013e5538>] bucket_table_alloc.isra.0+0x1d8/0x340
[  221.739998] [<90000000013e9590>] rht_deferred_worker+0x4c8/0x1550
[  221.740001] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  221.740004] [<9000000000350d94>] worker_thread+0x314/0x1240
[  221.740007] [<9000000000367010>] kthread+0x1a0/0x3c0
[  221.740010] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  221.740015] ---[ end trace ]---
[  221.740016] ------------[ cut here ]------------
[  221.740017] UBSAN: misaligned-access in lib/rhashtable.c:204:2
[  221.740018] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  221.740019] which requires 64 byte alignment
[  221.740021] CPU: 0 UID: 0 PID: 105 Comm: kworker/0:3 Tainted: G             L     6.13.0-rc7+ #2
[  221.740023] Tainted: [L]=SOFTLOCKUP
[  221.740024] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  221.740025] Workqueue: events rht_deferred_worker
[  221.740027] Stack : 0000000000400000 0000000000000000 900000000023aae8 900000010454c000
[  221.740031]         900000010454f9b0 900000010454f9b8 0000000000000000 900000010454faf8
[  221.740035]         900000010454faf0 900000010454faf0 900000010454f9e8 756575716b726f57
[  221.740038]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a000790
[  221.740042]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  221.740045]         900000000274b680 0000000000000000 0000000007a08000 0000000000400000
[  221.740049]         0000000000000000 0000000000000000 9000000002805d80 900000010454f9b8
[  221.740052]         900000000296c000 0000000000000010 0000000000000003 900000010006ec70
[  221.740056]         9000000100193005 0000000000000000 900000000023aba4 000055556f386b40
[  221.740060]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  221.740063]         ...
[  221.740065] Call Trace:
[  221.740065] [<900000000023aba4>] show_stack+0x10c/0x228
[  221.740067] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  221.740070] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  221.740073] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  221.740076] [<90000000013e54f4>] bucket_table_alloc.isra.0+0x194/0x340
[  221.740078] [<90000000013e9590>] rht_deferred_worker+0x4c8/0x1550
[  221.740080] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  221.740083] [<9000000000350d94>] worker_thread+0x314/0x1240
[  221.740085] [<9000000000367010>] kthread+0x1a0/0x3c0
[  221.740088] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  221.740092] ---[ end trace ]---
[  221.740093] ------------[ cut here ]------------
[  221.740093] UBSAN: misaligned-access in lib/rhashtable.c:205:2
[  221.740095] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  221.740096] which requires 64 byte alignment
[  221.740097] CPU: 0 UID: 0 PID: 105 Comm: kworker/0:3 Tainted: G             L     6.13.0-rc7+ #2
[  221.740099] Tainted: [L]=SOFTLOCKUP
[  221.740100] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  221.740101] Workqueue: events rht_deferred_worker
[  221.740103] Stack : 0000000000400000 0000000000000000 900000000023aae8 900000010454c000
[  221.740107]         900000010454f9b0 900000010454f9b8 0000000000000000 900000010454faf8
[  221.740111]         900000010454faf0 900000010454faf0 900000010454f9e8 756575716b726f57
[  221.740114]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a000790
[  221.740118]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  221.740121]         900000000274b680 0000000000000000 0000000007a08000 0000000000400000
[  221.740125]         0000000000000000 0000000000000000 9000000002805d80 900000010454f9b8
[  221.740128]         900000000296c000 0000000000000010 0000000000000003 900000010006ec70
[  221.740132]         9000000100193005 0000000000000000 900000000023aba4 000055556f386b40
[  221.740135]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  221.740139]         ...
[  221.740140] Call Trace:
[  221.740141] [<900000000023aba4>] show_stack+0x10c/0x228
[  221.740143] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  221.740146] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  221.740148] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  221.740151] [<90000000013e54c8>] bucket_table_alloc.isra.0+0x168/0x340
[  221.740153] [<90000000013e9590>] rht_deferred_worker+0x4c8/0x1550
[  221.740155] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  221.740157] [<9000000000350d94>] worker_thread+0x314/0x1240
[  221.740160] [<9000000000367010>] kthread+0x1a0/0x3c0
[  221.740163] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  221.740166] ---[ end trace ]---
[  221.740168] ------------[ cut here ]------------
[  221.740168] UBSAN: misaligned-access in lib/rhashtable.c:207:16
[  221.740170] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  221.740171] which requires 64 byte alignment
[  221.740172] CPU: 0 UID: 0 PID: 105 Comm: kworker/0:3 Tainted: G             L     6.13.0-rc7+ #2
[  221.740174] Tainted: [L]=SOFTLOCKUP
[  221.740174] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  221.740175] Workqueue: events rht_deferred_worker
[  221.740178] Stack : 0000000000400000 0000000000000000 900000000023aae8 900000010454c000
[  221.740182]         900000010454f9b0 900000010454f9b8 0000000000000000 900000010454faf8
[  221.740185]         900000010454faf0 900000010454faf0 900000010454f9e8 756575716b726f57
[  221.740189]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a000790
[  221.740192]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  221.740196]         900000000274b680 0000000000000000 0000000007a08000 0000000000400000
[  221.740199]         0000000000000000 0000000000000000 9000000002805d80 900000010454f9b8
[  221.740203]         900000000296c000 0000000000000010 0000000000000003 900000010006ec70
[  221.740206]         9000000100193005 0000000000000000 900000000023aba4 000055556f386b40
[  221.740210]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  221.740213]         ...
[  221.740215] Call Trace:
[  221.740215] [<900000000023aba4>] show_stack+0x10c/0x228
[  221.740217] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  221.740220] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  221.740222] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  221.740225] [<90000000013e5550>] bucket_table_alloc.isra.0+0x1f0/0x340
[  221.740227] [<90000000013e9590>] rht_deferred_worker+0x4c8/0x1550
[  221.740229] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  221.740232] [<9000000000350d94>] worker_thread+0x314/0x1240
[  221.740234] [<9000000000367010>] kthread+0x1a0/0x3c0
[  221.740237] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  221.740240] ---[ end trace ]---
[  221.740241] ------------[ cut here ]------------
[  221.740242] UBSAN: misaligned-access in lib/rhashtable.c:210:3
[  221.740243] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  221.740244] which requires 64 byte alignment
[  221.740245] CPU: 0 UID: 0 PID: 105 Comm: kworker/0:3 Tainted: G             L     6.13.0-rc7+ #2
[  221.740247] Tainted: [L]=SOFTLOCKUP
[  221.740248] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  221.740249] Workqueue: events rht_deferred_worker
[  221.740251] Stack : 0000000000400000 0000000000000000 900000000023aae8 900000010454c000
[  221.740254]         900000010454f9b0 900000010454f9b8 0000000000000000 900000010454faf8
[  221.740258]         900000010454faf0 900000010454faf0 900000010454f9e8 756575716b726f57
[  221.740262]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a000790
[  221.740265]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  221.740269]         900000000274b680 0000000000000000 0000000007a08000 0000000000400000
[  221.740272]         0000000000000000 0000000000000000 9000000002805d80 900000010454f9b8
[  221.740276]         900000000296c000 0000000000000010 0000000000000003 900000010006ec70
[  221.740279]         9000000100193005 0000000000000000 900000000023aba4 000055556f386b40
[  221.740283]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  221.740286]         ...
[  221.740288] Call Trace:
[  221.740288] [<900000000023aba4>] show_stack+0x10c/0x228
[  221.740290] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  221.740293] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  221.740295] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  221.740298] [<90000000013e5484>] bucket_table_alloc.isra.0+0x124/0x340
[  221.740300] [<90000000013e9590>] rht_deferred_worker+0x4c8/0x1550
[  221.740302] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  221.740304] [<9000000000350d94>] worker_thread+0x314/0x1240
[  221.740306] [<9000000000367010>] kthread+0x1a0/0x3c0
[  221.740310] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  221.740313] ---[ end trace ]---
[  221.740314] ------------[ cut here ]------------
[  221.740315] UBSAN: misaligned-access in lib/rhashtable.c:222:9
[  221.740316] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  221.740317] which requires 64 byte alignment
[  221.740318] CPU: 0 UID: 0 PID: 105 Comm: kworker/0:3 Tainted: G             L     6.13.0-rc7+ #2
[  221.740320] Tainted: [L]=SOFTLOCKUP
[  221.740321] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  221.740322] Workqueue: events rht_deferred_worker
[  221.740324] Stack : 0000000000000020 0000000000000000 900000000023aae8 900000010454c000
[  221.740327]         900000010454f9f0 900000010454f9f8 0000000000000000 900000010454fb38
[  221.740331]         900000010454fb30 900000010454fb30 900000010454fa28 756575716b726f57
[  221.740335]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a000790
[  221.740338]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  221.740342]         900000000274b680 0000000000000000 0000000007a08000 0000000000000020
[  221.740345]         0000000000000000 0000000000000000 9000000002805d80 900000010454f9f8
[  221.740349]         900000000296c000 9000000114c8a680 900000010ab62d60 900000010ab62d60
[  221.740352]         0000000000000000 0000000000000000 900000000023aba4 000055556f386b40
[  221.740356]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  221.740359]         ...
[  221.740361] Call Trace:
[  221.740361] [<900000000023aba4>] show_stack+0x10c/0x228
[  221.740363] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  221.740366] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  221.740368] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  221.740371] [<90000000013e99d4>] rht_deferred_worker+0x90c/0x1550
[  221.740373] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  221.740375] [<9000000000350d94>] worker_thread+0x314/0x1240
[  221.740377] [<9000000000367010>] kthread+0x1a0/0x3c0
[  221.740380] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  221.740384] ---[ end trace ]---
[  221.740384] ------------[ cut here ]------------
[  221.740385] UBSAN: misaligned-access in lib/rhashtable.c:240:13
[  221.740386] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  221.740387] which requires 64 byte alignment
[  221.740388] CPU: 0 UID: 0 PID: 105 Comm: kworker/0:3 Tainted: G             L     6.13.0-rc7+ #2
[  221.740390] Tainted: [L]=SOFTLOCKUP
[  221.740390] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  221.740391] Workqueue: events rht_deferred_worker
[  221.740394] Stack : 0000000000000020 0000000000000000 900000000023aae8 900000010454c000
[  221.740397]         900000010454f9f0 900000010454f9f8 0000000000000000 900000010454fb38
[  221.740401]         900000010454fb30 900000010454fb30 900000010454fa28 756575716b726f57
[  221.740404]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a000790
[  221.740408]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  221.740411]         900000000274b680 0000000000000000 0000000007a08000 0000000000000020
[  221.740415]         0000000000000000 0000000000000000 9000000002805d80 900000010454f9f8
[  221.740418]         900000000296c000 9000000114c8a680 900000010ab62d60 0000000000000000
[  221.740422]         0000000000000000 0000000000000000 900000000023aba4 000055556f386b40
[  221.740425]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  221.740429]         ...
[  221.740430] Call Trace:
[  221.740431] [<900000000023aba4>] show_stack+0x10c/0x228
[  221.740432] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  221.740435] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  221.740438] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  221.740440] [<90000000013e9b70>] rht_deferred_worker+0xaa8/0x1550
[  221.740442] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  221.740444] [<9000000000350d94>] worker_thread+0x314/0x1240
[  221.740447] [<9000000000367010>] kthread+0x1a0/0x3c0
[  221.740450] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  221.740453] ---[ end trace ]---
[  221.740454] ------------[ cut here ]------------
[  221.740455] UBSAN: misaligned-access in ./include/linux/rhashtable.h:173:17
[  221.740456] member access within misaligned address 00000000687e66ed for type 'const struct bucket_table'
[  221.740458] which requires 64 byte alignment
[  221.740459] CPU: 0 UID: 0 PID: 105 Comm: kworker/0:3 Tainted: G             L     6.13.0-rc7+ #2
[  221.740460] Tainted: [L]=SOFTLOCKUP
[  221.740461] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  221.740462] Workqueue: events rht_deferred_worker
[  221.740464] Stack : 0000000000000020 0000000000000000 900000000023aae8 900000010454c000
[  221.740468]         900000010454f9f0 900000010454f9f8 0000000000000000 900000010454fb38
[  221.740471]         900000010454fb30 900000010454fb30 900000010454fa28 756575716b726f57
[  221.740475]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a000790
[  221.740478]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  221.740482]         900000000274b680 0000000000000000 0000000007a08000 0000000000000020
[  221.740485]         0000000000000000 0000000000000000 9000000002805d80 900000010454f9f8
[  221.740489]         900000000296c000 9000000114c8a691 900000010ab62d60 0000000000000000
[  221.740492]         0000000000000000 0000000000000000 900000000023aba4 000055556f386b40
[  221.740496]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  221.740499]         ...
[  221.740501] Call Trace:
[  221.740501] [<900000000023aba4>] show_stack+0x10c/0x228
[  221.740503] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  221.740506] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  221.740508] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  221.740511] [<90000000013ea1a4>] rht_deferred_worker+0x10dc/0x1550
[  221.740513] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  221.740515] [<9000000000350d94>] worker_thread+0x314/0x1240
[  221.740517] [<9000000000367010>] kthread+0x1a0/0x3c0
[  221.740520] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  221.740524] ---[ end trace ]---
[  221.740525] ------------[ cut here ]------------
[  221.740525] UBSAN: misaligned-access in ./include/linux/rhashtable.h:122:20
[  221.740526] member access within misaligned address 00000000687e66ed for type 'const struct bucket_table'
[  221.740527] which requires 64 byte alignment
[  221.740528] CPU: 0 UID: 0 PID: 105 Comm: kworker/0:3 Tainted: G             L     6.13.0-rc7+ #2
[  221.740530] Tainted: [L]=SOFTLOCKUP
[  221.740531] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  221.740532] Workqueue: events rht_deferred_worker
[  221.740534] Stack : 0000000000000020 0000000000000000 900000000023aae8 900000010454c000
[  221.740538]         900000010454f9f0 900000010454f9f8 0000000000000000 900000010454fb38
[  221.740541]         900000010454fb30 900000010454fb30 900000010454fa28 756575716b726f57
[  221.740545]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a000790
[  221.740548]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  221.740552]         900000000274b680 0000000000000000 0000000007a08000 0000000000000020
[  221.740555]         0000000000000000 0000000000000000 9000000002805d80 900000010454f9f8
[  221.740559]         900000000296c000 9000000114c8a691 900000010ab62d60 0000000000000000
[  221.740562]         0000000000000000 0000000000000000 900000000023aba4 000055556f386b40
[  221.740565]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  221.740569]         ...
[  221.740570] Call Trace:
[  221.740571] [<900000000023aba4>] show_stack+0x10c/0x228
[  221.740573] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  221.740575] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  221.740578] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  221.740580] [<90000000013ea218>] rht_deferred_worker+0x1150/0x1550
[  221.740583] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  221.740585] [<9000000000350d94>] worker_thread+0x314/0x1240
[  221.740587] [<9000000000367010>] kthread+0x1a0/0x3c0
[  221.740590] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  221.740593] ---[ end trace ]---
[  221.740594] ------------[ cut here ]------------
[  221.740595] UBSAN: misaligned-access in lib/rhashtable.c:261:10
[  221.740596] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  221.740597] which requires 64 byte alignment
[  221.740598] CPU: 0 UID: 0 PID: 105 Comm: kworker/0:3 Tainted: G             L     6.13.0-rc7+ #2
[  221.740599] Tainted: [L]=SOFTLOCKUP
[  221.740600] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  221.740601] Workqueue: events rht_deferred_worker
[  221.740603] Stack : 0000000000000020 0000000000000000 900000000023aae8 900000010454c000
[  221.740607]         900000010454f9f0 900000010454f9f8 0000000000000000 900000010454fb38
[  221.740610]         900000010454fb30 900000010454fb30 900000010454fa28 756575716b726f57
[  221.740614]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a000790
[  221.740617]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  221.740621]         900000000274b680 0000000000000000 0000000007a08000 0000000000000020
[  221.740624]         0000000000000000 0000000000000000 9000000002805d80 900000010454f9f8
[  221.740628]         900000000296c000 9000000114c8a691 900000010ab62d60 0000000000000000
[  221.740631]         0000000000000000 0000000000000000 900000000023aba4 000055556f386b40
[  221.740635]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  221.740638]         ...
[  221.740640] Call Trace:
[  221.740640] [<900000000023aba4>] show_stack+0x10c/0x228
[  221.740642] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  221.740645] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  221.740647] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  221.740650] [<90000000013e9b54>] rht_deferred_worker+0xa8c/0x1550
[  221.740652] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  221.740654] [<9000000000350d94>] worker_thread+0x314/0x1240
[  221.740656] [<9000000000367010>] kthread+0x1a0/0x3c0
[  221.740659] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  221.740662] ---[ end trace ]---
[  221.740663] ------------[ cut here ]------------
[  221.740664] UBSAN: misaligned-access in lib/rhashtable.c:264:17
[  221.740665] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  221.740666] which requires 64 byte alignment
[  221.740667] CPU: 0 UID: 0 PID: 105 Comm: kworker/0:3 Tainted: G             L     6.13.0-rc7+ #2
[  221.740668] Tainted: [L]=SOFTLOCKUP
[  221.740669] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  221.740670] Workqueue: events rht_deferred_worker
[  221.740672] Stack : 0000000000000020 0000000000000000 900000000023aae8 900000010454c000
[  221.740676]         900000010454f9f0 900000010454f9f8 0000000000000000 900000010454fb38
[  221.740680]         900000010454fb30 900000010454fb30 900000010454fa28 756575716b726f57
[  221.740683]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a000790
[  221.740687]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  221.740690]         900000000274b680 0000000000000000 0000000007a08000 0000000000000020
[  221.740693]         0000000000000000 0000000000000000 9000000002805d80 900000010454f9f8
[  221.740697]         900000000296c000 9000000114c8a691 900000010ab62d60 0000000000000000
[  221.740700]         0000000000000000 0000000000000000 900000000023aba4 000055556f386b40
[  221.740704]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  221.740707]         ...
[  221.740709] Call Trace:
[  221.740709] [<900000000023aba4>] show_stack+0x10c/0x228
[  221.740711] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  221.740714] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  221.740716] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  221.740719] [<90000000013e9d28>] rht_deferred_worker+0xc60/0x1550
[  221.740721] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  221.740723] [<9000000000350d94>] worker_thread+0x314/0x1240
[  221.740725] [<9000000000367010>] kthread+0x1a0/0x3c0
[  221.740728] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  221.740732] ---[ end trace ]---
[  221.740732] ------------[ cut here ]------------
[  221.740733] UBSAN: misaligned-access in lib/rhashtable.c:268:2
[  221.740734] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  221.740735] which requires 64 byte alignment
[  221.740736] CPU: 0 UID: 0 PID: 105 Comm: kworker/0:3 Tainted: G             L     6.13.0-rc7+ #2
[  221.740738] Tainted: [L]=SOFTLOCKUP
[  221.740738] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  221.740739] Workqueue: events rht_deferred_worker
[  221.740742] Stack : 0000000000000020 0000000000000000 900000000023aae8 900000010454c000
[  221.740745]         900000010454f9f0 900000010454f9f8 0000000000000000 900000010454fb38
[  221.740749]         900000010454fb30 900000010454fb30 900000010454fa28 756575716b726f57
[  221.740752]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a000790
[  221.740756]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  221.740759]         900000000274b680 0000000000000000 0000000007a08000 0000000000000020
[  221.740763]         0000000000000000 0000000000000000 9000000002805d80 900000010454f9f8
[  221.740766]         900000000296c000 9000000114c8a691 900000010ab62d60 0000000000000000
[  221.740770]         0000000000000000 0000000000000000 900000000023aba4 000055556f386b40
[  221.740773]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  221.740777]         ...
[  221.740778] Call Trace:
[  221.740779] [<900000000023aba4>] show_stack+0x10c/0x228
[  221.740780] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  221.740783] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  221.740786] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  221.740788] [<90000000013e9c88>] rht_deferred_worker+0xbc0/0x1550
[  221.740790] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  221.740792] [<9000000000350d94>] worker_thread+0x314/0x1240
[  221.740794] [<9000000000367010>] kthread+0x1a0/0x3c0
[  221.740797] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  221.740801] ---[ end trace ]---
[  221.740804] ------------[ cut here ]------------
[  221.740805] UBSAN: misaligned-access in lib/rhashtable.c:355:9
[  221.740806] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  221.740807] which requires 64 byte alignment
[  221.740808] CPU: 0 UID: 0 PID: 105 Comm: kworker/0:3 Tainted: G             L     6.13.0-rc7+ #2
[  221.740809] Tainted: [L]=SOFTLOCKUP
[  221.740810] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  221.740811] Workqueue: events rht_deferred_worker
[  221.740813] Stack : 0000000000000020 0000000000000000 900000000023aae8 900000010454c000
[  221.740817]         900000010454f9f0 900000010454f9f8 0000000000000000 900000010454fb38
[  221.740820]         900000010454fb30 900000010454fb30 900000010454fa28 756575716b726f57
[  221.740824]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a000790
[  221.740827]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  221.740831]         900000000274b680 0000000000000000 0000000007a08000 0000000000000020
[  221.740834]         0000000000000000 0000000000000000 9000000002805d80 900000010454f9f8
[  221.740837]         900000000296c000 900000010ab62d60 0000000000000000 900000010006ec70
[  221.740841]         9000000114c8a640 0000000000000000 900000000023aba4 000055556f386b40
[  221.740844]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  221.740848]         ...
[  221.740849] Call Trace:
[  221.740850] [<900000000023aba4>] show_stack+0x10c/0x228
[  221.740852] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  221.740854] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  221.740857] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  221.740859] [<90000000013ea5a8>] rht_deferred_worker+0x14e0/0x1550
[  221.740861] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  221.740864] [<9000000000350d94>] worker_thread+0x314/0x1240
[  221.740866] [<9000000000367010>] kthread+0x1a0/0x3c0
[  221.740869] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  221.740872] ---[ end trace ]---
[  246.376771] ------------[ cut here ]------------
[  246.376776] UBSAN: misaligned-access in ./include/linux/rhashtable.h:173:17
[  246.376778] member access within misaligned address 00000000687e66ed for type 'const struct bucket_table'
[  246.376781] which requires 64 byte alignment
[  246.376784] CPU: 2 UID: 0 PID: 586 Comm: (s-daemon) Tainted: G             L     6.13.0-rc7+ #2
[  246.376787] Tainted: [L]=SOFTLOCKUP
[  246.376788] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.376790] Stack : 9000000002805d80 0000000000000000 900000000023aae8 90000001502e0000
[  246.376797]         90000001502e36e0 90000001502e36e8 0000000000000000 90000001502e3828
[  246.376801]         90000001502e3820 90000001502e3820 900000000810faa8 6572617764726148
[  246.376804]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  246.376808]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.376811]         000000000000001f 9000000003f3aa60 0000000008208000 900000010006e000
[  246.376815]         0000000000000000 0000000000000000 9000000002805d80 90000001502e36e8
[  246.376819]         900000000296c000 0000000000000000 900000010006ec30 900000010ab62d60
[  246.376822]         0000000000000000 0000000000000000 900000000023aba4 00007ffff38b4b28
[  246.376826]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  246.376829]         ...
[  246.376831] Call Trace:
[  246.376833] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.376838] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.376843] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.376845] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.376850] [<9000000001e16a90>] netlink_insert+0x7e0/0x1010
[  246.376854] [<9000000001e1c1a4>] __netlink_kernel_create+0x12c/0x688
[  246.376858] [<900000000245d9c4>] uevent_net_init+0x7c/0x218
[  246.376860] [<9000000001c21094>] ops_init+0xcc/0x550
[  246.376863] [<9000000001c22fe4>] setup_net+0xe4/0x718
[  246.376865] [<9000000001c264c8>] copy_net_ns+0x200/0x798
[  246.376867] [<900000000036cd08>] create_new_namespaces+0x168/0x6a8
[  246.376870] [<900000000036dbfc>] unshare_nsproxy_namespaces+0x8c/0x280
[  246.376873] [<90000000002dc644>] ksys_unshare+0x23c/0xc60
[  246.376877] [<90000000002dd07c>] sys_unshare+0x14/0x20
[  246.376879] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  246.376885] ---[ end trace ]---
[  246.376886] ------------[ cut here ]------------
[  246.376887] UBSAN: misaligned-access in ./include/linux/rhashtable.h:122:20
[  246.376888] member access within misaligned address 00000000687e66ed for type 'const struct bucket_table'
[  246.376890] which requires 64 byte alignment
[  246.376891] CPU: 2 UID: 0 PID: 586 Comm: (s-daemon) Tainted: G             L     6.13.0-rc7+ #2
[  246.376893] Tainted: [L]=SOFTLOCKUP
[  246.376894] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.376895] Stack : 9000000002805d80 0000000000000000 900000000023aae8 90000001502e0000
[  246.376899]         90000001502e36e0 90000001502e36e8 0000000000000000 90000001502e3828
[  246.376902]         90000001502e3820 90000001502e3820 9000000008110450 6572617764726148
[  246.376906]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  246.376909]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.376913]         000000000000001f 9000000003f3aa60 0000000008208000 0000000022385030
[  246.376917]         0000000000000000 0000000000000000 9000000002805d80 90000001502e36e8
[  246.376920]         900000000296c000 0000000000000000 900000010006ec30 900000010ab62d60
[  246.376924]         0000000000000000 0000000000000000 900000000023aba4 00007ffff38b4b28
[  246.376927]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  246.376931]         ...
[  246.376932] Call Trace:
[  246.376933] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.376935] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.376938] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.376940] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.376943] [<9000000001e16984>] netlink_insert+0x6d4/0x1010
[  246.376946] [<9000000001e1c1a4>] __netlink_kernel_create+0x12c/0x688
[  246.376949] [<900000000245d9c4>] uevent_net_init+0x7c/0x218
[  246.376951] [<9000000001c21094>] ops_init+0xcc/0x550
[  246.376953] [<9000000001c22fe4>] setup_net+0xe4/0x718
[  246.376955] [<9000000001c264c8>] copy_net_ns+0x200/0x798
[  246.376957] [<900000000036cd08>] create_new_namespaces+0x168/0x6a8
[  246.376959] [<900000000036dbfc>] unshare_nsproxy_namespaces+0x8c/0x280
[  246.376962] [<90000000002dc644>] ksys_unshare+0x23c/0xc60
[  246.376965] [<90000000002dd07c>] sys_unshare+0x14/0x20
[  246.376968] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  246.376971] ---[ end trace ]---
[  246.376972] ------------[ cut here ]------------
[  246.376972] UBSAN: misaligned-access in ./include/linux/rhashtable.h:303:9
[  246.376974] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  246.376975] which requires 64 byte alignment
[  246.376976] CPU: 2 UID: 0 PID: 586 Comm: (s-daemon) Tainted: G             L     6.13.0-rc7+ #2
[  246.376978] Tainted: [L]=SOFTLOCKUP
[  246.376979] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.376980] Stack : 9000000002805d80 0000000000000000 900000000023aae8 90000001502e0000
[  246.376984]         90000001502e36e0 90000001502e36e8 0000000000000000 90000001502e3828
[  246.376988]         90000001502e3820 90000001502e3820 9000000008110df0 6572617764726148
[  246.376991]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  246.376995]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.376998]         000000000000001f 9000000003f3aa60 0000000008208000 0000000022385030
[  246.377002]         0000000000000000 0000000000000000 9000000002805d80 90000001502e36e8
[  246.377005]         900000000296c000 0000000000000000 900000010006ec30 900000010ab62d60
[  246.377009]         0000000000000000 0000000000000000 900000000023aba4 00007ffff38b4b28
[  246.377012]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  246.377016]         ...
[  246.377018] Call Trace:
[  246.377018] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.377020] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.377023] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.377025] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.377028] [<9000000001e169a8>] netlink_insert+0x6f8/0x1010
[  246.377031] [<9000000001e1c1a4>] __netlink_kernel_create+0x12c/0x688
[  246.377034] [<900000000245d9c4>] uevent_net_init+0x7c/0x218
[  246.377036] [<9000000001c21094>] ops_init+0xcc/0x550
[  246.377038] [<9000000001c22fe4>] setup_net+0xe4/0x718
[  246.377040] [<9000000001c264c8>] copy_net_ns+0x200/0x798
[  246.377042] [<900000000036cd08>] create_new_namespaces+0x168/0x6a8
[  246.377044] [<900000000036dbfc>] unshare_nsproxy_namespaces+0x8c/0x280
[  246.377047] [<90000000002dc644>] ksys_unshare+0x23c/0xc60
[  246.377049] [<90000000002dd07c>] sys_unshare+0x14/0x20
[  246.377052] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  246.377055] ---[ end trace ]---
[  246.377056] ------------[ cut here ]------------
[  246.377057] UBSAN: misaligned-access in ./include/linux/rhashtable.h:303:71
[  246.377058] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  246.377059] which requires 64 byte alignment
[  246.377060] CPU: 2 UID: 0 PID: 586 Comm: (s-daemon) Tainted: G             L     6.13.0-rc7+ #2
[  246.377062] Tainted: [L]=SOFTLOCKUP
[  246.377063] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.377064] Stack : 9000000002805d80 0000000000000000 900000000023aae8 90000001502e0000
[  246.377067]         90000001502e36e0 90000001502e36e8 0000000000000000 90000001502e3828
[  246.377071]         90000001502e3820 90000001502e3820 9000000008111790 6572617764726148
[  246.377075]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  246.377078]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.377082]         000000000000001f 9000000003f3aa60 0000000008208000 0000000022385030
[  246.377085]         0000000000000000 0000000000000000 9000000002805d80 90000001502e36e8
[  246.377089]         900000000296c000 0000000000000000 900000010006ec30 900000010ab62d60
[  246.377092]         0000000000000000 0000000000000000 900000000023aba4 00007ffff38b4b28
[  246.377096]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  246.377099]         ...
[  246.377101] Call Trace:
[  246.377101] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.377103] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.377106] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.377108] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.377111] [<9000000001e16a68>] netlink_insert+0x7b8/0x1010
[  246.377114] [<9000000001e1c1a4>] __netlink_kernel_create+0x12c/0x688
[  246.377117] [<900000000245d9c4>] uevent_net_init+0x7c/0x218
[  246.377118] [<9000000001c21094>] ops_init+0xcc/0x550
[  246.377120] [<9000000001c22fe4>] setup_net+0xe4/0x718
[  246.377122] [<9000000001c264c8>] copy_net_ns+0x200/0x798
[  246.377124] [<900000000036cd08>] create_new_namespaces+0x168/0x6a8
[  246.377127] [<900000000036dbfc>] unshare_nsproxy_namespaces+0x8c/0x280
[  246.377129] [<90000000002dc644>] ksys_unshare+0x23c/0xc60
[  246.377132] [<90000000002dd07c>] sys_unshare+0x14/0x20
[  246.377135] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  246.377138] ---[ end trace ]---
[  246.377139] ------------[ cut here ]------------
[  246.377139] UBSAN: misaligned-access in ./include/linux/rhashtable.h:734:6
[  246.377141] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  246.377142] which requires 64 byte alignment
[  246.377143] CPU: 2 UID: 0 PID: 586 Comm: (s-daemon) Tainted: G             L     6.13.0-rc7+ #2
[  246.377144] Tainted: [L]=SOFTLOCKUP
[  246.377145] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.377146] Stack : 9000000002805d80 0000000000000000 900000000023aae8 90000001502e0000
[  246.377150]         90000001502e36e0 90000001502e36e8 0000000000000000 90000001502e3828
[  246.377153]         90000001502e3820 90000001502e3820 9000000008112130 6572617764726148
[  246.377156]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  246.377160]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.377164]         000000000000001f 9000000003f3aa60 0000000008208000 0000000022385030
[  246.377167]         0000000000000000 0000000000000000 9000000002805d80 90000001502e36e8
[  246.377170]         900000000296c000 0000000000000000 900000010006ec30 900000010ab62d60
[  246.377174]         0000000000000000 0000000000000000 900000000023aba4 00007ffff38b4b28
[  246.377177]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  246.377181]         ...
[  246.377182] Call Trace:
[  246.377183] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.377185] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.377188] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.377190] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.377193] [<9000000001e16cf8>] netlink_insert+0xa48/0x1010
[  246.377196] [<9000000001e1c1a4>] __netlink_kernel_create+0x12c/0x688
[  246.377199] [<900000000245d9c4>] uevent_net_init+0x7c/0x218
[  246.377200] [<9000000001c21094>] ops_init+0xcc/0x550
[  246.377202] [<9000000001c22fe4>] setup_net+0xe4/0x718
[  246.377204] [<9000000001c264c8>] copy_net_ns+0x200/0x798
[  246.377206] [<900000000036cd08>] create_new_namespaces+0x168/0x6a8
[  246.377208] [<900000000036dbfc>] unshare_nsproxy_namespaces+0x8c/0x280
[  246.377211] [<90000000002dc644>] ksys_unshare+0x23c/0xc60
[  246.377214] [<90000000002dd07c>] sys_unshare+0x14/0x20
[  246.377216] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  246.377220] ---[ end trace ]---
[  246.377221] ------------[ cut here ]------------
[  246.377222] UBSAN: misaligned-access in ./include/linux/rhashtable.h:211:39
[  246.377223] member access within misaligned address 00000000687e66ed for type 'const struct bucket_table'
[  246.377224] which requires 64 byte alignment
[  246.377225] CPU: 2 UID: 0 PID: 586 Comm: (s-daemon) Tainted: G             L     6.13.0-rc7+ #2
[  246.377226] Tainted: [L]=SOFTLOCKUP
[  246.377227] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.377228] Stack : 9000000002805d80 0000000000000000 900000000023aae8 90000001502e0000
[  246.377232]         90000001502e36e0 90000001502e36e8 0000000000000000 90000001502e3828
[  246.377235]         90000001502e3820 90000001502e3820 9000000008112ad8 6572617764726148
[  246.377239]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  246.377242]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.377246]         000000000000001f 9000000003f3aa60 0000000008208000 0000000000000000
[  246.377249]         0000000000000000 0000000000000000 9000000002805d80 90000001502e36e8
[  246.377253]         900000000296c000 0000000000000000 900000010006ec30 900000010ab62d60
[  246.377256]         0000000000000000 0000000000000000 900000000023aba4 00007ffff38b4b28
[  246.377260]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  246.377263]         ...
[  246.377265] Call Trace:
[  246.377265] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.377267] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.377270] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.377272] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.377275] [<9000000001e16f9c>] netlink_insert+0xcec/0x1010
[  246.377278] [<9000000001e1c1a4>] __netlink_kernel_create+0x12c/0x688
[  246.377281] [<900000000245d9c4>] uevent_net_init+0x7c/0x218
[  246.377282] [<9000000001c21094>] ops_init+0xcc/0x550
[  246.377284] [<9000000001c22fe4>] setup_net+0xe4/0x718
[  246.377286] [<9000000001c264c8>] copy_net_ns+0x200/0x798
[  246.377288] [<900000000036cd08>] create_new_namespaces+0x168/0x6a8
[  246.377290] [<900000000036dbfc>] unshare_nsproxy_namespaces+0x8c/0x280
[  246.377293] [<90000000002dc644>] ksys_unshare+0x23c/0xc60
[  246.377296] [<90000000002dd07c>] sys_unshare+0x14/0x20
[  246.377298] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  246.377301] ---[ end trace ]---
[  246.377302] ------------[ cut here ]------------
[  246.377303] UBSAN: misaligned-access in ./include/linux/rhashtable.h:186:40
[  246.377304] member access within misaligned address 00000000687e66ed for type 'const struct bucket_table'
[  246.377305] which requires 64 byte alignment
[  246.377306] CPU: 2 UID: 0 PID: 586 Comm: (s-daemon) Tainted: G             L     6.13.0-rc7+ #2
[  246.377308] Tainted: [L]=SOFTLOCKUP
[  246.377308] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.377309] Stack : 9000000002805d80 0000000000000000 900000000023aae8 90000001502e0000
[  246.377313]         90000001502e36e0 90000001502e36e8 0000000000000000 90000001502e3828
[  246.377316]         90000001502e3820 90000001502e3820 9000000008113480 6572617764726148
[  246.377320]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  246.377323]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.377327]         000000000000001f 9000000003f3aa60 0000000008208000 0000000000000000
[  246.377330]         0000000000000000 0000000000000000 9000000002805d80 90000001502e36e8
[  246.377334]         900000000296c000 0000000000000000 900000010006ec30 900000010ab62d60
[  246.377337]         0000000000000000 0000000000000000 900000000023aba4 00007ffff38b4b28
[  246.377341]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  246.377344]         ...
[  246.377346] Call Trace:
[  246.377347] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.377348] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.377351] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.377354] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.377356] [<9000000001e17158>] netlink_insert+0xea8/0x1010
[  246.377359] [<9000000001e1c1a4>] __netlink_kernel_create+0x12c/0x688
[  246.377362] [<900000000245d9c4>] uevent_net_init+0x7c/0x218
[  246.377364] [<9000000001c21094>] ops_init+0xcc/0x550
[  246.377366] [<9000000001c22fe4>] setup_net+0xe4/0x718
[  246.377367] [<9000000001c264c8>] copy_net_ns+0x200/0x798
[  246.377369] [<900000000036cd08>] create_new_namespaces+0x168/0x6a8
[  246.377372] [<900000000036dbfc>] unshare_nsproxy_namespaces+0x8c/0x280
[  246.377374] [<90000000002dc644>] ksys_unshare+0x23c/0xc60
[  246.377377] [<90000000002dd07c>] sys_unshare+0x14/0x20
[  246.377380] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  246.377383] ---[ end trace ]---
[  246.378999] ------------[ cut here ]------------
[  246.379001] UBSAN: misaligned-access in lib/rhashtable.c:222:9
[  246.379004] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  246.379006] which requires 64 byte alignment
[  246.379008] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  246.379010] Tainted: [L]=SOFTLOCKUP
[  246.379011] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.379013] Workqueue: events rht_deferred_worker
[  246.379017] Stack : 0000000001400000 0000000000000000 900000000023aae8 900000010049c000
[  246.379022]         900000010049f9f0 900000010049f9f8 0000000000000000 900000010049fb38
[  246.379025]         900000010049fb30 900000010049fb30 900000010049fa28 756575716b726f57
[  246.379029]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  246.379033]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.379036]         900000000274b680 0000000000000000 0000000008208000 0000000001400000
[  246.379040]         0000000000000000 0000000000000000 9000000002805d80 900000010049f9f8
[  246.379043]         900000000296c000 0000000000000000 0000000000000000 900000010006ec70
[  246.379047]         9000000100190005 0000000000000000 900000000023aba4 0000555567024008
[  246.379050]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  246.379054]         ...
[  246.379056] Call Trace:
[  246.379056] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.379059] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.379063] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.379065] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.379068] [<90000000013ea1c8>] rht_deferred_worker+0x1100/0x1550
[  246.379071] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  246.379074] [<9000000000350d94>] worker_thread+0x314/0x1240
[  246.379076] [<9000000000367010>] kthread+0x1a0/0x3c0
[  246.379080] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  246.379084] ---[ end trace ]---
[  246.379085] ------------[ cut here ]------------
[  246.379086] UBSAN: misaligned-access in ./include/linux/rhashtable.h:186:40
[  246.379087] member access within misaligned address 00000000687e66ed for type 'const struct bucket_table'
[  246.379088] which requires 64 byte alignment
[  246.379090] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  246.379091] Tainted: [L]=SOFTLOCKUP
[  246.379092] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.379093] Workqueue: events rht_deferred_worker
[  246.379096] Stack : 0000000001400000 0000000000000000 900000000023aae8 900000010049c000
[  246.379100]         900000010049f9f0 900000010049f9f8 0000000000000000 900000010049fb38
[  246.379103]         900000010049fb30 900000010049fb30 900000010049fa28 756575716b726f57
[  246.379107]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  246.379110]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.379114]         900000000274b680 0000000000000000 0000000008208000 0000000001400000
[  246.379117]         0000000000000000 0000000000000000 9000000002805d80 900000010049f9f8
[  246.379121]         900000000296c000 0000000000000004 0000000000000000 900000010006ec70
[  246.379124]         9000000100190005 0000000000000000 900000000023aba4 0000555567024008
[  246.379128]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  246.379131]         ...
[  246.379133] Call Trace:
[  246.379134] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.379136] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.379139] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.379141] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.379144] [<90000000013ea418>] rht_deferred_worker+0x1350/0x1550
[  246.379146] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  246.379148] [<9000000000350d94>] worker_thread+0x314/0x1240
[  246.379151] [<9000000000367010>] kthread+0x1a0/0x3c0
[  246.379154] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  246.379157] ---[ end trace ]---
[  246.379158] ------------[ cut here ]------------
[  246.379159] UBSAN: misaligned-access in lib/rhashtable.c:427:45
[  246.379160] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  246.379162] which requires 64 byte alignment
[  246.379163] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  246.379164] Tainted: [L]=SOFTLOCKUP
[  246.379165] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.379166] Workqueue: events rht_deferred_worker
[  246.379169] Stack : 0000000001400000 0000000000000000 900000000023aae8 900000010049c000
[  246.379172]         900000010049f9f0 900000010049f9f8 0000000000000000 900000010049fb38
[  246.379176]         900000010049fb30 900000010049fb30 900000010049fa28 756575716b726f57
[  246.379179]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  246.379183]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.379186]         900000000274b680 0000000000000000 0000000008208000 0000000001400000
[  246.379190]         0000000000000000 0000000000000000 9000000002805d80 900000010049f9f8
[  246.379193]         900000000296c000 0000000000000000 0000000000000004 900000010006ec70
[  246.379197]         9000000100190005 0000000000000000 900000000023aba4 0000555567024008
[  246.379201]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  246.379204]         ...
[  246.379206] Call Trace:
[  246.379206] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.379208] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.379211] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.379214] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.379217] [<90000000013ea310>] rht_deferred_worker+0x1248/0x1550
[  246.379219] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  246.379221] [<9000000000350d94>] worker_thread+0x314/0x1240
[  246.379223] [<9000000000367010>] kthread+0x1a0/0x3c0
[  246.379226] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  246.379230] ---[ end trace ]---
[  246.379232] ------------[ cut here ]------------
[  246.379233] UBSAN: misaligned-access in lib/rhashtable.c:312:6
[  246.379234] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  246.379235] which requires 64 byte alignment
[  246.379236] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  246.379237] Tainted: [L]=SOFTLOCKUP
[  246.379238] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.379239] Workqueue: events rht_deferred_worker
[  246.379242] Stack : 0000000001400000 0000000000000000 900000000023aae8 900000010049c000
[  246.379245]         900000010049f9f0 900000010049f9f8 0000000000000000 900000010049fb38
[  246.379249]         900000010049fb30 900000010049fb30 900000010049fa28 756575716b726f57
[  246.379252]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  246.379256]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.379260]         900000000274b680 0000000000000000 0000000008208000 0000000001400000
[  246.379263]         0000000000000000 0000000000000000 9000000002805d80 900000010049f9f8
[  246.379267]         900000000296c000 0000000000000000 0000000000000004 900000010006ec70
[  246.379270]         9000000100190005 0000000000000000 900000000023aba4 0000555567024008
[  246.379274]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  246.379278]         ...
[  246.379279] Call Trace:
[  246.379280] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.379282] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.379285] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.379287] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.379290] [<90000000013ea328>] rht_deferred_worker+0x1260/0x1550
[  246.379292] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  246.379294] [<9000000000350d94>] worker_thread+0x314/0x1240
[  246.379296] [<9000000000367010>] kthread+0x1a0/0x3c0
[  246.379299] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  246.379303] ---[ end trace ]---
[  246.379304] ------------[ cut here ]------------
[  246.379305] UBSAN: misaligned-access in lib/rhashtable.c:327:12
[  246.379306] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  246.379307] which requires 64 byte alignment
[  246.379308] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  246.379310] Tainted: [L]=SOFTLOCKUP
[  246.379310] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.379311] Workqueue: events rht_deferred_worker
[  246.379314] Stack : 0000000001400000 0000000000000000 900000000023aae8 900000010049c000
[  246.379317]         900000010049f9f0 900000010049f9f8 0000000000000000 900000010049fb38
[  246.379321]         900000010049fb30 900000010049fb30 900000010049fa28 756575716b726f57
[  246.379324]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  246.379328]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.379331]         900000000274b680 0000000000000000 0000000008208000 0000000001400000
[  246.379335]         0000000000000000 0000000000000000 9000000002805d80 900000010049f9f8
[  246.379338]         900000000296c000 0000000000000000 0000000000000004 900000010006ec70
[  246.379342]         900000010ab62d60 0000000000000000 900000000023aba4 0000555567024008
[  246.379345]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  246.379349]         ...
[  246.379350] Call Trace:
[  246.379351] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.379353] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.379356] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.379358] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.379361] [<90000000013e91f4>] rht_deferred_worker+0x12c/0x1550
[  246.379363] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  246.379365] [<9000000000350d94>] worker_thread+0x314/0x1240
[  246.379367] [<9000000000367010>] kthread+0x1a0/0x3c0
[  246.379370] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  246.379374] ---[ end trace ]---
[  246.379375] ------------[ cut here ]------------
[  246.379376] UBSAN: misaligned-access in lib/rhashtable.c:331:39
[  246.379377] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  246.379378] which requires 64 byte alignment
[  246.379379] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  246.379381] Tainted: [L]=SOFTLOCKUP
[  246.379382] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.379383] Workqueue: events rht_deferred_worker
[  246.379385] Stack : 0000000001400000 0000000000000000 900000000023aae8 900000010049c000
[  246.379388]         900000010049f9f0 900000010049f9f8 0000000000000000 900000010049fb38
[  246.379392]         900000010049fb30 900000010049fb30 900000010049fa28 756575716b726f57
[  246.379395]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  246.379399]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.379402]         900000000274b680 0000000000000000 0000000008208000 0000000001400000
[  246.379406]         0000000000000000 0000000000000000 9000000002805d80 900000010049f9f8
[  246.379409]         900000000296c000 900000012ffaf180 0000000000000004 900000010006ec70
[  246.379413]         900000010ab62d60 0000000000000000 900000000023aba4 0000555567024008
[  246.379416]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  246.379420]         ...
[  246.379421] Call Trace:
[  246.379422] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.379424] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.379427] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.379429] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.379432] [<90000000013ea50c>] rht_deferred_worker+0x1444/0x1550
[  246.379434] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  246.379436] [<9000000000350d94>] worker_thread+0x314/0x1240
[  246.379438] [<9000000000367010>] kthread+0x1a0/0x3c0
[  246.379441] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  246.379445] ---[ end trace ]---
[  246.379446] ------------[ cut here ]------------
[  246.379446] UBSAN: misaligned-access in ./include/linux/rhashtable.h:296:9
[  246.379448] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  246.379449] which requires 64 byte alignment
[  246.379450] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  246.379451] Tainted: [L]=SOFTLOCKUP
[  246.379452] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.379453] Workqueue: events rht_deferred_worker
[  246.379455] Stack : 0000000000000000 0000000000000000 900000000023aae8 900000010049c000
[  246.379459]         900000010049f9f0 900000010049f9f8 0000000000000000 900000010049fb38
[  246.379462]         900000010049fb30 900000010049fb30 900000010049fa28 756575716b726f57
[  246.379466]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  246.379469]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.379473]         900000000274b680 0000000000000000 0000000008208000 0000000000000000
[  246.379476]         0000000000000000 0000000000000000 9000000002805d80 900000010049f9f8
[  246.379480]         900000000296c000 900000010ab62d60 0000000000000004 900000010006ec70
[  246.379483]         900000010ab62d60 0000000000000000 900000000023aba4 0000555567024008
[  246.379487]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  246.379490]         ...
[  246.379492] Call Trace:
[  246.379492] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.379494] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.379497] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.379499] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.379502] [<90000000013ea2c8>] rht_deferred_worker+0x1200/0x1550
[  246.379505] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  246.379507] [<9000000000350d94>] worker_thread+0x314/0x1240
[  246.379509] [<9000000000367010>] kthread+0x1a0/0x3c0
[  246.379512] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  246.379516] ---[ end trace ]---
[  246.379516] ------------[ cut here ]------------
[  246.379517] UBSAN: misaligned-access in ./include/linux/rhashtable.h:296:62
[  246.379518] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  246.379519] which requires 64 byte alignment
[  246.379520] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  246.379522] Tainted: [L]=SOFTLOCKUP
[  246.379523] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.379524] Workqueue: events rht_deferred_worker
[  246.379526] Stack : 0000000000000000 0000000000000000 900000000023aae8 900000010049c000
[  246.379529]         900000010049f9f0 900000010049f9f8 0000000000000000 900000010049fb38
[  246.379533]         900000010049fb30 900000010049fb30 900000010049fa28 756575716b726f57
[  246.379536]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  246.379540]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.379543]         900000000274b680 0000000000000000 0000000008208000 0000000000000000
[  246.379547]         0000000000000000 0000000000000000 9000000002805d80 900000010049f9f8
[  246.379550]         900000000296c000 900000010ab62d60 0000000000000004 900000010006ec70
[  246.379554]         900000010ab62d60 0000000000000000 900000000023aba4 0000555567024008
[  246.379557]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  246.379561]         ...
[  246.379562] Call Trace:
[  246.379563] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.379565] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.379567] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.379570] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.379572] [<90000000013ea2e0>] rht_deferred_worker+0x1218/0x1550
[  246.379575] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  246.379577] [<9000000000350d94>] worker_thread+0x314/0x1240
[  246.379579] [<9000000000367010>] kthread+0x1a0/0x3c0
[  246.379582] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  246.379585] ---[ end trace ]---
[  246.379588] ------------[ cut here ]------------
[  246.379589] UBSAN: misaligned-access in lib/rhashtable.c:342:2
[  246.379590] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  246.379592] which requires 64 byte alignment
[  246.379593] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  246.379594] Tainted: [L]=SOFTLOCKUP
[  246.379595] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.379596] Workqueue: events rht_deferred_worker
[  246.379598] Stack : 0000000000000000 0000000000000000 900000000023aae8 900000010049c000
[  246.379602]         900000010049f9f0 900000010049f9f8 0000000000000000 900000010049fb38
[  246.379605]         900000010049fb30 900000010049fb30 900000010049fa28 756575716b726f57
[  246.379609]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  246.379612]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.379616]         900000000274b680 0000000000000000 0000000008208000 0000000000000000
[  246.379619]         0000000000000000 0000000000000000 9000000002805d80 900000010049f9f8
[  246.379623]         900000000296c000 900000012ffaf180 900000012ffaf180 900000010006ec70
[  246.379626]         900000010ab62d60 0000000000000000 900000000023aba4 0000555567024008
[  246.379630]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  246.379633]         ...
[  246.379635] Call Trace:
[  246.379635] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.379637] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.379640] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.379642] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.379645] [<90000000013ea4b8>] rht_deferred_worker+0x13f0/0x1550
[  246.379647] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  246.379649] [<9000000000350d94>] worker_thread+0x314/0x1240
[  246.379651] [<9000000000367010>] kthread+0x1a0/0x3c0
[  246.379654] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  246.379658] ---[ end trace ]---
[  246.379659] ------------[ cut here ]------------
[  246.379660] UBSAN: misaligned-access in lib/rhashtable.c:342:2
[  246.379661] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  246.379662] which requires 64 byte alignment
[  246.379663] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  246.379664] Tainted: [L]=SOFTLOCKUP
[  246.379665] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.379666] Workqueue: events rht_deferred_worker
[  246.379669] Stack : 0000000000000000 0000000000000000 900000000023aae8 900000010049c000
[  246.379672]         900000010049f9f0 900000010049f9f8 0000000000000000 900000010049fb38
[  246.379676]         900000010049fb30 900000010049fb30 900000010049fa28 756575716b726f57
[  246.379679]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  246.379683]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.379686]         900000000274b680 0000000000000000 0000000008208000 0000000000000000
[  246.379689]         0000000000000000 0000000000000000 9000000002805d80 900000010049f9f8
[  246.379693]         900000000296c000 900000012ffaf180 0000000000000000 900000010006ec70
[  246.379697]         900000010ab62d60 0000000000000000 900000000023aba4 0000555567024008
[  246.379700]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  246.379704]         ...
[  246.379705] Call Trace:
[  246.379706] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.379708] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.379710] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.379713] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.379715] [<90000000013ea46c>] rht_deferred_worker+0x13a4/0x1550
[  246.379717] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  246.379720] [<9000000000350d94>] worker_thread+0x314/0x1240
[  246.379722] [<9000000000367010>] kthread+0x1a0/0x3c0
[  246.379725] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  246.379728] ---[ end trace ]---
[  246.379729] ------------[ cut here ]------------
[  246.379730] UBSAN: misaligned-access in lib/rhashtable.c:352:2
[  246.379731] member access within misaligned address 00000000687e66ed for type 'struct bucket_table'
[  246.379732] which requires 64 byte alignment
[  246.379733] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  246.379735] Tainted: [L]=SOFTLOCKUP
[  246.379735] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  246.379736] Workqueue: events rht_deferred_worker
[  246.379739] Stack : 0000000000000000 0000000000000000 900000000023aae8 900000010049c000
[  246.379742]         900000010049f9f0 900000010049f9f8 0000000000000000 900000010049fb38
[  246.379746]         900000010049fb30 900000010049fb30 900000010049fa28 756575716b726f57
[  246.379749]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  246.379753]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  246.379756]         900000000274b680 0000000000000000 0000000008208000 0000000000000000
[  246.379759]         0000000000000000 0000000000000000 9000000002805d80 900000010049f9f8
[  246.379763]         900000000296c000 900000012ffaf180 0000000000000000 900000010006ec70
[  246.379767]         900000010ab62d60 0000000000000000 900000000023aba4 0000555567024008
[  246.379770]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  246.379774]         ...
[  246.379775] Call Trace:
[  246.379776] [<900000000023aba4>] show_stack+0x10c/0x228
[  246.379777] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  246.379780] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  246.379783] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  246.379785] [<90000000013ea53c>] rht_deferred_worker+0x1474/0x1550
[  246.379787] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  246.379789] [<9000000000350d94>] worker_thread+0x314/0x1240
[  246.379792] [<9000000000367010>] kthread+0x1a0/0x3c0
[  246.379795] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  246.379798] ---[ end trace ]---
[  246.418748] ------------[ cut here ]------------
[  267.422746] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  267.461673] UBSAN: misaligned-access in lib/rhashtable.c:111:9
[  267.517457] rcu: 	2-....: (414 ticks this GP) idle=be94/0/0x3 softirq=746/746 fqs=2093
[  267.572496] member access within misaligned address 00000000687e66ed for type 'const struct bucket_table'
[  267.628341] rcu: 	(detected by 5, t=5303 jiffies, g=537, q=440 ncpus=8)
[  267.683701] which requires 64 byte alignment
[  267.737356] Sending NMI from CPU 5 to CPUs 2:
[  267.789668] NMI backtrace for cpu 2
[  267.789671] CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Tainted: G             L     6.13.0-rc7+ #2
[  267.789674] Tainted: [L]=SOFTLOCKUP
[  267.789675] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  267.789676] pc 9000000000491c64 ra 9000000000491c5c tp 900000010043c000 sp 9000000100213a50
[  267.789678] a0 0000000000000000 a1 0000000000000000 a2 90000001002139d8 a3 ffffffffffffffff
[  267.789680] a4 0000000000000000 a5 0000000000000040 a6 0000000000000000 a7 0000000000000000
[  267.789681] t0 900000000a800940 t1 0000000000000004 t2 0000000000000001 t3 9000000003f3aab8
[  267.789683] t4 0000000000aaaaaa t5 ffff8000339d8220 t6 000000000000001f t7 0000000000000000
[  267.789684] t8 0000000000000010 u0 0000000000000000 s9 00000000000000b0 s0 0000000000000001
[  267.789686] s1 9000000100213b47 s2 9000000100213b50 s3 9000000100213aa0 s4 0000000000001af0
[  267.789687] s5 0000000000000000 s6 9000000003835fe0 s7 9000000100213aa8 s8 0000000000000000
[  267.789689]    ra: 9000000000491c5c console_flush_all+0x43c/0x7b8
[  267.789693]   ERA: 9000000000491c64 console_flush_all+0x444/0x7b8
[  267.789695]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[  267.789702]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[  267.789705]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
[  267.789708]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[  267.789712] ESTAT: 00001800 [INT] (IS=11-12 ECode=0 EsubCode=0)
[  267.789714]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
[  267.789716] CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Tainted: G             L     6.13.0-rc7+ #2
[  267.789718] Tainted: [L]=SOFTLOCKUP
[  267.789719] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  267.789720] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010043c000
[  267.789725]         9000000100213470 9000000100213478 0000000000000000 90000001002135b8
[  267.789728]         90000001002135b0 90000001002135b0 900000000811a1b0 6572617764726148
[  267.789732]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  267.789736]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  267.789739]         000000000000001f 9000000003f3aa60 0000000008208000 0000000000000000
[  267.789743]         0000000000000000 0000000000000000 9000000002805d80 9000000100213478
[  267.789746]         900000000296c000 0000000000000000 0000000000000000 9000000100213910
[  267.789750]         0000000000000000 0000000000000000 900000000023aba4 000055556702c078
[  267.789753]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  267.789757]         ...
[  267.789759] Call Trace:
[  267.789760] [<900000000023aba4>] show_stack+0x10c/0x228
[  267.789763] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  267.789767] [<90000000024949e4>] nmi_cpu_backtrace+0x1a4/0x1e0
[  267.789770] [<900000000023b244>] handle_backtrace+0x24/0x98
[  267.789772] [<90000000005c81e8>] __flush_smp_call_function_queue+0x1e8/0xd68
[  267.789777] [<90000000002559c4>] loongson_ipi_interrupt+0x1d4/0x3a0
[  267.789780] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  267.789783] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  267.789786] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  267.789789] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  267.789792] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  267.789796] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  267.789799] [<90000000024c45a8>] do_vint+0x108/0x198

[  272.083139] watchdog: BUG: soft lockup - CPU#2 stuck for 26s! [swapper/2:0]
[  272.083141] Modules linked in: binfmt_misc nls_ascii nls_cp437 vfat fat snd_hda_codec_conexant snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer snd joydev soundcore evdev drm configfs nfnetlink efivarfs ip_tables x_tables autofs4 xfs btrfs blake2b_generic xor zlib_deflate raid6_pq libcrc32c crc32c_generic hid_generic usbhid hid ahci libahci ohci_pci xhci_pci dwmac_loongson stmmac libata ohci_hcd xhci_hcd ehci_pci ehci_hcd pcs_xpcs usbcore r8169 scsi_mod phylink nvme realtek mdio_devres of_mdio nvme_core fixed_phy fwnode_mdio scsi_common usb_common libphy nvme_auth
[  272.083193] CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Tainted: G             L     6.13.0-rc7+ #2
[  272.083195] Tainted: [L]=SOFTLOCKUP
[  272.083196] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  272.083197] pc 9000000000491c64 ra 9000000000491c5c tp 900000010043c000 sp 9000000100213a50
[  272.083199] a0 0000000000000000 a1 0000000000000000 a2 90000001002139d8 a3 ffffffffffffffff
[  272.083200] a4 0000000000000000 a5 0000000000000040 a6 0000000000000000 a7 0000000000000000
[  272.083201] t0 900000000a800940 t1 0000000000000004 t2 0000000000000001 t3 9000000003f3aab8
[  272.083203] t4 0000000000aaaaaa t5 ffff8000339d8220 t6 000000000000001f t7 0000000000000000
[  272.083204] t8 0000000000000010 u0 0000000000000000 s9 00000000000000b0 s0 0000000000000001
[  272.083205] s1 9000000100213b47 s2 9000000100213b50 s3 9000000100213aa0 s4 0000000000001b42
[  272.083207] s5 0000000000000000 s6 9000000003835fe0 s7 9000000100213aa8 s8 0000000000000000
[  272.083208]    ra: 9000000000491c5c console_flush_all+0x43c/0x7b8
[  272.083211]   ERA: 9000000000491c64 console_flush_all+0x444/0x7b8
[  272.083213]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[  272.083218]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[  272.083221]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
[  272.083225]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[  272.083227] ESTAT: 00000800 [INT] (IS=11 ECode=0 EsubCode=0)
[  272.083230]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
[  272.083232] CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Tainted: G             L     6.13.0-rc7+ #2
[  272.083234] Tainted: [L]=SOFTLOCKUP
[  272.083234] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  272.083235] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010043c000
[  272.083239]         9000000100213390 9000000100213398 0000000000000000 90000001002134d8
[  272.083243]         90000001002134d0 90000001002134d0 900000000811b2a8 6572617764726148
[  272.083246]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  272.083250]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  272.083253]         000000000000001f 9000000003f3aa60 0000000008208000 900000010039ea48
[  272.083257]         0000000000000000 0000000000000000 9000000002805d80 9000000100213398
[  272.083261]         900000000296c000 9000000100213910 0000000000000000 0000000000000000
[  272.083264]         000000000000001a 0000000000000000 900000000023aba4 000055556702c078
[  272.083268]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  272.083271]         ...
[  272.083273] Call Trace:
[  272.083273] [<900000000023aba4>] show_stack+0x10c/0x228
[  272.083276] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  272.083279] [<900000000066d4f8>] watchdog_timer_fn+0x3c8/0x518
[  272.083281] [<900000000057292c>] __hrtimer_run_queues+0x1bc/0x860
[  272.083284] [<9000000000576de4>] hrtimer_interrupt+0x1ec/0x9f8
[  272.083287] [<9000000000244450>] constant_timer_interrupt+0x60/0xc8
[  272.083289] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  272.083292] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  272.083295] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  272.083298] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  272.083301] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  272.083304] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  272.083306] [<90000000024c45a8>] do_vint+0x108/0x198

[  283.105864] CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Tainted: G             L     6.13.0-rc7+ #2
[  283.105867] Tainted: [L]=SOFTLOCKUP
[  283.105867] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  283.105868] Stack : 9000000002805d80 0000000000000000 900000000023aae8 900000010043c000
[  283.350501]         9000000100213b10 9000000100213b18 0000000000000000 9000000100213c58
[  283.350507]         9000000100213c50 9000000100213c50 900000000811bab0 6572617764726148
[  283.350510]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  283.350514]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  283.350517]         000000000000001f 9000000003f3aa60 0000000008208000 900000000a814eb8
[  283.350521]         0000000000000000 0000000000000000 9000000002805d80 9000000100213b18
[  283.665111]         900000000296c000 0000000000000000 0000000000000000 0000000000000001
[  283.665115]         0000000000000000 0000000000000000 900000000023aba4 000055556702c078
[  283.790079]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  283.790083]         ...
[  283.790085] Call Trace:
[  283.790086] [<900000000023aba4>] show_stack+0x10c/0x228
[  283.790090] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  283.790094] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  283.790097] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  283.790100] [<90000000013e7ac4>] bucket_table_free+0x234/0x2a8
[  283.790104] [<9000000000515730>] rcu_do_batch+0x238/0x16d8
[  283.790107] [<9000000000516da4>] rcu_core+0x1d4/0x580
[  283.790109] [<90000000002f40cc>] handle_softirqs+0x1ec/0xaf0
[  283.790112] [<90000000002f4ccc>] __irq_exit_rcu+0x24c/0x4b8
[  283.790114] [<90000000024c4568>] do_vint+0xc8/0x198
[  283.790117] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[  283.790121] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[  283.790123] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[  283.790126] [<9000000000413344>] do_idle+0x124/0x258
[  283.790130] [<9000000000413950>] cpu_startup_entry+0x68/0xa0
[  283.790133] [<9000000000256dc4>] start_secondary+0xb4/0xe0
[  283.790136] [<90000000024c9138>] smpboot_entry+0x68/0x6c

[  283.790144] ---[ end trace ]---
[  285.182809] ------------[ cut here ]------------
[  285.182815] UBSAN: misaligned-access in arch/loongarch/lib/csum.c:89:7
[  285.182818] load of misaligned address 000000009e998d68 for type '__int128 unsigned'
[  285.182820] which requires 16 byte alignment
[  285.182823] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  285.182827] Tainted: [L]=SOFTLOCKUP
[  285.182828] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  285.182829] Workqueue: mld mld_ifc_work
[  285.182836] Stack : 900000012b198018 0000000000000000 900000000023aae8 900000010049c000
[  285.182841]         900000010049f8f0 900000010049f8f8 0000000000000000 900000010049fa38
[  285.182845]         900000010049fa30 900000010049fa30 900000010049f928 756575716b726f57
[  285.182848]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  285.182852]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  285.182855]         900000000274b680 0000000000000000 0000000008208000 900000012b198018
[  285.182859]         0000000000000000 0000000000000000 9000000002805d80 900000010049f8f8
[  285.182863]         900000000296c000 900000012b198048 0000000000000014 900000012b198048
[  285.182866]         000000000000001c 0000000000000000 900000000023aba4 0000555566400078
[  285.182870]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  285.182873]         ...
[  285.182875] Call Trace:
[  285.182877] [<900000000023aba4>] show_stack+0x10c/0x228
[  285.182881] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  285.182885] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  285.182888] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  285.182892] [<90000000024c3518>] do_csum+0x300/0x440
[  285.182895] [<90000000015dd78c>] csum_partial+0x14/0x40
[  285.182898] [<90000000022504b4>] mld_sendpack+0x184/0xa20
[  285.182901] [<900000000225b1d4>] mld_ifc_work+0x344/0xd18
[  285.182903] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  285.182906] [<9000000000350d94>] worker_thread+0x314/0x1240
[  285.182909] [<9000000000367010>] kthread+0x1a0/0x3c0
[  285.182912] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  285.182916] ---[ end trace ]---
[  285.182918] ------------[ cut here ]------------
[  285.182919] UBSAN: misaligned-access in arch/loongarch/lib/csum.c:127:6
[  285.182920] load of misaligned address 000000005c5776cb for type 'const __int128 unsigned'
[  285.182921] which requires 16 byte alignment
[  285.182923] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  285.182925] Tainted: [L]=SOFTLOCKUP
[  285.182925] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  285.182927] Workqueue: mld mld_ifc_work
[  285.182928] Stack : 900000012b198018 0000000000000000 900000000023aae8 900000010049c000
[  285.182932]         900000010049f950 900000010049f958 0000000000000000 900000010049fa98
[  285.182936]         900000010049fa90 900000010049fa90 900000010049f988 756575716b726f57
[  285.182939]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  285.182943]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  285.182946]         900000000274b680 0000000000000000 0000000008208000 900000012b198018
[  285.182950]         0000000000000000 0000000000000000 9000000002805d80 900000010049f958
[  285.182953]         900000000296c000 900000000296c000 0000000000000000 900000012b198028
[  285.182957]         000000000000001c 0000000000000000 900000000023aba4 0000555566400078
[  285.182960]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  285.182964]         ...
[  285.182965] Call Trace:
[  285.182966] [<900000000023aba4>] show_stack+0x10c/0x228
[  285.182968] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  285.182971] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  285.182973] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  285.182976] [<90000000024c3208>] csum_ipv6_magic+0x188/0x198
[  285.182979] [<90000000022504cc>] mld_sendpack+0x19c/0xa20
[  285.182982] [<900000000225b1d4>] mld_ifc_work+0x344/0xd18
[  285.182983] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  285.182986] [<9000000000350d94>] worker_thread+0x314/0x1240
[  285.182988] [<9000000000367010>] kthread+0x1a0/0x3c0
[  285.182991] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  285.182994] ---[ end trace ]---
[  285.182995] ------------[ cut here ]------------
[  285.182996] UBSAN: misaligned-access in arch/loongarch/lib/csum.c:128:6
[  285.182997] load of misaligned address 0000000064059723 for type 'const __int128 unsigned'
[  285.182998] which requires 16 byte alignment
[  285.183000] CPU: 2 UID: 0 PID: 29 Comm: kworker/2:0 Tainted: G             L     6.13.0-rc7+ #2
[  285.183001] Tainted: [L]=SOFTLOCKUP
[  285.183002] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  285.183003] Workqueue: mld mld_ifc_work
[  285.183005] Stack : 900000012b198018 0000000000000000 900000000023aae8 900000010049c000
[  285.183009]         900000010049f950 900000010049f958 0000000000000000 900000010049fa98
[  285.183012]         900000010049fa90 900000010049fa90 900000010049f988 756575716b726f57
[  285.183016]         203a65756575716b 0000000000000000 747e13a118945c77 900000000a800790
[  285.183019]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  285.183022]         900000000274b680 0000000000000000 0000000008208000 900000012b198018
[  285.183026]         0000000000000000 0000000000000000 9000000002805d80 900000010049f958
[  285.183030]         900000000296c000 900000000296c000 0000000000000000 900000012b198028
[  285.183033]         000000000000001c 0000000000000000 900000000023aba4 0000555566400078
[  285.183037]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  285.183040]         ...
[  285.183042] Call Trace:
[  285.183042] [<900000000023aba4>] show_stack+0x10c/0x228
[  285.183044] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  285.183047] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  285.183049] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  285.183052] [<90000000024c319c>] csum_ipv6_magic+0x11c/0x198
[  285.183054] [<90000000022504cc>] mld_sendpack+0x19c/0xa20
[  285.183057] [<900000000225b1d4>] mld_ifc_work+0x344/0xd18
[  285.183059] [<900000000034db40>] process_one_work+0x2d0/0x12e0
[  285.183061] [<9000000000350d94>] worker_thread+0x314/0x1240
[  285.183063] [<9000000000367010>] kthread+0x1a0/0x3c0
[  285.183066] [<90000000002377e8>] ret_from_kernel_thread+0xc/0xa4

[  285.183070] ---[ end trace ]---
[  290.484328] ------------[ cut here ]------------
[  290.484333] UBSAN: misaligned-access in kernel/smp.c:527:2
[  290.484335] member access within misaligned address 000000008962cae7 for type 'struct call_single_data_t'
[  290.484338] which requires 32 byte alignment
[  290.484341] CPU: 2 UID: 0 PID: 616 Comm: gmain Tainted: G             L     6.13.0-rc7+ #2
[  290.484345] Tainted: [L]=SOFTLOCKUP
[  290.484345] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  290.484347] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000151cd8000
[  290.484353]         9000000100213bb0 9000000100213bb8 0000000000000000 9000000100213cf8
[  290.484357]         9000000100213cf0 9000000100213cf0 900000000811df08 6572617764726148
[  290.484361]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  290.484365]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  290.484368]         000000000000001f 9000000003f3aa60 0000000008208000 0000000000000000
[  290.484372]         0000000000000000 0000000000000000 9000000002805d80 9000000100213bb8
[  290.484375]         900000000296c000 0000000000000010 0000000000000002 900000000296c000
[  290.484379]         0000000000000001 0000000000000000 900000000023aba4 00007fffefb48280
[  290.484382]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  290.484386]         ...
[  290.484388] Call Trace:
[  290.484389] [<900000000023aba4>] show_stack+0x10c/0x228
[  290.484395] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  290.484399] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  290.484402] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  290.484406] [<90000000005c87fc>] __flush_smp_call_function_queue+0x7fc/0xd68
[  290.484411] [<90000000002559c4>] loongson_ipi_interrupt+0x1d4/0x3a0
[  290.484414] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  290.484418] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  290.484421] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  290.484424] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  290.484427] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  290.484431] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  290.484434] [<90000000024c4568>] do_vint+0xc8/0x198
[  290.484436] [<9000000000391060>] finish_task_switch.isra.0+0x110/0xa08
[  290.484440] [<90000000024ceb0c>] __schedule+0x70c/0x30d8
[  290.484443] [<90000000024d1530>] schedule+0x58/0x450
[  290.484446] [<90000000024d1dd4>] schedule_preempt_disabled+0x14/0x20
[  290.484450] [<90000000024de28c>] rwsem_down_write_slowpath+0x384/0x1a38
[  290.484452] [<90000000024dfb6c>] down_write_killable+0xc4/0x178
[  290.484454] [<9000000000af4500>] do_mprotect_pkey.constprop.0+0x138/0x948
[  290.484458] [<9000000000af4d24>] sys_mprotect+0x14/0x30
[  290.484460] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  290.484465] ---[ end trace ]---
[  290.484466] ------------[ cut here ]------------
[  290.484467] UBSAN: misaligned-access in kernel/smp.c:529:7
[  290.484468] member access within misaligned address 000000008962cae7 for type 'struct call_single_data_t'
[  290.484470] which requires 32 byte alignment
[  290.484471] CPU: 2 UID: 0 PID: 616 Comm: gmain Tainted: G             L     6.13.0-rc7+ #2
[  290.484473] Tainted: [L]=SOFTLOCKUP
[  290.484474] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  290.484475] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000151cd8000
[  290.484479]         9000000100213bb0 9000000100213bb8 0000000000000000 9000000100213cf8
[  290.484482]         9000000100213cf0 9000000100213cf0 900000000811ea90 6572617764726148
[  290.484486]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  290.484489]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  290.484493]         000000000000001f 9000000003f3aa60 0000000008208000 0000000000000000
[  290.484497]         0000000000000000 0000000000000000 9000000002805d80 9000000100213bb8
[  290.484500]         900000000296c000 0000000000000010 0000000000000002 900000000296c000
[  290.484504]         0000000000000001 0000000000000000 900000000023aba4 00007fffefb48280
[  290.484507]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  290.484511]         ...
[  290.484512] Call Trace:
[  290.484513] [<900000000023aba4>] show_stack+0x10c/0x228
[  290.484515] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  290.484518] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  290.484521] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  290.484524] [<90000000005c8814>] __flush_smp_call_function_queue+0x814/0xd68
[  290.484527] [<90000000002559c4>] loongson_ipi_interrupt+0x1d4/0x3a0
[  290.484530] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  290.484533] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  290.484536] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  290.484538] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  290.484541] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  290.484544] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  290.484547] [<90000000024c4568>] do_vint+0xc8/0x198
[  290.484549] [<9000000000391060>] finish_task_switch.isra.0+0x110/0xa08
[  290.484551] [<90000000024ceb0c>] __schedule+0x70c/0x30d8
[  290.484554] [<90000000024d1530>] schedule+0x58/0x450
[  290.484557] [<90000000024d1dd4>] schedule_preempt_disabled+0x14/0x20
[  290.484560] [<90000000024de28c>] rwsem_down_write_slowpath+0x384/0x1a38
[  290.484562] [<90000000024dfb6c>] down_write_killable+0xc4/0x178
[  290.484564] [<9000000000af4500>] do_mprotect_pkey.constprop.0+0x138/0x948
[  290.484567] [<9000000000af4d24>] sys_mprotect+0x14/0x30
[  290.484569] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  290.484572] ---[ end trace ]---
[  290.484573] ------------[ cut here ]------------
[  290.484574] UBSAN: misaligned-access in kernel/smp.c:544:9
[  290.484575] member access within misaligned address 000000008962cae7 for type 'struct call_single_data_t'
[  290.484577] which requires 32 byte alignment
[  290.484578] CPU: 2 UID: 0 PID: 616 Comm: gmain Tainted: G             L     6.13.0-rc7+ #2
[  290.484580] Tainted: [L]=SOFTLOCKUP
[  290.484580] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  290.484581] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000151cd8000
[  290.484585]         9000000100213bb0 9000000100213bb8 0000000000000000 9000000100213cf8
[  290.484589]         9000000100213cf0 9000000100213cf0 900000000811f618 6572617764726148
[  290.484592]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  290.484596]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  290.484599]         000000000000001f 9000000003f3aa60 0000000008208000 0000000000000000
[  290.484603]         0000000000000000 0000000000000000 9000000002805d80 9000000100213bb8
[  290.484606]         900000000296c000 0000000000000010 0000000000000002 900000000296c000
[  290.484610]         0000000000000001 0000000000000000 900000000023aba4 00007fffefb48280
[  290.484613]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  290.484617]         ...
[  290.484618] Call Trace:
[  290.484619] [<900000000023aba4>] show_stack+0x10c/0x228
[  290.484621] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  290.484624] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  290.484626] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  290.484629] [<90000000005c8794>] __flush_smp_call_function_queue+0x794/0xd68
[  290.484632] [<90000000002559c4>] loongson_ipi_interrupt+0x1d4/0x3a0
[  290.484635] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  290.484638] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  290.484641] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  290.484644] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  290.484646] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  290.484649] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  290.484652] [<90000000024c4568>] do_vint+0xc8/0x198
[  290.484654] [<9000000000391060>] finish_task_switch.isra.0+0x110/0xa08
[  290.484656] [<90000000024ceb0c>] __schedule+0x70c/0x30d8
[  290.484659] [<90000000024d1530>] schedule+0x58/0x450
[  290.484662] [<90000000024d1dd4>] schedule_preempt_disabled+0x14/0x20
[  290.484665] [<90000000024de28c>] rwsem_down_write_slowpath+0x384/0x1a38
[  290.484667] [<90000000024dfb6c>] down_write_killable+0xc4/0x178
[  290.484669] [<9000000000af4500>] do_mprotect_pkey.constprop.0+0x138/0x948
[  290.484672] [<9000000000af4d24>] sys_mprotect+0x14/0x30
[  290.484674] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  290.484677] ---[ end trace ]---
[  290.484678] ------------[ cut here ]------------
[  290.484679] UBSAN: misaligned-access in kernel/smp.c:555:2
[  290.484680] member access within misaligned address 000000008962cae7 for type 'struct call_single_data_t'
[  290.484681] which requires 32 byte alignment
[  290.484682] CPU: 2 UID: 0 PID: 616 Comm: gmain Tainted: G             L     6.13.0-rc7+ #2
[  290.484684] Tainted: [L]=SOFTLOCKUP
[  290.484685] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  290.484686] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000151cd8000
[  290.484690]         9000000100213bb0 9000000100213bb8 0000000000000000 9000000100213cf8
[  290.484693]         9000000100213cf0 9000000100213cf0 90000000081201a0 6572617764726148
[  290.484697]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  290.484700]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  290.484704]         000000000000001f 9000000003f3aa60 0000000008208000 0000000000000018
[  290.484707]         0000000000000000 0000000000000000 9000000002805d80 9000000100213bb8
[  290.484711]         900000000296c000 900000000296c3f8 0000000000000002 900000010003a878
[  290.484714]         0000000000000001 0000000000000000 900000000023aba4 00007fffefb48280
[  290.484718]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  290.484721]         ...
[  290.484723] Call Trace:
[  290.484723] [<900000000023aba4>] show_stack+0x10c/0x228
[  290.484725] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  290.484728] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  290.484731] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  290.484733] [<90000000005c8844>] __flush_smp_call_function_queue+0x844/0xd68
[  290.484736] [<90000000002559c4>] loongson_ipi_interrupt+0x1d4/0x3a0
[  290.484739] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  290.484742] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  290.484745] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  290.484747] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  290.484750] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  290.484753] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  290.484756] [<90000000024c4568>] do_vint+0xc8/0x198
[  290.484758] [<9000000000391060>] finish_task_switch.isra.0+0x110/0xa08
[  290.484760] [<90000000024ceb0c>] __schedule+0x70c/0x30d8
[  290.484763] [<90000000024d1530>] schedule+0x58/0x450
[  290.484766] [<90000000024d1dd4>] schedule_preempt_disabled+0x14/0x20
[  290.484769] [<90000000024de28c>] rwsem_down_write_slowpath+0x384/0x1a38
[  290.484771] [<90000000024dfb6c>] down_write_killable+0xc4/0x178
[  290.484773] [<9000000000af4500>] do_mprotect_pkey.constprop.0+0x138/0x948
[  290.484775] [<9000000000af4d24>] sys_mprotect+0x14/0x30
[  290.484778] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  290.484781] ---[ end trace ]---
[  290.484781] ------------[ cut here ]------------
[  290.484782] UBSAN: misaligned-access in kernel/smp.c:556:14
[  290.484783] member access within misaligned address 000000008962cae7 for type 'struct call_single_data_t'
[  290.484784] which requires 32 byte alignment
[  290.484785] CPU: 2 UID: 0 PID: 616 Comm: gmain Tainted: G             L     6.13.0-rc7+ #2
[  290.484787] Tainted: [L]=SOFTLOCKUP
[  290.484788] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  290.484789] Stack : 9000000002805d80 0000000000000000 900000000023aae8 9000000151cd8000
[  290.484792]         9000000100213bb0 9000000100213bb8 0000000000000000 9000000100213cf8
[  290.484796]         9000000100213cf0 9000000100213cf0 9000000008120d28 6572617764726148
[  290.484799]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000a800790
[  290.484803]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  290.484806]         000000000000001f 9000000003f3aa60 0000000008208000 0000000000000018
[  290.484810]         0000000000000000 0000000000000000 9000000002805d80 9000000100213bb8
[  290.484813]         900000000296c000 900000000296c3f8 0000000000000002 900000010003a878
[  290.484817]         0000000000000001 0000000000000000 900000000023aba4 00007fffefb48280
[  290.484820]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  290.484824]         ...
[  290.484825] Call Trace:
[  290.484826] [<900000000023aba4>] show_stack+0x10c/0x228
[  290.484828] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  290.484831] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  290.484833] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  290.484836] [<90000000005c882c>] __flush_smp_call_function_queue+0x82c/0xd68
[  290.484839] [<90000000002559c4>] loongson_ipi_interrupt+0x1d4/0x3a0
[  290.484842] [<90000000004a57a4>] __handle_irq_event_percpu+0xac/0x5c8
[  290.484845] [<90000000004a5ce8>] handle_irq_event_percpu+0x28/0xd8
[  290.484847] [<90000000004bf8c4>] handle_percpu_irq+0xbc/0x288
[  290.484850] [<90000000004a2d3c>] generic_handle_domain_irq+0x64/0xe8
[  290.484852] [<90000000015f76d0>] handle_cpu_irq+0x70/0xa8
[  290.484855] [<90000000024c4420>] handle_loongarch_irq+0x48/0xc8
[  290.484858] [<90000000024c4568>] do_vint+0xc8/0x198
[  290.484860] [<9000000000391060>] finish_task_switch.isra.0+0x110/0xa08
[  290.484862] [<90000000024ceb0c>] __schedule+0x70c/0x30d8
[  290.484865] [<90000000024d1530>] schedule+0x58/0x450
[  290.484868] [<90000000024d1dd4>] schedule_preempt_disabled+0x14/0x20
[  290.484871] [<90000000024de28c>] rwsem_down_write_slowpath+0x384/0x1a38
[  290.484873] [<90000000024dfb6c>] down_write_killable+0xc4/0x178
[  290.484875] [<9000000000af4500>] do_mprotect_pkey.constprop.0+0x138/0x948
[  290.484877] [<9000000000af4d24>] sys_mprotect+0x14/0x30
[  290.484879] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  290.484882] ---[ end trace ]---
[  301.411165] nvme nvme0: using unchecked data buffer
[  301.762361] NET: Registered PF_QIPCRTR protocol family
[  302.345433] dwmac-loongson-pci 0000:00:03.0 enp0s3f0: Register MEM_TYPE_PAGE_POOL RxQ-0
[  302.346892] dwmac-loongson-pci 0000:00:03.0 enp0s3f0: PHY [stmmac-18:02] driver [Generic PHY] (irq=POLL)
[  302.346996] dwmac-loongson-pci 0000:00:03.0 enp0s3f0: No Safety Features support found
[  302.347213] dwmac-loongson-pci 0000:00:03.0 enp0s3f0: IEEE 1588-2008 Advanced Timestamp supported
[  302.347327] dwmac-loongson-pci 0000:00:03.0 enp0s3f0: registered PTP clock
[  302.347920] dwmac-loongson-pci 0000:00:03.0 enp0s3f0: configuring for phy/gmii link mode
[  302.374774] Generic FE-GE Realtek PHY r8169-0-200:00: attached PHY driver (mii_bus:phy_addr=r8169-0-200:00, irq=MAC)
[  302.579388] r8169 0000:02:00.0 enp2s0: Link is Down
[  303.221240] kauditd_printk_skb: 14 callbacks suppressed
[  303.221245] audit: type=1400 audit(1739238057.244:26): apparmor="DENIED" operation="capable" class="cap" profile="/usr/sbin/cupsd" pid=718 comm="cupsd" capability=12  capname="net_admin"
[  305.987632] r8169 0000:02:00.0 enp2s0: Link is Up - 1Gbps/Full - flow control rx/tx
[  308.696012] ------------[ cut here ]------------
[  308.758309] UBSAN: misaligned-access in arch/loongarch/lib/csum.c:62:8
[  308.821481] load of misaligned address 00000000014b0964 for type '__int128 unsigned'
[  308.885194] which requires 16 byte alignment
[  308.948418] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G             L     6.13.0-rc7+ #2
[  309.012364] Tainted: [L]=SOFTLOCKUP
[  309.075468] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  309.141720] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000000294c000
[  309.208065]         900000010020b590 900000010020b598 0000000000000000 900000010020b6d8
[  309.272428]         900000010020b6d0 900000010020b6d0 0000000000000040 0000000000000000
[  309.334225]         0000000000000000 0000000000000000 747e13a118945c77 900000000a000790
[  309.395682]         0000000000001d7a 0000000000000000 0000000000000000 0000000000000000
[  309.456921]         0000000000000000 0000000000000010 0000000007a08000 0000000000000002
[  309.517868]         0000000000000000 0000000000000000 9000000002805d80 900000010020b598
[  309.578501]         900000000296c000 900000015383b868 00000000000000f7 0000000000000000
[  309.638673]         900000015383b868 0000000000000000 900000000023aba4 00005555953741e8
[  309.698310]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  309.757313]         ...
[  309.815344] Call Trace:
[  309.815346] [<900000000023aba4>] show_stack+0x10c/0x228
[  309.930185] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  309.987025] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  310.043634] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  310.101056] [<90000000024c3600>] do_csum+0x3e8/0x440
[  310.157695] [<90000000015dd78c>] csum_partial+0x14/0x40
[  310.213424] [<9000000001bd6ae8>] __skb_checksum+0xb0/0x8f8
[  310.268784] [<9000000001bd7370>] skb_checksum+0x40/0x60
[  310.323596] [<9000000001d28628>] __skb_gro_checksum_complete+0x68/0x288
[  310.378817] [<9000000001ff91b0>] udp4_gro_receive+0x238/0x1668
[  310.433853] [<900000000201d328>] inet_gro_receive+0x3c0/0x13d8
[  310.488235] [<9000000001d2a9ec>] dev_gro_receive+0x6fc/0x3398
[  310.542346] [<9000000001d2ebc8>] napi_gro_receive+0x140/0x9f8
[  310.595754] [<ffff8000026b7c00>] rtl8169_poll+0x340/0x1430 [r8169]
[  310.648815] [<9000000001c6c558>] __napi_poll+0x88/0x620
[  310.701321] [<9000000001c6d938>] net_rx_action+0x378/0xea0
[  310.753234] [<90000000002f40cc>] handle_softirqs+0x1ec/0xaf0
[  310.805304] [<90000000002f4ccc>] __irq_exit_rcu+0x24c/0x4b8
[  310.856693] [<90000000024c4568>] do_vint+0xc8/0x198
[  310.908194] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[  310.959913] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[  311.011808] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[  311.063988] [<9000000000413344>] do_idle+0x124/0x258
[  311.116054] [<9000000000413950>] cpu_startup_entry+0x68/0xa0
[  311.168509] [<90000000024c9280>] kernel_init+0x0/0x120
[  311.221140] [<90000000025014dc>] console_on_rootfs+0x0/0x74

[  311.326330] ---[ end trace ]---
[  311.378935] ------------[ cut here ]------------
[  311.431684] UBSAN: misaligned-access in arch/loongarch/lib/csum.c:63:8
[  311.485414] load of misaligned address 00000000014b0964 for type '__int128 unsigned'
[  311.539319] which requires 16 byte alignment
[  311.592516] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G             L     6.13.0-rc7+ #2
[  311.646274] Tainted: [L]=SOFTLOCKUP
[  311.698871] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  311.754801] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000000294c000
[  311.811528]         900000010020b590 900000010020b598 0000000000000000 900000010020b6d8
[  311.868391]         900000010020b6d0 900000010020b6d0 0000000000000040 0000000000000000
[  311.925090]         0000000000000000 0000000000000000 747e13a118945c77 900000000a000790
[  311.981187]         0000000000001da9 0000000000000000 0000000000000000 0000000000000000
[  312.036502]         0000000000000000 0000000000000010 0000000007a08000 0000000000000002
[  312.091645]         0000000000000000 0000000000000000 9000000002805d80 900000010020b598
[  312.146723]         900000000296c000 900000015383b868 e5008a009835140a 0000000000000000
[  312.202074]         900000015383b868 0000000000000000 900000000023aba4 00005555953741e8
[  312.257519]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  312.313191]         ...
[  312.366870] Call Trace:
[  312.366871] [<900000000023aba4>] show_stack+0x10c/0x228
[  312.470502] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  312.521776] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  312.572327] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  312.622861] [<90000000024c3594>] do_csum+0x37c/0x440
[  312.672831] [<90000000015dd78c>] csum_partial+0x14/0x40
[  312.722278] [<9000000001bd6ae8>] __skb_checksum+0xb0/0x8f8
[  312.770099] [<9000000001bd7370>] skb_checksum+0x40/0x60
[  312.816208] [<9000000001d28628>] __skb_gro_checksum_complete+0x68/0x288
[  312.862708] [<9000000001ff91b0>] udp4_gro_receive+0x238/0x1668
[  312.909505] [<900000000201d328>] inet_gro_receive+0x3c0/0x13d8
[  312.956020] [<9000000001d2a9ec>] dev_gro_receive+0x6fc/0x3398
[  313.002720] [<9000000001d2ebc8>] napi_gro_receive+0x140/0x9f8
[  313.007441] ------------[ cut here ]------------
[  313.049749] [<ffff8000026b7c00>] rtl8169_poll+0x340/0x1430 [r8169]
[  313.097129] UBSAN: misaligned-access in kernel/exit.c:500:2
[  313.145171] [<9000000001c6c558>] __napi_poll+0x88/0x620
[  313.193266] member access within misaligned address 0000000086515187 for type 'struct task_struct'
[  313.241626] [<9000000001c6d938>] net_rx_action+0x378/0xea0
[  313.241632] [<90000000002f40cc>] handle_softirqs+0x1ec/0xaf0
[  313.290914] which requires 64 byte alignment
[  313.340644] [<90000000002f4ccc>] __irq_exit_rcu+0x24c/0x4b8
[  313.340648] [<90000000024c4568>] do_vint+0xc8/0x198
[  313.540243] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[  313.589902] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[  313.639572] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[  313.689342] [<9000000000413344>] do_idle+0x124/0x258
[  313.738989] [<9000000000413950>] cpu_startup_entry+0x68/0xa0
[  313.788538] [<90000000024c9280>] kernel_init+0x0/0x120
[  313.837804] [<90000000025014dc>] console_on_rootfs+0x0/0x74

[  313.936377] CPU: 5 UID: 990 PID: 599 Comm: gnome-remote-de Tainted: G             L     6.13.0-rc7+ #2
[  313.936384] ---[ end trace ]---
[  313.987261] Tainted: [L]=SOFTLOCKUP
[  314.037311] ------------[ cut here ]------------
[  314.087074] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  314.087076] Stack :
[  314.137169] UBSAN: misaligned-access in arch/loongarch/lib/csum.c:64:8
[  314.190611]  9000000002805d80
[  314.243546] load of misaligned address 00000000014b0964 for type '__int128 unsigned'
[  314.297664]  0000000000000000
[  314.351514] which requires 16 byte alignment
[  314.406826]  900000000023aae8 90000001502d0000
[  314.572246]         90000001502d37f0 90000001502d37f8 0000000000000000 90000001502d3938
[  314.628696]         90000001502d3930 90000001502d3930 90000000081235a0 6572617764726148
[  314.685083]         203a656d616e2065 0000000000000000 747e13a118945c77 900000000b400790
[  314.741627]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  314.798454]         000000000000001f 9000000003f3aa60 0000000008e08000 90000001138a6cc8
[  314.855263]         0000000000000000 0000000000000000 9000000002805d80 90000001502d37f8
[  314.911494]         900000000296c000 0000000000000005 0000000000000000 9000000002960000
[  314.966968]         0000000000000000 0000000000000000 900000000023aba4 00007ffff18cc4a4
[  315.021812]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  315.076078]         ...
[  315.129413] Call Trace:
[  315.129414] [<900000000023aba4>] show_stack+0x10c/0x228
[  315.231175] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  315.281396] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  315.331794] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  315.382726] [<90000000002ecad8>] mm_update_next_owner+0x2d8/0x540
[  315.433817] [<90000000002ed2d4>] do_exit+0x594/0x28c0
[  315.485117] [<90000000002efaf0>] do_group_exit+0x70/0x2f8
[  315.536557] [<9000000000321bf0>] get_signal+0x2030/0x2ca8
[  315.587851] [<9000000000240264>] arch_do_signal_or_restart+0x64/0x41c0
[  315.639304] [<90000000024c6b50>] syscall_exit_to_user_mode+0x148/0x220
[  315.690914] [<90000000024c65f8>] do_syscall+0x178/0x3b8

[  315.792681] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G             L     6.13.0-rc7+ #2
[  315.792687] ---[ end trace ]---
[  315.844966] Tainted: [L]=SOFTLOCKUP
[  315.844967] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  315.844969] Stack : 9000000002805d80
[  315.896751] ------------[ cut here ]------------
[  315.948504]  0000000000000000 900000000023aae8 900000000294c000
[  316.003526] UBSAN: misaligned-access in kernel/exit.c:461:2
[  316.058035]         900000010020b590 900000010020b598 0000000000000000 900000010020b6d8
[  316.112931] member access within misaligned address 00000000b63028be for type 'struct task_struct'
[  316.168427]         900000010020b6d0 900000010020b6d0 9000000008123e30 6572617764726148
[  316.168433]        
[  316.224207] which requires 64 byte alignment
[  316.280836]  203a656d616e2065 0000000000000000 747e13a118945c77 900000000a000790
[  316.570610]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  316.629433]         000000000000001f 9000000003f3aa60 0000000007a08000 0000000000000002
[  316.687769]         0000000000000000 0000000000000000 9000000002805d80 900000010020b598
[  316.745681]         900000000296c000 900000015383b868 e5008a009835140a 0000000000000000
[  316.802944]         900000015383b868 0000000000000000 900000000023aba4 00005555953741e8
[  316.859629]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  316.916329]         ...
[  316.972240] Call Trace:
[  316.972242] [<900000000023aba4>] show_stack+0x10c/0x228
[  317.083621] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  317.139563] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  317.195427] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  317.251901] [<90000000024c355c>] do_csum+0x344/0x440
[  317.308317] [<90000000015dd78c>] csum_partial+0x14/0x40
[  317.364746] [<9000000001bd6ae8>] __skb_checksum+0xb0/0x8f8
[  317.421165] [<9000000001bd7370>] skb_checksum+0x40/0x60
[  317.477501] [<9000000001d28628>] __skb_gro_checksum_complete+0x68/0x288
[  317.534104] [<9000000001ff91b0>] udp4_gro_receive+0x238/0x1668
[  317.590240] [<900000000201d328>] inet_gro_receive+0x3c0/0x13d8
[  317.645654] [<9000000001d2a9ec>] dev_gro_receive+0x6fc/0x3398
[  317.701312] [<9000000001d2ebc8>] napi_gro_receive+0x140/0x9f8
[  317.756879] [<ffff8000026b7c00>] rtl8169_poll+0x340/0x1430 [r8169]
[  317.811229] [<9000000001c6c558>] __napi_poll+0x88/0x620
[  317.863825] [<9000000001c6d938>] net_rx_action+0x378/0xea0
[  317.915967] [<90000000002f40cc>] handle_softirqs+0x1ec/0xaf0
[  317.967792] [<90000000002f4ccc>] __irq_exit_rcu+0x24c/0x4b8
[  318.018992] [<90000000024c4568>] do_vint+0xc8/0x198
[  318.069534] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[  318.120215] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[  318.170832] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[  318.220963] [<9000000000413344>] do_idle+0x124/0x258
[  318.271001] [<9000000000413950>] cpu_startup_entry+0x68/0xa0
[  318.320780] [<90000000024c9280>] kernel_init+0x0/0x120
[  318.370411] [<90000000025014dc>] console_on_rootfs+0x0/0x74

[  318.469473] CPU: 5 UID: 990 PID: 599 Comm: gnome-remote-de Tainted: G             L     6.13.0-rc7+ #2
[  318.469475] ---[ end trace ]---
[  318.469477] Tainted: [L]=SOFTLOCKUP
[  318.520865] ------------[ cut here ]------------
[  318.571681] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  318.622468] UBSAN: misaligned-access in arch/loongarch/lib/csum.c:65:8
[  318.673034] Stack : 000000000000008e 0000000000000000 900000000023aae8 90000001502d0000
[  318.673040]        
[  318.727319] load of misaligned address 00000000014b0964 for type '__int128 unsigned'
[  318.781847]  90000001502d3790
[  318.837411] which requires 16 byte alignment
[  318.892564]  90000001502d3798 0000000000000000 90000001502d38d8
[  319.118024]         90000001502d38d0 90000001502d38d0 0000000000000040 0000000000000000
[  319.175900]         0000000000000000 0000000000000000 747e13a118945c77 900000000b400790
[  319.233686]         9000000003f3aab8 0000000000aaaaaa ffff8000339d8220 000000000000001f
[  319.291422]         0000000000000000 0000000000000010 0000000008e08000 900000014c813bd8
[  319.349127]         0000000000000000 0000000000000000 9000000002805d80 90000001502d3798
[  319.406331]         900000000296c000 90000001138a6780 0000000000000001 900000000296c000
[  319.463230]         0000000000000000 0000000000000000 900000000023aba4 00007ffff18cc4a4
[  319.519787]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  319.576370]         ...
[  319.630831] Call Trace:
[  319.630833] [<900000000023aba4>] show_stack+0x10c/0x228
[  319.736362] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  319.788970] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  319.841200] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  319.893324] [<90000000002e73dc>] try_to_set_owner+0x234/0x410
[  319.944757] [<90000000002ec994>] mm_update_next_owner+0x194/0x540
[  319.995561] [<90000000002ed2d4>] do_exit+0x594/0x28c0
[  320.045751] [<90000000002efaf0>] do_group_exit+0x70/0x2f8
[  320.095906] [<9000000000321bf0>] get_signal+0x2030/0x2ca8
[  320.145468] [<9000000000240264>] arch_do_signal_or_restart+0x64/0x41c0
[  320.195064] [<90000000024c6b50>] syscall_exit_to_user_mode+0x148/0x220
[  320.244908] [<90000000024c65f8>] do_syscall+0x178/0x3b8

[  320.344142] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G             L     6.13.0-rc7+ #2
[  320.344148] ---[ end trace ]---
[  320.394852] Tainted: [L]=SOFTLOCKUP
[  320.394854] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  320.394855] Stack : 9000000002805d80 0000000000000000
[  320.444969] ------------[ cut here ]------------
[  320.494457]  900000000023aae8 900000000294c000
[  320.494461]         900000010020b590
[  320.547771] UBSAN: misaligned-access in kernel/exit.c:507:2
[  320.600973]  900000010020b598 0000000000000000 900000010020b6d8
[  320.600977]         900000010020b6d0
[  320.654373] member access within misaligned address 0000000010f805eb for type 'struct task_struct'
[  320.707874]  900000010020b6d0 9000000008125360 6572617764726148
[  320.707878]         203a656d616e2065
[  320.760867] which requires 64 byte alignment
[  320.814113]  0000000000000000 747e13a118945c77 900000000a000790
[  321.197076]         9000000003f3aab8 0000000000000000 0000000000000000 0000000000000000
[  321.253455]         000000000000001f 9000000003f3aa60 0000000007a08000 0000000000000002
[  321.309439]         0000000000000000 0000000000000000 9000000002805d80 900000010020b598
[  321.365102]         900000000296c000 900000015383b868 e5008a009835140a 4341434143414341
[  321.421050]         900000015383b868 0000000000000000 900000000023aba4 00005555953741e8
[  321.477168]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  321.533300]         ...
[  321.588971] Call Trace:
[  321.588973] [<900000000023aba4>] show_stack+0x10c/0x228
[  321.700159] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  321.756008] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  321.811743] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  321.868086] [<90000000024c35cc>] do_csum+0x3b4/0x440
[  321.924307] [<90000000015dd78c>] csum_partial+0x14/0x40
[  321.980518] [<9000000001bd6ae8>] __skb_checksum+0xb0/0x8f8
[  322.036533] [<9000000001bd7370>] skb_checksum+0x40/0x60
[  322.091962] [<9000000001d28628>] __skb_gro_checksum_complete+0x68/0x288
[  322.147369] [<9000000001ff91b0>] udp4_gro_receive+0x238/0x1668
[  322.203078] [<900000000201d328>] inet_gro_receive+0x3c0/0x13d8
[  322.258441] [<9000000001d2a9ec>] dev_gro_receive+0x6fc/0x3398
[  322.312152] [<9000000001d2ebc8>] napi_gro_receive+0x140/0x9f8
[  322.364164] [<ffff8000026b7c00>] rtl8169_poll+0x340/0x1430 [r8169]
[  322.415982] [<9000000001c6c558>] __napi_poll+0x88/0x620
[  322.467097] [<9000000001c6d938>] net_rx_action+0x378/0xea0
[  322.517637] [<90000000002f40cc>] handle_softirqs+0x1ec/0xaf0
[  322.567673] [<90000000002f4ccc>] __irq_exit_rcu+0x24c/0x4b8
[  322.617616] [<90000000024c4568>] do_vint+0xc8/0x198
[  322.667149] [<90000000002378a0>] __arch_cpu_idle+0x20/0x24
[  322.716271] [<90000000024c896c>] arch_cpu_idle+0x1c/0x50
[  322.765259] [<90000000024c8c44>] default_idle_call+0x54/0x1f0
[  322.814258] [<9000000000413344>] do_idle+0x124/0x258
[  322.863021] [<9000000000413950>] cpu_startup_entry+0x68/0xa0
[  322.912175] [<90000000024c9280>] kernel_init+0x0/0x120
[  322.961267] [<90000000025014dc>] console_on_rootfs+0x0/0x74

[  323.059212] ---[ end trace ]---
[  323.059211] CPU: 5 UID: 990 PID: 599 Comm: gnome-remote-de Tainted: G             L     6.13.0-rc7+ #2
[  323.107747] sched: DL replenish lagged too much
[  323.207674] Tainted: [L]=SOFTLOCKUP
[  323.257500] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  323.310929] Stack : 000000000000008e 0000000000000000 900000000023aae8 90000001502d0000
[  323.364700]         90000001502d37f0 90000001502d37f8 0000000000000000 90000001502d3938
[  323.418231]         90000001502d3930 90000001502d3930 0000000000000040 0000000000000000
[  323.471476]         0000000000000000 0000000000000000 747e13a118945c77 900000000b400790
[  323.524768]         0000000000001e83 0000000000000000 0000000000000000 0000000000000000
[  323.578106]         0000000000000000 0000000000000010 0000000008e08000 900000014c813bd8
[  323.631361]         0000000000000000 0000000000000000 9000000002805d80 90000001502d37f8
[  323.684145]         900000000296c000 0000000000000030 0000000000000000 9000000002960000
[  323.736695]         9000000100381688 0000000000000000 900000000023aba4 00007ffff18cc4a4
[  323.789060]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  323.841220]         ...
[  323.892556] Call Trace:
[  323.892557] [<900000000023aba4>] show_stack+0x10c/0x228
[  323.994695] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  324.044446] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  324.092513] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  324.140991] [<90000000002ecba4>] mm_update_next_owner+0x3a4/0x540
[  324.189470] [<90000000002ed2d4>] do_exit+0x594/0x28c0
[  324.237883] [<90000000002efaf0>] do_group_exit+0x70/0x2f8
[  324.286031] [<9000000000321bf0>] get_signal+0x2030/0x2ca8
[  324.333803] [<9000000000240264>] arch_do_signal_or_restart+0x64/0x41c0
[  324.381822] [<90000000024c6b50>] syscall_exit_to_user_mode+0x148/0x220
[  324.429202] [<90000000024c65f8>] do_syscall+0x178/0x3b8

[  324.521519] ---[ end trace ]---
[  324.691694] ------------[ cut here ]------------
[  324.737642] UBSAN: misaligned-access in kernel/fork.c:3122:3
[  324.783610] member access within misaligned address 0000000054b18301 for type 'struct task_struct'
[  324.831094] which requires 64 byte alignment
[  324.878648] CPU: 2 UID: 117 PID: 753 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  324.927267] Tainted: [L]=SOFTLOCKUP
[  324.975132] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  325.026594] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000111388000
[  325.078137]         900000011138ba10 900000011138ba18 0000000000000000 900000011138bb58
[  325.130071]         900000011138bb50 900000011138bb50 0000000000000040 0000000000000000
[  325.181679]         0000000000000000 0000000000000000 747e13a118945c77 900000000a800790
[  325.233522]         0000000000001ea3 0000000000000000 0000000000000000 0000000000000000
[  325.285365]         0000000000000000 0000000000000010 0000000008208000 0000000000000000
[  325.336577]         0000000000000000 0000000000000000 9000000002805d80 900000011138ba18
[  325.387319]         900000000296c000 9000000002960000 9000000000326e00 90000001138a1140
[  325.437982]         900000014c4633c0 0000000000000000 900000000023aba4 00007ffff08e14e8
[  325.488632]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[  325.539237]         ...
[  325.589145] Call Trace:
[  325.589147] [<900000000023aba4>] show_stack+0x10c/0x228
[  325.688733] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  325.738769] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  325.788675] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  325.838943] [<90000000002dc3a0>] walk_process_tree+0x300/0x368
[  325.889100] [<9000000000333ed0>] sys_prctl+0x300/0x19e0
[  325.939243] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  326.038941] ---[ end trace ]---
[  326.088665] ------------[ cut here ]------------
[  326.138654] UBSAN: misaligned-access in kernel/fork.c:3121:2
[  326.189051] member access within misaligned address 00000000be5a78c1 for type 'struct task_struct'
[  326.240838] which requires 64 byte alignment
[  326.292566] CPU: 2 UID: 117 PID: 753 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  326.345539] Tainted: [L]=SOFTLOCKUP
[  326.397993] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  326.453998] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000111388000
[  326.510300]         900000011138ba10 900000011138ba18 0000000000000000 900000011138bb58
[  326.566920]         900000011138bb50 900000011138bb50 0000000000000040 0000000000000000
[  326.622846]         0000000000000000 0000000000000000 747e13a118945c77 900000000a800790
[  326.678308]         0000000000001ebf 0000000000000000 0000000000000000 0000000000000000
[  326.733652]         0000000000000000 0000000000000010 0000000008208000 0000000000000038
[  326.787035]         0000000000000000 0000000000000000 9000000002805d80 900000011138ba18
[  326.838562]         900000000296c000 9000000002960000 9000000000326e00 90000001138a1140
[  326.889928]         900000014c4633c0 0000000000000000 900000000023aba4 00007ffff08e14e8
[  326.941454]         00000000000000b0 0000000000000004 0000000000000007 0000000000071c1d
[  326.992839]         ...
[  327.043813] Call Trace:
[  327.043814] [<900000000023aba4>] show_stack+0x10c/0x228
[  327.146422] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  327.198218] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  327.249952] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  327.302315] [<90000000002dc2c8>] walk_process_tree+0x228/0x368
[  327.354258] [<9000000000333ed0>] sys_prctl+0x300/0x19e0
[  327.406462] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  327.510195] ---[ end trace ]---
[  329.768568] rfkill: input handler disabled
[  329.872006] ------------[ cut here ]------------
[  329.872020] UBSAN: misaligned-access in ./arch/loongarch/include/asm/checksum.h:46:6
[  329.872024] load of misaligned address 000000007ee406d3 for type 'const __int128 unsigned'
[  329.872029] which requires 16 byte alignment
[  329.872034] CPU: 0 UID: 117 PID: 1240 Comm: xbrlapi Tainted: G             L     6.13.0-rc7+ #2
[  329.872039] Tainted: [L]=SOFTLOCKUP
[  329.872041] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  329.872045] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000012fc10000
[  329.872055]         900000012fc133f0 900000012fc133f8 0000000000000000 900000012fc13538
[  329.872064]         900000012fc13530 900000012fc13530 9000000003f3aae8 382e39323320205b
[  329.872072]         205d313430323738 0000000000000000 747e13a118945c77 900000000a000790
[  329.872080]         0000000000001edc 0000000000000000 0000000000000000 0000000000000000
[  329.872087]         6f4c203a656d616e 0000000000000006 0000000007a08000 90000001539d45a8
[  329.872095]         0000000000000000 0000000000000000 9000000002805d80 900000012fc133f8
[  329.872103]         900000000296c000 9000000100731f04 9000000003fccbc0 000000000000d804
[  329.872110]         0000000000000000 0000000000000000 900000000023aba4 00007fffd400c048
[  329.872118]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  329.872125]         ...
[  329.872129] Call Trace:
[  329.872131] [<900000000023aba4>] show_stack+0x10c/0x228
[  329.872142] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  329.872149] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  329.872154] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  329.872160] [<9000000001eb39d4>] ip_send_check+0xec/0x138
[  329.872165] [<9000000001ec1970>] __ip_local_out+0xb0/0x440
[  329.872170] [<9000000001ec2ca4>] __ip_queue_xmit+0x284/0x1c68
[  329.872174] [<9000000001f5af3c>] __tcp_transmit_skb+0x8fc/0x3418
[  329.872179] [<9000000001f5efc0>] tcp_connect+0x1568/0x4b90
[  329.872183] [<9000000001f824a8>] tcp_v4_connect+0x6e8/0x15e8
[  329.872188] [<900000000201f714>] __inet_stream_connect+0xd4/0xfe8
[  329.872193] [<9000000002020688>] inet_stream_connect+0x60/0xc8
[  329.872198] [<9000000001bb2918>] __sys_connect+0xf0/0x108
[  329.872203] [<9000000001bb294c>] sys_connect+0x1c/0x28
[  329.872207] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  329.872220] ---[ end trace ]---
[  329.872239] ------------[ cut here ]------------
[  329.872242] UBSAN: misaligned-access in ./arch/loongarch/include/asm/checksum.h:46:6
[  329.872245] load of misaligned address 000000007ee406d3 for type 'const __int128 unsigned'
[  329.872248] which requires 16 byte alignment
[  329.872251] CPU: 0 UID: 117 PID: 1240 Comm: xbrlapi Tainted: G             L     6.13.0-rc7+ #2
[  329.872255] Tainted: [L]=SOFTLOCKUP
[  329.872257] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  329.872260] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000012fc10000
[  329.872269]         900000012fc12dd0 900000012fc12dd8 0000000000000000 900000012fc12f18
[  329.872276]         900000012fc12f10 900000012fc12f10 9000000003f3aae8 382e39323320205b
[  329.872284]         205d373532323738 0000000000000000 747e13a118945c77 900000000a000790
[  329.872291]         0000000000001f00 0000000000000000 0000000000000000 0000000000000000
[  329.872299]         6f4c203a656d616e 0000000000000006 0000000007a08000 9000000100731e00
[  329.872306]         0000000000000000 0000000000000000 9000000002805d80 900000012fc12dd8
[  329.872314]         900000000296c000 0000000000000014 0000000000000000 0000000000000005
[  329.872321]         9000000100731f04 0000000000000000 900000000023aba4 00007fffd400c048
[  329.872328]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  329.872336]         ...
[  329.872340] Call Trace:
[  329.872341] [<900000000023aba4>] show_stack+0x10c/0x228
[  329.872346] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  329.872351] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  329.872355] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  329.872360] [<9000000001ea62f8>] ip_rcv_core+0xab8/0x1060
[  329.872364] [<9000000001ea8a90>] ip_rcv+0x58/0x190
[  329.872368] [<9000000001c68cd8>] __netif_receive_skb_one_core+0x88/0x110
[  329.872373] [<9000000001c6932c>] process_backlog+0x13c/0xaf0
[  329.872377] [<9000000001c6c558>] __napi_poll+0x88/0x620
[  329.872381] [<9000000001c6d938>] net_rx_action+0x378/0xea0
[  329.872385] [<90000000002f40cc>] handle_softirqs+0x1ec/0xaf0
[  329.872391] [<90000000002f536c>] do_softirq+0xac/0x100
[  329.872395] [<90000000002f5504>] __local_bh_enable_ip+0x144/0x278
[  329.872399] [<9000000001c5daf8>] __dev_queue_xmit+0x440/0x4708
[  329.872403] [<9000000001ebfa94>] ip_finish_output2+0x704/0x1b50
[  329.872408] [<9000000001ec2cdc>] __ip_queue_xmit+0x2bc/0x1c68
[  329.872412] [<9000000001f5af3c>] __tcp_transmit_skb+0x8fc/0x3418
[  329.872416] [<9000000001f5efc0>] tcp_connect+0x1568/0x4b90
[  329.872421] [<9000000001f824a8>] tcp_v4_connect+0x6e8/0x15e8
[  329.872426] [<900000000201f714>] __inet_stream_connect+0xd4/0xfe8
[  329.872430] [<9000000002020688>] inet_stream_connect+0x60/0xc8
[  329.872435] [<9000000001bb2918>] __sys_connect+0xf0/0x108
[  329.872439] [<9000000001bb294c>] sys_connect+0x1c/0x28
[  329.872443] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  329.872450] ---[ end trace ]---
[  330.105584] audit: type=1400 audit(1739238084.128:27): apparmor="DENIED" operation="open" class="file" profile="/usr/libexec/geoclue" name="/etc/os-release" pid=1312 comm="geoclue" requested_mask="r" denied_mask="r" fsuid=114 ouid=0
[  330.105598] audit: type=1400 audit(1739238084.128:28): apparmor="DENIED" operation="open" class="file" profile="/usr/libexec/geoclue" name="/etc/os-release" pid=1312 comm="geoclue" requested_mask="r" denied_mask="r" fsuid=114 ouid=0
[  330.105602] audit: type=1400 audit(1739238084.128:29): apparmor="DENIED" operation="open" class="file" profile="/usr/libexec/geoclue" name="/etc/os-release" pid=1312 comm="geoclue" requested_mask="r" denied_mask="r" fsuid=114 ouid=0
[  330.119113] audit: type=1400 audit(1739238084.144:30): apparmor="DENIED" operation="open" class="file" profile="/usr/libexec/geoclue" name="/etc/os-release" pid=1312 comm="geoclue" requested_mask="r" denied_mask="r" fsuid=114 ouid=0
[  330.119124] audit: type=1400 audit(1739238084.144:31): apparmor="DENIED" operation="open" class="file" profile="/usr/libexec/geoclue" name="/etc/os-release" pid=1312 comm="geoclue" requested_mask="r" denied_mask="r" fsuid=114 ouid=0
[  330.119129] audit: type=1400 audit(1739238084.144:32): apparmor="DENIED" operation="open" class="file" profile="/usr/libexec/geoclue" name="/etc/os-release" pid=1312 comm="geoclue" requested_mask="r" denied_mask="r" fsuid=114 ouid=0
[  338.507237] rfkill: input handler enabled
[  340.228109] rfkill: input handler disabled
[  341.804027] ------------[ cut here ]------------
[  341.804041] UBSAN: misaligned-access in kernel/exit.c:500:2
[  341.804044] member access within misaligned address 000000007ff44757 for type 'struct task_struct'
[  341.804049] which requires 64 byte alignment
[  341.804054] CPU: 6 UID: 117 PID: 830 Comm: gnome-session-b Tainted: G             L     6.13.0-rc7+ #2
[  341.804059] Tainted: [L]=SOFTLOCKUP
[  341.804061] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  341.804065] Stack : 000000000000008e 0000000000000000 900000000023aae8 9000000134d3c000
[  341.804075]         9000000134d3f5f0 9000000134d3f5f8 0000000000000000 9000000134d3f738
[  341.804082]         9000000134d3f730 9000000134d3f730 9000000003f3aae8 382e31343320205b
[  341.804090]         205d313630343038 0000000000000000 747e13a118945c77 900000000b800790
[  341.804096]         0000000000001f35 0000000000000000 0000000000000000 0000000000000000
[  341.804103]         6f4c203a656d616e 0000000000000006 0000000009208000 90000001280db488
[  341.804110]         0000000000000000 0000000000000000 9000000002805d80 9000000134d3f5f8
[  341.804117]         900000000296c000 90000001280db488 0000000000000000 9000000002960000
[  341.804124]         0000000000000000 0000000000000000 900000000023aba4 00007fffecfcae70
[  341.804131]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
[  341.804138]         ...
[  341.804141] Call Trace:
[  341.804143] [<900000000023aba4>] show_stack+0x10c/0x228
[  341.804152] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  341.804158] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  341.804162] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  341.804169] [<90000000002ec914>] mm_update_next_owner+0x114/0x540
[  341.804174] [<90000000002ed2d4>] do_exit+0x594/0x28c0
[  341.804177] [<90000000002efaf0>] do_group_exit+0x70/0x2f8
[  341.804181] [<9000000000321bf0>] get_signal+0x2030/0x2ca8
[  341.804185] [<9000000000240264>] arch_do_signal_or_restart+0x64/0x41c0
[  341.804190] [<90000000024c6b50>] syscall_exit_to_user_mode+0x148/0x220
[  341.804195] [<90000000024c65f8>] do_syscall+0x178/0x3b8

[  341.804204] ---[ end trace ]---
[  343.525531] ------------[ cut here ]------------
[  343.525546] UBSAN: misaligned-access in kernel/signal.c:898:3
[  343.525552] member access within misaligned address 0000000035e3017c for type 'struct task_struct'
[  343.525557] which requires 64 byte alignment
[  343.525562] CPU: 4 UID: 1000 PID: 2301 Comm: zsh Tainted: G             L     6.13.0-rc7+ #2
[  343.525569] Tainted: [L]=SOFTLOCKUP
[  343.525572] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  343.525575] Stack : 000000000000008e 0000000000000000 900000000023aae8 90000001513d0000
[  343.525589]         90000001513d3770 90000001513d3778 0000000000000000 90000001513d38b8
[  343.525599]         90000001513d38b0 90000001513d38b0 9000000003f3aae8 352e33343320205b
[  343.525609]         205d323735353235 0000000000000000 747e13a118945c77 900000000b000790
[  343.525620]         0000000000001f55 0000000000000000 0000000000000000 0000000000000000
[  343.525628]         6f4c203a656d616e 0000000000000006 0000000008a08000 0000000000000000
[  343.525638]         0000000000000000 0000000000000000 9000000002805d80 90000001513d3778
[  343.525649]         900000000296c000 0000000000000011 0000000000000038 900000000296c000
[  343.525658]         90000001281c3038 0000000000000000 900000000023aba4 00005555680a50a8
[  343.525668]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  343.525678]         ...
[  343.525682] Call Trace:
[  343.525685] [<900000000023aba4>] show_stack+0x10c/0x228
[  343.525696] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  343.525704] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  343.525710] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  343.525718] [<90000000003113b4>] prepare_signal+0x944/0xd60
[  343.525725] [<9000000000314140>] __send_signal_locked+0x58/0x1178
[  343.525730] [<900000000031a744>] do_send_sig_info+0xdc/0x428
[  343.525735] [<900000000031b234>] kill_pid_info_type+0x94/0xc8
[  343.525739] [<900000000032393c>] sys_kill+0x28c/0x4a8
[  343.525745] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  343.525757] ---[ end trace ]---
[  352.295259] ------------[ cut here ]------------
[  352.295270] UBSAN: misaligned-access in kernel/cgroup/cgroup.c:3451:4
[  352.295274] member access within misaligned address 0000000045590d24 for type 'struct cgroup'
[  352.295278] which requires 64 byte alignment
[  352.295283] CPU: 4 UID: 0 PID: 1 Comm: systemd Tainted: G             L     6.13.0-rc7+ #2
[  352.295287] Tainted: [L]=SOFTLOCKUP
[  352.295290] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05692-stable2
[  352.295293] Stack : 000000000000008e 0000000000000000 900000000023aae8 900000010025c000
[  352.295303]         900000010025f8f0 900000010025f8f8 0000000000000000 900000010025fa38
[  352.295311]         900000010025fa30 900000010025fa30 9000000003f3aae8 322e32353320205b
[  352.295318]         205d303932353932 0000000000000000 747e13a118945c77 900000000b000790
[  352.295326]         0000000000001f74 0000000000000000 0000000000000000 0000000000000000
[  352.295333]         6f4c203a656d616e 0000000000000006 0000000008a08000 0000000000000000
[  352.295340]         0000000000000000 0000000000000000 9000000002805d80 900000010025f8f8
[  352.295347]         900000000296c000 90000001007b5000 0000000000000000 90000001007b5030
[  352.295354]         0000000000000001 0000000000000000 900000000023aba4 000055555d7508c0
[  352.295362]         00000000000000b0 0000000000000007 0000000000000007 0000000000071c1d
[  352.295369]         ...
[  352.295373] Call Trace:
[  352.295375] [<900000000023aba4>] show_stack+0x10c/0x228
[  352.295385] [<9000000000233dec>] dump_stack_lvl+0x70/0xa0
[  352.295391] [<900000000022f0c4>] ubsan_epilogue+0xc/0x3c
[  352.295395] [<90000000015ed8c4>] __ubsan_handle_type_mismatch_v1+0x10c/0x120
[  352.295401] [<90000000005f7900>] cgroup_subtree_control_write+0x570/0xb50
[  352.295408] [<9000000000f56e70>] kernfs_fop_write_iter+0x1b8/0x578
[  352.295413] [<9000000000cfa820>] vfs_write+0x400/0xeb8
[  352.295419] [<9000000000cfb564>] ksys_write+0x9c/0x1f0
[  352.295424] [<90000000024c659c>] do_syscall+0x11c/0x3b8

[  352.295433] ---[ end trace ]---
