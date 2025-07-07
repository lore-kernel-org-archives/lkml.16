Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1286A27A452
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751872389; cv=none; b=MgJZroHQV/xJ2oE9F3ID+tk9zLLn8Mo7ZVUvQ7rA+j4LZWupxTyyfIIrqJaqTEhGnZMoFPjQdUKm7MAa2bd4ZcsTQJxG+B7CVXSFvVqEB3acs24w4McfvijTn0NRJj4fLkNsJA9RwoxjaEzeYYMaFEM//eW9DFj5nzse45WmqBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751872389; c=relaxed/simple;
	bh=6qeH0zOkkNSBiv3Vp+8ktn2dhsncuPPdxni58BHtNyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVmIn/kajuSgRa4h/NvdpVLEVYKhdzhsLFqS5k3RO51wL3b4tqFFpnVydNy2TrbK/WRdm8ew1gSUi97vVQ4F2AS65Ks+JjBUT8bpj88vwDdFIhUwSE7fSOHzCFSVJ6luNDlI7aRShj7+30GnP7SZVB2qkdn1BYQwjIlEUJYUK2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G1tkOot5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="G1tkOot5"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45310223677so17079405e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751872385; x=1752477185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JD+KiT4FtkyyerWMkVRBua38h0IytD72AbLemM5udpo=;
        b=G1tkOot5z65Fl6oriTk3OUOladqehmmfF9iA7aGJl7Wn7F8cUAM7aeNvCJCgZ3bJ+i
         JIF7+OEAEzVWTxhUAQrd5EH8lp7mdISp+EQ9h52iF61+MZV+xI7o3MsYxLxhIOpcMfr4
         VmOV4oH3FzjTQQJ2VccdfGNzLO0I4RXrC34kQthgKRhcokgeswXXk+p1L28qG76aWXY5
         P9swXLgiVf/dwVEUkPOnNo6L2fy+KnJX5gEqvq3KwVjD5U3efuL0g+wBNlsNSYVHKXmG
         J7gTcFhcCt+UDacm4ProzPZRne3GT7AzW1esm+QXctl7rr+Xc3hUREmize5Oxr/ivrF4
         Z/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751872385; x=1752477185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JD+KiT4FtkyyerWMkVRBua38h0IytD72AbLemM5udpo=;
        b=eHk+1UOJFnlQuCQDMTMPdRfcTXMjHi+7Rcd58LFC7VO6M5f/i35f8bxuWqwquRx8Mc
         LEBYMjS+QSP8JEHs0tXGouRtuJ/ZYJb9Q+fzLQnAVgbCt1dmP1r0Yc6JeMjlLHUcA7uI
         a9T7OekRILCynFTk84nrhFhN9zBgsjj9u85zPNtDeEK3iZOU2ZherqQ/olX/kzgIgKut
         7lUoNM30h7bxhCDQG4Lb9rLu3/izgpvSHFFIUdzgtK9nPVIqyiD9oASmjntJqKLJkuD8
         /+oxMFGmCBFybmOSwJzI/egWTwvUzVszNmJJM9TFClFapFSjG9Ln+8P6cOTJnTD3JEOA
         0bTA==
X-Forwarded-Encrypted: i=1; AJvYcCVqFMfFMNNT/ZbusL6atPhmrsPxOakyIiw2RyYiktt+wWq6hv6fz4w+4il4RMR+ohlGnyfZVrk0LOOetf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaQ/pf4aIJDH+sXX2jpsl8API/6krNXDglw2IS9bGT5aIxq6rN
	ROT1J00didX8mBof6ur0NsZyOHnNwXSybKlP7CILCQiEvDsH4huoSn6dKErsDZn/cjA=
X-Gm-Gg: ASbGncux4qFhQdiNNXe3G09jZwkYbVlbWTDYV8te0eGPUuDp3pnbvqHd7b3EERnmHD6
	2ztdcH0tg15q2+5l+sSolRz7egcP3nBW8w4RuO1CFgo7H2qryjiIPacNX2Zgjp2ugaUQfmulJ8X
	NFua+Ghi0+ZH2YCo95/KdNa3WU/lydHKGVsRC5dcZs5vr3PSsNwKmJZ1GDoRs1RWCfsU1mEmpwG
	yRTCjtoNHcUDr5acJe1QbC7YRww/pes9H0W8u/Orfsfa0yikE2tei5wfvLbhwDRGBJTwl1XjlcA
	DDXHGaqtpGsSaO8RzDJ3DHInSd9Mgdu82ttEk/nTaFVgh2J13FGXr2FconTDEl67J/TnQVrXW5Y
	5WCZRvr3RoQ==
X-Google-Smtp-Source: AGHT+IFsLt272vV06ptARJ2oT9fvp3AfYVUmVEbm+og3dVym4WCkiSPG7XgA962/8Uj17ANw8ZWrRQ==
X-Received: by 2002:a05:600c:a108:b0:442:f4d4:522 with SMTP id 5b1f17b1804b1-454b6a9534bmr62703415e9.5.1751872385129;
        Mon, 07 Jul 2025 00:13:05 -0700 (PDT)
Received: from localhost (109-81-17-167.rct.o2.cz. [109.81.17.167])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47030bd90sm9419344f8f.15.2025.07.07.00.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:13:04 -0700 (PDT)
Date: Mon, 7 Jul 2025 09:13:04 +0200
From: Michal Hocko <mhocko@suse.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>
Subject: Re: [RFC 6/7] mm/vmalloc: Support non-blocking GFP flags in
 __vmalloc_area_node()
