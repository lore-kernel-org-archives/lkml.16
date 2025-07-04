Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C000C1F419B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625936; cv=none; b=EzQSookJvQoJTJNmo7s74L9P8MMNVCTsLzeGJVGORlvoVC8vsuMf1lsjqi/QGSTByd07buylFEOzy0j6LQT7L8HzaeX4RpW38j19tnIupXadYOfTytKhYwklCNZ2nGpZ0IlzwjPAX37/ht9z/YY4BEcasLpI0RlhJ/dMYriCRx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625936; c=relaxed/simple;
	bh=/KxoUoYXqOHPGFGCfdCxB29craPTHR4+6+RuApJTyTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOzcf2sTy4+CkG6B+jY0wcxaMpvDFbRt0wWFrxGVZ+JSMr2x0UYvwQHF9OjaZ83o57QPvVH5c42JwCrFH3dLfctzBaks255xndvHiuSImXKMqDW6XTxI/HxYG/0HlPmFbM1eEBUKDdwCpu9DcZ0KuKu5HF+VbBY3M9S+qy2yb40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hwHmtDGj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hwHmtDGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751625933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Lj8jqoQN7VY+sntBXpAZ86up9zUUpzQWyyOZ71i2xDI=;
	b=hwHmtDGjXLbVGq66Mv28MH/242VIYIrN9wZDDg5jRIuzr6vgXRNp/zRmI5N2CBVi8uzPIh
	6ljCtQboTRwu2E6pYScyt8sBTJZ3opW/bkTh8M+Hn4VAAeMgeqEy/kvYBOhkqXjEe/J/kU
	LDNvdZECGPpAi3BdB6sSinPTmEDtCsc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-4O0H_qTSOM-frQFZbww5Vw-1; Fri, 04 Jul 2025 06:45:32 -0400
X-MC-Unique: 4O0H_qTSOM-frQFZbww5Vw-1
X-Mimecast-MFC-AGG-ID: 4O0H_qTSOM-frQFZbww5Vw_1751625931
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-454acc74f22so5220705e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751625931; x=1752230731;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lj8jqoQN7VY+sntBXpAZ86up9zUUpzQWyyOZ71i2xDI=;
        b=cF16T6bSO3z3Iu2oed4Rtyy31mvjPCxdjs4mJhzebSVId05FMkOqeCHmGcG/MYnS/x
         qWS2mWh7hDgFJyUFf0/9+v8gbOLrXv5pVx/Vt0AoAZLUZ0ej4ZLLNePYjVJiQD+z4iey
         LC0njHhrB7t7CovF5DuAgF3wAM9hDMOx/yfJPKy0trOfZM0juuNsc9MFLW+IXxhJWXti
         lzWVQ0gJoeblXvYZY8bkU4nrpIqalGRDAzkqvjDRHnr+41CmMsx1nd9oh2k0hDNzNJUV
         B47s9svvKi4GuNoEL1KQglpDIPj8XXL/EVNu01EKkeJj+SG5RBVsx+LZvzDYdJYbm0y+
         txaA==
X-Forwarded-Encrypted: i=1; AJvYcCUuQ1cP+u7/bs3joQnoJ4+8mgl5IfFI2MeBcnqn+0keyN1/+VUOBwPKwHoHFsT0oSKSv3paLKWeTxbTM1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTkZ0gtGM+pev069ZMWDymLiyOxoFlKwNOR+L3xJjGU4duyCGL
	Wr0pJV3biRRXEyV2idNwWnEo09ra6s17Is6GYb3MN8ZVztbUixU8uE+2Oe2RdKm54JroIVoqRof
	eDxOTMj10GUB0hBPw0xChGnVRlNp1OBq6odhL71He4s5yhzpOsDUvOavAZDHpvaXeSw==
X-Gm-Gg: ASbGncvjDAkioxHBEm57xx30c0CoD6PuOPcASh7aF4dPXmdi4BAnNkk9eyoE+zYILy0
	pt/p8z1hRZSDu9dLwxrQPP469SYnTo2Z5xf1HtxNxjBz+zYts1OlHHeH0IEYKhTZQL6M4LECesX
	tGbukOIYA7tEkJu22xAcIqKnwT4pJskEa8Lkns5L6Efkl8dlTjQK7IgoUU4bOo92tyMxzHpcZh9
	IuLmfV1116t9+dg/sNVPWlqyjQBSeNLBefwgYI818P08pWSbztdPedVCTbvfG8YGXgkyv0uW3ig
	eFOcul9ZcqdalkaFRlWV+sPQSsjOUDW5+wef+iPry+e73tW2ErXbqiEqzxUuAPCJD2qzn7SVv4V
	KSpY+Yh4ZVnwixBPiN9vYXaF+KcwYTeir52JrrxPUwXVro1U=
X-Received: by 2002:a05:600c:c0dc:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-454b32084damr17955605e9.16.1751625931020;
        Fri, 04 Jul 2025 03:45:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6Xh9Weov0ZDiO0SMy5SWe81aHtRfRXIqHOIXEIougDSeXOW0Iyh1K16ktmbpeQiT5MrDEEg==
X-Received: by 2002:a05:600c:c0dc:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-454b32084damr17955345e9.16.1751625930565;
        Fri, 04 Jul 2025 03:45:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1890626sm23472705e9.40.2025.07.04.03.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:45:30 -0700 (PDT)
Message-ID: <91213616-1e7c-4e75-aee7-862b68c23ab6@redhat.com>
Date: Fri, 4 Jul 2025 12:45:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] mm,hugetlb: sort out folio locking in the faulting
 path
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250630144212.156938-1-osalvador@suse.de>
 <20250630144212.156938-3-osalvador@suse.de>
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
In-Reply-To: <20250630144212.156938-3-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 16:42, Oscar Salvador wrote:
> Recent conversations showed that there was a misunderstanding about why we
> were locking the folio prior to call in hugetlb_wp().  In fact, as soon as
> we have the folio mapped into the pagetables, we no longer need to hold it
> locked, because we know that no concurrent truncation could have happened.
> 
> There is only one case where the folio needs to be locked, and that is
> when we are handling an anonymous folio, because hugetlb_wp() will check
> whether it can re-use it exclusively for the process that is faulting it
> in.
> 
> So, pass the folio locked to hugetlb_wp() when that is the case.
> 
> Link: https://lkml.kernel.org/r/20250627102904.107202-3-osalvador@suse.de
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Cc: Gavin Guo <gavinguo@igalia.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

