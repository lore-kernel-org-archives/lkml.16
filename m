Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332F24395C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704179; cv=none; b=CUcZR+iXJFSXH0DEroIjlyOIFyIw2CF55VhuOnZ5aZr4Z3w7vtGoAiz2zhlgFAi5jOmCGLWMjsvaZQ1oCNwc9GoAKHaWUpxelTnuLkfKSvY99a+mogVRepJgZpw/PkodJ2TOGPeHbVNf6WSiIm0g2qBoZIj8Mraoz3DFBDFb+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704179; c=relaxed/simple;
	bh=bB9v90uUXLJMSGTtBA+KWYPBjUb8sJFHAsNnD4zAvYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOcq95iw0KVsx+kgBjaP9qTum+/BaE2k1/rUukt5olnkUZ+FXwwYI36HJzMGD/pBj66CFeisvHccbGPGb7N9ENCMwb7hZ39WnxExUmexWiJlsQjq8YaJKhcHIkdpqSeJtSjjNOqOVzrREF/T8jEg/V/FvhQlkSYRxhSGT4zvry0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Oy3/b4yO; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Oy3/b4yO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TTmEwawP5Z2mJepsUH2z9F7/mt/Xfpdj1VKxTKYIjjs=; b=Oy3/b4yOh/s/DyIXd+tdGKvCmJ
	x634Z0gn+6UqI4Y+OB2GkyoPtK872FtFkufxSUVW0NTGxNCp9iL58yIKsTAlK1jvQbhuQ4byOktXT
	wd81lXSb3uAsjRgXyyWZGa6E9YWolj1gNCqh+XdkQ6eDYkFZORnVKpB2b/usDHhCd3v3gnNxPNR2e
	zSEKxEfo4xnO4qsSEINankaHE6VBMgR66pFdZdxFtZHX1cR+ZF+JzWl+Gxi6luO0OZ/nP/8XEOi1P
	5uPgYKV2GY9KU+rcll2/bNVq8AYlUBhUYhWQXaRdaE0PqE2nGS1nSIMtqaYs2T2KUOT9uFf2ZT6PJ
	qbsWxYpw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bFc-00000008EH8-24FD;
	Tue, 15 Apr 2025 08:02:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3D91030037D; Tue, 15 Apr 2025 10:02:35 +0200 (CEST)
Date: Tue, 15 Apr 2025 10:02:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Rik van Riel <riel@surriel.com>
Cc: Chris Mason <clm@meta.com>, Pat Cody <pat@patcody.io>, mingo@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
	patcody@meta.com, kernel-team@meta.com,
	Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] sched/fair: Add null pointer check to pick_next_entity()
Message-ID: <20250415080235.GK5600@noisy.programming.kicks-ass.net>
References: <20250320205310.779888-1-pat@patcody.io>
 <20250324115613.GD14944@noisy.programming.kicks-ass.net>
 <7B2CFC16-1ADE-4565-B555-7525A50494C2@surriel.com>
 <20250402082221.GT5880@noisy.programming.kicks-ass.net>
 <b378f48593ca7449257a1bb55e78b186d88cd9f1.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b378f48593ca7449257a1bb55e78b186d88cd9f1.camel@surriel.com>

On Mon, Apr 14, 2025 at 03:57:42PM -0400, Rik van Riel wrote:
> On Wed, 2025-04-02 at 10:22 +0200, Peter Zijlstra wrote:
> > 
> > Please confirm what the reason for overflow is.
> > 
> Running a large enough sample size has its benefits.
> 
> We have hit 3 out of the 4 warnings below.
> 
> The only one we did not hit is the cfs_rq->avg_load != avg_load
> warning.

Fair enough, that one really isn't hard.

> Most of the time we seem to hit the warnings from the
> code that removes tasks from the runqueue, 

*blink*..

> but we are
> occasionally seeing it when adding tasks to the runqueue,
> as well.

OK, let me try and get my head around that.
