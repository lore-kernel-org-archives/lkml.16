Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEE41D63EF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873627; cv=none; b=dCiLI+9itoGUWZxTDg3BzhUhYD+gz7RPVYJVwa56CXeuE1OeNpie4lNz1fyFf7uFIYty784ebrDHaEcNSYAvEDn9AHPUHg0yFnYXb3s9wJXf4kFTPr6OU6RPnEFNCxHyk6ujAk370Wi5r0lwLhLE6YtXaKXaHX6MhlArIm1uMsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873627; c=relaxed/simple;
	bh=0Fz+KFVjki+7GHjBdQM/8ARtD1OUF3BfWhwHqC7O7p4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQVyXRmqrUISdwk1H/rM0rc2FwGL2okCXk/csF2p6ecbwZEdPUXAGzGYIY/dc/KnqwXk25HwDM4pzhoKNiXCLWGYqX/c7QtCj5Shix/wQmMBBeewdLTqgNGA9kzBqv8jMsuaylhCjefzqECyCZ/jAAp+s6EX/+id0ShZokJnhtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a+D5Wmb3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a+D5Wmb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745873623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9NrijACrVI0d46In4Ef/eZDIzQK/apI7tktcFwphNAA=;
	b=a+D5Wmb37cF7dVb+D3ISlAgTmJ88vt3QhF+6/G64mbuBptEHnUIpYnqUUAvMOpIxFHRZJC
	EPJk32UlesOKun6OGBM1MfoTSKUNw73SsYGDV2HUGOCcDbCKVRRVXoQMHkyyqweakSFMku
	QmjpGqwnXZWToZATcPyw9aPvdnDeC2Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-_n5Ul8Y4MN2PltNR_Gtjvg-1; Mon, 28 Apr 2025 16:53:42 -0400
X-MC-Unique: _n5Ul8Y4MN2PltNR_Gtjvg-1
X-Mimecast-MFC-AGG-ID: _n5Ul8Y4MN2PltNR_Gtjvg_1745873621
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d6c65dc52so37265135e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873621; x=1746478421;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9NrijACrVI0d46In4Ef/eZDIzQK/apI7tktcFwphNAA=;
        b=skTvJ3iPAg9koVahVyWEfY8JP+t/CBAT2r6cD8LlJQ8XyrGx8H7iXWr+cv8E3fzotO
         0aoS13JwgYCqEuE6AYN8ZpUVDC+Lj26W+m/gxMLigCl7vWnMSOtYl8ao9oQn7FSLHVrh
         bIelQfVJGZes5+6mR+X+a+wnWlE/QDpYK6sVD/klaYbuiNEymle5tBMk9FUVrUgnl1FK
         ul3vnGPPi8sUd/C2NMR+F4FNXb52CsTXqYpyJJ6SVyUEuoqE2zD0+Uceivp/TvCVzz21
         0mccaFE7oIhe7cKIz4zIiBcUcFrMHko+gxyVLCxxx4GwW0AwGz+UYfJ44ayyQbBwWFHZ
         hUFw==
X-Forwarded-Encrypted: i=1; AJvYcCVzRe4YyCcI2comWMDTlsZqiUjd/+Cy0Jn/JlhUUgZfhL6j1qdL+07qwDO3Y83zo/cBFaMxbVK/n97+jkA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa7zdeEFZez2EnGhAIX3A90/qdKq/IvjwK4xJfPtnmWuc3y1QJ
	FoasNYpNb54qyqQaaEsPbg3xF7Dym+nu0AKFMump+yfjWTeLHik+4Agmdg5BgkF7efOSqbjQ9v+
	e7VAMs9nKpuBLNEOsWE9JgwBA7fzMtgWNmGmp5pzHYW7KrSpfJDhFtEnPSsLqsg==
X-Gm-Gg: ASbGnct64wJ/wUtLe5yj3IQ00XmwXr7lk7InfA25pA4KxGLTqtYVrWvAkVaeuct16+L
	xjzUeeFygsc6PBIT3RVmz+jvjNH4xXhN24UkFR4UIBGnZxcGJ7W4fJ1P4XEQySlUK5CBUWuuzS9
	beX+nAqU3/0btW1dvt//1XaORi6qIaxEJSau56gImNvbjWUrP9XmThIQhy7THVWHR57w27od6fs
	r8p79s7UuXOlzdmhWCvGGVKypTSfMuG2xjDRbGa/raEpm733VZuzg7zpNXok7vlcDwcUlmQrzQE
	Iq5ElXGR0FJM4r2Mmr76N3iMdj+1Ji7F5/xK/WZDRjPQCXXMlv+V12pf0m33WVda/lyTPRjuo90
	ntHPqVx3Dg/T6sBrqpK9ns+K0TmtuvoefPkk7WUk=
X-Received: by 2002:a05:600c:8112:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-441ad3c708dmr1746265e9.15.1745873620924;
        Mon, 28 Apr 2025 13:53:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw24C6HKQcRQnuzF0GizlWJ2/kyYEzORcRGXEVbHeQEcXEI1mVjEfDrlAfYscrdW/qBLTTAQ==
X-Received: by 2002:a05:600c:8112:b0:43c:f78d:82eb with SMTP id 5b1f17b1804b1-441ad3c708dmr1746155e9.15.1745873620606;
        Mon, 28 Apr 2025 13:53:40 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d868asm166551305e9.26.2025.04.28.13.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:53:40 -0700 (PDT)
Message-ID: <ba576520-3bec-45e6-8ae8-d36ea0a0e00d@redhat.com>
Date: Mon, 28 Apr 2025 22:53:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] mm/hugetlb: Convert use of struct page to folio in
 __unmap_hugepage_range()
To: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Fan Ni <fan.ni@samsung.com>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428171608.21111-7-nifan.cxl@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250428171608.21111-7-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.04.25 19:11, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> In __unmap_hugepage_range(), the "page" pointer always points to the
> first page of a huge page, which guarantees there is a folio associating
> with it.  Convert the "page" pointer to use folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> ---
>   mm/hugetlb.c | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 6696206d556e..293c2afa724b 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5815,12 +5815,12 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   	pte_t *ptep;
>   	pte_t pte;
>   	spinlock_t *ptl;
> -	struct page *page;
>   	struct hstate *h = hstate_vma(vma);
>   	unsigned long sz = huge_page_size(h);
>   	bool adjust_reservation = false;
>   	unsigned long last_addr_mask;
>   	bool force_flush = false;
> +	const bool folio_provided = !!folio;

I would but that all the way to the top.

>   		}
> @@ -5943,16 +5944,17 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   				 * count will not be incremented by free_huge_folio.
>   				 * Act as if we consumed the reservation.
>   				 */
> -				folio_clear_hugetlb_restore_reserve(page_folio(page));
> +				folio_clear_hugetlb_restore_reserve(folio);
>   			else if (rc)
>   				vma_add_reservation(h, vma, address);
>   		}
>   
> -		tlb_remove_page_size(tlb, page, huge_page_size(h));
> +		tlb_remove_page_size(tlb, folio_page(folio, 0),
> +				     folio_size(folio));
>   		/*
>   		 * Bail out after unmapping reference page if supplied
>   		 */


I wonder if we want to adjust that comment while at it.

/* If we were instructed to unmap a specific folio, we're done. */


Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

