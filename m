Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535821EEA3C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750708258; cv=none; b=jfAmbHBzCSa+X7pVcadtGtJxWwZ3vqbiRDE78/picsf7+vIPcpUS/shwLtPxfGomD+VNkYLNGVWz4QPxFjp7xtAv1oBTxznufj2NScki0TdaWuSSHBxcwDYPqnCETtWaY6IS0BNyKjiWuQ4CmRy+aspBEw2B2GctG1rw/p1ksCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750708258; c=relaxed/simple;
	bh=GBwkaprmAb/D1YblmnIZhL0pNoGZnBy8caXtb77yxgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2k9R4yAnOF8sVNPfZlnmjWbe6rK09jHjR7FQhvCn3zrB7ZpqoFXjG0iqzydWFJYutOOLh/Yfs+tH0a6c+0q20mhUP8t78td+k9AYvIpUuhoWRKsyExvAE0S8CKBF+4144LdBQdxKsx9jxe5uJYXQEgU9NphCZkYi5DZI48S+2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2xU1x2w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2xU1x2w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD37C4CEEA;
	Mon, 23 Jun 2025 19:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750708256;
	bh=GBwkaprmAb/D1YblmnIZhL0pNoGZnBy8caXtb77yxgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2xU1x2wSunORyfiWd2h7d21ko+g9gOPr4eu9BALgHtR4eUGApO+tvVsHWwLjE6KV
	 pApjDi9IcNKlmq7OZCcJtSTD9epqLXOcDGHIHBlNqXwLXuQ6nBtT4PS3jc+/1LKaVp
	 P7eyAAt3bp3CypOeFeYFmaZYtp4pOjoPdeU1Is82VltWlNKAe1DJYrstSf1vXSfDJM
	 FcnJ9GGQXImIR4MuMOFdbSXFyr/D0rjsDWL1NcNFNhTnwr3OXAM8NhHGSu8RkweI4N
	 DCZFhiHXXGsGXXJVZz3bqww2Ev0hyAG3IrMsQ9EMEQu5AKZOV2mUhIK39upOFC/iI/
	 S8U4oufEjSqig==
Date: Mon, 23 Jun 2025 09:50:55 -1000
From: 'Tejun Heo' <tj@kernel.org>
To: liuwenfang <liuwenfang@honor.com>
Cc: 'David Vernet' <void@manifault.com>, 'Andrea Righi' <arighi@nvidia.com>,
	'Changwoo Min' <changwoo@igalia.com>,
	'Ingo Molnar' <mingo@redhat.com>,
	'Peter Zijlstra' <peterz@infradead.org>,
	'Juri Lelli' <juri.lelli@redhat.com>,
	'Vincent Guittot' <vincent.guittot@linaro.org>,
	'Dietmar Eggemann' <dietmar.eggemann@arm.com>,
	'Steven Rostedt' <rostedt@goodmis.org>,
	'Ben Segall' <bsegall@google.com>, 'Mel Gorman' <mgorman@suse.de>,
	'Valentin Schneider' <vschneid@redhat.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] sched_ext: Fix cpu_released while RT task and SCX task
 are scheduled concurrently
Message-ID: <aFmwHzO2AKFXO_YS@slm.duckdns.org>
References: <fca528bb34394de3a7e87a873fadd9df@honor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fca528bb34394de3a7e87a873fadd9df@honor.com>

Hello,

On Sat, Jun 21, 2025 at 04:09:55AM +0000, liuwenfang wrote:
> Supposed RT task(rt1) is running on one CPU with its rq->scx.cpu_released
> set to true, if the rt1 becomes sleeping, then the scheduler will balance
> the remote SCX task(scx1) because there is no other RT task on its rq,
> and rq->scx.cpu_released is false. While one RT task(rt2) is placed on
> this rq(maybe rt2 wakeup or migration occurs) before the scx1 is enqueued,
> then the scheduler will pick rt2. At last, rt2 will be running on this cpu
> with rq->scx.cpu_released being false!
> The main reason is that consume_remote_task() will unlock rq lock.

This is rather difficult to follow. Can you please break this down to a
table? People often use a format like the following:

         CPU X                           CPU Y
  A does something
                                  B does something else
  ...
                                  ...
  Boom

> @@ -2470,6 +2471,11 @@ static inline void put_prev_set_next_task(struct rq *rq,
>  
>  	prev->sched_class->put_prev_task(rq, prev, next);
>  	next->sched_class->set_next_task(rq, next, true);
> +
> +#ifdef CONFIG_SCHED_CLASS_EXT
> +	if (scx_enabled())
> +		switch_class(rq, next);
> +#endif

You're right that there is a race condition around this and I can't see a
way to solve this in SCX proper as there's no way for balance() to tell
whether a higher priority sched class has queued something while balance()
dropped the rq lock for migration, so adding a hook to
put_prev_set_next_task() seems like a reasoanble solution. However, can you
please do the followings?

- Improve the description so that the race condition is clearly
  understandable and explain why the extra hook in put_prev_set_next_task()
  is necessary.

- Rename switch_class() to something which fits the new location better -
  maybe scx_put_prev_set_next_task().

- If the function is called from put_prev_set_next_task(), it doesn't need
  to be called from put_prev_task_scx(). Drop that call.

Thanks.

-- 
tejun
