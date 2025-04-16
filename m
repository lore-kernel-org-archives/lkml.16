Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718181C84AE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744784630; cv=none; b=ENjNxDO2JtoOR1ycTpyCevY1Sp+kDZn5He0cAFyh8cwHK2HBlUWSw+V3Tl3cOLTtleI2WIy5IReDVIMaWksuB9oQsWUUn3d6jw/BqHom4qaMqfAQLkJE6IF3QcnXLN1CRBi7HD/JS33wKMQN2AHvZct3W4UpmDTw5FN5LiF6gxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744784630; c=relaxed/simple;
	bh=/VjAUjomqIY7T/7SnufXLQP49Zay0aF8kj1q66lQeM0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bn9jf1kY92PCnOfEhMa77qDQfs1ZqYW0c3UXUEGJIEiM/607X5BJJh6sbNX1qmkb7rTTgh5GnWgE4j1DtyrGDhINjbUClV9roh5xVYuPk6kkBIoVZKnzWHX958UJtS3RNB35chxmX6Bra5zno/KsuqeJx9iwR3UcZPS5tM+PchA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DAcepUm5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DAcepUm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744784627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/VjAUjomqIY7T/7SnufXLQP49Zay0aF8kj1q66lQeM0=;
	b=DAcepUm5j9s8OBdluGM96XI5fTTWf3Hf03cM8IoB5+osxtQf07x+GzfiF/O4XQDRI1JNIw
	hvwt2TK8AkAOBZIMbQfovNqv3bgo3FcY6XcnGMUYUOOapJvI/MOkKdkZHhrXvvXEH2lHkL
	xTqRh7zw7fK8ys0ZKfqltG6vVWWGhqM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-B9EqXy-DOb6ChuHtjk3QGg-1; Wed, 16 Apr 2025 02:23:45 -0400
X-MC-Unique: B9EqXy-DOb6ChuHtjk3QGg-1
X-Mimecast-MFC-AGG-ID: B9EqXy-DOb6ChuHtjk3QGg_1744784624
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39130f02631so2622076f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744784624; x=1745389424;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VjAUjomqIY7T/7SnufXLQP49Zay0aF8kj1q66lQeM0=;
        b=QBkSaJ3OwvvWjQdyX0ixV+yEBDRn7piTAxrwvj4vglB88S39M/gQQC5p8YiV3tfvpH
         0dvKQ75ZbLZpKy7nfrFKAZfYgMzalJozN55gXoNf6AQAwIzHDmtKe0JhhQ51PSTGWUry
         AoniMtvEe/CX1e90duqG/aFfFhdjpz+dVUqy42FFvf2YaZiCO+JNLmHL6uJjJUQdqccc
         BG0Vf/OAwdJjGEA0ihihOkpXE9K/VDpaFKJdP0dPOmR2+/ni1dxf6fGDhyEV1/MDCDmq
         CrIQNmYVnO2h2yvNlm67bAVjo4RHBTpUO3NL8PwF/+0PLk0HWYHhTJcmgWHtPdxOixIw
         QBtw==
X-Forwarded-Encrypted: i=1; AJvYcCU6TC/cXsMBkDMmBrMOmenuXj+5uVH1OrS6gTpGyJUMaQ5wbb9HY3ZwNSAV/lUyxaz29Vw4Ek1Li02UCNw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt6jcsCu0NtnpFd+s4b1HCM4XowI++V6gk/nFxMv3CUKGfncWn
	W8cgHweAvQZjFioqLCY7irU0u8LxKId5hH2swOvQsGP1vrR/d1caSgCDadPtZAi8IqfBdPHgb/W
	aVvXPD2hJd+M1XfITtcTgbONxPMjGJM76d/1FZ2bV3zACXDHMHK9lncBN0xAm077v3T9I5gDL
X-Gm-Gg: ASbGncuML11D07Ta1NP5DYX5GiCH4hYCDIcWiEGfrWcpMA4JMNEmEg4of676HZkF5q/
	O1Ef/oKq8B17ixBT2kLLWjF2kjIjpfh+XfWBJMnJxT8YO0+EHg4YqruxJ6xpGyaKPTj5qE11GAr
	vuri0ffbiyEUu4b9SH4QvNBbiWYO/4W+E1uYIsK1rfQIvQRUT3A1OLD4rOPBEfCfww5Xe9zwRiR
	ldfee8ItfOX2LebgQN/lTZK4HrwCTUIHBfBoavRQRvmFY1RtGJ2GAsinGtqojxxaZAXc5QPc3bK
	30B8JqVeTCPwlCYy8n1aTCp/Iqwe3EI9mP6GKg==
X-Received: by 2002:a05:6000:2507:b0:39c:142d:c0a with SMTP id ffacd0b85a97d-39ee5b16eacmr457855f8f.19.1744784624104;
        Tue, 15 Apr 2025 23:23:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPKB2Ckd8zsjrgqzZeqJfMRygUgVOcup8xMYyFdDHr1rFw3OpdSsSBtHMwSwEXkBVh1HCwvw==
