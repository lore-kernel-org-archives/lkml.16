Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D1D28E7
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597269; cv=none; b=Rbw+5qO7sElyIOngoc2gt3fql98ZeCFGYqZJHIGtalIgaYOA74/QHyCKf/6v/vE/RdczMq1SEF0ekiWGSqID1niKWXC2hewvem+WURoadYv6RVEDdIlxzN6nylWE3XbHeegV4ZgRaLTvsUo4RVv8ceJisPKJSRN3KOEHxx/+Z/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597269; c=relaxed/simple;
	bh=2F13+WBGh69tuRqhGjrNAMQtEsMkeasNYqXF2rgVhtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGpkUCNPGvgkPZV+/17Fw2QHByVOm40VdyG2QovIVwPRZltSb4KDSDjmdRaaUVIOZGDej5NOroo5HC8ZR8Tuw3GcDGRO0lW2cl804dIJvM+rorH86FjtT/uFk8fX0x2ig3IKp5nrJEBVMVUizyIekXXQb4GHankAS9N6HQiF9ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FuAW+sf7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FuAW+sf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748597267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1PBV9a/LZW4fQlp+cup6+DwAjZlGKxU8VEnOtKkuFIc=;
	b=FuAW+sf7sukl+Kq6eafPA69KXov+VO+qJ5dD5Rhq8k13YHtPjNH1akGODQvDKqBKlg0BKV
	BlOL8lU7m9wTaZeqzIspLzwugeIdJwW/YD13OBzFQm4xR7DwN7ZbthtQwHNmny/LtutjeN
	0A8cEJPnYJq8B1qQ+ZG3jAHoGQcwEWg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-lLPI-i9JMmqLtPqBGZSUgA-1; Fri, 30 May 2025 05:27:45 -0400
X-MC-Unique: lLPI-i9JMmqLtPqBGZSUgA-1
X-Mimecast-MFC-AGG-ID: lLPI-i9JMmqLtPqBGZSUgA_1748597264
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442cdf07ad9so7356615e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748597264; x=1749202064;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1PBV9a/LZW4fQlp+cup6+DwAjZlGKxU8VEnOtKkuFIc=;
        b=VGUbSg8tQglKEatKpaZn1pGciIy8iqjoYF1FHEhWu/+i+vQNc6bUH1FzxYFfGm1jzN
         gXK2ZZ8DdI+6DdWxHZrIN+g7ZNbtMvWLoqhFVKdFCd5Oz6za8gSOr4Q8BwFpC19ztoYV
         1DgV2RmPPG+ckhDFQflesRee9nFfThcAmTuKid+I0carNsuK4KWQa9K20uxBysVnQ5Rb
         YJICZufeHSVO1oyHra7xrO+vYrhheg7tpPhrnAKSwWz7iqa7PVrer9sPXIiLq5Ozz082
         vjaKofUEMqSvW8ExXcEvM4/n8GRxTfkGJOqArNAefV8bPFlOTFnY9BP/JDgpjdlrpd1Y
         3fOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSqaE8gGGhzSdUW7mBH+cYdJWYBfT0SJzpLk0Pb7MjX9ercli1hTOAkJWD7tcIcRkSzmXskKsK+iM/vbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGksc4gR2GhAXD2+w9IYAGIop6IwKn/Ry6aeENSooQByF/DbGB
	ZcuTiDGcmPiXUYFNj1VbJV+/oTr2oJ/YVtrFUqgAPVwWBxGgNHPeZzXVYYrZeTKmp8dK+GtNCd0
	PJ2rWbmXv9bh+hjq2Nco2Jf5ufFuZ5EdkwIbn8FrZrF2UJcYdvWX0AKdOSu2Yzz0yJg==
X-Gm-Gg: ASbGnct0Z8w+rw8SMTBgTnbZLRRIy7fColX5rAYrACmcbpAwKK9eCad5iqnt04UF60U
	5SmfLgKbdFsDNqsOpRQkVFG707kN6WIN5TDAxXIlorhvwsIDy9dOMWOMtd0pzMuUxOlSWJFCnzF
	ccfFAwWdrgr8IbTUoevjt4C+nN1ul3N1El8zDZHe2Yz7j10Afvl0A8xaQSeM7vKfdKoVDRrfx7N
	pGjJ83hWgq+rYsZWmCU3uhYpdAr/61ScBubSmhpBSnHQAUvwoHpnhcwdXDCa+eEFOAmtWUFbGuL
	ZTUzUSZukbW7HF9WvOsxMjnwJOXpe6APom3R7TU+2HqsYyiC1mPan8hxQ0seNLM5h0IuPw+DeUE
	xT1EnaEnKoJ6/gHTePhPgRfgmgVlQnTJZeoCvXKM=
