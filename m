Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520FE20D4E7
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746680590; cv=none; b=pu78RlfELsyGNq77G6xYA2OPC2wdXBKQcdmhaZvz+EbhpCkyKCXHTDEh9tJgF2nlDjxQjld2PMO3jYfja78x+wly/KZN+S7KI5UjZ4xkIIscCWeKiuE6GPSA/VDmr6Ddrni7G5PqEU5GKf+m0e+XFLJmL111bdiCfKjYxNxTxgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746680590; c=relaxed/simple;
	bh=8VgUjmIFW1XAoP2V9YRDBAqWROZGNvDm4mp6pVYPgY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAZF3EtsyciKFo7SDkKPm0fcYlRVwGuCFIyQvzrukGfErvnhn8m4rNo3iz4Z40os1slMpmOfGwsGLP5rvMRY5SNCK7CXr+sMdHayMCOJQMsxxJIBKwfL9iD5NltIXNUjFgdWm21cH8K69daNrmO+4AqWkcbvSPrnQoxE+qnf4MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C35BF106F;
	Wed,  7 May 2025 22:02:56 -0700 (PDT)
Received: from [10.162.43.19] (K4MQJ0H1H2.blr.arm.com [10.162.43.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C0F03F673;
	Wed,  7 May 2025 22:03:01 -0700 (PDT)
Message-ID: <b104b843-f12a-4382-a05f-53e2e35bdcb0@arm.com>
Date: Thu, 8 May 2025 10:32:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm: Add generic helper to hint a large folio
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, ryan.roberts@arm.com,
 mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
 zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-3-dev.jain@arm.com>
 <887fb371-409e-4dad-b4ff-38b85bfddf95@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <887fb371-409e-4dad-b4ff-38b85bfddf95@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/05/25 3:33 pm, David Hildenbrand wrote:
> On 06.05.25 07:00, Dev Jain wrote:
>> To use PTE batching, we want to determine whether the folio mapped by
>> the PTE is large, thus requiring the use of vm_normal_folio(). We want
>> to avoid the cost of vm_normal_folio() if the code path doesn't already
>> require the folio. For arm64, pte_batch_hint() does the job. To 
>> generalize
>> this hint, add a helper which will determine whether two consecutive PTEs
>> point to consecutive PFNs, in which case there is a high probability that
>> the underlying folio is large.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/pgtable.h | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..28e21fcc7837 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -369,6 +369,22 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
>>   }
>>   #endif
>> +/* Caller must ensure that ptep + 1 exists */
>> +static inline bool maybe_contiguous_pte_pfns(pte_t *ptep, pte_t pte)
>> +{
>> +    pte_t *next_ptep, next_pte;
>> +
>> +    if (pte_batch_hint(ptep, pte) != 1)
>> +        return true;
>> +
>> +    next_ptep = ptep + 1;
>> +    next_pte = ptep_get(next_ptep);
>> +    if (!pte_present(next_pte))
>> +        return false;
>> +
>> +    return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == PAGE_SIZE);
>> +}
> 
> So, where we want to use that is:
> 
> if (pte_present(old_pte)) {
>      if ((max_nr != 1) && maybe_contiguous_pte_pfns(old_ptep, old_pte)) {
>          struct folio *folio = vm_normal_folio(vma, old_addr, old_pte);
> 
>          if (folio && folio_test_large(folio))
>              nr = folio_pte_batch(folio, old_addr, old_ptep,
>                           old_pte, max_nr, fpb_flags, NULL, NULL, NULL);
>      }
> }
> 
> where we won't need the folio later. But want it all part of the same 
> folio?
> 
> 
> And the simpler version would be
> 
> 
> if (pte_present(old_pte)) {
>      if (max_nr != 1) {
>          struct folio *folio = vm_normal_folio(vma, old_addr, old_pte);
> 
>          if (folio && folio_test_large(folio))
>              nr = folio_pte_batch(folio, old_addr, old_ptep,
>                           old_pte, max_nr, fpb_flags, NULL, NULL, NULL);
>      }
> }
> 
> 
> Two things come to mind:
> 
> (1) Do we *really* care about the vm_normal_folio() + folio_test_large() 
> call that much, that you
> have to add this optimization ahead of times ? :)

For my mprotect series, I see a regression of almost (7.7 - 7.65)/7.7 = 
0.65% for the small folio case. I am happy to remove this 
micro-optimization if that is the preference.

> 
> (2) Do we really need "must be part of the same folio", or could be just 
> batch over present
> ptes that map consecutive PFNs? In that case, a helper that avoids 
> folio_pte_batch() completely
> might be better.
> 
I am not sure I get you here. folio_pte_batch() seems to be the simplest 
thing we can do as being done around in the code elsewhere, I am not 
aware of any alternate.



