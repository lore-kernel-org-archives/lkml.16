Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CE5202F8D
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265316; cv=none; b=r3phSsoC96KmNBfhgdkkOkH7w7zVjFGCTOhVZiv+3lEr3XE2V8JTaL8Ennkkn8QRwSdnRkdaHxGuv9KuGAv1s2e+2x+u5M8u53hktMTvy08yciybMFIoPcvYc9FoZIvHuvyth0N3Q65hbPlu9o0x5i3sVvfXqCPl2+DcKn/L4F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265316; c=relaxed/simple;
	bh=5cEag7n/qT/o4g/Ip4j9kwDbg2D33oMxgHBLz+BmT7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6qcfVMQQdEL76wflHlW6vw6fh5myZThT5TEpvlLHJF6VeoZCV5cF3Vo6Q8Zdwjn7QnTDo3imbD6a/wYM4rUWsheJ5CfMGMHqlnpoV0St5IRFb+bNOpDzWKt+5y+QPn63gU4ewbcDfnFRPwzuNvZoRzH6B0ac/6e9cF9ozTV10I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lOHsH8r0; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lOHsH8r0"
Message-ID: <16ab4d89-89ea-464b-812a-172f971c4627@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748265310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CfDsj/vggLw1N/iYXFLN6UBaW5wDtfTF6K8viv4sf0Y=;
	b=lOHsH8r0rAxYasqquR5evScp3j0sdXz2qMSwPB1laENDgaNWr6cDRiUG0m8Y8i7rI/Gqft
	Lr2tcMj0UsGgcM/29lHTUHt4sGnMver8GCjndfw1ZIYysb67b14Cm9POvw6nFFjt48RJt4
	G/NKSms/TR+GZP1W2K3gpWI8x/Dtf04=
Date: Mon, 26 May 2025 21:14:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/7] sched/fair: Take care of group/affinity/sched_class
 change for throttled task
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
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-5-ziqianlu@bytedance.com>
 <63237b23-ae10-45f9-abdd-8ea4adb4d15e@linux.dev>
 <20250523075640.GA1168183@bytedance>
 <ad8197f1-548d-4fad-abd0-e8f6e9dbe12a@linux.dev>
 <20250523094106.GA1210419@bytedance>
 <a0d4f499-1222-45da-a3ea-e9d445b81c87@linux.dev>
 <20250523115921.GB1240558@bytedance>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20250523115921.GB1240558@bytedance>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/5/23 19:59, Aaron Lu wrote:
> On Fri, May 23, 2025 at 05:53:55PM +0800, Chengming Zhou wrote:
>> On 2025/5/23 17:42, Aaron Lu wrote:
>>> On Fri, May 23, 2025 at 05:13:35PM +0800, Chengming Zhou wrote:
>>>> On 2025/5/23 15:56, Aaron Lu wrote:
>>>>> On Fri, May 23, 2025 at 10:43:53AM +0800, Chengming Zhou wrote:
>>>>>> On 2025/5/20 18:41, Aaron Lu wrote:
>>>>>>> On task group change, for tasks whose on_rq equals to TASK_ON_RQ_QUEUED,
>>>>>>> core will dequeue it and then requeued it.
>>>>>>>
>>>>>>> The throttled task is still considered as queued by core because p->on_rq
>>>>>>> is still set so core will dequeue it, but since the task is already
>>>>>>> dequeued on throttle in fair, handle this case properly.
>>>>>>>
>>>>>>> Affinity and sched class change is similar.
>>>>>>
>>>>>> How about setting p->on_rq to 0 when throttled? which is the fact that
>>>>>> the task is not on cfs queue anymore, does this method cause any problem?
>>>>>>
>>>>>
>>>>> On task group change/affinity change etc. if the throttled task is
>>>>> regarded as !on_rq, then it will miss the chance to be enqueued to the
>>>>> new(and correct) cfs_rqs, instead, it will be enqueued back to its
>>>>> original cfs_rq on unthrottle which breaks affinity or task group
>>>>
>>>> Yeah, this is indeed a problem, I was thinking to delete the throttled task
>>>> from the cfs_rq limbo list, then add it to another cfs_rq limbo list or cfs_rq
>>>> runnable tree based on the new cfs_rq's throttle status.
>>>
>>> Only work when the task is still handled by fair :)
>>>
>>>>
>>>> But it's much complex compared with your current method.
>>>>
>>>>> settings. We may be able to do something in tg_unthrottle_up() to take
>>>>> special care of these situations, but it seems a lot of headaches.
>>>>>
>>>>> Also, for task group change, if the new task group does not have throttle
>>>>> setting, that throttled task should be allowed to run immediately instead
>>>>> of waiting for its old cfs_rq's unthrottle event. Similar is true when
>>>>> this throttled task changed its sched class, like from fair to rt.
>>>>>
>>>>> Makes sense?
>>>>
>>>> Ok, the another problem of the current method I can think of is the PELT maintenance,
>>>> we skip the actual dequeue_task_fair() process, which includes PELT detach, we just
>>>> delete it from the cfs_rq limbo list, so it can result in PELT maintenance error.
>>>>
>>>
>>> There are corresponding callbacks that handle this, e.g. for task group
>>> change, there is task_change_group_fair() that handles PELT detach; for
>>> affinity change, there is migrate_task_rq_fair() does that and for sched
>>> class change, there is switched_from/to() does that.
>>>
>>> Or do I miss anything?
>>
>> migrate_task_rq_fair() only do it when !task_on_rq_migrating(p), which is wakeup migrate,
>> because we already do detach in dequeue_task_fair() for on_rq task migration...
>> You can see the DO_DETACH flag in update_load_avg() called from dequeue_entity().
>>
> 
> Understood, thanks for catching this!
> 
> So the code was initially developed on top of v5.15 and there is a
> detach in migrate_task_rq_fair():
> 
> 	if (p->on_rq == TASK_ON_RQ_MIGRATING) {
> 		/*
> 		 * In case of TASK_ON_RQ_MIGRATING we in fact hold the 'old'
> 		 * rq->lock and can modify state directly.
> 		 */
> 		lockdep_assert_rq_held(task_rq(p));
> 		detach_entity_cfs_rq(&p->se);
> 	}
> 
> But looks like it's gone now by commit e1f078f50478("sched/fair: Combine
> detach into dequeue when migrating task") and I failed to notice this
> detail...

Yeah..

> 
> Anyway, the task is already dequeued without TASK_ON_RQ_MIGRATING being
> set when throttled and it can't be dequeued again, so perhaps something
> like below could cure this situation?(just to illustrate the idea, not
> even compile tested)

Ok, seems reasonable to me!

> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 89afa472299b7..dc2e9a6bf3fd7 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5868,6 +5868,9 @@ static void dequeue_throttled_task(struct task_struct *p, int flags)
> 	WARN_ON_ONCE(flags & DEQUEUE_SLEEP);
> 
> 	list_del_init(&p->throttle_node);
> +
> +       if (task_on_rq_migrating(p))
> +               detach_task_cfs_rq(p);
> }
> 
> 
