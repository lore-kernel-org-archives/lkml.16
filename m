Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C9F4C79
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637948; cv=none; b=qLToZ2OXSQxjVSeqeUzloKRS+yppPmuVUIvmuYjqUjtoOyshIFka4AISUnq5rOG20ohIgH6YWtYJtfTG5rgLiljpLlteu85u8cmWZaRw1IAJXhDSlafLG6X4Tc+u21f6H2lwvW1xXs4hMhH0VM1Xh7MPkM1TjdZvOHt5AMr3GSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637948; c=relaxed/simple;
	bh=wJ3TxadWxkxfQ1/Su50fxhKlluQDkl1tSItma1C2tyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z089FAufJeqYo2UMjac3nVpJn4btybmF6N+SRTeMi+/S7DxPsCCTbtM+NvuEOWhrZ4jDYrbQkHsbi1qZO4jsjzNYJY7KrcJUezf1zTLSw1SmRWOBP0ZrNKAXyPA6RKQ2ft+aiQXdOOdpEMJv9fdF+b/6mIsnxCw1I6VBbi9Uttw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9998D1007;
	Mon, 14 Apr 2025 06:39:02 -0700 (PDT)
Received: from [10.1.27.38] (e133649.arm.com [10.1.27.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFF3F3F66E;
	Mon, 14 Apr 2025 06:39:01 -0700 (PDT)
Message-ID: <be0cace9-d173-4de3-959e-861876ad77fc@arm.com>
Date: Mon, 14 Apr 2025 14:39:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] sched/util_est: Do not sub the delayed-task's
 util-est
To: Xuewen Yan <xuewen.yan@unisoc.com>, dietmar.eggemann@arm.com,
 vincent.guittot@linaro.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com
Cc: rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.co, linux-kernel@vger.kernel.org, qyousef@layalina.io,
 ke.wang@unisoc.com, di.shen@unisoc.com, xuewen.yan94@gmail.com
References: <20250314090909.8404-1-xuewen.yan@unisoc.com>
Content-Language: en-US
From: Hongyan Xia <hongyan.xia2@arm.com>
In-Reply-To: <20250314090909.8404-1-xuewen.yan@unisoc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/03/2025 09:09, Xuewen Yan wrote:
> In cpu_util_without, When the task is in rq, we should
> sub the task's util_est, however, the delayed_task->on_rq
> is true, however, the delayed_task's util had been sub
> when sleep, so there is no need to sub the delayed task's
> util-est. So add the checking of delayed-task.
> 
> On the other hand, as said in [1], the logic of util_est's
> enqueue/dequeue could be simplified.
> So simplify it by aligning with the conditions of uclamp.
> 
> [1]https://lore.kernel.org/all/CAB8ipk8pEvOtCm-d0o1rsekwxPWUHk9iBGtt9TLTWW-iWTQKiA@mail.gmail.com/
> 
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> ---
>   kernel/sched/fair.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index c798d2795243..bebf40a0fa4e 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6930,7 +6930,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>   	 * Let's add the task's estimated utilization to the cfs_rq's
>   	 * estimated utilization, before we update schedutil.
>   	 */
> -	if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & ENQUEUE_RESTORE))))
> +	if (!p->se.sched_delayed || (flags & ENQUEUE_DELAYED))
>   		util_est_enqueue(&rq->cfs, p);
>   
>   	if (flags & ENQUEUE_DELAYED) {
> @@ -7168,7 +7168,7 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
>    */
>   static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>   {
> -	if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & DEQUEUE_SAVE))))
> +	if (!p->se.sched_delayed)
>   		util_est_dequeue(&rq->cfs, p);
>   
>   	util_est_update(&rq->cfs, p, flags & DEQUEUE_SLEEP);
> @@ -8037,7 +8037,8 @@ cpu_util(int cpu, struct task_struct *p, int dst_cpu, int boost)
>   		 */
>   		if (dst_cpu == cpu)
>   			util_est += _task_util_est(p);
> -		else if (p && unlikely(task_on_rq_queued(p) || current == p))
> +		else if (p && unlikely(current == p ||
> +			 (task_on_rq_queued(p) && !p->se.sched_delayed)))
>   			lsub_positive(&util_est, _task_util_est(p));
>   
>   		util = max(util, util_est);

Tested this patch on several workloads and added util_est warnings. No 
util_est overflow or underflow warnings were seen.

Tested-by: Hongyan Xia <hongyan.xia2@arm.com>
