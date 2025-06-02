Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BF2196C7C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748897965; cv=none; b=AI2JYF9Hzeo5e3mOZ49Xvb6XUr2oo7SEVqBdxYnuRGAzMQi1Copdr5DrXoHD4xheK8XVIzINkjc0ou318qqGBACk534bQutqf45CaTzqqmubczLoG4c93HO+CXEnwCcGviuO8sutELI3l/2G6ahIMj9eP1FBcQ58q6ugghHIk4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748897965; c=relaxed/simple;
	bh=u4hcCaU5cdIZuoeMNIKDWjM0IcXHL3ddpcYSb50/FyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsSDwpSgsesLsCCO0Rbkh52I3cIWB4iXqK4Z+l3x0UMNAPY8oYoHuEGAsKCQCivMwa8/gGkCweFTJpZ4h+D45BzXlo3uwFxmifGEEK4EyX8TxouO1co3kMHdiaAEbLMyJUOH/Ssa1qcrB3ZMmmFYnrxQc2iBokG33nAeg0KlAyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EnpLZ3Ln; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EnpLZ3Ln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748897962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oHj5LplUQW2Rs+qaSOWR1ovRsM9lEK+tcVFyNq+5pQo=;
	b=EnpLZ3LnTp2iUo6GBMwRRIptdAYPI4i59GZQtODrfPVtyiuLTQCwjymi3prlLY6N2Kw3l4
	85GUvIiSlrUcGTDeTkqDoBFUjgLjmCfqmCJ0hYghd/aahobBnd2nlxPlh+xjRUcz+z1JrK
	RNZHN4ay11ElrziSzcdkOC/UgIkvY4U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-TAbyyoeAPPWX6H8KX_1KLw-1; Mon, 02 Jun 2025 16:59:21 -0400
X-MC-Unique: TAbyyoeAPPWX6H8KX_1KLw-1
X-Mimecast-MFC-AGG-ID: TAbyyoeAPPWX6H8KX_1KLw_1748897960
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so10362075e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 13:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748897960; x=1749502760;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oHj5LplUQW2Rs+qaSOWR1ovRsM9lEK+tcVFyNq+5pQo=;
        b=SZ6Q+fNKTNJUSggJy6nCIA2svi0JI8C/AzsOyjzLkyyd3PbQRaY3ExziMOg0Dgq+av
         QTFILeXAKqlIMWfveV8ubz7DRwrr/7g0I4jFQieOkjjFGLcnxiyGTHgnNtFsBy8Srdv+
         B9WeDNlcehhDkvbo2/zOlQdtWfAkMI6w0kIRBnf+cet8qPpWkbu8ysYIO1ip1aZWsTC4
         F3wEG6ky6pRwem4YOQ9BOpQaVY7VaonTx4UKOHEUGHChyGtUKEZ+jUsIi1f92+Lqg7MC
         7TF8WD+teMWglkpz6KlBQB7xuM0E2yNk8xMV5vkf2rn0pN0QNn928CT32E+4yRPnkV6x
         aTKw==
X-Forwarded-Encrypted: i=1; AJvYcCUnosHfI6/376T0JoxVDie/WT9ETyb2gYufPmy96PiS/P1hBRGf5C7Nf1EcSlVs5I0bzG8dz4sZktOJHLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAWjkhpoWAKTBvDojm5UjOp+/YQeEGb9fa5w1iOIMgD+XEYpwz
	LNDZEzywBYjpCTlY9tdkJrU+PztqZ7e4F9oH1a6yLbNXIhFL0kFOVfEta4wT7uIH2aXr2WPOBHO
	GOiSb9TvDUphIv4KVosM3x/oi6blmckPexVe6uBp8ynAksDCt1UMscdozZpTD/aotcQ==
X-Gm-Gg: ASbGncs0sjPBgA83iZSltOdGfh5eaCyGhUm4qwIzVzejY8o2dtwEgyQgUxdOrKe5CCA
	XQsiMo4e4nTPSl74hN/iLHi6//hy6N5FF5y0T703F2rNU37lied6uCjIUsc2ElkErXlIp+pRn8e
	vC5W9kuefu7zLypmcylsorZx68Kb8ZmxEpnV7/QuiSIeWARbGZUs2hIaVfANipslsi53n7/axZ8
	cvmOuMK9KQU1ze4gONoRKLfuRT2gX9y8i1t++f6IaPY2Nta1zJX0X8EOtXGO5EArXk84cb3LzLx
	4AOHWzDuNjb7AmvGerXiB0F6C4+ZrNheTRMgIgoUxqaDR4H8ZlxNidRKBgn+YauMm8XXu3nlF5W
	33FEWrc7IU73IJZH1qq3g+SMkipMV54/KmbOKIG8=
X-Received: by 2002:a05:6000:250f:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a4f89e8f3fmr11162944f8f.52.1748897960496;
        Mon, 02 Jun 2025 13:59:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmNd8bL6O6l0mWFBg4PXRgZB4V57QVpYJFhasmS2itus8IMdBaTylJQrtMhsnUaKK3xXzPCA==
