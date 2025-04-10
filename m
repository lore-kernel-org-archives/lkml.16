Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDDC26FA74
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280994; cv=none; b=HFbwz+K+VwKNmQsVEKZf/cdujA/rfjcVost7wscddAH1auMCkqmyapTDEnwGihqjkDx1zbmtALMqSTlZqgW0mZWNK4eN+C9izYAGQnSXf7dubofx9fWd2U2QKBHxtYtRRlgFxl1PmnRX0j3z/xqltur6h6v5MboNGaOmh9+6aUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280994; c=relaxed/simple;
	bh=okqGVZo/xYeSnK0D25IiFLH8ll50KBraSLpKE2LuetA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmNO78YpYEezlQVScImKXFRg5Sl8cMdnn5epS+7COGKs/g5e5ZipC50qQ4owF8KvYtnLOx/XQTVvOf0I7SppgVOA+BFbs73c0KjqFD1Wm+oLSNoyAsPvy2JGbuCNkmNJi57Ovs0xghFhh5KlOId4qjmUiQNW8AWZj7ny1R6EK64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dmEuNjfD; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dmEuNjfD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=++B4JKf42qB/grglO2Oq5a++WDjtQVnTWDcwPHfzEYo=; b=dmEuNjfDsQYB6NqPyTilB9eEYP
	+FpWjPH+CZWLDHaURBg0UWDgqOBKrEnu2HjctF3XS8m1uR9l8+8MGA5Hzolhr5/ri/RnEcXcj8v7S
	bquLGiNCPvTYINu2Jxol5gWZ97vC8XfCuHaQcKowtPLIASZq0bSYKa7WNvELGl3X8Gn6gtOvYgZAW
	ckSxP4jSXgZhQ48YdSrOjtjcTLeE3GPwRHQOhpNnG9oTMxCmCxzBY8F0QvRdfwlLeDioER8cPdh+X
	3COaC60UEoCCbSiH4l6PYdLsdVqZWv1NWjcAF3TSDdxeVhvVK4GHRrtuiC9i1mjtxAq8zF2wyHSsA
	P8oAhMXQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pAH-00000002kvE-0kaX;
	Thu, 10 Apr 2025 10:29:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4025B3003FF; Thu, 10 Apr 2025 12:29:45 +0200 (CEST)
Date: Thu, 10 Apr 2025 12:29:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: Re: [RFC PATCH 5/5] sched/fair: Proactive idle balance using push
 mechanism
Message-ID: <20250410102945.GD30687@noisy.programming.kicks-ass.net>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
 <20250409111539.23791-6-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409111539.23791-6-kprateek.nayak@amd.com>

On Wed, Apr 09, 2025 at 11:15:39AM +0000, K Prateek Nayak wrote:
> Proactively try to push tasks to one of the CPUs set in the
> "nohz.idle_cpus_mask" from the push callback.
> 
> pick_next_pushable_fair_task() is taken from Vincent's series [1] as is
> but the locking rules in push_fair_task() has been relaxed to release
> the local rq lock after dequeuing the task and reacquiring it after
> pushing it to the idle target.
> 
> double_lock_balance() used in RT seems necessary to maintain strict
> priority ordering however that may not be necessary for fair tasks.

Agreed; don't use double_lock_balance() if you can at all avoid it. It
is quite terrible.


>  /*
>   * See if the non running fair tasks on this rq can be sent on other CPUs
>   * that fits better with their profile.
>   */
>  static bool push_fair_task(struct rq *rq)
>  {
> +	struct cpumask *cpus = this_cpu_cpumask_var_ptr(load_balance_mask);
> +	struct task_struct *p = pick_next_pushable_fair_task(rq);
> +	int cpu, this_cpu = cpu_of(rq);
> +
> +	if (!p)
> +		return false;
> +
> +	if (!cpumask_and(cpus, nohz.idle_cpus_mask, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE)))
> +		goto requeue;

So I think the main goal here should be to get rid of the whole single
nohz balancing thing.

This global state/mask has been shown to be a problem over and over again.

Ideally we keep a nohz idle mask per LLC (right next to the overload
mask you introduced earlier), along with a bit in the sched_domain tree
upwards of that to indicate a particular llc/ node / distance-group has
nohz idle.

Then if the topmost domain has the bit set it means there are nohz cpus
to be found, and we can (slowly) iterate the domain tree up from
overloaded LLC to push tasks around.

Anyway, yes, you gotta start somewhere :-)
