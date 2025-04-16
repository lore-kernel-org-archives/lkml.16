Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45F114375D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807497; cv=none; b=cxBwT9i8vM0C3TB8syEdCHhat6EvahU4AqmgrExNH8dGHAbFyJvqvIavbBfent4kz9At19oAY2e/rlJR5XoXTf7A7hvoKAT5THA8JLzrN64Ujzc9jqKRDWJj6haUG8TjG3mdns9o2zj5z3Q3ScaW4ajkXFehtqSJf09IaqeKLzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807497; c=relaxed/simple;
	bh=iQI0suf2tPTWplb89dXtzsiwVQb48SdrkOXVSSSSHBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+KKovcZyyW6DrDqIXDmUj4Nem6s9asFGuOrcWAgNFaoR2CpIzf2XWPi4gXRIAj4jjUcniMRhaggQnWITUq56gd/lx8ZATK19u5o44cuIwAErIlHl12OPj/1YmTip9cbOAjFrqUY3/LwOzFnQd0oLLuxRyuhy5fE3zAvRl22KJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QG0GxTS/; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QG0GxTS/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5wYF1SvPeXU/zC/FYEGtuzfUCWUok7qhuSTquOTok7g=; b=QG0GxTS/6in7keqj9PKcgQBEUN
	UF9s1JUnLVl+7aoIBS3jwLFJZUEdI5YAom0KN4txW8GPKjb9uxevVLhhxZKq28X9yEMOSzhNolTkl
	Zq4LNMK02+u3CiNnwmG2izacJcQ7K5QAmi80b582i48U4Qpv+VYipW7UZBu5wJ+CAaM07zwBJ7UH5
	zbo+m1n4gU49rm6JWKYQRDFK304+nrAIZWLXDM/awDlWefQwXEwPOq4PSel3KbH/FeU/nlP3r0sjQ
	H9+dShE2r3qo0Mcu27Yl5pvDlNAyfE9M6HUq7Uklsik9N7dNdTDw6y5SeMraGT5DxLQ4lHqlpa9NL
	Nu+QVqiA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u528A-0000000A7rI-3Nuc;
	Wed, 16 Apr 2025 12:44:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B10733003C4; Wed, 16 Apr 2025 14:44:42 +0200 (CEST)
Date: Wed, 16 Apr 2025 14:44:42 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Rik van Riel <riel@surriel.com>
Cc: Chris Mason <clm@meta.com>, Pat Cody <pat@patcody.io>, mingo@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
	patcody@meta.com, kernel-team@meta.com,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] sched/fair: Add null pointer check to pick_next_entity()
Message-ID: <20250416124442.GC6580@noisy.programming.kicks-ass.net>
References: <20250320205310.779888-1-pat@patcody.io>
 <20250324115613.GD14944@noisy.programming.kicks-ass.net>
 <7B2CFC16-1ADE-4565-B555-7525A50494C2@surriel.com>
 <20250402082221.GT5880@noisy.programming.kicks-ass.net>
 <b378f48593ca7449257a1bb55e78b186d88cd9f1.camel@surriel.com>
 <20250415080235.GK5600@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415080235.GK5600@noisy.programming.kicks-ass.net>

On Tue, Apr 15, 2025 at 10:02:35AM +0200, Peter Zijlstra wrote:
> On Mon, Apr 14, 2025 at 03:57:42PM -0400, Rik van Riel wrote:
> > On Wed, 2025-04-02 at 10:22 +0200, Peter Zijlstra wrote:
> > > 
> > > Please confirm what the reason for overflow is.
> > > 
> > Running a large enough sample size has its benefits.
> > 
> > We have hit 3 out of the 4 warnings below.
> > 
> > The only one we did not hit is the cfs_rq->avg_load != avg_load
> > warning.
> 
> Fair enough, that one really isn't hard.
> 
> > Most of the time we seem to hit the warnings from the
> > code that removes tasks from the runqueue, 
> 
> *blink*..

Which warning is getting hit on removal? The avg_vruntime mismatch?

Also, which removal path? schedule()'s block path, or migration like?

