Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBF71DF75A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749718368; cv=none; b=Ew/6gQlQDWfyu6YV9rX70ck6Q6jaOmIHDlSJogWW2k1lLmo98sBIRu8VJMqATxjRUnFH4TyC3QA8ncHZUYtkT6NOAurWDM9nKDLDKpieTGX4Vo7TKHcZlMlMOiTXLk5rrcp3sKkpMBeJOEQNpm44ftsuc1NouX6mH0DjTl/xVAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749718368; c=relaxed/simple;
	bh=D46nlPeDtjnrZlnkFIjZaIkSj3ebLCF335zLybUCICo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1FFf7GT1wzGV7MBoULs9PAF3HJtSYOeF5cAjvQui7wZ5y39HfMwdoYUGkGZ2HHZt3x598gwXHOrkuUuU6ctgCVrLCVCDj7hs52/hq9BpwQ1cEm+5b0enx/axuxtxxPDyZhO/f4XJatVHR/kHetuofJBVGEN6Q8jcntwGq+Sctk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AL9tPpRE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AL9tPpRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749718365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XJuvG2JJZRiHxpRJjWPMD39SwnDPt0ynaH02llGXsIg=;
	b=AL9tPpREc/0+3bgtscLo6mV8UOIkGv5pXLHKBLlM13Zjwq3mv55sUf6vxm3A+UIjLkNCyp
	UjU+zUt/mQJqfC1784AUAnwPSe2ZSmTTUQy33eBg6xa0c0UG9f+g7wJKCGjb6ng0DQhgzh
	qjH3v/dnTOjDgI0P/uyoKL8y/JDYAow=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-wIUqlRa-NXG4zv_hYB1FEA-1; Thu, 12 Jun 2025 04:52:44 -0400
X-MC-Unique: wIUqlRa-NXG4zv_hYB1FEA-1
X-Mimecast-MFC-AGG-ID: wIUqlRa-NXG4zv_hYB1FEA_1749718363
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530c186394so2397345e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749718363; x=1750323163;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XJuvG2JJZRiHxpRJjWPMD39SwnDPt0ynaH02llGXsIg=;
        b=mZTFHAJewLljGP8mqg+JH4EPdUyuo1Ea9YhDgHVWwZxlk43jF3e2rgxvLcOm0DBrkH
         aatP/tzmw/gUNojBFRBuIxdUQTRl8K+4/DHYSZkLG8xO2KkKE5pWDOw0K4p1uolCiwkk
         VITqzfDMkplSziuh8qcmU+VavvPtQulg6dvSL5BxPrXk4slgGtYjI8nuaXZ7EsJv1PIL
         v6fkpAPlJpmSn0WIsd9RXqLimALjRb+UZkEpYNYwFkPv7xAJzTq3+DgZcOM+ikQ+MoZc
         otzqdo9YlETdJDwamPchWauIPkEuZzL8nG1GcJ+xUG+GjJO3184ZC0s69jp9Z+/h36OD
         hRrA==
X-Forwarded-Encrypted: i=1; AJvYcCXAw3m/kK75YM7ej7nmdYsXtRz7zBVryzyk6bF9bFjKYsAowJ+BHZGlNVrVcKM0CzzjsPSvOYgw+iO77to=@vger.kernel.org
X-Gm-Message-State: AOJu0YymazePHjZa88yuoAq7lzPqpFplHlzt1co/ktdIjEjedsHa5vbU
	A2lhLxCRRGMlWy08P7XpgLbHLBMWoCSXWKF5OZJza/cGmdpnJ7gGj61cCh2adiQJ24qg8C7WEBd
	G0EQKvzI5Vv3uUIlKfYfhwmew0TNYUOhKGjBwjmrrWBdgeO+X2KpYZxcVCWBXCizZWA==
X-Gm-Gg: ASbGncs5C4i2gi4D1IoM3eN8yqLL9kM70Z8SW0JwM+xDm3II+dt7zS9OdopLvPpzyyZ
	uIXcVTBxMrQYRHAOvzGgkh43e89sEOD+JmxpHqdzaNwwd/kbYLG75JdrJu7B9fbMs40puMHo8DA
	7ihBzY0JDIh/aCpvyu6dbpBs6BIh8xBAeFtSAwXUUeu+ujWLl2btXrHc4FxV52/eJuqCdWFVAnM
	taLpGdSQMvh3gZwLlGnsFnoOiHZWUgWyEH+CDmwnsnmouPvzKaEuSRCiQ1OShjxmPWVHxLb7pKF
	5rVlSqO1cQWQKFoyiWeCihV0R1vImA1J56J4vrmqoJ4i++m+brAMMq5SlXMuWDi6TQdmkmUvA6d
	0KkwMjITXEPtas4pkKJdJU+35ezGIqKZZTOml++Tl4bZHYpJR7A==
X-Received: by 2002:a05:600c:a414:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-4532c12f9c9mr23458815e9.3.1749718362969;
        Thu, 12 Jun 2025 01:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE0UUZO5fe73LnEJW9DyXc3CItxnfe3KlSS5UEV4EfLKbabjV+SyYwjLpst9ExqQ+P0ZohAQ==
