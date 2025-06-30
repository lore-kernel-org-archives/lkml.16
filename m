Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E522036EC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280852; cv=none; b=Vv4Ec8Ai6EEgJwMOm6rfPqMQB+xwuLWDwpyOSgMZGqgXizhBazEqOIRfH2ixsQ9GF5WrkiQMN0XuS90AOpwjvHFmf0Z3XHZ7GhEOQUzL8nDk4gG+5CtDiU1K3kFWlZtRQBSmEPS/BsokOQUh3JfuwHlKRexkXxivo9hrAm+Etqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280852; c=relaxed/simple;
	bh=uiuM5RLekpTJfsA1w499Gn77Twg5hZ9DoLrLrdCnlUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/qBNBVB0J8iHxPTxl0XQL+5oNVKP0xV8z0me4Cup0uHNrbl/IO8y41GTEtgeJLLsPDwQhn8RiOGlapFjVBXbh6JdbzLLEOxA/DjVoevSQ+ORz6e+VViEII9n2PtTm/+kIetctZPFmD/fzFSjJT7QG8abWTkttBJRWHs2P5ZXeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UeH56JjL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UeH56JjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751280849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/Ig4DRpO8S3ras7EkzYkIu+eY4pUsIGMfLOrlKNaDPY=;
	b=UeH56JjLGc2DIDOUGVaZ4M6GZkBwKSXdcApj2byGvWFPE7+M7IgonVPUwRsu8PbokyX9dN
	2xJtbj1rGMgYk0oo/6MOjWStt1JL0afbI7pfFpQ4B4REQn5ewi0lQZMtx1moKDVN08YX9G
	YrC+97K4B8vkUM+wDMiJxaUuHHPmnPA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-qVF1JV04M-isK2X3IZ3jZg-1; Mon, 30 Jun 2025 06:54:07 -0400
X-MC-Unique: qVF1JV04M-isK2X3IZ3jZg-1
X-Mimecast-MFC-AGG-ID: qVF1JV04M-isK2X3IZ3jZg_1751280847
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so19099575e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751280847; x=1751885647;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Ig4DRpO8S3ras7EkzYkIu+eY4pUsIGMfLOrlKNaDPY=;
        b=YdOoNa+tEdJTMABzGI95fy5r6ZGDaP27EhdQK2nEU/YZytqpiVKWAU895DvxpPnVpf
         c/yw6HoXTGZqMagRhvKq6fRdw3fedypVyGieQJPYDY04iccEl2uEX7y6oOTwEByDrFPC
         I01LFYHcNH2xOPN60VsTLcSUsCl27jJyfc0uwE0P5JZ41iNNQJPzixHdrcmz2iGRZUn/
         fAYeKaBGKBCB9rY2nmT7rgy8dbnr4czHUY+zIJJsQmWwxbSGLIwarmpBe0lRceoJTDl5
         BzYfxnmxMxHBp6kcWeLn1A5P1yP9ID+j/Mt6skbc1cNeR4Hz8rvG8SZpNzzqekmZ7ydp
         FbFA==
X-Gm-Message-State: AOJu0YykcO4OkP4yhBHfh9Lb/6Ny96VZEfBqyvUg9hFWtoCLWVuJT67I
	DRMMTvATYAiGci0H/0cvoBb5KUxMuQmtehAAxUwCalPU3YcZ+YvVWh+T00ygdr5kWEDPNor9aGW
	SAQRg3dEb2jw3ZbijMDWIvTvhugxawodXQ4vy9h9nGimuUcPRM4nrYGH4T0Guavgjqw==
