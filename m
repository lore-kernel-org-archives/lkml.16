Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD4BC2F2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732176; cv=none; b=K0NByBcWok0YM47cXINAFErv9gYnD3jfS3kYQlY3pMZoHAgd97Dq2Zp5nv7RSUWZnBMBLQT74uWyg8bopiILwzKezmx/6F+tj4KOJEE2HMRv0Dxs7QPp/ZmTH1niomnnaroiChJHtsldI9pKszUo7U/wbidI4FUnbMvOG8eTSZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732176; c=relaxed/simple;
	bh=zKxl21zIuHHuKN4alYXaxq2mMed6MuQufKjdEqCUaC0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KEecAfxUBUXeKkGl5elWGH8nKK2NSkIVcppTsfNkKI3QoXsUGLTizTCplY6D2uDQSZ/XMtFPGgcWRi20Y7P1iTr2VaPq8gL8urZk8uwZlZFTlV0VwSNWtNhDFwWsaksbsH7PMf1pZYtcibHqCmzVc6fvmJg0Gj4zoSdeusEGAeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PyWN3zap; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PyWN3zap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744732172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZGxqsT1L7Pk8OQAV2wRLwn6ZtoJGEY7T0KVptTG2s3k=;
	b=PyWN3zapa56UPsd+UwoPUhJiHbrU1bsy9mxIdzWBwBdNns059SBOTUHm5xUz+XP1cTwsr9
	h4AHaOmzFedMpQBy+sMKSUB1A+u50NYHHQoChocJ7GydApQTA8be/6kf8uRRe5eKUNKZqO
	KxXZI0J6JTyPmIzLdfrFizdcFLbHifo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-gIPesfhJOkKCAsY2h8RA9g-1; Tue, 15 Apr 2025 11:49:30 -0400
X-MC-Unique: gIPesfhJOkKCAsY2h8RA9g-1
X-Mimecast-MFC-AGG-ID: gIPesfhJOkKCAsY2h8RA9g_1744732169
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39d917b105bso3263420f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744732169; x=1745336969;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGxqsT1L7Pk8OQAV2wRLwn6ZtoJGEY7T0KVptTG2s3k=;
        b=L2nsSGE3ofehqjtDnKawAyblTZsXhWsItqBPMVZPvzgOxyYYKh4h9pA+ZuQt0DX5oh
         Tm1WlipezCcfCbJXiaPm2YJZ9mSnQ7f6frt9XT2nWwYM1gZehZz59csyYwDwERc5btin
         xTWIioMzTh7vy/miA/pa9GPJY51Vm3ODB3bnzrlcHP1pFtY1MDtWa/nwXTcVshyRdfsT
         XU4eODSCkfnzGyX2TXrM3+xvsaQyXSIqUl5HOMVSZCY5M4dlgRYuK/ZFuRbHWGLP5zCg
         I07knImkN9SfHu3pM0JRYeLFnrpJfjM3XsyUP2uSqiHEV7/HFwBaIhsqi3yKsSH8CN0F
         4bKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Bk5BJniswmkCJOT9gd9V9xo3BxGKciTsfDIf3k1ZMWTd4c2ji7wkNudcTq9jD6blzVum7eGROxk4vMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAaLGbT82dysY3oTQurdwQqCmKvzhmyINVrEbGdV3VHQ8wh6qD
	6vkqDxfY4VsHBoBSciQYg1i7Vkq8j0YQK8BAe72tAIhTNq80SXB0UeGTx5ELRGQ9RkWogWJTo3H
	IWDMXD1tj68xdZtswJ3J+lXr/cc/VeNfJIuL48g8pd+eqxa8cEaNXN30zrCl2WA==
X-Gm-Gg: ASbGncsWID3x6UynFpv2Jz/8nlwG1CwjGG9nKGaRDon2C63JJe9KQvzCFazBUOmktt+
	QJTxZnxoQd1kG2xX5BvRPPDjfliDvG5e/ww4ps1uIFys6bVGHEIsfU7hQiCcf1Nh7o4qxy8waPb
	4If+VOveLZqFvcEdYx9G80PF6TPsqB8Xb4epvgoyRqqa3O6QM+ACuO7INP4rKULOliObcw0K1Zf
	eov8ob4G/PAWfY4t3KTHaQqJMSIGklCo3DdkaPqPJm+cuDIABreGunKM1K2jo4VbDlNj192Mn4l
	oJ5xLbDGVChvrlVTBSjCY2i6kX/Rsim8wulRCmc=
