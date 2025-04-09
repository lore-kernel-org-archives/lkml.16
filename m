Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9720D8BEA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 00:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744160252; cv=none; b=CwrANuTuX8aZ3AmbNNJ/pvXRQFmsHQVjgy8bpTs0z1d3Zk/PiAdw5Z9UKnlLZBrxmJNSgA6ROCX+B7RvR4tMpNU4+QRiXtfgIE8urx2iYpGNthkCgD5piqgxkGOj/3jND2XbelXoXjkaeDM6r3oHasedykUqpkTm/dacYQVmwKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744160252; c=relaxed/simple;
	bh=el5cStiYN6ldNZC/HVBQbK10K82xnqqs9ET4H6q4jqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kakMmQijmhkd0N57rDcYjxhaGE+r8AIvHuTDJj88MODJ7b8uPaLRumtokdK7wxzbFQkv8UvZxgoAWIOQ1sIvttaqeVJ3nJJAMIABCs4J14HzRVYFyanbdlbpdaIwf0Sik/LoVgev/CQExGPv+nZS7d9SYqZ+S5jemhkNbulB4rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZL1Lxqaf; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZL1Lxqaf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744160246; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=3u6V+RZKHcCI6WcdOem5D2yjNJ6f17csLnu4f6RrGNE=;
	b=ZL1LxqafeNJpojIAMygEhFaQio1w2YuPXfIscK4styDP8iqcKg4GMNtE+X4TBdHFbWldPAOmm/V2me/fGOtB2eJb0XaD8irOZFRq4wFkmIuqYHku+D5ZkO2tLmXEdgIwG4xAOIqMF7PZ8g5zIzZqHenM819pdZ0svumHOVUVIwA=
Received: from 30.74.144.109(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WWHHqoY_1744159928 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Apr 2025 08:52:09 +0800
Message-ID: <0b668098-5623-4062-b219-605dc91c0877@linux.alibaba.com>
Date: Wed, 9 Apr 2025 08:52:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
To: Zi Yan <ziy@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com,
 21cnbao@gmail.com, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
 <282545E0-5B66-492D-B63F-838C6F066A22@nvidia.com>
 <20250408160205.GD816@cmpxchg.org>
 <2C391CDE-0C6D-4ECD-9EDF-5CC165999EA2@nvidia.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <2C391CDE-0C6D-4ECD-9EDF-5CC165999EA2@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/9 00:12, Zi Yan wrote:
> On 8 Apr 2025, at 12:02, Johannes Weiner wrote:
> 
>> On Tue, Apr 08, 2025 at 11:29:43AM -0400, Zi Yan wrote:
>>> On 8 Apr 2025, at 9:16, Baolin Wang wrote:
>>>
>>>> When investigating performance issues during file folio unmap, I noticed some
>>>> behavioral differences in handling non-PMD-sized folios and PMD-sized folios.
>>>> For non-PMD-sized file folios, it will call folio_mark_accessed() to mark the
>>>> folio as having seen activity, but this is not done for PMD-sized folios.
>>>>
>>>> This might not cause obvious issues, but a potential problem could be that,
>>>> it might lead to more frequent refaults of PMD-sized file folios under memory
>>>> pressure. Therefore, I am unsure whether the folio_mark_accessed() should be
>>
>> Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Thanks for taking a look.

>>> How likely will the system get PMD-sized file folios when it is under
>>> memory pressure? Johannes’ recent patch increases THP allocation successful
>>> rate, maybe it was not happening before but will be after the patch?
>>
>> It's not so much about whether the refault can construct a THP again,
>> but whether we should have evicted this data under pressure to begin
>> with. It's more about IO and paging. And it's the same consideration
>> why we transfer the young bit for base pages.
> 
> Got it. It clarifies things a lot.
> 
>>
>> Sometimes file contents are only accessed through relatively
>> short-lived mappings. But they can nevertheless be accessed a lot and
>> be hot. It's important to not lose that information on unmap, and end
>> up kicking out a frequently used cache page.

Yes, that's what I also understand. Thanks for the explanation.

> So folio_mark_accessed() will prevent the folio from going down in
> the LRU lists, when PTE access information is transferred to the folio.
> The addition of folio_mark_accessed() makes sense to me now.
> 
> Baolin, can you include Johannes’s explanation in your commit log?

Sure. Will do.

> 
> Feel free to add Acked-by: Zi Yan <ziy@nvidia.com>

Thanks for reviewing.

>>>> added for PMD-sized file folios?
>>>
>>> Do you see any performance change after your patch?

Not yet, just some theoretical analysis from code inspection.

>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> ---
>>>>   mm/huge_memory.c | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>> index 6ac6d468af0d..b3ade7ac5bbf 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>>>   				zap_deposited_table(tlb->mm, pmd);
>>>>   			add_mm_counter(tlb->mm, mm_counter_file(folio),
>>>>   				       -HPAGE_PMD_NR);
>>>> +
>>>> +			if (flush_needed && pmd_young(orig_pmd) &&
>>>> +			    likely(vma_has_recency(vma)))
>>>> +				folio_mark_accessed(folio);
>>>>   		}
>>>>
>>>>   		spin_unlock(ptl);
>>>> -- 
>>>> 2.43.5
> 
> 
> Best Regards,
> Yan, Zi
