Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0202857C9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745334876; cv=none; b=OiAqBch/0C8mzqrP9zZYjxhLgeHT5i/tMX3sN6VI7vr/iVgA2GPfEd0wrJoTZTMIcpXGLd8OIIscYJTqbl817HYMhCyJxXmBsYf8odSg9QXPHfQH1IQpjbknewNclY6ZelcTsLWJaj0m+JjkkP7N+X+JiC9ncWbK4M+8LvKpG24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745334876; c=relaxed/simple;
	bh=C5c3cFZtm7yp+COBCFXiahdCKl7yLitMIeAah7EAm4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlDg0Ofnw4//qm/Y+4FoCdRuFur5zgo7SElAjpWNCLsU6K/DhKj0XDeyYV6i+mROBIEJm5DcI7CtZJYVnDHd1477ku63u1P5PQ8geS2QhcL85wuBYW93brCFBLQKZk5a6yu68ITCOoZZmlWfzvCCLV9eqn8fp6cOeC13f7stT2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FE4rPt6f; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FE4rPt6f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3bVIKhHwlJsLAEWAG4KwvjxmrXMbI0ve6Y7iR65LMns=; b=FE4rPt6fQC1uS3oiz/IcCvD9yQ
	vmlkK492ACLGHlnN6UDjd00KXS0jdOgd9NQo29CBIGR1RVODGrvlEqKU47efKHmGWaYRluQuSCS0z
	x8zvsP3rWMNdFCZxFuQqH1v8QQCf5nzKKMPZOw+EoFBax1pPBPKwa2euA6JeNxogrRgNwE4hDXH5S
	UKvbia240UXTcFtskLogTlfA+8IoXOQnIpHWT4NaL2upnjW4HgOhSx2Ihw/Sc/Vqv1SHGFxQuhEVp
	0r7ylAg8s9v1f9nvbRnLSoTo/Y3JQet+wfgtT73QefhOZCttHuNchUHLakjeBHO3IvYFqD5hCg1UG
	cawFwniA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FKI-00000004may-2oMg;
	Tue, 22 Apr 2025 15:14:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D70F53003C4; Tue, 22 Apr 2025 17:14:21 +0200 (CEST)
Date: Tue, 22 Apr 2025 17:14:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Omar Sandoval <osandov@osandov.com>
Cc: Rik van Riel <riel@surriel.com>, Chris Mason <clm@meta.com>,
	Pat Cody <pat@patcody.io>, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org, patcody@meta.com,
	kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] sched/fair: Add null pointer check to pick_next_entity()
Message-ID: <20250422151421.GB33555@noisy.programming.kicks-ass.net>
References: <7B2CFC16-1ADE-4565-B555-7525A50494C2@surriel.com>
 <20250402082221.GT5880@noisy.programming.kicks-ass.net>
 <b378f48593ca7449257a1bb55e78b186d88cd9f1.camel@surriel.com>
 <20250415080235.GK5600@noisy.programming.kicks-ass.net>
 <20250416124442.GC6580@noisy.programming.kicks-ass.net>
 <abffc286b637060f631925f9b373fad114d667d6.camel@surriel.com>
 <20250418154438.GH17910@noisy.programming.kicks-ass.net>
 <aALk9DVfjTTHGdvA@telecaster>
 <aAbdlTISuaJnc5AG@telecaster>
 <20250422141351.GG14170@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422141351.GG14170@noisy.programming.kicks-ass.net>

On Tue, Apr 22, 2025 at 04:13:52PM +0200, Peter Zijlstra wrote:
> On Mon, Apr 21, 2025 at 05:06:45PM -0700, Omar Sandoval wrote:
> 
> > Hey, Peter,
> > 
> > We haven't been able to test your latest patch, but I dug through some
> > core dumps from crashes with your initial zero_vruntime patch. It looks
> > like on just about all of them, the entity vruntimes are way too spread
> > out, so we would get overflows regardless of what we picked as
> > zero_vruntime.
> > 
> > As a representative example, we have a cfs_rq with 3 entities with the
> > follow vruntimes and (scaled down) weights:
> > 
> > vruntime           weight
> > 39052385155836636  2      (curr)
> > 43658311782076206  2
> > 42824722322062111  4886
> > 
> > The difference between the minimum and maximum is 4605926626239570,
> 
> Right, that is quite beyond usable. The key question at this point
> is how did we get here...
> 
> > which is 53 bits. The total load is 4890. Even if you picked
> > zero_vruntime to be equidistant from the minimum and maximum, the
> > (vruntime - zero_vruntime) * load calculation in entity_eligible() is
> > doomed to overflow.
> > 
> > That range in vruntime seems too absurd to be due to only to running too
> > long without preemption. We're only seeing these crashes on internal
> > node cgroups (i.e., cgroups whose children are cgroups, not tasks). This
> > all leads me to suspect reweight_entity().
> > 
> > Specifically, this line in reweight_entity():
> > 
> > 	se->vlag = div_s64(se->vlag * se->load.weight, weight);
> > 
> > seems like it could create a very large vlag, which could cause
> > place_entity() to adjust vruntime by a large value.
> 
> Right, I fixed that not too long ago. At the time I convinced myself
> clipping there wasn't needed (in fact, it would lead to some other
> artifacts iirc). Let me go review that decision :-)

In particular, the two most recent commits in this area are:

  https://lore.kernel.org/r/20250109105959.GA2981@noisy.programming.kicks-ass.net
  https://lkml.kernel.org/r/20250110115720.GA17405@noisy.programming.kicks-ass.net

(from the same thread).

Note that it does call update_entity_lag() which does clip. So after
that it's just scaling for the new weight.

Notably, virtual time = time / weight, and the clip limit is adjusted
for weight.

So if it is inside limits pre-scaling, it should still be in limits
after scaling.

l = max / w;

w->w' --> l' = l*w/w' = (max / w) * (w/w') = max / w'

I've stuck some trace_printk()s on again, and the numbers I get here
seem sane.
