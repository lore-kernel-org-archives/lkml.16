Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7100C19007D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734008; cv=none; b=by95KRF1go0RxEf+08ElrT9x+XD/Sq2rOH84GwX1mc3gw7rKn7vaUutpBWJZjBWXfsM7LaX0seiF0U6berGwt6LsF8cnBiBUot3QLTtg+4wlSruYutlJ/sPs1fdPxfX095VBULPKy+lvuQ/ujAsznyHb1CPvJM3Yiijzmh4xtMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734008; c=relaxed/simple;
	bh=4iUAldqcjEUcynuRPrZh5QAQPGfP1p0lTqWUkJ7Yp/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=puSx/uKz/0bwDrp8rgYa2203BXWEY+kMp49k6LB45oqgIaaCJnI1IKbDAX7dcQV/xfUIC0tgV6yw9Zu2bTox38GM2LevGMuqUnCWAZNyaUyYbbqDFSf0jTtD9Ew3b7hPBitg0M2MPRb3n78shfo9eVkk8CeuaUlY+GtzunNc/yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fcI8QlWk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fcI8QlWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749734005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=doGApCfuzN9zuT6dgCoqzdNZcDtX0mj/1DflOCrs5dY=;
	b=fcI8QlWkXL57rnAtPewqX2E53d+20DMuy4WdKGLhQNukIHZBdmLfNGV+WRUQijohHrOz/a
	8zrFKF7VkM/8DSkrmiQi9AzHqcuETrJ+PkxWlTxm4vA9WwZa4lLFswj7mmjg9vQZ+UOOdG
	pWhMN+vTyMtMt64ZS0LGveAQ5jka87o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-eGBvWXDCOQSSU1iGQDwivQ-1; Thu, 12 Jun 2025 09:13:23 -0400
X-MC-Unique: eGBvWXDCOQSSU1iGQDwivQ-1
X-Mimecast-MFC-AGG-ID: eGBvWXDCOQSSU1iGQDwivQ_1749734002
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a50049f8eeso484501f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734002; x=1750338802;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=doGApCfuzN9zuT6dgCoqzdNZcDtX0mj/1DflOCrs5dY=;
        b=KVfssrw9KxtGa95sJqh8/SvzYCWQeBAirR2Zhcq+sPWuIKY0u0IonXpbXSMbnkJZuu
         LC+xQ2tJ7Mtkd/bscV9GAEWJpp5zGiVgjy2DGs5xRkGY6WatPJ2TlW86z1z75u8xpJLz
         iR8dO8JcbRl21flX8LXRm2aYOQbZuEoWHP9e3xLt3Tiscx73NfT44phqMLpcSMxCXwhb
         yPjucJjkIMjQowcvIrKlAWxXv2LG3n0nE4r9evUdt9bXqoXpCaTcZNi7Ys5SCI+1yiWm
         d+aAj2UHimthDjdgJ7ulb6IXLiTQ0d8Omu6bBVy93Iu/18sI/J2q7fa+kLUQxUJNsfa3
         j0sw==
X-Forwarded-Encrypted: i=1; AJvYcCXKn6+zJ+6fJibyCEaiYspsXCFNHIvFxpvh0fhOVeIBk5HS8qnb/I3DXJzRxLH5jDRnC/oV7Z/4G3HMIpA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzya8KKwTX6yPendruyl7X6gN0rATaan8cYOQipeDW0Sfmzxr9e
	jo84MXd8JcrPm9nZSpchRWk/jj5FAf5fNST0iduJt0FbGaZBnLV0A7ekion6Kz0WaAOBrQVD4Mx
	K8YkVGnS+eHN9KUlnisCOHeZLD7Yu5n0cUyXoDUCKu7MDRpsFjyEEDiQ7ltUazsrGqg==
