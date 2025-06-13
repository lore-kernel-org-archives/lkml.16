Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050C517A2E6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821870; cv=none; b=kkZ621ODgmDvh++RYYHs62Ztv12rWxry7Q9aMfjpCTRgVVBzxhJU2NE4WLuor8y6TLIZw1jmI6N4LTjf0WXaqPdnoO+T6QGp1SAIHTyFpEk2X3dKgiRK/Fyiu12dNxdaC65XyDu1569gYE6tO6zeGNc5MeWH4e/I3P38O19N3Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821870; c=relaxed/simple;
	bh=rWuhPVmTUD1ZoLCvChePoD5sULwp++28zv14in3I66U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4bh64EF6Yq+WBrTNKzVQIctS7RJ5KT6zgwXEA9lGuvdSE/ndlXGVv1ytOte4EOMeYIHdso26PeLq0oLhT+J8PpxRHIRt80/Cai/0kee7b+IvPQMYAKiCz2mnZh7Btt1Lp/HdaiQDstN+QWRQR3qOI0I3pnvm82hQZTmgQZe7RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YWX1LT6u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YWX1LT6u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749821866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jOLEc98GWN6Khn2oerWvqGyxZQyD/5fbNZd6SNoJp8Q=;
	b=YWX1LT6u3YP5jXUXXvjygd+cKX8gWXV9KNxofekrqBGv5EqCp/mjZhC5MzlGxTzob9P3UY
	wvk/y1HRNxYYouDp360dUNkNbNwKZ/burCGdbBun8kAtW7k9d2D01Pcjd7XeQzf38zQPLY
	QbJMXtggYZrsY3AGtyQs5lngCoOZBUM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-_pMt7801OgmL29iNWet6mg-1; Fri, 13 Jun 2025 09:37:44 -0400
X-MC-Unique: _pMt7801OgmL29iNWet6mg-1
X-Mimecast-MFC-AGG-ID: _pMt7801OgmL29iNWet6mg_1749821863
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d244bfabso17258725e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749821863; x=1750426663;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jOLEc98GWN6Khn2oerWvqGyxZQyD/5fbNZd6SNoJp8Q=;
        b=ivE5IBMOvysROMSURnK9L6LFSkisbsMvE7o7ZesI1pFSZeAyL9sdOWI/gdIM4DRJMD
         XiX28T2qpVK4ZwdOf1+CeFT30S7K6vHpG+GLcpJw9vBvZH6zgQpZTQnGsB4cpr9l1Ecm
         KsTVIbNkWcvcRkbC/+eqkRqvuiXUFYFPeBpT1WhXobGWXKtssHOmQyXm0jg+4KDwe7Vg
         UKAokjZGsqY1hM3s0N2Ct7jmDRL9Rxy/dLFNJWVCKlmiLA6DdNLJCuYiz2J/g2FgfDvH
         RBpn4w8FehVUl9yx3qqfBokKpHebXVBXD4mwE/lUN7my2KKopOhraPUtGa1tZXQulGwj
         n+qw==
X-Forwarded-Encrypted: i=1; AJvYcCUcoohq2nXR+LIAEUD23hBtZTlfFNjUBBluFB9DrVJT1i9v5U2sO9wpfYMrtu/WYvoDwBdqHsGiA7/aEHY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6PWTbISkDHOsIXhC6+P2Fs6bVpDFkoCBnT8WUojM+3hfg0GBY
	8Z4fqdkG8RBQ+Ly4SMM31wugX7riDkh0hEALV8H7oQDWUmNXJSLatZbv/uv7cjLlr1wTU/5cISh
	27K4QtpZy3+KpYUCJ30xtJzwytgdaNsYBTBcI1q+0IcpMvnM+pT97L17CdvxaMvEmcYQoaQsS+/
	AC
X-Gm-Gg: ASbGncv5tckzcLsk8Anw4aAW7GvhC4T1Z6zGpDOjSI92vwO88KYiqAK5MycN4Nb9+ee
	sS+DJqNTNZH2GMVs3275Al583Xt30WEJXYxPuebarF1sCQTzC4w09B2bYFgXS25+S4wzD5Bvnpg
	aanpaaBoysz0+MDsDt4uEkpt/RF8WCSIphY8msWKRIWt5tIq9rPEAtOHcq6k1y1C+FNnQkV0Msi
	sbA6kIVJqBz4cwL+NtSMY4KCw/LQs76/A6RDKhQrkBgxSVi4iA/v7InyUZbrma/aANnR0DV5nuV
	pfdqKZ8hys1sVkXrgPY3VMmPtUYHjKObg66HB1ezKEiX+j6bsV4n
X-Received: by 2002:a05:600c:19ce:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-45337185b65mr31324035e9.4.1749821863306;
        Fri, 13 Jun 2025 06:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlrfwn4NyaL4f1SvHQdHXzL65724TGOJSVLUhNwq5GerGG47OLP0MEnPIIQk5z1EcHTlsefQ==
