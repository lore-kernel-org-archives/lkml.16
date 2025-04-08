Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5664C2594
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100435; cv=none; b=uufgJCor+NxQ+FfpmyeoL7OvcvMd5LvhsHBIl5n3RnyM453MyA7NBBjSSN9Nmy9MVDIYxzZ2IU7AhU0+EteyAmmeUzn8W+f5Ibf6NXieR4D3mPA5tUb7NXQOp07PaliesvTIrjCVr/Y0Zwz6d/O47AbbDBtFRuJrEtskWIp1XFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100435; c=relaxed/simple;
	bh=6qXyH+nkesJ9/N4zHR1uxnWI0fsV9dFqum8cdixSxMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rB8yo3mDPmKdedB2RiTm/TrUWWVbp0BfkTp4t9dwqsHsSxxu8icM908vwVCQdnkTuuN57ADOvKCvndeM+ZNEQVYwsjOzFwDligZgEztzIYWDWiruZ/NLbl3fA8FTVQ+vj1MRHdsQN1R6+DTpOjWKzZSPim5F7b0RvPZOGtAHoZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=TrCZ4iQ6; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="TrCZ4iQ6"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B1D3F1F91A;
	Tue,  8 Apr 2025 10:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744100422;
	bh=CRg0xbeKSKlckgvaWWdK/uS9y6mHJWw5V2fwD4JUox4=; h=From:To:Subject;
	b=TrCZ4iQ6KR/fxkul55zU3bInRWj+Vl/5UxXHRWF+sOrRjJC3XIbefOZREuW7PH6hQ
	 DgVe0GvfUzXoR1R2nVMGpOaALa0iqkVvjDe6kCAVCcbDgHF69uE5ZosTkS0kYGMPwt
	 0HM5QWn+D8PQiHHQHWsIipvHUo4jmFBGFvKqezhGzXPpZpO3lDqymcZc2nO7jWAroh
	 WA2gdibhOmnGcQfFpfiOUdAE7rXiNBRaYHdlo2NXprvwp90CleHwMkRMr9U0pGmzKD
	 o9SzpDwsX3WGenFpA2q2fp3swbn9OW/8csyY1+fh+MRBLNJzBDmG5sO1IrB+0MSXqT
	 rSceMxQfx3lBQ==
Date: Tue, 8 Apr 2025 10:20:18 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Richard Weinberger <richard@nod.at>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Matthew Wilcox <willy@infradead.org>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Linux 6.15-rc1 regression, folio/ubifs Oops
Message-ID: <20250408082018.GA23886@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello all,
I do have the following regression on single core system using UBIFS,
dual core seems not affected, any idea?

