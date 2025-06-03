Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D54D23BE
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 00:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748910221; cv=none; b=ImP0UYHJYaw+/aILznHM1qjH245C0gKw8KtGvAqQrRY4lNewatkNJQ2pk46k1Dh0uDvrcfHI6l70d/OAOmiVOgWJATNQqDBHuZlfuACi4SAHqIx7/4wO8xxqvapAI/9GMqR6b7qUfU2s4GrEugfoaz6XKtJ9O7k4C6Eo9Ix+rk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748910221; c=relaxed/simple;
	bh=W0HW+oIJn/tT52McazkjRUQvktof+Bt6uPdHp+gUXcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkS6AIlMW+D9OkfF2r4ZTTliVT6oNOVjFxjBqM/PZu1wKpQ3HMZH1jioYuKN4UOq9fdIuQO24P5MxXzTl/xlSDbPYbdqn4Zt5qRxe+FTgTS8ayGoWxOIoMYkusXUqkoyttrX6PF+FMyKgqyiwBa2dq6koE1u/CM0L/ESPyyoaIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F01p+ScU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F01p+ScU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1793C4CEEB;
	Tue,  3 Jun 2025 00:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748910220;
	bh=W0HW+oIJn/tT52McazkjRUQvktof+Bt6uPdHp+gUXcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F01p+ScUqlIZySGT/6D1XUQgWNjw8I3S99K9KZE2HA4olWbFr191i8I/gY6NoSesd
	 I4pU8w49ibLOhSOcIwj8JVpUcXQcD3WlW+QHc0bi6HFY6fA19aFyUqzfXwOpIDacIX
	 C8uR9OJbyko69imEURZW/sKNO1KYjhx1WpH0v1CqxVECsAl4rxyrZkl5+LQjV3MNNN
	 s5d0lNKEHlqND3GwyaW3HN5xuJxygLrdHdQs282i2diUpYMhZbrlE8xu+KYTx290hG
	 WPDFWupsQixRpMuXh0Q/rGvtvbwNolVA6M13wPT+Fn3O9LyDMuxDVm5NURM9t0YlnG
	 R96uA8+5MLTpQ==
Date: Mon, 2 Jun 2025 14:23:39 -1000
From: Tejun Heo <tj@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Luigi De Matteis <ldematteis123@gmail.com>
Subject: Re: [PATCH v2 03/10] sched/ext: Add a DL server for sched_ext tasks
Message-ID: <aD5Ai3xJdnV5SxG0@slm.duckdns.org>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
 <20250602180110.816225-4-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602180110.816225-4-joelagnelf@nvidia.com>

On Mon, Jun 02, 2025 at 02:00:59PM -0400, Joel Fernandes wrote:
...
> @@ -2308,6 +2311,15 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
>  	if (enq_flags & SCX_ENQ_WAKEUP)
>  		touch_core_sched(rq, p);
>  
> +	if (rq->scx.nr_running == 1) {
> +		/* Account for idle runtime */
> +		if (!rq->nr_running)
> +			dl_server_update_idle_time(rq, rq->curr, &rq->ext_server);
> +
> +		/* Start dl_server if this is the first task being enqueued */
> +		dl_server_start(&rq->ext_server);
> +	}

The following patch from Peter isn't upstream yet but SCX probably should do
something similar. Otherwise, the start/stop overhead can become pretty
expensive:

 https://lore.kernel.org/all/20250520094538.086709102@infradead.org/

Another thing which is worth considering is that while rq->nr_running based
test would work in a lot of cases, it won't work in all cases for SCX as the
BPF scheduler may choose to not dispatch to the particular CPU even if a
task is currently associated with it.

For example, a soft partitioning scheduler might change partition CPU
allocations after enqueue() is complete and a task may end up associated
with a CPU that's no longer in its partition and when dispatch() is called
from the CPU, the BPF scheduler may not consume that task. This can become a
problem for the dl server based forward progress guarantee as that task is
enabling the dl server only on the rq that it's currently associated with.

This shouldn't be too common and the proposed patch puts us back in the same
state as the original RT bandwidth control, so no need to hold this series
for this issue but I think the right solution would be adding an optional
SCX operation so that the BPF scheduler can decide which CPUs should be
running the dl server.

Thanks.

-- 
tejun
