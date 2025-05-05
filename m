Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF733098C3
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746488368; cv=none; b=APNRTcdM4o7LXKBoW3g5ahh/1Bh4+V43J7t7Da6ZU0i2I/CP0vwKYqMnphljILRfdlgZQvqKejUwtOQS1yP6B/ifN+DiRW2ACE4cqgEstP8zbpAFenDQs2skNOXyOzNWdc9l57wDjehSX2F/7k4hBW4QMQqBdMXwCjzdhGXsd6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746488368; c=relaxed/simple;
	bh=NZZ19ObhsXfBCcf2Qe9cwITNXeSo2xSs5zMQL9ql764=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2CGbpcIZBT+6mDoRLpjxeCO2/x4O831P4AmRLzySH2uT47JONU18l0mRw27jgS4gmcWONyT2MYJMSWFAzxOepuD/+ZK4qlhaLIN/uCWKiDtUAZk8BGvmmRClr3NF6R6HoHlTiFfHsWt4RGGeJ83r+xZi/iS5S0zS1lboEqTaQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBD4BuhQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBD4BuhQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03226C4CEE4;
	Mon,  5 May 2025 23:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746488367;
	bh=NZZ19ObhsXfBCcf2Qe9cwITNXeSo2xSs5zMQL9ql764=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBD4BuhQfGxOMFv0Gsw64iXAlktjK8EsxMTvmuvukEqxHTU9ohxtDZ4jDvJYw73+M
	 2SKEu/ip0tCqj/EPIHWIsTYOSyn1su9y7f1f41KiPSuwC89ujqZwo/w8MPSsKJ/VfX
	 Shc/RDd9FsvI20v8iuZeqayzNm1HUjL/OK2fnH71B4VfWp/YLeyM+2l9Ze9J78V5qp
	 Mgxo45ssNglNZCgBU+utobN3ybEHBfKyaZJWozqNCiaT4oMHZlnFIao6OOvCWvjUz6
	 4GGwedXqYmCLMXvvl9wKdH5wTRKmp4vGBLzIz+qyYdqQT4JGnlGUM0nx2PzbXFKVTk
	 ful6Sp87nttYQ==
Date: Mon, 5 May 2025 13:39:25 -1000
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 0/4] Workqueue: rename system workqueue and add WQ_PERCPU
Message-ID: <aBlMLQl504ThYbnf@slm.duckdns.org>
References: <20250503082834.49413-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503082834.49413-1-marco.crivellari@suse.com>

Hello,

On Sat, May 03, 2025 at 10:28:30AM +0200, Marco Crivellari wrote:
> Hi!
> 
> This series is the follow up of the discussion from:
> 	"workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOUND."
> 	https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

Can you please make a summary of the discussion here? Referring to old
thread is useful but it'd be nice to have the rationales laid out in the
patchset - why this is desirable, what is the transition plan and what are
the rationales for it? Also, please include a short summary in the patches.

> 1)  [P 1-2] system workqueue rename:
>  
> 	system_wq is a per-CPU workqueue, but his name is not clear.
> 	system_unbound_wq is to be used when locality is not required.
> 	
> 	system_wq renamed in system_percpu_wq, while system_unbound_wq
> 	became system_dfl_wq.

Let's keep the old names for a release or two and trigger printk_once()
warnings about the renames. These are pretty widely used, so I think it
warrants a bit of extra effort.

> 2)  [P 3] Introduction of WQ_PERCPU.
> 
> 	This patch adds a new WQ_PERCPU flag to explicitly request the legacy
> 	per-CPU behavior. WQ_UNBOUND will be removed once the migration is
> 	complete.

I wouldn't call per-cpu behavior legacy. There are plenty of cases that need
per-cpu behavior for correctness and/or performance.

> 	Every alloc_workqueue() caller should use one among WQ_PERCPU or
> 	WQ_UNBOUND. This is actually enforced warning if both or none of them
> 	are present at the same time.

Similarly, let's warn about violations and assume the old behavior at first.

> 3)  [P 4] alloc_workqueue() callee should pass explicitly WQ_PERCPU.

Do you mean caller?

> 
> 	This patch ensures that every caller that needs per-cpu workqueue
> 	will explicitly require it, using the WQ_PERCPU flag.

How is 3) different from 2)?

Thanks.

-- 
tejun
