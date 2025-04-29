Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128B624EAB3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909694; cv=none; b=JXxR3wnKXsv9LDFW40phXyugquzjpbmrATMuK1z5kDM9Z6HloAgdz8ml8mz4vabZooYF9vPBIXDRUC/+Oyu/RXX8qmP2xn0WHwFOCqGbFv1zCNYKcwDSfLCwUZjCwtYH0VYGYOhPx/tlp0kfBuZwcIK56iH9GPYsV/msdfcZ/Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909694; c=relaxed/simple;
	bh=yAfxxEt3u2cGWEC1v5XC7vdbYm+8s7aIBUQAa+eMuVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tAEQNJb9KSN64JwXfmFaAZzhZckmsF4XG1r/PfxE01LFwYbxCDB2+9cDHQsN7/CkukmpTA519qJh9ynFIG3nEnqJR/2NPA8b/oLgIIk+/TZugq9ZPb9pYaZ/iwfQGGZ+meRqRtulCIYNvw50qVHsUryyBR3qFWRRGgUmsaUqlNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7693D1515;
	Mon, 28 Apr 2025 23:54:44 -0700 (PDT)
Received: from [10.163.78.253] (unknown [10.163.78.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 647323F5A1;
	Mon, 28 Apr 2025 23:54:41 -0700 (PDT)
Message-ID: <b780d1b8-d6f0-42f1-aa5c-c6e016bbd9ae@arm.com>
Date: Tue, 29 Apr 2025 12:24:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] mm: Refactor code in mprotect
To: Anshuman Khandual <anshuman.khandual@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com,
 ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-2-dev.jain@arm.com>
 <43dc2d0b-1ce9-4d56-a260-d1dfc4545c99@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <43dc2d0b-1ce9-4d56-a260-d1dfc4545c99@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/04/25 12:11 pm, Anshuman Khandual wrote:
> 
> 
> On 4/29/25 10:53, Dev Jain wrote:
>> Reduce indentation in change_pte_range() by refactoring some of the code
>> into a new function. No functional change.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mprotect.c | 116 +++++++++++++++++++++++++++++---------------------
>>   1 file changed, 68 insertions(+), 48 deletions(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 88608d0dc2c2..70f59aa8c2a8 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -83,6 +83,71 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   	return pte_dirty(pte);
>>   }
>>   
>> +
>> +
>> +static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
>> +		int target_node)
>> +{
>> +	bool toptier;
>> +	int nid;
>> +
>> +	/* Also skip shared copy-on-write pages */
>> +	if (is_cow_mapping(vma->vm_flags) &&
>> +	    (folio_maybe_dma_pinned(folio) ||
>> +	     folio_maybe_mapped_shared(folio)))
>> +		return true;
>> +
>> +	/*
>> +	 * While migration can move some dirty pages,
>> +	 * it cannot move them all from MIGRATE_ASYNC
>> +	 * context.
>> +	 */
>> +	if (folio_is_file_lru(folio) &&
>> +	    folio_test_dirty(folio))
>> +		return true;
>> +
>> +	/*
>> +	 * Don't mess with PTEs if page is already on the node
>> +	 * a single-threaded process is running on.
>> +	 */
>> +	nid = folio_nid(folio);
>> +	if (target_node == nid)
>> +		return true;
>> +	toptier = node_is_toptier(nid);
>> +
>> +	/*
>> +	 * Skip scanning top tier node if normal numa
>> +	 * balancing is disabled
>> +	 */
>> +	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
>> +	    toptier)
>> +		return true;
>> +	return false;
>> +}
>> +
>> +static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t oldpte, int target_node)
>> +{
>> +	struct folio *folio;
>> +	int ret;
>> +
>> +	/* Avoid TLB flush if possible */
>> +	if (pte_protnone(oldpte))
>> +		return true;
>> +
>> +	folio = vm_normal_folio(vma, addr, oldpte);
>> +	if (!folio || folio_is_zone_device(folio) ||
>> +	    folio_test_ksm(folio))
>> +		return true;
>> +	ret = prot_numa_skip(vma, folio, target_node);
> 
> What purpose does it solve to create additional helper prot_numa_skip().
> IOW - why cannot all of these be inside prot_numa_avoid_fault() itself.

That is in preparation for patch 2, so that I can skip a PTE batch.

> 
>> +	if (ret)
>> +		return ret;
>> +	if (folio_use_access_time(folio))
>> +		folio_xchg_access_time(folio,
>> +			jiffies_to_msecs(jiffies));
>> +	return false;
>> +}
>> +
>>   static long change_pte_range(struct mmu_gather *tlb,
>>   		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>>   		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
>> @@ -116,56 +181,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * Avoid trapping faults against the zero or KSM
>>   			 * pages. See similar comment in change_huge_pmd.
>>   			 */
>> -			if (prot_numa) {
>> -				struct folio *folio;
>> -				int nid;
>> -				bool toptier;
>> -
>> -				/* Avoid TLB flush if possible */
>> -				if (pte_protnone(oldpte))
>> -					continue;
>> -
>> -				folio = vm_normal_folio(vma, addr, oldpte);
>> -				if (!folio || folio_is_zone_device(folio) ||
>> -				    folio_test_ksm(folio))
>> -					continue;
>> -
>> -				/* Also skip shared copy-on-write pages */
>> -				if (is_cow_mapping(vma->vm_flags) &&
>> -				    (folio_maybe_dma_pinned(folio) ||
>> -				     folio_maybe_mapped_shared(folio)))
>> -					continue;
>> -
>> -				/*
>> -				 * While migration can move some dirty pages,
>> -				 * it cannot move them all from MIGRATE_ASYNC
>> -				 * context.
>> -				 */
>> -				if (folio_is_file_lru(folio) &&
>> -				    folio_test_dirty(folio))
>> +			if (prot_numa &&
>> +			    prot_numa_avoid_fault(vma, addr,
>> +						  oldpte, target_node))
>>   					continue;
>>   
>> -				/*
>> -				 * Don't mess with PTEs if page is already on the node
>> -				 * a single-threaded process is running on.
>> -				 */
>> -				nid = folio_nid(folio);
>> -				if (target_node == nid)
>> -					continue;
>> -				toptier = node_is_toptier(nid);
>> -
>> -				/*
>> -				 * Skip scanning top tier node if normal numa
>> -				 * balancing is disabled
>> -				 */
>> -				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
>> -				    toptier)
>> -					continue;
>> -				if (folio_use_access_time(folio))
>> -					folio_xchg_access_time(folio,
>> -						jiffies_to_msecs(jiffies));
>> -			}
>> -
>>   			oldpte = ptep_modify_prot_start(vma, addr, pte);
>>   			ptent = pte_modify(oldpte, newprot);
>>   

