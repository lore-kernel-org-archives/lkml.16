Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D6E25EF82
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854959; cv=none; b=mMHLSrrGEuymwYX/4H4f3MOcnOpB54AL0oiuvuHoW7S3rdnDN6Yvo6ISIOFj2rZ8qeqPSB4goKc7BPUyaAdy3jTJ+2uJepXj1ny7CohgIHro9Fj9XR9qamHCuOgZyCSBCFaOvdvfBGqXxLWAFiJJmZgjTRV2RFNF3pMAAtW6NPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854959; c=relaxed/simple;
	bh=oYfb5ZG97I3Q7kngPWL4OobOrz/UDCOFDiDoI1et6wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpQK9WLnOEtwSP2viYFhQ0BHUb4gcTWiPu635fi2lrEcWGVQj2oTKknuRGIVFggeO/74z8RZFhVn9LGyHwyc4CgE9hjmLdpMayrfGgyXqm7WZfhvizfTM9iKXz1glzMU8/sCEDOT1e8rcwCaiR780x4p4Wul0ZUwri2RSZTMpgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wgPth1dx; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wgPth1dx"
Message-ID: <c9168877-9d66-4963-b4a7-f0095ba2760f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750854955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBhxaGgNjA37rFka6DmFsDUeF2nq5c9Khk7gfBsLM70=;
	b=wgPth1dxQCRD0V3ed0dRj9oL9K1dKtEq8pPfSmknpZbvJKt1zMt+3QNhkKNfMfZLceO8Qz
	cPxPaRoBL8WCkPE1QYq1+gDJ6MBR7/n0ZwmoPuZBokr0YeUZSOSOzHn8u4cZN1bumaSLjB
	Pe1sgLMQ9jKHyZ+aeQC6qLoBmCS1cY8=
Date: Wed, 25 Jun 2025 20:35:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>, Barry Song <21cnbao@gmail.com>
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
 <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
 <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/25 20:25, David Hildenbrand wrote:
> On 25.06.25 14:20, Lance Yang wrote:
>>
>>
>> On 2025/6/25 20:09, David Hildenbrand wrote:
>>>>
>>>> Somehow, I feel we could combine your cleanup code—which handles a 
>>>> batch
>>>> size of "nr" between 1 and nr_pages—with the
>>>> "if (nr_pages == folio_nr_pages(folio)) goto walk_done" check.
>>>
>>> Yeah, that's what I was suggesting. It would have to be part of the
>>> cleanup I think.
>>>
>>> I'm still wondering if there is a case where
>>>
>>> if (nr_pages == folio_nr_pages(folio))
>>>       goto walk_done;
>>>
>>> would be wrong when dealing with small folios.
>>>
>>>> In practice, this would let us skip almost all unnecessary checks,
>>>> except for a few rare corner cases.
>>>>
>>>> For those corner cases where "nr" truly falls between 1 and nr_pages,
>>>> we can just leave them as-is—performing the redundant check inside
>>>> page_vma_mapped_walk().
>>>
>>> I mean, batching mapcount+refcount updates etc. is always a win. If we
>>> end up doing some unnecessary pte_none() checks, that might be
>>> suboptimal but mostly noise in contrast to the other stuff we will
>>> optimize out 🙂
>>>
>>> Agreed that if we can easily avoid these pte_none() checks, we should do
>>> that. Optimizing that for "nr_pages == folio_nr_pages(folio)" makes 
>>> sense.
>>
>> Hmm... I have a question about the reference counting here ...
>>
>>         if (vma->vm_flags & VM_LOCKED)
>>             mlock_drain_local();
>>         folio_put(folio);
>>         /* We have already batched the entire folio */
>>
>> Does anyone else still hold a reference to this folio after folio_put()?
> 
> The caller of the unmap operation should better hold a reference :)

Ah, you're right. I should have realized that :(

Thanks,
Lance

> 
> Also, I am not sure why we don't perform a
> 
> folio_put_refs(folio, nr_pages);
> 
> ... :)
> 