X-Received: by 2002:a05:600c:19ce:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-45337185b65mr31323505e9.4.1749821862704;
        Fri, 13 Jun 2025 06:37:42 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a50c.dip0.t-ipconnect.de. [87.161.165.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e232b68sm51996715e9.10.2025.06.13.06.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 06:37:42 -0700 (PDT)
Message-ID: <69f5e1f5-5910-4c45-9106-b362e300da8e@redhat.com>
Date: Fri, 13 Jun 2025 15:37:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2] vfio/type1: optimize vfio_unpin_pages_remote() for large
 folio
To: lizhe.67@bytedance.com, alex.williamson@redhat.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, peterx@redhat.com
References: <20250612163239.5e45afc6.alex.williamson@redhat.com>
 <20250613062920.68801-1-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250613062920.68801-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.06.25 08:29, lizhe.67@bytedance.com wrote:
> On Thu, 12 Jun 2025 16:32:39 -0600, alex.williamson@redhat.com wrote:
> 
>>>   drivers/vfio/vfio_iommu_type1.c | 53 +++++++++++++++++++++++++--------
>>>   1 file changed, 41 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
>>> index 28ee4b8d39ae..2f6c0074d7b3 100644
>>> --- a/drivers/vfio/vfio_iommu_type1.c
>>> +++ b/drivers/vfio/vfio_iommu_type1.c
>>> @@ -469,17 +469,28 @@ static bool is_invalid_reserved_pfn(unsigned long pfn)
>>>   	return true;
>>>   }
>>>   
>>> -static int put_pfn(unsigned long pfn, int prot)
>>> +static inline void _put_pfns(struct page *page, int npages, int prot)
>>>   {
>>> -	if (!is_invalid_reserved_pfn(pfn)) {
>>> -		struct page *page = pfn_to_page(pfn);
>>> +	unpin_user_page_range_dirty_lock(page, npages, prot & IOMMU_WRITE);
>>> +}
>>>   
>>> -		unpin_user_pages_dirty_lock(&page, 1, prot & IOMMU_WRITE);
>>> -		return 1;
>>> +/*
>>> + * The caller must ensure that these npages PFNs belong to the same folio.
>>> + */
>>> +static inline int put_pfns(unsigned long pfn, int npages, int prot)
>>> +{
>>> +	if (!is_invalid_reserved_pfn(pfn)) {
>>> +		_put_pfns(pfn_to_page(pfn), npages, prot);
>>> +		return npages;
>>>   	}
>>>   	return 0;
>>>   }
>>>   
>>> +static inline int put_pfn(unsigned long pfn, int prot)
>>> +{
>>> +	return put_pfns(pfn, 1, prot);
>>> +}
>>> +
>>>   #define VFIO_BATCH_MAX_CAPACITY (PAGE_SIZE / sizeof(struct page *))
>>>   
>>>   static void __vfio_batch_init(struct vfio_batch *batch, bool single)
>>> @@ -805,15 +816,33 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
>>>   				    unsigned long pfn, unsigned long npage,
>>>   				    bool do_accounting)
>>>   {
>>> -	long unlocked = 0, locked = 0;
>>> -	long i;
>>> +	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
>>>   
>>> -	for (i = 0; i < npage; i++, iova += PAGE_SIZE) {
>>> -		if (put_pfn(pfn++, dma->prot)) {
>>> -			unlocked++;
>>> -			if (vfio_find_vpfn(dma, iova))
>>> -				locked++;
>>> +	while (npage) {
>>> +		struct folio *folio;
>>> +		struct page *page;
>>> +		long step = 1;
>>> +
>>> +		if (is_invalid_reserved_pfn(pfn))
>>> +			goto next;
>>> +
>>> +		page = pfn_to_page(pfn);
>>> +		folio = page_folio(page);
>>> +
>>> +		if (!folio_test_large(folio)) {
>>> +			_put_pfns(page, 1, dma->prot);
>>> +		} else {
>>> +			step = min_t(long, npage,
>>> +				folio_nr_pages(folio) -
>>> +				folio_page_idx(folio, page));
>>> +			_put_pfns(page, step, dma->prot);
>>>   		}
>>> +
>>> +		unlocked += step;
>>> +next:
>>
>> Usage of @step is inconsistent, goto isn't really necessary either, how
>> about:
>>
>> 	while (npage) {
>> 		unsigned long step = 1;
>>
>> 		if (!is_invalid_reserved_pfn(pfn)) {
>> 			struct page *page = pfn_to_page(pfn);
>> 			struct folio *folio = page_folio(page);
>> 			long nr_pages = folio_nr_pages(folio);
>>
>> 			if (nr_pages > 1)
>> 				step = min_t(long, npage,
>> 					nr_pages -
>> 					folio_page_idx(folio, page));
>>
>> 			_put_pfns(page, step, dma->prot);
>> 			unlocked += step;
>> 		}
>>
> 
> That's great. This implementation is much better.
> 
> I'm a bit uncertain about the best type to use for the 'step'
> variable here. I've been trying to keep things consistent with the
> put_pfn() function, so I set the type of the second parameter in
> _put_pfns() to 'int'(we pass 'step' as the second argument to
> _put_pfns()).
> 
> Using unsigned long for 'step' should definitely work here, as the
> number of pages in a large folio currently falls within the range
> that can be represented by an int. However, there is still a
> potential risk of truncation that we need to be mindful of.
> 
>>> +		pfn += step;
>>> +		iova += PAGE_SIZE * step;
>>> +		npage -= step;
>>>   	}
>>>   
>>>   	if (do_accounting)
>>
>> AIUI, the idea is that we know we have npage contiguous pfns and we
>> currently test invalid/reserved, call pfn_to_page(), call
>> unpin_user_pages_dirty_lock(), and test vpfn for each individually.
>>
>> This instead wants to batch the vpfn accounted pfns using the range
>> helper added for the mapping patch,
> 
> Yes. We use vpfn_pages() just to track the locked pages.
> 
>> infer that continuous pfns have the
>> same invalid/reserved state, the pages are sequential, and that we can
>> use the end of the folio to mark any inflections in those assumptions
>> otherwise.  Do I have that correct?
> 
> Yes. I think we're definitely on the same page here.
> 
>> I think this could be split into two patches, one simply batching the
>> vpfn accounting and the next introducing the folio dependency.  The
>> contributions of each to the overall performance improvement would be
>> interesting.
> 
> I've made an initial attempt, and here are the two patches after
> splitting them up.
> 
> 1. batch-vpfn-accounting-patch:
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 28ee4b8d39ae..c8ddcee5aa68 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -805,16 +805,12 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
>   				    unsigned long pfn, unsigned long npage,
>   				    bool do_accounting)
>   {
> -	long unlocked = 0, locked = 0;
> +	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
>   	long i;
>   
> -	for (i = 0; i < npage; i++, iova += PAGE_SIZE) {
> -		if (put_pfn(pfn++, dma->prot)) {
> +	for (i = 0; i < npage; i++, iova += PAGE_SIZE)
> +		if (put_pfn(pfn++, dma->prot))
>   			unlocked++;
> -			if (vfio_find_vpfn(dma, iova))
> -				locked++;
> -		}
> -	}
>   
>   	if (do_accounting)
>   		vfio_lock_acct(dma, locked - unlocked, true);
> -----------------
> 
> 2. large-folio-optimization-patch:
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index c8ddcee5aa68..48c2ba4ba4eb 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -469,17 +469,28 @@ static bool is_invalid_reserved_pfn(unsigned long pfn)
>   	return true;
>   }
>   
> -static int put_pfn(unsigned long pfn, int prot)
> +static inline void _put_pfns(struct page *page, int npages, int prot)
>   {
> -	if (!is_invalid_reserved_pfn(pfn)) {
> -		struct page *page = pfn_to_page(pfn);
> +	unpin_user_page_range_dirty_lock(page, npages, prot & IOMMU_WRITE);
> +}
>   
> -		unpin_user_pages_dirty_lock(&page, 1, prot & IOMMU_WRITE);
> -		return 1;
> +/*
> + * The caller must ensure that these npages PFNs belong to the same folio.
> + */
> +static inline int put_pfns(unsigned long pfn, int npages, int prot)
> +{
> +	if (!is_invalid_reserved_pfn(pfn)) {
> +		_put_pfns(pfn_to_page(pfn), npages, prot);
> +		return npages;
>   	}
>   	return 0;
>   }
>   
> +static inline int put_pfn(unsigned long pfn, int prot)
> +{
> +	return put_pfns(pfn, 1, prot);
> +}
> +
>   #define VFIO_BATCH_MAX_CAPACITY (PAGE_SIZE / sizeof(struct page *))
>   
>   static void __vfio_batch_init(struct vfio_batch *batch, bool single)
> @@ -806,11 +817,28 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
>   				    bool do_accounting)
>   {
>   	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
> -	long i;
>   
> -	for (i = 0; i < npage; i++, iova += PAGE_SIZE)
> -		if (put_pfn(pfn++, dma->prot))
> -			unlocked++;
> +	while (npage) {
> +		long step = 1;
> +
> +		if (!is_invalid_reserved_pfn(pfn)) {
> +			struct page *page = pfn_to_page(pfn);
> +			struct folio *folio = page_folio(page);
> +			long nr_pages = folio_nr_pages(folio);
> +
> +			if (nr_pages > 1)
> +				step = min_t(long, npage,
> +					nr_pages -
> +					folio_page_idx(folio, page));
> +
> +			_put_pfns(page, step, dma->prot);

I'm confused, why do we batch pages by looking at the folio, to then 
pass the pages into unpin_user_page_range_dirty_lock?

Why does the folio relationship matter at all here?

Aren't we making the same mistake that we are jumping over pages we 
shouldn't be jumping over, because we assume they belong to that folio?

-- 
Cheers,

David / dhildenb

