Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7788A1CD1F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527100; cv=none; b=QuV13xrAmW/VZwfpW1p0hDndFh+sxhcc4NdfoDCYmq+f/L6Ez5n5/ZN6lwx8tUI/8puO6FwJYkAkfKCLqKv7svnYusOowLqFj0Zqj+gGGSfYI+IpOQxgsbG1s9lkzMbgwVrnsqO+F8PfUNrxCaQ7wL9QkrtcWpfUpOEocO0LuOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527100; c=relaxed/simple;
	bh=vWoAdHNT9dd3kmOET57D1RdtIdG/KJyt3MCXEz886Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdFoMKDtiKCjpz8bSnrLpD1CQaTUMea/GPn6R0ApVB4sB3GMQ/YAimAWYKLIRoIwbBk6juUkLRRxRm0gUBjUIMOnkZjT5KDA56JXUSIa4ZUQxfV/L6digNlpMNUUOXhAh11E4wON0yjW3semxEcls624i4BAEwOqbpF4s5We3Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=d2AUedlz; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="d2AUedlz"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so442470f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 00:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751527097; x=1752131897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mG01uxxuqJ9iemH3cjez1DYwYu6rrP5iiZFvrszPV3E=;
        b=d2AUedlzUqTzTrQACS0TDFKY00F+Dff93orqg9xgTV2+SQCcEwkMHeFzP41/jB4R2H
         yoeeBdMxfo+6FNmlnRh3tJ2zFfrd5dUKNwZ7gEXyIlAIT8oB8E6k3J+88tOTDsA8eGO6
         j2z57Gf/2wOckxXq5ZLRp634ZWe6bBAkRXdYgfa6WJiU4rmU1PWmrAPnqSnCA3U2YgLB
         4GJuEzTDqML+KYlqZQIICZwNsb8m96ugtr869d5sdM9EHoizj0EDVoYpDqI8JjSgrHs2
         Hs9BLOYFAy8um1RQAjdrYCMPfXVO/qRe88yYmqb/Xztb3RciPlaLlsNiw31kNpQGpx61
         09iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751527097; x=1752131897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mG01uxxuqJ9iemH3cjez1DYwYu6rrP5iiZFvrszPV3E=;
        b=VJ2QVLQG165MmiewSKs5PzCsV6hDVgBqdngpNbq1mzPQpSOZtGuYMzWQf2Vd+cl3Hx
         tD5kNUuVPxm2BrwRVzJjHkPsG4mgeIUpsE2FBKp34O1rG4XafOCRgbGZKGFZaBS1Zopp
         HtqOzxcrYT8BnhAFlfYK5QH39I6M8ntBy9z7X1MdXrXNJF1ixCEFq5jXAZA2V9vxd/Pa
         t4lSzC8m+VRMy/3rUp5OaU0A64Bev6IfonSYuMU5tHo2daiZo9kehDRC8TSkRkkZfNHU
         4oXD68LBjysUXVJdVbH0LPiNtWaosIRt0QXt7HnTzmW6p5IxbzcjR/ZGBZ5ne5O5y0xB
         mDrw==
X-Forwarded-Encrypted: i=1; AJvYcCXZOLnKmdviTkqAd/+5TIIjnmrWVUMw7ECgNOYWaXdgN5Kt6Lc4AF2KKfC4sAgF5UfyAreBqZxIpFAUjqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH0wLmJY8iP4eDi7hU12j2JmNukvsS7zHSEiF52B/3vS07GqZm
	6McFMKLlGuCqvD3q/XUmCZPFC5YMWuQq18a2mff9lrUtj9bErLdXyKMye+jlj1W0N2Y=
X-Gm-Gg: ASbGncu3Yye+UkZxMpOOFghjvTphmVpBQi5Xu8WIwxHeD0ScPxi6/pIxjvs8qK4d6Ah
	3kpY+AA8cJiSNORO8RX7tC2UmTEoVkv1maMYZC15xVZ6CKmMHa76gTxJPnXQAvnFPZF6sRor7QZ
	Mzuw1OYmFZdcOKw2p6koU3Q7wpVXu4tJTjLpl43wRr/zwlf/9p083/U/52V0LgEP5tt54jYhGmA
	imUL1h3l19BoAijAOftjbmdbmCijQR/rZTWcuunrdpPSe4rJ1ojrm4olS4rKt21UNSxlW8yDs2O
	bNNRM3DOllQ+lMnZfWEYCy8ShkaOnBZJGLD5aAIW56SOf/Gp6QmQ7EfnmHw9Vd0fvN4K0kXsRiM
	=
