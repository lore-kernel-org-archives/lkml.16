Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FFC20CCC8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811552; cv=none; b=FDbvUQjn2pyjPjJyFITC0Q9gwzu90m9sAuW9o7yxyw69XSs9Aj8Vk2BIra/MWzK8c4Sld0BTuQ4wZcO93n2VDsKHoWoweI47F8nzKpAQYcyHM1mizQkpp7AD4bE1WIjWMrKjVDZahH587lkPpiKtHKbDbKUr2cwW/l+2xRcvAVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811552; c=relaxed/simple;
	bh=9T12ypzSMqqkaRnljD4Era6+8uN21IJZ7xzgaypJBOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JadIafAEqN4FVOHtyViv5Yt0SQFmhah4momfTGZHG0t+h6R2pFatlaeOzhsmW7x/p8zk2HM1QduBhnTvRIa7HHvYVEBPfX1pc2PsARi9CqqUuHz7KDT6hcQjbu5Spzm/4+VOVsTVzQ6fM2gO5B5ErptsjdbHB5jt51DqZ17YDbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50B071595;
	Wed, 16 Apr 2025 06:52:28 -0700 (PDT)
Received: from [10.1.35.42] (e127648.arm.com [10.1.35.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB91C3F66E;
	Wed, 16 Apr 2025 06:52:26 -0700 (PDT)
Message-ID: <f3082b1b-1634-42da-835e-0a1c94343ad7@arm.com>
Date: Wed, 16 Apr 2025 14:52:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7 v5] sched/fair: Add push task mechanism for EAS
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, lukasz.luba@arm.com,
 rafael.j.wysocki@intel.com, pierre.gondois@arm.com,
 linux-kernel@vger.kernel.org, qyousef@layalina.io, hongyan.xia2@arm.com,
 luis.machado@arm.com, qperret@google.com
References: <20250302210539.1563190-1-vincent.guittot@linaro.org>
 <20250302210539.1563190-6-vincent.guittot@linaro.org>
 <b19a857c-4c01-471b-94be-c465de636cd9@arm.com>
 <CAKfTPtCr0BRFwc2z0EGVNSyKSfKWqrOfeiZLNigzxEY2W6Bocw@mail.gmail.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <CAKfTPtCr0BRFwc2z0EGVNSyKSfKWqrOfeiZLNigzxEY2W6Bocw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/15/25 14:52, Vincent Guittot wrote:
> On Tue, 25 Mar 2025 at 12:16, Christian Loehle <christian.loehle@arm.com> wrote:
>>
>> On 3/2/25 21:05, Vincent Guittot wrote:
>>> EAS is based on wakeup events to efficiently place tasks on the system, but
>>> there are cases where a task doesn't have wakeup events anymore or at a far
>>> too low pace. For such situation, we can take advantage of the task being
>>> put back in the enqueued list to check if it should be pushed on another
>>> CPU. When the task is alone on the CPU, it's never put back in the enqueued
>>> list; In this special case, we use the tick to run the check.
>>>
>>> Wake up events remain the main way to migrate tasks but we now detect
>>> situation where a task is stuck on a CPU by checking that its utilization
>>> is larger than the max available compute capacity (max cpu capacity or
>>> uclamp max setting)
>>>
>>> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
>>> ---
>>>  kernel/sched/fair.c  | 220 +++++++++++++++++++++++++++++++++++++++++++
>>>  kernel/sched/sched.h |   2 +
>>>  2 files changed, 222 insertions(+)
>>>
>>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>> index a9b97bbc085f..c3e383b86808 100644
>>> --- a/kernel/sched/fair.c
>>> +++ b/kernel/sched/fair.c
>>> @@ -7051,6 +7051,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>>>       hrtick_update(rq);
>>>  }
>>>
>>> +static void fair_remove_pushable_task(struct rq *rq, struct task_struct *p);
>>>  static void set_next_buddy(struct sched_entity *se);
>>>
>>>  /*
>>> @@ -7081,6 +7082,8 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
>>>               h_nr_idle = task_has_idle_policy(p);
>>>               if (task_sleep || task_delayed || !se->sched_delayed)
>>>                       h_nr_runnable = 1;
>>> +
>>> +             fair_remove_pushable_task(rq, p);
>>>       } else {
>>>               cfs_rq = group_cfs_rq(se);
>>>               slice = cfs_rq_min_slice(cfs_rq);
>>> @@ -8589,6 +8592,197 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>>>       return target;
>>>  }
>>>
>>> +static inline bool task_stuck_on_cpu(struct task_struct *p, int cpu)
>>> +{
>>> +     unsigned long max_capa, util;
>>> +
>>> +     max_capa = min(get_actual_cpu_capacity(cpu),
>>> +                    uclamp_eff_value(p, UCLAMP_MAX));
>>> +     util = max(task_util_est(p), task_runnable(p));
>>> +
>>> +     /*
>>> +      * Return true only if the task might not sleep/wakeup because of a low
>>> +      * compute capacity. Tasks, which wake up regularly, will be handled by
>>> +      * feec().
>>> +      */
>>> +     return (util > max_capa);
>>> +}
>>> +
>>> +static inline bool sched_energy_push_task(struct task_struct *p, struct rq *rq)
>>> +{
>>> +     if (p->nr_cpus_allowed == 1)
>>> +             return false;
>>> +
>>> +     if (is_rd_overutilized(rq->rd))
>>> +             return false;
>>> +
>>> +     if (task_stuck_on_cpu(p, cpu_of(rq)))
>>> +             return true;
>>> +
>>> +     return false;
>>> +}
>>> +
>>> +static int active_load_balance_cpu_stop(void *data);
>>> +
>>> +static inline void check_pushable_task(struct task_struct *p, struct rq *rq)
>>> +{
>>> +     int new_cpu, cpu = cpu_of(rq);
>>> +
>>> +     if (!sched_energy_enabled())
>>> +             return;
>>> +
>>> +     if (WARN_ON(!p))
>>> +             return;
>>> +
>>> +     if (WARN_ON(!task_current(rq, p)))
>>> +             return;
>>> +
>>> +     if (is_migration_disabled(p))
>>> +             return;
>>> +
>>> +     /* If there are several task, wait for being put back */
>>> +     if (rq->nr_running > 1)
>>> +             return;
>>> +
>>> +     if (!sched_energy_push_task(p, rq))
>>> +             return;
>>> +
>>> +     new_cpu = find_energy_efficient_cpu(p, cpu);
>>> +
>>> +     if (new_cpu == cpu)
>>> +             return;
>>> +
>>> +     /*
>>> +      * ->active_balance synchronizes accesses to
>>> +      * ->active_balance_work.  Once set, it's cleared
>>> +      * only after active load balance is finished.
>>> +      */
>>> +     if (!rq->active_balance) {
>>> +             rq->active_balance = 1;
>>> +             rq->push_cpu = new_cpu;
>>> +     } else
>>> +             return;
>>> +
>>> +     raw_spin_rq_unlock(rq);
>>> +     stop_one_cpu_nowait(cpu,
>>> +             active_load_balance_cpu_stop, rq,
>>> +             &rq->active_balance_work);
>>> +     raw_spin_rq_lock(rq);
>>> +}
>>> +
>>> +static inline int has_pushable_tasks(struct rq *rq)
>>> +{
>>> +     return !plist_head_empty(&rq->cfs.pushable_tasks);
>>> +}
>>> +
>>> +static struct task_struct *pick_next_pushable_fair_task(struct rq *rq)
>>> +{
>>> +     struct task_struct *p;
>>> +
>>> +     if (!has_pushable_tasks(rq))
>>> +             return NULL;
>>> +
>>> +     p = plist_first_entry(&rq->cfs.pushable_tasks,
>>> +                           struct task_struct, pushable_tasks);
>>> +
>>> +     WARN_ON_ONCE(rq->cpu != task_cpu(p));
>>> +     WARN_ON_ONCE(task_current(rq, p));
>>> +     WARN_ON_ONCE(p->nr_cpus_allowed <= 1);
>>> +     WARN_ON_ONCE(!task_on_rq_queued(p));
>>> +
>>> +     /*
>>> +      * Remove task from the pushable list as we try only once after that
>>> +      * the task has been put back in enqueued list.
>>> +      */
>>> +     plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
>>> +
>>> +     return p;
>>> +}
>>> +
>>> +/*
>>> + * See if the non running fair tasks on this rq can be sent on other CPUs
>>> + * that fits better with their profile.
>>> + */
>>> +static bool push_fair_task(struct rq *rq)
>>> +{
>>> +     struct task_struct *next_task;
>>> +     int prev_cpu, new_cpu;
>>> +     struct rq *new_rq;
>>> +
>>> +     next_task = pick_next_pushable_fair_task(rq);
>>> +     if (!next_task)
>>> +             return false;
>>> +
>>> +     if (is_migration_disabled(next_task))
>>> +             return true;
>>> +
>>> +     /* We might release rq lock */
>>> +     get_task_struct(next_task);
>>> +
>>> +     prev_cpu = rq->cpu;
>>> +
>>> +     new_cpu = find_energy_efficient_cpu(next_task, prev_cpu);
>>
>> We aren't gating this on a overutilized check for both call sites of this patch
> 
> The overutilized check has been done when adding the task to the list.
> 

Right, but that was earlier?
Shouldn't we just clear the list on OU since lb is now active again?
(I do understand that this impacts the effectiveness here, but it seems
the correct thing to do?)
