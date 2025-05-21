Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528A026560B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829514; cv=none; b=Hx7XkAKeHEeg+jwxFLNyeTaCMyByjriGSmy+aYqVtJYiVnHiHrkgq4VB5tmeGKGYtztvt+ENpLjvSXDRVi5fFha6Ihd5nTZb+lC8M8Tw/TD5iJyUSn0UJaSSQllO7iAL/4F7Szwz5Z8J98eaqDDfHLQmQjQYVTag6bEKOuE42M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829514; c=relaxed/simple;
	bh=5ruHYJOYd9Gjxi3WpKqv9bMULzZwoM4egO7CGu+G9wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnbX9TGY48NKW9dUDjNsZBUG7cpfLZ3YqVzZ42UNevTgxWJYeOMI0w/JGIretd8K+GYJ8iI7C+TXduoYaas+8GlGOVLsfRq0zEz/P033/tXA+dFCAQyytC+bh1ZAjRXGQPBNunDJs6FopJiPU8jR0q/GB/K5b9QEQVwS6I6hk0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O3QVX8Az; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O3QVX8Az"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747829511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Qtu6GUo320eRV2cAmSsW0wFq6T2qjgs2wh7OnZ36KOY=;
	b=O3QVX8AzGes254ezpXVunKDq33LtO/y+X7Smf3A86ldg3DQ86Nrndc00KQdv6CiC4/q0vm
	ey+qOhImZJZb4DgRdG0KV184lz81Jc3CyP//RhtEq02ps/QJGx+S1S7wrKU6w7Blvg+zFk
	MuwYPu02xHFtBxPn8DAxEQQ9UOUdS/c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-jDnDgjXNMnavmC3lhALvAQ-1; Wed, 21 May 2025 08:11:49 -0400
X-MC-Unique: jDnDgjXNMnavmC3lhALvAQ-1
X-Mimecast-MFC-AGG-ID: jDnDgjXNMnavmC3lhALvAQ_1747829509
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so35786215e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747829509; x=1748434309;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qtu6GUo320eRV2cAmSsW0wFq6T2qjgs2wh7OnZ36KOY=;
        b=Ao1C5rBPVfdN838Lj8e1cRoW2Cn4fTeE/N7O0Fl7NCBORf19kadrReLU9iwhJDgZ/I
         7ghyOOskCBNAr0phK8kwP73tNuzGBQw4v1GE7eAD2IAcyc43Ot+psGbfn3u45pQrSduj
         FOFM7iQCQwZtvvMu/pplitB7kevae2JOmzWJrenQDDWVacimzYrO6puFbyKi3AqsSxBK
         +yYQlt6h4+DiCWdo41B75rV12ogf7euenjzS6Z/ZW2A5XvfmCmi0Yjy3doDfX4+ngQpQ
         dh95vt2wp+L63TEu6IYPN9o4QVN4uYHHZ+0T8NieHZyR3mfaXkvVESqeySblG6j8mydP
         W+wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrcNaNVYlOi4MDOvWCY6j6gDvCpT713xp0uAVCCUuaKBuVEOi2JBWl6buaVUcVoQa3vJRwV99BX4IpmKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBmlI0aUEmO6HVRzuGqF655XlPUnAi+HnhYavcyDyO5wJBPCF4
	vquZ5sGTZlXYviLotCAgeChHhHhdCVs8oPelG3P+UCZjb8ijDy8pCzbqw/pOdz89//tNGOCCGL4
	EhgvP/1tl0pEJw2bF27mmwpzfj0xYdS8x9VsvSRNo+Arp5tHllRfwROGWUZpvpOBW6w==
X-Gm-Gg: ASbGncshYs8ibunaH4nQKrEGYXd/C+bykbn5OpDYKpBUpCgQVY+zeugZaI9jgq0iSe9
	+Rm2m/BGcaVgfz6AZiMwoKNv9KJ75L8Z92Ab/XUcz8T3S+ZhWfEKEnYaQaBOj8FiivGcJ08RmXO
	zhH2q98fi9851kUcNKRnaWIOFxU+VoR6Yu+C5U8OQlM7XmRBNHZnLaQuy+fds813i95PRvxZzui
	5GTG7JanlhdlE2hJD8pL73UeI8sFXOAf4/Zx8cZ0N+LC6J159WLvoapPV9APVM+w3f1A8N71PEY
	KyI1ejENSvP+S6A8u8HshknN02UTrfXqHkxiwPR5qjGWtGBmKvFNMCC9WaRcwTWdcEUhEW+bF7B
	wFTmngkLWxmmadORIsDcgZs2JHa/g9yhlyuagsW0=
X-Received: by 2002:a05:6000:2012:b0:3a1:f68b:60a8 with SMTP id ffacd0b85a97d-3a35c834d65mr19052428f8f.10.1747829508639;
        Wed, 21 May 2025 05:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+ZKeGiYGqyqeDF1EYsM8B1nfBMl2gn9cmf015VaeDSfD4MFj90rpEUX9BD5N9Z+M+QVCd2w==
X-Received: by 2002:a05:6000:2012:b0:3a1:f68b:60a8 with SMTP id ffacd0b85a97d-3a35c834d65mr19052394f8f.10.1747829508173;
        Wed, 21 May 2025 05:11:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29619sm72162355e9.7.2025.05.21.05.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 05:11:47 -0700 (PDT)
