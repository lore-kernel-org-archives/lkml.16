Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC31194AD5
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748573450; cv=none; b=dmJOswv8BTKUJjRGg87biA7lZR3v7D5eI6pQpS0TDpA7J8Cq6AT2c/PjF8aRNelndJ5YP7OWhLLpAlSzfGdYo8suYSUe6m9QNxuh0cnZMMdKWhtQePrVDdkzYX2dtsVxwarRlLQPQzGLgRKzyStYs4IoyQ46/hV2PpK4569RkKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748573450; c=relaxed/simple;
	bh=hRUaXp1v2L6zhTResUw4t1S9QKhL14tCPso7a8u3764=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBwa2POYKrjkvv1s1xxb+sx9JHe/abnvMGTKNcrpz+XlulmIP0y25J9TuMbfR+p1a5oskfY02YMPYDQ8kdrjpPZ3bgmozwNSG/Tc7jRIzujjsobIkT+3Xy13zTEdfWoPK7xTQzuA4gLjtUjjs/2HbdJIS3sRLPQrvwdlg/xfSQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=emNAroho; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="emNAroho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748573447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=44cKIolqH4V7UKsEdZUn1ZRKIHVEItoVbVOKtb7SFEo=;
	b=emNAroho58fkkTfWoRMhz13DZtOGKbwdWXj3Z8Z9YIHSHKRKR9TdRlI2Wy4HKBDreNkx6z
	ImyBTBeI/mnDUY8nFVrIFgtV+axR/jINWGnpqG6Q92DdhNPCPQb11jdpdYmbtxKxR7W4QW
	TXCaYEm4MtGpKK4BUwbmmVpcHl6mHOg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-494-_2YxOqyiPzubIcrKDzj5DA-1; Thu,
 29 May 2025 22:50:41 -0400
X-MC-Unique: _2YxOqyiPzubIcrKDzj5DA-1
X-Mimecast-MFC-AGG-ID: _2YxOqyiPzubIcrKDzj5DA_1748573440
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CBB011800772;
	Fri, 30 May 2025 02:50:39 +0000 (UTC)
Received: from localhost (unknown [10.72.112.13])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3AA4418003FC;
	Fri, 30 May 2025 02:50:37 +0000 (UTC)
Date: Fri, 30 May 2025 10:50:33 +0800
From: Baoquan He <bhe@redhat.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, hannes@cmpxchg.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mm: swap: correctly use maxpages in swapon syscall
 to avoid potensial deadloop
Message-ID: <aDkc+bdFbKLUFStl@MiWiFi-R3L-srv>
References: <20250522122554.12209-1-shikemeng@huaweicloud.com>
 <20250522122554.12209-3-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522122554.12209-3-shikemeng@huaweicloud.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 05/22/25 at 08:25pm, Kemeng Shi wrote:
> We use maxpages from read_swap_header() to initialize swap_info_struct,
> however the maxpages might be reduced in setup_swap_extents() and the
> si->max is assigned with the reduced maxpages from the
> setup_swap_extents().
> Obviously, this could lead to memory waste as we allocated memory based on
> larger maxpages, besides, this could lead to a potensial deadloop as
                                                 ^ typo, potential
> following:
> 1) When calling setup_clusters() with larger maxpages, unavailable pages
> within range [si->max, larger maxpages) are not accounted with
> inc_cluster_info_page(). As a result, these pages are assumed available
> but can not be allocated. The cluster contains these pages can be moved
> to frag_clusters list after it's all available pages were allocated.
> 2) When the cluster mentioned in 1) is the only cluster in frag_clusters
> list, cluster_alloc_swap_entry() assume order 0 allocation will never
> failed and will enter a deadloop by keep trying to allocate page from the
> only cluster in frag_clusters which contains no actually available page.
> 
> Call setup_swap_extents() to get the final maxpages before swap_info_struct
> initialization to fix the issue.
> 
> Fixes: 661383c6111a3 ("mm: swap: relaim the cached parts that got scanned")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
>  mm/swapfile.c | 47 ++++++++++++++++++++---------------------------
>  1 file changed, 20 insertions(+), 27 deletions(-)

