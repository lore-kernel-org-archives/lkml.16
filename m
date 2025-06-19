Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1687D242D66
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334561; cv=none; b=ki5poBX40+WcAMlWC/AUVnA/tKUWPz9Vj5vfUHI/V546YX+gHaiqC1O4VXxJPASR+k47VB3vqUrDwsygdNPbEsokKC8J0lLEYpHNIw9x8VmJmzudgTg6q+aJyLDKyS2NMhFsfmhj/eTIk7fuj2am5eWkKVkeqbmrrTVYcpsB/8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334561; c=relaxed/simple;
	bh=ISGKYWQHqZwrdnSH3aBAdSNROfpykmXrb7TRsxguEAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dMNWKxOW7VmFbSqLNpY4Nl9iBgr+oxAC1nfDjQb/FVNnXzlEPdT9YkDuwT33qFknWTeVbq2oDgel1Ax4DhkMTqP7ysagD7BKkqxIcmFuaPc1mRqNQToKbxSvHz8j9o/wcgLXlHkdMJKDUbKsQCuQZMUUfn/6axw72sceT2gYz4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aC71axHT; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aC71axHT"
Message-ID: <b598f584-e9fd-4160-9ce7-d328fee9f5d2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750334553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIf+80VMeEYtxKKh9WCpb+Oha15eREMQWcHaePGgOTU=;
	b=aC71axHTIl1v63n3S1xr7QzaUpVhMRzdpRt+lClG6hABMEUEcvAVaW90rv6325ce/3Cn2k
	ST4F1YBDEfEtFU2Ta6g6uWW0j+9XOWKAUohCvYQvAf2QqkR3c26loaO05p2LG31tCq7Hn0
	Gc3eSADZetCuJtAdSXCZS1D57b+tFyg=
Date: Thu, 19 Jun 2025 20:02:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/5] sched/fair: Switch to task based throttle model
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Ben Segall
 <bsegall@google.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>,
 linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
 <20250618081940.621-4-ziqianlu@bytedance.com>
 <ddca03a3-14d2-4d71-8070-8f9b8de9b7eb@linux.dev>
 <20250618111913.GA646@bytedance>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20250618111913.GA646@bytedance>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/6/18 19:19, Aaron Lu wrote:
> Hi Chengming,
> 
> Thanks for your review.
> 
> On Wed, Jun 18, 2025 at 05:55:08PM +0800, Chengming Zhou wrote:
>> On 2025/6/18 16:19, Aaron Lu wrote:
>>> From: Valentin Schneider <vschneid@redhat.com>
>>>
>>> In current throttle model, when a cfs_rq is throttled, its entity will
>>> be dequeued from cpu's rq, making tasks attached to it not able to run,
>>> thus achiveing the throttle target.
>>>
>>> This has a drawback though: assume a task is a reader of percpu_rwsem
>>> and is waiting. When it gets woken, it can not run till its task group's
>>> next period comes, which can be a relatively long time. Waiting writer
>>> will have to wait longer due to this and it also makes further reader
>>> build up and eventually trigger task hung.
>>>
>>> To improve this situation, change the throttle model to task based, i.e.
>>> when a cfs_rq is throttled, record its throttled status but do not remove
>>> it from cpu's rq. Instead, for tasks that belong to this cfs_rq, when
>>> they get picked, add a task work to them so that when they return
>>> to user, they can be dequeued there. In this way, tasks throttled will
>>> not hold any kernel resources. And on unthrottle, enqueue back those
>>> tasks so they can continue to run.
>>>
>>> Throttled cfs_rq's leaf_cfs_rq_list is handled differently now: since a
>>> task can be enqueued to a throttled cfs_rq and gets to run, to not break
>>> the assert_list_leaf_cfs_rq() in enqueue_task_fair(), always add it to
>>> leaf cfs_rq list when it has its first entity enqueued and delete it
>>> from leaf cfs_rq list when it has no tasks enqueued.
>>>
>>> Suggested-by: Chengming Zhou <chengming.zhou@linux.dev> # tag on pick
>>> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
>>> Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
>>> ---
>>>    kernel/sched/fair.c | 325 +++++++++++++++++++++-----------------------
>>>    1 file changed, 153 insertions(+), 172 deletions(-)
>>>
>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>> index 8226120b8771a..59b372ffae18c 100644
>>> --- a/kernel/sched/fair.c
>>> +++ b/kernel/sched/fair.c
>>> @@ -5291,18 +5291,17 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>>>    	if (cfs_rq->nr_queued == 1) {
>>>    		check_enqueue_throttle(cfs_rq);
>>> -		if (!throttled_hierarchy(cfs_rq)) {
>>> -			list_add_leaf_cfs_rq(cfs_rq);
>>> -		} else {
>>> +		list_add_leaf_cfs_rq(cfs_rq);
>>>    #ifdef CONFIG_CFS_BANDWIDTH
>>> +		if (throttled_hierarchy(cfs_rq)) {
>>>    			struct rq *rq = rq_of(cfs_rq);
>>>    			if (cfs_rq_throttled(cfs_rq) && !cfs_rq->throttled_clock)
>>>    				cfs_rq->throttled_clock = rq_clock(rq);
>>>    			if (!cfs_rq->throttled_clock_self)
>>>    				cfs_rq->throttled_clock_self = rq_clock(rq);
>>> -#endif
>>>    		}
>>> +#endif
>>>    	}
>>>    }
>>> @@ -5341,8 +5340,6 @@ static void set_delayed(struct sched_entity *se)
>>>    		struct cfs_rq *cfs_rq = cfs_rq_of(se);
>>>    		cfs_rq->h_nr_runnable--;
>>> -		if (cfs_rq_throttled(cfs_rq))
>>> -			break;
>>>    	}
>>>    }
>>> @@ -5363,8 +5360,6 @@ static void clear_delayed(struct sched_entity *se)
>>>    		struct cfs_rq *cfs_rq = cfs_rq_of(se);
>>>    		cfs_rq->h_nr_runnable++;
>>> -		if (cfs_rq_throttled(cfs_rq))
>>> -			break;
>>>    	}
>>>    }
>>> @@ -5450,8 +5445,11 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>>>    	if (flags & DEQUEUE_DELAYED)
>>>    		finish_delayed_dequeue_entity(se);
>>> -	if (cfs_rq->nr_queued == 0)
>>> +	if (cfs_rq->nr_queued == 0) {
>>>    		update_idle_cfs_rq_clock_pelt(cfs_rq);
>>> +		if (throttled_hierarchy(cfs_rq))
>>> +			list_del_leaf_cfs_rq(cfs_rq);
>>
>> The cfs_rq should be removed from leaf list only after
>> it has been fully decayed, not here.
> 
> For a throttled cfs_rq, the intent is to preserve its load while it's
> throttled. Its pelt clock is stopped in tg_throttle_down(), there will
> be no decay for it if left on leaf list.

Ah, right.

> 
> I've also described why I chose this behaviour in cover letter:
> "
> For pelt clock, I chose to keep the current behavior to freeze it on
> cfs_rq's throttle time. The assumption is that tasks running in kernel
> mode should not last too long, freezing the cfs_rq's pelt clock can keep
> its load and its corresponding sched_entity's weight. Hopefully, this can
> result in a stable situation for the remaining running tasks to quickly
> finish their jobs in kernel mode.
> "

Ok, I get it, keeping the current behavior seems reasonable to me.

Another way maybe detaching throttled task's load when dequeue, and
resetting its se->avg.last_update_time to 0, so its load will be attached
when enqueue. So we don't need to stop its cfs_rq's pelt clock.

But the current approach looks simpler.

Thanks!
