Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F0CEAD7;
	Wed, 28 May 2025 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441732; cv=none; b=qD45FN+rm9chbFjNs2o2egRRwZ4EIja/hX7jVXmYAI4ZRZ+7fomskGPvp5hBbcKwECRhRIjbXjTnTs6DLS7uXnbs3nSoQCr+WB6p/T0TlbAOhzU10EXnn2+j1Qr1JpC2CP+806/+MNTgM26ld4EB0MkPOAK2x4158Ekht/A6hKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441732; c=relaxed/simple;
	bh=VTSrIEdQEdu3UCYZs59KzmUF3zx9ivQk+muz5QkMSLg=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dhj07ydmq4US670kWj1KtZNqC9aDxn9pGMkW+zhJ143rIB6sMK+LWaBiHzl016G7mNUHowdRsseDaQLPQ37UBKHbW5DP+WtDNpcCzK6YT6uq7IKXdTHNXYtCMH39mFbrSJSU7JRMLqUpEznfyLiOBXf2m40p0Tzlj/rWAkUcrrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b6s1x6GF0z6J9yF;
	Wed, 28 May 2025 22:14:13 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B8434140113;
	Wed, 28 May 2025 22:15:26 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 May
 2025 16:15:25 +0200
Date: Wed, 28 May 2025 15:15:24 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Sascha
 Bischoff" <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mark Rutland
	<mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 20/26] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <20250528151524.00006dd9@huawei.com>
In-Reply-To: <20250513-gicv5-host-v4-20-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
	<20250513-gicv5-host-v4-20-b36e9b15a6c3@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Tue, 13 May 2025 19:48:13 +0200
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> The GICv5 CPU interface implements support for PE-Private Peripheral
> Interrupts (PPI), that are handled (enabled/prioritized/delivered)
> entirely within the CPU interface hardware.
> 
> To enable PPI interrupts, implement the baseline GICv5 host kernel
> driver infrastructure required to handle interrupts on a GICv5 system.
> 
> Add the exception handling code path and definitions for GICv5
> instructions.
> 
> Add GICv5 PPI handling code as a specific IRQ domain to:
> 
> - Set-up PPI priority
> - Manage PPI configuration and state
> - Manage IRQ flow handler
> - IRQs allocation/free
> - Hook-up a PPI specific IRQchip to provide the relevant methods
> 
> PPI IRQ priority is chosen as the minimum allowed priority by the
> system design (after probing the number of priority bits implemented
> by the CPU interface).
> 
> Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>

A few trivial things inline.

J

> ---
>  MAINTAINERS                        |   2 +
>  arch/arm64/include/asm/sysreg.h    |  19 ++
>  drivers/irqchip/Kconfig            |   5 +
>  drivers/irqchip/Makefile           |   1 +
>  drivers/irqchip/irq-gic-v5.c       | 460 +++++++++++++++++++++++++++++++++++++
>  include/linux/irqchip/arm-gic-v5.h |  16 ++
>  6 files changed, 503 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d51efac8f9aa21629a0486977fdc76a2eaf5c52f..14d25cd8cd323b8f61b6523784ee65d63f6c1924 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS


> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index e7734f90bb723bfbd8be99f16dd6d6fdc7fa57e8..9d28d408f9c6df24526dd8ecbf3c7d920246b22d 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -1079,6 +1079,25 @@
>  
>  #define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
>  					       GCS_CAP_VALID_TOKEN)
> +/*
> + * Definitions for GICv5 instructions
> + */
> +#define GICV5_OP_GIC_CDDI		sys_insn(1, 0, 12, 2, 0)
> +#define GICV5_OP_GIC_CDEOI		sys_insn(1, 0, 12, 1, 7)
> +#define GICV5_OP_GICR_CDIA		sys_insn(1, 0, 12, 3, 0)
> +
> +/* Shift and mask definitions for GIC CDDI */

Technically just masks (which are shifted) but none the less I wouldn't
expect the comment to say Shift and mask.

> +#define GICV5_GIC_CDDI_TYPE_MASK	GENMASK_ULL(31, 29)
> +#define GICV5_GIC_CDDI_ID_MASK		GENMASK_ULL(23, 0)
> +
> +/* Shift and mask definitions for GICR CDIA */

Likewise.

> +#define GICV5_GIC_CDIA_VALID_MASK	BIT_ULL(32)

Maybe
GICV5_GICR_CDIA_VALID(r) etc given the instruction define name.

> +#define GICV5_GIC_CDIA_VALID(r)		FIELD_GET(GICV5_GIC_CDIA_VALID_MASK, r)

Personally I rarely see benefit in wrapping FIELD_GET() in another macro
The bare code is only a little shorter and the FIELD_GET() inline keeps things nice
and clear.  It's your code though so keep this if you really want to!