X-Received: by 2002:a05:6000:2507:b0:39c:142d:c0a with SMTP id ffacd0b85a97d-39ee5b16eacmr457836f8f.19.1744784623704;
        Tue, 15 Apr 2025 23:23:43 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c03dsm15853305f8f.24.2025.04.15.23.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 23:23:43 -0700 (PDT)
Message-ID: <9512432189461cad59402c78c386ec3132b1e668.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Waiman Long <llong@redhat.com>, linux-kernel@vger.kernel.org, Frederic
 Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Date: Wed, 16 Apr 2025 08:23:41 +0200
In-Reply-To: <593e1001-09fa-452f-a8f9-1dfd4f2111d7@redhat.com>
References: <20250415102500.100415-5-gmonaco@redhat.com>
	 <20250415102500.100415-8-gmonaco@redhat.com>
	 <6c9ee628-26d1-423e-801a-2922683d004d@redhat.com>
	 <24ae2496778a207faad9edb36dbfef0f02578d72.camel@redhat.com>
	 <593e1001-09fa-452f-a8f9-1dfd4f2111d7@redhat.com>
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



On Tue, 2025-04-15 at 22:24 -0400, Waiman Long wrote:
> On 4/15/25 11:49 AM, Gabriele Monaco wrote:
> >=20
> > On Tue, 2025-04-15 at 11:30 -0400, Waiman Long wrote:
> > > On 4/15/25 6:25 AM, Gabriele Monaco wrote:
> > > > The timer migration mechanism allows active CPUs to pull timers
> > > > from
> > > > idle ones to improve the overall idle time. This is however
> > > > undesired
> > > > when CPU intensive workloads run on isolated cores, as the
> > > > algorithm
> > > > would move the timers from housekeeping to isolated cores,
> > > > negatively
> > > > affecting the isolation.
> > > >=20
> > > > This effect was noticed on a 128 cores machine running oslat on
> > > > the
> > > > isolated cores (1-31,33-63,65-95,97-127). The tool monopolises
> > > > CPUs,
> > > > and the CPU with lowest count in a timer migration hierarchy
> > > > (here
> > > > 1
> > > > and 65) appears as always active and continuously pulls global
> > > > timers,
> > > > from the housekeeping CPUs. This ends up moving driver work
> > > > (e.g.
> > > > delayed work) to isolated CPUs and causes latency spikes:
> > > >=20
> > > > before the change:
> > > >=20
> > > > =C2=A0=C2=A0 # oslat -c 1-31,33-63,65-95,97-127 -D 62s
> > > > =C2=A0=C2=A0 ...
> > > > =C2=A0=C2=A0=C2=A0 Maximum:=C2=A0=C2=A0=C2=A0=C2=A0 1203 10 3 4 ...=
 5 (us)
> > > >=20
> > > > after the change:
> > > >=20
> > > > =C2=A0=C2=A0 # oslat -c 1-31,33-63,65-95,97-127 -D 62s
> > > > =C2=A0=C2=A0 ...
> > > > =C2=A0=C2=A0=C2=A0 Maximum:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10 4 3 4 =
3 ... 5 (us)
> > > >=20
> > > > Exclude isolated cores from the timer migration algorithm,
> > > > extend
> > > > the
> > > > concept of unavailable cores, currently used for offline ones,
> > > > to
> > > > isolated ones:
> > > > * A core is unavailable if isolated or offline;
> > > > * A core is available if isolated and offline;
> > > I think you mean "A core is available if NOT isolated and NOT
> > > offline".
> > > Right?
> > Yes, of course.. My bad. Thanks for spotting.
> >=20
> > > > A core is considered unavailable as idle if:
> What do you mean by "unavailable as idle"? An idle CPU is different
> from=20
> an unvailable CPU, I think.

Here I mean unavailable for tmigr, see below for why I got that term.
If you find it misleading I could look for a better term to represent
the concept.

