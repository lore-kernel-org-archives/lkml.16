Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3352ECD22
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949872; cv=none; b=dwLJMRcdPYOIWUn/bW/Oy8ToBr+4OvdH5rtTuTzhQqseT0P80DXGBQ+r3TQp5+esTOEf7LMx5uyt/DHnYxUMnl9hqP4F3aaLAtwKH1HWs6YMBv9RdYEh1yk0KsRW2OywRdCZiR335iJ4SmRTAe5am/e1veQcwEofPQUqMh56vNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949872; c=relaxed/simple;
	bh=waAzfhSPPgiKKjNY60AGgeGRs4IxNy8v7C7OpSqOHIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWV8unA/bCZZ/bS6yN4xJHGwiwL6Rhu1/O4axXaeWAlikb9kb0Y1e3jpYR4J5Y7TVoA9PrJYp+CAusGfb3Je7NqJcWR4HN/xTCZrjJSzmbknEL5F9dtFi0/zVBvILkWLrVZmIjf5Ol5bOQB6ZEEuH0Ea5gdyAU99OqWsPxWHVqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NO9uKOtt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NO9uKOtt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A94C4CEED;
	Thu, 26 Jun 2025 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750949871;
	bh=waAzfhSPPgiKKjNY60AGgeGRs4IxNy8v7C7OpSqOHIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NO9uKOtt6sMCYoYTXoGQpqBh/nAlDOrbMErluIN9jtHeN5hmOCdtI7Gk1kc0/Qp5K
	 QXrC2Hfn4eC16tnB5nD0z0zr68jgwlcd0Ev/kkWZ9vDzIdj0hUqm2k05UxGygugPzP
	 6nmZu3MNvUS2BX1oxbQKz3Ake1wa6wjMOkIKLphHOGtMmM6buKojNKA3fTkmY3I0FK
	 Pj/QZRu2DLHtBdgmVjlG+Wdk7SLF9nacf3T5dAUinj1qdK5mb+pwQVxNRvFh10kOJf
	 skmhl25nOpnOO6KIfMDymA2R8feriSFj9ejZ0pTw4Vf1FGuvTD07eLuMwixaCYpa94
	 EwZYvBUGH35+Q==
Date: Thu, 26 Jun 2025 16:57:49 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 00/27] cpuset/isolation: Honour kthreads preferred
 affinity
Message-ID: <aF1f7aBSzyk7vJty@localhost.localdomain>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620160847.GA1295810@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620160847.GA1295810@bhelgaas>

Le Fri, Jun 20, 2025 at 11:08:47AM -0500, Bjorn Helgaas a écrit :
> On Fri, Jun 20, 2025 at 05:22:41PM +0200, Frederic Weisbecker wrote:
> > The kthread code was enhanced lately to provide an infrastructure which
> > manages the preferred affinity of unbound kthreads (node or custom
> > cpumask) against housekeeping constraints and CPU hotplug events.
> > 
> > One crucial missing piece is cpuset: when an isolated partition is
> > created, deleted, or its CPUs updated, all the unbound kthreads in the
> > top cpuset are affine to _all_ the non-isolated CPUs, possibly breaking
> > their preferred affinity along the way
> > 
> > Solve this with performing the kthreads affinity update from cpuset to
> > the kthreads consolidated relevant code instead so that preferred
> > affinities are honoured.
> > 
> > The dispatch of the new cpumasks to workqueues and kthreads is performed
> > by housekeeping, as per the nice Tejun's suggestion.
> > 
> > As a welcome side effect, HK_TYPE_DOMAIN then integrates both the set
> > from isolcpus= and cpuset isolated partitions. Housekeeping cpumasks are
> > now modifyable with specific synchronization. A big step toward making
> > nohz_full= also mutable through cpuset in the future.
> 
> Is there anything in Documentation/ that covers the "housekeeping"
> feature (and isolation in general) and how to use it?  I see a few
> mentions in kernel-parameters.txt and kernel-per-CPU-kthreads.rst, but
> they are only incidental.

Not yet, I'll try that for the next take.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
