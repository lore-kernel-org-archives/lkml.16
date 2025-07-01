Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4E31CAB3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 04:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751344224; cv=none; b=OCGz+oTlwd2ReEb76lSrpLypTC3r7fToZI0CDtC9dJfecMlHu5eB5SFn8E+MEZKHVYhDZe1gNMLoHQeHgtlQ8DgyQiPrPn6Je7KjAE+nlASO7UhUx98MGFYa/1Z/3glWvP4Z7MYwq5hgEf1kokXxaHHk4iVqPzdqZHIryBbgOOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751344224; c=relaxed/simple;
	bh=8rS+DSROzdfCqjlR+Z1Kf+I5DLxax/xToJ/YJQQlHAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UleTN4I97Rt1y500Eqt0jz4suj/o+kWtfCQY2/X2RddjrXd3VixcqGRvqFcNRRLdf8Si/57bSshL3zsb6xRmaBJrGCKzArYY7lXkwpnETH+fJCrDQbw53pXTBSZQHCkEht+p2FkUf0uNkmkUmUvfEwPx8oxm50AlCMU/1rMLVcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA41F15A1;
	Mon, 30 Jun 2025 21:30:06 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DC223F58B;
	Mon, 30 Jun 2025 21:30:18 -0700 (PDT)
Message-ID: <3e4576fb-d25c-4415-9df8-8133039af7cd@arm.com>
Date: Tue, 1 Jul 2025 10:00:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Reduce race probability between migration and
 khugepaged
To: Dev Jain <dev.jain@arm.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250630044837.4675-1-dev.jain@arm.com>
 <e05103e1-3cdc-4271-b78f-84299d1a4efe@lucifer.local>
 <4e2ea3d3-d519-43cb-8026-d448e1d8df98@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <4e2ea3d3-d519-43cb-8026-d448e1d8df98@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 30/06/25 8:00 PM, Dev Jain wrote:
> 
> On 30/06/25 6:57 pm, Lorenzo Stoakes wrote:
>> On Mon, Jun 30, 2025 at 10:18:37AM +0530, Dev Jain wrote:
>>> Suppose a folio is under migration, and khugepaged is also trying to
>>> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
>>> page cache via filemap_lock_folio(), thus taking a reference on the folio
>>> and sleeping on the folio lock, since the lock is held by the migration
>>> path. Migration will then fail in
>>> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
>>> such a race happening (leading to migration failure) by bailing out
>>> if we detect a PMD is marked with a migration entry.
>> This is a nice find!
>>
>>> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
>>>
>>> Note that, this is not a "fix" since it only reduces the chance of
>>> interference of khugepaged with migration, wherein both the kernel
>>> functionalities are deemed "best-effort".
>> Thanks for separating this out, appreciated!
>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>
>>> This patch was part of
>>> https://lore.kernel.org/all/20250625055806.82645-1-dev.jain@arm.com/
>>> but I have sent it separately on suggestion of Lorenzo, and also because
>>> I plan to send the first two patches after David Hildenbrand's
>>> folio_pte_batch series gets merged.
>>>
>>>   mm/khugepaged.c | 12 ++++++++++--
>>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index 1aa7ca67c756..99977bb9bf6a 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -31,6 +31,7 @@ enum scan_result {
>>>       SCAN_FAIL,
>>>       SCAN_SUCCEED,
>>>       SCAN_PMD_NULL,
>>> +    SCAN_PMD_MIGRATION,
>>>       SCAN_PMD_NONE,
>>>       SCAN_PMD_MAPPED,
>>>       SCAN_EXCEED_NONE_PTE,
>>> @@ -941,6 +942,8 @@ static inline int check_pmd_state(pmd_t *pmd)
>>>
>>>       if (pmd_none(pmde))
>>>           return SCAN_PMD_NONE;
>>> +    if (is_pmd_migration_entry(pmde))
>>> +        return SCAN_PMD_MIGRATION;
>> With David's suggestions I guess this boils down to simply adding this line.
> 
> I think it should be
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 1aa7ca67c756..8a6ba5c8ba4d 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -941,10 +941,10 @@ static inline int check_pmd_state(pmd_t *pmd)
>  
>      if (pmd_none(pmde))
>          return SCAN_PMD_NONE;
> +    if (is_pmd_migration_entry(pmde) || pmd_trans_huge(pmde))
> +        return SCAN_PMD_MAPPED;
>      if (!pmd_present(pmde))
>          return SCAN_PMD_NULL;
> -    if (pmd_trans_huge(pmde))
> -        return SCAN_PMD_MAPPED;
>      if (pmd_bad(pmde))
>          return SCAN_PMD_NULL;
>      return SCAN_SUCCEED;
> 
> Moving this line above since we don't want to exit prematurely
> due to !pmd_present(pmde).

Might be cleaner to just add the migration test separately before
the pmd_present() and without modifying existing pmd_trans_huge().

	if (is_pmd_migration_entry(pmde))
		return SCAN_PMD_MAPPED;

> 
> 
>>
>> Could we add a quick comment to explain why here?
> 
> Sure.
> 
>>
>> Thanks!
>>
>>>       if (!pmd_present(pmde))
>>>           return SCAN_PMD_NULL;
>>>       if (pmd_trans_huge(pmde))
>>> @@ -1502,9 +1505,12 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>           !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
>>>           return SCAN_VMA_CHECK;
>>>
>>> -    /* Fast check before locking page if already PMD-mapped */
>>> +    /*
>>> +     * Fast check before locking folio if already PMD-mapped, or if the
>>> +     * folio is under migration
>>> +     */
>>>       result = find_pmd_or_thp_or_none(mm, haddr, &pmd);
>>> -    if (result == SCAN_PMD_MAPPED)
>>> +    if (result == SCAN_PMD_MAPPED || result == SCAN_PMD_MIGRATION)
>>>           return result;
>>>
>>>       /*
>>> @@ -2716,6 +2722,7 @@ static int madvise_collapse_errno(enum scan_result r)
>>>       case SCAN_PAGE_LRU:
>>>       case SCAN_DEL_PAGE_LRU:
>>>       case SCAN_PAGE_FILLED:
>>> +    case SCAN_PMD_MIGRATION:
>>>           return -EAGAIN;
>>>       /*
>>>        * Other: Trying again likely not to succeed / error intrinsic to
>>> @@ -2802,6 +2809,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>>>               goto handle_result;
>>>           /* Whitelisted set of results where continuing OK */
>>>           case SCAN_PMD_NULL:
>>> +        case SCAN_PMD_MIGRATION:
>>>           case SCAN_PTE_NON_PRESENT:
>>>           case SCAN_PTE_UFFD_WP:
>>>           case SCAN_PAGE_RO:
>>> -- 
>>> 2.30.2
>>>
> 