X-Received: by 2002:a05:600c:3b8b:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-450d8876132mr12222805e9.24.1748597264268;
        Fri, 30 May 2025 02:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQdY6YWefTxM8YvOu7ZkhfBRFXt6xgQbeM3AJW5so2JdhELLq7VspnEked2wUBNMkbAWhI6Q==
X-Received: by 2002:a05:600c:3b8b:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-450d8876132mr12222475e9.24.1748597263789;
        Fri, 30 May 2025 02:27:43 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f194sm13143635e9.4.2025.05.30.02.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 02:27:43 -0700 (PDT)
Message-ID: <9c32dbf6-527f-465b-9010-f5b22cbac075@redhat.com>
Date: Fri, 30 May 2025 11:27:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, Oleg Nesterov <oleg@redhat.com>,
 mhiramat@kernel.org, peterz@infradead.org, Liam.Howlett@oracle.com,
 akpm@linux-foundation.org, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 pulehui@huawei.com
References: <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
 <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
 <57533126-eb30-4b56-bc4d-2f27514ae5ad@huaweicloud.com>
 <cba0155e-d2b9-41fa-bc51-f3738ae73cff@redhat.com>
 <956124be-c73c-4023-9edd-25372f3f865a@huaweicloud.com>
 <ccf359b0-8baa-4209-b2c3-75e3813ca804@redhat.com>
 <b2dd29b0-aa12-4cb7-9c05-d3a998f7b0da@lucifer.local>
 <172df994-7f24-4fbb-876c-4fab22937177@redhat.com>
 <205f8165-449c-441f-8ee9-58f69d23dbeb@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <205f8165-449c-441f-8ee9-58f69d23dbeb@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30.05.25 11:03, Lorenzo Stoakes wrote:
> On Fri, May 30, 2025 at 10:50:25AM +0200, David Hildenbrand wrote:
>> On 30.05.25 10:41, Lorenzo Stoakes wrote:
>>> On Fri, May 30, 2025 at 10:33:16AM +0200, David Hildenbrand wrote:
>>>> On 29.05.25 18:07, Pu Lehui wrote:
>>>>>
>>>>> On 2025/5/28 17:03, David Hildenbrand wrote:
>>>>>> On 27.05.25 15:38, Pu Lehui wrote:
>>>>>>> Hi David,
>>>>>>>
>>>>>>> On 2025/5/27 2:46, David Hildenbrand wrote:
>>>>>>>> On 26.05.25 17:48, Oleg Nesterov wrote:
>>>>>>>>> Hi Lehui,
>>>>>>>>>
>>>>>>>>> As I said, I don't understand mm/, so can't comment, but...
>>>>>>>>>
>>>>>>>>> On 05/26, Pu Lehui wrote:
>>>>>>>>>>
>>>>>>>>>> To make things simpler, perhaps we could try post-processing, that is:
>>>>>>>>>>
>>>>>>>>>> diff --git a/mm/mremap.c b/mm/mremap.c
>>>>>>>>>> index 83e359754961..46a757fd26dc 100644
>>>>>>>>>> --- a/mm/mremap.c
>>>>>>>>>> +++ b/mm/mremap.c
>>>>>>>>>> @@ -240,6 +240,11 @@ static int move_ptes(struct
>>>>>>>>>> pagetable_move_control
>>>>>>>>>> *pmc,
>>>>>>>>>>                      if (pte_none(ptep_get(old_pte)))
>>>>>>>>>>                              continue;
>>>>>>>>>>
>>>>>>>>>> +               /* skip move pte when expanded range has uprobe */
>>>>>>>>>> +               if (unlikely(pte_present(*new_pte) &&
>>>>>>>>>> +                            vma_has_uprobes(pmc->new, new_addr,
>>>>>>>>>> new_addr +
>>>>>>>>>> PAGE_SIZE)))
>>>>>>>>>> +                       continue;
>>>>>>>>>> +
>>>>>>>>>
>>>>>>>>> I was thinking about
>>>>>>>>>
>>>>>>>>>         WARN_ON(!pte_none(*new_pte))
>>>>>>>>>
>>>>>>>>> at the start of the main loop.
>>>>>>>>>
>>>>>>>>> Obviously not to fix the problem, but rather to make it more explicit.
>>>>>>>>
>>>>>>>> Yeah, WARN_ON_ONCE().
>>>>>>>>
>>>>>>>> We really should fix the code to not install uprobes into the area we
>>>>>>>> are moving.
>>>>>>> Alright, so let's try this direction.
>>>>>>>
>>>>>>>>
>>>>>>>> Likely, the correct fix will be to pass the range as well to
>>>>>>>> uprobe_mmap(), and passing that range to build_probe_list().
>>>>>>>
>>>>>>> It will be great. But IIUC, the range we expand to is already included
>>>>>>> when entering uprobe_mmap and also build_probe_list.
>>>>>>
>>>>>> Right, you'd have to communicate that information through all layers
>>>>>> (expanded range).
>>>>>>
>>>>>> As an alternative, maybe we can really call handle_vma_uprobe() after
>>>>>> moving the pages.
>>>>>
>>>>> Hi David,
>>>>>
>>>>> Not sure if this is possible, but I think it would be appropriate to not
>>>>> handle this uprobe_mmap at the source, and maybe we should make it clear
>>>>> that new_pte must be NULL when move_ptes, otherwise it should be an
>>>>> exception?
>>>>
>>>> Yeah, we should ay least document that if we find any non-none pte in the
>>>> range we are moving to, we have a big problem.
> 
> By the way I agree with this.
> 
>>>>
>>>> I think the main issue is that vma_complete() calls uprobe_mmap() before
>>>> moving the page tables over.
>>>
>>> Well vma_complete() is not _normally_ invoked before moving page tables,
>>> it's mremap that's making things strange :)
>>>
>>> That's why I think my suggested approach of specifically indicating that we
>>> want different behaviour for mremap is a reasonable one here, as it special
>>> cases things for this case.
>>>
>>> However...
>>>
>>>>
>>>> If we could defer the uprobe_mmap() call, we might be good.
>>>>
>>>> The entry point is copy_vma_and_data(), where we call copy_vma() before
>>>> move_page_tables().
>>>>
>>>> copy_vma() should trigger the uprobe_mmap() through vma_merge_new_range().
>>>>
>>>> I wonder if there might be a clean way to move the uprobe_mmap() out of
>>>> vma_complete(). (or at least specify to skip it because it will be done
>>>> manually).
>>>
>>> ...I would also love to see some means of not having to invoke
>>> uprobe_mmap() in the VMA code, but I mean _at all_.
>>>
>>> But that leads into my desire to not do:
>>>
>>> if (blah blah)
>>> 	some_specific_hardcoded_case();
>>>
>>> I wish we had a better means of hooking stuff like this.
>>>
>>> However I don't think currently we can reasonably do so, as in all other
>>> merge cases we _do_ want to invoke it.
>>
>> "all other" -- not so sure.
>>
>> Why would we invoke uprobe when merging VMAs after mprotect, mremap,
>> madvise, ordinary mremap where we are not mapping anything new but just ...
>> merging VMAs?
>>
>> Really, we need to invoke uprobe only when adding new VMAs or extending
>> existing VMAs -- mapping new file ranges some way.
>>
>> Or am I missing something important?
> 
> Well, this is where my limited knowledge of uprobe comes in.

Let me try to summarize it:

Essentially, what it does is go over the VMA to find where to install 
breakpoints. A breakpoint is essentially faulting in the file page, to 
then trigger a COW fault to get an anonymous page instead that we can 
modify to ... install the breakpoint.

So wherever we have a breakpoint, we want to have an anonymous page 
mapped later.

That is only required when we map a new file range. When ordinarily 
merging/splitting/moving, we already called uprobe before and installed 
the breakpoints.

Calling uprobe_mmap() when we already installed breakpoints is not 
really problematic, only suboptimal.

Calling uprobe_mmap() before moving page tables is bad.

-- 
Cheers,

David / dhildenb

