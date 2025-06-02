Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93101B4232
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748881775; cv=none; b=V7nkS/0X5nGXvj9lIcskX9SOSdRA3txbijxoiJ5NBuq5vYlRjw+hww0lcKtr4c07EplaN7cgKxiUiBop3bxWGMLtxqeUH2ORnSrnueeGfRw4vI4i0RuIx3SMwUpmY3shKrI/stEYoFDuXi6yfftlVt56QhIXRiGXF/zuWv2goMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748881775; c=relaxed/simple;
	bh=3Qp8RP1VZ3QB3ThLwWuURapPqcg42doaA2CaVE1elVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7n23COrnAEwEkXVETU3/+p9vStZBgBNgz9BSmtv5t9WDg+y5N4/qgyC/l3IUpUTf5WJeVYlZa/pSZ8ALaxA/B+JHVD41tjk+Gw7ixjgTa7Ki6Dx7k0t/2MlnH5h0feCPeS+ML97lGgkOYJbVImhHs0EmWRNBW0sWAE5ehfKHQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JoTMYpdP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JoTMYpdP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748881772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ie+w3ym9ulSGkDYjAamLNn9Of2uw3OSLKpk6O/S+z5Y=;
	b=JoTMYpdPP7xKqP0xnXdVt83NW8lCmCvVrffRlPg4GtEKKC9OKAjIE/gEBPaTbO9Jlx3EBP
	gvmMXOUvmHpw0qZBnsmTmT2B8M/OVdgbDvZi0guC3xMrV/e5sIS2d4pT8t8e5cirbBcsX7
	/OG49c+rV/54oeFvpOZB1RdwbaEtQ4Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-18FwZZzvMFyCxOisbItsWg-1; Mon, 02 Jun 2025 12:29:29 -0400
X-MC-Unique: 18FwZZzvMFyCxOisbItsWg-1
X-Mimecast-MFC-AGG-ID: 18FwZZzvMFyCxOisbItsWg_1748881768
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450cb902173so20996135e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748881768; x=1749486568;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ie+w3ym9ulSGkDYjAamLNn9Of2uw3OSLKpk6O/S+z5Y=;
        b=biM0iEvkotGZItQK7vC1uJFYCDcYKX46NDn9VtA1To7t6MElySSj5nupIX6A1Eg5N8
         bNgY9fXifXbnn1VcqSPJx3qZzUD2TwbgpBPh26aKyF3YzdMGVRyEsMxfG9hY0lIQEHVG
         CRfDv9X01fTOTL++R/VVzMAcXtnM4ddElCZNa5hZ4pzqsrMACN2HhImeicv9Q4f8A6xx
         OfXzU5RxXPmQZa2eMrTrl947LlbCrA99cLmPQDzA7mxxsRb13TeUItr6r01vK/4ySzLJ
         jjK0u2U4GoN8rnBeBMapcEsdtDdXv/HzSII6GE7En6rRcd8H/GOoV9XyXgfIxTHRN+ea
         7f/w==
X-Forwarded-Encrypted: i=1; AJvYcCVFZjtAP40vhgf+QTCdqQh8Mg1RTEAkpS0QfBQgYQOgY0UhdLas68bmpb7bgbMbw2CIpVEoKKGkmpei1FA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGSlp/5vIQO/ei1IgqfXkjGOEizA85669SnHI2zEHTd88AU04K
	x4oB7E6AHSgiFsZz1GY/gbs6XtN2HUIzhh1Tm21BDkRa313N5bByVj2KvnT9M7xvEyQFBMm/lhC
	ztG8dDqgdFWQ546nWMlfILoL4ZQq5OmiKSWEIk3RVtZW6D4uHDAQzFPlkN9BwD7k3RQ==
X-Gm-Gg: ASbGnctQfRRlpm04CipcNPRVbhdC0eash2gJwRpbT40CAoZvhD3DYtfqMkrmVEIeyYP
	CDB3+RIwcpncBiR/9e6I8Rc0eJ7oYuyN/U2XJPU4vSAlVq9axCuxhO8wnEwi7NBpkQCSlXoc0q4
	N/uxNQULPyggFT4VOAjO9KGj1DdKJBuVyM6b5z4+R5+t0pEN6nJpOmkY5uMM/IFrba8hqA2XAgH
	EKQsb5HnkcVzTTbyAMAHo65w9EuZns3fzd9VpeCxFqffAWde5jMMaqInFEwNQuSK8ZKXcPUdOtm
	BG2xzZ8T1tlDitlchoRfCNkU3dB7eD5R8VTA/lK3Re1ppqbjoKU1HsufYqWu6c8U9E3z32e0t3S
	RKef6uKQSRcyxW12oU5FU2nsUVYVaakjZb8RCyTA=
X-Received: by 2002:a05:600c:6015:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-451e39945e9mr320785e9.12.1748881768256;
        Mon, 02 Jun 2025 09:29:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzcOWwGx0b2YopGyM9iIh0yPKWIGc3TJ+L2e5O9xXC/beLtokjfOyg5ABZEbIFP3YxCSaehQ==
