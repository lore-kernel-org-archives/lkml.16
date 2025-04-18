Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110FD84A3E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744992339; cv=none; b=RxgutW8351Ml/Zd5PtKD9LZ62H8uCpeaiQX9sxXmXcDbp37CWNDLaqkmb7eI65lJRD3zHW00B8I1kGdIlQiwacpmfE3yz40hQIHqXckectNksHhxn9MJxAnb/7fOmbgyZJX7OpYqCd2EsqbXKLuEqW5awlYTQ2bPwcUTBt6Ikb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744992339; c=relaxed/simple;
	bh=VoFXeUt+leKSEng+lR8gyHNC/rJv57xOZiXf+Iqnus8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lf+jg/SarfMNhCXNrMlGM8Jm62d0AkVobY2Z9t/jnWDN/L0ILsdHPlguXItEUhuU6MCOtREwe9iv2R/VYtSWMajnUO6hvZMje66uSLDb/6Zap3mCMgDxm17rcpMCJ94E3F0ZtcKsD5bonjDh7jJgr0gWDdUuB9rFIqlYMf/hmbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=UNYhY/dp; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="UNYhY/dp"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 81C1640E0244;
	Fri, 18 Apr 2025 16:05:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Mydeu0Fa_b-m; Fri, 18 Apr 2025 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744992328; bh=rtcA14FJI7XVgnpgzzUhiR2Ab18gO0adqRUjz0JxiHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UNYhY/dpCCdz1SCc2MENgHFNJ4N7jjPjfnQiPRiFLp8e7+MMTnfoBu/OwpH/ipGaD
	 Kv2GDgRVpdKnESz5Hoj16FB+BdFmCEU9raoxT0ddSKsA8SljTKrpFwUuMmdoeGJiLX
	 tFrtMVbcxvbykzJr4RTlBwl0+gNK5Lw9mfra6hdlCn1wuwtIfRiK/7ST+G0X//PjVE
	 KLda/ZznERSmPpWUPyJbxFdWP8Ha1+sIrPFzqP/Lqt6UQA1LSzQcKPS0gGffrdzCnt
	 /SgkCK/ePZVHqB/nPd+DXp16emdHkMQvmiO8oZzxpqG+1c6MV2BiTKzMNTo3e7ebE+
	 un4zsBNIm+4RcQW3pKu0rhwzkSQRSIADQNV+lbCVyT2VNSiR1yFRdo/5myVlVlVzSJ
	 KbdUAv+Ena4xH6C2honv1BemEn8A30vu3Vp04loL+3Xm7Ql5qpiNP5oXUSDGdfHqGy
	 DDAPZ/BGNwxmBgifTytTAVcr7PwO40RwSAan6kqWUtdRwnq/DLr9G2h790Rwlb4ANg
	 ZVu2N2PkXz1AZJVQcZY/OypWctVsvPzPeJp04G3+J0Obz7pgL8GUA9VaQtVLpUxCG5
	 gagF/YYE6jbX+SSti5yE8itU9Wbe9qbDcBIfNnIt3gRq20c25OmMk9JEZusRQqD5Mh
	 vSjkOWHYJnbiL05l9bTn4sSM=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CF70540E0200;
	Fri, 18 Apr 2025 16:05:21 +0000 (UTC)
Date: Fri, 18 Apr 2025 18:05:15 +0200
From: Borislav Petkov <bp@alien8.de>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>, x86-ml <x86@kernel.org>
Subject: Re: Kernel 6.15-rc2 unable to boot on 32bit x86 with PAE
Message-ID: <20250418160515.GAaAJ4O2HnktVgmZ1v@fat_crate.local>
References: <4599013d-bc74-4f81-9db7-070806ea9162@gmx.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4599013d-bc74-4f81-9db7-070806ea9162@gmx.com>

On Fri, Apr 18, 2025 at 08:31:23PM +0930, Qu Wenruo wrote:
> Hi,
> 
> Recently I'm testing a situation where highmem is involved, thus I'm
> building the latest 32bit x86 with HIGHMEM and PAE, and run it inside a qemu
> VM.

