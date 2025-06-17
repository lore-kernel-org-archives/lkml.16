Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9C62ED174
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175586; cv=none; b=Cd3iWPNV95dGf5v9gj3N5j7rruaSoIhugR1J2Jj10eF+P5JJcaGsgwwkiYEHE8PoYQ7QGrZ0CJZkStkbETQV7u8R4fy67a8gDyLFSH4dP0lw5n8P8/ER4SRlHK2dgnaEO7Dy79Eo0lo2ljVpmDd99al4wx4XvnHioENqF2KVq74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175586; c=relaxed/simple;
	bh=2y/C+adZWcpGeXZ41er/vdVT0+2Y0fJsv5oavIJoY3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnWxwXAQg+NPurx9qRaZifYjjtxYvIYO0lgWQg/qJHBLn/c9E1JNQzBwWOimqwdVIhryHO2fRzYMJvM+vEGB4UIcGtoHQYv+B7A9XObxWIowmcE+SBndBx0DxIM2DKxCAjWVgXj7uW13btB9z8H850Ozmi2XBpecoBrLxnGdofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hFHsLYVG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hFHsLYVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HaT4xhEiG8Bb8Mw40gW82t8aaZIx76CCvPK1lpII0+o=;
	b=hFHsLYVGpA1c70x6Mw37W058slgLHgVPFSvKNLVRINOvx7cXXSD5rtb102Pu2MQUzShfiA
	by0LEWVm7XGjyXpdwKdKbgo8StOutU7GYMzqtYmJI7ZNjTJcnJmOAXP72tuU7/LmLaOEQH
	qjxQ7YKXykY6SpFq5hlBjSgUSvKH6pY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-6dY6T4ghMdm2KuzKOeWpig-1; Tue, 17 Jun 2025 11:53:02 -0400
X-MC-Unique: 6dY6T4ghMdm2KuzKOeWpig-1
X-Mimecast-MFC-AGG-ID: 6dY6T4ghMdm2KuzKOeWpig_1750175581
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-60835716983so5454141a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175581; x=1750780381;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HaT4xhEiG8Bb8Mw40gW82t8aaZIx76CCvPK1lpII0+o=;
        b=Hu/a7mYdaCeVFyKkrOKZ76kI8bET8vJ7ewVXb+ZAjGl0gEcEHf85QvGRpHK0oBtEpi
         VtXy1pCGMJWMEXoL/nTsbPyjb1DBE1U88xEY5i9uWkJxVrKaeHnavvMdHvUPKWPgiJGq
         gg/M48jjBuMlKoKRZBeuv64mQ1+vbTL4OD2+B69b9ZFGrF5vp7+zSfNsAUObnqDolzRR
         LNNbdqkYAPyufhZosgf9sin6C2Q6Sati/7mzKtAbhaVmNxrKoPkD4X6KA3O+2zVeRxm/
         5yHrrz2q7AgvYu0o9OwLiSiR01UmAkq2o3/BdOEqLhlqxxZfxZfVrndUALtQYo50HGai
         da2g==
X-Forwarded-Encrypted: i=1; AJvYcCXugPwROL/lWv5eAanNE4c1ghspEOTTwmGBexy9QKQLBUotumd2BUNDv6lWKEp0dD379jbuHntrhyWcRX0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Kr3KCF6PlESyMXO++RJM5kKKe5N37xBIquTvmsEs5lIWv9RX
	3GcmwkCnuNNIi6yscjbtAb1c0i1GPe9/1Auz7yAz+IKsAhxiZmXEVDi8J3ZeclL7jslkX2/vONL
	5urRnQ5CH8xypPt/6tHhppAXvpJGOVqQTjIHd9w2TSJ9E7MdPwaf0pw9EIkXE/WOdCA==
X-Gm-Gg: ASbGncvsJkojo1UlojThC8NcYjxJaO15Q4Y7SBhVT7LPZENtqXcK2LVoLKKuCOxNpnJ
	p3RDHJzkWQ6O3HGlZF8a7i5VraL77gPlQ+RMsW3E4pVyZ+XnQgCY46rupVV2TxPsv4ZTY+J4gA3
	HfF8yvPLZUZbrNbLUSlgxGb2Ps1AubBUMo86Az9Ch7cBZsRm67GOeDwEVqBCzEzMNtCtG0I7Zge
	TZBs6y4HiZ1L4bIkWybxbtC7x8DvAveMpWmJy0Uo8G+2vuJsttVCGc6oeh+GsLtOYG6OflGy2PO
	dWx6PfHg9LcXmKvidwTjFGHXNNgeTz7jMWR3ZqNhG7sFIUV8mnUc4maKA0QBqiWng6bMrA53fDL
	2klyh8lzYU4BVkVV4APbl4jug223tgE4HBvJpbUSeHODHHN0=
X-Received: by 2002:a05:6402:5193:b0:608:176f:9b5c with SMTP id 4fb4d7f45d1cf-608d09482efmr12302494a12.20.1750175580154;
        Tue, 17 Jun 2025 08:53:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs/FdPJD1Cpyka9ske3aQonq0wW4O8xqaFFyELuEJmexa4cPGnTwDKHRl3GxDOYGTxbaQrtg==
X-Received: by 2002:a05:6402:5193:b0:608:176f:9b5c with SMTP id 4fb4d7f45d1cf-608d09482efmr12302476a12.20.1750175579810;
        Tue, 17 Jun 2025 08:52:59 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6097ad640bcsm2577033a12.25.2025.06.17.08.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:52:59 -0700 (PDT)
Message-ID: <027c64d1-6736-4e1f-9995-f198b38175f1@redhat.com>
Date: Tue, 17 Jun 2025 17:52:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/ksm: calculate ksm_process_profit more accurately
To: Longlong Xia <xialonglong@kylinos.cn>, akpm@linux-foundation.org,
 xu.xin16@zte.com.cn
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250604031758.4150209-1-xialonglong@kylinos.cn>
 <20250604031758.4150209-2-xialonglong@kylinos.cn>
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
In-Reply-To: <20250604031758.4150209-2-xialonglong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 05:17, Longlong Xia wrote:
> The general_profit_show() only considers ksm_pages_sharing,
> whereas ksm_process_profit() accounts for both ksm_pages_sharing
> and ksm_pages_shared for each process. This discrepancy leads to
> the sum of ksm_process_profit() across all processes not being equal
> to general_profit_show().
> 
> Fixes: 7609385337a4 ("ksm: count ksm merging pages for each process")
> Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
> ---


What happened to the original idea of [1]

[1] 
https://lkml.kernel.org/r/20250606070314.3028593-1-xialonglong@kylinos.cn

-- 
Cheers,

David / dhildenb

