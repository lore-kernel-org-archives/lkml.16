Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9894C74
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750789615; cv=none; b=VxJ+7zN8seQ5zDsa7nOwku6jh1VbJDpDcgXE8YX8FyhfpPkg2FV3+camwYekVbwUNN5L1IaB0Dx6lbnw2ddjl7dw0Zj0LB/L7FGWjhY6NggIAHb0RvYDrus0tOGoPHd4dNPr1GiEjleFF1BnZ9nVaFCI+R7CXtNTzRxVilFeXs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750789615; c=relaxed/simple;
	bh=Vz1Pj1ZLcLJV5UEpq4gKmop9YVUOge6kUnXjOL0C3/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KH0hybKH3xGzmgKpXFPLZK0tnXFgPSWdAhawbKiCHEnosTOkK8F8MAfrc19+tRUcdrsy1ylps6VYa+hPBdQvdBGkIZuEOqa2JLbQhXLL1qg5yULOmR7XwDsluLoSrSHGBaiqaYyfO0g/ny4QbpIQPrJeguuzahMp8VXu0ShWiCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enUMS1xk; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enUMS1xk"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso8034981fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750789611; x=1751394411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NOL3VPCbvSk678bwpXffD/cpYf2x6fiZgpK1l3PlTO8=;
        b=enUMS1xkOIGGavx6cwaox21xwfyjlzyT4j3oa+YOGc659jykiswwO0MTNzmI4z+RPT
         qA6yze9SbCCx+ajKIyTngxV/dJyvUuGkS8mPIKRaA92+XENrRWsa3Vwf0fP1XI4EWEK6
         RUnc1EbYfFZDorMn0Yemg0rUXmHuvUgViKQXnoyqFdTOecuEdLyPdUaWm8MwaW4lozpi
         gi15aM/hg0iWLEutNglmxlgXvHm6rM3j00kSwx4+1D2TLRBc17ygT6Y5usLb8Ia/zyYK
         GBRBfPk9Djew0BBtocXJc/OyyEnG39OQojzq1agBTBt1MkpI2/TwDl/mjxz32nRDvHw8
         u15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750789611; x=1751394411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOL3VPCbvSk678bwpXffD/cpYf2x6fiZgpK1l3PlTO8=;
        b=OKjgS0rVHqmowMlyFEmrg7WUQdh+C++J9DtOLssM2BJXTSYdWiuaRmku/Hz8v+OCce
         f03BtAyCZhnDA1JuHDp+RKuRye+Q5PW6/dRfafg6ctChrfaxmTruygjz0VWFrf8wOHwK
         DEXRjC4IrEforijOgMjRmjfWV06oMopfD/csqZZptyM9oHFQ1FKP0ipWHGexo6jUdWCl
         Lhj1e+BOLo2N618tnvbYwZXfQjoX4+TO7ln1iWHtThFvSj90SnRawY+Q5M1WLDzLiV0j
         xgBY9qfL7hp/eDneUKFjKtLz+8kIcJpQGLiK8wNRSgwzojmxqZfNI4ongiERfJYb9n9I
         IHUw==
X-Forwarded-Encrypted: i=1; AJvYcCXWjlzh2lHqbgOxDcjYQa0fX5kVDsqZos3OizZZ+wZljQ8HZXtSItHssQPY6k8soW2a+8dYx8XfaQoUpO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6l50kayQ86C+QZbgEMxdwvLBcF+Gys/gMznS1R5JUWerg1ru8
	/a6LfzSSkXXUmrQLTPfbcVbYlnGoHVV10adJGODg4gvN6HtFcdpGw1Qp
X-Gm-Gg: ASbGnctfmGNyKHAMXuZx95eD8wntMCO1mJ50rN5A3b1zRXQzgSMla/2cZ4vz8CQmRqk
	sWkO7y1DLiVipM06MTrwqqVdd81phjaMvEH6noRpdpGRF6zg3gZyfQdbVlsTrk3KlT9Vjt24ZWf
	0tJm+gEtcEdfyfKa4PQ03Mcjt9aSw5o6SDoYMepcaqgmLUhO0uBt1EAr8mhBt0CMsBpemHrTr69
	d4pe8rKw9a3P5Nqf27dqY0gUILNcMF0lmqdpyUMP83tQjCNKfqgcliShCGQI11OCLMUjcc64zRG
	mhUMk572nh1FdcLERbIrjwiRmn5/xpg85y8J/O98I01AH3k2fO++RpF+IMMqfqBbeC7Wgfn0q29
	P+A==
X-Google-Smtp-Source: AGHT+IEqJlzmpZ6XZwN3lTmPMJwIZc8bxR2EFu7/p6Er1eEArhQP/ehXQjtFlrIlWaev2pwndpdTmw==
X-Received: by 2002:a05:651c:1076:b0:32b:47eb:8bcc with SMTP id 38308e7fff4ca-32b98ed9d8emr39305161fa.13.1750789610496;
        Tue, 24 Jun 2025 11:26:50 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-553e41c426esm1899748e87.180.2025.06.24.11.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:26:50 -0700 (PDT)
