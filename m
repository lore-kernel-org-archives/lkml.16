Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388461C7013
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738964313; cv=none; b=Z12A8v8Zn8evU94g+BcQqG2gOEXfwwNF1UyUv5oZw58lbHa/Is70rCfuQgzzyiPzVMG6nysppT15YR4AgKhSLAdc5D/uGe4HRkgLtUGWPoFRO38dkyQLUH8B2fTyhvfkHtFSRgDebkkJenx5faJVVuGIBbwqDXKULZ4Px68aJF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738964313; c=relaxed/simple;
	bh=JEHD5kEJmkzp15alOA9az/ohMkj4J2DHaoFgKPpR680=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sze6g0uvhEuRxbJOctLwFZPQVZJNQK77cZj4we2gqcDt9iIWxhwR2n47wJ4yUQT3YYD92hdXNN6/Jxq440xI+3YrTltWnXuDq96tRS+9bnmrvDIMTyp5QDPahsVnVK9YHR6K4n6b0JYgOIw/fLR50kZJWjDY8s9fv/YsFRvBMwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hc9B8V1O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hc9B8V1O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A487C4CED1;
	Fri,  7 Feb 2025 21:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738964312;
	bh=JEHD5kEJmkzp15alOA9az/ohMkj4J2DHaoFgKPpR680=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hc9B8V1OFTk6L1VwjCF9lcVqpPYrxbOcHdzKZi6L6EueXOnFA+OcW9Pg922dMZmYk
	 0kzx7K471V02l0aWpVwEYB6fNM/u6/tIYzBxBDhtoArR0j5SnzdpPOdtO6Yz56HYzM
	 YxZIZcqXdnWKQfOo/HxyWZcyR0cHeERZIlqPPRqN8S798LHuB8Iqs0VkfIu3Gh/HKs
	 cIOlBtpvcQTPVzr9heIST4o0U/9YK/WZjHRxeQ/lxelh79TNaT6NFkmKKWJp8V6Fto
	 4aeL5v7Pfjg0Wq+qBNxaQNDW6TwSrHQ7A7/RDsuXvkdz4jy4M/hx11XljmFwE2jg5Y
	 St9yk7ksyYHVw==
Date: Fri, 7 Feb 2025 11:38:31 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: Changwoo Min <changwoo@igalia.com>, void@manifault.com,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] sched_ext: Add a core event and update scx schedulers
Message-ID: <Z6Z9V7GgZxpFlp10@slm.duckdns.org>
References: <20250207031338.393045-1-changwoo@igalia.com>
 <Z6WnCHiwkvahtdgR@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6WnCHiwkvahtdgR@gpd3>

Hello,

On Fri, Feb 07, 2025 at 07:24:08AM +0100, Andrea Righi wrote:
> On Fri, Feb 07, 2025 at 12:13:36PM +0900, Changwoo Min wrote:
> > This patchset introduces a new event, SCX_EV_ENQ_SLICE_DFL, and updates
> > two scx schedulers -- scx_qmap and scx_central -- to print out the new
> > event.
> > 
> > SCX_EV_ENQ_SLICE_DFL counts how many times the tasks' time slice is set
> > to the default value (SCX_SLICE_DFL) by the sched_ext core in the enqueue
> > and pick_next paths.
> > 
> > Scheduling a task with SCX_SLICE_DFL unintentionally would be a source
> > of latency spikes because SCX_SLICE_DFL is relatively long (20 msec).
> > Thus, soaring the SCX_EV_ENQ_SLICE_DFL value would be a sign of BPF
> > scheduler bugs, causing latency spikes.
> 
> Not directly related to this patch set, but as a general thought: would it
> be useful to introduce ops->slice_ms (in sched_ext_ops) to override
> SCX_SLICE_DFL?
> 
> With that, schedulers that care about latency could set a smaller default
> time slice to prevent potential spikes caused by the implicit use of
> SCX_SLICE_DFL.
> 
> Opinions?

I'm not sure. BPF schedulers should be able to avoid getting the default
slice. Hopefully, with the added visibility, this should be easier now. I'm
not sure how much overriding the default value in ops helps in terms of
control. It's a very half-way measure. Instead, how about we add tracepoint
to scx_add_event() so that folks who want to get backtrace of specific
events can get them easily so that it's easier to debug where these counts
are coming from? Let's just make it easier to avoid these events.

Thanks.

-- 
tejun
