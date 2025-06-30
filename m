Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9A725F96D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283582; cv=none; b=EjEjXjuA5CFpT6f6alfZonHi+F/NJib36TTZKgmKh23M5nzQ3iHU+vKkUu6RC0dGLG97nntivuFb6pP4/GjKNKmRh8+GRKQfv3ujnqSV5kGwjkzjo9hGwFq6jVNDFD9ct7IFY2akHzJUecI8PavBYkZPsscT4idjLJG0AkvdOwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283582; c=relaxed/simple;
	bh=BHNO9ru84E4JC8FbSXbxOb6BVz2+i/147hwy/XHp99g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8HeZhrQR/SrQ1SsomzRhvafWnWGG5rfaxwvDJdTj5zmzKOE9IUrWng2689gzvoMlmutUppySUX5AafryvMZixJb1pqqKfEycv5FRhZfyH4ClDEpCO+cxoK+EParhHTEYz1jUx/P9JDyNo6X7gzvD+xm9Z17AJSjjH69qlYA0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C4CD150C;
	Mon, 30 Jun 2025 04:39:23 -0700 (PDT)
Received: from [10.1.34.165] (XHFQ2J9959.cambridge.arm.com [10.1.34.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F4A63F6A8;
	Mon, 30 Jun 2025 04:39:35 -0700 (PDT)
Message-ID: <3df4db71-752f-4c59-841b-84025914870d@arm.com>
Date: Mon, 30 Jun 2025 12:39:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] mm: Optimize mprotect() for MM_CP_PROT_NUMA by
 batch-skipping PTEs
Content-Language: en-GB
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-2-dev.jain@arm.com>
 <79a48c48-53b1-4002-a8b2-447e69d96e49@lucifer.local>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <79a48c48-53b1-4002-a8b2-447e69d96e49@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/06/2025 12:25, Lorenzo Stoakes wrote:
> On Sat, Jun 28, 2025 at 05:04:32PM +0530, Dev Jain wrote:
>> In case of prot_numa, there are various cases in which we can skip to the
>> next iteration. Since the skip condition is based on the folio and not
>> the PTEs, we can skip a PTE batch. Additionally refactor all of this
>> into a new function to clean up the existing code.
> 
> Hmm, is this a completely new concept for this series?
> 
> Please try not to introduce brand new things to a series midway through.
> 
> This seems to be adding a whole ton of questionable logic for an edge case.
> 
> Can we maybe just drop this for this series please?

From my perspective, at least, there are no new logical changes in here vs the
previous version. And I don't think the patches have been re-organised either.
David (I think?) was asking for the name of the patch to be changed to include
MM_CP_PROT_NUMA and also for the code to be moved out of line to it's own
function. That's all that Dev has done AFAICT (although as per my review
comments, the refactoring has introduced a bug).

My preference is that we should ultimately support this batching. It could be a
separate series if you insist, but it's all contbuting to the same goal
ultimately; making mprotect support PTE batching.

Just my 2c.

Thanks,
Ryan

