Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B112198851
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 03:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743652555; cv=none; b=pIrGKZH2el2+JVuRgm+PSqy6mQuPRSST6NzXRfZQONPHcG9BJKSmBW08yNdEtuJRGS0ryJFFEdo1ghvvjePuL0TRW6yDN+NiWWdIiXu+JQc9iAL0YFRNXO+bRW9UxJGX8u3FLBYrXup0X8aEJ+QGhAOnqM0zKSOEI23Lq6HNHm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743652555; c=relaxed/simple;
	bh=MamZ+s5U/GQFkoH+Mp8sirxtFiVP5tYx1rFIKRePfhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRreoK04LPI4B3VSlC3rn8bWIDDihuT8jzP5oerL1Tf+7i/2n9ifmYc/aCCxcunLHAwNvjXeRRsGF0O9Txrsl73KJDMHlUSes1SHXrOuGu4W3AR2A1u9z9o9VpcQbYqgAalpNdG30zWHlYbCeCgqTrVdOLip21vC/QRw6uX8PyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l4ucuxiy; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l4ucuxiy"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7359aca7ef2so524870b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 20:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743652553; x=1744257353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0v59Va1cFoo3feF/U2J6uerO13lHWMq+byB3hbt+oPk=;
        b=l4ucuxiypTwwOX4MFwznP7RCJs2F3EAms5LCAISX/zjjT3HYQnazWl2faV8Km7aFQO
         G9QOWW62tO0FVc/F2dMbf/7HZhSMOV3yvH+szF4Hsz065ErHfXBFoHfskVowp5QuOTca
         74+DpKHw2+6nYhnHwHXoO6X2aGzj18OfY2Ul0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743652553; x=1744257353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0v59Va1cFoo3feF/U2J6uerO13lHWMq+byB3hbt+oPk=;
        b=qVrLIdbaeo6TbuXQcrOEqiM6NVhD816vrMn9kGFJxeC3yRCwbtrqdmVfeFnpo4Fp1c
         unryiWux2x2bvaEdIeImJgBDxqHyTDsypXxuCKjmdx8HEFTzg4zjXJijrRyoiEkQEv4N
         f2g56VYUwF9G88vnqYaqfS43EEWFu5F5M8pC/wDsb5Y2/wZd2R3ozMcplzZBFA8xODLt
         AxqDyXb/vR2Tcm0fJFXjfPPINJvo0+PB85Fg0ZPjqCAujBGGX6BBSOC9svPMXecRV6fb
         2hrfyCfzJdei9n3MgA2ovl8vbfvSphsM41SSz9TV00wdcmnJeZ0/CwrrQF2bUUzA9s9a
         8ebw==
X-Forwarded-Encrypted: i=1; AJvYcCUyabeRJ7J22csYbXpv4eUgZiaRWtBh9qVHTA90t0nz16JkLNIdsZnhY70gf20OnUa7I4rzK7X/S2gwjFg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3EZ9qcI8F2ogBc0Faspf+IVmhA7yqvT58QcFscdUrGvnixXKn
	293BDWd5/h/dYlFTfUgaFCk6YBux5c/PPRZO/I3DU/ic7oZMvjaWiu6vMJdESg==
X-Gm-Gg: ASbGnctruWr6HuFKkmv+oPgNLywPWnfo7tnAoqhqHh8/nHFLCMWzqSEH0ZYtqQE/sgS
	iXbmtT0wxKtfFlpfVlQa+d2aTu4f9WUQ/IfRBi1VY0HvsFG4NI20kBbHCv7TXsvzrWN5qHxe4Ax
	XyewERpybR7lce80duZ0v0+dVo1Cy4TKjjF8qqPlCQ3RoDpM0ZscRPzJm9IKu5DYZlleAnEOMEc
	3RU8VWe45UkrA1FD8BI1tKLwqAD82k45YXW0Qglyah5OTUjDcPR4aRQD8k6JRbGDZYei4RSfXFE
	aP9GDmiDVv8w87b5Kdo5JscwwswpLLyJ32Mit1LqD5m7wbE=
X-Google-Smtp-Source: AGHT+IEKyJYCmE/ssbDqw9p58PmbfU6BPpsf7THxBdkw3DrXon2fKE3Jl/zXGWBEVCqgwjGAvzv4JA==
X-Received: by 2002:a05:6a00:180b:b0:736:baa0:2acd with SMTP id d2e1a72fcca58-73980487652mr31670164b3a.20.1743652552641;
        Wed, 02 Apr 2025 20:55:52 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:bb3:abb1:21bc:a00c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b3ff9sm383401b3a.137.2025.04.02.20.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 20:55:52 -0700 (PDT)
Date: Thu, 3 Apr 2025 12:55:46 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, yosry.ahmed@linux.dev, 
	chengming.zhou@linux.dev, sj@kernel.org, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	jonathan.cameron@huawei.com, dan.j.williams@intel.com, linux-cxl@vger.kernel.org, 
	minchan@kernel.org, senozhatsky@chromium.org
