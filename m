Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA51C21B9D8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795929; cv=none; b=sksoqqqUR72Nzc0tFqok4yyuOPDddI8gufARrDHHMfS7IZDubvRIxI53JxCRbycSd3zUtZy8bPNWHdM/slEG4torMgVBlbX0vFYWdJftf8jwdDdn7PTQZXM7dDI7Zfoa3Q0aeB/jR0n7QZER1ExxliUwZTPViud1edTtbWmdW5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795929; c=relaxed/simple;
	bh=VpYWBXwArfXUnOZRjrWcgyuXs3E6GOT2l1zA2JyR1fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVW2xWbK5UXr6hKqVefZIEdZ+4Z5UdCFJtMWEs7jRUAoKrL1eng67RQ43d4CtkHKGYKUAmLbMcWCLdHAhv8MOS5Rbrkxa6puIjwqD8qRHNBZKWKYZAbyzciNTk3cjgjOAjojwsKenZzNhRVxhYX9ZnUTKiVtBlgN9vJVBnpx9SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XLfPVEsI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XLfPVEsI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744795926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CPTzXXBPP9uKDT7uGvj8TNRGD1DYrkwdDHvL5CA6lgc=;
	b=XLfPVEsIa9Xet89dSydZSGCaQWh70dAXFoeAQ9jZ54Wf7KFXsqcei4DwPmxCFYR1NxmW/9
	eCKBJH9qccK6oEFnUrWVjcvkyLNkPi/12Mw58j+u5EY98kC4lkJgjiRL6X90XNkK7C3dWp
	pePvGRLWqfRd/gfGgXs7wrI/aUdtOYU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-dec_sFipPB6mVWjSRtIduw-1; Wed, 16 Apr 2025 05:32:05 -0400
X-MC-Unique: dec_sFipPB6mVWjSRtIduw-1
X-Mimecast-MFC-AGG-ID: dec_sFipPB6mVWjSRtIduw_1744795924
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so34661345e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744795924; x=1745400724;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CPTzXXBPP9uKDT7uGvj8TNRGD1DYrkwdDHvL5CA6lgc=;
        b=hv7TJgC3uvyeUUM6ceUNNnmMs/P5uDYxppRSjpXV/lMbfZ96d60nryKSk01UlIcue/
         pBRtWEzfbyiUg+hketSVEtFsXHPDetceU0eIBMSChdeALfeyCi+a6L9boLkvRSispQk0
         zc+oI2n91W1huMGeHRyGBiOO2CfrMC9ZOG7KkaRf74nQXhfNIkXaWA0EE72iWR7JurD/
         Zx9LX1xw8MhCWSxMB+tE2CvF8pgUVxwW1aNl34vxmQ4/dUbcEa9Mid+Apn4QpCuykDmb
         3UMBcvkRDzZS50i4cDc3DAVMI5ZjAKHRk7nh69On+1MbS3r1lnCBWRmkQm7SlSGDdnNR
         /Nkg==
X-Forwarded-Encrypted: i=1; AJvYcCXW1GGm4vYg+n42gk0oOLbaz3AKRfDyD8uQB+hrO1evLL0PpUr/kKbKZbZt7oxdVxMiaS/AtivJLuRqgzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRWPOEpBaQqGlbWenOruMphn71WB/rcW5lL2y3Bs3lqaC4ZXOb
	9ggUgXy3PWaIilRYb1plTvohcwcpQUoZUYtlkQIIbbofEvL+S+6Z5nW8PH0xtsV0An0XwOnYzXk
	k1cjqipfvYPtGy2S3OPZ82DV/ETjK325w5Hv5MZMjtAlgPWme37Rj2uaObK7718go31BlNSvNr3
	o=
