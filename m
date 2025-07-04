Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B09A262FD4;
	Fri,  4 Jul 2025 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625494; cv=none; b=i3QIIvXdT+ucLIdjZe5K/qoH0NqGr9W2YdPkr3HyQ8VQEFWMD8SA+0uXwdzLR91CTI4VKS1pUrPcfdjlEhxcwJ/mpCP84KJD1VeBLs0aCj3iN9dj57PRQHrMqpl30JzBpSxYl32+QjrsDVLWpPnBzRT2Wox3Dnqbn5w0UimQ8Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625494; c=relaxed/simple;
	bh=Cg3LknRGyV7puCFAtpxGBlpJz2ZZT/HJptPP8I5vmX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0t6jvvixB5PpQ8Xv8y54kswO07v8uBWQQX6w1VjyoBMAzM0CrOcRhJFwMnW7eEhmgbmRxpGaQ7AqySxPyIoiKremR518hb5t9ZoWX5frnjsnCP98fcTxLVgDgWNv7ic+tesEfYZpQ56zVdCTAEDL/4bpL4eIyP8Uhs+9X6FtMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA8F9152B;
	Fri,  4 Jul 2025 03:37:56 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 495783F63F;
	Fri,  4 Jul 2025 03:38:07 -0700 (PDT)
Date: Fri, 4 Jul 2025 11:38:01 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Zaid Alali <zaidal@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	maz@kernel.org, mbenes@suse.cz, puranjay@kernel.org,
	broonie@kernel.org, oliver.upton@linux.dev, andre.przywara@arm.com,
	kevin.brodsky@arm.com, scott@os.amperecomputing.com,
	james.clark@linaro.org, james.morse@arm.com,
	anshuman.khandual@arm.com, shameerali.kolothum.thodi@huawei.com,
	joey.gouly@arm.com, gshan@redhat.com, yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: errata: Add Ampere erratum AC03_CPU_50
 workaround alternative
Message-ID: <aGevCYzaRPLMGzL0@J2N7QTR9R3>
References: <20250703214657.786288-1-zaidal@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703214657.786288-1-zaidal@os.amperecomputing.com>

On Thu, Jul 03, 2025 at 02:46:57PM -0700, Zaid Alali wrote:
> Add an alternative code sequence to work around Ampere erratum
> AC03_CPU_50 on AmpereOne and AC04_CPU_19 on AmpereOne AC04.
> 
> Due to AC03_CPU_50, when ICC_PMR_EL1 should have a value of 0xf0 a
> direct read of the register will return a value of 0xf8. An incorrect
> value from a direct read can only happen with the value 0xf0.
> 
> This only occurs when the following conditions are met:
> SCR_EL3.FIQ=1 and,
> PE is NOT in EL3/Secure state and,
> ICC_PMR_EL1.Priority=0xf8 (Non-Secure Group 1)
> 
> The returned interrupt filter priority is affected by this, and
> returns 0xf8 but should be 0xf0, as per ARM. This workaround fixes
> the issue here.
> 
> Based on this Defect (AArch-21735), this does not apply to virtual
> interrupts. It also does not apply when SCR_EL3.FIQ=0, as no
> modification of ICC_PMR_EL1 is required.

Last time this was posted:

  https://lore.kernel.org/linux-arm-kernel/20250127201829.209258-1-zaidal@os.amperecomputing.com/

... Marc Zyngier asked:

  Are you saying that this is erratum is *strictly* AARCH-21735?

... can you please confirm?

> Note: Currently there are no checks against a value of 0xf0, and that
> save restore of 0xf8 -> 0xf0 is fine, so this is all future proofing.

This is a fair amount of work for no functional change.

AFAICT, this can only possibly matter when PMR is configured with
(GICV3_PRIO_UNMASKED | GICV3_PRIO_PSR_I_SET), and I hope to remove
GICV3_PRIO_PSR_I_SET entirely in the near future with a rework of the
way we manipulate DAIF and PMR.

If we did that, we'd only ever program PMR with:

* GICV3_PRIO_UNMASKED // 0xe0
* GICV3_PRIO_IRQ      // 0xc0
* GICV3_PRIO_NMI      // 0x80

... and IIUC that would avoid the problem entirely, no runtime patching
required.

Given there's no functional issue today, I wonder if we should just
leave this as-is for now, and mabye just add an N/A entry in
silicon-errata.txt.

Mark.

