Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44251FDD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358661; cv=none; b=q5mFwr+HpXpQI75VEjTJbTLFjL4SWJxg9wZ09TyMTckXkLqemOmxvqJ4acBI7bIa36tTxIs6Q388w4+LGB6iwRZsNtIk02YkvI7WBoTHLdXfJKwgQXSK36vqcqTlDFtf7NwDWothlbIhcUN3/E916Lc24LQpZs4n6ntActe4NkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358661; c=relaxed/simple;
	bh=BDUQlWmZIDNUFkjpMGf0JQSl/ZqDNpstCpGILV7Wmec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXsent4+i+8r3zqyly1oMAKdy53xsMk8tl+FJKSwE+9UYTcA+nccVMwEwJ41jmW2P1oKdEBtmKgfA0h7AohoONuRae97+UZESyJVJUHiy7EYr3CUjmQAisjXML+AVbZzfZoQrZgBEyDvSH2LlYfUyD1dYvjYI1IiGlJ5YcdFd7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D7A51595;
	Tue,  1 Jul 2025 01:30:43 -0700 (PDT)
Received: from [10.57.84.129] (unknown [10.57.84.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF9E63F58B;
	Tue,  1 Jul 2025 01:30:53 -0700 (PDT)
Message-ID: <3776ac82-4cd5-41e7-9b96-137a1ae6f473@arm.com>
Date: Tue, 1 Jul 2025 09:30:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
Content-Language: en-GB
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-4-dev.jain@arm.com>
 <0315c016-d707-42b9-8038-7a2d5e4387f6@lucifer.local>
 <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
 <5900e978-6349-4a3d-a384-758889b678a0@lucifer.local>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <5900e978-6349-4a3d-a384-758889b678a0@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/07/2025 09:15, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 09:03:27AM +0100, Ryan Roberts wrote:
>>>
>>> ////// end of Lorenzo's suggestion //////
>>>
>>> You can obviously modify this to change other stuff like whether you feed back
>>> the PAE or not in private case for use in your code.
>>
>> This sugestion for this part of the problem looks much cleaner!
> 
> Thanks :)
> 
>>
>> Sorry; this whole struct tristate thing was my idea. I never really liked it but
>> I was more focussed on trying to illustrate the big picture flow that I thought
>> would work well with a batch and sub-batches (which it seems below that you
>> hate... but let's talk about that down there).
> 
> Yeah, this is fiddly stuff so I get it as a sort of psuedocode, but as code
> obviously I've made my feelings known haha.
> 
> It seems that we can apply the fundamental underlying idea without needing to do
> it this way at any rate so we should be good.
> 
>>>>
>>>>  static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
>>>> -		pte_t *ptep, pte_t pte, int max_nr_ptes)
>>>> +		pte_t *ptep, pte_t pte, int max_nr_ptes, fpb_t switch_off_flags)
>>>
>>> This last parameter is pretty horrible. It's a negative mask so now you're
>>> passing 'ignore soft dirty' to the function meaning 'don't ignore it'. This is
>>> just planting land mines.
>>>
>>> Obviously David's flag changes will also alter all this.
>>>
>>> Just add a boolean re: soft dirty.
>>
>> Dev had a boolean for this in the last round. I've seen various functions expand
>> over time with increasing numbers of bool flags. So I asked to convert to a
>> flags parameter and just pass in the flags we need. Then it's a bit more future
>> proof and self documenting. (For the record I dislike the "switch_off_flags"
>> approach taken here).
> 
> Yeah, but we can change this when it needs to be changed. When it comes to
> internal non-uAPI stuff I don't think we need to be too worried about
> future-proofing like this at least just yet.
> 
> Do not fear the future churn... ;)
> 
> I mean I guess David's new flags will make this less egregious anyway.
> 
>>>>  			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>>>  			ptent = pte_modify(oldpte, newprot);
>>>>
>>>> @@ -227,15 +294,39 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>  			 * example, if a PTE is already dirty and no other
>>>>  			 * COW or special handling is required.
>>>>  			 */
>>>> -			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>>> -			    !pte_write(ptent) &&
>>>> -			    can_change_pte_writable(vma, addr, ptent))
>>>> -				ptent = pte_mkwrite(ptent, vma);
>>>> -
>>>> -			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>>>> -			if (pte_needs_flush(oldpte, ptent))
>>>> -				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>>> -			pages++;
>>>> +			set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>>> +				    !pte_write(ptent);
>>>> +			if (set_write)
>>>> +				set_write = maybe_change_pte_writable(vma, addr, ptent, folio);
>>>> +
>>>> +			while (nr_ptes) {
>>>> +				if (set_write == TRI_MAYBE) {
>>>> +					sub_nr_ptes = anon_exclusive_batch(folio,
>>>> +						pgidx, nr_ptes, &sub_set_write);
>>>> +				} else {
>>>> +					sub_nr_ptes = nr_ptes;
>>>> +					sub_set_write = (set_write == TRI_TRUE);
>>>> +				}
>>>> +
>>>> +				if (sub_set_write)
>>>> +					newpte = pte_mkwrite(ptent, vma);
>>>> +				else
>>>> +					newpte = ptent;
>>>> +
>>>> +				modify_prot_commit_ptes(vma, addr, pte, oldpte,
>>>> +							newpte, sub_nr_ptes);
>>>> +				if (pte_needs_flush(oldpte, newpte))
>>>> +					tlb_flush_pte_range(tlb, addr,
>>>> +						sub_nr_ptes * PAGE_SIZE);
>>>> +
>>>> +				addr += sub_nr_ptes * PAGE_SIZE;
>>>> +				pte += sub_nr_ptes;
>>>> +				oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
>>>> +				ptent = pte_advance_pfn(ptent, sub_nr_ptes);
>>>> +				nr_ptes -= sub_nr_ptes;
>>>> +				pages += sub_nr_ptes;
>>>> +				pgidx += sub_nr_ptes;
>>>> +			}
>>>
>>> I hate hate hate having this loop here, let's abstract this please.
>>>
>>> I mean I think we can just use mprotect_folio_pte_batch() no? It's not
>>> abstracting much here, and we can just do all this handling there. Maybe have to
>>> pass in a bunch more params, but it saves us having to do all this.
>>
>> In an ideal world we would flatten and just have mprotect_folio_pte_batch()
>> return the batch size considering all the relevant PTE bits AND the
>> AnonExclusive bit on the pages. IIRC one of Dev's earlier versions modified the
>> core folio_pte_batch() function to also look at the AnonExclusive bit, but I
>> really disliked changing that core function (I think others did too?).
> 
> Yeah let's not change the core function.
> 
> My suggestion is to have mprotect_folio_pte_batch() do this.
> 
>>
>> So barring that approach, we are really only left with the batch and sub-batch
>> approach - although, yes, it could be abstracted more. We could maintain a
>> context struct that persists across all calls to mprotect_folio_pte_batch() and
>> it can use that to keep it's state to remember if we are in the middle of a
>> sub-batch and decide either to call folio_pte_batch() to get a new batch, or
>> call anon_exclusive_batch() to get the next sub-batch within the current batch.
>> But that started to feel overly abstracted to me.
> 
> Having this nested batch/sub-batch loop really feels worse. You just get lost in
> the complexity here very easily.
> 
> But i"m also not sure we need to maintain _that_ much state?
> 
> We're already looping over all of the PTEs here, so abstracting _the entire
> loop_ and all the sub-batch stuff to another function, that is
> mprotect_folio_pte_batch() I think sensibly, so it handles this for you makes a
> ton of sense.

