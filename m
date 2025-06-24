Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D14322069F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752369; cv=none; b=Qiw0bDzweXihoLhdsWiCB5z/LCAvpgx8tIOs+fGPWSXVq3zYo0YoVatMx2IKMb/0XdBc9pECTL0bQ4AKP7pj1UDlVNJN8f8Y5MBF/8Bf2M7n6X6D4qzABQb7GmEVp5Axd/bSwHUkpVN1WH6hevoRCUNFKvM4t0gzHEijUcR4mew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752369; c=relaxed/simple;
	bh=Ah7h8wOcdYjSV31tNGQmqTVpLKLc/cwOyHoKfByryro=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ar0J9u3QJO1ZpXMnudlTvjV3S5IByQacrRx3EOBlBsYEE/HTtSmmUzYcVO0M5O23ywMkJTrPyiuE2o88GrXfi+btqU9ma7BVeGDFy8WPyZujrRI4rMBT8Y9BS0GZGYuRbxWwGq5SOBya1x7vozi62ScqNW/YWZqITfHPbAvGa9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZO9PrqJZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZO9PrqJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750752366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tppJBTpf5U7C6ZhUseA/Y53OJ6NH6kfGsbKmrLZtR6U=;
	b=ZO9PrqJZXaKjZCBanhqGrpnXOJDbLWzrA/E++TOjPG2ARbGHoyJe0gECPuxDhuwbmGImZA
	gGUSRlM1spw/bx6VO614jvBGJ3ppTE51h8x534K3Ir3gHm/Z7N7UGqH5jxYWMxDXoI1t7m
	05mZfrGvF+384fr+DSOGxJKK9I4W5AQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-DHSrHljKOriBV8ek364gog-1; Tue, 24 Jun 2025 04:06:03 -0400
X-MC-Unique: DHSrHljKOriBV8ek364gog-1
X-Mimecast-MFC-AGG-ID: DHSrHljKOriBV8ek364gog_1750752362
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso2904299f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750752361; x=1751357161;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tppJBTpf5U7C6ZhUseA/Y53OJ6NH6kfGsbKmrLZtR6U=;
        b=oxqMwttoYX7F6ONbrlyY9yCpBxOyIl1arQEKd/YO4Yh/AmTdsOIUeZTWm5MVqjnOcL
         7bjcdCtEcTUvOUvRkMCUCD76zLz73lcvXt6wZNkLfwgUX1MK9J9Dy5+W5N5S0mXjRNFD
         8n6SfDjJyob2VIbf1BhXZNDW9tE+UEvU1EJLiIhlwp1RphZU3LrfIOc+slR9pyevKdQF
         T8Ft7xqhzdtlfsocwcTYrMcsf8Hqt1jZLDe+4pDdFHRXoCp+q0r5+qxWHKObAFol955l
         WzTzvv1Lq4EtSiE7MrjhTAuYnyPy7tHixTrZXDedIK+itVeU/O2aWohN7e6AbVFMbz/+
         N8Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUhQ2MxclNebMEQkRqdD2tjOZ98t96syRjcDgPlzyHT8S2DIAMFlYzqYDuKaKHG8CPgN1ftnLJhHcTMpik=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJszDd1PilS3ghcsBXoreWHuSV4qt5WrRuL7rhoobjGcwLyMx+
	ZmM1x3JCbqirkjfj/eIxRTipSDtZNYU8vmGjdtoeg/EUfgDVc81iov6fpie1lrLqlgMhQVFQucc
	jxMvLmLISMWilOjA17us9x6YpsO2IIsi1/ssFFHSi3rnfxcDfbtsUR+QCXHUJ2n2pkQ==
X-Gm-Gg: ASbGnct1CpB2EZfx7nXdtBrxFl1q+Mw8sg0AeZGUxl76ePYLfT8GJfFXianMhuCmc9Y
	U2vb677kKtbjS1+02i52Jj6Nt3hF0+zwPvGLmUShfl5UKEyKYOFDQrRB6fcSgqW2MyUHWJdNML/
	KM3aKW4XtgmvVrosXTBlq8waJFkvzfNMLG4G4eV/l/EwKaTR+TE5LIghyfq8OtDZyRotcHWdVzT
	SZVDeM68JPtwHEH6Mvc48PKnF13ycxzhsn8e311MbiVSinMwhJyJvKzGOHGrQyACJ3r4YbrgKgF
	K0nPDz8u+PHNDbA18WVAr+5GTyA7rPKxAeKTyEmXTMlcTrYt
X-Received: by 2002:a05:6000:310e:b0:3a4:f893:3f03 with SMTP id ffacd0b85a97d-3a6d132c97emr13930023f8f.45.1750752361525;
        Tue, 24 Jun 2025 01:06:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYEBIjUpcilFoKp9NigSCHLoUqcEDnQrrsnt8YNSI/zd7K7bBEe/c8JUVgpF01y6bp/3ph5w==
