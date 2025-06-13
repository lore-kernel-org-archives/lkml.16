Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BC91A01B9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749780452; cv=none; b=lQkmOHRu5Ul264AzPgBAWSAkuVWI8agxFZsmCuBDzmFfWryA3lmBDLYGQIOPCtqRhES+6PB2b+R1ZC82x122i8tN9OR85za2Ih13VR1z1vzAjWb17H808f0qsWQRbOGpJTupRrXqaQmgDh51NU0y/zb6jntgl/Bvwj5/gcpZLc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749780452; c=relaxed/simple;
	bh=wLJrwFv4SAlYUa3Duhr/pDflGB79tdrq/n/KdpiOEvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C18LJhCSn9aFsruuRTTRADFbbBTV3OVHZQF/6r+I8uAAKw3QzMpfeQfd1//dSb/aboerM7vahjp5y1rtJFM02gh3LS0kXywyTC5qkNxamYKLMzdS1a9a27NaT8RIBhvNhCccTjLPieK/J16eDepmIw1Zzt/KM3RJ4gHlxq7TI4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=e92SUjzE; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="e92SUjzE"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749780442; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=p+rRa3QKmOhYw/Lt12EnBbPLQ9TK+8gj2nP9q+FYN8w=;
	b=e92SUjzEBxC47EZOAAKWdoH3RQ6/P4HSDKyNecEG7qWaZvY82HkDTY8gPzKXeIiD+Tyv0/i8lcgYSfCuFYMAdzBN6RMiXy32bFZYEr8sy5jVpNKAUszoujG/JHBs5G6sBd9V98AOMlmMVHw3G4+5l7kF5Zfqedg2fRYlBG7kLL0=
Received: from 30.74.144.147(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WdiglX0_1749780441 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 13 Jun 2025 10:07:21 +0800
Message-ID: <7c911fff-aaf1-430c-89f2-5e7925e90a04@linux.alibaba.com>
Date: Fri, 13 Jun 2025 10:07:20 +0800
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
 <ee646bca-e77d-4452-82f8-0bdb4b241f9c@redhat.com>
 <815f383d-8636-490d-8994-486be51f3123@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <815f383d-8636-490d-8994-486be51f3123@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/12 22:49, Lorenzo Stoakes wrote:
> On Thu, Jun 12, 2025 at 04:09:27PM +0200, David Hildenbrand wrote:
>>
>>
>>>> @@ -265,6 +265,42 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>>>>                                            unsigned long tva_flags,
>>>>                                            unsigned long orders);
>>>> +/* Strictly mask requested anonymous orders according to sysfs settings. */
>>>> +static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
>>>> +       unsigned long tva_flags, unsigned long orders)
>>>> +{
>>>> +       const unsigned long always = READ_ONCE(huge_anon_orders_always);
>>>> +       const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>>>> +       const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
>>>> +       const unsigned long never = ~(always | madvise | inherit);
>>>> +
>>>> +       /* Disallow orders that are set to NEVER directly ... */
>>>> +       orders &= ~never;
>>>> +
>>>> +       /* ... or through inheritance (global == NEVER). */
>>>> +       if (!hugepage_global_enabled())
>>>> +               orders &= ~inherit;
>>>> +
>>>> +       /*
>>>> +        * Otherwise, we only enforce sysfs settings if asked. In addition,
>>>> +        * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
>>>> +        * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
>>>> +        * set.
>>>> +        */
>>>> +       if (!(tva_flags & TVA_ENFORCE_SYSFS))
>>>> +               return orders;
>>>
>>> This implicitly does a & mask as per suggested previous version, which I think
>>> is correct but worth pointing out.
>>
>> Yes.
>>
>>>
>>>> +
>>>> +       if (!(vm_flags & VM_HUGEPAGE)) {
>>>
>>> Don't love this sort of mega negation here. I read this as _does_ have huge
>>> page...
>>
>> Well, it's very common to do that, but not objecting to something that is
>> clearer ;)
>>
>> I assume you spotted the
>>
>> if (!(tva_flags & TVA_ENFORCE_SYSFS))
>>
>> :P
> 
> Lol yeah I know I know, I just think I guess in this case because you're
> negating elsewhere it makes it harder...
> 
>>
>> if (vm_flags & VM_HUGEPAGE)
>> 	return orders;
>>
>>
>> Would have been easier.
>>
>>>
>>>> +               /* Disallow orders that are set to MADVISE directly ... */
>>>> +               orders &= ~madvise;
>>>> +
>>>> +               /* ... or through inheritance (global == MADVISE). */
>>>> +               if (!hugepage_global_always())
>>>> +                       orders &= ~inherit;
>>>
>>> I hate this implicit 'not hugepage global always so this means either never or
>>> madvise and since we cleared orders for never this means madvise' mental
>>> gymnastics required here.
>>>
>>> Yeah I feel this is a bridge too far, we're getting into double negation and I
>>> think that's more confusiong.
>>
>>
>> Same here ... I think we should just have hugepage_global_madvise(). :)
> 
> Ideally in future not have these stupid globals all over the place and rework
> this whole damn thing...
> 
>>
>>>
>>>
>>>> +       }
>>>
>>> I propose a compromise as I rather like your 'exclude never' negation bit.
>>>
>>> So:
>>>
>>> /* Strictly mask requested anonymous orders according to sysfs settings. */
>>> static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
>>>                   unsigned long tva_flags, unsigned long orders)
>>> {
>>>           const unsigned long always = READ_ONCE(huge_anon_orders_always);
>>>           const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>>>           const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
>>> 	const unsigned long never = ~(always | madvise | inherit);
>>>           const bool inherit_enabled = hugepage_global_enabled();
>>
>> Can we just have hugepage_global_never/disabled() to use instead?
> 
> This would be nice!
> 
> Could be a follow up... though again would be nice to somehow do away with all
> this crap altogether.
> 
>>
>>>
>>> 	/* Disallow orders that are set to NEVER directly ... */
>>> 	orders &= ~never;
>>>
>>> 	/* ... or through inheritance (global == NEVER). */
>>> 	if (!inherit_enabled)
>>> 		orders &= ~inherit;>
>>> 	/*
>>> 	 * Otherwise, we only enforce sysfs settings if asked. In addition,
>>> 	 * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
>>> 	 * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
>>> 	 * set.
>>> 	 */
>>> 	if (!(tva_flags & TVA_ENFORCE_SYSFS))
>>> 		return orders;
>>>
>>> 	if (hugepage_global_always())
>>> 		return orders & (always | inherit);
>>>
>>> 	/* We already excluded never inherit above. */
>>> 	if (vm_flags & VM_HUGEPAGE)
>>> 		return orders & (always | madvise | inherit);
>>>
>>> 	return orders & always;
>>> }
>>>
>>> What do you think?
>>
>> With the fixup, it would work for me. No magical "mask" variables :D
> 
> Thanks!