Does that fix it:

https://git.kernel.org/tip/1e07b9fad022e0e02215150ca1e20912e78e8ec1

?

Leaving in the rest for reference.

> However the kernel just fails to boot with very early memory management
> crash:
> 
> [    0.064551] Built 1 zonelists, mobility grouping on.  Total pages: 786297
> [    0.065269] allocated 4198396 bytes of page_ext
> [    0.065856] mem auto-init: stack:off, heap alloc:on, heap free:off
> [    0.070213] BUG: Bad page state in process swapper  pfn:100001
> [    0.070773] page: refcount:0 mapcount:1 mapping:(ptrval) index:0x0
> pfn:0x100001
> [    0.071451] aops:0x0 ino:850fc085 invalid dentry:2cc54702
> [    0.071962] BUG: kernel NULL pointer dereference, address: 00000400
> [    0.072609] #PF: supervisor read access in kernel mode
> [    0.073135] #PF: error_code(0x0000) - not-present page
> [    0.073621] *pdpt = 0000000000000000 *pde = f000ff53f000ff53
> [    0.074269] Oops: Oops: 0000 [#1] SMP NOPTI
> [    0.074666] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted
> 6.15.0-rc2-custom+ #5 PREEMPT(undef)
> a4004de2bdc11241c6afe44ab7f6bd7d8e98e3db
> [    0.075828] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> Arch Linux 1.16.3-1-1 04/01/2014
> [    0.076706] EIP: get_pfnblock_flags_mask+0x40/0x50
> [    0.077160] Code: 03 00 00 8b 8e 48 14 33 d7 8b 96 44 14 33 d7 81 e1 00
> fe ff ff 29 c8 c1 e8 09 8d 0c 85 00 00 00 00 c1 e8 03 8d 04 82 83 e1 1f <8b>
> 00 d3 e8 21 d8 5b 5e 5d 31 d2 31 c9 c3 66 90 e8 e3 bf d6 ff 55
> [    0.078954] EAX: 00000400 EBX: 00000007 ECX: 00000000 EDX: 00000000
> [    0.079567] ESI: 00000a80 EDI: d70ebce5 EBP: d71fdd80 ESP: d71fdd78
> [    0.080156] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210046
> [    0.080796] CR0: 80050033 CR2: 00000400 CR3: 1749a000 CR4: 000000b0
> [    0.081378] Call Trace:
> [    0.081602]  __dump_page.cold+0x11d/0x23f
> [    0.081977]  ? prb_read_valid+0x29/0x40
> [    0.082334]  ? console_unlock+0x56/0x100
> [    0.082701]  ? console_unlock+0x56/0x100
> [    0.083070]  ? vprintk_emit+0x2d2/0x390
> [    0.083458]  ? vprintk_default+0x15/0x20
> [    0.083826]  dump_page+0x1b/0x30
> [    0.084127]  ? dump_page+0x1b/0x30
> [    0.084447]  bad_page.cold+0x62/0x84
> [    0.084796]  free_tail_page_prepare+0x134/0x190
> [    0.085232]  __free_pages_ok+0x318/0x3c0
> [    0.085607]  __free_pages_core+0x4e/0x58
> [    0.085982]  memblock_free_pages+0x11/0x34
> [    0.086378]  memblock_free_all+0x149/0x1b4
> [    0.086766]  mm_core_init+0x103/0x158
> [    0.087121]  start_kernel+0x5d2/0x7f8
> [    0.087462]  ? load_ucode_bsp+0x53/0xdc
> [    0.087832]  i386_start_kernel+0x64/0x64
> [    0.088195]  startup_32_smp+0x151/0x154
> [    0.088561] Modules linked in:
> [    0.088865] CR2: 0000000000000400
> [    0.089185] ---[ end trace 0000000000000000 ]---
> [    0.089624] EIP: get_pfnblock_flags_mask+0x40/0x50
> [    0.090093] Code: 03 00 00 8b 8e 48 14 33 d7 8b 96 44 14 33 d7 81 e1 00
> fe ff ff 29 c8 c1 e8 09 8d 0c 85 00 00 00 00 c1 e8 03 8d 04 82 83 e1 1f <8b>
> 00 d3 e8 21 d8 5b 5e 5d 31 d2 31 c9 c3 66 90 e8 e3 bf d6 ff 55
> [    0.091910] EAX: 00000400 EBX: 00000007 ECX: 00000000 EDX: 00000000
> [    0.092505] ESI: 00000a80 EDI: d70ebce5 EBP: d71fdd80 ESP: d71fdd78
> [    0.093111] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210046
> [    0.093788] CR0: 80050033 CR2: 00000400 CR3: 1749a000 CR4: 000000b0
> [    0.094415] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.095097] ---[ end Kernel panic - not syncing: Attempted to kill the
> idle task! ]---
> 
> The full dmesg is attached (boot.txt).
> 
> The crash only happens with PAE enabled. If only HIGHMEM enabled but no PAE,
> the kernel boots without any problem.
> 
> Thanks,
> Qu

