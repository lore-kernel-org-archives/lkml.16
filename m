Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFD21B4153
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906677; cv=none; b=O0l6r7b9oBjWt/JxfvMyDYbHdx25g/YaQVN15J6tTKA0DBiu7Dr3hnJNHHHNwVEquy73ikzdT7FxTk6kbzGOWwSysoat6Q7sSE7/K+JGwccT2IwPrTmTohXfCbX8oGY75m9wsssNY6M178UOVIHRaWpRz/A++WLYbMMEdKqrRd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906677; c=relaxed/simple;
	bh=dPeOh37/KvBdmNXeg9JCFPJaMqjFM/+HdNT8gTbVIBQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqwfhVRRBruozvS73mOuhUxdxco0TkCWnRD81ORd2GrteEB2nkR0p7qgm2vpMFlsshG0nOLLJUfMG7ve9NvLwyuC2357FfIo73W5zVzPncyUnlBO5acqOVcrRRzWc0Oob0qEOAmdENABceDuSPE3Xm54meSkHHZGvc5zhnb4G44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKB/pyP6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKB/pyP6"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso1234875e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744906674; x=1745511474; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aawqGQA7h7mWtnCzcBvSH6Tpe/FpQ6KN3oVwrmoliu8=;
        b=QKB/pyP6Mb1Qu8h5swRXGqNsicIMlhsNxY1c5xLZHhzDmVRPbF9OO2IHxJHVutVQQR
         vLuyok7KIFcOCT+fU7YxHdl8/NqWWeNrAOlhrfd7Y8hXI91Sa8SqYGvcsKr7+fGzW1My
         56dvB5RMorrlXvsJiEBq3Lu3HelQFKgrVO3+fmeuELqwapaQ8TBDk9HwlThxDX0nAWeS
         20VI600ExU6NJ6eZEA4GXTDV69PblJ5FJlzu3zNLsj6ULgKQzKECywCPZlSIB7xFouKO
         AzewyGNXXhoJHsvBqL0t2R/RxkJtzWyEfxAM1FfP73NdI/JyL9u4Naog488MQEUKPIR6
         o7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906674; x=1745511474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aawqGQA7h7mWtnCzcBvSH6Tpe/FpQ6KN3oVwrmoliu8=;
        b=X1Kaj1YTZwkDXjyNwqHM1lZo+AbdqZXPBsR9ERvJaOSQX6PL/kkzBbDRhqgoe0K7Eo
         ApSrMxt8bdFPyxVHnFK1WFRZH9t3VnBeji46lUORCGWDaU5/OmBte7DDoV/SeyzFF8M7
         7ex2WbFkZLbTNDc+mU4gPU8FrFJwNgQfyTQXQDIerwEeAA0zFY+jf/RZZ7OyTY58xTHu
         xa/OQtxXuaau8OswgsRBhgLI7MWBgjRr4oFFGgXZcq5vdKE0lsN041JZSAbyFf/5kl8w
         ya/kmwpjXPxGx/yYCeUZM+J1kF+SshCAsTTRl059XNo+Bb+ctOtoTmobshbnBStAMwEC
         HsLw==
X-Forwarded-Encrypted: i=1; AJvYcCXiefZW9AfhuvXApjXlrAF725dVtaDjEOuhBn+i0YhM2t8LjeA+fvNQ6eRnRA6zAyVjgMLf+DfYOwcKk9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEE6jxiAhZYsMKlIMwG4Y+6FOhkPh/Qm8zMERYtpuTVYaCrvrZ
	u8XtdiHqXAOUfLGWXNTw4mF7+rP0EVMrbkB8MfYGtG0zFBWaZNC7
