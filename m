Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01C52EBB98
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750435729; cv=none; b=hKUGQzH5Zeky9rkFOMR8PBZzhDd1pdsvTtexwHBbqO7xbw5vvOEwjpt5oGaAMbXekzAk5zRDYYlkP/VbAcdjJU/GMi5VBQ1rs2LnOOvmjcMOAqXrAQ6Abb9IYPIZ9Hg2t9+tHzOEuptNwhNv9avjFOKVjPkfX/eXYUPIawUpKxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750435729; c=relaxed/simple;
	bh=w3Tx/FY33b4U6ZvjGO5LWtC9nOYxPo8arMmytfpBgHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=seIFE7+w4i2xno9UOtrnh90wkWrma62jM2BIlA//sN409klC3TFEoLWnnFzFs8PktffcNMtakb8NtOLmI0zbgEE+waov8uL42RIJMOnVa4AIWAITzQXAs/vSOlceGJOeI7HXcH/X1xQQpEP8+Jo9U3K4grv7viZdGOUSSRikMpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrKUQYcG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrKUQYcG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C852C4CEE3;
	Fri, 20 Jun 2025 16:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750435728;
	bh=w3Tx/FY33b4U6ZvjGO5LWtC9nOYxPo8arMmytfpBgHw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lrKUQYcGXy6XrXCt1Vw/I2l2VEnU4Z37QD6gPUSu0xWrB/G3LMi5Tfv3j9Z2LJd3z
	 HCjWyjLeB2LriOmjlbxyO90H9U9kc/ebySxF4nrHtVg0oodO3F2OBA6qGSNwqjHRmA
	 L0tCwpMP++5VtrjDO9tLSbTpZMZ1FoEF4xXCt2WW2AWrsalnQcZtsEi0ZxTqfNYf3n
	 GDhCEhITW2sX1igYUguSosS1WzVlQhRXEDQFFXAlb7MjTy4mXfhDmAFyP971kNVXum
	 cx+k6U32pO8NIToiI2M1vl+iDOtIR2SpzyeQ6XPbqX7yABEi4/a3Xlq379QF3YPYiP
	 3lqHb8+kfuf0g==
Date: Fri, 20 Jun 2025 11:08:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 00/27] cpuset/isolation: Honour kthreads preferred
 affinity
Message-ID: <20250620160847.GA1295810@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620152308.27492-1-frederic@kernel.org>

On Fri, Jun 20, 2025 at 05:22:41PM +0200, Frederic Weisbecker wrote:
> The kthread code was enhanced lately to provide an infrastructure which
> manages the preferred affinity of unbound kthreads (node or custom
> cpumask) against housekeeping constraints and CPU hotplug events.
> 
> One crucial missing piece is cpuset: when an isolated partition is
> created, deleted, or its CPUs updated, all the unbound kthreads in the
> top cpuset are affine to _all_ the non-isolated CPUs, possibly breaking
> their preferred affinity along the way
> 
> Solve this with performing the kthreads affinity update from cpuset to
> the kthreads consolidated relevant code instead so that preferred
> affinities are honoured.
> 
> The dispatch of the new cpumasks to workqueues and kthreads is performed
> by housekeeping, as per the nice Tejun's suggestion.
> 
> As a welcome side effect, HK_TYPE_DOMAIN then integrates both the set
> from isolcpus= and cpuset isolated partitions. Housekeeping cpumasks are
> now modifyable with specific synchronization. A big step toward making
> nohz_full= also mutable through cpuset in the future.

Is there anything in Documentation/ that covers the "housekeeping"
feature (and isolation in general) and how to use it?  I see a few
mentions in kernel-parameters.txt and kernel-per-CPU-kthreads.rst, but
they are only incidental.

Bjorn
