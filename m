Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC53145C14
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902591; cv=none; b=UXQgy+XzhdUAb//3QqbJ7oI0pKUUfqMCXjNnW1e32NTA7/KG8wuGQ/M6eGSf7jin5aQXz6FuGOL8DsFE1InsK4etDb2+V/zAUbv89KWm0zAYvkfdCguTRj4k9c51pKftMfQq+aZUC0iBbt9BOFYsg9nltknV/ACAStFlDk0v0Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902591; c=relaxed/simple;
	bh=+++rNcCrZpYJOjXXNijoSBRCpnxwrFwpMxCFuSdVPe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U8i6Xmvr+s9aYWGMUx1kjtiDVsoB+hSKB0yUmrjFliRBv08uXk52E7ZP9okuCvAxkCBeXYJENxXLK9xOefLIqV49+lk961TQm/4Pl5+T7nAIfw3j5FffgwlBCmANHO88YSGWHgdQKLqKfdtcOc06swWz5KlqdhG5rCWvGlrm/RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=RPtMmyV6; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="RPtMmyV6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KlvMbyIisUufkr+UShy6jIRQb1Rk4h8UzMbl5KnE9fo=; b=RPtMmyV6zqsMpsD75NkJj+2L0L
	5muFsn/Br4gBUyAOmt2aR3i5r2WK/1oQlY+E0ml9zmSEM2EnIvI/hxf8UkC8VXU0sbY7ji9tysIzw
	lrPPO2VVHNM4m8CRvFuZS0PzD1tBGqyC7ljGfrOCS4dt8nBbrTjX5IMu+Ab/PUieEN9CR7SLeVAGP
	E6D8ekPeVThkrnUNKcH/9BGSpCcjnn2rtk1mafXDMP1Cx0pYmbLcy28prPba4sQtw3nUzeXKHb51N
	d36S9g6V7hMbrT7NYFTLrEumZASjHsLl1e6yLP9DwwBJTQ+bst9ya7cDAwavHV443MMi7i2nMPPc8
	2XqKRT3Q==;
Received: from [106.101.7.122] (helo=[192.168.210.21])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uI1J6-00BcXQ-8o; Thu, 22 May 2025 10:29:40 +0200
Message-ID: <ee5db302-07f6-4e09-8de4-0c1358e0a297@igalia.com>
Date: Thu, 22 May 2025 17:29:33 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH sched_ext/for-6.16] sched_ext: Call ops.update_idle()
 after updating builtin idle bits
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
 Andrea Righi <arighi@nvidia.com>, linux-kernel@vger.kernel.org,
 sched-ext@meta.com
References: <aC5SSv5Ne5IZPPl0@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <aC5SSv5Ne5IZPPl0@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you, Tejun, for the change!
The change makes sense semantcially.

Acked-by: Changwoo Min <changwoo@igalia.com>

On 5/22/25 07:23, Tejun Heo wrote:
> BPF schedulers that use both builtin CPU idle mechanism and
> ops.update_idle() may want to use the latter to create interlocking between
> ops.enqueue() and CPU idle transitions so that either ops.enqueue() sees the
> idle bit or ops.update_idle() sees the task queued somewhere. This can
> prevent race conditions where CPUs go idle while tasks are waiting in DSQs.
> 
> For such interlocking to work, ops.update_idle() must be called after
> builtin CPU masks are updated. Relocate the invocation. Currently, there are
> no ordering requirements on transitions from idle and this relocation isn't
> expected to make meaningful differences in that direction.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
>   kernel/sched/ext_idle.c |   25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
> index ae30de383913..66da03cc0b33 100644
> --- a/kernel/sched/ext_idle.c
> +++ b/kernel/sched/ext_idle.c
> @@ -738,16 +738,6 @@ void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
>   
>   	lockdep_assert_rq_held(rq);
>   
> -	/*
> -	 * Trigger ops.update_idle() only when transitioning from a task to
> -	 * the idle thread and vice versa.
> -	 *
> -	 * Idle transitions are indicated by do_notify being set to true,
> -	 * managed by put_prev_task_idle()/set_next_task_idle().
> -	 */
> -	if (SCX_HAS_OP(sch, update_idle) && do_notify && !scx_rq_bypassing(rq))
> -		SCX_CALL_OP(sch, SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
> -
>   	/*
>   	 * Update the idle masks:
>   	 * - for real idle transitions (do_notify == true)
> @@ -765,6 +755,21 @@ void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
>   	if (static_branch_likely(&scx_builtin_idle_enabled))
>   		if (do_notify || is_idle_task(rq->curr))
>   			update_builtin_idle(cpu, idle);
> +
> +	/*
> +	 * Trigger ops.update_idle() only when transitioning from a task to
> +	 * the idle thread and vice versa.
> +	 *
> +	 * Idle transitions are indicated by do_notify being set to true,
> +	 * managed by put_prev_task_idle()/set_next_task_idle().
> +	 *
> +	 * This must come after builtin idle update so that BPF schedulers can
> +	 * create interlocking between ops.update_idle() and ops.enqueue() -
> +	 * either enqueue() sees the idle bit or update_idle() sees the task
> +	 * that enqueue() queued.
> +	 */
> +	if (SCX_HAS_OP(sch, update_idle) && do_notify && !scx_rq_bypassing(rq))
> +		SCX_CALL_OP(sch, SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
>   }
>   
>   static void reset_idle_masks(struct sched_ext_ops *ops)
> 
> 

