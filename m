Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A68127CB3D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747742591; cv=none; b=t6J4mo+wU6uPgBN7tPd9AnG1UzKXKfVBpOFotE6Ja+XpwxpNt2rmcW/lq2EBY6AhYkK5W9u48/c+3kJbo8hvna5Gn8WgvzgnkK1B5n0z7gMppk5OizN6IYlXp0yZR3ce7c3kwn0mqod00h41gjT7H/JAxTExmVGU/gVCtRl7Ewc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747742591; c=relaxed/simple;
	bh=jSUYGyW8/wTbzZj+BWRtL8MnXjk8eiOsjO1ir0gTyAI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HZd4nZ4Qlpi+tJ5u40O6H9JAu98U0VkyPPz629R+6UQTzGeuSkVBdM8MqrvLrglMiNGo0MvSl+/T7A2niHvApdJXfPfgfsgyOSmgJ1pnQjIXLdu4YjUec0MfL2SOlm2KH3vPovYg91sZNyK+saAEXswDYz0gd5vJyjCNy8KB6No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b=H9egwS8+; arc=none smtp.client-ip=185.136.65.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b="H9egwS8+"
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202505201202548bf66a66ec09958b00
        for <linux-kernel@vger.kernel.org>;
        Tue, 20 May 2025 14:02:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=pdQJc6iC2TpPc0wkqbwLZ2xMcMoQ/7l9nj08pJ0xr1g=;
 b=H9egwS8+UsaRq/q6SaOpmE3WCZOUpsiE/LOwU2XOUQaRVTRItNFd9ow/Zoxl9uHnEJn7do
 INBtoHop7uG06R1BKWWxLmDOuqQCvllHQe5/kG+SLNSRfYTYUr0aWQPGAwkUjWHVWo9Q6RuV
 VpCWDztQy5tOTppBeoaoC1e+msRtVr5aVnClpgVsUbjoqsKl0SoB10xDxI7JejZTpulvz2J6
 e0Dng16gyMqELcnSWY3jrCYHwEI2Vs8Spc65xQAultPhZjIS3kGzTku9au68HpZy2MHNtG+o
 1+mP9XIeSN/bJZ5oCgOI8ELhyXpLWKzG0Is7CKpUEUARyvX3YolMUoBQ==;
Message-ID: <844ecab14632381bb5dd6a168a988dede64b459e.camel@siemens.com>
Subject: Re: [PATCH 2/7] sched/fair: prepare throttle path for task based
 throttle
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Aaron Lu <ziqianlu@bytedance.com>, Valentin Schneider
 <vschneid@redhat.com>,  Ben Segall <bsegall@google.com>, K Prateek Nayak
 <kprateek.nayak@amd.com>, Peter Zijlstra	 <peterz@infradead.org>, Josh Don
 <joshdon@google.com>, Ingo Molnar	 <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang	 <xii@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,  Chengming Zhou
 <chengming.zhou@linux.dev>, Chuyi Zhou <zhouchuyi@bytedance.com>, Jan
 Kiszka	 <jan.kiszka@siemens.com>
Date: Tue, 20 May 2025 14:02:54 +0200
In-Reply-To: <20250520104110.3673059-3-ziqianlu@bytedance.com>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
	 <20250520104110.3673059-3-ziqianlu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer

On Tue, 2025-05-20 at 18:41 +0800, Aaron Lu wrote:
> @@ -6744,6 +6805,7 @@ static bool check_cfs_rq_runtime(struct cfs_rq *cfs=
_rq) { return false; }
>  static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}
>  static inline void sync_throttle(struct task_group *tg, int cpu) {}
>  static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq)=
 {}
> +static void task_throttle_setup_work(struct task_struct *p) {}
> =20
>  static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
>  {
> @@ -8851,6 +8913,7 @@ static struct task_struct *pick_task_fair(struct rq=
 *rq)
>  {
>  	struct sched_entity *se;
>  	struct cfs_rq *cfs_rq;
> +	struct task_struct *p;
> =20
>  again:
>  	cfs_rq =3D &rq->cfs;
> @@ -8871,7 +8934,14 @@ static struct task_struct *pick_task_fair(struct r=
q *rq)
>  		cfs_rq =3D group_cfs_rq(se);
>  	} while (cfs_rq);
> =20
> -	return task_of(se);
> +	p =3D task_of(se);
> +	if (throttled_hierarchy(cfs_rq_of(se))) {
> +		/* Shuold not happen for now */

Typo: s/Shuold/Should

Btw: Is there a trace point in place when throttling/unthrottling
happens? Would be nice to see that in a trace, but might be that I
missed those events in my configuration up to now.

> +		WARN_ON_ONCE(1);
> +		task_throttle_setup_work(p);
> +	}
> +
> +	return p;
>  }