X-Received: by 2002:a05:6000:310e:b0:3a4:f893:3f03 with SMTP id ffacd0b85a97d-3a6d132c97emr13929979f8f.45.1750752360977;
        Tue, 24 Jun 2025 01:06:00 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2525sm1296307f8f.52.2025.06.24.01.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 01:06:00 -0700 (PDT)
Message-ID: <b33dcafca895da1d9c64a7d6ab771952a932e579.camel@redhat.com>
Subject: Re: [PATCH v6 6/6] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, Waiman Long <longman@redhat.com>
Date: Tue, 24 Jun 2025 10:05:59 +0200
In-Reply-To: <875xgqqrel.ffs@tglx>
References: <20250530142031.215594-1-gmonaco@redhat.com>
	 <20250530142031.215594-7-gmonaco@redhat.com> <875xgqqrel.ffs@tglx>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Fri, 2025-06-20 at 19:00 +0200, Thomas Gleixner wrote:
> On Fri, May 30 2025 at 16:20, Gabriele Monaco wrote:
>=20
> timer migation?
>=20
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
> > =C2=A0# oslat -c 1-31,33-63,65-95,97-127 -D 62s
> > =C2=A0...
> > =C2=A0 Maximum:=C2=A0=C2=A0=C2=A0=C2=A0 1203 10 3 4 ... 5 (us)
> >=20
> > after the change:
> >=20
> > =C2=A0# oslat -c 1-31,33-63,65-95,97-127 -D 62s
> > =C2=A0...
> > =C2=A0 Maximum:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10 4 3 4 3 ... 5 (us)
>=20
> It's nice to add numbers, but you should out them at the end _after_
> you
> described the change. At this point 'after the change' makes no sense
> as
> the reader does not read backwards or jumps around randomly in the
> text.
>=20
> > Exclude isolated cores from the timer migration algorithm, extend
> > the
> > concept of unavailable cores, currently used for offline ones, to
> > isolated ones:
> > * A core is unavailable if isolated or offline;
> > * A core is available if isolated and offline;
> >=20
> > A core is considered unavailable as isolated if it belongs to:
> > * the isolcpus (domain) list
> > * an isolated cpuset
> > Except if it is:
> > * in the nohz_full list (already idle for the hierarchy)
> > * the nohz timekeeper core (must be available to handle global
> > timers)
> >=20
> > Due to how the timer migration algorithm works, any CPU part of the
> > hierarchy can have their global timers pulled by remote CPUs and
> > have to
> > pull remote timers, only skipping pulling remote timers would break
> > the
> > logic.
> > For this reason, we prevent isolated CPUs from pulling remote
> > global
>=20
> s/we//
>=20
> > timers, but also the other way around: any global timer started on
> > an
> > isolated CPU will run there. This does not break the concept of
> > isolation (global timers don't come from outside the CPU) and, if
> > considered inappropriate, can usually be mitigated with other
> > isolation
> > techniques (e.g. IRQ pinning).
>=20
> > +#if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
> > +extern int tmigr_isolated_exclude_cpumask(cpumask_var_t
> > exclude_cpumask);
>=20
> s/cpumask_var_t/struct cpumask */
>=20
> cpumask_var_t is only for declaration purposes to avoid ifdeffery,
> but a
> function always gets a pointer to the cpumask itself.
>=20
> > diff --git a/kernel/time/timer_migration.c
> > b/kernel/time/timer_migration.c
> > index 25439f961ccf8..a14fbca7457fe 100644
> > --- a/kernel/time/timer_migration.c
> > +++ b/kernel/time/timer_migration.c
> > @@ -10,6 +10,7 @@
> > =C2=A0#include <linux/spinlock.h>
> > =C2=A0#include <linux/timerqueue.h>
> > =C2=A0#include <trace/events/ipi.h>
> > +#include <linux/sched/isolation.h>
> > =C2=A0
> > =C2=A0#include "timer_migration.h"
> > =C2=A0#include "tick-internal.h"
> > @@ -1449,6 +1450,13 @@ static int tmigr_cpu_unavailable(unsigned
> > int cpu)
> > =C2=A0	int migrator;
> > =C2=A0	u64 firstexp;
> > =C2=A0
> > +	/*
> > +	 * The tick CPU can be marked as isolated by the cpuset
> > code, however
> > +	 * we cannot mark it as unavailable to avoid having no
> > global migrator
> > +	 * for the nohz_full CPUs.
> > +	 */
> > +	if (!tick_nohz_cpu_hotpluggable(cpu))
> > +		return 0;
>=20
> This is really horribly confusing. This function is also invoked from
> the CPU offline hotplug callback and in context of CPU hotplug this
> check makes absolutely no sense at all.
>=20
> Please do this check in the smp function call which handles this
> isolation muck.
>=20
> > =C2=A0	raw_spin_lock_irq(&tmc->lock);
> > =C2=A0	tmc->available =3D false;
>=20
> This clearly lacks a check whether available is true or not. If it's
> false, it must return right here.
>=20
> To avoid goto or whatever ugly please convert that locking to a
> scoped
> guard in a seperate patch. Then you can simply do
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tmc->available)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	=C2=A0 return 0;
>=20
> inside the lock scope and the compiler will mop it up for you.
>=20
> > =C2=A0	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
> > @@ -1478,6 +1486,20 @@ static int tmigr_cpu_available(unsigned int
> > cpu)
> > =C2=A0	if (WARN_ON_ONCE(!tmc->tmgroup))
> > =C2=A0		return -EINVAL;
> > =C2=A0
> > +	/*
> > +	 * Domain isolated CPUs don't participate in timer
> > migration, nohz_full
> > +	 * CPUs are still part of the hierarchy but are always
> > considered idle.
> > +	 * Additionally, the tick CPU during nohz_full cannot be
> > disabled.
> > +	 * Checking here guarantees that CPUs isolated at boot
> > (e.g. isolcpus)
> > +	 * are not marked as available when they first become
> > online.
> > +	 * During runtime, any offline isolated CPU is also not
> > incorrectly
> > +	 * marked as available once it gets back online.
> > +	 */
> > +	if ((!housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 cpuset_cpu_is_isolated(cpu)) &&
> > +	=C2=A0=C2=A0=C2=A0 housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) &&
> > +	=C2=A0=C2=A0=C2=A0 tick_nohz_cpu_hotpluggable(cpu))
> > +		return 0;
>=20
> Same nonsense as above.
>=20

