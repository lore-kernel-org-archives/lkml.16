Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0981723C51E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828648; cv=none; b=um03fVb7UW6sTwRsKII9oinYSKhd0H03FViZZfgRGNnWYHLWOA8KXxCbjaehSTj5IYWdrC3FPExwOvMQ24asYxO0UCGfDkmDL5e1ae3ojk8gdWgLzAkvEwBuLhF3H0rfel6s0lTTGdpDWp+8aEXBtGZyFJWAd0z+1VFtT3342gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828648; c=relaxed/simple;
	bh=QOT3tW5B4AGbapzaBknKSOQXTverfPNbQ0qMiOSZw7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gMSDb016IEyOejs9PUITZKLBBJaB09VoJ1jk2es2wMYnCRpp4fxuw3SlwbVotltprH2VIFdCT011MfUuVUqUZZUW2exoYhAUby2g5yGG/rpvsJ4OMsUlSV5BlARKFzb5ohvFrUMTnzteFPzf22cMgd0oAi4dpPPYAoP2hELKLUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gwC3qdBO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gwC3qdBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747828645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KV+jawOMGH57XTZtU0CYfdQg2ZGQ8cLXXNvfYeRLep4=;
	b=gwC3qdBOj17KIMT2x5YHwvP5nZs2XZeTKVcja3A6IN/OnuTIIehxwJKYEulzJgIw/cJ0oX
	ZmLduHx/NZA1X3iuswB9w0AZPqiZA02hEN9ImIjwLpQnyVNzpW4fJnX1KEGeWS69KfOXBr
	huEHYmpL05On7Y4Zt32aa35HYu4dWQA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-9VJ8aG-nMei7vrARRcNTVg-1; Wed, 21 May 2025 07:57:24 -0400
X-MC-Unique: 9VJ8aG-nMei7vrARRcNTVg-1
X-Mimecast-MFC-AGG-ID: 9VJ8aG-nMei7vrARRcNTVg_1747828643
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so36394515e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747828643; x=1748433443;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KV+jawOMGH57XTZtU0CYfdQg2ZGQ8cLXXNvfYeRLep4=;
        b=Wci0yVG/brNHV8Kda4k84XiOkUvLFZDGlziG21yBcIL6Pl8QcezR4wpqniqAHiYqty
         tFRB/I+xfB8alKTPMgAQ2MrNoB+jc8+aWi3scBhav9Xb8cHDBup3Lw5P04tNWlyo/yBB
         09ptHflva7m5Tbx2lK/n1hrQoqnbLnH2b0NPSeeX9C1ePivMdGpYFJNYRzO241jwFEua
         GaoGL7UV4nfkYF7Y1zhT1E+bsvZqYtE4qqAfvq0DO/RWNgUKe2sr8C0FmzZ3go0HiUJq
         gsvAiHENILHul/na7aAsAdrNQhHmzhdJdhyOpGgD1X3XBsp1iYsCPtZaqtpxNQdcnHlh
         d/WA==
X-Forwarded-Encrypted: i=1; AJvYcCUkpd7UlGLTbCrHZvsXFcsOjtb/5zi3F2ONcIVtD8xV/2AfuSD8DONEzF4KMcdOiIlrYmhq3mDQ6DfQ4/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbSIIoJnCdlaThSq3rjV3FMhVt1f5Y8UOe5GNcFacmsU4yVcdS
	bW9rJdxgL9L0LXj8hmJOtfL+8ok/MYIx8GlFP90H7Cv2KTiTUnaw1+nwLLigjOsi/AHajK1+9JZ
	A4C5XDtVgiD9zrlN57ndF6XjJwobzPel6iT91KlIoUma4xT0tI+r05FG9vgrjNhc+jg==
X-Gm-Gg: ASbGncuY9+b9Lf7/ptZTXG3KG0aRfSHcpT7w62zf29LtpBvMMF5sK1310h118Rqy7Po
	yRXugQkN05PQLeqf9FkdMFzHtZmCyMwYHqeeX1Dv5d8ei5XhuyO7nROmX1FL3xFJ4IsdM9s66Md
	cknGvaG3rLT7Qy0fkEDOzjRrA5CDmgOkHlUGWHDh1JNTClJo2o139ZG9+jnvbj7DnicS42j0SLP
	H/Heu8LwoQh3bdl71XJY8KsqlZ5SSqHmv4U/hXiJCiia14/dkOj93tRwdoB2+rf1MIyn1AZrZ8m
	Bu1xDuEcDEJuahpQ9fO+2iAycgfGjxigT1t+1BhLUKi80nvttQAjXqyHZzdg5YzqQhjXwOwD/Hv
	vVJCI6dNr2D5yji0bA4q8kGYXtkf8bdwoD8aidYc=