Date: Tue, 24 Jun 2025 20:26:49 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: akpm@linux-foundation.org, mhocko@kernel.org, hannes@cmpxchg.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, yosryahmed@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mm/memcg: make memory.reclaim interface generic
Message-ID: <cd22xnrx67lh5bplerw2tnpnlqln5fzmpomm2vvvag5lc6ibn5@7hpbz27v3m6s>
References: <20250623185851.830632-1-dave@stgolabs.net>
 <20250623185851.830632-3-dave@stgolabs.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623185851.830632-3-dave@stgolabs.net>

Hi,

On 2025-06-23 11:58:49 -0700, Davidlohr Bueso wrote:
> This adds a general call for both parsing as well as the
> common reclaim semantics. memcg is still the only user and
> no change in semantics.
> 
> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
> ---
>  mm/internal.h   |  2 +
>  mm/memcontrol.c | 77 ++------------------------------------
>  mm/vmscan.c     | 98 +++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 104 insertions(+), 73 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 3823fb356d3b..fc4262262b31 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -517,6 +517,8 @@ extern unsigned long highest_memmap_pfn;
>  bool folio_isolate_lru(struct folio *folio);
>  void folio_putback_lru(struct folio *folio);
>  extern void reclaim_throttle(pg_data_t *pgdat, enum vmscan_throttle_state reason);
> +int user_proactive_reclaim(char *buf,
> +			   struct mem_cgroup *memcg, pg_data_t *pgdat);
>  
>  /*
>   * in mm/rmap.c:
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 902da8a9c643..015e406eadfa 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -51,7 +51,6 @@
>  #include <linux/spinlock.h>
>  #include <linux/fs.h>
>  #include <linux/seq_file.h>
> -#include <linux/parser.h>
>  #include <linux/vmpressure.h>
>  #include <linux/memremap.h>
>  #include <linux/mm_inline.h>
> @@ -4566,83 +4565,15 @@ static ssize_t memory_oom_group_write(struct kernfs_open_file *of,
>  	return nbytes;
>  }
>  
> -enum {
> -	MEMORY_RECLAIM_SWAPPINESS = 0,
> -	MEMORY_RECLAIM_SWAPPINESS_MAX,
> -	MEMORY_RECLAIM_NULL,
> -};
> -
> -static const match_table_t tokens = {
> -	{ MEMORY_RECLAIM_SWAPPINESS, "swappiness=%d"},
> -	{ MEMORY_RECLAIM_SWAPPINESS_MAX, "swappiness=max"},
> -	{ MEMORY_RECLAIM_NULL, NULL },
> -};
> -
>  static ssize_t memory_reclaim(struct kernfs_open_file *of, char *buf,
>  			      size_t nbytes, loff_t off)
>  {
>  	struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
> -	unsigned int nr_retries = MAX_RECLAIM_RETRIES;
> -	unsigned long nr_to_reclaim, nr_reclaimed = 0;
> -	int swappiness = -1;
> -	unsigned int reclaim_options;
> -	char *old_buf, *start;
> -	substring_t args[MAX_OPT_ARGS];
> -
> -	buf = strstrip(buf);
> -
> -	old_buf = buf;
> -	nr_to_reclaim = memparse(buf, &buf) / PAGE_SIZE;
> -	if (buf == old_buf)
> -		return -EINVAL;
> -
> -	buf = strstrip(buf);
> -
> -	while ((start = strsep(&buf, " ")) != NULL) {
> -		if (!strlen(start))
> -			continue;
> -		switch (match_token(start, tokens, args)) {
> -		case MEMORY_RECLAIM_SWAPPINESS:
> -			if (match_int(&args[0], &swappiness))
> -				return -EINVAL;
> -			if (swappiness < MIN_SWAPPINESS || swappiness > MAX_SWAPPINESS)
> -				return -EINVAL;
> -			break;
> -		case MEMORY_RECLAIM_SWAPPINESS_MAX:
> -			swappiness = SWAPPINESS_ANON_ONLY;
> -			break;
> -		default:
> -			return -EINVAL;
> -		}
> -	}
> -
> -	reclaim_options	= MEMCG_RECLAIM_MAY_SWAP | MEMCG_RECLAIM_PROACTIVE;
> -	while (nr_reclaimed < nr_to_reclaim) {
> -		/* Will converge on zero, but reclaim enforces a minimum */
> -		unsigned long batch_size = (nr_to_reclaim - nr_reclaimed) / 4;
> -		unsigned long reclaimed;
> -
> -		if (signal_pending(current))
> -			return -EINTR;
> -
> -		/*
> -		 * This is the final attempt, drain percpu lru caches in the
> -		 * hope of introducing more evictable pages for
> -		 * try_to_free_mem_cgroup_pages().
> -		 */
> -		if (!nr_retries)
> -			lru_add_drain_all();
> -
> -		reclaimed = try_to_free_mem_cgroup_pages(memcg,
> -					batch_size, GFP_KERNEL,
> -					reclaim_options,
> -					swappiness == -1 ? NULL : &swappiness);
> -
> -		if (!reclaimed && !nr_retries--)
> -			return -EAGAIN;
> +	int ret;
>  
> -		nr_reclaimed += reclaimed;
> -	}

