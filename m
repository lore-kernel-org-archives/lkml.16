Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAC317548
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 18:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749062413; cv=none; b=YtYF9VojEU0wD1jsEwgAt6hpZpgTOyLZuNAkthQ6BHXvB1dipEUJmvQOr/oU2IV5Rw1fe8xkTNdOUX2hlj2Twx+n843v3zon3XtMXxCRfZ2UAnC+qyw4Ln8f3M0UDz2yjQJCjRhtF+D8sVtAVuGicDfjg42SvrYXgdtVwbue5vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749062413; c=relaxed/simple;
	bh=xz37oLBvqypll8TTBNnLwbPbNL9K5iS+LM17+HG5IWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksEXlHdeqKBf2eirDjeNB8tUyrCBqFssIlxYIOWj0C3kcIMPvgX0buQielD+C0Md397JyhCqyv0sHoR+lnA21VNk2e1VIByKWFc63UBEpbrtAt8CgaiZJeAtnk9pBIp3GmHNlslWoXc9idzEao2VlttpCf3vTBHfV8FZBpp0LpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0LIejYf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0LIejYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118C0C4CEE4;
	Wed,  4 Jun 2025 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749062412;
	bh=xz37oLBvqypll8TTBNnLwbPbNL9K5iS+LM17+HG5IWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s0LIejYfNUwQS8maO0y0opgW5ifLBU/38vGTdtm5Uw1PoXAc+G0X3tP62WknYXQYR
	 /nzcqsWIBbrS+QAP3hbsF5LV0sCS7hpYqS1F2yocZfkDD/ecp8516eXoMaWJV7kt8S
	 eGfzl6sSruQcD/sNyWmfXUVQhWhlIe2osHVaoTjoG10BmQ3N+1vKC72kLNywewkkew
	 JMGRvQf3zlM/eYIhl+YiX7vNe0Lw/qNoXsPRJ8xErp6dt7avIB+JKgw1Ge02LX1nJ6
	 k6PBNU0FWg1VxCMNn5TPk1EIfwqTUsB6AX+WIhEisJw2YduRFDQd5K6FyxIBmZrAFj
	 wKu2McXgFYy5Q==
Date: Wed, 4 Jun 2025 08:40:11 -1000
From: Tejun Heo <tj@kernel.org>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v2 06/10] sched/debug: Add support to change sched_ext
 server params
Message-ID: <aECTCyILPeWF1gvX@slm.duckdns.org>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
 <20250602180110.816225-7-joelagnelf@nvidia.com>
 <aEAZo3_g-OMVEgc-@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEAZo3_g-OMVEgc-@jlelli-thinkpadt14gen4.remote.csb>

On Wed, Jun 04, 2025 at 12:02:11PM +0200, Juri Lelli wrote:
> Hi Joel,
> 
> On 02/06/25 14:01, Joel Fernandes wrote:
> > When a sched_ext server is loaded, tasks in CFS are converted to run in
> > sched_ext class. Modify the ext server parameters as well along with the
> > fair ones.
> > 
> > Re-use the existing interface to modify both ext and fair servers to
> > keep number of interfaces less (as it is, we have a per-cpu interface).
> 
> We have a bit of code duplication, don't we? I wonder if we can do
> anything early on to prevent mis-alignment between servers in the
> future.
> 
> Also, is a single shared interface enough? Is the assumption that either
> all tasks are FAIR or SCX always guaranteed?

It's not a guarantee but at least all the current use cases are like that.
No objection to splitting the interface tho. In fact, for SCX, it may make
more sense to just make it part of sched_ext_ops, so that each scheduler can
specify what they want.

Thanks.

-- 
tejun
