Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5198242927
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750682236; cv=none; b=OdvVx/WSTN4ySwVHr+ZcA4gubgl7WN9nr0pnIJvT//3JkN86lfjFUyjdhYUaHVDgSn45jjDU0TEe+va8cVgNrUtOF/yZ7NasyU5kIAFpvJXREtISvOwURwz4wG4IGLPt5y1aj3Ecp1NLqeJehFBFAD7sUCCM98ZIxuxbzKeIrlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750682236; c=relaxed/simple;
	bh=bzDDsQlEQ3ji0eAAI8fReYnoA4MrDe23c5ZxGbpgVe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vojw0gxgNWE8G4C42Ubx4mQjpaM0AeuBkKER5GhN/aDb0qFeetCyS7VAAv2KRo60D8l2VhRC5T73pCdtDgpcUmIbjhfwfdSYodiUCksNStRnPF6wHJxRJy7M39fR/tVKIT1EOcnDqro7bK4kbXNlIGqd+lZsdYPEL+GJTXh+1eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E20B113E;
	Mon, 23 Jun 2025 05:36:55 -0700 (PDT)
Received: from [10.1.29.169] (XHFQ2J9959.cambridge.arm.com [10.1.29.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F129F3F58B;
	Mon, 23 Jun 2025 05:37:12 -0700 (PDT)
Message-ID: <107bfdb7-c8f5-45fa-872e-3e6928dc8025@arm.com>
Date: Mon, 23 Jun 2025 13:37:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmalloc: leave lazy MMU mode on PTE mapping error
Content-Language: en-GB
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250623075721.2817094-1-agordeev@linux.ibm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250623075721.2817094-1-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/06/2025 08:57, Alexander Gordeev wrote:
> Function vmap_pages_pte_range() enters the lazy MMU mode,
> but fails to leave it in case an error is encountered.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202506132017.T1l1l6ME-lkp@intel.com/
> Fixes: 44562c71e2cf ("mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes")
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>

Ouch, sorry about that! The patch looks good to me so:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

I wonder an aditional Fixes: should be added for Commit 2ba3e6947aed
("mm/vmalloc: track which page-table levels were modified") though? That's the
one that added the "*mask |= PGTBL_PTE_MODIFIED;" which would have also been
skipped if an error occured before this patch.

Thanks,
Ryan


> ---
>  mm/vmalloc.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index ab986dd09b6a..6dbcdceecae1 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -514,6 +514,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
>  		pgtbl_mod_mask *mask)
>  {
> +	int err = 0;
>  	pte_t *pte;
>  
>  	/*
> @@ -530,12 +531,18 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  	do {
>  		struct page *page = pages[*nr];
>  
> -		if (WARN_ON(!pte_none(ptep_get(pte))))
> -			return -EBUSY;
> -		if (WARN_ON(!page))
> -			return -ENOMEM;
> -		if (WARN_ON(!pfn_valid(page_to_pfn(page))))
> -			return -EINVAL;
> +		if (WARN_ON(!pte_none(ptep_get(pte)))) {
> +			err = -EBUSY;
> +			break;
> +		}
> +		if (WARN_ON(!page)) {
> +			err = -ENOMEM;
> +			break;
> +		}
> +		if (WARN_ON(!pfn_valid(page_to_pfn(page)))) {
> +			err = -EINVAL;
> +			break;
> +		}
>  
>  		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
>  		(*nr)++;
> @@ -543,7 +550,8 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  
>  	arch_leave_lazy_mmu_mode();
>  	*mask |= PGTBL_PTE_MODIFIED;
> -	return 0;
> +
> +	return err;
>  }
>  
>  static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,

