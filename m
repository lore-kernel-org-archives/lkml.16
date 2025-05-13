Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AFA241684
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132964; cv=none; b=cy8uvdt3a62nardTJlYA8ZzJLDQ884OJq1N8t1BeRE3PjXgpbWLWaNyVHLtfNYHBtWoRKh+mU5vJfbPysLpGvLfJW0uD3Go3AtedhPvuN9pvLS9JzY+H7EuxFCRzsETUOBt2vHjEuyUc2trGircFwGzCMRHp5fO8Ml3Ww/hFO8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132964; c=relaxed/simple;
	bh=o/UyHQPYQZ6azV31PTvrRNh+FU3zzn1pxv7r+yuwzbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozMurwXrkyzZ87CukR0Ht0vz6+5rl57ZSw2WYy/wfa0NX71NztMJrt13pidg4Wn80BbAmRaoObh6YBreKuC3k/AHvUBx48NVN3yL22iZHuiLSqqDaRWlHzpbQzPcFS3TSORln5J+7+CCwZYXTQIlaDd/6Y1fU38/5uBnnzfs/1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62CB9168F;
	Tue, 13 May 2025 03:42:30 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16B7B3F5A1;
	Tue, 13 May 2025 03:42:39 -0700 (PDT)
Message-ID: <ead19392-a8d3-4c1e-95db-d5cbf40c66fa@arm.com>
Date: Tue, 13 May 2025 11:42:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Add overrride for MPAM
To: Xi Ruoyao <xry111@xry111.site>, James Morse <james.morse@arm.com>,
 Marc Zyngier <maz@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Mingcong Bai <jeffbai@aosc.io>
References: <20250402031603.35411-1-xry111@xry111.site>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250402031603.35411-1-xry111@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,


