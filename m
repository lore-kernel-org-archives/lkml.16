Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D61828F1
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 00:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748652174; cv=none; b=t6UZZDYEhNywxe06opn9F5QrbpzeMPGsqT+Ql6Nol36zcggytjVo07TSq1gIUEQjN5aqDN5bbetFxx4+1LZsw0qwLZATjR/OTjdvHu2l/1n8VdGWzE3Z3Iwf0aL0C6NeMP0m7HheQ25xYvM4C6mMlazFRj94329Hc7M7Efh5jBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748652174; c=relaxed/simple;
	bh=iUNUy94mWTB8H5m7hjFZyOAGSllh42g02dI7gBE0gvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VqR+YWT7VW+deRomHlFasBn9rGkCkxbECOA7AVXmu3w2fK1Hajk7DTyHDx+UVKMiXdURYE4+NMSe+Xo2Q+gm3Q29k4BkwgLVUg/RihwdmCx/F2YgiRUOtSqzOc9K8dYFn5Ve6By6X7c4Uwq4/fOae2d+SQjeKDVu6KB/k4yFdEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PT3xCz4e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PT3xCz4e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD384C4CEE9;
	Sat, 31 May 2025 00:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748652174;
	bh=iUNUy94mWTB8H5m7hjFZyOAGSllh42g02dI7gBE0gvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PT3xCz4eRt4lBcuE44A9+flbNsS0tRmnhrg1h9JFh8w9Jpb5S39IYFLeO98oxIqhc
	 QulzOXy2DWKCZ+R9P4BuHNxZfUq8im0R1qbMG65CQtwtp08OLDwaqciFLiPxpChb6w
	 XZRiqWYr/kYXMd02dH52Zfk9uUHxUl9H8NYdEXewBixT20uJt6jQ0eHDdnI6BzRdAX
	 gGwu6SCYhrky+ojFAbHd0jCf0q6/5hFcbqUV29x6WZyG/p/q9x+T9xi0OKsdRdBunx
	 ElSeqBrYhyKnDy8/dDrN0DJBTaTM/Yym4xJBsBg9XNt86W/GFwOaM5haRJsTdvbLRb
	 KbDZUqb3P9KFw==
Date: Fri, 30 May 2025 14:42:52 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: idle: Properly handle invalid prev_cpu during
 idle selection
Message-ID: <aDpQjDsPGkwf3qRs@slm.duckdns.org>
References: <20250530154629.52651-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530154629.52651-1-arighi@nvidia.com>

On Fri, May 30, 2025 at 05:46:29PM +0200, Andrea Righi wrote:
> The default idle selection policy doesn't properly handle the case where
> @prev_cpu is not part of the task's allowed CPUs.
> 
> In this situation, it may return an idle CPU that is not usable by the
> task, breaking the assumption that the returned CPU must always be
> within the allowed cpumask, causing inefficiencies or even stalls in
> certain cases.
> 
> This issue can arise in the following cases:
> 
>  - The task's affinity may have changed by the time the function is
>    invoked, especially now that the idle selection logic can be used
>    from multiple contexts (i.e., BPF test_run call).
> 
>  - The BPF scheduler may provide a @prev_cpu that is not part of the
>    allowed mask, either unintentionally or as a placement hint. In fact
>    @prev_cpu may not necessarily refer to the CPU the task last ran on,
>    but it can also be considered as a target CPU that the scheduler
>    wishes to use for the task.
> 
> Therefore, enforce the right behavior by always checking whether
> @prev_cpu is in the allowed mask, when using scx_bpf_select_cpu_and(),
> and it's also usable by the task (@p->cpus_ptr). If it is not, try to
> find a valid CPU nearby @prev_cpu, following the usual locality-aware
> fallback path (SMT, LLC, node, allowed CPUs).
> 
> This ensures the returned CPU is always allowed, improving robustness to
> affinity changes and invalid scheduler hints, while preserving locality
> as much as possible.
> 
> Fixes: a730e3f7a48bc ("sched_ext: idle: Consolidate default idle CPU selection kfuncs")
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Applied to sched_ext/for-6.16-fixes.

Thanks.

-- 
tejun
