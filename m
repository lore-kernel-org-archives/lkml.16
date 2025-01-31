Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC8F219FC
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738338725; cv=none; b=mxTOIKJZgvgbnHg7JNCjVe9WhKuXj7VFcNfByfM8QxM3WMOmCukIDl8iiDZzLYp0b52I8gzbPidU7mn9HSsUuZiISk6VPZdg+qpZ5MM3cZqB88h2O0aiOa5KGft/djOeDV2RDgzgz06ng/1yL2dhAkViPSDRFDE7MSJF66/eCYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738338725; c=relaxed/simple;
	bh=XeeX2wmzVrbVPJBKo5lklUUpxT2sRW0xx4BhmDy19FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaviW8s984kRY3DlZk8vgUmDKeVDINkUPfDnAk6NkZbiexbF3vcTyaSEoVO8/Zk2PSqJS7IQW7nsKyVHT1aNpr/CAvi6KDd5BGbN7FgEXj6IOGEEf4XDhHNhDXt0PwWXo2s5elw0WDV5EGqqvGhF5brvSdL5g8hj5PuF5+b8jDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oGqCunZj; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oGqCunZj"
Date: Fri, 31 Jan 2025 15:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738338713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lHB8uzDrTPnYyzcg4gpR62ufqms8WCo1ubd09TYKHcw=;
	b=oGqCunZjUcI5dQjKKMoez7rHCCD3zlq/lEJNhDHsZ7IzoyK4RT57/DQA1gDEKHl1aB2x1H
	zY7MZS9X+Pa3WAyo9pkoq22Y/OeZ4p+lWeCPhs5Asmktk83kSOqYan6fPxN/P1q47rJ7zL
	zv/Yys7+nJ6Le6HKGc/AKgzCecr8R98=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Message-ID: <Z5zxlRkdseEJntFk@google.com>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-15-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131090658.3386285-15-senozhatsky@chromium.org>
X-Migadu-Flow: FLOW_OUT

