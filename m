Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F7E19D880
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749208805; cv=none; b=OfsVp8wT5h8oYOhrjvhXlXJaCwxfc7FpWv0pixiOJc5dFz6tYF1Qf+hF6dCuHiBjIRY3wprLjLIXk0mraMBwD/h+hfrf3xITCGo8YskP7h9eeXpNfw68VtZnaiXNHjsPg93JqNN98JZLg0pxCCkuk2eRHS18onoLXUcxcHy2f00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749208805; c=relaxed/simple;
	bh=USdClpSVqld8qSLsJmF5UBqX++/lI09ziLNHsV+mc0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naUxyhanSdvWih4Oc8k5P0xIfi3bWzYXMDClqdh0WVzag20b/KXySw6LFcmCLZT0ZXLTATybLF51TIrpiXjcmwbN5GWEP07DllWHxWNeuoWleInSDbVka4BiYENu5IRREQe7Rk+kxfCf8kvDqvbfqjxF73FfoT8Zk3rIncOmFFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=u0CDmtcy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="u0CDmtcy"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442f9043f56so10948855e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 04:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1749208799; x=1749813599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MuQ7ElMFujECmYhgfOt92ztzf79cPNjqJC1YxZVfkjk=;
        b=u0CDmtcyJQO2+isOBmvt98vI8uIspiM4cTPZwGOvfWsegbf32lu/gjt16nz6BGq2ko
         mLk0oG3tn79OfjdaA0ts9QSuhYPsR/T7APcj4Mk7mxNDUv5zSuKuPagRDb9Ku9oo2waF
         afEJ1qOGZnjwo9cw86cz8hA+MB7X+vUr+jNXPa7aij4WIRswv2FTnY0CiMIRyw8JSpic
         6TMvKIdmN5PFqwNqdvX8K6A3n7RO2QVxzkYpw1ys2LlOJzA9bDcY3Z9gUtZO1RfZn/mD
         0iy4vzXKCi58AHhghJO9UsxhmfRWoFzd7jn7SBU3KFp6n/eaNw9ApwvVh2AfQOWnl68L
         198Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749208799; x=1749813599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuQ7ElMFujECmYhgfOt92ztzf79cPNjqJC1YxZVfkjk=;
        b=OwvLhau4KOi54LQAui5Huv1LPC3RcSxo5sB3e0iQ/gkbgNcwVH431wS7kZf/EzZnD3
         xxwZfaBJKoqN9F8BLGupUd0YPXAGbdszvSLJ8uMVKpoVU4j+i/AAAGdplTHzqydAbvMX
         eV/nwEKERzvM2M0gjMte+F2Uc8JuIqygVd0LHUo8Vffs0xFuJizh9wqLQQBUCFl+ar4z
         zV6oaG3UCLMQB4hhKOjey3+JfyDV3dH5CamSzFpAGugqjIMokyg8IzeD8XSkoVNkHUwg
         tKRRn1T+xkMbJf1DEBZ89WiBTM/Eq8p09T2vwLwNuw++DrmpDiSCo3vw4FAjHdGubabF
         SxIw==
X-Forwarded-Encrypted: i=1; AJvYcCUgVqDP+bhGcL1CmC2GDKnSyMslODtx6aXsOPqBpu2kCS/PUulvaWF+jGyZ0YwUXVt6rXuigPkU1f6VKtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxODMpRjK2KdqDZTxMwq0DAdyNbFRPAfEcW+I9UnuwewXk85RKS
	GKuEF5W77hVhwey4GI6vcjTdZhDEZykivybJQuGobQ8QZRQpZ9/GYZu/i5b4ka9pcVQ=
X-Gm-Gg: ASbGncs3WxK/rqzsHwFuJ1Expkq1PNocyq2KmGR6Ls8UUEgDdtAs0s1snlm3ZqZ1LTw
	eRTNMf18riznDMl5Xq++KsTmWIp3+Dj9MzVEXdYUbDNpBfrdrK5YG773fHjc7RzBi9SBAwQEW5R
	LnEnrgLQmXgabLxl+RRfpzsUkcR6J8CLHyboxVyj+taEYb90TxaWX19uFyzqV31FqEoKARmlqg8
	SQMX4LIlR4YI9lF5wrJicWFoakEvGO8QdaT3TN6Wjsdiw25t0NL26vQ40A4W/9ga83tnRVudbMM
	ofeV8fMQJXKf93YQ0E9r57TOJ4LYmMHK0tj+6k71WBdKCEbFIaDoDTmezyIwkES60IIA5w==
X-Google-Smtp-Source: AGHT+IH2MrdFxFyb1RgZrJq3QgVItnUJDGd7Nbi2wT4HljZC4pDIqfq4GTUxdydboY7ZnYyQOl6GGg==
X-Received: by 2002:a05:600c:3e10:b0:450:d204:34ca with SMTP id 5b1f17b1804b1-452013bb9a4mr33700405e9.18.1749208799424;
        Fri, 06 Jun 2025 04:19:59 -0700 (PDT)
Received: from localhost ([2a02:8071:6401:180:da11:6260:39d6:12c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4526e056138sm18262385e9.5.2025.06.06.04.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 04:19:58 -0700 (PDT)
Date: Fri, 6 Jun 2025 13:19:53 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com,
	jackmanb@google.com, ziy@nvidia.com, wangkefeng.wang@huawei.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mm: Drain PCP during direct reclaim
Message-ID: <20250606111953.GB1118@cmpxchg.org>
References: <20250606065930.3535912-1-mawupeng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606065930.3535912-1-mawupeng1@huawei.com>

On Fri, Jun 06, 2025 at 02:59:30PM +0800, Wupeng Ma wrote:
> Memory retained in Per-CPU Pages (PCP) caches can prevent hugepage
> allocations from succeeding despite sufficient free system memory. This
> occurs because:
> 1. Hugepage allocations don't actively trigger PCP draining
> 2. Direct reclaim path fails to trigger drain_all_pages() when:
>    a) All zone pages are free/hugetlb (!did_some_progress)
>    b) Compaction skips due to costly order watermarks (COMPACT_SKIPPED)

This doesn't sound quite right. Direct reclaim skips when compaction
is suitable. Compaction says COMPACT_SKIPPED when it *isn't* suitable.

So if direct reclaim didn't drain, presumably compaction ran but
returned COMPLETE or PARTIAL_SKIPPED because the freelist checks in
__compact_finished() never succeed due to the pcp?

> @@ -4137,28 +4137,22 @@ __alloc_pages_direct_reclaim(gfp_t gfp_mask, unsigned int order,
>  {
>  	struct page *page = NULL;
>  	unsigned long pflags;
> -	bool drained = false;
>  
>  	psi_memstall_enter(&pflags);
>  	*did_some_progress = __perform_reclaim(gfp_mask, order, ac);
> -	if (unlikely(!(*did_some_progress)))
> -		goto out;
> -
> -retry:
> -	page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
> +	if (likely(*did_some_progress))
> +		page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);
>  
>  	/*
>  	 * If an allocation failed after direct reclaim, it could be because
>  	 * pages are pinned on the per-cpu lists or in high alloc reserves.
>  	 * Shrink them and try again
>  	 */
> -	if (!page && !drained) {
> +	if (!page) {
>  		unreserve_highatomic_pageblock(ac, false);
>  		drain_all_pages(NULL);
> -		drained = true;
> -		goto retry;
> +		page = get_page_from_freelist(gfp_mask, order, alloc_flags, ac);

This seems like the wrong place to fix the issue.

Kcompactd has a drain_all_pages() call. Move that to compact_zone(),
so that it also applies to the try_to_compact_pages() path?
