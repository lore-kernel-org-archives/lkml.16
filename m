Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A621255E4E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456290; cv=none; b=jH7Gs2YhUcpd1CsFAoGFuXiy0VawfaJmRDP13o8CX1bwSUhpdcUPSM8xUfsTl31WVY2k+HMzu9s9CUUWj6S1Sl6d9nlSWn8mozqMeB4XVhLsrLk+de63szhUy0XHCZkw6vFcnQmy+6vR6lKvGtjWC5DUtIlav3bE585kDInbd6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456290; c=relaxed/simple;
	bh=4hzgENnA1Zjl4e0TCXBL0vy46LxOKXZM81aPf4KwXJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wy3Zrg1y4TE7hTjOiScddgJhPTP/0Nvel/olw+Ltx/HrfnnAd+3JOYI54h4/M6mynLdWF2Syf6x2NGrzMvHbbo6gn8Q9xHDosNXTqf4mWSYS3OkD5s5X8bQRTgezAmtSeot/pn2TQ127tRbsHX/OuEHvQ+tWq7U1Xh0/o2HwCF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qv6Wi6Dp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qv6Wi6Dp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751456287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WWTb121kg3x8bQDolojQ1DjlDDkWC5RWhk9ud/7nrxw=;
	b=Qv6Wi6Dp9JUbH4+6DlnWN4O/5dJjEvGC6GbA0XXkBg9z5qKDN7ZFU2EpG9Ms/BPuaP3g4x
	sTta8YxGkJi53tWZPNdqmzG6GkYNQX2mhxwSx4enzIcCitSk6x9CM3v1WzxnHvdMbtPF0h
	XVXVJe/Z9V4uYlynqjPzxD1+I3RpA7k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-dJQ-nA6HNIO5QS56mtgX4g-1; Wed, 02 Jul 2025 07:38:06 -0400
X-MC-Unique: dJQ-nA6HNIO5QS56mtgX4g-1
X-Mimecast-MFC-AGG-ID: dJQ-nA6HNIO5QS56mtgX4g_1751456285
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4535ad64d30so36381235e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456285; x=1752061085;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WWTb121kg3x8bQDolojQ1DjlDDkWC5RWhk9ud/7nrxw=;
        b=OZ0Vhg7oHY9mcIJPka5UaQ2CVJvkQwImyP70ixH5h9W0Uv34D5gV01nwo4MxgiuxMs
         QojWBQ2D97/IhYj8ZVYqcIsBIBVRsdGkbp83IqueFsM7U2XF5cw7QCm1rfqhPvyoZYky
         GZA2dWTXjAJzmYDpE5UwWDqadQdvG7HzMQrJMHNTwRdQ/4d+/Mz5KxEKcwz+J4sVW/Zs
         23bVRqdjamq860l5FZZWl7zMnWTlqxnWWMYRAq00wpLer3SlvBc+I7GqK6ghp9zZ5eXu
         YKZCzzIMoSXDgo4j016uQd6WK4gHotTiYmr8xS0z9vrx6GmA6u3/EdDeBM7+WUfvsRNS
         atxA==
X-Forwarded-Encrypted: i=1; AJvYcCU5AADeOwzCPKJQ5gIezwyh7RreF/vpNZzrSzjceoQF4mPSGeo5m9DDUm2j0c3pJrToBrrtmgtWtkym7AU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj3NXwGomXq8PU+MSo6UtomEiBWly/hGBi0DrcE9aj17tSVd7s
	FyRqgpHBGrECYtZ8ALJSMu4a5i2iMT4H+1btXbQfu7fum03LLEw4D+hl3LZpCuix2v1GtFP0k47
	4uIfQqlqNmDQL5Md2oPB+JDKmwDpNLOH19Z0Dgmd8GS9PFocLIMtgsthlfIiAWr5nAA==
X-Gm-Gg: ASbGncudcznv600gVwLuxIeTCMzB2t9E8tAL+YzeZh/PQMH3wq/7AW5jc/Yc9EJcrx1
	o1C+5B+f2E8PnumiGIV5YMEjyyx+zG1Yh8SL5aFqBuqhhBkb9+I9VtzhoM0yyXbisUYjkqtY9Ue
	B5eqNvZ9hU476HE4lwxa9vKuIJAByfEXowDZl9BhGemRk4IzsswtVULYkXN3NsZE97GYWdXEXDi
	I6KY6LcO98G7L4S9vUV2FEepY5DNS3E7EHSBOKXBiT5tihJ0WUa0BfLqIkemtJJhM3ibVukQHNa
	qnnunm5foAsmVPRurZ2e0OE09vpJloYSa7Q2qSRPibqYW+AJ68Lj9gc=
