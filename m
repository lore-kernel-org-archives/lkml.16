Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F214F1D515A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314075; cv=none; b=DfQXX9+HXcp2Kn6ynRB3KcGS+wavrsE9vIujebuzhjTv7DFNweQl4wae2omzyHJd3GrJcslZfdDkd10Z88ACYBZ09zviprEB7dbw96DT6NKuyo7bmfcTiW3IHhMSQtpLUEzi6KeIvb0+o8T6PMTHd+cZoGcx73D7wm+q4L8J5MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314075; c=relaxed/simple;
	bh=AgnyL3CdzJxV9y4WiJKtCdoUbN7Y2/PBXXey5alfkEE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=X8AYLPSz4LkhpIefwRc74VtVay9zuegpP25PZrVDgqx+Vt1XH9r4B4ewqNlDQ5ORC+YQo+eTtsyQ2b+o4iWk1rYmDPlnoJjQLwKICgxSkA3kof34i8VIS85fnkFngZ+Xd6mF3rKse0GeqMCek8Mk5iYT7C/krinqgkgOftcu0jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iEbB3LV9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iEbB3LV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745314071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AgnyL3CdzJxV9y4WiJKtCdoUbN7Y2/PBXXey5alfkEE=;
	b=iEbB3LV9o2YYQpg0OIbdjzLtxygTyL+IN58GrwlIAsgj4GW1rt22KiJNJSxrmansBiufX3
	VDugD7sNUi6NBCG5vqqNRXxasv9WwIrk1zV0rwr80OTUSRo6gowmvy5d+JEx+47YtHD5h1
	PGarY3j9DOICU1kbpFr7icdokWg7Pgg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-GnGYuPhbNPGoXSR0Sm4DOQ-1; Tue, 22 Apr 2025 05:27:47 -0400
X-MC-Unique: GnGYuPhbNPGoXSR0Sm4DOQ-1
X-Mimecast-MFC-AGG-ID: GnGYuPhbNPGoXSR0Sm4DOQ_1745314066
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39130f02631so1720522f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745314066; x=1745918866;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AgnyL3CdzJxV9y4WiJKtCdoUbN7Y2/PBXXey5alfkEE=;
        b=wdQow/Y2PpxwXfCspgUpkmciMdmkbb8+Swhq1MQl46kmeEyXp4uo7OLFJ17X6hVoxz
         +VI3kI8C//4XzkWfRiQXGecBiu15N78fpGhXWS8KlCEkKASxvDcuYSHv+pHcYw2jZ0te
         B9gVtjhv7xTlVCkaXAkQdLKuRW2EKiENXnZF8HYpkFWdlymbp8NF3pSuOPPsmTB+P3Ag
         yHm1gezIY+spu9ayp5N2dRNOl/3BQxl4ICrU8hMZzF3UWxI/YrooZiGqNu39TfrYxbkl
         /Qvf2sgnGc7K/zZzB8BGaM2cmhkaRS8VKwCwzarted5pGBWhJAwWxKjYTXmKS6YGRPJF
         iyLw==
X-Gm-Message-State: AOJu0YwjOwOqnHbwQhY4xmP6DCU3sMQDw8MGmayXTlgb7UWRJXv6NfgL
	Zmn+WvG9osSSJWMgdFr3dAboXt+W4m20yx+FE2MEri7SyA0Z7y2lHFPJsVrcYOdn5q5MqKpOeWd
	rIC4bjuAacD2H3DBwUHOl3ZtjfVc+uzYe7XFFJx1oYtld1MyvyKvlDHwsEjhydg==
X-Gm-Gg: ASbGncuP6bivmHnbGiTn7IHJYhHOFiSPayDnmtepvRvpyW96ZZKshW1gpDY8qHE7ISe
	XuqxvTf8if4TS7IQc5el9uDnWpszR8lsJumpIGINAmpPOJprChFeOpjp3nP5kgT1ebN3HPyWEPL
	kNEdOG+KnNR+a3tOcxC0DEr4gmkIYMcDMbTK4dm3i+plBTHa8gUNA0Qw38kF09N7f3W5N7DgO8A
	fLEv30/Lpk7L14WCbcSs+YPb46S5Ar4tMCfmhi49/pXqcOFrKWqK7vlgivPoNz2u8eLxejiC+WD
	trzT+tiH
