Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn [202.108.3.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E821B4253
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738324047; cv=none; b=PPRk6OiiJYfPixv9l3qoVyL8rxw1u/e6y7SPIL/XbuAZsVtGjkawomshqvNyGUrfFg0wjOQJtkHczxGeqjC4b+6i90RIdksb/2hopgC/WBeY+EQjQi0SnkmBCXCwyNTtFJWQWdUrgni0MY3tEAB2tPN+zUEO6HC3LFR4KjpMNoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738324047; c=relaxed/simple;
	bh=G0zBmiWgwLVTZGTlXktqVquVQj7mZ2BvYn4kO4oV+CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4+fI/NKPHBHhJltmW10Db4cGrAl1k1Se6Tv9RL+ppdeeIXggNZr63ro7bS7gCixX4Rq63tNC5mYq+B6u7FWW4Gf3MBycepqKWGQXJNWQ/nKo9LZbJ17ISLlXFaDa6eWsI0XlspTNAt2I40pgAfJsRXtPiKhtZm/F+bXQl/Kv9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.56.205])
	by sina.com (10.182.253.24) with ESMTP
	id 679CB70000007643; Fri, 31 Jan 2025 19:41:54 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 7901151048633
X-SMAIL-UIID: 41743EF9D83B418388C82C14F66606BF-20250131-194154-1
From: Hillf Danton <hdanton@sina.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Date: Fri, 31 Jan 2025 19:41:40 +0800
Message-ID: <20250131114141.1870-1-hdanton@sina.com>
In-Reply-To: <20250131090658.3386285-2-senozhatsky@chromium.org>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 31 Jan 2025 18:06:00 +0900 Sergey Senozhatsky
> Concurrent modifications of meta table entries is now handled
> by per-entry spin-lock.  This has a number of shortcomings.
> 
> First, this imposes atomic requirements on compression backends.
> zram can call both zcomp_compress() and zcomp_decompress() under
> entry spin-lock, which implies that we can use only compression
> algorithms that don't schedule/sleep/wait during compression and
> decompression.  This, for instance, makes it impossible to use
> some of the ASYNC compression algorithms (H/W compression, etc.)
> implementations.
> 
> Second, this can potentially trigger watchdogs.  For example,
> entry re-compression with secondary algorithms is performed
> under entry spin-lock.  Given that we chain secondary
> compression algorithms and that some of them can be configured
> for best compression ratio (and worst compression speed) zram
> can stay under spin-lock for quite some time.
> 
> Do not use per-entry spin-locks and instead convert it to an
> atomic_t variable which open codes reader-writer type of lock.
> This permits preemption from slot_lock section, also reduces
> the sizeof() zram entry when lockdep is enabled.
> 
Nope, the price of cut in size will be paid by extra hours in debugging,
given nothing is free.

> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/block/zram/zram_drv.c | 126 ++++++++++++++++++++--------------
>  drivers/block/zram/zram_drv.h |   6 +-
>  2 files changed, 79 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index 9f5020b077c5..1c2df2341704 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -58,19 +58,50 @@ static void zram_free_page(struct zram *zram, size_t index);
>  static int zram_read_from_zspool(struct zram *zram, struct page *page,
>  				 u32 index);
>  
> -static int zram_slot_trylock(struct zram *zram, u32 index)
> +static bool zram_slot_try_write_lock(struct zram *zram, u32 index)
>  {
> -	return spin_trylock(&zram->table[index].lock);
> +	atomic_t *lock = &zram->table[index].lock;
> +	int old = ZRAM_ENTRY_UNLOCKED;
> +
> +	return atomic_try_cmpxchg(lock, &old, ZRAM_ENTRY_WRLOCKED);
> +}
> +
> +static void zram_slot_write_lock(struct zram *zram, u32 index)
> +{
> +	atomic_t *lock = &zram->table[index].lock;
> +	int old = atomic_read(lock);
> +
> +	do {
> +		if (old != ZRAM_ENTRY_UNLOCKED) {
> +			cond_resched();
> +			old = atomic_read(lock);
> +			continue;
> +		}
> +	} while (!atomic_try_cmpxchg(lock, &old, ZRAM_ENTRY_WRLOCKED));
> +}
> +
> +static void zram_slot_write_unlock(struct zram *zram, u32 index)
> +{
> +	atomic_set(&zram->table[index].lock, ZRAM_ENTRY_UNLOCKED);
>  }
>  
> -static void zram_slot_lock(struct zram *zram, u32 index)
> +static void zram_slot_read_lock(struct zram *zram, u32 index)
>  {
> -	spin_lock(&zram->table[index].lock);
> +	atomic_t *lock = &zram->table[index].lock;
> +	int old = atomic_read(lock);
> +
> +	do {
> +		if (old == ZRAM_ENTRY_WRLOCKED) {
> +			cond_resched();
> +			old = atomic_read(lock);
> +			continue;
> +		}
> +	} while (!atomic_try_cmpxchg(lock, &old, old + 1));
>  }
>  
> -static void zram_slot_unlock(struct zram *zram, u32 index)
> +static void zram_slot_read_unlock(struct zram *zram, u32 index)
>  {
> -	spin_unlock(&zram->table[index].lock);
> +	atomic_dec(&zram->table[index].lock);
>  }
>  
Given no boundaries of locking section marked in addition to lockdep, 
this is another usual case of inventing lock in 2025.

What sense could be made by exercising molar tooth extraction in the
kitchen because of pain afetr downing a pint of vodka instead of 
directly driving to see your dentist?
