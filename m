Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0F7209F4A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738664789; cv=none; b=BDo33q5XFIRuis19gzaQz3PwK4e0ORcOEY4+affU0d5BUzbbwIfXJ3GgaaBllkhYdYDHlQc1kKGLZmuHlzTOqwd0Sb5kmtdZyeS7ULKEtsdZkSApBJ4+IK6zAGn93xLNA0U+YsD/YCWagd2Yklqw2ONpv559TvCf0XO7yD0gVSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738664789; c=relaxed/simple;
	bh=ZlNntNaM+PL9MyFxoJ/ZbfSlXajgbc74psNdEvvjw2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JuKHpD1nIQMGZwodTcJ34r2Nq1Byk9MY77DntOlWvNWzIpHmKAeG/lAOdW3nAU3eV4vWOj6ENGTHtXTjD+PyYp063gLLh8u0SOlO8pIGtzddfvNd7F9zjbH/4TtMk154l67/BXtMBH8NQ8mbteN8FqPvQ5d0Pv1XQTggTtSqtNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TWHv9GyF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TWHv9GyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738664786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=obUWo/aIr8iw/uAhhh87Ys9OfYrgg8x79D02NpAO4EI=;
	b=TWHv9GyFVNHC6wz2bdGjabdEB7sVrZ9dyfMdRoteO5sMeNH4F8tjxZ6YE30cef/7yK/B3f
	I6kcODxtSKw0nTY7pZ0k66rrHhI5I4IffPP/RCkoO1xoTUc7CXE/uqlLm8gL8rfj3tnv2W
	1gyf94fKPaAMbsyZAdBRDdO0qRW3Lw8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-IDi5d1yYMZCpoltXCMeffQ-1; Tue, 04 Feb 2025 05:26:25 -0500
X-MC-Unique: IDi5d1yYMZCpoltXCMeffQ-1
X-Mimecast-MFC-AGG-ID: IDi5d1yYMZCpoltXCMeffQ
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4362552ce62so27315435e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 02:26:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738664784; x=1739269584;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=obUWo/aIr8iw/uAhhh87Ys9OfYrgg8x79D02NpAO4EI=;
        b=J6buQvWQSv2Xg3nEMIuBKg1Cq07AW5Ktj6G73Eg99dQGVzyHDL1sqPChTpTVidvhjT
         V3xXSHz8UjOZOqTuYM0v9eD7m1ev2W25Mic84kf8iGq21jamAojYheNHtNqWKNVPqWY8
         7a4uk7gWVMSO3WSI8rKKFOUqC91yf3QEjF0kR2d2O+QBDTLKxcYc63VBFkrQ0Da6hjX4
         rMS0JaE5rfmbifjUuJbA1PskHAvd6HAtlYf6++ak5jajU/Z47BnYVevoi8yVEVFGgH7Y
         1mxwolM6lNA+nTTTwYAxOb9zWIuGFX96hOsXT4VVUnUFwIDN7zmrgw9cRS77aW6Q70r5
         HQhg==
X-Forwarded-Encrypted: i=1; AJvYcCVW5BqJJv7NtAqOkuS0iPNCDz9M4AfytiUFYiy+EuwNdzd9AA8adSo45mqD9zO9Fl2JmRnK5gCF/07TRdg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx92LRkS0vyIwtjAdWPeRzxQziPbiLXVcbQJsEapnFIs0yOMQcX
	s/ztXlevc2xSOsTS6F/0qkjjGA0Rsbhk+I6gpEUNQGPQP15h/BFkF+CxbmwuguNe9XrHp6O94lr
	yYLtki+9QaCODCSlDGALh0BCn3g24QOQAYdh2dmQo2AVFidemlXsIjeuRVaKlMQ==
X-Gm-Gg: ASbGncvxHjBxyZOmifRKg9qiCowtApxJ9bAVybCc5m8cBHunVIYRiWY2z5eIcj54L95
	OUsZGKNlshamT/0cuDm50XwrzeUHfHzP8TWME3ch5WzDaUDhqMTiZS+62sek923ScHIdP32hDet
	HGQ8YTUJ/NnKl0VuWjcIQ6LxxYZTqQTTHFVSUQVIaxrFcdGKaS8rzz3/HcrJY6shQ/7wxrbIKQk
	d3k7X66J6M+Tyzhg+0rY8rHVwoAiX67jgTsQleICxLopU6iQrh0SGkumyExm4OvjdGCJbdT5x8Q
	98cyELPqiUNyJ/AHptcBXLUirr4OLOH3o8LRif+hlqEyhaEVQ12KU8UVq+7vyKpsInIOIIT3alR
	/v6ektM6JissmLzTvTzcT4/QqvWg=
X-Received: by 2002:a05:600c:3b0e:b0:434:fbda:1f36 with SMTP id 5b1f17b1804b1-438dc40cab1mr201403985e9.20.1738664784023;
        Tue, 04 Feb 2025 02:26:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgWlOtLNRacpcHkB0q3oxyRfV0rN8TOLymEbL56bYCUawlhpPC3KJuXBQUqrX0VxjV7e2Rfw==
