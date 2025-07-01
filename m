Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD8D1EA6F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369471; cv=none; b=f8vCdPY58VgUOLxjf/9xzmePPb9QwrPENncqcsBFW7TmZo1XqsgTU3W87BOQILV1fA+Adhu4tm7v5CHHIm1vXAHDLOqrNJR5lV9bKFK38Nl/obCAeDnPLXea7MbpAilgxSLw1Gxg1zejWjF3lXcG/MDCrn0LbuJQtd8OKdu2N84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369471; c=relaxed/simple;
	bh=BVhhQhPEqtIrAl2qqWu3zTUoIcb1MEGon7Ds6OjsHMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvdZi2Li3uUW+9qvVU1Yv3cZ/WTkmATxspvqJdN8RYfEhpw5nnhOwEIjm8YCCHrr9agWeKbgXmVFBjINb+DG6Z2V8clCAtMgP7jfPBtHtmQwCAVe6M9S7GYrnb9OL+UJu+diBVY8wDUbYvA5WmUDdpDZrKV+WQtrUcuzLq70dg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A39E1595;
	Tue,  1 Jul 2025 04:30:52 -0700 (PDT)
Received: from [10.1.33.214] (XHFQ2J9959.cambridge.arm.com [10.1.33.214])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFE9A3F6A8;
	Tue,  1 Jul 2025 04:31:03 -0700 (PDT)
Message-ID: <aed58edc-88c3-47bf-8cc3-bb8d80c4e221@arm.com>
Date: Tue, 1 Jul 2025 12:31:02 +0100
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
 <3776ac82-4cd5-41e7-9b96-137a1ae6f473@arm.com>
 <64c2ec85-87ed-4793-b0e9-a68eac1a8020@lucifer.local>
 <a2165422-0d78-4549-bc34-a8bbcdb6513f@arm.com>
 <61f50191-8bd0-4f25-b3b7-86605af8c0c6@lucifer.local>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <61f50191-8bd0-4f25-b3b7-86605af8c0c6@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/07/2025 11:21, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 10:53:08AM +0100, Ryan Roberts wrote:
>> On 01/07/2025 09:51, Lorenzo Stoakes wrote:
>>> On Tue, Jul 01, 2025 at 09:30:51AM +0100, Ryan Roberts wrote:
>>>>>> In an ideal world we would flatten and just have mprotect_folio_pte_batch()
>>>>>> return the batch size considering all the relevant PTE bits AND the
>>>>>> AnonExclusive bit on the pages. IIRC one of Dev's earlier versions modified the
>>>>>> core folio_pte_batch() function to also look at the AnonExclusive bit, but I
>>>>>> really disliked changing that core function (I think others did too?).
>>>>>
>>>>> Yeah let's not change the core function.
>>>>>
>>>>> My suggestion is to have mprotect_folio_pte_batch() do this.
>>>>>
>>>>>>
>>>>>> So barring that approach, we are really only left with the batch and sub-batch
>>>>>> approach - although, yes, it could be abstracted more. We could maintain a
>>>>>> context struct that persists across all calls to mprotect_folio_pte_batch() and
>>>>>> it can use that to keep it's state to remember if we are in the middle of a
>>>>>> sub-batch and decide either to call folio_pte_batch() to get a new batch, or
>>>>>> call anon_exclusive_batch() to get the next sub-batch within the current batch.
>>>>>> But that started to feel overly abstracted to me.
>>>>>
>>>>> Having this nested batch/sub-batch loop really feels worse. You just get lost in
>>>>> the complexity here very easily.
>>>>>
>>>>> But i"m also not sure we need to maintain _that_ much state?
>>>>>
>>>>> We're already looping over all of the PTEs here, so abstracting _the entire
>>>>> loop_ and all the sub-batch stuff to another function, that is
>>>>> mprotect_folio_pte_batch() I think sensibly, so it handles this for you makes a
>>>>> ton of sense.
>>>>
>>>> So effectively turn mprotect_folio_pte_batch() into an iterator; have a struct
>>>> and a funtion to init the struct for the the number of ptes we want to iterate
>>>> over, then a per iteration function that progressively returns batches?
>>>
>>> Is that really necessary though?
>>>
>>> Idea is that mprotect_folio_pte_batch() returns the nr_ptes _taking into account
>>> the PAE stuff_.
>>
>> The issue is the efficiency. Assuming we want to keep the PTE scan contained
>> within the core folio_pte_batch() function and we _don't_ want to add PAE
>> awareness to that function, then we have 2 separate, independent loops; one for
>> PTE scanning and the other for PAE scanning. If the first loop scans through ans
>> returns 512, but then the PAE scan returns 1, we return 1. If we don't remember
>> for the next time that we already determined we have a PTE batch of 512 (now
>> 511) then we will rescan the 511 PTEs and potentially return 1 again due to PAE.
>> Then 510, then 509...
> 
> Hm really?
> 
> The idea is mprotect_folio_pte_batch() would look ahead and determine the
> PAE/non-PAE sub-batch and return this nr_pages. It'd check 'this page is PAE, so
> when's the next page that is not/hit max_nr_pages?'
> 
> So that'd be 1 in the first case.
> 
> Then you loop around and go again, and this time it'd check 'this page is !PAE,
> so when's the next page that is/hit max_nr_pages?' and then it'd return 511.
> 
> A better example I think is e.g. if we had, for the sake argument, it return 16,
> 16, 480.
> 
> Then we scan ahead 16, set nr_ptes = 16, process 16 PTEs. Then the same again,
> then the same again only for 480 PTEs.
> 
> Each time we set nr_ptes = the sub-batch size.
> 
> So I don't think we'll see O(n^2) here?
> 
> It would be like:
> 
> 	do {
> 		/* now returns sub-batch count */
> 		nr_ptes = mprotect_folio_pte_batch(folio, addr, pte, oldpte,
> 				   max_nr_ptes, FPB_IGNORE_SOFT_DIRTY);
> 
> 		... rest of logic remains roughly the same ...
> 	} while (...);
> 
> I may be being naive here in some way?

