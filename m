Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CB52BEC22
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618829; cv=none; b=NuUpCPO3VVbDaEYb8A41iwVEywlJGDxSzl85x6khwPVVQDsmC9TAF6/prue4nbgr84BpcCJT4HisPHzUGqv0q8j2s5ByRMJpgpm/QietbF0rGnQOlfSjBk89HIqTIpFpZw5+xF9/Kzle+jtI1R+D3kGUExHOdwtUUmF41PyX2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618829; c=relaxed/simple;
	bh=r5V49CGOXAoLrXqPU+rJOpeqSHYxcwrGfpX3wMAmlm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZGvSJewvjGEOUo3svmOVu7FDNW/7E9E2qfdpJ9ZBI3JkIiakoCfotjbKsijStOymnTYfSAyvnezwXwgevHvtwugXk0VoDjsitF5N4MxhMd4ybLeiyz/0sszxdL6/iuEPT4sz07FUIXTt75+HDI6/H9jr9P51j86YuB81fsgKwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V4GYMBaR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V4GYMBaR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751618826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LbMrib8JvYyiXcynM5A1QVLEBjssYP8T6GYqmTfTDCI=;
	b=V4GYMBaRhrIg6y5B9smCCMuJOFbdRkzWEFYsTK3JLqkjUDWtn+vE1T2dk1u7p4uHoOHqHJ
	z4nZ1qS1KLDZySYfzTbcsf8SpW2LbL2ctARSVzlH2O+WFa3m4TBS8nA8mJk4AB1IMq5uIZ
	Ia+KNOB8nJ5MXTU9DzwwfZNxUaays+k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-X4kTtMiKPcymNFn7AdtlsA-1; Fri, 04 Jul 2025 04:47:04 -0400
X-MC-Unique: X4kTtMiKPcymNFn7AdtlsA-1
X-Mimecast-MFC-AGG-ID: X4kTtMiKPcymNFn7AdtlsA_1751618823
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso445230f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618823; x=1752223623;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LbMrib8JvYyiXcynM5A1QVLEBjssYP8T6GYqmTfTDCI=;
        b=g/a5LPcmv88+9qvEJhRAlQhKl5F+n2vUz/lF00/U+2gChGMQ+GweNAWPU1MmeiTEq1
         ddgDNdGMIw54gLu3IZ3w9E/AtJTDV2WuCw3SVsWcQxwBsz6Co65s85i5+p+wrb5tdXw7
         srBoBRYOQ0gAYTkDbPyKQLOTqVd9dVfGxDtrdNCDw90xUfCoHft2N3rDIOnwOpDwswnN
         wG/YFSdWKvjW1LX/M6hQXE1JofQaPuaCf55TSwuyDioRbI2AccVDELDWiMc1I3lqFi8T
         +hY7kjpO01O4SRkZhYo8ba6AYBMeMci9lwLancMu5nzfYL7rBRWA5FSmPj1TjfYVWnOK
         mDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXWqNpSJrjr2fRBeDozO7CrZxpkVx84chcSKJREGqbgsXzLg2HsAX5JtbOijUePN2B1knrd0n+BbyNPhM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz38yjXBhxLBvLVpRxOuS+Q2vnEJR9GPhzV/vTy6AsCeEVICau
	oEqm0AHUVuq3rtFZgij74tk+rkLXcKCdCA+CSPMU47DdTUrlopOR0TDLciL042rLZ61JIc9/ZjJ
	aIYfOkeC64pV3rIzR8yxOW0rK55e+c7wu9P88rDuKhnqxI/OCunIfIXSBjfL1qFbKNA==
X-Gm-Gg: ASbGncuz17MiBd5ZfFm8mCVXY+lt1CxH/pSsfzp8VKj3Tt90//LcB16Z0Ug0rmBJGEN
	e3WfmucGzWLdPPdTa9NptLZmPhX+Okt4K8pn8T/7Fu+EkLyC71QvXysORRmSmx1y89NUmYLU1Vg
	PhFKR51y4o9ZvvzVfkCxCTH1xcaeqEfe34Tf2icYsrhu6HxMAF4/afqsm4JrjtppnLcHvMEJF5M
	a1TswrccjOW6K0BMWJUX0PlA6RfYLB8csQSW0RTSMzLRs3kw3iunOiMMveoCV/RfkyciCsJT58N
	fcf5h7kGioolPSDis5Kdo4SurLBZei9GFbU4qcxKQyQb+NU3hcchkLhUe2QjP9MgfvhV3/uBZsL
	5mITP4QwMjjH1dMkHzvyBrzf8LhurMIS1gdYoufrju1nfN3I=
X-Received: by 2002:adf:a382:0:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3b4966273ffmr891511f8f.49.1751618823187;
        Fri, 04 Jul 2025 01:47:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsRw575uw5CU78q39R0CUYNm5iiO5mve3sqDMWqmFqXrOdrE69CcShRjEvR2Lebt4eraqamQ==
X-Received: by 2002:adf:a382:0:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3b4966273ffmr891481f8f.49.1751618822420;
        Fri, 04 Jul 2025 01:47:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0af7sm1973309f8f.35.2025.07.04.01.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 01:47:01 -0700 (PDT)
Message-ID: <77d99da0-10eb-4a4d-8ad9-c6ec83cb4540@redhat.com>
Date: Fri, 4 Jul 2025 10:47:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] vfio/type1: optimize vfio_unpin_pages_remote()
To: lizhe.67@bytedance.com, alex.williamson@redhat.com,
 akpm@linux-foundation.org, peterx@redhat.com, jgg@ziepe.ca
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250704062602.33500-1-lizhe.67@bytedance.com>
 <20250704062602.33500-6-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250704062602.33500-6-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.07.25 08:26, lizhe.67@bytedance.com wrote:
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
> index 13c5667d431c..3971539b0d67 100644
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
> +		long i;

No need to move "long i" here, but also doesn't really matter.

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

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