X-Received: by 2002:a05:6000:1889:b0:394:d0c3:da5e with SMTP id ffacd0b85a97d-39efbb054b2mr11272983f8f.47.1745314065981;
        Tue, 22 Apr 2025 02:27:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlrO0/BemrlI+HwSI9V3QCIZZPBWjXZPma6UnqXroTYFqw4EQ3K2XsXGErxB2ITZyW7Q7wfQ==
X-Received: by 2002:a05:6000:1889:b0:394:d0c3:da5e with SMTP id ffacd0b85a97d-39efbb054b2mr11272949f8f.47.1745314065481;
        Tue, 22 Apr 2025 02:27:45 -0700 (PDT)
Received: from [127.0.0.1] ([195.174.135.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493145sm14454784f8f.71.2025.04.22.02.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 02:27:45 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:27:42 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Message-ID: <f5ded505-6df3-4a70-a41c-7333c50fed4e@redhat.com>
In-Reply-To: <e53ac875-da6a-42ce-8714-d74f77775279@efficios.com>
References: <20250414123630.177385-5-gmonaco@redhat.com> <20250414123630.177385-7-gmonaco@redhat.com> <e53ac875-da6a-42ce-8714-d74f77775279@efficios.com>
Subject: Re: [PATCH v13 2/3] sched: Move task_mm_cid_work to mm work_struct
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <f5ded505-6df3-4a70-a41c-7333c50fed4e@redhat.com>

2025-04-14T15:28:34Z Mathieu Desnoyers <mathieu.desnoyers@efficios.com>:

> On 2025-04-14 08:36, Gabriele Monaco wrote:
>> Currently, the task_mm_cid_work function is called in a task work
>> triggered by a scheduler tick to frequently compact the mm_cids of each
>> process. This can delay the execution of the corresponding thread for
>> the entire duration of the function, negatively affecting the response
>> in case of real time tasks. In practice, we observe task_mm_cid_work
>> increasing the latency of 30-35us on a 128 cores system, this order of
>> magnitude is meaningful under PREEMPT_RT.
>> Run the task_mm_cid_work in a new work_struct connected to the
>> mm_struct rather than in the task context before returning to
>> userspace.
>> This work_struct is initialised with the mm and disabled before freeing
>> it. The queuing of the work happens while returning to userspace in
>> __rseq_handle_notify_resume, maintaining the checks to avoid running
>> more frequently than MM_CID_SCAN_DELAY.
>> To make sure this happens predictably also on long running tasks, we
>> trigger a call to __rseq_handle_notify_resume also from the scheduler
>> tick if the runtime exceeded a 100ms threshold.
>> The main advantage of this change is that the function can be offloaded
>> to a different CPU and even preempted by RT tasks.
>> Moreover, this new behaviour is more predictable with periodic tasks
>> with short runtime, which may rarely run during a scheduler tick.
>> Now, the work is always scheduled when the task returns to userspace.
>> The work is disabled during mmdrop, since the function cannot sleep in
>> all kernel configurations, we cannot wait for possibly running work
>> items to terminate. We make sure the mm is valid in case the task is
>> terminating by reserving it with mmgrab/mmdrop, returning prematurely if
>> we are really the last user while the work gets to run.
>> This situation is unlikely since we don't schedule the work for exiting
>> tasks, but we cannot rule it out.
>
> The implementation looks good to me. Peter, how does it look from your en=
d ?
>

Peter, what do you think about this version? Can we bring it in?

Thanks,
Gabriele

> Thanks,
>
> Mathieu
>
>> Fixes: 223baf9d17f2 ("sched: Fix performance regression introduced by mm=
_cid")
>> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
>> ---
>> =C2=A0 include/linux/mm_types.h | 26 ++++++++++++++
>> =C2=A0 include/linux/sched.h=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++-
>> =C2=A0 kernel/rseq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>> =C2=A0 kernel/sched/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 75 ++++++++++=
++++++++++++++++--------------
>> =C2=A0 kernel/sched/sched.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++--
>> =C2=A0 5 files changed, 89 insertions(+), 28 deletions(-)
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index 56d07edd01f91..e4ae9295508cf 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -982,6 +982,10 @@ struct mm_struct {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * mm nr_cpus_allowed up=
dates.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raw_spinlock_t cpus_allowed_l=
ock;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @cid_work: Work item to ru=
n the mm_cid scan.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct work_struct cid_work;
>> =C2=A0 #endif
>> =C2=A0 #ifdef CONFIG_MMU
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_long_t pgtables_bytes;=
=C2=A0=C2=A0 /* size of all page tables */
>> @@ -1282,6 +1286,8 @@ enum mm_cid_state {
>> =C2=A0=C2=A0=C2=A0 MM_CID_LAZY_PUT =3D (1U << 31),
>> =C2=A0 };
>> =C2=A0 +extern void task_mm_cid_work(struct work_struct *work);
>> +
>> =C2=A0 static inline bool mm_cid_is_unset(int cid)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0 return cid =3D=3D MM_CID_UNSET;
>> @@ -1354,12 +1360,14 @@ static inline int mm_alloc_cid_noprof(struct mm_=
struct *mm, struct task_struct *
>> =C2=A0=C2=A0=C2=A0 if (!mm->pcpu_cid)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> =C2=A0=C2=A0=C2=A0 mm_init_cid(mm, p);
>> +=C2=A0=C2=A0 INIT_WORK(&mm->cid_work, task_mm_cid_work);
>> =C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> =C2=A0 #define mm_alloc_cid(...) alloc_hooks(mm_alloc_cid_noprof(__VA_AR=
GS__))
>> =C2=A0=C2=A0=C2=A0 static inline void mm_destroy_cid(struct mm_struct *m=
m)
>> =C2=A0 {
>> +=C2=A0=C2=A0 disable_work(&mm->cid_work);
>> =C2=A0=C2=A0=C2=A0 free_percpu(mm->pcpu_cid);
>> =C2=A0=C2=A0=C2=A0 mm->pcpu_cid =3D NULL;
>> =C2=A0 }
>> @@ -1381,6 +1389,16 @@ static inline void mm_set_cpus_allowed(struct mm_=
struct *mm, const struct cpumas
>> =C2=A0=C2=A0=C2=A0 WRITE_ONCE(mm->nr_cpus_allowed, cpumask_weight(mm_all=
owed));
>> =C2=A0=C2=A0=C2=A0 raw_spin_unlock(&mm->cpus_allowed_lock);
>> =C2=A0 }
>> +
>> +static inline bool mm_cid_needs_scan(struct mm_struct *mm)
>> +{
>> +=C2=A0=C2=A0 return mm && !time_before(jiffies, READ_ONCE(mm->mm_cid_ne=
xt_scan));
>> +}
>> +
>> +static inline bool mm_cid_scan_pending(struct mm_struct *mm)
>> +{
>> +=C2=A0=C2=A0 return mm && work_pending(&mm->cid_work);
>> +}
>> =C2=A0 #else /* CONFIG_SCHED_MM_CID */
>> =C2=A0 static inline void mm_init_cid(struct mm_struct *mm, struct task_=
struct *p) { }
>> =C2=A0 static inline int mm_alloc_cid(struct mm_struct *mm, struct task_=
struct *p) { return 0; }
>> @@ -1391,6 +1409,14 @@ static inline unsigned int mm_cid_size(void)
>> =C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> =C2=A0 static inline void mm_set_cpus_allowed(struct mm_struct *mm, cons=
t struct cpumask *cpumask) { }
>> +static inline bool mm_cid_needs_scan(struct mm_struct *mm)
>> +{
>> +=C2=A0=C2=A0 return false;
>> +}
>> +static inline bool mm_cid_scan_pending(struct mm_struct *mm)
>> +{
>> +=C2=A0=C2=A0 return false;
>> +}
>> =C2=A0 #endif /* CONFIG_SCHED_MM_CID */
>> =C2=A0=C2=A0=C2=A0 struct mmu_gather;
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index f96ac19828934..3ffdb96ef6b0a 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -1424,7 +1424,7 @@ struct task_struct {
>> =C2=A0=C2=A0=C2=A0 int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 last_mm_cid;=C2=A0=C2=A0=C2=A0 /* Most recent cid =
in mm */
>> =C2=A0=C2=A0=C2=A0 int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 migrate_from_cpu;
>> =C2=A0=C2=A0=C2=A0 int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 mm_cid_active;=C2=A0 /* Whether cid bitmap is acti=
ve */
>> -=C2=A0=C2=A0 struct callback_head=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 cid_work;
>> +=C2=A0=C2=A0 unsigned long=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 last_cid_reset; /* Time of last reset in jiffies */
>> =C2=A0 #endif
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tlbflush_unmap_batch t=
lb_ubc;
>> @@ -2281,4 +2281,10 @@ static __always_inline void alloc_tag_restore(str=
uct alloc_tag *tag, struct allo
>> =C2=A0 #define alloc_tag_restore(_tag, _old)=C2=A0=C2=A0=C2=A0=C2=A0 do =
{} while (0)
>> =C2=A0 #endif
>> =C2=A0 +#ifdef CONFIG_SCHED_MM_CID
>> +extern void task_queue_mm_cid(struct task_struct *curr);
>> +#else
>> +static inline void task_queue_mm_cid(struct task_struct *curr) { }
>> +#endif
>> +
>> =C2=A0 #endif
>> diff --git a/kernel/rseq.c b/kernel/rseq.c
>> index b7a1ec327e811..383db2ccad4d0 100644
>> --- a/kernel/rseq.c
>> +++ b/kernel/rseq.c
>> @@ -441,6 +441,8 @@ void __rseq_handle_notify_resume(struct ksignal *ksi=
g, struct pt_regs *regs)
>> =C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0 if (unlikely(rseq_update_cpu_node_id(t)))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto error;
>> +=C2=A0=C2=A0 if (mm_cid_needs_scan(t->mm))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 task_queue_mm_cid(t);
>> =C2=A0=C2=A0=C2=A0 return;
>> =C2=A0=C2=A0=C2=A0 error:
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index c81cf642dba05..02b18649e6a09 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -10566,22 +10566,16 @@ static void sched_mm_cid_remote_clear_weight(s=
truct mm_struct *mm, int cpu,
>> =C2=A0=C2=A0=C2=A0 sched_mm_cid_remote_clear(mm, pcpu_cid, cpu);
>> =C2=A0 }
>> =C2=A0 -static void task_mm_cid_work(struct callback_head *work)
>> +void task_mm_cid_work(struct work_struct *work)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0 unsigned long now =3D jiffies, old_scan, next_scan;
>> -=C2=A0=C2=A0 struct task_struct *t =3D current;
>> =C2=A0=C2=A0=C2=A0 struct cpumask *cidmask;
>> -=C2=A0=C2=A0 struct mm_struct *mm;
>> +=C2=A0=C2=A0 struct mm_struct *mm =3D container_of(work, struct mm_stru=
ct, cid_work);
>> =C2=A0=C2=A0=C2=A0 int weight, cpu;
>> =C2=A0 - WARN_ON_ONCE(t !=3D container_of(work, struct task_struct, cid_=
work));
>> -
>> -=C2=A0=C2=A0 work->next =3D work;=C2=A0 /* Prevent double-add */
>> -=C2=A0=C2=A0 if (t->flags & PF_EXITING)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> -=C2=A0=C2=A0 mm =3D t->mm;
>> -=C2=A0=C2=A0 if (!mm)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0 /* We are the last user, process already terminated. */
>> +=C2=A0=C2=A0 if (atomic_read(&mm->mm_count) =3D=3D 1)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_drop;
>> =C2=A0=C2=A0=C2=A0 old_scan =3D READ_ONCE(mm->mm_cid_next_scan);
>> =C2=A0=C2=A0=C2=A0 next_scan =3D now + msecs_to_jiffies(MM_CID_SCAN_DELA=
Y);
>> =C2=A0=C2=A0=C2=A0 if (!old_scan) {
>> @@ -10594,9 +10588,9 @@ static void task_mm_cid_work(struct callback_hea=
d *work)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 old_s=
can =3D next_scan;
>> =C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0 if (time_before(now, old_scan))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_drop;
>> =C2=A0=C2=A0=C2=A0 if (!try_cmpxchg(&mm->mm_cid_next_scan, &old_scan, ne=
xt_scan))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_drop;
>> =C2=A0=C2=A0=C2=A0 cidmask =3D mm_cidmask(mm);
>> =C2=A0=C2=A0=C2=A0 /* Clear cids that were not recently used. */
>> =C2=A0=C2=A0=C2=A0 for_each_possible_cpu(cpu)
>> @@ -10608,6 +10602,8 @@ static void task_mm_cid_work(struct callback_hea=
d *work)
>> =C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0 for_each_possible_cpu(cpu)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched_mm_cid_remote_clear_wei=
ght(mm, cpu, weight);
>> +out_drop:
>> +=C2=A0=C2=A0 mmdrop(mm);
>> =C2=A0 }
>> =C2=A0=C2=A0=C2=A0 void init_sched_mm_cid(struct task_struct *t)
>> @@ -10620,23 +10616,52 @@ void init_sched_mm_cid(struct task_struct *t)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mm_users =3D=3D 1)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm->m=
m_cid_next_scan =3D jiffies + msecs_to_jiffies(MM_CID_SCAN_DELAY);
>> =C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0 t->cid_work.next =3D &t->cid_work;=C2=A0=C2=A0=C2=A0 /* Pr=
otect against double add */
>> -=C2=A0=C2=A0 init_task_work(&t->cid_work, task_mm_cid_work);
>> =C2=A0 }
>> =C2=A0 -void task_tick_mm_cid(struct rq *rq, struct task_struct *curr)
>> +void task_tick_mm_cid(struct rq *rq, struct task_struct *t)
>> =C2=A0 {
>> -=C2=A0=C2=A0 struct callback_head *work =3D &curr->cid_work;
>> -=C2=A0=C2=A0 unsigned long now =3D jiffies;
>> +=C2=A0=C2=A0 u64 rtime =3D t->se.sum_exec_runtime - t->se.prev_sum_exec=
_runtime;
>> =C2=A0 - if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) ||
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 work->next !=3D work)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> -=C2=A0=C2=A0 if (time_before(now, READ_ONCE(curr->mm->mm_cid_next_scan)=
))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0 * If a task is running unpreempted for a long time, =
it won't get its
>> +=C2=A0=C2=A0=C2=A0 * mm_cid compacted and won't update its mm_cid value=
 after a
>> +=C2=A0=C2=A0=C2=A0 * compaction occurs.
>> +=C2=A0=C2=A0=C2=A0 * For such a task, this function does two things:
>> +=C2=A0=C2=A0=C2=A0 * A) trigger the mm_cid recompaction,
>> +=C2=A0=C2=A0=C2=A0 * B) trigger an update of the task's rseq->mm_cid fi=
eld at some point
>> +=C2=A0=C2=A0=C2=A0 * after recompaction, so it can get a mm_cid value c=
loser to 0.
>> +=C2=A0=C2=A0=C2=A0 * A change in the mm_cid triggers an rseq_preempt.
>> +=C2=A0=C2=A0=C2=A0 *
>> +=C2=A0=C2=A0=C2=A0 * A occurs only once after the scan time elapsed, un=
til the next scan
>> +=C2=A0=C2=A0=C2=A0 * expires as well.
>> +=C2=A0=C2=A0=C2=A0 * B occurs once after the compaction work completes,=
 that is when scan
