Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDD61474B8;
	Tue,  6 May 2025 11:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530335; cv=none; b=Ph6jsrx+3M6kELyMf2IZlDOhElO2V/uy4FzPnRKW69YAa1+W3Xz31K5HIonp+lyjwtsdnjM/nm2HslVdRJBqHCzuyqGn4zjl2FXBQdgOU9yjA/uqyzQQ3+Wc900h11EVzPUed+4qMCNQOoV9DurEAjmNMGLbACBfKIx8IXcCXaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530335; c=relaxed/simple;
	bh=wtRQ4XQBaMQmvOwsZOh6o7ClrKrzaIGqwwsEjf66U4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aad1zRrMw9MEodsrjzzhYHv8Ewdc8pCIDsXG3+jCVLT+0UgJeOBqQRhebJZBB28CIAwy2tYuda6Q8DVWDfbT6nEjmwnV7VPiJuOMMgSbhIYqOok4PhJ4AawB4G60v5TdBdEVRc1/Po3jXFq1f3r+g0uVjuMvmqD1ZvyPunT+T+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=wlakhSX1; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="wlakhSX1"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5467UZHj021792;
	Tue, 6 May 2025 13:18:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	WxmcLrwGcqc7QpVv6acAd0gwXsrDP5fqTcYOjQ8D9+0=; b=wlakhSX1t7nqDwZS
	JjTrcRTqDaTRp69fMCys7ZY7eh7oS03D3w7Fbve4fg7cEuyEbNHG3YZHxqt2BUSS
	Smt5G9wwa0GAwbWc9c+kgyLJqChn5VFL6LfC2hhSUZiCYCF1fbolm+2uk0JqjLZ/
	Hbru7zzKocFnFKbq9tHvPIvphmq+5/RhbpjYUUyda2UMdxaen9cSeXBkGiLHPXAK
	8EqbkLgedveMbKl1KdgUHuX/nGqj8z2uyjdArY/UuEubiGmTwmO41gBtOGoWs1Iz
	rpee5Zl6HyN0g4fgqmYnRpKA9ThIZsaLJQAJlx2Se4q+s8T6i5QRiBt0voFlvDsl
	yrAYFw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dx3m937d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 13:18:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0DAA74004C;
	Tue,  6 May 2025 13:17:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A381AA8119;
	Tue,  6 May 2025 13:16:23 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 13:16:22 +0200
Message-ID: <ad80e3b8-4f62-4c58-8dbd-762f0b268713@foss.st.com>
Date: Tue, 6 May 2025 13:16:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/3] memory: Add STM32 Octo Memory Manager driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250506-upstream_ospi_v6-v12-0-e3bb5a0d78fb@foss.st.com>
 <20250506-upstream_ospi_v6-v12-2-e3bb5a0d78fb@foss.st.com>
 <88b463b2-6cd3-4b92-acc5-447bbfadabde@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <88b463b2-6cd3-4b92-acc5-447bbfadabde@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01



On 5/6/25 10:02, Krzysztof Kozlowski wrote:
> On 06/05/2025 09:52, Patrice Chotard wrote:
>> Octo Memory Manager driver (OMM) manages:
>>   - the muxing between 2 OSPI busses and 2 output ports.
>>     There are 4 possible muxing configurations:
>>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>>         output is on port 2
>>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>>         OSPI2 output is on port 1
>>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>>   - the split of the memory area shared between the 2 OSPI instances.
>>   - chip select selection override.
>>   - the time between 2 transactions in multiplexed mode.
>>   - check firewall access.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  drivers/memory/Kconfig     |  18 ++
>>  drivers/memory/Makefile    |   1 +
>>  drivers/memory/stm32_omm.c | 476 +++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 495 insertions(+)
>>
>> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
>> index c82d8d8a16eaf154c247c0dbb9aff428b7c81402..bc7ab46bd8b98a89f0d9173e884a99b778cdc9c4 100644
>> --- a/drivers/memory/Kconfig
>> +++ b/drivers/memory/Kconfig
>> @@ -225,6 +225,24 @@ config STM32_FMC2_EBI
>>  	  devices (like SRAM, ethernet adapters, FPGAs, LCD displays, ...) on
>>  	  SOCs containing the FMC2 External Bus Interface.
>>  
>> +config STM32_OMM
>> +	tristate "STM32 Octo Memory Manager"
>> +	depends on ARCH_STM32 || COMPILE_TEST
>> +	depends on SPI_STM32_OSPI
> 
> I don't think you tested for the reported issue. I reported that
> firewall symbols are missing and you add dependency on ospi. How is that
> related? How does this solve any problem?

