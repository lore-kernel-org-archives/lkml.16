Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BB01A3177
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747837540; cv=none; b=plxmWPu4FEiljQ3Yg+Kru60s3MHWfLNdqm4pjp5TtieDXFCvR4OfK1oxt5700zQLXigdAvyeiiAds3C74HIl3E/gep3/zp5FVUkQHSoQUqV28a+Iu7qvrsw+znAWNRkb67moW7X807gfyXW22ayeivP45hJgGpKGRbd0rHRLqVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747837540; c=relaxed/simple;
	bh=ERle5Shf5e07jHKS+coVt0FM90M8WmvFlbKyLcKihYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YL99ANFsZVPVKl85YFwCGjq/Jh7qUDhDNBWi8ZRO+o8YQPDt6wi75jHMY6euR4ChqdMTlk54d6f0ZkgC8dbUW7in2/YCjKt8tXiHd+/JOAf2f5T7Kf7FQDjWj3kB1KQTrK5OWDIhHTMOkqfjctjNcnFeymnPQdgAUqfmsPpSCVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=co+HOmlE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="co+HOmlE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747837537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vtz3zCRfFVtYQqsEeh2I2d2h76gJuvlzOjcLp7jFKks=;
	b=co+HOmlEpAcTq0I8kLQj0BvqgubIn1xwEtoZoKW5dDa03Q8ZK9Ka2pZbZ2gVYwOIq/kxhh
	aEwbHkyWsH/hAb590491AI0aOrLZfNMDjNpdQddYO7OfHDJdoq06M512pt3JqCG/HzWnvl
	oAYCCQDCutfJpg41xbeFTO0EwMNSHRI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-yZnhc6ATNSewX8PXBPiJJA-1; Wed, 21 May 2025 10:25:36 -0400
X-MC-Unique: yZnhc6ATNSewX8PXBPiJJA-1
X-Mimecast-MFC-AGG-ID: yZnhc6ATNSewX8PXBPiJJA_1747837534
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442cdf07ad9so39648785e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747837534; x=1748442334;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vtz3zCRfFVtYQqsEeh2I2d2h76gJuvlzOjcLp7jFKks=;
        b=twzoUdavmWndbZAsISKNfw+QV4ZV+NbjigzCxjIGxnnfvEDua1Iuwu/cinuuFJHV9k
         srPyKnhk9xQo1hTzdW8gdYgc2RkbptZL9a1WIGY7DQomoYnRCKmatGmHvzML03WB3bif
         Wqru3XX3GgojLOtTP8/TArMeUzYPZq9oToAkJxxQdVo1////l7LDxKrpXhBkz7HY6Fzp
         pwbt9tUImCWEqQi8EBfzrOhF7mgZiDV5hFxhBZ66T7eVy37coBnkv59j5Ry8t5npHpKw
         yTIXQuZEsAqFC10EgYO1ZM+04YCC4RqS+EakR3sdeySbQ7v8l94O6XUXm7W9Ma8y23IP
         lzYg==
X-Forwarded-Encrypted: i=1; AJvYcCWSbkS1hc4+jn1o2SoF7WCrqABhi+3RLTh2KSLHolJt1tSmogDdbTKZ2zZWadMCuTfP3HLcPGPEi6kMquA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhbzX65Jr5gemq31EjzCb6Dc3NNXfB2ajZ2dSsXKfslZz+pNNW
	YA+/IU8D4RK6X9zHrlEcTf3e5t1TfFGP/X/p47ft+q3g6L/tNd9OVNKIuihHBzv8Ocwx/h+TZUH
	9LM/qxcuIplws5U0mIIi0BoYc0E4hSdgv/epdtYn/CpEYECOnC20u3g2IT0cu0l36spY0aHf/4V
	z5
