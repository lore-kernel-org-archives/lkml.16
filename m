Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79505D299
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744334410; cv=none; b=Yb6Iac8yvgzYOn6oHIHuKYEPR+cpIZjUL/bBEccOXnivZbGMz6kzwPf+x2YQXZNxrZbQwSliLJsCRdxsDVFyFMt9PtjVadB/HrvQPulo9ay33s2S/s+6eeIaMHIkiQTGTkaI79Grrayq6QU8nNsHENNw1NgUqCrCactk+DYjx1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744334410; c=relaxed/simple;
	bh=2+nmyoImJkTyFiJQ3V7xm+XM4qK48C1ZERRdK3pbc5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tkqprt85V1oGLnx7EYWk9OYi45nEaWiioOrdjqZP6+3HftCI0ar8dLgYKXp+kttMusHv04VRkfdQvlGPYpux7CnOO1HMoNNOw/xgXwp+Wv1YxSV+8lb1UZFp9iLJZ1qKErcD+ls5OE/94dop07DpsX2n6pXOdpN0uU4nOi24asY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=HYy9qEmF; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="HYy9qEmF"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744334403; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=amhcLDqbTnuD6tlVLNEDxIaRocgED5CdIhUH1OvSHG0=;
	b=HYy9qEmFCBxIp4YUivkUrmFx0e/1fs8r2vV2EWhBxYlARbe7BK4HsT2NI545IF4JCNc5agoU+ntSArRxgsF4QRmbuIzOGi84uogMGmEoNAGSDQa26PSQl9TpZ3qb64KxSzTGzsfNCbe+H7ygTcRJBs1wlnkeyCqSCcK41qvbrCo=
Received: from 30.74.144.105(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WWR2HW9_1744334402 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 11 Apr 2025 09:20:02 +0800
Message-ID: <247fca57-8280-41a6-85b0-03a32ea08210@linux.alibaba.com>
Date: Fri, 11 Apr 2025 09:20:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
To: Barry Song <21cnbao@gmail.com>, Zi Yan <ziy@nvidia.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com,
 ryan.roberts@arm.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4wnvWmOz-FNvYzkqEW1kz0UCfzythbeJSbSyWy_=ib5MA@mail.gmail.com>
 <5c52b67a-8e7e-4dd7-9127-96944715d883@linux.alibaba.com>
 <CAGsJ_4yPxoF5P87WdXbXVb8BqovVvxhKg40YVddkEQmFjFsRYw@mail.gmail.com>
 <1E123113-7A0B-4D3A-AC7A-01767D7BF2D8@nvidia.com>
 <CAGsJ_4zMthcj0dtCX1OKQ1_A01OdF=P1n9FGLpGsbkTRwWoqVA@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4zMthcj0dtCX1OKQ1_A01OdF=P1n9FGLpGsbkTRwWoqVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/11 05:56, Barry Song wrote:
> On Fri, Apr 11, 2025 at 3:13 AM Zi Yan <ziy@nvidia.com> wrote:
>>
>> On 10 Apr 2025, at 6:29, Barry Song wrote:
>>
>>> On Thu, Apr 10, 2025 at 9:05 PM Baolin Wang
>>> <baolin.wang@linux.alibaba.com> wrote:
>>>>
>>>>
>>>>
>>>> On 2025/4/10 16:14, Barry Song wrote:
>>>>> On Wed, Apr 9, 2025 at 1:16 AM Baolin Wang
>>>>> <baolin.wang@linux.alibaba.com> wrote:
>>>>>>
>>>>>> When investigating performance issues during file folio unmap, I noticed some
>>>>>> behavioral differences in handling non-PMD-sized folios and PMD-sized folios.
>>>>>> For non-PMD-sized file folios, it will call folio_mark_accessed() to mark the
>>>>>> folio as having seen activity, but this is not done for PMD-sized folios.
>>>>>>
>>>>>> This might not cause obvious issues, but a potential problem could be that,
>>>>>> it might lead to more frequent refaults of PMD-sized file folios under memory
>>>>>> pressure. Therefore, I am unsure whether the folio_mark_accessed() should be
>>>>>> added for PMD-sized file folios?
>>>>>>
>>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>> ---
>>>>>>    mm/huge_memory.c | 4 ++++
>>>>>>    1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>>>> index 6ac6d468af0d..b3ade7ac5bbf 100644
>>>>>> --- a/mm/huge_memory.c
>>>>>> +++ b/mm/huge_memory.c
>>>>>> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>>>>>                                   zap_deposited_table(tlb->mm, pmd);
>>>>>>                           add_mm_counter(tlb->mm, mm_counter_file(folio),
>>>>>>                                          -HPAGE_PMD_NR);
>>>>>> +
>>>>>> +                       if (flush_needed && pmd_young(orig_pmd) &&
>>>>>> +                           likely(vma_has_recency(vma)))
>>>>>> +                               folio_mark_accessed(folio);
>>>>>
>>>>> Acked-by: Barry Song <baohua@kernel.org>
>>>>
>>>> Thanks.
>>>>
>>>>> I also came across an interesting observation: on a memory-limited system,
>>>>> demoting unmapped file folios in the LRU—specifically when their mapcount
>>>>> drops from 1 to 0—can actually improve performance.
>>>>
>>>> These file folios are used only once? Can folio_set_dropbehind() be used
>>>> to optimize it, which can avoid the LRU activity movement in
>>>> folio_mark_accessed()?
>>>
>>> For instance, when a process, such as a game, just exits, it can be expected
>>> that it won't be used again in the near future. As a result, demoting
>>> its previously
>>> unmapped file pages can improve performance.
>>
>> Is it possible to mark the dying VMAs either VM_SEQ_READ or VM_RAND_READ
>> so that folio_mark_accessed() will be skipped? Or a new vm_flag?
>> Will it work?
> 
> Actually took a more aggressive approach and observed good performance
> improvements on phones. After zap_pte_range() called remove_rmap(),
> the following logic was added:
> 
> if (file_folio && !folio_mapped())
>      deactivate_file_folio();
> 
> This helps file folios from exiting processes get reclaimed more quickly
> during the MGLRU's min generation scan while the folios are probably
> in max gen.
> 
> I'm not entirely sure if this is universally applicable or worth submitting as
> a patch.

IMHO, I'm afraid this is not universally applicable. Although these file 
folios have been unmapped, it's not certain that they won't be accessed 
again. These file folios might be remapped and accessed again soon, or 
accessed through read()/write() operations using a file descriptor.

I agree with Zi's suggestion. Using some kind of madvise() hint to mark 
these file folios as those that won't be accessed after being unmapped, 
seems can work?
