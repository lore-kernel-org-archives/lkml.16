Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BAE21C9E7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022199; cv=none; b=A9nl2ZYDLvLmHxo6vOPEY9flYeCTgej1sJfNfTI8TCWB6V9wolwVLIimwwGz7txWKZLIG16BWaaIWDdd+Jo90E0vPo7gBRsahmYKueS6rxdFrIwyilVKISoCq3Y/djAHHFS6HLbL8XUgr3E4p4Rug8T/GSXk/cNqp2YBQ1sxwP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022199; c=relaxed/simple;
	bh=ZuvV7tTampfEnAP/FxHCJ93Zc93eKsf/ar8zJvDCDkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRqg6eat/2eX0QCU2J2dHOv4kr2watvCIbkpKxnOVIT/44nLhJBd0J2F/CSkWningUhRAJ/JxvAOyhBfN8sUpU4AfDMD6qJU3ckAkhYufiw8X5qcgGfz+TRwyqIdDcnGY+idR8mxo+KuvyP2ZqftKba0a58Cmxnt5lvhybSmFFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8495A106F;
	Wed, 30 Apr 2025 07:09:49 -0700 (PDT)
Received: from [10.57.84.121] (unknown [10.57.84.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47A3B3F673;
	Wed, 30 Apr 2025 07:09:52 -0700 (PDT)
Message-ID: <f561dab6-c70e-485c-a3f7-2c5198fcf8c6@arm.com>
Date: Wed, 30 Apr 2025 15:09:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
Content-Language: en-GB
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com,
 ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-4-dev.jain@arm.com>
 <8780e63d-22c1-4133-a800-dec50fd1b5fa@lucifer.local>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <8780e63d-22c1-4133-a800-dec50fd1b5fa@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2025 14:52, Lorenzo Stoakes wrote:
> On Tue, Apr 29, 2025 at 10:53:32AM +0530, Dev Jain wrote:
>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>> Architecture can override these helpers.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>  include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..ed287289335f 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -891,6 +891,44 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>>  }
>>  #endif
>>
>> +/* See the comment for ptep_modify_prot_start */
> 
> I feel like you really should add a little more here, perhaps point out
> that it's batched etc.
> 
>> +#ifndef modify_prot_start_ptes
>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t *ptep, unsigned int nr)
> 
> This name is a bit confusing, 

On naming, the existing (modern) convention for single-pte helpers is to start
the function name with ptep_. When we started adding batched versions, we took
the approach of adding _ptes as a suffix. For example:

set_pte_at()
ptep_get_and_clear_full()
ptep_set_wrprotect()

set_ptes()
get_and_clear_full_ptes()
wrprotect_ptes()

In this case, we already have ptep_modify_prot_start() and
ptep_modify_prot_commit() for the existing single-pte helper versions. So
according to the convention (or at least how I interpret the convention), the
proposed names seem reasonable.

> it's not any ptes, it's those pte entries
> belonging to a large folio capped to the PTE table right that you are
> batching right?

Yes, but again by convention, that is captured in the kerneldoc comment for the
functions. We are operating on a batch of *ptes* not on a folio or batch of
folios. But it is a requirement of the function that the batch of ptes all lie
within a single large folio (i.e. the pfns are sequential).
 > Perhaps modify_prot_start_large_folio() ? Or something with 'batched' in
> the name?
> 
> We definitely need to mention in comment or name or _somewhere_ the intent
> and motivation for this.

Agreed!

