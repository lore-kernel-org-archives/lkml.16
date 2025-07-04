Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8760C2EE96F;
	Fri,  4 Jul 2025 10:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623866; cv=none; b=gZAhsV7pt3bnQbxKMkrX1yNVoPTqsHHN3PwCIDBpE9QiyFdkaAvLRvmDY0zbQuCT+0M03QK4nAGbe3EN2QFvDFHJ2tdYw9YRGPH5vLPC9PDBmQQjBDpHxKEwsyQPSDNMHv80Tgwq8+vPDBqrq85CC0lznAg/oHzs/Tznfv0PODE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623866; c=relaxed/simple;
	bh=vpOW6eWpnMOvFjCRArTBEY2dAsyhhAeZds1DtDRWzFo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdqN33JrVk5LdePjU42NP7sWcOhMQ4+DUpzPQNnpJNXcY4Hcz96FJ80Pl1M38acav+q3aR01WDTx1UJO10d9O71YJc8wSUe+8pBVWsqeXaa2xuZzuoe5W7nd6vAMg/GbOInCtMSS8LUeLgyTxWAG6a5x3pak+MmbC5cVDYlPNCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVCxfwuT; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVCxfwuT"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553dceb342fso800438e87.0;
        Fri, 04 Jul 2025 03:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751623863; x=1752228663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6hFh51BLuZwCFkzcHxtYDUVh7kL90TvhT7DOkfO+fT4=;
        b=AVCxfwuT6TMOCWmfni5pLytlkhquHL4hTL3tkbzForkwm/W1+khK1ilSKf+sHAsCVt
         MIrYxa5+heyEJZ9gWgpgbN72LMOP/CmRo39zldE/+WpORQQ4T/IMv7OX6aumNtdIpKsO
         JzHJ5k9AalQ+TltbF1ouDF6H/UJIMyvZlsgBSBu5t3Z1MYYDXOwB7QQbDJgNOB7VVw3w
         VheQ/CBnigt5wtePzL0VvQvwlTonrC3TxNwnGT4je3d3cJvI2Y1r8885eyhWqj5h9soT
         NApIlIFtBbj3yOavbtg7b/wG52MtMGHn5nC53H7TIf2GTBQ6wlUPIwjPR9e4d6Vv40uB
         rEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751623863; x=1752228663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hFh51BLuZwCFkzcHxtYDUVh7kL90TvhT7DOkfO+fT4=;
        b=uThStsKdUCW6KJedmfQxlW8hYjIeHX7rRrGJh7kVqwYTeUwnP6vZ3wC9FW4QEF1QjW
         KTLI7ZyX6jvuvEgge8vAI0OwvJFyuQqF7mfxrZEhyXsjOxCobAqRUZMr5J0BKzIewwpi
         fbF+pVly1mlIEvYI2R5JIDFug9l+ojT1J+gVkzEIBkafQIzg+v4AJvChBiJ2BHjDHppM
         OFfqsbOcpN3hZLmwfJFh/J8TzruuwK4NOk1QXPvmbRC274qh7GmVstIiRS0XRFUiGiD1
         wE7oqwVg5fMfKs+Cicx3VUyJCiy4hzCo0nk5aeQMqVlCekx4y4d0JgMLNBnuzFhy/0lS
         KXMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4ztmL3gDQcxpP/tQbltE1qJrmPhhyRCLlB2tle/Wdgq0sgiHvYpnC5urEjITJwlFuv9GweJX+dsFDCeo=@vger.kernel.org, AJvYcCX2X9ywdloOoRmh3lJevanZkGA5wJb/25GKKTMLeAjIVCEj3Inky21SoAjVa3RlYsuFBHnxd1C1mqLVb4qqo9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeiqwEl72mXNjsYvzWDipfqgN+9r5MwYy4gkTRqBYZMkvWrYMx
	QJzNe2frllU04cG/uC3EU1nyv719HvWydH3COr5EQ09uMBRU27TajO3e
X-Gm-Gg: ASbGncuWVOjXDgKbYJGEFuZ7tjluWp5JQOuzEq1j85n9xqZq0nWZGSHBrJR1xFLBg+o
	ji9klevnUCVjRXvE6HHt3HJCElbnBEywgvV9KoOm/mPpHjWfFh/H80ocL59sizIEZt9hGEXjMk9
	fKNVTRV/7X4k1H6x3j1I3Z8cMkKEHCIC2M83dG7HKHDoIisPwrP0oSyK/JLXQCF+wAVW1oAoX6f
	nZ/ghUkcAX9fS4KywiP9rXwI1GwOTjhZrpT8TH1VXfQ+FJF211zoBSxJHgRQ/ZEfp1OMnFPeYJw
	fBHSNw7dFiysysMEQePD0OPh8IIngwC6B+i0UjwDkF39/tszNQFiwT884nGg1D/PLWRTcWPZCk/
	lw0UikJUHLxb+XA==
X-Google-Smtp-Source: AGHT+IEPipxgigrzCJYt18EpBU6h7oYOkJ72QENXkAwAV5zTFI/u66qor5gv6Sk3B2jTSy9z5DRvrg==
X-Received: by 2002:a05:6512:3b1f:b0:553:a469:3fed with SMTP id 2adb3069b0e04-556dc2653b3mr561385e87.11.1751623862368;
        Fri, 04 Jul 2025 03:11:02 -0700 (PDT)
