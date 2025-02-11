Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5A21EEA38
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274928; cv=none; b=pZl9zvyGojEg07+W1FLtWU07/NvZEv34RrvVWU67L1PKrYS149ghd9pucMoWfnLzV3SFVJ7Ql8lnVcnQCil9huwW08uiQAi041u8Yw+uR/FGenTPH+wrI8aUaK9IuwRmSCUH1MNXkGo7BhfAjGpHrE+ro96bBwgBSzo6BqRbbEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274928; c=relaxed/simple;
	bh=wX6RltD5iJJBNucHE1PcR3qksm/yqG/pYIQJ3cV9eMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ke3JlA1QKeBni5o0G6b0Cfscnjj3W2Wi7+gq1z6oPQthOOlE/611ySycmkFULKz1LbC5NpCks521KzwBQlSXjRaij31yqUYZN711jwgYlZhqX3cPKhc1mfyRO+K66htQDG8YM0p3UM/S2/+u9cU3hLcy8cqkgkfnyAOAweHecfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA14D1424;
	Tue, 11 Feb 2025 03:55:47 -0800 (PST)
Received: from [10.57.81.93] (unknown [10.57.81.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 333E43F6A8;
	Tue, 11 Feb 2025 03:55:25 -0800 (PST)
Message-ID: <eef5fba9-da21-4131-a8a3-ae9a735869b1@arm.com>
Date: Tue, 11 Feb 2025 11:55:23 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH 1/2] arm64: cpufeature: detect FEAT_BBM level 2
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: cl@gentwo.org, scott@os.amperecomputing.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250103011822.1257189-1-yang@os.amperecomputing.com>
 <20250103011822.1257189-2-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250103011822.1257189-2-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/01/2025 01:17, Yang Shi wrote:
> FEAT_BBM level 2 allow changing block size of a translation with relaxed
> TLB flushing.  But it may incur TLB conflict abort.  We can handle the
> abort in kernel, however it is hard to guarantee the recuesive TLB

nit: recuesive -> recursive ?

> conflct will never happen in the handling itself.
> 
> Some implementations can handle TLB conflict gracefully without fault
> handler in kernel so FEAT_BBM level 2 can be enabled on those
> implementations safely.
> 
> Look up MIDR to filter out those CPUs.  AmpereOne is one of them.
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/cpufeature.h | 19 +++++++++++++++++++
>  arch/arm64/kernel/cpufeature.c      | 11 +++++++++++
>  arch/arm64/tools/cpucaps            |  1 +
>  3 files changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 8b4e5a3cd24c..33ca9db42741 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -866,6 +866,25 @@ static __always_inline bool system_supports_mpam_hcr(void)
>  	return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
>  }
>  
> +static inline bool system_supports_bbmlv2(void)

nit: Arm language internally is starting to refer to FEAT_BBML1 / FEAT_BBML2 and
I believe this will soon make it's way to the Arm ARM. So probably better to
refer to bbml2 rather than bbmlv2 throughout.

> +{
> +	return cpus_have_final_boot_cap(ARM64_HAS_BBMLV2);
> +}
> +
> +static inline bool bbmlv2_available(void)

This function has no need to be in the header. system_supports_bbmlv2() is what
users should use. Suggest moving to has_bbmlv2() in cpufeature.c.

> +{
> +	static const struct midr_range support_bbmlv2[] = {
> +		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> +		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
> +		{}
> +	};
> +
> +	if (is_midr_in_range_list(read_cpuid_id(), support_bbmlv2))
> +		return true;
> +
> +	return false;
> +}
> +
>  int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
>  bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
>  
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 6ce71f444ed8..a60d5fa04828 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1889,6 +1889,11 @@ static bool has_lpa2(const struct arm64_cpu_capabilities *entry, int scope)
>  }
>  #endif
>  
> +static bool has_bbmlv2(const struct arm64_cpu_capabilities *entry, int scope)
> +{
> +	return bbmlv2_available();
> +}
> +
>  #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
>  #define KPTI_NG_TEMP_VA		(-(1UL << PMD_SHIFT))
>  
> @@ -2990,6 +2995,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, GCS, IMP)
>  	},
>  #endif
> +	{
> +		.desc = "BBM Level 2",
> +		.capability = ARM64_HAS_BBMLV2,
> +		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,

I'm wondering if this will potentially lead to problems for assymetric
collections of CPUs (e.g. big.LITTLE)? I can imagine that little CPUs might not
support BBML2. In this case if you boot on a big CPU that does have BBML2, you
will require the feature and refuse to online the secondary little CPUs.

Perhaps this really needs to be a system feature, where it is only enabled if
all CPUs in the system support it? I'm guessing that will make painting the
linear map harder; I guess you will need to initially set it up with PTE
mappings, then repaint as block mappings if BBML2 is determined to be supported
if that's not already what you are doing.

Thanks,
Ryan

> +		.matches = has_bbmlv2,
> +	},
>  	{},
>  };
>  
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index eb17f59e543c..287bdede53f5 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -14,6 +14,7 @@ HAS_ADDRESS_AUTH_ARCH_QARMA5
>  HAS_ADDRESS_AUTH_IMP_DEF
>  HAS_AMU_EXTN
>  HAS_ARMv8_4_TTL
> +HAS_BBMLV2
>  HAS_CACHE_DIC
>  HAS_CACHE_IDC
>  HAS_CNP