> 
> V2:
>   - Update commit message to clarify the conditions when the issue
>     occurs.
>   - Add entry in silicon errata documentation.
> 
> Signed-off-by: Zaid Alali <zaidal@os.amperecomputing.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  4 ++++
>  arch/arm64/Kconfig                          | 14 ++++++++++++++
>  arch/arm64/include/asm/arch_gicv3.h         |  2 +-
>  arch/arm64/include/asm/daifflags.h          |  5 ++---
>  arch/arm64/include/asm/irqflags.h           |  6 +++---
>  arch/arm64/include/asm/sysreg.h             |  9 +++++++++
>  arch/arm64/kernel/cpu_errata.c              | 15 +++++++++++++++
>  arch/arm64/kernel/entry.S                   |  3 +++
>  arch/arm64/tools/cpucaps                    |  1 +
>  9 files changed, 52 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index b18ef4064bc0..29e0bd8b07cd 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -59,6 +59,10 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Ampere         | AmpereOne AC04  | AC04_CPU_23     | AMPERE_ERRATUM_AC04_CPU_23  |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| Ampere         | AmpereOne       | AC03_CPU_50     | AMPERE_ERRATUM_AC03_CPU_50  |
> ++----------------+-----------------+-----------------+-----------------------------+
> +| Ampere         | AmpereOne AC04  | AC04_CPU_19     | AMPERE_ERRATUM_AC03_CPU_50  |
> ++----------------+-----------------+-----------------+-----------------------------+
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Cortex-A510     | #2457168        | ARM64_ERRATUM_2457168       |
>  +----------------+-----------------+-----------------+-----------------------------+
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 55fc331af337..1ca4c296deaa 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -479,6 +479,20 @@ config AMPERE_ERRATUM_AC04_CPU_23
>  	  for corruption, and an ISB after is sufficient to prevent younger
>  	  instructions from hitting the window for corruption.
>  
> +config AMPERE_ERRATUM_AC03_CPU_50
> +	bool "AmpereOne: AC03_CPU_50: Certain checks for ICC_PMR_EL1 that expects the value 0xf0 may read 0xf8 instead"
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around Ampere
> +	  erratum AC03_CPU_50 on AmperOne and AC04_CPU_19 on AmpereOne AC04.
> +
> +	  Due to AC03_CPU_50, when ICC_PMR_EL1 should have a value of 0xf0 a
> +	  direct read of the register will return a value of 0xf8. An incorrect
> +	  value from a direct read can only happen with the value 0xf0.
> +
> +	  The workaround for the erratum will do logical AND 0xf0 to the
> +	  value read from ICC_PMR_EL1 register before returning the value.
> +
>  	  If unsure, say Y.
>  
>  config ARM64_WORKAROUND_CLEAN_CACHE
> diff --git a/arch/arm64/include/asm/arch_gicv3.h b/arch/arm64/include/asm/arch_gicv3.h
> index 9e96f024b2f1..299d7e17abdf 100644
> --- a/arch/arm64/include/asm/arch_gicv3.h
> +++ b/arch/arm64/include/asm/arch_gicv3.h
> @@ -127,7 +127,7 @@ static inline void gic_write_bpr1(u32 val)
>  
>  static inline u32 gic_read_pmr(void)
>  {
> -	return read_sysreg_s(SYS_ICC_PMR_EL1);
> +	return read_sysreg_pmr();
>  }
>  
>  static __always_inline void gic_write_pmr(u32 val)
> diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
> index fbb5c99eb2f9..022a3640d584 100644
> --- a/arch/arm64/include/asm/daifflags.h
> +++ b/arch/arm64/include/asm/daifflags.h
> @@ -22,8 +22,7 @@
>  static inline void local_daif_mask(void)
>  {
>  	WARN_ON(system_has_prio_mask_debugging() &&
> -		(read_sysreg_s(SYS_ICC_PMR_EL1) == (GIC_PRIO_IRQOFF |
> -						    GIC_PRIO_PSR_I_SET)));
> +		(read_sysreg_pmr() == (GIC_PRIO_IRQOFF | GIC_PRIO_PSR_I_SET)));
>  
>  	asm volatile(
>  		"msr	daifset, #0xf		// local_daif_mask\n"
> @@ -46,7 +45,7 @@ static inline unsigned long local_daif_save_flags(void)
>  
>  	if (system_uses_irq_prio_masking()) {
>  		/* If IRQs are masked with PMR, reflect it in the flags */
> -		if (read_sysreg_s(SYS_ICC_PMR_EL1) != GIC_PRIO_IRQON)
> +		if (read_sysreg_pmr() != GIC_PRIO_IRQON)
>  			flags |= PSR_I_BIT | PSR_F_BIT;
>  	}
>  
> diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
> index d4d7451c2c12..757e7e837992 100644
> --- a/arch/arm64/include/asm/irqflags.h
> +++ b/arch/arm64/include/asm/irqflags.h
> @@ -30,7 +30,7 @@ static __always_inline void __daif_local_irq_enable(void)
>  static __always_inline void __pmr_local_irq_enable(void)
>  {
>  	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
> -		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
> +		u32 pmr = read_sysreg_pmr();
>  		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
>  	}
>  
> @@ -59,7 +59,7 @@ static __always_inline void __daif_local_irq_disable(void)
>  static __always_inline void __pmr_local_irq_disable(void)
>  {
>  	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
> -		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
> +		u32 pmr = read_sysreg_pmr();
>  		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
>  	}
>  
> @@ -84,7 +84,7 @@ static __always_inline unsigned long __daif_local_save_flags(void)
>  
>  static __always_inline unsigned long __pmr_local_save_flags(void)
>  {
> -	return read_sysreg_s(SYS_ICC_PMR_EL1);
> +	return read_sysreg_pmr();
>  }
>  
>  /*
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index f1bb0d10c39a..9033110a4589 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -1223,6 +1223,15 @@
>  	par;								\
>  })
>  
> +#define read_sysreg_pmr() ({						\
> +	u64 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);			\
> +	asm(ALTERNATIVE("nop", "and %0, %0, #0xf0",			\
> +			ARM64_WORKAROUND_AMPERE_AC03_CPU_50)		\
> +			: "+r" (pmr)					\
> +			);						\
> +	pmr;								\
> +})
> +
>  #define SYS_FIELD_VALUE(reg, field, val)	reg##_##field##_##val
>  
>  #define SYS_FIELD_GET(reg, field, val)		\
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 59d723c9ab8f..9eec9977ee21 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -564,6 +564,14 @@ static const struct midr_range erratum_ac04_cpu_23_list[] = {
>  };
>  #endif
>  
> +#ifdef CONFIG_AMPERE_ERRATUM_AC03_CPU_50
> +static const struct midr_range erratum_ac03_cpu_50_list[] = {
> +	MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> +	MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> +	{},
> +};
> +#endif
> +
>  const struct arm64_cpu_capabilities arm64_errata[] = {
>  #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
>  	{
> @@ -905,6 +913,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  		.matches = has_impdef_pmuv3,
>  		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
>  	},
> +#ifdef CONFIG_AMPERE_ERRATUM_AC03_CPU_50
> +	{
> +		.desc = "AmpereOne erratum AC03_CPU_50",
> +		.capability = ARM64_WORKAROUND_AMPERE_AC03_CPU_50,
> +		ERRATA_MIDR_RANGE_LIST(erratum_ac03_cpu_50_list),
> +	},
> +#endif
>  	{
>  	}
>  };
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index 5ae2a34b50bd..6d76f79335a0 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -317,6 +317,9 @@ alternative_if_not ARM64_HAS_GIC_PRIO_MASKING
>  alternative_else_nop_endif
>  
>  	mrs_s	x20, SYS_ICC_PMR_EL1
> +alternative_if ARM64_WORKAROUND_AMPERE_AC03_CPU_50
> +	and	x20, x20, #0xf0
> +alternative_else_nop_endif
>  	str	w20, [sp, #S_PMR]
>  	mov	x20, #GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET
>  	msr_s	SYS_ICC_PMR_EL1, x20
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 10effd4cff6b..de34e36c79ee 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -96,6 +96,7 @@ WORKAROUND_2645198
>  WORKAROUND_2658417
>  WORKAROUND_AMPERE_AC03_CPU_38
>  WORKAROUND_AMPERE_AC04_CPU_23
> +WORKAROUND_AMPERE_AC03_CPU_50
>  WORKAROUND_TRBE_OVERWRITE_FILL_MODE
>  WORKAROUND_TSB_FLUSH_FAILURE
>  WORKAROUND_TRBE_WRITE_OUT_OF_RANGE
> -- 
> 2.43.0
> 
