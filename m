Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3666526B970
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279396; cv=none; b=mDWxFN3Rh0KjALy6a2Y6HMB9UWDdhUE7g3LuMvqLatk2Xs2y4um2kDKQsYtcauBowVlQlWOCdnWNm8DX4417Dnfjj9hIruRG1+lxQ5vF+gaB5VKfWLdQjHFpOPsBV+88Q6hSdvfLs72/pqMnAIRPSKKuWRqFbM1nxXNzn8hDoOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279396; c=relaxed/simple;
	bh=60kJslvnsJA31a1Vm6cxQ8IZBe70jj4DAo5HbYEex9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkWS0bZF2Ur20nk5vn3FSd4YEvchLqIgL0zo8Fn9Wwpneg4ojfh+VNcVfaCYSIR8C7GhMe2erXRMdFn9V7ZsxmL97HAni5h0fDZd8A1hfxTMNM0kRkQ4QKj6kpmDD1Itaf0zebxRl0u1fKhpZrE+zLGr7774/JWIEieaxtgzSOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oubSXj0z; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oubSXj0z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=60kJslvnsJA31a1Vm6cxQ8IZBe70jj4DAo5HbYEex9M=; b=oubSXj0zMmrg7e0M5hLU6egTBl
	x9XXLxq+Ke04wqgKxB/ZUwdm7iNO/VNZJdvIKAyu7WIvu1iYj8dxHRi90iJn55dGyd1EsnSbRhBoU
	jAk39Q2ny+96s41GJNW2ullPezvuVZEdsy3IrMVYNEjtFQu7g+2asg6HVovNtROhyCwGvzlfKTt+w
	oxUfmQ4W5tN4tlx3Bk9iJEX9mG12TdDHG7TuJfF9gWcLcvO3z6Ene++LL7niEF8eQmBudNbISmuAH
	belCRfLv/l30BzDDvaTH4N9SvYYsalDwEo+PulXje6ws/lO29h3WGn0eRmjWq5kT5kmBGl8vkuJ/Q
	2BfbGgUw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2okY-00000008nDz-0i4n;
	Thu, 10 Apr 2025 10:03:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BAB4130017D; Thu, 10 Apr 2025 12:03:09 +0200 (CEST)
Date: Thu, 10 Apr 2025 12:03:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: Re: [RFC PATCH 2/5] sched/fair: Introduce overloaded_mask in
 sched_domain_shared
Message-ID: <20250410100309.GB30687@noisy.programming.kicks-ass.net>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
 <20250409111539.23791-3-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409111539.23791-3-kprateek.nayak@amd.com>

On Wed, Apr 09, 2025 at 11:15:36AM +0000, K Prateek Nayak wrote:
> Introduce a new cpumask member "overloaded_mask" in sched_domain_shared.
> This mask will be used to keep track of overloaded CPUs with pushable
> tasks on them and will be later used by newidle balance to only scan
> through the overloaded CPUs to pull a task to it.

'to pull a task from it.' ?