Thanks for the review, I agree with moving the check above, but I
believe this should remain here.

tmigr_cpu_available is called at boot time and is applying also the
boot time isolation parameters (tmigr_isolated_exclude_cpumask is only
used by the cpuset code).

Now let's assume a machine booted with the arguments isolcpus=3D0-3
nohz_full=3D5-7.

Without checking for tick_nohz_cpu_hotpluggable() here, we would not
set the tick cpu (0) as available at boot, ending up in the unwanted
corner cases discussed in the v5 of the series.

I could remove this call here (which is mostly redundant after boot)
and enable explicitly the tick cpu in another way, but this still seems
cleaner to me.

Does it make sense to you? Is the comment in the code unclear?

Thanks again,
Gabriele

> > =C2=A0	raw_spin_lock_irq(&tmc->lock);
>=20
> Same missing check for available =3D=3D true
>=20
> > =C2=A0	trace_tmigr_cpu_available(tmc);
> > =C2=A0	tmc->idle =3D timer_base_is_idle();
> > @@ -1489,6 +1511,38 @@ static int tmigr_cpu_available(unsigned int
> > cpu)
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > +static void tmigr_remote_cpu_unavailable(void *ignored)
>=20
> This is a SMP function call so what's the _remote_ for? It runs on
> the
> CPU on which the call is scheduled. Please make it entirely clear
> what
> this is about. This is about isolation and not about available. The
> fact
> that it sets/clears the availability is just an implementation
> detail.
>=20
> static void timgr_cpu_isolate(void *ignored)
> {
> 	unsigned int cpu =3D smp_processor_id();
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Big fat comment */
> 	if (!tick_nohz_cpu_hotpluggable(cpu))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0	return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=20
> 	tmigr_set_cpu_available(cpu);
> }
>=20
> > +{
> > +	tmigr_cpu_unavailable(smp_processor_id());
> > +}
> > +
> > +static void tmigr_remote_cpu_available(void *ignored)
> > +{
> > +	tmigr_cpu_available(smp_processor_id());
> > +}
> > +
> > +int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask)
> > +{
> > +	cpumask_var_t cpumask;
> > +	int ret =3D 0;
> > +
> > +	lockdep_assert_cpus_held();
> > +
> > +	if (!alloc_cpumask_var(&cpumask, GFP_KERNEL))
> > +		return -ENOMEM;
> > +
> > +	cpumask_and(cpumask, exclude_cpumask,
> > tmigr_available_cpumask);
> > +	cpumask_and(cpumask, cpumask,
> > housekeeping_cpumask(HK_TYPE_KERNEL_NOISE));
> > +	on_each_cpu_mask(cpumask, tmigr_remote_cpu_unavailable,
> > NULL, 0);
>=20
> Why are those function calls async?
>=20
> Shouldn't it be guaranteed that the change has been committed once
> this
> function returns? If not then this wants a comment why it does not
> matter.
>=20
> Thanks,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tglx

