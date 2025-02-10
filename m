Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D4D25A2AB
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228273; cv=none; b=kfTONw+pWWSv3CpBwWmL9vNOzKDSKIgho9/nXXaAdIRZiGtenBq8jeho+vHjf4yhg2k0xgCsa2qAUM+VjOov3ZAIKmESTWLOCwmrgoShTkaQhN8P22qdNxKJUMjA+eS4dledrDd07d2Jcmiybbx9LBJFQ60/sG/dvZnddsG5/KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228273; c=relaxed/simple;
	bh=2QNMnCgbJTOG6udpsBCV7I/eJutKDD1y5fsyUE6g5mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2fz+1uyk3OpDWAZ+VEeuX3dvDzxeitf8WwoqVOGZniGvE0GQXbm5XjKKf6rEYEzAZHNRF4oTo7HFVyHSqTwMjeUfOGFn5Qt8DPANa2ws9opcUlD6frvBkXoKWokZ/PYDFg18Q0LGFU7yvsZ9ZpwUuY0NXGc0mnYzqk17IkIRfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIiuWjNY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIiuWjNY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA19C4CED1;
	Mon, 10 Feb 2025 22:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739228273;
	bh=2QNMnCgbJTOG6udpsBCV7I/eJutKDD1y5fsyUE6g5mI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZIiuWjNYC2bWmCsYLngfobtRbVJfWTxCzcv+e21g1H9qF83SO/ErRJYDoISPguOom
	 hfWRQxDjPLEgVNVqZHUafR/SBf2Mv+ohHLJXIJ+B3ulQtgERFWLWgd/UTtg7j90U9c
	 h3eYfb4jmb/GNKx3udAR9tMxpBjkks4m3W9YuwEa7JW6L01qZKTDc1NFj8Mym/HaOf
	 omQJlNhgCkUSvl2klcYph6WpbYwY7GPXP2lciLXd2/YAr1LUHaTnv/tcP6tzhuBG96
	 cjsO/EmhT9FTZYagGAZeByTqmHw3vPlX1H+Pdq54cCJBDwraYFE2ZmKTZ7WCBfk8bt
	 os/cdYmnQB6PQ==
Date: Mon, 10 Feb 2025 14:57:52 -0800
From: Kees Cook <kees@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: luto@amacapital.net, wad@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] seccomp: avoid the lock trip in seccomp_filter_release
 in common case
Message-ID: <202502101454.DE164D34@keescook>
References: <20250210210541.867037-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210210541.867037-1-mjguzik@gmail.com>

On Mon, Feb 10, 2025 at 10:05:41PM +0100, Mateusz Guzik wrote:
> Vast majority of threads don't have any seccomp filters, all while the
> lock taken here is shared between all threads in given process and
> frequently used.
> 
> Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> ---
> 
> Here is a splat from parallel thread creation/destruction within onep
> rocess:
> 
> bpftrace -e 'kprobe:__pv_queued_spin_lock_slowpath { @[kstack()] = count(); }'
> 
> [snip]
> @[
>     __pv_queued_spin_lock_slowpath+5
>     _raw_spin_lock_irq+42
>     seccomp_filter_release+32
>     do_exit+286
>     __x64_sys_exit+27
>     x64_sys_call+4703
>     do_syscall_64+82
>     entry_SYSCALL_64_after_hwframe+118
> ]: 475601
> @[
>     __pv_queued_spin_lock_slowpath+5
>     _raw_spin_lock_irq+42
>     acct_collect+77
>     do_exit+1380
>     __x64_sys_exit+27
>     x64_sys_call+4703
>     do_syscall_64+82
>     entry_SYSCALL_64_after_hwframe+118
> ]: 478335
> @[
>     __pv_queued_spin_lock_slowpath+5
>     _raw_spin_lock_irq+42
>     sigprocmask+106
>     __x64_sys_rt_sigprocmask+121
>     do_syscall_64+82
>     entry_SYSCALL_64_after_hwframe+118
> ]: 1825572
> 
> There are more spots which take the same lock, with seccomp being top 3.
> 
> I could not be bothered to bench before/after, but I can do it if you
> insist. The fact that this codepath is a factor can be seen above.
> 
> This is a minor patch, I'm not going to insist on it.
> 
> To my reading seccomp only ever gets populated for current, so this
> should be perfectly safe to test on exit without any synchronisation.

Unfortunately, this is not true. SECCOMP_FILTER_FLAG_TSYNC may operate
on non-current. See the paired smp_store_release() and smp_rmb() uses.

> This may need a data_race annotation if some tooling decides to protest.
> 
>  kernel/seccomp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/seccomp.c b/kernel/seccomp.c
> index 7bbb408431eb..c839674966e2 100644
> --- a/kernel/seccomp.c
> +++ b/kernel/seccomp.c
> @@ -576,6 +576,9 @@ void seccomp_filter_release(struct task_struct *tsk)
>  	if (WARN_ON((tsk->flags & PF_EXITING) == 0))
>  		return;
>  
> +	if (tsk->seccomp.filter == NULL)
> +		return;
> +
>  	spin_lock_irq(&tsk->sighand->siglock);
>  	orig = tsk->seccomp.filter;
>  	/* Detach task from its filter tree. */

If this can be made provably race-safe, I'd be fine with the idea, but
at present, all seccomp.filter manipulation happens under
sighand->siglock...

-Kees

-- 
Kees Cook