X-Gm-Gg: ASbGncvN9Af4JfAX0iQ1LBO/aK06nd2ypJs1VNELHfjsi8soLqcVKm+P3w3cfZLtz1M
	zdVYNB/YCxY3A9g3PPnY89aQ+8X7ZTC5sM+H4kpqrTZLk04CeIv2xAD9RD2GIxSw0CNSneiOc/S
	RXFmpFkrsuKX/wTOW5NSbSAkaHcOmhTERdwJRBE4XHb41fop8PVEXRLVJbp80czImMirHHNkm7n
	QSyUuMqnt2lYZAOvK9o2wd5p3vzY4ZRpaB6nbWKWIKspNpsu99xRMPFNpc1y6lSjnqNUe6ftapK
	JZ+xSLIAaLxI0gTfYQsNEQInvIH5+x5GVyK4GJDIM9R57xPbAecA2QCxd7NhPgRpw6vb
X-Google-Smtp-Source: AGHT+IFw/cc14IFO9UCiR2xFD24fmph4C2vk2h0k2LliVIja/hNbA0EyNQRDigh7xH1Kf3h3LI54Pg==
X-Received: by 2002:a05:6512:a8d:b0:549:9044:94b3 with SMTP id 2adb3069b0e04-54d64ab0c71mr2050136e87.29.1744906673833;
        Thu, 17 Apr 2025 09:17:53 -0700 (PDT)
