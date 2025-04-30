Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89692253E9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746052808; cv=none; b=gdGaonEKogERy7cRFLByOw2UmzcF9CbtEaGMwB3R2wm6tbisVOW5NyzahSGfnbNM3w4lAxdk3IYig8qOUrR9cEx1HH4UrILus7TZiO19+tGRPiagZoJLjA1vdjcYA107VGW6I3F7tUk8I4RXYSkk90uuCsIlm2AdoHfjNxlG8Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746052808; c=relaxed/simple;
	bh=oz5tc62Yg4dqgU3oEHny5K3XZxXKBBK8jtLxHTE6YTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFrp9qONX3xT3e0oQplzmVhe9k6MQ2FmKY9aibWoIq3jSgVd7tmiiyG2QJ5/aruT0YcGZtguY7M94rbaYs9boi4Zf093HWm/vCuTFkKzbNHvnYgpOFAYUWS/OZdPgUm0qWnZubtIY9OP/CyR1g0gD06EN70xZQ9DZEZpcOyEhe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIF412QJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIF412QJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547D3C4CEE7;
	Wed, 30 Apr 2025 22:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746052807;
	bh=oz5tc62Yg4dqgU3oEHny5K3XZxXKBBK8jtLxHTE6YTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AIF412QJFCLTaVYmHIWJ2j5ZGinEMADeXAK5ILDb742/wN0dNI3Z0ybLqD/GjBnkP
	 ugY5wn/Xt3XydVrc3utdUmBc9Vb4Stc34zBh/zkMOnRiSdpl37LJABDl772luIDqhV
	 Bqd5LoZ7Lqf2ms+Codyrc2EoubuXkrh8T32NrIxMiiypWqZhPqfrSJaWoIM6ueuffp
	 xbMjLYKJRkqRjw4frdXgvBQAwt1dlleZVA4h4/+Z9pZ5CCADTv6bqLS6MWpnfvKUw5
	 Tew2IVz62aQ/Ij8z3MPREWHbe0lQoQOIm4iAlpWcqTetyrxyAqqDSqiPlW8fTtuRot
	 UUhgnmmXyXAAw==
Date: Wed, 30 Apr 2025 12:40:06 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 sched_ext/for-6.16] sched_ext: Add RCU protection to
 scx_root in DSQ iterator
Message-ID: <aBKmxlDdt6tmySKV@slm.duckdns.org>
References: <20250430202156.418769-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430202156.418769-1-arighi@nvidia.com>

On Wed, Apr 30, 2025 at 10:21:56PM +0200, Andrea Righi wrote:
> Using a DSQ iterators from a timer callback can trigger the following
> lockdep splat when accessing scx_root:
> 
>  =============================
>  WARNING: suspicious RCU usage
>  6.14.0-virtme #1 Not tainted
>  -----------------------------
>  kernel/sched/ext.c:6907 suspicious rcu_dereference_check() usage!
> 
>  other info that might help us debug this:
> 
>  rcu_scheduler_active = 2, debug_locks = 1
>  no locks held by swapper/0/0.
> 
>  stack backtrace:
>  CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.14.0-virtme #1 PREEMPT(full)
>  Sched_ext: tickless (enabled+all)
>  Call Trace:
>  <IRQ>
>  dump_stack_lvl+0x6f/0xb0
>  lockdep_rcu_suspicious.cold+0x4e/0xa3
>  bpf_iter_scx_dsq_new+0xb1/0xd0
>  bpf_prog_63f4fd1bccc101e7_dispatch_cpu+0x3e/0x156
>  bpf_prog_8320d4217989178c_dispatch_all_cpus+0x153/0x1b6
>  bpf_prog_97f847d871513f95_sched_timerfn+0x4c/0x264
>  ? hrtimer_run_softirq+0x4f/0xd0
>  bpf_timer_cb+0x7a/0x140
>  __hrtimer_run_queues+0x1f9/0x3a0
>  hrtimer_run_softirq+0x8c/0xd0
>  handle_softirqs+0xd3/0x3d0
>  __irq_exit_rcu+0x9a/0xc0
>  irq_exit_rcu+0xe/0x20
>  sysvec_apic_timer_interrupt+0x73/0x80
> 
> Add a proper dereference check to explicitly validate RCU-safe access to
> scx_root from rcu_read_lock() contexts and also from contexts that hold
> rcu_read_lock_bh(), such as timer callbacks.
> 
> Fixes: cdf5a6faa8cf0 ("sched_ext: Move dsq_hash into scx_sched")
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Applied to sched_ext/for-6.16.

Thanks.

-- 
tejun
