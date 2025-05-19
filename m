Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75CD1DEFD9
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677742; cv=none; b=PzU+l6ccfyeGjaT4CiJhrI2UG2tWzYipTGGf6oCjqQlpoYQmv/+lFyuxuh+QpvODrEQ2LEFZHfnlOOhvjqSNjGr2VCUYKbDR4kuFnnyeygutBYDb/M1PFCvTsmtBQ8RKbtWbNuWuUmhHPAXFIX3phYqZWshiQicPKz6g5HURTkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677742; c=relaxed/simple;
	bh=duDd3VqYrRyWly4Es6VaSO4tzycZCGZJgrzN0o8TamE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYXz5jeE9xBvW9vhqWmzwC1W2yTFvlPO9T5M0hDjvF6Bf5ykLZMmio5rx1aNcUjhSYHuQslfZU4yTw/EI2sIoXzHD9jbj5albq2IZS4L0WDlYUipu0Uw0fylk8h3TzWZJRrIUV0InDvayX+o0m30iDv171hqVoBVI4i1vs4zo8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EytP8GGA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EytP8GGA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06626C4CEE4;
	Mon, 19 May 2025 18:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747677742;
	bh=duDd3VqYrRyWly4Es6VaSO4tzycZCGZJgrzN0o8TamE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EytP8GGA0gCc5hbZ/cdokRk/tcHO8R/ZwkFejEt/vWulj0LTprFdBHmE/PoOGH1uF
	 dJkvPvCgxFjw/wL4TmL4+pSbwMMkWvWd5TGJ5459H4hlIg2lPK5Bn/lXXuDeYprTZV
	 /0+Akn5SXDOoJy+HVAmJMY/d/m0VfrLwUav+VT0ArBLnbweFbYQHBgiRRZfa0dWQPw
	 6wcUNgyFjEuQELnjI/mJLeqVPZ3N7mN6Vmgi0JrGMup5J5g7jttOlr9NdNkhs3z6X7
	 7PvcQlrvj+7tstMO8gPY/WIywoe0DjopvF/q0mzhA7qP2luXqC117gufB240SHlP2e
	 fPS+Nn+8r04ig==
Date: Mon, 19 May 2025 08:02:20 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHSET v2 sched_ext/for-6.16] sched_ext: Extend usability of
 scx_bpf_select_cpu_and()
Message-ID: <aCtyLLvETdgjxa5e@slm.duckdns.org>
References: <20250515191716.327518-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515191716.327518-1-arighi@nvidia.com>

On Thu, May 15, 2025 at 09:11:41PM +0200, Andrea Righi wrote:
> Many scx schedulers implement their own idle CPU selection policy, which
> may be invoked from different contexts, not just from ops.select_cpu().
> 
> For example, some schedulers may need to trigger a proactive CPU wakeup
> from ops.enqueue() after enqueuing a task, while others may expose this
> functionality to user space, relying on a BPF test_run call to pick an idle
> CPU.
> 
> To maintain a consistent selection policy, these schedulers often implement
> their own idle CPU selection logic, since the built-in one is only usable
> from ops.select_cpu(), leading to unnecessary code duplication and
> fragmentation.
> 
> To address this, allow scx_bpf_select_cpu_and() to be called not only from
> ops.select_cpu() and ops.enqueue(), but also from unlocked contexts (e.g.,
> when triggered from user space via a BPF test_run call).
> 
> This allows scx schedulers to consistently leverage the built-in idle CPU
> selection logic, helping reduce code duplication and fragmentation.
> 
> This patchset is also available in the following git branch:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/arighi/linux.git scx-select-cpu-and
> 
> Changes in v2:
>  - Enable scx_bpf_select_cpu_and() to be called from ops.enqueue()
>    ops.select_cpu() and unlocked context
>  - Add locking validation to ensure safe access to p->cpus_ptr and
>    p->nr_cpus_allowed
>  - Extend selftest to cover scx_bpf_select_cpu_and() when invoked from user
>    space
>  - Link to v1: https://lore.kernel.org/all/20250512151743.42988-1-arighi@nvidia.com/
> 
> Andrea Righi (4):
>       sched_ext: Make scx_kf_allowed_if_unlocked() available outside ext.c
>       sched_ext: idle: Validate locking correctness in scx_bpf_select_cpu_and()
>       sched_ext: idle: Allow scx_bpf_select_cpu_and() from unlocked context
>       selftests/sched_ext: Add test for scx_bpf_select_cpu_and() via test_run

Applied to sched_ext/for-6.16.

Thanks.

-- 
tejun
