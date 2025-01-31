Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669F01C3F39
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738338425; cv=none; b=PNg37DNG9TmS/61u89T7WXbTYBT7EYVeGz+NJD97HnB+U6wfPd+apmdWx+Zr7JVSf7x/v9gUwUqSfVJkjuYGEu9y9YDGvZMo9wfJKMBOpxTJ7LIRBEKUpd9bTiYpOTtMNUFG8fYX37XV2I3AQQYVs7PGVdaqvX0po0jAG4W52K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738338425; c=relaxed/simple;
	bh=zzxZ8gGJ3vFLlhycyCGgJp2SwgF1LskT9QtShjgkU0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUXQieyiBISHLZo+YgvMYtjbqCtE63AHT1LZa7w6IxEgfnpXi5iy2AAKQbtomWhp3gC5n3rvmkCE1xbDMNpR0RSjFUDJtpSDWEZ2UT68OgV9wfLH3whoBluYdbeFvZAco9t2aSP7dJRm6bz7neJ14NSGbnARtQk3h4XP0F7hwf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=B8GMhZl7; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="B8GMhZl7"
Date: Fri, 31 Jan 2025 15:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738338420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S4UMvpLmUoH/72hjAhozm2z+sH1cwVyeGJhHL6Ll8kw=;
	b=B8GMhZl7iklwBRFc1bjI7Rc1UTjyA07LqDm3SNWI0MKYPuEgufSga/N1u2I/aXS+AmU44w
	QstlTtGcSUwBE//ouasMb5ZhdgjezBXP5EHjMfZtBtcxmgp9GlZ4oJHj3aUv104UVJi6Kh
	0nAeE+XL0EtaCsDwYVK5Uk7g+guiqd0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 12/17] zsmalloc: factor out pool locking helpers
Message-ID: <Z5zwcPBAY7JaVW6Z@google.com>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-13-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131090658.3386285-13-senozhatsky@chromium.org>
X-Migadu-Flow: FLOW_OUT

On Fri, Jan 31, 2025 at 06:06:11PM +0900, Sergey Senozhatsky wrote:
> We currently have a mix of migrate_{read,write}_lock() helpers
> that lock zspages, but it's zs_pool that actually has a ->migrate_lock
> access to which is opene-coded.  Factor out pool migrate locking
> into helpers, zspage migration locking API will be renamed to
> reduce confusion.
> 
> It's worth mentioning that zsmalloc locks sync not only migration,
> but also compaction.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  mm/zsmalloc.c | 69 +++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 47 insertions(+), 22 deletions(-)
> 
> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> index 817626a351f8..c129596ab960 100644
> --- a/mm/zsmalloc.c
> +++ b/mm/zsmalloc.c
> @@ -18,7 +18,7 @@
>  /*
>   * lock ordering:
>   *	page_lock
> - *	pool->migrate_lock
> + *	pool->lock
>   *	class->lock
>   *	zspage->lock
>   */
> @@ -224,10 +224,35 @@ struct zs_pool {
>  	struct work_struct free_work;
>  #endif
>  	/* protect page/zspage migration */
> -	rwlock_t migrate_lock;
> +	rwlock_t lock;
>  	atomic_t compaction_in_progress;
>  };
>  
> +static void pool_write_unlock(struct zs_pool *pool)
> +{
> +	write_unlock(&pool->lock);
> +}
> +
> +static void pool_write_lock(struct zs_pool *pool)
> +{
> +	write_lock(&pool->lock);
> +}
> +
> +static void pool_read_unlock(struct zs_pool *pool)
> +{
> +	read_unlock(&pool->lock);
> +}
> +
> +static void pool_read_lock(struct zs_pool *pool)
> +{
> +	read_lock(&pool->lock);
> +}
> +
> +static bool pool_lock_is_contended(struct zs_pool *pool)
> +{
> +	return rwlock_is_contended(&pool->lock);
> +}
> +
>  static inline void zpdesc_set_first(struct zpdesc *zpdesc)
>  {
>  	SetPagePrivate(zpdesc_page(zpdesc));
> @@ -290,7 +315,7 @@ static bool ZsHugePage(struct zspage *zspage)
>  	return zspage->huge;
>  }
>  
> -static void migrate_lock_init(struct zspage *zspage);
> +static void lock_init(struct zspage *zspage);

Seems like this change slipped in here, with a s/migrate_lock/lock
replacement if I have to make a guess :P

