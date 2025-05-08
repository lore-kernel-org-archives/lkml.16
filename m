Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A13C195FE8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746689772; cv=none; b=pQ16Yl0x91YeLb4G8zJxNP79Jsv9PigFu96kgKr+JLdISsi12NJFE1oO/7RmzYonzOlo+SvjZsVPQTDesffQfZSflXxz8IclITDETMyKLynn0QVAz7cLEyQkeijNB4qZMenXjF8/M//TyqY1ghHFaa8HOiR6gt0zea3FiDbv4ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746689772; c=relaxed/simple;
	bh=zOrPUNdHvyiZHwEvYfVJpopuYlByBTHa8YQeUapDlJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/HSZtfsaW3NNDidQTmOlLiYYeTUmCnfTWqKXY4I86kjrvHnZ3YZdCzILzIZvZdxNJ3WPHzrW3lxyF60JD29TozchHZtxWNMa5A4c0vLRmEgwAe4eJR0Cnne8GTuXB5WTOH86YHpXjY2F/DSZRKlBgYqmxXmHfSR4PfpmSpYA8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I2YnuQc9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I2YnuQc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746689767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=chsOuYEM1V/dxH7OxoM4RkbaD3inRdiiX5YasO+MpPw=;
	b=I2YnuQc9WLTT2SAwtowMdZGUpzj9jshT5F8IYG+h8LPDQUfq+G2RA1aCDYXfq3D4DnomFD
	+h9Kau50KobtQbE3rQXhP0hSjnk0xSglWN2z2aNyOIyMS1X4n6mLjf1OTzTLStxqSQ6rlU
	+f6TrIp86LTqqqcVaeO/3abbNVvpCkQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-oqInRTxjOvOyQvGbebN6LQ-1; Thu, 08 May 2025 03:36:06 -0400
X-MC-Unique: oqInRTxjOvOyQvGbebN6LQ-1
X-Mimecast-MFC-AGG-ID: oqInRTxjOvOyQvGbebN6LQ_1746689765
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43efa869b0aso4235645e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 00:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746689765; x=1747294565;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=chsOuYEM1V/dxH7OxoM4RkbaD3inRdiiX5YasO+MpPw=;
        b=TmNtnMbuwVqp+gNhoZ/Iu3JpX8vG4fyowYvLZ7Fr6PrcNjHCo7c7nC7PvyiJCnm3r/
         WH/RMtH95eLKJH/aukkP84/CzokCNOM0r7cYRSf1VOD1agGi+6Krlhx/5ysJ/mU1MFGu
         rDeeSoinUeTUH/BbopFnIxSpRaKvPp0u0Br9PgKm6qmHJSvYtKTyUHnAgLqooF5NVo+V
         ZYGk3giXz9GnyKAqGZvpwdNm8WUmjD5CVsEKk+BMRWN/6QUllaYTebo86BJq4ACCH473
         LmJVPgt4MQfCGvQ3hDkqVZgJ81KLHA25PyXnCRerXysQq890gPkuTCBgan6DoWLhFslY
         Rq+w==
X-Forwarded-Encrypted: i=1; AJvYcCV9KQULUYxrS2unmHeCES5ltgn7YLjG4E+wNsUeYhV+cKMk9sMwsheiG0S8iYzjCVWyFYLd7RvlPk4RSts=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQwLG7+XoH9TqTDR+e7xqqrFCTylOUAwTjV3RSkVxT9kbeRca
	Ter14iR8m8XUcQHCZQq1LOeoQ960pg7YhU/MIeQFc6LnSIlRQ2uaYpDTaYjtKs8/esYCukGZcQB
	zq6eoPpOuW1TYZX76v5x1RGMM0aH4puoTRRfQV7N3T/MxPol8ZdnUsaEs+j7vnw==
X-Gm-Gg: ASbGnct0QvM/HavhCtO7iFf1ltGXaBHRsdRTt77F1U2mmvAYrP9NBVgFnlDq62rtNC/
	Gw1FtKHdM15ghKfKJfb+J5Ai6kN1Ptsxijt8izjuYwqFf13JL3R2kPCgkrra0uJdHxxqFz4R9mv
	lPbUpL//Ni2EQo/qwP7/caMSXg/xrRSz9JKXwtwX1HiMJ4YfVZOOt35k78wVHgG+03zw/qhmhr0
	N1QF2REU3h4g0M6fj2njtJkDp18lJFLTIS+S6ZpIe0SkBQytlcFSceXzS4O1Svdu9ZEfZob/aKQ
	CUyEpczVV38rJCBp7or9xSPrAB2othD5FQrmeblO98W/BQ+7PLHti1jv2gLZTcoHoIjY5dDwywM
	HsGf98pARsPn2FbKjndYZYfSBvaZw2ru8NKqmods=
