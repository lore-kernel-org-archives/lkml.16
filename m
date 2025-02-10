Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C9F1C7002
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183945; cv=none; b=PJUJDnaNGGSjv6uTCC3XdGIwqvjmJk1Ur3EFzE8HpVoTVD1tZcBi0TUqZkLN5654+16YKEMPL88CY5k69oNalA2GpE1GK1o16GTMiu3ENdjnk8nvZNg7aQnSOZ5a9A0YZ8UiVHdmDIVOPx9gFz2sPst255ippFQ3crot6aLQWc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183945; c=relaxed/simple;
	bh=LCklMKVzpMP3G/emohjq61TrMWaGlkYO5MTcW6Huibg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iBXdDB8Wxz2OhKrxxr/0YrzGFdPH06Cnn6Ou50p3lG8CbzWShWnjaXlfQzV7WBpG+biKDlZSSAYclqYIGj9anjBLqoFrs4Iywhq+rEaF9h1vODcWoNL5BhihgTNaGDx5PX0L8+f0GbpLXydhQ1eOOCnXEQCFejfUtpUNl52rEKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EA0E1BA8;
	Mon, 10 Feb 2025 02:39:24 -0800 (PST)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20E763F58B;
	Mon, 10 Feb 2025 02:39:00 -0800 (PST)
Message-ID: <1ca758c7-b6ab-4880-9cc7-217093a30bbb@arm.com>
Date: Mon, 10 Feb 2025 11:38:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG Report: Fork benchmark drop by 30% on aarch64
To: Hagar Hemdan <hagarhem@amazon.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, wuchi <wuchi.zero@gmail.com>,
 linux-kernel@vger.kernel.org, Mohamed@amazon.com, Abuelfotoh@amazon.com,
 Hazem <abuehaze@amazon.com>
References: <20250205151026.13061-1-hagarhem@amazon.com>
 <4a9cc5ab-c538-4427-8a7c-99cb317a283f@arm.com>
 <20250207110754.GA10452@amazon.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250207110754.GA10452@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/02/2025 12:07, Hagar Hemdan wrote:
> On Fri, Feb 07, 2025 at 10:14:54AM +0100, Dietmar Eggemann wrote:
>> Hi Hagar,
>>
>> On 05/02/2025 16:10, Hagar Hemdan wrote:
>>> Hi,
>>>
>>> There is about a 30% drop in fork benchmark [1] on aarch64 and a 10%
>>> drop on x86_64 using kernel v6.13.1.
>>>
>>> Git bisect pointed to commit eff6c8ce8d4d ("sched/core: Reduce cost
>>> of sched_move_task when config autogroup") which merged starting
>>> v6.4-rc1.
>>>
>>> The regression only happens when number of CPUs is equal to number
>>> of threads [2] that fork test is creating which means it's only visible
>>> under CPU contention.
>>>
>>> I used m6g.xlarge AWS EC2 Instance with 4 vCPUs and 16 GiB RAM for ARM64
>>> and m6a.xlarge with also 4 vCPUs and 16 GiB RAM for x86_64.
>>>
>>> I noticed this regression exists only when autogroup config is enabled.
>>
>> So '# CONFIG_SCHED_AUTOGROUP is not set' in .config so we have: 
>>
>> static inline void sched_autogroup_exit_task(struct task_struct *p) { }
>>
>> I.e. doing a 'echo 0 > /proc/sys/kernel/sched_autogroup_enabled' still
>> shows this issue?
> yes, when I do 'echo 0 | sudo tee /proc/sys/kernel/sched_autogroup_enabled',
> It behaves like the disable 'CONFIG_SCHED_AUTOGROUP'.

OK.

>>> Run the fork test with these combinations and autogroup is enabled:
>>>
>>> Arch      | commit eff6c8ce8d4d | Fork Result (lps)  |  %Cpu(s)
>>> ----------+---------------------+--------------------+------------------
>>> aarch64   | without             | 28677.0            |  3.2 us, 96.7 sy
>>> aarch64   | with                | 19860.7 (30% drop) |  2.7 us, 79.4 sy
>>> x86_64    | without             | 27776.2            |  3.1 us, 96.9 sy
>>> x86_64    | with                | 25020.6 (10% drop) |  4.1 us, 93.2 sy
>>> ----------+---------------------+--------------------+------------------
>>
>> Can you rerun with:
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 3e5a6bf587f9..62cc50c79a78 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -9057,7 +9057,7 @@ void sched_move_task(struct task_struct *tsk)
>>          * group changes.
>>          */
>>         group = sched_get_task_group(tsk);
>> -       if (group == tsk->sched_task_group)
>> +       if ((group == tsk->sched_task_group) && !(tsk->flags & PF_EXITING))
>>                 return;
> I tried that and I see it fixed the regression and the cpu utilization
> is 100% with it.

W/ this one, we force the 'spawn' tasks into: 

  sched_change_group() -> task_change_group_fair()

> I'd like to ask if this like reverting the patch in case of exit path
> and also means the enqueue/dequeue are needed in case of task exiting,
> right?

The 'spawn' tasks in sched_move_task() are 'running' and 'queued' so we
call dequeue_task(), put_prev_task(), enqueue_task() and
set_next_task().

I guess what we need here is the cfs_rq->avg.load_avg (cpu_load() in
case of root tg) update in:

  task_change_group_fair() -> detach_task_cfs_rq() -> ...,
  attach_task_cfs_rq() -> ...

since this is used for WF_FORK, WF_EXEC handling in wakeup:

  select_task_rq_fair() -> sched_balance_find_dst_cpu() ->
  sched_balance_find_dst_group_cpu()

in form of 'least_loaded_cpu' and 'load = cpu_load(cpu_rq(i)'.

You mentioned AutoGroups (AG). I don't see this issue on my Debian 12
Juno-r0 Arm64 board. When I run w/ AG, 'group' is '/' and
'tsk->sched_task_group' is '/autogroup-x' so the condition 'if (group ==
tsk->sched_task_group)' isn't true in sched_move_task(). If I disable AG
then they match "/" == "/".

