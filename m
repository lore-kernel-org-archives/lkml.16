Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09852234966
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744136235; cv=none; b=K0YxaR3BsXytslGTjfrWZqbCJuUTpwuOusY+faNH0LnKMnsF9qVLE05zueIF1nrE8+JH4NkwiFQUwOudkzP83I+8O1nh6QArRKXg/7XojdP4jjpDIAPdvEGdEDI6WUcDn23OhShldjilVT9s/Y5yX2Elwd06xYGV9olOhGXeWQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744136235; c=relaxed/simple;
	bh=ydoM4qAHsauaE2BUGJHhRcKs6UHNR6BdfdHPHQA0l28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxZw6WiY7bkOVV90hiZNESKqOET2JU1mpGO9WsZK5WjTXYiYuaxqKke+7VZCBmODcnIUMTrHnRmAOMPQNK92o25MMIOmIwIaAJWtQcAiKm4CmR8sbftDRiHFyHxxsCM3zqnzeerDXqC5x4CtnYEWgyoJRYd7vQhn7U3bVehoIsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=qyeKAMjP; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="qyeKAMjP"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e900a7ce55so86965116d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 11:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744136230; x=1744741030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BrHRR9y6PG02gx4V+fHyD3RAGrPoiHPM2zS7NCT7idM=;
        b=qyeKAMjPriSVS2tSfcyEXmV8elom2Or1W7p901YhMUzf1FCnvD2i7i/Fwti/9LFxAo
         Jm9oh8a9MW9xAnbxzk1P+uc36RGH384lSAqw7fRSYrs9f8l1XHwKdEKswsqCvC9dVYum
         KUVoJY1p05f6yeWmYp6PqjhSc/VjU1mxqDc7lKiEfsgwiD2Ih/qKj51ZJhhbiZwxuTkf
         j7bLRQkBetKwHAYhqn3xhbSdi8FXWXrUabq2SjeyqTA+aFBPajtw8N5Tj4kpxxWtSaTn
         1u7PPN9uRM16JGk2wqvbkCXD5/kp9pcnzBIqEVuDbZeNWpXXYWHgUJp7a2KkID0TEiqr
         M/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744136230; x=1744741030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrHRR9y6PG02gx4V+fHyD3RAGrPoiHPM2zS7NCT7idM=;
        b=JlbBYuDAyi1jdRDEoY838nTGHRCr/kaiRcQWkHSADu2yGzudHDWgtj2p5OJX/D9ODt
         AB0n5ZgQg6eEe5cj374tJwXmuqUb/Spcv8tHmqXDUbqAXq6Rjo+/K4ae3Sq722ve0N8C
         WuTgTRrQ7MK4QyQy62WuVjrD1qKY30yOCwf6Md36qHsJT7KZdczqQTCb0iaRk9KxrCLy
         RY42c+p7d+EYqzesypdhnoBu9CuvjKX1n31+GO0RX41H8YmD85aHhM91/2ZRDzXg+C27
         0kvSOg2tmM0WP5XzCcPD1xFan6sgn/5dGrFLT3XdpssBiJ0SpASleDaeb0j87JrBNhf1
         kCnw==
X-Forwarded-Encrypted: i=1; AJvYcCVGp+Zt0KE+GbR7mEDH9Rvsknz0QBZTw7nGclkeuLRb/YYF5lShKbp7Uxm1EkW9cZXbAvHVlfAFCKVzPGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQmjRxwoFuv94rVsYpd1CMexlpC741gZ5bJIn1i33AT/7JQD5Y
	4VecWBeZAe/B99yZvOVcSqOf2fkmc617Z7z4IPJoyBondSqp6uICne5Y9YhJ0hg=
X-Gm-Gg: ASbGncv08LgX8FiA+zvtPenDNNmnU1WNCdJ+p4jsvxYqSvzNVFLnNRvuJbYEI2/UXrq
	tF4oC4UNYBqs+il8ST5ClpD4V+ms4ECAUQ6iNSMn3y02Ga13xMyUBt+H7UZklSnkAO8ep/QAPoh
	ms75VbDyLdaD3DINiNNONFDKQTc0jSCqh45JZKNjEb73LA2z3whjqQlqxlAcCh8BGm7g/1t5mX7
	gFhW6Bp5WIbeYL26GEYB8WKu8CSnAc16oduDy3hwaBunSJkcpsI6x8gqSJJwlNHtx5Rp68ZsMBe
	k9uGbyFqQB10XkH5YdhdnHDZYkGKOLGIHo4pl1btOtk=