> +#define GICV5_GIC_CDIA_TYPE_MASK	GENMASK_ULL(31, 29)
> +#define GICV5_GIC_CDIA_ID_MASK		GENMASK_ULL(23, 0)
> +
> +#define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
> +#define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
>  
>  #define ARM64_FEATURE_FIELD_BITS	4
>  
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 08bb3b031f23093311cf2f0918ad43e575b581d1..0f268f35b78531775aa233bfc362bfe119a68275 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -54,6 +54,11 @@ config ARM_GIC_V3_ITS_FSL_MC
>  	depends on FSL_MC_BUS
>  	default ARM_GIC_V3_ITS
>  
> +config ARM_GIC_V5
> +	bool
> +	select IRQ_DOMAIN_HIERARCHY
> +	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
> +
>  config ARM_NVIC
>  	bool
>  	select IRQ_DOMAIN_HIERARCHY
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 365bcea9a61ff89e2cb41034125b3fc8cd494d81..3f8225bba5f0f9ce5dbb629b6d4782eacf85da44 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_ARM_GIC_V3)		+= irq-gic-v3.o irq-gic-v3-mbi.o irq-gic-common.o
>  obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o irq-gic-v3-its-msi-parent.o
>  obj-$(CONFIG_ARM_GIC_V3_ITS_FSL_MC)	+= irq-gic-v3-its-fsl-mc-msi.o
>  obj-$(CONFIG_PARTITION_PERCPU)		+= irq-partition-percpu.o
> +obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o
>  obj-$(CONFIG_HISILICON_IRQ_MBIGEN)	+= irq-mbigen.o
>  obj-$(CONFIG_ARM_NVIC)			+= irq-nvic.o
>  obj-$(CONFIG_ARM_VIC)			+= irq-vic.o
> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a50982e5d98816d88e4fca37cc0ac31684fb6c76
> --- /dev/null
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -0,0 +1,460 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024-2025 ARM Limited, All Rights Reserved.
> + */
> +
> +#define pr_fmt(fmt)	"GICv5: " fmt
> +
> +#include <linux/irqdomain.h>
> +#include <linux/wordpart.h>
> +
> +#include <linux/irqchip.h>
> +#include <linux/irqchip/arm-gic-v5.h>
> +
> +#include <asm/cpufeature.h>
> +#include <asm/exception.h>
> +
> +static u8 pri_bits __ro_after_init = 5;
> +
> +#define GICV5_IRQ_PRI_MASK	0x1f
> +#define GICV5_IRQ_PRI_MI	(GICV5_IRQ_PRI_MASK & GENMASK(4, 5 - pri_bits))


> +struct gicv5_chip_data {
> +	struct fwnode_handle	*fwnode;
> +	struct irq_domain	*ppi_domain;
> +};
> +
> +static struct gicv5_chip_data gicv5_global_data __read_mostly;


> +enum {
> +	PPI_PENDING,
> +	PPI_ACTIVE,
> +	PPI_HM
> +};
> +
> +static __always_inline u64 read_ppi_sysreg_s(unsigned int irq,
> +					     const unsigned int which)

Name the enum and use that here rather than an unsigned int?
Might as well give the compiler a hand.
Maybe I'm missing a later use of this that means we can't do that.

This is almost enough combinations to justify a look up table but
I guess the compiler might not figure out how to optimize that.	

> +{
> +	switch (which) {
> +	case PPI_PENDING:
> +		return irq < 64	? read_sysreg_s(SYS_ICC_PPI_SPENDR0_EL1) :
> +				  read_sysreg_s(SYS_ICC_PPI_SPENDR1_EL1);
> +	case PPI_ACTIVE:
> +		return irq < 64	? read_sysreg_s(SYS_ICC_PPI_SACTIVER0_EL1) :
> +				  read_sysreg_s(SYS_ICC_PPI_SACTIVER1_EL1);
> +	case PPI_HM:
> +		return irq < 64	? read_sysreg_s(SYS_ICC_PPI_HMR0_EL1) :
> +				  read_sysreg_s(SYS_ICC_PPI_HMR1_EL1);
> +	default:
> +		BUILD_BUG_ON(1);
> +	}
> +}
> +
> +static __always_inline void write_ppi_sysreg_s(unsigned int irq, bool set,
> +					       const unsigned int which)

Likewise - nicer with enum perhaps.