X-Gm-Gg: ASbGncuQiBfrPiWgClSjEeaZeNSgtw3OnOWt3YAY4Rdc+rnWlXRGxx67XMREnTz78mg
	ZL5Xt8oB26qXgTQAOu5e6y+ilMwh5IIyH5ZQD9/KqVSkFIsJzVBt4rz+AfYwRG9RsH7s8K5Sm0C
	59wRWfH46B2OhvW+ou5OXYkKEZ0Ra5VATYoOZUxmPQaYQw2/7ARUwiyka7tcbHpJPlCEyCscAUa
	QfoNAI5g2FQFzZ91EqPs11y//4aMYpZBA8KdQDngnQsw/JY25okbiXoflvZb1D+LyrMiUvAwNZZ
	LS0VIGUNLX02EK1OtxEWby9TX1QvIbKFwRzaAmVe5zVGWrdOGCLrjla/PPgVhclWGMJ7egOTwtl
	ALY4J0/+72sgDt41ffxoqho2V85Dr5A+aFyJsNc397DPhGj15Cw==
X-Received: by 2002:a05:600c:a4d:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-4538ee5d1famr153944355e9.10.1751280846648;
        Mon, 30 Jun 2025 03:54:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYD6fei0tp2zEVfYn6rQl+iZ0sSUDc1J/Wx2MMLSubQmwLSI1dh/yx4qwWIITfxKejwbAR5Q==
X-Received: by 2002:a05:600c:a4d:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-4538ee5d1famr153943985e9.10.1751280846222;
        Mon, 30 Jun 2025 03:54:06 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e9d1csm10221615f8f.13.2025.06.30.03.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 03:54:05 -0700 (PDT)
Message-ID: <6466a90a-6af0-4dc5-bbb6-19ec6d2f5c8c@redhat.com>
Date: Mon, 30 Jun 2025 12:54:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] mm: split folio_pte_batch() into folio_pte_batch()
 and folio_pte_batch_ext()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-4-david@redhat.com>
 <ec53b2ad-9c1b-4039-b59e-905e1853c1a0@lucifer.local>
 <9185c50a-1427-45fc-941d-e9796cea4831@redhat.com>
 <d9f8b010-3c80-4d02-99df-30171878c799@lucifer.local>
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
In-Reply-To: <d9f8b010-3c80-4d02-99df-30171878c799@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 12:41, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 11:19:13AM +0200, David Hildenbrand wrote:
>> On 27.06.25 20:48, Lorenzo Stoakes wrote:
>>> On Fri, Jun 27, 2025 at 01:55:09PM +0200, David Hildenbrand wrote:
>>>> Many users (including upcoming ones) don't really need the flags etc,
>>>> and can live with a function call.
>>>>
>>>> So let's provide a basic, non-inlined folio_pte_batch().
>>>
>>> Hm, but why non-inlined, when it invokes an inlined function? Seems odd no?
>>
>> We want to always generate a function that uses as little runtime checks as
>> possible. Essentially, optimize out the "flags" as much as possible.
>>
>> In case of folio_pte_batch(), where we won't use any flags, any checks will
>> be optimized out by the compiler.
>>
>> So we get a single, specialized, non-inlined function.
> 
> I mean I suppose code bloat is a thing too. Would the compiler not also optimise
> out checks if it were inlined though?

The compiler will optimize all (most) inlined variants, yes.

But we will end up creating the same optimized variant for each 
folio_pte_batch() user before this change.

And as Andrew put it

"And why the heck is folio_pte_batch() inlined?  It's larger then my 
first hard disk" [1]

I should probably add a suggested-by + link to that discussion.

[1] 
https://lore.kernel.org/linux-mm/20250503182858.5a02729fcffd6d4723afcfc2@linux-foundation.org/

[...]

>>
>> Obviously, I had that as part of the development, and decided against it at
>> some point. :)
>>
>> Yeah, _ext() is not common in MM yet, in contrast to other subsystems. The
>> only user is indeed page_ext. On arm we seem to have set_pte_ext(). But it's
>> really "page_ext", that's the problematic part, not "_ext" :P
>>
>> No strong opinion, but I tend to dislike here "__", because often it means
>> "internal helper you're not supposed to used", which isn't really the case
>> here.
> 
> Yeah, and of course we break this convention all over the place :)
> 
> Maybe folio_pte_batch_flags()?

Works for me as well.

-- 
Cheers,

David / dhildenb

