Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BF942A87
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749112477; cv=none; b=DToHN7/fakLO4c9qp/SmAl1CZxciPUf9FH8FdaeIabGzyAYxwYmIesN2vDFLF3ZjwB2Arv0kWKqEYLMzayzGxfd/DeleEGG7yMG6Hpnj/oyJd0PPZJGZPom846ICjRrpINQJkG7pHFqy3U9gE8QiAkR9+LSbz1aCaW8QrhYUHr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749112477; c=relaxed/simple;
	bh=4s4PAeN5zLHpXEyWi/tSeVN6ouVDtNHa4QfVf9jaazI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Qgv7SYnoA2kRs0yLNyReQAgBziPYDW49oQdic+EODGCxk4R/3urE5o6n63mICR/cqwzUUbPjp1OQ39rLcGNhQXcAsAyuOPqYX/VITX/Jnl93Zrya6/tJ9rLjLKxUPcXmmZWkU8e+1/gD5wisxbrVCvA1yYHGgYKyiwHRUkhcssk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tq0jXbwV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tq0jXbwV"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235e1d710d8so8811295ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 01:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749112475; x=1749717275; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQhAAjUGZ5RyklfLyZlT29tc6DdAbSlOmLJ3JaGKh/k=;
        b=Tq0jXbwVWHHT50akVucUjhXA3IGInx4hvLYG5iF6g0lWg9t2zLHgX1SNr8YgOFlq3A
         g2+Y0whq83Q6VDJ5A6bsFWnytxi1yI1lKImCq9MyPgN8hX0zQnEbRlDCGM6TcGf0JfnQ
         mQeYYo/LX7E4BdZsx1ERpHKNzIah9ZXwfCk+mb9ykrB007oESPtXVHPoNfGZBufuKVWx
         2P6aprpG95Tt7D9RWH4jaucOmgJV0e8xhbOsp99RLEQDTdNWvA0/UaFwGUAKcCi/c/eR
         OLgzzv27WjhusSTUYcg3jo5r04ZfBiOwinNETGv0Lr84wbl3u8soiZf1pY28oTcHVWKA
         OOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749112475; x=1749717275;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQhAAjUGZ5RyklfLyZlT29tc6DdAbSlOmLJ3JaGKh/k=;
        b=CnIsHJbjh4u0fC83PBOyYxwa7Y4SLUSW1oFP5rNn6f4UD1qKLKqALc56j9T1zweU4k
         hI5656Jq+YzHGnJPf6KH0ICZfV12La1rQxZwkMx6XzigOrVHppkeI6dUSfFMcN3Zt25B
         09gzvZ93eFBtmXGs7HCFsCmcZvhesTxt/9DnYeGL8k3pp3MfqMVbqgyi/E3L/dZJ3PGe
         ADmYfOaAutxukO71rf4KjfC/4Jm5Np4N5Ej95qfteGv+ohOfuSDfbgBXwMUv1Xp5fPb0
         SnwkZlIqmkpDm+sSMg345q2IV4u6t1RdayNfblTKh8bxL+ySDL4n19903cPhXr/RwO+h
         KD1g==
X-Forwarded-Encrypted: i=1; AJvYcCWOxZzz7d68zefDcw7VxfDMf36SQ6ZZzHxdWpaRLs6KV9Qe1smsQi3Gxjvi8i3GNvvyOtweLIvR4OcJBoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQV2cOx4rGFtG6EVd5rP8ewPCcEY9ftgFBtKYoVjX7M964jVXk
	LDqkjU/i/SmfSa31QZpRP+xPMO9Mt82xHWH8y1UcYtUsu1hBTHGfWXpq
X-Gm-Gg: ASbGncsWlZ2Duy4SfBuMMmwzaop6rQwbB+zSwt5aF9vcx4R6ov/RnAuf/fPbv3lgMTN
	jMYfc2xL1Dzn6L/LM4XU5RCq0nu3d873SVtiMrXY/ip1cyoewgJQdbDMQlWv5RhuqR8RUCAgYoI
	3+gI7ddA7iusScV2DpbxBeAOXzV8xuhlxUA90xcXGvVaDYsAXSAiTkETerIMjBiIJuC301/HlaE
	kUO8cjxAHRBKhs25ecig0sEQ391OWQmFQZjeH+qnmBTtM4Azja4RYGLdMDZboAFqa5aVcM4aNWI
	nPbva8AcWunoN4y6zQQVWzD+u6NOqeZHXlDuQCMO97tG7wM08j3WITzHDm1kNw==
