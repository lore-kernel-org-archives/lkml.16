Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8A013AC1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745883270; cv=none; b=KulMRvUbDspTyNN/BOQSwCO3ADyfLqZjVwxXH6d+JAYdWvdMg/UvXqkuQApb8yiymzsWXH6ZAZwlG24YTST5Qlt7yCiiYn7DxCWMIUwAj3FGSEAEGZrrchLbmuAL+3qei3Zw7l/q4Vd7KWRzj+KAO6xwGdTKSxu3bFy8zkxUJGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745883270; c=relaxed/simple;
	bh=vz2mBiuXcjnc7bgLzZYAaJuGIYu5Aa01rmzmd/Uskxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yo8V7/oGGa5xXqzoF3phLzmZfVVJz1saW8xNkyHufSyUsTBW47bOmf5k86ni8bXyuoQQkyAChdC0QiAjHHfPqM29JI+IqSz3mPThD6tABGweuxXhhEjZb3lV+a7W+l6WGEbDtCMQRHrmI+nMgi0Mr6vf4b3qxjYHGTldyY3TZCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ4JQzMZ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ4JQzMZ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223f4c06e9fso47068795ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745883268; x=1746488068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3FmCENqT397CJZoGPG1waVePwVEOJkiwRznrSHaJdc=;
        b=GJ4JQzMZSWY2cNvcCZz341EJKJo2/zYU9e352VWFJjtvj1hkMTebmecVZ/72YxiX3N
         zw+4FNGS1GOEhvKuf1qFTTQEI20hKvIYMfnq3WqaW/yWWzdhr5aGYzWy+MfBaGG+Vw5n
         eTXWZB3RCxL3vr6o/zvvRgd6W8JnMpgffmorYVktuLmfc30CIFKpeo78gWMbjIledLOn
         TAFAcmcZIYyFQP3JdDa3IaLbQctqLv+HQd3pllAl7Y+/r+/lAJhjdATFbJz2ODKOyIwC
         gn1Rf4XmOZmCOZYR/Jt7YNIz5CDC/9uTwo7qPDpxk+wi6Qow900hSGgowWn+b63tJAh+
         Ks3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745883268; x=1746488068;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3FmCENqT397CJZoGPG1waVePwVEOJkiwRznrSHaJdc=;
        b=v2n7aU6nopDMZw3RWfkm08hQNwvK0Oz/CIhIfv1p5irpVUaJwMCwRai7upThVSIi6G
         OB0DaA97hNkrzP8TNP12osNY7L35ymXAde4s9MlpiMctsRyl5V4GdEbSOJlriDY5YY3E
         xs2HdRJdXB9rmeoZYK3frCpfnm/Zr2Ghsqa0gzgSnsWoHICYF16zevVwR8BVee4cm6Es
         IJ4bLdBo1F7sNFdAdQzJwHTkhS9WtF2+0Xtj/xDp7bsdjech1vrjhwxLr72Qm0Hb8LWi
         HE4n1DaudLwY0yw8lAcAZT95BL6to26spkTjPEX2vHBeQNxfSjx4pdLnRqkSEPlSNVvN
         nzqg==
X-Gm-Message-State: AOJu0YzEra50QEiEPhY33Yf2QVcxGflnF/MzTOYeJHnUBGWvYybp/P1f
	w7W1xowVrwWvLnPQ/VaWpTfGjDO9bjCCclq66udjlRPXuBWSoyom
X-Gm-Gg: ASbGncsPWDakxEnctuPAk/PCPQcdrhnFcViOQ6Am4HmoyiHO61A92D/2N9Zf1tumZo/
	KnhXsFmEXpROUgC5ec6NyGKhF9vBQYWaQTNAlNYJ6I94oXJC6LK2iC6DQAe4NSedLz+ArttKeeW
	Rt+c21e+pNB/VgnhRH43ytrGsi4HAqM/pHc9ZmrsvPYeZGU5hnoTmnKChCjE7xGggtM5klJC74w
	0/UUXfdiugjCWl7NuMCLnde9iynLM9s1DWAc+MWtJ/onEBGuI38DMalnwoYkHQR0g5m2Dmgsah5
	WhtdM894uwDlyqSx4Fo5BS6iIn6bfS66DHpwQzJGyg==
