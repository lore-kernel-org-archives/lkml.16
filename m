Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A1219D88F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232193; cv=none; b=EKSqWQ6s8Xt8PIECENaAFX5sARqC3PA9+bkJKxMuWm25Ey3ou2zY/rO4cTDXdbFw0GQfGh/YZ83QjNeLV94IO4oyddORyVwreQBSleEScTpjp5TKVI6tX4OhXqxP22cBT4URqZa7JHVBhEAamCgAEVe5GaP4hJqODO6iro1buRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232193; c=relaxed/simple;
	bh=8wCOIaFqXx03fTRlZJYAU8XYsKY8HDddClu3wfIQRmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5x/BN57+G5FrLnmg+O7WC6D4Rsr2yBmBYZskK0bD+Bk+KAzc+12D0kHpOx1iatjiRam/Hq02y8UMmucTH/wqeMxbOcWpY6aCbblb25yMBYP/1sk2dBY3hX2Qx3gT6oML+NwikPxZNVwzQIzMZqTcX+++qqNmyEDs3FP5WRyJpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrQTm+Y4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrQTm+Y4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151B5C4CEE9;
	Wed, 14 May 2025 14:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747232193;
	bh=8wCOIaFqXx03fTRlZJYAU8XYsKY8HDddClu3wfIQRmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lrQTm+Y4YpXh3XFYRAH/1+ugXuYmYFGl4/6ayVnXjTfjejmrWwxHRTQ9Cl73ppXZq
	 klZITa5DOr7n0uMvbcZYnrRF/AC0VhmXQsjeuq77wGPzztn9EjB9wWVEyqx0nRo5wE
	 w5X1cMxShWNF3idiqc/Od0flwQ7zxTJ7d9+0ZQN7yXU0aN7CrO48NrwqHAlCB4X9nX
	 Mj417CbMKIuLYUQQgd4ekNO3IRw2c4mQRRp8EvmsDiOHXBtUxWCFVJDvZt6nVQIm9A
	 xaOXnpM9nbT9eO5kOAAopdcE9GkwRATvoz69HU8yV1j2i6jWqOmoXIO62M94NDmqIt
	 CjJQCpeO5Q4vQ==
Date: Wed, 14 May 2025 10:16:30 -0400
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4 sched_ext/for-6.16] sched_ext: Clean up scx_root
 usages
Message-ID: <aCSlvpiraPTKUqOf@mtj.duckdns.org>
References: <aCQgcilBgDVu_Rrp@mtj.duckdns.org>
 <aCRjUQJ_97-B0Rpo@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCRjUQJ_97-B0Rpo@gpd3>

Hello, Andrea.

On Wed, May 14, 2025 at 11:33:05AM +0200, Andrea Righi wrote:
...
> >  static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags)
> >  {
> > +	struct scx_sched *sch = scx_root;
> 
> Do we need to use rcu_dereference(scx_root) here, as well as in all the
> occurrences above where scx_root is dereferenced?

So, if a task knows that it's attached to a scheduler instance, it knows
that the scheduler pointer can be dereferenced safely. In case of the root
scheduler, as long as any task is on SCX, naked derferences of scx_root are
safe. Also, if there are multiple scheduler instances, we wouldn't want to
use the root scheduler but rather the scheudler that's serving this task.

So, currently, the code base is in a transitional state and I'm using naked
scx_root dereferences basically as markers for necessary future
substitutions. All naked references should be safe but they aren't great in
that they'd trigger e.g. sparse warnings and generally don't look right.
I'll add a comment on top of scx_root to clarify what's going on.

Thanks.

-- 
tejun
