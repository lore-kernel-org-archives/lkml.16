Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45562853E0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873418; cv=none; b=UVzjLWtmO1IraAHM6w8WhycKr12K8wQOdUQtgsau93aejepaygPIvKIL+2GUtCVWfLreAEahMusRSxv7gMCLHrc3StP/LIQ7L+nDqZ40HcJJlojF2PD63hMVOuJT2qsW48FpqSnuTvEgjpGkIlXWVjGhDkSdDHeVd9bIBVm0Ykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873418; c=relaxed/simple;
	bh=WmVnFmJUPhDnz0+tyC6BI6D27WW0ZZYe9AXhgzfa86o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hi5iPNXKLmwgv2ZITLH1I/l4O0fP9gyJtR/BNvsf/wbizJaAL6aU+9YNALkFXb+VFCGGukDgPz9GqSW9DVEQ3F/N+kvHFGynBU1YU306Ika/wGHnSL+NYv2Wm4EqslZA/xE1Hzv6HYmp9/ccYJdBVWocZSbb7qp+8HbJWFPb3Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MHTgfeFR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MHTgfeFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751873415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IEmUGUoP/avhzVo01ZX3tJQ9D8xg/B8atIijwjnlXi0=;
	b=MHTgfeFRfE1DmzH+MUD7VxG8pqd9THJ+lIWz1otAhjSzi/jAnlydSrZF274BF3a4V/diF7
	neDLGUFR8UVjVREsMlHSixuNesc3LZUw8y6RAo1BaBL5uG28qJAP3YYVY5l7ZW7yTJ6jn2
	xsThbzza4v7Z1V1AnGq+vyIkCDI5n2s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-nYLEQ0DsN1Wro8XmoRmrjg-1; Mon, 07 Jul 2025 03:30:14 -0400
X-MC-Unique: nYLEQ0DsN1Wro8XmoRmrjg-1
X-Mimecast-MFC-AGG-ID: nYLEQ0DsN1Wro8XmoRmrjg_1751873413
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so15363315e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873413; x=1752478213;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IEmUGUoP/avhzVo01ZX3tJQ9D8xg/B8atIijwjnlXi0=;
        b=vDReOgqYjNIGPQeJjKIYo9VG3tSlKHH8jfe3aIsKwzwGMC+wn7VDhYMpKfis1/kDpy
         aMVbS8ga5AG0zr+KFz5zwe6udcy0SeQWSiA1c4vpoR6pDM/BwoIPCWT7swUG5gX89ihZ
         7jFMX3i+9IS1xCHB+reg6EWj6zDCUDfS/yDnklv4WSJ9c1JE9fsVjIUoKyMMqKov+Vyo
         ArttttnsPIFj72/gXwaH2wasfBCd83wBke6eytlQmtDveHa3Qc4gSF5Tb5PSA7C1kCw1
         JDwxlR5G6TZYFJhni0rD52aF6jO1Yuy4/yJllUmfDdcWlfqr6xnhlaINNnkuMBmjS6T6
         b5Yg==
X-Forwarded-Encrypted: i=1; AJvYcCX04gIEkiSCbMCdIP71CtfXxSqR9izJ247IzFnJqL0k7Cf/X5hKz1V0hj7MC5ECasDKTNj+TkTJrSpsHlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVTfqJ8Ygv1MlkW1YBCwUMpsHnOeaL7PLqUgO2tQW5rAo8Me7w
	44IEkFeQT2tuq06RZelUowmvkFVrAE9APfUmTery9YvFKtsbmWRWOoXCMmvwe9jUYTMZxMu7AbX
	5wOyIlnlbougy0L3I9JptCSpe9A+uMdNqXmb2wEmeL8FKA4RZuPmJSq/5A+gjWEJpsw==
X-Gm-Gg: ASbGncsmWsRUf4XCHsG0oJ+tP46fDYFsWNyj31bnuypoxAEAXspPxDpgZcL0B5YZ5sP
	cCMm5P0Z3m4npMjxSjFAf/qisYTQeFjHKk1Oj4Nm9mQ/FTk4T4M6eBflrj2ez0Trgjje1/ZmlGL
	zHo7V47D9D4Q6tMyRtDafg83Fz3/XgVImLp9bwlI8fsab/WrI4rUzqzB+6hFYlcKyLCWnSKBUpH
	VuKGSz1EmQemr0JyT9oPhQXn83qdsZRfG0EJK65RNKE07x26V1FMvt9OlokkBvF4MbQ8TBykbdw
	ThdnQArReVsT8kzHhprgAT2baxUQQpm74eCxCRwoMIKi290DpnpbrUkbvyURL9W3NJH3ARu32p9
	9oLMY3q5Di/rYXTvV0MfBHqB0WxalhIDZdsPoErMZSPFVcvmnlQ==