X-Google-Smtp-Source: AGHT+IGetL0w8Iqx6ksx4UMXO4UBW+UpVV0Mr2wV49qnLQpAF+xnj3dG0U6YvK047fPnsSyEL3Dviw==
X-Received: by 2002:a05:6214:1c46:b0:6ea:face:e33f with SMTP id 6a1803df08f44-6f0dbb80e6bmr4085246d6.3.1744136230650;
        Tue, 08 Apr 2025 11:17:10 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0efc0d42sm77385086d6.13.2025.04.08.11.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:17:09 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:17:05 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	longman@redhat.com, tj@kernel.org, mkoutny@suse.com,
	akpm@linux-foundation.org
Subject: Re: [RFC PATCH] vmscan,cgroup: apply mems_effective to reclaim
Message-ID: <20250408181705.GE816@cmpxchg.org>
References: <20250320210919.439964-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320210919.439964-1-gourry@gourry.net>

On Thu, Mar 20, 2025 at 05:09:19PM -0400, Gregory Price wrote:
> @@ -4296,3 +4296,13 @@ void cpuset_task_status_allowed(struct seq_file *m, struct task_struct *task)
>  	seq_printf(m, "Mems_allowed_list:\t%*pbl\n",
>  		   nodemask_pr_args(&task->mems_allowed));
>  }
> +
> +bool memcg_mems_allowed(struct mem_cgroup *memcg, int nid)

This should probably be

	cgroup_mems_allowed(struct cgroup *, int)

and then have a

	mem_cgroup_mems_allowed(struct mem_cgroup *, int)

that does the e_css translation, with the necessary dummy functions to
work with all CONFIG combinations.

> +{
> +	struct cgroup_subsys_state *css;
> +	struct cpuset *cs;
> +
> +	css = cgroup_get_e_css(memcg->css.cgroup, &cpuset_cgrp_subsys);
> +	cs = css ? container_of(css, struct cpuset, css) : NULL;
> +	return cs ? node_isset(nid, cs->effective_mems) : true;

You need a css_put() to drop the ref from cgroup_get_e_css(), but
otherwise accessing css should be safe this way.

AFAICS you need callback_lock to query cs->effective_mems.

> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 2b2ab386cab5..04152ea1c03d 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -342,16 +342,22 @@ static void flush_reclaim_state(struct scan_control *sc)
>  	}
>  }
>  
> -static bool can_demote(int nid, struct scan_control *sc)
> +static bool can_demote(int nid, struct scan_control *sc,
> +		       struct mem_cgroup *memcg)
>  {
> +	int demotion_nid;
> +
>  	if (!numa_demotion_enabled)
>  		return false;
>  	if (sc && sc->no_demotion)
>  		return false;
> -	if (next_demotion_node(nid) == NUMA_NO_NODE)
> +
> +	demotion_nid = next_demotion_node(nid);
> +	if (demotion_nid == NUMA_NO_NODE)
>  		return false;
>  
> -	return true;
> +	/* If demotion node isn't in mems_allowed, fall back */
> +	return memcg ? memcg_mems_allowed(memcg, demotion_nid) : true;
>  }
>  
>  static inline bool can_reclaim_anon_pages(struct mem_cgroup *memcg,
> @@ -376,7 +382,7 @@ static inline bool can_reclaim_anon_pages(struct mem_cgroup *memcg,
>  	 *
>  	 * Can it be reclaimed from this node via demotion?
>  	 */
> -	return can_demote(nid, sc);
> +	return can_demote(nid, sc, NULL);

This has appropriate memcg context from get_scan_count(), use that.

> @@ -2654,7 +2662,7 @@ static bool can_age_anon_pages(struct pglist_data *pgdat,
>  		return true;
>  
>  	/* Also valuable if anon pages can be demoted: */
> -	return can_demote(pgdat->node_id, sc);
> +	return can_demote(pgdat->node_id, sc, NULL);

Make this take an lruvec, then pass lruvec_memcg() to can_demote().

shrink_lruvec() already has the lruvec.

kswapd_age_node() has to do the test from inside the memcg loop, since
demotion and thus aging now very much depends on each cgroup's policy.

>  }
>  
>  #ifdef CONFIG_LRU_GEN
> @@ -2732,7 +2740,7 @@ static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
>  	if (!sc->may_swap)
>  		return 0;
>  
> -	if (!can_demote(pgdat->node_id, sc) &&
> +	if (!can_demote(pgdat->node_id, sc, NULL) &&
>  	    mem_cgroup_get_nr_swap_pages(memcg) < MIN_LRU_BATCH)
>  		return 0;

MGLRU, so grain of salt, but that memcg looks appropriate for passing.

> @@ -4695,7 +4703,7 @@ static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, int swap
>  	if (list_empty(&list))
>  		return scanned;
>  retry:
> -	reclaimed = shrink_folio_list(&list, pgdat, sc, &stat, false);
> +	reclaimed = shrink_folio_list(&list, pgdat, sc, &stat, false, NULL);

This also seems to have appropriate lruvec/memcg context.
