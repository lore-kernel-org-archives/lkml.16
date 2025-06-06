Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0772F1D5AD4
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 17:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749231466; cv=none; b=gJcZQn3uibQ6+0vLyVBp5mZKuhAYP6SqbhrBGuxumqoxrHH9pIh1Rlk+smiR1/55cprWs3xCD5brur0tmcRQGyfb+4/fc84raV5cIWCmJ0Ko503ZcL4B1/ZWsJVBpbXnKrWj5vr7z41G1A7sLymdxSplZWFdtFK6GPqUbtAOAPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749231466; c=relaxed/simple;
	bh=K44/izevI9czGbjthX8hyP3KRO9TzGPkZOE/MyKb44Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h6PQkJ9powcdVwJwN2HilpXBHuhy6qf94f7VmVCvoMn3plE/MlPup01eURxImv58Frj20U33YnwS+o9Pjqmts5v1bylE2m3/cgFpAQbsw3HGDfKgXl4Irx1ATis7VIm5OCTYOa1uD/nfdAdr/TpVbq5ylAh/01o7857xI8aPyVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QX3IqfBl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QX3IqfBl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749231464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0DY5a5tgV1lFQoZpqsVsy5bSDHnhUhUK/Tk+mt1FI+A=;
	b=QX3IqfBlr3zH7GbbX5QdSehqm3ffk71EKFZtyW8iWr1HGnkWNr6Nr4ssm7UerglE7FS4tl
	Y04fIZXHrc7RfasTBAVl4EyN2vGeeacu1Wu13Lr9q3u8g+BWpVzLhG9aeWhzaMjhzzY3je
	GFPMO/2cJwlbNbKgurlvYym3gecEIzg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-xcjwFLdDOmu4o3jXTwWShw-1; Fri, 06 Jun 2025 13:37:42 -0400
X-MC-Unique: xcjwFLdDOmu4o3jXTwWShw-1
X-Mimecast-MFC-AGG-ID: xcjwFLdDOmu4o3jXTwWShw_1749231461
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39ee4b91d1cso1718036f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 10:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749231461; x=1749836261;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0DY5a5tgV1lFQoZpqsVsy5bSDHnhUhUK/Tk+mt1FI+A=;
        b=nz6NRHyFJFmc8HePltiXrx1vcbRe9epo5kQncho4rufXZf0RG08u6ivkOz/M0+TbQf
         ydfQ1rmWGO7R+wH17NRw+TaX9FYnbkkJt9SspwwTXKLlTabYcfxhPPnHPwZIzwB4R6FL
         a9w122s7CbpN5gRzStYJ4trl8fRhaNPpJuWh5qBDrLHVNI91Eg/iPPGP/FLGa5vQLLIy
         YrCNPR4mxzRwgipyBeMfGSxLyGkVq/4pX65LqUDH5MV4Pegj61vVvuhAbwMiQOeFFQcr
         B18ZXWSCejBCb/h3oIPY6j5MBJw3vvy3YzpsleIeu7l3CRRthvWGYVPibcQRkhluKbMw
         4mcA==
X-Forwarded-Encrypted: i=1; AJvYcCWHrgqgL/xdfRx7syA/hTIvfD9QbPiukCIf40YivlGzjE/do0i92X/51AzNcTGP4oifFC2GYbKOpMV5R4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLG+M9SCvQWByaQE9MWw1w2ilRMQypJQJvTjw1ibXpNzAsuA25
	7JCYCnAtZeifdPzxKFI5YIR5VFpkz67Es8IgilteASedxgXjVRZI8wXQV1ti/xcIc2QTJgcHWx2
	popdB2m6Mg2Hphg5UiXW2u6nNZSXx1QD8nNL6rUr6iGSEJ2xXNUhWjHipgzPNF4qTRA==
X-Gm-Gg: ASbGncthhH4imcUd7VKpVHYc7dYxsqVm69ip9SFAwxjaJ9s4l8Q4S1hfm6IBmyzuli/
	PiZWm2sjU8xuzKV0uVDU17YOro8fVZccDsUhs2twzfuChm7Jiw2f7fb0BL6PrTl0KegqYz34aX4
	LiA+rj3oV46tmXufF5lq6MjzVoT4LzEg9gtlA0KNFUTPWiDgBW8O7ZoHFl5RsRXwAle4+6a7Q0V
	vVfhmkuvmHFY6lWM2LNr5Q2CVpom2OEVxO6hgiDRBKDeBNNzlb5IofAx39428PFY9RzLDBu5fRK
	BJI+MPwDaVXyCsCGXDDYbqNLw+8Yjz+u0TvZtIs29Zsx3UVQvys/K4eNHWfnzXGWLiyp2QwFNUz
	G1gysjufkU3WIFla0C9azHWBd7+6frIY=
X-Received: by 2002:a05:6000:290c:b0:3a5:24cc:6d5e with SMTP id ffacd0b85a97d-3a526dc5198mr7522292f8f.3.1749231461327;
        Fri, 06 Jun 2025 10:37:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzmXBuKrj9XtYgS/YeYBqJyod3VkJeP4zheeXim89BexG79b0UK3/KzdkXPpj88SbdZjr2aA==
X-Received: by 2002:a05:6000:290c:b0:3a5:24cc:6d5e with SMTP id ffacd0b85a97d-3a526dc5198mr7522276f8f.3.1749231460873;
        Fri, 06 Jun 2025 10:37:40 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f82871a4sm42742905e9.0.2025.06.06.10.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 10:37:40 -0700 (PDT)