So effectively turn mprotect_folio_pte_batch() into an iterator; have a struct
and a funtion to init the struct for the the number of ptes we want to iterate
over, then a per iteration function that progressively returns batches?

Then we just have a simple loop here that gets the next batch and processes it?

> 
>>
>> This loop approach, as written, felt more straightforward for the reader to
>> understand (i.e. the least-worst option). Is the context approach what you are
>> suggesting or do you have something else in mind?
>>
> 
> See above.
> 
>>>
>>> Alternatively, we could add a new wrapper function, but yeah definitely not
>>> this.
>>>
>>> Also the C programming language asks... etc etc. ;)
>>>
>>> Overall since you always end up processing folio_nr_pages(folio) you can just
>>> have the batch function or a wrapper return this and do updates as necessary
>>> here on that basis, and leave the 'sub' batching to that function.
>>
>> Sorry I don't understand this statement - could you clarify? Especially the bit
>> about "always ... processing folio_nr_pages(folio)"; I don't think we do. In
>> various corner cases the size of the folio has no relationship to the way the
>> PTEs are mapped.
> 
> Right yeah I put this badly. Obviously you can have all sorts of fun with large
> folios partially mapped and page-table split and etc. etc.
> 
> I should have said 'always process nr_ptes'.
> 
> The idea is to abstract this sub-batch stuff to another function, fundamentally.

