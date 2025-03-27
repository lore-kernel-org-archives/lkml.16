Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D941119A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743037671; cv=none; b=SlxjiOkUcClJ1Q3DLtJMsoItk+L+lO64b8T5basX55FuiANLTdpj93mxA8E3qJaUlifPnu1h26XYKd7Bt8C2r/5AVpfBhh3LykwWZ1MLTWS03moASfWu/nxPYRE+0pTViq/QmA5+/g8TdrcJ9g4dFxciepsTc9HTvLSk/PpxmU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743037671; c=relaxed/simple;
	bh=pb0p0tI/0z3tkEyMAueafoBWWLa1UUcL60UfClUhbPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0lY3xiE+iMQIY0LF6I4sLaPxtY1UrCLwJVc/UWzOOF2vPs/cyHBB51L8Mg3MiOwO/WBetVp+1bNn0bk5u3P1hVw/OiW7AuVyM5p/JHLsGB99aIcsOmORzyyKo3tVuwzKb+rNOrfi4+XP3rmnMwymFrTPaJI5c08mMIyw+ROTKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9oYUkft; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9oYUkft"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9659C4CEE2;
	Thu, 27 Mar 2025 01:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743037671;
	bh=pb0p0tI/0z3tkEyMAueafoBWWLa1UUcL60UfClUhbPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g9oYUkftrjLq+E4Sf0YVUz0VCoPDG0umb+rMhsdLAl0lyDRRgCrrYeJWb8Lwao4sF
	 oytKFzGN8AJFsws2ut8/3WWtfH9xTJN3eYzgGrcybES61u0T4+gw4T/9JZW+CAHS3X
	 KX6q/iZD2YBHlS+EwZa1MmcfiVmTbNNciw7uhTR3PEo6GNm9XB6GLuZRWjR97LZLFB
	 3zFhrbtlCn31otBUEOTeVF1e402l3wQnPhPpArv8l750c3JstJOKVjHdJ3TyJLRXfu
	 9QQyRcxByTlFtOcU0mdu/kRFvZloJrmyeJTnmpPQhjQ5T99W4N7bkBVnoyYWCmOgYp
	 60sgjWoqGvZ3A==
Date: Wed, 26 Mar 2025 21:07:47 -0400
From: Sasha Levin <sashal@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [GIT pull] irq/urgent for v6.15-rc1
Message-ID: <Z-Sk41xJ-JIkoZt8@lappy>
References: <174301605628.1660948.615494869949872320.tglx@xen13.tec.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <174301605628.1660948.615494869949872320.tglx@xen13.tec.linutronix.de>

On Wed, Mar 26, 2025 at 08:08:16PM +0100, Thomas Gleixner wrote:
>Thomas Gleixner (1):
>      PCI/MSI: Handle the NOMASK flag correctly for all PCI/MSI backends

Hi Thomas,

I haven't bisected this, but I suspect that this commit is causing
boot-time panics that are observed on LKFT. Note the line numbers are
off by a bit.

Full logs of the run are available at:
https://qa-reports.linaro.org/lkft/sashal-linus-next/build/v6.13-rc7-16083-gc13edfd29c29/testrun/27775255/suite/log-parser-test/test/bug-bug-kernel-null-pointer-dereference-address/details/

