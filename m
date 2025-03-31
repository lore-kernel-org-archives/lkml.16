Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CDE1C84CB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408277; cv=none; b=c+HNE+Lxv54YTgrjn2ZBHOWoItwiKJWgpWyk5Lj5Mbn+RrjR2M2KS+3LL10RSVfmWJj8BL4JCn7b3Qm/OSFopBOa6nH07Y/sWP/T2fzgdqsECCWeY/qeKCG25sLM+JCtlVRoeH5RetRSFkL+pQw1Gcj+EI49r83oz7A9YgkP7vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408277; c=relaxed/simple;
	bh=+/vznK6J/kXyee2N3VyPquK4W5Utr75HIF35H0LowLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sudgsOirb3hfoRLP6WPwFKqvm47YEjdCxnBOV27kZgQnsBCE+kJUOe/7ffY404AHcJXzK+bpgzX5gxZtWtmZnvJOBGfY1yRxRpgb2WXkZUfXPUauTXsDnSrUq+FdqXOivcJYsvUiNxpC5InGN5obXNzJKBePiIBc85mqjyBW90w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=bfnBblKW; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="bfnBblKW"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2241c95619eso10823325ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743408274; x=1744013074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1YfqM5q3N6JrT2tmqL361gwa7N8KSXnPwBvK7H0Jdg=;
        b=bfnBblKWozeoq/xYXqkV2wARZRiFZ3lee+ypeEswhww2H8jVSWAHqoxYnu8tL09JnS
         gAPC1Dfgah4z5t7zmAkUSTtUZccuVnHBMUz60ObAmpYO6sIg3W2EDIVGCGEReY8vpfMk
         qsdlStanKmJv8mZnaGRPnMph8hpxlE0XCTcODcO6+WpE+VqBwgPNOMtI8xy+a/zIWhNj
         1VzVV31E1HPEFXp60VOuCzM4sYyBB0SJ/il+IjoplSovG2AL4TdrFh8IVTVD97+QexW/
         5Wj8y3zCSM3J70qe9bmXyrEZhezaQvjrTrzuU+McmWA34HWBp6cbbRJN4uNPVR01CgK7
         0Bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743408274; x=1744013074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1YfqM5q3N6JrT2tmqL361gwa7N8KSXnPwBvK7H0Jdg=;
        b=hWhhAYNb0PHDLlEmRyvbiO7CAitdwJiJLzIXIvGbqSoQwT2U5neuJwgXTNKxLLiD84
         o1yiJNvISfc/dKfbs+i7H91cSVX2RFn6f3DuGkrDOvndQ1X1yR/HA6BRoCEgjJpLhXYs
         0NoAeyTZKYQQXhh9baauSza6AAGNFKM+ZEhxyTPFTAMgxbnSPQ0pLDjwOEUgONdBtrl/
         Kn/7DZG5VVSw03I5YfolxV1wUgRRrFwWEayoweei9akCS3dgduIDuFAo+GrVNwvx6CwB
         hpvZwEmy3sIsJMehY/lQ24EOulNukVXVM4c0yyqOGgmXOT/M9O5Vbh+muuS3OgjjSqLX
         VSuw==
X-Forwarded-Encrypted: i=1; AJvYcCXnI51jgWuN7QymapS2ntzkkWHv08APONlI2ZFQV9ymDShxf3GSzMBq6rWXWyCmQLKSR2khGkosAgYyI/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWMZJSGSrW5QqQrb24pnyvQeEdPWX8/XCPMQm16h9eLcY4i9yF
	8i/c0VfRj2dmPlW0LAid/ZXtcFETZ9yXOZ207nCoDBY0o4ZeKWQk9P1khloESRU=
X-Gm-Gg: ASbGncs9UASyWyQpyB6i8fvyhuUDo1jZ6eHA+9V7M3r/BHdzRHY+24bW/gZj1uvbK1B
	XuuirWI5plkLfD9lFHpnTBeZBiahYqmnz88N+86DDKW49Fw1vYpz4lyYwacPyxB/kXopXwcUtds
	MK/G5mNuW2RX0gvI/Ceb1/bsyUFxwbS9OZLcMetbYWyCcL4V1HvGv/hXmS1znorWrKsLCdC8Ep+
	KIewcfLkkvx6CugOsPBn+VaF+7c0ZPLl4+URWZbrx3DAAyQSDQjkuPcHzra/fXm67Oi5oWKSZFz
	Qz21Orfq5irEoLiPxsz5XspqWFgrcuc85ZIeLksZHNWi8/D1kda/ZXtwHmTR3OSp0Q==