Message-ID: <e9b85836-b4d9-4678-a59b-dbaf916fa1c5@redhat.com>
Date: Wed, 21 May 2025 14:11:44 +0200
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
 <a8dbfbf6-97e3-4a69-a1f5-a32693e46730@redhat.com>
 <CA27CAF4-DD4B-4350-90A6-AE9A808F05C0@nvidia.com>
 <c8265d22-5cbb-4211-b91d-87965b8505e2@redhat.com>
 <B21E6F5D-C824-4BB8-974D-A1BA313880EB@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <B21E6F5D-C824-4BB8-974D-A1BA313880EB@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.05.25 14:00, Zi Yan wrote:
> On 21 May 2025, at 7:57, David Hildenbrand wrote:
> 
>> On 21.05.25 13:16, Zi Yan wrote:
>>> On 19 May 2025, at 12:42, David Hildenbrand wrote:
>>>
>>>>>>> +#ifdef CONFIG_MEMORY_ISOLATION
>>>>>>> +	if (flags & PB_migrate_isolate_bit)
>>>>>>> +		return MIGRATE_ISOLATE;
>>>>>>> +#endif
>>>>>>
>>>>>> If you call get_pfnblock_flags_mask() with MIGRATETYPE_MASK, how could you ever get PB_migrate_isolate_bit?
>>>>>
>>>>> MIGRATETYPE_MASK is ((BIT(PB_migratetype_bits) - 1) | PB_migrate_isolate_bit),
>>>>> so it gets PB_migrate_isolate_bit.
>>>>>
>>>>
>>>> Oh ... that's confusing.
>>>>
>>>>>>
>>>>>>
>>>>>> I think what we should do is
>>>>>>
>>>>>> 1) Rename get_pfnblock_flags_mask() to get_pfnblock_flags()
>>>>>>
>>>>>> 2) Remove the mask parameter
>>>>>>
>>>>>> 3) Perform the masking in all callers.
>>>>>
>>>>> get_pfnblock_flags_mask() is also used by get_pageblock_skip() to
>>>>> get PB_migrate_skip. I do not think we want to include PB_migrate_skip
>>>>> in the mask to confuse readers.
>>>>
>>>> The masking will be handled in the caller.
>>>>
>>>> So get_pageblock_skip() would essentially do a
>>>>
>>>> return get_pfnblock_flags() & PB_migrate_skip_bit;
>>>>
>>>> etc.
>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> Maybe, we should convert set_pfnblock_flags_mask() to
>>>>>>
>>>>>> void set_clear_pfnblock_flags(struct page *page, unsigned long
>>>>>> 			      set_flags, unsigned long clear_flags);
>>>>>>
>>>>>> And better, splitting it up (or providing helpers)
>>>>>>
>>>>>> set_pfnblock_flags(struct page *page, unsigned long flags);
>>>>>> clear_pfnblock_flags(struct page *page, unsigned long flags);
>>>>>>
>>>>>>
>>>>>> This implies some more code cleanups first that make the code easier to extend.
>>>>>>
>>>>>
>>>>> The same due to PB_migrate_skip.
>>>>>
>>>>> Based on your suggestion, we could make {set,get}_pfnblock_flags_mask()
>>>>> internal APIs by prepending "__". They are only used by the new
>>>>> {get, set, clear}_pfnblock_flags() and {get, set, clear}_pageblock_{skip, isolate}().
>>>>> Then use {get, set, clear}_pfnblock_flags() for all migratetype operations.
>>>>>
>>>>> WDYT?
>>>>
>>>> In general, lgtm. I just hope we can avoid the "_mask" part and just handle it in these functions directly?
>>>
>>> After implementing {get, set, clear}_pfnblock_flags(), I find that
>>> get_pfnblock_flags() is easy like you wrote above, but set and clear are not,
>>> since migratetype and skip/isolate bits are in the same word, meaning
>>> I will need to first read them out, change the field, then write them back.
>>
>> Like existing set_pfnblock_flags_mask() I guess, with the try_cmpxchg() loop.
> 
> Are you saying I duplicate the code in set_pfnblock_flags_mask() to implement
> set_pfnblock_flags()? Or just replace set_pfnblock_flags_mask() entirely?

The latter as possible.

> 
>>
>>> But it will cause inconsistency if there is a parallel writer to the same
>>> word. So for set and clear, mask is required.
>>>
>>> I can try to implement {get, set, clear}_pfnblock_bits(page,pfn, bits) to
>>> only handle standalone bits by using the given @bits as the mask and
>>> {set,get}_pageblock_migratetype() still use the mask.
>>
>> We'd still have to do the try_cmpxchg() when dealing with multiple bits, right?
>>
>> For single bits, we could just use set_bit() etc.
> 
> Mel moved from set_bit() to try_cmpxchg() a word for performance reason. I am
> not sure we want to move back.

In e58469bafd05 we moved from multiple set_bit etc to a cmpxchange.

-       for (; start_bitidx <= end_bitidx; start_bitidx++, value <<= 1)
-               if (flags & value)
-                       __set_bit(bitidx + start_bitidx, bitmap);
-               else
-                       __clear_bit(bitidx + start_bitidx, bitmap);


However, when only setting/clearing a single bit (e.g., isolated), 
set_bit etc should be much cheaper.

For multiple bits, the existing try_cmpxchg should be kept IMHO.

-- 
Cheers,

David / dhildenb