X-Received: by 2002:a05:600c:c1c8:10b0:441:d228:3a07 with SMTP id 5b1f17b1804b1-442f8524304mr149504775e9.13.1747828643331;
        Wed, 21 May 2025 04:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0KMBtD5WJx4ooL3a0UXvmy6e0NgGrD0g1lhL4YMqCui6ClsRTI+kndzkAIb+csRRvzyqq2Q==
X-Received: by 2002:a05:600c:c1c8:10b0:441:d228:3a07 with SMTP id 5b1f17b1804b1-442f8524304mr149504545e9.13.1747828642894;
        Wed, 21 May 2025 04:57:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3defsm65243475e9.18.2025.05.21.04.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 04:57:22 -0700 (PDT)
Message-ID: <c8265d22-5cbb-4211-b91d-87965b8505e2@redhat.com>
Date: Wed, 21 May 2025 13:57:21 +0200
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CA27CAF4-DD4B-4350-90A6-AE9A808F05C0@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.05.25 13:16, Zi Yan wrote:
> On 19 May 2025, at 12:42, David Hildenbrand wrote:
> 
>>>>> +#ifdef CONFIG_MEMORY_ISOLATION
>>>>> +	if (flags & PB_migrate_isolate_bit)
>>>>> +		return MIGRATE_ISOLATE;
>>>>> +#endif
>>>>
>>>> If you call get_pfnblock_flags_mask() with MIGRATETYPE_MASK, how could you ever get PB_migrate_isolate_bit?
>>>
>>> MIGRATETYPE_MASK is ((BIT(PB_migratetype_bits) - 1) | PB_migrate_isolate_bit),
>>> so it gets PB_migrate_isolate_bit.
>>>
>>
>> Oh ... that's confusing.
>>
>>>>
>>>>
>>>> I think what we should do is
>>>>
>>>> 1) Rename get_pfnblock_flags_mask() to get_pfnblock_flags()
>>>>
>>>> 2) Remove the mask parameter
>>>>
>>>> 3) Perform the masking in all callers.
>>>
>>> get_pfnblock_flags_mask() is also used by get_pageblock_skip() to
>>> get PB_migrate_skip. I do not think we want to include PB_migrate_skip
>>> in the mask to confuse readers.
>>
>> The masking will be handled in the caller.
>>
>> So get_pageblock_skip() would essentially do a
>>
>> return get_pfnblock_flags() & PB_migrate_skip_bit;
>>
>> etc.
>>
>>>
>>>>
>>>>
>>>>
>>>> Maybe, we should convert set_pfnblock_flags_mask() to
>>>>
>>>> void set_clear_pfnblock_flags(struct page *page, unsigned long
>>>> 			      set_flags, unsigned long clear_flags);
>>>>
>>>> And better, splitting it up (or providing helpers)
>>>>
>>>> set_pfnblock_flags(struct page *page, unsigned long flags);
>>>> clear_pfnblock_flags(struct page *page, unsigned long flags);
>>>>
>>>>
>>>> This implies some more code cleanups first that make the code easier to extend.
>>>>
>>>
>>> The same due to PB_migrate_skip.
>>>
>>> Based on your suggestion, we could make {set,get}_pfnblock_flags_mask()
>>> internal APIs by prepending "__". They are only used by the new
>>> {get, set, clear}_pfnblock_flags() and {get, set, clear}_pageblock_{skip, isolate}().
>>> Then use {get, set, clear}_pfnblock_flags() for all migratetype operations.
>>>
>>> WDYT?
>>
>> In general, lgtm. I just hope we can avoid the "_mask" part and just handle it in these functions directly?
> 
> After implementing {get, set, clear}_pfnblock_flags(), I find that
> get_pfnblock_flags() is easy like you wrote above, but set and clear are not,
> since migratetype and skip/isolate bits are in the same word, meaning
> I will need to first read them out, change the field, then write them back.

Like existing set_pfnblock_flags_mask() I guess, with the try_cmpxchg() 
loop.

> But it will cause inconsistency if there is a parallel writer to the same
> word. So for set and clear, mask is required.
> 
> I can try to implement {get, set, clear}_pfnblock_bits(page,pfn, bits) to
> only handle standalone bits by using the given @bits as the mask and
> {set,get}_pageblock_migratetype() still use the mask.

We'd still have to do the try_cmpxchg() when dealing with multiple bits, 
right?

For single bits, we could just use set_bit() etc.

-- 
Cheers,

David / dhildenb