Hi Krzysztof

The dependency with SPI_STM32_OSPI was already present since the beginning.
I just added dependency on ARCH_STM32 on this current version to avoid issue on x86_64 arch.

On my side i tested compilation on arm, arm64 and x86_64 without any issue.

I tried to reproduce your build process:



make -j16 defconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'x86_64_defconfig'
#
# configuration written to .config
#

scripts/config --file .config -e COMPILE_TEST -e OF -e SRAM -e MEMORY -e PM_DEVFREQ -e FPGA -e FPGA_DFL

scripts/config --file .config -e SAMSUNG_MC
scripts/config --file .config -e EXYNOS5422_DMC
scripts/config --file .config -e EXYNOS_SROM
scripts/config --file .config -e TEGRA_MC
scripts/config --file .config -e TEGRA20_EMC
scripts/config --file .config -e TEGRA30_EMC
scripts/config --file .config -e TEGRA124_EMC
scripts/config --file .config -e TEGRA210_EMC_TABLE
scripts/config --file .config -e TEGRA210_EMC
scripts/config --file .config -e MEMORY
scripts/config --file .config -e DDR
scripts/config --file .config -e ARM_PL172_MPMC
scripts/config --file .config -e ATMEL_EBI
scripts/config --file .config -e BRCMSTB_DPFE
scripts/config --file .config -e BRCMSTB_MEMC
scripts/config --file .config -e BT1_L2_CTL
scripts/config --file .config -e TI_AEMIF
scripts/config --file .config -e TI_EMIF
scripts/config --file .config -e OMAP_GPMC
scripts/config --file .config -e OMAP_GPMC_DEBUG
scripts/config --file .config -e TI_EMIF_SRAM
scripts/config --file .config -e FPGA_DFL_EMIF
scripts/config --file .config -e MVEBU_DEVBUS
scripts/config --file .config -e FSL_CORENET_CF
scripts/config --file .config -e FSL_IFC
scripts/config --file .config -e JZ4780_NEMC
scripts/config --file .config -e MTK_SMI
scripts/config --file .config -e DA8XX_DDRCTL
scripts/config --file .config -e PL353_SMC
scripts/config --file .config -e RENESAS_RPCIF
scripts/config --file .config -e STM32_FMC2_EBI
scripts/config --file .config -e STM32_OMM

make -j16 olddefconfig

#
# configuration written to .config
#

make -j16

SYNC    include/config/auto.conf.cmd
  GEN     arch/x86/include/generated/asm/orc_hash.h
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  UPD     include/generated/uapi/linux/version.h
  SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  UPD     arch/x86/include/generated/asm/cpufeaturemasks.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  HOSTCC  scripts/dtc/dtc.o

