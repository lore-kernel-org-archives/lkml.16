Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A88215779
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743458384; cv=none; b=KwFLrmSYEVXNQz9BAn5ltCU8k1vVrqyUJ0DMhlLuO8RDO24zBzpTiV8F4r2cR8x3KJ0iy2fmTyzZuUqieaoY/t8ElCQZScAkzc6tdz8YZ924ERXgUPdA9Ub28/CdzUteRlHcNv3vHE8gpQM+dOx0SvMFvonmabdWt867j8FzEKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743458384; c=relaxed/simple;
	bh=ak9G0OFSTvzXcxYOAA0x6onBBk5Xr0Yy78QYolXluNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JX4xu25IaSmhucIHjSz+qQ5Cj7oQbgP0tIZhupha5vRcc2d0mR4Qyxjl3yWkRmM1WYEissUo3Gnkv5KbQb8QC2Q+bCb2+brIJqAWX/HFvz0TWtEHfL48XRUrmeSD2uKTS8w0/FcZ2aI5Ig+oeSV/bqC5BUBffx1xwJd5yHQ7CYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qe9GEuro; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qe9GEuro"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4AC7C4CEE3;
	Mon, 31 Mar 2025 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743458383;
	bh=ak9G0OFSTvzXcxYOAA0x6onBBk5Xr0Yy78QYolXluNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qe9GEurozKLDw5dH75+SbNvG8l8CiLZedAuY0dqQXYuZEkjU+vTB6jF9/54DJlL+e
	 hlZ1ggbmShG+9whWwg5WtJDONwo4NZxy7c/qbQd376QXWbPf8zEx1MDWvnAvyCuWWS
	 Hz4Mn6tyqOvNnOW66S+30i2sNOyNlBX5nOfy/Fi1EwOhup+IE4ahcLtO6unqSWrtRx
	 OFAfUmmQ82HpxyLdY1qKxwbcC4ImDfFQEqs3t7qTF96sUOPWj46LyrGZDTxgEK4tBA
	 x1v0PWU6bflCg8cvUszVmwAx38DxthqEw5l0QLVcqNmZIjfoZ96aCxdMuSYik5ohBB
	 0fHoGhCCPFNLg==
Date: Mon, 31 Mar 2025 11:59:42 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] sched_ext: idle: Introduce scx_bpf_select_cpu_and()
Message-ID: <Z-sQTkz8mOuUKar7@slm.duckdns.org>
References: <20250321221454.298202-1-arighi@nvidia.com>
 <20250321221454.298202-5-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321221454.298202-5-arighi@nvidia.com>

Hello,

On Fri, Mar 21, 2025 at 11:10:50PM +0100, Andrea Righi wrote:
...
> +__bpf_kfunc s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
> +				       const struct cpumask *cpus_allowed, u64 flags)
> +{
> +	s32 cpu;
> +
> +	if (!ops_cpu_valid(prev_cpu, NULL))
> +		return -EINVAL;
> +
> +	if (!check_builtin_idle_enabled())
> +		return -EBUSY;
> +
> +	if (!scx_kf_allowed(SCX_KF_SELECT_CPU | SCX_KF_ENQUEUE))
> +		return -EPERM;
> +
> +#ifdef CONFIG_SMP
> +	cpu = scx_select_cpu_dfl(p, prev_cpu, wake_flags, cpus_allowed, flags);
> +#else
> +	cpu = -EBUSY;
> +#endif
> +
> +	return cpu;
> +}

Later in the series, I find scx_bpf_select_cpu_and() being called with
p->cpus_ptr really confusing. scx_bpf_select_cpu_and() is always constrained
by p->cpus_ptr (except for the currently buggy case where p->nr_cpus_allowed
is used while p->cpus_ptr is overridden), so what does it mean to call
scx_bpf_select_cpu_and() with p->cpus_ptr as @cpus_allowed? I'd much prefer
if the convention in such cases is calling with NULL @cpus_allowed.
@cpus_allowed is the extra mask to and to p->cpus_ptr when searching for an
idle CPU. If we're going to use p->cpus_ptr, we just don't have the extra
cpumask to and.

Thanks.

-- 
tejun
