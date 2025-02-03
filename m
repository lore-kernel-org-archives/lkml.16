Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438AB1FA15E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738584876; cv=none; b=tdBRUHaQLB0eW/lqMJWxa5GYrl00G5QZuK3djvSMDbINqjx3Ba0nvoYlG7AUI1UnZ9OGzzZ4cGYRKD/i0CKfK2oTZEDYZ520nx7MLU3axuuJCioSo5fmRiGtCE+4A1FssZDxwUFgg6TNsJ8PvKjVxSIGfPJGb0K7ZFAyiCL1JuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738584876; c=relaxed/simple;
	bh=owHjy2ivVvcy2WXcN8IxBHmcUM/RaVfo8IzWPuw7Hac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lT/K3UKfPADsreFCA/7d5epTa5Xm9QKYk3z1wO2L2Lj6jPKfn8YstH9ZKbfPAwUPoCDADNjyjWmLckdEO9IhXGmA6Sk28nMVCSjgV11U6P95MU9kbzz0qZrOWwYPPEHyQBoBLr0b7gudfGIe1W3cHkcmymoIQa2SS1QiwBW4AOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nwi2KxlJ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nwi2KxlJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=in7vJUtEwNCX1o+0CfTR9Geb1yk85aonCLqB5wYVaSY=; b=nwi2KxlJe7MfhgeiKgUefjTg9a
	ZFGLYTejf//9mNXxmH/avgiamfoakhlkMLpkVBjTh2fw8Y0qsI6IV0ghjABK8t0B45WRu4izkkkZr
	7QyjpoLOUeLoKmBdRkDfd1Srok3kR2C8cnKASU8CxgUL+Dbnm59pNCdQZ0ZgAiXP6dbxOZBIyvFJN
	Tu84Z+bq2RRnYNX57fkiizGdk91T1o+BT9E2YHR4S00xOrr3NoattV+4Ul4X3qcUV1tOatoiJSRIs
	DiyRWVQ1ctGZhe95iAn7MuKrD6IknUJH1LopFwLH7+b+xJyVMJLcVaVqGkwZ2kE0QgGPQUcKwzVLj
	oacGAmjw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tevLR-0000000G5JN-3Mtj;
	Mon, 03 Feb 2025 12:14:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E922030035F; Mon,  3 Feb 2025 13:14:28 +0100 (CET)
Date: Mon, 3 Feb 2025 13:14:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Jann Horn <jannh@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched: Clarify wake_up_q()'s write to task->wake_q.next
Message-ID: <20250203121428.GC14028@noisy.programming.kicks-ass.net>
References: <20250129-sched-wakeup-prettier-v1-1-2f51f5f663fa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-sched-wakeup-prettier-v1-1-2f51f5f663fa@google.com>

On Wed, Jan 29, 2025 at 08:53:03PM +0100, Jann Horn wrote:
> Clarify that wake_up_q() does an atomic write to task->wake_q.next, after
> which a concurrent __wake_q_add() can immediately overwrite
> task->wake_q.next again.
> 
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
> a minor change; I figured we should at least be using WRITE_ONCE() here,
> and I might as well change the comments a little bit while I'm touching
> this
> ---
>  kernel/sched/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 9142a0394d46605e96e10cef97cce02d741f6c93..ce64652858703826dca510479f563a28c2fb2405 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1063,9 +1063,10 @@ void wake_up_q(struct wake_q_head *head)
>  		struct task_struct *task;
>  
>  		task = container_of(node, struct task_struct, wake_q);
> -		/* Task can safely be re-inserted now: */
>  		node = node->next;
> -		task->wake_q.next = NULL;
> +		/* pairs with cmpxchg_relaxed() in __wake_q_add() */
> +		WRITE_ONCE(task->wake_q.next, NULL);
> +		/* Task can safely be re-inserted now. */

Right, so even if the store is shattered, the cmpxchg won't proceed
until all bits land -- eg. NULL becomes 'complete'.

That said, your patch makes sense, so let me go stick that in a queue
somewhere.

Thanks!
