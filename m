Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BFE1E570B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738244636; cv=none; b=qdgUDOtj5Pm4RCCJ/2XLz4xgmjHicW8gmFsOTO0w2BIlKS11mH70LImwbbyja5zYDCXxfY2tKrGD3uzzOJAsVHwVJWfkwOzukSHLSGHIXvfcHalrmT9HozHI9aU4ag6m3M9z8OPVl6LufwgXjv4r9O7lLKleY/8Zh7u+DeENXR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738244636; c=relaxed/simple;
	bh=CIFiqDWuCwGjDtCXn2azSumNaVqITX740jNpZ2DyuMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0DDKf0DkOeLo9ui9TEveDhZTqBZy4g2l59AIZK2v4fC/LzRER18MoMaS9ghCvyEmsazpdLbOPL1mum4XySXGli4uHQRxCVRgFTIi8JR6BQOxovWT77mp0Go1R6GpllU7etRkWUQQGtuXMlQM1pUVG4abHfNDnIt7ZRyqN0FITU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=StEOC/Fr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="StEOC/Fr"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so8101675e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 05:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738244633; x=1738849433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ha66Iu6lse0aeaZq4IXkBsImhaaLmQUiLrfjz5cfLcs=;
        b=StEOC/FrzTYdmdGihmQKhV572LMjq1P2HN4sEDl4RtLO31rDnRlogVQUAEBCPSsyte
         ezRGV1Bm3ntLTETXCD1kWldfJl0tbN9yg/a2OptdgtT/l58blJ8SJGKt5SRz3Wzp18+/
         rosQvwl0XnRTaga6IvKgeWOEpKhkWGSlX+R4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738244633; x=1738849433;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ha66Iu6lse0aeaZq4IXkBsImhaaLmQUiLrfjz5cfLcs=;
        b=O5Xc8lGlxXP+EwVJClaL2vKoCJPk7cCSSLqbzbNSrcvunGAGnKdLas1G29rqbcWEw9
         onr+Y9/iEQd3FhVIA5LNB/3rj0CpOSnKkfy9GZXGFY+Pin7PhNQ2m1O1tdU6SMg8jPQD
         rE/pP+YtYoeO3oKcTHl9aHigixcH8X+YtC1N0phXGfCPhEVONiBZj5vuhZshW+kdr9u5
         4aMwUGKh8hFPOgnATLMc4fL20hNZGnf3QshMP05dYvUpNBL5QmKrskAtzq3tXGuMlQuP
         pAtAyiqQRSa9fVRtv5JuaFhD9cfjObxjCu+Bn6w1FeDuelRfybArUqRR4nq9iuUiCJeQ
         1miw==
X-Gm-Message-State: AOJu0Yyg6YahuXgYL7lL2xkHOp3lt8iliknSSVNwpd0eQ6C8Bv9WxlOJ
	WFPjIYYZsQPhjYsfXIMC24X0NL9KCJu+0o3bQ+w/gOBPBF3eD1OeoI15TLrJ2tI=
X-Gm-Gg: ASbGncsdexQhX+taqYSuHITwouetBvkbIlTnNZmSqV57hk5zzYv9GerOV67r/AyjDk5
	0dD3DNVZ2moGWtRCwTNMo4YbeARWF+rWZM/HCyPGFmIQjs/8h1ilNe8eeyh6Bk1X4WWtkjejJUb
	aRjfW64puPYXfSYE7ATOkvhz9HSN+q1YrCF8+gcdKOu4913mRP5yYPRTXAtvfnTjv8nRgvTynSn
	AoneBcERZN915hywS2+PGuiTbvUYTsoc18oAB07bdRxvApxN45kH2FK1yYkP4tr9lNepoPj/uBu
	e5HRpOkxC689Iy/hMccApI5AAiQ=
X-Google-Smtp-Source: AGHT+IGPwbF4Ytpnf417QGIV7aWx0XKtwsuKOqBPTmJvh2JEm7/wX2JzW1AoBcF90cds5JkZfLV8kw==
X-Received: by 2002:a05:600c:4f83:b0:436:713b:cb31 with SMTP id 5b1f17b1804b1-438dc3a904cmr60626675e9.3.1738244632903;
        Thu, 30 Jan 2025 05:43:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2e384sm61161085e9.19.2025.01.30.05.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:43:52 -0800 (PST)
Date: Thu, 30 Jan 2025 14:43:50 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 06/12] mm: use single SWP_DEVICE_EXCLUSIVE entry type
Message-ID: <Z5uCFtyaDpcbHRoF@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-7-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-7-david@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Jan 29, 2025 at 12:54:04PM +0100, David Hildenbrand wrote:
> There is no need for the distinction anymore; let's merge the readable
> and writable device-exclusive entries into a single device-exclusive
> entry type.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Yeah I really don't think there's a need to track that on the cpu ptes.
Device should have write/dirty bits (which nouveau really should forward)
or defensively assume the page is always dirtied when clearing a pte.

