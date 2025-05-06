Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1A618D656
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746542051; cv=none; b=fPBqqDZROntP4XT9ivKAONjGVt6SZDiaNX4h1aZQK6g4dmcn/jjabR4tHIH4zLI4S5dFTxwlWkicGvmxoysrKU5+NnqHl+DL3xh9fEN6vnEo4g2ZXppPcj1ydTVNBhCTOR1LlOZuMdlxA/XeXuMdPugzAWFxnhcjX3Xkh3QP3ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746542051; c=relaxed/simple;
	bh=kkFk/0AGhto/RyNrBsPnwKy+9ZIcCRZfLTqarJRbPaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mqb/yko8z6dpK02MZzDBoTOl5obxG9ZIAeLLGohIlDcUq93i7Q7oTF5fMqB4rfsTtmp0qQGi0TNR9QkLhEu/Cpp7ZOs4dFn+wRFX6MeRnYKWWqSfgzCZQnl2M2XWcyKfxCxJQQoLFN3NXrgMPAXiDahOIubSQAiSBUBkdhhcW6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ia69dSt0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ia69dSt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746542048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zSYTzLzA4I8JDg4pBsPS0ZO1xAUoaORmUFU9cepMeAE=;
	b=Ia69dSt008n8RYfVGfkicPAHCzoK95SENX1X3UiSHoGr42wz8aJRMzfsRmZ/03hmkek/u9
	lyyuMoo6aAE+TteJNczGn3sAXsf2OyUkL5w5ZteD/dBgjv4O1AbsaMgjLxEFQm7IXjaZb8
	xCoY8nH5m5gNYeUCXYwmsYPQ/SN6fOU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-A0MRuL0bOIWpyLu2VT6THA-1; Tue, 06 May 2025 10:34:07 -0400
X-MC-Unique: A0MRuL0bOIWpyLu2VT6THA-1
X-Mimecast-MFC-AGG-ID: A0MRuL0bOIWpyLu2VT6THA_1746542046
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912d5f6689so2748195f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746542046; x=1747146846;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zSYTzLzA4I8JDg4pBsPS0ZO1xAUoaORmUFU9cepMeAE=;
        b=iwSw+JP0TyD9RqHupk3ZUuf1Uo6n/zD9pY1dczpZS7uZbkh+5CZ/Oq9BxbRt03tjEd
         9VDeR0r87WheagdI2kyhD8jBEaj5dBLPt8e2RXo5ddl4p1JazjQEYOv1UF6rsMuYq57y
         C55Gwsg4+wUPzIzL+qDK3lPdfidcIpSYo+KAIAD/ASW2amb+KTehu/ISYa584LnH7B+2
         w/TasD06zZDGKgA2GQGf5KewDnOXm0M/CVA3hqUNb5ibtzy5JpYN+wL6rnjWjYHb/rT1
         GOo7GLBgYnndcN5klg1cL64wVKBqC9ZHwHU7jzbIwwav6w/KN77oJa106fBRhtw/nFhN
         Cv3A==
X-Forwarded-Encrypted: i=1; AJvYcCXJEtoMjA9kOpx0JdxbfEigYtCTbdg9B/oepmrxYRpilqJilb0q2//Y7eVO9+lzzEn8wje3oDoQ8LthXX8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbz603oP2yQMqBkJaHo9LYWyIFxdJ5r8kIUsrjisVZS5s+3sql
	8B98gGapw05bz9lRmw+KJ51TU3ejbMDwIAuGUpf8nJZoyGDYRXTEfojNxTduztNyqrdEYmFg8/W
	szhW3TSYooWhEgyh0MDsQWJoglAwXqdgKSVC575+dmom2s8EfrV9vk2r3IMv9mg==
X-Gm-Gg: ASbGncsfRixbqJyAGGOyhX0QNFEqClI6qn0cCl6QYaDi9ZT/SO+exImDvmlSrKmXxd6
	167MQajpmtAQvEa6151Z34JbhS5D1SnRpfIa0xDIt3340tOZKRBdSO6D+s7ZMaSAJZQPpGHibT6
	j7HMPUC4MJoEQbke2IDKEMGZaC64oKnAycdtPvAcUZIZ5bMr+SsdojesYOYIkctzNBPnsjYxfEu
	Jr7VmzmlAUcjFt4k77BmnMwHvICNPWf9x6HyeB2RIae8KazGnR+B1r6uiyfDze4H32511GSP2wK
	IG3VXrol9xWBgqQ/eKQyQn6l8WajVK12+lm67nTiAEbgHGh6EbI=
