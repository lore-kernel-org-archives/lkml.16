Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626C25F78D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731547; cv=none; b=V+Ve22paR5iXYVuHoX81P+IrOIgylrBK1XA4v2021obuog9VPKYUrEilf/e2dJvxydArXzS088bF88uPkAkf8kgwWDVKEFG/fo1ybD1IJq1OPCgTkEfFx7OWUEjkramiknern9VjcNOERWpjceYHtlm5qeV627AI6KifqkkNTfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731547; c=relaxed/simple;
	bh=KzQnT2U28F3vWZQR0xTVySxl3TqxtQQsRH/R9i46P/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgfhyjyVlcHi+Knlg+87Fy7padEBTZgR0eDAp8YcGxiquw83/Sr74+MUu8Pt518sOCD0h+WA+1Q4um/9e7q6KPjzHKVIX7XqN2M6JZZFjnO8PjW8rcZc11uPNyRoj03/v+zc176cj+Fs7fkKiJrWo06qkfXwIlY2Cx95HP4L1po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L0MQIwzH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L0MQIwzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747731544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rEo9wHsAVDAmF8UKbhSkQByUjmKCHbkHnot0Hl7ePQI=;
	b=L0MQIwzHXTB/78B9BSjwWSZHEIkQdXMDTSIW9Bux50S2lJ0qzwxzCcsjs1aYbEX4m6S/3R
	dNsl8tvaqbhcrS6lEMBYWC5ejUc1uBMr8FGfM1vzd7K+vJXHXwRFsErmyYiftUW79sw2lx
	Df8hP8rcBzsa4DHjkWzyNCXW4rswxI0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-v2cy0SAmPWaq2GPYf23tHw-1; Tue, 20 May 2025 04:59:02 -0400
X-MC-Unique: v2cy0SAmPWaq2GPYf23tHw-1
X-Mimecast-MFC-AGG-ID: v2cy0SAmPWaq2GPYf23tHw_1747731542
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442dc6f0138so30132175e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731542; x=1748336342;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rEo9wHsAVDAmF8UKbhSkQByUjmKCHbkHnot0Hl7ePQI=;
        b=iqxmgXjdcRLAG38GNeQIPBfPYNPLJ4I9y10ubXeR6Ngk2ssZ5nwI6VjrwuaHlv3oUf
         eFejU0OYo1Ub6wVU7s+/NJ6hjRt7GZgzcsoZR+M2AA2k+RfCIb003dVOFrvSjttx50FB
         WRtmCVUORaHr9KV/35s2O+ci6j4lpHYjeAIinZayX7/c/58oc2EKWmrBzoNJEDQqZC7I
         6UNa/cOT7eSrZutxH9pKAQ29qfXQ7K1lwhC3A8eJEchnHtj+ArKSd+DvZWAfQrsshud0
         D75pWTUC7Nh4pJmnMmv+EaO0t6oUoNUcgtBzJzkuRoz1vOgHvqaFdIFLrinvXkKU4hp/
         FRbw==
X-Forwarded-Encrypted: i=1; AJvYcCVAmwchxZLQo0ZX8WRcusuxFVku9ATLfsf1mUB72ctb6l+h6TYkOc45npFvOpwVqgYyRtu2G2cczllaFMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSrm0ZJEWMbMUPwlrQHS7WIl8mPp8XY+6zCzmWnU7BKwOOWO9R
	wuWtyv5hwmZD2lJ/J2X+HuJbgn0+nh7qi3n1Ty9esRBzjmy/F4wf+Y5Uj1wPmjDS18ieRyWBKqb
	yCn00wnJncZhnbBRpjlvAaAGHsp0P9cjax5tqiOszFXjmz2G7NJ7msHaYtgAXBKoBxA==