> > > > * is in the isolcpus list
> > > > * is in the nohz_full list
> > > > * is in an isolated cpuset
> > > >=20
> > > > Due to how the timer migration algorithm works, any CPU part of
> > > > the
> > > > hierarchy can have their global timers pulled by remote CPUs
> > > > and
> > > > have to
> > > > pull remote timers, only skipping pulling remote timers would
> > > > break
> > > > the
> > > > logic.
> > > > For this reason, we prevents isolated CPUs from pulling remote
> > > > global
> > > > timers, but also the other way around: any global timer started
> > > > on
> > > > an
> > > > isolated CPU will run there. This does not break the concept of
> > > > isolation (global timers don't come from outside the CPU) and,
> > > > if
> > > > considered inappropriate, can usually be mitigated with other
> > > > isolation
> > > > techniques (e.g. IRQ pinning).
>=20
> BTW, I am not that familiar with the timer migration code. Does
> marking=20
> an isolated CPU as unavailable (previously offline) make the above=20
> behavior happen?
>=20
> Now unavailable CPUs include the isolated CPUs. We may need to look
> at=20
> some of the online (now available) flag check within the timer
> migration=20
> code to make sure that they are still doing the right thing.
>=20

The original tmigr code excludes offline CPUs from the hierarchy, those
clearly won't have timers and everything works.
This series changes that concept to unavailable (I took the name from
tmigr_is_not_available, which used to check if a CPU was online and
initialised for tmigr) to also include isolated CPUs.

A CPU is then unavailable because it's offline, isolated or both, this
effectively prevents it from joining the hierarchy.
One noticeable difference is that isolated CPUs can still have global
timers, the fact they don't participate in the hierarchy would isolate
also those (which won't migrate). This is what I kind of missed in v1
but acknowledging that, everything seems to work.

That's as far as I could see, of course, reviewers might find some
corner cases I didn't consider.

>=20
> > > > diff --git a/kernel/time/timer_migration.c
> > > > b/kernel/time/timer_migration.c
> > > > index 1fae38fbac8c2..6fe6ca798e98d 100644
> > > > --- a/kernel/time/timer_migration.c
> > > > +++ b/kernel/time/timer_migration.c
> > > > @@ -10,6 +10,7 @@
> > > > =C2=A0=C2=A0 #include <linux/spinlock.h>
> > > > =C2=A0=C2=A0 #include <linux/timerqueue.h>
> > > > =C2=A0=C2=A0 #include <trace/events/ipi.h>
> > > > +#include <linux/sched/isolation.h>
> > > > =C2=A0=C2=A0 =C2=A0=C2=A0 #include "timer_migration.h"
> > > > =C2=A0=C2=A0 #include "tick-internal.h"
> > > > @@ -1445,7 +1446,7 @@ static long tmigr_trigger_active(void
> > > > *unused)
> > > > =C2=A0=C2=A0 =C2=A0=C2=A0 static int tmigr_cpu_unavailable(unsigned=
 int cpu)
> > > > =C2=A0=C2=A0 {
> > > > -=C2=A0=C2=A0=C2=A0 struct tmigr_cpu *tmc =3D this_cpu_ptr(&tmigr_c=
pu);
> > > > +=C2=A0=C2=A0=C2=A0 struct tmigr_cpu *tmc =3D per_cpu_ptr(&tmigr_cp=
u, cpu);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int migrator;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 firstexp;
> > > > =C2=A0=C2=A0 @@ -1472,15 +1473,18 @@ static int
> > > > tmigr_cpu_unavailable(unsigned
> > > > int cpu)
> > > > =C2=A0=C2=A0 =C2=A0=C2=A0 static int tmigr_cpu_available(unsigned i=
nt cpu)
> > > > =C2=A0=C2=A0 {
> > > > -=C2=A0=C2=A0=C2=A0 struct tmigr_cpu *tmc =3D this_cpu_ptr(&tmigr_c=
pu);
> > > > +=C2=A0=C2=A0=C2=A0 struct tmigr_cpu *tmc =3D per_cpu_ptr(&tmigr_cp=
u, cpu);
> > > > =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Check whether =
CPU data was successfully
> > > > initialized */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(!tmc->tmgroup=
))
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=
 -EINVAL;
> > > > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 /* Isolated CPUs don't participate=
 in timer migration
> > > > */
> > > > +=C2=A0=C2=A0=C2=A0 if (cpu_is_isolated(cpu))
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > There are two main sets of isolated CPUs used by
> > > cpu_is_isolated() -
> > > boot-time isolated CPUs via "isolcpus" and "nohz_full" boot
> > > command
> > > time
> > > options and runtime isolated CPUs via cpuset isolated partitions.
> > > The
> > > check for runtime isolated CPUs is redundant here as those CPUs
> > > won't
> > > be
> > > passed to tmigr_cpu_available().
> > Since tmigr_cpu_available is shared between isolated and offline
> > CPUs,
> > I added this check also to make sure bringing an isolated CPU back
> > online won't make it available for tmigr.
> Good point, so the check is indeed needed.
>=20
> >=20
> > > So this call is effectively removing
> > > the boot time isolated CPUs away from the available cpumask
> > > especially
> > > during the boot up process. Maybe you can add some comment about
> > > this
> > > behavioral change.
> > >=20
> > Do you mean I should make clear that the check in
> > tmigr_cpu_available
> > is especially meaningful at boot time (i.e. when CPUs are first
> > brought
> > online)?
>=20
> The current timgr code doesn't look at boot time isolated CPUs. The=20
> cpu_is_isolated() check skips those boot time isolated CPUs from the=20
> mask. I think this should be noted.
>=20

Right, will add a note about that.

Thanks again,
Gabriele

