Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86861DA21
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750918603; cv=none; b=GjmcgdZIeIa1z7vPHgiZnToAXiUxnBJ16+RgSKvktaZVI+78cH5/FZ8wHyOd8sfOZ01sAZAkimExoVS/klsoDpkD8q7NCw5wpSUs+PMua0HIQDa1AcweOp9VBokuOh0mprtp5XSdRpyLmxrhvuiUdmvhuPP9fUJsRME//8pHhTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750918603; c=relaxed/simple;
	bh=fuoGu97eAgoG12hIFzrfKG97BbKGChXg/c7x5aY12vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFv52NJ68DiWY7r6eXmOpPSzoUDj9Lu249sFuK+epdUyazd+UCLPzrLqnjVdsnEtu09CJx3wyGvRAnqbL2a6aua2e6kOTJUVV/tR8+P31DGhNKDtWvpzeTtmikFwpI2Dg2WoPE4wSTxwjplxtZYIV2XWIAdmkZ5vAe4S7i450k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3oZMM4Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3oZMM4Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AADC4CEEB;
	Thu, 26 Jun 2025 06:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750918602;
	bh=fuoGu97eAgoG12hIFzrfKG97BbKGChXg/c7x5aY12vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3oZMM4ZUryM+NWt20jGXzXKvGfjVDoz+yueLUhKXe+3lJLuSTZuDMoY052P9qBA8
	 Y+AcU81iRknabJE7sltgipL2gjLpuek7v9Vi7RQUFkZe774mM6e/dibCRDkFeG011j
	 PkGvpzdA/P6eyuTxR++8njHS3KjlpwQeQ/cmJjLhyC+c464uDroO2I8RPr2aWYpngs
	 Qs0MsLYlxogA6kPcnlhnyhKd8uZGBif+uyqRwEWaoHraw2LyRqcLCFeYQGGU7vHWyE
	 OeTzcNNaSEWdUgZVcyifa0OsjTRvvh9L9QjcXYWj1S4qjdsgcpKFsGlCCoJMEwUCac
	 BMKVNji4J9vEA==
Date: Thu, 26 Jun 2025 09:16:37 +0300
From: Leon Romanovsky <leon@kernel.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org, Steve Wahl <steve.wahl@hpe.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Subject: Re: [PATCH] sched/topology: Correct "sched_domains_curr_level" in
 topology_span_sane()
Message-ID: <20250626061637.GF17401@unreal>
References: <20250624041235.1589-1-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624041235.1589-1-kprateek.nayak@amd.com>

On Tue, Jun 24, 2025 at 04:12:35AM +0000, K Prateek Nayak wrote:
> The updated topology_span_sane() algorithm in commit ce29a7da84cd
> ("sched/topology: Refinement to topology_span_sane speedup") works on
> the "sched_domain_topology_level" hierarchy to detect overlap in
> !SDTL_OVERLAP domains using the tl->mask() as opposed to the
> sched_domain hierarchy (and the sched_domain_span()) in the previous
> approach.
> 
> For NODE domain, the cpumask retunred by tl->mask() depends on the
> "sched_domains_curr_level". Unless the "sched_domains_curr_level" is
> reset during topology_span_sane(), it reflects the "numa_level" of the
> last sched_domain created which is incorrect.
> 
> Reset the "sched_domains_curr_level" to the "tl->numa_level" during
> topology_span_sane(). Although setting "topology_span_sane" to 0 in
> topology_span_sane() should be enough since all domains with
> numa_level > 0 currently set SDTL_OVERLAP flag, setting it to
> "tl->numa_level" makes it more explicit and future proof against changes
> in the same area.

<...>

> Changes are based on tip:sched/urgent at commit 914873bc7df9 ("Merge tag
> 'x86-build-2025-05-25' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")
> ---
>  kernel/sched/topology.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Sorry for the delay, we had internal issues with our verification cloud :(.

Thanks