X-Gm-Gg: ASbGncsjaD4uYQwC78p+fMUkzspZh6dV65caEHdcg0oBojJUIQ8N8hEVWltj5EZ5+VC
	YXnXtvzOcfj6RQUzyfISxZo95eGNG7SC9wZIzdjNE9MoqkbKIIsf/+dziQYzEBODz2UZEjxCrV0
	NyIaWoWRLnQJ1APA7DC2szipP9W3O5tN+x5VhGoB6Drr5CdapQP71x2696n3a4I8BL3o5y50goe
	SgM/Y6aFVS35mLbljcBFuXdUSEbSYVIrcA/x1Bu9gHIuLoC5a2ldFylZxwppa7Z6wPgWMVzvQzk
	2tb70IDflzUzcFstTqnOrrWJJIQbOTfqsuXAw4dEXArKTORSmbSGH6/O0giU4PfvvjeH3L7M/92
	n0NAbv/UjbzAb0nReRmqmwwBu8nkBpW+DUcGtON0=
X-Received: by 2002:a05:600c:a014:b0:43d:ac5:11ed with SMTP id 5b1f17b1804b1-442fd66f08emr137207265e9.24.1747731541570;
        Tue, 20 May 2025 01:59:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJeg33tWEhPUjIDGe+ZTJb6dNwDJQ14UoIRa1KY9x5N1fVhioznneX6EK33bsRMzFQbRU4TA==
