Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BBF211472
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991694; cv=none; b=DMp36Akc7bCf/MVAHT+T141nC3oLaAL0xBOHS64RwVRRQD+LAneJ5Mx12NkcnQqqGx74bHvgw7NL4wtkIcAmvSJBsKgbNPyXcZPV1D+OIDv2vcvJ4zzQAPXWtnXSLBUDvUT2dW/O2cjvCkCspBc2YdtDd1n+k2stuP8wV5O42fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991694; c=relaxed/simple;
	bh=wE3sPatgHC3cQJJPQrRV2qTL8I4yjDtsluRYyq8efU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JCTKNPeuiGwUCW0dEyfWufwFPnpgGuPuZN8EE6yByVBOyWwA7IV+/TzBoPGqBJSyBGhH/VUIfR3U6joJfHjxQsPs3X+EzH1DFPqUhTTORstALQXV04hdiieXXioBIQBfVma4SDasTGnsGH5Ev+lwz74ms4Rmc+l+/J6i9D4fRuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ZWLRTXgS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZWLRTXgS"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2320d06b728so50242595ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747991691; x=1748596491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SwRoPBovZC1wPx5i37h1EgM9hfTFVerR2GOpx5MhmSs=;
        b=ZWLRTXgSz91yLiiwJ686fmhRbboN5GhkCyvle6bU0vAeeOrBtEv6kGoduqcmK7Wz8G
         WSICcmTkGjRCawiZ6U5VfTZv4Fvsqi+A5bXYhYM+pzkZPZnyBHEWk3P9/lvZpkhQyFUy
         JARIke/w3UyyYt0lVr7fARbN22nrvvCrQdq0oLAoFXeolHdXwIn8wXPlnD0zMeppo4r/
         25S3mEjaXbJhA0X2/MrUdQs/obHMDX0rv9RwNFzbWyixffrvi/CNrYvhpC+0/kxyq1ek
         mlvAFgEC/hUORjTjatj6TL3nd+YRplsawYPGwQ1/cgSihRi0vmBPLm3yHZ1W0s+Qcltj
         0H1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747991691; x=1748596491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SwRoPBovZC1wPx5i37h1EgM9hfTFVerR2GOpx5MhmSs=;
        b=eXpS5GkaUNhtIZM4l7pVVX7wXv9tptQJaGDyo8Qa+GrFTy9r0eigvR2qsknSZWH26N
         8JXODdw5xQb1T1ZIime/urghumz050VV96ToY5XVpWAs83+eWN8pQNL1L9Cn9NPvHF/6
         SXuTCddrsYccQBvNmCJWxW4Yj8IOynfUVcEeSR5euK+6V0Z7LcSvrtARhkFkZC+ABVOW
         A/XeBn2OhVmwQo4wPnDFQogzPGu0MCHDl6I1hNYjDSZ1J9MK/jXAhl1fnLK6DXKxciOC
         zyfwin/P/879r2ozi25rhNvEIC9wlayKo3CqNeknR6PUY6l3EOAs4n6VKAU4y7mTcXVC
         8VnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWROrBXmSQlx/AocmgvNKCz7L7KUqoyH0HeYUnjP2BrFcRT2xl4Rvf9FK8z53ga3JySbU41qI9Dhqi7r3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBZNN8FTHAUAIsVPMPm7HA9ycQ6qwXROfiJ3xtonr/cU3u/WMN
	sttrTlekflsdfDvXVq2jo3aZZlq8CmcC9XYPlCN8B3xu2XBarWC19pBbeJOFnd+27GI=
X-Gm-Gg: ASbGncsgLFKZfSsACVr5vLdB7ei+itwh50vgYuPTyPUOiI4X2+peK1cpj0YsrXb4HuB
	rdJqXX0E+vTpuKqyb2Emqk/4ImB8suXRUI8esLP7iucU1wP1n5KUtX+ko7bu8j0pweYunHJGDnJ
	4MCbuLpDlvX9O0kYbV5ym2zcUXyvd1LjGMSkWytzd2KBU8ZW1l7O/581JgUbMr9iu7JWBDd7e/G
	1IS4oOnOrQuoJacc2ouyr+Lrn+ktJJO0xLIbk5lZi9FK/vA4AuR0mW66dGOH6kISdH4ZjTsfYG2
	yGl0xUopckljfcrC+uesmmRv8fyEU0rvXbgp9Nu8EAtOPX3IKj1ns0RHuewy+vOMCeU2k8aHPgY
	Ap8khS10Mvy4DMvMuUEMwvHa9WsLAODk=