X-Received: by 2002:a05:600c:6015:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-451e39945e9mr320605e9.12.1748881767864;
        Mon, 02 Jun 2025 09:29:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:a300:1c2c:f35e:e8e5:488e? (p200300d82f34a3001c2cf35ee8e5488e.dip0.t-ipconnect.de. [2003:d8:2f34:a300:1c2c:f35e:e8e5:488e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a0146sm15579852f8f.93.2025.06.02.09.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 09:29:27 -0700 (PDT)
Message-ID: <25f660fc-a510-4dac-8f9c-1ab55be0b3d5@redhat.com>
Date: Mon, 2 Jun 2025 18:29:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
To: Zi Yan <ziy@nvidia.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-7-ziy@nvidia.com>
 <ac7351c1-cffe-4da6-9397-f9421e53f59f@redhat.com>
 <8C1EFB3C-0F1C-46DE-878A-3546A86A141F@nvidia.com>
 <50da1626-5894-42ef-b3fd-935a331f14c4@redhat.com>
 <BA6A258B-04D4-48F3-BB47-1F1DDAA0BDED@nvidia.com>
 <e53ce3cd-86f4-4bf8-87f3-08b16e002378@redhat.com>
 <30A5DAFA-9594-46F3-8054-ADBA83C551C5@nvidia.com>
 <756e456c-225b-4686-a3e5-09ee6f76453e@redhat.com>
 <C778A657-4C37-4F8A-940E-3E73F03ED4D8@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <C778A657-4C37-4F8A-940E-3E73F03ED4D8@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.06.25 18:27, Zi Yan wrote:
> On 2 Jun 2025, at 12:25, David Hildenbrand wrote:
> 
>> On 02.06.25 16:18, Zi Yan wrote:
>>> On 30 May 2025, at 16:55, David Hildenbrand wrote:
>>>
>>>> On 30.05.25 22:46, Zi Yan wrote:
>>>>> On 30 May 2025, at 16:08, David Hildenbrand wrote:
>>>>>
>>>>>> On 30.05.25 21:58, Zi Yan wrote:
>>>>>>> On 30 May 2025, at 15:56, David Hildenbrand wrote:
>>>>>>>
>>>>>>>> On 30.05.25 18:22, Zi Yan wrote:
>>>>>>>>> migratetype is no longer overwritten during pageblock isolation,
>>>>>>>>> start_isolate_page_range(), has_unmovable_pages(), and
>>>>>>>>> set_migratetype_isolate() no longer need which migratetype to restore
>>>>>>>>> during isolation failure.
>>>>>>>>>
>>>>>>>>> For has_unmoable_pages(), it needs to know if the isolation is for CMA
>>>>>>>>> allocation, so adding CMA_ALLOCATION to provide the information. At the
>>>>>>>>> same time change isolation flags to enum pb_isolate_mode
>>>>>>>>> (PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
>>>>>>>>> PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
>>>>>>>>> MEMORY_OFFLINE instead, since only PB_ISOLATE_MODE_MEM_OFFLINE reports
>>>>>>>>> isolation failures.
>>>>>>>>>
>>>>>>>>> alloc_contig_range() no longer needs migratetype. Replace it with
>>>>>>>>> enum acr_flags_t to tell if an allocation is for CMA. So does
>>>>>>>>> __alloc_contig_migrate_range().
>>>>>>>>>
>>>>>>>>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>>>>>>>>> ---
>>>>>>>>>       drivers/virtio/virtio_mem.c    |  2 +-
>>>>>>>>>       include/linux/gfp.h            |  9 ++++-
>>>>>>>>>       include/linux/page-isolation.h | 20 ++++++++--
>>>>>>>>>       include/trace/events/kmem.h    | 14 ++++---
>>>>>>>>>       mm/cma.c                       |  2 +-
>>>>>>>>>       mm/memory_hotplug.c            |  6 +--
>>>>>>>>>       mm/page_alloc.c                | 27 ++++++-------
>>>>>>>>>       mm/page_isolation.c            | 70 +++++++++++++++-------------------
>>>>>>>>>       8 files changed, 82 insertions(+), 68 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
>>>>>>>>> index 56d0dbe62163..6bce70b139b2 100644
>>>>>>>>> --- a/drivers/virtio/virtio_mem.c
>>>>>>>>> +++ b/drivers/virtio/virtio_mem.c
>>>>>>>>> @@ -1243,7 +1243,7 @@ static int virtio_mem_fake_offline(struct virtio_mem *vm, unsigned long pfn,
>>>>>>>>>       		if (atomic_read(&vm->config_changed))
>>>>>>>>>       			return -EAGAIN;
>>>>>>>>>      -		rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
>>>>>>>>> +		rc = alloc_contig_range(pfn, pfn + nr_pages, ACR_OTHER,
>>>>>>>>>       					GFP_KERNEL);
>>>>>>>>>       		if (rc == -ENOMEM)
>>>>>>>>>       			/* whoops, out of memory */
>>>>>>>>> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
>>>>>>>>> index be160e8d8bcb..51990d571e3e 100644
>>>>>>>>> --- a/include/linux/gfp.h
>>>>>>>>> +++ b/include/linux/gfp.h
>>>>>>>>> @@ -423,9 +423,16 @@ static inline bool gfp_compaction_allowed(gfp_t gfp_mask)
>>>>>>>>>       extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
>>>>>>>>>        #ifdef CONFIG_CONTIG_ALLOC
>>>>>>>>> +
>>>>>>>>> +enum acr_flags_t {
>>>>>>>>> +	ACR_CMA,	// CMA allocation
>>>>>>>>> +	ACR_OTHER,	// other allocation
>>>>>>>>> +};
>>>>>>>>
>>>>>>>> Hm, enum != flags.
>>>>>>>>
>>>>>>>> If you want to use flags, then just have ACR_CMA. ACR_OTHER is implied if not set.
>>>>>>>>
>>>>>>>> And ACR_CMA would then have to be "1" etc.
>>>>>>>
>>>>>>> I have a fixup to change acr_flags_t to acr_mode.
>>>>>>>
>>>>>>>>
>>>>>>>>> +
>>>>>>>>>       /* The below functions must be run on a range from a single zone. */
>>>>>>>>>       extern int alloc_contig_range_noprof(unsigned long start, unsigned long end,
>>>>>>>>> -			      unsigned migratetype, gfp_t gfp_mask);
>>>>>>>>> +				     enum acr_flags_t alloc_flags,
>>>>>>>>> +				     gfp_t gfp_mask);
>>>>>>>>>       #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_noprof(__VA_ARGS__))
>>>>>>>>>        extern struct page *alloc_contig_pages_noprof(unsigned long nr_pages, gfp_t gfp_mask,
>>>>>>>>> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
>>>>>>>>> index 7a681a49e73c..3e2f960e166c 100644
>>>>>>>>> --- a/include/linux/page-isolation.h
>>>>>>>>> +++ b/include/linux/page-isolation.h
>>>>>>>>> @@ -38,8 +38,20 @@ static inline void set_pageblock_isolate(struct page *page)
>>>>>>>>>       }
>>>>>>>>>       #endif
>>>>>>>>>      -#define MEMORY_OFFLINE	0x1
>>>>>>>>> -#define REPORT_FAILURE	0x2
>>>>>>>>> +/*
>>>>>>>>> + * Pageblock isolation modes:
>>>>>>>>> + * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate) memory
>>>>>>>>> + *				 e.g., skip over PageHWPoison() pages and
>>>>>>>>> + *				 PageOffline() pages. Unmovable pages will be
>>>>>>>>> + *				 reported in this mode.
>>>>>>>>> + * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
>>>>>>>>> + * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
>>>>>>>>> + */
>>>>>>>>> +enum pb_isolate_mode {
>>>>>>>>> +	PB_ISOLATE_MODE_MEM_OFFLINE,
>>>>>>>>> +	PB_ISOLATE_MODE_CMA_ALLOC,
>>>>>>>>> +	PB_ISOLATE_MODE_OTHER,
>>>>>>>>> +};
>>>>>>>>
>>>>>>>> It's late on friady, but it looks like we are duplicating things here.
>>>>>>>>
>>>>>>>> Let me think about that once my brain is recharged :)
>>>>>>>
>>>>>>> Sure. Take your time.
>>>>>>
>>>>>> Could we abstract both settings and use a single one? Then, we could simply reject if MEM_OFFLINE is passed into alloc_contig_range().
>>>>>>
>>>>>> alloc_contig_pages and page isolation, hmmmm, MEM_OFFLINE is kind-of an allocation. CMA is an allocation.
>>>>>>
>>>>>> Just an idea, not sure ...
>>>>>
>>>>> I think so.
>>>>>
>>>>> This is the fixup of removing acr_flags_t. It is on top of the original
>>>>> patch. Take your time. I guess I will send V7 with all fixups next week.
>>>>
>>>> Only wondering if we should rename "pb_isolate_mode" to something more abstract, that covers both use cases clearer.
>>>>
>>>> Hmmm.
>>>
>>> It is specifying the purpose of either alloc_contig_range() or
>>> test_pages_isolated(), but these two use cases do not have high level
>>> connection AFAICT.
>>
>> Hm, then maybe just keep it as is for now, and have the translation from ACP -> isolatetype.
>>
>> isolation modes should probably be an enum.
>>
>> acp might long-term benefit from flags, where we would essentially for now only have a single flag ("ACP_CMA").
> 
> OK, let me send a fixup to my V7.

Oh, I saw that v7 just now, sorry.

-- 
Cheers,

David / dhildenb

