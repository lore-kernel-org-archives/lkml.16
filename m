Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632B0197A88
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547382; cv=none; b=THcnctQyDoK8YVvUX1NyAkophaRCZEBC9XsEuupjeJYQPeRktcfm/vnDPn0I4zBXEaWKvUzJmPATmZfkwTPcxafS8vooNrDcMJwwY+IluIdOlHK7xehLF8fDBMI8dZPL2Sl4JoPWVYPTEpJl31kHgLPMLpz7rdaj6UcP9swVJCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547382; c=relaxed/simple;
	bh=Ngon1rOvh4RFX5CEaVji23SFYnQZu1vnqnMviHGLea0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvUEbPT9H+ppkyzT7B5uWedqNqpA5D3hPN6SPkHx1hfOv6QbhVpPDK/aVNdc6FiKRWvkS67m8inco1NIFGsuYPty+YBPtEMvkfovi9gt+NU5RbM3NOp4o+tRoVRH1rpo6MMW6tap6k4YJ7uoXsxZD/KFRjBa/A4T9xJlaDFBIG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N/424Avk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N/424Avk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749547379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MR5JMrCvrHVsNFBfAqJ6DkGHRC1G2KuGjs5kNc+k2aw=;
	b=N/424AvkeyM+Ghf3Hl8M5ho8+9tDM8eUsPRBf6LUCwDzSqixOm6TMxuwZoOUWvo7CBE/Bt
	UVc2yREH1ulTgWFMRSvhVz4el6IeRdwnayl2OurXPgXYaU7028IBVD8JEcSDo0PFzsMuw0
	muHdtAWsiEPlx7tCzjlIYhSlGFGatmA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-BEynfTR2NH2O_9wXp99lsQ-1; Tue, 10 Jun 2025 05:22:58 -0400
X-MC-Unique: BEynfTR2NH2O_9wXp99lsQ-1
X-Mimecast-MFC-AGG-ID: BEynfTR2NH2O_9wXp99lsQ_1749547377
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4eb9c80deso1931427f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547377; x=1750152177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MR5JMrCvrHVsNFBfAqJ6DkGHRC1G2KuGjs5kNc+k2aw=;
        b=cKL8zJ5fy0Ty8DQNiISWP5+J+f8PIjtWYtEAh1baq3hedtWK0HFX+FrJQisVLNl8dO
         9kjHAsWSC+pcigRliXbShM0Yer5zjvG4hfQ3fhK/T4ko6O3VfDvN6QtXXH6yFq3gyYf0
         nrJts2IKNJzQStCMJXi/ofMZt1bl0lr9ltSCevviSvIhpkSTNUwJgo7uxtXqoBdfMARH
         JISXkTp7/EhzsTaRLLRALcWY1zo9U6GvgyLaol1qEjbxnQG/a/vfqid/hlx/FyohkQSD
         gaarPRZP0tkpOFnaFdEYTbpvT1nYBAJRLwYtngwY9y4VjjqzThSSb+u+5bOh9nP8AruP
         rzjw==
X-Forwarded-Encrypted: i=1; AJvYcCUbm6OXWus6n2Ge/8Rq80WsVS5I4UapXrL8aXqKiahkK1TBFeUKsMr/lHtBB33uDZjqwFq//uRmH+WsPF4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy3SKm0rZ+k6TB5DXl0LxBVc15kGnRUmIltBggnOusoU2YWdC5
	hafBpm1QMXU8pG1Adhgv5WkNBSb/jMrEE9jkRRm9vYS1k2kkTamv+S2zuJh/EpfVM+55SzauOOo
	xTGajjnt/cIBGpQEBFQ+8TiAqGnu7kx8lVoszBXQJVTGI9r7FJKeejRpnF1fxuEOOTQ==
X-Gm-Gg: ASbGncsUl4+u/vZOjtQ/3ye5JH6TrNT/jq45QxjXIZij9XBG79qZsL8wd8oM8SPUKv4
	sackX0eGdB6FHvO0Nm8bXns87Qmmmw0i1SdRp+UbaYB6/T05ZlOcntRvUQ8dwdbvP9/LRRiKWki
	pegJKJoDmhnw4JmsFn8isX0AYA7cT5q70HOkLc51iVIfwN2SOzD5HBBKwjbBI0ZEoK1S9G8teoc
	8KXWVu5UhlOl459qwk8lTqDjT5LwShMnYNXaIf8CyyULcU0ohfGUZxqT4RHyca3uOUBBZyYqh1Z
	23/+TMQQu6UvSoeddBNlU1qVPhxXsDJ391GnMPKkzsxz+NObQRh6
