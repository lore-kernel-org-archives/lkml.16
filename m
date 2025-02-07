Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4720D192D77
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921108; cv=none; b=PpW64X3LK//SXVGxEStNpWFAFlPPDWR6ikYzOJZEAy0NJEHMkaAISM8pslPy0Yc1ta7gNXbBXKWKP9+yHJ69ey2ItPgPGOycV5tDaNxZEbS+Uh/FpMWDYE4VqT9hN+es2z0tufbYYa5NnDuLdW/HlP15dQ2ukS9/lxaDisMGjiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921108; c=relaxed/simple;
	bh=AEC3bPor2wBJhHmy1ZvaEYYwdbToEhKxc4H9SOre3cY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=k1G7qs2qaMo3wKL6bedKZhGh0r4MHMxiPbDYepdhZsTPRlRhkF2YGAocGREZVq/mMQyG8Z3JwFsggacm/0615pQMgekBisaKX9wVI88XQr9P6Kpe6SqHdQ2+E2uY0vP0n3mvmIi3AhCjgwc6yjAqOUthV6i1Kgl95xEv66E8VdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AFA2339;
	Fri,  7 Feb 2025 01:38:48 -0800 (PST)
Received: from [10.57.81.111] (unknown [10.57.81.111])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83F283F5A1;
	Fri,  7 Feb 2025 01:38:22 -0800 (PST)
Message-ID: <0492ed88-673a-435b-bc89-5f35637b4be6@arm.com>
Date: Fri, 7 Feb 2025 09:38:20 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/16] arm64/mm: Refactor __set_ptes() and
 __ptep_get_and_clear()
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>,
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
 <20250205151003.88959-7-ryan.roberts@arm.com>
 <bdd08da7-d978-437a-849f-8a6115933e19@arm.com>
 <0538d186-470e-4c4d-974c-0d7f2c96e549@arm.com>
In-Reply-To: <0538d186-470e-4c4d-974c-0d7f2c96e549@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/02/2025 13:26, Ryan Roberts wrote:
> On 06/02/2025 11:48, Anshuman Khandual wrote:
>> On 2/5/25 20:39, Ryan Roberts wrote:
>>> Refactor __set_ptes(), set_pmd_at() and set_pud_at() so that they are
>>> all a thin wrapper around a generic ___set_ptes(), which takes pgsize
>>
>> s/generic/common - as generic might be misleading for being generic MM.
> 
> Good spot. I'll make this change.
> 
>>
>>> parameter. This cleans up the code to remove the confusing
>>> __set_pte_at() (which was only ever used for pmd/pud) and will allow us
>>> to perform future barrier optimizations in a single place. Additionally,
>>> it will permit the huge_pte API to efficiently batch-set pgtable entries
>>> and take advantage of the future barrier optimizations.
>>
>> Makes sense.
>>
>>>
>>> ___set_ptes() calls the correct page_table_check_*_set() function based
>>> on the pgsize. This means that huge_ptes be able to get proper coverage
>>> regardless of their size, once it's plumbed into huge_pte. Currently the
>>> huge_pte API always uses the pte API which assumes an entry only covers
>>> a single page.
>>
>> Right
>>
>>>
>>> While we are at it, refactor __ptep_get_and_clear() and
>>> pmdp_huge_get_and_clear() to use a common ___ptep_get_and_clear() which
>>> also takes a pgsize parameter. This will provide the huge_pte API the
>>> means to clear ptes corresponding with the way they were set.
>>
>> __ptep_get_and_clear() refactoring does not seem to be related to the
>> previous __set_ptes(). Should they be separated out into two different
>> patches instead - for better clarity and review ? Both these clean ups
>> have enough change and can stand own their own.
> 
> Yeah I think you're probably right... I was being lazy... I'll separate them.
> 
>>
>>>
>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>> ---
>>>  arch/arm64/include/asm/pgtable.h | 108 +++++++++++++++++++------------
>>>  1 file changed, 67 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>>> index 0b2a2ad1b9e8..3b55d9a15f05 100644
>>> --- a/arch/arm64/include/asm/pgtable.h
>>> +++ b/arch/arm64/include/asm/pgtable.h
>>> @@ -420,23 +420,6 @@ static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
>>>  	return pfn_pte(pte_pfn(pte) + nr, pte_pgprot(pte));
>>>  }
>>>  
>>> -static inline void __set_ptes(struct mm_struct *mm,
>>> -			      unsigned long __always_unused addr,
>>> -			      pte_t *ptep, pte_t pte, unsigned int nr)
>>> -{
>>> -	page_table_check_ptes_set(mm, ptep, pte, nr);
>>> -	__sync_cache_and_tags(pte, nr);
>>> -
>>> -	for (;;) {
>>> -		__check_safe_pte_update(mm, ptep, pte);
>>> -		__set_pte(ptep, pte);
>>> -		if (--nr == 0)
>>> -			break;
>>> -		ptep++;
>>> -		pte = pte_advance_pfn(pte, 1);
>>> -	}
>>> -}
>>> -
>>>  /*
>>>   * Hugetlb definitions.
>>>   */
>>> @@ -641,30 +624,59 @@ static inline pgprot_t pud_pgprot(pud_t pud)
>>>  	return __pgprot(pud_val(pfn_pud(pfn, __pgprot(0))) ^ pud_val(pud));
>>>  }
>>>  
>>> -static inline void __set_pte_at(struct mm_struct *mm,
>>> -				unsigned long __always_unused addr,
>>> -				pte_t *ptep, pte_t pte, unsigned int nr)
>>> +static inline void ___set_ptes(struct mm_struct *mm, pte_t *ptep, pte_t pte,
>>> +			       unsigned int nr, unsigned long pgsize)
>>
>> So address got dropped and page size got added as an argument.
> 
> Yeah; addr is never used in our implementations so I figured why haul it around
> everywhere?
> 
>> s/___set_ptes/___set_pxds ? to be more generic for all levels.
> 
> So now we are into naming... I agree that in some senses pte feels specific to
> the last level. But it's long form "page table entry" seems more generic than
> "pxd" which implies only pmd, pud, p4d and pgd. At least to me...
> 
> I think we got stuck trying to figure out a clear and short term for "page table
> entry at any level" in the past. I think ttd was the best we got; Translation
> Table Descriptor, which is the term the Arm ARM uses. But that opens a can of
> worms as now we need tdd_t and all the converters pte_tdd(), tdd_pte(),
> pmd_tdd(), ... and probably a bunch more stuff on top.
> 
> So personally I prefer to take the coward's way out and just reuse pte.

