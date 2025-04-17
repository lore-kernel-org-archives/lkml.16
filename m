Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD63EAE7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 03:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744858941; cv=none; b=dn6TIounJZQs2NFtJVAWpN9dWOv3GuiS2nN5eA26zJBrIX3P/e44kjDpkt7iIMR9rVXIX4kTouOrdjQk8WVuVsCwYTetwesVTdzmyrIzhd1f8KewcyaOH7in+Fv5MjY3sZgojQ6zKHtrd3W0xEXGLf2cH6e48zS10DSCFjqx8kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744858941; c=relaxed/simple;
	bh=MvZUt0ebFjlJFJpgqTFcbco2i5jw139SS8bPGEKB6cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umwLmPu3g4jYbLOMrNImHmB6CQOHqtPn/NFSYaANMuQYEtrTmOmCtMG79bOe+Wlgb1/brQ0+65Dv9xGz8cB+bUHmAvNdEC6DPVXeK8N3NmGIsUrW12v7xKHbNTZwiulo/5XS2dlOKmixkV7QsCz3y48YRG88HhTwRXJybjg4D9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fZl15HB+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fZl15HB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744858934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=16YmuC3sgspoT6YKMWDqzrc6wPyEVf4AYJx2YXCwu28=;
	b=fZl15HB+NkNOeRk47TaS40rEbDaFyik0DkvrFGInoY+ysX15u6iqXFiXWJchX5oWHTQBtN
	59wwfFOTM+IaHTutcFMGwTC+H9rJd4XJujsYLgmrJ0cG+YAIXlrWQy9IQHM/DhA/5Ym862
	jzD9rlbsDXPeUxhhXWBcv79Z5O8a5oE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-170-KfAJNOJhP9quv3iiYW9kIQ-1; Wed,
 16 Apr 2025 23:02:13 -0400
X-MC-Unique: KfAJNOJhP9quv3iiYW9kIQ-1
X-Mimecast-MFC-AGG-ID: KfAJNOJhP9quv3iiYW9kIQ_1744858932
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DC62D1956088;
	Thu, 17 Apr 2025 03:02:11 +0000 (UTC)
Received: from localhost (unknown [10.72.112.38])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 900DB19560B8;
	Thu, 17 Apr 2025 03:02:10 +0000 (UTC)
Date: Thu, 17 Apr 2025 11:02:06 +0800
From: Baoquan He <bhe@redhat.com>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm/vmalloc.c: return explicit error value in
 alloc_vmap_area()
Message-ID: <aABvLrUdWcLcQO9z@MiWiFi-R3L-srv>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-6-bhe@redhat.com>
 <Z_--mXGQwZHdqm8w@pc636>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_--mXGQwZHdqm8w@pc636>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 04/16/25 at 04:28pm, Uladzislau Rezki wrote:
> On Tue, Apr 15, 2025 at 10:39:52AM +0800, Baoquan He wrote:
> > In codes of alloc_vmap_area(), it returns the upper bound 'vend' to
> > indicate if the allocation is successful or failed. That is not very clear.
> > 
> > Here change to return explicit error values and check them to judge if
> > allocation is successful.
> > 
> > IS_ERR_VALUE already uses unlikely() internally
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  mm/vmalloc.c | 34 +++++++++++++++++-----------------
> >  1 file changed, 17 insertions(+), 17 deletions(-)
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 3f38a232663b..5b21cd09b2b4 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -1715,7 +1715,7 @@ va_clip(struct rb_root *root, struct list_head *head,
> >  			 */
> >  			lva = kmem_cache_alloc(vmap_area_cachep, GFP_NOWAIT);
> >  			if (!lva)
> > -				return -1;
> > +				return -ENOMEM;
> >  		}
> >  
> >  		/*
> > @@ -1729,7 +1729,7 @@ va_clip(struct rb_root *root, struct list_head *head,
> >  		 */
> >  		va->va_start = nva_start_addr + size;
> >  	} else {
> > -		return -1;
> > +		return -EINVAL;
> >  	}
> >  
> >  	if (type != FL_FIT_TYPE) {
> > @@ -1758,19 +1758,19 @@ va_alloc(struct vmap_area *va,
> >  
> >  	/* Check the "vend" restriction. */
> >  	if (nva_start_addr + size > vend)
> > -		return vend;
> > +		return -ERANGE;
> >  
> >  	/* Update the free vmap_area. */
> >  	ret = va_clip(root, head, va, nva_start_addr, size);
> > -	if (WARN_ON_ONCE(ret))
> > -		return vend;
> >
> Not clear why you remove this WARN_ON by this patch. It should be
> a separate patch or just keep it as is. The warning here can mean
> that something is really wrong, especially if NOTHING_FIT. So we
> definitely want the warning.

I remember one time someone reported that the slab allocation failure
triggered this warning which is confusing to them. But yes, it should be
discussed in a separate post or thread, not appropriate to remove it
silently. I will add it back in v2.

> 
> > +	if (ret)
> > +		return ret;
> >  
> >  	return nva_start_addr;
> >  }
> >  
> >  /*
> >   * Returns a start address of the newly allocated area, if success.
> > - * Otherwise a vend is returned that indicates failure.
> > + * Otherwise an error value is returned that indicates failure.
> >   */
> >  static __always_inline unsigned long
> >  __alloc_vmap_area(struct rb_root *root, struct list_head *head,
> > @@ -1795,14 +1795,13 @@ __alloc_vmap_area(struct rb_root *root, struct list_head *head,
> >  
> >  	va = find_vmap_lowest_match(root, size, align, vstart, adjust_search_size);
> >  	if (unlikely(!va))
> > -		return vend;
> > +		return -ENOENT;
> >  
> >  	nva_start_addr = va_alloc(va, root, head, size, align, vstart, vend);
> > -	if (nva_start_addr == vend)
> > -		return vend;
> >  
> >  #if DEBUG_AUGMENT_LOWEST_MATCH_CHECK
> > -	find_vmap_lowest_match_check(root, head, size, align);
> > +	if (!IS_ERR_VALUE(nva_start_addr))
> >
> Just keep it as it was. No need to check if addr is valid or not.

This is to keep consistent with the old code. Before this patch, if
va_alloc() return vend, it returns directly, no
find_vmap_lowest_match_check() invocation is done. I tried to keep the
behaviour unchanged. That code is for debugging, both is fine to me.

> 
> > +		find_vmap_lowest_match_check(root, head, size, align);
> >  #endif
> >  
> >  	return nva_start_addr;
> > @@ -1932,7 +1931,7 @@ node_alloc(unsigned long size, unsigned long align,
> >  	struct vmap_area *va;
> >  
> >  	*vn_id = 0;
> > -	*addr = vend;
> > +	*addr = -EINVAL;
> >  
> >  	/*
> >  	 * Fallback to a global heap if not vmalloc or there
> > @@ -2012,20 +2011,20 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
> >  	}
> >  
> >  retry:
> > -	if (addr == vend) {
> > +	if (IS_ERR_VALUE(addr)) {
> >  		preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, node);
> >  		addr = __alloc_vmap_area(&free_vmap_area_root, &free_vmap_area_list,
> >  			size, align, vstart, vend);
> >  		spin_unlock(&free_vmap_area_lock);
> >  	}
> >  
> > -	trace_alloc_vmap_area(addr, size, align, vstart, vend, addr == vend);
> > +	trace_alloc_vmap_area(addr, size, align, vstart, vend, IS_ERR_VALUE(addr));
> >  
> >  	/*
> > -	 * If an allocation fails, the "vend" address is
> > +	 * If an allocation fails, the error value is
> >  	 * returned. Therefore trigger the overflow path.
> >  	 */
> > -	if (unlikely(addr == vend))
> > +	if (IS_ERR_VALUE(addr))
> >  		goto overflow;
> >  
> >  	va->va_start = addr;
> > @@ -4753,9 +4752,10 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
> >  
> >  		ret = va_clip(&free_vmap_area_root,
> >  			&free_vmap_area_list, va, start, size);
> > -		if (WARN_ON_ONCE(unlikely(ret)))
> > -			/* It is a BUG(), but trigger recovery instead. */
> Keep the comment.

OK, will add it back.

> 
> > +		if ((unlikely(ret))) {
> > +			WARN_ONCE(1, "%s error: errno (%d)\n", __func__, ret);
> >  			goto recovery;
> > +		}
> >
> 
> --
> Uladzislau Rezki
> 

