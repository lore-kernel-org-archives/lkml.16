Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10F642A82
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745221228; cv=none; b=qBwbMJyJCm4VMD+Ka62OqRvTirnCirNdRqXeduwUBpfERIDVVGHBigJ3Nz9N4tZJyk4ukMkLh4BKL93ZuGQCyECr7uY57TrRg7sNsqQwLbo76tdeSuFQHgPAnfYojzGyyz9rQ/m23bTjOy99Q+nbcOE+FM6d6XINtfLxmx3E0gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745221228; c=relaxed/simple;
	bh=Kfumr2/gXKTMOgwXtZMXTBR2J2l5RMyLlWf/pF4D0TA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHF6GygJOFq08pVkqnqcMalaeWQLU6ViwrCvfhn3VkTdECapX4xqTlV80FHOgEaS8XJFDk1YLHOPZ8r/yvlIsrXvT6L1odDj96syUMxc76OApfd0kpMGu8f15EtnYh1TcswmSwXttnsWHpJdYT0SLpZpoO5iE2BCmxIWMwY0Coo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mc9DYfxb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mc9DYfxb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745221225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LtHpodqllCmUNYoOHWLEm9hWJzsaKYZRW7itwMBbXPo=;
	b=Mc9DYfxb3LkLMHZvCkG6CZq8hR9OXMevzPaIH9s8FY/tWvYxDoU7T9tXJFkksKaGLU82mW
	I5A2GDHirgiQDeP7AoCorTmSwf9v4GdeJHSG3ELGww2qc+7IKlyKrPMmdcWKRTXgGCu2kK
	yst0+i/+8BI4Q9zb2mbAVR20wNA/CXI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-qq3CVxwLOJKoZMRz04W62Q-1; Mon, 21 Apr 2025 03:40:23 -0400
X-MC-Unique: qq3CVxwLOJKoZMRz04W62Q-1
X-Mimecast-MFC-AGG-ID: qq3CVxwLOJKoZMRz04W62Q_1745221223
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso20744505e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 00:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745221223; x=1745826023;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LtHpodqllCmUNYoOHWLEm9hWJzsaKYZRW7itwMBbXPo=;
        b=hTASoQZj9dZ+QtnfjOHIIERFHHYJZcnQCyST17vGvMV05/yXCQWzhJqbhqzznUsyQz
         g5uLMwBYP3YZH38mMTXv4MPsuHLUJ9+6UGu6urE3dyf67AkbEkbAHsWcFHYdiVpVfWNq
         Ta7kZyujXp7Xvn267gjomXe6/PJFUGRAnDeX/ECgiyO9zrygWAfR0gL/L75Z4Z3cxobZ
         KXG0ARgzBqNEy7SMfX+0kbJ/NOnOPnPicEBdPe7SNXPmi7fEq5mdn47OgGZNC2IvPTNJ
         Mupq50ohN27wqvbeqMMItu+4GKAh1EcYfbkDh7/NY84pP+nxXA1mbsb1YfMBd9KKdMEa
         AltQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa3tv1lqdLPe88efJv544/y3ti88MHUCDa0lxJKvAWW66CIUkGtKqKEfSSDugZnER3NjVz+CBEucN4prE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcNtBAK+1dfx76DDwfLmzAliHYCrhpGgXMX5ZXfIBnu+XVTWh3
	/BW7egs5j+pYDUhTOMpEF1Q+sM0wvVu1AH+zVJs6ygA78RpqTjrJx3vIJuboUZ09DVUgcK4HSS9
	7PJ+LLiFHsr8LfPJ9TzuB6IaZJO/4i/bikEuveu9JNffVJdaXqsYchq3tBE65Ug==
X-Gm-Gg: ASbGncsYwLGCH/p72KPvzt/IpoRVF4Xa8riEdie1Wvw9ujkSHxpM0slKgGo6jR31AAS
	XmM8shW6c+mfxh+TN3K/fsu2Aogjn7gclS0LPWC+h2JP5vs7he2To+EXkN8BaP8JPq08hyB9cWo
	GM0ol/E0OfR3iCedEX8+V0rX1v1VyrcwvmsCX0oSWo2A8P7ZJVhTupICaG4u06vbzoIit15PdBx
	bFBjFBAqu4X8r70cGlnmWSpii7anffOStg/kl0T3pF3fUdSJtfOsILoAEVJHGfOJg+96Xedmq4a
	yk5ZrSIn6sjA6Qm7sxWnOWlTpnJHjUTmkgyghXIq6OGlrilUALtVk2qC32y+YyHzU/bduvzYuoP
	HPCqCxv6OAKzlgqxk4eEclKhjo1VUOpWavMxIBgI=
