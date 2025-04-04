Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702551EEA5F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772494; cv=none; b=rA31QGh2VC8FjCokKsf4c1fen7OuCxB5dIRmtP0tpv58H1Aejt1WX640HLUBuY2v0xysheN+0UbHaM9tR+JBZKxOdcHthoj3a9dWiNHYX9m1Q4WG0CMO6GHGiZu+DjIuEKnJEl8gGVIpaW++QXMxG9hiiCzomax8cPN9ge0XjrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772494; c=relaxed/simple;
	bh=HeMqPvb1y2aCZxnFmTUvOeSLlGPoM2Uq7DhtRctHdPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCElwYX+fQWR38amGafZZeA47DKOAF52adoXh9ioo4qZDS4Q5NPsQW7LAgXadu+KofQbAtQCPcHzG8fyCOcvXo66TxJfRQFsT+NPkKQRkv6nN5Cbck5ZH8Q3VjnZDdNrNzKaAHLE4wCQ9zUWQ/5lUv4FeNHZa4ZHZXYr1Gn2mb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyaqClao; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyaqClao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB3BC4CEE9;
	Fri,  4 Apr 2025 13:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743772493;
	bh=HeMqPvb1y2aCZxnFmTUvOeSLlGPoM2Uq7DhtRctHdPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hyaqClaoAvgGLSBSFqkKUIeAXoZNtabo4QFIr7icoqOcDhSx0srMht0EMknxzI7Tj
	 YGivCGyRgpZDdjxPldT806SUIxKS4O4ZN/QCWpYCNiK9KjCyIi/RIbug/Vqj4Sh2/7
	 /OdvwUyX3aJOdlUq3SuOTUbEWRo6bOAiGQgqVhHc71nH12YL3BEZb9H+e5Z78QanoT
	 WWj8Tbimd/EZZIMV/zXD4gbcAbjZTuXSlrNkHOgDekDT7w7vR9VG7Jf4UI3NUOoYdN
	 mg1gNq9cIC6SLrPdOwuAtZthPJtZ3XcDkaGzvN4lG+C8Eh4jQdivxse6ZGz8TWm9Eb
	 l7u1trDkt6vBQ==
Date: Fri, 4 Apr 2025 15:14:50 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Oleg Nesterov <oleg@redhat.com>, linux-mm@kvack.org
Subject: Re: [PATCH 6/6 v2] mm: Drain LRUs upon resume to userspace on
 nohz_full CPUs
Message-ID: <Z-_bSlit_cqAhz7f@localhost.localdomain>
References: <20250209223005.11519-1-frederic@kernel.org>
 <20250209223005.11519-7-frederic@kernel.org>
 <Z6s3u6Uu8I7r2Jox@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6s3u6Uu8I7r2Jox@tiehlicka>

Le Tue, Feb 11, 2025 at 12:42:51PM +0100, Michal Hocko a écrit :
> On Sun 09-02-25 23:30:04, Frederic Weisbecker wrote:
> > LRUs can be drained through several ways. One of them may add disturbances
> > to isolated workloads while queuing a work at any time to any target,
> > whether running in nohz_full mode or not.
> > 
> > Prevent from that on isolated tasks with defering LRUs drains upon
> > resuming to userspace using the isolated task work framework.
> 
> I have to say this is rather cryptic description of the udnerlying
> problem. What do you think about the following:
> 
> LRU batching can be source of disturbances for isolated workloads
> running in the userspace because it requires kernel worker to handle
> that and that would preempt the said task. The primary source for such
> disruption would be __lru_add_drain_all which could be triggered from
> non-isolated CPUs.
> 
> Why would an isolated CPU have anything on the pcp cache? Many syscalls
> allocate pages that might end there. A typical and unavoidable one would
> be fork/exec leaving pages on the cache behind just waiting for somebody
> to drain.
> 
> This patch addresses the problem by noting a patch has been added to the
> cache and schedule draining to the return path to the userspace so the
> work is done while the syscall is still executing and there are no
> suprises while the task runs in the userspace where it doesn't want to
> be preempted.

Much better indeed :-)

> > @@ -376,6 +377,8 @@ static void __lru_cache_activate_folio(struct folio *folio)
> >  	}
> >  
> >  	local_unlock(&cpu_fbatches.lock);
> > +
> > +	isolated_task_work_queue();
> >  }
> 
> This placement doens't make much sense to me. I would put
> isolated_task_work_queue when we queue something up. That would be
> folio_batch_add if folio_batch_space(fbatch) > 0.

Ok I moved it there but why doesn't it make sense also when
folio_batch_space(fbatch) == 0, doesn't it mean that folio_batch_add()
still added the entry but there is just no further room left?

> 
> >  
> >  #ifdef CONFIG_LRU_GEN
> > @@ -738,7 +741,7 @@ void lru_add_drain(void)
> >   * the same cpu. It shouldn't be a problem in !SMP case since
> >   * the core is only one and the locks will disable preemption.
> >   */
> > -static void lru_add_and_bh_lrus_drain(void)
> > +void lru_add_and_bh_lrus_drain(void)
> >  {
> >  	local_lock(&cpu_fbatches.lock);
> >  	lru_add_drain_cpu(smp_processor_id());
> > @@ -769,6 +772,9 @@ static bool cpu_needs_drain(unsigned int cpu)
> >  {
> >  	struct cpu_fbatches *fbatches = &per_cpu(cpu_fbatches, cpu);
> >  
> > +	if (!housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
> > +		return false;
> > +
> 
> Would it make more sense to use cpu_is_isolated() and use it explicitly
> in __lru_add_drain_all so that it is clearly visible - with a comment
> that isolated workloads are dealing with cache on their return to
> userspace.

No because cpu_is_isolated() is also true when the CPU is on NULL domain
(isolated cpusset partition, or isolcpus=domain). And not all workloads
want the possible overhead of scattered batching after every syscalls.

Thanks.

> 
> >  	/* Check these in order of likelihood that they're not zero */
> >  	return folio_batch_count(&fbatches->lru_add) ||
> >  		folio_batch_count(&fbatches->lru_move_tail) ||
> > -- 
> > 2.46.0
> 
> -- 
> Michal Hocko
> SUSE Labs
