Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8422335959
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808093; cv=none; b=JsUuTCm1/0y8jZ11cWnSBWrisLO4ZP6qYfOHsyDtHLBAdBWmuv4Fww2zyM8u+eZ5TwgSiDAb5FEv0t0X9Kn165SoZ1K7hKeMxQDbd0GN5P8hM69W+v9MwR3fLMbrmFpoe0IIzealCBBDua8RXRRu43WO0pCs+gwV2zioit3cxKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808093; c=relaxed/simple;
	bh=WXzw6p+u6/DnMYfn+ol6EJ/65UVX3dnVImk1w5OZOkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/ZXdpndh6vVWHMX4/cQtpued0WtI6Nv1j88vysvDjfkwm1Fo2KHzLOyaXBsC9hWxnsuCIrENHXMtM02bg4TNYlMpP6+koCX8VYKETiCxBDtpu6TlDqbuGY7tZoiT14w7edyZ/uGM96Dndvs7r+FPhcOlRjkE8VGEU6QxFXgSr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA3B01595;
	Wed, 16 Apr 2025 05:54:48 -0700 (PDT)
Received: from [10.57.90.106] (unknown [10.57.90.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B04573F694;
	Wed, 16 Apr 2025 05:54:48 -0700 (PDT)
Message-ID: <eba7a8fa-0b85-4b30-ab3e-9c0a65b7dc80@arm.com>
Date: Wed, 16 Apr 2025 13:54:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce redundant
 operations
Content-Language: en-GB
To: Xavier <xavier_qy@163.com>, dev.jain@arm.com, ioworker0@gmail.com,
 21cnbao@gmail.com
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
 ziy@nvidia.com
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
 <20250415082205.2249918-1-xavier_qy@163.com>
 <20250415082205.2249918-2-xavier_qy@163.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250415082205.2249918-2-xavier_qy@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/04/2025 09:22, Xavier wrote:
> This commit optimizes the contpte_ptep_get function by adding early
>  termination logic. It checks if the dirty and young bits of orig_pte
>  are already set and skips redundant bit-setting operations during
>  the loop. This reduces unnecessary iterations and improves performance.
> 
> Signed-off-by: Xavier <xavier_qy@163.com>
> ---
>  arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..0acfee604947 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>  }
>  EXPORT_SYMBOL_GPL(__contpte_try_unfold);
>  
> +/* Note: in order to improve efficiency, using this macro will modify the
> + * passed-in parameters.*/
> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> +    for (; (start) < CONT_PTES; (start)++, (ptep)++) { \
> +		if (pte_##flag(__ptep_get(ptep))) { \
> +				orig_pte = pte_mk##flag(orig_pte); \
> +				break; \
> +		} \
> +    }

I'm really not a fan of this macro, it just obfuscates what is going on. I'd
personally prefer to see the 2 extra loops open coded below.

Or even better, could you provide results comparing this 3 loop version to the
simpler approach I suggested previously? If the performance is similar (which I
expect it will be, especially given Barry's point that your test always ensures
the first PTE is both young and dirty) then I'd prefer to go with the simpler code.


> +
>  pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>  {
>  	/*
> @@ -169,11 +179,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>  	for (i = 0; i < CONT_PTES; i++, ptep++) {
>  		pte = __ptep_get(ptep);
>  
> -		if (pte_dirty(pte))
> +		if (pte_dirty(pte)) {
>  			orig_pte = pte_mkdirty(orig_pte);
> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
> +			break;
> +		}
>  
> -		if (pte_young(pte))
> +		if (pte_young(pte)) {
>  			orig_pte = pte_mkyoung(orig_pte);
> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
> +			break;
> +		}
>  	}
>  
>  	return orig_pte;

If we decide this is all worth the trouble, then I think we can (and *should*,
in order to be consistent) pull a similar stunt in contpte_ptep_get_lockless().

Thanks,
Ryan

