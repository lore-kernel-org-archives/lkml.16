Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F90018FDD5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926001; cv=none; b=V2FOlAi6FmPnCplCVc0JL6AHE40IvvCHGY4o+SGLH5aKoiYCxuWk2AdL/FNuw2wJkXnPOje/3B24IbvyI3L/88rsu6LsMRaVHDGCY6ZuFaV1xY0t8ioO+1WvOJRpJpxhBCxo5fDyE+TxHX9WgRytdKJVecLujVGb7d6KlodUOVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926001; c=relaxed/simple;
	bh=//pQVvFwakmOqUSe9lGfJeVcFsPHvgzKBULKDjW+0hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tm1yte2EnnQRJjCjbULeyN+s7HluSdqCUtq3Gz3KByetftZU+tl5EAjwImmGW8ZnUpjXBNoHxXn0NCbJHy3drTFR/oWzFMkSE8lB4BaAiGDNwenLpj4zyk6lPDiamCUQyCz2msmJWO4epVsL3Ab1kH/ICAAfE1vzHFtyAW4L4ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E81B113E;
	Fri,  7 Feb 2025 03:00:21 -0800 (PST)
Received: from [10.57.81.111] (unknown [10.57.81.111])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AED2C3F63F;
	Fri,  7 Feb 2025 02:59:55 -0800 (PST)
Message-ID: <faa89fec-4b02-4844-859e-3b0e7f402d89@arm.com>
Date: Fri, 7 Feb 2025 10:59:53 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/16] mm/vmalloc: Warn on improper use of
 vunmap_range()
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
 <20250205151003.88959-11-ryan.roberts@arm.com>
 <3bbae070-1ae3-4f5d-86ab-b3221425a1cb@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <3bbae070-1ae3-4f5d-86ab-b3221425a1cb@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/2025 08:41, Anshuman Khandual wrote:
> On 2/5/25 20:39, Ryan Roberts wrote:
>> A call to vmalloc_huge() may cause memory blocks to be mapped at pmd or
>> pud level. But it is possible to subsquently call vunmap_range() on a
> 
> s/subsquently/subsequently
> 
>> sub-range of the mapped memory, which partially overlaps a pmd or pud.
>> In this case, vmalloc unmaps the entire pmd or pud so that the
>> no-overlapping portion is also unmapped. Clearly that would have a bad
>> outcome, but it's not something that any callers do today as far as I
>> can tell. So I guess it's jsut expected that callers will not do this.
> 
> s/jsut/just
> 
>>
>> However, it would be useful to know if this happened in future; let's
>> add a warning to cover the eventuality.
> 
> This is a reasonable check to prevent bad outcomes later.
> 
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  mm/vmalloc.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index a6e7acebe9ad..fcdf67d5177a 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -374,8 +374,10 @@ static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>>  		if (cleared || pmd_bad(*pmd))
>>  			*mask |= PGTBL_PMD_MODIFIED;
>>  
>> -		if (cleared)
>> +		if (cleared) {
>> +			WARN_ON(next - addr < PMD_SIZE);
>>  			continue;
>> +		}
>>  		if (pmd_none_or_clear_bad(pmd))
>>  			continue;
>>  		vunmap_pte_range(pmd, addr, next, mask);
>> @@ -399,8 +401,10 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
>>  		if (cleared || pud_bad(*pud))
>>  			*mask |= PGTBL_PUD_MODIFIED;
>>  
>> -		if (cleared)
>> +		if (cleared) {
>> +			WARN_ON(next - addr < PUD_SIZE);
>>  			continue;
>> +		}
>>  		if (pud_none_or_clear_bad(pud))
>>  			continue;
>>  		vunmap_pmd_range(pud, addr, next, mask);
> Why not also include such checks in vunmap_p4d_range() and __vunmap_range_noflush()
> for corresponding P4D and PGD levels as well ?

The kernel does not support p4d or pgd leaf entries so there is nothing to check.

Although vunmap_p4d_range() does call p4d_clear_huge(). The function is a stub
and returns void (unlike p[mu]d_clear_huge()). I suspect we could just remove
p4d_clear_huge() entirely. But that would be a separate patch to mm tree I think.

For pgd, there isn't even an equivalent looking function.

Basically at those 2 levels, it's always a table.

Thanks,
Ryan