[    1.003798] 8<--- cut here ---
[    1.003843] Unable to handle kernel paging request at virtual address d21af3b8 when read
[    1.003876] [d21af3b8] *pgd=00000000
[    1.003914] Internal error: Oops: 5 [#1] SMP ARM
[    1.023282] Modules linked in:
[    1.026371] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.15.0-rc1-0.0.0-devel #1 PREEMPT
[    1.035110] Hardware name: Freescale i.MX7 Dual (Device Tree)
[    1.040881] PC is at scomp_acomp_comp_decomp+0x138/0x390
[    1.046243] LR is at scomp_acomp_decompress+0x10/0x48
[    1.051336] pc : [<c050aa90>]    lr : [<c050b07c>]    psr: 20000013
[    1.057634] sp : d0825a98  ip : 00000024  fp : c221d780
[    1.062886] r10: 00000576  r9 : d0825af0  r8 : c204e030
[    1.068137] r7 : cfdaf3b8  r6 : cfdaf3b8  r5 : c27b2540  r4 : cfd5b1e8
[    1.074694] r3 : 02400000  r2 : 00001000  r1 : d0b01000  r0 : 00000000
[    1.081251] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    1.088419] Control: 10c5387d  Table: 8000406a  DAC: 00000051
[    1.094189] Register r0 information: NULL pointer
[    1.098929] Register r1 information: 16-page vmalloc region starting at 0xd0b01000 allocated at crypto_scomp_init_tfm+0x8c/0x180
[    1.110556] Register r2 information: non-paged memory
[    1.115641] Register r3 information: non-paged memory
[    1.120726] Register r4 information: non-slab/vmalloc memory
[    1.126421] Register r5 information: slab kmalloc-192 start c27b2540 pointer offset 0 size 192
[    1.135112] Register r6 information: non-slab/vmalloc memory
[    1.140806] Register r7 information: non-slab/vmalloc memory
[    1.146500] Register r8 information: slab kmalloc-8k start c204e000 pointer offset 48 size 8192
[    1.155280] Register r9 information: 2-page vmalloc region starting at 0xd0824000 allocated at kernel_clone+0xa4/0x33c
[    1.166043] Register r10 information: non-paged memory
[    1.171219] Register r11 information: slab kmalloc-64 start c221d780 pointer offset 0 size 64
[    1.179827] Register r12 information: non-paged memory
[    1.185003] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
[    1.191043] Stack: (0xd0825a98 to 0xd0826000)
[    1.195431] 5a80:                                                       00000004 c07edfcc
[    1.203650] 5aa0: 00000000 00000000 00001000 c7d16f8f 04070598 c27b2540 c27b2540 c28b0000
[    1.211870] 5ac0: d0825c94 c0dc7064 d0825af0 c204e030 d0825c94 c050b07c c27b2540 00000576
[    1.220089] 5ae0: c28b0000 c04d40b8 00000000 c07ebbd0 00000000 00000000 d0825af8 d0825af8
[    1.228308] 5b00: 00000000 c7d16f8f c28b0000 c117b6d0 00000000 c204e030 cfdaf3b8 c43f7080
[    1.236527] 5b20: d0825b40 c04d47e0 d0825c94 c0dc7064 00000576 c2213cc0 0000f598 000005a6
[    1.244745] 5b40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.252963] 5b60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.261182] 5b80: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.269400] 5ba0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.277618] 5bc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.285837] 5be0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.294056] 5c00: c28b0000 c04c5e54 00000001 00000000 00000001 c289eb00 000009e4 20000000
[    1.302275] 5c20: 00000000 000002b0 0000f598 000005a6 c204e000 c7d16f8f cfd5fec0 00000000
[    1.310494] 5c40: 00000000 cfdaf3b8 00000000 00000000 c43f7080 c204e000 00001000 c04b58b4
[    1.318713] 5c60: 00000000 d0825c94 00000001 c7d16f8f d0825d50 c7d16f8f 00040cc0 00000016
[    1.326932] 5c80: c28b0000 00000000 00015600 c2068000 cfdaf3b8 00001000 000009e4 20000000
[    1.335151] 5ca0: 00000001 c7d16f8f 0eced000 cfdaf3b8 c28b0000 00000000 c27fc0c0 c43f7080
[    1.343370] 5cc0: 00000000 c43f7180 c27fc0c0 c04b60e4 00000000 ffffffff 00000000 c02a0430
[    1.351590] 5ce0: 00000cc0 00000001 ffffc005 00000001 d0825d50 00000000 c2068000 c7d16f8f
[    1.359809] 5d00: c43f7184 cfdaf3b8 00000000 c2068000 c27fc0c0 c43f7180 c2068000 c43f7180
[    1.368028] 5d20: c27fc0c0 c029e91c 00000000 c02ae4d8 00000000 00000000 c2068000 c43f7180
[    1.376247] 5d40: c27fc0c0 c7d16f8f d0825d50 d0825ef0 00000000 d0825e14 cfdaf3b8 c43f7180
[    1.384466] 5d60: c2068000 c43f7180 c27fc0c0 c02a0c5c 0eced000 00000000 00000001 00000000
[    1.392685] 5d80: c43f7190 00000000 00000100 c2068000 00000001 c2014800 c27fc0c0 c43f7180
[    1.400904] 5da0: c27fc120 00000000 00000000 00000000 00000000 00000000 000001ff c7d16f8f
[    1.409123] 5dc0: c2952fb8 00000000 d0825ed8 c43f7080 00000000 00000000 ffffffff ffffffff
[    1.417342] 5de0: d0825ef0 c02a10f4 00000000 d0825ed8 c289f000 beffffd4 00050003 c43f7080
[    1.425561] 5e00: cfdaf3dc c02d4c24 c43f7180 c27fc0c0 cfde4694 00000000 00000000 00000000
[    1.433779] 5e20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.441997] 5e40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.450215] 5e60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.458433] 5e80: 00000000 00000000 00000000 00000000 00000000 c7d16f8f 00000000 00000000
[    1.466653] 5ea0: c27fc0c0 d0825f48 00000100 00000000 00000000 00000006 c2864a58 c0329db8
[    1.474871] 5ec0: 00000100 00000001 00000000 00050001 c2864a58 00000100 00000003 00000000
[    1.483090] 5ee0: d0825ed0 00000100 00000001 00000000 c27fc0c0 00000000 00000000 00000000
[    1.491308] 5f00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 c7d16f8f
[    1.499527] 5f20: 00000000 c2864a00 00000000 00000001 c2068000 c11ed360 00000000 c0332988
[    1.507745] 5f40: 00000000 00000001 00000000 00000000 c2068000 c7d16f8f 00000000 c2864a00
[    1.515964] 5f60: c20e0000 c1108094 00000000 00000000 00000000 00000000 00000000 c0333de0
[    1.524183] 5f80: c11bd000 c0d8c568 00000000 00000000 00000000 c0101364 c11bd000 c0b40a68
[    1.532401] 5fa0: 00000000 c0b40b4c 00000000 c010014c 00000000 00000000 00000000 00000000
[    1.540620] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.548838] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    1.557050] Call trace:
[    1.557069]  scomp_acomp_comp_decomp from scomp_acomp_decompress+0x10/0x48
[    1.566549]  scomp_acomp_decompress from ubifs_decompress_req+0xa8/0x148
[    1.573313]  ubifs_decompress_req from ubifs_decompress_folio+0xdc/0x20c
[    1.580065]  ubifs_decompress_folio from do_readpage+0x1e0/0x4b0
[    1.586116]  do_readpage from ubifs_read_folio+0x4c/0x4d8
[    1.591557]  ubifs_read_folio from filemap_read_folio+0x30/0x1fc
[    1.597612]  filemap_read_folio from filemap_get_pages+0x534/0x8ac
[    1.603841]  filemap_get_pages from filemap_read+0x120/0x504
[    1.609546]  filemap_read from __kernel_read+0x164/0x2f4
[    1.614907]  __kernel_read from bprm_execve+0x194/0x3f4
[    1.620180]  bprm_execve from kernel_execve+0x114/0x19c
[    1.625450]  kernel_execve from try_to_run_init_process+0xc/0x38
[    1.631505]  try_to_run_init_process from kernel_init+0xe4/0x134
[    1.637565]  kernel_init from ret_from_fork+0x14/0x28
[    1.642663] Exception stack(0xd0825fb0 to 0xd0825ff8)
[    1.647747] 5fa0:                                     00000000 00000000 00000000 00000000
[    1.655966] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    1.664183] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    1.670835] Code: e1a03623 e0833622 e026609c e003039c (e7963003)
[    1.676964] ---[ end trace 0000000000000000 ]---
[    1.681608] note: swapper/0[1] exited with irqs disabled
[    1.681787] random: crng init done
[    1.691090] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    1.698805] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---