> 
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>  mm/mprotect.c | 134 ++++++++++++++++++++++++++++++++------------------
>>  1 file changed, 87 insertions(+), 47 deletions(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 88709c01177b..af10a7fbe6b8 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -83,6 +83,83 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>  	return pte_dirty(pte);
>>  }
>>
>> +static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
>> +		pte_t *ptep, pte_t pte, int max_nr_ptes)
>> +{
>> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +
>> +	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>> +		return 1;
>> +
>> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>> +			       NULL, NULL, NULL);
>> +}
> 
> I find it really odd that you're introducing this in a seemingly unrelated change.
> 
> Also won't this conflict with David's changes?
> 
> I know you like to rush out a dozen series at once, but once again I'm asking
> maybe please hold off?
> 
> I seem to remember David asked you for the same thing because of this, but maybe
> I'm misremembering.
> 
> We have only so much review resource and adding in brand new concepts mid-way
> and doing things that blatantly conflict with other series really doesn't help.
> 
>> +
>> +static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t oldpte, pte_t *pte, int target_node,
>> +		int max_nr_ptes)
>> +{
>> +	struct folio *folio = NULL;
>> +	int nr_ptes = 1;
>> +	bool toptier;
>> +	int nid;
>> +
>> +	/* Avoid TLB flush if possible */
>> +	if (pte_protnone(oldpte))
>> +		goto skip_batch;
>> +
>> +	folio = vm_normal_folio(vma, addr, oldpte);
>> +	if (!folio)
>> +		goto skip_batch;
>> +
>> +	if (folio_is_zone_device(folio) || folio_test_ksm(folio))
>> +		goto skip_batch;
>> +
>> +	/* Also skip shared copy-on-write pages */
>> +	if (is_cow_mapping(vma->vm_flags) &&
>> +	    (folio_maybe_dma_pinned(folio) || folio_maybe_mapped_shared(folio)))
>> +		goto skip_batch;
>> +
>> +	/*
>> +	 * While migration can move some dirty pages,
>> +	 * it cannot move them all from MIGRATE_ASYNC
>> +	 * context.
>> +	 */
>> +	if (folio_is_file_lru(folio) && folio_test_dirty(folio))
>> +		goto skip_batch;
>> +
>> +	/*
>> +	 * Don't mess with PTEs if page is already on the node
>> +	 * a single-threaded process is running on.
>> +	 */
>> +	nid = folio_nid(folio);
>> +	if (target_node == nid)
>> +		goto skip_batch;
>> +
>> +	toptier = node_is_toptier(nid);
>> +
>> +	/*
>> +	 * Skip scanning top tier node if normal numa
>> +	 * balancing is disabled
>> +	 */
>> +	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) && toptier)
>> +		goto skip_batch;
>> +
>> +	if (folio_use_access_time(folio)) {
>> +		folio_xchg_access_time(folio, jiffies_to_msecs(jiffies));
>> +
>> +		/* Do not skip in this case */
>> +		nr_ptes = 0;
>> +		goto out;
>> +	}
>> +
>> +skip_batch:
>> +	nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte, max_nr_ptes);
>> +out:
>> +	*foliop = folio;
>> +	return nr_ptes;
>> +}
> 
> Yeah yuck. I don't like that we're doing all this for this edge case.
> 
>> +
>>  static long change_pte_range(struct mmu_gather *tlb,
>>  		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>>  		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
>> @@ -94,6 +171,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>  	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>  	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>  	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>> +	int nr_ptes;
>>
>>  	tlb_change_page_size(tlb, PAGE_SIZE);
>>  	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>> @@ -108,8 +186,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>  	flush_tlb_batched_pending(vma->vm_mm);
>>  	arch_enter_lazy_mmu_mode();
>>  	do {
>> +		nr_ptes = 1;
>>  		oldpte = ptep_get(pte);
>>  		if (pte_present(oldpte)) {
>> +			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>> +			struct folio *folio = NULL;
>>  			pte_t ptent;
>>
>>  			/*
>> @@ -117,53 +198,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>>  			 * pages. See similar comment in change_huge_pmd.
>>  			 */
>>  			if (prot_numa) {
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
>> -					continue;
>> -
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
>> +				nr_ptes = prot_numa_skip_ptes(&folio, vma,
>> +							      addr, oldpte, pte,
>> +							      target_node,
>> +							      max_nr_ptes);
>> +				if (nr_ptes)
> 
> I'm not really a fan of this being added (unless I'm missing something here) but
> _generally_ it's better to separate out a move and a change if you can.
> 
>>  					continue;
>> -				if (folio_use_access_time(folio))
>> -					folio_xchg_access_time(folio,
>> -						jiffies_to_msecs(jiffies));
>>  			}
>>
>>  			oldpte = ptep_modify_prot_start(vma, addr, pte);
>> @@ -280,7 +320,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>  				pages++;
>>  			}
>>  		}
>> -	} while (pte++, addr += PAGE_SIZE, addr != end);
>> +	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
>>  	arch_leave_lazy_mmu_mode();
>>  	pte_unmap_unlock(pte - 1, ptl);
>>
>> --
>> 2.30.2
>>
> 
> Anyway will hold off on reviewing the actual changes here until we can figure
> out whether this is event appropriate here.

