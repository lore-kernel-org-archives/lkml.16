Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA4CBA33
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660502; cv=none; b=cBcth4lvcmBt0foO+1oOKJfH2xixAH2JIuOyYTUm8lKoYredGDR/Z6TFN1Y5qvk0FUUltpw6j2G5eR/CdGMJROd8iHZlL5uOpVrb3GDOCzqIrzzv0nsbfyV5Zvtq1JjKEwfV1jJbpn58cJadlEjxijb6CTgBI4+lyg0jjYCaLvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660502; c=relaxed/simple;
	bh=E1nDKj8jCcBuGU0+RN0eGo6+RM83HWFtk/KOwW/eTLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdWA0eqf/Twe5svdmQncvlxrDjcg+LGbdW5Oebjb9KsEQZkoV23Y+DbdZ+puosZ/xEd3s9tQBR2G+IfH+DPijAMHJztauD1tSxFtEm5y6KiNE7HZTHua1zU3b5cLsXXSRtLJEuKjNXvRloPTHkEo10A+J6kjOkt+K8soI9If10A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UACx4W6Z; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UACx4W6Z"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-742c3d06de3so4449456b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 23:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750660500; x=1751265300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGTQoL0b8fZGdYhoE8eCwT5XBmS5tSGNhTPcVeD72bQ=;
        b=UACx4W6ZrX94LUTSiXRI0r/sY3bJvZE1IOUVKRu0tPoIsrQx6KjUF3cuM7oPjsKaWY
         Y/xQKhtb7zw5MrqZ7SOOeKiPnoltv5L8g4Rlg3lI9+/UCr/yaYSR8Vzuhwu1cmzTAznM
         CteWWiN7SZZS+lAIiKih5hDuYW/DhJGjYHmZ0rOZA5ObP8GIoS8gnWpisx1b9wmBPXhg
         j8cX2NWjAT/5vkbi1+rBLw2czEa2LBq3PN5t2raBJsCWy5cQLE6OJlpFJFBPxrzMY7w/
         RFA466oEk/fTMk17GUvbWoau5VVGecr8dUdR9aZ6guAKY7wKJ3HQWtO9EYYQQlLuAorC
         BWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750660500; x=1751265300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGTQoL0b8fZGdYhoE8eCwT5XBmS5tSGNhTPcVeD72bQ=;
        b=OFtApUbTmvbhPUjc3hDt0zE2Ng4IxYU2qnfcSvYxksuAyAswTr+HL+CTzDZA8kEQKO
         tpM+IpIuwHQVQ9zFZhb76FepJIT/D834Vcel6ylWv2OtonQYAuNGPhOfsDz6XjT2da9g
         lXMJa5C7Hf3ob1s7WhYgtOcU15O0vf17X5xN0pzswExq7n8VJZK4cjhKt8S1Ed7SEsrb
         /HN8VW7hd8sj2bkyWfZQT1vt6wmpVD5KOScCUmQJpV3Rz8mBFa6WT5CYuplPSDwotmvq
         aTHGF4pSxrHIBkoUWn7hQKhRvlGK1nS3CvG5Oezpt9qhii33cPDu96HknAve07lObNFx
         CYdw==
X-Forwarded-Encrypted: i=1; AJvYcCWtRFf6Umn7rO52Xl6Q9tA3HzMV675vR+tnkaYyhQaguHHKJ2tDazI4m2j/2WG6N5aCcpp5NvKVAIUuDNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6AulPBzWbyPqLP6uYNBwtupH44pA0Lk47qzIZ1LnD+94A0zHk
	KtbG1XDRBnGDUEDMZbcQjwd4wzZmPjAWmNrCs7bqx1NRVnQgJIpfaBbu9FLsYn8pFa45Bw==
X-Gm-Gg: ASbGncsR/wgVfyoGxUthzHgxBDvoIHiUBe5A8f5LGw/Zoo4E2WLMWz4xnlTbyoK0wop
	/2W/Hbr1TOn/jcfUvV46bsXDDuxnmoPGuK1EXTzZC0f2PswimtIBlhVqH5n69AolEca2WWKPGJA
	ANBxOL2ykUtjjqAp8+AoslHX9VSYyCXwfbDIJejJAfhbUNH8a5YCz0w4iYIkdGEQAvD8D9oNhzU
	SgOV6zVfqvwTWa/ce6T6r8FO4ftEi8veYgvGNZDkjdfDuPAjNMumEyU2wwU3wCzhxdHXljE0H5H
	TS+ARtcovYfURHFbMfXvUMw2uzdsc+eT67REnCW1eyepJeXHHukf
X-Google-Smtp-Source: AGHT+IHWkkSsTn4Mklexb7qN/esn+4doMzCUDeU84DS/EwmRq2SNK0nasRtTFym9+UZVKcdj1P2u6w==
X-Received: by 2002:a05:6a21:9006:b0:1ee:ef0b:7bf7 with SMTP id adf61e73a8af0-22026f1580amr17374782637.19.1750660500010;
        Sun, 22 Jun 2025 23:35:00 -0700 (PDT)
