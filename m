Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AFC225D7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743035059; cv=none; b=dZjz/0e0NguAOIpbWh5pfhYmnMhXJoD7LwW6N2OmuBCIsL8YkfwOf6JOtyPbuME18T/6YiYzslRpmqWgOlL8B5IEPYw0SM8fxU5oeMJADI9t3uExQ3ifpmU80PLM/GfEIJTUEYSaHLIojojguGaPu5vePrZZNF3YEA+JgZ7CXWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743035059; c=relaxed/simple;
	bh=J9fMdC2uynwYlLqawBBc+uAO08RzUjlPK01Ri01Gl8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df1IvYfIylxt006lCIwvX9IocQ0qyIIRluBN0KC34K97IUQekQ7ZfqEOW13IAuHYD9U6LG3+qCqDrryNfF9pkI0TPvUlaVkmGY233MB2jYFL8kx4UbDNOvccYj8x2mdAvFgxRTdb2HXmGowtdjLRo+XuJ3MD1G/bYl/JqZyTXdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8W01IYP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8W01IYP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92310C4CEEA;
	Thu, 27 Mar 2025 00:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743035057;
	bh=J9fMdC2uynwYlLqawBBc+uAO08RzUjlPK01Ri01Gl8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8W01IYPSnrZRofoF52oKa0hjvMtaS5NFvcesNtVoM9kwzxH9LenaO3yLcHuhO42B
	 6bGe/3X5EBf97YdCU9FGSHT6EDEygRv8WKkO0WOfJ2sp44FiTlZB0QNzhgI7jBVrBi
	 +2K1jjmcdnpNRMHsCjpV2Q1ZoHr9AeKensOs1ML0G/2aIwH9gwCjigCmJa7EXQdZiN
	 2hd2GY5xg1VNRjA89IKKbm6oaNZVEasiAqyscbmmhAH+9n2BGy2Tz9ll93Y977xJ45
	 kY0YjfXwIBNQhW7Lf36wD/SI5l0Ktbl1FAWCYeY/qafM+Eq4OxOBbKkhpj+1IBeUqB
	 K1nmeYu7zTzrQ==
Date: Wed, 26 Mar 2025 14:24:16 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()
Message-ID: <Z-SasIwx5hINm1sf@slm.duckdns.org>
References: <20250325140021.73570-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325140021.73570-1-arighi@nvidia.com>

Hello, Andrea.

On Tue, Mar 25, 2025 at 03:00:21PM +0100, Andrea Righi wrote:
> @@ -7114,12 +7114,22 @@ __bpf_kfunc void scx_bpf_cpuperf_set(s32 cpu, u32 perf)
>  
>  	if (ops_cpu_valid(cpu, NULL)) {
>  		struct rq *rq = cpu_rq(cpu);
> +		struct rq_flags rf;
> +		bool rq_unlocked;
> +
> +		preempt_disable();
> +		rq_unlocked = (rq != this_rq()) || scx_kf_allowed_if_unlocked();
> +		if (rq_unlocked) {
> +			rq_lock_irqsave(rq, &rf);

I don't think this is correct:

- This is double-locking regardless of the locking order and thus can lead
  to ABBA deadlocks.

- There's no guarantee that the locked rq is this_rq(). e.g. In wakeup path,
  the locked rq is on the CPU that the wakeup is targeting, not this_rq().

Hmm... this is a bit tricky. SCX_CALL_OP*() always knows whether the rq is
locked or not. We might as well pass it the currently locked rq and remember
that in a percpu variable, so that scx_bpf_*() can always tell whether and
which cpu is rq-locked currently. If unlocked, we can grab the rq lock. If
the traget cpu is not the locked one, we can either fail the operation (and
trigger ops error) or bounce it to an irq work.

Thanks.

-- 
tejun
