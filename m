Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656BB28D8EF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146244; cv=none; b=Bfo2hP2ZxanhejniqKX9aXFPYpdiJYDOLGqId6s3kYY539TfSW4ZsA4Ofh0nOcDhRKtGlCjbM4HNjc7S6ctllXfuy3uKoWBoKFU6pihgfMrSamZY7+2M6oSfaZoOvAusU718551DXOC+kGZnUNEfPMdWTudtiVX0Gwt1jj91JVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146244; c=relaxed/simple;
	bh=Y/gnwY3Z4+W+KboEp4V1AS07foP089p9Cu+udu+/pP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQpTEN8UZy7LQINUXCw5AZPeJxzP+o0LA/m4CPwMXAvAlo6kCldBm8t4IkO+mBxYlxyHt8Nmhu9/lRROgWz0E5N6w4X/TI3siNEp6pMJelJc9PoiitDeayjYoM79lGzahm+rbkwqgjVaNN5EVjuIYQGJIwUIJEGdhiu3DKCY2bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NBPD1NqV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NBPD1NqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750146241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fQE5kmoAVVBp5PE3yEpqJAK0vmDk7/V02D4PYM6CncQ=;
	b=NBPD1NqVEg56T4UpA5znqGngIl7/h6OjDidl8CgcVOMRXt+pjE7tlX+2JPTmVUILtkw5hW
	YfgSYZrMzWxV1iV6M+vVyTI1R8ZMqM+VU4e2vybLbgCwbIARdHo1wCTMpuyOp3Ka0vnA3Q
	5+VgwgN+KeLGXj32RhgVTRdfhKiUSzA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-JRB-Yv4gOEaYLVxijAqgEw-1; Tue, 17 Jun 2025 03:43:59 -0400
X-MC-Unique: JRB-Yv4gOEaYLVxijAqgEw-1
X-Mimecast-MFC-AGG-ID: JRB-Yv4gOEaYLVxijAqgEw_1750146239
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45311704d22so35267065e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750146238; x=1750751038;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fQE5kmoAVVBp5PE3yEpqJAK0vmDk7/V02D4PYM6CncQ=;
        b=lKG+T01vB4JDBqFjnz6beSh3VHcwUIo/sUnlzxNlWi12QA4jGmSLEbTL4scFGn72xe
         7lXTrGsbDRgVFcOK6Wzp557d2yUw1JD3zK9O7pET3OfxzsHKf1g3B3qNt6c/vQSOKiyJ
         o5hPsAe3PbyZVyFc1ny0e/qeXCK2GedJICivbREX2gqRmS8Ejm161GVpgZUj4EelEqs4
         1B3VDxzkBrKEHML3xanPOm6WRd6m4XYvjp4d+n/rEEv5dv9F8698ijJ2woSdFDAE/xJg
         vB+zykFm6yYqEhvOFzDFJFQqraDPMNGlZdE1xYK2icHobks3jyPrzsMOKd4meOJn8mD7
         Q83w==
X-Forwarded-Encrypted: i=1; AJvYcCU5JAKEvEx6Ztjo1PwvsWHWtmpBVUsVMvWkiriNu/JWWgbjog4GMhqjyEr/E9V2lil751y/Geo5WIHMEfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLpahGaSEyu9WMxqax7NFu558oqe7+2JztAcmFX9VhYJdgSe2v
	jh78GUs0BRGzOOzWkPTqaGn3kxlojgcNXTIYWKMHWwOB4EQEfWRcFJB+FshEwLFBgUDXd+6JeKJ
	jkncf2p1+w6Sb4jdkfQCze5LlWVBFNZiLQhOuG3643+8dv8hDlbgpk184teRGaA34UA==
X-Gm-Gg: ASbGnctNN9zN5IOflVVhXmmD3Kfa1RMHABvph7SVC7OOjOI2JB5rQ/93ErrR69DQ6Th
	lWVi5qOKltQWKYdZ4Ho31YWuGGbdMr9ABTbXaBxmc+Cfm0YyYb8L1hy/M8nvbsTXzVu8AN0eYLP
	Zj8OVUO6FzjjXn+eusfSNiG59zu8F+hGBCDe+RnuyoZ8WgIE4WGHaSimYHhVeM0rd4nDhSRQTxl
	Uod4sp7qsthP5HqqB8o8ibn/mYTi4GRd870f8LXY2AjA71sg7Vo2ryDeRN5/cDb3rf/j7vjgQ/B
	OGJfrr5CgzCMbEpsNA1JvU4unMsITn0sKZTnbSmlRNl7Rgt5TGdyyOz0Bx2/IG4r5uGwXk6kzB2
	8TyFCdwcsFr6tE2zFKlgTzD5EaLqY+LYMG2SRo4jEWaoN+yg=
X-Received: by 2002:a05:600c:82c3:b0:442:f4a3:8c5c with SMTP id 5b1f17b1804b1-4533caf5922mr132749195e9.10.1750146238572;
        Tue, 17 Jun 2025 00:43:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVJqsb5x8WIO+53bIeG1hU7iYijv8uZm//ZPYLkKqsSMIyHju2/xGa5dLTk4XbYbpJwr4Lyw==
X-Received: by 2002:a05:600c:82c3:b0:442:f4a3:8c5c with SMTP id 5b1f17b1804b1-4533caf5922mr132748845e9.10.1750146238101;
        Tue, 17 Jun 2025 00:43:58 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4534394c90fsm89474035e9.3.2025.06.17.00.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 00:43:57 -0700 (PDT)
