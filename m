Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCEB13CFA6
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 05:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738906555; cv=none; b=AhkRHAXuz/jTv6ZOPVWaPZglBKOYhwklUNQ8/IMzOe1Iugnhkqf0sW9xny+3mgRQk1VuMvGGkjAL9xJnY20hpVxRoWQVxu/uGo5B+YQSwZ/nfdjaNQE4s9lD+ELbYQmpCaL4Pm1LJwgtxNSJ1VoBO3VJydZFRh6rmbfwhFvSLdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738906555; c=relaxed/simple;
	bh=xljf9F05G6fuPrXi3u2VM28jvPvwIUQBqPPfPJBmi2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2xWUpGy6sHOa0rfZdOsMc75m9Uw74wX1mGZ+Jx99kGheD3WFzdYu/F/dquc8Yt6ONAUcQpIoJUBSlBgPe9N+gRWgRZmLMwfoNRD+tDZ6nXwzHXxdYQ7QJrzODdClfRnEYAf+bmPYF2g/NxKm714cfXHWoXcs3lyiuQ1S0mL92c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81E11106F;
	Thu,  6 Feb 2025 21:36:07 -0800 (PST)
Received: from [10.162.16.89] (a077893.blr.arm.com [10.162.16.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 681BE3F63F;
	Thu,  6 Feb 2025 21:35:39 -0800 (PST)
Message-ID: <858ecac5-9ba7-48da-8f34-ffda28d17609@arm.com>
Date: Fri, 7 Feb 2025 11:05:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/16] arm64/mm: Hoist barriers out of ___set_ptes()
 loop
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-9-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-9-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/5/25 20:39, Ryan Roberts wrote:
> ___set_ptes() previously called __set_pte() for each PTE in the range,
> which would conditionally issue a DSB and ISB to make the new PTE value
> immediately visible to the table walker if the new PTE was valid and for
> kernel space.
> 
> We can do better than this; let's hoist those barriers out of the loop
> so that they are only issued once at the end of the loop. We then reduce
> the cost by the number of PTEs in the range.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 3b55d9a15f05..1d428e9c0e5a 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -317,10 +317,8 @@ static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
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
>  	 * or update_mmu_cache() have the necessary barriers.
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
> @@ -647,12 +651,14 @@ static inline void ___set_ptes(struct mm_struct *mm, pte_t *ptep, pte_t pte,
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

Given that the loop now iterates over number of page table entries without corresponding
consecutive dsb/isb sync, could there be a situation where something else gets scheduled
on the cpu before __set_pte_complete() is called ? Hence leaving the entire page table
entries block without desired mapping effect. IOW how __set_pte_complete() is ensured to
execute once the loop above completes. Otherwise this change LGTM.

>  }
>  
>  static inline void __set_ptes(struct mm_struct *mm,
