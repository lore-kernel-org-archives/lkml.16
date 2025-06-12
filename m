Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6608190072
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733545; cv=none; b=KbfsimoIGDgCs5Fi4hYU9JLsUpJkHuNs95h/dXo40jjAMAxlP8orHTCqoO8HDsGC8T87+rregH3hM+BSwqTKocpTAAAi8YcW/hbKxIn8XzmGNIrejcgCf33oX6Z95aY4FGR+1EWI4ES4AFx87/gQGjTceeRpPNNjOwmMoclsf3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733545; c=relaxed/simple;
	bh=4dcZsOAzUQ/CNRFjk/4cAKVjL6hkw8L6SdO9QU8j5eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxSNsuYmRHf0muYv+k3F7yDztsOCah7Cm6NgAbcknJiVIfUYtVLVR1mEAXN4714SBNcbVZAj5FyV37uTJNfKIndNqUu5zcCxzz6Yw3wn95agL5Y5TPByah7//xRM2+EEMZB2BvOc7IFmZDTnF2czKBKfd4QqRcRjTZOnmfBWAiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VqVKqTMO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VqVKqTMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749733541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=an+AHaAvorhiXBH2m6LdsoEExCa3n4KeZvN2G/vFq58=;
	b=VqVKqTMOAo8BFQgcsPJtEtHNElsnloVe10j/n3cPOUm2sF1ciOdMPqwbr8fsbWfkVovPzF
	rzMQQS+Nea3j3hCOppDEGCB6tzSCeIB2HldaFo/5Qe8XByQDAbyTIfphJbl8lZK0F4CXQV
	p2cb5Kwj/Hz410rju/Kiy67ZOnmXDcA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-39fjNfwrMvOMNOdwdrD9wg-1; Thu, 12 Jun 2025 09:05:40 -0400
X-MC-Unique: 39fjNfwrMvOMNOdwdrD9wg-1
X-Mimecast-MFC-AGG-ID: 39fjNfwrMvOMNOdwdrD9wg_1749733539
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d290d542so5206835e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749733539; x=1750338339;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=an+AHaAvorhiXBH2m6LdsoEExCa3n4KeZvN2G/vFq58=;
        b=RXttUgc1s2xCtoNyJ5xgndbnnP5I5BKZOyYtcg8qIyR+PwocA9ATK+gk9e/cB10vt+
         898ChZ3LFN8Ca1f8Htb8U7x7KTVEtE5rZH3Lw+ZiJk6W+j/GgxIP/ZbfXKYAn31rYpGm
         pe8TAhc2WGTAZHkwlNZ+j/vQyRAAx0xH8HOD6e9AWmhp5662edJXBb0SeKlt25JLzTmz
         GE8Xjt4jRrVKcsRWOfhFHioEzZxBwsuqFOCFyx32SvPwiDcRT57zZ0MBdrsGrdsk1e16
         p0Z7zXFm31/OuJoLohy4xDe3k4elqfMaHpjRb6PHtjjzuhlwLWvlK8bLTXbNUMI9070Y
         E51g==
X-Forwarded-Encrypted: i=1; AJvYcCWNfItO2ZKod17NxsKnES56g2gu/75O1UC6uO+bvFuszHAj6JComXxU5/xK2zM2zEtGhsqYFG5/vLfPZRE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2W/LyH0gG5VeEMyeQjko27o0JqG9Ka5HVrS7FGOeqSPAZ71Tj
	x+Uvv67xg9BFX3byKYDe7n5sWvIW8FneLafz2yQqQrqVjgqiV/dG+caCFMWMGkeqhp4n5PfsTV0
	W7alTIGAUupVH6EM5nlzUBGRXZr19A4/dvct11M6h9Z0RYe9rkjkoVyERT7Y13+Bu30Gmck+6F1
	dV
X-Gm-Gg: ASbGncuI6sLSP73vmFpSZB1EZER2Cr0VAlJL3xPenJt/NXz0cL5P88VuEuaDLjpL5F1
	xkoJR9AZRN3YRieYzI+tW0QcXZkMsW2HL8sE4WDCDx3iG+ODmqpEkHdiLSU9oncGobBicIP0wNW
	BGQ+f14HkOrdguwkQXFTVxUOnEULBCJ2W6+PsEaPKHX8v9nkfmN1yTIJen6Lgekc3h83w1GiNDu
	YnALLux1rz5Myf+6ofIKguXRzcV0J99K0BwCafLhKPbqEF0me4qhPj/rmWgDKwkR8wrVILPLyLp
	WoDFLPmThDyow5LBHFnrhymtcaDrXUoAMXhd5P11Toyg+QB2UImDzObumJBcA096BKBchIY5h3C
	dS9WdoJ2jMoJi+JgTgQzNJmMzIyCe86SRdilgDxvkDwqZ7Piz7w==
X-Received: by 2002:a05:600c:348f:b0:453:7bd:2e30 with SMTP id 5b1f17b1804b1-4532492a793mr65270765e9.29.1749733538782;
        Thu, 12 Jun 2025 06:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0oW2fIwZqhEqf/yjcw7H5yFJYtYGEwOiXskA3/0bc+0Pqg/lA6F5Qa2MDNFKwfIyS5rKQKw==