X-Received: by 2002:a05:6000:2401:b0:391:212:459a with SMTP id ffacd0b85a97d-39ea521207fmr12872982f8f.22.1744732169378;
        Tue, 15 Apr 2025 08:49:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2XgsFug0d9TtegjoR2oLsTDCLixYC8yS5E6Sw6F9aXs845OyyjPs4QUKDd+72Rp2CGYZ0lA==
X-Received: by 2002:a05:6000:2401:b0:391:212:459a with SMTP id ffacd0b85a97d-39ea521207fmr12872960f8f.22.1744732168992;
        Tue, 15 Apr 2025 08:49:28 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979637sm14862730f8f.53.2025.04.15.08.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 08:49:28 -0700 (PDT)
Message-ID: <24ae2496778a207faad9edb36dbfef0f02578d72.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Waiman Long <llong@redhat.com>, linux-kernel@vger.kernel.org, Frederic
 Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 15 Apr 2025 17:49:27 +0200
In-Reply-To: <6c9ee628-26d1-423e-801a-2922683d004d@redhat.com>
References: <20250415102500.100415-5-gmonaco@redhat.com>
	 <20250415102500.100415-8-gmonaco@redhat.com>
	 <6c9ee628-26d1-423e-801a-2922683d004d@redhat.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Tue, 2025-04-15 at 11:30 -0400, Waiman Long wrote:
>=20
> On 4/15/25 6:25 AM, Gabriele Monaco wrote:
> > The timer migration mechanism allows active CPUs to pull timers
> > from
> > idle ones to improve the overall idle time. This is however
> > undesired
> > when CPU intensive workloads run on isolated cores, as the
> > algorithm
> > would move the timers from housekeeping to isolated cores,
> > negatively
> > affecting the isolation.
> >=20
> > This effect was noticed on a 128 cores machine running oslat on the
> > isolated cores (1-31,33-63,65-95,97-127). The tool monopolises
> > CPUs,
> > and the CPU with lowest count in a timer migration hierarchy (here
> > 1
> > and 65) appears as always active and continuously pulls global
> > timers,
> > from the housekeeping CPUs. This ends up moving driver work (e.g.
> > delayed work) to isolated CPUs and causes latency spikes:
> >=20
> > before the change:
> >=20
> > =C2=A0 # oslat -c 1-31,33-63,65-95,97-127 -D 62s
> > =C2=A0 ...
> > =C2=A0=C2=A0 Maximum:=C2=A0=C2=A0=C2=A0=C2=A0 1203 10 3 4 ... 5 (us)
> >=20
> > after the change:
> >=20
> > =C2=A0 # oslat -c 1-31,33-63,65-95,97-127 -D 62s
> > =C2=A0 ...
> > =C2=A0=C2=A0 Maximum:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10 4 3 4 3 ... 5 (u=
s)
> >=20
> > Exclude isolated cores from the timer migration algorithm, extend
> > the
> > concept of unavailable cores, currently used for offline ones, to
> > isolated ones:
> > * A core is unavailable if isolated or offline;
> > * A core is available if isolated and offline;
> I think you mean "A core is available if NOT isolated and NOT
> offline".=20
> Right?

Yes, of course.. My bad. Thanks for spotting.