>> +=C2=A0=C2=A0=C2=A0 * is no longer needed (it occurred for this mm) but =
the last rseq
>> +=C2=A0=C2=A0=C2=A0 * preempt was done before the last mm_cid scan.
>> +=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0 if (t->mm && rtime > RSEQ_UNPREEMPTED_THRESHOLD) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mm_cid_needs_scan(t->mm) && !m=
m_cid_scan_pending(t->mm))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rseq_set_n=
otify_resume(t);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (time_after(jiffies, t->la=
st_cid_reset +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(MM_CID=
_SCAN_DELAY))) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int old_ci=
d =3D t->mm_cid;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!t->mm=
_cid_active)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm_cid_sna=
pshot_time(rq, t->mm);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm_cid_put=
_lazy(t);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t->last_mm=
_cid =3D t->mm_cid =3D mm_cid_get(rq, t, t->mm);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (old_ci=
d !=3D t->mm_cid)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 rseq_preempt(t);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0 }
>> +}
>> =C2=A0 - /* No page allocation under rq lock */
>> -=C2=A0=C2=A0 task_work_add(curr, work, TWA_RESUME);
>> +/* Call only when curr is a user thread. */
>> +void task_queue_mm_cid(struct task_struct *curr)
>> +{
>> +=C2=A0=C2=A0 /* Ensure the mm exists when we run. */
>> +=C2=A0=C2=A0 mmgrab(curr->mm);
>> +=C2=A0=C2=A0 queue_work(system_unbound_wq, &curr->mm->cid_work);
>> =C2=A0 }
>> =C2=A0=C2=A0=C2=A0 void sched_mm_cid_exit_signals(struct task_struct *t)
>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>> index 47972f34ea701..c0f8fd4c575c3 100644
>> --- a/kernel/sched/sched.h
>> +++ b/kernel/sched/sched.h
>> @@ -3582,13 +3582,14 @@ extern const char *preempt_modes[];
>> =C2=A0=C2=A0=C2=A0 #define SCHED_MM_CID_PERIOD_NS=C2=A0 (100ULL * 100000=
0)=C2=A0 /* 100ms */
>> =C2=A0 #define MM_CID_SCAN_DELAY 100=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* 100ms */
>> +#define RSEQ_UNPREEMPTED_THRESHOLD SCHED_MM_CID_PERIOD_NS
>> =C2=A0=C2=A0=C2=A0 extern raw_spinlock_t cid_lock;
>> =C2=A0 extern int use_cid_lock;
>> =C2=A0=C2=A0=C2=A0 extern void sched_mm_cid_migrate_from(struct task_str=
uct *t);
>> =C2=A0 extern void sched_mm_cid_migrate_to(struct rq *dst_rq, struct tas=
k_struct *t);
>> -extern void task_tick_mm_cid(struct rq *rq, struct task_struct *curr);
>> +extern void task_tick_mm_cid(struct rq *rq, struct task_struct *t);
>> =C2=A0 extern void init_sched_mm_cid(struct task_struct *t);
>> =C2=A0=C2=A0=C2=A0 static inline void __mm_cid_put(struct mm_struct *mm,=
 int cid)
