Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1969283CB5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331255; cv=none; b=iIFhXVHPLLjVBIv1R3dwMzwtGwuqrTONvPNRBCAE+NOIBua+Ts7G+5Pzf3JRSTUuTpTJj2k2N8y/zMXPvDMu8XIsEZNi/z35arbpkUnY6U4FQ/PVq8d5hpDFm/HEFoVC5+t1pMCy9vLLY/bBb35cGeu/FaqAgIszBkuhquZgaZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331255; c=relaxed/simple;
	bh=n4yPr3BiVigqoCCsVJnK4krccvLQfOs+JLBv0NrRuVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcbmhpgX4ZgYA7Of4YIDBpyTwoUX8t2Okr9KflHnJjG4y+kdd6c2j1hEQV3XyXgBGuGIC/IrBGhX8sb7Dg0kqsxv4aUPoghsWkM01vKt+s4HfPxeROJQaL92LvyaFac6H3q0DgnD7x81v0DkYhfgsddlLkMxFz93eZIwB1TvpcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tj+WmZLB; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tj+WmZLB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JX6t0GzGhVX8HTetesTgqC4Ot9EidK1ZWS7YwhkWGfY=; b=tj+WmZLBZu9yR+ptQ8gfUXk8LM
	GuUAHNz00Qu4kkROxsSEXtZKhkWua4C/z0+Zo0im7QcmEv3YOqjCRFqBu+iH1/BwM3BN7XOHl7RjX
	Y3Fbfz4BSv/xIjcQrRi+SK9Yt6Ymy/x5aa+vw1iaW9aD0U4YAnxNmfzR+yTYC6Sv4pFIAi7NC/9bb
	R7t2FrSd4IbUJ7dn1J397B8iSD7j54mx96GpvxNrhg4qcuLbqRPtyeE7VObVymv8i3+T9W6wZc0qE
	HW3tc0ZakeMqc/FTwo9VnOvIvMXiASzZ+428hpghaGPHRvd0m5PYW6yLqVKjKygUQBx11dV2waAXV
	zCOvL7nQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ENk-00000004hlf-3rPm;
	Tue, 22 Apr 2025 14:13:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0E6593003B0; Tue, 22 Apr 2025 16:13:52 +0200 (CEST)
Date: Tue, 22 Apr 2025 16:13:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Omar Sandoval <osandov@osandov.com>
Cc: Rik van Riel <riel@surriel.com>, Chris Mason <clm@meta.com>,
	Pat Cody <pat@patcody.io>, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org, patcody@meta.com,
	kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] sched/fair: Add null pointer check to pick_next_entity()
Message-ID: <20250422141351.GG14170@noisy.programming.kicks-ass.net>
References: <20250324115613.GD14944@noisy.programming.kicks-ass.net>
 <7B2CFC16-1ADE-4565-B555-7525A50494C2@surriel.com>
 <20250402082221.GT5880@noisy.programming.kicks-ass.net>
 <b378f48593ca7449257a1bb55e78b186d88cd9f1.camel@surriel.com>
 <20250415080235.GK5600@noisy.programming.kicks-ass.net>
 <20250416124442.GC6580@noisy.programming.kicks-ass.net>
 <abffc286b637060f631925f9b373fad114d667d6.camel@surriel.com>
 <20250418154438.GH17910@noisy.programming.kicks-ass.net>
 <aALk9DVfjTTHGdvA@telecaster>
 <aAbdlTISuaJnc5AG@telecaster>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAbdlTISuaJnc5AG@telecaster>

On Mon, Apr 21, 2025 at 05:06:45PM -0700, Omar Sandoval wrote:

> Hey, Peter,
> 
> We haven't been able to test your latest patch, but I dug through some
> core dumps from crashes with your initial zero_vruntime patch. It looks
> like on just about all of them, the entity vruntimes are way too spread
> out, so we would get overflows regardless of what we picked as
> zero_vruntime.
> 
> As a representative example, we have a cfs_rq with 3 entities with the
> follow vruntimes and (scaled down) weights:
> 
> vruntime           weight
> 39052385155836636  2      (curr)
> 43658311782076206  2
> 42824722322062111  4886
> 
> The difference between the minimum and maximum is 4605926626239570,

Right, that is quite beyond usable. The key question at this point
is how did we get here...

> which is 53 bits. The total load is 4890. Even if you picked
> zero_vruntime to be equidistant from the minimum and maximum, the
> (vruntime - zero_vruntime) * load calculation in entity_eligible() is
> doomed to overflow.
> 
> That range in vruntime seems too absurd to be due to only to running too
> long without preemption. We're only seeing these crashes on internal
> node cgroups (i.e., cgroups whose children are cgroups, not tasks). This
> all leads me to suspect reweight_entity().
> 
> Specifically, this line in reweight_entity():
> 
> 	se->vlag = div_s64(se->vlag * se->load.weight, weight);
> 
> seems like it could create a very large vlag, which could cause
> place_entity() to adjust vruntime by a large value.

Right, I fixed that not too long ago. At the time I convinced myself
clipping there wasn't needed (in fact, it would lead to some other
artifacts iirc). Let me go review that decision :-)

> (place_entity() has
> a similarly suspect adjustment on se->vlag, only update_entity_lag()
> clamps it).

place_entity() is a bit tricky -- but should be well behaved. The
problem is that by adding an entity, you affect the average, because the
average shifts, the lag after placement is different than the lag you
started with.

The scaling there is to ensure the lag after placement reflects the
initial lag. Much like how update_entity_lag() is the lag before
removal, place_entity() ensures the lag is measured after insertion.

> I'll try to reproduce something like this, but do you have any thoughts
> on this theory in the meantime?

It seems reasonable, but as said, let me go look too :-)