> >=20
> > A core is considered unavailable as idle if:
> > * is in the isolcpus list
> > * is in the nohz_full list
> > * is in an isolated cpuset
> >=20
> > Due to how the timer migration algorithm works, any CPU part of the
> > hierarchy can have their global timers pulled by remote CPUs and
> > have to
> > pull remote timers, only skipping pulling remote timers would break
> > the
> > logic.
> > For this reason, we prevents isolated CPUs from pulling remote
> > global
> > timers, but also the other way around: any global timer started on
> > an
> > isolated CPU will run there. This does not break the concept of
> > isolation (global timers don't come from outside the CPU) and, if
> > considered inappropriate, can usually be mitigated with other
> > isolation
> > techniques (e.g. IRQ pinning).
> >=20
> > Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> > ---
> > =C2=A0 include/linux/timer.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 6 ++++++
> > =C2=A0 kernel/cgroup/cpuset.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 14 ++++++++------
> > =C2=A0 kernel/time/tick-internal.h=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 kernel/time/timer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 10 ++++++++++
> > =C2=A0 kernel/time/timer_migration.c | 24 +++++++++++++++++++++---
> > =C2=A0 5 files changed, 46 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/include/linux/timer.h b/include/linux/timer.h
> > index 10596d7c3a346..4722e075d9843 100644
> > --- a/include/linux/timer.h
> > +++ b/include/linux/timer.h
> > @@ -190,4 +190,10 @@ int timers_dead_cpu(unsigned int cpu);
> > =C2=A0 #define timers_dead_cpu		NULL
> > =C2=A0 #endif
> > =C2=A0=20
> > +#if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
> > +extern void tmigr_isolated_exclude_cpumask(cpumask_var_t
> > exclude_cpumask);
> > +#else
> > +static inline void tmigr_isolated_exclude_cpumask(cpumask_var_t
> > exclude_cpumask) { }
> > +#endif
> > +
> > =C2=A0 #endif
> > diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> > index 306b604300914..866b4b8188118 100644
> > --- a/kernel/cgroup/cpuset.c
> > +++ b/kernel/cgroup/cpuset.c
> > @@ -1323,7 +1323,7 @@ static bool partition_xcpus_del(int old_prs,
> > struct cpuset *parent,
> > =C2=A0=C2=A0	return isolcpus_updated;
> > =C2=A0 }
> > =C2=A0=20
> > -static void update_unbound_workqueue_cpumask(bool
> > isolcpus_updated)
> > +static void update_exclusion_cpumasks(bool isolcpus_updated)
> > =C2=A0 {
> > =C2=A0=C2=A0	int ret;
> > =C2=A0=20
> > @@ -1334,6 +1334,8 @@ static void
> > update_unbound_workqueue_cpumask(bool isolcpus_updated)
> > =C2=A0=20
> > =C2=A0=C2=A0	ret =3D workqueue_unbound_exclude_cpumask(isolated_cpus);
> > =C2=A0=C2=A0	WARN_ON_ONCE(ret < 0);
> > +
> > +	tmigr_isolated_exclude_cpumask(isolated_cpus);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 /**
> > @@ -1454,7 +1456,7 @@ static int remote_partition_enable(struct
> > cpuset *cs, int new_prs,
> > =C2=A0=C2=A0	list_add(&cs->remote_sibling, &remote_children);
> > =C2=A0=C2=A0	cpumask_copy(cs->effective_xcpus, tmp->new_cpus);
> > =C2=A0=C2=A0	spin_unlock_irq(&callback_lock);
> > -	update_unbound_workqueue_cpumask(isolcpus_updated);
> > +	update_exclusion_cpumasks(isolcpus_updated);
> > =C2=A0=C2=A0	cpuset_force_rebuild();
> > =C2=A0=C2=A0	cs->prs_err =3D 0;
> > =C2=A0=20
> > @@ -1495,7 +1497,7 @@ static void remote_partition_disable(struct
> > cpuset *cs, struct tmpmasks *tmp)
> > =C2=A0=C2=A0	compute_effective_exclusive_cpumask(cs, NULL, NULL);
> > =C2=A0=C2=A0	reset_partition_data(cs);
> > =C2=A0=C2=A0	spin_unlock_irq(&callback_lock);
> > -	update_unbound_workqueue_cpumask(isolcpus_updated);
> > +	update_exclusion_cpumasks(isolcpus_updated);
> > =C2=A0=C2=A0	cpuset_force_rebuild();
> > =C2=A0=20
> > =C2=A0=C2=A0	/*
> > @@ -1563,7 +1565,7 @@ static void remote_cpus_update(struct cpuset
> > *cs, struct cpumask *xcpus,
> > =C2=A0=C2=A0	if (xcpus)
> > =C2=A0=C2=A0		cpumask_copy(cs->exclusive_cpus, xcpus);
> > =C2=A0=C2=A0	spin_unlock_irq(&callback_lock);
> > -	update_unbound_workqueue_cpumask(isolcpus_updated);
> > +	update_exclusion_cpumasks(isolcpus_updated);
> > =C2=A0=C2=A0	if (adding || deleting)
> > =C2=A0=C2=A0		cpuset_force_rebuild();
> > =C2=A0=20
> > @@ -1906,7 +1908,7 @@ static int
> > update_parent_effective_cpumask(struct cpuset *cs, int cmd,
> > =C2=A0=C2=A0		WARN_ON_ONCE(parent->nr_subparts < 0);
> > =C2=A0=C2=A0	}
> > =C2=A0=C2=A0	spin_unlock_irq(&callback_lock);
> > -	update_unbound_workqueue_cpumask(isolcpus_updated);
> > +	update_exclusion_cpumasks(isolcpus_updated);
> > =C2=A0=20
> > =C2=A0=C2=A0	if ((old_prs !=3D new_prs) && (cmd =3D=3D partcmd_update))
> > =C2=A0=C2=A0		update_partition_exclusive_flag(cs, new_prs);
> > @@ -2931,7 +2933,7 @@ static int update_prstate(struct cpuset *cs,
> > int new_prs)
> > =C2=A0=C2=A0	else if (isolcpus_updated)
> > =C2=A0=C2=A0		isolated_cpus_update(old_prs, new_prs, cs-
> > >effective_xcpus);
> > =C2=A0=C2=A0	spin_unlock_irq(&callback_lock);
> > -	update_unbound_workqueue_cpumask(isolcpus_updated);
> > +	update_exclusion_cpumasks(isolcpus_updated);
> > =C2=A0=20
> > =C2=A0=C2=A0	/* Force update if switching back to member & update
> > effective_xcpus */
> > =C2=A0=C2=A0	update_cpumasks_hier(cs, &tmpmask, !new_prs);
> > diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-
> > internal.h
> > index faac36de35b9e..75580f7c69c64 100644
> > --- a/kernel/time/tick-internal.h
> > +++ b/kernel/time/tick-internal.h
> > @@ -167,6 +167,7 @@ extern void
> > fetch_next_timer_interrupt_remote(unsigned long basej, u64 basem,
> > =C2=A0 extern void timer_lock_remote_bases(unsigned int cpu);
> > =C2=A0 extern void timer_unlock_remote_bases(unsigned int cpu);
> > =C2=A0 extern bool timer_base_is_idle(void);
> > +extern bool timer_base_remote_is_idle(unsigned int cpu);
> > =C2=A0 extern void timer_expire_remote(unsigned int cpu);
> > =C2=A0 # endif
> > =C2=A0 #else /* CONFIG_NO_HZ_COMMON */
> > diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> > index 4d915c0a263c3..f04960091eba9 100644
> > --- a/kernel/time/timer.c
> > +++ b/kernel/time/timer.c
> > @@ -2162,6 +2162,16 @@ bool timer_base_is_idle(void)
> > =C2=A0=C2=A0	return __this_cpu_read(timer_bases[BASE_LOCAL].is_idle);
> > =C2=A0 }
> > =C2=A0=20
> > +/**
> > + * timer_base_remote_is_idle() - Return whether timer base is set
> > idle for cpu
> > + *
> > + * Returns value of local timer base is_idle value for remote cpu.
> > + */
> > +bool timer_base_remote_is_idle(unsigned int cpu)
> > +{
> > +	return per_cpu(timer_bases[BASE_LOCAL].is_idle, cpu);
> > +}
> > +
> > =C2=A0 static void __run_timer_base(struct timer_base *base);
> > =C2=A0=20
> > =C2=A0 /**
> > diff --git a/kernel/time/timer_migration.c
> > b/kernel/time/timer_migration.c
> > index 1fae38fbac8c2..6fe6ca798e98d 100644
> > --- a/kernel/time/timer_migration.c
> > +++ b/kernel/time/timer_migration.c
> > @@ -10,6 +10,7 @@
> > =C2=A0 #include <linux/spinlock.h>
> > =C2=A0 #include <linux/timerqueue.h>
> > =C2=A0 #include <trace/events/ipi.h>
> > +#include <linux/sched/isolation.h>
> > =C2=A0=20
> > =C2=A0 #include "timer_migration.h"
> > =C2=A0 #include "tick-internal.h"
> > @@ -1445,7 +1446,7 @@ static long tmigr_trigger_active(void
> > *unused)
> > =C2=A0=20
> > =C2=A0 static int tmigr_cpu_unavailable(unsigned int cpu)
> > =C2=A0 {
> > -	struct tmigr_cpu *tmc =3D this_cpu_ptr(&tmigr_cpu);
> > +	struct tmigr_cpu *tmc =3D per_cpu_ptr(&tmigr_cpu, cpu);
> > =C2=A0=C2=A0	int migrator;
> > =C2=A0=C2=A0	u64 firstexp;
> > =C2=A0=20
> > @@ -1472,15 +1473,18 @@ static int tmigr_cpu_unavailable(unsigned
> > int cpu)
> > =C2=A0=20
> > =C2=A0 static int tmigr_cpu_available(unsigned int cpu)
> > =C2=A0 {
> > -	struct tmigr_cpu *tmc =3D this_cpu_ptr(&tmigr_cpu);
> > +	struct tmigr_cpu *tmc =3D per_cpu_ptr(&tmigr_cpu, cpu);
> > =C2=A0=20
> > =C2=A0=C2=A0	/* Check whether CPU data was successfully initialized */
> > =C2=A0=C2=A0	if (WARN_ON_ONCE(!tmc->tmgroup))
> > =C2=A0=C2=A0		return -EINVAL;
> > =C2=A0=20
> > +	/* Isolated CPUs don't participate in timer migration */
> > +	if (cpu_is_isolated(cpu))
> > +		return 0;
>=20
> There are two main sets of isolated CPUs used by cpu_is_isolated() -=20
> boot-time isolated CPUs via "isolcpus" and "nohz_full" boot command
> time=20
> options and runtime isolated CPUs via cpuset isolated partitions. The
> check for runtime isolated CPUs is redundant here as those CPUs won't
> be=20
> passed to tmigr_cpu_available().=C2=A0

Since tmigr_cpu_available is shared between isolated and offline CPUs,
I added this check also to make sure bringing an isolated CPU back
online won't make it available for tmigr.

> So this call is effectively removing
> the boot time isolated CPUs away from the available cpumask
> especially=20
> during the boot up process. Maybe you can add some comment about this
> behavioral change.
>=20

Do you mean I should make clear that the check in tmigr_cpu_available
is especially meaningful at boot time (i.e. when CPUs are first brought
online)?

Yeah, I probably should, good point. I had that kind of comment in v1
while allocating the mask and removed it while changing a few things.

I'm going to make that comment more verbose to clarify when exactly
it's needed.

>=20
> > =C2=A0=C2=A0	raw_spin_lock_irq(&tmc->lock);
> > =C2=A0=C2=A0	trace_tmigr_cpu_available(tmc);
> > -	tmc->idle =3D timer_base_is_idle();
> > +	tmc->idle =3D timer_base_remote_is_idle(cpu);
> > =C2=A0=C2=A0	if (!tmc->idle)
> > =C2=A0=C2=A0		__tmigr_cpu_activate(tmc);
> > =C2=A0=C2=A0	tmc->available =3D true;
> > @@ -1489,6 +1493,20 @@ static int tmigr_cpu_available(unsigned int
> > cpu)
> > =C2=A0=C2=A0	return 0;
> > =C2=A0 }
> > =C2=A0=20
> > +void tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask)
> > +{
> > +	int cpu;
> > +
> > +	lockdep_assert_cpus_held();
> > +
> > +	for_each_cpu_and(cpu, exclude_cpumask,
> > tmigr_available_cpumask)
> > +		tmigr_cpu_unavailable(cpu);
> > +
> > +	for_each_cpu_andnot(cpu, cpu_online_mask, exclude_cpumask)
> > +		if (!cpumask_test_cpu(cpu,
> > tmigr_available_cpumask))
> > +			tmigr_cpu_available(cpu);
> > +}
> > +
> > =C2=A0 static void tmigr_init_group(struct tmigr_group *group, unsigned
> > int lvl,
> > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 int node)
> > =C2=A0 {
>=20
> So far, I haven't seen any major issue with this patch series.
>=20

Thanks for the review!

Cheers,
Gabriele

