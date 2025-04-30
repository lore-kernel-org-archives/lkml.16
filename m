Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1427E25DD10
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746039548; cv=none; b=QOyOU5Kc3xL3rxbUSY8UcsbXVm1a6pXJpjkY4rDHTDhbq8Q5K8ayzBmF7bJjmED7CVfsVGxbWLEBA7Qd5Uo6PB5gFfg1zSzeepGKnP6Ciz8MEWIV20F0pbvdSgQJ35OD8rXXFMfZtGbwb2EOk8BQRQjWSWe6OcjnqJSfj+XfGSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746039548; c=relaxed/simple;
	bh=HjEwXwNjXiLSnQPq6waxjve20Z/M0qJ4BoG7Pdskx6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h28dcm+lAaIl2Q2IDf3xmzGcU2igP9XgNrE81W/iEqUtNTeBNv658iyM6GHm7KqsDRkc1bM0Y3QnyDXx3VQbwS8JVVJlYiPtAAmppd4npg5/z4PyjCgQbydUSDYhh3PL2uxHe9OU5UnaHdQLV/grtQlayvk/DyK1/FKtKJbY5cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXVlV+9W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXVlV+9W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7146BC4CEE7;
	Wed, 30 Apr 2025 18:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746039547;
	bh=HjEwXwNjXiLSnQPq6waxjve20Z/M0qJ4BoG7Pdskx6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXVlV+9WhvCknaG6jsMIZVZP+GgbIjmlJ9/XRpC2J+gX5sRPQWDWFMD8vC4IgHc60
	 n7QgDMeQiLw+Y6r7GRCKWsxkI50lWfZN7W3qCyMVbtyPg8dzJ9lBN305XxO7B7tt7n
	 KIGMbMpbA7BPbTZL+Iqzkdz8c9uNbynclA0YxWzhL+yhRw5MBFsuNr8bNWNeMSpKv/
	 3Bn28npSjBuD012gP+GhxUSo6rawWUffcFuxGVfZqylsWaMDpKpevW7F84wywvE9NC
	 wQi2TOIcBYwHLTV7nug7Ko9UY1fkDQdRHXgFY9QMnWNGnjgUBqU/rF3v8cLdXTHusg
	 zWn5B3Sadzl6A==
Date: Wed, 30 Apr 2025 08:59:06 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-6.16] sched_ext: Add RCU protection to
 scx_root in DSQ iterator
Message-ID: <aBJy-hdrkauDW6X_@slm.duckdns.org>
References: <20250430090930.355732-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430090930.355732-1-arighi@nvidia.com>

On Wed, Apr 30, 2025 at 11:09:30AM +0200, Andrea Righi wrote:
> @@ -6907,28 +6907,39 @@ __bpf_kfunc int bpf_iter_scx_dsq_new(struct bpf_iter_scx_dsq *it, u64 dsq_id,
>  {
>  	struct bpf_iter_scx_dsq_kern *kit = (void *)it;
>  	struct scx_sched *sch;
> +	int ret = 0;
>  
>  	BUILD_BUG_ON(sizeof(struct bpf_iter_scx_dsq_kern) >
>  		     sizeof(struct bpf_iter_scx_dsq));
>  	BUILD_BUG_ON(__alignof__(struct bpf_iter_scx_dsq_kern) !=
>  		     __alignof__(struct bpf_iter_scx_dsq));
>  
> +	rcu_read_lock();
>  	sch = rcu_dereference(scx_root);

Can you instead try changing rcu_derefernece(scx_root) to
rcu_derefernece_check(scx_root, rcu_read_lock_bh_held())? The warning is
because this can be called both from rcu-locked and bh contexts and while
grabbing rcu_read_lock() once works, telling rcu that the dereference can be
in both contexts is more accurate here.

Thanks.

-- 
tejun