Subject: Re: [PATCH v2] zsmalloc: prefer the the original page's node for
 compressed data
Message-ID: <mnvexa7kseswglcqbhlot4zg3b3la2ypv2rimdl5mh5glbmhvz@wi6bgqn47hge>
References: <20250402204416.3435994-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402204416.3435994-1-nphamcs@gmail.com>

On (25/04/02 13:44), Nhat Pham wrote:
[..]
> @@ -1981,10 +1981,15 @@ static int recompress_slot(struct zram *zram, u32 index, struct page *page,
>  	 * We are holding per-CPU stream mutex and entry lock so better
>  	 * avoid direct reclaim.  Allocation error is not fatal since
>  	 * we still have the old object in the mem_pool.
> +	 *
> +	 * XXX: technically, the node we really want here is the node that holds
> +	 * the original compressed data. But that would require us to modify
> +	 * zsmalloc API to return this information. For now, we will make do with
> +	 * the node of the page allocated for recompression.
>  	 */
>  	handle_new = zs_malloc(zram->mem_pool, comp_len_new,
>  			       GFP_NOIO | __GFP_NOWARN |
> -			       __GFP_HIGHMEM | __GFP_MOVABLE);
> +			       __GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));

This works for me.  I saw in other threads (and sorry, I'm on a sick
leave now, can't reply fast) that "zram people need to fix it"/etc.
I guess I'm one of those zram people and I don't think I run any
multi-node NUMA systems, so that problem probably has never occurred
to me.  We can add a simple API extension to lookup node-id by
zsmalloc handle, if anyone really needs it, but I'm okay with the
status quo (and XXX) for the time being.

[..]
> -unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp)
> +unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp,
> +				const int nid)
>  {

I'm not the zspool maintainer, but if I may ask, for new zsmalloc code my
preference is to follow the kernel styles (yes, the old code doesn't follow
any at all, whenever I touch the old code I fix it).

Do you mind if we do something like below? (at least for zsmalloc)

With this
Acked-by: Sergey Senozhatsky <senozhatsky@chromium.org> #zram and zsmalloc


---

diff --git a/include/linux/zpool.h b/include/linux/zpool.h
index 697525cb00bd..369ef068fad8 100644
--- a/include/linux/zpool.h
+++ b/include/linux/zpool.h
@@ -22,7 +22,7 @@ const char *zpool_get_type(struct zpool *pool);
 void zpool_destroy_pool(struct zpool *pool);
 
 int zpool_malloc(struct zpool *pool, size_t size, gfp_t gfp,
-			unsigned long *handle, const int nid);
+		 unsigned long *handle, const int nid);
 
 void zpool_free(struct zpool *pool, unsigned long handle);
 
@@ -64,7 +64,7 @@ struct zpool_driver {
 	void (*destroy)(void *pool);
 
 	int (*malloc)(void *pool, size_t size, gfp_t gfp,
-				unsigned long *handle, const int nid);
+		      unsigned long *handle, const int nid);
 	void (*free)(void *pool, unsigned long handle);
 
 	void *(*obj_read_begin)(void *pool, unsigned long handle,
diff --git a/mm/zpool.c b/mm/zpool.c
index b99a7c03e735..0a71d03369f1 100644
--- a/mm/zpool.c
+++ b/mm/zpool.c
@@ -239,7 +239,7 @@ const char *zpool_get_type(struct zpool *zpool)
  * Returns: 0 on success, negative value on error.
  */
 int zpool_malloc(struct zpool *zpool, size_t size, gfp_t gfp,
-			unsigned long *handle, const int nid)
+		 unsigned long *handle, const int nid)
 {
 	return zpool->driver->malloc(zpool->pool, size, gfp, handle, nid);
 }
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index daa16ce4cf07..70406ac94bbd 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -452,7 +452,7 @@ static void zs_zpool_destroy(void *pool)
 }
 
 static int zs_zpool_malloc(void *pool, size_t size, gfp_t gfp,
-			unsigned long *handle, const int nid)
+			   unsigned long *handle, const int nid)
 {
 	*handle = zs_malloc(pool, size, gfp, nid);
 
@@ -1033,8 +1033,8 @@ static void create_page_chain(struct size_class *class, struct zspage *zspage,
  * Allocate a zspage for the given size class
  */
 static struct zspage *alloc_zspage(struct zs_pool *pool,
-					struct size_class *class,
-					gfp_t gfp, const int nid)
+				   struct size_class *class,
+				   gfp_t gfp, const int nid)
 {
 	int i;
 	struct zpdesc *zpdescs[ZS_MAX_PAGES_PER_ZSPAGE];
@@ -1333,7 +1333,7 @@ static unsigned long obj_malloc(struct zs_pool *pool,
  * Allocation requests with size > ZS_MAX_ALLOC_SIZE will fail.
  */
 unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp,
-				const int nid)
+			const int nid)
 {
 	unsigned long handle;
 	struct size_class *class;