>  static void migrate_read_lock(struct zspage *zspage);
>  static void migrate_read_unlock(struct zspage *zspage);
>  static void migrate_write_lock(struct zspage *zspage);
> @@ -992,7 +1017,7 @@ static struct zspage *alloc_zspage(struct zs_pool *pool,
>  		return NULL;
>  
>  	zspage->magic = ZSPAGE_MAGIC;
> -	migrate_lock_init(zspage);
> +	lock_init(zspage);
>  
>  	for (i = 0; i < class->pages_per_zspage; i++) {
>  		struct zpdesc *zpdesc;
> @@ -1206,7 +1231,7 @@ void *zs_map_object(struct zs_pool *pool, unsigned long handle,
>  	BUG_ON(in_interrupt());
>  
>  	/* It guarantees it can get zspage from handle safely */
> -	read_lock(&pool->migrate_lock);
> +	pool_read_lock(pool);
>  	obj = handle_to_obj(handle);
>  	obj_to_location(obj, &zpdesc, &obj_idx);
>  	zspage = get_zspage(zpdesc);
> @@ -1218,7 +1243,7 @@ void *zs_map_object(struct zs_pool *pool, unsigned long handle,
>  	 * which is smaller granularity.
>  	 */
>  	migrate_read_lock(zspage);
> -	read_unlock(&pool->migrate_lock);
> +	pool_read_unlock(pool);
>  
>  	class = zspage_class(pool, zspage);
>  	off = offset_in_page(class->size * obj_idx);
> @@ -1450,16 +1475,16 @@ void zs_free(struct zs_pool *pool, unsigned long handle)
>  		return;
>  
>  	/*
> -	 * The pool->migrate_lock protects the race with zpage's migration
> +	 * The pool->lock protects the race with zpage's migration
>  	 * so it's safe to get the page from handle.
>  	 */
> -	read_lock(&pool->migrate_lock);
> +	pool_read_lock(pool);
>  	obj = handle_to_obj(handle);
>  	obj_to_zpdesc(obj, &f_zpdesc);
>  	zspage = get_zspage(f_zpdesc);
>  	class = zspage_class(pool, zspage);
>  	spin_lock(&class->lock);
> -	read_unlock(&pool->migrate_lock);
> +	pool_read_unlock(pool);
>  
>  	class_stat_sub(class, ZS_OBJS_INUSE, 1);
>  	obj_free(class->size, obj);
> @@ -1703,7 +1728,7 @@ static void lock_zspage(struct zspage *zspage)
>  }
>  #endif /* CONFIG_COMPACTION */
>  
> -static void migrate_lock_init(struct zspage *zspage)
> +static void lock_init(struct zspage *zspage)
>  {
>  	rwlock_init(&zspage->lock);
>  }
> @@ -1793,10 +1818,10 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>  	pool = zspage->pool;
>  
>  	/*
> -	 * The pool migrate_lock protects the race between zpage migration
> +	 * The pool lock protects the race between zpage migration
>  	 * and zs_free.
>  	 */
> -	write_lock(&pool->migrate_lock);
> +	pool_write_lock(pool);
>  	class = zspage_class(pool, zspage);
>  
>  	/*
> @@ -1833,7 +1858,7 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>  	 * Since we complete the data copy and set up new zspage structure,
>  	 * it's okay to release migration_lock.
>  	 */
> -	write_unlock(&pool->migrate_lock);
> +	pool_write_unlock(pool);
>  	spin_unlock(&class->lock);
>  	migrate_write_unlock(zspage);
>  
> @@ -1956,7 +1981,7 @@ static unsigned long __zs_compact(struct zs_pool *pool,
>  	 * protect the race between zpage migration and zs_free
>  	 * as well as zpage allocation/free
>  	 */
> -	write_lock(&pool->migrate_lock);
> +	pool_write_lock(pool);
>  	spin_lock(&class->lock);
>  	while (zs_can_compact(class)) {
>  		int fg;
> @@ -1983,14 +2008,14 @@ static unsigned long __zs_compact(struct zs_pool *pool,
>  		src_zspage = NULL;
>  
>  		if (get_fullness_group(class, dst_zspage) == ZS_INUSE_RATIO_100
> -		    || rwlock_is_contended(&pool->migrate_lock)) {
> +		    || pool_lock_is_contended(pool)) {
>  			putback_zspage(class, dst_zspage);
>  			dst_zspage = NULL;
>  
>  			spin_unlock(&class->lock);
> -			write_unlock(&pool->migrate_lock);
> +			pool_write_unlock(pool);
>  			cond_resched();
> -			write_lock(&pool->migrate_lock);
> +			pool_write_lock(pool);
>  			spin_lock(&class->lock);
>  		}
>  	}
> @@ -2002,7 +2027,7 @@ static unsigned long __zs_compact(struct zs_pool *pool,
>  		putback_zspage(class, dst_zspage);
>  
>  	spin_unlock(&class->lock);
> -	write_unlock(&pool->migrate_lock);
> +	pool_write_unlock(pool);
>  
>  	return pages_freed;
>  }
> @@ -2014,10 +2039,10 @@ unsigned long zs_compact(struct zs_pool *pool)
>  	unsigned long pages_freed = 0;
>  
>  	/*
> -	 * Pool compaction is performed under pool->migrate_lock so it is basically
> +	 * Pool compaction is performed under pool->lock so it is basically
>  	 * single-threaded. Having more than one thread in __zs_compact()
> -	 * will increase pool->migrate_lock contention, which will impact other
> -	 * zsmalloc operations that need pool->migrate_lock.
> +	 * will increase pool->lock contention, which will impact other
> +	 * zsmalloc operations that need pool->lock.
>  	 */
>  	if (atomic_xchg(&pool->compaction_in_progress, 1))
>  		return 0;
> @@ -2139,7 +2164,7 @@ struct zs_pool *zs_create_pool(const char *name)
>  		return NULL;
>  
>  	init_deferred_free(pool);
> -	rwlock_init(&pool->migrate_lock);
> +	rwlock_init(&pool->lock);
>  	atomic_set(&pool->compaction_in_progress, 0);
>  
>  	pool->name = kstrdup(name, GFP_KERNEL);
> -- 
> 2.48.1.362.g079036d154-goog
> 