X-Received: by 2002:a05:600c:a414:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-4532c12f9c9mr23458505e9.3.1749718362504;
        Thu, 12 Jun 2025 01:52:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:1e00:1e1e:7a32:e798:6457? (p200300d82f2c1e001e1e7a32e7986457.dip0.t-ipconnect.de. [2003:d8:2f2c:1e00:1e1e:7a32:e798:6457])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2446b0sm13430145e9.21.2025.06.12.01.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 01:52:42 -0700 (PDT)
Message-ID: <aa6db5d0-2cc0-4749-88ad-874fed0a168c@redhat.com>
Date: Thu, 12 Jun 2025 10:52:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Dev Jain <dev.jain@arm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 akpm@linux-foundation.org, hughd@google.com
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
 <40d859c8-f083-4b25-8785-c1023da1c6d8@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <40d859c8-f083-4b25-8785-c1023da1c6d8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12.06.25 10:46, Dev Jain wrote:
> 
> On 12/06/25 1:21 pm, Baolin Wang wrote:
>>
>>
>> On 2025/6/11 20:34, David Hildenbrand wrote:
>>> On 05.06.25 10:00, Baolin Wang wrote:
>>>> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs
>>>> settings, which
>>>> means that even though we have disabled the Anon THP configuration,
>>>> MADV_COLLAPSE
>>>> will still attempt to collapse into a Anon THP. This violates the
>>>> rule we have
>>>> agreed upon: never means never.
>>>>
>>>> Another rule for madvise, referring to David's suggestion: “allowing
>>>> for collapsing
>>>> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>>>
>>>> To address this issue, should check whether the Anon THP
>>>> configuration is disabled
>>>> in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag
>>>> is set.
>>>>
>>>> In summary, the current strategy is:
>>>>
>>>> 1. If always & orders == 0, and madvise & orders == 0, and
>>>> hugepage_global_enabled() == false
>>>> (global THP settings are not enabled), it means mTHP of that orders
>>>> are prohibited
>>>> from being used, then madvise_collapse() is forbidden for that orders.
>>>>
>>>> 2. If always & orders == 0, and madvise & orders == 0, and
>>>> hugepage_global_enabled() == true
>>>> (global THP settings are enabled), and inherit & orders == 0, it
>>>> means mTHP of that
>>>> orders are still prohibited from being used, thus madvise_collapse()
>>>> is not allowed
>>>> for that orders.
>>>>
>>>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> ---
>>>>    include/linux/huge_mm.h | 23 +++++++++++++++++++----
>>>>    1 file changed, 19 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>> index 2f190c90192d..199ddc9f04a1 100644
>>>> --- a/include/linux/huge_mm.h
>>>> +++ b/include/linux/huge_mm.h
>>>> @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct
>>>> vm_area_struct *vma,
>>>>                           unsigned long orders)
>>>>    {
>>>>        /* Optimization to check if required orders are enabled early. */
>>>> -    if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
>>>> -        unsigned long mask = READ_ONCE(huge_anon_orders_always);
>>>> +    if (vma_is_anonymous(vma)) {
>>>> +        unsigned long always = READ_ONCE(huge_anon_orders_always);
>>>> +        unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>>>> +        unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
>>>> +        unsigned long mask = always | madvise;
>>>> +
>>>> +        /*
>>>> +         * If the system-wide THP/mTHP sysfs settings are disabled,
>>>> +         * then we should never allow hugepages.
>>>   > +         */> +        if (!(mask & orders) &&
>>> !(hugepage_global_enabled() && (inherit & orders)))
>>>> +            return 0;
>>>
>>> I'm still trying to digest that. Isn't there a way for us to work
>>> with the orders,
>>> essentially masking off all orders that are forbidden globally.
>>> Similar to below, if !orders, then return 0?
>>> /* Orders disabled directly. */
>>> orders &= ~TODO;
>>> /* Orders disabled by inheriting from the global toggle. */
>>> if (!hugepage_global_enabled())
>>>       orders &= ~READ_ONCE(huge_anon_orders_inherit);
>>>
>>> TODO is probably a -1ULL and then clearing always/madvise/inherit.
>>> Could add a simple helper for that
>>>
>>> huge_anon_orders_never
>>
>> I followed Lorenzo's suggestion to simplify the logic. Does that look
>> more readable?
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index 2f190c90192d..3087ac7631e0 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -265,6 +265,43 @@ unsigned long __thp_vma_allowable_orders(struct
>> vm_area_struct *vma,
>>                                           unsigned long tva_flags,
>>                                           unsigned long orders);
>>
>> +/* Strictly mask requested anonymous orders according to sysfs
>> settings. */
>> +static inline unsigned long __thp_mask_anon_orders(unsigned long
>> vm_flags,
>> +                               unsigned long tva_flags, unsigned long
>> orders)
>> +{
>> +       unsigned long always = READ_ONCE(huge_anon_orders_always);
>> +       unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>> +       unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
>> +       bool inherit_enabled = hugepage_global_enabled();
>> +       bool has_madvise =  vm_flags & VM_HUGEPAGE;
> 
> Let us name this honour_madvise to indicate that this VMA must honour
> the madvise setting.

Not clear, because there is also "VM_NOHUGEPAGE" :/

See my reply where we maybe (if I got it right) only need a single check 
and can just avoid a confusing temporary variable completely.

-- 
Cheers,

David / dhildenb

