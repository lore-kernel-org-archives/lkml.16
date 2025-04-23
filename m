Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A98B266569
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745435100; cv=none; b=dbMN5cwHrofYkfpM66ljkDmDBVu7Pk9ahO8S4IL9hLq6SZjgjVGTzXP5plYNDZOYQgWTIBgbAGCkJ8PI7a/8L6IHOVlNJ4GzRjOYygWN4JuVBVcVr7Fjsw+iyWuCvaiYx9OUeoPDg1d2PshcQVj1fJSySeqqcPbiU3VWjVwzyRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745435100; c=relaxed/simple;
	bh=jXgI37zO1+36S5HP4cZRXNILluXig5Rs8r+BdvE6n/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOrNEaQdUKAQVJKGOWDqD9XvS7t0fTSh+gQHwtmpFt8YMGaXrMVWyAi6sAqnHPYqxfB97fFQL7LsVaA5VDrpLf/SC+wHlVufWYQl6GEtdlCwXBX6CaNYxK2Wk7Ks9fBFKYL2uly8AK5kpjEx7Jk3LE+NFOsmZKgmS9Mscc1Mtzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGaBnmy9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGaBnmy9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC14C4CEE2;
	Wed, 23 Apr 2025 19:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745435100;
	bh=jXgI37zO1+36S5HP4cZRXNILluXig5Rs8r+BdvE6n/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGaBnmy9DQyyuQuoyT8H43wEYcTPUMCKw8bpITuudr7Jrgc8qwzgigGC7mXPHZKVW
	 oasF5cqr7GbzNX/JOvLmBRO8BzNncDSNLbOfdUz/0pOGyOUq8wPwL2ZPdlUpmCXx0F
	 Kjs/aLq0BHa7v6mQm+IH6nCk5u9T/i4tfTs6ozpbwBuYhc9fzTIS9G2OwRRVJTT5L9
	 DM2We90f8jJui8V6agMpvF7zTDGusiPPiVcxKIgno+OSZL2wL+QRTWYxXQ4yoG/Um1
	 wiSxbPurP4jld3HesFGhUzdAFjYXxhIVio2fCttoW5VUQG8tze098CZT4VV5KU2pKo
	 QscjAEaxukj3Q==
Date: Wed, 23 Apr 2025 09:04:58 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Jake Hillion <jake@hillion.co.uk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Clarify CPU context for running/stopping
 callbacks
Message-ID: <aAk52qs21rCXpZlF@slm.duckdns.org>
References: <20250423190059.270236-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423190059.270236-1-arighi@nvidia.com>

On Wed, Apr 23, 2025 at 09:00:59PM +0200, Andrea Righi wrote:
> The ops.running() and ops.stopping() callbacks can be invoked from a CPU
> other than the one the task is assigned to, particularly during affinity
> changes, as both scx_next_task_scx() and dequeue_task_scx() may run on
> CPUs different from the task's target CPU.
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
>  kernel/sched/ext.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index a2380a6bba210..f146e678cc261 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -373,6 +373,10 @@ struct sched_ext_ops {
>  	 * @running: A task is starting to run on its associated CPU
>  	 * @p: task starting to run
>  	 *
> +	 * Note that this callback may be called from a CPU other than the
> +	 * one the task is going to run on. Use scx_bpf_task_cpu(@p) to
> +	 * determine the target CPU the task is going to use.

Can you briefly explain the scenario as a part of the comment? Just a couple
sentences can go a long way against future head scratches.

Thanks.

-- 
tejun
