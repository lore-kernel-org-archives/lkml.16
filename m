Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4393A1EB5B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422705; cv=none; b=iJug9cWfP+lAw5E4IjhaqelZxWDTwnZ+j061XLoGgZRF60jRn54WOEP0aRyzeCRrIAMicbTjKCESv/4ek+u/ZGOkOyZmqW8azTjbaFb6HyjFvKNb4y6Q2ie6ivkK3amejnB1fXpa/35anXydYWkg1OACAnOHoG1yZRT5Mh1syt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422705; c=relaxed/simple;
	bh=dpY9XFxX4Hy1lUfcsTOGEUIRWm+NLZbPH82t6a86ht0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvY9RsmGywzaU3uPYDr74z2iSeUKupkm+3I/bE2o1y4iTK9W+0O5uS0y0rd9zT5+d31ta6T04GVGl93Xvhbf0UqhYd9bAmYQnEVXN+08Q1sefre7RZ7nUZ4DKdkRtzepfu9M81T4yoI+cN7uz41pTXReWAO7HwBy3xPD73KyDO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dyLMTTOm; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dyLMTTOm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vYNmxvQDWeJYerNgEaZPPT4IzuTtjys5hREGA3peSrk=; b=dyLMTTOmH9qEElCGwMz5i6kNZE
	Zhupst2sfaCLBXlarKlTs26ch0qUrd3lTu24B4cPyMcr2Oa4Cxe87pR46bZObGcTDYFgVfOTusDxD
	sj01vkEX9OReMo8THxP3qDDgqkiz04CDSj6wq2aDp/1Uq+FqNF9wqj8RimPZ1YR0ZWYAnrOOG2Emv
	dVInh8gS9Eubv4kDPgw9SrmLqQ0E89m667FXtixpSe+IvKVA6X4IVmd725wrlibku5uTDOQA+3qvf
	UKc48PgWx5zYxgwKEFGBxy3+AfYHmm2zEPvw/L6POaOCqWEKqrjhJKSOVyq2oqpqabt1JU/JxdhLd
	S5bGt30w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCc4-0000000DQ5A-2K6g;
	Wed, 28 May 2025 08:58:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9BD883005AF; Wed, 28 May 2025 10:58:13 +0200 (CEST)
Date: Wed, 28 May 2025 10:58:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 00/43] sched: Use the SMP scheduler on UP too
Message-ID: <20250528085813.GX39944@noisy.programming.kicks-ass.net>
References: <20250528080924.2273858-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528080924.2273858-1-mingo@kernel.org>

On Wed, May 28, 2025 at 10:08:41AM +0200, Ingo Molnar wrote:
>   sched/smp: Always define sched_domains_mutex_lock()/unlock(), def_root_domain and sched_domains_mutex
>   sched/smp: Make SMP unconditional
>   sched/smp: Always define is_percpu_thread() and scheduler_ipi()
>   sched/smp: Always define rq->hrtick_csd
>   sched/smp: Use the SMP version of try_to_wake_up()
>   sched/smp: Use the SMP version of __task_needs_rq_lock()
>   sched/smp: Use the SMP version of wake_up_new_task()
>   sched/smp: Use the SMP version of sched_exec()
>   sched/smp: Use the SMP version of idle_thread_set_boot_cpu()
>   sched/smp: Use the SMP version of the RT scheduling class
>   sched/smp: Use the SMP version of the deadline scheduling class
>   sched/smp: Use the SMP version of scheduler debugging data
>   sched/smp: Use the SMP version of schedstats
>   sched/smp: Use the SMP version of the scheduler syscalls
>   sched/smp: Use the SMP version of sched_update_asym_prefer_cpu()
>   sched/smp: Use the SMP version of the idle scheduling class
>   sched/smp: Use the SMP version of the stop-CPU scheduling class
>   sched/smp: Use the SMP version of cpu_of()
>   sched/smp: Use the SMP version of is_migration_disabled()
>   sched/smp: Use the SMP version of rq_pin_lock()
>   sched/smp: Use the SMP version of task_on_cpu()
>   sched/smp: Use the SMP version of WF_ and SD_ flag sanity checks
>   sched/smp: Use the SMP version of ENQUEUE_MIGRATED
>   sched/smp: Use the SMP version of add_nr_running()
>   sched/smp: Use the SMP version of double_rq_clock_clear_update()

You know about unifdef, right :-)

$ unifdef -m -DCONFIG_SMP=y kernel/sched/*.[ch] include/linux/sched.h include/linux/sched/*.h

I'd just run that tool, have changelog include the command and patch be
the effect.

No point in doing this manually bit by bit.