X-Google-Smtp-Source: AGHT+IE8Dz1Hvihho+GoQeM4qvZgwYsVZ+Tn2AObZx3XKfeddt3Tk2h9VbUOePJL4iQ8wePF7yVMOQ==
X-Received: by 2002:a17:902:f70a:b0:224:18fd:6e09 with SMTP id d9443c01a7336-2292f898c11mr55849735ad.0.1743408274266;
        Mon, 31 Mar 2025 01:04:34 -0700 (PDT)
Received: from [10.68.121.43] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0d37sm64255955ad.91.2025.03.31.01.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 01:04:33 -0700 (PDT)
Message-ID: <ec7bc197-8fde-4ccd-a02a-1effec5ac898@bytedance.com>
Date: Mon, 31 Mar 2025 16:04:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [RFC][PATCH] sched: Cache aware load-balancing
Content-Language: en-US
To: "Chen, Yu C" <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>
Cc: juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
 tim.c.chen@linux.intel.com, tglx@linutronix.de, mingo@kernel.org,
 gautham.shenoy@amd.com, kprateek.nayak@amd.com, yu.chen.surf@foxmail.com
References: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
 <93907416-dab4-4a3a-82b6-e37e4ee334db@bytedance.com>
 <143a63f6-3e1b-42fd-a4c8-8d2f6b7d3583@intel.com>
 <f5f056f1-a698-4660-87f0-63f5753c1679@bytedance.com>
 <1e73a88a-0d49-4ac2-a64e-6d5ff2d7ba19@intel.com>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <1e73a88a-0d49-4ac2-a64e-6d5ff2d7ba19@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/31/25 1:25 PM, Chen, Yu C wrote:
> On 3/30/2025 4:46 PM, Abel Wu wrote:
>> On 3/29/25 11:06 PM, Chen, Yu C wrote:
>>> On 3/28/2025 9:57 PM, Abel Wu wrote:
>>>>
>>>> IIUC this work updates stats for the whole mm and seems not
>>>> necessary for each task of the process to repeat same thing.
>>>> Hence would be better move this work to mm_struct.
>>>>
>>>
>>> It seems that the per task cache_work is used to avoid
>>> duplicated task_cache_work() in task->task_works queue, see
>>> task_tick_cache()'s check
>>>   if (work->next == work)
>>>      task_work_add()
>>
>> Yes, this check avoids task_works being corrupt caused by double
>> adding the work, no matter this work is task- or mm-specific. So
>> if moving to mm_struct, this check become false once any task takes
>> this work, and other tasks can not do the same job until that task
>> finishes by setting work->next to work.
> 
> I see. What I previous thought was that, checking work->next == work
> can not avoid two tasks doing the same statistic calculation
> in task_cache_work(), because work->next = work is invoked
> at the beginning of task_cache_work() - maybe need to put
> this at the end of task_cache_work()?

LGTM.

> 
>>
>> BTW, moving to mm_struct will save some memory footprint?
>> Yes, this would help.
> 
>>>
>>> To do exclusive task_cache_work() and only allow 1 task
>>> in the process to do the calculation, maybe introducing similar mechanism like task_numa_work(), something like this:
>>>
>>> if (!try_cmpxchg(&mm->cache_next_scan, &calc, next_scan))
>>>      return;
>>
>> Yes, this looks good to me. While Peter used epoch to regulate
>> the frequency of this work, which is a ligher way but allows some
>> inaccuracy which is further fixed by a double check after holding
>> mm->mm_sched_lock.
>>
>> I plan to use trylock on mm->mm_sched_lock first. If trylock fails
>> then someone is adding the work and we can skip early.
>>
>> static void task_tick_cache(struct rq *rq, struct task_struct *p)
>> {
>>      ...
>>
>>      if (mm->mm_sched_epoch == rq->cpu_epoch)
>>          return;
>>
>>      guard(raw_spinlock)(&mm->mm_sched_lock);  <-- trylock
>>
>>      ...
>> }
>>
> 
> This lock is intended to protect that no two tasks enqueuing the same per-mm_struct work at the same time, right? And for the task work execution phase, maybe we also need to put work->next = work at the end of task_cache_work()?

Lock here is needed to protect adding work, what I meant is to return
early if trylock fails, since there is someone else being the owner to
do the work.