X-Google-Smtp-Source: AGHT+IFr73FLQgyHZT5ELWUF66z/tgqzBgfsRbDVp1R0pvIusqrJ6/1WrYj2A3/VEZyWNyZ8S9Y+Vg==
X-Received: by 2002:a17:903:24f:b0:223:7006:4db2 with SMTP id d9443c01a7336-231d43d9a11mr342348725ad.31.1747991690633;
        Fri, 23 May 2025 02:14:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9249sm121100905ad.44.2025.05.23.02.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 02:14:49 -0700 (PDT)
Message-ID: <b588d482-dded-4efc-aeda-d02ff331ad8d@rivosinc.com>
Date: Fri, 23 May 2025 11:14:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drivers: firmware: add riscv SSE support
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250516152355.560448-1-cleger@rivosinc.com>
 <20250516152355.560448-4-cleger@rivosinc.com>
 <874ixfhzr4.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <874ixfhzr4.fsf@all.your.base.are.belong.to.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20/05/2025 21:02, Björn Töpel wrote:
> Clément Léger <cleger@rivosinc.com> writes:
> 
>> Add driver level interface to use RISC-V SSE arch support. This interface
>> allows registering SSE handlers, and receive them. This will be used by
>> PMU and GHES driver.
>>
>> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>> Co-developed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  MAINTAINERS                        |  15 +
>>  drivers/firmware/Kconfig           |   1 +
>>  drivers/firmware/Makefile          |   1 +
>>  drivers/firmware/riscv/Kconfig     |  15 +
>>  drivers/firmware/riscv/Makefile    |   3 +
>>  drivers/firmware/riscv/riscv_sse.c | 696 +++++++++++++++++++++++++++++
>>  include/linux/riscv_sse.h          |  59 +++
>>  7 files changed, 790 insertions(+)
>>  create mode 100644 drivers/firmware/riscv/Kconfig
>>  create mode 100644 drivers/firmware/riscv/Makefile
>>  create mode 100644 drivers/firmware/riscv/riscv_sse.c
>>  create mode 100644 include/linux/riscv_sse.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 3563492e4eba..ae21147bf71d 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20892,6 +20892,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
>>  F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>>  F:	drivers/iommu/riscv/
>>  
>> +RISC-V FIRMWARE DRIVERS
>> +M:	Conor Dooley <conor@kernel.org>
>> +L:	linux-riscv@lists.infradead.org
>> +S:	Maintained
>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
>> +F:	drivers/firmware/riscv/*
>> +
>>  RISC-V MICROCHIP FPGA SUPPORT
>>  M:	Conor Dooley <conor.dooley@microchip.com>
>>  M:	Daire McNamara <daire.mcnamara@microchip.com>
>> @@ -20956,6 +20963,14 @@ F:	arch/riscv/boot/dts/spacemit/
>>  N:	spacemit
>>  K:	spacemit
>>  
>> +RISC-V SSE DRIVER
>> +M:	Clément Léger <cleger@rivosinc.com>
>> +R:	Himanshu Chauhan <himanshu@thechauhan.dev>
>> +L:	linux-riscv@lists.infradead.org
>> +S:	Maintained
>> +F:	drivers/firmware/riscv/riscv_sse.c
>> +F:	include/linux/riscv_sse.h
>> +
>>  RISC-V THEAD SoC SUPPORT
>>  M:	Drew Fustini <drew@pdp7.com>
>>  M:	Guo Ren <guoren@kernel.org>
>> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
>> index aadc395ee168..fe72e705067c 100644
>> --- a/drivers/firmware/Kconfig
>> +++ b/drivers/firmware/Kconfig
>> @@ -278,6 +278,7 @@ source "drivers/firmware/meson/Kconfig"
>>  source "drivers/firmware/microchip/Kconfig"
>>  source "drivers/firmware/psci/Kconfig"
>>  source "drivers/firmware/qcom/Kconfig"
>> +source "drivers/firmware/riscv/Kconfig"
>>  source "drivers/firmware/samsung/Kconfig"
>>  source "drivers/firmware/smccc/Kconfig"
>>  source "drivers/firmware/tegra/Kconfig"
>> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
>> index 4ddec2820c96..6cdd84570ea7 100644
>> --- a/drivers/firmware/Makefile
>> +++ b/drivers/firmware/Makefile
>> @@ -34,6 +34,7 @@ obj-y				+= efi/
>>  obj-y				+= imx/
>>  obj-y				+= psci/
>>  obj-y				+= qcom/
>> +obj-y				+= riscv/
>>  obj-y				+= samsung/
>>  obj-y				+= smccc/
>>  obj-y				+= tegra/
>> diff --git a/drivers/firmware/riscv/Kconfig b/drivers/firmware/riscv/Kconfig
>> new file mode 100644
>> index 000000000000..8056ed3262d9
>> --- /dev/null
>> +++ b/drivers/firmware/riscv/Kconfig
>> @@ -0,0 +1,15 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +menu "Risc-V Specific firmware drivers"
>> +depends on RISCV
>> +
>> +config RISCV_SSE
>> +	bool "Enable SBI Supervisor Software Events support"
>> +	depends on RISCV_SBI
>> +	default y
>> +	help
>> +	  The Supervisor Software Events support allow the SBI to deliver
>> +	  NMI-like notifications to the supervisor mode software. When enable,
>> +	  this option provides support to register callbacks on specific SSE
>> +	  events.
>> +
>> +endmenu
>> diff --git a/drivers/firmware/riscv/Makefile b/drivers/firmware/riscv/Makefile
>> new file mode 100644
>> index 000000000000..4ccfcbbc28ea
>> --- /dev/null
>> +++ b/drivers/firmware/riscv/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_RISCV_SSE)		+= riscv_sse.o
>> diff --git a/drivers/firmware/riscv/riscv_sse.c b/drivers/firmware/riscv/riscv_sse.c
>> new file mode 100644
>> index 000000000000..05e4bc8dfa99
>> --- /dev/null
>> +++ b/drivers/firmware/riscv/riscv_sse.c
>> @@ -0,0 +1,696 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2024 Rivos Inc.
>> + */
>> +
>> +#define pr_fmt(fmt) "sse: " fmt
>> +
>> +#include <linux/cpu.h>
>> +#include <linux/cpuhotplug.h>
>> +#include <linux/cpu_pm.h>
>> +#include <linux/hardirq.h>
>> +#include <linux/list.h>
>> +#include <linux/percpu-defs.h>
>> +#include <linux/reboot.h>
>> +#include <linux/riscv_sse.h>
>> +#include <linux/slab.h>
>> +
>> +#include <asm/sbi.h>
>> +#include <asm/sse.h>
>> +
>> +struct sse_event {
>> +	struct list_head list;
>> +	u32 evt_id;
>> +	u32 priority;
>> +	sse_event_handler *handler;
>> +	void *handler_arg;
>> +	/* Only valid for global events */
>> +	unsigned int cpu;
>> +
>> +	union {
>> +		struct sse_registered_event *global;
>> +		struct sse_registered_event __percpu *local;
>> +	};
>> +};
>> +
>> +static int sse_hp_state;
>> +static bool sse_available;
> 
> __read_mostly candidates?