Received: from pc636 (host-78-77-210-196.mobileonline.telia.com. [78.77.210.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b83a3sm209662e87.199.2025.07.04.03.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 03:11:01 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 4 Jul 2025 12:10:59 +0200
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v10 1/4] mm/vmalloc: allow to set node and align in
 vrealloc
Message-ID: <aGeos0WWKEdjmhQr@pc636>
References: <20250702160758.3609992-1-vitaly.wool@konsulko.se>
 <20250702160824.3610055-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702160824.3610055-1-vitaly.wool@konsulko.se>

On Wed, Jul 02, 2025 at 06:08:24PM +0200, Vitaly Wool wrote:
> Reimplement vrealloc() to be able to set node and alignment should
> a user need to do so. Rename the function to vrealloc_node_align()
> to better match what it actually does now and introduce macros for
> vrealloc() and friends for backward compatibility.
> 
> With that change we also provide the ability for the Rust part of
> the kernel to set node and alignment in its allocations.
> 
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> ---
>  include/linux/vmalloc.h | 12 +++++++++---
>  mm/nommu.c              |  3 ++-
>  mm/vmalloc.c            | 28 +++++++++++++++++++++++-----
>  3 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index fdc9aeb74a44..68791f7cb3ba 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -197,9 +197,15 @@ extern void *__vcalloc_noprof(size_t n, size_t size, gfp_t flags) __alloc_size(1
>  extern void *vcalloc_noprof(size_t n, size_t size) __alloc_size(1, 2);
>  #define vcalloc(...)		alloc_hooks(vcalloc_noprof(__VA_ARGS__))
>  
> -void * __must_check vrealloc_noprof(const void *p, size_t size, gfp_t flags)
> -		__realloc_size(2);
> -#define vrealloc(...)		alloc_hooks(vrealloc_noprof(__VA_ARGS__))
> +void *__must_check vrealloc_node_align_noprof(const void *p, size_t size,
> +		unsigned long align, gfp_t flags, int nid) __realloc_size(2);
> +#define vrealloc_node_noprof(_p, _s, _f, _nid)	\
> +	vrealloc_node_align_noprof(_p, _s, 1, _f, _nid)
> +#define vrealloc_noprof(_p, _s, _f)		\
> +	vrealloc_node_align_noprof(_p, _s, 1, _f, NUMA_NO_NODE)
> +#define vrealloc_node_align(...)		alloc_hooks(vrealloc_node_align_noprof(__VA_ARGS__))
> +#define vrealloc_node(...)			alloc_hooks(vrealloc_node_noprof(__VA_ARGS__))
> +#define vrealloc(...)				alloc_hooks(vrealloc_noprof(__VA_ARGS__))
>  
>  extern void vfree(const void *addr);
>  extern void vfree_atomic(const void *addr);
> diff --git a/mm/nommu.c b/mm/nommu.c
> index 87e1acab0d64..8359b2025b9f 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -119,7 +119,8 @@ void *__vmalloc_noprof(unsigned long size, gfp_t gfp_mask)
>  }
>  EXPORT_SYMBOL(__vmalloc_noprof);
>  
> -void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
> +void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align,
> +				 gfp_t flags, int node)
>  {
>  	return krealloc_noprof(p, size, (flags | __GFP_COMP) & ~__GFP_HIGHMEM);
>  }
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6dbcdceecae1..412664656870 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4089,13 +4089,22 @@ void *vzalloc_node_noprof(unsigned long size, int node)
>  EXPORT_SYMBOL(vzalloc_node_noprof);
>  
>  /**
> - * vrealloc - reallocate virtually contiguous memory; contents remain unchanged
> + * vrealloc_node_align_noprof - reallocate virtually contiguous memory; contents
> + * remain unchanged
>   * @p: object to reallocate memory for
>   * @size: the size to reallocate
> + * @align: requested alignment
>   * @flags: the flags for the page level allocator
> + * @nid: node number of the target node
> + *
> + * If @p is %NULL, vrealloc_XXX() behaves exactly like vmalloc(). If @size is
> + * 0 and @p is not a %NULL pointer, the object pointed to is freed.
>   *
> - * If @p is %NULL, vrealloc() behaves exactly like vmalloc(). If @size is 0 and
> - * @p is not a %NULL pointer, the object pointed to is freed.
> + * if @nid is not NUMA_NO_NODE, this function will try to allocate memory on
> + * the given node. If reallocation is not necessary (e. g. the new size is less
> + * than the current allocated size), the current allocation will be preserved
> + * unless __GFP_THISNODE is set. In the latter case a new allocation on the
> + * requested node will be attempted.
>   *
>   * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
>   * initial memory allocation, every subsequent call to this API for the same
> @@ -4111,7 +4120,8 @@ EXPORT_SYMBOL(vzalloc_node_noprof);
>   * Return: pointer to the allocated memory; %NULL if @size is zero or in case of
>   *         failure
>   */
> -void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
> +void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align,
> +				 gfp_t flags, int nid)
>  {
>  	struct vm_struct *vm = NULL;
>  	size_t alloced_size = 0;
> @@ -4135,6 +4145,12 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
>  		if (WARN(alloced_size < old_size,
>  			 "vrealloc() has mismatched area vs requested sizes (%p)\n", p))
>  			return NULL;
> +		if (WARN(!IS_ALIGNED((unsigned long)p, align),
> +			 "will not reallocate with a bigger alignment (0x%lx)\n", align))
> +			return NULL;
> +		if (unlikely(flags & __GFP_THISNODE) && nid != NUMA_NO_NODE &&
> +			     nid != page_to_nid(vmalloc_to_page(p)))
> +			goto need_realloc;
>  	}
>  
>  	/*
> @@ -4165,8 +4181,10 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
>  		return (void *)p;
>  	}
>  
> +need_realloc:
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
This one LGTM. Let's see what folk think about SLUB changes. We need to
be aligned with naming and approach on both sides.

Reviewed-by: "Uladzislau Rezki (Sony)" <urezki@gmail.com>

--
Uladzislau Rezki