> 
>>>
>>>>> +
>>>>> +static inline
>>>>> +void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
>>>>> +{
>>>>> +    struct mm_struct *mm = p->mm;
>>>>> +    struct mm_sched *pcpu_sched;
>>>>> +    unsigned long epoch;
>>>>> +
>>>>> +    /*
>>>>> +     * init_task and kthreads don't be having no mm
>>>>> +     */
>>>>> +    if (!mm || !mm->pcpu_sched)
>>>>> +        return;
>>>>> +
>>>>> +    pcpu_sched = this_cpu_ptr(p->mm->pcpu_sched);
>>>>> +
>>>>> +    scoped_guard (raw_spinlock, &rq->cpu_epoch_lock) {
>>>>> +        __update_mm_sched(rq, pcpu_sched);
>>>>> +        pcpu_sched->runtime += delta_exec;
>>>>> +        rq->cpu_runtime += delta_exec;
>>>>> +        epoch = rq->cpu_epoch;
>>>>> +    }
>>>>> +
>>>>> +    /*
>>>>> +     * If this task hasn't hit task_cache_work() for a while, invalidate
>>>>> +     * it's preferred state.
>>>>> +     */
>>>>> +    if (epoch - READ_ONCE(mm->mm_sched_epoch) > EPOCH_OLD) {
>>>>> +        mm->mm_sched_cpu = -1;
>>>>> +        pcpu_sched->occ = -1;
>>>>> +    }
>>>>
>>>> This seems too late. account_mm_sched() is called when p is runnable,
>>>> so if the whole process sleeps for a while before woken up, ttwu will
>>>> take the out-dated value.
>>>>
>>>
>>> Yup, there seems to be a problem. It would be better if we could reset the mm_sched_cpu to -1 after the last thread of the process falls asleep. But considering that all threads are sleeping, even if the ttwu tries to enqueue the first newly-woken thread to an out-dated idle mm_sched_cpu, does it matter? I guess it would not be a serious problem, because all the cache of the process might have been evicted due to long sleep.
>>
>> Yes, it seems not a big deal if mm_sched_cpu not overwrites any better
>> choice.
>>
>>>
>>>>> +
>>>>> +static void task_cache_work(struct callback_head *work)
>>>>> +{
>>>>> +    struct task_struct *p = current;
>>>>> +    struct mm_struct *mm = p->mm;
>>>>> +    unsigned long m_a_occ = 0;
>>>>> +    int cpu, m_a_cpu = -1;
>>>>> +    cpumask_var_t cpus;
>>>>> +
>>>>> +    WARN_ON_ONCE(work != &p->cache_work);
>>>>> +
>>>>> +    work->next = work;
>>>>> +
>>>>> +    if (p->flags & PF_EXITING)
>>>>> +        return;
>>>>> +
>>>>> +    if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
>>>>> +        return;
>>>>> +
>>>>> +    scoped_guard (cpus_read_lock) {
>>>>> +        cpumask_copy(cpus, cpu_online_mask);
>>>>> +
>>>>> +        for_each_cpu(cpu, cpus) {
>>>>> +            /* XXX sched_cluster_active */
>>>>> +            struct sched_domain *sd = per_cpu(sd_llc, cpu);
>>>>> +            unsigned long occ, m_occ = 0, a_occ = 0;
>>>>> +            int m_cpu = -1, nr = 0, i;
>>>>> +
>>>>> +            for_each_cpu(i, sched_domain_span(sd)) {
>>>>> +                occ = fraction_mm_sched(cpu_rq(i),
>>>>> +                            per_cpu_ptr(mm->pcpu_sched, i));
>>>>> +                a_occ += occ;
>>>>> +                if (occ > m_occ) {
>>>>> +                    m_occ = occ;
>>>>> +                    m_cpu = i;
>>>>> +                }
>>>>
>>>> It would be possible to cause task stacking on this hint cpu
>>>> due to its less frequently updated compared to wakeup.
>>>>
>>>
>>> The SIS would overwrite the prev CPU with this hint(cached) CPU, and use that cached CPU as a hint to search for an idle CPU, so ideally it should not cause task stacking. But there is a race condition that multiple wakeup path might find the same cached "idle" CPU and queue wakees on it, this usually happens when there is frequent context switch(wakeup)+short duration tasks.
>>
>> Ideally mm_sched_cpu is updated every EPOCH_PERIOD which is default
>> to 10ms, so I'm afraid the race window is not small.
>>
> OK, understood. My thought was that, if many wakers start searching for idle CPU from the same mm_sched_cpu(because mm_sched_cpu has not been changed for 10ms), if waker1 succeeds to enqueue a long-running wakee1 on that mm_sched_cpu, other wakers might stop choosing that mm_sched_cpu in SIS. But if all the wakees are short-duration ones and doing frequent context switches, many wakers would think that they find an "idle" mm_sched_cpu, but actually it is heavily contended by many wakers.

OK, seems I misunderstood the race condition you previously mentioned.
Yes, it's not clear yet whether mm_sched_cpu would cause stacking or not,
I will do some more test before further discussion.

Thanks,
	Abel

