Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AA72C1A2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 01:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744075415; cv=none; b=ZrVnTDlj/LVkAAkVwf7/rXulNCYta89gEiapvg1MsHLVX+BIPM/OefK2qKpPV9dk+8s4vNLYG3djXPJGxGkgkDIbbK7yyUrPH4GVJqvlPgHI64pB8qslMeb7NBNf7JpkUj5Ujnpk+mBsWcPnJI2JUMC5rOMGogct3Lst0oiLR50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744075415; c=relaxed/simple;
	bh=Bcp+7TmVoOvle3zYgHtDxmTwQIjX2KzHedpPulFQWwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxRUa9bVVR0WJbTZrnZ8IA4yP/Mz9zYVQ1LIFf9PGy17KpuqWEgcnBsuPB601vQaPBxL+QRAHnHnVRfSMk57DL5PyjgoQ2r75skaPwbwF/yMAlHVaDmp7j1UIvP7vnBv1lT2UgfM1SRGanaulDqTprkgyH+9tHm4wSUvRtFPdaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hBuX1TG7; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hBuX1TG7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pLYRmTXj5H+BZPPLPixmjl/CjufQapMJcQbm5F8RSe4=; b=hBuX1TG7+24Y6tKxKKOJUjxCs9
	v6Xc5e1dpZD8W0PN3+Dgy6NBqKNO5jjVQ1yq5mJf23lkBLd0Bhn69zZrlFDR2C3EbxW6D1U3w+tuZ
	J4gtdgs0+KUMtFZuI7olmovHO7immwx5udPF0g5nC7vbSYJmfu4XF7UpfFy57GW6pvFWWJHhqGxQz
	t7heFtOUM4SodMREpIg6wzoahG8z0nkC/9TG6JAv4ayXdxfmHfkmRL0Z+CFfpXd6B+qklsO4IBKA0
	PSnZXylGN755U0pVqJOp2MlS3N51f59WgTkquJxRQ/wsZFwuxti0hk2H4HRh+kE5u8JI39aQG4sBb
	NPuH9+2g==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u1xgV-00D6oe-F6; Tue, 08 Apr 2025 03:23:27 +0200
Message-ID: <199773dc-8483-4144-be93-27983ecce5c9@igalia.com>
Date: Tue, 8 Apr 2025 10:23:22 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH sched_ext/for-6.16] sched_ext: Remove cpu.weight /
 cpu.idle unimplemented warnings
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
 Andrea Righi <arighi@nvidia.com>
Cc: linux-kernel@vger.kernel.org
References: <Z_RdpDkLCXm140RT@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z_RdpDkLCXm140RT@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tejun,

This makes sense to me.

Acked-by: Changwoo Min <changwoo@igalia.com>

Regards,
Changwoo Min

On 4/8/25 08:20, Tejun Heo wrote:
> sched_ext generates warnings when cpu.weight / cpu.idle are set to
> non-default values if the BPF scheduler doesn't implement weight support.
> These warnings don't provide much value while adding constant annoyance. A
> BPF scheduler may not implement any particular behavior and there's nothing
> particularly special about missing cgroup weight support. Drop the warnings.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
>   kernel/sched/ext.c |   40 +---------------------------------------
>   1 file changed, 1 insertion(+), 39 deletions(-)
> 
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -3896,34 +3896,6 @@ bool scx_can_stop_tick(struct rq *rq)
>   
>   DEFINE_STATIC_PERCPU_RWSEM(scx_cgroup_rwsem);
>   static bool scx_cgroup_enabled;
> -static bool cgroup_warned_missing_weight;
> -static bool cgroup_warned_missing_idle;
> -
> -static void scx_cgroup_warn_missing_weight(struct task_group *tg)
> -{
> -	if (scx_enable_state() == SCX_DISABLED || cgroup_warned_missing_weight)
> -		return;
> -
> -	if ((scx_ops.flags & SCX_OPS_HAS_CGROUP_WEIGHT) || !tg->css.parent)
> -		return;
> -
> -	pr_warn("sched_ext: \"%s\" does not implement cgroup cpu.weight\n",
> -		scx_ops.name);
> -	cgroup_warned_missing_weight = true;
> -}
> -
> -static void scx_cgroup_warn_missing_idle(struct task_group *tg)
> -{
> -	if (!scx_cgroup_enabled || cgroup_warned_missing_idle)
> -		return;
> -
> -	if (!tg->idle)
> -		return;
> -
> -	pr_warn("sched_ext: \"%s\" does not implement cgroup cpu.idle\n",
> -		scx_ops.name);
> -	cgroup_warned_missing_idle = true;
> -}
>   
>   int scx_tg_online(struct task_group *tg)
>   {
> @@ -3933,8 +3905,6 @@ int scx_tg_online(struct task_group *tg)
>   
>   	percpu_down_read(&scx_cgroup_rwsem);
>   
> -	scx_cgroup_warn_missing_weight(tg);
> -
>   	if (scx_cgroup_enabled) {
>   		if (SCX_HAS_OP(cgroup_init)) {
>   			struct scx_cgroup_init_args args =
> @@ -4072,9 +4042,7 @@ void scx_group_set_weight(struct task_gr
>   
>   void scx_group_set_idle(struct task_group *tg, bool idle)
>   {
> -	percpu_down_read(&scx_cgroup_rwsem);
> -	scx_cgroup_warn_missing_idle(tg);
> -	percpu_up_read(&scx_cgroup_rwsem);
> +	/* TODO: Implement ops->cgroup_set_idle() */
>   }
>   
>   static void scx_cgroup_lock(void)
> @@ -4268,9 +4236,6 @@ static int scx_cgroup_init(void)
>   
>   	percpu_rwsem_assert_held(&scx_cgroup_rwsem);
>   
> -	cgroup_warned_missing_weight = false;
> -	cgroup_warned_missing_idle = false;
> -
>   	/*
>   	 * scx_tg_on/offline() are excluded through scx_cgroup_rwsem. If we walk
>   	 * cgroups and init, all online cgroups are initialized.
> @@ -4280,9 +4245,6 @@ static int scx_cgroup_init(void)
>   		struct task_group *tg = css_tg(css);
>   		struct scx_cgroup_init_args args = { .weight = tg->scx_weight };
>   
> -		scx_cgroup_warn_missing_weight(tg);
> -		scx_cgroup_warn_missing_idle(tg);
> -
>   		if ((tg->scx_flags &
>   		     (SCX_TG_ONLINE | SCX_TG_INITED)) != SCX_TG_ONLINE)
>   			continue;
> 

