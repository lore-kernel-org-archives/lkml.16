Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778BC20DD4E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622008; cv=none; b=EklPXdkT0GTOuubNfzIAHjQ/4X29V4G6GWrtUyCM5Fi6tRHDNSSOfCL2P0dDCczo2iIEyjaq7U0AHpFMx5ifhFCRA920Z/Dd9fWEF//J6UIF/Ns6jf0OvD6soVwQy40VgRbfHBxeYXsDyrQULBXX3MIvE4+UhaYIJdBUMsbXhQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622008; c=relaxed/simple;
	bh=ab7vD1qrgRLef6dCele403VZmCEkQ4U5Xk3eXH/6mSc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cFZm9RF4ccVgvTZoCr9iELpLMCu0C8c5E1jopSqgNQTsDcxPP+cut5+Br4sxluvxaZLYkOXsWLeUi+OMRQhK7zWKnIWTm//NRk6Q262JCjxuMTHX3/BD3PZ+1WFT+1J/HIbxTmxWDNoZ9JC2CVF+hhMkJ4z9vP6iOkhi1lvmd6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P7JSU7n9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P7JSU7n9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746622004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=g4HfMw7UFKtkl2HI33JKRB8lo3F8lpAXXzi8OblW2yI=;
	b=P7JSU7n9vH9cC6Tt3Ebg3DNKObZQj6qvKUUx6vZXJSExqHQOYj+B0c6nV82BjMgNHaVcAp
	9TSEvpnTBWwezOIcTPZrO7ChRfdkkdvWM0xiZ//Y66xQBSXdjdZC5mvupuNWZhewkHrfPO
	HpCmqVqrI53JSymLT8ZsFEUllBsvWh4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-fs-tJv_ZO5uQIfoVY2EeNg-1; Wed, 07 May 2025 08:46:43 -0400
X-MC-Unique: fs-tJv_ZO5uQIfoVY2EeNg-1
X-Mimecast-MFC-AGG-ID: fs-tJv_ZO5uQIfoVY2EeNg_1746622002
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442ccf0eb4eso652015e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 05:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622002; x=1747226802;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4HfMw7UFKtkl2HI33JKRB8lo3F8lpAXXzi8OblW2yI=;
        b=aSnEgFyaKQk5gUf7f2QAyXFDI1qRNei8/C6VPmibzAw5vZbEtD26YXlUtrfZ9BZU76
         u5lGBKCzvI69DY3D0jyLulDpD8bmQsSjQVXm53c5W4OEm/jdSGrlu6CRTmsN4/mipt51
         iQLXNA/0P2JETTdADd9iSE2XHm8qTsvuokAgT/HyMiYNMBn3V2e0E3ni1dvaLjTOsy79
         v+PUaPctelb+6yKalGQJAE/O6ZDFdEDaFqrhw/2GPE7r7bVrOUEVkShKtDlWZnEu0lqX
         ymXUA8JUCu91Z4v/VLFRB3XlVLCaFSLikQQHKFuph4/vfz6tif+lbNRLqDpxLRG3EaAR
         osjQ==
X-Gm-Message-State: AOJu0Yww353mcA8G3IzslFWbpsXZAbpCxXoDqf44CDkl62hSUYakfHsQ
	hEGiH57z34N0hF2VCGYaY2D1Mpt3wiqnFbClurxlHPJ9lr2kAdvzyf0+H38I0dw3MgcArTDfT9i
	G9zMi4ZxdS0KqVDEFj59cycQabIfl/OaLXfxJwTAa1yPccmBTJOa4VUU4nhw1Bw==
