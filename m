Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCFB1E3769
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 19:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633967; cv=none; b=RdQbb/Ok8U71CsKt/RRHJNWrE8gFmwBPjabfbDhCMPSft+23QnE+632U0KNnZBNQVw0fw3QUQcDiA4V8sC5Vh0RAfF3zdnz5EPv1yLPRG2DD2p8MINpbTOyL5VHdBgaZbgau0roUt4z9d6cg/qltUBcfoadj6DfCmEY3kcNS40w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633967; c=relaxed/simple;
	bh=gSSMC68ORVi3NgkdR/CpablTFMoj3NkVZu5Ph5+JRI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qy+VQ6Ns9OvRDm6WB7a0FuhM/5ihfKVUfqNiEmjgjbEOn72/R5dkFz6qAz6Acj5DxEmRc+bjsf7Ugu/KvPbCh8cLmPV9J6rdPWQFNt4k1NBuyCiY88scHNlln9/GOGjxSS62KIapV8btmIuWqwSZU9Oq96aEAaBKOa1c2T6e7/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cpwMB5eT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cpwMB5eT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748633964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lIabL3vEkgIL5Dyr5QMabwv+NPEZiHAnsVINWI95GsE=;
	b=cpwMB5eTCUUa1qYfpboFu32ZG/fKhMbXzxhQcM/yH1V4hLE5qezQylx+oSg+eiixGJDIq3
	Uo9ZjRGZYexCrXhswOrF4a+8PLS/AVy6JdY+wfXSM3g1t+ut+pLDqN4BQPjowYiadj/KRJ
	YQxAWnj2gIAgOvg4UzPEQn6amOfHor0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-8inLcfBUMR6Jt_dXFqhctg-1; Fri, 30 May 2025 15:39:22 -0400
X-MC-Unique: 8inLcfBUMR6Jt_dXFqhctg-1
X-Mimecast-MFC-AGG-ID: 8inLcfBUMR6Jt_dXFqhctg_1748633962
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d886b9d5so3466215e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 12:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748633961; x=1749238761;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lIabL3vEkgIL5Dyr5QMabwv+NPEZiHAnsVINWI95GsE=;
        b=B3891/WIThZOh/9R0s6mrvSVsxRSsirCdYIiC5sTjDcWOliad6tae7HEL8HdDRo0Ez
         Cu4MGx3VMM428CV1tGzpTfHYP/aQteqVFhuEb3jeW55gR1Dt8xJuPvVFPUvQjDI9MDrk
         z70uwJc8rAkQxxpouLAvjSbM497X/R/Qo8wuZ3xmy41o9FS0gHgtEEkg1FUbi1gr2TMk
         RvH2VsU3on7AaMZafs/+LNIexWuKwMjHdahribX1GDqJDu6MnHrBLSZbOJBfvyLQuAUV
         MvC31Yj2fVulVoXBppkLgptnW3/uaLGHlhMGttz7IVpS+ot63jbRV2RWa9MxaCMqWfqS
         SPaw==
X-Forwarded-Encrypted: i=1; AJvYcCU+fz3G74KvqL4E/KysHwe3QDCpXcIC8TtuPLpefz52p0p88/CuswBch9ufQg2dt9cE3LbxKWLlVMRiYUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS4PQG9SJaSQTOzwKoN3zmORQuj2awqjSpL7oroej9nSu+btcw
	mJ25Ye1nob7KFn+M42vAXWuXVdaFJ7MUanWEff11Dzbdsx6AvPC2IPCyuEUzRHLfVhAo5h0xT2V
	3/G1y/uFJPc/stD6s9nDkXaMvAbtKRU42M/dSyfnGblmFIceEUyaECfMS9k2lE7CKHw==
X-Gm-Gg: ASbGncu2PsEl5oHz9x70q1b62uEjc49k7pH/flR2Ta1NuGZdwSrVdzJlvO92mCdNZ9F
	2WKrb7WtAiHvO5M9uQU/xA6Gnr5FRKxO9BnUh8lINeRVAOUuEV/Pu/o3w/6mzI+6vK9rU1UUTpn
	lqn75+NAcG3s0RYBv/xE2q1UBDOHFqmX30Ux1GZd3nyU7cSeE9cG3UPoyPH+vIWJJvR8EaL3FlT
	x/zsp5bwCVL2zGqfoiyv13CQOF7NFVP8BZgtOH8NPMmeGnXYcfJsX8xkajePCJ+pXLrG3/Hq29H
	MVYr+aw1ihC/G90gf7MNlvbD2+45bzUeSxqObqrL+4MTRxf1y+i7Ga718f+61xqfO5rzwj6pPTk
	G0ClB9oFMLaqqwozunp8UNBCz7OlJZeD6JmVgAZE=
X-Received: by 2002:a05:600c:3542:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-450d64366a0mr53556815e9.0.1748633961546;
        Fri, 30 May 2025 12:39:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgq89WeQiPiCMhAPglEQ7uNw/fd0bua3PxzcgOvnqtxRbd/XfW8IAkkolRjIpVxxdn5rqb3A==
X-Received: by 2002:a05:600c:3542:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-450d64366a0mr53556605e9.0.1748633961204;
        Fri, 30 May 2025 12:39:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb0654sm26183855e9.21.2025.05.30.12.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 12:39:20 -0700 (PDT)
Message-ID: <aef5328a-89f3-47fe-b886-65c4f9c55f9d@redhat.com>
Date: Fri, 30 May 2025 21:39:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] mm/page_alloc: pageblock flags functions clean up.
To: Zi Yan <ziy@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-2-ziy@nvidia.com>
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
In-Reply-To: <20250530162227.715551-2-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 18:22, Zi Yan wrote:
> No functional change is intended.
> 
> 1. Add __NR_PAGEBLOCK_BITS for the number of pageblock flag bits and use
>     roundup_pow_of_two(__NR_PAGEBLOCK_BITS) as NR_PAGEBLOCK_BITS to take
>     right amount of bits for pageblock flags.
> 2. Rename PB_migrate_skip to PB_compact_skip.
> 3. Add {get,set,clear}_pfnblock_bit() to operate one a standalone bit,
>     like PB_compact_skip.
> 3. Make {get,set}_pfnblock_flags_mask() internal functions and use
>     {get,set}_pfnblock_migratetype() for pageblock migratetype operations.
> 4. Move pageblock flags common code to get_pfnblock_bitmap_bitidx().
> 3. Use MIGRATETYPE_MASK to get the migratetype of a pageblock from its
>     flags.
> 4. Use PB_migrate_end in the definition of MIGRATETYPE_MASK instead of
>     PB_migrate_bits.
> 5. Add a comment on is_migrate_cma_folio() to prevent one from changing it
>     to use get_pageblock_migratetype() and causing issues.
> 

I would have further split this up. If your patch description is a list, 
it's usually a good indication that each item should be a separate patch.

In any case, nothing jumped at me

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