> +{
> +	u64 bit = BIT_ULL(irq % 64);
> +
> +	switch (which) {
> +	case PPI_PENDING:
> +		if (set) {
> +			if (irq < 64)
> +				write_sysreg_s(bit, SYS_ICC_PPI_SPENDR0_EL1);
> +			else
> +				write_sysreg_s(bit, SYS_ICC_PPI_SPENDR1_EL1);
> +		} else {
> +			if (irq < 64)
> +				write_sysreg_s(bit, SYS_ICC_PPI_CPENDR0_EL1);
> +			else
> +				write_sysreg_s(bit, SYS_ICC_PPI_CPENDR1_EL1);
> +		}
> +		return;
> +	case PPI_ACTIVE:
> +		if (set) {
> +			if (irq < 64)
> +				write_sysreg_s(bit, SYS_ICC_PPI_SACTIVER0_EL1);
> +			else
> +				write_sysreg_s(bit, SYS_ICC_PPI_SACTIVER1_EL1);
> +		} else {
> +			if (irq < 64)
> +				write_sysreg_s(bit, SYS_ICC_PPI_CACTIVER0_EL1);
> +			else
> +				write_sysreg_s(bit, SYS_ICC_PPI_CACTIVER1_EL1);
> +		}
> +		return;
> +	default:
> +		BUILD_BUG_ON(1);
> +	}
> +}
> +
> +static int gicv5_ppi_irq_get_irqchip_state(struct irq_data *d,
> +					   enum irqchip_irq_state which,
> +					   bool *val)
> +{
> +	u64 hwirq_id_bit = BIT_ULL(d->hwirq % 64);
> +
> +	switch (which) {
> +	case IRQCHIP_STATE_PENDING:
> +		*val = !!(read_ppi_sysreg_s(d->hwirq, PPI_PENDING) & hwirq_id_bit);

The !! isn't needed AFAICS but maybe adds a small amount of documentation value if
people don't notice that *val is a bool. I'd call it state as per the
definition as that's kind of more obviously boolean than 'val'.

> +		return 0;
> +	case IRQCHIP_STATE_ACTIVE:
> +		*val = !!(read_ppi_sysreg_s(d->hwirq, PPI_ACTIVE) & hwirq_id_bit);
> +		return 0;
> +	default:
> +		pr_debug("Unexpected PPI irqchip state\n");
> +		return -EINVAL;
> +	}
> +}


> +
> +static void __exception_irq_entry gicv5_handle_irq(struct pt_regs *regs)
> +{
> +	bool valid;
> +	u32 hwirq;
> +	u64 ia;
> +
> +	ia = gicr_insn(CDIA);
> +	valid = GICV5_GIC_CDIA_VALID(ia);
> +
> +	if (!valid)
> +		return;
> +
> +	/*
> +	 * Ensure that the CDIA instruction effects (ie IRQ activation) are
> +	 * completed before handling the interrupt.
> +	 */
> +	gsb_ack();
> +
> +	/*
> +	 * Ensure instruction ordering between an acknowledgment and subsequent
> +	 * instructions in the IRQ handler using an ISB.
> +	 */
> +	isb();
> +
> +	hwirq = FIELD_GET(GICV5_HWIRQ_INTID, ia);

As below - the GICV5_HWIRQ defines other than this one are going from
hwirq to something the GIC cares about - this one is extracting the
software managed hwirq from the CDIA register. 
  
> +
> +	handle_irq_per_domain(hwirq);
> +}
> +
> +static void gicv5_cpu_disable_interrupts(void)
> +{
> +	u64 cr0;
> +
> +	cr0 = FIELD_PREP(ICC_CR0_EL1_EN, 0);
> +	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);

This might get more complex later, but if not why not squash
to one line? Given the register name is right there, there
isn't a lot of documentation benefit in having cr0 as
the variable name.

> +}
> +
> +static void gicv5_cpu_enable_interrupts(void)
> +{
> +	u64 cr0, pcr;
> +
> +	write_sysreg_s(0, SYS_ICC_PPI_ENABLER0_EL1);
> +	write_sysreg_s(0, SYS_ICC_PPI_ENABLER1_EL1);
> +
> +	gicv5_ppi_priority_init();
> +
> +	pcr = FIELD_PREP(ICC_PCR_EL1_PRIORITY, GICV5_IRQ_PRI_MI);
> +	write_sysreg_s(pcr, SYS_ICC_PCR_EL1);
> +
> +	cr0 = FIELD_PREP(ICC_CR0_EL1_EN, 1);
> +	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);

Similar to above, I'd squash into single line.

> +}
> +
> +static int gicv5_starting_cpu(unsigned int cpu)
> +{
> +	if (WARN(!gicv5_cpuif_has_gcie(),
> +	    "GICv5 system components present but CPU does not have FEAT_GCIE"))

Alignment off to my eyes.  Either a tab or align with !

> +		return -ENODEV;
> +
> +	gicv5_cpu_enable_interrupts();
> +
> +	return 0;
> +}
> +

> diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..4ff0ba64d9840c3844671f7850bb3d81ba2eb1b6
> --- /dev/null
> +++ b/include/linux/irqchip/arm-gic-v5.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2025 ARM Limited, All Rights Reserved.
> + */
> +#ifndef __LINUX_IRQCHIP_ARM_GIC_V5_H
> +#define __LINUX_IRQCHIP_ARM_GIC_V5_H
> +
> +#include <asm/sysreg.h>
> +
> +#define GICV5_HWIRQ_ID			GENMASK(23, 0)
> +#define GICV5_HWIRQ_TYPE		GENMASK(31, 29)
> +#define GICV5_HWIRQ_INTID		GENMASK_ULL(31, 0)

Maybe some hint as to what these are in from their naming?

First two are from hwirq as defined in the irq domain stuff.
Not the 3rd one if I follow this right.

> +
> +#define GICV5_HWIRQ_TYPE_PPI		UL(0x1)
> +
> +#endif
> 

