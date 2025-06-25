Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05B7F50F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854980; cv=none; b=C7v9mZK25GQJFEwM/mNDLhDChA/mc0Y7rbv74UkGPZCfjk/XPGZ9cbE0LVKPplkY8tbVbLoyIVt1GBz+oYs+5qAhJDaVqrosxNFTOfCHVw65KjSeob1uauK3Dns2v8BH24EtXaA66jNculS6O2BZXnJEMT9wKh+hY+QHjbvxY0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854980; c=relaxed/simple;
	bh=1iWuKOp+rFc82fGN+3WK27u0fVFde2nYJsvLQGFjvJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODVlOsuraBRYMMVLjKxCAZNIcdrpaekvpfXbRDpYWVzeBefP8gyjoaMnEYzoWW2TkvwaDpmVBrl1ftYECwvnqAxrd0Bb7IOS+hd+PtDdWE18/+vE78POL7NtyTb4Z9/4v6wdMJUXiBBoSuyGgTcpHT+2NMmMXK0/X+jiwbz2ezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h5DayNCK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h5DayNCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750854976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NY9vw9curyJ7/8LzORISM7uwDPvCxbSxMJ+ZZchZ3k8=;
	b=h5DayNCK1fpG8GbdPI3JAsS3O7xnM60WfTjmaB4WIuJZ2iU2/D+zWCFBViCYC0kGssfQQo
	p0m8VkpoU6xuW6HY85yYuT+mpG1g9Cwd5MIKGFzhEOBTroDBtFPaWAWHFjLpNagSMbJsvO
	2TuJgLsptMgxYBPw9EYX7iKz4v9Vei0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-k1aCep3vMS60dFeISDepPw-1; Wed,
 25 Jun 2025 08:36:13 -0400
X-MC-Unique: k1aCep3vMS60dFeISDepPw-1
X-Mimecast-MFC-AGG-ID: k1aCep3vMS60dFeISDepPw_1750854972
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BCE1B1809C9B;
	Wed, 25 Jun 2025 12:36:11 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.22.88.237])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CB2FF19560A3;
	Wed, 25 Jun 2025 12:36:08 +0000 (UTC)
Date: Wed, 25 Jun 2025 08:36:06 -0400
From: Phil Auld <pauld@redhat.com>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] sched: Move curr check into __enqueue_entity and
 __dequeue_entity
Message-ID: <20250625123606.GB57862@pauld.westford.csb>
References: <20250621142055.7110-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621142055.7110-1-jemmywong512@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Hi Jemmy,

On Sat, Jun 21, 2025 at 10:20:55PM +0800 Jemmy Wong wrote:
> The check for se == cfs_rq->curr is common logic used before calling
> __enqueue_entity and __dequeue_entity. Move this check into the respective
> function bodies to simplify the code.


I'm not sure this simpifies the code.  The pattern is generally that
the underscore prefixed function just does the required work and the
non-underscore-prefixed one does the checks. That's a pattern used
in lots of places.

Also, unless these end up unlined (I didn't check but they are not
explicitly called out as such) you are adding an extra function
call. 

> 
> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
> 
> ---
>  kernel/sched/fair.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7a14da5396fb..24cbb4b6c3fb 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -849,6 +849,9 @@ RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
>   */
>  static void __enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
> +	if (unlikely(se == cfs_rq->curr))
> +		return;
> +
>  	avg_vruntime_add(cfs_rq, se);
>  	se->min_vruntime = se->vruntime;
>  	se->min_slice = se->slice;
> @@ -858,6 +861,9 @@ static void __enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
> 
>  static void __dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
> +	if (unlikely(se == cfs_rq->curr))
> +		return;
> +
>  	rb_erase_augmented_cached(&se->run_node, &cfs_rq->tasks_timeline,
>  				  &min_vruntime_cb);
>  	avg_vruntime_sub(cfs_rq, se);
> @@ -3797,8 +3803,6 @@ static void place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int fla
>  static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
>  			    unsigned long weight)
>  {
> -	bool curr = cfs_rq->curr == se;
> -
>  	if (se->on_rq) {
>  		/* commit outstanding execution time */
>  		update_curr(cfs_rq);
> @@ -3806,8 +3810,7 @@ static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
>  		se->deadline -= se->vruntime;
>  		se->rel_deadline = 1;
>  		cfs_rq->nr_queued--;
> -		if (!curr)
> -			__dequeue_entity(cfs_rq, se);
> +		__dequeue_entity(cfs_rq, se);
>  		update_load_sub(&cfs_rq->load, se->load.weight);
>  	}
>  	dequeue_load_avg(cfs_rq, se);
> @@ -3834,8 +3837,7 @@ static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
>  	if (se->on_rq) {
>  		place_entity(cfs_rq, se, 0);
>  		update_load_add(&cfs_rq->load, se->load.weight);
> -		if (!curr)
> -			__enqueue_entity(cfs_rq, se);
> +		__enqueue_entity(cfs_rq, se);
>  		cfs_rq->nr_queued++;
> 
>  		/*
> @@ -5363,8 +5365,7 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
> 
>  	check_schedstat_required();
>  	update_stats_enqueue_fair(cfs_rq, se, flags);
> -	if (!curr)
> -		__enqueue_entity(cfs_rq, se);
> +	__enqueue_entity(cfs_rq, se);
>  	se->on_rq = 1;
> 
>  	if (cfs_rq->nr_queued == 1) {
> @@ -5506,8 +5507,7 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  		se->rel_deadline = 1;
>  	}
> 
> -	if (se != cfs_rq->curr)
> -		__dequeue_entity(cfs_rq, se);
> +	__dequeue_entity(cfs_rq, se);
>  	se->on_rq = 0;
>  	account_entity_dequeue(cfs_rq, se);
> 
> @@ -5624,14 +5624,14 @@ static void put_prev_entity(struct cfs_rq *cfs_rq, struct sched_entity *prev)
>  	/* throttle cfs_rqs exceeding runtime */
>  	check_cfs_rq_runtime(cfs_rq);
> 
> +	WARN_ON_ONCE(cfs_rq->curr != prev);
>  	if (prev->on_rq) {
>  		update_stats_wait_start_fair(cfs_rq, prev);
> -		/* Put 'current' back into the tree. */
> -		__enqueue_entity(cfs_rq, prev);
>  		/* in !on_rq case, update occurred at dequeue */
>  		update_load_avg(cfs_rq, prev, 0);
> +		cfs_rq->curr = NULL;
> +		__enqueue_entity(cfs_rq, prev);
>  	}
> -	WARN_ON_ONCE(cfs_rq->curr != prev);
>  	cfs_rq->curr = NULL;
>  }

And here you are changing things around a bit more. 

Plus possibly clearing curr twice. 

Anyway, others may feel differently. But I don't think this patch is
needed.


Cheers,
Phil



> 
> @@ -6910,12 +6910,10 @@ requeue_delayed_entity(struct sched_entity *se)
>  		update_entity_lag(cfs_rq, se);
>  		if (se->vlag > 0) {
>  			cfs_rq->nr_queued--;
> -			if (se != cfs_rq->curr)
> -				__dequeue_entity(cfs_rq, se);
> +			__dequeue_entity(cfs_rq, se);
>  			se->vlag = 0;
>  			place_entity(cfs_rq, se, 0);
> -			if (se != cfs_rq->curr)
> -				__enqueue_entity(cfs_rq, se);
> +			__enqueue_entity(cfs_rq, se);
>  			cfs_rq->nr_queued++;
>  		}
>  	}
> --
> 2.43.0
> 

-- 