X-Gm-Gg: ASbGncusBO6dt3cG8026U8JGxxwo7SJQDQUR8viKhzM3zxZcjBeyd8Z+9nbR+D9hlnX
	yNRX5ZhMOpIhkNw3RnwXVvs2O1Zus/t8hPiM59AEkZ8Cww2tRqyTURMKi1ow+7AK4x2P/z9CDzu
	0jFwYo6vSXyZtRFw59S5m1WMZyvgQ3VMSUD9aqKpHS2ScytOXigYI5Syw+eMpwnihQISb6pV3d+
	+Diei2CKYTJLhKg13UFhVp+v93us8r4NMhsLI+jqKIQdKd5CDB8Ox7Zlx/t3b8o17szYTyFNB2D
	7o2BC0PfDWNBSdQLvGSedtPLsc4D0jPEuBEdhEjj9ngLSMV5+qz3Gy9x5vEY3WrvT0267w3TjXM
	jvW/0exOyyZqRxDVfL6YaRJym+Ufdaqy9HAFUITSm4PsMrIhtig==
X-Received: by 2002:a05:6000:1acc:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3a56078232cmr3475185f8f.53.1749734002248;
        Thu, 12 Jun 2025 06:13:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/GEeX1MhfNFuJGizXhPgS93Fpg4t5jWtBsPn3LlYKpQl7fMIZ5s2DtNJvHLjMNgF58ZU26Q==
X-Received: by 2002:a05:6000:1acc:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3a56078232cmr3475136f8f.53.1749734001630;
        Thu, 12 Jun 2025 06:13:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:1e00:1e1e:7a32:e798:6457? (p200300d82f2c1e001e1e7a32e7986457.dip0.t-ipconnect.de. [2003:d8:2f2c:1e00:1e1e:7a32:e798:6457])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e241b70sm20210105e9.18.2025.06.12.06.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:13:20 -0700 (PDT)
Message-ID: <e80f8d1c-888b-4d39-a00c-5b92ee339715@redhat.com>
Date: Thu, 12 Jun 2025 15:13:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
 <953596b2-8749-493d-97eb-a5d8995d9ef8@redhat.com>
 <3a3f6f69-f0f4-41a0-b960-e76423fb6dc9@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <3a3f6f69-f0f4-41a0-b960-e76423fb6dc9@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12.06.25 15:07, Lorenzo Stoakes wrote:
> On Thu, Jun 12, 2025 at 10:51:17AM +0200, David Hildenbrand wrote:
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
>>>>>     include/linux/huge_mm.h | 23 +++++++++++++++++++----
>>>>>     1 file changed, 19 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>>> index 2f190c90192d..199ddc9f04a1 100644
>>>>> --- a/include/linux/huge_mm.h
>>>>> +++ b/include/linux/huge_mm.h
>>>>> @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct
>>>>> vm_area_struct *vma,
>>>>>                            unsigned long orders)
>>>>>     {
>>>>>         /* Optimization to check if required orders are enabled early. */
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
>>>>    > +         */> +        if (!(mask & orders) &&
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
>>>>        orders &= ~READ_ONCE(huge_anon_orders_inherit);
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
>>>                                             unsigned long tva_flags,
>>>                                             unsigned long orders);
>>>
>>> +/* Strictly mask requested anonymous orders according to sysfs settings. */
>>> +static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
>>> +                               unsigned long tva_flags, unsigned long
>>> orders)
>>> +{
>>> +       unsigned long always = READ_ONCE(huge_anon_orders_always);
>>> +       unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>>> +       unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
>>> +       bool inherit_enabled = hugepage_global_enabled();
>>> +       bool has_madvise =  vm_flags & VM_HUGEPAGE;
>>> +       unsigned long mask = always | madvise;
>>> +
>>> +       mask = always | madvise;
>>> +       if (inherit_enabled)
>>> +               mask |= inherit;
>>> +
>>> +       /* All set to/inherit NEVER - never means never globally, abort. */
>>> +       if (!(mask & orders))
>>> +               return 0;
>>
>> Still confusing. I am not sure if we would properly catch when someone
>> specifies e.g., 2M and 1M, while we only have 2M disabled.
> 
> I did wonder if we should call 'orders' something like 'requested_orders'
> or something.
> 
> This check is always against the input orders which we might conceivably
> want.
> 
> For instance in madvise_collapse():
> 
> 	if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
> 		return -EINVAL;
> 
> I don't think, if it's only possible for PMD order collapse, and that is
> disabled, but mTHP 64 KB let's say is enabled, it'd be fine for
> MADV_COLLAPSE to succeed at the PMD order.
> 
> 
>>
>>
>> I would rewrite the function to only ever substract from "orders".
> 
> Hm.
> 
>>
>> ...
>>
>> /* Disallow orders that are set to NEVER directly ... */
>> order &= (always | madvise | inherit);
>         ^s
> 
> I think you mean (always | madvise) here.
> 
>>
>> /* ... or through inheritance. */
>> if (inherit_enabled)
>> 	orders &= ~inherit;
> 
> order & (inherit & ~inherit) is going to always be zero :)
> 
> So this should be
> 
> orders &= inherit.
> 
> The problem is, when you come to the next stage where you are done checking
> the 'are we in a NEVER situation regardless of TVA_ENFORCE_SYSFS' you've
> now corrupted orders.
> 
> Because you've included inherit even if !(tva_flags & TVA_ENFORCE_SYSFS).
> 
> And there's no way to recover that information.
> 
>>
>> /*
>>   * Otherwise, we only enforce sysfs settings if asked. In addition,
>>   * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
>>   * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
>>   * set.
>>   */
>> if (!orders || !(tva_flags & TVA_ENFORCE_SYSFS))
>> 	return orders;
> 
> I don't think this is much delta to what we have now.
> 
> I do wonder if we should return mask & orders here, actually, to account
> for the fact that, in theory, orders could set > PMD for
> !TVA_ENFORCE_SYSFS) (not currently the case).
> 
>>
>>> +
>>> +       /*
>>> +        * Otherwise, we only enforce sysfs settings if asked. In addition,
>>> +        * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
>>> +        * is not set, we don't bother checking whether the VMA has
>>> VM_HUGEPAGE
>>> +        * set.
>>> +        */
>>> +       if (!(tva_flags & TVA_ENFORCE_SYSFS))
>>> +               return orders;
>>> +
>>> +       mask = always;
>>> +       if (has_madvise)
>>> +               mask |= madvise;
>>> +       if (hugepage_global_always() || (has_madvise && inherit_enabled))
>>> +               mask |= inherit;
>>
>> Similarly, this can maybe become (not 100% sure if I got it right, the
>> condition above is confusing)
>>
>> if (!has_madvise) {
>> 	/*
>> 	 * Without VM_HUGEPAGE, only allow orders that are set to
>> 	 * ALWAYS directly ...
>> 	  */
>> 	order &= (always | inherit);
> 
> Obviously orders is corrupted at this point so this won't work, but I'm not
> sure this is right?
> 
> If no madvise, only then obey always/inherit? Hm?
> 
> 
>> 	/* ... or through inheritance. */
>> 	if (!hugepage_global_always())
>> 		orders &= ~inherit;
> 
> I'm not sure about this ~inherit again, that means we ignore inherit no?
> 
>> }
> 
> And we need a branch for madvise too no?
> 
> I think all of this is a _clear_ example of what a mess all this is.
> 
> I think we need a deeper refactor, but I think my suggested changes make at
> least what we have here less horrid to get through.
> 
> I think maybe a better refactoring that's in the spirit of this is:
> 
> if (has_madvise) {
> 	mask |= madvise;
> 	if (inherit_enabled)
> 		mask |= inherit;
> } else if (hugepage_global_always()) {
> 	mask |= inherit;
> }
> 
> What do you think?

The masks are just disgusting :(

While you were writing that reply, I just sent out something else. Not 
sure if that makes sense.

I'm having a hard time figuring out what we even want here in the 
existing code.

-- 
Cheers,

David / dhildenb

