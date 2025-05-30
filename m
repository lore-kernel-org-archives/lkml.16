Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4741465A1
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 19:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635001; cv=none; b=BvMcL3fJ0+qWxEIBic7+Bku9U3e9jo7GqONEqqZhePK2oqGrmhTYVEeYdJF9/zI2Hb6hvZ0JbIgCSYekG3NeTkG1m6oFzJkDQwG67rpKmG+BubgdP3Uk3hpKajl9tflaMpS/rMDVPyqxvjQATzu4X6LYu+0+HFNO8YCFW7plQes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635001; c=relaxed/simple;
	bh=+sg0gy8c8J2T8KSg8JK0o9UbTQ7hx+aqAyOSnc8Sorw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUOSYnCnHtdMg6cY99HYECTcztaQ5FlkvbIq4KCltGF9zjP7CfrDkliPcyXN5BXKW/j8/O8aBCgxd0IEGNkFaMF6HxjVTbdMt8qUnzJWn0ghq6sWeu/MnZ9zxN3yiRyCw8WuCKTuEceQGMX2irx3KCEaEVE7pAvf1F93DIsLDfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cOPpP8LT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cOPpP8LT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748634998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tvBAAzFRZWgKvdMYS4slyoiYTjJP1YViGuKwx+ViZSc=;
	b=cOPpP8LT7birTeJdInHASktEvi6HP51iqy0axvGRBexpkkqHolz4wgp0tm1V71WvpwxPLl
	iysrGNCBFmSll545JFB6d+u11kK2DPiR7jwfu8Voxq7CWjWTg+EPA5oae8nWpCg7pbi7mA
	WWWHXXxUAXAoguB5pLGdOqnQJXxXtqw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-jmzo6ZoGOAOXMgWZWK6epQ-1; Fri, 30 May 2025 15:56:37 -0400
X-MC-Unique: jmzo6ZoGOAOXMgWZWK6epQ-1
X-Mimecast-MFC-AGG-ID: jmzo6ZoGOAOXMgWZWK6epQ_1748634996
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f8fd1856so452909f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 12:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748634996; x=1749239796;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tvBAAzFRZWgKvdMYS4slyoiYTjJP1YViGuKwx+ViZSc=;
        b=nrFSVi4h69pKxEs8t9RJmevy0Y77e7EZUN+ZiefA7uXyCguW39NbWPfDhN/oW7fV6b
         tHywkwWEQ1VH2JuL83GWafZ3cqUL9v98dL5rufL1jdlzfj+KsV8Vh39HysE7sh0C2RdE
         A/HRAKvHpsV0p5aTi6Gkj9BZ6H8hC61R/x07eCy6INu/i2xV5lQVSsNWav9Kms3RCkRa
         guwCEh5joBmj3BGlWP9p9T0fWZCb/8ZGmKvYNZiA3m/TA7g7C7kuhqlOchI3QsLy4ERT
         saKllunclfZeb+CQsyYC8ez1LUpqt12023pCtbewzfVl7F0UP0LKSWlRDw0hrZJ0sXCm
         1cyw==
X-Forwarded-Encrypted: i=1; AJvYcCVshTJD5zSFI+yNS7yjBrNkBu+BiHVcBUAKbD76pWSWdUoY4xTvLjNFOgwX9JxvSIQOF0Dy9pfuhlePZ0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiJY04+zBvzwCij6yPlDvvozN1Ma/BCGnmhUgEBRChTZfWjpzQ
	Km0c2oTuGQDB412yOGh2U/g2Uw/ADUshwnGukkTwGmrsB85FseRFCCDCO4LB84WipoPT2lF6vxW
	bDHo9azjPg0k227k9JY5cBAhQTHqBzexDEZS+F6H8/V6/WgRAPEBVWVrt9kJ34rNNHw==
X-Gm-Gg: ASbGncvx+EEea/5/LT3lWb18wSyK84MV0VqLmcIfVA21aoQPG7dJ5Tu+LyI7aRmnJAD
	fGGBbwC/LYg9ctNkjbckUFokERmITxtiy4sZjIEob9XTTuP6u+CYId7xmjIaC68zrBudGrU9uAk
	O27VyKolOfi4qFoaSea86xg65IUS7joSNbkTRR0JOJ10eLRdAUOY1nLWxTIpbwcOXjN/TZC3mpP
	4WhHWbrlYmpuRNMLJ3feCoJKMBvk0kNQl1eBoj+UfROSv/EIwJfiF8aGlgXM0JuMj8yWwUvPHtV
	a8R/nZuvf46WSGC3yuIKxmDGtfPgRsCkur/borTe2mR7Lhrg5zJIEwUCmlxuZ95/wG6tmwAwBdZ
	7TuW2OJ80ZvVC8jPMKZSQFwlAjIZLzL1YV0/HZUY=
