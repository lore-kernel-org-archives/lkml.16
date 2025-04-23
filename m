Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22257280CFF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420189; cv=none; b=eErccVTycyCJbgHa05pJ2TpPdfX0PDaBxHhsip9dh4E9w7s2OqDrUC8NBQwEahCfI6QTgkWRQl2oVTFRoONjhzZNir7fqRDdYn0+0cEuRiGu4oTl+Siej2seXFOeW5bbrTQiF2140ZnB54zRPkDcqQU9p1qqT+v16wlJFEdkYYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420189; c=relaxed/simple;
	bh=2+T3ccY4svIZLFDYR+O/VlRuudJy5xMQZ/d0KRL7CME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eC56qw/CKt77iZPhc2+xdnNcTCqLXvNLpFssTRCyr8LFjC/PICK734cktP0QRL88CmRwdS1+bKDuAHWr2fLd4g5QHJDqo37qhboPdWdpjEt9y/cW06BNfwuMxEyDfP/wMvlsUQbEIKSqOFBrsldm430AtwSeHskEyDcdiK4hByU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vlh/zY2d; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vlh/zY2d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KB3stQEU0X68w2K3nnkTU+yNBGBekbZ+9b4b8qjTO1A=; b=vlh/zY2dHksVCqDFG+oESk1l+7
	n/3x+lhL8WJS1v+CgY6bbDppE5FiLckGMfUk+zElPlbdDF8Keg469d1izaAfRTZnWTQo2CpHDunHv
	nPxnMnL427TyenXKqYBI39mAYVnEkez6mXEAGfSFU2OQQ3t6yVnF17jKOBLAN+8DQfLLPR2jB+jBS
	bzJfNpzGNGVM+5Hsz+O5YLlSFhTE8e9vxUo7BsRGgkflLhbmwOa+cVy6H64g/S+nouk/foyf0gUgn
	8XPMlx53lLEoQBRa/+/eEqiCAH6AKEL70Is3cx6Ish//ck1U81neVDFYiYBezASKJ0KYuuwEzr9xM
	qVJbTUzA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bWT-00000009OaK-3ndy;
	Wed, 23 Apr 2025 14:56:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 26EDD30057E; Wed, 23 Apr 2025 16:56:25 +0200 (CEST)
Date: Wed, 23 Apr 2025 16:56:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] execmem: enforce allocation size aligment to PAGE_SIZE
Message-ID: <20250423145625.GF40412@noisy.programming.kicks-ass.net>
References: <20250423144808.1619863-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423144808.1619863-1-rppt@kernel.org>

On Wed, Apr 23, 2025 at 05:48:07PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Before introduction of ROX cache execmem allocation size was always
> implicitly aligned to PAGE_SIZE inside vmalloc.
> 
> However, when allocation happens from the ROX cache, this is not
> enforced.
> 
> Make sure that the allocation size is always consistently aligned to
> PAGE_SIZE.
> 
> Fixes: 2e45474ab14f ("execmem: add support for cache of large ROX pages")
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks!

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  mm/execmem.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/execmem.c b/mm/execmem.c
> index e6c4f5076ca8..2b683e7d864d 100644
> --- a/mm/execmem.c
> +++ b/mm/execmem.c
> @@ -377,6 +377,8 @@ void *execmem_alloc(enum execmem_type type, size_t size)
>  	pgprot_t pgprot = range->pgprot;
>  	void *p;
>  
> +	size = PAGE_ALIGN(size);
> +
>  	if (use_cache)
>  		p = execmem_cache_alloc(range, size);
>  	else
> -- 
> 2.47.2
> 