[...]

 CC      drivers/gpu/drm/i915/i915_vgpu.o
  AR      drivers/gpu/drm/i915/built-in.a
  AR      drivers/gpu/drm/built-in.a
  AR      drivers/gpu/built-in.a
  AR      drivers/built-in.a
  AR      built-in.a
  AR      vmlinux.a
  LD      vmlinux.o
  OBJCOPY modules.builtin.modinfo
  GEN     modules.builtin
  MODPOST Module.symvers
  CC      .vmlinux.export.o
  CC [M]  fs/efivarfs/efivarfs.mod.o
  CC [M]  .module-common.o
  CC [M]  drivers/thermal/intel/x86_pkg_temp_thermal.mod.o
  CC [M]  drivers/cpufreq/mediatek-cpufreq-hw.mod.o
  CC [M]  drivers/perf/thunderx2_pmu.mod.o
  CC [M]  net/netfilter/xt_mark.mod.o
  CC [M]  net/netfilter/nf_log_syslog.mod.o
  CC [M]  net/netfilter/xt_nat.mod.o
  CC [M]  net/netfilter/xt_LOG.mod.o
  CC [M]  net/netfilter/xt_MASQUERADE.mod.o
  CC [M]  net/netfilter/xt_addrtype.mod.o
  CC [M]  net/ipv4/netfilter/iptable_nat.mod.o
  LD [M]  fs/efivarfs/efivarfs.ko
  LD [M]  drivers/cpufreq/mediatek-cpufreq-hw.ko
  LD [M]  drivers/thermal/intel/x86_pkg_temp_thermal.ko
  LD [M]  drivers/perf/thunderx2_pmu.ko
  LD [M]  net/netfilter/xt_mark.ko
  LD [M]  net/netfilter/nf_log_syslog.ko
  LD [M]  net/ipv4/netfilter/iptable_nat.ko
  LD [M]  net/netfilter/xt_MASQUERADE.ko
  LD [M]  net/netfilter/xt_addrtype.ko
  LD [M]  net/netfilter/xt_LOG.ko
  LD [M]  net/netfilter/xt_nat.ko
  UPD     include/generated/utsversion.h
  CC      init/version-timestamp.o
  KSYMS   .tmp_vmlinux0.kallsyms.S
  AS      .tmp_vmlinux0.kallsyms.o
  LD      .tmp_vmlinux1
  NM      .tmp_vmlinux1.syms
  KSYMS   .tmp_vmlinux1.kallsyms.S
  AS      .tmp_vmlinux1.kallsyms.o
  LD      .tmp_vmlinux2
  NM      .tmp_vmlinux2.syms
  KSYMS   .tmp_vmlinux2.kallsyms.S
  AS      .tmp_vmlinux2.kallsyms.o
  LD      vmlinux.unstripped
  NM      System.map
  SORTTAB vmlinux.unstripped
  RSTRIP  vmlinux
  CC      arch/x86/boot/a20.o
  AS      arch/x86/boot/bioscall.o
  CC      arch/x86/boot/cmdline.o
  AS      arch/x86/boot/copy.o
  HOSTCC  arch/x86/boot/mkcpustr
  CC      arch/x86/boot/cpuflags.o
  CC      arch/x86/boot/cpucheck.o
  CC      arch/x86/boot/edd.o
  CC      arch/x86/boot/early_serial_console.o
  CC      arch/x86/boot/main.o
  CC      arch/x86/boot/memory.o
  CC      arch/x86/boot/pm.o
  AS      arch/x86/boot/pmjump.o
  CC      arch/x86/boot/printf.o
  CC      arch/x86/boot/regs.o
  CC      arch/x86/boot/string.o
  CC      arch/x86/boot/tty.o
  CC      arch/x86/boot/video.o
  CC      arch/x86/boot/video-mode.o
  CC      arch/x86/boot/version.o
  CC      arch/x86/boot/video-vga.o
  CC      arch/x86/boot/video-vesa.o
  CC      arch/x86/boot/video-bios.o
  CPUSTR  arch/x86/boot/cpustr.h
  CC      arch/x86/boot/cpu.o
  LDS     arch/x86/boot/compressed/vmlinux.lds
  AS      arch/x86/boot/compressed/kernel_info.o
  AS      arch/x86/boot/compressed/head_64.o
  VOFFSET arch/x86/boot/compressed/../voffset.h
  CC      arch/x86/boot/compressed/string.o
  CC      arch/x86/boot/compressed/error.o
  CC      arch/x86/boot/compressed/cmdline.o
  OBJCOPY arch/x86/boot/compressed/vmlinux.bin
  RELOCS  arch/x86/boot/compressed/vmlinux.relocs
  HOSTCC  arch/x86/boot/compressed/mkpiggy
  CC      arch/x86/boot/compressed/cpuflags.o
  CC      arch/x86/boot/compressed/early_serial_console.o
  CC      arch/x86/boot/compressed/kaslr.o
  CC      arch/x86/boot/compressed/ident_map_64.o
  CC      arch/x86/boot/compressed/idt_64.o
  AS      arch/x86/boot/compressed/idt_handlers_64.o
  CC      arch/x86/boot/compressed/pgtable_64.o
  AS      arch/x86/boot/compressed/la57toggle.o
  CC      arch/x86/boot/compressed/acpi.o
  CC      arch/x86/boot/compressed/efi.o
  GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
  CC      arch/x86/boot/compressed/misc.o
  MKPIGGY arch/x86/boot/compressed/piggy.S
  AS      arch/x86/boot/compressed/piggy.o
  LD      arch/x86/boot/compressed/vmlinux
  ZOFFSET arch/x86/boot/zoffset.h
  OBJCOPY arch/x86/boot/vmlinux.bin
  AS      arch/x86/boot/header.o
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#1)


As shown there is no issue, i don't know what is missing to reproduce the issue ?

Thanks
Patrice

> 
> And to be sure, I applied this and obviously - as expected - same errors.
> 
> Best regards,
> Krzysztof
