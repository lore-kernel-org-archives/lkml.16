Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97C323E236
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199616; cv=none; b=mtCkbjar4dUGadBDF/g2AWc1nU3HOXuodkzK+lX9uDqa+NRks/y8LAEHUlssF39E+ugfDIq6JKbattHDXs7oyGYABMdCCYjQvWkuKAwKBkWmgKGz/yIgAG771rlR20pC9CfSPoyWzCOQCVfz7/kXmffuamC/sza7KKH+14c7QTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199616; c=relaxed/simple;
	bh=Fnd9DS63URx9O+vXKz//5+8S5fS3C5kDNmFQLZz1/3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QxBVn0FMwDIrMbd9e4FPFQmcHsiLE0/PU2x1tHGz8axQ4ZKFHyQ+q3uLWvvpkuJZrkbYtnxyRUVVmaJob4I+Zb1zRF5KvUwtutMP9zRNV30Ofik/Hvdwmhus1ANJ9053cd2GypyGYLAqPfDAVvosmHQF928XfZJmha5/Ip8VImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=p6IhFEd1; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="p6IhFEd1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1AVTFbSycPwpG42lDcERGy+13ULNRZhBW15TeT7BgXg=; b=p6IhFEd1bSfJSPA7O1egmWE1fF
	Ub/dLI/W7TyfBT+BTYybpN+6gr41yR6y/VBOhstmTMKDv7Xw0tjpM4vAdeIcuw00zarPxF7TrlbhW
	ThMLhw/S5KfBDVDZKkdpGUw2z/dVVtTU3gBMp5IapCX/o8SlE6M8YOoiTAd9i8oQdm5HeFBE7K5rI
	krsbRzbtdr0FA3g35Va+WSCz5+ktm6YoIrnyHPSAoxTo/fzrHudFI144/a+0b58fG6kRIFnIafvQv
	59Gll7yUsOVfg7DxGx62LFeYSQyYo+1ubI1XsqpR0CRcKBD38Gkx8hYT6L3HA/ZXefzAF7A9Gpnih
	c476l0Ig==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1thVG0-007IF4-J3; Mon, 10 Feb 2025 15:59:38 +0100
Message-ID: <715ff963-73fe-4479-bed7-8466597a1a70@igalia.com>
Date: Mon, 10 Feb 2025 23:59:29 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched_ext: Take NUMA node into account when allocating
 per-CPU cpumasks
To: lirongqing <lirongqing@baidu.com>, tj@kernel.org, void@manifault.com,
 arighi@nvidia.com, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, linux-kernel@vger.kernel.org
References: <20250210085225.3272-1-lirongqing@baidu.com>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <20250210085225.3272-1-lirongqing@baidu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 25. 2. 10. 17:52, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> per-CPU cpumasks are dominantly accessed from their own local CPUs,
> so allocate them node-local to improve performance.
> 
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>   kernel/sched/ext.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 8857c07..3fe5a2e 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -6325,15 +6325,16 @@ void __init init_sched_ext_class(void)
>   
>   	for_each_possible_cpu(cpu) {
>   		struct rq *rq = cpu_rq(cpu);
> +		int  n = cpu_to_node(cpu);
>   
>   		init_dsq(&rq->scx.local_dsq, SCX_DSQ_LOCAL);
>   		INIT_LIST_HEAD(&rq->scx.runnable_list);
>   		INIT_LIST_HEAD(&rq->scx.ddsp_deferred_locals);
>   
> -		BUG_ON(!zalloc_cpumask_var(&rq->scx.cpus_to_kick, GFP_KERNEL));
> -		BUG_ON(!zalloc_cpumask_var(&rq->scx.cpus_to_kick_if_idle, GFP_KERNEL));
> -		BUG_ON(!zalloc_cpumask_var(&rq->scx.cpus_to_preempt, GFP_KERNEL));
> -		BUG_ON(!zalloc_cpumask_var(&rq->scx.cpus_to_wait, GFP_KERNEL));
> +		BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_kick, GFP_KERNEL, n));
> +		BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_kick_if_idle, GFP_KERNEL, n));
> +		BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_preempt, GFP_KERNEL, n));
> +		BUG_ON(!zalloc_cpumask_var_node(&rq->scx.cpus_to_wait, GFP_KERNEL, n));
>   		init_irq_work(&rq->scx.deferred_irq_work, deferred_irq_workfn);
>   		init_irq_work(&rq->scx.kick_cpus_irq_work, kick_cpus_irq_workfn);
>   

The changes make sense to me. Thanks!

Acked-by: Changwoo Min <changwoo@igalia.com>


