Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF01E1E1D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891469; cv=none; b=qXG+rxlhHFJPrrFnA/y9s9MH+vMk30R4npteVWrjTiH1l8S2XYQYF0LiNIg+h8O1Zpql+q07fH4QlmHzLuOwIK5Rb9kei+VD/qWl6IWSvRY+dZ6jZ9TZYk9t0XpTUsnS+IhVXSuMUfGTzLxip0NxaVUQ7MBzqaNA0nfNV42NJ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891469; c=relaxed/simple;
	bh=ksUyW653NyIT3lvyAI4RmnyliHyVSS70xVKOoNyhJjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCR6Xvpb/yiBBO7INz1krYPMl6krFyhejDZJsvsDxRPcIr80/aUTg5iW2uAh0SFw2PRBwrel4I0r1rHvKE33Z41+Ib6EccpLmsXJLMoX+fT26M05LYkMzuBoQpVTemUZvupwuPUlcJ6mPvAHdAxVQBDdwrR/DV8PVh9yjl5wS4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZviCbdEN; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZviCbdEN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+whgyZ8F2+lZPSX5+w+V/eDEdox87Gze8zZrqLkwGPU=; b=ZviCbdENme03fTvAVQk21bV0fX
	rWdf4FYIr5BDCugkJfSdj41Y7AHmTBC8ZCCMpKFbyxLxKqcM7g/mVn/wgAC4OvEjzLQR3u5OC3b4V
	bdAL+s9ho0JXor+HXerVgS1GzBCff2QHDw/A9qpSxsr1qCoYDKRaaWg65m2JOkpon3ngn5NUn2442
	0Y4EUPbypDBCiKP1Ik5dS5iAWmvBS/KlZLpymTdCMsSyYfXSNnvGM1IdUlH0ZGEJ1Avz9nF3PLtHJ
	WnCXRe/frN642WHeCjGFjLMSG/DvUGGZexFw/f01TWAMjXhibq1ndO07WbffcpHqyPeVUfpZu8ccb
	IuuLonWA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Nx5-0000000BM53-2U3f;
	Thu, 17 Apr 2025 12:03:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DDC2D300619; Thu, 17 Apr 2025 14:01:30 +0200 (CEST)
Date: Thu, 17 Apr 2025 14:01:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Chen, Yu C" <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>, Doug Nelson <doug.nelson@intel.com>,
	Mohini Narkhede <mohini.narkhede@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
Message-ID: <20250417120130.GE17910@noisy.programming.kicks-ass.net>
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
 <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
 <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com>
 <517b6aac-7fbb-4c28-a0c4-086797f5c2eb@linux.ibm.com>
 <CAKfTPtBF353mFXrqdm9_QbfhDJKsvOpjvER+p+X61XEeAd=URA@mail.gmail.com>
 <7a5a5f1f-0bbc-4a63-b2aa-67bc6c724b2d@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a5a5f1f-0bbc-4a63-b2aa-67bc6c724b2d@amd.com>

On Thu, Apr 17, 2025 at 05:01:37PM +0530, K Prateek Nayak wrote:
> On 4/16/2025 3:17 PM, Vincent Guittot wrote:
> > > 
> > > Sorry, forgot to add.
> > > 
> > > Do we really need newidle running all the way till NUMA? or if it runs till PKG is it enough?
> > > the regular (idle) can take care for NUMA by serializing it?
> > > 
> > > -               if (sd->flags & SD_BALANCE_NEWIDLE) {
> > > +               if (sd->flags & SD_BALANCE_NEWIDLE && !(sd->flags & SD_SERIALIZE)) {
> > 
> > Why not just clearing SD_BALANCE_NEWIDLE in your sched domain when you
> > set SD_SERIALIZE
> 
> I've some questions around "sched_balance_running":
> 
> o Since this is a single flag across the entire system, it also implies
>   CPUs cannon concurrently do load balancing across different NUMA
>   domains which seems reasonable since a load balance at lower NUMA
>   domain can potentially change the "nr_numa_running" and
>   "nr_preferred_running" stats for the higher domain but if this is the
>   case, a newidle balance at lower NUMA domain can interfere with a
>   concurrent busy / newidle load balancing at higher NUMA domain.
>   Is this expected? Should newidle balance be serialized too?

Serializing new-idle might create too much idle time.

>   (P.S. I copied over the serialize logic from sched_balance_domains()
>    into sched_balance_newidle() and did not see any difference in my
>    testing but perhaps there are benchmarks out there that care for
>    this)
> 
> o If the intention of SD_SERIALIZE was to actually "serializes
>   load-balancing passes over large domains (above the NODE topology
>   level)" as the comment above "sched_balance_running" states, and
>   this question is specific to x86 - when enabling SNC on Intel or
>   NPS on AMD servers, the first NUMA domain is in fact as big as the
>   NODE (now PKG domain) if not smaller. Is it okay to clear
>   SD_SERIALIZE for these domains since they are small enough now?

You'll have to dive into the history here, but IIRC it was from SGI back
in the day, where NUMA factors were quite large and load-balancing
across numa was a pain.

Small really isn't the criteria, but inter-node latency might be, we
also have this node_reclaim_distance thing.

Not quite sure what makes sense, someone should tinker I suppose, see
what works with today's hardare.
