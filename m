Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FF72116F4
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748594003; cv=none; b=gKt6zBr3HTpGECpAwuRaf8Sim5Mw0pg+7ARgEggPyJ7QJhkSaTtqZc7rFy7DcOo8USYxiHSfNAXlY7wBCBZyX6FKaRyELLgehTKKi0cailNMUHsSV7cylU4bjS5p2guhcyKENY05+Cy/URIxZJQ0U/gQOWqW2TleHz7hR/11i4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748594003; c=relaxed/simple;
	bh=vQBaYMlKWN8JmoqRvx19u6asWfbiXRcDQomdkOK7UzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzu/xTXtF6ZWbPtoXOeXhjtoIHLm27zMXrJkIu1jWdQb3fStD8qn1OlklQk6xjWKC3Z+dVCWHP37uCg9x3/AalcFIvy82HVT5Y3ZQusHc5gNyRTg+vK8r/cPnB3iYbwp/aacfz/OM2zG/OaLO9wzfahpdqIMxjih6cRd91pIJRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e7EOwHE/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e7EOwHE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748594000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KXrmciw8fw3IVBDeiE8IPSrAAHDX+SY7wQ0MY8GKbnM=;
	b=e7EOwHE/45MMJTDiL5gd9vqi+FtaQszq/wNWJxeZxQ+77RRDkCkU396sL0TvNx5v/6M8b8
	iQ6dem2Hbs5U/CjDyQEh2AeC2rNjF1zTjCp+LmEATvXp7/yr86VB0Wu6GKgMHquroBf1O8
	IffNKwrn9qJIQ74iXNqN0qXjEfvIlLE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-by8XyKquOta_bLItEDorag-1; Fri, 30 May 2025 04:33:19 -0400
X-MC-Unique: by8XyKquOta_bLItEDorag-1
X-Mimecast-MFC-AGG-ID: by8XyKquOta_bLItEDorag_1748593998
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d021b9b1so5904365e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748593998; x=1749198798;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KXrmciw8fw3IVBDeiE8IPSrAAHDX+SY7wQ0MY8GKbnM=;
        b=AS7b+Q7SWtfzSVohJDtulNOA3INagV1L1Avs0bKM9hh2rS6SxBjZGOvSttAxCb31jW
         4ZmdsLZZBPTjQO7sntgYQ4adprbZojd3Lp2BD8l7D7hactUUFQKZlnjLW8pZwcKTW58r
         nvxVklEASpKQ20JoHZ5dMwpbwTuMgU1h2pi5cO9lMXr4LKQtTxY0UxurXTAKMbsR+raO
         qbbk9kN6H16EZu87l7bXoZl6Uvntni7lmrXfKmx+mxYMaiz0CisRpjplL/KjJaCh1aqF
         5MzFJgvUzJG56uOLkDDHAj6gAdyJnwvb7yBLVar8OA8aDxZpd1iCKZ05EU/gdD7tZU18
         xaEw==
X-Forwarded-Encrypted: i=1; AJvYcCV7HCoGbZIunLuiT6kkcYdjBsEreeThcZTF4jpjYl3DMB8O4+JKiCPgMJj4K/E9cf+bNlYxNf9ZQu9ZOdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMFL4F+H0QMPi1jksU1xfPbzKEQ++5wHpA+6VGSeKqLWp1cpbT
	U9BWxeB5K7UGeJxO+gSdDUSMXkF8mMZZdZp25CYV8dxQhRKZzDOKXkskxzSc0PRe27u7YVw5fRH
	82KFVqN+Ktfs9iMIvHTZ4rXHaaE6KRPBlclmpWO10PIk8KillI/1/IVE8GXvX2wdgow==
X-Gm-Gg: ASbGncu0ghyjOsWebXyuykdVuK0rcjKeq73hWbxyVyi+bvgX0cxvrYxIJrls21esY3s
	a+KawPSaWWYvyvvCHuF17UWwCucHFX2sMLXNA9telUAP2TtIJYv0d6Yp5yVfwVAq3LOpWnQY7B0
	soSqn3TMptjS72Et8BiMfnxnmlu8NulM9BBgXNox3UIXM7UI4z/n4T7QGJsrQCwk1E4Jnzdpgjp
	hp+jcziIWsgInwEEQDdfjAAblFlkTQ4pJhDOpNYy/8M78RpYKfPHjNw4mffjSKv8HPSld3+wc1v
	qFOmjgDtiNvv22EGebG0JMwbSeyITYhCPv2lKHpKV0R+R4CkwwHbHChlI0DY0Oi66TCfeqNQ0tb
	KcccPPJRVMAN1Gz1jimY6MxDImLphHXk9ad7C8AE=