> [    0.000000] Linux version 6.15.0-rc2-custom+ (adam@arch32) (gcc (GCC) 14.1.1 20240507, GNU ld (GNU Binutils) 2.43.1) #5 SMP PREEMPT_DYNAMIC Fri Apr 18 10:47:21 UTC 2025
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
> [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000bffdafff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000bffdb000-0x00000000bfffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000001bfffffff] usable
> [    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
> [    0.000000] earlycon: uart0 at I/O port 0x3f8 (options '')
> [    0.000000] printk: legacy bootconsole [uart0] enabled
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] APIC: Static calls initialized
> [    0.000000] SMBIOS 2.8 present.
> [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Arch Linux 1.16.3-1-1 04/01/2014
> [    0.000000] DMI: Memory slots populated: 1/1
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: using sched offset of 3090378331820 cycles
> [    0.000562] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    0.002391] tsc: Detected 3992.500 MHz processor
> [    0.003311] last_pfn = 0x1c0000 max_arch_pfn = 0x1000000
> [    0.003924] MTRR map: 4 entries (3 fixed + 1 variable; max 19), built from 8 variable MTRRs
> [    0.004847] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
> [    0.005630] Warning: only 4GB will be used. Support for for CONFIG_HIGHMEM64G was removed!
> [    0.008576] found SMP MP-table at [mem 0x000f6650-0x000f665f]
> [    0.009239] RAMDISK: [mem 0x7f210000-0x7fffffff]
> [    0.009755] Allocated new RAMDISK: [mem 0x3680e000-0x375fdd9e]
> [    0.011541] Move RAMDISK from [mem 0x7f210000-0x7ffffd9e] to [mem 0x3680e000-0x375fdd9e]
> [    0.012425] ACPI: Early table checksum verification disabled
> [    0.013026] ACPI: RSDP 0x00000000000F6610 000014 (v00 BOCHS )
> [    0.013656] ACPI: RSDT 0x00000000BFFE208E 000030 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.014690] ACPI: FACP 0x00000000BFFE1F52 000074 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.015604] ACPI: DSDT 0x00000000BFFDFD40 002212 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.016517] ACPI: FACS 0x00000000BFFDFD00 000040
> [    0.017021] ACPI: APIC 0x00000000BFFE1FC6 0000A0 (v03 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.017951] ACPI: WAET 0x00000000BFFE2066 000028 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.018874] ACPI: Reserving FACP table memory at [mem 0xbffe1f52-0xbffe1fc5]
> [    0.019631] ACPI: Reserving DSDT table memory at [mem 0xbffdfd40-0xbffe1f51]
> [    0.020391] ACPI: Reserving FACS table memory at [mem 0xbffdfd00-0xbffdfd3f]
> [    0.021153] ACPI: Reserving APIC table memory at [mem 0xbffe1fc6-0xbffe2065]
> [    0.021896] ACPI: Reserving WAET table memory at [mem 0xbffe2066-0xbffe208d]
> [    0.022763] 3210MB HIGHMEM available.
> [    0.023178] 885MB LOWMEM available.
> [    0.023581]   mapped low ram: 0 - 375fe000
> [    0.024073]   low ram: 0 - 375fe000
> [    0.024504] Zone ranges:
> [    0.024805]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.025516]   Normal   [mem 0x0000000001000000-0x00000000375fdfff]
> [    0.026224]   HighMem  [mem 0x00000000375fe000-0x00000000ffffffff]
> [    0.026938] Movable zone start for each node
> [    0.027433] Early memory node ranges
> [    0.027852]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> [    0.028565]   node   0: [mem 0x0000000000100000-0x00000000bffdafff]
> [    0.029279]   node   0: [mem 0x0000000100000000-0x00000001bfffffff]
> [    0.029998] Initmem setup node 0 [mem 0x0000000000001000-0x00000001bfffffff]
> [    0.030820] On node 0, zone DMA: 1 pages in unavailable ranges
> [    0.031521] On node 0, zone DMA: 97 pages in unavailable ranges
> [    0.039994] On node 0, zone HighMem: 262181 pages in unavailable ranges
> [    0.041125] ACPI: PM-Timer IO Port: 0x608
> [    0.041595] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
> [    0.042231] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-23
> [    0.042865] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.043435] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
> [    0.044115] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> [    0.044722] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
> [    0.045350] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
> [    0.046018] ACPI: Using ACPI (MADT) for SMP configuration information
> [    0.046638] TSC deadline timer available
> [    0.047004] CPU topo: Max. logical packages:   6
> [    0.047442] CPU topo: Max. logical dies:       6
> [    0.047867] CPU topo: Max. dies per package:   1
> [    0.048286] CPU topo: Max. threads per core:   1
> [    0.048706] CPU topo: Num. cores per package:     1
> [    0.049162] CPU topo: Num. threads per package:   1
> [    0.049599] CPU topo: Allowing 6 present CPUs plus 0 hotplug CPUs
> [    0.050164] kvm-guest: APIC: eoi() replaced with kvm_guest_apic_eoi_write()
> [    0.050813] kvm-guest: KVM setup pv remote TLB flush
> [    0.051328] kvm-guest: setup PV sched yield
> [    0.051739] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
> [    0.052441] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
> [    0.053150] PM: hibernation: Registered nosave memory: [mem 0xbffdb000-0xffffffff]
> [    0.053841] [mem 0xc0000000-0xfeffbfff] available for PCI devices
> [    0.054398] Booting paravirtualized kernel on KVM
> [    0.054843] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
> [    0.055846] setup_percpu: NR_CPUS:8 nr_cpumask_bits:6 nr_cpu_ids:6 nr_node_ids:1
> [    0.056628] percpu: Embedded 33 pages/cpu s102476 r0 d32692 u135168
> [    0.057257] kvm-guest: PV spinlocks enabled
> [    0.057646] PV qspinlock hash table entries: 512 (order: 0, 4096 bytes, linear)
> [    0.058318] Kernel command line: root=/dev/sys/root rw console=ttyS0 loglevel=7 earlycon=uart,io,0x3f8
> [    0.059439] random: crng init done
> [    0.059750] printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
> [    0.060446] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
> [    0.061185] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
> [    0.061972] software IO TLB: area num 8.
> [    0.064551] Built 1 zonelists, mobility grouping on.  Total pages: 786297
> [    0.065269] allocated 4198396 bytes of page_ext
> [    0.065856] mem auto-init: stack:off, heap alloc:on, heap free:off
> [    0.070213] BUG: Bad page state in process swapper  pfn:100001
> [    0.070773] page: refcount:0 mapcount:1 mapping:(ptrval) index:0x0 pfn:0x100001
> [    0.071451] aops:0x0 ino:850fc085 invalid dentry:2cc54702
> [    0.071962] BUG: kernel NULL pointer dereference, address: 00000400
> [    0.072609] #PF: supervisor read access in kernel mode
> [    0.073135] #PF: error_code(0x0000) - not-present page
> [    0.073621] *pdpt = 0000000000000000 *pde = f000ff53f000ff53
> [    0.074269] Oops: Oops: 0000 [#1] SMP NOPTI
> [    0.074666] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc2-custom+ #5 PREEMPT(undef)  a4004de2bdc11241c6afe44ab7f6bd7d8e98e3db
> [    0.075828] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Arch Linux 1.16.3-1-1 04/01/2014
> [    0.076706] EIP: get_pfnblock_flags_mask+0x40/0x50
> [    0.077160] Code: 03 00 00 8b 8e 48 14 33 d7 8b 96 44 14 33 d7 81 e1 00 fe ff ff 29 c8 c1 e8 09 8d 0c 85 00 00 00 00 c1 e8 03 8d 04 82 83 e1 1f <8b> 00 d3 e8 21 d8 5b 5e 5d 31 d2 31 c9 c3 66 90 e8 e3 bf d6 ff 55
> [    0.078954] EAX: 00000400 EBX: 00000007 ECX: 00000000 EDX: 00000000
> [    0.079567] ESI: 00000a80 EDI: d70ebce5 EBP: d71fdd80 ESP: d71fdd78
> [    0.080156] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210046
> [    0.080796] CR0: 80050033 CR2: 00000400 CR3: 1749a000 CR4: 000000b0
> [    0.081378] Call Trace:
> [    0.081602]  __dump_page.cold+0x11d/0x23f
> [    0.081977]  ? prb_read_valid+0x29/0x40
> [    0.082334]  ? console_unlock+0x56/0x100
> [    0.082701]  ? console_unlock+0x56/0x100
> [    0.083070]  ? vprintk_emit+0x2d2/0x390
> [    0.083458]  ? vprintk_default+0x15/0x20
> [    0.083826]  dump_page+0x1b/0x30
> [    0.084127]  ? dump_page+0x1b/0x30
> [    0.084447]  bad_page.cold+0x62/0x84
> [    0.084796]  free_tail_page_prepare+0x134/0x190
> [    0.085232]  __free_pages_ok+0x318/0x3c0
> [    0.085607]  __free_pages_core+0x4e/0x58
> [    0.085982]  memblock_free_pages+0x11/0x34
> [    0.086378]  memblock_free_all+0x149/0x1b4
> [    0.086766]  mm_core_init+0x103/0x158
> [    0.087121]  start_kernel+0x5d2/0x7f8
> [    0.087462]  ? load_ucode_bsp+0x53/0xdc
> [    0.087832]  i386_start_kernel+0x64/0x64
> [    0.088195]  startup_32_smp+0x151/0x154
> [    0.088561] Modules linked in:
> [    0.088865] CR2: 0000000000000400
> [    0.089185] ---[ end trace 0000000000000000 ]---
> [    0.089624] EIP: get_pfnblock_flags_mask+0x40/0x50
> [    0.090093] Code: 03 00 00 8b 8e 48 14 33 d7 8b 96 44 14 33 d7 81 e1 00 fe ff ff 29 c8 c1 e8 09 8d 0c 85 00 00 00 00 c1 e8 03 8d 04 82 83 e1 1f <8b> 00 d3 e8 21 d8 5b 5e 5d 31 d2 31 c9 c3 66 90 e8 e3 bf d6 ff 55
> [    0.091910] EAX: 00000400 EBX: 00000007 ECX: 00000000 EDX: 00000000
> [    0.092505] ESI: 00000a80 EDI: d70ebce5 EBP: d71fdd80 ESP: d71fdd78
> [    0.093111] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210046
> [    0.093788] CR0: 80050033 CR2: 00000400 CR3: 1749a000 CR4: 000000b0
> [    0.094415] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.095097] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
