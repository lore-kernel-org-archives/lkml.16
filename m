Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67791215073
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743457829; cv=none; b=jOcvDFyalaIcc0jwvSin5zLAAAf9v3zXRT8Fg/7vTN6zagnviIi6maytVWn9whaZewNaIfTmZpOSrays/61qaFMbxa76Qh7/CsEUOZ99H9dv1NtCtedTjQQNMPjANFoO6VM+sgJAN5yKvxhllxrEPbc51wqe7pdJIEPLdRaqL+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743457829; c=relaxed/simple;
	bh=C+/m9kDQsK1ldiaIY4ffYR7lwxOVCjOtNOOI6HkQPx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAEExtnpxz8nZr+Gb2Otvd5paClFehuDNE41j2Vx9wDb1y/VdB8gZqvjd2Su2MRNWqCMROdhmNVGYqD0oAhG8Tl++rzMK1i6A2Y05mAgz9WWkeivV9fcwtmvREROcQlNSKVZZ9Q/t6mFwxGeuLw9uV2/YzU3Ei7D2Z5bnrWQ4ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMaSSRsp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMaSSRsp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B888EC4CEE3;
	Mon, 31 Mar 2025 21:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743457828;
	bh=C+/m9kDQsK1ldiaIY4ffYR7lwxOVCjOtNOOI6HkQPx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WMaSSRspdOlBmX0/cGWrP+XZ18HESkIzO8FNoYm+vUkYKEFIK9jyfLTPbrnvq/bUj
	 jfBwJk/3rpKigCH7ncFC12CTCAgiScx2e3sbxJjHQstOD361PsXtHbceom0uxIDorQ
	 0yaN1OJ2SHN7wLi5lUNyydB/Me/5kIPT4jSvGfqR6f+Xf/CNExFr8N0dQ/foTii4+2
	 /I2BTtBofIun6QVBqinlOjMBt5k/ipAvw473a6+nhMfKo4errI3RkTCHBinUeJWvEJ
	 mncFZKdGwHTYqOefng5qloYBXAvT3LCMeu3YSg1CyWF0m5uwNQvnym4RcW8R/yI4Z4
	 trpHWbUueYPJw==
Date: Mon, 31 Mar 2025 11:50:27 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] sched_ext: idle: Explicitly pass allowed cpumask to
 scx_select_cpu_dfl()
Message-ID: <Z-sOIwUNgrjbQJkx@slm.duckdns.org>
References: <20250321221454.298202-1-arighi@nvidia.com>
 <20250321221454.298202-3-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321221454.298202-3-arighi@nvidia.com>

Hello,

On Fri, Mar 21, 2025 at 11:10:48PM +0100, Andrea Righi wrote:
...
> +s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
> +		       const struct cpumask *cpus_allowed, u64 flags)
>  {
>  	const struct cpumask *llc_cpus = NULL, *numa_cpus = NULL;
>  	int node = scx_cpu_node_if_enabled(prev_cpu);
> @@ -457,9 +458,9 @@ s32 scx_select_cpu_dfl(struct task_struct *p, s32 prev_cpu, u64 wake_flags, u64
>  		struct cpumask *local_cpus = this_cpu_cpumask_var_ptr(local_numa_idle_cpumask);
>  		const struct cpumask *cpus = numa_span(prev_cpu);
>  
> -		if (task_affinity_all(p))
> +		if (cpus_allowed == p->cpus_ptr && task_affinity_all(p))
>  			numa_cpus = cpus;

Note that this test isn't quite correct. While the error isn't introduced by
this patchset, this becomes a lot more prominent with the series.
p->nr_cpus_allowed tracks the number of CPUs in p->cpus_mask. p->cpus_ptr
can point away from p->cpus_mask without updating p->nr_cpus_allowed, so the
condition that should be checked is p->cpus_ptr == &p->cpus_mask &&
p->nr_cpus_allowed == num_possible_cpus().

Thanks.

-- 
tejun