It can even be __ro_after_init I think.

> 
>> +static DEFINE_SPINLOCK(events_list_lock);
>> +static LIST_HEAD(events);
>> +static DEFINE_MUTEX(sse_mutex);
>> +
>> +struct sse_registered_event {
>> +	struct sse_event_arch_data arch;
>> +	struct sse_event *event;
>> +	unsigned long attr_buf;
>> +	bool is_enabled;
>> +};
>> +
>> +void sse_handle_event(struct sse_event_arch_data *arch_event,
>> +		      struct pt_regs *regs)
>> +{
>> +	int ret;
>> +	struct sse_registered_event *reg_evt =
>> +		container_of(arch_event, struct sse_registered_event, arch);
>> +	struct sse_event *evt = reg_evt->event;
>> +
>> +	ret = evt->handler(evt->evt_id, evt->handler_arg, regs);
>> +	if (ret)
>> +		pr_warn("event %x handler failed with error %d\n", evt->evt_id,
>> +			ret);
> 
> Nit: Candidate for 100 chars

Done

> 
>> +}
>> +
>> +static struct sse_event *sse_event_get(u32 evt)
>> +{
>> +	struct sse_event *event = NULL, *tmp;
>> +
>> +	scoped_guard(spinlock, &events_list_lock) {
>> +		list_for_each_entry(tmp, &events, list) {
>> +			if (tmp->evt_id == evt)
>> +				return event;
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static phys_addr_t sse_event_get_phys(struct sse_registered_event *reg_evt,
>> +				      void *addr)
>> +{
>> +	phys_addr_t phys;
>> +
>> +	if (sse_event_is_global(reg_evt->event->evt_id))
>> +		phys = virt_to_phys(addr);
>> +	else
>> +		phys = per_cpu_ptr_to_phys(addr);
>> +
>> +	return phys;
>> +}
>> +
>> +static struct sse_registered_event *sse_get_reg_evt(struct sse_event *event)
>> +{
>> +	if (sse_event_is_global(event->evt_id))
>> +		return event->global;
>> +	else
>> +		return per_cpu_ptr(event->local, smp_processor_id());
>> +}
>> +
>> +static int sse_sbi_event_func(struct sse_event *event, unsigned long func)
>> +{
>> +	struct sbiret ret;
>> +	u32 evt = event->evt_id;
>> +	struct sse_registered_event *reg_evt = sse_get_reg_evt(event);
>> +
>> +	ret = sbi_ecall(SBI_EXT_SSE, func, evt, 0, 0, 0, 0, 0);
>> +	if (ret.error)
>> +		pr_debug("Failed to execute func %lx, event %x, error %ld\n",
>> +			 func, evt, ret.error);
>> +
> 
> Would probably fit in 100 chars! Is pr_debug() correct here? Seems more important!

I'll replaced the few pr_debug() I have there with pr_warn().

> 
>> +	if (func == SBI_SSE_EVENT_DISABLE)
>> +		reg_evt->is_enabled = false;
>> +	else if (func == SBI_SSE_EVENT_ENABLE)
>> +		reg_evt->is_enabled = true;
>> +
> 
> Hmm, the event is updated, even if the call fail?

/o\

> 
>> +	return sbi_err_map_linux_errno(ret.error);
>> +}
>> +
>> +int sse_event_disable_local(struct sse_event *event)
>> +{
>> +	return sse_sbi_event_func(event, SBI_SSE_EVENT_DISABLE);
>> +}
>> +
>> +int sse_event_enable_local(struct sse_event *event)
>> +{
>> +	return sse_sbi_event_func(event, SBI_SSE_EVENT_ENABLE);
>> +}
>> +
>> +static int sse_event_attr_get_no_lock(struct sse_registered_event *reg_evt,
> 
> It's "nolock" everywhere except here!

I'll satisfy your OCD and rename it nolock as well ;)

> 
>> +				      unsigned long attr_id, unsigned long *val)
>> +{
>> +	struct sbiret sret;
>> +	u32 evt = reg_evt->event->evt_id;
>> +	unsigned long phys;
>> +
>> +	phys = sse_event_get_phys(reg_evt, &reg_evt->attr_buf);
> 
> Seems like the sse_event_get_phys() could get a better name, and only
> have the reg_evt passed? This is just getting the PA of the attr Also,
> attr_buf? Why buf?

yeah initially it was used for another phys as well but that was
removed. I've renamed it sse_event_get_attr_phys(reg_evt).

> 
>> +
>> +	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, evt,
>> +				     attr_id, 1, phys, 0, 0);
>> +	if (sret.error) {
>> +		pr_debug("Failed to get event %x attr %lx, error %ld\n", evt,
>> +			 attr_id, sret.error);
> 
> Same Q on pr_debug() vs pr_warn().
> 
>> +		return sbi_err_map_linux_errno(sret.error);
>> +	}
>> +
>> +	*val = reg_evt->attr_buf;
>> +
>> +	return 0;
>> +}
>> +
>> +static int sse_event_attr_set_nolock(struct sse_registered_event *reg_evt,
>> +				     unsigned long attr_id, unsigned long val)
>> +{
>> +	struct sbiret sret;
>> +	u32 evt = reg_evt->event->evt_id;
>> +	unsigned long phys;
>> +
>> +	reg_evt->attr_buf = val;
>> +	phys = sse_event_get_phys(reg_evt, &reg_evt->attr_buf);
>> +
>> +	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_WRITE, evt,
>> +				     attr_id, 1, phys, 0, 0);
>> +	if (sret.error) {
>> +		pr_debug("Failed to set event %x attr %lx, error %ld\n", evt,
>> +			 attr_id, sret.error);
> 
> Dito.
> 
>> +		return sbi_err_map_linux_errno(sret.error);
> 
> Can be remove out of the if-statement, and remove "return 0".

Done

> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int sse_event_set_target_cpu_nolock(struct sse_event *event,
>> +					   unsigned int cpu)
>> +{
>> +	unsigned int hart_id = cpuid_to_hartid_map(cpu);
>> +	struct sse_registered_event *reg_evt = event->global;
>> +	u32 evt = event->evt_id;
>> +	bool was_enabled;
>> +	int ret;
>> +
>> +	if (!sse_event_is_global(evt))
>> +		return -EINVAL;
>> +
>> +	was_enabled = reg_evt->is_enabled;
>> +	if (was_enabled)
>> +		sse_event_disable_local(event);
>> +	do {
>> +		ret = sse_event_attr_set_nolock(reg_evt,
>> +						SBI_SSE_ATTR_PREFERRED_HART,
>> +						hart_id);
>> +	} while (ret == -EINVAL);
> 
> Please explain the while-loop rationale! Scary!

The spec actually says that setting the preferred hart while the SSE
event is running will return INVALID_STATE. In our case, this is only
used by either:
- Register code (so we know the event isn't running)
- cpu_hotplug remove, in which case the event will be disable by the
owning hart before and thus, we know it isn't running as well since
events were masked. I'll remove this loop and let the error be
propagated if any.

> 
>> +
>> +	if (ret == 0)
>> +		event->cpu = cpu;
>> +
>> +	if (was_enabled)
>> +		sse_event_enable_local(event);
>> +
>> +	return 0;
>> +}
>> +
>> +int sse_event_set_target_cpu(struct sse_event *event, unsigned int cpu)
>> +{
>> +	int ret;
>> +
>> +	scoped_guard(mutex, &sse_mutex) {
>> +		cpus_read_lock();
>> +
>> +		if (!cpu_online(cpu))
>> +			return -EINVAL;
> 
> cpus_read_unlock() missing! If only there was some way of having a
> scoped guard! ;-P Hint: guard(cpus_read_lock)(); and clean up the return
> path.

Yeah, that patch and the conversion to scoped guard was made before the
cpu_read_lock guard was added (late 2024). I'll use it.

> 
>> +
>> +		ret = sse_event_set_target_cpu_nolock(event, cpu);
>> +
>> +		cpus_read_unlock();
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int sse_event_init_registered(unsigned int cpu,
>> +				     struct sse_registered_event *reg_evt,
>> +				     struct sse_event *event)
>> +{
>> +	reg_evt->event = event;
>> +	arch_sse_init_event(&reg_evt->arch, event->evt_id, cpu);
> 
> This function can fail!

I'll simply return arch_sse_init_event(&reg_evt->arch, event->evt_id, cpu);

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static void sse_event_free_registered(struct sse_registered_event *reg_evt)
>> +{
>> +	arch_sse_free_event(&reg_evt->arch);
>> +}
>> +
>> +static int sse_event_alloc_global(struct sse_event *event)
>> +{
>> +	int err;
>> +	struct sse_registered_event *reg_evt;
>> +
>> +	reg_evt = kzalloc(sizeof(*reg_evt), GFP_KERNEL);
>> +	if (!reg_evt)
>> +		return -ENOMEM;
>> +
>> +	event->global = reg_evt;
>> +	err = sse_event_init_registered(smp_processor_id(), reg_evt, event);
>> +	if (err)
>> +		kfree(reg_evt);
>> +
>> +	return err;
>> +}
>> +
>> +static int sse_event_alloc_local(struct sse_event *event)
>> +{
>> +	int err;
>> +	unsigned int cpu, err_cpu;
>> +	struct sse_registered_event *reg_evt;
>> +	struct sse_registered_event __percpu *reg_evts;
>> +
>> +	reg_evts = alloc_percpu(struct sse_registered_event);
>> +	if (!reg_evts)
>> +		return -ENOMEM;
>> +
>> +	event->local = reg_evts;
>> +
>> +	for_each_possible_cpu(cpu) {
>> +		reg_evt = per_cpu_ptr(reg_evts, cpu);
>> +		err = sse_event_init_registered(cpu, reg_evt, event);
>> +		if (err) {
>> +			err_cpu = cpu;
>> +			goto err_free_per_cpu;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +err_free_per_cpu:
>> +	for_each_possible_cpu(cpu) {
>> +		if (cpu == err_cpu)
>> +			break;
>> +		reg_evt = per_cpu_ptr(reg_evts, cpu);
>> +		sse_event_free_registered(reg_evt);
>> +	}
>> +
>> +	free_percpu(reg_evts);
>> +
>> +	return err;
>> +}
>> +
>> +static struct sse_event *sse_event_alloc(u32 evt, u32 priority,
>> +					 sse_event_handler *handler, void *arg)
>> +{
>> +	int err;
>> +	struct sse_event *event;
>> +
>> +	event = kzalloc(sizeof(*event), GFP_KERNEL);
>> +	if (!event)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	event->evt_id = evt;
>> +	event->priority = priority;
>> +	event->handler_arg = arg;
>> +	event->handler = handler;
>> +
>> +	if (sse_event_is_global(evt)) {
>> +		err = sse_event_alloc_global(event);
>> +		if (err)
>> +			goto err_alloc_reg_evt;
>> +	} else {
>> +		err = sse_event_alloc_local(event);
>> +		if (err)
>> +			goto err_alloc_reg_evt;
> 
> Move the if (err) clause out -- simplify.

Acked

> 
>> +	}
>> +
>> +	return event;
>> +
>> +err_alloc_reg_evt:
>> +	kfree(event);
>> +
>> +	return ERR_PTR(err);
>> +}
>> +
>> +static int sse_sbi_register_event(struct sse_event *event,
>> +				  struct sse_registered_event *reg_evt)
>> +{
>> +	int ret;
>> +
>> +	ret = sse_event_attr_set_nolock(reg_evt, SBI_SSE_ATTR_PRIO,
>> +					event->priority);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return arch_sse_register_event(&reg_evt->arch);
>> +}
>> +
>> +static int sse_event_register_local(struct sse_event *event)
>> +{
>> +	int ret;
> 
> Add space.
> 
>> +	struct sse_registered_event *reg_evt = per_cpu_ptr(event->local,
>> +							   smp_processor_id());
>> +
>> +	ret = sse_sbi_register_event(event, reg_evt);
>> +	if (ret)
>> +		pr_debug("Failed to register event %x: err %d\n", event->evt_id,
>> +			 ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int sse_sbi_unregister_event(struct sse_event *event)
>> +{
>> +	return sse_sbi_event_func(event, SBI_SSE_EVENT_UNREGISTER);
>> +}
>> +
>> +struct sse_per_cpu_evt {
>> +	struct sse_event *event;
>> +	unsigned long func;
>> +	atomic_t error;
>> +};
>> +
>> +static void sse_event_per_cpu_func(void *info)
>> +{
>> +	int ret;
>> +	struct sse_per_cpu_evt *cpu_evt = info;
>> +
>> +	if (cpu_evt->func == SBI_SSE_EVENT_REGISTER)
>> +		ret = sse_event_register_local(cpu_evt->event);
>> +	else
>> +		ret = sse_sbi_event_func(cpu_evt->event, cpu_evt->func);
>> +
>> +	if (ret)
>> +		atomic_set(&cpu_evt->error, ret);
>> +}
>> +
>> +static void sse_event_free(struct sse_event *event)
>> +{
>> +	unsigned int cpu;
>> +	struct sse_registered_event *reg_evt;
>> +
>> +	if (sse_event_is_global(event->evt_id)) {
>> +		sse_event_free_registered(event->global);
>> +		kfree(event->global);
>> +	} else {
>> +		for_each_possible_cpu(cpu) {
>> +			reg_evt = per_cpu_ptr(event->local, cpu);
>> +			sse_event_free_registered(reg_evt);
>> +		}
>> +		free_percpu(event->local);
>> +	}
>> +
>> +	kfree(event);
>> +}
>> +
>> +int sse_event_enable(struct sse_event *event)
>> +{
>> +	int ret = 0, cpu;
>> +	struct sse_per_cpu_evt cpu_evt;
>> +	struct sse_registered_event *reg_evt;
>> +
>> +	scoped_guard(mutex, &sse_mutex) {
>> +		cpus_read_lock();
>> +		if (sse_event_is_global(event->evt_id)) {
>> +			reg_evt = event->global;
>> +			ret = sse_event_enable_local(event);
>> +		} else {
>> +			cpu_evt.event = event;
>> +			atomic_set(&cpu_evt.error, 0);
>> +			cpu_evt.func = SBI_SSE_EVENT_ENABLE;
>> +			on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
>> +			ret = atomic_read(&cpu_evt.error);
>> +			if (ret) {
>> +				cpu_evt.func = SBI_SSE_EVENT_DISABLE;
>> +				on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
>> +			} else {
>> +				for_each_online_cpu(cpu) {
> 
> Something missing?
> 
> Also, use guard() to simplify this!

Acked

> 
>> +
>> +				}
>> +			}
>> +		}
>> +		cpus_read_unlock();
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static void sse_events_mask(void)
>> +{
>> +	sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_HART_MASK, 0, 0, 0, 0, 0, 0);
> 
> Return value?

yeah sure.

> 
>> +}
>> +
>> +static void sse_events_unmask(void)
>> +{
>> +	sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_HART_UNMASK, 0, 0, 0, 0, 0, 0);
>> +}
>> +
>> +static void sse_event_disable_nolock(struct sse_event *event)
>> +{
>> +	struct sse_per_cpu_evt cpu_evt;
>> +
>> +	if (sse_event_is_global(event->evt_id)) {
>> +		sse_event_disable_local(event);
>> +	} else {
>> +		cpu_evt.event = event;
>> +		cpu_evt.func = SBI_SSE_EVENT_DISABLE;
>> +		on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
>> +	}
>> +}
>> +
>> +void sse_event_disable(struct sse_event *event)
>> +{
>> +	scoped_guard(mutex, &sse_mutex) {
>> +		cpus_read_lock();
>> +		sse_event_disable_nolock(event);
>> +		cpus_read_unlock();
>> +	}
>> +}
>> +
>> +struct sse_event *sse_event_register(u32 evt, u32 priority,
>> +				     sse_event_handler *handler, void *arg)
>> +{
>> +	struct sse_per_cpu_evt cpu_evt;
>> +	struct sse_event *event;
>> +	int ret = 0;
>> +
>> +	if (!sse_available)
>> +		return ERR_PTR(-EOPNOTSUPP);
>> +
>> +	mutex_lock(&sse_mutex);
>> +	if (sse_event_get(evt)) {
>> +		pr_debug("Event %x already registered\n", evt);
>> +		ret = -EEXIST;
>> +		goto out_unlock;
>> +	}
>> +
>> +	event = sse_event_alloc(evt, priority, handler, arg);
>> +	if (IS_ERR(event)) {
>> +		ret = PTR_ERR(event);
>> +		goto out_unlock;
>> +	}
>> +
>> +	cpus_read_lock();
>> +	if (sse_event_is_global(evt)) {
>> +		unsigned long preferred_hart;
>> +
>> +		ret = sse_event_attr_get_no_lock(event->global,
>> +						 SBI_SSE_ATTR_PREFERRED_HART,
>> +						 &preferred_hart);
>> +		if (ret)
>> +			goto err_event_free;
>> +		event->cpu = riscv_hartid_to_cpuid(preferred_hart);
>> +
>> +		ret = sse_sbi_register_event(event, event->global);
>> +		if (ret)
>> +			goto err_event_free;
>> +
>> +	} else {
>> +		cpu_evt.event = event;
>> +		atomic_set(&cpu_evt.error, 0);
>> +		cpu_evt.func = SBI_SSE_EVENT_REGISTER;
>> +		on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
>> +		ret = atomic_read(&cpu_evt.error);
>> +		if (ret) {
>> +			cpu_evt.func = SBI_SSE_EVENT_UNREGISTER;
>> +			on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
>> +			goto err_event_free;
>> +		}
>> +	}
>> +	cpus_read_unlock();
>> +
>> +	scoped_guard(spinlock, &events_list_lock)
>> +		list_add(&event->list, &events);
>> +
>> +	mutex_unlock(&sse_mutex);
>> +
>> +	return event;
>> +
>> +err_event_free:
>> +	cpus_read_unlock();
>> +	sse_event_free(event);
>> +out_unlock:
>> +	mutex_unlock(&sse_mutex);
>> +
>> +	return ERR_PTR(ret);
>> +}
>> +
>> +static void sse_event_unregister_nolock(struct sse_event *event)
>> +{
>> +	struct sse_per_cpu_evt cpu_evt;
>> +
>> +	if (sse_event_is_global(event->evt_id)) {
>> +		sse_sbi_unregister_event(event);
>> +	} else {
>> +		cpu_evt.event = event;
>> +		cpu_evt.func = SBI_SSE_EVENT_UNREGISTER;
>> +		on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
>> +	}
>> +}
>> +
>> +void sse_event_unregister(struct sse_event *event)
>> +{
>> +	scoped_guard(mutex, &sse_mutex) {
>> +		cpus_read_lock();
>> +		sse_event_unregister_nolock(event);
>> +		cpus_read_unlock();
>> +
>> +		scoped_guard(spinlock, &events_list_lock)
>> +			list_del(&event->list);
>> +
>> +		sse_event_free(event);
>> +	}
>> +}
>> +
>> +static int sse_cpu_online(unsigned int cpu)
>> +{
>> +	struct sse_event *event;
>> +
>> +	scoped_guard(spinlock, &events_list_lock) {
>> +		list_for_each_entry(event, &events, list) {
>> +			if (sse_event_is_global(event->evt_id))
>> +				continue;
>> +
>> +			sse_event_register_local(event);
>> +			if (sse_get_reg_evt(event))
>> +				sse_event_enable_local(event);
>> +		}
>> +	}
>> +
>> +	/* Ready to handle events. Unmask SSE. */
>> +	sse_events_unmask();
>> +
>> +	return 0;
>> +}
>> +
>> +static int sse_cpu_teardown(unsigned int cpu)
>> +{
>> +	unsigned int next_cpu;
>> +	struct sse_event *event;
>> +
>> +	/* Mask the sse events */
>> +	sse_events_mask();
>> +
>> +	scoped_guard(spinlock, &events_list_lock) {
>> +		list_for_each_entry(event, &events, list) {
>> +			if (!sse_event_is_global(event->evt_id)) {
>> +
>> +				if (event->global->is_enabled)
>> +					sse_event_disable_local(event);
>> +
>> +				sse_sbi_unregister_event(event);
>> +				continue;
>> +			}
>> +
>> +			if (event->cpu != smp_processor_id())
>> +				continue;
>> +
>> +			/* Update destination hart for global event */
>> +			next_cpu = cpumask_any_but(cpu_online_mask, cpu);
>> +			sse_event_set_target_cpu_nolock(event, next_cpu);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void sse_reset(void)
>> +{
>> +	struct sse_event *event = NULL;
> 
> No need for init here.
> 
> 
> 
> Björn
> 
>> +
>> +	list_for_each_entry(event, &events, list) {
>> +		sse_event_disable_nolock(event);
>> +		sse_event_unregister_nolock(event);
>> +	}
>> +}
>> +
>> +static int sse_pm_notifier(struct notifier_block *nb, unsigned long action,
>> +			   void *data)
>> +{
>> +	WARN_ON_ONCE(preemptible());
>> +
>> +	switch (action) {
>> +	case CPU_PM_ENTER:
>> +		sse_events_mask();
>> +		break;
>> +	case CPU_PM_EXIT:
>> +	case CPU_PM_ENTER_FAILED:
>> +		sse_events_unmask();
>> +		break;
>> +	default:
>> +		return NOTIFY_DONE;
>> +	}
>> +
>> +	return NOTIFY_OK;
>> +}
>> +
>> +static struct notifier_block sse_pm_nb = {
>> +	.notifier_call = sse_pm_notifier,
>> +};
>> +
>> +/*
>> + * Mask all CPUs and unregister all events on panic, reboot or kexec.
>> + */
>> +static int sse_reboot_notifier(struct notifier_block *nb, unsigned long action,
>> +				void *data)
>> +{
>> +	cpuhp_remove_state(sse_hp_state);
>> +
>> +	sse_reset();
>> +
>> +	return NOTIFY_OK;
>> +}
>> +
>> +static struct notifier_block sse_reboot_nb = {
>> +	.notifier_call = sse_reboot_notifier,
>> +};
>> +
>> +static int __init sse_init(void)
>> +{
>> +	int cpu, ret;
>> +
>> +	if (sbi_probe_extension(SBI_EXT_SSE) <= 0) {
>> +		pr_err("Missing SBI SSE extension\n");
>> +		return -EOPNOTSUPP;
>> +	}
>> +	pr_info("SBI SSE extension detected\n");
>> +
>> +	for_each_possible_cpu(cpu)
>> +		INIT_LIST_HEAD(&events);
>> +
>> +	ret = cpu_pm_register_notifier(&sse_pm_nb);
>> +	if (ret) {
>> +		pr_warn("Failed to register CPU PM notifier...\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = register_reboot_notifier(&sse_reboot_nb);
>> +	if (ret) {
>> +		pr_warn("Failed to register reboot notifier...\n");
>> +		goto remove_cpupm;
>> +	}
>> +
>> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/sse:online",
>> +				sse_cpu_online, sse_cpu_teardown);
>> +	if (ret < 0)
>> +		goto remove_reboot;
>> +
>> +	sse_hp_state = ret;
>> +	sse_available = true;
>> +
>> +	return 0;
>> +
>> +remove_reboot:
>> +	unregister_reboot_notifier(&sse_reboot_nb);
>> +
>> +remove_cpupm:
>> +	cpu_pm_unregister_notifier(&sse_pm_nb);
>> +
>> +	return ret;
>> +}
>> +arch_initcall(sse_init);
>> diff --git a/include/linux/riscv_sse.h b/include/linux/riscv_sse.h
>> new file mode 100644
>> index 000000000000..8653fa74ec82
>> --- /dev/null
>> +++ b/include/linux/riscv_sse.h
>> @@ -0,0 +1,59 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2024 Rivos Inc.
>> + */
>> +
>> +#ifndef __LINUX_RISCV_SSE_H
>> +#define __LINUX_RISCV_SSE_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/linkage.h>
>> +
>> +struct sse_event;
>> +struct pt_regs;
>> +
>> +typedef int (sse_event_handler)(u32 event_num, void *arg, struct pt_regs *regs);
>> +
>> +#ifdef CONFIG_RISCV_SSE
>> +
>> +struct sse_event *sse_event_register(u32 event_num, u32 priority,
>> +				     sse_event_handler *handler, void *arg);
>> +
>> +void sse_event_unregister(struct sse_event *evt);
>> +
>> +int sse_event_set_target_cpu(struct sse_event *sse_evt, unsigned int cpu);
>> +
>> +int sse_event_enable(struct sse_event *sse_evt);
>> +
>> +void sse_event_disable(struct sse_event *sse_evt);
>> +
>> +int sse_event_enable_local(struct sse_event *sse_evt);
>> +int sse_event_disable_local(struct sse_event *sse_evt);
>> +
>> +#else
>> +static inline struct sse_event *sse_event_register(u32 event_num, u32 priority,
>> +						   sse_event_handler *handler,
>> +						   void *arg)
>> +{
>> +	return ERR_PTR(-EOPNOTSUPP);
>> +}
>> +
>> +static inline void sse_event_unregister(struct sse_event *evt) {}
>> +
>> +static inline int sse_event_set_target_cpu(struct sse_event *sse_evt,
>> +					   unsigned int cpu)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static inline int sse_event_enable(struct sse_event *sse_evt)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static inline void sse_event_disable(struct sse_event *sse_evt) {}
>> +
>> +
>> +#endif
>> +
>> +#endif /* __LINUX_RISCV_SSE_H */
>> -- 
>> 2.49.0
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