On 4/2/25 04:12, Xi Ruoyao wrote:
> As the message of the commit 09e6b306f3ba ("arm64: cpufeature: discover
> CPU support for MPAM") already states, if a buggy firmware fails to
> either enable MPAM or emulate the trap as if it were disabled, the
> kernel will just fail to boot.  While upgrading the firmware should be
> the best solution, we have some hardware of which the vendor have made
> no response 2 months after we requested a firmware update.  Allow
> overriding it so our devices don't become some e-waste.
> 
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: Mingcong Bai <jeffbai@aosc.io>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
> 
> [v1]->v2:
> - Handle the override and initialize EL2 mpam in finalise_el2_state
> - Move info->mpamidr assignment to {init,update}_cpu_features
> 
> [v1]: https://lore.kernel.org/linux-arm-kernel/20250401055650.22542-1-xry111@xry111.site/
> 
>   .../admin-guide/kernel-parameters.txt         |  3 +++
>   arch/arm64/include/asm/el2_setup.h            | 24 ++++++++-----------
>   arch/arm64/kernel/cpufeature.c                |  8 +++++--
>   arch/arm64/kernel/cpuinfo.c                   |  7 ++++--
>   arch/arm64/kernel/pi/idreg-override.c         |  2 ++
>   5 files changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 3435a062a208..4f2caa706268 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -458,6 +458,9 @@
>   	arm64.nomops	[ARM64] Unconditionally disable Memory Copy and Memory
>   			Set instructions support
>   
> +	arm64.nompam	[ARM64] Unconditionally disable Memory Partitioning And
> +			Monitoring support
> +
>   	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
>   			support
>   
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index ebceaae3c749..777190ec2b5e 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -294,19 +294,6 @@
>   .Lskip_gcs_\@:
>   .endm
>   
> -.macro __init_el2_mpam
> -	/* Memory Partitioning And Monitoring: disable EL2 traps */
> -	mrs	x1, id_aa64pfr0_el1
> -	ubfx	x0, x1, #ID_AA64PFR0_EL1_MPAM_SHIFT, #4
> -	cbz	x0, .Lskip_mpam_\@		// skip if no MPAM
> -	msr_s	SYS_MPAM2_EL2, xzr		// use the default partition
> -						// and disable lower traps
> -	mrs_s	x0, SYS_MPAMIDR_EL1
> -	tbz	x0, #MPAMIDR_EL1_HAS_HCR_SHIFT, .Lskip_mpam_\@	// skip if no MPAMHCR reg
> -	msr_s	SYS_MPAMHCR_EL2, xzr		// clear TRAP_MPAMIDR_EL1 -> EL2
> -.Lskip_mpam_\@:
> -.endm
> -
>   /**
>    * Initialize EL2 registers to sane values. This should be called early on all
>    * cores that were booted in EL2. Note that everything gets initialised as
> @@ -324,7 +311,6 @@
>   	__init_el2_stage2
>   	__init_el2_gicv3
>   	__init_el2_hstr
> -	__init_el2_mpam
>   	__init_el2_nvhe_idregs
>   	__init_el2_cptr
>   	__init_el2_fgt
> @@ -371,6 +357,16 @@
>   #endif
>   
>   .macro finalise_el2_state
> +	check_override id_aa64pfr0, ID_AA64PFR0_EL1_MPAM_SHIFT, .Linit_mpam_\@, .Lskip_mpam_\@, x1, x2
> +
> +.Linit_mpam_\@:
> +	msr_s	SYS_MPAM2_EL2, xzr		// use the default partition
> +						// and disable lower traps
> +	mrs_s	x0, SYS_MPAMIDR_EL1
> +	tbz	x0, #MPAMIDR_EL1_HAS_HCR_SHIFT, .Lskip_mpam_\@  // skip if no MPAMHCR reg
> +	msr_s   SYS_MPAMHCR_EL2, xzr		// clear TRAP_MPAMIDR_EL1 -> EL2
> +
> +.Lskip_mpam_\@:
>   	check_override id_aa64pfr0, ID_AA64PFR0_EL1_SVE_SHIFT, .Linit_sve_\@, .Lskip_sve_\@, x1, x2
>   
>   .Linit_sve_\@:	/* SVE register access */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9c4d6d552b25..44dcc0037ec2 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -88,6 +88,7 @@
>   #include <asm/mte.h>
>   #include <asm/hypervisor.h>
>   #include <asm/processor.h>
> +#include <asm/ptrace.h>
Unused include?
>   #include <asm/smp.h>
>   #include <asm/sysreg.h>
>   #include <asm/traps.h>
> @@ -1191,8 +1192,10 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
>   		cpacr_restore(cpacr);
>   	}
>   
> -	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
> +	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
> +		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
>   		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
> +	}
>   
>   	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
>   		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
> @@ -1443,7 +1446,8 @@ void update_cpu_features(int cpu,
>   		cpacr_restore(cpacr);
>   	}
>   
> -	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0)) {
> +	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
> +		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
>   		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
>   					info->reg_mpamidr, boot->reg_mpamidr);
>   	}
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 285d7d538342..1c114f97bf1e 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -494,8 +494,11 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
>   	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
>   		__cpuinfo_store_cpu_32bit(&info->aarch32);
>   
> -	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
> -		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
> +	/*
> +	 * info->mpamidr deferred to {init,update}_cpu_features because we
> +	 * don't want to read it (and trigger a trap on buggy firmware) if
> +	 * using an aa64pfr0_el1 override to unconditionally disable MPAM.
> +	 */
nit: info->mpamidr is info->reg_mpamidr
>   
>   	if (IS_ENABLED(CONFIG_ARM64_SME) &&
>   	    id_aa64pfr1_sme(info->reg_id_aa64pfr1)) {
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> index c6b185b885f7..836e5a9b98d0 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -127,6 +127,7 @@ static const struct ftr_set_desc pfr0 __prel64_initconst = {
>   	.fields		= {
>   	        FIELD("sve", ID_AA64PFR0_EL1_SVE_SHIFT, pfr0_sve_filter),
>   		FIELD("el0", ID_AA64PFR0_EL1_EL0_SHIFT, NULL),
> +		FIELD("mpam", ID_AA64PFR0_EL1_MPAM_SHIFT, NULL),
>   		{}
>   	},
>   };
> @@ -246,6 +247,7 @@ static const struct {
>   	{ "rodata=off",			"arm64_sw.rodataoff=1" },
>   	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
>   	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=1" },
> +	{ "arm64.nompam",		"id_aa64pfr0.mpam=0" },
>   };
>   
>   static int __init parse_hexdigit(const char *p, u64 *v)


There is a typo in your summary, s/overrride/override/.

I have checked that with the boot parameter, arm64.nompam, that kvm sees 
  ID_AA64PFR0.MPAM sanitized to 0 and 1 without. Also, that on top of 
[1] that I see /sys/fs/resctrl without the boot parameter and don't with it.

Tested-by: Ben Horgan <ben.horgan@arm.com>

I note that there is an mpam version 0.1 with ID_AA64PFR0.MPAM=0 and
ID_AA64PFR1.MPAM_Frac=1 but I see no need to make any changes based on this.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=mpam/snapshot/v6.15-rc3

Thanks,

Ben