Fair enough. You both prefer the 'exclude never' logic, and I will 
follow that logic.

>>>> +       return orders;
>>>> +}
>>>> +
>>>>    /**
>>>>     * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
>>>>     * @vma:  the vm area to check
>>>> @@ -287,16 +323,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>>>>                                          unsigned long orders)
>>>>    {
>>>>           /* Optimization to check if required orders are enabled early. */
>>>> -       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
>>>> -               unsigned long mask = READ_ONCE(huge_anon_orders_always);
>>>> -
>>>> -               if (vm_flags & VM_HUGEPAGE)
>>>> -                       mask |= READ_ONCE(huge_anon_orders_madvise);
>>>> -               if (hugepage_global_always() ||
>>>> -                   ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
>>>> -                       mask |= READ_ONCE(huge_anon_orders_inherit);
>>>> -
>>>> -               orders &= mask;
>>>> +       if (vma_is_anonymous(vma)) {
>>>> +               orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
>>>>                   if (!orders)
>>>>                           return 0;
>>>
>>> I pointed out to Baolin that __thp_vma_allowable_orders() handles the orders ==
>>> 0 case almost immediately so there's no need to do this, it just makes the code
>>> noisier.
>>
>> The reason we added it in the first place was to not do the (expensive)
>> function call.
> 
> Ack point taken!
> 
>>
>>
>> --
>> Cheers,
>>
>> David / dhildenb
>>
> 
> For convenience, I enclose the fixed version + tweaked the inherit local bool to
> be inherit_never to be clearer:
> 
> /* Strictly mask requested anonymous orders according to sysfs settings. */
> static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
>                  unsigned long tva_flags, unsigned long orders)
> {
>          const unsigned long always = READ_ONCE(huge_anon_orders_always);
>          const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>          const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
>          const unsigned long never = ~(always | madvise | inherit);
>          const bool inherit_never = !hugepage_global_enabled();
> 
>          /* Disallow orders that are set to NEVER directly ... */
>          orders &= ~never;
> 
>          /* ... or through inheritance (global == NEVER). */
>          if (inherit_never)
>                  orders &= ~inherit;
> 
>          /*
>           * Otherwise, we only enforce sysfs settings if asked. In addition,
>           * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
>           * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
>           * set.
>           */
>          if (!(tva_flags & TVA_ENFORCE_SYSFS))
>                  return orders;
> 
>          /* We already excluded never inherit above. */
>          if (vm_flags & VM_HUGEPAGE)
>                  return orders & (always | madvise | inherit);
> 
>          if (hugepage_global_always())
>                  return orders & (always | inherit);
> 
>          return orders & always;
> }

Thanks Lorenzo. Let me follow this logic and do some testing.