X-Gm-Gg: ASbGncsrRMqezR6/55QknEEzxeBm8/ZTEt9GNtNlKihfIF+pzGsAnd+/zHC1WqqWULA
	u4ivfFI8kfhw5kYjnRLTgFYTI2N1VmG1zMV3asNL1cklfzeSVhNpbgD06SK56tCvXvqT2q3ysbi
	rUkMvONE2ViZhmoftm8CMo7ssIpKtHNmkQKa1xy3Yz/gTQN7WJiPw352bH3laCtCNexsCiQtX/v
	DwuT7+V+LyfRurG4W8MJyYrGzSqCLWW/LWwg/Q6bwKGPMVwgLsmVKnuzT3qADN4XncYPJ2FqsJA
	2+rhMuhoB0xsVSUbcvOOKft5Mg/LdfKNjPe/2XIZtRCMOvGXD3dWzo8HVMq0wr/0vX25GktjzmI
	N0ELtub3XcYemcCLpBEVDVcvfumuvz4KzgwXF9Q==
X-Received: by 2002:a05:600c:35d4:b0:43c:e9d0:9ee5 with SMTP id 5b1f17b1804b1-4405d636d49mr11377035e9.18.1744795923758;
        Wed, 16 Apr 2025 02:32:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUcFKBpZ2GcpYLEoopqzQY2ZlwtvpFT+TIpkeag7SvXrZNWUWk6KDLfB+wE/68ObAEbcP/tQ==
X-Received: by 2002:a05:600c:35d4:b0:43c:e9d0:9ee5 with SMTP id 5b1f17b1804b1-4405d636d49mr11376745e9.18.1744795923340;
        Wed, 16 Apr 2025 02:32:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4403605892fsm24685425e9.2.2025.04.16.02.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:32:02 -0700 (PDT)
Message-ID: <6259cc1d-93a8-4293-9009-a6119166f023@redhat.com>
Date: Wed, 16 Apr 2025 11:32:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying
 processes
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox <willy@infradead.org>,
 Oscar Salvador <osalvador@suse.de>, Ryan Roberts <ryan.roberts@arm.com>,
 Zi Yan <ziy@nvidia.com>
References: <20250412085852.48524-1-21cnbao@gmail.com>
 <34c54df6-9a7c-475d-9b91-0f8acb118231@redhat.com>
 <CAGsJ_4yUUK8LoejaUrXWscpPSQevq8jB4eFwpd6+Gw3T5JxdNg@mail.gmail.com>
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
In-Reply-To: <CAGsJ_4yUUK8LoejaUrXWscpPSQevq8jB4eFwpd6+Gw3T5JxdNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.04.25 11:24, Barry Song wrote:
> On Wed, Apr 16, 2025 at 4:32 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 12.04.25 10:58, Barry Song wrote:
>>> From: Barry Song <v-songbaohua@oppo.com>
>>>
>>> Promoting exclusive file folios of a dying process is unnecessary and
>>> harmful. For example, while Firefox is killed and LibreOffice is
>>> launched, activating Firefox's young file-backed folios makes it
>>> harder to reclaim memory that LibreOffice doesn't use at all.
>>
>> Do we know when it is reasonable to promote any folios of a dying process?
>>
> 
> I don't know. It seems not reasonable at all. if one service crashes due to
> SW bug, systemd will restart it immediately. this might be the case promoting
> folios might be good. but it is really a bug of the service, not a normal case.
> 
>> Assume you restart Firefox, would it really matter to promote them when
>> unmapping? New Firefox would fault-in / touch the ones it really needs
>> immediately afterwards?
> 
> Usually users kill firefox to start other applications (users intend
> to free memory
> for new applications). For Android, an app might be killed because it has been
> staying in the background inactively for a while.

> On the other hand, even if users restart firefox immediately, their folios are
> probably still in LRU to hit.

Right, that's what I'm thinking.

So I wonder if we could just say "the whole process is going down; even 
if we had some recency information, that could only affect some other 
process, where we would have to guess if it really matters".

If the data is important, one would assume that another process would 
soon access it either way, and as you say, likely it will still be on 
the LRU to hit.

-- 
Cheers,

David / dhildenb

