Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD141A5B8F;
	Wed, 25 Jun 2025 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845488; cv=none; b=mTsg5G2z+sG+rZvfz+XxrRsQ7qnQ7luuIA2yp5dgZmYj6TeGD9KKxv0h3jXBK8En1x9GNk3acDR5QhVT7nVYKtwmD8C8R7OPDBj99gpGuBKYeBah6MQeo8KiOIpeFb3KUL4ySrhz4XNkjXWRR+5Q7u5O1MnGsNG2xVuL31PNnNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845488; c=relaxed/simple;
	bh=4bYHH2ckGWZi+/IpOXEWm6BznFypofWTt6cDpc4A+ss=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIv8McGr9AyvznWYTIrvoaaPNYgpQ69cbmvyrJcuxeGnXKu8ZIUYLUA4H2CnsYPQtX4RqhVbrpumCkn+kMG4p3SYQbV++eLvyPvWClbT3OYbb2wRxukpm+3TaIjE6rPqz4zWkH4KHsjzzI/5sbu7v9Y6gfzMFwCCVhrBQ7PYtbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzvETCmT; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzvETCmT"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso16480521fa.3;
        Wed, 25 Jun 2025 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845485; x=1751450285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/npfTZitxQengKYWb557F20/C27QpY8KDAC6He/PIuw=;
        b=gzvETCmTZQhHMtmjHyUW0S2zVsOirHTb66ASSPuA6P8HKXAHlCXLeC/9T/2EoNUTei
         EoffO7vEDRxxD7kQuJp892zgXP7B4AaZgKfkr5YQzDkzkn1f1vA5jX4TYjLYu5wvukVv
         GljehHH4LdKEQkef24236LTOR9pUuNi8seYu0nxJqHnX3umTYdReMhW5byj2ITfHuyDj
         ajP5QGvygaTfmqGrDCGKQ9c/3kCQ3QxKLJwBt75XRAZ7mYdvf0EvMmKvj+BJnhffXXp1
         3/xz6W1td7pYKf54mpXVty9mvyej8zJzCiPRMVMBQk2QzMnfqvK3NR7VhcjHvQEurLSq
         1rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845485; x=1751450285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/npfTZitxQengKYWb557F20/C27QpY8KDAC6He/PIuw=;
        b=NAdyXqXJWy96HCvCdanvFMJmh9KfsQwTgWU5H7NiePnZOCTKkB+M8LNEOerqiPPKex
         jq5z4eVLsi8AXklb9S4hxUVdy15UrSSLC+HpofbSI3ptjIvNC/knz88WeB/IRLNPXUhM
         HVd/6RaazivQ5ioqOq4k8dYczvqUMRLLTMgJSErwNoUxYzzg5AmMnzUJCmA/OMheLJQz
         5IGjGLRcASaQ381GnFxVFAmaqsncMA6PCAKNOYS8eyZg0h3uYFzr5XLzRwe/AM6OxCbr
         bqJzNLj5LwBmBwdmuZneupPDl1jL4RsHV0pxn5e5zXvS2pJ26ZIyubWumFNnUsxt99B6
         XXWA==
X-Forwarded-Encrypted: i=1; AJvYcCXSNkH/wPOwnVXRyR7Tnk2/MCU+9mle3wW6PLtdfTu/BQqnANmY+3huNNb8N+xOvnhPVJWTTK5Yk0HS/Mg=@vger.kernel.org, AJvYcCXm/Ho3XG1R5HQT/3kpkAWDhA15gfJfe2vafUqwUNIo45lPxKsJo/UmQyeHakYwBeBEKbERvF5WLa8Ln+tKLPU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/WUBUDoIB582pgeavjxs3rGdcjZ2tYBqoDCloBkhA0UTS6YDi
	dnPSLgwQ+18XApqQM7ipefcfT5BjdWvTvIM0i6xVl/Jcn/H+FmfLQbUF
X-Gm-Gg: ASbGncsF9ZwPss91wyhGTmbv6UEr25q3RjsW1fcvwnrixtQiw1Og/ufMQKK5sAAhVQL
	SwJGAFxh6vRLZJP1UXY2Xq4hVPLquH7ieKlthMnPSHC2VFfCqAfwzS/0twfszzxsskcmVaDeY5z
	B112AtmAaPRaGo1gxqb+SeXARWR1hOI4VYiv3zJo+ZNUE+4DPLol2Jhzr9TDqKw956T65YJEqFy
	euthtNZhS7K2BHfl6xpMrRyZq61INZRGd/afH8lmGMkB9vap3i7A4moHGRmEyiF8QpPEgQkaXK9
	RWkXcm6bca9DAcYNpTjeOGjOPPyrkWssUwI62lFAQI2F6dG2dMsLc18wk9seQK1ez0rjrC4U89L
	yL+EQVq7HjDo=
X-Google-Smtp-Source: AGHT+IEuUl0LPKYIwxBVpX0GsbU51O5maIG7RCvFUWc1QTpSlMeggPoilMZieami+WVdxey7n6oTZg==
X-Received: by 2002:a2e:bc1c:0:b0:32b:719f:1260 with SMTP id 38308e7fff4ca-32cc64b7cadmr6937511fa.9.1750845484907;
        Wed, 25 Jun 2025 02:58:04 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f794adsm19232261fa.26.2025.06.25.02.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:58:04 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 25 Jun 2025 11:58:02 +0200
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mm/vmalloc: allow to set node and align in
 vrealloc
