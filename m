Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF0F2F1FD0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750943840; cv=none; b=BlMlYAL9F54WKUg5Wqck95AKaODxvhiPoOBl9o5A1LK422/PWDmxB9NJPSqL/oQXPCYeOlk2xYr+7Z0R8n8jsGpT2zf0iVnNFPo44vC1Z+WaYQzTK1txW2VJAYDhNmFlulbkycscyvGekVp6Nvenkk30NF0b4tk/rzHNr4pHReE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750943840; c=relaxed/simple;
	bh=DxFH7mE6oVx/rOp8/DYfbqrIm7Gg4eBMdrveQcs3f9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAPowR7f1aqmUs64cJWS5AuVvcI2mn14Z98ql6YTymS3hCfOgy9cOXHXNaq/iJXShvfoZ0NTmrK6NvYk80olCawattxaSEf0b0x9J22dN42Os5zXaqacoNcjkj11USAi4RkRGAnseQk5HCXM2QszFWphWlTWYKwwrsPE+hsX29g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rvxbgMaB; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rvxbgMaB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QOVim0uAJgFhCWS+fN9f0DwP4nltYAI58xXEOtMh1UU=; b=rvxbgMaB46WHwgiX84Vsn6RyYn
	fsYo8oBlWhB2tWiPDHicCNEer2EY9vg5WKqO+iihiMtp2wtAhw6kSQ8GmriCWg8lyUDqS3BdJt57N
	KdtyMS+6KmdQe7y6lhyP24DBorXgRNRoV7lXJ3jzEAx+HYLXxQPdVhcCTAQDSA6BXbxOm7MlZ6HZ2
	qWx494pN9nO3LiA2PA3QBNq25QnmSnQv4sYThfVacPyWKX0qnvzjr6FrQ7Epoy+RKthOyoxiSMGdt
	2KDOR6luhZIq9C3taDzYDA+k3e8Ct2PbkqQTh/3vfdqSsEQ5Mj8OP3CIdY5jzX0hOWZlGeL1iA1rl
	EYCyj+OA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmTc-0000000BhZA-0ReZ;
	Thu, 26 Jun 2025 13:17:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 99DD830BDDA; Thu, 26 Jun 2025 15:17:15 +0200 (CEST)
Date: Thu, 26 Jun 2025 15:17:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Mason <clm@meta.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
Message-ID: <20250626131715.GI1613200@noisy.programming.kicks-ass.net>
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
 <20250606070638.2Wk45AMk@linutronix.de>
 <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
 <71ea52f2-f6bf-4a55-84ba-d1442d13bc82@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71ea52f2-f6bf-4a55-84ba-d1442d13bc82@meta.com>

On Thu, Jun 26, 2025 at 07:01:23AM -0400, Chris Mason wrote:
> On 6/24/25 3:01 PM, Peter Zijlstra wrote:
> > On Fri, Jun 06, 2025 at 09:06:38AM +0200, Sebastian Andrzej Siewior wrote:
> >> On 2025-06-05 20:55:27 [-0400], Chris Mason wrote:
> >>>>> We've got large systems that are basically dedicated to single
> >>>>> workloads, and those will probably miss the larger global hash table,
> >>>>> regressing like schbench did.  Then we have large systems spread over
> >>>>> multiple big workloads that will love the private tables.
> >>>>>
> >>>>> In either case, I think growing the hash table as a multiple of thread
> >>>>> count instead of cpu count will probably better reflect the crazy things
> >>>>> multi-threaded applications do?  At any rate, I don't think we want
> >>>>> applications to need prctl to get back to the performance they had on
> >>>>> older kernels.
> >>>>
> >>>> This is only an issue if all you CPUs spend their time in the kernel
> >>>> using the hash buckets at the same time.
> >>>> This was the case in every benchmark I've seen so far. Your thing might
> >>>> be closer to an actual workload.
> >>>>
> >>>
> >>> I didn't spend a ton of time looking at the perf profiles of the slower
> >>> kernel, was the bottleneck in the hash chain length or in contention for
> >>> the buckets?
> >>
> >> Every futex operation does a rcuref_get() (which is an atomic inc) on
> >> the private hash. This is before anything else happens. If you have two
> >> threads, on two CPUs, which simultaneously do a futex() operation then
> >> both do this rcuref_get(). That atomic inc ensures that the cacheline
> >> bounces from one CPU to the other. On the exit of the syscall there is a
> >> matching rcuref_put().
> > 
> > How about something like this (very lightly tested)...
> > 
> > the TL;DR is that it turns all those refcounts into per-cpu ops when
> > there is no hash replacement pending (eg. the normal case), and only
> > folds the lot into an atomic when we really care about it.
> > 
> > There's some sharp corners still.. but it boots and survives the
> > (slightly modified) selftest.
> 
> I can get some benchmarks going of this, thanks.  For 6.16, is the goal
> to put something like this in, or default to the global hash table until
> we've nailed it down?
> 
> I'd vote for defaulting to global for one more release.

Probably best to do that; means we don't have to rush crazy code :-)