Message-ID: <aGtzgOXdhAAOTBhs@tiehlicka>
References: <20250704152537.55724-1-urezki@gmail.com>
 <20250704152537.55724-7-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704152537.55724-7-urezki@gmail.com>

On Fri 04-07-25 17:25:36, Uladzislau Rezki wrote:
> This patch makes __vmalloc_area_node() to correctly handle non-blocking
> allocation requests, such as GFP_ATOMIC and GFP_NOWAIT. Main changes:
> 
> - nested_gfp flag follows the same non-blocking constraints
>   as the primary gfp_mask, ensuring consistency and avoiding
>   sleeping allocations in atomic contexts.
> 
> - if blocking is not allowed, __GFP_NOFAIL is forcibly cleared
>   and warning is issued if it was set, since __GFP_NOFAIL is
>   incompatible with non-blocking contexts;
> 
> - Add a __GFP_HIGHMEM to gfp_mask only for blocking requests
>   if there are no DMA constraints.
> 
> - in non-blocking mode we use memalloc_noreclaim_save/restore()
>   to prevent reclaim related operations that may sleep while
>   setting up page tables or mapping pages.
> 
> This is particularly important for page table allocations that
> internally use GFP_PGTABLE_KERNEL, which may sleep unless such
> scope restrictions are applied. For example:
> 
> <snip>
>     #define GFP_PGTABLE_KERNEL (GFP_KERNEL | __GFP_ZERO)
> 
>     __pte_alloc_kernel()
>         pte_alloc_one_kernel(&init_mm);
>             pagetable_alloc_noprof(GFP_PGTABLE_KERNEL & ~__GFP_HIGHMEM, 0);
> <snip>

The changelog doesn't explain the actual implementation and that is
really crucial here. You rely on memalloc_noreclaim_save (i.e.
PF_MEMALLOC) to never trigger memory reclaim but you are not explaining
how do you prevent from the biggest caveat of this interface. Let me
quote the documentation
 * Users of this scope have to be extremely careful to not deplete the reserves
 * completely and implement a throttling mechanism which controls the
 * consumption of the reserve based on the amount of freed memory. Usage of a
 * pre-allocated pool (e.g. mempool) should be always considered before using
 * this scope.

Unless I am missing something _any_ vmalloc(GFP_NOWAIT|GFP_ATOMIC) user
would get practically unbound access to the whole available memory. This
is not really acceptable.

> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  mm/vmalloc.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 2eaff0575a9e..fe1699e01e02 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3711,7 +3711,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>  				 pgprot_t prot, unsigned int page_shift,
>  				 int node)
>  {
> -	const gfp_t nested_gfp = (gfp_mask & GFP_RECLAIM_MASK) | __GFP_ZERO;
> +	gfp_t nested_gfp = (gfp_mask & GFP_RECLAIM_MASK) | __GFP_ZERO;
>  	bool nofail = gfp_mask & __GFP_NOFAIL;
>  	unsigned long addr = (unsigned long)area->addr;
>  	unsigned long size = get_vm_area_size(area);
> @@ -3719,12 +3719,28 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>  	unsigned int nr_small_pages = size >> PAGE_SHIFT;
>  	unsigned int page_order;
>  	unsigned int flags;
> +	bool noblock;
>  	int ret;
>  
>  	array_size = (unsigned long)nr_small_pages * sizeof(struct page *);
> +	noblock = !gfpflags_allow_blocking(gfp_mask);
>  
> -	if (!(gfp_mask & (GFP_DMA | GFP_DMA32)))
> -		gfp_mask |= __GFP_HIGHMEM;
> +	if (noblock) {
> +		/* __GFP_NOFAIL is incompatible with non-blocking contexts. */
> +		WARN_ON_ONCE(gfp_mask & __GFP_NOFAIL);
> +		gfp_mask &= ~__GFP_NOFAIL;
> +
> +		/*
> +		 * In non-sleeping contexts, ensure nested allocations follow
> +		 * same non-blocking rules.
> +		 */
> +		nested_gfp = gfp_mask | __GFP_ZERO;
> +		nofail = false;
> +	} else {
> +		/* Allow highmem allocations if there are no DMA constraints. */
> +		if (!(gfp_mask & (GFP_DMA | GFP_DMA32)))
> +			gfp_mask |= __GFP_HIGHMEM;
> +	}
>  
>  	/* Please note that the recursion is strictly bounded. */
>  	if (array_size > PAGE_SIZE) {
> @@ -3788,7 +3804,9 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>  	 * page tables allocations ignore external gfp mask, enforce it
>  	 * by the scope API
>  	 */
> -	if ((gfp_mask & (__GFP_FS | __GFP_IO)) == __GFP_IO)
> +	if (noblock)
> +		flags = memalloc_noreclaim_save();
> +	else if ((gfp_mask & (__GFP_FS | __GFP_IO)) == __GFP_IO)
>  		flags = memalloc_nofs_save();
>  	else if ((gfp_mask & (__GFP_FS | __GFP_IO)) == 0)
>  		flags = memalloc_noio_save();
> @@ -3800,7 +3818,9 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>  			schedule_timeout_uninterruptible(1);
>  	} while (nofail && (ret < 0));
>  
> -	if ((gfp_mask & (__GFP_FS | __GFP_IO)) == __GFP_IO)
> +	if (noblock)
> +		memalloc_noreclaim_restore(flags);
> +	else if ((gfp_mask & (__GFP_FS | __GFP_IO)) == __GFP_IO)
>  		memalloc_nofs_restore(flags);
>  	else if ((gfp_mask & (__GFP_FS | __GFP_IO)) == 0)
>  		memalloc_noio_restore(flags);
> -- 
> 2.39.5
> 

-- 
Michal Hocko
SUSE Labs
