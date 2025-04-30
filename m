Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DF2226527
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053276; cv=none; b=QbsK9aXk9TVhFAsi/FL1PXat/gBYuh6u0RV8QOUfRsTVFD4bf5OE9hVWMRC0Z9XCdgtYGqM3cXV96PKW1rYtKKH+NPM/9Cq3pGmpLrZ1w60UvQ6YEjtZEBpN3qV4kpxII4JgZ/fS8XROQKMtjimdFU88NWgDcjKkwPCYKiDaFlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053276; c=relaxed/simple;
	bh=UeqFYRLiAK+QFT7QP45LxgWL/68LM/ljR3LPMl10aEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtRAuGR8VUSDGxEUtNHFXCglCXycpZb2OOp88YZsKuO8HwmMEPrcz1Kz3cC1uzOkh0zXG2jBeUVJsxlh0S+k8gOe52FoNvPKz+/0mqwH+7W40a8BwLLdx7MdUSFDOq3ZVACiyuakVJJE4SrI6hgAZVWVM7mT+AIcfjzjQJU6ES0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkDI5Cuw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkDI5Cuw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6038C4CEE7;
	Wed, 30 Apr 2025 22:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746053275;
	bh=UeqFYRLiAK+QFT7QP45LxgWL/68LM/ljR3LPMl10aEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SkDI5CuwikaFTj7YBFdN84YOSJrL3Vu6bE16+Tp6w4wG35WrZe5utk7rzuxzM8jJo
	 Jxbz/xigIu5yQKq000qYRrFC7Zoiqyrb9o6BQBj7lFwhEcTZHkRsKjaVCfv7q21LUU
	 0zD5zArK69jkluFEolxGc4RUzu88pRjPIIHABHHC50D0T3UMFq/kxe92uvDd/U7oDX
	 nYtyJvsLnP/2OsoMBOPp+P4N8SWLAtqpJJ2zA/0Q4S1lgVhQtisEy9vPFHPWiBN3bg
	 0Au++H4S8XAJgKUoR2k4KTlkdf0c5GY/sEDQKgBtjrIQlSbRe+NVasDbXbrWb6jrtV
	 /niaVEf2sYQtg==
Date: Wed, 30 Apr 2025 12:47:54 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-6.16] sched_ext: Avoid NULL scx_root deref
 in __scx_exit()
Message-ID: <aBKomkWrLtPvnnB9@slm.duckdns.org>
References: <20250430084021.348347-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430084021.348347-1-arighi@nvidia.com>

On Wed, Apr 30, 2025 at 10:40:21AM +0200, Andrea Righi wrote:
> A sched_ext scheduler may trigger __scx_exit() from a BPF timer
> callback, where scx_root may not be safely dereferenced.
> 
> This can lead to a NULL pointer dereference as shown below (triggered by
> scx_tickless):
> 
>  BUG: kernel NULL pointer dereference, address: 0000000000000330
> ...
>  CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.14.0-virtme #1 PREEMPT(full)
>  RIP: 0010:__scx_exit+0x2b/0x190
> ...
>  Call Trace:
>   <IRQ>
>   scx_bpf_get_idle_smtmask+0x59/0x80
>   bpf_prog_8320d4217989178c_dispatch_all_cpus+0x35/0x1b6
> ...
>   bpf_prog_97f847d871513f95_sched_timerfn+0x4c/0x264
>   bpf_timer_cb+0x7a/0x140
>   __hrtimer_run_queues+0x1f9/0x3a0
>   hrtimer_run_softirq+0x8c/0xd0
>   handle_softirqs+0xd3/0x3d0
>   __irq_exit_rcu+0x9a/0xc0
>   irq_exit_rcu+0xe/0x20
> 
> Fix this by checking for a valid scx_root and adding proper RCU
> protection.
> 
> Fixes: 48e1267773866 ("sched_ext: Introduce scx_sched")
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Applied to sched_ext/for-6.16.

Thanks.

-- 
tejun
