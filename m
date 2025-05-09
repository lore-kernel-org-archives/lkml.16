Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2791428C2BF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783494; cv=none; b=cWtbaisLgMKzw9zSlAWL2A1C0f+rqMIjMU95jDNSrNQtadE00PiFEk1sMzsGySoFY9GhZng3HK3ybbd4fBgQRMYSjKcz1JLiXrURW9CN6OKmuYtf5Q7vDvGv46eFxGSF3WWq4ftrJEZAWyCwOK9m08NzcdCfo+Zlpc3Uz07046A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783494; c=relaxed/simple;
	bh=jvUkub0aSoBEKneXO9aNBg43kyYhY4o715wkt5qtMLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UBvk7tEKq/E214GjTunmIu6GlwqXIKXB4yasE660nE39TeQ+cTws4OjLeAVOhLepryc64juadWgJt1RjVabeoNu0/ZFfByUF7kgZRbjmqnHxz/RkUFjY2hSJmtGY71luYtpmO8ySuoF0zYhjWGEViMJKJiW8nBPzlG5AMeWV2+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eliBvBGO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eliBvBGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746783489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3hUhtyxYJYbw99c3I/tz5acTbZ7x9KccXKxTFtyDPoE=;
	b=eliBvBGOjeQzwMUU8k1qRGcYicyOkD4IOW7/TW85ZDrQ2mhyF5RM0rm0STmdHY7bjlKI96
	zmaRC7pwaul50itXkfgQoIDu7xeJ41Du8PQNWqcbnE7FdXYxkifwMlpahLyzfQk2S1lI/x
	ichNgtqgqmnP9zreaNUTo/3BJ1E3ud4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-G-vT8tH5Nn67jgClqgTUhA-1; Fri, 09 May 2025 05:38:07 -0400
X-MC-Unique: G-vT8tH5Nn67jgClqgTUhA-1
X-Mimecast-MFC-AGG-ID: G-vT8tH5Nn67jgClqgTUhA_1746783486
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442cdf07ad9so8207315e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783486; x=1747388286;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3hUhtyxYJYbw99c3I/tz5acTbZ7x9KccXKxTFtyDPoE=;
        b=MSTrzx6vdgvboc8raIBfF5hM4ZKJzohjhCnc5fRacvpzr2y8VSpNhh6BIhx0T35JAC
         vuaHe8rkvzZ972hm9um3sGCS+s25D3SzIOpBfj7Y7fgIWOO3+J1J3Rk2j6Y5hhCsaUDG
         2kSLZPolU7zVeqlyX9RBoRjsuR9pHNO/BGrX66XD5f+sPBrH8AieNYqSiPLyhMQJU7v8
         SKMqidk8sT3+UijIthrE6PFeTE6GL0IWRS1NdgFb83bcPlqzIwNRfyxfMBg+fSaITvKs
         cIklMvKhGKKnkViCo5zsloL5xsBUpg4fAOOGzME6WB2gGnDglvmlMbXaa9jzd8kWgMMU
         sPxw==
X-Forwarded-Encrypted: i=1; AJvYcCVWkQjg2lMkUQeOT0Hxzyi5+VvhPUgi/Utm0qdDlWUu2lQMmSY8EACWBxZ68De562zLr3sj6x40srkdNCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUapVMkj9eotzU4B7IptBD2gbr0VFW1aQ5P8HjHT4OB638O206
	ebbMJg/sDVU0FnOxRvx50yXDmZNhe2f9CT5G+yDfw4uQlXNY3SkiNrQ3tyJKjrIWLgs7mRe++9P
	Mo7ANbQaMySreJ+ZocEW7luUeCauzR5YHX+vdCvaOIFxN/jPSRORaY18E7qOzvA==
X-Gm-Gg: ASbGncuScy4AFD0eKFDnr52EhX/eeodAofrsPItSodLL8VUBqsVDgrfpJ6IpryMU5RC
	yTbePK9kxL1RSurBvKKXbjmzsHgRwJTy2T+3OEweje+GHRS6B950Yr1XFbGxuyPMk8lrO+19nBH
	uR9E31zJBc94Va2kuuJ2vb8ehWW8/Ju3mYZPAL+CBMBzQzKzFV5+rDhGQ5WpeOr/MbPwRHM12/o
	WmOshyANoT/92q3FV+lOy/yg68nV1GjltOnvmnvNyRyIERBJUMcncGMVcBVnE7U/izLmCMl5D60
	Ty4NfzxABUu8Wj0tkCfg5Vaf5N3DIN82MMf5czD7lZoIcig0UpwRJzeWblUTufWnOSd6kvuS2gn
	UtaftTp9IXozIdwu3FOACZahKpxZx8t8hSBSldio=
X-Received: by 2002:a05:600c:548d:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-442d6d44918mr20687505e9.14.1746783486437;
        Fri, 09 May 2025 02:38:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcTro5FHgTcGgAPOwFLaYfLvXYGrp/OdrqtZgrae9BTUGXusjtXgLtdT+shONyKdv0GJTp0Q==
