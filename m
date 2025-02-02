Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5594A1FAC52
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738516814; cv=none; b=MOCzQUAzKW22qj7U2Jl+wdyZVJr8APqGEMODJElv/9GtmdHeUr623ETKkcUnnSjG9VHwwyUGCyW19al6I5Q9O8+OydiBrPmjZRkR9t39fmnH4N54oNlEKxr8/JYblfZQtZGZxMqpQp8/ZauMAkIyaZpzjrojw09uOJ8SWyu6KDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738516814; c=relaxed/simple;
	bh=/Tt5YEhlWXoD7vD9kcmicLlJPflGxHF31dTHGbnQ6s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkHfK6laehcZUWomI9mMMdbJtVRjwJQv8QrRz6bhfbYVGN4YwpmpZKTYFgiyGT076j3mPVoBiBZXE3/0DEt+PjfDAXESrx1MZNmtZNOwN+259mJSlWdh0CEtYFFBn++Cv025G1F+acl9TNhT0a7GkzhY1h5oFAVfed89wEDAB1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pj9HMoX/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pj9HMoX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D47C4CED1;
	Sun,  2 Feb 2025 17:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738516813;
	bh=/Tt5YEhlWXoD7vD9kcmicLlJPflGxHF31dTHGbnQ6s8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pj9HMoX/hdf1LmZIKtVRb368ERYAmwOq1mNavKO6oqck3FG/06TRaB9Zi0qjHNlz8
	 /VtKEkoN2qg8fqcf2GRXVYjz/Jqsi7I2QaK2nGzMCOzxDGrUhLCGsQv0qkm5TwRJQc
	 IUDwk2uc0UIII6wcYnJgYgNh39k26IdacYrDNk5pP9lQjtmVbdfbLaNnIxbpLOcCzw
	 FxAx37vjWP/uqmPXgdn+hwfCrcLqjWO3r0QN+q8Xo0ovNXq9Y4O6jMwCU8fijIWfyt
	 CFk148Ba86a3WcxHYNZ1fDG8dOPsbwZ+UagLjqgdrTB8gi4oXjE6fWnM6+A9MSMP89
	 OuHSjgQ6FRhPQ==
Date: Sun, 2 Feb 2025 07:20:12 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/11] sched_ext: Add an event, SCX_EV_ENQ_SKIP_EXITING
Message-ID: <Z5-pTOjBwsQRB0OF@slm.duckdns.org>
References: <20250131070938.95551-1-changwoo@igalia.com>
 <20250131070938.95551-6-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131070938.95551-6-changwoo@igalia.com>

On Fri, Jan 31, 2025 at 04:09:32PM +0900, Changwoo Min wrote:
> Add a core event, SCX_EV_ENQ_SKIP_EXITING, which represents how many
> times a task is enqueued to a local DSQ when exiting if
> SCX_OPS_ENQ_EXITING is not set.
> 
> __scx_add_event() is used since the caller holds an rq lock,
> so the preemption has already been disabled.
> 
> Signed-off-by: Changwoo Min <changwoo@igalia.com>
> ---
>  kernel/sched/ext.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 7147f730850b..37f86a84ac5d 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -1461,6 +1461,12 @@ struct scx_event_stats {
>  	 * continued to run because there were no other tasks on the CPU.
>  	 */
>  	u64		SCX_EV_DISPATCH_KEEP_LAST;
> +
> +	/*
> +	 * If SCX_OPS_ENQ_EXITING is not set, the number of times that a task
> +	 * is dispatched to a local DSQ when exiting.
> +	 */
> +	u64		SCX_EV_ENQ_SKIP_EXITING;
>  };
>  
>  /*
> @@ -2068,8 +2074,10 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
>  
>  	/* see %SCX_OPS_ENQ_EXITING */
>  	if (!static_branch_unlikely(&scx_ops_enq_exiting) &&
> -	    unlikely(p->flags & PF_EXITING))
> +	    unlikely(p->flags & PF_EXITING)) {
> +		__scx_add_event(SCX_EV_ENQ_SKIP_EXITING, 1);
>  		goto local;
> +	}
>  
>  	if (!SCX_HAS_OP(enqueue))
>  		goto global;
> @@ -4986,6 +4994,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
>  	scx_dump_event(s, &events, SCX_EV_SELECT_CPU_FALLBACK);
>  	scx_dump_event(s, &events, SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE);
>  	scx_dump_event(s, &events, SCX_EV_DISPATCH_KEEP_LAST);
> +	scx_dump_event(s, &events, SCX_EV_ENQ_SKIP_EXITING);
>  
>  	if (seq_buf_has_overflowed(&s) && dump_len >= sizeof(trunc_marker))
>  		memcpy(ei->dump + dump_len - sizeof(trunc_marker),

Missing agg call?

-- 
tejun