Reviedwed-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 75b69213c2e7..a82f4ebefca3 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3141,43 +3141,30 @@ static unsigned long read_swap_header(struct swap_info_struct *si,
>  	return maxpages;
>  }
>  
> -static int setup_swap_map_and_extents(struct swap_info_struct *si,
> -					union swap_header *swap_header,
> -					unsigned char *swap_map,
> -					unsigned long maxpages,
> -					sector_t *span)
> +static int setup_swap_map(struct swap_info_struct *si,
> +			  union swap_header *swap_header,
> +			  unsigned char *swap_map,
> +			  unsigned long maxpages)
>  {
> -	unsigned int nr_good_pages;
>  	unsigned long i;
> -	int nr_extents;
> -
> -	nr_good_pages = maxpages - 1;	/* omit header page */
>  
> +	swap_map[0] = SWAP_MAP_BAD; /* omit header page */
>  	for (i = 0; i < swap_header->info.nr_badpages; i++) {
>  		unsigned int page_nr = swap_header->info.badpages[i];
>  		if (page_nr == 0 || page_nr > swap_header->info.last_page)
>  			return -EINVAL;
>  		if (page_nr < maxpages) {
>  			swap_map[page_nr] = SWAP_MAP_BAD;
> -			nr_good_pages--;
> +			si->pages--;
>  		}
>  	}
>  
> -	if (nr_good_pages) {
> -		swap_map[0] = SWAP_MAP_BAD;
> -		si->max = maxpages;
> -		si->pages = nr_good_pages;
> -		nr_extents = setup_swap_extents(si, span);
> -		if (nr_extents < 0)
> -			return nr_extents;
> -		nr_good_pages = si->pages;
> -	}
> -	if (!nr_good_pages) {
> +	if (!si->pages) {
>  		pr_warn("Empty swap-file\n");
>  		return -EINVAL;
>  	}
>  
> -	return nr_extents;
> +	return 0;
>  }
>  
>  #define SWAP_CLUSTER_INFO_COLS						\
> @@ -3217,7 +3204,7 @@ static struct swap_cluster_info *setup_clusters(struct swap_info_struct *si,
>  	 * Mark unusable pages as unavailable. The clusters aren't
>  	 * marked free yet, so no list operations are involved yet.
>  	 *
> -	 * See setup_swap_map_and_extents(): header page, bad pages,
> +	 * See setup_swap_map(): header page, bad pages,
>  	 * and the EOF part of the last cluster.
>  	 */
>  	inc_cluster_info_page(si, cluster_info, 0);
> @@ -3354,6 +3341,15 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
>  		goto bad_swap_unlock_inode;
>  	}
>  
> +	si->max = maxpages;
> +	si->pages = maxpages - 1;
> +	nr_extents = setup_swap_extents(si, &span);
> +	if (nr_extents < 0) {
> +		error = nr_extents;
> +		goto bad_swap_unlock_inode;
> +	}
> +	maxpages = si->max;
> +
>  	/* OK, set up the swap map and apply the bad block list */
>  	swap_map = vzalloc(maxpages);
>  	if (!swap_map) {
> @@ -3365,12 +3361,9 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
>  	if (error)
>  		goto bad_swap_unlock_inode;
>  
> -	nr_extents = setup_swap_map_and_extents(si, swap_header, swap_map,
> -						maxpages, &span);
> -	if (unlikely(nr_extents < 0)) {
> -		error = nr_extents;
> +	error = setup_swap_map(si, swap_header, swap_map, maxpages);
> +	if (error)
>  		goto bad_swap_unlock_inode;
> -	}
>  
>  	/*
>  	 * Use kvmalloc_array instead of bitmap_zalloc as the allocation order might
> -- 
> 2.30.0
> 