X-Received: by 2002:a05:6000:250f:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a4f89e8f3fmr11162935f8f.52.1748897960102;
        Mon, 02 Jun 2025 13:59:20 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:a300:1c2c:f35e:e8e5:488e? (p200300d82f34a3001c2cf35ee8e5488e.dip0.t-ipconnect.de. [2003:d8:2f34:a300:1c2c:f35e:e8e5:488e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8edebsm134353075e9.6.2025.06.02.13.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 13:59:19 -0700 (PDT)
Message-ID: <1f1f1d26-5bbf-498a-b6af-0fb51fb3d50f@redhat.com>
Date: Mon, 2 Jun 2025 22:59:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] mm/page_isolation: remove migratetype parameter
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
References: <20250602151807.987731-1-ziy@nvidia.com>
 <20250602151807.987731-7-ziy@nvidia.com>
 <7BD9FB05-4125-4EA8-841D-9D08907D01D5@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7BD9FB05-4125-4EA8-841D-9D08907D01D5@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.06.25 18:59, Zi Yan wrote:
> On 2 Jun 2025, at 11:18, Zi Yan wrote:
> 
>> migratetype is no longer overwritten during pageblock isolation,
>> start_isolate_page_range(), has_unmovable_pages(), and
>> set_migratetype_isolate() no longer need which migratetype to restore
>> during isolation failure.
>>
>> For has_unmoable_pages(), it needs to know if the isolation is for CMA
>> allocation, so adding PB_ISOLATE_MODE_CMA_ALLOC provide the information.
>> At the same time change isolation flags to enum pb_isolate_mode
>> (PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
>> PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
>> PB_ISOLATE_MODE_MEM_OFFLINE, since only PB_ISOLATE_MODE_MEM_OFFLINE
>> reports isolation failures.
>>
>> alloc_contig_range() no longer needs migratetype. Replace it with
>> PB_ISOLATE_MODE_CMA_ALLOC to tell if an allocation is for CMA. So does
>> __alloc_contig_migrate_range().
> 
> This paragraph should be changed to:
> 
> alloc_contig_range() no longer needs migratetype. Replace it with
> a newly defined acr_flags_t to tell if an allocation is for CMA. So does
> __alloc_contig_migrate_range(). Add ACR_OTHER (set to 0) to indicate
> other cases.
> 
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>> ---
>>   drivers/virtio/virtio_mem.c    |  4 +-
>>   include/linux/gfp.h            | 18 ++++++++-
>>   include/linux/page-isolation.h |  7 +---
>>   include/trace/events/kmem.h    | 14 ++++---
>>   mm/cma.c                       |  3 +-
>>   mm/memory_hotplug.c            |  6 +--
>>   mm/page_alloc.c                | 27 ++++++-------
>>   mm/page_isolation.c            | 70 +++++++++++++++-------------------
>>   8 files changed, 79 insertions(+), 70 deletions(-)
>>
> 
> 
> The fixup to restore acr_flags_t:
> 
> 
>  From d0205580ab70aaf93f3f7c04b53dc595ee387bac Mon Sep 17 00:00:00 2001
> From: Zi Yan <ziy@nvidia.com>
> Date: Mon, 2 Jun 2025 12:53:58 -0400
> Subject: [PATCH] restore acr_flags_t.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>   drivers/virtio/virtio_mem.c    |  4 ++--
>   include/linux/gfp.h            | 21 +++++----------------
>   include/linux/page-isolation.h | 15 +++++++++++++++
>   include/trace/events/kmem.h    | 12 ++++++------
>   mm/cma.c                       |  3 +--
>   mm/page_alloc.c                | 24 ++++++++++++------------
>   6 files changed, 41 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> index 535680a54ff5..6bce70b139b2 100644
> --- a/drivers/virtio/virtio_mem.c
> +++ b/drivers/virtio/virtio_mem.c
> @@ -1243,8 +1243,8 @@ static int virtio_mem_fake_offline(struct virtio_mem *vm, unsigned long pfn,
>   		if (atomic_read(&vm->config_changed))
>   			return -EAGAIN;
> 
> -		rc = alloc_contig_range(pfn, pfn + nr_pages,
> -					PB_ISOLATE_MODE_OTHER, GFP_KERNEL);
> +		rc = alloc_contig_range(pfn, pfn + nr_pages, ACR_OTHER,
> +					GFP_KERNEL);
>   		if (rc == -ENOMEM)
>   			/* whoops, out of memory */
>   			return rc;
> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> index 17b92888d6de..95065cec85e5 100644
> --- a/include/linux/gfp.h
> +++ b/include/linux/gfp.h
> @@ -423,25 +423,14 @@ static inline bool gfp_compaction_allowed(gfp_t gfp_mask)
>   extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
> 
>   #ifdef CONFIG_CONTIG_ALLOC
> -/*
> - * Pageblock isolation modes:
> - * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate) memory
> - *				 e.g., skip over PageHWPoison() pages and
> - *				 PageOffline() pages. Unmovable pages will be
> - *				 reported in this mode.
> - * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
> - * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
> - */
> -enum pb_isolate_mode {
> -	PB_ISOLATE_MODE_MEM_OFFLINE,
> -	PB_ISOLATE_MODE_CMA_ALLOC,
> -	PB_ISOLATE_MODE_OTHER,
> -};
> +
> +typedef unsigned int __bitwise acr_flags_t;
> +#define ACR_OTHER	((__force acr_flags_t)0)	// other allocations
> +#define ACR_CMA		((__force acr_flags_t)BIT(0))	// allocate for CMA

For FPI I called that "FPI_NONE" -- no special request -- and similarly 
for RMAP "RMAP_NONE".

So if ACR_CMA is set, it's a CMA allocation, otherwise just an ordinary one.


Apart from that LGTM.

-- 
Cheers,

David / dhildenb