X-Received: by 2002:a05:600c:548d:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-442d6d44918mr20687265e9.14.1746783486027;
        Fri, 09 May 2025 02:38:06 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f45:5500:8267:647f:4209:dedd? (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aecb0sm66649365e9.28.2025.05.09.02.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 02:38:05 -0700 (PDT)
Message-ID: <f93ef55c-250d-445f-9d77-b619685c419b@redhat.com>
Date: Fri, 9 May 2025 11:38:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Memory hotplug locking issue: Useless (?) zone span seqlock
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>
Cc: Michal Hocko <mhocko@suse.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Pavel Tatashin
 <pasha.tatashin@soleen.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
References: <b3acfb1e-2d7a-42ef-9705-bf0b20a0d152@efficios.com>
 <a5cde237-0dcf-4e85-b763-7a38e9f9c563@redhat.com>
 <8a4a5d6e-d2cf-420d-91f3-2797618e7255@efficios.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8a4a5d6e-d2cf-420d-91f3-2797618e7255@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.05.25 15:11, Mathieu Desnoyers wrote:
> On 2025-05-08 06:45, David Hildenbrand wrote:
>> On 07.03.25 21:22, Mathieu Desnoyers wrote:
>>> I'm currently perfecting my understanding of the mm code and reviewing
>>> pieces of it as I go, and stumbled on this:
>>>
>>> commit 27cacaad16c5 ("mm,memory_hotplug: drop unneeded locking")
>>>
>>> This commit removes all users of zone_span_writelock(), thus making
>>> the inline useless, but leaves the now useless
>>> zone_span_seqbegin()/zone_span_seqretry() in place within
>>> page_outside_zone_boundaries().
>>>
>>> So I'm confused. What's going on ?
>>>
>>> And if this commit got things very wrong when removing the
>>> seqlock, I wonder if there are cases where its partial
>>> pgdat_resize_lock() removal can be an issue as well.
>>
>> I stumbled over that myself recently as well. I think I mentioned in the
>> past that we should just store
>>
>> start_pfn + end_pfn
>>
>> instead of
>>
>> start_pfn + nr_pages
>>
>>
>> Then, concurrent resizing could happen (and we could atomically read
>> start_pfn / end_pfn).
>>
>> Right now, when adjusting start_pfn, we always also have to adjust
>> nr_pages. A concurrent reader calculating end_pfn manually could see
>> some crappy result.
>>
>> Having that said, I am not aware of issues in that area, but it all
>> looks like only a partial cleanup to me.
> 
> I wonder if all callers to zone_spans_pfn() prevent concurrent modification
> of the zone start_pfn and nr_pages ?

I think compaction does not protect against that (e.g., no 
mem_hotplug_begin()).

My understanding was that compaction can mostly tolerate it (e.g., 
recheck pfn_to_online_page() + page_zone() check)

> 
> For instance set_pfnblock_flags_mask() (called by set_pageblock_migratetype)
> does:
> 
>          VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
> 

Yes, that might indeed trigger in some weird races.

> If we look at zone_spans_pfn():
> 
> static inline unsigned long zone_end_pfn(const struct zone *zone)
> {
>           return zone->zone_start_pfn + zone->spanned_pages;
> }
> 
> static inline bool zone_spans_pfn(const struct zone *zone, unsigned long pfn)
> {
>           return zone->zone_start_pfn <= pfn && pfn < zone_end_pfn(zone);
> }
> 
> A concurrent updater which shrinks a zone by moving its start would have
> to increment zone_start_pfn *and* decrement spanned_pages. If this happens
> concurrently with the loads from zone_spans_pfn(), then it can observe
> an intermediate state (only nr pages reduced or only zone start moved).
> The first scenario at least can lead to false positive VM_BUG_ON().

Jup.

> 
> Likewise if the updater expands the zone by moving its start left. If
> the observer loads an updated start pfn without observing the nr pages
> update, it can lead to false positive VM_BUG_ON().
> 
> I notice that zone_intersects() also uses zone_end_pfn(). It is used for
> instance by default_kernel_zone_for_pfn() without locks. In this case,
> reading both nr pages and start pfn concurrently with update could cause
> a false-positive match, for instance if the start of the range is moved
> but the nr pages prior value is loaded (concurrent shrink). This could
> match a zone outside of the function parameter range.
> 
> Another reader of those fields is update_pgdat_span(), which appears to
> be called only from remove_pfn_range_from_zone with mem_hotplug_lock
> held in write mode. So that one should be fine.
> 
> AFAIU, updates to nr pages and zone start pfn are done by:
> 
> - remove_pfn_range_from_zone (AFAIU always called with mem_hotplug_lock
>     in write mode),
> - shrink_zone_span (called from remove_pfn_range_from_zone),
> - resize_zone_range (__meminit function), called from move_pfn_range_to_zone()
>     also called with mem_hotplug_lock in write mode.

Yes, I refactored that at some point. mem_hotplug_begin() could protect 
against it, but we really don't want to grab that all over the place.

> 
> So I think your idea of keeping track of both zone_start_pfn and zone_end_pfn
> would solve this specific issue, however we'd have to carefully consider what
> happens to users of spanned_pages (e.g. zone_is_empty()) callers, because it
> would then require to calculate the spanned_pages from end - start, which
> then can have similar issues wrt atomicity against concurrent updates.

We could easily just store both things (spanned pages + end_pfn), such 
that we can read both atomically.

-- 
Cheers,

David / dhildenb

