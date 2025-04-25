Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6E446447
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597852; cv=none; b=bd05In6s9Jh738Vmo3KYJeIeHFjYZ4iY4yGqUwDUZfrszOPMQWDIRZLXOcCPxiRjRo8jXWQBCdKN9K7fCtoUCPQG6UmS3IV8+IQx15Sb01WimVxix6e86qo8u89bEY8JCaWy1617Jcy6XjfbULQxz4Q8PvpdFj9PH4R+lNFlYtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597852; c=relaxed/simple;
	bh=WufeSuS59zcqjgy9LKqSwZBfIqLKyeOY6OVpL31cUbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OKQG4px0vvDhaA+y2q0buX0qC/6+3nfd+HMiEt9wVhPmtOneZiTVpHaQLwMOW/mMfTSBrEHDH19QSVByV0z4pF9bImIlACpwb3KU3ZreeOjcJWNA+Rq2usQD7DUt7d2JadIJEpE0o5+MzS3KYO4zKQfcXonhCc5m/8izBudW0MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bETgTlzH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bETgTlzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745597849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=b29eryv/5AAWJSs47U1xXSbFp20tCYH/BD5vHiB/9Ko=;
	b=bETgTlzH+jZ5GNeLHPo83x9gip+bLMI7u8Mzr4ROSpN67GGFoKQd+Xp/sWUiqbDeNGvPW1
	ZfaVES0+Uu9C9eZjqtXVTLjmWrJ1mfn1EaSlRcTwx0xAYmWKLnAkhnUFlIcBslpW84BX6V
	ZHu+uzMA155zy+d17iNKyyJEubHeV3c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-EdCC7aAOOP2y1VU5JSsG0g-1; Fri, 25 Apr 2025 12:17:28 -0400
X-MC-Unique: EdCC7aAOOP2y1VU5JSsG0g-1
X-Mimecast-MFC-AGG-ID: EdCC7aAOOP2y1VU5JSsG0g_1745597847
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-440667e7f92so12421065e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597847; x=1746202647;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b29eryv/5AAWJSs47U1xXSbFp20tCYH/BD5vHiB/9Ko=;
        b=RMjFbjt6nmgwpVeDx/SMW9HYrfXlIZV62aFlONB0EVzRectZU4YPhkWokhm4oUs7CO
         tAtB+6nE184v8yXH3qSodI0k4F40AB3GB2yepG6Wso/xlB/2lp95SJRKe7JV9MtINzZf
         nejS0Hnnu5PeqBA5nzuPn0tljrs1uOztiQGqO/2zUds/CKOgD+NkVZoDlFE9xITFZYzQ
         0S0Cwq6LDZTfxl55E/68OUgjXt5UB4gcsdzrc4pe2bU7RUqcp3pYbwJm6+qOh+a7cRVl
         Hz4B30M0bR712ksNjGbWQoqz8wMpnighmIz2lMtKp2jfHN5NLinlr5N2Ym5ALsgO7hlL
         po9w==
X-Forwarded-Encrypted: i=1; AJvYcCUC/VzR19PBbl/TqqSWa31dg/qFn8zR5sCh4gSK0rB1MZmDTlvooVlTe2FHb/AxnAB+9q1EeAXbY5QAcuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt0qORRtYE3T6EAGfH7/0HjdEHkoOR/Jmf557KXo3ZlVZ7F3J8
	QFnrLBInH36kQ6WNj0/HGFz7/GvMaI4SyKVLi39GR5Df7tg7D64EIjHw89ih0RNCh97dKTZS1EA
	ZpQntaAIeTyFN2J09RSjYXLX7Cib5/epr5eOqm56DzX85gw7tuwQqCbBhT6aJ2Q==
X-Gm-Gg: ASbGnctGzR+zUiFPI6b00u0kazjdghLEHxvQPzcxIkZkw3E/b//qjGJ6JMp437lXzi/
	1ntEO3d65AeMZs/3JLfaXyq2wzKod4UcSNH85lG/i1K3mo2ilmeSYI4P4K2Gg/S4PtBUj3TIye7
	JaoyWD/29YfZeBjwDGUdqinuw9VeHqwUzSKRqCalA8OhqTvjM0++BtisjtXTPe/Xypayj+iP8Ys
	dM7awHJoamumuuX3ZbvCo/Jg5GTqEqTQ9QFvseUKp4it858jmIqEnY6YADDGauyUs1jJpTRkWo7
	AEllaCn7h7Bzd16iQy5BPeXiCa6qTHOZPkQh9iWCNRBWz26M5HUEHdxAtcxdkb9+rgo30HlP31z
	/ibQ7XavVAkbwBH2h6IaObxtfIaA7odJ7766g
X-Received: by 2002:a05:600c:1c0a:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-440a66aba2emr31976905e9.31.1745597847126;
        Fri, 25 Apr 2025 09:17:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUpSeFkaLb/Bim7f0WUY/4VwJzME7Xo2p8Q6+jlFDBeIyS8dvjIoW4jh0ONrBl6RD4okp4iA==
X-Received: by 2002:a05:600c:1c0a:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-440a66aba2emr31976615e9.31.1745597846752;
        Fri, 25 Apr 2025 09:17:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:6900:6c56:80f8:c14:6d2a? (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de. [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da4dsm2788208f8f.99.2025.04.25.09.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:17:26 -0700 (PDT)
Message-ID: <cabc322e-d5ab-4371-a506-c7809717b38b@redhat.com>
Date: Fri, 25 Apr 2025 18:17:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
To: David Woodhouse <dwmw2@infradead.org>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Sauerwein, David" <dssauerw@amazon.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
References: <20250423133821.789413-1-dwmw2@infradead.org>
 <20250423133821.789413-8-dwmw2@infradead.org>
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
In-Reply-To: <20250423133821.789413-8-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.04.25 15:33, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Currently, memmap_init initializes pfn_hole with 0 instead of
> ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
> page from the page at address zero to the first available page, but it
> won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
> won't pass.
> 
> If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
> kernel is used as a library and loaded at a very high address), the
> pointless iteration for pages below ARCH_PFN_OFFSET will take a very
> long time, and the kernel will look stuck at boot time.
> 
> Use for_each_valid_pfn() to skip the pointless iterations.
> 
> Reported-by: Ruihan Li <lrh2000@pku.edu.cn>
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Ruihan Li <lrh2000@pku.edu.cn>
> ---
>   mm/mm_init.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 41884f2155c4..0d1a4546825c 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -845,11 +845,7 @@ static void __init init_unavailable_range(unsigned long spfn,
>   	unsigned long pfn;
>   	u64 pgcnt = 0;
>   
> -	for (pfn = spfn; pfn < epfn; pfn++) {
> -		if (!pfn_valid(pageblock_start_pfn(pfn))) {
> -			pfn = pageblock_end_pfn(pfn) - 1;
> -			continue;
> -		}

So, if the first pfn in a pageblock is not valid, we skip the whole 
pageblock ...

> +	for_each_valid_pfn(pfn, spfn, epfn) {
>   		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
>   		__SetPageReserved(pfn_to_page(pfn));
>   		pgcnt++;

but here, we would process further pfns inside such a pageblock?

-- 
Cheers,

David / dhildenb

