Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BC014EC5B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745003340; cv=none; b=iYitqRljgyOtt9/fN1GKrda4TOCmP60ma2EjFjXU6Ij+2Er8sdn+yYYymmaoFicoMcfqaWmGIECu/zkyPKNHiyQ/Zo2uzLin8vRpOeqW/ZfAv3l8CZNUHCy2lubChKENcVtQO277h0Xb1FnvGl822rWU5eiw0PYtq/JouJnvFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745003340; c=relaxed/simple;
	bh=hU6eXmRY4wBh/a2Q8y74FkYvBxc7NBqaEaSme9pnpAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrsfsQZf1mvJBWaQM3t+VVCLmmUBgbRwsEZySMJMEwX4owzrcNJnHAP/hcQau6VDYaROp1GjxU8g7YjgaPmFnJ0jq0Wh4uM9BDlgcOPK/QDBwKhi1g18elVz8G3HSs8yKKdFn37OabMNHgnLndzSbOzc4xl4lDsZkh+svMO2c6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ptQ1eUR7; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ptQ1eUR7"
Message-ID: <bf07ce66-32e8-4069-894a-7eff120a07ff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745003335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HBrqOA4dgnVJQOMUUjhEMXVEgE25HZG/0klpz9S9AVE=;
	b=ptQ1eUR7ShEDLGErX83atwlw7jgts9u9ghcna7qCncCJIfcX/bMQNLtojxHmhNlgwuvvPt
	xc17g6leJ6XnthvAGSEKtiEI2L8y2JoYIvssjfMsdCawLAInkoJw3hJ0kTt5se46njTd1f
	QW8+LBge/7c1Gxj6uvsiAx/aatchc8w=
Date: Fri, 18 Apr 2025 21:08:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] RDMA/rxe: Remove unused rxe_run_task
To: linux@treblig.org, zyjzyj2000@gmail.com, jgg@ziepe.ca, leon@kernel.org
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250418165948.241433-1-linux@treblig.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20250418165948.241433-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 2025/4/18 18:59, linux@treblig.org 写道:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> rxe_run_task() has been unused since 2024's
> commit 23bc06af547f ("RDMA/rxe: Don't call direct between tasks")
> 
> Remove it.
> 

Thanks a lot. Please add the Fixes tags.

Fixes: 23bc06af547f ("RDMA/rxe: Don't call direct between tasks")

And in the following comments, the function rxe_run_task is still mentioned.
"
  86 /* do_task is a wrapper for the three tasks (requester,
  87  * completer, responder) and calls them in a loop until
  88  * they return a non-zero value. It is called either
  89  * directly by rxe_run_task or indirectly if rxe_sched_task
  90  * schedules the task. They must call __reserve_if_idle to
  91  * move the task to busy before calling or scheduling.
  92  * The task can also be moved to drained or invalid
  93  * by calls to rxe_cleanup_task or rxe_disable_task.
  94  * In that case tasks which get here are not executed but
  95  * just flushed. The tasks are designed to look to see if
  96  * there is work to do and then do part of it before returning
  97  * here with a return value of zero until all the work
  98  * has been consumed then it returns a non-zero value.
  99  * The number of times the task can be run is limited by
100  * max iterations so one task cannot hold the cpu forever.
101  * If the limit is hit and work remains the task is rescheduled.
102  */
"
Not sure if you like to modify the above comments to remove rxe_run_task 
or not.

Except the above, I am fine with this commit.

Reviewed-by: Zhu Yanjun <yanjun.zhu@linux.dev>

Best Regards,
Zhu Yanjun
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   drivers/infiniband/sw/rxe/rxe_task.c | 18 ------------------
>   drivers/infiniband/sw/rxe/rxe_task.h |  2 --
>   2 files changed, 20 deletions(-)
> 
> diff --git a/drivers/infiniband/sw/rxe/rxe_task.c b/drivers/infiniband/sw/rxe/rxe_task.c
> index 80332638d9e3..9d02d847fd78 100644
> --- a/drivers/infiniband/sw/rxe/rxe_task.c
> +++ b/drivers/infiniband/sw/rxe/rxe_task.c
> @@ -234,24 +234,6 @@ void rxe_cleanup_task(struct rxe_task *task)
>   	spin_unlock_irqrestore(&task->lock, flags);
>   }
>   
> -/* run the task inline if it is currently idle
> - * cannot call do_task holding the lock
> - */
> -void rxe_run_task(struct rxe_task *task)
> -{
> -	unsigned long flags;
> -	bool run;
> -
> -	WARN_ON(rxe_read(task->qp) <= 0);
> -
> -	spin_lock_irqsave(&task->lock, flags);
> -	run = __reserve_if_idle(task);
> -	spin_unlock_irqrestore(&task->lock, flags);
> -
> -	if (run)
> -		do_task(task);
> -}
> -
>   /* schedule the task to run later as a work queue entry.
>    * the queue_work call can be called holding
>    * the lock.
> diff --git a/drivers/infiniband/sw/rxe/rxe_task.h b/drivers/infiniband/sw/rxe/rxe_task.h
> index a63e258b3d66..a8c9a77b6027 100644
> --- a/drivers/infiniband/sw/rxe/rxe_task.h
> +++ b/drivers/infiniband/sw/rxe/rxe_task.h
> @@ -47,8 +47,6 @@ int rxe_init_task(struct rxe_task *task, struct rxe_qp *qp,
>   /* cleanup task */
>   void rxe_cleanup_task(struct rxe_task *task);
>   
> -void rxe_run_task(struct rxe_task *task);
> -
>   void rxe_sched_task(struct rxe_task *task);
>   
>   /* keep a task from scheduling */

