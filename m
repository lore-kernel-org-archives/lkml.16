Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CB42701CE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745449629; cv=none; b=auS7ZJRsc24Sh6F14hqdaDb7eNa89cwAYeMxwSIDzxIJl193qnizdXxiPXsxQuEl6certYsUNZ3JNlaH5ym4Im2I1oVppqBKFjcma3t0ZknOCC3/5EZ5anAYQOL6e3vLFWe5dfDluFPDrubFKWXKEcIyH6SbQb1RbI1tJJtFyJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745449629; c=relaxed/simple;
	bh=HOcjMyRW+ttJKykS0xuSJXQwkTBinIEEm+ZjVGYLmY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pn/ShH+fnXhtL+OyiP8IX7Y74yy5CFcLF4QZUJI4girnkJFx+KZjyzTaj47Zz/r8iC+CNdvud8KDpwEMachBfPxHsAT1a/i1ooIK0Kzc9RobjQ5MDeuNm3b83fT8uODlBxKseA4spp4A0l7jdUuMhS3602S3GFXtaCcmuUGNi7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ne00WX/i; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ne00WX/i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HMWebVVEii5jXG6Lg7V3GPvW0gCFfg76xymPy6OYNmw=; b=ne00WX/iz9q6PFFtMMzEh/efTx
	Iitp1EUitinOJbeoFvAlrSk+AGGqrECa+Nl239UaQ+/M3rCcjunPuoC3F6z0kCjy1M2wxgHs4SCKw
	3YLExG972uFvT5O6NQPFuJjykg7by3s45ABWKtTldkyY8nE/A/ICA5dv5+MTXok/1PqXPMT88iBO4
	Ujz9CoFWYWFFFoRAZa1w/42KkCON9XnuLuNwvpHO/bzTOCHVn02WRNXcdNj3jMtnISBRmIl+SDBTM
	f8ZFLYl7qLKdb7HmNvyswSkqPcygDqzPH5R18M4RWGA5xOaG3/r77qg1XLn+Ed7YeXv4HDbZxRJko
	Pn56PAeg==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u7jB7-007Yzr-Vz; Thu, 24 Apr 2025 01:06:54 +0200
Message-ID: <a7ea9c40-77d8-41dc-aed8-9df66dc8c110@igalia.com>
Date: Thu, 24 Apr 2025 08:06:47 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched_ext: Clarify CPU context for running/stopping
 callbacks
To: Andrea Righi <arighi@nvidia.com>, Tejun Heo <tj@kernel.org>,
 David Vernet <void@manifault.com>
Cc: Jake Hillion <jake@hillion.co.uk>, linux-kernel@vger.kernel.org
References: <20250423210205.281689-1-arighi@nvidia.com>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <20250423210205.281689-1-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrea,

On 4/24/25 06:02, Andrea Righi wrote:
> The ops.running() and ops.stopping() callbacks can be invoked from a CPU
> other than the one the task is assigned to, particularly when a task
> property is changed, as both scx_next_task_scx() and dequeue_task_scx() may
> run on CPUs different from the task's target CPU.

The same goes to ops.quiescent() too since ops.quiescent() is also
called from dequeue_task_scx().

Reviewed-by: Changwoo Min <changwoo@igalia.com>

Regards,
Changwoo Min

> 
> This behavior can lead to confusion or incorrect assumptions if not
> properly clarified, potentially resulting in bugs (see [1]).
> 
> Therefore, update the documentation to clarify this aspect and advise
> users to use scx_bpf_task_cpu() to determine the actual CPU the task
> will run on or was running on.
> 
> [1] https://github.com/sched-ext/scx/pull/1728
> 
> Cc: Jake Hillion <jake@hillion.co.uk>
> Cc: Changwoo Min <changwoo@igalia.com>
> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> ---
>   kernel/sched/ext.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> Changes in v2:
>   - clarify the scenario a bit more in the code comments
>   - link to v1: https://lore.kernel.org/all/20250423190059.270236-1-arighi@nvidia.com/
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index ac79067dc87e6..a83232a032aa4 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -368,6 +368,15 @@ struct sched_ext_ops {
>   	 * @running: A task is starting to run on its associated CPU
>   	 * @p: task starting to run
>   	 *
> +	 * Note that this callback may be called from a CPU other than the
> +	 * one the task is going to run on. This can happen when a task
> +	 * property is changed (i.e., affinity), since scx_next_task_scx(),
> +	 * which triggers this callback, may run on a CPU different from
> +	 * the task's assigned CPU.
> +	 *
> +	 * Therefore, always use scx_bpf_task_cpu(@p) to determine the
> +	 * target CPU the task is going to use.
> +	 *
>   	 * See ->runnable() for explanation on the task state notifiers.
>   	 */
>   	void (*running)(struct task_struct *p);
> @@ -377,6 +386,15 @@ struct sched_ext_ops {
>   	 * @p: task stopping to run
>   	 * @runnable: is task @p still runnable?
>   	 *
> +	 * Note that this callback may be called from a CPU other than the
> +	 * one the task was running on. This can happen when a task
> +	 * property is changed (i.e., affinity), since dequeue_task_scx(),
> +	 * which triggers this callback, may run on a CPU different from
> +	 * the task's assigned CPU.
> +	 *
> +	 * Therefore, always use scx_bpf_task_cpu(@p) to retrieve the CPU
> +	 * the task was running on.
> +	 *
>   	 * See ->runnable() for explanation on the task state notifiers. If
>   	 * !@runnable, ->quiescent() will be invoked after this operation
>   	 * returns.