X-Google-Smtp-Source: AGHT+IGyDLZjlxpHkcGKOW3xrMbCTvR7PLOFeM92nKaV0Z4PssHerqRrD93FLFmuBaGiRNnXIrNgNQ==
X-Received: by 2002:a17:902:dac6:b0:234:d7b2:2aab with SMTP id d9443c01a7336-235e11c0314mr88073845ad.14.1749112474912;
        Thu, 05 Jun 2025 01:34:34 -0700 (PDT)
Received: from smtpclient.apple ([202.8.105.124])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb048dcsm9875352a12.12.2025.06.05.01.34.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jun 2025 01:34:34 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v0] sched/topology: Add lock guard support
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <02751a68-3981-4cc5-886f-a816ae39bf88@amd.com>
Date: Thu, 5 Jun 2025 16:34:19 +0800
Cc: Jemmy <jemmywong512@gmail.com>,
 Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Valentin Schneider <vschneid@redhat.com>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AE1F6825-E70D-41C0-90BE-222B22ADB2BC@gmail.com>
References: <20250604185049.374165-1-jemmywong512@gmail.com>
 <02751a68-3981-4cc5-886f-a816ae39bf88@amd.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)

Hi Prateek,

Thank you for your review and comments regarding guard vs. scoped_guard.

The primary purpose of guard is to address the notorious "goto" problem,=20=

preventing resource leaks with compiler assistance.=20

Additionally, I think it serves a second key purpose:=20
clearly defining the boundaries of an object's lifecycle,=20
which enhances code readability and maintainability.=20
This role aligns with how guards are used in other languages, e.g., C++.

To clarify usage:
- For critical sections is part of a function, I prefer scoped_guard,=20
	as it explicitly delineates the boundaries of the critical =
section.
- For critical sections spanning an entire function, I prefer guard,=20
	as it better suits the broader scope.

I agree and will convert most scoped_guard to guard according to your =
comments but with some exceptions.

Let me know if you have further thoughts or suggestions!

