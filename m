Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E051F8ACA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744036770; cv=none; b=YW+vmZ0t8Pa72aJLid/fPwh/z6tlmrmvwAokHGBj3JilUVS5xejldEOjGjrk47oTP5tqFcGcma2e/7lVX/aPeJnbQfh1Z7u6xRigsYDrTgvCO1RalcqzmyBt+5XfPElhXS+/XGXOh8PLFyePUKjKI6HEFVBaqxUhgbWxS43bC4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744036770; c=relaxed/simple;
	bh=5kp8PPBaK61r0wChFF68uWqa9pgYUvTDEPd4rfJLJsA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=q5zn7xXVLQOgsDNFPsJn0rSTddHsXMnqb04zmIvIlnd5Iu1CU/b8m/nxVvtvlzbc+qy3X1GHmzF0CeZauR9Incidq5tLUYaYQ4BSAwcMgAJgACc5NBCUKZeq4GrpSSguZsKtrhK6W54YssMqImixL+PmebCBGHutBlsB7YBiBKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=fN5GjTFb; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="fN5GjTFb"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 537Ed08q2460483
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 7 Apr 2025 07:39:01 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 537Ed08q2460483
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744036741;
	bh=/zL7bjgebP0zbMt+g4HvzqGcWFQYJdlAJIVbZykhoUw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=fN5GjTFbZ66xPfwMZZVR7tTmoxkvWZtQFZg+kdXreFUAiBS2RoQyEG7xeQFtayOVy
	 Sp76BaR4YI+elTem+4bjZUMjHfKnKXc7MGk1D85jjqvAJ4ERYrGVSFn7Wff0npBCZA
	 V8JZqWQMX/JZi7fs5djE4MUXt/SR/Zt5/xyozr7eXLv8o+s89QRUYfaE5BzklD++YH
	 k84CJAeGJ1dNnh2BFQ9e73mbqxDKnv3T1xeyGsQIvmAkHNHd9jwF/vveyhYR9SE5Yq
	 3AT9pNS8UPTcyv4fmmpog1106vnselY2m+AvPOcU8GAGlVjkj+D5EfkXobs1IxUbyu
	 fqc5mb39K+5Ow==
Date: Mon, 07 Apr 2025 07:38:59 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Kevin Koster <lkml@ombertech.com>, Borislav Petkov <bp@alien8.de>
CC: Thomas Gleixner <tglx@linutronix.de>, Oerg866 <oerg866@googlemail.com>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_x86/microcode=3A_Fix_crashes_o?=
 =?US-ASCII?Q?n_early_486_CPUs_due_to_usage_of_=27cpuid=27=2E?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com> <20250405130306.ca9822c1f27db119cc973603@ombertech.com> <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local> <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com> <20250406174633.2c581923c145687476191753@ombertech.com> <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local> <20250407095848.7933a358c9f450fe03fb8234@ombertech.com> <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local> <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
