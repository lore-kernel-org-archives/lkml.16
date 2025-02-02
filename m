Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8104D10E0
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738517637; cv=none; b=IIjMmbwO3KaYuQskFgnrutV5XUIVkPm3G9md8irezWJnCaE2/egzVRc++Xdl++B5Ya8gEHiph/7etVV0iDL7U+Qla4KaLriXsK0/M1WMlcfGTB30r6cyWXj2EL4e+AZSYDHI8zwg4ttOvwXowGMupt11neTrRuH3Nyfh8/kP+qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738517637; c=relaxed/simple;
	bh=0ODzz2cfuMplElhBLK6QX2imWFX32gn+vtKDMMQpbOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EuDHgWo9Sy299Z/ikqWVF/UkiRBjE3Ys/OGpXQctbGtu/5qCIeurDXacoHHk22VPRtTyHvo1foQaptlJyIekcU84xrPJ4rTpLGK1b/X7/sQBgVhiDaEkk2ro0IAKO30JU4MLf1QRgH9snj+U4VlRJIKbOptGnhCdzEGz845AyxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pg1F2o1o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pg1F2o1o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79E2C4CED1;
	Sun,  2 Feb 2025 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738517636;
	bh=0ODzz2cfuMplElhBLK6QX2imWFX32gn+vtKDMMQpbOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pg1F2o1o3ommQGuoJz74LRT6kBqaq2pPirIl36a1GyfRidk6Py0K0O9XyRD2qe/Yk
	 NyWIwbhI8mK5FR/0I8iDzllGXpxqcgKojkhBzEBWXecfaGJanfr3X93FB3tDzaw7qT
	 pSlqJPN2gxK3xLyG+Z0tJm2TIWkpgnNkjQ1e0xIXLXkJsnAecBxDbQi0cGQhw+crfT
	 8kJqJcIqRckVZZ8dXYI9M/pemMuJtKQRwu6CpSjqewUnTh4L0stoV6nnFNwiHzaMPU
	 uleqGI8mcjRDAjbVz1G6opbhQRIxnKni5CuNjJdz6iDRQycmbe0zjLJeBckJ4GyGmR
	 yUORxcagh0jog==
Date: Sun, 2 Feb 2025 07:33:54 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/11] sched_ext: Add an event, SCX_EV_BYPASS_DISPATCH
Message-ID: <Z5-sgoiOGTJvB8e5@slm.duckdns.org>
References: <20250131070938.95551-1-changwoo@igalia.com>
 <20250131070938.95551-8-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131070938.95551-8-changwoo@igalia.com>

Hello,

On Fri, Jan 31, 2025 at 04:09:34PM +0900, Changwoo Min wrote:
...
> @@ -2869,11 +2874,17 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
>  	}
>  
>  	/* if there already are tasks to run, nothing to do */
> -	if (rq->scx.local_dsq.nr)
> +	if (rq->scx.local_dsq.nr) {
> +		if (scx_rq_bypassing(rq))
> +			__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
>  		goto has_tasks;
> +	}
>  
> -	if (consume_global_dsq(rq))
> +	if (consume_global_dsq(rq)) {
> +		if (scx_rq_bypassing(rq))
> +			__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);

Hmm... Wouldn't it be easier to count it from select_task_rq_scx() and
do_enqueue_task()? The latter already has scx_rq_bypassing() condition and
the former one can easily cache bypassing test result and use that in the
else block.

> @@ -2899,10 +2910,16 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
>  			rq->scx.flags |= SCX_RQ_BAL_KEEP;
>  			goto has_tasks;
>  		}
> -		if (rq->scx.local_dsq.nr)
> +		if (rq->scx.local_dsq.nr) {
> +			if (scx_rq_bypassing(rq))
> +				__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
>  			goto has_tasks;
> -		if (consume_global_dsq(rq))
> +		}
> +		if (consume_global_dsq(rq)) {
> +			if (scx_rq_bypassing(rq))
> +				__scx_add_event(SCX_EV_BYPASS_DISPATCH, 1);
>  			goto has_tasks;
> +		}

The above can happen while bypass mode is being turned on but once on
control doesn't even reach here, right?

Thanks.

-- 
tejun