I assume you run Ubuntu on your AWS instances? What kind of
'cgroup/taskgroup' related setup are you using?

Can you run w/ this debug snippet w/ and w/o AG enabled?

-->8--

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 3e5a6bf587f9..c696740177b7 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -9035,6 +9035,8 @@ static void sched_change_group(struct task_struct *tsk, struct task_group *group
                set_task_rq(tsk, task_cpu(tsk));
 }
 
+extern void task_group_path(struct task_group *tg, char *path, int plen);
+
 /*
  * Change task's runqueue when it moves between groups.
  *
@@ -9048,6 +9050,8 @@ void sched_move_task(struct task_struct *tsk)
                DEQUEUE_SAVE | DEQUEUE_MOVE | DEQUEUE_NOCLOCK;
        struct task_group *group;
        struct rq *rq;
+       int cpu = cpu_of(rq_of(cfs_rq_of(&tsk->se)));
+       char buf_1[64], buf_2[64];
 
        CLASS(task_rq_lock, rq_guard)(tsk);
        rq = rq_guard.rq;
@@ -9057,6 +9061,13 @@ void sched_move_task(struct task_struct *tsk)
         * group changes.
         */
        group = sched_get_task_group(tsk);
+
+       task_group_path(group, buf_1, sizeof(buf_1));
+       task_group_path(tsk->sched_task_group, buf_2, sizeof(buf_2));
+
+       trace_printk("%s %d cpu=%d group=%s tsk->sched_task_group=%s\n",
+                    tsk->comm, tsk->pid, cpu, buf_1, buf_2);
+
        if (group == tsk->sched_task_group)
                return;
 
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index a1be00a988bf..c967d55f971f 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -701,7 +701,9 @@ static void print_cfs_group_stats(struct seq_file *m, int cpu, struct task_group
 static DEFINE_SPINLOCK(sched_debug_lock);
 static char group_path[PATH_MAX];
 
-static void task_group_path(struct task_group *tg, char *path, int plen)
+extern void task_group_path(struct task_group *tg, char *path, int plen);
+
+void task_group_path(struct task_group *tg, char *path, int plen)
 {
        if (autogroup_path(tg, path, plen))
                return;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 26958431deb7..f90d28be9695 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13198,9 +13198,16 @@ void init_cfs_rq(struct cfs_rq *cfs_rq)
 #endif
 }
 
+extern void task_group_path(struct task_group *tg, char *path, int plen);
+
 #ifdef CONFIG_FAIR_GROUP_SCHED
 static void task_change_group_fair(struct task_struct *p)
 {
+       int cpu = cpu_of(rq_of(cfs_rq_of(&p->se)));
+       struct task_group *tg = task_group(p);
+       unsigned long cfs_rq_load_avg_pre, cfs_rq_load_avg_post;
+       char buf[64];
+
        /*
         * We couldn't detach or attach a forked task which
         * hasn't been woken up by wake_up_new_task().
@@ -13208,14 +13215,33 @@ static void task_change_group_fair(struct task_struct *p)
        if (READ_ONCE(p->__state) == TASK_NEW)
                return;
 
+       task_group_path(tg, buf, sizeof(buf));
+       cfs_rq_load_avg_pre = cfs_rq_of(&p->se)->avg.load_avg;
+
        detach_task_cfs_rq(p);
 
+       cfs_rq_load_avg_post = cfs_rq_of(&p->se)->avg.load_avg;
+
+       trace_printk("%s %d (d) cpu=%d tg=%s load_avg=%lu->%lu\n",
+                    p->comm, p->pid, cpu, buf, cfs_rq_load_avg_pre,
+                    cfs_rq_load_avg_post);
+
 #ifdef CONFIG_SMP
        /* Tell se's cfs_rq has been changed -- migrated */
        p->se.avg.last_update_time = 0;
 #endif
        set_task_rq(p, task_cpu(p));
+
+       task_group_path(tg, buf, sizeof(buf));
+       cfs_rq_load_avg_pre = cfs_rq_of(&p->se)->avg.load_avg;
+
        attach_task_cfs_rq(p);
+
+       cfs_rq_load_avg_post = cfs_rq_of(&p->se)->avg.load_avg;
+
+       trace_printk("%s %d (a) cpu=%d tg=%s load_avg=%lu->%lu\n",
+                    p->comm, p->pid, cpu, buf, cfs_rq_load_avg_pre,
+                    cfs_rq_load_avg_post);
 }