X-Google-Smtp-Source: AGHT+IF/aaX85m5/XkOQ/w1sY1YbY+h1xy/KpDB8YvmiSzzc2mwhLtPsKwNCaRg+GtDZj0kNEUlihg==
X-Received: by 2002:a05:6000:178c:b0:3a6:daff:9e5 with SMTP id ffacd0b85a97d-3b342a0d266mr1290247f8f.7.1751527096741;
        Thu, 03 Jul 2025 00:18:16 -0700 (PDT)
Received: from localhost (109-81-23-161.rct.o2.cz. [109.81.23.161])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a99bc81esm17949425e9.33.2025.07.03.00.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 00:18:16 -0700 (PDT)
Date: Thu, 3 Jul 2025 09:18:15 +0200
From: Michal Hocko <mhocko@suse.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tim Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org,
	Jirka Hladky <jhladky@redhat.com>,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Suneeth D <Suneeth.D@amd.com>, Libo Chen <libo.chen@oracle.com>
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
Message-ID: <aGYutwftSAPgPzf-@tiehlicka>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702163247.324439-1-yu.c.chen@intel.com>

On Thu 03-07-25 00:32:47, Chen Yu wrote:
> It was reported that after Commit ad6b26b6a0a7
> ("sched/numa: add statistics of numa balance task"),
> a NULL pointer exception[1] occurs when accessing
> p->mm. The following race condition was found to
> trigger this bug: After a swap task candidate is
> chosen during NUMA balancing, its mm_struct is
> released due to task exit. Later, when the task
> swapping is performed, p->mm is NULL, which causes
> the problem:
> 
> CPU0                                   CPU1
> :
> ...
> task_numa_migrate
>    task_numa_find_cpu
>     task_numa_compare
>       # a normal task p is chosen
>       env->best_task = p
> 
>                                         # p exit:
>                                         exit_signals(p);
>                                            p->flags |= PF_EXITING
>                                         exit_mm
>                                            p->mm = NULL;
> 
>     migrate_swap_stop
>       __migrate_swap_task((arg->src_task, arg->dst_cpu)
>        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
> 
> Fix this issue by checking if the task has the PF_EXITING
> flag set in migrate_swap_stop(). If it does, skip updating
> the memcg events. Additionally, log a warning if p->mm is
> NULL to facilitate future debugging.
> 
> Fixes: ad6b26b6a0a7 ("sched/numa: add statistics of numa balance task")
> Reported-by: Jirka Hladky <jhladky@redhat.com>
> Closes: https://lore.kernel.org/all/CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com/
> Reported-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
> Reported-by: Suneeth D <Suneeth.D@amd.com>
> Suggested-by: Libo Chen <libo.chen@oracle.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> ---
>  kernel/sched/core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 8988d38d46a3..4e06bb955dad 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3364,7 +3364,14 @@ static void __migrate_swap_task(struct task_struct *p, int cpu)
>  {
>  	__schedstat_inc(p->stats.numa_task_swapped);
>  	count_vm_numa_event(NUMA_TASK_SWAP);
> -	count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> +	/* exiting task has NULL mm */
> +	if (!(p->flags & PF_EXITING)) {
> +		WARN_ONCE(!p->mm, "swap task %d %s %x has no mm\n",
> +			  p->pid, p->comm, p->flags);

As Andrew already said this is not really acceptable because this is
very likely too easy to trigger and a) you do not want logs flooded with
warnings and also there are setups with panic_on_warn configured and for
those this would be a fatal situation without any good reason.

> +
> +		if (p->mm)
> +			count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> +	}

Why are you testing for p->mm here? Isn't PF_EXITING test sufficient?
A robust way to guarantee non-NULL mm against races when a task is
exiting is find_lock_task_mm. Probably too heavy weight for this path.
>  
>  	if (task_on_rq_queued(p)) {
>  		struct rq *src_rq, *dst_rq;
> -- 
> 2.25.1
> 

-- 
Michal Hocko
SUSE Labs
