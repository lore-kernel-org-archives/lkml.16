Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00A7277016
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511922; cv=none; b=EidCiElrQ5v1eVcEF+g3yKLymQgT8zYB1dJOBV8kY1MnlU+uaa3Xqp8FFHOs/wfE5RSUMkl5yI/6XMQHy2MLBfLLZOqUcrph4LZ5zRy3G0ie1nWC1RKmHagUwrE1SmmczYWYVSgd8WSjROJk+ONQc8NwFzhi8OeSp2HVWB7bZcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511922; c=relaxed/simple;
	bh=WOdqncUxcZUf5wfe/DDugdBUgDHWn38gNAfEEYjaCMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEqDbc64nrt9cnMt6TNMOYFCM5fH/Ri90v3sSsWWcnQ4Ciph2MI/TjZkPQLY29Xk4XfB1pz0J4BCPlADuO0VM1G3nTFFm4NnwGX2L1iDnTV7TM8ABs1OxDyeveHi7UTf9P9ijQPFUUYUNkV1Y/ursuEihJpvNUSTTYlL7aXvmS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Am6jFbyq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Am6jFbyq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B09C4CEE7;
	Thu, 29 May 2025 09:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748511921;
	bh=WOdqncUxcZUf5wfe/DDugdBUgDHWn38gNAfEEYjaCMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Am6jFbyqdvyqaPytR81D+AaT2re7gzqMPU7zPfvQ6LYBQxcN6PqskW3jD2x/8nAub
	 gYLoUHIuWJMD/bt4b7aEWDhvNuwJm3qEgEO06isvXSLZXOT0gUGYMR51pHI26Otv+8
	 gfz5M8rAeRQri3uLTTdkPinRO0uWBC/5dlsd5npe5oxC/y3eqK7cvx7aoNlaL5KjxN
	 IJlYjuHsPId+251OEqtXbwa5JijLXlE8Ap2gU3fTGBeAQFtLZyb7yq/Z1TlIMIw1J4
	 By78Qx7MK0FtMkE9KkR6Y+kOzR29/OrQpkLQlqKuFY2B+fVZFTAcYXI6AQmVCP762l
	 FRu+3tgrP5ptQ==
Date: Thu, 29 May 2025 10:45:16 +0100
From: Will Deacon <will@kernel.org>
To: Xi Ruoyao <xry111@xry111.site>
Cc: James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Mingcong Bai <jeffbai@aosc.io>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>
Subject: Re: [PATCH v3] arm64: Add override for MPAM
Message-ID: <20250529094515.GA28905@willie-the-truck>
References: <20250516102556.9688-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516102556.9688-1-xry111@xry111.site>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, May 16, 2025 at 06:25:56PM +0800, Xi Ruoyao wrote:
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
> Tested-by: Shaopeng Tan <tan.shaopeng@fujitsu.com>
> Tested-by: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
> 
> [v2]->v3:
> - Fix typos in the subject and a comment.
> - Remove a useless #include directive.
> 
> [v1]->v2:
> - Handle the override and initialize EL2 mpam in finalise_el2_state
> - Move info->mpamidr assignment to {init,update}_cpu_features
> 
> [v1]: https://lore.kernel.org/linux-arm-kernel/20250401055650.22542-1-xry111@xry111.site/
> 
>  .../admin-guide/kernel-parameters.txt         |  3 +++
>  arch/arm64/include/asm/el2_setup.h            | 24 ++++++++-----------
>  arch/arm64/kernel/cpufeature.c                |  7 ++++--
>  arch/arm64/kernel/cpuinfo.c                   |  7 ++++--
>  arch/arm64/kernel/pi/idreg-override.c         |  2 ++
>  5 files changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 8f75ec177399..0bfcbeab7a3b 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -458,6 +458,9 @@
>  	arm64.nomops	[ARM64] Unconditionally disable Memory Copy and Memory
>  			Set instructions support
>  
> +	arm64.nompam	[ARM64] Unconditionally disable Memory Partitioning And
> +			Monitoring support
> +
>  	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
>  			support
>  
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index d40e427ddad9..2e6b9086efc5 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -294,19 +294,6 @@
>  .Lskip_gcs_\@:
>  .endm
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
>  /**
>   * Initialize EL2 registers to sane values. This should be called early on all
>   * cores that were booted in EL2. Note that everything gets initialised as
> @@ -324,7 +311,6 @@
>  	__init_el2_stage2
>  	__init_el2_gicv3
>  	__init_el2_hstr
> -	__init_el2_mpam
>  	__init_el2_nvhe_idregs
>  	__init_el2_cptr
>  	__init_el2_fgt
> @@ -371,6 +357,16 @@
>  #endif
>  
>  .macro finalise_el2_state
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
>  	check_override id_aa64pfr0, ID_AA64PFR0_EL1_SVE_SHIFT, .Linit_sve_\@, .Lskip_sve_\@, x1, x2
>  
>  .Linit_sve_\@:	/* SVE register access */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 4c46d80aa64b..7b8c998a0466 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1198,8 +1198,10 @@ void __init init_cpu_features(struct cpuinfo_arm64 *info)
>  		cpacr_restore(cpacr);
>  	}
>  
> -	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
> +	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
> +		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
>  		init_cpu_ftr_reg(SYS_MPAMIDR_EL1, info->reg_mpamidr);
> +	}
>  
>  	if (id_aa64pfr1_mte(info->reg_id_aa64pfr1))
>  		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
> @@ -1450,7 +1452,8 @@ void update_cpu_features(int cpu,
>  		cpacr_restore(cpacr);
>  	}
>  
> -	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0)) {
> +	if (id_aa64pfr0_mpam(read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1))) {
> +		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
>  		taint |= check_update_ftr_reg(SYS_MPAMIDR_EL1, cpu,
>  					info->reg_mpamidr, boot->reg_mpamidr);
>  	}
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 285d7d538342..15d39fbc6085 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -494,8 +494,11 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
>  	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
>  		__cpuinfo_store_cpu_32bit(&info->aarch32);
>  
> -	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
> -		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
> +	/*
> +	 * info->reg_mpamidr deferred to {init,update}_cpu_features because we
> +	 * don't want to read it (and trigger a trap on buggy firmware) if
> +	 * using an aa64pfr0_el1 override to unconditionally disable MPAM.
> +	 */

Bah, and you have to do that because MPAMIDR_EL1 accesses can trap to
EL3, which is weirdly different to e.g. the SMIDR_EL1 accesses made by
the SME code immediately below. Great stuff.

Anyway, looks ok to me. I can take it as a fix if Marc is happy with it.

Will
