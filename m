Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3156DCE1;
	Tue, 24 Jun 2025 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766560; cv=none; b=ly0i9nJFYBxDBstiQWahOarrjHMGApwq+wM6KMm8/IGSdclsmVZxD71ctBi08U9ubTU7JGlnO8hab+1QkItt/IkTH24NWPY2IOgFi7i3Ne3a410EeWJGQ7heV9WQ7gPi9Br9ekcSRx2CUGS8+4sJ5KmPKTmu9OjdymdC21HS8/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766560; c=relaxed/simple;
	bh=U1Hu5rsHICzCXGa11a8UpkkdlZ2n8t9EMRki4Vc+0GE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFkrECvVnLEc+0DwSHFV6j6ZD0LgU35PCF9lcX0vE7SPxnBQl6Omgn5wp3V38YSqCum8jDThTs3vnWz3S5aYHJFB2tIlBOpkYb0Tng88zun3gaPaxwmglRNyXWzMLTwND1E3VF/CdtZuASmVKDUaUF0yXKFlfkDAIqNg9cK6HBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sw1Yzu7i; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sw1Yzu7i"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b165c80cso332546e87.2;
        Tue, 24 Jun 2025 05:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750766555; x=1751371355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVb0KvDdPDxou4fHmBqqaIsVtBopt9+TQ0k6Zh3nVRE=;
        b=Sw1Yzu7iIoxZeKtEXGyRgXnX4rx3NYzmEkczpwLU5GaNxJEvZEIna63FhSHIidYHan
         50w4JJZYwlCHgkaaEU3+/bYu/rAvX2WpEjN4+w2Ws2XUIvZ9hE2ceCLZZUJ4Y4qhILUR
         AX3HNP/QrUHxgiVJwbWjTUOsrGNcJ/7FrzT/XX/39YO595P6rSuTNYSPXChFBmMUFinA
         ys4pZ4Vze3KrJ1O2bvQcIXlixCGfqve4OWO5LUk8IM0ps5ffSQJnE67YLXOmhTfHOhNs
         4M8/P2G5IgdxJQSGpGayTQaYFm0EW5Y4ey242F9wnhsQDZVg4uUVv/Fps1mq6g5Ad/u6
         Xf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750766555; x=1751371355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVb0KvDdPDxou4fHmBqqaIsVtBopt9+TQ0k6Zh3nVRE=;
        b=veGvA6K4wB4LkPUjr5iduiRbkYwOHHGIumBWwE3EtZqqsZsW9hQrdiueA8W1A+WHAO
         5G+P2snWc3HWH2JamoDh7X+TboXRAxSw2nyz22AY85pOTyEx+0EuW+6Ke/NU8gnWgdIr
         P4nR3NpC1EpH63Pt9fG8pmIPQgzO8et/d2Xlk/IG4OpPGTN5gT+GKGIAZwPtde3Q8ycd
         9YPqhA1/e7QXw0cFZpqyFhCZotXN2EDnsSbxF+O3WtEM67DSXFVe4tpaRMQPGLaVtsaY
         tKnhC8ocmj49PXKWH+Hqx8hOqaFtCm33KP9qogmdCLwTHl6Q3vZnNjmmbB7Y+XYK6JYE
         2L8A==
X-Forwarded-Encrypted: i=1; AJvYcCUES3v4R6aqF4YUQj2auBa8TwZOj4VvdvZG0iLAJcpWUcuqDdwwMyjFdqNSMTKQqY2obdoswLZck7tN/EQ=@vger.kernel.org, AJvYcCW61I8WOj71oWwnzrY2hztE4kNTazaP3Re7rP9C2I+IJQBDBgiOs1Qvua/Z2ezO0GaPM62SxG2ISYf1zEN1ap0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiZMVgqg2ver5chiFDfGOzEFYRcmCL8wnS+WKfAnVZ2gPL2eRl
	pVtIEZ56cN8xk3EkcVMN/vIFFMbtmgFJD4lRaM8xYBDMn1BqHIh7IF4NWRjmJthh
X-Gm-Gg: ASbGnctoq3gOePNj7kO7kdQUbe6+0rNTEAUi/DvMSgwPG/reYCnD7t3GN93gdbbx7VU
	CKgRKU+kb6/ZrXFRIUKpE5/Zja24xFLPhwbwadmI5GJ6bQve7vvuX/PuDK+7aB2q6pTPuxVL0X1
	fKZ0oAzg2F5zC4cdU8ZCdBzVe3OAXQ2kSPu7BZy2W2FiSNuYVsf63qWi248tDQ5jZW4STMdPHhR
	p/h5ED1VRIktMNee/GMJbSl1Caxtuuu/lwYOFGGX9MolupXRSrDU2qpo1XNwZXNRuLW1U274iFp
	QqvJZq9yyg7J1bhqOqJJTl1BayAFLCB8wNmfIrUIsWxSGAgqozWHlwv2mNwGbB5zlYo2A0wkE3E
	ZW8PKs8Rr7Us=
X-Google-Smtp-Source: AGHT+IFrLQz9ivI2vQ0wFljSIZucFOHmGpeRLQq9Egx2A6aWSvCsaFo5LFDJ2HVTYf3Q1opEGOYdUg==
X-Received: by 2002:a05:6512:e9f:b0:553:2e90:98b4 with SMTP id 2adb3069b0e04-553e3baff85mr5409224e87.17.1750766554620;
        Tue, 24 Jun 2025 05:02:34 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c2f69sm1801814e87.150.2025.06.24.05.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:02:33 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 24 Jun 2025 14:02:30 +0200
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: allow to set node and align in vrealloc
Message-ID: <aFqT1mK7SYsYd3DZ@pc636>
References: <20250624095121.3243540-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624095121.3243540-1-vitaly.wool@konsulko.se>

On Tue, Jun 24, 2025 at 11:51:21AM +0200, Vitaly Wool wrote:
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
>  mm/vmalloc.c            | 16 +++++++++++++---
>  2 files changed, 18 insertions(+), 6 deletions(-)
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
Do we have users which require alignment and nid? I see that it is part
of kvrealloc() API only.

--
Uladzislau Rezki
