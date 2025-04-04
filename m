Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8160C3C38
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 04:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743739890; cv=none; b=NwcWyBiIL91Xa2rg4rHxV4HTPX2FhzuujIzBmzNTL9Aoc+2W0Q+I1jQbYW2wliKCC9QJ7td6noOKgPvbOrlJCFvdHtib4ibtT1Q/7/XQwkgQbhnN2bp9N93Y/2i7+VWKS1LgX+I7BMHTLrR9hhLEaUVb2t5enX7qOc726qeJ8Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743739890; c=relaxed/simple;
	bh=RwhId/nrIl4o0TQisWrc7Pucsmxv+o91juqjrVENBX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+LDfF1QOVQw+QOrqHbqzwLagB6eJP1J4zZde/a+Ju0R6sj83ZgHOciy438foXaNOCIXOoER3SUzfCvIUgHyla7tyEQmdU6buSy0IQPvVE4LRRt7JDuzDzqL0jId18wXi+ybYEY/mPHYjkTxgr61pdNVdyioQklYLoCHyrQHSPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5EC51516;
	Thu,  3 Apr 2025 21:11:29 -0700 (PDT)
Received: from [10.162.40.17] (a077893.blr.arm.com [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A59C83F59E;
	Thu,  3 Apr 2025 21:11:22 -0700 (PDT)
Message-ID: <4b706492-abaf-44f9-92dc-ba5aadc80c31@arm.com>
Date: Fri, 4 Apr 2025 09:41:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/11] arm64/mm: Hoist barriers out of set_ptes_anysz()
 loop
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-7-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250304150444.3788920-7-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/4/25 20:34, Ryan Roberts wrote:
> set_ptes_anysz() previously called __set_pte() for each PTE in the
> range, which would conditionally issue a DSB and ISB to make the new PTE
> value immediately visible to the table walker if the new PTE was valid
> and for kernel space.
> 
> We can do better than this; let's hoist those barriers out of the loop
> so that they are only issued once at the end of the loop. We then reduce
> the cost by the number of PTEs in the range.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index e255a36380dc..1898c3069c43 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -317,13 +317,11 @@ static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
>  	WRITE_ONCE(*ptep, pte);
>  }
>  
> -static inline void __set_pte(pte_t *ptep, pte_t pte)
> +static inline void __set_pte_complete(pte_t pte)
>  {
> -	__set_pte_nosync(ptep, pte);
> -
>  	/*
>  	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
> -	 * or update_mmu_cache() have the necessary barriers.
> +	 * has the necessary barriers.
>  	 */
>  	if (pte_valid_not_user(pte)) {
>  		dsb(ishst);
> @@ -331,6 +329,12 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
>  	}
>  }
>  
> +static inline void __set_pte(pte_t *ptep, pte_t pte)
> +{
> +	__set_pte_nosync(ptep, pte);
> +	__set_pte_complete(pte);
> +}
> +
>  static inline pte_t __ptep_get(pte_t *ptep)
>  {
>  	return READ_ONCE(*ptep);
> @@ -647,12 +651,14 @@ static inline void set_ptes_anysz(struct mm_struct *mm, pte_t *ptep, pte_t pte,
>  
>  	for (;;) {
>  		__check_safe_pte_update(mm, ptep, pte);
> -		__set_pte(ptep, pte);
> +		__set_pte_nosync(ptep, pte);
>  		if (--nr == 0)
>  			break;
>  		ptep++;
>  		pte = pte_advance_pfn(pte, stride);
>  	}
> +
> +	__set_pte_complete(pte);
>  }
>  
>  static inline void __set_ptes(struct mm_struct *mm,

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