I believe so, yes. But usually it's me that ends up being wrong. Let me try to
explain my point and we shall see...

There are 2 separate requirements that need to be met for a batch to be assembled:

  - All PTEs have to map consecutive pages from the same folio, all with the
    same pgprots (except a/d/sd).
  - If anon, all of the mapped pages must have the same PAE value.

The first requirement is managed by scanning forward through PTEs until it hits
the first PTE that is non-conformant (or hits max_nr). Currently implemented by
folio_pte_batch().

The second requirement is managed by scanning through the struct pages, checking
PAE (or hits max_nr).

The final batch is determined according to the smaller of the 2 batches
determined using both these checks.

So, assuming we don't want to fold both of those into the same loop (which would
enable checking the PTE and PAE in lock-step, mprotect_folio_pte_batch() needs
to call both folio_pte_batch() and loop over the pages looking at PAE in order
to decide where the batch boundary is.

If we want it to be stateless, then if it scans the PTEs first and that batch is
larger than the batch determined for the subsequent PAE scan, we return the
smaller and next time it is called it will rescan those excess PTEs. The same
logic applies in reverse if you scan PAE first.

If we make it stateless, it can remember "I've already scanned PTEs and the PTE
batch ends at X. So now I just need to iterate through that to create
sub-batches taking PAE into account".


> 
>>
>> That feels inefficient to me. So I'd much rather just remember that we have a
>> batch of 512, then split into sub batches as needed for PAE compliance. Then we
>> only scan each PTE once and each struct page once.
>>
>> But to achieve this, we either need to merge the 2 loops or we need to carry
>> state across function calls (i.e. like an iterator).
>>
>>>
>>> Would this break anything?
>>
>> It's not about breaking anything, it's about scanning efficiently. Perhaps you
>> don't think it's worth worrying about in practice?
> 
> The question re: breaking was - if we re-do things like getting oldpte, ptent,
> etc. on each sub-batch does _that_ break anything?
> 
> 
> The current implementation is not acceptable on the basis of adding a horrible
> level of complexity. That function is already terrible, and adding an inner loop
> for this batch special casing with _sub batches_ to account for PAE- nobody is
> going to understand what's going on.
> 
> 	do {
> 		if (...) {
> 			while (...) {
> 				help!!!
> 
> 
> We can do better, and I'm going to go further and say - this series _has_ to do
> better, because I can't accept that, however we do it.
> 
> I want the efficiency gainz as much as you guys but I"m convinced we can do it
> without causing eye bleeding confusion...

That's completely reasonable - we will get there! I'm very happy for this to be
refactored into help function(s) to make it more accessible.

I'm just saying that fundamentally, we either need to flatten this to a single
loop so that the PTE and PAE can be assessed in lock-step and we never
over-scan. Or we need to keep some state to remember when we have already
scanned for a PTE batch and are currently working our way through that chunking
it into sub-batches based on PAE. I don't think we should entertain a stateless
two-loop solution.

> 
>>
>>>
>>> We might need to pass a flag to say 'don't account for this' for prot numa case.
>>
>> Yep, another bool ;-)
> 
> Yeah... but we can't sensibly add a flag for this so the flag idea doesn't fly
> for that either... :>)
> 
> I mean I don't think we actually need that flag, let it skip the sub-batch size
> then check again. Now that, I reckon, is a small overhead.

Yeah, agreed. That's probably fine in practice.

> 
>>
>>>
>>>>
>>>> Then we just have a simple loop here that gets the next batch and processes it?
>>
> 
> Another advantage of doing things this way is we can actually add a comment
> explaining the sub-batch size.
> 
> Right now there's just absolutely _nothing_ and it's entirely unclear what on
> earth is going on.

