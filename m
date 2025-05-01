Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6788A2222D1
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 11:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099217; cv=none; b=KxWijJ3cUpwQ/VP1Oz+D1mHMOdAe3EfY7LPbx1S8mS7fEAkOAjHFgAIgkIIlWwdyBv1RNikHGI+yzn2nhkVTQZh13DFLDtz/S07yuyA88uksOU05tHmRKrHMtVDp35+i8NFvF4rBbGW131gj8aL41Ewwniu9ZHd4Vwm1QRXqv7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099217; c=relaxed/simple;
	bh=e0gHge12y0hlX81sR3O7asdQjjkNR6zO0H3EY1feMAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zf2OZhvw7Nu6Xkq8saFGWR4MFxibyQEhOOeYwaQJMIvcJXhGza7/skxoAIV5T1rrfp9SevM3toAPOiYfOad/F1D3sr9yWjtK0w2lsGnXX5TPr/VRFaPxdE2nhcrInrYm070wTTV0lErD5A0dr/LaHYYZFWsNnvF3lQbCBtOK32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 306FA106F;
	Thu,  1 May 2025 04:33:27 -0700 (PDT)
Received: from [10.1.28.150] (XHFQ2J9959.cambridge.arm.com [10.1.28.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B35B53F5A1;
	Thu,  1 May 2025 04:33:31 -0700 (PDT)
Message-ID: <76cac3c0-2a52-4ff6-b7df-7a316983d197@arm.com>
Date: Thu, 1 May 2025 12:33:30 +0100
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
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-4-dev.jain@arm.com>
 <8780e63d-22c1-4133-a800-dec50fd1b5fa@lucifer.local>
 <f561dab6-c70e-485c-a3f7-2c5198fcf8c6@arm.com>
 <9a2129ce-55b6-47e7-a879-00e7982c8ec4@lucifer.local>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <9a2129ce-55b6-47e7-a879-00e7982c8ec4@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2025 15:34, Lorenzo Stoakes wrote:
> On Wed, Apr 30, 2025 at 03:09:50PM +0100, Ryan Roberts wrote:
>> On 29/04/2025 14:52, Lorenzo Stoakes wrote:
>>> On Tue, Apr 29, 2025 at 10:53:32AM +0530, Dev Jain wrote:
>>>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>>>> Architecture can override these helpers.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>  include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 38 insertions(+)
>>>>
>>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>>> index b50447ef1c92..ed287289335f 100644
>>>> --- a/include/linux/pgtable.h
>>>> +++ b/include/linux/pgtable.h
>>>> @@ -891,6 +891,44 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>>>>  }
>>>>  #endif
>>>>
>>>> +/* See the comment for ptep_modify_prot_start */
>>>
>>> I feel like you really should add a little more here, perhaps point out
>>> that it's batched etc.
>>>
>>>> +#ifndef modify_prot_start_ptes
>>>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>>>> +		unsigned long addr, pte_t *ptep, unsigned int nr)
>>>
>>> This name is a bit confusing,
>>
>> On naming, the existing (modern) convention for single-pte helpers is to start
>> the function name with ptep_. When we started adding batched versions, we took
>> the approach of adding _ptes as a suffix. For example:
>>
>> set_pte_at()
>> ptep_get_and_clear_full()
>> ptep_set_wrprotect()
>>
>> set_ptes()
>> get_and_clear_full_ptes()
>> wrprotect_ptes()
>>
>> In this case, we already have ptep_modify_prot_start() and
>> ptep_modify_prot_commit() for the existing single-pte helper versions. So
>> according to the convention (or at least how I interpret the convention), the
>> proposed names seem reasonable.
>>
> 
> Right, I'm fine with following convention (we should), I just find 'ptes'
> really ambiguous. It's not just a -set of PTE entries- it's very explicitly
> for a large folio. I'd interpret some 'ptes' case to mean 'any number of
> pte entries', though I suppose it'd not in practice be any different if
> that were the intended use.
> 
> However, the proposed use case is large folio 'sub' PTEs and it'd be useful
> in callers to know this is explicitly what you're doing.
> 
> I feel like '_batched_ptes' makes it clear it's a _specific_ set of PTE
> entriess you're after (not just in effect multiple PTE entries).

I don't mind _batched_ptes. _pte_batch would be shorter though - what do you think?

But if we go with one of these, then we should consistently apply it to all the
existing helpers IMHO - perhaps with a preparatory patch at the start of the series.

> 
> However, I'm less insistent on this with a comment that explains what's
> going on.

That would still get my vote :)

> 
> I don't want to hold this up with trivialities around naming...

There are TWO hard things in computer science; cache invalidation, naming, and
off-by-one errors :)