X-Gm-Gg: ASbGncuiX0DXeQ7c6bA1jL+glpBCBgqRcsbRBHb78K4R7DCmgERzwEmbXm82jWl18kX
	eImw2ShhPVITmPrz5XGTO8bPg5l3gMrZaAK1SXNKqB9gvi5vBkVIEuvWdRDNXsNIhqzWNcbH9MO
	pa41n7jfm3fpGxV3Q0qTfPoNNIv7d0vxoheyWvFRj/CvgE3p3+/zc5yP8XZjW+HZUinmwtWv3VZ
	bze96xLmblfoK8OxTvUaYKkA2YX5bpgYtPMGSaVsdxUFRs7dMtuepo39NygdTdNwbBzP4FteWEf
	npzWpIAzDwALbFSgCjmSaBOO+U+UKjR3U6vmGa93I5Syi6WpxKkIFML5cvk3l70VL7EMomW4LNk
	F3naPEtaPBsdogHJO7jIiST6h8eOoeedpQQyAGmQ=
X-Received: by 2002:a05:600c:a0b:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-442ff029d0emr167080265e9.21.1747837534048;
        Wed, 21 May 2025 07:25:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH25l4CJ4kyN0aKiV6eZa261E7FBFCeGJlxOSvF96Y32jlEIFnp2FS8jC7CA1v8/E6Axnwzjg==
X-Received: by 2002:a05:600c:a0b:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-442ff029d0emr167079985e9.21.1747837533661;
        Wed, 21 May 2025 07:25:33 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-448ba3d8facsm48483235e9.6.2025.05.21.07.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 07:25:33 -0700 (PDT)
Message-ID: <63967c9a-0ae7-42c1-9a2e-31213ad1fa90@redhat.com>
Date: Wed, 21 May 2025 16:25:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] mm/memory_hotplug: Add interface for runtime
 (de)configuration of memory
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Sumanth Korikkar <sumanthk@linux.ibm.com>, linux-mm <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador
 <osalvador@suse.de>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, linux-s390 <linux-s390@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20241202082732.3959803-1-sumanthk@linux.ibm.com>
 <20241202082732.3959803-2-sumanthk@linux.ibm.com>
 <3151b9a0-3e96-4820-b6af-9f9ec4996ee1@redhat.com>
 <Z08WpCxt4lsIsjcN@li-2b55cdcc-350b-11b2-a85c-a78bff51fc11.ibm.com>
 <1b9285ba-4118-4572-9392-42ec6ba6728c@redhat.com>
 <aCx-SJdHd-3Z12af@li-2b55cdcc-350b-11b2-a85c-a78bff51fc11.ibm.com>
 <fca5fe72-55a8-456c-a179-56776848091d@redhat.com>
 <aC2sUdhavboOgS83@li-2b55cdcc-350b-11b2-a85c-a78bff51fc11.ibm.com>
 <496e6707-bdc9-4ad2-88e2-51236549b5f2@redhat.com>
 <20250521142149.11483C95-hca@linux.ibm.com>
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
In-Reply-To: <20250521142149.11483C95-hca@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.05.25 16:21, Heiko Carstens wrote:
> On Wed, May 21, 2025 at 02:33:42PM +0200, David Hildenbrand wrote:
>> On 21.05.25 12:34, Sumanth Korikkar wrote:
>>> As you pointed out, how about having something similar to
>>> 73954d379efd ("dax: add a sysfs knob to control memmap_on_memory behavior")
>>
>> Right. But here, the use case is usually (a) to add a gigantic amount of
>> memory using add_memory(), not small blocks like on s390x (b) consume the
>> memmap from (slow) special-purpose memory as well.
>>
>> Regarding (a), the memmap could be so big that add_memory() might never
>> really work (not just because of some temporary low-memory situation).
> 
> What is "big"? Worst case for s390 with existing machines would be an
> increment size (aka memory block size) of 64GB.
Oh! I was assuming the increment size would always be around 256MiB or so.

In that case, it can make sense to have this, yes!

-- 
Cheers,

David / dhildenb