X-Received: by 2002:a05:600c:a014:b0:43d:ac5:11ed with SMTP id 5b1f17b1804b1-442fd66f08emr137206995e9.24.1747731541164;
        Tue, 20 May 2025 01:59:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f16:e400:525a:df91:1f90:a6a8? (p200300d82f16e400525adf911f90a6a8.dip0.t-ipconnect.de. [2003:d8:2f16:e400:525a:df91:1f90:a6a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23c07bfsm22910795e9.23.2025.05.20.01.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:59:00 -0700 (PDT)
Message-ID: <92868969-5f65-4e50-84c1-c50fe18656e8@redhat.com>
Date: Tue, 20 May 2025 10:58:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()
To: Zi Yan <ziy@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Baolin Wang
 <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-3-ziy@nvidia.com>
 <63ba9fe3-e384-4396-bd86-fe62150ed1ab@redhat.com>
 <3E4832BC-C0B0-47E0-AA89-A8DE5A63286A@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <3E4832BC-C0B0-47E0-AA89-A8DE5A63286A@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.05.25 01:06, Zi Yan wrote:
> On 19 May 2025, at 4:21, David Hildenbrand wrote:
> 
>> On 09.05.25 22:01, Zi Yan wrote:
>>> Since migratetype is no longer overwritten during pageblock isolation,
>>> moving pageblocks to and from MIGRATE_ISOLATE no longer needs migratetype.
>>>
>>> Add MIGRATETYPE_NO_ISO_MASK to allow read before-isolation migratetype
>>> when a pageblock is isolated. It is used by move_freepages_block_isolate().
>>>
>>> Add pageblock_isolate_and_move_free_pages() and
>>> pageblock_unisolate_and_move_free_pages() to be explicit about the page
>>> isolation operations. Both share the common code in
>>> __move_freepages_block_isolate(), which is renamed from
>>> move_freepages_block_isolate().
>>>
>>> Make set_pageblock_migratetype() only accept non MIGRATE_ISOLATE types,
>>> so that one should use set_pageblock_isolate() to isolate pageblocks.
>>>
>>> Two consequential changes:
>>> 1. move pageblock migratetype code out of __move_freepages_block().
>>> 2. in online_pages() from mm/memory_hotplug.c, move_pfn_range_to_zone() is
>>>      called with MIGRATE_MOVABLE instead of MIGRATE_ISOLATE and all affected
>>>      pageblocks are isolated afterwards. Otherwise, all online pageblocks
>>>      will have non-determined migratetype.
>>>
>>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>>> ---
>>>    include/linux/mmzone.h         |  4 +-
>>>    include/linux/page-isolation.h |  5 ++-
>>>    mm/memory_hotplug.c            |  7 +++-
>>>    mm/page_alloc.c                | 73 +++++++++++++++++++++++++---------
>>>    mm/page_isolation.c            | 27 ++++++++-----
>>>    5 files changed, 82 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>>> index 7ef01fe148ce..f66895456974 100644
>>> --- a/include/linux/mmzone.h
>>> +++ b/include/linux/mmzone.h
>>> @@ -107,8 +107,10 @@ static inline bool migratetype_is_mergeable(int mt)
>>>    extern int page_group_by_mobility_disabled;
>>>     #ifdef CONFIG_MEMORY_ISOLATION
>>> -#define MIGRATETYPE_MASK ((BIT(PB_migratetype_bits) - 1) | PB_migrate_isolate_bit)
>>> +#define MIGRATETYPE_NO_ISO_MASK (BIT(PB_migratetype_bits) - 1)
>>> +#define MIGRATETYPE_MASK (MIGRATETYPE_NO_ISO_MASK | PB_migrate_isolate_bit)
>>>    #else
>>> +#define MIGRATETYPE_NO_ISO_MASK MIGRATETYPE_MASK
>>>    #define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
>>>    #endif
>>>   diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
>>> index 898bb788243b..b0a2af0a5357 100644
>>> --- a/include/linux/page-isolation.h
>>> +++ b/include/linux/page-isolation.h
>>> @@ -26,9 +26,10 @@ static inline bool is_migrate_isolate(int migratetype)
>>>    #define REPORT_FAILURE	0x2
>>>     void set_pageblock_migratetype(struct page *page, int migratetype);
>>> +void set_pageblock_isolate(struct page *page);
>>>   -bool move_freepages_block_isolate(struct zone *zone, struct page *page,
>>> -				  int migratetype);
>>> +bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page);
>>> +bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
>>>     int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>>>    			     int migratetype, int flags);
>>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>>> index b1caedbade5b..c86c47bba019 100644
>>> --- a/mm/memory_hotplug.c
>>> +++ b/mm/memory_hotplug.c
>>> @@ -1178,6 +1178,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>>>    	const int nid = zone_to_nid(zone);
>>>    	int ret;
>>>    	struct memory_notify arg;
>>> +	unsigned long isol_pfn;
>>>     	/*
>>>    	 * {on,off}lining is constrained to full memory sections (or more
>>> @@ -1192,7 +1193,11 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>>>       	/* associate pfn range with the zone */
>>> -	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
>>> +	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_MOVABLE);
>>> +	for (isol_pfn = pfn;
>>> +	     isol_pfn < pfn + nr_pages;
>>> +	     isol_pfn += pageblock_nr_pages)
>>> +		set_pageblock_isolate(pfn_to_page(isol_pfn));
>>
>> Can we move that all the way into memmap_init_range(), where we do the
>> set_pageblock_migratetype()?
>>
>> The MIGRATE_UNMOVABLE in mhp_init_memmap_on_memory() is likely fine: all
>> pages in that pageblock will be used for the memmap. Everything is unmovable,
>> but no free pages so ... nobody cares? :)
> 
> My approach is similar, but a new init_pageblock_migratetype() like
> below. Then, I added "bool isolate" instead of replacing the existing
> "int migratetype". The advantage is that it saves a call to
> set_pfnblock_flags_mask() for each pageblock. Like the alternative
> you suggested below.
> 
> +void __meminit init_pageblock_migratetype(struct page *page, int migratetype,
> +		bool isolate)
> +{
> +	if (unlikely(page_group_by_mobility_disabled &&
> +		     migratetype < MIGRATE_PCPTYPES))
> +		migratetype = MIGRATE_UNMOVABLE;
> +
> +#ifdef CONFIG_MEMORY_ISOLATION
> +	if (migratetype == MIGRATE_ISOLATE) {
> +		VM_WARN(1,
> +			"Set isolate=true to isolate pageblock with a migratetype");
> +		return;
> +	}
> +	if (isolate)
> +		migratetype |= PB_migrate_isolate_bit;
> +#endif
> +	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
> +				page_to_pfn(page), MIGRATETYPE_MASK);
> +}
> +

See my other reply on maybe introducing a "struct pageblock_info" where 
we embed these things, to decouple the actual migratetype from flags.

-- 
Cheers,

David / dhildenb

