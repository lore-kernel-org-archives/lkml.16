Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E4A2EE5FD
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258968; cv=none; b=mG70EyeZsXDC4IhGLmlXn4/B2x7jB3ackhgjVCNaQG3Cn1oBw2Q2RZuIydXbfNbSD3vTOu2kSHZqWDJHj3YmlGP3cXwnNoKsts75oFxIK6XD3gHzTyEADwscDkg+m+O4KdFg8AQ1DiNB1NOa6zwZ9s+TnHDlZ2jFmRQIfNr0cYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258968; c=relaxed/simple;
	bh=rshmYQO8djGbcdz7XOtr0FWW1XOSMW9B+A2ioLN25tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qbH11y71MWt2VV1ZNKSCxfr51UKfdgxUkfvndUQLkmgvFwpnKVXBpaUxUD1hwAxbjM9EUxK1IyFIf70MpvF/VQxcBbzuWkAiduD2H3MR9kA7xd1U92qS3YyF48Xhnd2VHHyXwFzlEtXDidZJmK3j0LEQN/mx1FH+iHYANqfT/eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D60014BF;
	Wed, 18 Jun 2025 08:02:25 -0700 (PDT)
Received: from [10.57.28.112] (unknown [10.57.28.112])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBC2F3F58B;
	Wed, 18 Jun 2025 08:02:43 -0700 (PDT)
Message-ID: <bc8a73d2-ba85-4431-a8e9-3692cc1e402a@arm.com>
Date: Wed, 18 Jun 2025 16:02:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: realm: ioremap: Allow mapping memory as
 encrypted
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, sami.mujawar@arm.com,
 aneesh.kumar@kernel.org, linux-kernel@vger.kernel.org, sudeep.holla@arm.com
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
 <20250613111153.1548928-2-suzuki.poulose@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250613111153.1548928-2-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2025 12:11, Suzuki K Poulose wrote:
> For ioremap(), so far we only checked if it was a device (RIPAS_DEV) to choose
> an encrypted vs decrypted mapping. However, we may have firmware reserved memory
> regions exposed to the OS (e.g., EFI Coco Secret Securityfs, ACPI CCEL).
> We need to make sure that anything that is RIPAS_RAM (i.e., Guest
> protected memory with RMM guarantees) are also mapped as encrypted.
> 
> Rephrasing the above, anything that is not RIPAS_EMPTY is guaranteed to be
> protected by the RMM. Thus we choose encrypted mapping for anything that is not
> RIPAS_EMPTY. While at it, rename the helper function
> 
>   __arm64_is_protected_mmio => arm64_rsi_is_protected
> 
> to clearly indicate that this not an arm64 generic helper, but something to do
> with Realms.
> 
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  arch/arm64/include/asm/io.h  |  2 +-
>  arch/arm64/include/asm/rsi.h |  2 +-
>  arch/arm64/kernel/rsi.c      | 26 ++++++++++++++++++++++----
>  3 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 9b96840fb979..82276282a3c7 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -311,7 +311,7 @@ extern bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
>  static inline bool arm64_is_protected_mmio(phys_addr_t phys_addr, size_t size)
>  {
>  	if (unlikely(is_realm_world()))
> -		return __arm64_is_protected_mmio(phys_addr, size);
> +		return arm64_rsi_is_protected(phys_addr, size);
>  	return false;
>  }
>  
> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
> index b42aeac05340..88b50d660e85 100644
> --- a/arch/arm64/include/asm/rsi.h
> +++ b/arch/arm64/include/asm/rsi.h
> @@ -16,7 +16,7 @@ DECLARE_STATIC_KEY_FALSE(rsi_present);
>  
>  void __init arm64_rsi_init(void);
>  
> -bool __arm64_is_protected_mmio(phys_addr_t base, size_t size);
> +bool arm64_rsi_is_protected(phys_addr_t base, size_t size);
>  
>  static inline bool is_realm_world(void)
>  {
> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> index ce4778141ec7..c64a06f58c0b 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/arch/arm64/kernel/rsi.c
> @@ -84,7 +84,25 @@ static void __init arm64_rsi_setup_memory(void)
>  	}
>  }
>  
> -bool __arm64_is_protected_mmio(phys_addr_t base, size_t size)
> +/*
> + * Check if a given PA range is Trusted (e.g., Protected memory, a Trusted Device
> + * mapping, or an MMIO emulated in the Realm world).
> + *
> + * We can rely on the RIPAS value of the region to detect if a given region is
> + * protected.
> + *
> + *  RIPAS_DEV - A trusted device memory or a trusted emulated MMIO (in the Realm
> + *		world
> + *  RIPAS_RAM - Memory (RAM), protected by the RMM guarantees. (e.g., Firmware
> + *		reserved regions for data sharing).
> + *
> + *  RIPAS_DESTROYED is a special case of one of the above, where the host did
> + *  something without our permission and as such we can't do anything about it.
> + *
> + * The only case where something is emulated by the untrusted hypervisor or is
> + * backed by shared memory is indicated by RSI_RIPAS_EMPTY.
> + */
> +bool arm64_rsi_is_protected(phys_addr_t base, size_t size)
>  {
>  	enum ripas ripas;
>  	phys_addr_t end, top;
> @@ -101,18 +119,18 @@ bool __arm64_is_protected_mmio(phys_addr_t base, size_t size)
>  			break;
>  		if (WARN_ON(top <= base))
>  			break;
> -		if (ripas != RSI_RIPAS_DEV)
> +		if (ripas == RSI_RIPAS_EMPTY)
>  			break;
>  		base = top;
>  	}
>  
>  	return base >= end;
>  }
> -EXPORT_SYMBOL(__arm64_is_protected_mmio);
> +EXPORT_SYMBOL(arm64_rsi_is_protected);
>  
>  static int realm_ioremap_hook(phys_addr_t phys, size_t size, pgprot_t *prot)
>  {
> -	if (__arm64_is_protected_mmio(phys, size))
> +	if (arm64_rsi_is_protected(phys, size))
>  		*prot = pgprot_encrypted(*prot);
>  	else
>  		*prot = pgprot_decrypted(*prot);