Plus the entire point of device exclusive access is to support device
atomics, so in practice it's always a write access that dirties anyway.

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  include/linux/swap.h    |  7 +++----
>  include/linux/swapops.h | 27 ++++-----------------------
>  mm/mprotect.c           |  8 --------
>  mm/page_table_check.c   |  5 ++---
>  mm/rmap.c               |  2 +-
>  5 files changed, 10 insertions(+), 39 deletions(-)
> 
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 91b30701274e..9a48e79a0a52 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -74,14 +74,13 @@ static inline int current_is_kswapd(void)
>   * to a special SWP_DEVICE_{READ|WRITE} entry.
>   *
>   * When a page is mapped by the device for exclusive access we set the CPU page
> - * table entries to special SWP_DEVICE_EXCLUSIVE_* entries.
> + * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
>   */
>  #ifdef CONFIG_DEVICE_PRIVATE
> -#define SWP_DEVICE_NUM 4
> +#define SWP_DEVICE_NUM 3
>  #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
>  #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
> -#define SWP_DEVICE_EXCLUSIVE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
> -#define SWP_DEVICE_EXCLUSIVE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
> +#define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
>  #else
>  #define SWP_DEVICE_NUM 0
>  #endif
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index 96f26e29fefe..64ea151a7ae3 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h
> @@ -186,26 +186,16 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
>  	return unlikely(swp_type(entry) == SWP_DEVICE_WRITE);
>  }
>  
> -static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
> +static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>  {
> -	return swp_entry(SWP_DEVICE_EXCLUSIVE_READ, offset);
> -}
> -
> -static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
> -{
> -	return swp_entry(SWP_DEVICE_EXCLUSIVE_WRITE, offset);
> +	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
>  }
>  
>  static inline bool is_device_exclusive_entry(swp_entry_t entry)
>  {
> -	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE_READ ||
> -		swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE;
> +	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE;
>  }
>  
> -static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
> -{
> -	return unlikely(swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE);
> -}
>  #else /* CONFIG_DEVICE_PRIVATE */
>  static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
>  {
> @@ -227,12 +217,7 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
>  	return false;
>  }
>  
> -static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
> -{
> -	return swp_entry(0, 0);
> -}
> -
> -static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
> +static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>  {
>  	return swp_entry(0, 0);
>  }
> @@ -242,10 +227,6 @@ static inline bool is_device_exclusive_entry(swp_entry_t entry)
>  	return false;
>  }
>  
> -static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
> -{
> -	return false;
> -}
>  #endif /* CONFIG_DEVICE_PRIVATE */
>  
>  #ifdef CONFIG_MIGRATION
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 516b1d847e2c..9cb6ab7c4048 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -225,14 +225,6 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				newpte = swp_entry_to_pte(entry);
>  				if (pte_swp_uffd_wp(oldpte))
>  					newpte = pte_swp_mkuffd_wp(newpte);
> -			} else if (is_writable_device_exclusive_entry(entry)) {
> -				entry = make_readable_device_exclusive_entry(
> -							swp_offset(entry));
> -				newpte = swp_entry_to_pte(entry);
> -				if (pte_swp_soft_dirty(oldpte))
> -					newpte = pte_swp_mksoft_dirty(newpte);
> -				if (pte_swp_uffd_wp(oldpte))
> -					newpte = pte_swp_mkuffd_wp(newpte);
>  			} else if (is_pte_marker_entry(entry)) {
>  				/*
>  				 * Ignore error swap entries unconditionally,
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 509c6ef8de40..c2b3600429a0 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -196,9 +196,8 @@ EXPORT_SYMBOL(__page_table_check_pud_clear);
>  /* Whether the swap entry cached writable information */
>  static inline bool swap_cached_writable(swp_entry_t entry)
>  {
> -	return is_writable_device_exclusive_entry(entry) ||
> -	    is_writable_device_private_entry(entry) ||
> -	    is_writable_migration_entry(entry);
> +	return is_writable_device_private_entry(entry) ||
> +	       is_writable_migration_entry(entry);
>  }
>  
>  static inline void page_table_check_pte_flags(pte_t pte)
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 49ffac6d27f8..65d9bbea16d0 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2470,7 +2470,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>  	 * do_swap_page() will trigger the conversion back while holding the
>  	 * folio lock.
>  	 */
> -	entry = make_writable_device_exclusive_entry(page_to_pfn(page));
> +	entry = make_device_exclusive_entry(page_to_pfn(page));
>  	swp_pte = swp_entry_to_pte(entry);
>  	if (pte_soft_dirty(fw.pte))
>  		swp_pte = pte_swp_mksoft_dirty(swp_pte);
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