> On Jun 5, 2025, at 11:41=E2=80=AFAM, K Prateek Nayak =
<kprateek.nayak@amd.com> wrote:
>=20
> Hello Jammy,
>=20
> On 6/5/2025 12:20 AM, Jemmy Wong wrote:
>> This change replaces manual lock acquisition and release with lock =
guards
>> to improve code robustness and reduce the risk of lock mismanagement.
>> No functional changes to the scheduler topology logic are introduced.
>> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
>> ---
>>  include/linux/sched.h   |  11 +--
>>  kernel/sched/core.c     |   6 +-
>>  kernel/sched/debug.c    |  28 ++++---
>>  kernel/sched/rt.c       |  46 ++++++------
>>  kernel/sched/topology.c | 162 =
+++++++++++++++++++---------------------
>>  5 files changed, 120 insertions(+), 133 deletions(-)
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index 4f78a64beb52..10a9d6083b72 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -46,6 +46,7 @@
>>  #include <linux/rv.h>
>>  #include <linux/uidgid_types.h>
>>  #include <linux/tracepoint-defs.h>
>> +#include <linux/mutex.h>
>>  #include <asm/kmap_size.h>
>>    /* task_struct member predeclarations (sorted alphabetically): */
>> @@ -395,14 +396,14 @@ enum uclamp_id {
>>   UCLAMP_CNT
>>  };
>>  +extern struct mutex sched_domains_mutex;
>>  #ifdef CONFIG_SMP
>>  extern struct root_domain def_root_domain;
>> -extern struct mutex sched_domains_mutex;
>> -extern void sched_domains_mutex_lock(void);
>> -extern void sched_domains_mutex_unlock(void);
>> +DEFINE_LOCK_GUARD_0(sched_domains_mutex,
>> + mutex_lock(&sched_domains_mutex),
>> + mutex_unlock(&sched_domains_mutex))
>>  #else
>> -static inline void sched_domains_mutex_lock(void) { }
>> -static inline void sched_domains_mutex_unlock(void) { }
>> +DEFINE_LOCK_GUARD_0(sched_domains_mutex, ,)
>>  #endif
>>    struct sched_param {
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index dce50fa57471..b2b7a0cae95a 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -8457,9 +8457,9 @@ void __init sched_init_smp(void)
>>    * CPU masks are stable and all blatant races in the below code =
cannot
>>    * happen.
>>    */
>> - sched_domains_mutex_lock();
>> - sched_init_domains(cpu_active_mask);
>> - sched_domains_mutex_unlock();
>> + scoped_guard(sched_domains_mutex) {
>> + sched_init_domains(cpu_active_mask);
>> + }
>>     /* Move init over to a non-isolated CPU */
>>   if (set_cpus_allowed_ptr(current, =
housekeeping_cpumask(HK_TYPE_DOMAIN)) < 0)
>> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
>> index 9d71baf08075..f56401725ef6 100644
>> --- a/kernel/sched/debug.c
>> +++ b/kernel/sched/debug.c
>> @@ -294,19 +294,17 @@ static ssize_t sched_verbose_write(struct file =
*filp, const char __user *ubuf,
>>   bool orig;
>>     cpus_read_lock();
>=20
> cpus_read_{un}lock() have guards too. You can just have:
>=20
> guard(cpus_read_lock)();
> guard(sched_domains_mutex)();
>=20
> no need for scoped guard. Compiler will take care of unlocking
> ordering before return.
>=20
>> - sched_domains_mutex_lock();
>> -
>> - orig =3D sched_debug_verbose;
>> - result =3D debugfs_write_file_bool(filp, ubuf, cnt, ppos);
>> -
>> - if (sched_debug_verbose && !orig)
>> - update_sched_domain_debugfs();
>> - else if (!sched_debug_verbose && orig) {
>> - debugfs_remove(sd_dentry);
>> - sd_dentry =3D NULL;
>> + scoped_guard(sched_domains_mutex) {
>> + orig =3D sched_debug_verbose;
>> + result =3D debugfs_write_file_bool(filp, ubuf, cnt, ppos);
>> +
>> + if (sched_debug_verbose && !orig)
>> + update_sched_domain_debugfs();
>> + else if (!sched_debug_verbose && orig) {
>> + debugfs_remove(sd_dentry);
>> + sd_dentry =3D NULL;
>> + }
>>   }
>> -
>> - sched_domains_mutex_unlock();
>>   cpus_read_unlock();
>>     return result;
>=20
> General comment, it is okay to convert the folllowing pattern:
>=20
> func()
> {
> ...
> lock();
> ... /* critical section */
> unlock:
> unlock();
>=20
> return ret;
> }
>=20
> to:
> func()
> {
> ...
> guard();
> ... /* critical section with s/goto unlock/return ret/ */
>=20
> return ret;
> }
>=20
> You don't need a scoped_guard() if the critical section is at the end =
of
> the funtion.
>=20
>> @@ -517,9 +515,9 @@ static __init int sched_init_debug(void)
>>   debugfs_create_u32("migration_cost_ns", 0644, debugfs_sched, =
&sysctl_sched_migration_cost);
>>   debugfs_create_u32("nr_migrate", 0644, debugfs_sched, =
&sysctl_sched_nr_migrate);
>>  - sched_domains_mutex_lock();
>> - update_sched_domain_debugfs();
>> - sched_domains_mutex_unlock();
>> + scoped_guard(sched_domains_mutex) {
>> + update_sched_domain_debugfs();
>> + }
>>  #endif
>>    #ifdef CONFIG_NUMA_BALANCING
>> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
>> index e40422c37033..3f6f181de387 100644
>> --- a/kernel/sched/rt.c
>> +++ b/kernel/sched/rt.c
>> @@ -2920,36 +2920,36 @@ static int sched_rt_handler(const struct =
ctl_table *table, int write, void *buff
>>   static DEFINE_MUTEX(mutex);
>>   int ret;
>>  - mutex_lock(&mutex);
>> - sched_domains_mutex_lock();
>> - old_period =3D sysctl_sched_rt_period;
>> - old_runtime =3D sysctl_sched_rt_runtime;
>> + guard(mutex)(&mutex);
>>  - ret =3D proc_dointvec_minmax(table, write, buffer, lenp, ppos);
>> + scoped_guard(sched_domains_mutex) {
>=20
> No need for scoped guard, "guard(sched_domains_mutex)();" should be
> enough.
>=20
>> + old_period =3D sysctl_sched_rt_period;
>> + old_runtime =3D sysctl_sched_rt_runtime;
>>  - if (!ret && write) {
>> - ret =3D sched_rt_global_validate();
>> - if (ret)
>> - goto undo;
>> + ret =3D proc_dointvec_minmax(table, write, buffer, lenp, ppos);
>>  - ret =3D sched_dl_global_validate();
>> - if (ret)
>> - goto undo;
>> + if (!ret && write) {
>> + ret =3D sched_rt_global_validate();
>> + if (ret)
>> + goto undo;
>>  - ret =3D sched_rt_global_constraints();
>> - if (ret)
>> - goto undo;
>> + ret =3D sched_dl_global_validate();
>> + if (ret)
>> + goto undo;
>>  - sched_rt_do_global();
>> - sched_dl_do_global();
>> - }
>> - if (0) {
>> + ret =3D sched_rt_global_constraints();
>> + if (ret)
>> + goto undo;
>> +
>> + sched_rt_do_global();
>> + sched_dl_do_global();
>> + }
>> + if (0) {
>>  undo:
>=20
> On a sidenote, include/linux/cleanup.h has the following comment:
>=20
>    Lastly, given that the benefit of cleanup helpers is removal of
>    "goto", and that the "goto" statement can jump between scopes, the
>    expectation is that usage of "goto" and cleanup helpers is never
>    mixed in the same function. I.e. for a given routine, convert all
>    resources that need a "goto" cleanup to scope-based cleanup, or
>    convert none of them.
>=20
> Although the compiler generates the correct code currently, I think
> you should just replicate the undo chunk inplace of "goto undo" just
> to be safe like:
>=20
> if (ret) {
> sysctl_sched_rt_period =3D old_period;
> sysctl_sched_rt_runtime =3D old_runtime;
>=20
> return ret;
> }
>=20
>> - sysctl_sched_rt_period =3D old_period;
>> - sysctl_sched_rt_runtime =3D old_runtime;
>> + sysctl_sched_rt_period =3D old_period;
>> + sysctl_sched_rt_runtime =3D old_runtime;
>> + }
>>   }
>> - sched_domains_mutex_unlock();
>> - mutex_unlock(&mutex);
>>     return ret;
>>  }
>> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
>> index b958fe48e020..dac1dd5a6eca 100644
>> --- a/kernel/sched/topology.c
>> +++ b/kernel/sched/topology.c
>> @@ -6,14 +6,6 @@
>>  #include <linux/bsearch.h>
>>    DEFINE_MUTEX(sched_domains_mutex);
>> -void sched_domains_mutex_lock(void)
>> -{
>> - mutex_lock(&sched_domains_mutex);
>> -}
>> -void sched_domains_mutex_unlock(void)
>> -{
>> - mutex_unlock(&sched_domains_mutex);
>> -}
>>    /* Protected by sched_domains_mutex: */
>>  static cpumask_var_t sched_domains_tmpmask;
>> @@ -470,44 +462,41 @@ static void free_rootdomain(struct rcu_head =
*rcu)
>>  void rq_attach_root(struct rq *rq, struct root_domain *rd)
>>  {
>>   struct root_domain *old_rd =3D NULL;
>> - struct rq_flags rf;
>>  - rq_lock_irqsave(rq, &rf);
>> + scoped_guard(rq_lock_irqsave, rq) {
>=20
> I'm not a big fan of this added indentation. Perhaps you can move the
> rq_lock guarded bit into a separate function?

The added indentation clearly defines the boundary of the lock scope.=20
The caller function could become overly simplistic if moved into a =
separate function,=20
as the critical section constitutes the majority of the function.

>> + if (rq->rd) {
>> + old_rd =3D rq->rd;
>>  - if (rq->rd) {
>> - old_rd =3D rq->rd;
>> + if (cpumask_test_cpu(rq->cpu, old_rd->online))
>> + set_rq_offline(rq);
>> +
>> + cpumask_clear_cpu(rq->cpu, old_rd->span);
>> +
>> + /*
>> +  * If we don't want to free the old_rd yet then
>> +  * set old_rd to NULL to skip the freeing later
>> +  * in this function:
>> +  */
>> + if (!atomic_dec_and_test(&old_rd->refcount))
>> + old_rd =3D NULL;
>> + }
>>  - if (cpumask_test_cpu(rq->cpu, old_rd->online))
>> - set_rq_offline(rq);
>> + atomic_inc(&rd->refcount);
>> + rq->rd =3D rd;
>>  - cpumask_clear_cpu(rq->cpu, old_rd->span);
>> + cpumask_set_cpu(rq->cpu, rd->span);
>> + if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
>> + set_rq_online(rq);
>>     /*
>> -  * If we don't want to free the old_rd yet then
>> -  * set old_rd to NULL to skip the freeing later
>> -  * in this function:
>> +  * Because the rq is not a task, dl_add_task_root_domain() did not
>> +  * move the fair server bw to the rd if it already started.
>> +  * Add it now.
>>    */
>> - if (!atomic_dec_and_test(&old_rd->refcount))
>> - old_rd =3D NULL;
>> + if (rq->fair_server.dl_server)
>> + __dl_server_attach_root(&rq->fair_server, rq);
>>   }
>>  - atomic_inc(&rd->refcount);
>> - rq->rd =3D rd;
>> -
>> - cpumask_set_cpu(rq->cpu, rd->span);
>> - if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
>> - set_rq_online(rq);
>> -
>> - /*
>> -  * Because the rq is not a task, dl_add_task_root_domain() did not
>> -  * move the fair server bw to the rd if it already started.
>> -  * Add it now.
>> -  */
>> - if (rq->fair_server.dl_server)
>> - __dl_server_attach_root(&rq->fair_server, rq);
>> -
>> - rq_unlock_irqrestore(rq, &rf);
>> -
>>   if (old_rd)
>>   call_rcu(&old_rd->rcu, free_rootdomain);
>>  }
>> @@ -1809,18 +1798,17 @@ bool find_numa_distance(int distance)
>>   if (distance =3D=3D node_distance(0, 0))
>>   return true;
>>  - rcu_read_lock();
>> - distances =3D rcu_dereference(sched_domains_numa_distance);
>> - if (!distances)
>> - goto unlock;
>> - for (i =3D 0; i < sched_domains_numa_levels; i++) {
>> - if (distances[i] =3D=3D distance) {
>> - found =3D true;
>> + scoped_guard(rcu) {
>=20
> guard(rcu)() should be enough. No need for scoped guard. Instead
> of breaks, you can "return found" directly ...
>=20
>> + distances =3D rcu_dereference(sched_domains_numa_distance);
>> + if (!distances)
>>   break;
>> + for (i =3D 0; i < sched_domains_numa_levels; i++) {
>> + if (distances[i] =3D=3D distance) {
>> + found =3D true;
>> + break;
>> + }
>>   }
>>   }
>> -unlock:
>> - rcu_read_unlock();
>>     return found;
>>  }
>> @@ -2134,21 +2122,20 @@ int sched_numa_find_closest(const struct =
cpumask *cpus, int cpu)
>>   int i, j =3D cpu_to_node(cpu), found =3D nr_cpu_ids;
>>   struct cpumask ***masks;
>>  - rcu_read_lock();
>> - masks =3D rcu_dereference(sched_domains_numa_masks);
>> - if (!masks)
>> - goto unlock;
>> - for (i =3D 0; i < sched_domains_numa_levels; i++) {
>> - if (!masks[i][j])
>> - break;
>> - cpu =3D cpumask_any_and_distribute(cpus, masks[i][j]);
>> - if (cpu < nr_cpu_ids) {
>> - found =3D cpu;
>> + scoped_guard(rcu) {
>=20
> Same as last comment, plain guard(rcu)(); should be fine ...
>=20
>> + masks =3D rcu_dereference(sched_domains_numa_masks);
>> + if (!masks)
>>   break;
>> + for (i =3D 0; i < sched_domains_numa_levels; i++) {
>> + if (!masks[i][j])
>> + break;
>> + cpu =3D cpumask_any_and_distribute(cpus, masks[i][j]);
>> + if (cpu < nr_cpu_ids) {
>> + found =3D cpu;
>> + break;
>> + }
>>   }
>>   }
>> -unlock:
>> - rcu_read_unlock();
>>     return found;
>>  }
>> @@ -2201,24 +2188,25 @@ int sched_numa_find_nth_cpu(const struct =
cpumask *cpus, int cpu, int node)
>>   if (node =3D=3D NUMA_NO_NODE)
>>   return cpumask_nth_and(cpu, cpus, cpu_online_mask);
>>  - rcu_read_lock();
>> + scoped_guard(rcu) {
>=20
> Same as last comment ...
>=20
>> + /* CPU-less node entries are uninitialized in =
sched_domains_numa_masks */
>> + node =3D numa_nearest_node(node, N_CPU);
>> + k.node =3D node;
>>  - /* CPU-less node entries are uninitialized in =
sched_domains_numa_masks */
>> - node =3D numa_nearest_node(node, N_CPU);
>> - k.node =3D node;
>> + k.masks =3D rcu_dereference(sched_domains_numa_masks);
>> + if (!k.masks)
>> + break;
>>  - k.masks =3D rcu_dereference(sched_domains_numa_masks);
>> - if (!k.masks)
>> - goto unlock;
>> + hop_masks =3D bsearch(&k, k.masks, sched_domains_numa_levels,
>> + sizeof(k.masks[0]), hop_cmp);
>> + hop =3D hop_masks - k.masks;
>>  - hop_masks =3D bsearch(&k, k.masks, sched_domains_numa_levels, =
sizeof(k.masks[0]), hop_cmp);
>> - hop =3D hop_masks - k.masks;
>> + ret =3D hop ?
>> + cpumask_nth_and_andnot(cpu - k.w, cpus, k.masks[hop][node],
>> + k.masks[hop-1][node]) :
>> + cpumask_nth_and(cpu, cpus, k.masks[0][node]);
>> + }
>>  - ret =3D hop ?
>> - cpumask_nth_and_andnot(cpu - k.w, cpus, k.masks[hop][node], =
k.masks[hop-1][node]) :
>> - cpumask_nth_and(cpu, cpus, k.masks[0][node]);
>> -unlock:
>> - rcu_read_unlock();
>>   return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(sched_numa_find_nth_cpu);
>> @@ -2570,17 +2558,17 @@ build_sched_domains(const struct cpumask =
*cpu_map, struct sched_domain_attr *att
>>   }
>>     /* Attach the domains */
>> - rcu_read_lock();
>> - for_each_cpu(i, cpu_map) {
>> - rq =3D cpu_rq(i);
>> - sd =3D *per_cpu_ptr(d.sd, i);
>> + scoped_guard(rcu) {
>> + for_each_cpu(i, cpu_map) {
>> + rq =3D cpu_rq(i);
>> + sd =3D *per_cpu_ptr(d.sd, i);
>>  - cpu_attach_domain(sd, d.rd, i);
>> + cpu_attach_domain(sd, d.rd, i);
>>  - if (lowest_flag_domain(i, SD_CLUSTER))
>> - has_cluster =3D true;
>> + if (lowest_flag_domain(i, SD_CLUSTER))
>> + has_cluster =3D true;
>> + }
>>   }
>> - rcu_read_unlock();
>>     if (has_asym)
>>   static_branch_inc_cpuslocked(&sched_asym_cpucapacity);
>> @@ -2688,10 +2676,10 @@ static void detach_destroy_domains(const =
struct cpumask *cpu_map)
>>   if (static_branch_unlikely(&sched_cluster_active))
>>   static_branch_dec_cpuslocked(&sched_cluster_active);
>>  - rcu_read_lock();
>=20
> Same as last comment =E2=80=A6

The critical section of RCU is part of the function, I think =
scoped_guard is more suitable than guard.=20

>=20
>> - for_each_cpu(i, cpu_map)
>> - cpu_attach_domain(NULL, &def_root_domain, i);
>> - rcu_read_unlock();
>> + scoped_guard(rcu) {
>> + for_each_cpu(i, cpu_map)
>> + cpu_attach_domain(NULL, &def_root_domain, i);
>> + }
>>  }
>>    /* handle null as "default" */
>> @@ -2836,7 +2824,7 @@ static void partition_sched_domains_locked(int =
ndoms_new, cpumask_var_t doms_new
>>  void partition_sched_domains(int ndoms_new, cpumask_var_t =
doms_new[],
>>        struct sched_domain_attr *dattr_new)
>>  {
>> - sched_domains_mutex_lock();
>> - partition_sched_domains_locked(ndoms_new, doms_new, dattr_new);
>> - sched_domains_mutex_unlock();
>> + scoped_guard(sched_domains_mutex) {
>=20
> Similar to lasr comment, plain guard(sched_domains_mutex)(); should be =
fine.
>=20
>> + partition_sched_domains_locked(ndoms_new, doms_new, dattr_new);
>> + }
>>  }
>=20
> --=20
> Thanks and Regards,
> Prateek

Best Regards,
Jemmy

