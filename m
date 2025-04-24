Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA6C1F3BA3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479438; cv=none; b=fQJYNv/s1GZr2NWb8wBKvOR9ZCFjMOvLV0c7FmdlB+PtbLs+Nw38EkZsKfr515mrkkgPgAwQAkWPQek9oTpg2Z6ZWMYJc3cKvod7J6TDF2lDmP23S5tFUXTaOIKTa+++rsrADjaN1WJXnZe6iWSHq8a+XsoZ9Kpl91AP2ZjlTHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479438; c=relaxed/simple;
	bh=18ICa3vI58dM0qDe75yctcopTR/UnLzuwYeVLptThgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YMLXOtqqmiCgr8gBBT9pm5/g8UHVYS75Vpp3d8QTdAwuwaTxmO09GaqKvwbv6991Pzh6AVc7hWEb0pXmczR9m9cItqXLIRpnd1AuiKcPiAaBxNIo3TTzBt/ltB2wFsHvWReV6K91BuNDyuW7Mw2S/+fWsaJhBVhfY9knvktQ9ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HPCmVUph; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HPCmVUph"
Message-ID: <b9814fec-a9b6-4cd5-a0b1-1c2ddb214a03@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745479433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dEOx6KONvXmNWax6EDI3+Zvv3tm8dvdgjEx8wQxaCaI=;
	b=HPCmVUphENqglFaZwSxEirHJmCjBUI2OAE6jcjz+bA4iJ56y6KT6UX/y0D25nt0rlrGmIG
	6IwEPvUj5YiWMfKLD9JnBiCOZn8auJsZPmImRIAYRyBDuVRkexeWYCyshKZ0tEm/XwwC3u
	9Abg0QV7BMkHy3T8WF482j3K7pXTvIg=
Date: Thu, 24 Apr 2025 15:23:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 02/12] sched_ext: Avoid NULL scx_root deref through
 SCX_HAS_OP()
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
 Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>,
 linux-kernel@vger.kernel.org
References: <20250423234542.1890867-1-tj@kernel.org>
 <20250423234542.1890867-3-tj@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20250423234542.1890867-3-tj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/4/24 07:44, Tejun Heo wrote:
> SCX_HAS_OP() tests scx_root->has_op bitmap. The bitmap is currently in a
> statically allocated struct scx_sched and initialized while loading the BPF
> scheduler and cleared while unloading, and thus can be tested anytime.
> However, scx_root will be switched to dynamic allocation and thus won't
> always be deferenceable.
> 
> Most usages of SCX_HAS_OP() are already protected by scx_enabled() either
> directly or indirectly (e.g. through a task which is on SCX). However, there
> are a couple places that could try to dereference NULL scx_root. Update them
> so that scx_root is guaranteed to be valid before SCX_HAS_OP() is called.
> 
> - In handle_hotplug(), test whether scx_root is NULL before doing anything
>    else. This is safe because scx_root updates will be protected by
>    cpus_read_lock().
> 
> - In scx_tg_offline(), test scx_cgroup_enabled before invoking SCX_HAS_OP(),
>    which should guarnatee that scx_root won't turn NULL. This is also in line
>    with other cgroup operations. As the code path is synchronized against
>    scx_cgroup_init/exit() through scx_cgroup_rwsem, this shouldn't cause any
>    behavior differences.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
>   kernel/sched/ext.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 975f6963a01b..ad392890d2dd 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -3498,6 +3498,14 @@ static void handle_hotplug(struct rq *rq, bool online)
>   
>   	atomic_long_inc(&scx_hotplug_seq);
>   
> +	/*
> +	 * scx_root updates are protected by cpus_read_lock() and will stay
> +	 * stable here. Note that we can't depend on scx_enabled() test as the
> +	 * hotplug ops need to be enabled before __scx_enabled is set.
> +	 */
> +	if (!scx_root)
> +		return;
> +
>   	if (scx_enabled())
>   		scx_idle_update_selcpu_topology(&scx_root->ops);

Just be curious, does the comments added above mean we shouldn't
check scx_enabled() here anymore?

Thanks!

>   
> @@ -3994,7 +4002,8 @@ void scx_tg_offline(struct task_group *tg)
>   
>   	percpu_down_read(&scx_cgroup_rwsem);
>   
> -	if (SCX_HAS_OP(scx_root, cgroup_exit) && (tg->scx_flags & SCX_TG_INITED))
> +	if (scx_cgroup_enabled && SCX_HAS_OP(scx_root, cgroup_exit) &&
> +	    (tg->scx_flags & SCX_TG_INITED))
>   		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, NULL, tg->css.cgroup);
>   	tg->scx_flags &= ~(SCX_TG_ONLINE | SCX_TG_INITED);
>   
