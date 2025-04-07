Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2067F20CCFA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744046185; cv=none; b=RpKZeBU9IFzaf038QtKaEHgL0fita303NHw3TKRSTaOtB26UUixXx5GcmrjjE2lOLuWvmTh0TlQYD8IGcV8050OsgisZ1ZAPzX2zhjt9OUUjbeJxf1tm42YoWudbpJ2/36Z//k2JHj7PfCTf3xpOe2JVlY/5blaq8YkXHV+9lEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744046185; c=relaxed/simple;
	bh=dguimTy+KK+8dw+QfMvjHvlbiVdKcYjoaktOIzfApCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UM8Tm9cZYMcA7OEBjnr4G68ysntyQJPLuTtCIVqOrRS7Jc3ophuEZgF3JRN1SEC94zqK6jtCe8W8xUzbWA+dy4BMQjjr/SnXULI+Zy9tAyRp8ZExpizMhnLho37pktbY9R0C/KAERCxo+rpr6ZEpf8MurMdceYx12D4oeVKBVKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPCXaXsE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPCXaXsE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683D6C4CEDD;
	Mon,  7 Apr 2025 17:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744046184;
	bh=dguimTy+KK+8dw+QfMvjHvlbiVdKcYjoaktOIzfApCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPCXaXsEuMhDBPOwiWr/IrNeWkN6q8jtPAulzTEfjbbid4BjFIlMzfcoFNhvTq46e
	 TRHCga9cNdV3XwbSOCbBEln6WGbunUymHQXvYOrGLuX7HNQeU+PzP3T3PRh6AHLye+
	 xx9+aH/cq56Wqdxqhow2KIjCeOLo7z8WWsEgH3ZdMti6m0NoW33wzJyuJt7en3yMLr
	 HZkMJ9UQC7CU1QnhPrOg840SketnyhbPMHWQgCxixC4gxEaWlzriosFtj8QYUbuoJh
	 jSzNsUF8AJMR/EsBS+fDsvEeYd9iPytE+HvPGQasRJ5ZQleYJKQn8LazUokyB76Kmk
	 7HGSsFo2jn0XQ==
Date: Mon, 7 Apr 2025 07:16:23 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHSET v7] sched_ext: Enhance built-in idle selection with
 allowed CPUs
Message-ID: <Z_QIZ2-Z0VHLYYSY@slm.duckdns.org>
References: <20250405134041.13778-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405134041.13778-1-arighi@nvidia.com>

On Sat, Apr 05, 2025 at 03:39:20PM +0200, Andrea Righi wrote:
> Many scx schedulers implement their own hard or soft-affinity rules to
> support topology characteristics, such as heterogeneous architectures
> (e.g., big.LITTLE, P-cores/E-cores), or to categorize tasks based on
> specific properties (e.g., running certain tasks only in a subset of CPUs).
> 
> Currently, there is no mechanism that allows to use the built-in idle CPU
> selection policy to an arbitrary subset of CPUs. As a result, schedulers
> often implement their own idle CPU selection policies, which are typically
> similar to one another, leading to a lot of code duplication.
> 
> To address this, extend the built-in idle CPU selection policy introducing
> the concept of allowed CPUs.
> 
> With this concept, BPF schedulers can apply the built-in idle CPU selection
> policy to a subset of allowed CPUs, allowing them to implement their own
> hard/soft-affinity rules while still using the topology optimizations of
> the built-in policy, preventing code duplication across different
> schedulers.
> 
> To implement this introduce a new helper kfunc scx_bpf_select_cpu_and()
> that accepts a cpumask of allowed CPUs:
> 
> s32 scx_bpf_select_cpu_and(struct task_struct *p, s32 prev_cpu,
> 			   u64 wake_flags,

Applied to sched_ext/for-6.16.

Thanks!

-- 
tejun
