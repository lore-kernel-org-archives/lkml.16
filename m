Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0592750EC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744699487; cv=none; b=gAeqkZax7O1/Ww6wujyhVS0JlcfbmEVMA4Od34Y3+J6dmw1HtKLK0Zp2rvXqgnnISZO3xr0Qn4SPiadVQdtQRcjt07TOkddPZybGF98FTo+C7gX1xfE011yIwOJDpXbEG6M77iBwp6Djj7KKgN5llfSsR86pTaLdl5ujWN6Dvn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744699487; c=relaxed/simple;
	bh=tPEz55PQ9rXlr2hf1Exf91Zz3e31R+9I5onFcqtQOA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6EM6zpJV5OkJnxr52v0t0t0RMOalSsFz9NhIuKrV6+OzC8qWi8LaEk3k5l4AFj/Oq8k+o7Z0cUP92mevI0RGw0DNhSNLAXjy7XggyE9M8tp0NVsOAOyw2rfm4MAVnd7lj6qBsSzSNg6AM8tQCH+zAcWg8FlniBxhQRtC0WvcAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F0YP+kRX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F0YP+kRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744699482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SutGNxLhkdu4G6mctAW9YWzgG+lju1obYh/lVOUIxqc=;
	b=F0YP+kRX128tp0u2j1YBkpVDxdJfYvpuo+bfRWkgmsbUo2o4Zn6Hyz7VQSU4LkcnPss4mZ
	6beSfKg2tOeEhS0EZWys1KhR4Au1lXvD7ngMPy6iLIRE0gCRz7elcJVQpoYFiiBBnRqGow
	ndRRDkV6wZTqb0Is4zS8X2jDeu4xWUY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-141-gw7uLWJdOj-6ft0pGCtvow-1; Tue,
 15 Apr 2025 02:44:41 -0400
X-MC-Unique: gw7uLWJdOj-6ft0pGCtvow-1
X-Mimecast-MFC-AGG-ID: gw7uLWJdOj-6ft0pGCtvow_1744699479
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E113A1800361;
	Tue, 15 Apr 2025 06:44:38 +0000 (UTC)
Received: from localhost (unknown [10.72.112.37])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 96BEC19560AD;
	Tue, 15 Apr 2025 06:44:37 +0000 (UTC)
Date: Tue, 15 Apr 2025 14:44:33 +0800
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm/vmalloc.c: return explicit error value in
 alloc_vmap_area()
Message-ID: <Z/4AUTZTmohbzgqC@MiWiFi-R3L-srv>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-6-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415023952.27850-6-bhe@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 04/15/25 at 10:39am, Baoquan He wrote:
> In codes of alloc_vmap_area(), it returns the upper bound 'vend' to
> indicate if the allocation is successful or failed. That is not very clear.
> 
> Here change to return explicit error values and check them to judge if
> allocation is successful.
> 

> IS_ERR_VALUE already uses unlikely() internally
  ^^^^^^^^^
Sorry, above line was added mistakenly in log draft, should be removed.

> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/vmalloc.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3f38a232663b..5b21cd09b2b4 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -1715,7 +1715,7 @@ va_clip(struct rb_root *root, struct list_head *head,
>  			 */
>  			lva = kmem_cache_alloc(vmap_area_cachep, GFP_NOWAIT);
>  			if (!lva)
> -				return -1;
> +				return -ENOMEM;
>  		}
>  
>  		/*
> @@ -1729,7 +1729,7 @@ va_clip(struct rb_root *root, struct list_head *head,
>  		 */
>  		va->va_start = nva_start_addr + size;
>  	} else {
> -		return -1;
> +		return -EINVAL;
>  	}
>  
>  	if (type != FL_FIT_TYPE) {
> @@ -1758,19 +1758,19 @@ va_alloc(struct vmap_area *va,
>  
>  	/* Check the "vend" restriction. */
>  	if (nva_start_addr + size > vend)
> -		return vend;
> +		return -ERANGE;
>  
>  	/* Update the free vmap_area. */
>  	ret = va_clip(root, head, va, nva_start_addr, size);
> -	if (WARN_ON_ONCE(ret))
> -		return vend;
> +	if (ret)
> +		return ret;
>  
>  	return nva_start_addr;
>  }
>  
>  /*
>   * Returns a start address of the newly allocated area, if success.
> - * Otherwise a vend is returned that indicates failure.
> + * Otherwise an error value is returned that indicates failure.
>   */
>  static __always_inline unsigned long
>  __alloc_vmap_area(struct rb_root *root, struct list_head *head,
> @@ -1795,14 +1795,13 @@ __alloc_vmap_area(struct rb_root *root, struct list_head *head,
>  
>  	va = find_vmap_lowest_match(root, size, align, vstart, adjust_search_size);
>  	if (unlikely(!va))
> -		return vend;
> +		return -ENOENT;
>  
>  	nva_start_addr = va_alloc(va, root, head, size, align, vstart, vend);
> -	if (nva_start_addr == vend)
> -		return vend;
>  
>  #if DEBUG_AUGMENT_LOWEST_MATCH_CHECK
> -	find_vmap_lowest_match_check(root, head, size, align);
> +	if (!IS_ERR_VALUE(nva_start_addr))
> +		find_vmap_lowest_match_check(root, head, size, align);
>  #endif
>  
>  	return nva_start_addr;
> @@ -1932,7 +1931,7 @@ node_alloc(unsigned long size, unsigned long align,
>  	struct vmap_area *va;
>  
>  	*vn_id = 0;
> -	*addr = vend;
> +	*addr = -EINVAL;
>  
>  	/*
>  	 * Fallback to a global heap if not vmalloc or there
> @@ -2012,20 +2011,20 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
>  	}
>  
>  retry:
> -	if (addr == vend) {
> +	if (IS_ERR_VALUE(addr)) {
>  		preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, node);
>  		addr = __alloc_vmap_area(&free_vmap_area_root, &free_vmap_area_list,
>  			size, align, vstart, vend);
>  		spin_unlock(&free_vmap_area_lock);
>  	}
>  
> -	trace_alloc_vmap_area(addr, size, align, vstart, vend, addr == vend);
> +	trace_alloc_vmap_area(addr, size, align, vstart, vend, IS_ERR_VALUE(addr));
>  
>  	/*
> -	 * If an allocation fails, the "vend" address is
> +	 * If an allocation fails, the error value is
>  	 * returned. Therefore trigger the overflow path.
>  	 */
> -	if (unlikely(addr == vend))
> +	if (IS_ERR_VALUE(addr))
>  		goto overflow;
>  
>  	va->va_start = addr;
> @@ -4753,9 +4752,10 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>  
>  		ret = va_clip(&free_vmap_area_root,
>  			&free_vmap_area_list, va, start, size);
> -		if (WARN_ON_ONCE(unlikely(ret)))
> -			/* It is a BUG(), but trigger recovery instead. */
> +		if ((unlikely(ret))) {
> +			WARN_ONCE(1, "%s error: errno (%d)\n", __func__, ret);
>  			goto recovery;
> +		}
>  
>  		/* Allocated area. */
>  		va = vas[area];
> -- 
> 2.41.0
> 

