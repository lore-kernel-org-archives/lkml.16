Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474DA433A4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743324392; cv=none; b=sz5C97NtspHAcXrlzk3KK7wTZ7iPy2TjCcpQ0HZb7IaUGUH1+w4zjVg5eS22GtQFW+GSM4tIubYUnv0ZYzJCJqD2qkXkvVGWpkEM6flc4WJJA83zR3g965L26Q44QtXHg2kV3MfK94qJ71NStCFEqr06NOlpdiJdTFaiXLmMp5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743324392; c=relaxed/simple;
	bh=nB5zVyoWkKtSMWyrB2qF1NlwiT86Km+y0OY6hSECnvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sdmj5e6j6aUPyy5z4nrSWMUxkMsck42/Vym27+i6/M1zfIMqYeezPVK3QQ8ELhsEZeC6ILRS6FIjwB5w8UTgXMxG511IJ3t6Zr4POt7Q/X81urPiaMDIi7pyW2SVooRfULtBSc9X8oUXVO4UzeE6qJZB2+6T2u3rekoyznZ8POg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=a/M8mE5p; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="a/M8mE5p"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224104a9230so8424895ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 01:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743324389; x=1743929189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OP7wSVRxqZprZiQ3YXaTRHM9F6vanGJpiTcjAfY0K+g=;
        b=a/M8mE5pEPEZpi4twMo/d218cb2ErAW/gbhIxO1Urx1FeDjC7TKKlr0MyONT3hPSU/
         M9sS6Kgedg7cmiT/lEWjY+HO++s1id2MlFecCjWnionhPnK/7n+OBcaHL9aSNXIJ7QxR
         B8xjX6ZNm+K/0zegeSjn92cNrDWBKdd599t4fLyAyuG0GtIJHBElSgles77rzh28YPmt
         xEaG0ECqpPhb02YzxwHyUGi66XD5jG7YCd8R0Hy5IjRQ7W4wucR0xibjKrt2fLztO2bj
         +rZvJzIQBzd69R6Iw6tG8GFV4CD9p0Cc9g7KzYhZTADAzhmRTrjNlYIsYuQ07Pd441xd
         D1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743324389; x=1743929189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OP7wSVRxqZprZiQ3YXaTRHM9F6vanGJpiTcjAfY0K+g=;
        b=aazRh6Rd7gThiJegq8aDhWhepPUTyFr/mB21XL+E7TKTtYZbfu6+og0C9TLD3tzc+3
         LlhVAMY9RlPbPiSd2yd2myHxrJyT15S1JUMyvPCJMn4WHx4IyeJxkTnAkoJMrKRHqbGf
         vegC+zuK/pasKmb7AnNjHZ8R5GYqPBZPfuF8qQnUigkVvvX1YRbOSxK9fI4TG8qgLI9y
         6dGCImAf5vSSNQC8oo3bBOTROEUFqieGyzqvc+mHWhA6oVOK2IEfmTsTxeU2/GgiDAdF
         8FpEpC6QY0e5vaNqan59yi10iRXRDxoEVFQiV1ca1Yb6MPZXyqNkW8vEiuBG56Pwi49Z
         TtnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhr3ZlszBIz0X4H0mjRU+9vDhQPshPSxpbZrWsAMzUie5MetTD5nPXIVehy2efia6MRcEwWrwz0U8PCl0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx42CjM6Z/Za0raRoPhtyQcE5VuHb2mKHPSVumaCITH3ULeG/8D
	AcrL2gnjKKddCPPK4JuAJcVMnlwVw56/jfgjJ+df25qb71Dwgxg4UCGWqVKdnvn32fbfX2YbIlD
	n
