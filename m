Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FFE1F418F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813729; cv=none; b=bVom/VB1oOcBJ7NZYf27G4gMM8lzl3KBWc3v90PLRZuR138qUx9j+BOYK+O1LT5d3RaD+KOJTkcJGcpClbFLFsNoRdmU3ESCrgixRmEjgWfYiPk4ryjKzH7UNVd/QDHaegjBDACFBaArcw6b+0dGE9gAgXSwBT3GkC96b80Y3UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813729; c=relaxed/simple;
	bh=4qgVGHPMXDyneGF39snKEVJ1NXiGqmBxx3L5XrYvkIQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RN3PvufNJKED6sHaAXgNfMIRGmYHeK85ZJvY+NR7kqC+XqmspBu+iOz8nF0MbYEsz5qmTKnKxwwOMPwa3WC5fEDqYTghG/+n2vromRGP9v411VGkbJnPK/IqXDhXCuUJL2VnjM7G7v8Y6VaTOzBt1Ezt9CJ56FLTXhkBHmGLyh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUndpJGW; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUndpJGW"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499659e669so8100309e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744813724; x=1745418524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3kyW/XsCpCzvhbHUFh2dTXvyn07Nk4P1pRXH/bo59qM=;
        b=GUndpJGWynQ7Z7P9mfmyCP0uqw9ec+MHkJXCmaa+YCfnciW98moGC5EDv0a4MKKZP+
         EkjZFstVaIc22dr2ikugHHHyyQoCCYtNI0y7VXynP/2lNc4bBSE/SVXEOimqK1WKc/bu
         06weCRls/gclIHu1AJMfxH/5ZGBv0qdyB9V5rWJJEmOBxUzQnHsJFv5gvY5UnAgauMa+
         YvYBK7NqS9pSYkgs9u6QhHVwv6iGeS2Qn0I+NdBek5857h02X8C1VvSAH0dPCX2jdTXc
         8JmwPKJW+b4GvBM6IkEMC1g6HoLszkwHGdPiS7gyzyNsXBemCeGwjOh9zoH6QUBakwEW
         DWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744813724; x=1745418524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kyW/XsCpCzvhbHUFh2dTXvyn07Nk4P1pRXH/bo59qM=;
        b=K1lVEng3LknRtY+QN5nuUYpwNVQtB6XLtlrUorLA8e5k3KNxowCOFkzf+yi/bUsuQD
         03oRDdZMCPBSF29L0508u5GET/BGPRpIQfIfKMVDbR7QTffe6A8ngSmCv5X1ezcrkYlt
         R8l0JjvIabLkxIgnEISxTT93AGPSrspTRtDQhLKPO6JdOe+dDl+4omDdGvX5dFZrd9cH
         VjFDNBEDE/6Tb8VI3GWtkqgPOYGI4ZL2/2Ay+vLWcAQom4yGOqOvRKRAZnkWk7vgaCpz
         eLPfaMu6DZcak9bzk5l8oX8xxXJWUF1E9vCG71exNPdpH5FK1smKMw2SeJGuSELjgSxp
         /a7g==
X-Forwarded-Encrypted: i=1; AJvYcCXxwDEoIKB1hG4SkS8X8OlOAECcP04wR9CDpmZcK4WF8PnIgjozBd69re14gCqS/IZrIMx1IHdoKDGU2+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxEAb94y1Dpgp6tlRh6sqECe58HrhrIsk9T8VtfDvLJRPLDMrA
	Pf5DJNBJGs5qxddSGPvq54Sdb8Va4AmboyhX9G+WqSoR570v7Yto
X-Gm-Gg: ASbGncs6pMniQUmr6M0MmLWmj+p6P2J+2yqLhsvIMf/a2X69GV5SQX2wN4084EV1LKh
	EE0lfFxpnDEKFz1YtsD3+MPjHBhItwUdEmSHYU+V2R3hdZsyy3Ko5LMMhG/hApIOZsE3u4v1fpx
	NapvfgqUK7URqzhXmWWkGnYA+zt1CUNw4z//vMN+W1l4pyDtooAMpY7Qvf5k/uaiA9Pqt48R0Hm
	l64OYO0cs/Eirwy/tVZVCMs3NEv1ieA4vS3DDHT4fmEsKtNsGs7sI5lk2AivqkZyb2eo7KxEtIr
	EKOnXhVpPJ2gTi2SATbAD9HlSgutTh/idtK+mvX5s8imeyqDuN4M3yH5iKjWHtgjftYg
X-Google-Smtp-Source: AGHT+IG1/FK8wn68GgtHVXwCCIRHOtuozJgWvmPbSfomD+QfGzJGIid2SP4QeeIOcnPu29qdAOxlqg==
X-Received: by 2002:a05:6512:2310:b0:545:8f0:e1a4 with SMTP id 2adb3069b0e04-54d64ae848fmr694308e87.45.1744813724162;
        Wed, 16 Apr 2025 07:28:44 -0700 (PDT)
Received: from pc636 (host-90-233-217-52.mobileonline.telia.com. [90.233.217.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d503d08sm1679026e87.135.2025.04.16.07.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 07:28:43 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 16 Apr 2025 16:28:41 +0200
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm/vmalloc.c: return explicit error value in
 alloc_vmap_area()
Message-ID: <Z_--mXGQwZHdqm8w@pc636>
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

On Tue, Apr 15, 2025 at 10:39:52AM +0800, Baoquan He wrote:
> In codes of alloc_vmap_area(), it returns the upper bound 'vend' to
> indicate if the allocation is successful or failed. That is not very clear.
> 
> Here change to return explicit error values and check them to judge if
> allocation is successful.
> 
> IS_ERR_VALUE already uses unlikely() internally
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
>
Not clear why you remove this WARN_ON by this patch. It should be
a separate patch or just keep it as is. The warning here can mean
that something is really wrong, especially if NOTHING_FIT. So we
definitely want the warning.

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
>
Just keep it as it was. No need to check if addr is valid or not.

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
Keep the comment.

> +		if ((unlikely(ret))) {
> +			WARN_ONCE(1, "%s error: errno (%d)\n", __func__, ret);
>  			goto recovery;
> +		}
>

--
Uladzislau Rezki