X-Received: by 2002:a05:600c:3b0e:b0:434:fbda:1f36 with SMTP id 5b1f17b1804b1-438dc40cab1mr201403705e9.20.1738664783609;
        Tue, 04 Feb 2025 02:26:23 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:300:3ae1:c3c0:cef:8413? (p200300cbc70a03003ae1c3c00cef8413.dip0.t-ipconnect.de. [2003:cb:c70a:300:3ae1:c3c0:cef:8413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244eb0dsm187009005e9.27.2025.02.04.02.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 02:26:22 -0800 (PST)
Message-ID: <0e19e1c3-293b-4740-93f3-2c410893288b@redhat.com>
Date: Tue, 4 Feb 2025 11:26:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
To: Zi Yan <ziy@nvidia.com>, Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>,
 Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, Oscar Salvador <osalvador@suse.de>,
 Muchun Song <muchun.song@linux.dev>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <41ca3445-80cd-43c1-8f9e-634c195c9187@asahilina.net>
 <37A0729B-A711-4D45-B9F0-328FDB9ADD28@nvidia.com>
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
In-Reply-To: <37A0729B-A711-4D45-B9F0-328FDB9ADD28@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.02.25 22:05, Zi Yan wrote:
> On 3 Feb 2025, at 9:32, Asahi Lina wrote:
> 
>> On 2/3/25 6:58 PM, Simona Vetter wrote:
>>> On Sun, Feb 02, 2025 at 10:05:42PM +0900, Asahi Lina wrote:
>>>> This series refactors the existing Page wrapper to support borrowing
>>>> `struct page` objects without ownership on the Rust side, and converting
>>>> page references to/from physical memory addresses.
>>>>
>>>> The series overlaps with the earlier submission in [1] and follows a
>>>> different approach, based on the discussion that happened there.
>>>>
>>>> The primary use case for this is implementing IOMMU-style page table
>>>> management in Rust. This allows drivers for IOMMUs and MMU-containing
>>>> SoC devices to be written in Rust (such as embedded GPUs). The intended
>>>> logic is similar to how ARM SMMU page tables are managed in the
>>>> drivers/iommu tree.
>>>>
>>>> First, introduce a concept of Owned<T> and an Ownable trait. These are
>>>> similar to ARef<T> and AlwaysRefCounted, but are used for types which
>>>> are not ref counted but rather have a single intended owner.
>>>>
>>>> Then, refactor the existing Page support to use the new mechanism. Pages
>>>> returned from the page allocator are not intended to be ref counted by
>>>> consumers (see previous discussion in [1]), so this keeps Rust's view of
>>>> page ownership as a simple "owned or not". Of course, this is still
>>>> composable as Arc<Owned<Page>> if Rust code needs to reference count its
>>>> own Page allocations for whatever reason.
>>>
>>> I think there's a bit a potential mess here because the conversion to
>>> folios isn't far enough yet that we can entirely ignore page refcounts and
>>> just use folio refcounts. But I guess we can deal with that oddity if we
>>> hit it (maybe folio conversion moves fast enough), since this only really
>>> starts to become relevant for hmm/svm gpu stuff.
>>>
>>> iow I think anticipating the future where struct page really doesn't have
>>> a refcount is the right move. Aside from that it's really not a refcount
>>> that works in the rust ARef sense, since struct page cannot disappear for
>>> system memory, and for dev_pagemap memory it's an entirely different
>>> reference you need (and then there's a few more special cases).
>>
>> Right, as far as this abstraction is concerned, all that needs to hold
>> is that:
>>
>> - alloc_pages() and __free_pages() work as intended, however that may
>> be, to reserve and return one page (for now, though I think extending
>> the Rust abstraction to handle higher-order folios is pretty easy, but
>> that can happen later).
>> - Whatever borrows pages knows what it's doing. In this case there's
>> only support for borrowing pages by physaddr, and it's only going to be
>> used in a driver for a platform without memory hot remove (so far) and
>> only for pages which have known usage (in principle) and are either
>> explicitly allocated or known pinned or reserved, so it's not a problem
>> right now. Future abstractions that return borrowed pages can do their
>> own locking/bookkeeping/whatever is necessary to keep it safe.
>>
>> I would like to hear how memory hot-remove is supposed to work though,
>> to see if we should be doing something to make the abstraction safer
>> (though it's still unsafe and always will be). Is there a chance a
>> `struct page` could vanish out from under us under some conditions?
> 
> Add DavidH and OscarS for memory hot-remove questions.
> 
> IIUC, struct page could be freed if a chunk of memory is hot-removed.

Right, but only after there are no users anymore (IOW, memory was freed 
back to the buddy). PFN walkers might still stumble over them, but I 
would not expect (or recommend) rust to do that.

> 
> Another case struct page can be freed is when hugetlb vmemmap optimization
> is used. Muchun (cc'd) is the maintainer of hugetlbfs.

Here, the "struct page" remains valid though; it can still be accessed, 
although we disallow writes (which would be wrong).

If you only allocate a page and free it later, there is no need to worry 
about either on the rust side.

-- 
Cheers,

David / dhildenb