Message-ID: <A08760B5-0E1A-4D21-8621-73516D1D67F0@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 7, 2025 7:21:50 AM PDT, Kevin Koster <lkml@ombertech=2Ecom> wrote:
>On Mon, 7 Apr 2025 12:29:27 +0200
>Borislav Petkov <bp@alien8=2Ede> wrote:
>
>> On Mon, Apr 07, 2025 at 09:58:48AM +1000, Kevin Koster wrote:
>> > But I like to know Linux really works on the hardware it's built
>> > for,
>>=20
>> I don't know what that means=2E
>
>To rephrase: I like knowing that "CONFIG_M486=3Dy" works, in the kernel
>configuration=2E If not, then I know to use other OSs if I want to boot a
>486=2E
>
>> > and I'm not much better, writing this now on a Pentium 1=2E
>>=20
>> Lemme guess: this is your main machine you use for daily work?
>
>For email/news every morning, then a (newer) laptop afterwards=2E
>
>> > > -	if (dis_ucode_ldr || c->x86_vendor !=3D X86_VENDOR_AMD || c->x86 =
< 0x10)
>> > > +	if (microcode_loader_disabled() || c->x86_vendor !=3D X86_VENDOR_=
AMD || c->x86 < 0x10)
>> > 		return 0;
>> >=20
>> > Still fails unless the native_cpuid_eax(1) call is moved under
>> > here=2E After that change, it boots fine=2E
>>=20
>> Please show me with a diff what you're doing because I don't know
>> what you mean=2E
>
>OK, this is the change I made after applying your patch:
>
>--- a/arch/x86/kernel/cpu/microcode/amd=2Ec
>+++ b/arch/x86/kernel/cpu/microcode/amd=2Ec
>@@ -1093,7 +1093,7 @@
>=20
> static int __init save_microcode_in_initrd(void)
> {
>-	unsigned int cpuid_1_eax =3D native_cpuid_eax(1);
>+	unsigned int cpuid_1_eax;
>	struct cpuinfo_x86 *c =3D &boot_cpu_data;
>	struct cont_desc desc =3D { 0 };
>	enum ucode_state ret;
>@@ -1102,6 +1102,8 @@
>	if (microcode_loader_disabled() || c->x86_vendor !=3D X86_VENDOR_AMD || =
c->x86 < 0x10)
>		return 0;
>=20
>+	cpuid_1_eax =3D native_cpuid_eax(1);
>+
>	if (!find_blobs_in_containers(&cp))
>		return -EINVAL;
>
>> I did this:
>>=20
>> bool have_cpuid_p(void)
>> {
>>         return false;
>> }
>>=20
>> in order to simulate no CPUID support but my 32-bit guest boots fine=2E
>
>It's detecting no CPUID support on 486 CPUs OK, however
>save_microcode_in_initrd() uses CPUID before checking if it is
>supported=2E
>
>> Also, send a full dmesg from that machine so that I can try to
>> reproduce here=2E
>
>This is with your latest patch applied, without my above change:
>
>No EFI environment detected=2E
>early console in extract_kernel
>input_data: 0x007d1094
>input_len: 0x005aa603
>output: 0x00100000
>output_len: 0x00bb42d8
>kernel_total_size: 0x00c9a000
>needed_size: 0x00c9a000
>
>Decompressing Linux=2E=2E=2E Parsing ELF=2E=2E=2E No relocation needed=2E=
=2E=2E done=2E
>Booting the kernel (entry_offset: 0x00751e00)=2E
>Linux version 6=2E14=2E0 (cnk2@ombertech) (gcc (Debian 12=2E2=2E0-14) 12=
=2E2=2E0, GNU ld (GNU Binutils for Debian) 2=2E40) #3 SMP Sun Apr  6 21:54:=
11 UTC 2025
>BIOS-provided physical RAM map:
>BIOS-e820: [mem 0x0000000000000000-0x0000000000004c1f] usable
>BIOS-e820: [mem 0x0000000000004c20-0x000000000000501f] reserved
>BIOS-e820: [mem 0x0000000000005020-0x000000000009ffff] usable
>BIOS-e820: [mem 0x00000000000f5a3c-0x00000000000fffff] reserved
>BIOS-e820: [mem 0x0000000000100000-0x00000000013fffff] usable
>BIOS-e820: [mem 0x00000000ffff5a3c-0x00000000ffffffff] reserved
>printk: legacy console [earlyser0] enabled
>printk: debug: ignoring loglevel setting=2E
>Notice: NX (Execute Disable) protection missing in CPU!
>APIC: Static calls initialized
>DMI not present or invalid=2E
>e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> reserved
>e820: remove [mem 0x000a0000-0x000fffff] usable
>last_pfn =3D 0x1400 max_arch_pfn =3D 0x100000
>MTRRs disabled (not available)
>x86/PAT: PAT not supported by the CPU=2E
>x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC =20
>initial memory mapped: [mem 0x00000000-0x00ffffff]
>0MB HIGHMEM available=2E
>20MB LOWMEM available=2E
>  mapped low ram: 0 - 01400000
>  low ram: 0 - 01400000
>Zone ranges:
>  DMA      [mem 0x0000000000001000-0x0000000000ffffff]
>  Normal   [mem 0x0000000001000000-0x00000000013fffff]
>  HighMem  empty
>Movable zone start for each node
>Early memory node ranges
>  node   0: [mem 0x0000000000001000-0x0000000000003fff]
>  node   0: [mem 0x0000000000006000-0x000000000009ffff]
>  node   0: [mem 0x0000000000100000-0x00000000013fffff]
>Initmem setup node 0 [mem 0x0000000000001000-0x00000000013fffff]
>On node 0, zone DMA: 1 pages in unavailable ranges
>On node 0, zone DMA: 2 pages in unavailable ranges
>On node 0, zone DMA: 96 pages in unavailable ranges
>No local APIC present or hardware disabled
>APIC: disable apic facility
>APIC: Switched APIC routing to: noop
>CPU topo: Max=2E logical packages:   1
>CPU topo: Max=2E logical dies:       1
>CPU topo: Max=2E dies per package:   1
>CPU topo: Max=2E threads per core:   1
>CPU topo: Num=2E cores per package:     1
>CPU topo: Num=2E threads per package:   1
>CPU topo: Allowing 1 present CPUs plus 0 hotplug CPUs
>PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
>PM: hibernation: Registered nosave memory: [mem 0x00004000-0x00004fff]
>PM: hibernation: Registered nosave memory: [mem 0x00005000-0x00005fff]
>PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000f5fff]
>PM: hibernation: Registered nosave memory: [mem 0x000f6000-0x000fffff]
>[mem 0x01400000-0xffff5a3b] available for PCI devices
>Booting paravirtualized kernel on bare hardware
>clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, ma=
x_idle_ns: 6370452778343963 ns
>setup_percpu: NR_CPUS:8 nr_cpumask_bits:1 nr_cpu_ids:1 nr_node_ids:1
>percpu: Embedded 30 pages/cpu s91852 r0 d31028 u122880
>pcpu-alloc: s91852 r0 d31028 u122880 alloc=3D30*4096
>pcpu-alloc: [0] 0=20
>Kernel command line: root=3D/dev/sda3 rw base udev=2Echildren-max=3D1 acp=
i=3Doff earlyprintk=3DttyS0,115200,keep ignore_loglevel BOOT_IMAGE=3D614-48=
64
>Unknown kernel command line parameters "base BOOT_IMAGE=3D614-4864", will=
 be passed to user space=2E