<1>[    1.540630] BUG: kernel NULL pointer dereference, address: 0000000000000002
<1>[    1.540630] #PF: supervisor read access in kernel mode
<1>[    1.540630] #PF: error_code(0x0000) - not-present page
<6>[    1.540630] PGD 0 P4D 0
<4>[    1.540630] Oops: Oops: 0000 [#1] SMP PTI
<4>[    1.540630] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0 #1 PREEMPT(voluntary)
<4>[    1.540630] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
<4>[ 1.540630] RIP: 0010:__pci_enable_msi_range (drivers/pci/msi/msi.c:300 drivers/pci/msi/msi.c:342 drivers/pci/msi/msi.c:412 drivers/pci/msi/msi.c:463)
<4>[ 1.540630] Code: ff ff ff e8 4e 18 fe ff f6 83 9f 06 00 00 10 0f b7 85 66 ff ff ff 74 0c 0d 00 01 00 00 66 89 85 66 ff ff ff 8b 8d 60 ff ff ff <41> f6 47 02 40 74 0c 25 ff fe 00 00 66 89 85 66 ff ff ff 89 8d 6c
All code
========
    0:	ff                   	(bad)
    1:	ff                   	(bad)
    2:	ff                   	(bad)
    3:	e8 4e 18 fe ff       	call   0xfffffffffffe1856
    8:	f6 83 9f 06 00 00 10 	testb  $0x10,0x69f(%rbx)
    f:	0f b7 85 66 ff ff ff 	movzwl -0x9a(%rbp),%eax
   16:	74 0c                	je     0x24
   18:	0d 00 01 00 00       	or     $0x100,%eax
   1d:	66 89 85 66 ff ff ff 	mov    %ax,-0x9a(%rbp)
   24:	8b 8d 60 ff ff ff    	mov    -0xa0(%rbp),%ecx
   2a:*	41 f6 47 02 40       	testb  $0x40,0x2(%r15)		<-- trapping instruction
   2f:	74 0c                	je     0x3d
   31:	25 ff fe 00 00       	and    $0xfeff,%eax
   36:	66 89 85 66 ff ff ff 	mov    %ax,-0x9a(%rbp)
   3d:	89                   	.byte 0x89
   3e:	8d                   	.byte 0x8d
   3f:	6c                   	insb   (%dx),%es:(%rdi)

Code starting with the faulting instruction
===========================================
    0:	41 f6 47 02 40       	testb  $0x40,0x2(%r15)
    5:	74 0c                	je     0x13
    7:	25 ff fe 00 00       	and    $0xfeff,%eax
    c:	66 89 85 66 ff ff ff 	mov    %ax,-0x9a(%rbp)
   13:	89                   	.byte 0x89
   14:	8d                   	.byte 0x8d
   15:	6c                   	insb   (%dx),%es:(%rdi)
<4>[    1.540630] RSP: 0000:ffffa0df00013748 EFLAGS: 00010246
<4>[    1.540630] RAX: 0000000000000080 RBX: ffff932e00981000 RCX: 0000000000000001
<4>[    1.540630] RDX: 0000000000000000 RSI: 0000000000000286 RDI: ffffffff85e6e74c
<4>[    1.540630] RBP: ffffa0df00013820 R08: 0000000000000002 R09: ffffa0df00013714
<4>[    1.540630] R10: 0000000000000001 R11: ffffffff84ef46c0 R12: ffff932e009810c0
<4>[    1.540630] R13: 0000000000000001 R14: ffff932e00981000 R15: 0000000000000000
<4>[    1.540630] FS:  0000000000000000(0000) GS:ffff932ef5f71000(0000) knlGS:0000000000000000
<4>[    1.540630] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[    1.540630] CR2: 0000000000000002 CR3: 0000000020a2e000 CR4: 00000000000006f0
<4>[    1.540630] Call Trace:
<4>[    1.540630]  <TASK>
<4>[ 1.540630] pci_alloc_irq_vectors_affinity (drivers/pci/msi/api.c:?)
<4>[ 1.540630] pci_alloc_irq_vectors (drivers/pci/msi/api.c:235)
<4>[ 1.540630] ahci_init_irq (drivers/ata/ahci.c:1720)
<4>[ 1.540630] ahci_init_one (drivers/ata/ahci.c:2004)
<4>[ 1.540630] pci_device_probe (drivers/pci/pci-driver.c:325 drivers/pci/pci-driver.c:392 drivers/pci/pci-driver.c:417 drivers/pci/pci-driver.c:451)
<4>[ 1.540630] really_probe (drivers/base/dd.c:?)
<4>[ 1.540630] __driver_probe_device (drivers/base/dd.c:?)
<4>[ 1.540630] driver_probe_device (drivers/base/dd.c:830)
<4>[ 1.540630] __driver_attach (drivers/base/dd.c:1217)
<4>[ 1.540630] bus_for_each_dev (drivers/base/bus.c:369)
<4>[ 1.540630] driver_attach (drivers/base/dd.c:1234)
<4>[ 1.540630] bus_add_driver (drivers/base/bus.c:678)
<4>[ 1.540630] driver_register (drivers/base/driver.c:250)
<4>[ 1.540630] __pci_register_driver (drivers/pci/pci-driver.c:1448)
<4>[ 1.540630] ahci_pci_driver_init (drivers/ata/ahci.c:2090)
<4>[ 1.540630] do_one_initcall (init/main.c:1257)
<4>[ 1.540630] do_initcall_level (init/main.c:1318)
<4>[ 1.540630] do_initcalls (init/main.c:1332)
<4>[ 1.540630] do_basic_setup (init/main.c:1355)
<4>[ 1.540630] kernel_init_freeable (init/main.c:1571)
<4>[ 1.540630] kernel_init (init/main.c:1459)
<4>[ 1.540630] ret_from_fork (arch/x86/kernel/process.c:159)
<4>[ 1.540630] ret_from_fork_asm (arch/x86/entry/entry_64.S:258)
<4>[    1.540630]  </TASK>
<4>[    1.540630] Modules linked in:
<4>[    1.540630] CR2: 0000000000000002
<4>[    1.540630] ---[ end trace 0000000000000000 ]---
<4>[ 1.540630] RIP: 0010:__pci_enable_msi_range (drivers/pci/msi/msi.c:300 drivers/pci/msi/msi.c:342 drivers/pci/msi/msi.c:412 drivers/pci/msi/msi.c:463)
<4>[ 1.540630] Code: ff ff ff e8 4e 18 fe ff f6 83 9f 06 00 00 10 0f b7 85 66 ff ff ff 74 0c 0d 00 01 00 00 66 89 85 66 ff ff ff 8b 8d 60 ff ff ff <41> f6 47 02 40 74 0c 25 ff fe 00 00 66 89 85 66 ff ff ff 89 8d 6c
All code
========
    0:	ff                   	(bad)
    1:	ff                   	(bad)
    2:	ff                   	(bad)
    3:	e8 4e 18 fe ff       	call   0xfffffffffffe1856
    8:	f6 83 9f 06 00 00 10 	testb  $0x10,0x69f(%rbx)
    f:	0f b7 85 66 ff ff ff 	movzwl -0x9a(%rbp),%eax
   16:	74 0c                	je     0x24
   18:	0d 00 01 00 00       	or     $0x100,%eax
   1d:	66 89 85 66 ff ff ff 	mov    %ax,-0x9a(%rbp)
   24:	8b 8d 60 ff ff ff    	mov    -0xa0(%rbp),%ecx
   2a:*	41 f6 47 02 40       	testb  $0x40,0x2(%r15)		<-- trapping instruction
   2f:	74 0c                	je     0x3d
   31:	25 ff fe 00 00       	and    $0xfeff,%eax
   36:	66 89 85 66 ff ff ff 	mov    %ax,-0x9a(%rbp)
   3d:	89                   	.byte 0x89
   3e:	8d                   	.byte 0x8d
   3f:	6c                   	insb   (%dx),%es:(%rdi)

Code starting with the faulting instruction
===========================================
    0:	41 f6 47 02 40       	testb  $0x40,0x2(%r15)
    5:	74 0c                	je     0x13
    7:	25 ff fe 00 00       	and    $0xfeff,%eax
    c:	66 89 85 66 ff ff ff 	mov    %ax,-0x9a(%rbp)
   13:	89                   	.byte 0x89
   14:	8d                   	.byte 0x8d
   15:	6c                   	insb   (%dx),%es:(%rdi)
<4>[    1.540630] RSP: 0000:ffffa0df00013748 EFLAGS: 00010246
<4>[    1.540630] RAX: 0000000000000080 RBX: ffff932e00981000 RCX: 0000000000000001
<4>[    1.540630] RDX: 0000000000000000 RSI: 0000000000000286 RDI: ffffffff85e6e74c
<4>[    1.540630] RBP: ffffa0df00013820 R08: 0000000000000002 R09: ffffa0df00013714
<4>[    1.540630] R10: 0000000000000001 R11: ffffffff84ef46c0 R12: ffff932e009810c0
<4>[    1.540630] R13: 0000000000000001 R14: ffff932e00981000 R15: 0000000000000000
<4>[    1.540630] FS:  0000000000000000(0000) GS:ffff932ef5f71000(0000) knlGS:0000000000000000
<4>[    1.540630] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[    1.540630] CR2: 0000000000000002 CR3: 0000000020a2e000 CR4: 00000000000006f0
<6>[    1.540630] note: swapper/0[1] exited with irqs disabled
<0>[    1.574039] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009
<0>[    1.574664] Kernel Offset: 0x2c00000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
<0>[    1.574664] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009 ]---


-- 
Thanks,
Sasha