> +	ret = user_proactive_reclaim(buf, memcg, NULL);

This is outside CONFIG_NUMA.

> +	if (ret)
> +		return ret;
>  
>  	return nbytes;
>  }
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index c13c01eb0b42..63ddec550c3b 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -57,6 +57,7 @@
>  #include <linux/rculist_nulls.h>
>  #include <linux/random.h>
>  #include <linux/mmu_notifier.h>
> +#include <linux/parser.h>
>  
>  #include <asm/tlbflush.h>
>  #include <asm/div64.h>
> @@ -6714,6 +6715,15 @@ unsigned long try_to_free_mem_cgroup_pages(struct mem_cgroup *memcg,
>  
>  	return nr_reclaimed;
>  }
> +#else
> +unsigned long try_to_free_mem_cgroup_pages(struct mem_cgroup *memcg,
> +					   unsigned long nr_pages,
> +					   gfp_t gfp_mask,
> +					   unsigned int reclaim_options,
> +					   int *swappiness)
> +{
> +	return 0;
> +}
>  #endif
>  
>  static void kswapd_age_node(struct pglist_data *pgdat, struct scan_control *sc)
> @@ -7708,6 +7718,94 @@ int node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask, unsigned int order)
>  
>  	return ret;
>  }
> +
> +enum {
> +	MEMORY_RECLAIM_SWAPPINESS = 0,
> +	MEMORY_RECLAIM_SWAPPINESS_MAX,
> +	MEMORY_RECLAIM_NULL,
> +};
> +static const match_table_t tokens = {
> +	{ MEMORY_RECLAIM_SWAPPINESS, "swappiness=%d"},
> +	{ MEMORY_RECLAIM_SWAPPINESS_MAX, "swappiness=max"},
> +	{ MEMORY_RECLAIM_NULL, NULL },
> +};
> +
> +int user_proactive_reclaim(char *buf, struct mem_cgroup *memcg, pg_data_t *pgdat)
> +{
> +	unsigned int nr_retries = MAX_RECLAIM_RETRIES;
> +	unsigned long nr_to_reclaim, nr_reclaimed = 0;
> +	int swappiness = -1;
> +	char *old_buf, *start;
> +	substring_t args[MAX_OPT_ARGS];
> +
> +	if (!buf || (!memcg && !pgdat))
> +		return -EINVAL;
> +
> +	buf = strstrip(buf);
> +
> +	old_buf = buf;
> +	nr_to_reclaim = memparse(buf, &buf) / PAGE_SIZE;
> +	if (buf == old_buf)
> +		return -EINVAL;
> +
> +	buf = strstrip(buf);
> +
> +	while ((start = strsep(&buf, " ")) != NULL) {
> +		if (!strlen(start))
> +			continue;
> +		switch (match_token(start, tokens, args)) {
> +		case MEMORY_RECLAIM_SWAPPINESS:
> +			if (match_int(&args[0], &swappiness))
> +				return -EINVAL;
> +			if (swappiness < MIN_SWAPPINESS ||
> +			    swappiness > MAX_SWAPPINESS)
> +				return -EINVAL;
> +			break;
> +		case MEMORY_RECLAIM_SWAPPINESS_MAX:
> +			swappiness = SWAPPINESS_ANON_ONLY;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	while (nr_reclaimed < nr_to_reclaim) {
> +		/* Will converge on zero, but reclaim enforces a minimum */
> +		unsigned long batch_size = (nr_to_reclaim - nr_reclaimed) / 4;
> +		unsigned long reclaimed;
> +
> +		if (signal_pending(current))
> +			return -EINTR;
> +
> +		/*
> +		 * This is the final attempt, drain percpu lru caches in the
> +		 * hope of introducing more evictable pages.
> +		 */
> +		if (!nr_retries)
> +			lru_add_drain_all();
> +
> +		if (memcg) {
> +			unsigned int reclaim_options;
> +
> +			reclaim_options = MEMCG_RECLAIM_MAY_SWAP |
> +					  MEMCG_RECLAIM_PROACTIVE;
> +			reclaimed = try_to_free_mem_cgroup_pages(memcg,
> +						 batch_size, GFP_KERNEL,
> +						 reclaim_options,
> +						 swappiness == -1 ? NULL : &swappiness);
> +		} else {
> +			return -EINVAL;
> +		}
> +
> +		if (!reclaimed && !nr_retries--)
> +			return -EAGAIN;
> +
> +		nr_reclaimed += reclaimed;
> +	}
> +
> +	return 0;
> +}
> +
>  #endif

Should this really be inside CONFIG_NUMA? It was moved from outside of
CONFIG_NUMA where it's now called which results in a build failure if
it's disabled. Or is there a stub missing?

>  
>  /**
> -- 
> 2.39.5
> 

Regards,
Klara Modin