Message-ID: <34560ae6-c598-4474-a094-a657c973156b@redhat.com>
Date: Tue, 17 Jun 2025 09:43:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] vfio/type1: optimize vfio_unpin_pages_remote() for
 large folio
To: lizhe.67@bytedance.com, alex.williamson@redhat.com,
 akpm@linux-foundation.org, peterx@redhat.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250617041821.85555-1-lizhe.67@bytedance.com>
 <20250617041821.85555-4-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250617041821.85555-4-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 06:18, lizhe.67@bytedance.com wrote:
> From: Li Zhe <lizhe.67@bytedance.com>
> 
> When vfio_unpin_pages_remote() is called with a range of addresses that
> includes large folios, the function currently performs individual
> put_pfn() operations for each page. This can lead to significant
> performance overheads, especially when dealing with large ranges of pages.
> 
> This patch optimize this process by batching the put_pfn() operations.
> 
> The performance test results, based on v6.15, for completing the 16G VFIO
> IOMMU DMA unmapping, obtained through unit test[1] with slight
> modifications[2], are as follows.
> 
> Base(v6.15):
> ./vfio-pci-mem-dma-map 0000:03:00.0 16
> ------- AVERAGE (MADV_HUGEPAGE) --------
> VFIO MAP DMA in 0.047 s (338.6 GB/s)
> VFIO UNMAP DMA in 0.138 s (116.2 GB/s)
> ------- AVERAGE (MAP_POPULATE) --------
> VFIO MAP DMA in 0.280 s (57.2 GB/s)
> VFIO UNMAP DMA in 0.312 s (51.3 GB/s)
> ------- AVERAGE (HUGETLBFS) --------
> VFIO MAP DMA in 0.052 s (308.3 GB/s)
> VFIO UNMAP DMA in 0.139 s (115.1 GB/s)
> 
> Map[3] + This patchset:
> ------- AVERAGE (MADV_HUGEPAGE) --------
> VFIO MAP DMA in 0.028 s (563.9 GB/s)
> VFIO UNMAP DMA in 0.049 s (325.1 GB/s)
> ------- AVERAGE (MAP_POPULATE) --------
> VFIO MAP DMA in 0.294 s (54.4 GB/s)
> VFIO UNMAP DMA in 0.296 s (54.1 GB/s)
> ------- AVERAGE (HUGETLBFS) --------
> VFIO MAP DMA in 0.033 s (485.1 GB/s)
> VFIO UNMAP DMA in 0.049 s (324.4 GB/s)
> 
> For large folio, we achieve an approximate 64% performance improvement
> in the VFIO UNMAP DMA item. For small folios, the performance test
> results appear to show no significant changes.
> 
> [1]: https://github.com/awilliam/tests/blob/vfio-pci-mem-dma-map/vfio-pci-mem-dma-map.c
> [2]: https://lore.kernel.org/all/20250610031013.98556-1-lizhe.67@bytedance.com/
> [3]: https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/
> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>   drivers/vfio/vfio_iommu_type1.c | 35 +++++++++++++++++++++++++++++----
>   1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index e952bf8bdfab..159ba80082a8 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -806,11 +806,38 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
>   				    bool do_accounting)
>   {
>   	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
> -	long i;
>   
> -	for (i = 0; i < npage; i++)
> -		if (put_pfn(pfn++, dma->prot))
> -			unlocked++;
> +	while (npage) {
> +		long nr_pages = 1;
> +
> +		if (!is_invalid_reserved_pfn(pfn)) {
> +			struct page *page = pfn_to_page(pfn);
> +			struct folio *folio = page_folio(page);
> +			long folio_pages_num = folio_nr_pages(folio);
> +
> +			/*
> +			 * For a folio, it represents a physically
> +			 * contiguous set of bytes, and all of its pages
> +			 * share the same invalid/reserved state.
> +			 *
> +			 * Here, our PFNs are contiguous. Therefore, if we
> +			 * detect that the current PFN belongs to a large
> +			 * folio, we can batch the operations for the next
> +			 * nr_pages PFNs.
> +			 */
> +			if (folio_pages_num > 1)
> +				nr_pages = min_t(long, npage,
> +					folio_pages_num -
> +					folio_page_idx(folio, page));
> +

(I know I can be a pain :) )

But the long comment indicates that this is confusing.


That is essentially the logic in gup_folio_range_next().

What about factoring that out into a helper like

/*
  * TODO, returned number includes the provided current page.
  */
unsigned long folio_remaining_pages(struct folio *folio,
	struct pages *pages, unsigned long max_pages)
{
	if (!folio_test_large(folio))
		return 1;
	return min_t(unsigned long, max_pages,
		     folio_nr_pages(folio) - folio_page_idx(folio, page));
}


Then here you would do

if (!is_invalid_reserved_pfn(pfn)) {
	struct page *page = pfn_to_page(pfn);
	struct folio *folio = page_folio(page);

	/* We can batch-process pages belonging to the same folio. */
	nr_pages = folio_remaining_pages(folio, page, npage);

	unpin_user_folio_dirty_locked(folio, nr_pages,
				      dma->prot & IOMMU_WRITE);
	unlocked += nr_pages;
}

-- 
Cheers,

David / dhildenb