X-Received: by 2002:a05:600c:3ac8:b0:440:67f8:7589 with SMTP id 5b1f17b1804b1-44072c8905emr67251595e9.16.1745221222821;
        Mon, 21 Apr 2025 00:40:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaS9eb0GoGuJNkWivLFNSVkQuDFfAfr7ZGHpUHAUiVxHyeSnMneOX1eNd387oWuiqwQAcNbA==
X-Received: by 2002:a05:600c:3ac8:b0:440:67f8:7589 with SMTP id 5b1f17b1804b1-44072c8905emr67251325e9.16.1745221222470;
        Mon, 21 Apr 2025 00:40:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d6e0364sm121710665e9.38.2025.04.21.00.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 00:40:22 -0700 (PDT)
Message-ID: <e3c635ed-7d4b-4d07-80ad-75be950b803c@redhat.com>
Date: Mon, 21 Apr 2025 09:40:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/rmap: optimize MM-ID mapcount handling with union
To: Lance Yang <lance.yang@linux.dev>, Lance Yang <ioworker0@gmail.com>,
 akpm@linux-foundation.org
Cc: mingzhe.yang@ly.com, willy@infradead.org, ziy@nvidia.com,
 mhocko@suse.com, vbabka@suse.cz, surenb@google.com, linux-mm@kvack.org,
 jackmanb@google.com, hannes@cmpxchg.org, linux-kernel@vger.kernel.org
References: <20250420055159.55851-1-lance.yang@linux.dev>
 <2e501e48-8604-4813-b76a-d467cad67f53@redhat.com>
 <dcbb55dfef3d79de72ada29ea04a3610eead6437@linux.dev>
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
In-Reply-To: <dcbb55dfef3d79de72ada29ea04a3610eead6437@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
>> Are we sure the compiler cannot optimize that itself?
>>
>> On x86-64 I get with gcc 14.2.1:
>>
>> ; folio->_mm_id_mapcount[0] = -1;
>>
>>   3f2f: 48 c7 42 60 ff ff ff ff movq $-0x1, 0x60(%rdx)
>>
>> Which should be a quadword (64bit) setting, so exactly what you want to achieve.
> 
> 
> Yeah, the compiler should be as smart as we expect it to be.
> However, it seems that gcc 4.8.5 doesn't behave as expected
> with the -O2 optimization level on the x86-64 test machine.
> 
> struct folio_array {
>      int _mm_id_mapcount[2];
> };
> 
> void init_array(struct folio_array *f) {
>      f->_mm_id_mapcount[0] = -1;
>      f->_mm_id_mapcount[1] = -1;
> }
> 
> 0000000000000000 <init_array>:
>     0:	c7 07 ff ff ff ff    	movl   $0xffffffff,(%rdi)
>     6:	c7 47 04 ff ff ff ff 	movl   $0xffffffff,0x4(%rdi)
>     d:	c3                   	retq
> 
> ---
> 
> struct folio_union {
>      union {
>          int _mm_id_mapcount[2];
>          unsigned long _mm_id_mapcounts;
>      };
> };
> 
> void init_union(struct folio_union *f) {
>      f->_mm_id_mapcounts = -1UL;
> }
> 
> 0000000000000010 <init_union>:
>    10:	48 c7 07 ff ff ff ff 	movq   $0xffffffffffffffff,(%rdi)
>    17:	c3                   	retq
> 
> Hmm... I'm not sure if it's valuable for those compilers that
> are not very new.

Yeah, we shouldn't care about performance with rusty old compilers, 
especially if the gain would likely not even be measurable.

Note that even Linux requires 5.1 ever since 2021. GCC seems to 
implement this optimization starting with 7.1 (at least when playing 
with the compiler explorer).

-- 
Cheers,

David / dhildenb