Message-ID: <aFvIKosePUZfsEyF@pc636>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
 <20250625063013.3379896-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625063013.3379896-1-vitaly.wool@konsulko.se>

On Wed, Jun 25, 2025 at 08:30:13AM +0200, Vitaly Wool wrote:
> Reimplement vrealloc() to be able to set node and alignment should
> a user need to do so. Rename the function to vrealloc_node() to
> better match what it actually does now and introduce a macro for
> vrealloc() for backward compatibility.
> 
> With that change we also provide the ability for the Rust part of
> the kernel to set node and aligmnent in its allocations.
> 
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> ---
>  include/linux/vmalloc.h |  8 +++++---
>  mm/nommu.c              |  3 ++-
>  mm/vmalloc.c            | 16 +++++++++++++---
>  3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index fdc9aeb74a44..7d5251287687 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -197,9 +197,11 @@ extern void *__vcalloc_noprof(size_t n, size_t size, gfp_t flags) __alloc_size(1
>  extern void *vcalloc_noprof(size_t n, size_t size) __alloc_size(1, 2);
>  #define vcalloc(...)		alloc_hooks(vcalloc_noprof(__VA_ARGS__))
>  
> -void * __must_check vrealloc_noprof(const void *p, size_t size, gfp_t flags)
> -		__realloc_size(2);
> -#define vrealloc(...)		alloc_hooks(vrealloc_noprof(__VA_ARGS__))
> +void *__must_check vrealloc_node_noprof(const void *p, size_t size,
> +		unsigned long align, gfp_t flags, int nid) __realloc_size(2);
> +#define vrealloc_noprof(p, s, f)	vrealloc_node_noprof(p, s, 1, f, NUMA_NO_NODE)
> +#define vrealloc_node(...)		alloc_hooks(vrealloc_node_noprof(__VA_ARGS__))
> +#define vrealloc(...)			alloc_hooks(vrealloc_noprof(__VA_ARGS__))
>  
>  extern void vfree(const void *addr);
>  extern void vfree_atomic(const void *addr);
> diff --git a/mm/nommu.c b/mm/nommu.c
> index b624acec6d2e..ae240115607f 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -119,7 +119,8 @@ void *__vmalloc_noprof(unsigned long size, gfp_t gfp_mask)
>  }
>  EXPORT_SYMBOL(__vmalloc_noprof);
>  
> -void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
> +void *vrealloc_node_noprof(const void *p, size_t size, unsigned long align,
> +			   gfp_t flags, int nid)
>  {
>  	return krealloc_noprof(p, size, (flags | __GFP_COMP) & ~__GFP_HIGHMEM);
>  }
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index ab986dd09b6a..117894301db1 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4081,10 +4081,12 @@ void *vzalloc_node_noprof(unsigned long size, int node)
>  EXPORT_SYMBOL(vzalloc_node_noprof);
>  
>  /**
> - * vrealloc - reallocate virtually contiguous memory; contents remain unchanged
> + * vrealloc_node - reallocate virtually contiguous memory; contents remain unchanged
>   * @p: object to reallocate memory for
>   * @size: the size to reallocate
> + * @align: requested alignment
>   * @flags: the flags for the page level allocator
> + * @nid: node id
>   *
>   * If @p is %NULL, vrealloc() behaves exactly like vmalloc(). If @size is 0 and
>   * @p is not a %NULL pointer, the object pointed to is freed.
> @@ -4103,7 +4105,7 @@ EXPORT_SYMBOL(vzalloc_node_noprof);
>   * Return: pointer to the allocated memory; %NULL if @size is zero or in case of
>   *         failure
>   */
> -void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
> +void *vrealloc_node_noprof(const void *p, size_t size, unsigned long align, gfp_t flags, int nid)
>  {
>  	struct vm_struct *vm = NULL;
>  	size_t alloced_size = 0;
> @@ -4127,6 +4129,13 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
>  		if (WARN(alloced_size < old_size,
>  			 "vrealloc() has mismatched area vs requested sizes (%p)\n", p))
>  			return NULL;
> +		if (WARN(nid != NUMA_NO_NODE && nid != page_to_nid(vmalloc_to_page(p)),
> +			 "vrealloc() has mismatched nids\n"))
> +			return NULL;
> +		if (WARN((uintptr_t)p & (align - 1),
> +			 "will not reallocate with a bigger alignment (0x%lx)\n",
> +			 align))
> +			return NULL;
>  	}
>  
>  	/*
> @@ -4158,7 +4167,8 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
>  	}
>  
>  	/* TODO: Grow the vm_area, i.e. allocate and map additional pages. */
> -	n = __vmalloc_noprof(size, flags);
> +	n = __vmalloc_node_noprof(size, align, flags, nid, __builtin_return_address(0));
> +
>  	if (!n)
>  		return NULL;
>  
> -- 
> 2.39.2
> 
Reviewed-by: "Uladzislau Rezki (Sony)" <urezki@gmail.com>

--
Uladzislau Rezki
