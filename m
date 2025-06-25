Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2AD1E4AE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856316; cv=none; b=a2Z2GKUgf3NKZAxuPkH4qvWQ/17KYq0tNT2au71AkaXM3/vYpiTPUSAEOp2cdK+i6W7wBiVt+qCDibk5VHxUCCalRgo1U3VRVingzAW9LhsQpCPMylZHYN0snl5agwRll0SEF6S5OjFzg8eES67jnwLcOCi7PfkHARfthodL7RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856316; c=relaxed/simple;
	bh=2hoCCCvo0qokdy2neXBSaKGM9DPi8z7fbQliqN7ob/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDUsykw51nYTR8vD0Ul5C3nmt+yeK44RrjBR0fcaXvAcabvYNSPz72J4t35bcos8YNcNH79kVGeonM+N2UEo028OZClvtyF6oCwygdA62UtdtLHm4rZjsvG+wtI1okXZeIPA/NOQr4p4EG0MscKvwfTslucqxo0EnzVfXEI4LJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H0RQVztb; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H0RQVztb"
Message-ID: <f1ee8679-88b4-4712-b2ed-c3eec179b430@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750856311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lY4C+H8rjCf0tB+LlRLUjdQXLKGrHdCeK+5aYVx8K34=;
	b=H0RQVztbREsh2CeBNzfiHRG3ArsNptNh9e4vAD7piCsogyawFZAZ0h7oX5wxSxKudfeOx8
	zmgi8lKBBJDJyX+yA3Bd/pjb8f4zMM6qXYyQr+ccBk4iLesagodds3gfB2bKoUezfMEyH5
	9KebcsTF3oF2ez4v96G72qSVlbShipA=
Date: Wed, 25 Jun 2025 20:58:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
 <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
 <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
 <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
 <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
 <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/25 20:09, David Hildenbrand wrote:
> On 25.06.25 13:42, Barry Song wrote:
>> On Wed, Jun 25, 2025 at 11:27 PM David Hildenbrand <david@redhat.com> 
>> wrote:
>>>
>>> On 25.06.25 13:15, Barry Song wrote:
>>>> On Wed, Jun 25, 2025 at 11:01 PM David Hildenbrand 
>>>> <david@redhat.com> wrote:
>>>>>
>>>>> On 25.06.25 12:57, Barry Song wrote:
>>>>>>>>
>>>>>>>> Note that I don't quite understand why we have to batch the 
>>>>>>>> whole thing
>>>>>>>> or fallback to
>>>>>>>> individual pages. Why can't we perform other batches that span 
>>>>>>>> only some
>>>>>>>> PTEs? What's special
>>>>>>>> about 1 PTE vs. 2 PTEs vs. all PTEs?
>>>>>>>
>>>>>>> That's a good point about the "all-or-nothing" batching logic ;)
>>>>>>>
>>>>>>> It seems the "all-or-nothing" approach is specific to the 
>>>>>>> lazyfree use
>>>>>>> case, which needs to unmap the entire folio for reclamation. If 
>>>>>>> that's
>>>>>>> not possible, it falls back to the single-page slow path.
>>>>>>
>>>>>> Other cases advance the PTE themselves, while try_to_unmap_one() 
>>>>>> relies
>>>>>> on page_vma_mapped_walk() to advance the PTE. Unless we want to 
>>>>>> manually
>>>>>> modify pvmw.pte and pvmw.address outside of 
>>>>>> page_vma_mapped_walk(), which
>>>>>> to me seems like a violation of layers. :-)
>>>>>
>>>>> Please explain to me why the following is not clearer and better:
>>>>
>>>> This part is much clearer, but that doesn’t necessarily improve the 
>>>> overall
>>>> picture. The main challenge is how to exit the iteration of
>>>> while (page_vma_mapped_walk(&pvmw)).
>>>
>>> Okay, I get what you mean now.
>>>
>>>>
>>>> Right now, we have it laid out quite straightforwardly:
>>>>                   /* We have already batched the entire folio */
>>>>                   if (nr_pages > 1)
>>>>                           goto walk_done;
>>>
>>>
>>> Given that the comment is completely confusing whens seeing the 
>>> check ... :)
>>>
>>> /*
>>>    * If we are sure that we batched the entire folio and cleared all 
>>> PTEs,
>>>    * we can just optimize and stop right here.
>>>    */
>>> if (nr_pages == folio_nr_pages(folio))
>>>          goto walk_done;
>>>
>>> would make the comment match.
>>
>> Yes, that clarifies it.
>>
>>>
>>>>
>>>> with any nr between 1 and folio_nr_pages(), we have to consider two 
>>>> issues:
>>>> 1. How to skip PTE checks inside page_vma_mapped_walk for entries that
>>>> were already handled in the previous batch;
>>>
>>> They are cleared if we reach that point. So the pte_none() checks will
>>> simply skip them?
>>>
>>>> 2. How to break the iteration when this batch has arrived at the end.
>>>
>>> page_vma_mapped_walk() should be doing that?
>>
>> It seems you might have missed the part in my reply that says:
>> "Of course, we could avoid both, but that would mean performing 
>> unnecessary
>> checks inside page_vma_mapped_walk()."
>  > > That’s true for both. But I’m wondering why we’re still doing the 
> check,
>> even when we’re fairly sure they’ve already been cleared or we’ve reached
>> the end :-)
> 
> :)
> 
>>
>> Somehow, I feel we could combine your cleanup code—which handles a batch
>> size of "nr" between 1 and nr_pages—with the
>> "if (nr_pages == folio_nr_pages(folio)) goto walk_done" check.
> 
> Yeah, that's what I was suggesting. It would have to be part of the 
> cleanup I think.
> 
> I'm still wondering if there is a case where
> 
> if (nr_pages == folio_nr_pages(folio))
>      goto walk_done;
> 
> would be wrong when dealing with small folios.

We can make the check more explicit to avoid any future trouble ;)

if (nr_pages > 1 && nr_pages == folio_nr_pages(folio))
     goto walk_done;

It should be safe for small folios.

Thanks,
Lance

> 
>> In practice, this would let us skip almost all unnecessary checks,
>> except for a few rare corner cases.
>>
>> For those corner cases where "nr" truly falls between 1 and nr_pages,
>> we can just leave them as-is—performing the redundant check inside
>> page_vma_mapped_walk().
> 
> I mean, batching mapcount+refcount updates etc. is always a win. If we 
> end up doing some unnecessary pte_none() checks, that might be 
> suboptimal but mostly noise in contrast to the other stuff we will 
> optimize out :)
> 
> Agreed that if we can easily avoid these pte_none() checks, we should do 
> that. Optimizing that for "nr_pages == folio_nr_pages(folio)" makes sense.
> 

