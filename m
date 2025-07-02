Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C35266B59
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457323; cv=none; b=uPd45h/fMncxZ/UPL874GikdZmySDjpWVDyKzxR8EX9acTFsXLSmCdZpQPXSEC9KenRsvU/aqcpNGMNkAS2TWcRO1NnPFxTdGo62cNOrCQDUkM+1m16225+u2YbBs3wInsQmYmpDQX6jUuFFp2VLRpA5QEiJG7gTNYYlAqBA6fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457323; c=relaxed/simple;
	bh=AmOPAC6eGsbklHVC0ak4VdValqf072fgRWjAO0Cc43s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Eutbl06HMMMHoZJxTsvP/6IKPgrgqUvkWdnB/olltr3lfp2trZl9KYCY5XVf3EjNiSUZ3MuepiiepORcv7X0cwk1NK+auygo5ZQn95V/QrRwLOc3kOLhbBf4AzlhufH3BMPSq4aBB1pGYR3eihglk0+iSrYVchb3h6IZNqjveZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2eRVkx3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2eRVkx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751457320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hlJGla0k5BktCvOyl7SQfDyMmkhXH/vK2Ej4qZFb7DA=;
	b=U2eRVkx3aaAYHp3AgSyRipGvKMxU8emIRr6dCH9Q/ob31w0ESr5C7d8ZUtxY6oCtQjOE4A
	M/mbBi0ZoTL1CX8Ib/FMFhF4q5P7u9p7yd9yuGrvLudF5mQllLIx6cnomFtMOyH2ZmdxHB
	xbSlAwoKoI/P1ttwDuFjbMj/Wg3T3M8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-KFwY6V6iP8m7BjHYO-126g-1; Wed, 02 Jul 2025 07:55:19 -0400
X-MC-Unique: KFwY6V6iP8m7BjHYO-126g-1
X-Mimecast-MFC-AGG-ID: KFwY6V6iP8m7BjHYO-126g_1751457318
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so3387339f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751457318; x=1752062118;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hlJGla0k5BktCvOyl7SQfDyMmkhXH/vK2Ej4qZFb7DA=;
        b=SBui8AAkyTu5GWj6RF+ZjxgrxvR3RGsf1rJSpNgjyPQSkQldzU7kZU3rIllo/bROMR
         yKQCu2KDt/kyjm625nrlRghNv0Cgqr1KP0j2lHtJDRwwX10JrVjo7Mrsb6nGbUfrlFHN
         8OUOk6qwNva/ZyQR57pD8lxSyBGc+OTTZlC2mWByyYvWGxOfNH17GFR2C8pGSZ0qaopA
         p1nGpqTrxlcG7PynJkLEQIHirDdGr6WOo4P8Vk9dk4l4kifm53T0nUo0WsVvG7RuXaIW
         iphsXNj9O0A8+gGed35ZZgTwY8prEFRe+LsyWfqPjntSHfwSvfco8XbI6RaUyWLoBQsO
         7TCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV53Pycfo01FGFLTG4LLs0ZIR1S08mXDcmZ3m/vUsFmoYau9p9183FFuQK14q/zIgrW/1Rm61gKWKonk/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnW8E2gKE+s4W2PmFxBZUxutZZxsHZazA89lF18PJ0xbVlC4KT
	9XTp1sgc8yvJzKyjvg53ZRpNXwQsO6hUEP7Jr1Cdx6D7hA+8UZmYCuMMXuTvJbPE6yJPnmv6NyJ
	L0oqhbCyTs7Rrp+1NxT0F57M3a7pMappdVCkARGXxeaxuzC017BzvbK1YhASTq+Ohkw==
X-Gm-Gg: ASbGncv3oz2XijwVQq49dbwRzmHlX7cmG7x8saly0iWA6JoVO9ahXN0ODlbQ6hWcIoH
	wNQ6lDZYfQCmkFkNnb6f06rrj9nW/79Sgbkn6A4JmuyKJbSupuWZSb0QbO1yrsqEa9zQGmRkQBT
	aZlm1iXUYDEdO2U64CDYamumANZNTQe1nDTOsnTdHD82wCs4QLDyc6gpIE06j/HWR69bkmwmzZ3
	U5dl3ijaUISWRsQeSqEfCZFMxB7gxwxxH7gxGLW7JdDUZtLxw0qOgqp0umynWyiMfR9ijSBW6dU
	27zoSyZ3NFq9csv2vYCgypnQleykyeoYUddK0qT5tx0iRyF1jkVELUc=