X-Received: by 2002:a05:600c:1c8d:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-4532f2d3993mr19756485e9.6.1749733524838;
        Thu, 12 Jun 2025 06:05:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:1e00:1e1e:7a32:e798:6457? (p200300d82f2c1e001e1e7a32e7986457.dip0.t-ipconnect.de. [2003:d8:2f2c:1e00:1e1e:7a32:e798:6457])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e195768sm20591155e9.0.2025.06.12.06.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:05:24 -0700 (PDT)
Message-ID: <b8fe659e-8a84-4328-b6d6-6116c616cb3d@redhat.com>
Date: Thu, 12 Jun 2025 15:05:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <97a67b74-d473-455e-a05e-c85fe45da008@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12.06.25 14:45, Baolin Wang wrote:
> 
> 
> On 2025/6/12 16:51, David Hildenbrand wrote:
>> On 12.06.25 09:51, Baolin Wang wrote:
>>>
>>>
>>> On 2025/6/11 20:34, David Hildenbrand wrote:
>>>> On 05.06.25 10:00, Baolin Wang wrote:
>>>>> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings,
>>>>> which
>>>>> means that even though we have disabled the Anon THP configuration,
>>>>> MADV_COLLAPSE
>>>>> will still attempt to collapse into a Anon THP. This violates the rule
>>>>> we have
>>>>> agreed upon: never means never.
>>>>>
>>>>> Another rule for madvise, referring to David's suggestion: “allowing
>>>>> for collapsing
>>>>> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>>>>
>>>>> To address this issue, should check whether the Anon THP configuration
>>>>> is disabled
>>>>> in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag is
>>>>> set.
>>>>>
>>>>> In summary, the current strategy is:
>>>>>
>>>>> 1. If always & orders == 0, and madvise & orders == 0, and
>>>>> hugepage_global_enabled() == false
>>>>> (global THP settings are not enabled), it means mTHP of that orders
>>>>> are prohibited
>>>>> from being used, then madvise_collapse() is forbidden for that orders.
>>>>>
>>>>> 2. If always & orders == 0, and madvise & orders == 0, and
>>>>> hugepage_global_enabled() == true
>>>>> (global THP settings are enabled), and inherit & orders == 0, it means
>>>>> mTHP of that
>>>>> orders are still prohibited from being used, thus madvise_collapse()
>>>>> is not allowed
>>>>> for that orders.
>>>>>
>>>>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>> ---
>>>>>     include/linux/huge_mm.h | 23 +++++++++++++++++++----
>>>>>     1 file changed, 19 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>>> index 2f190c90192d..199ddc9f04a1 100644
>>>>> --- a/include/linux/huge_mm.h
>>>>> +++ b/include/linux/huge_mm.h
>>>>> @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct
>>>>> vm_area_struct *vma,
>>>>>                            unsigned long orders)
>>>>>     {
>>>>>         /* Optimization to check if required orders are enabled
>>>>> early. */
>>>>> -    if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
>>>>> -        unsigned long mask = READ_ONCE(huge_anon_orders_always);
>>>>> +    if (vma_is_anonymous(vma)) {
>>>>> +        unsigned long always = READ_ONCE(huge_anon_orders_always);
>>>>> +        unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>>>>> +        unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
>>>>> +        unsigned long mask = always | madvise;
>>>>> +
>>>>> +        /*
>>>>> +         * If the system-wide THP/mTHP sysfs settings are disabled,
>>>>> +         * then we should never allow hugepages.
>>>>    > +         */> +        if (!(mask & orders) &&
>>>> !(hugepage_global_enabled() && (inherit & orders)))
>>>>> +            return 0;
>>>>
>>>> I'm still trying to digest that. Isn't there a way for us to work with
>>>> the orders,
>>>> essentially masking off all orders that are forbidden globally. Similar
>>>> to below, if !orders, then return 0?
>>>> /* Orders disabled directly. */
>>>> orders &= ~TODO;
>>>> /* Orders disabled by inheriting from the global toggle. */
>>>> if (!hugepage_global_enabled())
>>>>        orders &= ~READ_ONCE(huge_anon_orders_inherit);
>>>>
>>>> TODO is probably a -1ULL and then clearing always/madvise/inherit. Could
>>>> add a simple helper for that
>>>>
>>>> huge_anon_orders_never
>>>
>>> I followed Lorenzo's suggestion to simplify the logic. Does that look
>>> more readable?
>>>
>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>> index 2f190c90192d..3087ac7631e0 100644
>>> --- a/include/linux/huge_mm.h
>>> +++ b/include/linux/huge_mm.h
>>> @@ -265,6 +265,43 @@ unsigned long __thp_vma_allowable_orders(struct
>>> vm_area_struct *vma,
>>>                                             unsigned long tva_flags,
>>>                                             unsigned long orders);
>>>
>>> +/* Strictly mask requested anonymous orders according to sysfs
>>> settings. */
>>> +static inline unsigned long __thp_mask_anon_orders(unsigned long
>>> vm_flags,
>>> +                               unsigned long tva_flags, unsigned long
>>> orders)
>>> +{
>>> +       unsigned long always = READ_ONCE(huge_anon_orders_always);
>>> +       unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>>> +       unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
>>> +       bool inherit_enabled = hugepage_global_enabled();
>>> +       bool has_madvise =  vm_flags & VM_HUGEPAGE;
>>> +       unsigned long mask = always | madvise;
>>> +
>>> +       mask = always | madvise;
>>> +       if (inherit_enabled)
>>> +               mask |= inherit;
>>> +
>>> +       /* All set to/inherit NEVER - never means never globally,
>>> abort. */
>>> +       if (!(mask & orders))
>>> +               return 0;
>>
>> Still confusing. I am not sure if we would properly catch when someone
>> specifies e.g., 2M and 1M, while we only have 2M disabled.
> 
> IIUC, Yes. In your case, we will only allow order 8 (1M mTHP).
> 
>> I would rewrite the function to only ever substract from "orders".
>>
>> ...
>>
>> /* Disallow orders that are set to NEVER directly ... */
>> order &= (always | madvise | inherit);
>>
>> /* ... or through inheritance. */
>> if (inherit_enabled)
>>       orders &= ~inherit;
> 
> Sorry, I didn't get you here.
> 
> If orders = THP_ORDERS_ALL_ANON, inherit = 0x200 (order 9), always and
> madvise are 0, and inherit_enabled = true. Then orders will be 0 with
> your logic. But we should allow order 9, right?

Yeah, all confusing, because the temporary variables don't help.

if (!inherit_enabled)

or simply

if (!hugepage_global_enabled();)

Let me try again below.

> 
>>
>> /*
>>    * Otherwise, we only enforce sysfs settings if asked. In addition,
>>    * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
>>    * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
>>    * set.
>>    */
>> if (!orders || !(tva_flags & TVA_ENFORCE_SYSFS))
>>       return orders;
>>
>>> +
>>> +       /*
>>> +        * Otherwise, we only enforce sysfs settings if asked. In
>>> addition,
>>> +        * if the user sets a sysfs mode of madvise and if
>>> TVA_ENFORCE_SYSFS
>>> +        * is not set, we don't bother checking whether the VMA has
>>> VM_HUGEPAGE
>>> +        * set.
>>> +        */
>>> +       if (!(tva_flags & TVA_ENFORCE_SYSFS))
>>> +               return orders;
>>> +
>>> +       mask = always;
>>> +       if (has_madvise)
>>> +               mask |= madvise;
>>> +       if (hugepage_global_always() || (has_madvise && inherit_enabled))
>>> +               mask |= inherit;
>>
>> Similarly, this can maybe become (not 100% sure if I got it right, the
>> condition above is confusing)
> 
> IMO, this is the original logic.

Yeah, and it's absolutely confusing stuff.

Let me try again by only clearing flags. Maybe this would be clearer?
(and correct? still confused why the latter part is so complicated in existing
code)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 8b8f353cc7b81..66fdfe06e4996 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -265,6 +265,42 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
                                          unsigned long tva_flags,
                                          unsigned long orders);
  
+/* Strictly mask requested anonymous orders according to sysfs settings. */
+static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
+       unsigned long tva_flags, unsigned long orders)
+{
+       const unsigned long always = READ_ONCE(huge_anon_orders_always);
+       const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
+       const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
+       const unsigned long never = ~(always | madvise | inherit);
+
+       /* Disallow orders that are set to NEVER directly ... */
+       orders &= ~never;
+
+       /* ... or through inheritance (global == NEVER). */
+       if (!hugepage_global_enabled())
+               orders &= ~inherit;
+
+       /*
+        * Otherwise, we only enforce sysfs settings if asked. In addition,
+        * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
+        * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
+        * set.
+        */
+       if (!(tva_flags & TVA_ENFORCE_SYSFS))
+               return orders;
+
+       if (!(vm_flags & VM_HUGEPAGE)) {
+               /* Disallow orders that are set to MADVISE directly ... */
+               orders &= ~madvise;
+
+               /* ... or through inheritance (global == MADVISE). */
+               if (!hugepage_global_always())
+                       orders &= ~inherit;
+       }
+       return orders;
+}
+
  /**
   * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
   * @vma:  the vm area to check
@@ -287,16 +323,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
                                        unsigned long orders)
  {
         /* Optimization to check if required orders are enabled early. */
-       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
-               unsigned long mask = READ_ONCE(huge_anon_orders_always);
-
-               if (vm_flags & VM_HUGEPAGE)
-                       mask |= READ_ONCE(huge_anon_orders_madvise);
-               if (hugepage_global_always() ||
-                   ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
-                       mask |= READ_ONCE(huge_anon_orders_inherit);
-
-               orders &= mask;
+       if (vma_is_anonymous(vma)) {
+               orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
                 if (!orders)
                         return 0;
         }


-- 
Cheers,

David / dhildenb

