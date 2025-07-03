Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAB121D3F8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546208; cv=none; b=C0fAyNRJxXn3UZ6Iq7c557PAY4eQpMeenpKRJOaajUqiDNJkMcOtjAMvTL5nIfDMFFSB75PIzRlesRv/O5Fvn7UnyHhhk++X9lCb8HAKBHM+47PintdJc19F6TErKDy/yV042+Etco5SguykLfUDSWjT/HpWC/yQ+vxhxYL5RWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546208; c=relaxed/simple;
	bh=HecbAPa3rncj39eTzk18tRqZ32VIPiiq0hhgnrl1Ywo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XF0TDX57WeLHPlQrZXshfHvP6U5fPy+BE06UxX4Vhj+CffxC9G8mL93F/dA4/kG5/7sDeZfvYtBQKn4zMwOALuJ0Yqya+DB18A/CWN34Jz+PRWkNL5vZK7vYxFR95gw+sLv7fQDV774JLhnRFUVBAmpEbKr8zzOXETRy5Z9wduw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VhIAhpDt; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VhIAhpDt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nYpNb66VmDnizjMo0fFecW51iy25oLQuiGDoq0i3Ea4=; b=VhIAhpDtnzEKp9Jb2MXfi6YdGf
	bL4nk9c/1EEaffJ8Ru3GPMKoLPaV3d7jLB6dR4+sCt0VMVBd6aIDxbB666PAmTjAJ86uwUOeE1hG2
	7KgSmyXdq899QCFt1luzjMgwjG5Q+ESHc6v+xQNNBqFuTBFJINU43UZUcyk5rN6BHi8Fmh/roOkO4
	xKDBIcscjn7WPzHxBOaR0t2AtZYnW3ZPtSc9BIOgyqdSguAeBPJ7c4rIx1CjDwMipQIPVpRptricg
	lmMyJKh4NF6gIcQfoyFmTSsP/fAyYtGUfvWjsiTELK+ktGu+BzeXSd7+apu+1UQmmh7/wJ1YaAb2R
	i6H+MD0A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJAx-00000007gqS-1oTa;
	Thu, 03 Jul 2025 12:36:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4EA0A30017D; Thu, 03 Jul 2025 14:36:26 +0200 (CEST)
Date: Thu, 3 Jul 2025 14:36:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Libo Chen <libo.chen@oracle.com>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Michal Hocko <mhocko@suse.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tim Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org,
	Jirka Hladky <jhladky@redhat.com>,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Suneeth D <Suneeth.D@amd.com>
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
Message-ID: <20250703123626.GW1613200@noisy.programming.kicks-ass.net>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
 <aGZNTtJuCyHJE_25@tiehlicka>
 <20250703115006.GT1613200@noisy.programming.kicks-ass.net>
 <aGZxFRVxHouLaMPg@tiehlicka>
 <b4891cca-4da3-4411-bc9c-669118bf825a@intel.com>
 <e944b504-a852-4f07-a514-7dd99e63b888@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e944b504-a852-4f07-a514-7dd99e63b888@oracle.com>

On Thu, Jul 03, 2025 at 05:20:47AM -0700, Libo Chen wrote:

> I agree. The other parts, schedstat and vmstat, are still quite helpful.
> Also tracepoints are more expensive than counters once enabled, I think
> that's too much for just counting numbers.

I'm not generally a fan of eBPF, but supposedly it is really good for
stuff like this. 

Attaching to a tracepoint and distributing into cgroup buckets seems
like it should be a trivial script.