X-Google-Smtp-Source: AGHT+IHL+ICI0uL1oJyOJQFyzxaFSNc+xyn2lYqxR9Leiq5AHeqovkxe4PM2+tYVC0CJbSOCRjBf9w==
X-Received: by 2002:a17:902:d488:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22de6bff536mr14604995ad.8.1745883267652;
        Mon, 28 Apr 2025 16:34:27 -0700 (PDT)
Received: from [192.168.1.6] ([58.29.143.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd5f2sm89396575ad.66.2025.04.28.16.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 16:34:27 -0700 (PDT)
Message-ID: <f4ff2be5-37e4-4868-8a5a-85cae6e26a29@gmail.com>
Date: Tue, 29 Apr 2025 08:34:24 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] sched_ext: Move dsq_hash into scx_sched
To: Tejun Heo <tj@kernel.org>, void@manifault.com, arighi@nvidia.com
Cc: linux-kernel@vger.kernel.org, sched-ext@meta.com
References: <20250425215840.2334972-1-tj@kernel.org>
 <20250425215840.2334972-7-tj@kernel.org> <aA_obyL9LiVwYHEp@slm.duckdns.org>
From: Changwoo Min <multics69@gmail.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <aA_obyL9LiVwYHEp@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tejun,

With this change, everything looks good to me, so

Acked-by: Changwoo Min <changwoo@igalia.com>


On 4/29/25 05:43, Tejun Heo wrote:
> User DSQs are going to become per scheduler instance. Move dsq_hash into
> scx_sched. This shifts the code that assumes scx_root to be the only
> scx_sched instance up the call stack but doesn't remove them yet.
> 
> v2: Add missing rcu_read_lock() in scx_bpf_destroy_dsq() as per Andrea.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: Andrea Righi <arighi@nvidia.com>
> ---
>   kernel/sched/ext.c |  122 +++++++++++++++++++++++++++++++++++------------------
>   1 file changed, 82 insertions(+), 40 deletions(-)
> 
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -770,6 +770,7 @@ struct scx_sched {
>   	struct sched_ext_ops	ops;
>   	DECLARE_BITMAP(has_op, SCX_OPI_END);
>   
> +	struct rhashtable	dsq_hash;
>   	bool			warned_zero_slice;
>   
>   	atomic_t		exit_kind;
> @@ -1016,7 +1017,6 @@ static const struct rhashtable_params ds
>   	.head_offset		= offsetof(struct scx_dispatch_q, hash_node),
>   };
>   
> -static struct rhashtable dsq_hash;
>   static LLIST_HEAD(dsqs_to_free);
>   
>   /* dispatch buf */
> @@ -1114,9 +1114,9 @@ static struct scx_dispatch_q *find_globa
>   	return global_dsqs[cpu_to_node(task_cpu(p))];
>   }
>   
> -static struct scx_dispatch_q *find_user_dsq(u64 dsq_id)
> +static struct scx_dispatch_q *find_user_dsq(struct scx_sched *sch, u64 dsq_id)
>   {
> -	return rhashtable_lookup_fast(&dsq_hash, &dsq_id, dsq_hash_params);
> +	return rhashtable_lookup_fast(&sch->dsq_hash, &dsq_id, dsq_hash_params);
>   }
>   
>   /*
> @@ -2059,7 +2059,8 @@ static void dispatch_dequeue(struct rq *
>   		raw_spin_unlock(&dsq->lock);
>   }
>   
> -static struct scx_dispatch_q *find_dsq_for_dispatch(struct rq *rq, u64 dsq_id,
> +static struct scx_dispatch_q *find_dsq_for_dispatch(struct scx_sched *sch,
> +						    struct rq *rq, u64 dsq_id,
>   						    struct task_struct *p)
>   {
>   	struct scx_dispatch_q *dsq;
> @@ -2079,7 +2080,7 @@ static struct scx_dispatch_q *find_dsq_f
>   	if (dsq_id == SCX_DSQ_GLOBAL)
>   		dsq = find_global_dsq(p);
>   	else
> -		dsq = find_user_dsq(dsq_id);
> +		dsq = find_user_dsq(sch, dsq_id);
>   
>   	if (unlikely(!dsq)) {
>   		scx_error("non-existent DSQ 0x%llx for %s[%d]",
> @@ -2120,11 +2121,12 @@ static void mark_direct_dispatch(struct
>   	p->scx.ddsp_enq_flags = enq_flags;
>   }
>   
> -static void direct_dispatch(struct task_struct *p, u64 enq_flags)
> +static void direct_dispatch(struct scx_sched *sch, struct task_struct *p,
> +			    u64 enq_flags)
>   {
>   	struct rq *rq = task_rq(p);
>   	struct scx_dispatch_q *dsq =
> -		find_dsq_for_dispatch(rq, p->scx.ddsp_dsq_id, p);
> +		find_dsq_for_dispatch(sch, rq, p->scx.ddsp_dsq_id, p);
>   
>   	touch_core_sched_dispatch(rq, p);
>   
> @@ -2183,6 +2185,7 @@ static bool scx_rq_online(struct rq *rq)
>   static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
>   			    int sticky_cpu)
>   {
> +	struct scx_sched *sch = scx_root;
>   	struct task_struct **ddsp_taskp;
>   	unsigned long qseq;
>   
> @@ -2249,7 +2252,7 @@ static void do_enqueue_task(struct rq *r
>   	return;
>   
>   direct:
> -	direct_dispatch(p, enq_flags);
> +	direct_dispatch(sch, p, enq_flags);
>   	return;
>   
>   local:
> @@ -2909,7 +2912,8 @@ static void dispatch_to_local_dsq(struct
>    * was valid in the first place. Make sure that the task is still owned by the
>    * BPF scheduler and claim the ownership before dispatching.
>    */
> -static void finish_dispatch(struct rq *rq, struct task_struct *p,
> +static void finish_dispatch(struct scx_sched *sch, struct rq *rq,
> +			    struct task_struct *p,
>   			    unsigned long qseq_at_dispatch,
>   			    u64 dsq_id, u64 enq_flags)
>   {
> @@ -2962,7 +2966,7 @@ retry:
>   
>   	BUG_ON(!(p->scx.flags & SCX_TASK_QUEUED));
>   
> -	dsq = find_dsq_for_dispatch(this_rq(), dsq_id, p);
> +	dsq = find_dsq_for_dispatch(sch, this_rq(), dsq_id, p);
>   
>   	if (dsq->id == SCX_DSQ_LOCAL)
>   		dispatch_to_local_dsq(rq, dsq, p, enq_flags);
> @@ -2970,7 +2974,7 @@ retry:
>   		dispatch_enqueue(dsq, p, enq_flags | SCX_ENQ_CLEAR_OPSS);
>   }
>   
> -static void flush_dispatch_buf(struct rq *rq)
> +static void flush_dispatch_buf(struct scx_sched *sch, struct rq *rq)
>   {
>   	struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
>   	u32 u;
> @@ -2978,7 +2982,7 @@ static void flush_dispatch_buf(struct rq
>   	for (u = 0; u < dspc->cursor; u++) {
>   		struct scx_dsp_buf_ent *ent = &dspc->buf[u];
>   
> -		finish_dispatch(rq, ent->task, ent->qseq, ent->dsq_id,
> +		finish_dispatch(sch, rq, ent->task, ent->qseq, ent->dsq_id,
>   				ent->enq_flags);
>   	}
>   
> @@ -2988,6 +2992,7 @@ static void flush_dispatch_buf(struct rq
>   
>   static int balance_one(struct rq *rq, struct task_struct *prev)
>   {
> +	struct scx_sched *sch = scx_root;
>   	struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
>   	bool prev_on_scx = prev->sched_class == &ext_sched_class;
>   	bool prev_on_rq = prev->scx.flags & SCX_TASK_QUEUED;
> @@ -3055,7 +3060,7 @@ static int balance_one(struct rq *rq, st
>   		SCX_CALL_OP(SCX_KF_DISPATCH, dispatch, rq, cpu_of(rq),
>   			    prev_on_scx ? prev : NULL);
>   
> -		flush_dispatch_buf(rq);
> +		flush_dispatch_buf(sch, rq);
>   
>   		if (prev_on_rq && prev->scx.slice) {
>   			rq->scx.flags |= SCX_RQ_BAL_KEEP;
> @@ -3149,11 +3154,12 @@ static void process_ddsp_deferred_locals
>   	 */
>   	while ((p = list_first_entry_or_null(&rq->scx.ddsp_deferred_locals,
>   				struct task_struct, scx.dsq_list.node))) {
> +		struct scx_sched *sch = scx_root;
>   		struct scx_dispatch_q *dsq;
>   
>   		list_del_init(&p->scx.dsq_list.node);
>   
> -		dsq = find_dsq_for_dispatch(rq, p->scx.ddsp_dsq_id, p);
> +		dsq = find_dsq_for_dispatch(sch, rq, p->scx.ddsp_dsq_id, p);
>   		if (!WARN_ON_ONCE(dsq->id != SCX_DSQ_LOCAL))
>   			dispatch_to_local_dsq(rq, dsq, p, p->scx.ddsp_enq_flags);
>   	}
> @@ -4207,14 +4213,14 @@ static void free_dsq_irq_workfn(struct i
>   
>   static DEFINE_IRQ_WORK(free_dsq_irq_work, free_dsq_irq_workfn);
>   
> -static void destroy_dsq(u64 dsq_id)
> +static void destroy_dsq(struct scx_sched *sch, u64 dsq_id)
>   {
>   	struct scx_dispatch_q *dsq;
>   	unsigned long flags;
>   
>   	rcu_read_lock();
>   
> -	dsq = find_user_dsq(dsq_id);
> +	dsq = find_user_dsq(sch, dsq_id);
>   	if (!dsq)
>   		goto out_unlock_rcu;
>   
> @@ -4226,7 +4232,8 @@ static void destroy_dsq(u64 dsq_id)
>   		goto out_unlock_dsq;
>   	}
>   
> -	if (rhashtable_remove_fast(&dsq_hash, &dsq->hash_node, dsq_hash_params))
> +	if (rhashtable_remove_fast(&sch->dsq_hash, &dsq->hash_node,
> +				   dsq_hash_params))
>   		goto out_unlock_dsq;
>   
>   	/*
> @@ -4400,7 +4407,21 @@ static void scx_sched_free_rcu_work(stru
>   {
>   	struct rcu_work *rcu_work = to_rcu_work(work);
>   	struct scx_sched *sch = container_of(rcu_work, struct scx_sched, rcu_work);
> +	struct rhashtable_iter rht_iter;
> +	struct scx_dispatch_q *dsq;
> +
> +	rhashtable_walk_enter(&sch->dsq_hash, &rht_iter);
> +	do {
> +		rhashtable_walk_start(&rht_iter);
> +
> +		while ((dsq = rhashtable_walk_next(&rht_iter)) && !IS_ERR(dsq))
> +			destroy_dsq(sch, dsq->id);
> +
> +		rhashtable_walk_stop(&rht_iter);
> +	} while (dsq == ERR_PTR(-EAGAIN));
> +	rhashtable_walk_exit(&rht_iter);
>   
> +	rhashtable_free_and_destroy(&sch->dsq_hash, NULL, NULL);
>   	free_exit_info(sch->exit_info);
>   	kfree(sch);
>   }
> @@ -4704,8 +4725,6 @@ static void scx_disable_workfn(struct kt
>   	struct scx_exit_info *ei = sch->exit_info;
>   	struct scx_task_iter sti;
>   	struct task_struct *p;
> -	struct rhashtable_iter rht_iter;
> -	struct scx_dispatch_q *dsq;
>   	int kind, cpu;
>   
>   	kind = atomic_read(&sch->exit_kind);
> @@ -4837,17 +4856,6 @@ static void scx_disable_workfn(struct kt
>   	 */
>   	kobject_del(&sch->kobj);
>   
> -	rhashtable_walk_enter(&dsq_hash, &rht_iter);
> -	do {
> -		rhashtable_walk_start(&rht_iter);
> -
> -		while ((dsq = rhashtable_walk_next(&rht_iter)) && !IS_ERR(dsq))
> -			destroy_dsq(dsq->id);
> -
> -		rhashtable_walk_stop(&rht_iter);
> -	} while (dsq == ERR_PTR(-EAGAIN));
> -	rhashtable_walk_exit(&rht_iter);
> -
>   	free_percpu(scx_dsp_ctx);
>   	scx_dsp_ctx = NULL;
>   	scx_dsp_max_batch = 0;
> @@ -5251,6 +5259,10 @@ static struct scx_sched *scx_alloc_and_a
>   		goto err_free_sch;
>   	}
>   
> +	ret = rhashtable_init(&sch->dsq_hash, &dsq_hash_params);
> +	if (ret < 0)
> +		goto err_free_ei;
> +
>   	atomic_set(&sch->exit_kind, SCX_EXIT_NONE);
>   	sch->ops = *ops;
>   	ops->priv = sch;
> @@ -5258,10 +5270,12 @@ static struct scx_sched *scx_alloc_and_a
>   	sch->kobj.kset = scx_kset;
>   	ret = kobject_init_and_add(&sch->kobj, &scx_ktype, NULL, "root");
>   	if (ret < 0)
> -		goto err_free_ei;
> +		goto err_free_hash;
>   
>   	return sch;
>   
> +err_free_hash:
> +	rhashtable_free_and_destroy(&sch->dsq_hash, NULL, NULL);
>   err_free_ei:
>   	free_exit_info(sch->exit_info);
>   err_free_sch:
> @@ -6102,7 +6116,6 @@ void __init init_sched_ext_class(void)
>   	WRITE_ONCE(v, SCX_ENQ_WAKEUP | SCX_DEQ_SLEEP | SCX_KICK_PREEMPT |
>   		   SCX_TG_ONLINE);
>   
> -	BUG_ON(rhashtable_init(&dsq_hash, &dsq_hash_params));
>   	scx_idle_init_masks();
>   
>   	scx_kick_cpus_pnt_seqs =
> @@ -6303,6 +6316,7 @@ static const struct btf_kfunc_id_set scx
>   static bool scx_dsq_move(struct bpf_iter_scx_dsq_kern *kit,
>   			 struct task_struct *p, u64 dsq_id, u64 enq_flags)
>   {
> +	struct scx_sched *sch = scx_root;
>   	struct scx_dispatch_q *src_dsq = kit->dsq, *dst_dsq;
>   	struct rq *this_rq, *src_rq, *locked_rq;
>   	bool dispatched = false;
> @@ -6355,7 +6369,7 @@ static bool scx_dsq_move(struct bpf_iter
>   	}
>   
>   	/* @p is still on $src_dsq and stable, determine the destination */
> -	dst_dsq = find_dsq_for_dispatch(this_rq, dsq_id, p);
> +	dst_dsq = find_dsq_for_dispatch(sch, this_rq, dsq_id, p);
>   
>   	/*
>   	 * Apply vtime and slice updates before moving so that the new time is
> @@ -6435,15 +6449,16 @@ __bpf_kfunc void scx_bpf_dispatch_cancel
>    */
>   __bpf_kfunc bool scx_bpf_dsq_move_to_local(u64 dsq_id)
>   {
> +	struct scx_sched *sch = scx_root;
>   	struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
>   	struct scx_dispatch_q *dsq;
>   
>   	if (!scx_kf_allowed(SCX_KF_DISPATCH))
>   		return false;
>   
> -	flush_dispatch_buf(dspc->rq);
> +	flush_dispatch_buf(sch, dspc->rq);
>   
> -	dsq = find_user_dsq(dsq_id);
> +	dsq = find_user_dsq(sch, dsq_id);
>   	if (unlikely(!dsq)) {
>   		scx_error("invalid DSQ ID 0x%016llx", dsq_id);
>   		return false;
> @@ -6704,6 +6719,7 @@ __bpf_kfunc_start_defs();
>   __bpf_kfunc s32 scx_bpf_create_dsq(u64 dsq_id, s32 node)
>   {
>   	struct scx_dispatch_q *dsq;
> +	struct scx_sched *sch;
>   	s32 ret;
>   
>   	if (unlikely(node >= (int)nr_node_ids ||
> @@ -6719,8 +6735,16 @@ __bpf_kfunc s32 scx_bpf_create_dsq(u64 d
>   
>   	init_dsq(dsq, dsq_id);
>   
> -	ret = rhashtable_lookup_insert_fast(&dsq_hash, &dsq->hash_node,
> -					    dsq_hash_params);
> +	rcu_read_lock();
> +
> +	sch = rcu_dereference(scx_root);
> +	if (sch)
> +		ret = rhashtable_lookup_insert_fast(&sch->dsq_hash, &dsq->hash_node,
> +						    dsq_hash_params);
> +	else
> +		ret = -ENODEV;
> +
> +	rcu_read_unlock();
>   	if (ret)
>   		kfree(dsq);
>   	return ret;
> @@ -6819,11 +6843,18 @@ out:
>    */
>   __bpf_kfunc s32 scx_bpf_dsq_nr_queued(u64 dsq_id)
>   {
> +	struct scx_sched *sch;
>   	struct scx_dispatch_q *dsq;
>   	s32 ret;
>   
>   	preempt_disable();
>   
> +	sch = rcu_dereference_sched(scx_root);
> +	if (!sch) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
>   	if (dsq_id == SCX_DSQ_LOCAL) {
>   		ret = READ_ONCE(this_rq()->scx.local_dsq.nr);
>   		goto out;
> @@ -6835,7 +6866,7 @@ __bpf_kfunc s32 scx_bpf_dsq_nr_queued(u6
>   			goto out;
>   		}
>   	} else {
> -		dsq = find_user_dsq(dsq_id);
> +		dsq = find_user_dsq(sch, dsq_id);
>   		if (dsq) {
>   			ret = READ_ONCE(dsq->nr);
>   			goto out;
> @@ -6858,7 +6889,13 @@ out:
>    */
>   __bpf_kfunc void scx_bpf_destroy_dsq(u64 dsq_id)
>   {
> -	destroy_dsq(dsq_id);
> +	struct scx_sched *sch;
> +
> +	rcu_read_lock();
> +	sch = rcu_dereference(scx_root);
> +	if (sch)
> +		destroy_dsq(sch, dsq_id);
> +	rcu_read_unlock();
>   }
>   
>   /**
> @@ -6875,16 +6912,21 @@ __bpf_kfunc int bpf_iter_scx_dsq_new(str
>   				     u64 flags)
>   {
>   	struct bpf_iter_scx_dsq_kern *kit = (void *)it;
> +	struct scx_sched *sch;
>   
>   	BUILD_BUG_ON(sizeof(struct bpf_iter_scx_dsq_kern) >
>   		     sizeof(struct bpf_iter_scx_dsq));
>   	BUILD_BUG_ON(__alignof__(struct bpf_iter_scx_dsq_kern) !=
>   		     __alignof__(struct bpf_iter_scx_dsq));
>   
> +	sch = rcu_dereference(scx_root);
> +	if (!sch)
> +		return -ENODEV;
> +
>   	if (flags & ~__SCX_DSQ_ITER_USER_FLAGS)
>   		return -EINVAL;
>   
> -	kit->dsq = find_user_dsq(dsq_id);
> +	kit->dsq = find_user_dsq(sch, dsq_id);
>   	if (!kit->dsq)
>   		return -ENOENT;
>   