X-Received: by 2002:a05:6000:2284:b0:3a5:5270:a52c with SMTP id ffacd0b85a97d-3b1faa90a2dmr1759171f8f.0.1751457318184;
        Wed, 02 Jul 2025 04:55:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3vmKKUJOsT3Tf8H8lIopwPwGp5oFIZiUDLemvkce2+gQfKZ+/J+13Nf7bWmkDbl/egd4Sdw==
X-Received: by 2002:a05:6000:2284:b0:3a5:5270:a52c with SMTP id ffacd0b85a97d-3b1faa90a2dmr1759151f8f.0.1751457317598;
        Wed, 02 Jul 2025 04:55:17 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5966csm16012096f8f.72.2025.07.02.04.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 04:55:16 -0700 (PDT)
Message-ID: <4c5ea64d-c33c-4cf5-8e71-08bc50a5f940@redhat.com>
Date: Wed, 2 Jul 2025 13:55:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: support large mapping building for tmpfs
From: David Hildenbrand <david@redhat.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <d4cb6e578bca8c430174d5972550cbeb530ec3fe.1751359073.git.baolin.wang@linux.alibaba.com>
 <b8258f91-ad92-419e-a0a1-a8db706c814c@redhat.com>
 <fca114c1-9699-4dd7-9bca-83a5f5ac615d@linux.alibaba.com>
 <ec5d4e52-658b-4fdc-b7f9-f844ab29665c@redhat.com>
 <67c79f65-ca6d-43be-a4ec-decd08bbce0a@linux.alibaba.com>
 <7b17af10-b052-4719-bbce-ffad2d74006a@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7b17af10-b052-4719-bbce-ffad2d74006a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 13:38, David Hildenbrand wrote:
> 
>>> So by mapping more in a single page fault, you end up increasing "RSS".
>>> But I wouldn't
>>> call that "expected". I rather suspect that nobody will really care :)
>>
>> But tmpfs is a little special here. It uses the 'huge=' option to
>> control large folio allocation. So, I think users should know they want
>> to use large folios and build the whole mapping for the large folios.
>> That is why I call it 'expected'.
> 
> Well, if your distribution decides to set huge= on /tmp or something
> like that, your application might have very little saying in that, right? :)
> 
> Again, I assume it's fine, but we might find surprises on the way.
> 
>>>
>>> The thing is, when you *allocate* a new folio, it must adhere at least to
>>> pagecache alignment (e.g., cannot place an order-2 folio at pgoff 1) --
>>
>> Yes, agree.
>>
>>> that is what
>>> thp_vma_suitable_order() checks. Otherwise you cannot add it to the
>>> pagecache.
>>
>> But this alignment is not done by thp_vma_suitable_order().
>>
>> For tmpfs, it will check the alignment in shmem_suitable_orders() via:
>> "
>> 	if (!xa_find(&mapping->i_pages, &aligned_index,
>> 			aligned_index + pages - 1, XA_PRESENT))
>> "
> 
> That's not really alignment check, that's just checking whether a
> suitable folio order spans already-present entries, no?
> 
> Finding suitable orders is still up to other code IIUC.
> 
>>
>> For other fs systems, it will check the alignment in
>> __filemap_get_folio() via:
>> "
>> 	/* If we're not aligned, allocate a smaller folio */
>> 	if (index & ((1UL << order) - 1))
>> 		order = __ffs(index);
>> "
>>
>>> But once you *obtain* a folio from the pagecache and are supposed to map it
>>> into the page tables, that must already hold true.
>>>
>>> So you should be able to just blindly map whatever is given to you here
>>> AFAIKS.
>>>
>>> If you would get a pagecache folio that violates the linear page offset
>>> requirement
>>> at that point, something else would have messed up the pagecache.
>>
>> Yes. But the comments from thp_vma_suitable_order() is not about the
>> pagecache alignment, it says "the order-aligned addresses in the VMA map
>> to order-aligned offsets within the file",
> 
> Let's dig, it's confusing.
> 
> The code in question is:
> 
> if (!IS_ALIGNED((vma->vm_start >> PAGE_SHIFT) - vma->vm_pgoff,
> 		hpage_size >> PAGE_SHIFT))
> 
> So yes, I think this tells us: if we would have a PMD THP in the
> pagecache, would we be able to map it with a PMD. If not, then don't
> bother with allocating a PMD THP.
> 
> Of course, this also applies to other orders, but for PMD THPs it's
> probably most relevant: if we cannot even map it through a PMD, then
> probably it could be a wasted THP.
> 
> So yes, I agree: if we are both no missing something, then this
> primarily relevant for the PMD case.
> 
> And it's more about "optimization" than "correctness" I guess?

Correction: only if a caller doesn't assume that this is an implicit 
pagecache alignment check. Not sure if that might be the case for shmem 
when it calls thp_vma_suitable_order() with a VMA ...

-- 
Cheers,

David / dhildenb

