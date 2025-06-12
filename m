Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172903596B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737628; cv=none; b=M+ccFT3Gm38nxHcPqGA5BOP3FfylGowPcEMi4tlS5zRRH/RXvHUd+hHc33K17Eavrb74QP+BojiFZEFzMj9j1JceWePp02XtlTvfpVmxAiX1jMZkWWpFjHTx9iTXCkF1n20/0SGdEgeIzMMFWdlliYM9jJu8bOKdGTe6FRZSRqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737628; c=relaxed/simple;
	bh=5RtWkX1SlWGb0WwKUrK+vAVOVuW3zwGEiECx9XPR244=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aa0l0RLDjCBW0vS4fBv07QA+Hood3prWa4/9Q+6I4eBhKIV7/8M+gGdYqhW9hrYLyNIQWob2m7rMdlHrrvronK8633KxO3Rns1s/Czos7CpNN2ZT0gSM8yHJv76AbPFLiUQltIwRtqxxf5biqSglmXGzs9G2Cm7/9WJZ5O89suw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=pnZ52KGK; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="pnZ52KGK"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749737622; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=8dSW0MWx250BT5PDHKGtg7MyrmkvYYx3NnjczjhuDu4=;
	b=pnZ52KGK8IFZuOD8/bJv3kOJ4v2SMQPzddAiqFPx+MTclatjOa/cQV/wdJoi57JFQ2qOtmmTDcriuispo9q32Z1RQl5POPR77GzlkvTbATgi71WawI2xGHtyFjv4kEADfNA6vFzenDUxSQOaT1hFfAlJcWGq0AxRf2mQy0Jk/cA=
Received: from 30.39.247.88(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WdhHBU7_1749737621 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 12 Jun 2025 22:13:41 +0800
Message-ID: <519c59e6-20ef-4edf-88b8-a71f38cbd2de@linux.alibaba.com>
Date: Thu, 12 Jun 2025 22:13:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, hughd@google.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
 <953596b2-8749-493d-97eb-a5d8995d9ef8@redhat.com>
 <97a67b74-d473-455e-a05e-c85fe45da008@linux.alibaba.com>
 <b8fe659e-8a84-4328-b6d6-6116c616cb3d@redhat.com>
 <ce58b08c-0ac1-4ec2-8ff6-cf8e651709b0@lucifer.local>
 <201a1cc4-93fc-48e3-aeab-759ba8c8a47c@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <201a1cc4-93fc-48e3-aeab-759ba8c8a47c@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/12 21:29, Lorenzo Stoakes wrote:
> On Thu, Jun 12, 2025 at 02:27:06PM +0100, Lorenzo Stoakes wrote:
> [snip]
> 
>> I propose a compromise as I rather like your 'exclude never' negation bit.
>>
>> So:
>>
>> /* Strictly mask requested anonymous orders according to sysfs settings. */
>> static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
>>                  unsigned long tva_flags, unsigned long orders)
>> {
>>          const unsigned long always = READ_ONCE(huge_anon_orders_always);
>>          const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>>          const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
>> 	const unsigned long never = ~(always | madvise | inherit);
>>          const bool inherit_enabled = hugepage_global_enabled();
>>
>> 	/* Disallow orders that are set to NEVER directly ... */
>> 	orders &= ~never;
>>
>> 	/* ... or through inheritance (global == NEVER). */
>> 	if (!inherit_enabled)
>> 		orders &= ~inherit;
>>
>> 	/*
>> 	 * Otherwise, we only enforce sysfs settings if asked. In addition,
>> 	 * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
>> 	 * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
>> 	 * set.
>> 	 */
>> 	if (!(tva_flags & TVA_ENFORCE_SYSFS))
>> 		return orders;
>>
>> 	if (hugepage_global_always())
>> 		return orders & (always | inherit);
>>
>> 	/* We already excluded never inherit above. */
>> 	if (vm_flags & VM_HUGEPAGE)
>> 		return orders & (always | madvise | inherit);
> 
> Of course... I immediately made a mistake... swap these two statements around. I
> thought it'd be 'neater' to do the first one first, but of course it means
> madvise (rather than inherit) orders don't get selected.
> 
> This WHOLE THING needs refactoring.

Personally, I think the 'exclude never' logic becomes more complicated. 
I made a simpler change without adding a new helper. What do you think?

static inline
unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
                                        unsigned long vm_flags,
                                        unsigned long tva_flags,
                                        unsigned long orders)
{
         /* Optimization to check if required orders are enabled early. */
         if (vma_is_anonymous(vma)) {
                 unsigned long mask = READ_ONCE(huge_anon_orders_always);
                 bool huge_enforce = !(tva_flags & TVA_ENFORCE_SYSFS);
                 bool has_madvise =  vm_flags & VM_HUGEPAGE;

                 /*
                  * if the user sets a sysfs mode of madvise and if 
TVA_ENFORCE_SYSFS
                  * is not set, we don't bother checking whether the VMA 
has VM_HUGEPAGE
                  * set.
                  */
                 if (huge_enforce || has_madvise)
                         mask |= READ_ONCE(huge_anon_orders_madvise);
                 if (hugepage_global_always() ||
                     ((has_madvise || huge_enforce) && 
hugepage_global_enabled()))
                         mask |= READ_ONCE(huge_anon_orders_inherit);

                 orders &= mask;
                 if (!orders)
                         return 0;
         }

         return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, 
orders);
}

> 
>>
>> 	return orders & always;
>> }
>>
>> What do you think?
>>
>>
>>> +       return orders;
>>> +}
>>> +
>>>   /**
>>>    * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
>>>    * @vma:  the vm area to check
>>> @@ -287,16 +323,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>>>                                         unsigned long orders)
>>>   {
>>>          /* Optimization to check if required orders are enabled early. */
>>> -       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
>>> -               unsigned long mask = READ_ONCE(huge_anon_orders_always);
>>> -
>>> -               if (vm_flags & VM_HUGEPAGE)
>>> -                       mask |= READ_ONCE(huge_anon_orders_madvise);
>>> -               if (hugepage_global_always() ||
>>> -                   ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
>>> -                       mask |= READ_ONCE(huge_anon_orders_inherit);
>>> -
>>> -               orders &= mask;
>>> +       if (vma_is_anonymous(vma)) {
>>> +               orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
>>>                  if (!orders)
>>>                          return 0;
>>
>> I pointed out to Baolin that __thp_vma_allowable_orders() handles the orders ==
>> 0 case almost immediately so there's no need to do this, it just makes the code
>> noisier.
>>
>> I mean we _could_ keep it but I think it's better not to for cleanliness, what
>> do you think?
>>
>>>          }
>>>
>>>
>>> --
>>> Cheers,
>>>
>>> David / dhildenb
>>>
>>
