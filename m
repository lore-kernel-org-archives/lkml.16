Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D14165F1A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604666; cv=none; b=ka185x2Z4g8zCY0OHO4IUUSGO5p/fD3qioLeIV0fFHXJpmYZSItxSalNkksvoQ4ibeYavie4Qbqmghw5EHOCcZtzl/iQxr1IYRkWGt/aSLc5j9fz4Hul56dA6rZXsjYIq8t978KX5EIeQk1Cpqmr6T5oNDr5hb23MQ7an2YKiko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604666; c=relaxed/simple;
	bh=nE6I+6Afd7i8tx4Vczineq7YnjmxAYC8hpNRlIuuknA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IeFSNIqyergecFBYaXRelKNo72rwSnqOeyO8EThQ9+YKArvfunZoPWgOhhVoZ83YU6IzQfuBT5/l7SomskvMuz9TMpRFsi/ZzXcVrb60uyH1nV1BCiv28Cck2oWphmCvqL33zk6uJkbWkzF+4FBrsAchTTnFVgXvLU2PzxoLgZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QrMzgboF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QrMzgboF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746604663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=afzIawu0oq/BnrWTCiUdqOQeoeq9GQbId+eZhdu5Xnc=;
	b=QrMzgboFIGpYFTqUNqv6QwPPlEp9S5ibWk6940JD8R3VbUVCxpcmoLdD11PmqDtw1YpFrS
	nS8QPRMpv6uKV9LPD4ujpGkHXFLLoQRL9f0aHvX5dOoLMmiQlBhZN2DNvawLdPvjUQ3YJb
	71cakjERhAKoJUaSG9q58EiXZLErcLE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-Rd1CxNLUO0aPO0AzLD7-_g-1; Wed, 07 May 2025 03:57:42 -0400
X-MC-Unique: Rd1CxNLUO0aPO0AzLD7-_g-1
X-Mimecast-MFC-AGG-ID: Rd1CxNLUO0aPO0AzLD7-_g_1746604661
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c1b1c0969so3942445f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604661; x=1747209461;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afzIawu0oq/BnrWTCiUdqOQeoeq9GQbId+eZhdu5Xnc=;
        b=WvOyXzpam6hEQYXWtbiNy2ACxU/U0VbTCKwYGiOP1wtdT6JWqcn9QbntIXFpfVgvcN
         cjpHmpGTQ9StzN/878P3gTTxhj1dnFzO9yW2J59ZF3PIXN06W7+SmCv/hrlYaqaCPAXQ
         Hd1v0nk4X7O+cLuRzfLNJ5UehYkVr84kxsLPllH/9f14YHuXGknT4lxctN4wZUMHJmI8
         00Le4zMpk4IFVQ6CxyCPDmSW/f8ZarCRWFZxPakkVfoEKgvy0E4toDoMgB8opRKgypGl
         kVaaJifj0GK0AJdemB089RF/MjwJiswmjD272U3tNVIbqnQXYqco7OWJfHBpfh8Mvc1j
         hYNQ==
X-Gm-Message-State: AOJu0YzwkciCfZOKXk7Cklm6viYlJUjBtt5i50Tk1eNL4a+WBpqr60wt
	z4vIg/4nwbwRxksQ9nqz8/4I9ZBGhOGFNvFeoBbB1uIjhoWnkcxPeSQYGARrKcckmWA5LQPetLc
	nUsHIbRUPla/iXSyCr5Cq3wYNJKh5A5GvHXSEUZwcCzT/YUUKJFMaqhF/SWfVLy4DI3uMKAgs
X-Gm-Gg: ASbGncuZ9jOyhik+bfYtnAm/iX84JOd9vAryIRU+nPdSMqbQRX3rTm41Em52BYxfJSt
	Fmwc4RcJxdcDVvS6pfpiN2UZbU+9PtuKAyuA2Tcov7QGZUsVe9jofe3/54c6rPST9lDIp5P4TMl
	p7fJedfvVeJkGT5j/+CmChP2oIlR6o0aC3xJtINoGOF3q/6ks7NuUDhbQy2MHc+fueG13al7Y/I
	i0us+lvbLbRKjRu1QihtukzmXXzpztmc0teGrcrkG+gri0fNCQSwPikycpkOKGKTc/enyR4BGLn
	iwPPlmkKVH4QmPR1PEY+DlZ5uUqFA7USY49oAQ==