How about set_ptes_anylvl() and ptep_get_and_clear_anylvl()? I think this makes
it explicit and has the benefit of removing the leading underscores. It also
means we can reuse pte_t and friends, and we can exetend this nomenclature to
other places in future at the expense of a 7 char suffix ("_anylvl").

What do you think?

> 
>>
>>>  {
>>> -	__sync_cache_and_tags(pte, nr);
>>> -	__check_safe_pte_update(mm, ptep, pte);
>>> -	__set_pte(ptep, pte);
>>> +	unsigned long stride = pgsize >> PAGE_SHIFT;
>>> +
>>> +	switch (pgsize) {
>>> +	case PAGE_SIZE:
>>> +		page_table_check_ptes_set(mm, ptep, pte, nr);
>>> +		break;
>>> +	case PMD_SIZE:
>>> +		page_table_check_pmds_set(mm, (pmd_t *)ptep, pte_pmd(pte), nr);
>>> +		break;
>>> +	case PUD_SIZE:
>>> +		page_table_check_puds_set(mm, (pud_t *)ptep, pte_pud(pte), nr);
>>> +		break;
>>
>> This is where the new page table check APIs get used for batch testing.
> 
> Yes and I anticipate that the whole switch block should be optimized out when
> page_table_check is disabled.
> 
>>
>>> +	default:
>>> +		VM_WARN_ON(1);
>>> +	}
>>> +
>>> +	__sync_cache_and_tags(pte, nr * stride);
>>> +
>>> +	for (;;) {
>>> +		__check_safe_pte_update(mm, ptep, pte);
>>> +		__set_pte(ptep, pte);
>>> +		if (--nr == 0)
>>> +			break;
>>> +		ptep++;
>>> +		pte = pte_advance_pfn(pte, stride);
>>> +	}
>>>  }
>>
>> LGTM
>>
>>>  
>>> -static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>>> -			      pmd_t *pmdp, pmd_t pmd)
>>> +static inline void __set_ptes(struct mm_struct *mm,
>>> +			      unsigned long __always_unused addr,
>>> +			      pte_t *ptep, pte_t pte, unsigned int nr)
>>>  {
>>> -	page_table_check_pmd_set(mm, pmdp, pmd);
>>> -	return __set_pte_at(mm, addr, (pte_t *)pmdp, pmd_pte(pmd),
>>> -						PMD_SIZE >> PAGE_SHIFT);
>>> +	___set_ptes(mm, ptep, pte, nr, PAGE_SIZE);
>>>  }
>>>  
>>> -static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
>>> -			      pud_t *pudp, pud_t pud)
>>> +static inline void __set_pmds(struct mm_struct *mm,
>>> +			      unsigned long __always_unused addr,
>>> +			      pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>>> +{
>>> +	___set_ptes(mm, (pte_t *)pmdp, pmd_pte(pmd), nr, PMD_SIZE);
>>> +}
>>> +#define set_pmd_at(mm, addr, pmdp, pmd) __set_pmds(mm, addr, pmdp, pmd, 1)
>>> +
>>> +static inline void __set_puds(struct mm_struct *mm,
>>> +			      unsigned long __always_unused addr,
>>> +			      pud_t *pudp, pud_t pud, unsigned int nr)
>>>  {
>>> -	page_table_check_pud_set(mm, pudp, pud);
>>> -	return __set_pte_at(mm, addr, (pte_t *)pudp, pud_pte(pud),
>>> -						PUD_SIZE >> PAGE_SHIFT);
>>> +	___set_ptes(mm, (pte_t *)pudp, pud_pte(pud), nr, PUD_SIZE);
>>>  }
>>> +#define set_pud_at(mm, addr, pudp, pud) __set_puds(mm, addr, pudp, pud, 1)
>>
>> LGTM
>>
>>>  
>>>  #define __p4d_to_phys(p4d)	__pte_to_phys(p4d_pte(p4d))
>>>  #define __phys_to_p4d_val(phys)	__phys_to_pte_val(phys)
>>> @@ -1276,16 +1288,34 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
>>>  }
>>>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
>>>  
>>> -static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
>>> -				       unsigned long address, pte_t *ptep)
>>> +static inline pte_t ___ptep_get_and_clear(struct mm_struct *mm, pte_t *ptep,
>>> +				       unsigned long pgsize)
>>
>> So address got dropped and page size got added as an argument.
>>
>>>  {
>>>  	pte_t pte = __pte(xchg_relaxed(&pte_val(*ptep), 0));
>>>  
>>> -	page_table_check_pte_clear(mm, pte);
>>> +	switch (pgsize) {
>>> +	case PAGE_SIZE:
>>> +		page_table_check_pte_clear(mm, pte);
>>> +		break;
>>> +	case PMD_SIZE:
>>> +		page_table_check_pmd_clear(mm, pte_pmd(pte));
>>> +		break;
>>> +	case PUD_SIZE:
>>> +		page_table_check_pud_clear(mm, pte_pud(pte));
>>> +		break;
>>> +	default:
>>> +		VM_WARN_ON(1);
>>> +	}
>>>  
>>>  	return pte;
>>>  }
>>>  
>>> +static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
>>> +				       unsigned long address, pte_t *ptep)
>>> +{
>>> +	return ___ptep_get_and_clear(mm, ptep, PAGE_SIZE);
>>> +}
>>> +
>>>  static inline void __clear_full_ptes(struct mm_struct *mm, unsigned long addr,
>>>  				pte_t *ptep, unsigned int nr, int full)
>>>  {
>>> @@ -1322,11 +1352,7 @@ static inline pte_t __get_and_clear_full_ptes(struct mm_struct *mm,
>>>  static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>>>  					    unsigned long address, pmd_t *pmdp)
>>>  {
>>> -	pmd_t pmd = __pmd(xchg_relaxed(&pmd_val(*pmdp), 0));
>>> -
>>> -	page_table_check_pmd_clear(mm, pmd);
>>> -
>>> -	return pmd;
>>> +	return pte_pmd(___ptep_get_and_clear(mm, (pte_t *)pmdp, PMD_SIZE));
>>>  }
>>>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>>>  
>>
>> Although currently there is no pudp_huge_get_and_clear() helper on arm64
>> reworked ___ptep_get_and_clear() will be able to support that as well if
>> and when required as it now supports PUD_SIZE page size.
> 
> yep.
> 
> Thanks for all your review so far!
> 