X-Received: by 2002:a05:600c:83c7:b0:454:aedd:96fb with SMTP id 5b1f17b1804b1-454bb8881d3mr59456595e9.29.1751873411780;
        Mon, 07 Jul 2025 00:30:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGANzkfEpkskqRvxDNn0Dc/JyBFAyOt8aPzL6q0SSinW8r5eRcBQDlAdYyFsiIqoTwO4ChXzg==
X-Received: by 2002:a05:600c:83c7:b0:454:aedd:96fb with SMTP id 5b1f17b1804b1-454bb8881d3mr59456205e9.29.1751873411261;
        Mon, 07 Jul 2025 00:30:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f38:1d00:657c:2aac:ecf5:5df8? (p200300d82f381d00657c2aacecf55df8.dip0.t-ipconnect.de. [2003:d8:2f38:1d00:657c:2aac:ecf5:5df8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9736bsm9494939f8f.60.2025.07.07.00.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 00:30:10 -0700 (PDT)
Message-ID: <c298273a-a286-41c3-a1a0-e9d876283bb1@redhat.com>
Date: Mon, 7 Jul 2025 09:30:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] vfio/type1: optimize vfio_unpin_pages_remote()
To: lizhe.67@bytedance.com, alex.williamson@redhat.com,
 akpm@linux-foundation.org, jgg@ziepe.ca, peterx@redhat.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250707064950.72048-1-lizhe.67@bytedance.com>
 <20250707064950.72048-6-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250707064950.72048-6-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.07.25 08:49, lizhe.67@bytedance.com wrote:
> From: Li Zhe <lizhe.67@bytedance.com>
> 
> When vfio_unpin_pages_remote() is called with a range of addresses that
> includes large folios, the function currently performs individual
> put_pfn() operations for each page. This can lead to significant
> performance overheads, especially when dealing with large ranges of pages.
> 
> It would be very rare for reserved PFNs and non reserved will to be mixed
> within the same range. So this patch utilizes the has_rsvd variable
> introduced in the previous patch to determine whether batch put_pfn()
> operations can be performed. Moreover, compared to put_pfn(),
> unpin_user_page_range_dirty_lock() is capable of handling large folio
> scenarios more efficiently.
> 
> The performance test results for completing the 16G VFIO IOMMU DMA
> unmapping are as follows.
> 
> Base(v6.16-rc4):
> ./vfio-pci-mem-dma-map 0000:03:00.0 16
> ------- AVERAGE (MADV_HUGEPAGE) --------
> VFIO UNMAP DMA in 0.135 s (118.6 GB/s)
> ------- AVERAGE (MAP_POPULATE) --------
> VFIO UNMAP DMA in 0.312 s (51.3 GB/s)
> ------- AVERAGE (HUGETLBFS) --------
> VFIO UNMAP DMA in 0.136 s (117.3 GB/s)
> 
> With this patchset:
> ------- AVERAGE (MADV_HUGEPAGE) --------
> VFIO UNMAP DMA in 0.045 s (357.0 GB/s)
> ------- AVERAGE (MAP_POPULATE) --------
> VFIO UNMAP DMA in 0.288 s (55.6 GB/s)
> ------- AVERAGE (HUGETLBFS) --------
> VFIO UNMAP DMA in 0.045 s (353.9 GB/s)
> 
> For large folio, we achieve an over 66% performance improvement in
> the VFIO UNMAP DMA item. For small folios, the performance test
> results appear to show a slight improvement.
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>   drivers/vfio/vfio_iommu_type1.c | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 13c5667d431c..208576bd5ac3 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -792,17 +792,29 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
>   	return pinned;
>   }
>   
> +static inline void put_valid_unreserved_pfns(unsigned long start_pfn,
> +		unsigned long npage, int prot)
> +{
> +	unpin_user_page_range_dirty_lock(pfn_to_page(start_pfn), npage,
> +					 prot & IOMMU_WRITE);
> +}
> +
>   static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
>   				    unsigned long pfn, unsigned long npage,
>   				    bool do_accounting)
>   {
>   	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
> -	long i;
>   
> -	for (i = 0; i < npage; i++)
> -		if (put_pfn(pfn++, dma->prot))
> -			unlocked++;
> +	if (dma->has_rsvd) {
> +		unsigned long i;
>   
> +		for (i = 0; i < npage; i++)
> +			if (put_pfn(pfn++, dma->prot))
> +				unlocked++;
> +	} else {
> +		put_valid_unreserved_pfns(pfn, npage, dma->prot);
> +		unlocked = npage;
> +	}
>   	if (do_accounting)
>   		vfio_lock_acct(dma, locked - unlocked, true);
>   

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