X-Received: by 2002:a05:600c:8509:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-450d64c313cmr24746715e9.4.1748593998068;
        Fri, 30 May 2025 01:33:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVcr8PZ5QbPXx9wYXWNy5yUlTGaH5PzQJYlbqrT8pMQ5rU+6cBIGsOcxKenkA6npxlPlPeIg==
X-Received: by 2002:a05:600c:8509:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-450d64c313cmr24746415e9.4.1748593997547;
        Fri, 30 May 2025 01:33:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009fdbasm4086329f8f.85.2025.05.30.01.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 01:33:17 -0700 (PDT)
Message-ID: <ccf359b0-8baa-4209-b2c3-75e3813ca804@redhat.com>
Date: Fri, 30 May 2025 10:33:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
To: Pu Lehui <pulehui@huaweicloud.com>, Oleg Nesterov <oleg@redhat.com>
Cc: lorenzo.stoakes@oracle.com, mhiramat@kernel.org, peterz@infradead.org,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, pulehui@huawei.com
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
 <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
 <57533126-eb30-4b56-bc4d-2f27514ae5ad@huaweicloud.com>
 <cba0155e-d2b9-41fa-bc51-f3738ae73cff@redhat.com>
 <956124be-c73c-4023-9edd-25372f3f865a@huaweicloud.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <956124be-c73c-4023-9edd-25372f3f865a@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29.05.25 18:07, Pu Lehui wrote:
> 
> On 2025/5/28 17:03, David Hildenbrand wrote:
>> On 27.05.25 15:38, Pu Lehui wrote:
>>> Hi David,
>>>
>>> On 2025/5/27 2:46, David Hildenbrand wrote:
>>>> On 26.05.25 17:48, Oleg Nesterov wrote:
>>>>> Hi Lehui,
>>>>>
>>>>> As I said, I don't understand mm/, so can't comment, but...
>>>>>
>>>>> On 05/26, Pu Lehui wrote:
>>>>>>
>>>>>> To make things simpler, perhaps we could try post-processing, that is:
>>>>>>
>>>>>> diff --git a/mm/mremap.c b/mm/mremap.c
>>>>>> index 83e359754961..46a757fd26dc 100644
>>>>>> --- a/mm/mremap.c
>>>>>> +++ b/mm/mremap.c
>>>>>> @@ -240,6 +240,11 @@ static int move_ptes(struct
>>>>>> pagetable_move_control
>>>>>> *pmc,
>>>>>>                    if (pte_none(ptep_get(old_pte)))
>>>>>>                            continue;
>>>>>>
>>>>>> +               /* skip move pte when expanded range has uprobe */
>>>>>> +               if (unlikely(pte_present(*new_pte) &&
>>>>>> +                            vma_has_uprobes(pmc->new, new_addr,
>>>>>> new_addr +
>>>>>> PAGE_SIZE)))
>>>>>> +                       continue;
>>>>>> +
>>>>>
>>>>> I was thinking about
>>>>>
>>>>>       WARN_ON(!pte_none(*new_pte))
>>>>>
>>>>> at the start of the main loop.
>>>>>
>>>>> Obviously not to fix the problem, but rather to make it more explicit.
>>>>
>>>> Yeah, WARN_ON_ONCE().
>>>>
>>>> We really should fix the code to not install uprobes into the area we
>>>> are moving.
>>> Alright, so let's try this direction.
>>>
>>>>
>>>> Likely, the correct fix will be to pass the range as well to
>>>> uprobe_mmap(), and passing that range to build_probe_list().
>>>
>>> It will be great. But IIUC, the range we expand to is already included
>>> when entering uprobe_mmap and also build_probe_list.
>>
>> Right, you'd have to communicate that information through all layers
>> (expanded range).
>>
>> As an alternative, maybe we can really call handle_vma_uprobe() after
>> moving the pages.
> 
> Hi David,
> 
> Not sure if this is possible, but I think it would be appropriate to not
> handle this uprobe_mmap at the source, and maybe we should make it clear
> that new_pte must be NULL when move_ptes, otherwise it should be an
> exception?

Yeah, we should ay least document that if we find any non-none pte in 
the range we are moving to, we have a big problem.

I think the main issue is that vma_complete() calls uprobe_mmap() before 
moving the page tables over.

If we could defer the uprobe_mmap() call, we might be good.

The entry point is copy_vma_and_data(), where we call copy_vma() before 
move_page_tables().

copy_vma() should trigger the uprobe_mmap() through vma_merge_new_range().

I wonder if there might be a clean way to move the uprobe_mmap() out of 
vma_complete(). (or at least specify to skip it because it will be done 
manually).

-- 
Cheers,

David / dhildenb