Received: from pc636 (host-90-233-217-52.mobileonline.telia.com. [90.233.217.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6dfa1d1esm2066e87.174.2025.04.17.09.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:17:53 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 17 Apr 2025 18:17:51 +0200
To: Baoquan He <bhe@redhat.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm/vmalloc.c: return explicit error value in
 alloc_vmap_area()
Message-ID: <aAEpryR3d4OmlFIk@pc636>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-6-bhe@redhat.com>
 <Z_--mXGQwZHdqm8w@pc636>
 <aABvLrUdWcLcQO9z@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aABvLrUdWcLcQO9z@MiWiFi-R3L-srv>

On Thu, Apr 17, 2025 at 11:02:06AM +0800, Baoquan He wrote:
> On 04/16/25 at 04:28pm, Uladzislau Rezki wrote:
> > On Tue, Apr 15, 2025 at 10:39:52AM +0800, Baoquan He wrote:
> > > In codes of alloc_vmap_area(), it returns the upper bound 'vend' to
> > > indicate if the allocation is successful or failed. That is not very clear.
> > > 
> > > Here change to return explicit error values and check them to judge if
> > > allocation is successful.
> > > 
> > > IS_ERR_VALUE already uses unlikely() internally
> > > 
> > > Signed-off-by: Baoquan He <bhe@redhat.com>
> > > ---
> > >  mm/vmalloc.c | 34 +++++++++++++++++-----------------
> > >  1 file changed, 17 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 3f38a232663b..5b21cd09b2b4 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -1715,7 +1715,7 @@ va_clip(struct rb_root *root, struct list_head *head,
> > >  			 */
> > >  			lva = kmem_cache_alloc(vmap_area_cachep, GFP_NOWAIT);
> > >  			if (!lva)
> > > -				return -1;
> > > +				return -ENOMEM;
> > >  		}
> > >  
> > >  		/*
> > > @@ -1729,7 +1729,7 @@ va_clip(struct rb_root *root, struct list_head *head,
> > >  		 */
> > >  		va->va_start = nva_start_addr + size;
> > >  	} else {
> > > -		return -1;
> > > +		return -EINVAL;
> > >  	}
> > >  
> > >  	if (type != FL_FIT_TYPE) {
> > > @@ -1758,19 +1758,19 @@ va_alloc(struct vmap_area *va,
> > >  
> > >  	/* Check the "vend" restriction. */
> > >  	if (nva_start_addr + size > vend)
> > > -		return vend;
> > > +		return -ERANGE;
> > >  
> > >  	/* Update the free vmap_area. */
> > >  	ret = va_clip(root, head, va, nva_start_addr, size);
> > > -	if (WARN_ON_ONCE(ret))
> > > -		return vend;
> > >
> > Not clear why you remove this WARN_ON by this patch. It should be
> > a separate patch or just keep it as is. The warning here can mean
> > that something is really wrong, especially if NOTHING_FIT. So we
> > definitely want the warning.
> 
> I remember one time someone reported that the slab allocation failure
> triggered this warning which is confusing to them. But yes, it should be
> discussed in a separate post or thread, not appropriate to remove it
> silently. I will add it back in v2.
> 
Thanks!

> > 
> > > +	if (ret)
> > > +		return ret;
> > >  
> > >  	return nva_start_addr;
> > >  }
> > >  
> > >  /*
> > >   * Returns a start address of the newly allocated area, if success.
> > > - * Otherwise a vend is returned that indicates failure.
> > > + * Otherwise an error value is returned that indicates failure.
> > >   */
> > >  static __always_inline unsigned long
> > >  __alloc_vmap_area(struct rb_root *root, struct list_head *head,
> > > @@ -1795,14 +1795,13 @@ __alloc_vmap_area(struct rb_root *root, struct list_head *head,
> > >  
> > >  	va = find_vmap_lowest_match(root, size, align, vstart, adjust_search_size);
> > >  	if (unlikely(!va))
> > > -		return vend;
> > > +		return -ENOENT;
> > >  
> > >  	nva_start_addr = va_alloc(va, root, head, size, align, vstart, vend);
> > > -	if (nva_start_addr == vend)
> > > -		return vend;
> > >  
> > >  #if DEBUG_AUGMENT_LOWEST_MATCH_CHECK
> > > -	find_vmap_lowest_match_check(root, head, size, align);
> > > +	if (!IS_ERR_VALUE(nva_start_addr))
> > >
> > Just keep it as it was. No need to check if addr is valid or not.
> 
> This is to keep consistent with the old code. Before this patch, if
> va_alloc() return vend, it returns directly, no
> find_vmap_lowest_match_check() invocation is done. I tried to keep the
> behaviour unchanged. That code is for debugging, both is fine to me.
> 
Ack. Makes sense to keep same behaviour as it was/is.

> > 
> > > +		find_vmap_lowest_match_check(root, head, size, align);
> > >  #endif
> > >  
> > >  	return nva_start_addr;
> > > @@ -1932,7 +1931,7 @@ node_alloc(unsigned long size, unsigned long align,
> > >  	struct vmap_area *va;
> > >  
> > >  	*vn_id = 0;
> > > -	*addr = vend;
> > > +	*addr = -EINVAL;
> > >  
> > >  	/*
> > >  	 * Fallback to a global heap if not vmalloc or there
> > > @@ -2012,20 +2011,20 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
> > >  	}
> > >  
> > >  retry:
> > > -	if (addr == vend) {
> > > +	if (IS_ERR_VALUE(addr)) {
> > >  		preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, node);
> > >  		addr = __alloc_vmap_area(&free_vmap_area_root, &free_vmap_area_list,
> > >  			size, align, vstart, vend);
> > >  		spin_unlock(&free_vmap_area_lock);
> > >  	}
> > >  
> > > -	trace_alloc_vmap_area(addr, size, align, vstart, vend, addr == vend);
> > > +	trace_alloc_vmap_area(addr, size, align, vstart, vend, IS_ERR_VALUE(addr));
> > >  
> > >  	/*
> > > -	 * If an allocation fails, the "vend" address is
> > > +	 * If an allocation fails, the error value is
> > >  	 * returned. Therefore trigger the overflow path.
> > >  	 */
> > > -	if (unlikely(addr == vend))
> > > +	if (IS_ERR_VALUE(addr))
> > >  		goto overflow;
> > >  
> > >  	va->va_start = addr;
> > > @@ -4753,9 +4752,10 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
> > >  
> > >  		ret = va_clip(&free_vmap_area_root,
> > >  			&free_vmap_area_list, va, start, size);
> > > -		if (WARN_ON_ONCE(unlikely(ret)))
> > > -			/* It is a BUG(), but trigger recovery instead. */
> > Keep the comment.
> 
> OK, will add it back.
> 
Thank you.

--
Uladzislau Rezki