X-Received: by 2002:a05:6000:2204:b0:39c:268e:ae04 with SMTP id ffacd0b85a97d-3a09fd0d09dmr8962673f8f.0.1746542046359;
        Tue, 06 May 2025 07:34:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUJh5j9TVIQWsrv8+lQopvkfyv6q0sW1QF6jcjHqVsYskzyqmZ/uFzWwuXJfP4bPKTDBUOGA==
X-Received: by 2002:a05:6000:2204:b0:39c:268e:ae04 with SMTP id ffacd0b85a97d-3a09fd0d09dmr8962630f8f.0.1746542045945;
        Tue, 06 May 2025 07:34:05 -0700 (PDT)
Received: from ?IPV6:2a01:599:915:8911:b13f:d972:e237:7fe2? ([2a01:599:915:8911:b13f:d972:e237:7fe2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a286b9sm170753685e9.28.2025.05.06.07.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:34:05 -0700 (PDT)
Message-ID: <faff1a33-28e6-4fd9-9276-fb901192f17a@redhat.com>
Date: Tue, 6 May 2025 16:34:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
 <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
 <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
 <0857761c-bb4c-4ea5-a96a-90d555673527@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <0857761c-bb4c-4ea5-a96a-90d555673527@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06.05.25 11:16, Dev Jain wrote:
> 
> 
> On 29/04/25 2:57 pm, David Hildenbrand wrote:
>> On 29.04.25 11:19, David Hildenbrand wrote:
>>>
>>>>     #include "internal.h"
>>>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned
>>>> long addr,
>>>> -                 pte_t pte)
>>>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned
>>>> long addr,
>>>> +                  pte_t pte, struct folio *folio, unsigned int nr)
>>>>     {
>>>>         struct page *page;
>>>> @@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct
>>>> *vma, unsigned long addr,
>>>>              * write-fault handler similarly would map them writable
>>>> without
>>>>              * any additional checks while holding the PT lock.
>>>>              */
>>>> -        page = vm_normal_page(vma, addr, pte);
>>>> -        return page && PageAnon(page) && PageAnonExclusive(page);
>>>> +        if (!folio)
>>>> +            folio = vm_normal_folio(vma, addr, pte);
>>>> +        return folio_test_anon(folio) && !
>>>> folio_maybe_mapped_shared(folio);
>>>
>>> Oh no, now I spot it. That is horribly wrong.
>>>
>>> Please understand first what you are doing.
>>
>> Also, would expect that the cow.c selftest would catch that:
>>
>> "vmsplice() + unmap in child with mprotect() optimization"
>>
>> After fork() we have a R/O PTE in the parent. Our child then uses
>> vmsplice() and unmaps the R/O PTE, meaning it is only left mapped by the
>> parent.
>>
>> ret = mprotect(mem, size, PROT_READ);
>> ret |= mprotect(mem, size, PROT_READ|PROT_WRITE);
>>
>> should turn the PTE writable, although it shouldn't.
>>
>> If that test case does not detect the issue you're introducing, we
>> should look into adding a test case that detects it.
>>
> 
> Hi David, I am afraid I don't understand my mistake :( PageAnon(page)
> boils down to folio_test_anon(folio). Next we want to determine whether
> the page underlying a PTE is mapped exclusively or not.

No. :)

There is your mistake.

We need to know if this folio page is *exclusive* not if the folio is 
*mapped exclusively*.

I know, it's confusing, but that's an important distinction.

You really have to test all PAE bits. I recently sent a mail on how we 
could remove PAE and encode it in the PTE value itself (W || (!W 
+dirty)), which would mean that we could batch more easily. For the time 
being, we have to stick with what we have.

-- 
Cheers,

David / dhildenb

