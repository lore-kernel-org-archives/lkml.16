Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C722525A2D2
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281039; cv=none; b=tQj5OfvhXxzf7XIelhLmm53IOXe+CcPJm3HCGV/I3oTQCoEwrVOCB6QKKi+s4mcBCBZBOCvDAJYtelyOap/BdooeVPa39xq9IwScTvXz23/tFxVoxyxGcIG7k1n2O44sdaXeJJ8+lXEPJSEEpzuGVnOb8DZ3/wHAljb2MkPSf00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281039; c=relaxed/simple;
	bh=Y3ct+Bm80V6qjU5crvSqSe6leEQFQvXClN1d0cyIRTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XACjIf1JAU7TWHmjYVs7NDqbssf5xX7fEiOAjhaFZShPePLwLDRLbiYL6mI/hG8HOLzpKJCdU5AbMUIhRkQbN0dRu3YJSn+uKI8oTrk8PuDp4+DFc9zSxuSsZRKfQP4ZzsdIkeJMIAouwSvAJcQK40atSWthFjD0xq31QCMgbjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B2AB1D34;
	Mon, 30 Jun 2025 03:57:01 -0700 (PDT)
Received: from [10.1.34.165] (XHFQ2J9959.cambridge.arm.com [10.1.34.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D7723F6A8;
	Mon, 30 Jun 2025 03:57:13 -0700 (PDT)
Message-ID: <2ca5cbb3-9795-49ef-ae53-11c3143edee1@arm.com>
Date: Mon, 30 Jun 2025 11:57:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, Dev Jain <dev.jain@arm.com>,
 linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
 <5c3428c6-25be-4a94-811a-6bb6718f6c58@arm.com>
 <cc846c55-0505-4ad6-9664-ac799d9c0226@redhat.com>
 <5375208d-2c11-4579-a303-e8416ab07159@arm.com>
 <aa9c4bd5-f36e-4820-9ca2-1154b44b8908@arm.com>
 <f0ccb18b-4297-4741-9dd9-d020b171c28d@redhat.com>
 <79525362-2377-441b-8575-d2307bd77f26@arm.com>
 <8993dbc9-6c9a-4ac7-8c04-813851eba938@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <8993dbc9-6c9a-4ac7-8c04-813851eba938@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/06/2025 10:24, David Hildenbrand wrote:
> On 30.06.25 11:18, Ryan Roberts wrote:
>> On 30/06/2025 10:08, David Hildenbrand wrote:
>>> On 30.06.25 11:04, Ryan Roberts wrote:
>>>> On 30/06/2025 04:34, Dev Jain wrote:
>>>>>
>>>>> On 29/06/25 2:30 am, David Hildenbrand wrote:
>>>>>> On 28.06.25 05:37, Dev Jain wrote:
>>>>>>>
>>>>>>> On 27/06/25 5:25 pm, David Hildenbrand wrote:
>>>>>>>> Honoring these PTE bits is the exception, so let's invert the meaning.
>>>>>>>>
>>>>>>>> With this change, most callers don't have to pass any flags.
>>>>>>>>
>>>>>>>> No functional change intended.
>>>>>>>
>>>>>>> FWIW I had proposed this kind of change earlier to Ryan (CCed) and
>>>>>>> he pointed out: "Doesn't that argument apply in reverse if you want
>>>>>>> to ignore something new in future?
>>>>>>>
>>>>>>> By default we are comparing all the bits in the pte when determining the
>>>>>>> batch.
>>>>>>> The flags request to ignore certain bits.
>>>>>>
>>>>>> That statement is not true: as default we ignore the write and young bit. And
>>>>>> we don't have flags for that ;)
>>>>>>
>>>>>> Now we also ignore the dirty and soft-dity bit as default, unless told not to
>>>>>> do that by one very specific caller.
>>>>>>
>>>>>>> If we want to ignore extra bits in
>>>>>>> future, we add new flags and the existing callers don't need to be updated.
>>>>>>
>>>>>> What stops you from using FPB_IGNORE_* for something else in the future?
>>>>>>
>>>>>> As a side note, there are not that many relevant PTE bits to worry about in
>>>>>> the near future ;)
>>>>>>
>>>>>> I mean, uffd-wp, sure, ... and before we add a FPB_HONOR_UFFD_WP to all users
>>>>>> to be safe (and changing the default to ignore), you could add a
>>>>>> FPB_IGNORE_UFFD_WP first, to then check who really can tolerate just ignoring
>>>>>> it (most of them, I assume).
>>>>> I agree.
>>>>
>>>> Meh. Personally I think if you start mixing HONOR and IGNORE flags, it becomes
>>>> very confusing to work out what is being checked for and what is not. I
>>>> stand by
>>>> my original view. But yeah, writable and young confuse it a bit... How about
>>>> generalizing by explicitly requiring IGNORE flags for write and young, then
>>>> also
>>>> create a flags macro for the common case?
>>>>
>>>> #define FPB_IGNORE_COMMON (FPB_IGNORE_WRITE | FPB_IGNORE_YOUNG |    \
>>>>                 FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY)
>>>>
>>>> It's not a hill I'm going to die on though...
>>>
>>> How about we make this function simpler, not more complicated? ;)
>>
>> I think here we both have different views of what is simpler... You are trying
>> to optimize for the callers writing less code. I'm trying to optimize for the
>> reader to be able to easily determine what the function will do for a given
>> caller.
> 
> See patch number #3: I want the default function -- folio_pte_batch() -- to not
> have any flags at all.
> 
> And I don't want to achieve that by internally using flags when calling
> folio_pte_batch_ext().
> 
> If you don't specify flags (folio_pte_batch()), behave just as if calling
> folio_pte_batch_ext() without flags. Anything else would be more confusing IMHO.

OK, sorry I don't have the context of your actual series... I was just trying to
defend what my quote that Dev sent. I'll go take a look at your series.

> 
> I agree that mixing HONOR and IGNORE is not a good idea. But then, it's really
> only uffd-wp that still could be batched, and likely we want it to be the
> default, and respect/honor/whatever instead in the cases where we really have to.
> 
> (If we really want to go down that path and batch it :) )

FWIW, I think we will need to honor the write bit for Dev's mprotect series (I
just sent review comments against his v4). So if you want most callers to just
call folio_pte_batch() and that will ignore the write bit, then I guess
folio_pte_batch_ext() will have to accept a FPB_HONOR_WRITE bit? Which I guess
aligns with what you are doing here to make all the flags HONOR.