X-Received: by 2002:a05:6000:2507:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3a531cb8d5cmr13019350f8f.31.1749547376949;
        Tue, 10 Jun 2025 02:22:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmVy0TpVqTgSVUJAT3JkKX5oH9S1rZn34gZVf6lBrJ9MwrctQLdZgmyQvMa7ZzoguEU3Xnog==
X-Received: by 2002:a05:6000:2507:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3a531cb8d5cmr13019319f8f.31.1749547376570;
        Tue, 10 Jun 2025 02:22:56 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.57.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b4e2fsm11748652f8f.36.2025.06.10.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:22:56 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:22:54 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Yuri Andriaccio <yurand2000@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: Re: [RFC PATCH 9/9] sched/deadline: Allow deeper hierarchies of RT
 cgroups
Message-ID: <aEf5bu-50HTXI-wa@jlelli-thinkpadt14gen4.remote.csb>
References: <20250605071412.139240-1-yurand2000@gmail.com>
 <20250605071412.139240-10-yurand2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605071412.139240-10-yurand2000@gmail.com>

Hello,

On 05/06/25 09:14, Yuri Andriaccio wrote:
> From: luca abeni <luca.abeni@santannapisa.it>
> 
> Allow creation of cgroup hierachies with depth greater than two.
> Add check to prevent attaching tasks to a child cgroup of an active cgroup (i.e.
> with a running FIFO/RR task).
> Add check to prevent attaching tasks to cgroups which have children with
> non-zero runtime.
> Update rt-cgroups allocated bandwidth accounting for nested cgroup hierachies.
> 
> Co-developed-by: Yuri Andriaccio <yurand2000@gmail.com>
> Signed-off-by: Yuri Andriaccio <yurand2000@gmail.com>
> Signed-off-by: luca abeni <luca.abeni@santannapisa.it>
> ---
>  kernel/sched/core.c     |  6 ----
>  kernel/sched/deadline.c | 69 ++++++++++++++++++++++++++++++++++-------
>  kernel/sched/rt.c       | 25 +++++++++++++--
>  kernel/sched/sched.h    |  2 +-
>  kernel/sched/syscalls.c |  4 +++
>  5 files changed, 84 insertions(+), 22 deletions(-)

...

> @@ -434,24 +463,40 @@ int dl_init_tg(struct sched_dl_entity *dl_se, u64 rt_runtime, u64 rt_period)
>  	if (rt_period & (1ULL << 63))
>  		return 0;
>  
> +	is_active_group = is_active_sched_group(tg);
> +
>  	raw_spin_rq_lock_irq(rq);
>  	is_active = dl_se->my_q->rt.rt_nr_running > 0;
>  	old_runtime = dl_se->dl_runtime;
>  	dl_se->dl_runtime  = rt_runtime;
>  	dl_se->dl_period   = rt_period;
>  	dl_se->dl_deadline = dl_se->dl_period;
> -	if (is_active) {
> -		sub_running_bw(dl_se, dl_se->dl_rq);
> -	} else if (dl_se->dl_non_contending) {
> -		sub_running_bw(dl_se, dl_se->dl_rq);
> -		dl_se->dl_non_contending = 0;
> -		hrtimer_try_to_cancel(&dl_se->inactive_timer);
> +	if (is_active_group) {
> +		if (is_active) {
> +			sub_running_bw(dl_se, dl_se->dl_rq);
> +		} else if (dl_se->dl_non_contending) {
> +			sub_running_bw(dl_se, dl_se->dl_rq);
> +			dl_se->dl_non_contending = 0;
> +			hrtimer_try_to_cancel(&dl_se->inactive_timer);
> +		}
> +		__sub_rq_bw(dl_se->dl_bw, dl_se->dl_rq);
> +		dl_se->dl_bw = to_ratio(dl_se->dl_period, dl_se->dl_runtime);
> +		__add_rq_bw(dl_se->dl_bw, dl_se->dl_rq);
> +	} else {
> +		dl_se->dl_bw = to_ratio(dl_se->dl_period, dl_se->dl_runtime);
> +	}
> +
> +	// add/remove the parent's bw
> +	if (tg->parent && tg->parent != &root_task_group)
> +	{
> +		if (rt_runtime == 0 && old_runtime != 0 && !sched_group_has_active_siblings(tg)) {
> +			__add_rq_bw(tg->parent->dl_se[cpu]->dl_bw, dl_se->dl_rq);
> +		} else if (rt_runtime != 0 && old_runtime == 0 && !sched_group_has_active_siblings(tg)) {
> +			__sub_rq_bw(tg->parent->dl_se[cpu]->dl_bw, dl_se->dl_rq);
> +		}

Don't we need to do something also when rt_runtime changes
({in,de}creases) and old_runtime wasn't zero? Like for example giving a
bit of bandwidth back to the parent if a child bandwidth is reduced, but
not completely set to zero.

Thanks,
Juri