X-Received: by 2002:a05:6000:40cb:b0:3a0:82de:f228 with SMTP id ffacd0b85a97d-3a0b4a66f7cmr1828018f8f.45.1746604661327;
        Wed, 07 May 2025 00:57:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEMbMW1okqy2jqIyiUbq/oRwkhqg9lSNUdkkjPSTIyot6LMnILF68SnwofGU9RbeGNRuvSQA==
X-Received: by 2002:a05:6000:40cb:b0:3a0:82de:f228 with SMTP id ffacd0b85a97d-3a0b4a66f7cmr1828002f8f.45.1746604660989;
        Wed, 07 May 2025 00:57:40 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0ffcasm16084489f8f.74.2025.05.07.00.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:57:40 -0700 (PDT)
Message-ID: <3f54534266f4405fc3c6943599edd9be88becd57.camel@redhat.com>
Subject: Re: [PATCH v4 2/5] timers: Add the available mask in timer migration
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
 Waiman Long <longman@redhat.com>
Date: Wed, 07 May 2025 09:57:38 +0200
In-Reply-To: <aBozrJ0C6yzW7oB_@localhost.localdomain>
References: <20250506091534.42117-7-gmonaco@redhat.com>
	 <20250506091534.42117-9-gmonaco@redhat.com>
	 <aBozrJ0C6yzW7oB_@localhost.localdomain>
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



On Tue, 2025-05-06 at 18:07 +0200, Frederic Weisbecker wrote:
> Le Tue, May 06, 2025 at 11:15:37AM +0200, Gabriele Monaco a =C3=A9crit :
> > Keep track of the CPUs available for timer migration in a cpumask.
> > This
> > prepares the ground to generalise the concept of unavailable CPUs.
> >=20
> > Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> > ---
> > =C2=A0kernel/time/timer_migration.c | 12 +++++++++++-
> > =C2=A01 file changed, 11 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/kernel/time/timer_migration.c
> > b/kernel/time/timer_migration.c
> > index 7efd897c7959..25439f961ccf 100644
> > --- a/kernel/time/timer_migration.c
> > +++ b/kernel/time/timer_migration.c
> > @@ -422,6 +422,9 @@ static unsigned int tmigr_crossnode_level
> > __read_mostly;
> > =C2=A0
> > =C2=A0static DEFINE_PER_CPU(struct tmigr_cpu, tmigr_cpu);
> > =C2=A0
> > +/* CPUs available for timer migration */
> > +static cpumask_var_t tmigr_available_cpumask;
> > +
> > =C2=A0#define TMIGR_NONE	0xFF
> > =C2=A0#define BIT_CNT		8
> > =C2=A0
> > @@ -1449,6 +1452,7 @@ static int tmigr_cpu_unavailable(unsigned int
> > cpu)
> > =C2=A0	raw_spin_lock_irq(&tmc->lock);
> > =C2=A0	tmc->available =3D false;
> > =C2=A0	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
> > +	cpumask_clear_cpu(cpu, tmigr_available_cpumask);
> > =C2=A0
> > =C2=A0	/*
> > =C2=A0	 * CPU has to handle the local events on his own, when on
> > the way to
> > @@ -1459,7 +1463,7 @@ static int tmigr_cpu_unavailable(unsigned int
> > cpu)
> > =C2=A0	raw_spin_unlock_irq(&tmc->lock);
> > =C2=A0
> > =C2=A0	if (firstexp !=3D KTIME_MAX) {
> > -		migrator =3D cpumask_any_but(cpu_online_mask, cpu);
> > +		migrator =3D cpumask_any(tmigr_available_cpumask);
>=20
> Considering nohz_full CPUs should be still available.
>=20
> I don't think there is anything ensuring that, in nohz_full mode,
> there must be at least one housekeeping CPU that is not domain
> isolated.
>=20
> For example if we have two CPUs with CPU 0 being domain isolated
> and CPU 1 being nohz_full, then there is no migrator to handle CPU
> 1's
> global timers.
>=20

Mmh, good point, didn't think about having the domain isolated and
nohz_full maps disjointed..

When that's really the case how do you think we should fall back?

In the situation you describe, no one is going to be able to handle
global timers on the nohz_full CPUs, right?

When this situation really occurs, we could keep one of the domain
isolated CPUs in the hierarchy.=C2=A0
Now, I see on x86 CPU0 cannot be offlined and is not added to
nohz_full, which would make things considerably easier, but ARM doesn't
seem to work the same way.

We could elect a lucky winner (e.g. first or last becoming domain
isolated) and swap it whenever it becomes offline, until we actually
run out of those (no online cpu non-nohz_full is left), but I believe
this shouldn't happen..

Does this make sense to you?

Thanks,
Gabriele

