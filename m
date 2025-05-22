Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF851299AAF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929550; cv=none; b=CXAHIHK5o2qIJoo0oX1TxJx3LHgbjcrPPgus7qN1q8yffchWquLwzegAjRgudOJue0wGm5s9U7V05z2Jb25SEzVi7oq+XRxTHoKiGH3lB1UzNPfom6PEThUsW08ze6N33zDe1VgpPyqPVhWu/mQyobsQCPlVQaOjR1B/Hw0n86Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929550; c=relaxed/simple;
	bh=zW59eGKKh4QV6siZ6VTeHcxC8R6hk5oZMEGzS9OF5SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgCNQ8vGI6RwOAY4gv+5uvTKmGMo3s98lKah0PE0yJKEupIetba6phScX9H3r/jR/K40VW2FJAdfGb6mRYoyyFkGL7pWfx/hToGgqhIzFfeQ1I0pe68FBN13KsKuB9C2bkJuMwtqYqF6rqrDJ1SzjMz1z71FEnWtKFF6ed9CONQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UILCXfaQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UILCXfaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747929547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=isTEX9K84MxQ13A9qv7fNPY2x7KCDPC7MCrxshCjR5w=;
	b=UILCXfaQxPiWGhtd5XR33x3TCJpG0gAAdedC4tNpILkR4mhpeTNNdvNL8NdGLeudt/Jrli
	RuibylxJJCCQTvsGwC42ecJdVDAcJglE9Wixz+V8iN1Dcl5FiOxqCtMuAqhrLg2XdvytTo
	uMnyx/UxKLTY9HSTRIkJwX+5NJyskgU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-b21-1uq2PQe5EDeKocVdxQ-1; Thu, 22 May 2025 11:59:05 -0400
X-MC-Unique: b21-1uq2PQe5EDeKocVdxQ-1
X-Mimecast-MFC-AGG-ID: b21-1uq2PQe5EDeKocVdxQ_1747929544
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a364d2d0efso3084646f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747929544; x=1748534344;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=isTEX9K84MxQ13A9qv7fNPY2x7KCDPC7MCrxshCjR5w=;
        b=j1pO4oeEZzszntcUvCqhCVNOgDQ6M/C+rKGUwZ+ldBzdzVw5zgn5WUbdfTmNoWGPTD
         WY7ccBBPKjWTG1DZOrUAgRlHy2WwGlAMzkBIlsXfAOd/6NQE0ZNy79XpYMqt1z49f4Z5
         +78MVqrs9OUdzro6f52PKlHYYLEkbf0o5WXvlG/js5hsa1f5QHwmcNzxUAMFptWkP7+i
         7XN87sx6/bTh34cZV+RvUjOFQuPnrLOiTs1PLh6Am7b9L6CBMLfvaQ0a50j35hSBDyae
         JD67akCXw/Kg8UrmOQZRSNG6MDRmdMS5mIh37aOezR/gmOjvBx1OwkqR4kXCkSS48rBH
         4f6w==
X-Forwarded-Encrypted: i=1; AJvYcCXZ1mpgiSCSOgb3qy5bT8jreYpTX5g/X2a2M9joxb3IKMSjsh347j0g7gSXEw2g9PAcE4ZDPFfn2XxL2v0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS+YxDV+qHv/pLvSVTuifLCJhVTu6WGNhf+K3KQgX4Ivst7Tlz
	eb/+tXdPQENiclvzLANRIf2fDJjBWyrZn3JXcBv+5RzPqmZ0V0G5xTIE0UY31RDS81NCta1Zrtq
	Oib3TbwSu4eicoHbpeXCRwBpHCQIdLutiHhAlBzukdHCcBhcxG9I+j+cE/2jYJAFAIw==
X-Gm-Gg: ASbGncu6paaJcjqLFgvHtvwjxJKs91GoLUWaLrqciDot5qNMo5lUfeQroc8YPuZA3Ei
	S/hej1dwKNSnSjBUxHcwLP9rR3Jso9yEYTEBbIsJMnoFYO1ZA68IY4ID5O+vBd5GGolaKX9alXw
	08+R7sldhZ9QOI2+oBFLNXK0RmX+vVnsCRSpexzPVm1HtkUxwd9pdCIJ6mldJEYkoGS5/Fm3MXG
	jjOQCcvP1RTZQjmgU5+29BTqw5gdHl3vHrKoe8aK8VOzFBCfrd0D8+Zx4bQm4SnW8N645u7TE5p
	xxTYvUK9m28VzjzaGpEzOTHEllx9A1HvPca+HADXg5unEk6bHm62HtSX2RdsAmCUqUbANG16K1g
	urFSUg+ySjko6mnd5DysJuZw2W1SgpojpxU49mc0=
