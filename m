Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699AC5BAF0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745493647; cv=none; b=NktOAQfpowMUCuZtLW3W7Sd5BcJCIaNB9Cvph/cypVNe+aDVQYvSlzlQ+Lif1jI68+78at9oLK2VZyY9AAVYQJVPd9wCVdmlkYn0QF3Vv3/cNfvF7DB2TA36BDlXuKVihfRd0948bzKSypnJ8CbhJEA7OF6B6kMG4RM/qz9Kdkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745493647; c=relaxed/simple;
	bh=oWgTHyvvjD+mAtojuLHlInt8Deui/f64q6fI7VqdiDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKduiekr9MXxLU/CPVSpeVDX/UtRRdC06wIHYBpQfUzsR9XczgMB5TQiYkdtJ0Kit4UoPnXV83J14nGmwgGRpKuSchEa5KKRMQZWluVidyfDiWBq4i3OivdpPJP8ST0sxbUtyKH7RUVNdzI7CHkkYq+kqaE3WVE8BYrwDrP2+/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cp5Y8lnO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cp5Y8lnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745493644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8jNsIJvQKyCUl9VgGPVal4VV3gp8ehJessslJXufxrE=;
	b=cp5Y8lnOEU8WU6ehTVb9zczEmnxoxg5btGakO/p6UIGjl5gbqq2ZDKwAmOIyIsUd142feV
	qPzityXR9izTaHydxGV2VJRVvPiC1/hNH6g5NSXUka8fGfnazFNog+jJPI8ZVF/aUbM7iJ
	j3+DVwgaG42zZbAkngoC7JDbakJg5aw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-2HVSPs3iM-O2n93nBvDJMQ-1; Thu, 24 Apr 2025 07:20:42 -0400
X-MC-Unique: 2HVSPs3iM-O2n93nBvDJMQ-1
X-Mimecast-MFC-AGG-ID: 2HVSPs3iM-O2n93nBvDJMQ_1745493641
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf327e9a2so4028535e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745493641; x=1746098441;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8jNsIJvQKyCUl9VgGPVal4VV3gp8ehJessslJXufxrE=;
        b=OpfOk+wvXMBrCv8DCTYVSmyTTTsByN4lLBbLTFXI0DJ6T4TdEeD9NqEVOzZszFFi1C
         OIy7t80JZL+NEW4aUC4r5lol0boqsLM9eGDLsAcPNzEC+nGZjWYeOntDzauiQyJlD+ub
         e6/2dTvoKf+jVLoEEWSkcVtClep4LeBKfrDc8VRVAKAc47rpWfqGA+0r8ZSlUbE0HeaJ
         ll+Poxo/2qn9Oat2hHZwtpIVrDJtGw400PwcVWunFSmdRw9xfsC/F4L4B9gqadacV+EE
         WHSA+LO2b2jfDRgPMF7w9TJ7GZWnTSpM9RdPGbDClLvTz6qEoHYfxMa6XVb5gVZnTi9Y
         OIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF0pLRlG4r/uAEOcyF1RK0ZeFZ24Nlw9C9Daj826YyC4dIsrgfDAV0cLFRkBBTF2iKC/tgO7LAqLNGvEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdcxHFtquz7cihMmRpBWc10CL7thD13qqesZ3r4kNakPDU90V9
	pbHG1sTI6y0NEUEXj6RuO8R52tDii1IYwF4GN1mzaQeeiWmTw4phSxTyOs1Ow0fu3ZLOc51bbPZ
	+hrwZEMndDA7RPgYNOkEkymx0iW4oUryEeIcw2qZ1fm4HpnoI8cFglZ5VBN33aw==
X-Gm-Gg: ASbGncuAPH8cqWa6zus+7Ep/ebXjW1gjzpQaD/Q1wzBndS1xTCYdNCKn7u87GjFhU9v
	Q5HNDn8eFzNogZWZQ+k3rfHbxVjXlPG54kYbpUBN2SvQfGNYnHThTPrWi1gZRRrfnNcoYujG2dZ
	tlweQCj2mxzqj0itJri9+YEsZoM6HCvTwaNvq/hKUdMkGXjXZZ92yKQg7jZI7hbE9ahFk2MJ0K0
	K2jq9ALoJsiYE6VwQpG51oWTCt52kKjsLeE2vcXLnp+4sc45qVgCV8OfH0paiSOomrlOPrUIleB
	kc2GoO8QCEQmpMl4jOnVIHnaL5ObBl+HKhF/pJZve9KSYaMCJZ0t56WLoYOOa4gujVm0LTdFi71
	H2zWASuY/J+VcyztxPDVIjlObXu61kZLFldZ7
X-Received: by 2002:a05:600c:83ca:b0:43c:e305:6d50 with SMTP id 5b1f17b1804b1-4409bd76dedmr21771235e9.24.1745493641347;
        Thu, 24 Apr 2025 04:20:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqpBl8pybZhGNyShaPk/x9Q7Qj1sk1WToKgfkD5b39uAgNwdNfDLOTG6BXrvX8Ywv9yPRXig==
X-Received: by 2002:a05:600c:83ca:b0:43c:e305:6d50 with SMTP id 5b1f17b1804b1-4409bd76dedmr21771055e9.24.1745493641007;
        Thu, 24 Apr 2025 04:20:41 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4bc42asm1768178f8f.24.2025.04.24.04.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 04:20:40 -0700 (PDT)
Message-ID: <491e8027-ac41-49e9-8efa-e78fc63cafc2@redhat.com>
Date: Thu, 24 Apr 2025 13:20:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add mm THP section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
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
In-Reply-To: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.04.25 13:16, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for Transparent Huge
> Page support and add appropriate maintainers and reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   MAINTAINERS | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4015227645cc..85cd47a28a0a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15563,6 +15563,29 @@ S:	Maintained
>   F:	include/linux/secretmem.h
>   F:	mm/secretmem.c
>   
> +MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Zi Yan <ziy@nvidia.com>
> +R:	Baolin Wang <baolin.wang@linux.alibaba.com>
> +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +R:	Nico Pache <npache@redhat.com>
> +R:	Ryan Roberts <ryan.roberts@arm.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	Documentation/admin-guide/mm/transhuge.rst
> +F:	include/linux/huge_mm.h
> +F:	include/linux/khugepaged.h
> +F:	include/trace/events/huge_memory.h
> +F:	mm/huge_memory.c
> +F:	mm/khugepaged.c
> +F:	tools/testing/selftests/mm/khugepaged.c
> +F:	tools/testing/selftests/mm/split_huge_page_test.c
> +F:	tools/testing/selftests/mm/transhuge-stress.c

Thanks Lorenzo!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

