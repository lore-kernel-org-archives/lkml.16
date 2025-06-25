Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D7622ACEF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854079; cv=none; b=usGFGxk0GfU4umUyKVaceRTqrK2rHa38dvpsKl4GL3BdhbEKnB/jLK7wbMhPo7tc3lMciVJYDjBGJpSG4l/k6kTbXqs6awGBQk5KsqDfDEG+nOw37S9J4chNXP4ZPEy00NIkhUemI2gahyFwue5OEjVI4Ii/6vGkafat4F6BuSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854079; c=relaxed/simple;
	bh=VXSbp5N6NsJ/a9hHRHRryCY8oZaIIEjP6kYSe0BNPYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFdsMH5ARj1y/h1M8ExJ5+MY36J5elCxht7ocLWTgqAmPAdjhrPRU+5mKDTSZZKbdnM6AUZtdrlwHfm8xoTEpOXwJFYJ7eqQyFX/HDt05esAGNK1ysSm8L2H8XLOk2ZMES/GXEBvZc+zb+fN9ycTQEFGPZzRaF2rq67lc+cX8rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dbqPp1zP; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dbqPp1zP"
Message-ID: <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750854071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqF4hhowZcujiHY+iHQl6x5APphUIOsbur9usB3fHMI=;
	b=dbqPp1zP9dlPKWTDlI3t3zLN5/ONrptH3RYgCcrl9omGqZ7+bmrO3bJa0JRrkvhXraycoV
	elWuByVDPJUxyjtr6uiYD7om3L3B+0RvEw5odBoxkKBn51UWDL3LIG2VCW5LCytZ2sryAb
	zKos2fVOnRiQvX68sWQjMUop6cK7z4g=
Date: Wed, 25 Jun 2025 20:20:59 +0800
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
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/25 20:09, David Hildenbrand wrote:
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
> optimize out 🙂
> 
> Agreed that if we can easily avoid these pte_none() checks, we should do 
> that. Optimizing that for "nr_pages == folio_nr_pages(folio)" makes sense.

Hmm... I have a question about the reference counting here ...

		if (vma->vm_flags & VM_LOCKED)
			mlock_drain_local();
		folio_put(folio);
		/* We have already batched the entire folio */

Does anyone else still hold a reference to this folio after folio_put()?

		if (nr_pages == folio_nr_pages(folio))
			goto walk_done;
		continue;
walk_abort:
		ret = false;
walk_done:
		page_vma_mapped_walk_done(&pvmw);
		break;
	}

Thanks,
Lance

