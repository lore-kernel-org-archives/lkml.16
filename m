Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2972586C8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734756; cv=none; b=p+ifKwPHezQyo9FvFqbU2fXr9srRiVLOLjC3XS3uY63s5nGFnRrByWkq125uOuubNEm+HcXWQ+29anB0hJLbMnjtBANwSDA+VkCPxoaSaPFhdjMeatsjTB6yj6AtnP/q3QamB5pQ6rQc5Z7RUvlFd+tfShJvt9zclT7/sotvkjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734756; c=relaxed/simple;
	bh=hcZcBkKt0UFxCiGP9o6Bx1GJEYfRCoYTXBc4w4JpNoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSFmlCl04qwPlICmTtYAxB/6yUye5FFo89lI6DZUbIyA6L6uzqieGm9DbSgNT0KCCeAcX98l4DYnMz6D1AjreCYzMd7BD7EFs41ZPVd/HAIVBVjAyP3pd1CjG2NYl++HGDCBlcWYbz9LPKV86SNMV+zesJQz0IW8W0ZoaDN7zS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=s0S17hdV; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="s0S17hdV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749734745; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=vYF/r51uFCbhClrqwieaK0VW0rIZWeBxCvWde2d0ef4=;
	b=s0S17hdVpdGDPMM4cRntzv5iCvUlebiNfg6VAnoadbnKon9NnbNhvwgb/CqMOkmtN/efNMLVpjWraRi2qbVs4X7MLRyvaqR3ixy27pNrhaWH1L0gda5vp95vPlSpnHhC+xCpO4VJGPlWVk2CVpIU9J1mIeQdvWfy/cQP18NFYHI=