> 
>> +{
>> +	pte_t pte, tmp_pte;
>> +
> 
> are we not validating what 'nr' is? Even with debug asserts? I'm not sure I
> love this interface, where you require the user to know the number of
> remaining PTE entries in a PTE table.

For better or worse, that's the established convention. See part of comment for
set_ptes() for example:

"""
 * Context: The caller holds the page table lock.  The pages all belong
 * to the same folio.  The PTEs are all in the same PMD.
"""

> 
>> +	pte = ptep_modify_prot_start(vma, addr, ptep);
>> +	while (--nr) {
> 
> This loop is a bit horrible. It seems needlessly confusing and you're in
> _dire_ need of comments to explain what's going on.
> 
> So my understanding is, you have the user figure out:
> 
> nr = min(nr_pte_entries_in_pte, nr_pgs_in_folio)
> 
> Then, you want to return the pte entry belonging to the start of the large
> folio batch, but you want to adjust that pte value to propagate dirty and
> young page table flags if any page table entries within the range contain
> those page table flags, having called ptep_modify_prot_start() on all of
> them?
> 
> This is quite a bit to a. put in a header like this and b. not
> comment/explain.

This style is copied from get_and_clear_full_ptes(), which has this comment,
which explains all this complexity. My vote would be to have a simple comment
for this function:

/**
 * get_and_clear_full_ptes - Clear present PTEs that map consecutive pages of
 *			     the same folio, collecting dirty/accessed bits.
 * @mm: Address space the pages are mapped into.
 * @addr: Address the first page is mapped at.
 * @ptep: Page table pointer for the first entry.
 * @nr: Number of entries to clear.
 * @full: Whether we are clearing a full mm.
 *
 * May be overridden by the architecture; otherwise, implemented as a simple
 * loop over ptep_get_and_clear_full(), merging dirty/accessed bits into the
 * returned PTE.
 *
 * Note that PTE bits in the PTE range besides the PFN can differ. For example,
 * some PTEs might be write-protected.
 *
 * Context: The caller holds the page table lock.  The PTEs map consecutive
 * pages that belong to the same folio.  The PTEs are all in the same PMD.
 */

> 
> So maybe something like:
> 
> pte = ptep_modify_prot_start(vma, addr, ptep);
> 
> /* Iterate through large folio tail PTEs. */
> for (pg = 1; pg < nr; pg++) {
> 	pte_t inner_pte;
> 
> 	ptep++;
> 	addr += PAGE_SIZE;
> 
> 	inner_pte = ptep_modify_prot_start(vma, addr, ptep);
> 
> 	/* We must propagate A/D state from tail PTEs. */
> 	if (pte_dirty(inner_pte))
> 		pte = pte_mkdirty(pte);
> 	if (pte_young(inner_pte))
> 		pte = pte_mkyoung(pte);
> }
> 
> Would work better?
> 
> 
> 
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> 
> 
> 
>> +		if (pte_dirty(tmp_pte))
>> +			pte = pte_mkdirty(pte);
>> +		if (pte_young(tmp_pte))
>> +			pte = pte_mkyoung(pte);
> 
> Why are you propagating these?
> 
>> +	}
>> +	return pte;
>> +}
>> +#endif
>> +
>> +/* See the comment for ptep_modify_prot_commit */
> 
> Same comments as above, needs more meat on the bones!
> 
>> +#ifndef modify_prot_commit_ptes
>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> 
> Again need to reference large folio, batched or something relevant here,
> 'ptes' is super vague.
> 
>> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> 
> Nit, but you put 'p' suffix on ptep but not on 'old_pte'?
> 
> I'm even more concerned about the 'nr' API here now.
> 
> So this is now a user-calculated:
> 
> min3(large_folio_pages, number of pte entries left in ptep,
> 	number of pte entries left in old_pte)
> 
> It really feels like something that should be calculated here, or at least
> be broken out more clearly.
> 
> You definitely _at the very least_ need to document it in a comment.
> 
>> +{
>> +	for (;;) {
>> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>> +		if (--nr == 0)
>> +			break;
> 
> Why are you doing an infinite loop here with a break like this? Again feels
> needlessly confusing.

I agree it's not pretty to look at. But apparently it's the most efficient. This
is Willy's commit that started it all: Commit bcc6cc832573 ("mm: add default
definition of set_ptes()").

For the record, I think all your comments make good sense, Lorenzo. But there is
an established style, and personally I think at this point is it more confusing
to break from that style.

Thanks,
Ryan


> 
> I think it's ok to duplicate this single line for the sake of clarity,
> also.
> 
> Which gives us:
> 
> unsigned long pg;
> 
> ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> for (pg = 1; pg < nr; pg++) {
> 	ptep++;
> 	addr += PAGE_SIZE;
> 	old_pte = pte_next_pfn(old_pte);
> 	pte = pte_next_pfn(pte);
> 
> 	ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> }
> 
> There are alternative approaches, but I think doing an infinite loop that
> breaks and especially the confusing 'if (--foo) break;' stuff is much
> harder to parse than a super simple ranged loop.
> 
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		old_pte = pte_next_pfn(old_pte);
>> +		pte = pte_next_pfn(pte);
>> +	}
>> +}
>> +#endif
>> +
>>  /*
>>   * On some architectures hardware does not set page access bit when accessing
>>   * memory page, it is responsibility of software setting this bit. It brings
>> --
>> 2.30.2
>>

