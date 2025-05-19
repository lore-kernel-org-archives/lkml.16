Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF84D72639
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747672966; cv=none; b=KQg2KN0ak3JaMatfag04EacKWkyMtUuOtxH7FdLjPTWh/OaTlafrPatWEPJUp4e1glypRbQmqVYRMIkh0FadsH4FBuJZuOuIDuSmcJ3dv/J3o2Af823CbgIAJlqJJssNYCaBh/Uewr4qv3rZuLn2LpKaO2Hbk7c7eIB+GM32KGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747672966; c=relaxed/simple;
	bh=m3B17bxK0MlMcuk4ieGFW67aV+qQwxboxRGxHgKJ+1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3nhRp/K7QkL+omVycq1b9CUOdEE9Y5bojTr6BIw0+rXmYVjUUx0yguh00JKHdinEbAqz44zlHGvhoOmgvFD7fGXDjE0t2JWXAJONLuAnkFwk4SjmMPmWc70+DRdUGMmJKIgeTS2GXD05Hw1dP0JTCzbPOuUPKt+hg/QNqL/6kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I5RJfuOK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I5RJfuOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747672963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CsRX+qGdJSxw86evmKQ4/h1/yEBQrVm2emPrXH0LMCw=;
	b=I5RJfuOKQWdugzuIDnctR8/oVWvWo9ZW1wX2bjaoaBSZiS1+VOf8WQEY+fdo8zXeyXdzLZ
	2PZHe4oIrXfctbeviV/hHIFDhazEQ9R4Yn3McINfPi73CIBNmXAdBID0k/ujJ43CGl0djx
	LFvVDjG926bZW5XH4KnLIIdPN+60ddk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-eoktGMM1N5uMzPn3yLso0A-1; Mon, 19 May 2025 12:42:42 -0400
X-MC-Unique: eoktGMM1N5uMzPn3yLso0A-1
X-Mimecast-MFC-AGG-ID: eoktGMM1N5uMzPn3yLso0A_1747672961
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so29643035e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747672961; x=1748277761;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CsRX+qGdJSxw86evmKQ4/h1/yEBQrVm2emPrXH0LMCw=;
        b=Hd3hTGYFB3aNqTZ74YY3lhKZjzhkgt9c+2FdR6OOgWyL0gbMNipDnnkDilmEKSspbl
         UKCM/QZnGZtauB28TKYEaUh+D12vX9eawEqG1VWOVaJdl8QEMs+pHjCORYGp7EY5K5yy
         AlXkfyq37mUPYrvu9e6ncSUuaY5Sa42PlsKdPqI87mIbeiGLGzDzEvYvQEtTRtJEMXbe
         gldLG7FZOeMiDJsTW+HRnAHLFqXMgVCL76akxRKr7xyivophvZzdX8ER6rBVh7tTGs83
         APrVJK/VtTwslfCemK1J+4efwBMF4ufo1trkz81M1TEQR7La78Rk1uYFz3xKJJ0jJwgT
         ku1A==
X-Forwarded-Encrypted: i=1; AJvYcCXVGEFe/zbeCYktWERsu1JzixQpQ+ZN25WHl4qI3p9JcDoNejBApswkdnh/bgDIddzm+JsoA5fjpLUu7hg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbbEtQY1+8oZ6z5XucrbMXksWjyUvo5m7mrC7QS4fQjQDDRql3
	E9KRcrwtO6swWchaA+6iYLQ1YYK9F93DB6R6vzBR0OCtXviAPg7KhGGhT1sorSJsTwe+xwDr2ya
	xwW9hwGcccoKIZDkaGRJdAmeu7QoSZEO2n9m0k4oOpYPQG0UGSc7Ay0hcL7QeijYWVA==
X-Gm-Gg: ASbGncsgxhaF7yfHKFo7Uafbqphhu3iwCa+pZhgBLyIeB46ZOlOegloTsmToRv66bR6
	LsSM3dZgETphMl/2bXoBumfWGjXLUu5nzxfrpGqhlgPgd4rEv6Z3p6lqQs7d5QXpqK52HmkZOG5
	+Kcb5ximOEs7Y6/3cl+6EbCOEtPK15XxBU88nPhQY/ITPUveizciEgjtyJ5g7YzIEbmnnSlaVQn
	l3Z3Ym68lWgQnts4Nx+nehvDhfCcGg0cQTuTJiDE5N+XWmxKr4IbhUGUdpon0rxoehYhdKRgVKk
	Nhip/J/9zxuXFBAj0KOpwd1W3jVqBjPkLDgkRoPZxz9iN6ONZ9lcc1fc8E/a1k4kiOoL8hxzBm3
	vJ/23qaWv7rTrh7Qzcvxuz4/DYKQXW1fILZFOnMg=
X-Received: by 2002:a05:600c:3490:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-442fd66f0damr98454285e9.23.1747672961117;
        Mon, 19 May 2025 09:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOUyF6DF8dCbASv02VcJeuBlOifQxFly3HL9XjzP+vzni8hLnAk9EypUR9e7HTIBU3tICB4A==