X-Gm-Gg: ASbGncugfTRFGHVBqZAoCgI41nPfrRvUDFNcNfSNhv0s0C1moCImTl8FoBYzCv3ym/x
	h9VlDnPVLyMD8NmbOSPwvvJFKV9tuPqYHjtRa0jWh4koZ0NA8EuSxbOKwkGvNKrhWnPOXgIb0Zb
	LhxfJMoRzHAukePnJgPAkA65PgNnzNSb4Z3bEdjHDNdtC7vxdE/blQ4oBzf8mb8M79iJxAeB/8N
	yspioiFvCTQJGa7VdKD6xeOxbMcWMMQ7rYkE5XazqhGaYMxMhtXefLoiV0We+G1xGq27CjNXGUq
	MT1G+K3vFcr9nuCIggdPv3DU/uFUcfK0fIFljA==
X-Received: by 2002:a05:6000:18a7:b0:39e:db6a:4744 with SMTP id ffacd0b85a97d-3a0b4a254f0mr2653450f8f.32.1746622001977;
        Wed, 07 May 2025 05:46:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEry8bcC02HfRlhxlsm25H9nDp2cBr5UsTGiRqEJmkLDrjrdawousZi06aMxU8ZgE4ux/eseA==
X-Received: by 2002:a05:6000:18a7:b0:39e:db6a:4744 with SMTP id ffacd0b85a97d-3a0b4a254f0mr2653424f8f.32.1746622001583;
        Wed, 07 May 2025 05:46:41 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b350f604sm3373833f8f.21.2025.05.07.05.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:46:41 -0700 (PDT)
Message-ID: <9b96acdb43b80f067a34b83c5fe9fc3e79f1e3a4.camel@redhat.com>
Subject: Re: [PATCH v4 2/5] timers: Add the available mask in timer migration
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
 Waiman Long <longman@redhat.com>
Date: Wed, 07 May 2025 14:46:39 +0200
In-Reply-To: <aBtRSSCxyHcypo4b@localhost.localdomain>
References: <20250506091534.42117-7-gmonaco@redhat.com>
	 <20250506091534.42117-9-gmonaco@redhat.com>
	 <aBozrJ0C6yzW7oB_@localhost.localdomain>
	 <3f54534266f4405fc3c6943599edd9be88becd57.camel@redhat.com>
	 <aBtRSSCxyHcypo4b@localhost.localdomain>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Wed, 2025-05-07 at 14:25 +0200, Frederic Weisbecker wrote:
