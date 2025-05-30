Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4670C2185BC
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595643; cv=none; b=SP9/Lk85bCYhBJTaDrBCetx6qSIAGboyouoLPGuEXM2jEdVuaBqlcyf3JjAlLEGPdMoZdTWElsffIrz4smVMisurMQ9guh6nSSMY33a3VfbXVxQm4Z4LviGbQ1WeyzYq5VKIZRH2J451JtDAAEGF+QDkeSlVRMA/Pazye2sy3FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595643; c=relaxed/simple;
	bh=LKTjIRMzHXn5Zw0J4fAUckDi/Sev3/I4ZHV38WVIG/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGgzH7m1SJvmo1v9dNzC7vdkj4WC9O571wvYOXNBlbyZ/7t3xT0Nbn0uJSt8LpMO/FXy2+vdiY7xQb4C9nR/W/XBWkJb5kWDpX/B0x/cNkRHPx2RSsY58zp23BYzk1Llv0a9fCR+T+wEQX19uWWUWzfvxCwwr2VJ2BrLMkT34zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XK76938Q; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XK76938Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0gdKVbBS+SWFxzq/DgDZxsQ+C2It/mTqNQOkQQfp0rU=; b=XK76938Qy1bxmx/KD2zaULIKYA
	JQFsKd1ixMvCZmmlkLRrg9AuLtaXiUf7ZvUXEUh/OWVK/w2mVLlB8zVGXVEZM7oQZOf38aGaLH2ct
	gXQF1yUPlUsACOCt9fm+yJHO89BUUBKIVmRDojHAAFbca0PqYXgbJ31UHAM+mBfYlAeWAAg6vFSKL
	iuNszF1JVaHQaPL6j6VmxTzV8lVA0cIZLD88XNWQKXbUkNHItV0tUT7aNbudJzA4f/AUX549GL3WD
	2BidplAvMNYPSe/RYgurNvz4l2t0Dd3VSIaHtWFXYn5IPUx6CxC22xmyTEQzRI401vL38Apyc9Vb8
	g1PCPpag==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvbN-0000000Fe0o-2NHi;
	Fri, 30 May 2025 09:00:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CA9C030066A; Fri, 30 May 2025 11:00:32 +0200 (CEST)
Date: Fri, 30 May 2025 11:00:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, clm@meta.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 0/5] sched: Try and address some recent-ish
 regressions
Message-ID: <20250530090032.GA21197@noisy.programming.kicks-ass.net>
References: <20250520094538.086709102@infradead.org>
 <20250528195944.GB19261@noisy.programming.kicks-ass.net>
 <aDg0jp4DiPTGnmq5@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDg0jp4DiPTGnmq5@arm.com>

On Thu, May 29, 2025 at 12:18:54PM +0200, Beata Michalska wrote:
> On Wed, May 28, 2025 at 09:59:44PM +0200, Peter Zijlstra wrote:
> > On Tue, May 20, 2025 at 11:45:38AM +0200, Peter Zijlstra wrote:
> > 
> > > Anyway, the patches are stable (finally!, I hope, knock on wood) but in a
> > > somewhat rough state. At the very least the last patch is missing ttwu_stat(),
> > > still need to figure out how to account it ;-)
> > > 
> > > Chris, I'm hoping your machine will agree with these numbers; it hasn't been
> > > straight sailing in that regard.
> > 
> > Anybody? -- If no comments I'll just stick them in sched/core or so.
> >
> Hi Peter,
> 
> I've tried out your series on top of 6.15 on an Ampere Altra Mt Jade
> dual-socket (160-core) system, which enables SCHED_CLUSTER (2-core MC domains).

Ah, that's a radically different system than what we set out with. Good
to get some feedback on that indeed.

> Sharing preliminary test results of 50 runs per setup as, so far, the data
> show quite a bit of run-to-run variability - not sure how useful those will be.

Yeah, I had some of that on the Skylake system, I had to disable turbo
for the numbers to become stable enough to say anything much.

> At this point without any deep dive, which is probably needed and hopefully
> will come later on.
> 
> 
> Results for average rps (60s) sorted based on P90
> 
> CFG |   min      |  max       |   stdev    |   90th
> ----+------------+------------+------------+-----------
>  1  | 704577.50  | 942665.67  | 46439.49   | 891272.09
>  2  | 647163.57  | 815392.65  | 35559.98   | 783884.00
>  3  | 658665.75  | 859520.32  | 50257.35   | 832174.80

>  4  | 656313.48  | 877223.85  | 47871.43   | 837693.28
>  5  | 630419.62  | 842170.47  | 47267.52   | 815911.81
> 
> Legend:
> #1 : kernel 6.9
> #2 : kernel 6.15
> #3 : kernel 6.15 patched def (TTWU_QUEUE_ON_CPU + NO_TTWU_QUEUE_DEFAULT)
> #4 : kernel 6.15 patched + TTWU_QUEUE_ON_CPU + TTWU_QUEUE_DEFAULT
> #5 : kernel 6.15 patched + NO_TTWU_QUEUE_ON_CPU + NO_TTWU_QUEUE_DEFAULT

Right, minor improvement. At least its not making it worse :-)

The new toy is TTWU_QUEUE_DELAYED, and yeah, I did notice that disabling
TTWU_QUEUE_ON_CPU was a bad idea.