>> @@ -3798,6 +3799,7 @@ static inline int mm_cid_get(struct rq *rq, struct=
 task_struct *t,
>> =C2=A0=C2=A0=C2=A0 cid =3D __mm_cid_get(rq, t, mm);
>> =C2=A0=C2=A0=C2=A0 __this_cpu_write(pcpu_cid->cid, cid);
>> =C2=A0=C2=A0=C2=A0 __this_cpu_write(pcpu_cid->recent_cid, cid);
>> +=C2=A0=C2=A0 t->last_cid_reset =3D jiffies;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return cid;
>> =C2=A0 }
>> @@ -3857,7 +3859,7 @@ static inline void switch_mm_cid(struct rq *rq,
>> =C2=A0 static inline void switch_mm_cid(struct rq *rq, struct task_struc=
t *prev, struct task_struct *next) { }
>> =C2=A0 static inline void sched_mm_cid_migrate_from(struct task_struct *=
t) { }
>> =C2=A0 static inline void sched_mm_cid_migrate_to(struct rq *dst_rq, str=
uct task_struct *t) { }
>> -static inline void task_tick_mm_cid(struct rq *rq, struct task_struct *=
curr) { }
>> +static inline void task_tick_mm_cid(struct rq *rq, struct task_struct *=
t) { }
>> =C2=A0 static inline void init_sched_mm_cid(struct task_struct *t) { }
>> =C2=A0 #endif /* !CONFIG_SCHED_MM_CID */
>> =C2=A0
>
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com