X-Received: by 2002:a05:600c:3490:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-442fd66f0damr98454075e9.23.1747672960694;
        Mon, 19 May 2025 09:42:40 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:3a00:5662:26b3:3e5d:438e? (p200300d82f3c3a00566226b33e5d438e.dip0.t-ipconnect.de. [2003:d8:2f3c:3a00:5662:26b3:3e5d:438e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-443000ee99csm133714505e9.31.2025.05.19.09.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 09:42:40 -0700 (PDT)
Message-ID: <a8dbfbf6-97e3-4a69-a1f5-a32693e46730@redhat.com>
Date: Mon, 19 May 2025 18:42:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] mm/page_isolation: make page isolation a
 standalone bit.
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
 <20250509200111.3372279-2-ziy@nvidia.com>
 <506798aa-0280-4f63-9c0e-d5f2f5d58c3c@redhat.com>
 <166E73A3-02CE-4023-AE0E-022C9C618C33@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <166E73A3-02CE-4023-AE0E-022C9C618C33@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>> +#ifdef CONFIG_MEMORY_ISOLATION
>>> +	if (flags & PB_migrate_isolate_bit)
>>> +		return MIGRATE_ISOLATE;
>>> +#endif
>>
>> If you call get_pfnblock_flags_mask() with MIGRATETYPE_MASK, how could you ever get PB_migrate_isolate_bit?
> 
> MIGRATETYPE_MASK is ((BIT(PB_migratetype_bits) - 1) | PB_migrate_isolate_bit),
> so it gets PB_migrate_isolate_bit.
> 

Oh ... that's confusing.

>>
>>
>> I think what we should do is
>>
>> 1) Rename get_pfnblock_flags_mask() to get_pfnblock_flags()
>>
>> 2) Remove the mask parameter
>>
>> 3) Perform the masking in all callers.
> 
> get_pfnblock_flags_mask() is also used by get_pageblock_skip() to
> get PB_migrate_skip. I do not think we want to include PB_migrate_skip
> in the mask to confuse readers.

The masking will be handled in the caller.

So get_pageblock_skip() would essentially do a

return get_pfnblock_flags() & PB_migrate_skip_bit;

etc.

> 
>>
>>
>>
>> Maybe, we should convert set_pfnblock_flags_mask() to
>>
>> void set_clear_pfnblock_flags(struct page *page, unsigned long
>> 			      set_flags, unsigned long clear_flags);
>>
>> And better, splitting it up (or providing helpers)
>>
>> set_pfnblock_flags(struct page *page, unsigned long flags);
>> clear_pfnblock_flags(struct page *page, unsigned long flags);
>>
>>
>> This implies some more code cleanups first that make the code easier to extend.
>>
> 
> The same due to PB_migrate_skip.
> 
> Based on your suggestion, we could make {set,get}_pfnblock_flags_mask()
> internal APIs by prepending "__". They are only used by the new
> {get, set, clear}_pfnblock_flags() and {get, set, clear}_pageblock_{skip, isolate}().
> Then use {get, set, clear}_pfnblock_flags() for all migratetype operations.
> 
> WDYT?

In general, lgtm. I just hope we can avoid the "_mask" part and just 
handle it in these functions directly?

> 
>>> +	return flags;
>>>    }
>>>     /**
>>> @@ -402,8 +423,14 @@ void set_pfnblock_flags_mask(struct page *page, unsigned long flags,
>>>    	unsigned long bitidx, word_bitidx;
>>>    	unsigned long word;
>>>   +#ifdef CONFIG_MEMORY_ISOLATION
>>> +	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 8);
>>> +	/* extra one for MIGRATE_ISOLATE */
>>> +	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits) + 1);
>>> +#else
>>>    	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
>>>    	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
>>> +#endif
>>>     	bitmap = get_pageblock_bitmap(page, pfn);
>>>    	bitidx = pfn_to_bitidx(page, pfn);
>>> @@ -426,6 +453,13 @@ void set_pageblock_migratetype(struct page *page, int migratetype)
>>>    		     migratetype < MIGRATE_PCPTYPES))
>>>    		migratetype = MIGRATE_UNMOVABLE;
>>>   +#ifdef CONFIG_MEMORY_ISOLATION
>>> +	if (migratetype == MIGRATE_ISOLATE) {
>>> +		set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
>>> +				page_to_pfn(page), PB_migrate_isolate_bit);
>>> +		return;
>>> +	}
>>> +#endif
>>>    	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>>>    				page_to_pfn(page), MIGRATETYPE_MASK);
>>>    }
>>> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>>> index b2fc5266e3d2..751e21f6d85e 100644
>>> --- a/mm/page_isolation.c
>>> +++ b/mm/page_isolation.c
>>> @@ -15,6 +15,17 @@
>>>    #define CREATE_TRACE_POINTS
>>>    #include <trace/events/page_isolation.h>
>>>   +static inline bool __maybe_unused get_pageblock_isolate(struct page *page)
>>> +{
>>> +	return get_pfnblock_flags_mask(page, page_to_pfn(page),
>>> +			PB_migrate_isolate_bit);
>>> +}
>>> +static inline void clear_pageblock_isolate(struct page *page)
>>> +{
>>> +	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
>>> +			PB_migrate_isolate_bit);
>>> +}
>>
>> Should these reside in include/linux/pageblock-flags.h, just like the
>> CONFIG_COMPACTION "skip" variants?
> 
> They are only used inside mm/page_isolation.c, so I would leave them
> here until other users come out.

get_pageblock_skip() and friends are also only used in mm/compaction.c.

Having these simple wrapper as inline functions in the same header 
should make it consistent.

... and avoid tricks like "__maybe_unused" here :)


-- 
Cheers,

David / dhildenb