>printk: log buffer data + meta data: 131072 + 409600 =3D 540672 bytes
>Dentry cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
>Inode-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
>Built 1 zonelists, mobility grouping on=2E  Total pages: 5021
>mem auto-init: stack:off, heap alloc:off, heap free:off
>Initializing HighMem for node 0 (00000000:00000000)
>Checking if this processor honours the WP bit even in supervisor mode=2E=
=2E=2EOk=2E
>SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1
>rcu: Hierarchical RCU implementation=2E
>rcu: 	RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D1=2E
>	Tracing variant of Tasks RCU enabled=2E
>rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies=2E
>rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D1
>RCU Tasks Trace: Setting shift to 0 and lim to 1 rcu_task_cb_adjust=3D1 r=
cu_task_cpu_ids=3D1=2E
>NR_IRQS: 2304, nr_irqs: 32, preallocated irqs: 16
>rcu: srcu_init: Setting srcu_struct sizes based on contention=2E
>Console: colour VGA+ 80x60
>printk: legacy console [tty0] enabled
>APIC: Keep in PIC mode(8259)
>Calibrating delay loop=2E=2E=2E 30=2E96 BogoMIPS (lpj=3D51136)
>Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
>Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
>x86/fpu: Probing for FPU: FSW=3D0x0000 FCW=3D0x037f
>x86/fpu: x87 FPU will use FSAVE
>Freeing SMP alternatives memory: 24K
>pid_max: default: 32768 minimum: 301
>Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
>Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
>smpboot: SMP disabled
>Performance Events: no PMU driver, software events only=2E
>signal: max sigframe size: 928
>Oops: invalid opcode: 0000 [#1] SMP
>CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6=2E14=2E0 #3
>EIP: 0xc0b5e1da
>Code: 7d dc 00 74 0b b9 07 00 00 00 89 df b0 01 f3 a5 83 c4 1c 5b 5e 5f 5=
d c3 55 b8 01 00 00 00 89 e5 57 56 31 f6 53 89 f1 83 ec 30 <0f> a2 b9 04 00=
 00 00 89 45 c4 8d 7d c8 89 f0 f3 ab e8 3c fb ff ff
>EAX: 00000001 EBX: c0be6b00 ECX: 00000000 EDX: 00000246
>ESI: 00000000 EDI: 00000000 EBP: c1309f08 ESP: c1309ecc
>DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
>CR0: 80050033 CR2: ffd38000 CR3: 00c16000 CR4: 00000000
>Call Trace:
> ? 0xc01231af
> ? 0xc01231c8
> ? 0xc0123222
> ? 0xc0123245
> ? 0xc01215ef
> ? 0xc01217f7
> ? 0xc0b5e1da
> ? 0xc0848e09
> ? 0xc012186f
> ? 0xc0b5e1da
> ? 0xc0848e41
> ? 0xc010105d
> ? 0xc01500d8
> ? 0xc0848e09
> ? 0xc0b5e1da
> ? 0xc01500d8
> ? 0xc0848e09
> ? 0xc0b5e1da
> ? 0xc085148a
> ? 0xc0524da8
> ? 0xc0b5e1c8
> 0xc0102100
> ? 0xc08514d5
> ? 0xc085148a
> ? 0xc0171bde
> ? 0xc0175987
> ? 0xc016d672
> 0xc0b4c9e2
> ? 0xc084c9b8
> 0xc084c9ca
> 0xc0127d3a
> ? 0xc084c9b8
> 0xc01027a2
> 0xc0100e3d
>Modules linked in:
>---[ end trace 0000000000000000 ]---
>EIP: 0xc0b5e1da
>Code: 7d dc 00 74 0b b9 07 00 00 00 89 df b0 01 f3 a5 83 c4 1c 5b 5e 5f 5=
d c3 55 b8 01 00 00 00 89 e5 57 56 31 f6 53 89 f1 83 ec 30 <0f> a2 b9 04 00=
 00 00 89 45 c4 8d 7d c8 89 f0 f3 ab e8 3c fb ff ff
>EAX: 00000001 EBX: c0be6b00 ECX: 00000000 EDX: 00000246
>ESI: 00000000 EDI: 00000000 EBP: c1309f08 ESP: c1309ecc
>DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
>CR0: 80050033 CR2: ffd38000 CR3: 00c16000 CR4: 00000000
>Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b
>Rebooting in 60 seconds=2E=2E

Can you please not post stack traces without any symbol information either=
 internal or external? It is just random hex digits in the absence of a Sys=
tem=2Emap or vmlinux file=2E
