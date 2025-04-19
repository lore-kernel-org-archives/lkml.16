Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE28E29D0E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745084059; cv=none; b=nc6JS/CZZVEzmvt4SLlaiyYqkwfZ2n1zjCqlimG2J+YQSIDbJbtyW1UXHA4N2D9JvWQKCpAN1Sm0kKWFhyyZnGSlTNM7gv1/l80c5pEX9Bpcbw1DyGEN5ifgRwCI2Tojd3cPiYABZAw6nWTQgT/kNypslDk8E1jX/mbbhKmCd/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745084059; c=relaxed/simple;
	bh=FsErTkd992xSTacCc+izQlvA8kjPd00HosNs/DQsdEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6CcUhVJyNgm+ukKBN/xxa0KJdnba40GDiHrm1LOmAX2x2yY2T7TK/YuzV5rqFanSZXJkNRjGt95ILL7mmp7H28J5cwC/ehf9NLK4/ngxIF6ivd8I0alWnLsZ6xV3g7LIE1Gg5TsnVk2+sWtnpcBnZJVEIZb99g2QVlN79/6XsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoaFCNV9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoaFCNV9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8F1C4CEE7;
	Sat, 19 Apr 2025 17:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745084058;
	bh=FsErTkd992xSTacCc+izQlvA8kjPd00HosNs/DQsdEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoaFCNV9Q6s97BsHUsI0ufeP83cmDnLL7EzFtdiH23F02d0GqCIMMpct28o5MfGEx
	 fyWGM3Drz9vGg4hmIl3XYYouNgoE1TjaMIhCGnpaiZtz5Apr7mDbkedLdOdVOY2jF7
	 h/n5xLDUONvtK76ID5uBBxEwG9YHqhfAcuUS4xxPSjIqyXXiKygyWI+8jl2VYmRRdK
	 aOWMc2GEOzrqjcH5TQO4BY0syl+zWaOmXxImKtSp9GNxJqkUY3Jdn+ZBxfmbKfvrku
	 AvLHGgF8ubju58q/MJ543PBhB92Qn3Cjk3Q24oNraMuVoxR41jirUKA3blT3YwAftO
	 lDfPfQllAnYqA==
Date: Sat, 19 Apr 2025 07:34:16 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched_ext: Track currently locked rq
Message-ID: <aAPemAFUsJaF_C2X@slm.duckdns.org>
References: <20250419123536.154469-1-arighi@nvidia.com>
 <20250419123536.154469-2-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419123536.154469-2-arighi@nvidia.com>

Hello, Andrea.

On Sat, Apr 19, 2025 at 02:24:30PM +0200, Andrea Righi wrote:
> @@ -149,6 +149,7 @@ struct sched_ext_entity {
>  	s32			selected_cpu;
>  	u32			kf_mask;	/* see scx_kf_mask above */
>  	struct task_struct	*kf_tasks[2];	/* see SCX_CALL_OP_TASK() */
> +	struct rq		*locked_rq;	/* currently locked rq */

Can this be a percpu variable? While rq is locked, current can't switch out
anyway and that way we don't have to increase the size of task. Note that
kf_tasks[] are different in that some ops may, at least theoretically,
sleep.

> +static inline void update_locked_rq(struct rq *rq)
> +{
> +	/*
> +	 * Check whether @rq is actually locked. This can help expose bugs
> +	 * or incorrect assumptions about the context in which a kfunc or
> +	 * callback is executed.
> +	 */
> +	if (rq)
> +		lockdep_assert_rq_held(rq);
> +	current->scx.locked_rq = rq;
> +	barrier();

As these conditions are program-order checks on the local CPU, I don't think
any barrier is necessary.

Thanks.

-- 
tejun