Received: from 30.39.247.88(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WdhBJVR_1749734743 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 12 Jun 2025 21:25:44 +0800
Message-ID: <e6e3137c-3b0a-4c92-9e5f-69bee5e0c948@linux.alibaba.com>
Date: Thu, 12 Jun 2025 21:25:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
 <953596b2-8749-493d-97eb-a5d8995d9ef8@redhat.com>
 <97a67b74-d473-455e-a05e-c85fe45da008@linux.alibaba.com>
 <b8fe659e-8a84-4328-b6d6-6116c616cb3d@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <b8fe659e-8a84-4328-b6d6-6116c616cb3d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/12 21:05, David Hildenbrand wrote:
> On 12.06.25 14:45, Baolin Wang wrote:
>>
>>
>> On 2025/6/12 16:51, David Hildenbrand wrote:
>>> On 12.06.25 09:51, Baolin Wang wrote:
>>>>
>>>>
>>>> On 2025/6/11 20:34, David Hildenbrand wrote:
>>>>> On 05.06.25 10:00, Baolin Wang wrote:
>>>>>> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs 
>>>>>> settings,
>>>>>> which
>>>>>> means that even though we have disabled the Anon THP configuration,
>>>>>> MADV_COLLAPSE
>>>>>> will still attempt to collapse into a Anon THP. This violates the 
>>>>>> rule
>>>>>> we have
>>>>>> agreed upon: never means never.
>>>>>>
>>>>>> Another rule for madvise, referring to David's suggestion: “allowing
>>>>>> for collapsing
>>>>>> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>>>>>
>>>>>> To address this issue, should check whether the Anon THP 
>>>>>> configuration
>>>>>> is disabled
>>>>>> in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS 
>>>>>> flag is
>>>>>> set.
>>>>>>
>>>>>> In summary, the current strategy is:
>>>>>>
>>>>>> 1. If always & orders == 0, and madvise & orders == 0, and
>>>>>> hugepage_global_enabled() == false
>>>>>> (global THP settings are not enabled), it means mTHP of that orders
>>>>>> are prohibited
>>>>>> from being used, then madvise_collapse() is forbidden for that 
>>>>>> orders.
>>>>>>
>>>>>> 2. If always & orders == 0, and madvise & orders == 0, and
>>>>>> hugepage_global_enabled() == true
>>>>>> (global THP settings are enabled), and inherit & orders == 0, it 
>>>>>> means
>>>>>> mTHP of that
>>>>>> orders are still prohibited from being used, thus madvise_collapse()
>>>>>> is not allowed
>>>>>> for that orders.
>>>>>>
>>>>>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>> ---
>>>>>>     include/linux/huge_mm.h | 23 +++++++++++++++++++----
>>>>>>     1 file changed, 19 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>>>> index 2f190c90192d..199ddc9f04a1 100644
>>>>>> --- a/include/linux/huge_mm.h
>>>>>> +++ b/include/linux/huge_mm.h
>>>>>> @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct
>>>>>> vm_area_struct *vma,
>>>>>>                            unsigned long orders)
>>>>>>     {
>>>>>>         /* Optimization to check if required orders are enabled
>>>>>> early. */
>>>>>> -    if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
>>>>>> -        unsigned long mask = READ_ONCE(huge_anon_orders_always);
>>>>>> +    if (vma_is_anonymous(vma)) {
>>>>>> +        unsigned long always = READ_ONCE(huge_anon_orders_always);
>>>>>> +        unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>>>>>> +        unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
>>>>>> +        unsigned long mask = always | madvise;
>>>>>> +
>>>>>> +        /*
>>>>>> +         * If the system-wide THP/mTHP sysfs settings are disabled,
>>>>>> +         * then we should never allow hugepages.
>>>>>    > +         */> +        if (!(mask & orders) &&
>>>>> !(hugepage_global_enabled() && (inherit & orders)))
>>>>>> +            return 0;
>>>>>
>>>>> I'm still trying to digest that. Isn't there a way for us to work with
>>>>> the orders,
>>>>> essentially masking off all orders that are forbidden globally. 
>>>>> Similar
>>>>> to below, if !orders, then return 0?
>>>>> /* Orders disabled directly. */
>>>>> orders &= ~TODO;
>>>>> /* Orders disabled by inheriting from the global toggle. */
>>>>> if (!hugepage_global_enabled())
>>>>>        orders &= ~READ_ONCE(huge_anon_orders_inherit);
>>>>>
>>>>> TODO is probably a -1ULL and then clearing always/madvise/inherit. 
>>>>> Could
>>>>> add a simple helper for that
>>>>>
>>>>> huge_anon_orders_never
>>>>
>>>> I followed Lorenzo's suggestion to simplify the logic. Does that look
>>>> more readable?
>>>>
>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>> index 2f190c90192d..3087ac7631e0 100644
>>>> --- a/include/linux/huge_mm.h
>>>> +++ b/include/linux/huge_mm.h
>>>> @@ -265,6 +265,43 @@ unsigned long __thp_vma_allowable_orders(struct
>>>> vm_area_struct *vma,
>>>>                                             unsigned long tva_flags,
>>>>                                             unsigned long orders);
>>>>
>>>> +/* Strictly mask requested anonymous orders according to sysfs
>>>> settings. */
>>>> +static inline unsigned long __thp_mask_anon_orders(unsigned long
>>>> vm_flags,
>>>> +                               unsigned long tva_flags, unsigned long
>>>> orders)
>>>> +{
>>>> +       unsigned long always = READ_ONCE(huge_anon_orders_always);
>>>> +       unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>>>> +       unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
>>>> +       bool inherit_enabled = hugepage_global_enabled();
>>>> +       bool has_madvise =  vm_flags & VM_HUGEPAGE;
>>>> +       unsigned long mask = always | madvise;
>>>> +
>>>> +       mask = always | madvise;
>>>> +       if (inherit_enabled)
>>>> +               mask |= inherit;
>>>> +
>>>> +       /* All set to/inherit NEVER - never means never globally,
>>>> abort. */
>>>> +       if (!(mask & orders))
>>>> +               return 0;
>>>
>>> Still confusing. I am not sure if we would properly catch when someone
>>> specifies e.g., 2M and 1M, while we only have 2M disabled.
>>
>> IIUC, Yes. In your case, we will only allow order 8 (1M mTHP).
>>
>>> I would rewrite the function to only ever substract from "orders".
>>>
>>> ...
>>>
>>> /* Disallow orders that are set to NEVER directly ... */
>>> order &= (always | madvise | inherit);
>>>
>>> /* ... or through inheritance. */
>>> if (inherit_enabled)
>>>       orders &= ~inherit;
>>
>> Sorry, I didn't get you here.
>>
>> If orders = THP_ORDERS_ALL_ANON, inherit = 0x200 (order 9), always and
>> madvise are 0, and inherit_enabled = true. Then orders will be 0 with
>> your logic. But we should allow order 9, right?
> 
> Yeah, all confusing, because the temporary variables don't help.
> 
> if (!inherit_enabled)
> 
> or simply
> 
> if (!hugepage_global_enabled();)
> 
> Let me try again below.
> 
>>
>>>
>>> /*
>>>    * Otherwise, we only enforce sysfs settings if asked. In addition,
>>>    * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
>>>    * is not set, we don't bother checking whether the VMA has 
>>> VM_HUGEPAGE
>>>    * set.
>>>    */
>>> if (!orders || !(tva_flags & TVA_ENFORCE_SYSFS))
>>>       return orders;
>>>
>>>> +
>>>> +       /*
>>>> +        * Otherwise, we only enforce sysfs settings if asked. In
>>>> addition,
>>>> +        * if the user sets a sysfs mode of madvise and if
>>>> TVA_ENFORCE_SYSFS
>>>> +        * is not set, we don't bother checking whether the VMA has
>>>> VM_HUGEPAGE
>>>> +        * set.
>>>> +        */
>>>> +       if (!(tva_flags & TVA_ENFORCE_SYSFS))
>>>> +               return orders;
>>>> +
>>>> +       mask = always;
>>>> +       if (has_madvise)
>>>> +               mask |= madvise;
>>>> +       if (hugepage_global_always() || (has_madvise && 
>>>> inherit_enabled))
>>>> +               mask |= inherit;
>>>
>>> Similarly, this can maybe become (not 100% sure if I got it right, the
>>> condition above is confusing)
>>
>> IMO, this is the original logic.
> 
> Yeah, and it's absolutely confusing stuff.
> 
> Let me try again by only clearing flags. Maybe this would be clearer?
> (and correct? still confused why the latter part is so complicated in 
> existing
> code)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 8b8f353cc7b81..66fdfe06e4996 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -265,6 +265,42 @@ unsigned long __thp_vma_allowable_orders(struct 
> vm_area_struct *vma,
>                                           unsigned long tva_flags,
>                                           unsigned long orders);
> 
> +/* Strictly mask requested anonymous orders according to sysfs 
> settings. */
> +static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> +       unsigned long tva_flags, unsigned long orders)
> +{
> +       const unsigned long always = READ_ONCE(huge_anon_orders_always);
> +       const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> +       const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> +       const unsigned long never = ~(always | madvise | inherit);
> +
> +       /* Disallow orders that are set to NEVER directly ... */
> +       orders &= ~never;
> +
> +       /* ... or through inheritance (global == NEVER). */
> +       if (!hugepage_global_enabled())
> +               orders &= ~inherit;
> +
> +       /*
> +        * Otherwise, we only enforce sysfs settings if asked. In addition,
> +        * if the user sets a sysfs mode of madvise and if 
> TVA_ENFORCE_SYSFS
> +        * is not set, we don't bother checking whether the VMA has 
> VM_HUGEPAGE
> +        * set.
> +        */
> +       if (!(tva_flags & TVA_ENFORCE_SYSFS))
> +               return orders;
> +
> +       if (!(vm_flags & VM_HUGEPAGE)) {
> +               /* Disallow orders that are set to MADVISE directly ... */
> +               orders &= ~madvise;
> +
> +               /* ... or through inheritance (global == MADVISE). */
> +               if (!hugepage_global_always())
> +                       orders &= ~inherit;

Seems we can drop this 'inherit' check, cause if 
!hugepage_global_enabled() == true, which always means 
!hugepage_global_always() is true.

> +       }
> +       return orders;
> +}

Otherwise look good to me.

> +
>   /**
>    * thp_vma_allowable_orders - determine hugepage orders that are 
> allowed for vma
>    * @vma:  the vm area to check
> @@ -287,16 +323,8 @@ unsigned long thp_vma_allowable_orders(struct 
> vm_area_struct *vma,
>                                         unsigned long orders)
>   {
>          /* Optimization to check if required orders are enabled early. */
> -       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> -               unsigned long mask = READ_ONCE(huge_anon_orders_always);
> -
> -               if (vm_flags & VM_HUGEPAGE)
> -                       mask |= READ_ONCE(huge_anon_orders_madvise);
> -               if (hugepage_global_always() ||
> -                   ((vm_flags & VM_HUGEPAGE) && 
> hugepage_global_enabled()))
> -                       mask |= READ_ONCE(huge_anon_orders_inherit);
> -
> -               orders &= mask;
> +       if (vma_is_anonymous(vma)) {
> +               orders = __thp_mask_anon_orders(vm_flags, tva_flags, 
> orders);
>                  if (!orders)
>                          return 0;
>          }
> 
> 