X-Gm-Gg: ASbGncvmdtgw4zxPiFwn5wYn8RjvvFQ7i9uc2rCbJnErntu+ARoaTuA/zfgEK8sMRDE
	AolpSchZGPcFGhP5sQlVMe6ZoM9sCqFp+opUTPB6TwxaZILPJmyuHiJi1mdAelyHdpnrYxY77o7
	yP/6DcR2WNjnudSEtkphZsRkp4I2Sw0/jp+O+xeU+SlouQb3jEeSyn+JsS30vZjjipCZN0e+rr8
	b3Q96JSxz4h1pO5+faI2IfSV68mvvFX6778GgQNiTiLOVX06ROWtSAK5PdU9MjBCnY19MzamtBL
	C4nGvLN61Hx4znNK48KtzJHiqbR5laZ/zubaDk6LhbBN6mTtTfQ9Of9mkMKmIzHk4XBdb1DRJg=
	=
X-Google-Smtp-Source: AGHT+IESerX/3Q+xCrZX3JL51WpJGwixgjurQesFsCydWjwPEC6uzOqOPSIKSgLlCTMS8yrZcYmSsg==
X-Received: by 2002:a17:902:ef09:b0:216:3dd1:5460 with SMTP id d9443c01a7336-2292f944d43mr30195315ad.2.1743324389345;
        Sun, 30 Mar 2025 01:46:29 -0700 (PDT)
Received: from [10.254.231.96] ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971068581sm4810804b3a.114.2025.03.30.01.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 01:46:28 -0700 (PDT)
Message-ID: <f5f056f1-a698-4660-87f0-63f5753c1679@bytedance.com>
Date: Sun, 30 Mar 2025 16:46:20 +0800
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
 gautham.shenoy@amd.com, kprateek.nayak@amd.com
References: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
 <93907416-dab4-4a3a-82b6-e37e4ee334db@bytedance.com>
 <143a63f6-3e1b-42fd-a4c8-8d2f6b7d3583@intel.com>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <143a63f6-3e1b-42fd-a4c8-8d2f6b7d3583@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/29/25 11:06 PM, Chen, Yu C wrote:
> On 3/28/2025 9:57 PM, Abel Wu wrote:
>>
>> IIUC this work updates stats for the whole mm and seems not
>> necessary for each task of the process to repeat same thing.
>> Hence would be better move this work to mm_struct.
>>
> 
> It seems that the per task cache_work is used to avoid
> duplicated task_cache_work() in task->task_works queue, see
> task_tick_cache()'s check
>   if (work->next == work)
>      task_work_add()

Yes, this check avoids task_works being corrupt caused by double
adding the work, no matter this work is task- or mm-specific. So
if moving to mm_struct, this check become false once any task takes
this work, and other tasks can not do the same job until that task
finishes by setting work->next to work.

BTW, moving to mm_struct will save some memory footprint?

> 
> To do exclusive task_cache_work() and only allow 1 task
> in the process to do the calculation, maybe introducing similar mechanism like task_numa_work(), something like this:
> 
> if (!try_cmpxchg(&mm->cache_next_scan, &calc, next_scan))
>      return;

Yes, this looks good to me. While Peter used epoch to regulate
the frequency of this work, which is a ligher way but allows some
inaccuracy which is further fixed by a double check after holding
mm->mm_sched_lock.

I plan to use trylock on mm->mm_sched_lock first. If trylock fails
then someone is adding the work and we can skip early.

static void task_tick_cache(struct rq *rq, struct task_struct *p)
{
	...

	if (mm->mm_sched_epoch == rq->cpu_epoch)
		return;

	guard(raw_spinlock)(&mm->mm_sched_lock);  <-- trylock

	...
}

