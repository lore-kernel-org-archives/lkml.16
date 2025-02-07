Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9530853A7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738924716; cv=none; b=QbO5qAHCUkoDjd4Q3t54AFwhmajtQZtka1BqbgOuUJP/YyiuWXzm6xWaJEhIUi5f9WY0dpMzusZttKBtmT9DVb71EM0ykd3XxOtNe/g6pGL0sBgrmCk5bzFgTbgA08gV0sk8cEE47QwOxXM+RBWzJrzGxNb6VBEvoaMX+2u9aXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738924716; c=relaxed/simple;
	bh=PhSQW8UFABUO2M4NUj9AWPJEzXSl153SRo8vMX0kyAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzGtwN8VSfXSTIuFIlDhC8s3GCib26a22DpfgvHpJRf/oN7aJwy6j4CA37TuwfUvDX3hByI1iXuN2pdrn0nM7BvnAGoJPSvua0efWEBGdE9bhtJ4okTpFLU/qc9CJgCksvAPTWIwNLWZY6jgThiuLT1mGLa7PzkVaFeSOBf9G40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FC44113E;
	Fri,  7 Feb 2025 02:38:56 -0800 (PST)
Received: from [10.57.81.111] (unknown [10.57.81.111])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4C1D3F63F;
	Fri,  7 Feb 2025 02:38:30 -0800 (PST)
Message-ID: <e0400886-d4bc-40f5-8375-fc3d515fd386@arm.com>
Date: Fri, 7 Feb 2025 10:38:28 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/16] arm64/mm: Hoist barriers out of ___set_ptes()
 loop
Content-Language: en-GB
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
 <20250205151003.88959-9-ryan.roberts@arm.com>
 <858ecac5-9ba7-48da-8f34-ffda28d17609@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <858ecac5-9ba7-48da-8f34-ffda28d17609@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/2025 05:35, Anshuman Khandual wrote:
> 
> 
> On 2/5/25 20:39, Ryan Roberts wrote:
>> ___set_ptes() previously called __set_pte() for each PTE in the range,
>> which would conditionally issue a DSB and ISB to make the new PTE value
>> immediately visible to the table walker if the new PTE was valid and for
>> kernel space.
>>
>> We can do better than this; let's hoist those barriers out of the loop
>> so that they are only issued once at the end of the loop. We then reduce
>> the cost by the number of PTEs in the range.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/arm64/include/asm/pgtable.h | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 3b55d9a15f05..1d428e9c0e5a 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -317,10 +317,8 @@ static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
>>  	WRITE_ONCE(*ptep, pte);
>>  }
>>  
>> -static inline void __set_pte(pte_t *ptep, pte_t pte)
>> +static inline void __set_pte_complete(pte_t pte)
>>  {
>> -	__set_pte_nosync(ptep, pte);
>> -
>>  	/*
>>  	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
>>  	 * or update_mmu_cache() have the necessary barriers.
>> @@ -331,6 +329,12 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
>>  	}
>>  }
>>  
>> +static inline void __set_pte(pte_t *ptep, pte_t pte)
>> +{
>> +	__set_pte_nosync(ptep, pte);
>> +	__set_pte_complete(pte);
>> +}
>> +
>>  static inline pte_t __ptep_get(pte_t *ptep)
>>  {
>>  	return READ_ONCE(*ptep);
>> @@ -647,12 +651,14 @@ static inline void ___set_ptes(struct mm_struct *mm, pte_t *ptep, pte_t pte,
>>  
>>  	for (;;) {
>>  		__check_safe_pte_update(mm, ptep, pte);
>> -		__set_pte(ptep, pte);
>> +		__set_pte_nosync(ptep, pte);
>>  		if (--nr == 0)
>>  			break;
>>  		ptep++;
>>  		pte = pte_advance_pfn(pte, stride);
>>  	}
>> +
>> +	__set_pte_complete(pte);
> 
> Given that the loop now iterates over number of page table entries without corresponding
> consecutive dsb/isb sync, could there be a situation where something else gets scheduled
> on the cpu before __set_pte_complete() is called ? Hence leaving the entire page table
> entries block without desired mapping effect. IOW how __set_pte_complete() is ensured to
> execute once the loop above completes. Otherwise this change LGTM.

I don't think this changes the model. Previously, __set_pte() was called, which
writes the pte to the pgtable, then issues the barriers. So there is still a
window where the thread could be unscheduled after the write but before the
barriers. Yes, my change makese that window bigger, but if it is a bug now, it
was a bug before.

Additionally, the spec for set_ptes() is:

/**
 * set_ptes - Map consecutive pages to a contiguous range of addresses.
 * @mm: Address space to map the pages into.
 * @addr: Address to map the first page at.
 * @ptep: Page table pointer for the first entry.
 * @pte: Page table entry for the first page.
 * @nr: Number of pages to map.
 *
 * When nr==1, initial state of pte may be present or not present, and new state
 * may be present or not present. When nr>1, initial state of all ptes must be
 * not present, and new state must be present.
 *
 * May be overridden by the architecture, or the architecture can define
 * set_pte() and PFN_PTE_SHIFT.
 *
 * Context: The caller holds the page table lock.  The pages all belong
 * to the same folio.  The PTEs are all in the same PMD.
 */

Note that the caller is required to hold the page table lock. That's a spin lock
so should be non-preemptible at this point (perhaps not for RT?)

Although actually, vmalloc doesn't hold a lock when calling these helpers; it
has a lock when allocating the VA space, then drops it.

So yes, I think there is a chance of preemption after writing the pgtable entry
but before issuing the barriers.

But in that case, we get saved by the DSB in the context switch path. There is
no guarrantee of an ISB in that path (AFAIU). But the need for an ISB is a bit
whooly anyway. My rough understanding is that the ISB is there to prevent
previous speculation from determining that a given translation was invalid and
"caching" that determination in the pipeline. That could still (theoretically)
happen on remote CPUs I think, and we have the spurious fault handler to detect
that. Anyway, once you context switch, the local CPU becomes remote and we don't
have the ISB there, so what's the difference... There's a high chance I've
misunderstood a bunch of this.


In conclusion, I don't think I've made things any worse.

Thanks,
Ryan

> 
>>  }
>>  
>>  static inline void __set_ptes(struct mm_struct *mm,

