Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AD6F50F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750900670; cv=none; b=VilfjhS+MnW+qJKe5+oHV7ZNoFm2/9MDu0+Erqimmx1ltGeJdKJeVjfEVuzlsDzUL49PDPhzqVo/Ud4uGAj7tf0ZhViRL5D94l52oB5Pv3GaEZB/JTtMhcB6qfVlrw6iwSmq9xAeLxd/MflGWVgGzHQCJPYXgJ+DyQYo0CAWSiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750900670; c=relaxed/simple;
	bh=84xrWsFvThICZdecb9JC6xrJWRZz9tBF3YFNzgwPIYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNWssRaxWvTmfUjCbTce518QDmnWZ3KAz16aeARpPBvB2vAYO8nVl5A6erdZ/NRPWHPNcrfMkyx/oK6FLWPPW9UxdR2JI6B/OeYr26mI5gLQ53osDeGYMMqgQQuJcdAXu+w/P5JLJPaBtJDEQSzxatClv2D4HR6xyw0ZEiFQXbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eQC/N5AQ; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eQC/N5AQ"
Message-ID: <42343413-7089-404e-8ce0-dd0025dca04c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750900666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/mKaCqAOOiAqgd0HRwof3OK6yOq5hDWh6JBXZFbX3c=;
	b=eQC/N5AQvanuC7OqZCZ2wPmyrZ0ioxCa9JUW83LYLMRJAjmHovEfQEFsrT0ybVpqok1KVf
	W8sl6sksNaJU2UyrQqwdsCkZ9XZzcI0M91ODFaE5+ns5n8ksfSxI1liRF/El6i+kpXAUkV
	hSNMrXxp+B00xFNqxmEmvAlnPyxAvY8=
Date: Thu, 26 Jun 2025 09:17:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>, David Hildenbrand <david@redhat.com>
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
 <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
 <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
 <CAGsJ_4woYd_TmZU94nedH=x_+HTwLxz94ih1jFmxoj4CxuhqzQ@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <CAGsJ_4woYd_TmZU94nedH=x_+HTwLxz94ih1jFmxoj4CxuhqzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/26 05:03, Barry Song wrote:
> On Thu, Jun 26, 2025 at 12:25 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 25.06.25 14:20, Lance Yang wrote:
> [...]
>>> Hmm... I have a question about the reference counting here ...
>>>
>>>                if (vma->vm_flags & VM_LOCKED)
>>>                        mlock_drain_local();
>>>                folio_put(folio);
>>>                /* We have already batched the entire folio */
>>>
>>> Does anyone else still hold a reference to this folio after folio_put()?
>>
>> The caller of the unmap operation should better hold a reference :)
>>
>> Also, I am not sure why we don't perform a
>>
>> folio_put_refs(folio, nr_pages);
> 
> Because we've already called folio_ref_sub(folio, nr_pages - 1);
> Looking back, it’s kind of ugly, huh.
> 
> discard:
>                  if (unlikely(folio_test_hugetlb(folio))) {
>                          hugetlb_remove_rmap(folio);
>                  } else {
>                          folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
>                          folio_ref_sub(folio, nr_pages - 1);
>                  }
> 
> I assume Lance will send a patch? If so, remember to remove this
> when switching to folio_put_refs(folio, nr_pages);

Ah, got it. Thanks for pointing that out!

