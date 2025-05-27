Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E531F26A1DE
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748349248; cv=none; b=ol90Bgb4moLAftYQeGIU/zV0ESI4Tw5L/mR55tu26v27zXyp+4aw8+Td6ol17WmL7nJWI55jeAdz26ZOBlMet0RQJXiO0mKGSzMF28ARrGF7joSXQxSq+R4H3bNTTfqYos3wjvZApHuUKKwNYbnYdf8+m5DvkNyyVmiUI/LT05o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748349248; c=relaxed/simple;
	bh=GLQStpasjWjcjHZcmyqLKGTR//tmYDzkkLnTWed5tk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EDHemQOd5AZEmvRIqwElqjC3X+cmdvcnh89C2vM6VjYnStXml4dpQguO0ODt2lmzqNpQnqEDNwrGbILbhZh6SIbjjUfTrVbYyCHkdwCm9zlXAdtka5sPsntOICyAY2CnY3nHBowgExUeOfU/MDNzJB8N+EQaty6mocSal+zlmDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UtXAC0Od; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UtXAC0Od"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748349244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fmrg7Mz/N3KeXGspKAhAFZUUGtopHb5QnF04/Cn8Fgo=;
	b=UtXAC0OdkiW0UgjPf92Ng/IAXf4aTrLiDvZt15G2l2A4BDi5yLPoBNYa0Z2V8um4kEHRrF
	tG9EwhGvY3yi6nQ2hSDJYm8ynlh/j8cUDjCrkvNkQHDr3GcMrNPfD6yPp5IWZPc7SOETyo
	S8uYTAzhKuYgDYcoDwgCaUxk/sMLvIk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-AC9b6AHaOFeFB0fGVbLPDA-1; Tue, 27 May 2025 08:34:03 -0400
X-MC-Unique: AC9b6AHaOFeFB0fGVbLPDA-1
X-Mimecast-MFC-AGG-ID: AC9b6AHaOFeFB0fGVbLPDA_1748349242
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4d5e1af1fso993770f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748349242; x=1748954042;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fmrg7Mz/N3KeXGspKAhAFZUUGtopHb5QnF04/Cn8Fgo=;
        b=BECbXhXH0Dkb6pmtqF2kJFOY2x3qY4S8Bfcg5tkCBZcNhSD4JWJtez0Ze2JTauhpa+
         gEiWKqlrzajy37j2M+W2/hATpe0sZdle15WXSd5C2E0l1D1kgwRORbJIrF+8VlMhDA0z
         bsKQlxBp0M0VniZH8B3M61A8jsLoVDGLx8FGONOAiGVcvrEU/h6h2tHqrh1yx3ENPExS
         E1V9/+2QqYeztN3LNnNCGkx3+e8dadcW9dxf+Zt4OIUj2SPLF8GQiSYD5foQ1mZKpOtX
         YjsKPtas1iAdXojQosprga8VD2O1KWR3+EoGLaWuWNyoH9VrmHAceXvzAl3EDq5uIamo
         YxrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSgxAMlwHKEGSfJvdwJVcB31bBBCsK36j2UYQzBCHDey2lDclYgKn2DTGLKiyaVNYc7BaHTE0sksmE4b4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwejHDhST5Y43BNoleArwCXGjnNLI24yUfoHyzPqDpcsUnwHbZi
	eVxnel+bgb632ZrC3zmA/ywOPJr0vwyaNjxcT6JDXIJcrxBbj9IHbnG04EOfB2DLHAh1FkegnXF
	yumZB3T2dvyMcSSvFgcLGKAM8xFMSsqatlS5CS4Tg1QScR0JQwzxYtmtV+6JEh+BXUQ==
X-Gm-Gg: ASbGncu31czilyjbV2ZgePDaUz+SpB9Ss0obPnZ3SkAUt7x2pBIeRJ6+oBsmM3Wr7O3
	iL78WzFHzBtfetxILFF7lES0kGrlgshhXq0QvJwWPH6jYtBXE26DGJ9A6fEutiXbV0orRcUnd43
	69B3J+aBEddzxRKUO+mpaMX3Jkt9RMF6GMwWACXszcppb/PcGT7LH/h4FkPpjUtQ2gUXBxF8w43
	N1GBXBSRcpn408IrnlWkJk+k29vm7dOXN76ik9Xx4a7HNgguzGchYDFt3T9ZDdVloAIuSE2khr4
	gNDJquJWtqKwbobWw7S8gmhEqZv8T1MhSWEuLBlbn+4f
X-Received: by 2002:a05:6000:420f:b0:3a4:de01:ff2b with SMTP id ffacd0b85a97d-3a4e5e6a7b5mr458470f8f.14.1748349242380;
        Tue, 27 May 2025 05:34:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr+vEguSUIbqkCO4UypZwqDkKUDtCMMZ7AuyroOQyF+VP5SsKVEWUO8txTvaZseEvvbOBaGQ==
X-Received: by 2002:a05:6000:420f:b0:3a4:de01:ff2b with SMTP id ffacd0b85a97d-3a4e5e6a7b5mr458439f8f.14.1748349241987;
        Tue, 27 May 2025 05:34:01 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d2a7a317sm8125988f8f.24.2025.05.27.05.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 05:34:01 -0700 (PDT)
Message-ID: <0f09b648-bf0e-4b7a-99ef-a7a42cb20054@redhat.com>
Date: Tue, 27 May 2025 14:34:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] selftests/mm: Use standard ksft_finished() in cow and
 gup_longterm
To: Mark Brown <broonie@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250522-selftests-mm-cow-dedupe-v1-0-713cee2fdd6d@kernel.org>
 <20250522-selftests-mm-cow-dedupe-v1-1-713cee2fdd6d@kernel.org>
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
In-Reply-To: <20250522-selftests-mm-cow-dedupe-v1-1-713cee2fdd6d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.05.25 19:38, Mark Brown wrote:
> The cow and gup_longterm test programs open code something that looks a
> lot like the standard ksft_finished() helper to summarise the test
> results and provide an exit code, convert to use ksft_finished().
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