X-Received: by 2002:a05:6000:4287:b0:3a4:f744:e00c with SMTP id ffacd0b85a97d-3a4f7a62cb1mr3556921f8f.29.1748634996054;
        Fri, 30 May 2025 12:56:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKeZZvuxpuWqtWJGoS16vB7pQEX6oxIZg7W/ztBDXBVVhVshEgct8dsWN2g5FuF1qJEUE0WQ==
X-Received: by 2002:a05:6000:4287:b0:3a4:f744:e00c with SMTP id ffacd0b85a97d-3a4f7a62cb1mr3556903f8f.29.1748634995597;
        Fri, 30 May 2025 12:56:35 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb86d2sm26237585e9.30.2025.05.30.12.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 12:56:34 -0700 (PDT)
Message-ID: <ac7351c1-cffe-4da6-9397-f9421e53f59f@redhat.com>
Date: Fri, 30 May 2025 21:56:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
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
 <20250530162227.715551-7-ziy@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250530162227.715551-7-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 18:22, Zi Yan wrote:
> migratetype is no longer overwritten during pageblock isolation,
> start_isolate_page_range(), has_unmovable_pages(), and
> set_migratetype_isolate() no longer need which migratetype to restore
> during isolation failure.
> 
> For has_unmoable_pages(), it needs to know if the isolation is for CMA
> allocation, so adding CMA_ALLOCATION to provide the information. At the
> same time change isolation flags to enum pb_isolate_mode
> (PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
> PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
> MEMORY_OFFLINE instead, since only PB_ISOLATE_MODE_MEM_OFFLINE reports
> isolation failures.
> 
> alloc_contig_range() no longer needs migratetype. Replace it with
> enum acr_flags_t to tell if an allocation is for CMA. So does
> __alloc_contig_migrate_range().
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>   drivers/virtio/virtio_mem.c    |  2 +-
>   include/linux/gfp.h            |  9 ++++-
>   include/linux/page-isolation.h | 20 ++++++++--
>   include/trace/events/kmem.h    | 14 ++++---
>   mm/cma.c                       |  2 +-
>   mm/memory_hotplug.c            |  6 +--
>   mm/page_alloc.c                | 27 ++++++-------
>   mm/page_isolation.c            | 70 +++++++++++++++-------------------
>   8 files changed, 82 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> index 56d0dbe62163..6bce70b139b2 100644
> --- a/drivers/virtio/virtio_mem.c
> +++ b/drivers/virtio/virtio_mem.c
> @@ -1243,7 +1243,7 @@ static int virtio_mem_fake_offline(struct virtio_mem *vm, unsigned long pfn,
>   		if (atomic_read(&vm->config_changed))
>   			return -EAGAIN;
>   
> -		rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
> +		rc = alloc_contig_range(pfn, pfn + nr_pages, ACR_OTHER,
>   					GFP_KERNEL);
>   		if (rc == -ENOMEM)
>   			/* whoops, out of memory */
> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> index be160e8d8bcb..51990d571e3e 100644
> --- a/include/linux/gfp.h
> +++ b/include/linux/gfp.h
> @@ -423,9 +423,16 @@ static inline bool gfp_compaction_allowed(gfp_t gfp_mask)
>   extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
>   
>   #ifdef CONFIG_CONTIG_ALLOC
> +
> +enum acr_flags_t {
> +	ACR_CMA,	// CMA allocation
> +	ACR_OTHER,	// other allocation
> +};

Hm, enum != flags.

If you want to use flags, then just have ACR_CMA. ACR_OTHER is implied 
if not set.

And ACR_CMA would then have to be "1" etc.

> +
>   /* The below functions must be run on a range from a single zone. */
>   extern int alloc_contig_range_noprof(unsigned long start, unsigned long end,
> -			      unsigned migratetype, gfp_t gfp_mask);
> +				     enum acr_flags_t alloc_flags,
> +				     gfp_t gfp_mask);
>   #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_noprof(__VA_ARGS__))
>   
>   extern struct page *alloc_contig_pages_noprof(unsigned long nr_pages, gfp_t gfp_mask,
> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
> index 7a681a49e73c..3e2f960e166c 100644
> --- a/include/linux/page-isolation.h
> +++ b/include/linux/page-isolation.h
> @@ -38,8 +38,20 @@ static inline void set_pageblock_isolate(struct page *page)
>   }
>   #endif
>   
> -#define MEMORY_OFFLINE	0x1
> -#define REPORT_FAILURE	0x2
> +/*
> + * Pageblock isolation modes:
> + * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate) memory
> + *				 e.g., skip over PageHWPoison() pages and
> + *				 PageOffline() pages. Unmovable pages will be
> + *				 reported in this mode.
> + * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
> + * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
> + */
> +enum pb_isolate_mode {
> +	PB_ISOLATE_MODE_MEM_OFFLINE,
> +	PB_ISOLATE_MODE_CMA_ALLOC,
> +	PB_ISOLATE_MODE_OTHER,
> +};

It's late on friady, but it looks like we are duplicating things here.

Let me think about that once my brain is recharged :)

-- 
Cheers,

David / dhildenb

