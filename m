Received: from ombertech.com (ombertech.com [74.48.158.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9669325291D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.48.158.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032075; cv=none; b=GhrV7ll4o4WHlgJw95AK9SWy66medr3vDKd02r6x16kiFwKMmzkr2yf2mVQviLni8W0vCWpGzutfH90xo8DtjKGPiKT3R3z0cIaMYyxBd86GtwHJPQh9kE3Wy9EG1kulztbzyl/3BZrCZMFCL1002FGQrb0okddigouzZU9pxsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032075; c=relaxed/simple;
	bh=LsCArQX87hQR1OV5ymBKJgYBHQQRj18+JuEzMIde1yg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=doodnRwxmwY7AvXbH7/HYrF2n9Hh3zxvkul6tFNqCSusvaUVfkd+JFR5TkhzrM894ZDyytqD/FoRg9Zro7xXdZCjxonQ3qJ8idoydIiBAQp653saLArA3VAT9SIQUc6weq673+mlJIK6vH8gTBJBEvFyEz02rCC/zlN2oFBiORc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com; spf=pass smtp.mailfrom=ombertech.com; dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b=ZBhz8t35; arc=none smtp.client-ip=74.48.158.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ombertech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b="ZBhz8t35"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ombertech.com; s=2022;
	t=1744031773; bh=LsCArQX87hQR1OV5ymBKJgYBHQQRj18+JuEzMIde1yg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZBhz8t35J+WyH/xZVDmitRueR/6rxa0xIMgnX19T6fk487mgCqmktWyS8MUt0HBkM
	 TluOEB6GEtX/zRUFYVyPuyvG0DsGeVXfnS9p09Zg3qwuK1g2za1ZjHbadBS8MiINgT
	 PJGTuc4/RZ0ikzX/Srso6nrk2pPI89CjqohW1lPfuUdT8jRZGHueD5IBxHVI0TtIiz
	 Qw5UnNolw0weur+UeSE337rb17r1S2nV9TV4jU2t1wRjodf6x7gD6BtP51ZY+pQCpd
	 2NlrVg/QMD9AXGdGuBfQ+1eOT5Fk0wevvvvRv2BmqkTy4o/QnnS4+qRLTTOrzX2FtT
	 nUfjRuXR+DASA==
Received: from 192.168.1.100 (unknown [1.145.230.99])
	by ombertech.com (Postfix) with ESMTPSA id 6F3915FE38;
	Mon,  7 Apr 2025 13:16:11 +0000 (UTC)
Date: Tue, 8 Apr 2025 00:21:50 +1000
From: Kevin Koster <lkml@ombertech.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Oerg866 <oerg866@googlemail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-Id: <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
In-Reply-To: <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
	<20250405130306.ca9822c1f27db119cc973603@ombertech.com>
	<20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
	<20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
	<20250406174633.2c581923c145687476191753@ombertech.com>
	<20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
	<20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
	<20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 7 Apr 2025 12:29:27 +0200
Borislav Petkov <bp@alien8.de> wrote:

> On Mon, Apr 07, 2025 at 09:58:48AM +1000, Kevin Koster wrote:
> > But I like to know Linux really works on the hardware it's built
> > for,
> 
> I don't know what that means.

To rephrase: I like knowing that "CONFIG_M486=y" works, in the kernel
configuration. If not, then I know to use other OSs if I want to boot a
486.

> > and I'm not much better, writing this now on a Pentium 1.
> 
> Lemme guess: this is your main machine you use for daily work?

For email/news every morning, then a (newer) laptop afterwards.

> > > -	if (dis_ucode_ldr || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
> > > +	if (microcode_loader_disabled() || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
> > 		return 0;
> > 
> > Still fails unless the native_cpuid_eax(1) call is moved under
> > here. After that change, it boots fine.
> 
> Please show me with a diff what you're doing because I don't know
> what you mean.

OK, this is the change I made after applying your patch:

--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -1093,7 +1093,7 @@
 
 static int __init save_microcode_in_initrd(void)
 {
-	unsigned int cpuid_1_eax = native_cpuid_eax(1);
+	unsigned int cpuid_1_eax;
	struct cpuinfo_x86 *c = &boot_cpu_data;
	struct cont_desc desc = { 0 };
	enum ucode_state ret;
@@ -1102,6 +1102,8 @@
	if (microcode_loader_disabled() || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
		return 0;
 
+	cpuid_1_eax = native_cpuid_eax(1);
+
	if (!find_blobs_in_containers(&cp))
		return -EINVAL;

> I did this:
> 
> bool have_cpuid_p(void)
> {
>         return false;
> }
> 
> in order to simulate no CPUID support but my 32-bit guest boots fine.

It's detecting no CPUID support on 486 CPUs OK, however
save_microcode_in_initrd() uses CPUID before checking if it is
supported.

> Also, send a full dmesg from that machine so that I can try to
> reproduce here.

This is with your latest patch applied, without my above change:

No EFI environment detected.
early console in extract_kernel
input_data: 0x007d1094
input_len: 0x005aa603
output: 0x00100000
output_len: 0x00bb42d8
kernel_total_size: 0x00c9a000
needed_size: 0x00c9a000

Decompressing Linux... Parsing ELF... No relocation needed... done.
Booting the kernel (entry_offset: 0x00751e00).
Linux version 6.14.0 (cnk2@ombertech) (gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #3 SMP Sun Apr  6 21:54:11 UTC 2025
BIOS-provided physical RAM map:
BIOS-e820: [mem 0x0000000000000000-0x0000000000004c1f] usable
BIOS-e820: [mem 0x0000000000004c20-0x000000000000501f] reserved
BIOS-e820: [mem 0x0000000000005020-0x000000000009ffff] usable
BIOS-e820: [mem 0x00000000000f5a3c-0x00000000000fffff] reserved
BIOS-e820: [mem 0x0000000000100000-0x00000000013fffff] usable
BIOS-e820: [mem 0x00000000ffff5a3c-0x00000000ffffffff] reserved
printk: legacy console [earlyser0] enabled
printk: debug: ignoring loglevel setting.
Notice: NX (Execute Disable) protection missing in CPU!
APIC: Static calls initialized
DMI not present or invalid.
e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
e820: remove [mem 0x000a0000-0x000fffff] usable
last_pfn = 0x1400 max_arch_pfn = 0x100000
MTRRs disabled (not available)
x86/PAT: PAT not supported by the CPU.
x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC  
initial memory mapped: [mem 0x00000000-0x00ffffff]
0MB HIGHMEM available.
20MB LOWMEM available.
  mapped low ram: 0 - 01400000
  low ram: 0 - 01400000
Zone ranges:
  DMA      [mem 0x0000000000001000-0x0000000000ffffff]
  Normal   [mem 0x0000000001000000-0x00000000013fffff]
  HighMem  empty
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000001000-0x0000000000003fff]
  node   0: [mem 0x0000000000006000-0x000000000009ffff]
  node   0: [mem 0x0000000000100000-0x00000000013fffff]
Initmem setup node 0 [mem 0x0000000000001000-0x00000000013fffff]
On node 0, zone DMA: 1 pages in unavailable ranges
On node 0, zone DMA: 2 pages in unavailable ranges
On node 0, zone DMA: 96 pages in unavailable ranges
No local APIC present or hardware disabled
APIC: disable apic facility
APIC: Switched APIC routing to: noop
CPU topo: Max. logical packages:   1
CPU topo: Max. logical dies:       1
CPU topo: Max. dies per package:   1
CPU topo: Max. threads per core:   1
CPU topo: Num. cores per package:     1
CPU topo: Num. threads per package:   1
CPU topo: Allowing 1 present CPUs plus 0 hotplug CPUs
PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
PM: hibernation: Registered nosave memory: [mem 0x00004000-0x00004fff]
PM: hibernation: Registered nosave memory: [mem 0x00005000-0x00005fff]
PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000f5fff]
PM: hibernation: Registered nosave memory: [mem 0x000f6000-0x000fffff]
[mem 0x01400000-0xffff5a3b] available for PCI devices
Booting paravirtualized kernel on bare hardware
clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
setup_percpu: NR_CPUS:8 nr_cpumask_bits:1 nr_cpu_ids:1 nr_node_ids:1
percpu: Embedded 30 pages/cpu s91852 r0 d31028 u122880
pcpu-alloc: s91852 r0 d31028 u122880 alloc=30*4096
pcpu-alloc: [0] 0 
Kernel command line: root=/dev/sda3 rw base udev.children-max=1 acpi=off earlyprintk=ttyS0,115200,keep ignore_loglevel BOOT_IMAGE=614-4864
Unknown kernel command line parameters "base BOOT_IMAGE=614-4864", will be passed to user space.
printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
Dentry cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Built 1 zonelists, mobility grouping on.  Total pages: 5021
mem auto-init: stack:off, heap alloc:off, heap free:off
Initializing HighMem for node 0 (00000000:00000000)
Checking if this processor honours the WP bit even in supervisor mode...Ok.
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
rcu: Hierarchical RCU implementation.
rcu: 	RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=1.
	Tracing variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
RCU Tasks Trace: Setting shift to 0 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=1.
NR_IRQS: 2304, nr_irqs: 32, preallocated irqs: 16
rcu: srcu_init: Setting srcu_struct sizes based on contention.
Console: colour VGA+ 80x60
printk: legacy console [tty0] enabled
APIC: Keep in PIC mode(8259)
Calibrating delay loop... 30.96 BogoMIPS (lpj=51136)
Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
x86/fpu: Probing for FPU: FSW=0x0000 FCW=0x037f
x86/fpu: x87 FPU will use FSAVE
Freeing SMP alternatives memory: 24K
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
smpboot: SMP disabled
Performance Events: no PMU driver, software events only.
signal: max sigframe size: 928
Oops: invalid opcode: 0000 [#1] SMP
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0 #3
EIP: 0xc0b5e1da
Code: 7d dc 00 74 0b b9 07 00 00 00 89 df b0 01 f3 a5 83 c4 1c 5b 5e 5f 5d c3 55 b8 01 00 00 00 89 e5 57 56 31 f6 53 89 f1 83 ec 30 <0f> a2 b9 04 00 00 00 89 45 c4 8d 7d c8 89 f0 f3 ab e8 3c fb ff ff
EAX: 00000001 EBX: c0be6b00 ECX: 00000000 EDX: 00000246
ESI: 00000000 EDI: 00000000 EBP: c1309f08 ESP: c1309ecc
DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
CR0: 80050033 CR2: ffd38000 CR3: 00c16000 CR4: 00000000
Call Trace:
 ? 0xc01231af
 ? 0xc01231c8
 ? 0xc0123222
 ? 0xc0123245
 ? 0xc01215ef
 ? 0xc01217f7
 ? 0xc0b5e1da
 ? 0xc0848e09
 ? 0xc012186f
 ? 0xc0b5e1da
 ? 0xc0848e41
 ? 0xc010105d
 ? 0xc01500d8
 ? 0xc0848e09
 ? 0xc0b5e1da
 ? 0xc01500d8
 ? 0xc0848e09
 ? 0xc0b5e1da
 ? 0xc085148a
 ? 0xc0524da8
 ? 0xc0b5e1c8
 0xc0102100
 ? 0xc08514d5
 ? 0xc085148a
 ? 0xc0171bde
 ? 0xc0175987
 ? 0xc016d672
 0xc0b4c9e2
 ? 0xc084c9b8
 0xc084c9ca
 0xc0127d3a
 ? 0xc084c9b8
 0xc01027a2
 0xc0100e3d
Modules linked in:
---[ end trace 0000000000000000 ]---
EIP: 0xc0b5e1da
Code: 7d dc 00 74 0b b9 07 00 00 00 89 df b0 01 f3 a5 83 c4 1c 5b 5e 5f 5d c3 55 b8 01 00 00 00 89 e5 57 56 31 f6 53 89 f1 83 ec 30 <0f> a2 b9 04 00 00 00 89 45 c4 8d 7d c8 89 f0 f3 ab e8 3c fb ff ff
EAX: 00000001 EBX: c0be6b00 ECX: 00000000 EDX: 00000246
ESI: 00000000 EDI: 00000000 EBP: c1309f08 ESP: c1309ecc
DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
CR0: 80050033 CR2: ffd38000 CR3: 00c16000 CR4: 00000000
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Rebooting in 60 seconds..
