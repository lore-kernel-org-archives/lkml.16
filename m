Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E51F16B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552293; cv=none; b=T0xRxCo7n+bY5yLcciTUO/sVb5AKLcxFr/Nu31F4bpjt14NcfHn1Udgt7aFTcEFeGpYCGv89Zy68ltwgNBMhN/8F/u3ULXN0yZCZGcKq5UaqN4aTUWTlGCUD4sRXsPs9XHmL9x6fsLhPhX9a/ztj+i//yMUahYmHqYOoWndpho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552293; c=relaxed/simple;
	bh=wpw6THsxoQ6lyx+aA9t26PtYvpISh9DjUBLUOIGn5Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulKGyT8vg0nQ1zvMpcl0h1Mt1WwnzdmBhnLSfA8Hj1Jxo4zFXknp8q8MqORZcMXSwvexXhmsKVOom1q3BXI6oDnmgC/vfkRzXboIY5CfAg7s8m1YU4rBBP7oAAzyzor0l0B3vpQjksMCqvrm/BmeRG+Ev8e80o+UPyfj9SrNbWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nERA4Hgm; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nERA4Hgm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AKLWlW8+xE1RwDXEj2cQ4ZLcSshnVsEivj9Wr5lzUDg=; b=nERA4Hgm0/x5xuid2x6DsddIX2
	2RXt4laaPRLiEAA7967yMYuaqIDpsY3PhLLGf98Slds/43V86DnK8lWpmBeLp0jXZaGUwe3xatyvb
	PvnD3M2ZROsVxfgOesT3IYeEdDuJL8q1w1gDMpI//eRfxS1UU8ayEUjgdn3dMuoMd3/drnZuPZpmF
	RU+3xNGo6ThJqjcmr14V7dyNbP3Sug5MzaimikXSG4iKOmu3Kf3SDe5ly/CAYlk5pgC92YlPPNpjO
	GCTpDkCCnK7Mu2+emmxBK8ZwbHGq1ajjcDHRyWFaArNycxMLSnrEP+XWdCf8hZNu7UKxyIol3Iet0
	fkr3dDew==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKlF-00000007hVI-0tkK;
	Thu, 03 Jul 2025 14:18:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 16D7530017D; Thu, 03 Jul 2025 16:18:00 +0200 (CEST)
Date: Thu, 3 Jul 2025 16:18:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Libo Chen <libo.chen@oracle.com>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Michal Hocko <mhocko@suse.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tim Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org,
	Jirka Hladky <jhladky@redhat.com>,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Suneeth D <Suneeth.D@amd.com>
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
Message-ID: <20250703141800.GX1613200@noisy.programming.kicks-ass.net>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
 <aGZNTtJuCyHJE_25@tiehlicka>
 <20250703115006.GT1613200@noisy.programming.kicks-ass.net>
 <aGZxFRVxHouLaMPg@tiehlicka>
 <b4891cca-4da3-4411-bc9c-669118bf825a@intel.com>
 <e944b504-a852-4f07-a514-7dd99e63b888@oracle.com>
 <20250703123626.GW1613200@noisy.programming.kicks-ass.net>
 <0182cc94-c557-4ce5-b245-fb1fd54bc59b@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0182cc94-c557-4ce5-b245-fb1fd54bc59b@oracle.com>

On Thu, Jul 03, 2025 at 06:57:04AM -0700, Libo Chen wrote:
> 
> 
> On 7/3/25 05:36, Peter Zijlstra wrote:
> > On Thu, Jul 03, 2025 at 05:20:47AM -0700, Libo Chen wrote:
> > 
> >> I agree. The other parts, schedstat and vmstat, are still quite helpful.
> >> Also tracepoints are more expensive than counters once enabled, I think
> >> that's too much for just counting numbers.
> > 
> > I'm not generally a fan of eBPF, but supposedly it is really good for
> > stuff like this. 
> > 
> 
> Yeah but not nearly as good as, for example, __schedstat_inc(var) which
> probably only takes a few CPU cycles if var is in the right place. eBPF
> is gonna take a whole bunch of sequences to even get to updating an eBPF
> map which itself is much more expensive than __schedstat_inc(var).
> 
> For one, __migrate_swap_task() happens when dst node is fully busy (most
> likely src node is full as well), so the overhead of ebpf could be quite
> noticeable.

But that overhead is only paid if you actually care about the numbers;
most people don't.

We already stick static branches in many of the accounting paths --
because we know they hurt.

But look at this:

        __schedstat_inc(p->stats.numa_task_swapped);
        count_vm_numa_event(NUMA_TASK_SWAP);
        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);

that is _3_ different counters, 3 cachelines touched. For what?

Would not a single:

	trace_numa_task_swap_tp(p);

be much saner? It translates into a single no-op; no lines touched. Only
when someone wants the numbers do we attach to the tracepoint and start
collecting things.

Is the collecting more expensive; maybe. But the rest of us will be
better of, no?