> Le Wed, May 07, 2025 at 09:57:38AM +0200, Gabriele Monaco a =C3=A9crit :
> >=20
> >=20
> > On Tue, 2025-05-06 at 18:07 +0200, Frederic Weisbecker wrote:
> > > Le Tue, May 06, 2025 at 11:15:37AM +0200, Gabriele Monaco a =C3=A9cri=
t
> > > :
> > > > Keep track of the CPUs available for timer migration in a
> > > > cpumask.
> > > > This
> > > > prepares the ground to generalise the concept of unavailable
> > > > CPUs.
> > > >=20
> > > > Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> > > > ---
> > > > =C2=A0kernel/time/timer_migration.c | 12 +++++++++++-
> > > > =C2=A01 file changed, 11 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/kernel/time/timer_migration.c
> > > > b/kernel/time/timer_migration.c
> > > > index 7efd897c7959..25439f961ccf 100644
> > > > --- a/kernel/time/timer_migration.c
> > > > +++ b/kernel/time/timer_migration.c
> > > > @@ -422,6 +422,9 @@ static unsigned int tmigr_crossnode_level
> > > > __read_mostly;
> > > > =C2=A0
> > > > =C2=A0static DEFINE_PER_CPU(struct tmigr_cpu, tmigr_cpu);
> > > > =C2=A0
> > > > +/* CPUs available for timer migration */
> > > > +static cpumask_var_t tmigr_available_cpumask;
> > > > +
> > > > =C2=A0#define TMIGR_NONE	0xFF
> > > > =C2=A0#define BIT_CNT		8
> > > > =C2=A0
> > > > @@ -1449,6 +1452,7 @@ static int tmigr_cpu_unavailable(unsigned
> > > > int
> > > > cpu)
> > > > =C2=A0	raw_spin_lock_irq(&tmc->lock);
> > > > =C2=A0	tmc->available =3D false;
> > > > =C2=A0	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
> > > > +	cpumask_clear_cpu(cpu, tmigr_available_cpumask);
> > > > =C2=A0
> > > > =C2=A0	/*
> > > > =C2=A0	 * CPU has to handle the local events on his own, when
> > > > on
> > > > the way to
> > > > @@ -1459,7 +1463,7 @@ static int tmigr_cpu_unavailable(unsigned
> > > > int
> > > > cpu)
> > > > =C2=A0	raw_spin_unlock_irq(&tmc->lock);
> > > > =C2=A0
> > > > =C2=A0	if (firstexp !=3D KTIME_MAX) {
> > > > -		migrator =3D cpumask_any_but(cpu_online_mask,
> > > > cpu);
> > > > +		migrator =3D
> > > > cpumask_any(tmigr_available_cpumask);
> > >=20
> > > Considering nohz_full CPUs should be still available.
> > >=20
> > > I don't think there is anything ensuring that, in nohz_full mode,
> > > there must be at least one housekeeping CPU that is not domain
> > > isolated.
> > >=20
> > > For example if we have two CPUs with CPU 0 being domain isolated
> > > and CPU 1 being nohz_full, then there is no migrator to handle
> > > CPU
> > > 1's
> > > global timers.
> > >=20
> >=20
> > Mmh, good point, didn't think about having the domain isolated and
> > nohz_full maps disjointed..
> >=20
> > When that's really the case how do you think we should fall back?
> >=20
> > In the situation you describe, no one is going to be able to handle
> > global timers on the nohz_full CPUs, right?
> >=20
> > When this situation really occurs, we could keep one of the domain
> > isolated CPUs in the hierarchy.=C2=A0
> > Now, I see on x86 CPU0 cannot be offlined and is not added to
> > nohz_full, which would make things considerably easier, but ARM
> > doesn't
> > seem to work the same way.
> >=20
> > We could elect a lucky winner (e.g. first or last becoming domain
> > isolated) and swap it whenever it becomes offline, until we
> > actually
> > run out of those (no online cpu non-nohz_full is left), but I
> > believe
> > this shouldn't happen..
> >=20
> > Does this make sense to you?
>=20
> Well, nohz_full=3D and isolcpus=3D, when they are passed together, must
> contain the
> same set of CPUs. And if there is no housekeeping CPU then one is
> forced, so
> it's well handled at this point.

I'm not so sure about this one though.
As far as I understand [1], is preventing the user from setting
different CPUs while doing isolcpus=3Dnohz, and nohz_full=3D (which is now
equivalent). But I seem to be able to do isolcpus=3D0-3 and nohz_full=3D4-7
without any problem and I believe I'd hit the issue you're mentioning.
(The same would work if I swap the masks as 0 cannot be nohz_full).

  # vng -a isolcpus=3D0-7 -a nohz_full=3D8-15 head
/sys/devices/system/cpu/{isolated,nohz_full}

  =3D=3D> /sys/devices/system/cpu/isolated <=3D=3D
  0-7

  =3D=3D> /sys/devices/system/cpu/nohz_full <=3D=3D
  8-15

(where probably some CPUs are set up to do housekeeping stuff anyway,
but if we just look at the masks, we won't notice)

Then I assume this should not be allowed either, should it?
Or am I missing something here?

>=20
> But if nohz_full=3D is passed on boot and cpusets later create an
> isolated
> partition which spans the housekeeping set, then the isolated
> partition must
> be rejected.

Mmh, that would make things easier actually.
I assume there's no real use case for that kind of hybrid setup with
half CPUs nohz_full and half domain isolated..

Thanks,
Gabriele

[1] -
https://elixir.bootlin.com/linux/v6.14.5/source/kernel/sched/isolation.c#L1=
63