Received: from [192.168.255.10] ([113.108.77.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f126cc0asm7136584a12.76.2025.06.22.23.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 23:34:59 -0700 (PDT)
Message-ID: <32f82969-420e-413a-99f9-b631ba894d20@gmail.com>
Date: Mon, 23 Jun 2025 14:34:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/stats: TASK_IDLE task bypass the block_starts time
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, linux-kernel@vger.kernel.org,
 Olice Zou <olicezou@tencent.com>
References: <20250620031450.581290-1-olicezou@tencent.com>
 <20250620085511.GQ1613376@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: zoucao <zoucaox@gmail.com>
In-Reply-To: <20250620085511.GQ1613376@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/20/25 16:55, Peter Zijlstra wrote:
> On Fri, Jun 20, 2025 at 11:14:50AM +0800, Olice Zou wrote:
>> For TASK_IDLE task, we not should record the block_starts, it is
>> not real TASK_UNINTERRUPTIBLE task.
> Why, I mean it is still blocked, right?
Thank you for your reply.

I find this problem when  running test case for intense lock contention, 
it has ​​contention among thousands of rwsem/mutex locks​,

them are real blocked task, but when idle machine, it also  has so much 
of blocked  kworker thread to be found, but the machine is idle.

the TASK_IDLE not a blocked task, it more like sleeping task as follow:


int kernel/workqueue.c

2690 static int worker_thread(void *__worker)
2691 {

    ...................

2758 sleep:

2759     /*
2760      * pool->lock is held and there's no work to process and no need to
2761      * manage, sleep.  Workers are woken up only while holding
2762      * pool->lock or from local cpu, so setting the current state
2763      * before releasing pool->lock is enough to prevent losing any
2764      * event.
2765      */
2766     worker_enter_idle(worker);
2767     __set_current_state(TASK_IDLE);    ---> this set task->__stat  
to TASK_IDLE,  it will cause the blocked measure, but it more like sleep 
task.
2768     raw_spin_unlock_irq(&pool->lock);
2769     schedule();
2770     goto woke_up;
2771 }


this  trace of sched:sched_stat_blocked is a good point to ​​measure the 
duration of lock contention​, it provide the blocked delta time.

after this patch,  it is beautiful to observe the lock competition in a 
easy way.


"

#!/bin/bpftrace
#include<linux/sched.h>

tracepoint:sched:sched_stat_blocked
{
     if (args->delay > 1000000) {
         @sa[args->pid] = 1;
     }
}

kprobe:finish_task_switch
{
     $task = (struct task_struct *) arg0;
     if (@sa[tid] ) {
         print(kstack());
         delete(@sa[tid]);
     }
}
"

catch the lock bocked delta task as follow:

dynamic_offline 8684678

         finish_task_switch+1
         schedule+108
         schedule_timeout+567
         wait_for_completion+149
         __wait_rcu_gp+316
         synchronize_rcu+237
         rcu_sync_enter+92
         percpu_down_write+41     --> this is real blocked task for 
percpu_rwsem wait.
         cgroup_procs_write_start+111
         __cgroup1_procs_write.constprop.0+91
         cgroup1_procs_write+23
         cgroup_file_write+137
         kernfs_fop_write_iter+304
         vfs_write+618
         ksys_write+107
         __x64_sys_write+30
         x64_sys_call+5679
         do_syscall_64+55
         entry_SYSCALL_64_after_hwframe+12


It is also useful the iowait task except TASK_IDLE.


Or put the task_idle task into  the sleep  of sched_statistics to measure?

>> It is easy to find this problem in a idle machine as followe:
>>
>> bpftrace -e 'tracepoint:sched:sched_stat_blocked {  \
>>      if (args->delay > 1000000)  \
>>      {  \
>> 	printf("%s %d\n", args->comm, args->delay);  \
>> 	print(kstack());  \
>>      }  \
>> }
>>
>> rcu_preempt 3881764
>>          __update_stats_enqueue_sleeper+604
>>          __update_stats_enqueue_sleeper+604
>>          enqueue_entity+1014
>>          enqueue_task_fair+156
>>          activate_task+109
>>          ttwu_do_activate+111
>>          try_to_wake_up+615
>>          wake_up_process+25
>>          process_timeout+22
>>          call_timer_fn+44
>>          run_timer_softirq+1100
>>          handle_softirqs+178
>>          irq_exit_rcu+113
>>          sysvec_apic_timer_interrupt+132
>>          asm_sysvec_apic_timer_interrupt+31
>>          pv_native_safe_halt+15
>>          arch_cpu_idle+13
>>          default_idle_call+48
>>          do_idle+516
>>          cpu_startup_entry+49
>>          start_secondary+280
>>          secondary_startup_64_no_verify+404
> Not sure what I'm looking at there. What is the problem?

Sorry, i lost the setup as follow:

     echo 1 > /proc/sys/kernel/sched_schedstat

we should enable the sched_schedstat sysctrl switch first

>> Signed-off-by: Olice Zou <olicezou@tencent.com>
>> ---
>>   kernel/sched/fair.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index a85539df75a5..e473e3244dda 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -1285,7 +1285,7 @@ update_stats_dequeue_fair(struct cfs_rq *cfs_rq, struct sched_entity *se, int fl
>>   		if (state & TASK_INTERRUPTIBLE)
>>   			__schedstat_set(tsk->stats.sleep_start,
>>   				      rq_clock(rq_of(cfs_rq)));
>> -		if (state & TASK_UNINTERRUPTIBLE)
>> +		if (state != TASK_IDLE && (state & TASK_UNINTERRUPTIBLE))
>>   			__schedstat_set(tsk->stats.block_start,
>>   				      rq_clock(rq_of(cfs_rq)));
>>   	}
>> -- 
>> 2.25.1
>>