X-Received: by 2002:a05:6000:1ac7:b0:3a3:698a:973 with SMTP id ffacd0b85a97d-3a3698a09f7mr16888527f8f.59.1747929544031;
        Thu, 22 May 2025 08:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKL+0/bSJH0X55nZfi/LST9j6Ca4iSwcPiz1ke+DZtSxselogdRv334EBp8Dil32P4tpTo1Q==
X-Received: by 2002:a05:6000:1ac7:b0:3a3:698a:973 with SMTP id ffacd0b85a97d-3a3698a09f7mr16888488f8f.59.1747929543595;
        Thu, 22 May 2025 08:59:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f22:2e00:6e71:238a:de9f:e396? (p200300d82f222e006e71238ade9fe396.dip0.t-ipconnect.de. [2003:d8:2f22:2e00:6e71:238a:de9f:e396])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3622b8a3esm22822687f8f.14.2025.05.22.08.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:59:03 -0700 (PDT)
Message-ID: <15744682-72ea-472f-9af1-50c3494c0b78@redhat.com>
Date: Thu, 22 May 2025 17:59:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 1/2] migrate: implement
 migrate_misplaced_folio_batch
To: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: Jonathan.Cameron@huawei.com, dave.hansen@intel.com, gourry@gourry.net,
 hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
 peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
 rientjes@google.com, sj@kernel.org, weixugc@google.com, willy@infradead.org,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, joshua.hahnjy@gmail.com, xuezhengchu@huawei.com,
 yiannis@zptcorp.com, akpm@linux-foundation.org
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-2-bharata@amd.com>
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
In-Reply-To: <20250521080238.209678-2-bharata@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.05.25 10:02, Bharata B Rao wrote:
> From: Gregory Price <gourry@gourry.net>
> 
> A common operation in tiering is to migrate multiple pages at once.
> The migrate_misplaced_folio function requires one call for each
> individual folio.  Expose a batch-variant of the same call for use
> when doing batch migrations.
> 
> Signed-off-by: Gregory Price <gourry@gourry.net>
> Signed-off-by: Bharata B Rao <bharata@amd.com>
> ---
>   include/linux/migrate.h |  6 ++++++
>   mm/migrate.c            | 31 +++++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index aaa2114498d6..c9496adcf192 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -145,6 +145,7 @@ const struct movable_operations *page_movable_ops(struct page *page)
>   int migrate_misplaced_folio_prepare(struct folio *folio,
>   		struct vm_area_struct *vma, int node);
>   int migrate_misplaced_folio(struct folio *folio, int node);
> +int migrate_misplaced_folio_batch(struct list_head *foliolist, int node);
>   #else
>   static inline int migrate_misplaced_folio_prepare(struct folio *folio,
>   		struct vm_area_struct *vma, int node)
> @@ -155,6 +156,11 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>   {
>   	return -EAGAIN; /* can't migrate now */
>   }
> +static inline int migrate_misplaced_folio_batch(struct list_head *foliolist,
> +						int node)
> +{
> +	return -EAGAIN; /* can't migrate now */
> +}
>   #endif /* CONFIG_NUMA_BALANCING */
>   
>   #ifdef CONFIG_MIGRATION
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 676d9cfc7059..32cc2eafb037 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2733,5 +2733,36 @@ int migrate_misplaced_folio(struct folio *folio, int node)
>   	BUG_ON(!list_empty(&migratepages));
>   	return nr_remaining ? -EAGAIN : 0;
>   }
> +
> +/*
> + * Batch variant of migrate_misplaced_folio. Attempts to migrate
> + * a folio list to the specified destination.
> + *
> + * Caller is expected to have isolated the folios by calling
> + * migrate_misplaced_folio_prepare(), which will result in an
> + * elevated reference count on the folio.
> + *
> + * This function will un-isolate the folios, dereference them, and
> + * remove them from the list before returning.
> + */
> +int migrate_misplaced_folio_batch(struct list_head *folio_list, int node)

"migrate_misplaced_folios" ?

:)

-- 
Cheers,

David / dhildenb