and

[    1.756634] 8<--- cut here ---
[    1.756725] Unable to handle kernel paging request at virtual address d21af3b8 when read
[    1.756785] [d21af3b8] *pgd=00000000
[    1.756846] Internal error: Oops: 5 [#1] SMP ARM
[    1.776263] Modules linked in:
[    1.779379] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.15.0-rc1-0.0.0-devel #1 PREEMPT
[    1.788152] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[    1.794377] PC is at scomp_acomp_comp_decomp+0x138/0x390
[    1.799774] LR is at scomp_acomp_decompress+0x10/0x48
[    1.804894] pc : [<c050aa90>]    lr : [<c050b07c>]    psr: 20000113
[    1.811209] sp : d0845a98  ip : 00000024  fp : c25b3c00
[    1.816482] r10: 00000576  r9 : d0845af0  r8 : c29f8030
[    1.821753] r7 : cfdaf3b8  r6 : cfdaf3b8  r5 : c282b000  r4 : cfd611e8
[    1.828331] r3 : 02400000  r2 : 00001000  r1 : d0a0b000  r0 : 00000000
[    1.834912] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    1.842108] Control: 10c5387d  Table: 8000406a  DAC: 00000051
[    1.847898] Register r0 information: NULL pointer
[    1.852667] Register r1 information: 16-page vmalloc region starting at 0xd0a0b000 allocated at crypto_scomp_init_tfm+0x8c/0x180
[    1.864346] Register r2 information: non-paged memory
[    1.869455] Register r3 information: non-paged memory
[    1.874567] Register r4 information: non-slab/vmalloc memory
[    1.880295] Register r5 information: slab kmalloc-192 start c282b000 pointer offset 0 size 192
[    1.889039] Register r6 information: non-slab/vmalloc memory
[    1.894758] Register r7 information: non-slab/vmalloc memory
[    1.900474] Register r8 information: slab kmalloc-8k start c29f8000 pointer offset 48 size 8192
[    1.909307] Register r9 information: 2-page vmalloc region starting at 0xd0844000 allocated at kernel_clone+0xa4/0x33c
[    1.920122] Register r10 information: non-paged memory
[    1.925331] Register r11 information: slab kmalloc-64 start c25b3c00 pointer offset 0 size 64
[    1.933993] Register r12 information: non-paged memory
[    1.939194] Process swapper/0 (pid: 1, stack limit = 0xfed1cb98)
[    1.945266] Stack: (0xd0845a98 to 0xd0846000)
[    1.949681] 5a80:                                                       00000004 c07edfcc
[    1.957931] 5aa0: 00000000 00000000 00001000 8eb8c4e6 0804c838 c282b000 c282b000 c24ef000
[    1.966182] 5ac0: d0845c94 c0dc7064 d0845af0 c29f8030 d0845c94 c050b07c c282b000 00000576
[    1.974428] 5ae0: c24ef000 c04d40b8 00000000 c07ebbd0 00000000 00000000 d0845af8 d0845af8
[    1.982676] 5b00: 00000000 8eb8c4e6 c24ef000 c117b6d0 00000000 c29f8030 cfdaf3b8 c4437080
[    1.990922] 5b20: d0845b40 c04d47e0 d0845c94 c0dc7064 00000576 c2520a80 0000b838 000005a6
[    1.999167] 5b40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.007411] 5b60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.015655] 5b80: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.023902] 5ba0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.032149] 5bc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.040395] 5be0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.048642] 5c00: c24ef000 c04c5e54 00000001 00000000 00000001 c286e300 000009e6 20000000
[    2.056888] 5c20: 00000000 000002b0 0000b838 000005a6 c29f8000 8eb8c4e6 cfd65e00 00000000
[    2.065134] 5c40: 00000000 cfdaf3b8 00000000 00000000 c4437080 c29f8000 00001000 c04b58b4
[    2.073380] 5c60: 00000000 d0845c94 00000001 8eb8c4e6 d0845d50 8eb8c4e6 00040cc0 00000016
[    2.081629] 5c80: c24ef000 00000000 00015600 c2058000 cfdaf3b8 00001000 000009e6 20000000
[    2.089876] 5ca0: 00000001 8eb8c4e6 0ecf3000 cfdaf3b8 c24ef000 00000000 c254c0c0 c4437080
[    2.098125] 5cc0: 00000000 c4437180 c254c0c0 c04b60e4 00000000 ffffffff 00000000 c02a0430
[    2.106371] 5ce0: 00000cc0 00000001 ffffc005 00000001 d0845d50 00000000 c2058000 8eb8c4e6
[    2.114619] 5d00: c4437184 cfdaf3b8 00000000 c2058000 c254c0c0 c4437180 c2058000 c4437180
[    2.122865] 5d20: c254c0c0 c029e91c 00000000 c02ae4d8 00000000 00000000 c2058000 c4437180
[    2.131112] 5d40: c254c0c0 8eb8c4e6 d0845d50 d0845ef0 00000000 d0845e14 cfdaf3b8 c4437180
[    2.139358] 5d60: c2058000 c4437180 c254c0c0 c02a0c5c 0ecf3000 00000000 00000001 00000000
[    2.147603] 5d80: c4437190 00000000 00000100 c2058000 00000001 c2050000 c254c0c0 c4437180
[    2.155851] 5da0: c254c120 00000000 00000000 00000000 00000000 00000000 000001ff 8eb8c4e6
[    2.164096] 5dc0: c29e6fb8 00000000 d0845ed8 c4437080 00000000 00000000 ffffffff ffffffff
[    2.172345] 5de0: d0845ef0 c02a10f4 00000000 d0845ed8 c286f000 beffffd4 00050003 c4437080
[    2.180591] 5e00: cfdaf3dc c02d4c24 c4437180 c254c0c0 cfde3fd4 00000000 00000000 00000000
[    2.188835] 5e20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.197082] 5e40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.205330] 5e60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.213579] 5e80: 00000000 00000000 00000000 00000000 00000000 8eb8c4e6 00000000 00000000
[    2.221827] 5ea0: c254c0c0 d0845f48 00000100 00000000 00000000 00000006 c27e2a58 c0329db8
[    2.230079] 5ec0: 00000100 00000001 00000000 00050001 c27e2a58 00000100 00000003 00000000
[    2.238328] 5ee0: d0845ed0 00000100 00000001 00000000 c254c0c0 00000000 00000000 00000000
[    2.246578] 5f00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 8eb8c4e6
[    2.254825] 5f20: 00000000 c27e2a00 00000000 00000001 c2058000 c11ed360 00000000 c0332988
[    2.263072] 5f40: 00000000 00000001 00000000 00000000 c2058000 8eb8c4e6 00000000 c27e2a00
[    2.271317] 5f60: c20c8000 c1108094 00000000 00000000 00000000 00000000 00000000 c0333de0
[    2.279565] 5f80: c11bd000 c0d8c568 00000000 00000000 00000000 c0101364 c11bd000 c0b40a68
[    2.287811] 5fa0: 00000000 c0b40b4c 00000000 c010014c 00000000 00000000 00000000 00000000
[    2.296059] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.304309] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    2.312545] Call trace:
[    2.312574]  scomp_acomp_comp_decomp from scomp_acomp_decompress+0x10/0x48
[    2.322115]  scomp_acomp_decompress from ubifs_decompress_req+0xa8/0x148
[    2.328928]  ubifs_decompress_req from ubifs_decompress_folio+0xdc/0x20c
[    2.335717]  ubifs_decompress_folio from do_readpage+0x1e0/0x4b0
[    2.341800]  do_readpage from ubifs_read_folio+0x4c/0x4d8
[    2.347269]  ubifs_read_folio from filemap_read_folio+0x30/0x1fc
[    2.353358]  filemap_read_folio from filemap_get_pages+0x534/0x8ac
[    2.359620]  filemap_get_pages from filemap_read+0x120/0x504
[    2.365361]  filemap_read from __kernel_read+0x164/0x2f4
[    2.370759]  __kernel_read from bprm_execve+0x194/0x3f4
[    2.376066]  bprm_execve from kernel_execve+0x114/0x19c
[    2.381367]  kernel_execve from try_to_run_init_process+0xc/0x38
[    2.387457]  try_to_run_init_process from kernel_init+0xe4/0x134
[    2.393560]  kernel_init from ret_from_fork+0x14/0x28
[    2.398690] Exception stack(0xd0845fb0 to 0xd0845ff8)
[    2.403802] 5fa0:                                     00000000 00000000 00000000 00000000
[    2.412053] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.420296] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.426975] Code: e1a03623 e0833622 e026609c e003039c (e7963003)
[    2.433133] ---[ end trace 0000000000000000 ]---
[    2.437800] note: swapper/0[1] exited with irqs disabled
[    2.443744] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    2.451527] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---


Francesco

