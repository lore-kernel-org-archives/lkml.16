Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4565C2F430C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731795; cv=none; b=D9cTB0ho4GnHGFNy90ju89qsCaNa5RGliGIgrFn3Vu+R7J4dpC8ePtCuwgTdV1B1PIy70pU9rRhso9gXKVtugF2UD5bsFOPSb1HM0K6RwTJg6wOqmf5QLi34MoQ3PhfMEnARHaoLzu90XYjm2ZbSKO6M1uXjp6zzQZx2vgysoKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731795; c=relaxed/simple;
	bh=0HnP0FEpzj7V4q4R8wW8B6GxRGKwBvsj9FPXBxQnZFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiwa4Md+E3hQFqVE8Er8gGRMlVTaKE/Ko/yiNlxQm3crJX94QOqA1aC9WYvgNsdvjkgP3X8Y2PfCuTQ2mgN9fp9v2xKmBIbQdTlfWFGBFNOpNRQROAmJglxAdVRRVJuoZHx3Y8Xyj2nBmFd1T7MFrz37SPZmRtRg147+XtuogYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ncecoy/x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ncecoy/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749731792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4Bh4dX1JlKlhpTIcfeVbnBt6ZIPlXQjwiP+ROQ/J7Y8=;
	b=Ncecoy/xWjibUna/AwcW19ZV48hUsoa10NNFe+ESTNoWQVQ3txDB1tUfR/CyWZI7EMxdkf
	mNY//KUmQUhzTVoyGUUQ2UTyLW0OZjPNqE5GGuzaRYmGJJsKKfg4XB2tWFQLZqX1Bj6vCb
	ptN4BceuyREJfPkY9XLgZrM8lm2jxTA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-gNZhPBBgNnuJc_KQbu_zrQ-1; Thu, 12 Jun 2025 08:36:30 -0400
X-MC-Unique: gNZhPBBgNnuJc_KQbu_zrQ-1
X-Mimecast-MFC-AGG-ID: gNZhPBBgNnuJc_KQbu_zrQ_1749731790
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so433173f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749731790; x=1750336590;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Bh4dX1JlKlhpTIcfeVbnBt6ZIPlXQjwiP+ROQ/J7Y8=;
        b=KBBMKto3DFjR/ZNjYPgAnPoq8HofL4gWJ7Vn3P0vCyr1T0a1cfYeINeo9oBi0ATZ2z
         3Pv1/ljhhFtP3e5Lqr9EgpBYjEWJEQ8FXTg0c8Gu2r1u559p3/i/eAgLy1dDjVm9dkv6
         tD5L6osCNfq2VQM6GXsyw5SRd9a6iQYZqpXyWRJxIcqHSx/TnwkOQm9R1AndKAXg2T/u
         RMhDEJFGIvLIaP+sReiyUCmX+8ZFQgW3zciAIJlfVKsDaiWNh8JVBjjWVeCb8Pl/EllG
         Pvf2IPvdJQjLOu+OYWIEDPE/JR+qvCbQerBhxnDBrPa2nu0F6wG+6SVm7KwCpqDomvC7
         c3ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNMajGpSipO6gFXq0dfQFGX4z+wmVqAs8tCX6Tl0bzK5Fi/H9CYrDPvSN8W3/Nf5YvK8PwfcSGCW//S5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOcJ7PsXIp8fMqP/vN/T6nQGHfeU/REkfdVV9pqsjvniPo05Xu
	lch2a858BDRZbw8hGhvtckJRlrMzJL14ZxRu5D/H48Rw9hLLdImrYNKGgGMFVSre5yFfbPadauS
	VqDcetwYWyeUcuJ+N0BKp+dzdbhlg1dCLyovstGbOAdugBTEP383phX6p6+AoXOL39Q==
X-Gm-Gg: ASbGnctJ02HpRdVogRtuV0huCY80S70m28yKwa9JlKvJWgnEKEaWN5ILdpwx1CXCCdc
	ViUmNQMVHs2rCy2FBG1/P4a2TMI0n4STBQ/e9v1zToj0NpklQje8GhaCTSHbQP01t7dM8ooTnOs
	J5PfpDL03V2kshhE0ACGNl59nzRKwWG+0ULbiW0GeDkqATy6TnxeNq3LEsWYXbXOpdHVQr6F1Fp
	ozredgyk+oT7iOhKii77CDJ6YKsHzPfco5eEdpO55/AE0pViPJZAof+GSkRHqGxcnoQ6KRLUdJF
	2kVNuWMzAdC4sOstU6TrdG6CuJnFYrdvuF8ckl7gnekZD8sRtgDTb3nbWv4IyW8eUCNixyw7I7c
	WJLNBDTYaltcxb1q9W3es40fEN67vI7En+OCCLkW0HNMccHOUrA==
X-Received: by 2002:a5d:64c5:0:b0:3a4:d700:f773 with SMTP id ffacd0b85a97d-3a5606a2f5amr2645494f8f.11.1749731789700;
        Thu, 12 Jun 2025 05:36:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP7GX8mmfHyy1XVyDTzaFoVHDRBqUqGtA2T6X6nOqxDvXWDpKckqBp/AufLCjgyp/gY7i0aQ==
X-Received: by 2002:a5d:64c5:0:b0:3a4:d700:f773 with SMTP id ffacd0b85a97d-3a5606a2f5amr2645470f8f.11.1749731789304;
        Thu, 12 Jun 2025 05:36:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:1e00:1e1e:7a32:e798:6457? (p200300d82f2c1e001e1e7a32e7986457.dip0.t-ipconnect.de. [2003:d8:2f2c:1e00:1e1e:7a32:e798:6457])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b65b0dsm1909627f8f.95.2025.06.12.05.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 05:36:28 -0700 (PDT)
Message-ID: <79b5314e-a8d6-401c-a3d5-242a5887f562@redhat.com>
Date: Thu, 12 Jun 2025 14:36:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/pagewalk: Clean up folio_walk_start() by removing
 expose_page
To: peng li <peng8420.li@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250612120903.2678910-1-peng8420.li@gmail.com>
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
In-Reply-To: <20250612120903.2678910-1-peng8420.li@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.25 14:09, peng li wrote:
> The name expose_page is confusing to understand. From the code logic, it is
> probably meant to express "belongs to the normal page and get offset from
> the mapped page"?
> Perhaps changing "expose_page" to "normal_mapped_page" can better express
> its behavior? But perhaps its existence is meaningless, because fw->page
> can be directly confirmed and obtained from the page type without the need
> for a separate flag.
> 
> Key changes:
> 1. Remove expose_page and its conditional logic
> 2. Always set fw->page when a valid page is found
> 3. Add clarifying comments about offset calculation
> 4. Initialize fw->page to NULL at PMD/PTE levels
> 
> Signed-off-by: peng li <peng8420.li@gmail.com>
> ---


I don't see the cleanup here, really.


-- 
Cheers,

David / dhildenb

