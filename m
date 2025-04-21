Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7C2C2ED
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745262189; cv=none; b=T3LbMYtX+PKrfFKLQ3Les/aVuvzvK0UMQRMuebcw3K08YT0nZBpRudjG/NISavMq2q/EAGAVPjrKCZj1dYUyCPoYWYf25RnUp8KQ/xqSxnru8jSUURNMxaxhzzkmpxVhfMwkKtqSASzTwuMU1bcpq+bbgcHxYdqo3LDPktk0/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745262189; c=relaxed/simple;
	bh=bmCgWfnoZUXZEf+W3FrWlYU9o2ER7cVzCqVmQJ6BiVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8TQvIeEFEkZT+UJSgnohFSVEJ8NoMPgfiWz+RXg2kiRHnOoj+ThAuc5dxSR0LUcKAAcA+eRcrCbRu2HmuG9wJAjaH6gt9C69/UtmWN9hPXrT/g+NhlcRITS0oITneAQ4ldVd3/VcBTw3Hex+OX55QndpOzawmDdFnxE6LERsls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFxyqAW2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFxyqAW2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B091C4CEE4;
	Mon, 21 Apr 2025 19:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745262189;
	bh=bmCgWfnoZUXZEf+W3FrWlYU9o2ER7cVzCqVmQJ6BiVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BFxyqAW2k4aspOo+lhpNaTzfRAU4T+P4XmhefK5tB6Je5b38vkRuM+rVWuDddFyZL
	 WlrzT71r5O+hDC5nHJg/II84+nNuGuplI9iT4MU9yownp/p+ax+05643WBqnTQT65v
	 Ub3+nD9nUXChEOHy69AjHOldVgVDRqThtmDwC7FvwwEvWDd11ndDeeIOE2SdiKtnJk
	 jmNC7DaWlVH2IRRWFxg+k9FyHbpoDQ+QYUyydUV1IbFgFi1JW6Qf2xNpMuKT+rFthm
	 z17mF1Ll8P725Sou9eX7Crspw7cx2JE27lsI/m1QmUNCVxhhuX1n8MScPPRZ1ifZH0
	 G6Z8NA47zHEZQ==
Date: Mon, 21 Apr 2025 09:03:08 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched_ext: Track currently locked rq
Message-ID: <aAaWbDu-WKEhQYq_@slm.duckdns.org>
References: <20250420193106.42533-1-arighi@nvidia.com>
 <20250420193106.42533-2-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420193106.42533-2-arighi@nvidia.com>

Hello,

On Sun, Apr 20, 2025 at 09:30:21PM +0200, Andrea Righi wrote:
...
> +static inline struct rq *scx_locked_rq(void)
> +{
> +	return __this_cpu_read(locked_rq);
> +}
> +
> +#define SCX_CALL_OP(mask, rq, op, args...)					\
>  do {										\
> +	update_locked_rq(rq);							\

Minor but why not

        if (rq)
                update_locked_rq(rq);

here too to be symmetric?

>  	if (mask) {								\
>  		scx_kf_allow(mask);						\
>  		scx_ops.op(args);						\
> @@ -1125,11 +1155,15 @@ do {										\
>  	} else {								\
>  		scx_ops.op(args);						\
>  	}									\
> +	if (rq)									\
> +		update_locked_rq(NULL);						\

Or alternatively, drop `if (rq)` from both places. That's simpler and given
that all the hot paths are called with rq locked, that may be *minutely*
faster.

> @@ -2174,7 +2210,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
>  	WARN_ON_ONCE(*ddsp_taskp);
>  	*ddsp_taskp = p;
>  
> -	SCX_CALL_OP_TASK(SCX_KF_ENQUEUE, enqueue, p, enq_flags);
> +	SCX_CALL_OP_TASK(SCX_KF_ENQUEUE, rq, enqueue, p, enq_flags);

Let's do SCX_CALL_OP_TASK(SCX_FK_ENQUEUE, enqueue, rq, p, enq_flags) so that
the static parts of the invocation are grouped together and we usually have
@rq and @p next to each other when they're used as parameters.

Thanks.

-- 
tejun
