Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB3623D289
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744757845; cv=none; b=OWjG0vLErm4h37Vnq7g1MY259wKtzlCM4Y8aoE4wmO/583FBC94TqfF2K6uzkCqAglrfTRF3g/mqFrQKgvCUZjGZoW3b/xqtNeyqZH+BFo8SnInDOFmKLChPldbmJdb7V/VUGqhmgTh/lVMGbWvPO7kN+lDtuForfT5nNo/EaAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744757845; c=relaxed/simple;
	bh=+mV9cH5j1SzYTzZ654jfm9qlKvxVb37/xmpcjxjIbmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZF0bFgQMX6mRvxBgkh13Lgb5nceAL/IeQxkKCPGA9cVpmVMwEJ3m6t4Arq/HlbQP6ANtzOP4MrrPeknJsZf3YMOdh+H8pe7dpi5WTS9ayw0j7w2l9C/mveSaQ4sOV761SWzRQL8VzBbk7dC7qlS9pyeL05DubiK/jNw5CjP14lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TrH3v79S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TrH3v79S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744757842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+OglgYexYugZXu41vChufYewPyQeurTO6N3dEewyRFY=;
	b=TrH3v79SIiZtAojUYTPW7WuSBP8xLg8Qz2v2ZQMn7La/1+8pysAl/7YU/paNC0W8331VMj
	hNufnTEf8OXzsOTkzzokyvTEqW/dVBjrAklhlqIE6pZ2iNshSERacaIovBR4driTzuVwiU
	1RDFGH0dW30m5+YBTZZtUdS1TqjmZ+g=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-424-NLlprDFjNEmzY8c1-goEyQ-1; Tue,
 15 Apr 2025 18:57:19 -0400
X-MC-Unique: NLlprDFjNEmzY8c1-goEyQ-1
X-Mimecast-MFC-AGG-ID: NLlprDFjNEmzY8c1-goEyQ_1744757838
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D08EB19560BC;
	Tue, 15 Apr 2025 22:57:17 +0000 (UTC)
Received: from localhost (unknown [10.72.112.38])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81937180B491;
	Tue, 15 Apr 2025 22:57:16 +0000 (UTC)
Date: Wed, 16 Apr 2025 06:57:07 +0800
From: Baoquan He <bhe@redhat.com>
To: Shivank Garg <shivankg@amd.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm/vmalloc.c: return explicit error value in
 alloc_vmap_area()
Message-ID: <Z/7kQ6Ajmd4uHnD5@MiWiFi-R3L-srv>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-6-bhe@redhat.com>
 <134bd404-d741-40ec-a661-f897da5ca9ca@amd.com>
 <Z/5Yv+iFmFPuFqvn@fedora>
 <1841f2e1-d677-4bb7-b449-78322e52f212@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1841f2e1-d677-4bb7-b449-78322e52f212@amd.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 04/16/25 at 12:30am, Shivank Garg wrote:
> 
> 
> On 4/15/2025 6:31 PM, Baoquan He wrote:
> > On 04/15/25 at 12:52pm, Shivank Garg wrote:
> >> On 4/15/2025 8:09 AM, Baoquan He wrote:
> >>> In codes of alloc_vmap_area(), it returns the upper bound 'vend' to
> >>> indicate if the allocation is successful or failed. That is not very clear.
> >>>
> >>> Here change to return explicit error values and check them to judge if
> >>> allocation is successful.
> >>>
> >>> IS_ERR_VALUE already uses unlikely() internally
> >>>
> >>> Signed-off-by: Baoquan He <bhe@redhat.com>
> >>> ---
> >>>  mm/vmalloc.c | 34 +++++++++++++++++-----------------
> >>>  1 file changed, 17 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> >>> index 3f38a232663b..5b21cd09b2b4 100644
> >>> --- a/mm/vmalloc.c
> >>> +++ b/mm/vmalloc.c
> >>> @@ -1715,7 +1715,7 @@ va_clip(struct rb_root *root, struct list_head *head,
> >>>  			 */
> >>>  			lva = kmem_cache_alloc(vmap_area_cachep, GFP_NOWAIT);
> >>>  			if (!lva)
> >>> -				return -1;
> >>> +				return -ENOMEM;
> >>>  		}
> >>>  
> >>>  		/*
> >>> @@ -1729,7 +1729,7 @@ va_clip(struct rb_root *root, struct list_head *head,
> >>>  		 */
> >>>  		va->va_start = nva_start_addr + size;
> >>>  	} else {
> >>> -		return -1;
> >>> +		return -EINVAL;
> >>>  	}
> > 
> > Thanks for reviewing.
> > 
> >>
> >> Braces around return -EINVAL seem unnecessary.
> >> They can be dropped.
> > 
> > This complys with the codeing style required in 3) Placing Braces and
> > Spaces of Documentation/process/coding-style.rst because other branches
> > are multiple statements.
> > 
> >>
> >>>  
> >>>  	if (type != FL_FIT_TYPE) {
> >>> @@ -1758,19 +1758,19 @@ va_alloc(struct vmap_area *va,
> >>>  
> >>>  	/* Check the "vend" restriction. */
> >>>  	if (nva_start_addr + size > vend)
> >>> -		return vend;
> >>> +		return -ERANGE;
> >>>  
> >>>  	/* Update the free vmap_area. */
> >>>  	ret = va_clip(root, head, va, nva_start_addr, size);
> >>> -	if (WARN_ON_ONCE(ret))
> >>> -		return vend;
> >>> +	if (ret)
> >>> +		return ret;
> >>
> >> Is it safe to remove the warning, or was it critical for debugging?
> > 
> > This comes from a reported concern because va_clip() could be failed by 
> > NOTHING_FIT or kmem_cache_alloc failure. The warning here could cause
> > confusion misleading people to think vmap area management is failed.
> > 
> >>
> >>>  
> >>>  	return nva_start_addr;
> >>>  }
> >>>  
> >>>  /*
> >>>   * Returns a start address of the newly allocated area, if success.
> >>> - * Otherwise a vend is returned that indicates failure.
> >>> + * Otherwise an error value is returned that indicates failure.
> >>>   */
> >>>  static __always_inline unsigned long
> >>>  __alloc_vmap_area(struct rb_root *root, struct list_head *head,
> >>> @@ -1795,14 +1795,13 @@ __alloc_vmap_area(struct rb_root *root, struct list_head *head,
> >>>  
> >>>  	va = find_vmap_lowest_match(root, size, align, vstart, adjust_search_size);
> >>>  	if (unlikely(!va))
> >>> -		return vend;
> >>> +		return -ENOENT;
> >>>  
> >>>  	nva_start_addr = va_alloc(va, root, head, size, align, vstart, vend);
> >>> -	if (nva_start_addr == vend)
> >>> -		return vend;
> >>>  
> >>>  #if DEBUG_AUGMENT_LOWEST_MATCH_CHECK
> >>> -	find_vmap_lowest_match_check(root, head, size, align);
> >>> +	if (!IS_ERR_VALUE(nva_start_addr))
> >>> +		find_vmap_lowest_match_check(root, head, size, align);
> >>>  #endif
> >>>  
> >>>  	return nva_start_addr;
> >>> @@ -1932,7 +1931,7 @@ node_alloc(unsigned long size, unsigned long align,
> >>>  	struct vmap_area *va;
> >>>  
> >>>  	*vn_id = 0;
> >>> -	*addr = vend;
> >>> +	*addr = -EINVAL;
> >>>  
> >>>  	/*
> >>>  	 * Fallback to a global heap if not vmalloc or there
> >>> @@ -2012,20 +2011,20 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
> >>>  	}
> >>>  
> >>>  retry:
> >>> -	if (addr == vend) {
> >>> +	if (IS_ERR_VALUE(addr)) {
> >>>  		preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, node);
> >>>  		addr = __alloc_vmap_area(&free_vmap_area_root, &free_vmap_area_list,
> >>>  			size, align, vstart, vend);
> >>>  		spin_unlock(&free_vmap_area_lock);
> >>>  	}
> >>>  
> >>> -	trace_alloc_vmap_area(addr, size, align, vstart, vend, addr == vend);
> >>> +	trace_alloc_vmap_area(addr, size, align, vstart, vend, IS_ERR_VALUE(addr));
> >>>  
> >>>  	/*
> >>> -	 * If an allocation fails, the "vend" address is
> >>> +	 * If an allocation fails, the error value is
> >>>  	 * returned. Therefore trigger the overflow path.
> >>>  	 */
> >>> -	if (unlikely(addr == vend))
> >>> +	if (IS_ERR_VALUE(addr))
> >>>  		goto overflow;
> >>>  
> >>>  	va->va_start = addr;
> >>> @@ -4753,9 +4752,10 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
> >>>  
> >>>  		ret = va_clip(&free_vmap_area_root,
> >>>  			&free_vmap_area_list, va, start, size);
> >>> -		if (WARN_ON_ONCE(unlikely(ret)))
> >>> -			/* It is a BUG(), but trigger recovery instead. */
> >>> +		if ((unlikely(ret))) {
> >> 		    ^^		   ^^
> >> The extra parentheses are redundant and can be removed for clarity.
> > 
> > You are right, I will remove it. Thanks.
> > 
> 
> Please feel free to add following in next version.
> 
> Reviewed-by: Shivank Garg <shivankg@amd.com>
> Tested-by: Shivank Garg <shivankg@amd.com>

Thanks a lot for your careful reviewing and testing.

> 
> >>
> >>> +			WARN_ONCE(1, "%s error: errno (%d)\n", __func__, ret);
> >>>  			goto recovery;
> >>> +		}
> >>>  
> >>>  		/* Allocated area. */
> >>>  		va = vas[area];
> >>
> > 
> 

