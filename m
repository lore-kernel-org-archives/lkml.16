Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D0E1A4E9D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146461; cv=none; b=lpqqS9bb+MTnQF7eVyuoWPbW5STojINjLPz+XO2Lgcjf0ZGCZXadxKOqciETt9qqgjYxashdnI+mc6qD9mxHb+WsYbYW+MzIaJyh2u3z7/VWpw1ikkeZrFilyR/QenWY0F0TOwRRtwS1kxXr4taQ4uP6grzGlRWPOb/eT/nFKjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146461; c=relaxed/simple;
	bh=gvGTnzT7emXNPqNSe293HDAOvLp4nNIKyfj3apMtfk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ot++D80FKoBHMkfO81Gx/1nLepo1G4rVSBbor2X0uTZK4yam0KjqwSo93fEBDhWc4q3ZEBb4Bz66INrPBEvDJ449JV3BYqDtn1BRH0Mh/V6RXifR/aJ6hRScboMGP5qCYNKQ+N630j5MapR/7XyBXJy8AFPW0ZzcxEDNUKtdPso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V6uGtkvO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V6uGtkvO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750146456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=w85+TmujKpyVvjZF4Q1cpgNIQmyHhdsfDRHePX2Qcrg=;
	b=V6uGtkvO1ISyeQtjav/YoGkXL6gvj3tOS+Tu0wq1nHW7vTogTSEZ0lInwRQLP/RGPcT8rt
	AT7V9uSjbWtay0OeVHol7/XXzXEbt3wjzebViu3grO8KIKWTSLbJKzBEA4pcAWu8ZJGktP
	ede/FrRCL+dZwHoIeKEhUhWP0WLHwO8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-79lJa0syOeyLmYJx9wlxfw-1; Tue, 17 Jun 2025 03:47:35 -0400
X-MC-Unique: 79lJa0syOeyLmYJx9wlxfw-1
X-Mimecast-MFC-AGG-ID: 79lJa0syOeyLmYJx9wlxfw_1750146455
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d21fc72219so439666685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750146455; x=1750751255;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w85+TmujKpyVvjZF4Q1cpgNIQmyHhdsfDRHePX2Qcrg=;
        b=VMcBTzZZgah7FZ9etgkSPr6csyajZEH2cNzKftrQNF2BZLpKdhgWJmj/i8LOnyPzSH
         wHOfiAh09HxMHHiT3ubl81F8G04C5p96ABIojKOidr8ZIzeEM3jUWQQLtEr7kxogMVkp
         pjDUkbTKUA6FAk53Hhx3NriKYlcAOCdmSgA0hiSI6cTLgkYGAIVrCJspLrEswYUxx7b2
         Z5B5OUBgz7EBvWERJ+4a/rbBGW0MtY7gvaF1szPtYJJLxgjdO0RMY1NUv79sorMokOW9
         4jgsKx2sYUit6vFySf3PM/qUxYT2tdR1lOcyjONCP/hQO+QkfHWap2zrWBCnIOrEX+yx
         TfPw==
X-Forwarded-Encrypted: i=1; AJvYcCWAcViSwROSvEm1Qui1j5hcvgQi2vHmfTvd9cRWnXscd/8RDonIGaIdT2td43sAswYUy8PKbFaOqrsoZ/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVLNgPMcMCTTq9PalGM8276PLTH23rGHZokH5njHIJFOrmjEii
	ENl7nkN1PYVXird518tU2F62t55w0M3WVHaaCYL0akH2WIO7zwi9MwRy7u5s4Pc1evztEO5k+fd
	K56/cXiJasCI6G5cVJcmdMidpM3D/pEpB5pPTHAx/Tb0tAFCuDMTWDc41sXAW3u6OwA==
X-Gm-Gg: ASbGnctNVR6aXmW/VgvpuPlZfQJ0s0yWSidPC/5PlP38fB557cIANSsTZXvvN3tjSBz
	rc7n1a7+GhLCXey+ffgT7rlZcLscTlr5/E18iXjhqlyLgrrlkSuyT9G+cJL84uwK+vo/qfu3BPl
	k2JtMlCCfY2yduMAjR414IHQWMj98OOkU+gqdKY0WGomqEOprAhHt1Eq6/i05qlVJCUMCg5V3FI
	ngoE9T1ciRNSWUnvB6ctnEDnC9HRDoE58G8ZWw/VJqLgSli+On8nv2ISbyZBj+qvNp1+v0pA0nH
	WcjlxDKWmB2ZQ2eUX46M46Bk0+4XrzGrzh2az+jn4THQidAhmyYiKPSngjYzJe/FcbzReWgTWgh
	+/3KXkIkIlDshwaTBl6enWGR+V7Lxi3u6ZJ8fufZP4i/eAfw=
X-Received: by 2002:a05:620a:17aa:b0:7c5:5670:bd77 with SMTP id af79cd13be357-7d3c6d09a79mr2044697685a.55.1750146454665;
        Tue, 17 Jun 2025 00:47:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+NlvRpZN2fLlDaqQ6VLi/ugCZ+JEULI90ieq+QHLjqAcoHZ/8hkGys7iGpvhWF+uJtFQSzw==
X-Received: by 2002:a05:620a:17aa:b0:7c5:5670:bd77 with SMTP id af79cd13be357-7d3c6d09a79mr2044695785a.55.1750146454328;
        Tue, 17 Jun 2025 00:47:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8edbe29sm618288785a.91.2025.06.17.00.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 00:47:33 -0700 (PDT)
Message-ID: <5bbf39b9-ddfc-4d97-8f08-8bd43223982f@redhat.com>
Date: Tue, 17 Jun 2025 09:47:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] xas_reload() in iter_xarray_populate_pages()
To: Dev Jain <dev.jain@arm.com>, ziy@nvidia.com, willy@infradead.org,
 dhowells@redhat.com, hughd@google.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
 aneesh.kumar@kernel.org
References: <20250526063524.22597-1-dev.jain@arm.com>
 <918d552a-085a-4529-8f20-a060b1f0c9f1@arm.com>
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
In-Reply-To: <918d552a-085a-4529-8f20-a060b1f0c9f1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 07:10, Dev Jain wrote:
> 
> On 26/05/25 12:05 pm, Dev Jain wrote:
>> Hello all,
>>
>> After doing an xas_load() and xas_retry(), we take neither a reference nor a lock
>> on the folio, and we do an xas_reload(). Is this just to reduce the time window
>> for a race?
>>
>> If the above is true, then, there is a negligible window between xas_load() and
>> xas_reload(), because only xas_retry() exists between them, so why to even reload()?
>>
>> Thanks,
>> Dev
> 
> I do not completely remember our discussion in THP Cabal; I recall David Howells maybe
> saying that the folios are already locked, so it is safe to do xas_load and then do
> a folio_get()? Even if we remove the redundant xas_reload(), I still don't understand
> why we won't need xas_reload() at least after folio_get()?

I think the points where

(a) this should go all away soon

(b) there is the expectation that the folios cannot get truncated
     concurrently. So we can do an unconditional folio_get(), don't have
     to check folio->mapping etc.

(c) The xas_reload() seems unnecessary and can be dropped.

-- 
Cheers,

David / dhildenb

