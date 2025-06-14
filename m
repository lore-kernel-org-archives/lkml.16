Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD75778F20
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749895504; cv=none; b=mymcEJCZoTzhoXu/FeyfgceyNV+LrHPxeYRZmVTVtsaQr0MBT0Q8VlS/FdfBZsEgzSW6pZxPAjV/v3JZjKp5BZNez11oYjYHhfNLnv9pcVIggvEwVMAUBTuTv7yzrh5bT6vfzPR/PtMGMRqnidvYGfRYxtvPoYRzd0LvymZo5vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749895504; c=relaxed/simple;
	bh=SVFdsJ0kOGaml6QhLystp8l66Xf3jLh+UlIZffW7bkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zutz57cNV/iBrmxsOhey22aqnaXj5kcZpBkM7pnHG9Tnta4j3I6VQFkx5gz19AUkOVFEJwxUjr0+JyPZ49vOgfrehQZaJnKcdlwzdNZz2pq2wGEJQS3Abvho4e6kD8zrwVVDK+Hm3mJzGrX7k8puDkOaWiazZ1Yt8mOefOQmGl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=L16KkeTH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="L16KkeTH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SVFdsJ0kOGaml6QhLystp8l66Xf3jLh+UlIZffW7bkA=; b=L16KkeTHORFe7AKa7d0ZowTXAk
	hgJUHoI67Qdqarfgdy5PTpj5BmAJy9CwTGGWVbuc8gEsvpnXLYUBKP7mbP/LzAD6f30Gme4e0/+Si
	s+j3oON/+YOys4Rl4/C3X9UppJhhRcAzn3JDYJ97QHkfh2kh39VMUygru6qH6LtyZfnFnS0k7fA+B
	z//cUBxmAI3g+VDxeJjtAmiNjBuRyLKppgwkdJuwWsssbt2p4YwO4WqMiJAiuPLGtThjQqnHN0B9M
	SWFSputk/bfjGjllFMNv8Ni/LBvCAH64223TAj4BVBLN4dPoXelRkTbqcEietEYPrrDy7Vxlvy+KF
	KU3cwXkg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQNkr-0000000Dv1h-2aXh;
	Sat, 14 Jun 2025 10:04:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F05D43061AA; Sat, 14 Jun 2025 12:04:51 +0200 (CEST)
Date: Sat, 14 Jun 2025 12:04:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chris Mason <clm@meta.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 0/5] sched: Try and address some recent-ish
 regressions
Message-ID: <20250614100451.GI2278213@noisy.programming.kicks-ass.net>
References: <20250520094538.086709102@infradead.org>
 <20250528195944.GB19261@noisy.programming.kicks-ass.net>
 <8a65afe3-30ba-45ed-9862-361376873ee0@meta.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a65afe3-30ba-45ed-9862-361376873ee0@meta.com>

On Wed, May 28, 2025 at 09:41:33PM -0400, Chris Mason wrote:

> I'll get all of these run on the big turin machine, should have some
> numbers tomorrow.

Right... so Turin. I had a quick look through our IRC logs but I
couldn't find exactly which model you had, and unfortunately AMD uses
the Turin name for both Zen 5c and Zen 5 Epyc :-(

Anyway, the big and obvious difference between the whole Intel and AMD
machines is the L3. So far we've been looking at SKL/SPR single L3
performance, but Turin (whichever that might be) will be having many L3.
With Zen5 having 8 cores per L3 and Zen5c having 16.

Additionally, your schbench -M auto thing is doing exactly the wrong
thing for them. What you want is for those message threads to be spread
out across the L3s, not all stuck to the first (which is what -M auto
would end up doing). And then the associated worker threads would
ideally stick to their respective L3s and not scatter all over the
machine.

Anyway, most of the data we shared was about single socket SKL, might be
we missed some obvious things for the multi-L3 case.

I'll go poke at some of the things I've so far neglected because of the
single L3 focus.
