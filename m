Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA600289373
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551286; cv=none; b=q8KJPlc4g47ykSbAqZLH3ex07nCFzgZZKSrr1REjL7rZUxy4fpYWjcfOJQoEPTvvGeESKaFoPpbGbrE8ya7KYxPJLHNQZ41KuvoJYl1XvbvTrOIKuNL+H7FTXMAfeqGJwsAI4ByHMDNiRYnhklYwWBZHn0STGgkCcSRInwT4GPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551286; c=relaxed/simple;
	bh=d8cUM3Jx2nX2LjJIuYpsGdE2v+npUHVPN3RueozddpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIQyBW/lDCA/PlMgaqznX2xATrRCdVXUUknu94q3fLMuT/cmc/R9gtZald642jrdRu0/vHekpAeDcpjQCtg4tTdX/8+40a9OLeviSgpToJS0F3ZrwYLqRA0n6O4tGJZHy9eEtDmACzLHvHGYzQ/Sitwze+qiLqVjrhxgAOSuQQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Nyt7C/Ub; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Nyt7C/Ub"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MFrrYD95bT5p/otTm1ic109Z0AiSkDemy7GDOyIUKjc=; b=Nyt7C/UbsFKezGwq8e2vH/4RHO
	yaYEVEIcZJgycvt65huTcRemcnlMxCj1BdBBvJVw2r6zo+cQuuYCJTMJk37KYyaXGI7KBODzbj8Gt
	vZkz6m2sRxPNmJBg92W6D6kPUQX9V+G9Bamww38V3ZRox6f92Ip5VhMkJlyNKb6PivnBXh8S5o4Kw
	i7jNtx0EpwTqlBnRm4ReR5j0uaANBATs7s4xYlOIp5GKvunk4Nt6oZ+jmXy4Wzcfuc0qQ9P23dguD
	wwyUg/xdzm4dz0XbHJmz5hyro/Thzoi/1feafDE85gLFWrcxAWSjX78UGYuEuDtxAYysalX4SqOxe
	84BKU0ag==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKUw-00000007hPe-1bBj;
	Thu, 03 Jul 2025 14:01:11 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E94943001B2; Thu, 03 Jul 2025 16:01:09 +0200 (CEST)
Date: Thu, 3 Jul 2025 16:01:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Michal Hocko <mhocko@suse.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tim Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org,
	Jirka Hladky <jhladky@redhat.com>,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Suneeth D <Suneeth.D@amd.com>, Libo Chen <libo.chen@oracle.com>
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
Message-ID: <20250703140109.GW1613376@noisy.programming.kicks-ass.net>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
 <aGZNTtJuCyHJE_25@tiehlicka>
 <20250703115006.GT1613200@noisy.programming.kicks-ass.net>
 <aGZxFRVxHouLaMPg@tiehlicka>
 <b4891cca-4da3-4411-bc9c-669118bf825a@intel.com>
 <e944b504-a852-4f07-a514-7dd99e63b888@oracle.com>
 <20250703123626.GW1613200@noisy.programming.kicks-ass.net>
 <b96a326c-7ca7-4cfe-96e2-28c1dad5c9dc@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b96a326c-7ca7-4cfe-96e2-28c1dad5c9dc@intel.com>

On Thu, Jul 03, 2025 at 09:38:08PM +0800, Chen, Yu C wrote:
> Hi Peter,
> 
> On 7/3/2025 8:36 PM, Peter Zijlstra wrote:
> > On Thu, Jul 03, 2025 at 05:20:47AM -0700, Libo Chen wrote:
> > 
> > > I agree. The other parts, schedstat and vmstat, are still quite helpful.
> > > Also tracepoints are more expensive than counters once enabled, I think
> > > that's too much for just counting numbers.
> > 
> > I'm not generally a fan of eBPF, but supposedly it is really good for
> > stuff like this.
> > 
> > Attaching to a tracepoint and distributing into cgroup buckets seems
> > like it should be a trivial script.
> 
> Yes, it is feasible to use eBPF. On the other hand, if some
> existing monitoring programs rely on /proc/{pid}/sched to observe
> the NUMA balancing metrics of processes, it might be helpful to
> include the NUMA migration/swap information in /proc/{pid}/sched.
> This approach can minimize the modifications needed for these
> monitoring programs, eliminating the need to add a new BPF script
> to obtain NUMA balancing statistics from different sources IMHO.

Maybe...

The thing is, most of the time the effort spend on collecting all these
numbers is wasted energy since nobody ever looks at them.

Sometimes we're stuck with ABI, like the proc files you mentioned. We
can't readily remove them, stuff would break. But does that mean we
should endlessly add to them just because convenient?

Ideally I would strip out all the statistics and accounting crap and
make sure we have tracepoints (not trace-events) covering all the needed
spots, and then maybe just maybe have a few kernel modules that hook
into those tracepoints to provide the legacy interfaces.

That way, only the people that care get to pay the overhead of actually
collecting the numbers.

One can dream I suppose... :-)
