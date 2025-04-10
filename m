Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4028D2AD21
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744250981; cv=none; b=jPxDYm/xoiQC41Bm2XTXheWymlPUhKtjafyO4NBhSMZa6SHecPOZ5/8RAULF+spOxk/d4J1LQQ3FffXhMJzChvm5J+gvZOcLrkr4l+yFhFSecE/XIDbki5qnLwMFP7VeBmsqY4H7ZNj4POe8iw4Npg9IV/944clYY+0Qt36C/8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744250981; c=relaxed/simple;
	bh=5WAZIPN/EyEP4Yvj8qfVcq+vQ3y8dvMh/Wpf8md2JD8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MZraJKEKkWKatubz74gv9shCwa6OIpwHUC7qviids7JyMyjdFHdLxkT5Ne1LSBwXQBTHAFI6QdngL7VGvesU3CywfnKFXA87xKRJ9BZAcmoCD8QN6MM0fZl5fyxxMT6uLRNPOrt5zfVJ8TjEea8u8FE/31iRJM1wuVZHJsFTHKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f/bxq3xo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f/bxq3xo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E0BC4CEE2;
	Thu, 10 Apr 2025 02:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744250979;
	bh=5WAZIPN/EyEP4Yvj8qfVcq+vQ3y8dvMh/Wpf8md2JD8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f/bxq3xooKH2KD17rgbjqplyz2lCOlegYIHe9RY2N2BGCV7XFuLEzpe3+FfCcX3OQ
	 xRlzKOGOFCozENPuywXyNF2Ra+MXFezgzsV43XoYUD9+N2mZVRfJQPs4D+7gOEMcC+
	 9LQbbsX98fjRqRNus5xL5k3zNkrvMqYifdr7WT64=
Date: Wed, 9 Apr 2025 19:09:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: hannes@cmpxchg.org, mhocko@suse.com, yosry.ahmed@linux.dev,
 muchun.song@linux.dev, yuzhao@google.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/3] mm: add max swappiness arg to lru_gen for
 anonymous memory only
Message-Id: <20250409190938.f6befeeb9e86ad72f46503a5@linux-foundation.org>
In-Reply-To: <b3af3747daefa00177b48f4666780da58177f7c0.1744169302.git.hezhongkun.hzk@bytedance.com>
References: <cover.1744169302.git.hezhongkun.hzk@bytedance.com>
	<b3af3747daefa00177b48f4666780da58177f7c0.1744169302.git.hezhongkun.hzk@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Apr 2025 15:06:19 +0800 Zhongkun He <hezhongkun.hzk@bytedance.com> wrote:

> The MGLRU

paging yuzhao?

> already supports reclaiming only from anonymous memory
> via the /sys/kernel/debug/lru_gen interface. Now, memory.reclaim
> also supports the swappiness=max parameter to enable reclaiming
> solely from anonymous memory. To unify the semantics of proactive
> reclaiming from anonymous folios, the max parameter is introduced.
> 
> Additionally, the use of SWAPPINESS_ANON_ONLY in place of
> 'MAX_SWAPPINESS + 1' improves code clarity and makes the intention
> more explicit.
> 
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -2697,8 +2697,11 @@ static bool should_clear_pmd_young(void)
>  		READ_ONCE((lruvec)->lrugen.min_seq[LRU_GEN_FILE]),	\
>  	}
>  
> +#define max_evictable_type(swappiness)						\
> +	((swappiness) != SWAPPINESS_ANON_ONLY)
> +
>  #define evictable_min_seq(min_seq, swappiness)				\
> -	min((min_seq)[!(swappiness)], (min_seq)[(swappiness) <= MAX_SWAPPINESS])
> +	min((min_seq)[!(swappiness)], (min_seq)[max_evictable_type(swappiness)])

Why oh why did we implement these in cpp?

>  
> @@ -3857,7 +3860,7 @@ static bool inc_min_seq(struct lruvec *lruvec, int type, int swappiness)
>  	int hist = lru_hist_from_seq(lrugen->min_seq[type]);
>  	int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
>  
> -	if (type ? swappiness > MAX_SWAPPINESS : !swappiness)
> +	if (type ? (swappiness == SWAPPINESS_ANON_ONLY) : !swappiness)

This expression makes my brain bleed.

	if (type) {
		if (swappiness == SWAPPINESS_ANON_ONLY) {
			/*
			 * Nice comment explaining why we're doing this
			 */
			goto done;;
		}
	} else {
		if (!swappiness) {
			/*
			 * Nice comment explaining why we're doing this
			 */
			goto done;
		}
	}

or

	if (type && (swappiness == SWAPPINESS_ANON_ONLY)) {
		/*
		 * Nice comment explaining why we're doing this
		 */
		goto done;
	}

	if (!type && !swappiness) {
		/*
		 * Nice comment explaining why we're doing this
		 */
		goto done;
	}

It's much more verbose, but it has the huge advantage that it creates
locations where we can add comments which tell readers what's going on.
Which is pretty important, no?
	
>  		goto done;
>  
>  	/* prevent cold/hot inversion if the type is evictable */
> @@ -5523,7 +5526,7 @@ static int run_cmd(char cmd, int memcg_id, int nid, unsigned long seq,
>  
>  	if (swappiness < MIN_SWAPPINESS)
>  		swappiness = get_swappiness(lruvec, sc);
> -	else if (swappiness > MAX_SWAPPINESS + 1)
> +	else if (swappiness > SWAPPINESS_ANON_ONLY)
>  		goto done;
>  
>  	switch (cmd) {
> @@ -5580,7 +5583,7 @@ static ssize_t lru_gen_seq_write(struct file *file, const char __user *src,
>  	while ((cur = strsep(&next, ",;\n"))) {
>  		int n;
>  		int end;
> -		char cmd;
> +		char cmd, swap_string[5];
>  		unsigned int memcg_id;
>  		unsigned int nid;
>  		unsigned long seq;
> @@ -5591,13 +5594,22 @@ static ssize_t lru_gen_seq_write(struct file *file, const char __user *src,
>  		if (!*cur)
>  			continue;
>  
> -		n = sscanf(cur, "%c %u %u %lu %n %u %n %lu %n", &cmd, &memcg_id, &nid,
> -			   &seq, &end, &swappiness, &end, &opt, &end);
> +		n = sscanf(cur, "%c %u %u %lu %n %4s %n %lu %n", &cmd, &memcg_id, &nid,
> +			   &seq, &end, swap_string, &end, &opt, &end);

Permits userspace to easily overrun swap_string[].  OK, it's root-only,
but still, why permit this?

>  		if (n < 4 || cur[end]) {
>  			err = -EINVAL;
>  			break;
>  		}
>  
> +		/* set by userspace for anonymous memory only */
> +		if (!strncmp("max", swap_string, sizeof("max"))) {

Can sscanf() give us a non null-terminated string?

> +			swappiness = SWAPPINESS_ANON_ONLY;
> +		} else {
> +			err = kstrtouint(swap_string, 0, &swappiness);
> +			if (err)
> +				break;
> +		}
> +
>  		err = run_cmd(cmd, memcg_id, nid, seq, &sc, swappiness, opt);
>  		if (err)
>  			break;