X-Received: by 2002:a05:600c:3d15:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-442d02eadb4mr21852195e9.14.1746689764714;
        Thu, 08 May 2025 00:36:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ6qecc86419uVuzGQkbaXLN5PPpFFn/+n6+qsO7w7Yyc9KsQKSk1l+Jt7oz1FQMlJxiCK7w==
X-Received: by 2002:a05:600c:3d15:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-442d02eadb4mr21851765e9.14.1746689764306;
        Thu, 08 May 2025 00:36:04 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7dc1sm26445095e9.34.2025.05.08.00.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 00:36:03 -0700 (PDT)
Message-ID: <a5056791-0a3e-40f6-bb83-7f39ef76b346@redhat.com>
Date: Thu, 8 May 2025 09:36:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: convert do_set_pmd() to take a folio
To: Zi Yan <ziy@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hannes@cmpxchg.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
 <a2faee74256c22cff2238487a86b154d5520c334.1746609191.git.baolin.wang@linux.alibaba.com>
 <aBtNrQNlL7hjLrTZ@casper.infradead.org>
 <d2348cc3-c9c6-4df0-82b6-1105edd44a75@redhat.com>
 <A243EBEA-22E7-4F57-9293-177500463B38@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <A243EBEA-22E7-4F57-9293-177500463B38@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.05.25 01:46, Zi Yan wrote:
> On 7 May 2025, at 17:24, David Hildenbrand wrote:
> 
>> On 07.05.25 14:10, Matthew Wilcox wrote:
>>> On Wed, May 07, 2025 at 05:26:13PM +0800, Baolin Wang wrote:
>>>> In do_set_pmd(), we always use the folio->page to build PMD mappings for
>>>> the entire folio. Since all callers of do_set_pmd() already hold a stable
>>>> folio, converting do_set_pmd() to take a folio is safe and more straightforward.
>>>
>>> What testing did you do of this?
>>>
>>>> -vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
>>>> +vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio)
>>>>    {
>>>> -	struct folio *folio = page_folio(page);
>>>>    	struct vm_area_struct *vma = vmf->vma;
>>>>    	bool write = vmf->flags & FAULT_FLAG_WRITE;
>>>>    	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
>>>>    	pmd_t entry;
>>>>    	vm_fault_t ret = VM_FAULT_FALLBACK;
>>>> +	struct page *page;
>>>
>>> Because I see nowhere in this patch that you initialise 'page'.
>>>
>>> And that's really the important part.  You seem to be assuming that a
>>> folio will never be larger than PMD size, and I'm not comfortable with
>>> that assumption.  It's a limitation I put in place a few years ago so we
>>> didn't have to find and fix all those assumptions immediately, but I
>>> imagine that some day we'll want to have larger folios.
>>>
>>> So unless you can derive _which_ page in the folio we want to map from
>>> the vmf, NACK this patch.
>>
>> Agreed. Probably folio + idx is our best bet.
>>
>> Which raises an interesting question: I assume in the future, when we have a 4 MiB folio on x86-64 that is *misaligned* in VA space regarding PMDs (e.g., aligned to 1 MiB but not 2 MiB), we could still allow to use a PMD for the middle part.
> 
> It might not be possible if the folio comes from buddy allocator due to how
> buddy allocator merges a PFN with its buddy (see __find_buddy_pfn() in mm/internal.h).
> A 4MB folio will always be two 2MB-aligned parts. In addition, VA and PA need
> to have the same lower 9+12 bits for a PMD mapping. So PMD mappings for
> a 4MB folio would always be two PMDs. Let me know if I miss anything.

PA is clear. But is mis-alignment in VA space impossible on all 
architectures? I certainly remember it being impossible on x86-64 and 
s390x (remaining PMD entry bits used for something else).

-- 
Cheers,

David / dhildenb

