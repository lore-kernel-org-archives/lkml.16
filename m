Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629B22D1911
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800094; cv=none; b=iEGPjAza/9NHxBKtKncVe4TG1L1n4cmNSKClQsNwvBpvBzX/aMMF6JY+Jeftozrttapre/udjU5YH+ppD81Y9bRjJCAnuIXiGDOfBGDNsjYETGChB64QlvNU3tDjl/Q17GJrjXuBKkhy7bvvpgCpHrRtqNcRJRq54cT6HLaNH0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800094; c=relaxed/simple;
	bh=Y1JO6yRUdnYicdtcwizD05rpMEa4fyvqEy46XDzFCsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dZJ98xi5tmTPDcSNjAa8XJOoPZq8MRapZdWRVm7gQ3A4lhlOtD/WY7BwDD1dffWbOfrI++5YNUZZm47e//VtTxOIIjyVQbtvM8hAZtVPbbflDXrS2ekUK589er+ekBgFEUbffARZ7CRNv4+JW7j9oRMOw2ERkpFs8QQjlrZ3Nn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 481BD1D6F;
	Fri, 13 Jun 2025 00:34:30 -0700 (PDT)
Received: from [192.168.178.71] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDAB43F59E;
	Fri, 13 Jun 2025 00:34:48 -0700 (PDT)
Message-ID: <64ae41a7-2c06-4082-a4d6-0db5b635ea01@arm.com>
Date: Fri, 13 Jun 2025 09:34:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 5/5] sched: Add ttwu_queue support for delayed tasks
To: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, clm@meta.com
Cc: linux-kernel@vger.kernel.org
References: <20250520094538.086709102@infradead.org>
 <20250520101727.984171377@infradead.org>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250520101727.984171377@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2025 11:45, Peter Zijlstra wrote:

[...]

> @@ -3830,12 +3859,41 @@ void sched_ttwu_pending(void *arg)
>  	update_rq_clock(rq);
>  
>  	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
> +		struct rq *p_rq = task_rq(p);
> +		int ret;
> +
> +		/*
> +		 * This is the ttwu_runnable() case. Notably it is possible for
> +		 * on-rq entities to get migrated -- even sched_delayed ones.
> +		 */
> +		if (unlikely(p_rq != rq)) {
> +			rq_unlock(rq, &rf);
> +			p_rq = __task_rq_lock(p, &rf);

I always get this fairly early with TTWU_QUEUE_DELAYED enabled, related
to p->pi_lock not held in wakeup from interrupt.

[   36.175285] WARNING: CPU: 0 PID: 162 at kernel/sched/core.c:679 __task_rq_lock+0xf8/0x128
[   36.176021] Modules linked in:
[   36.176187] CPU: 0 UID: 0 PID: 162 Comm: (udev-worker) Tainted: G W 6.15.0-00005-gcacccfab15bd-dirty #59 PREEMPT 
[   36.176587] Tainted: [W]=WARN
[   36.176727] Hardware name: linux,dummy-virt (DT)
[   36.176964] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   36.177301] pc : __task_rq_lock+0xf8/0x128
[   36.177576] lr : __task_rq_lock+0xf4/0x128
...
[   36.181314] Call trace:
[   36.181510]  __task_rq_lock+0xf8/0x128 (P)
[   36.181824]  sched_ttwu_pending+0x2d8/0x378
[   36.182020]  __flush_smp_call_function_queue+0x138/0x37c
[   36.182222]  generic_smp_call_function_single_interrupt+0x14/0x20
[   36.182440]  ipi_handler+0x254/0x2bc
[   36.182585]  handle_percpu_devid_irq+0xa8/0x2d4
[   36.182780]  handle_irq_desc+0x34/0x58
[   36.182942]  generic_handle_domain_irq+0x1c/0x28
[   36.183109]  gic_handle_irq+0x40/0xe0
[   36.183289]  call_on_irq_stack+0x24/0x64
[   36.183441]  do_interrupt_handler+0x80/0x84
[   36.183647]  el1_interrupt+0x34/0x70
[   36.183795]  el1h_64_irq_handler+0x18/0x24
[   36.184002]  el1h_64_irq+0x6c/0x70

[...]

> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -2313,6 +2313,7 @@ static inline int task_on_rq_migrating(s
>  #define WF_RQ_SELECTED		0x80 /* ->select_task_rq() was called */
>  
>  #define WF_ON_CPU		0x0100

Looks like there is no specific handling for WF_ON_CPU yet?

> +#define WF_DELAYED		0x0200

[...]