Message-ID: <4c1d5033-0c90-4672-84a1-15978ced245d@redhat.com>
Date: Fri, 6 Jun 2025 19:37:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
To: Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, hughd@google.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250606143700.3256414-1-usamaarif642@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.25 16:37, Usama Arif wrote:
> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
> watermarks are evaluated to extremely high values, for e.g. a server with
> 480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
> of the sizes set to never, the min, low and high watermarks evaluate to
> 11.2G, 14G and 16.8G respectively.
> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepage
> size set to madvise, the min, low and high watermarks evaluate to 86M, 566M
> and 1G respectively.
> This is because set_recommended_min_free_kbytes is designed for PMD
> hugepages (pageblock_order = min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
> Such high watermark values can cause performance and latency issues in
> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
> most of them would never actually use a 512M PMD THP.
> 
> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
> folio order enabled in set_recommended_min_free_kbytes.
> With this patch, when only 2M THP hugepage size is set to madvise for the
> same machine with 64K page size, with the rest of the sizes set to never,
> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
> respectively. When 512M THP hugepage size is set to madvise for the same
> machine with 64K page size, the min, low and high watermarks evaluate to
> 11.2G, 14G and 16.8G respectively, the same as without this patch.
> 
> An alternative solution would be to change PAGE_BLOCK_ORDER by changing
> ARCH_FORCE_MAX_ORDER to a lower value for ARM64_64K_PAGES. However, this
> is not dynamic with hugepage size, will need different kernel builds for
> different hugepage sizes and most users won't know that this needs to be
> done as it can be difficult to detmermine that the performance and latency
> issues are coming from the high watermark values.
> 
> All watermark numbers are for zones of nodes that had the highest number
> of pages, i.e. the value for min size for 4K is obtained using:
> cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n 1 | awk '{print $1 * 4096 / 1024 / 1024}';
> and for 64K using:
> cat /proc/zoneinfo  | grep -i min | awk '{print $2}' | sort -n  | tail -n 1 | awk '{print $1 * 65536 / 1024 / 1024}';
> 
> An arbirtary min of 128 pages is used for when no hugepage sizes are set
> enabled.
> 
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> ---
>   include/linux/huge_mm.h | 25 +++++++++++++++++++++++++
>   mm/khugepaged.c         | 32 ++++++++++++++++++++++++++++----
>   mm/shmem.c              | 29 +++++------------------------
>   3 files changed, 58 insertions(+), 28 deletions(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 2f190c90192d..fb4e51ef0acb 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -170,6 +170,25 @@ static inline void count_mthp_stat(int order, enum mthp_stat_item item)
>   }
>   #endif
>   
> +/*
> + * Definitions for "huge tmpfs": tmpfs mounted with the huge= option
> + *
> + * SHMEM_HUGE_NEVER:
> + *	disables huge pages for the mount;
> + * SHMEM_HUGE_ALWAYS:
> + *	enables huge pages for the mount;
> + * SHMEM_HUGE_WITHIN_SIZE:
> + *	only allocate huge pages if the page will be fully within i_size,
> + *	also respect madvise() hints;
> + * SHMEM_HUGE_ADVISE:
> + *	only allocate huge pages if requested with madvise();
> + */
> +
> + #define SHMEM_HUGE_NEVER	0
> + #define SHMEM_HUGE_ALWAYS	1
> + #define SHMEM_HUGE_WITHIN_SIZE	2
> + #define SHMEM_HUGE_ADVISE	3
> +
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   
>   extern unsigned long transparent_hugepage_flags;
> @@ -177,6 +196,12 @@ extern unsigned long huge_anon_orders_always;
>   extern unsigned long huge_anon_orders_madvise;
>   extern unsigned long huge_anon_orders_inherit;
>   
> +extern int shmem_huge __read_mostly;
> +extern unsigned long huge_shmem_orders_always;
> +extern unsigned long huge_shmem_orders_madvise;
> +extern unsigned long huge_shmem_orders_inherit;
> +extern unsigned long huge_shmem_orders_within_size;

Do really all of these have to be exported?

> +
>   static inline bool hugepage_global_enabled(void)
>   {
>   	return transparent_hugepage_flags &
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 15203ea7d007..e64cba74eb2a 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2607,6 +2607,26 @@ static int khugepaged(void *none)
>   	return 0;
>   }
>   
> +static int thp_highest_allowable_order(void)

Did you mean "largest" ?

> +{
> +	unsigned long orders = READ_ONCE(huge_anon_orders_always)
> +			       | READ_ONCE(huge_anon_orders_madvise)
> +			       | READ_ONCE(huge_shmem_orders_always)
> +			       | READ_ONCE(huge_shmem_orders_madvise)
> +			       | READ_ONCE(huge_shmem_orders_within_size);
> +	if (hugepage_global_enabled())
> +		orders |= READ_ONCE(huge_anon_orders_inherit);
> +	if (shmem_huge != SHMEM_HUGE_NEVER)
> +		orders |= READ_ONCE(huge_shmem_orders_inherit);
> +
> +	return orders == 0 ? 0 : fls(orders) - 1;
> +}

But how does this interact with large folios / THPs in the page cache?

> +
> +static unsigned long min_thp_pageblock_nr_pages(void)

Reading the function name, I have no idea what this function is supposed 
to do.


-- 
Cheers,

David / dhildenb