> 
>>> +
>>> +static inline
>>> +void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
>>> +{
>>> +    struct mm_struct *mm = p->mm;
>>> +    struct mm_sched *pcpu_sched;
>>> +    unsigned long epoch;
>>> +
>>> +    /*
>>> +     * init_task and kthreads don't be having no mm
>>> +     */
>>> +    if (!mm || !mm->pcpu_sched)
>>> +        return;
>>> +
>>> +    pcpu_sched = this_cpu_ptr(p->mm->pcpu_sched);
>>> +
>>> +    scoped_guard (raw_spinlock, &rq->cpu_epoch_lock) {
>>> +        __update_mm_sched(rq, pcpu_sched);
>>> +        pcpu_sched->runtime += delta_exec;
>>> +        rq->cpu_runtime += delta_exec;
>>> +        epoch = rq->cpu_epoch;
>>> +    }
>>> +
>>> +    /*
>>> +     * If this task hasn't hit task_cache_work() for a while, invalidate
>>> +     * it's preferred state.
>>> +     */
>>> +    if (epoch - READ_ONCE(mm->mm_sched_epoch) > EPOCH_OLD) {
>>> +        mm->mm_sched_cpu = -1;
>>> +        pcpu_sched->occ = -1;
>>> +    }
>>
>> This seems too late. account_mm_sched() is called when p is runnable,
>> so if the whole process sleeps for a while before woken up, ttwu will
>> take the out-dated value.
>>
> 
> Yup, there seems to be a problem. It would be better if we could reset the mm_sched_cpu to -1 after the last thread of the process falls asleep. But considering that all threads are sleeping, even if the ttwu tries to enqueue the first newly-woken thread to an out-dated idle mm_sched_cpu, does it matter? I guess it would not be a serious problem, because all the cache of the process might have been evicted due to long sleep.

Yes, it seems not a big deal if mm_sched_cpu not overwrites any better
choice.

> 
>>> +
>>> +static void task_cache_work(struct callback_head *work)
>>> +{
>>> +    struct task_struct *p = current;
>>> +    struct mm_struct *mm = p->mm;
>>> +    unsigned long m_a_occ = 0;
>>> +    int cpu, m_a_cpu = -1;
>>> +    cpumask_var_t cpus;
>>> +
>>> +    WARN_ON_ONCE(work != &p->cache_work);
>>> +
>>> +    work->next = work;
>>> +
>>> +    if (p->flags & PF_EXITING)
>>> +        return;
>>> +
>>> +    if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
>>> +        return;
>>> +
>>> +    scoped_guard (cpus_read_lock) {
>>> +        cpumask_copy(cpus, cpu_online_mask);
>>> +
>>> +        for_each_cpu(cpu, cpus) {
>>> +            /* XXX sched_cluster_active */
>>> +            struct sched_domain *sd = per_cpu(sd_llc, cpu);
>>> +            unsigned long occ, m_occ = 0, a_occ = 0;
>>> +            int m_cpu = -1, nr = 0, i;
>>> +
>>> +            for_each_cpu(i, sched_domain_span(sd)) {
>>> +                occ = fraction_mm_sched(cpu_rq(i),
>>> +                            per_cpu_ptr(mm->pcpu_sched, i));
>>> +                a_occ += occ;
>>> +                if (occ > m_occ) {
>>> +                    m_occ = occ;
>>> +                    m_cpu = i;
>>> +                }
>>
>> It would be possible to cause task stacking on this hint cpu
>> due to its less frequently updated compared to wakeup.
>>
> 
> The SIS would overwrite the prev CPU with this hint(cached) CPU, and use that cached CPU as a hint to search for an idle CPU, so ideally it should not cause task stacking. But there is a race condition that multiple wakeup path might find the same cached "idle" CPU and queue wakees on it, this usually happens when there is frequent context switch(wakeup)+short duration tasks.

Ideally mm_sched_cpu is updated every EPOCH_PERIOD which is default
to 10ms, so I'm afraid the race window is not small.

> 
> 
>> And although the occupancy heuristic looks reasonable, IMHO it
>> doesn't make much sense to compare between cpus as they share
>> the LLC, and a non-hint cpu with warmer L1/L2$ in same LLC with
>> the hint cpu seems more preferred.
>>
>> Do you think it's appropriate or not to only hint on the hottest
>> LLC? So the tasks can hopefully wokenup on 'right' LLC on the
>> premise that wouldn't cause much imbalance between LLCs.
>>
>  > I will do some tests and return with more feedback.
>  >
> 
> Find an idle CPU in the wakee's hostest LLC seems to be plausible.
> The benchmark data might indicate a proper way.
> 
> thanks,
> Chenyu
> 
> 

