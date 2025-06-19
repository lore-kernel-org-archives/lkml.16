Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41171178372
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750329502; cv=none; b=r98tFIYLqo8q0HLD1UQ+ARypeOjp60WOMwUBssGw8sVyDQ9t/+pq47Ktm+x12XDnJH56s4VevqqGErkqOM9ymPkieAEkgwK35AgL3i7F7KeIdh8mDg8I/MQ0ECRO4wVyHTG9V56t/V8ZjuNsKEOqQpDnh3ojcXWpGLe1Rx1N0gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750329502; c=relaxed/simple;
	bh=uU/WaD09ydxV6ecMttTjkY3NvPuNqAxMQRIGSnK25Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzoNnCd054XC1wvqIHezTHGykzOdFB9QK140UBrT1/MA/pOdPQw8WG2YSoHoOlT9wi0Lym0eR3SiVyGz40knYwuWElPLdV0GsMLc/koX2a8K1t/jI/Y22OOuTtUfLhIhYeAN7eTaZlGppW/qkhctWZ7kJCK2+wckOBrlQIAMPuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OcIEOWhD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OcIEOWhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750329497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aR/RhKva1LzUNvpspRIuDiQMPy7Eui5RuKemymunabo=;
	b=OcIEOWhDJWP8TSYI8wXUf6mPTX4KPde3p/cCzcZ77FJ0zaSNu5Tp9VNqAKF3myaOOyd7sc
	dAPSJAy2ILFK+5vKtvxvBcqVWBkbkHb+UtN5ZuuT/7To4wSUpeA9D1sh7w+0mYXtHkuVoo
	gUeKQl56+gSTE5sXE3h0ymd+hlseDZM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-6Z4QdXgWMr2sPOxp93XBcA-1; Thu,
 19 Jun 2025 06:38:13 -0400
X-MC-Unique: 6Z4QdXgWMr2sPOxp93XBcA-1
X-Mimecast-MFC-AGG-ID: 6Z4QdXgWMr2sPOxp93XBcA_1750329491
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 370041956094;
	Thu, 19 Jun 2025 10:38:10 +0000 (UTC)
Received: from localhost (unknown [10.72.112.28])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EEC4D1956094;
	Thu, 19 Jun 2025 10:38:06 +0000 (UTC)
Date: Thu, 19 Jun 2025 18:38:02 +0800
From: Baoquan He <bhe@redhat.com>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Kalesh Singh <kaleshsingh@google.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/28] mm, swap: check swap table directly for checking
 cache
Message-ID: <aFPoiuJcBGl2E3sh@MiWiFi-R3L-srv>
References: <20250514201729.48420-1-ryncsn@gmail.com>
 <20250514201729.48420-21-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514201729.48420-21-ryncsn@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 05/15/25 at 04:17am, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Instead of looking at the swap map, check swap table directly to tell if
> a swap entry has cache. Prepare for remove SWAP_HAS_CACHE.

But you actually check both the swap table entry and swap map entry in
this patch, or do I miss anything? 

E.g

if (!swap_count(si->swap_map[offset]) && swp_te_is_folio(swp_te))


> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/memory.c     | 12 +++++------
>  mm/swap.h       |  6 ++++++
>  mm/swap_state.c | 11 ++++++++++
>  mm/swapfile.c   | 54 +++++++++++++++++++++++--------------------------
>  4 files changed, 48 insertions(+), 35 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index a70624a55aa2..a9a548575e72 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4314,15 +4314,15 @@ static struct folio *__alloc_swap_folio(struct vm_fault *vmf)
>  }
>  
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -static inline int non_swapcache_batch(swp_entry_t entry, int max_nr)
> +static inline int non_swapcache_batch(swp_entry_t entry, unsigned int max_nr)
>  {
> -	struct swap_info_struct *si = swp_info(entry);
> -	pgoff_t offset = swp_offset(entry);
> -	int i;
> +	unsigned int i;
>  
>  	for (i = 0; i < max_nr; i++) {
> -		if ((si->swap_map[offset + i] & SWAP_HAS_CACHE))
> -			return i;
> +		/* Page table lock pins the swap entries / swap device */
> +		if (swap_cache_check_folio(entry))
> +			break;
> +		entry.val++;
>  	}
>  
>  	return i;
> diff --git a/mm/swap.h b/mm/swap.h
> index 467996dafbae..2ae4624a0e48 100644
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -186,6 +186,7 @@ static inline struct address_space *swap_address_space(swp_entry_t entry)
>  extern struct folio *swap_cache_get_folio(swp_entry_t entry);
>  extern struct folio *swap_cache_add_folio(swp_entry_t entry, struct folio *folio,
>  					  void **shadow, bool swapin);
> +extern bool swap_cache_check_folio(swp_entry_t entry);
>  extern void *swap_cache_get_shadow(swp_entry_t entry);
>  /* Below helpers requires the caller to lock the swap cluster. */
>  extern void __swap_cache_del_folio(swp_entry_t entry,
> @@ -395,6 +396,11 @@ static inline void *swap_cache_get_shadow(swp_entry_t end)
>  	return NULL;
>  }
>  
> +static inline bool swap_cache_check_folio(swp_entry_t entry)
> +{
> +	return false;
> +}
> +
>  static inline unsigned int folio_swap_flags(struct folio *folio)
>  {
>  	return 0;
> diff --git a/mm/swap_state.c b/mm/swap_state.c
> index c8bb16835612..ea6a1741db5c 100644
> --- a/mm/swap_state.c
> +++ b/mm/swap_state.c
> @@ -266,6 +266,17 @@ struct folio *swap_cache_get_folio(swp_entry_t entry)
>  	return folio;
>  }
>  
> +/*
> + * Check if a swap entry has folio cached, may return false positive.
> + * Caller must hold a reference of the swap device or pin it in other ways.
> + */
> +bool swap_cache_check_folio(swp_entry_t entry)
> +{
> +	swp_te_t swp_te;
> +	swp_te = __swap_table_get(swp_cluster(entry), swp_offset(entry));
> +	return swp_te_is_folio(swp_te);
> +}
> +
>  /*
>   * If we are the only user, then try to free up the swap cache.
>   *
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index ef233466725e..0f2a499ff2c9 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -181,15 +181,19 @@ static long swap_usage_in_pages(struct swap_info_struct *si)
>  #define TTRS_FULL		0x4
>  
>  static bool swap_only_has_cache(struct swap_info_struct *si,
> -			      unsigned long offset, int nr_pages)
> +				struct swap_cluster_info *ci,
> +				unsigned long offset, int nr_pages)
>  {
>  	unsigned char *map = si->swap_map + offset;
>  	unsigned char *map_end = map + nr_pages;
> +	swp_te_t entry;
>  
>  	do {
> +		entry = __swap_table_get(ci, offset);

entry is not used in swap_only_has_cache() in this patch.

>  		VM_BUG_ON(!(*map & SWAP_HAS_CACHE));
> -		if (*map != SWAP_HAS_CACHE)
> +		if (*map)
>  			return false;
> +		offset++;
>  	} while (++map < map_end);
>  
>  	return true;
......snip...