On Fri, Jan 31, 2025 at 06:06:13PM +0900, Sergey Senozhatsky wrote:
> Switch over from rwlock_t to a atomic_t variable that takes negative
> value when the page is under migration, or positive values when the
> page is used by zsmalloc users (object map, etc.)   Using a rwsem
> per-zspage is a little too memory heavy, a simple atomic_t should
> suffice.
> 
> zspage lock is a leaf lock for zs_map_object(), where it's read-acquired.
> Since this lock now permits preemption extra care needs to be taken when
> it is write-acquired - all writers grab it in atomic context, so they
> cannot spin and wait for (potentially preempted) reader to unlock zspage.
> There are only two writers at this moment - migration and compaction.  In
> both cases we use write-try-lock and bail out if zspage is read locked.
> Writers, on the other hand, never get preempted, so readers can spin
> waiting for the writer to unlock zspage.
> 
> With this we can implement a preemptible object mapping.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  mm/zsmalloc.c | 135 +++++++++++++++++++++++++++++++-------------------
>  1 file changed, 83 insertions(+), 52 deletions(-)
> 
> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> index 4b4c77bc08f9..f5b5fe732e50 100644
> --- a/mm/zsmalloc.c
> +++ b/mm/zsmalloc.c
> @@ -292,6 +292,9 @@ static inline void free_zpdesc(struct zpdesc *zpdesc)
>  	__free_page(page);
>  }
>  
> +#define ZS_PAGE_UNLOCKED	0
> +#define ZS_PAGE_WRLOCKED	-1
> +
>  struct zspage {
>  	struct {
>  		unsigned int huge:HUGE_BITS;
> @@ -304,7 +307,7 @@ struct zspage {
>  	struct zpdesc *first_zpdesc;
>  	struct list_head list; /* fullness list */
>  	struct zs_pool *pool;
> -	rwlock_t lock;
> +	atomic_t lock;
>  };
>  
>  struct mapping_area {
> @@ -314,6 +317,59 @@ struct mapping_area {
>  	enum zs_mapmode vm_mm; /* mapping mode */
>  };
>  
> +static void zspage_lock_init(struct zspage *zspage)
> +{
> +	atomic_set(&zspage->lock, ZS_PAGE_UNLOCKED);
> +}
> +
> +/*
> + * zspage lock permits preemption on the reader-side (there can be multiple
> + * readers).  Writers (exclusive zspage ownership), on the other hand, are
> + * always run in atomic context and cannot spin waiting for a (potentially
> + * preempted) reader to unlock zspage.  This, basically, means that writers
> + * can only call write-try-lock and must bail out if it didn't succeed.
> + *
> + * At the same time, writers cannot reschedule under zspage write-lock,
> + * so readers can spin waiting for the writer to unlock zspage.
> + */
> +static void zspage_read_lock(struct zspage *zspage)
> +{
> +	atomic_t *lock = &zspage->lock;
> +	int old = atomic_read(lock);
> +
> +	do {
> +		if (old == ZS_PAGE_WRLOCKED) {
> +			cpu_relax();
> +			old = atomic_read(lock);
> +			continue;
> +		}
> +	} while (!atomic_try_cmpxchg(lock, &old, old + 1));
> +}
> +
> +static void zspage_read_unlock(struct zspage *zspage)
> +{
> +	atomic_dec(&zspage->lock);
> +}
> +
> +static bool zspage_try_write_lock(struct zspage *zspage)
> +{
> +	atomic_t *lock = &zspage->lock;
> +	int old = ZS_PAGE_UNLOCKED;
> +
> +	preempt_disable();
> +	if (atomic_try_cmpxchg(lock, &old, ZS_PAGE_WRLOCKED))

FWIW, I am usually afraid to manually implement locking like this. For
example, queued_spin_trylock() uses atomic_try_cmpxchg_acquire() not
atomic_try_cmpxchg(), and I am not quite sure what could happen without
ACQUIRE semantics here on some architectures.

We also lose some debugging capabilities as Hilf pointed out in another
patch.

Just my 2c.

> +		return true;
> +
> +	preempt_enable();
> +	return false;
> +}
> +
> +static void zspage_write_unlock(struct zspage *zspage)
> +{
> +	atomic_set(&zspage->lock, ZS_PAGE_UNLOCKED);
> +	preempt_enable();
> +}
> +
>  /* huge object: pages_per_zspage == 1 && maxobj_per_zspage == 1 */
>  static void SetZsHugePage(struct zspage *zspage)
>  {
> @@ -325,12 +381,6 @@ static bool ZsHugePage(struct zspage *zspage)
>  	return zspage->huge;
>  }
>  
> -static void lock_init(struct zspage *zspage);
> -static void migrate_read_lock(struct zspage *zspage);
> -static void migrate_read_unlock(struct zspage *zspage);
> -static void migrate_write_lock(struct zspage *zspage);
> -static void migrate_write_unlock(struct zspage *zspage);
> -
>  #ifdef CONFIG_COMPACTION
>  static void kick_deferred_free(struct zs_pool *pool);
>  static void init_deferred_free(struct zs_pool *pool);
> @@ -1026,7 +1076,7 @@ static struct zspage *alloc_zspage(struct zs_pool *pool,
>  		return NULL;
>  
>  	zspage->magic = ZSPAGE_MAGIC;
> -	lock_init(zspage);
> +	zspage_lock_init(zspage);
>  
>  	for (i = 0; i < class->pages_per_zspage; i++) {
>  		struct zpdesc *zpdesc;
> @@ -1251,7 +1301,7 @@ void *zs_map_object(struct zs_pool *pool, unsigned long handle,
>  	 * zs_unmap_object API so delegate the locking from class to zspage
>  	 * which is smaller granularity.
>  	 */
> -	migrate_read_lock(zspage);
> +	zspage_read_lock(zspage);
>  	pool_read_unlock(pool);
>  
>  	class = zspage_class(pool, zspage);
> @@ -1311,7 +1361,7 @@ void zs_unmap_object(struct zs_pool *pool, unsigned long handle)
>  	}
>  	local_unlock(&zs_map_area.lock);
>  
> -	migrate_read_unlock(zspage);
> +	zspage_read_unlock(zspage);
>  }
>  EXPORT_SYMBOL_GPL(zs_unmap_object);
>  
> @@ -1705,18 +1755,18 @@ static void lock_zspage(struct zspage *zspage)
>  	/*
>  	 * Pages we haven't locked yet can be migrated off the list while we're
>  	 * trying to lock them, so we need to be careful and only attempt to
> -	 * lock each page under migrate_read_lock(). Otherwise, the page we lock
> +	 * lock each page under zspage_read_lock(). Otherwise, the page we lock
>  	 * may no longer belong to the zspage. This means that we may wait for
>  	 * the wrong page to unlock, so we must take a reference to the page
> -	 * prior to waiting for it to unlock outside migrate_read_lock().
> +	 * prior to waiting for it to unlock outside zspage_read_lock().
>  	 */
>  	while (1) {
> -		migrate_read_lock(zspage);
> +		zspage_read_lock(zspage);
>  		zpdesc = get_first_zpdesc(zspage);
>  		if (zpdesc_trylock(zpdesc))
>  			break;
>  		zpdesc_get(zpdesc);
> -		migrate_read_unlock(zspage);
> +		zspage_read_unlock(zspage);
>  		zpdesc_wait_locked(zpdesc);
>  		zpdesc_put(zpdesc);
>  	}
> @@ -1727,41 +1777,16 @@ static void lock_zspage(struct zspage *zspage)
>  			curr_zpdesc = zpdesc;
>  		} else {
>  			zpdesc_get(zpdesc);
> -			migrate_read_unlock(zspage);
> +			zspage_read_unlock(zspage);
>  			zpdesc_wait_locked(zpdesc);
>  			zpdesc_put(zpdesc);
> -			migrate_read_lock(zspage);
> +			zspage_read_lock(zspage);
>  		}
>  	}
> -	migrate_read_unlock(zspage);
> +	zspage_read_unlock(zspage);
>  }
>  #endif /* CONFIG_COMPACTION */
>  
> -static void lock_init(struct zspage *zspage)
> -{
> -	rwlock_init(&zspage->lock);
> -}
> -
> -static void migrate_read_lock(struct zspage *zspage) __acquires(&zspage->lock)
> -{
> -	read_lock(&zspage->lock);
> -}
> -
> -static void migrate_read_unlock(struct zspage *zspage) __releases(&zspage->lock)
> -{
> -	read_unlock(&zspage->lock);
> -}
> -
> -static void migrate_write_lock(struct zspage *zspage)
> -{
> -	write_lock(&zspage->lock);
> -}
> -
> -static void migrate_write_unlock(struct zspage *zspage)
> -{
> -	write_unlock(&zspage->lock);
> -}
> -
>  #ifdef CONFIG_COMPACTION
>  
>  static const struct movable_operations zsmalloc_mops;
> @@ -1803,7 +1828,7 @@ static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
>  }
>  
>  static int zs_page_migrate(struct page *newpage, struct page *page,
> -		enum migrate_mode mode)
> +			   enum migrate_mode mode)
>  {
>  	struct zs_pool *pool;
>  	struct size_class *class;
> @@ -1819,15 +1844,12 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>  
>  	VM_BUG_ON_PAGE(!zpdesc_is_isolated(zpdesc), zpdesc_page(zpdesc));
>  
> -	/* We're committed, tell the world that this is a Zsmalloc page. */
> -	__zpdesc_set_zsmalloc(newzpdesc);
> -
>  	/* The page is locked, so this pointer must remain valid */
>  	zspage = get_zspage(zpdesc);
>  	pool = zspage->pool;
>  
>  	/*
> -	 * The pool lock protects the race between zpage migration
> +	 * The pool->lock protects the race between zpage migration
>  	 * and zs_free.
>  	 */
>  	pool_write_lock(pool);
> @@ -1837,8 +1859,15 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>  	 * the class lock protects zpage alloc/free in the zspage.
>  	 */
>  	size_class_lock(class);
> -	/* the migrate_write_lock protects zpage access via zs_map_object */
> -	migrate_write_lock(zspage);
> +	/* the zspage write_lock protects zpage access via zs_map_object */
> +	if (!zspage_try_write_lock(zspage)) {
> +		size_class_unlock(class);
> +		pool_write_unlock(pool);
> +		return -EINVAL;
> +	}
> +
> +	/* We're committed, tell the world that this is a Zsmalloc page. */
> +	__zpdesc_set_zsmalloc(newzpdesc);
>  
>  	offset = get_first_obj_offset(zpdesc);
>  	s_addr = kmap_local_zpdesc(zpdesc);
> @@ -1869,7 +1898,7 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>  	 */
>  	pool_write_unlock(pool);
>  	size_class_unlock(class);
> -	migrate_write_unlock(zspage);
> +	zspage_write_unlock(zspage);
>  
>  	zpdesc_get(newzpdesc);
>  	if (zpdesc_zone(newzpdesc) != zpdesc_zone(zpdesc)) {
> @@ -2005,9 +2034,11 @@ static unsigned long __zs_compact(struct zs_pool *pool,
>  		if (!src_zspage)
>  			break;
>  
> -		migrate_write_lock(src_zspage);
> +		if (!zspage_try_write_lock(src_zspage))
> +			break;
> +
>  		migrate_zspage(pool, src_zspage, dst_zspage);
> -		migrate_write_unlock(src_zspage);
> +		zspage_write_unlock(src_zspage);
>  
>  		fg = putback_zspage(class, src_zspage);
>  		if (fg == ZS_INUSE_RATIO_0) {
> -- 
> 2.48.1.362.g079036d154-goog
> 