X-Received: by 2002:a5d:5f8e:0:b0:3a6:da76:38b0 with SMTP id ffacd0b85a97d-3b1fee6808emr2072417f8f.25.1751456284688;
        Wed, 02 Jul 2025 04:38:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjgrdofR786ppBW+3VURU5528zOazBvJDqRt+5HLCudG6iaV7gcBqx8RHuXR3NHYR+O55F7A==
X-Received: by 2002:a5d:5f8e:0:b0:3a6:da76:38b0 with SMTP id ffacd0b85a97d-3b1fee6808emr2072380f8f.25.1751456284181;
        Wed, 02 Jul 2025 04:38:04 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm224190895e9.3.2025.07.02.04.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 04:38:03 -0700 (PDT)
Message-ID: <7b17af10-b052-4719-bbce-ffad2d74006a@redhat.com>
Date: Wed, 2 Jul 2025 13:38:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: support large mapping building for tmpfs
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <67c79f65-ca6d-43be-a4ec-decd08bbce0a@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> So by mapping more in a single page fault, you end up increasing "RSS".
>> But I wouldn't
>> call that "expected". I rather suspect that nobody will really care :)
> 
> But tmpfs is a little special here. It uses the 'huge=' option to
> control large folio allocation. So, I think users should know they want
> to use large folios and build the whole mapping for the large folios.
> That is why I call it 'expected'.

Well, if your distribution decides to set huge= on /tmp or something 
like that, your application might have very little saying in that, right? :)

Again, I assume it's fine, but we might find surprises on the way.

>>
>> The thing is, when you *allocate* a new folio, it must adhere at least to
>> pagecache alignment (e.g., cannot place an order-2 folio at pgoff 1) --
> 
> Yes, agree.
> 
>> that is what
>> thp_vma_suitable_order() checks. Otherwise you cannot add it to the
>> pagecache.
> 
> But this alignment is not done by thp_vma_suitable_order().
> 
> For tmpfs, it will check the alignment in shmem_suitable_orders() via:
> "
> 	if (!xa_find(&mapping->i_pages, &aligned_index,
> 			aligned_index + pages - 1, XA_PRESENT))
> "

That's not really alignment check, that's just checking whether a 
suitable folio order spans already-present entries, no?

Finding suitable orders is still up to other code IIUC.

> 
> For other fs systems, it will check the alignment in
> __filemap_get_folio() via:
> "
> 	/* If we're not aligned, allocate a smaller folio */
> 	if (index & ((1UL << order) - 1))
> 		order = __ffs(index);
> "
> 
>> But once you *obtain* a folio from the pagecache and are supposed to map it
>> into the page tables, that must already hold true.
>>
>> So you should be able to just blindly map whatever is given to you here
>> AFAIKS.
>>
>> If you would get a pagecache folio that violates the linear page offset
>> requirement
>> at that point, something else would have messed up the pagecache.
> 
> Yes. But the comments from thp_vma_suitable_order() is not about the
> pagecache alignment, it says "the order-aligned addresses in the VMA map
> to order-aligned offsets within the file",

Let's dig, it's confusing.

The code in question is:

if (!IS_ALIGNED((vma->vm_start >> PAGE_SHIFT) - vma->vm_pgoff,
		hpage_size >> PAGE_SHIFT))

So yes, I think this tells us: if we would have a PMD THP in the 
pagecache, would we be able to map it with a PMD. If not, then don't 
bother with allocating a PMD THP.

Of course, this also applies to other orders, but for PMD THPs it's 
probably most relevant: if we cannot even map it through a PMD, then 
probably it could be a wasted THP.

So yes, I agree: if we are both no missing something, then this 
primarily relevant for the PMD case.

And it's more about "optimization" than "correctness" I guess?

But when mapping a folio that is already in the pagecache, I assume this 
is not required.

Assume we have a 2 MiB THP in the pagecache.

If someone were to map it at virtual addr 1MiB, we could still map 1MiB 
worth of PTEs into a single page table in one go, and not fallback to 
individual PTEs.

-- 
Cheers,

David / dhildenb