> 
> ASIDE: I continue to absolutely HATE the ambiguity between 'PxD/PTE' and
> 'PxD/PTE entries' and the fact we use both as a short-hand for each
> other. But that's not related to this series, just a pet peeve... :)

I assume you are referring to the ambiguity between the *table* and the *entry*
(which just goes to show how ambiguous it is I guess)... I also hate this and
still trip over it all the time...

> 
>>> it's not any ptes, it's those pte entries
>>> belonging to a large folio capped to the PTE table right that you are
>>> batching right?
>>
>> Yes, but again by convention, that is captured in the kerneldoc comment for the
>> functions. We are operating on a batch of *ptes* not on a folio or batch of
>> folios. But it is a requirement of the function that the batch of ptes all lie
>> within a single large folio (i.e. the pfns are sequential).
> 
> Ack, yeah don't love this nr stuff but fine if it's convention...
> 
>>  > Perhaps modify_prot_start_large_folio() ? Or something with 'batched' in
>>> the name?
>>>
>>> We definitely need to mention in comment or name or _somewhere_ the intent
>>> and motivation for this.
>>
>> Agreed!
> 
> ...and luckily we are aligned on this :)
> 
>>
>>>
>>>> +{
>>>> +	pte_t pte, tmp_pte;
>>>> +
>>>
>>> are we not validating what 'nr' is? Even with debug asserts? I'm not sure I
>>> love this interface, where you require the user to know the number of
>>> remaining PTE entries in a PTE table.
>>
>> For better or worse, that's the established convention. See part of comment for
>> set_ptes() for example:
>>
>> """
>>  * Context: The caller holds the page table lock.  The pages all belong
>>  * to the same folio.  The PTEs are all in the same PMD.
>> """
>>
>>>
>>>> +	pte = ptep_modify_prot_start(vma, addr, ptep);
>>>> +	while (--nr) {
>>>
>>> This loop is a bit horrible. It seems needlessly confusing and you're in
>>> _dire_ need of comments to explain what's going on.
>>>
>>> So my understanding is, you have the user figure out:
>>>
>>> nr = min(nr_pte_entries_in_pte, nr_pgs_in_folio)
>>>
>>> Then, you want to return the pte entry belonging to the start of the large
>>> folio batch, but you want to adjust that pte value to propagate dirty and
>>> young page table flags if any page table entries within the range contain
>>> those page table flags, having called ptep_modify_prot_start() on all of
>>> them?
>>>
>>> This is quite a bit to a. put in a header like this and b. not
>>> comment/explain.
>>
>> This style is copied from get_and_clear_full_ptes(), which has this comment,
>> which explains all this complexity. My vote would be to have a simple comment

Oops; I meant "similar" when my fingers somehow typed "simple"... This is not
simple :)

>> for this function:
>>
>> /**
>>  * get_and_clear_full_ptes - Clear present PTEs that map consecutive pages of
>>  *			     the same folio, collecting dirty/accessed bits.
>>  * @mm: Address space the pages are mapped into.
>>  * @addr: Address the first page is mapped at.
>>  * @ptep: Page table pointer for the first entry.
>>  * @nr: Number of entries to clear.
>>  * @full: Whether we are clearing a full mm.
>>  *
>>  * May be overridden by the architecture; otherwise, implemented as a simple
>>  * loop over ptep_get_and_clear_full(), merging dirty/accessed bits into the
>>  * returned PTE.
>>  *
>>  * Note that PTE bits in the PTE range besides the PFN can differ. For example,
>>  * some PTEs might be write-protected.
>>  *
>>  * Context: The caller holds the page table lock.  The PTEs map consecutive
>>  * pages that belong to the same folio.  The PTEs are all in the same PMD.
>>  */
>>
> 
> OK I think the key bit here is 'consecutive pages of the same folio'.
> 
> I'd like at least a paragraph about implementation, yes the original
> function doesn't have that (and should imo), something like:
> 
> 	We perform the operation on the first PTE, then if any others
> 	follow, we invoke the ptep_modify_prot_start() for each and
> 	aggregate A/D bits.
> 
> Something like this.
> 
> Point taken on consistency though!
> 
>>>
>>> So maybe something like:
>>>
>>> pte = ptep_modify_prot_start(vma, addr, ptep);
>>>
>>> /* Iterate through large folio tail PTEs. */
>>> for (pg = 1; pg < nr; pg++) {
>>> 	pte_t inner_pte;
>>>
>>> 	ptep++;
>>> 	addr += PAGE_SIZE;
>>>
>>> 	inner_pte = ptep_modify_prot_start(vma, addr, ptep);
>>>
>>> 	/* We must propagate A/D state from tail PTEs. */
>>> 	if (pte_dirty(inner_pte))
>>> 		pte = pte_mkdirty(pte);
>>> 	if (pte_young(inner_pte))
>>> 		pte = pte_mkyoung(pte);
>>> }
>>>
>>> Would work better?
>>>
>>>
>>>
>>>> +		ptep++;
>>>> +		addr += PAGE_SIZE;
>>>> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
>>>
>>>
>>>
>>>> +		if (pte_dirty(tmp_pte))
>>>> +			pte = pte_mkdirty(pte);
>>>> +		if (pte_young(tmp_pte))
>>>> +			pte = pte_mkyoung(pte);
>>>
>>> Why are you propagating these?
>>>
>>>> +	}
>>>> +	return pte;
>>>> +}
>>>> +#endif
>>>> +
>>>> +/* See the comment for ptep_modify_prot_commit */
>>>
>>> Same comments as above, needs more meat on the bones!
>>>
>>>> +#ifndef modify_prot_commit_ptes
>>>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
>>>
>>> Again need to reference large folio, batched or something relevant here,
>>> 'ptes' is super vague.
>>>
>>>> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
>>>
>>> Nit, but you put 'p' suffix on ptep but not on 'old_pte'?
>>>
>>> I'm even more concerned about the 'nr' API here now.
>>>
>>> So this is now a user-calculated:
>>>
>>> min3(large_folio_pages, number of pte entries left in ptep,
>>> 	number of pte entries left in old_pte)
>>>
>>> It really feels like something that should be calculated here, or at least
>>> be broken out more clearly.
>>>
>>> You definitely _at the very least_ need to document it in a comment.
>>>
>>>> +{
>>>> +	for (;;) {
>>>> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>>>> +		if (--nr == 0)
>>>> +			break;
>>>
>>> Why are you doing an infinite loop here with a break like this? Again feels
>>> needlessly confusing.
>>
>> I agree it's not pretty to look at. But apparently it's the most efficient. This
>> is Willy's commit that started it all: Commit bcc6cc832573 ("mm: add default
>> definition of set_ptes()").
>>
>> For the record, I think all your comments make good sense, Lorenzo. But there is
>> an established style, and personally I think at this point is it more confusing
>> to break from that style.
> 
> This isn't _quite_ style, I'd say it's implementation, we're kind of
> crossing over into something a little more I'd say :) but I mean I get your
> point, sure.
> 
> I mean, fine, if (I presume you're referring _only_ to the for (;;) case
> above) you are absolutely certain it is more performant in practice I
> wouldn't want to stand in the way of that.

No I'm not certain at all... I'm just saying that's been the argument in the
past. I vaguely recall I even tried changing the loop style in batched helpers I
implemented in the past and David asked me to stick with the established style.

> 
> I would at least like a comment in the commit message about propagating an
> odd loop for performance though to explain the 'qualities'... :)

Just to make it clear, I'm just trying to provide some historical context, I'm
not arguing that all those decisions were perfect. How about we take these
concrete steps:

  - Stick with the _ptes naming convention
  - Add kerneldoc comments for the 2 new functions that are very clear about
    what the function does and the requirements on the batch of ptes (just like
    the other batched helpers)
  - Rework the looping styles in the 2 new functions to be more "standard";
    let's not micro-optimize unless we have real evidence that it is useful.
  - Merge this patch with the one that uses these new functions

How does that sound as a way forwards?

Thanks,
Ryan

> 
>>
>> Thanks,
>> Ryan
>>
>>
>>>
>>> I think it's ok to duplicate this single line for the sake of clarity,
>>> also.
>>>
>>> Which gives us:
>>>
>>> unsigned long pg;
>>>
>>> ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>>> for (pg = 1; pg < nr; pg++) {
>>> 	ptep++;
>>> 	addr += PAGE_SIZE;
>>> 	old_pte = pte_next_pfn(old_pte);
>>> 	pte = pte_next_pfn(pte);
>>>
>>> 	ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>>> }
>>>
>>> There are alternative approaches, but I think doing an infinite loop that
>>> breaks and especially the confusing 'if (--foo) break;' stuff is much
>>> harder to parse than a super simple ranged loop.
>>>
>>>> +		ptep++;
>>>> +		addr += PAGE_SIZE;
>>>> +		old_pte = pte_next_pfn(old_pte);
>>>> +		pte = pte_next_pfn(pte);
>>>> +	}
>>>> +}
>>>> +#endif
>>>> +
>>>>  /*
>>>>   * On some architectures hardware does not set page access bit when accessing
>>>>   * memory page, it is responsibility of software setting this bit. It brings
>>>> --
>>>> 2.30.2
>>>>
>>

