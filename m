Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EF5245029
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744896403; cv=none; b=ClTmlvdzaGDbovvmw0cYv8LDMoTStETnw6vjiWyXvWVRtaGFhiPozRvnf4VUstqGAnlHsyADoI1SbdKIRIFl1C4b4cc8r7M67rx9KM3ADeJsHzz6tgbBw7j/37GdwXE8UDQhTqclI6+dXo6yPsznBoaabN2GOXTzqFkHmyZQHME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744896403; c=relaxed/simple;
	bh=hyr+u0zORqGUAPM1n4U5lLMs+i/1K2r400j5In/RDqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uwb4QpU+/WWq7gEzUUiYtxh8zjonTFt88fctKpMAfLqYKr4fmx0SEArCIin3sk/MmZx6yTaPMaK+O6zIrYUe13d6z6c/s8Rwol8aFfxOQ0TMZbJX+se088Z0hacYIH4UYM0RKBbc0vSjVe1C8NIcVgZ4QLcin3FfGbrmeZDAhEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fhggVlBq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fhggVlBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744896399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=T/uHlC6UoBPrjU6+QaaVuSN4oPRWaY8QJta9DsekY80=;
	b=fhggVlBqo0XM0sHLJ8KL2S03+lN20VoX1VukDBgk16XhDeSv23cny4269TB+T9vUEdsnjR
	V1Tfu97JUafbDWD8fqAZfpLkI94+U+6QvcQyIERVzOrV+orwIlPOIk/2Sgn11tBhQ3Zus8
	M8RgZUWHsepMGYMUIl0VA/m6CMv0Njk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-drvObAC6N0-WWExDVhGfqA-1; Thu, 17 Apr 2025 09:26:37 -0400
X-MC-Unique: drvObAC6N0-WWExDVhGfqA-1
X-Mimecast-MFC-AGG-ID: drvObAC6N0-WWExDVhGfqA_1744896396
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so4049495e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744896396; x=1745501196;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T/uHlC6UoBPrjU6+QaaVuSN4oPRWaY8QJta9DsekY80=;
        b=MqcA6Ya/f7nzLGgSJ/Bx+r9+QF4b2l7/oBq3t8ufnF9ISWeBuArb4rxgUIp3jfwH/x
         VsG75zhIdm2uTOr2LoiUxvh5DQd3LDgERYWbH/S4Ch9xUKDHoNa+2PSnRKBsZYWFvOk6
         mOBBqLKAQDWhk/YAZwsNyhXGJ4eiMNUXPz8HphS4L3Plr9ybofA4MJ5OxQvCzeFiFnMQ
         4ydzrup0/wRPJ22n2lthRqc7Km1fxeZ0Qqd30HgBR3kbZK7cMbxSZU9CEPdGeSnLB+TJ
         Rd1I3BVFDbO3kz5tezZCM6L8iBEiCOZ5R7iUhQZTmPDA08MC6k4u1rxQ3Z04xHLyEYv4
         dy2A==
X-Forwarded-Encrypted: i=1; AJvYcCVqkm35D08lNYcpBm66AZjZBkSNHkiN6zM9x7hoeCh9rOYvMqNeugSHekKYacxovL7rePm1iO+xxhoegNk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4F9MOMobWPJ30TjGm+SsdcTPGi2ic19EbTRvag/UHQ9TCi5cu
	WajDmqCH6NFL2b2Uzr2vCNK4LT6gjtc53ZTMCGGAKJRo2RC/1R80j7kuQF++h7H8stUwRc+g1gt
	70IyiSP+cjYCbgmdPdSAIxhhKrR7l/TaofDulchrx64nrJPhejKIl9Na5n3dW/A==
X-Gm-Gg: ASbGnctDUKvg5/iThSntDQjHS8neGOrDRTUzAdpHi5epwsk8uEdFl3ayyBWB017ytYl
	JVzyeUhFpRUyGtZYTh6IesE4JllLcPK3HyhJBg8G2Q3w9bmwr8ElF77m7WkyA3MGPP4Ytmonl1v
	ShFnDLNHAQtKpSbchCenLJgYc+QbTcxThSTCLokik9ZXdFuSJ6LnSZTRTnS9b3+50auuwt4well
	pDiAcONjsyFGwY4PaU5BfebJpuZJD3sglhnZLgDK9/8w6Okhx7EO/NuY/Cdp+/pcYHSkadBXrVC
	zMM3lp4WAC/UvldMvHsjgH3ZGday8TI3IZlyrB9zaUy/x5XwRKeZjypZR+ORBvKl0jwqX5VNAUc
	ExjdtdgMmcAWPsbLleTNndM7mzx3L6zptti094qY=
X-Received: by 2002:a05:600c:1e0d:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-4405d5fcd26mr60199295e9.7.1744896396413;
        Thu, 17 Apr 2025 06:26:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdxIJvd+ZnofZRyyQ+HPKreEByoTfd527QFM1n5sKoIq0Bk40WD2AI3yY5l1G9EQICX7Jr+Q==
X-Received: by 2002:a05:600c:1e0d:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-4405d5fcd26mr60199045e9.7.1744896395980;
        Thu, 17 Apr 2025 06:26:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:2700:abf9:4eac:588c:adab? (p200300cbc7062700abf94eac588cadab.dip0.t-ipconnect.de. [2003:cb:c706:2700:abf9:4eac:588c:adab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b50b964sm54487825e9.27.2025.04.17.06.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 06:26:35 -0700 (PDT)
Message-ID: <cc0d709a-3d9d-4802-b9ff-898cf7e5012f@redhat.com>
Date: Thu, 17 Apr 2025 15:26:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/rmap: add CONFIG_MM_ID guard for
 folio_test_large_maybe_mapped_shared()
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Mingzhe Yang <mingzhe.yang@ly.com>
References: <20250417124908.58543-1-ioworker0@gmail.com>
 <a825b3c3-55f7-4d90-a318-e20acf55e0cd@redhat.com>
 <CAK1f24mkswwY71EKourpw1y-KiFi08OkGzZSBkutoj+UCgbLMg@mail.gmail.com>
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
In-Reply-To: <CAK1f24mkswwY71EKourpw1y-KiFi08OkGzZSBkutoj+UCgbLMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17.04.25 15:24, Lance Yang wrote:
> Hi David,
> 
> Thanks for taking the time to review!
> 
> On Thu, Apr 17, 2025 at 8:56 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 17.04.25 14:49, Lance Yang wrote:
>>> Add a compile-time check to make sure folio_test_large_maybe_mapped_shared()
>>> is only used with CONFIG_MM_ID enabled, as it directly accesses the _mm_ids
>>> field that only works under CONFIG_MM_ID.
>>>
>>> Suggested-by: David Hildenbrand <david@redhat.com>
>>> Signed-off-by: Mingzhe Yang <mingzhe.yang@ly.com>
>>
>> ^ should that be here?
> 
> Yep, that's my email too ;p

Best to stick to only one here -- same individual :)

-- 
Cheers,

David / dhildenb

