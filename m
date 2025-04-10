Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1009E26A0BA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744281514; cv=none; b=tXrUhMWnAfF4koF9LbG/yIazDi2s29sjp1YhBMQhs3T4aziMIWFgDszMp01s1XinwAM9I3BhGouYRiiTH4El1EnNA41HfNaAnPXzV6WszI+9jCDMicfHz7hxtmbK2ihZkVGWUV4Otlr7JfoIn7IdXiBBSzpKWJ/6Y8DvhtSXAIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744281514; c=relaxed/simple;
	bh=WpOugl4GA7r2TxUKMOj2+r27w0nKXCXJFjjk1DTKtw0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fTxEbfZEY2XlGS5os5iZ4CDrTPqZ5x2SeEeU2penKP1d1FgD4yZELzdGF5+FDKKcRa/06AD/rYaEyRKvmmgOwEcSLxshMwbADYHckZ/NREJYbgUySr1a9/lWfX3D7DTnEbXhBMsOJs7hACLwqrBnKZoIxRvxBICDJ8JYBj+hghQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NULrIt69; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NULrIt69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744281510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sp2Wqm1D3WjG31VMXS2uY4f+aQpGyB2QNozMYpaQpeQ=;
	b=NULrIt69cuRId6RstvAoOYeNm/V5R2cbrjI/L1yONRYhy3A3e1emyJSahm79sR7weAABUw
	3UdmhAYN96kobcahLtFHSB80pCJ2E/4J1ilZzzVdegg2rPQGGGmQ23tGK4+yOtOkmHuUOf
	F0c8/SNrKxYT1823rlCmnl+kQFRt7vA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-C2FkHQA-OCuqsNSA7fDFgA-1; Thu, 10 Apr 2025 06:38:29 -0400
X-MC-Unique: C2FkHQA-OCuqsNSA7fDFgA-1
X-Mimecast-MFC-AGG-ID: C2FkHQA-OCuqsNSA7fDFgA_1744281508
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39134c762ebso262039f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281508; x=1744886308;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sp2Wqm1D3WjG31VMXS2uY4f+aQpGyB2QNozMYpaQpeQ=;
        b=ad7GCIaoaq9h3qEq70Twmtd5hAhF3MT2tsTsV3yOfLQI8VbN0F4OZMOBCAEMd9xIKF
         ti+FgykTUvXBJ9vqEn+lbmwN67mEWumT5nqT7UvUhQpr42fExR2goHaLOJ24FIDuC8TX
         Cbc47nC2///apEsNS3P6AXOJAYaDOTEwlyuVf5kCL4bw7D2emr+sAfOzJ7neGkwdfuYi
         nG9ZKxU8BKrPr2GU9MDnLoyijkO5/YTMKhIGfKR785Y8AN7oFXVmfHVSu3owCR6GJ4e+
         zEdkVZss/CpYwoDQlFToze1vLoZ6ldDylMOGWnTR1XglObHAqt2dPZZdiD1um9i/RCLB
         o7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdXO3w6FjmRiLtfsfDl0Nmm3yaepVR0D+/6pdINGfGilwdr6rP/2qm4ORtevmibp/L1Mmf4SusmwgxMf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJe7AXleITKSwFd6IJSDCWX0U/ZyMOIeH6LsBgAQB+NWJTD+f
	wWslV18XSxC2958KVdxYaoIqqlL9mSfepzFJmcMSMtfWyy7qApoxFrvsDUs2Tj56xeD/Zpbqoky
	u+Js72PwBj7p2L9hYv0BuaXnBmNgANSpnv435g/ak21Trrt3vDWQNMOxA9HX6ig==
X-Gm-Gg: ASbGnctTaelSgR/nYMKr7z9zK4ZOKQpPZYhdYWKuUHuXxhqgYHz1nD4Oy42/LWF3tlz
	99gQELHyWb7ANi+pTXBlcNmMUBvLAmhEl8gW1O+zBoX4SCfuqllXazD5hYPzSyoW1utT9d+nj1J
	PgKW10xkz2N2w/RFZ5oYlTGdO8S6pn3ojaHmhpnu1bGH9Ss0B4N+jSDdyZh58Lp16wr2Gq+Z3OU
	mDUtQx5M00mmG71MX/Vob2vjDu/FEsmmQa4rKsnQ4CJTGHGn9zhdOQPwBl8lvUIpFdjG2/5mJtR
	8bUZN424cBz6aEmuWHSeeAhv2lhU2H7n5nfDiA==
X-Received: by 2002:a05:6000:2411:b0:391:300f:7474 with SMTP id ffacd0b85a97d-39d8f46998dmr1636555f8f.18.1744281508273;
        Thu, 10 Apr 2025 03:38:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+Rsjim8VvJjVUumuQWZAoFyZqw4jHUUhu6TJ4lacrry0anfoixUFL6cW8YOKpUMN/Vebn2g==
X-Received: by 2002:a05:6000:2411:b0:391:300f:7474 with SMTP id ffacd0b85a97d-39d8f46998dmr1636539f8f.18.1744281507891;
        Thu, 10 Apr 2025 03:38:27 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fff15sm4379593f8f.95.2025.04.10.03.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:38:27 -0700 (PDT)
Message-ID: <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
 Frederic Weisbecker
	 <frederic@kernel.org>, Waiman Long <longman@redhat.com>
Date: Thu, 10 Apr 2025 12:38:25 +0200
In-Reply-To: <87ecy0tob1.ffs@tglx>
References: <20250410065446.57304-2-gmonaco@redhat.com>
		 <87ecy0tob1.ffs@tglx>
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

On Thu, 2025-04-10 at 10:26 +0200, Thomas Gleixner wrote:
> On Thu, Apr 10 2025 at 08:54, Gabriele Monaco wrote:
> > =C2=A0
> > +/*=C2=A0 cpumask excluded from migration */
> > +static cpumask_var_t tmigr_unavailable_cpumask;
>=20
> Why is this a negated mask instead of being the obvious and intuitive
> available mask?

Well, the way I started writing the patch I found it easier to do the
double andnot in tmigr_isolated_exclude_cpumask to see what changed.
I see the way it evolved is just messier..
I'll apply your solution which seems much neater!

>=20
> > =C2=A0 if (firstexp !=3D KTIME_MAX) {
> > - migrator =3D cpumask_any_but(cpu_online_mask, cpu);
> > + migrator =3D cpumask_nth_andnot(0, cpu_possible_mask,
> > + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmigr_unavailable_cpumask);
>=20
> That's exactly what this negated mask causes: incomprehensible code.
>=20
>  cpumask_clear_cpu(cpu, available_mask);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
>  migrator =3D cpumask_first(available_mask);
>=20
> is too simple and obvious, right?
>=20
> > + /* Fall back to any online in case all are isolated. */
>=20
> How can that happen? There is always at least _ONE_ housekeeping,
> non-isolated, CPU online, no?
>=20

In my understanding it shouldn't, but I'm not sure there's anything
preventing the user from isolating everything via cpuset.
Anyway that's something no one in their mind should do, so I guess I'd
just opt for the cpumask_first (or actually cpumask_any, like before
the change).

> > + if (migrator >=3D nr_cpu_ids)
> > + migrator =3D cpumask_any_but(cpu_online_mask, cpu);
> > =C2=A0 work_on_cpu(migrator, tmigr_trigger_active, NULL);
> > =C2=A0 }
> > =C2=A0
> > =C2=A0 return 0;
> > =C2=A0}
> > =C2=A0
> > -static int tmigr_cpu_online(unsigned int cpu)
> > +static int tmigr_cpu_available(unsigned int cpu)
> > =C2=A0{
> > - struct tmigr_cpu *tmc =3D this_cpu_ptr(&tmigr_cpu);
> > + struct tmigr_cpu *tmc =3D per_cpu_ptr(&tmigr_cpu, cpu);
> > =C2=A0
> > =C2=A0 /* Check whether CPU data was successfully initialized */
> > =C2=A0 if (WARN_ON_ONCE(!tmc->tmgroup))
> > =C2=A0 return -EINVAL;
> > =C2=A0
> > + /* Silently ignore online requests if isolated */
>=20
> This comment makes no sense.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Isolated CPUs are not participating in timer =
migration */
>=20
> makes it entirely clear what this is about, no?
>=20
> That brings me to the general design decision here. Your changelog
> explains at great length WHAT the change is doing, but completely
> fails
> to explain the consequences and the rationale why this is the right
> thing to do.
>=20
> By excluding the isolated CPUs from migration completely, any
> 'global'
> timer, which is armed on such a CPU, has to be expired on that
> isolated
> CPU. That's fundamentaly different from e.g. RCU isolation.
>=20
> It might be the right thing to do and harmless, but without a proper
> explanation it's a silent side effect of your changes, which leaves
> people scratching their heads.

Mmh, essentially the idea is that global timer should not migrate from
housekeeping to isolated cores. I assumed the opposite never occurs (as
global timers /should/ not even start on isolated cores on a properly
isolated system), but you're right, that's not quite true.

Thinking about it now, since global timers /can/ start on isolated
cores, that makes them quite different from offline ones and probably
considering them the same is just not the right thing to do..

I'm going to have a deeper thought about this whole approach, perhaps
something simpler just preventing migration in that one direction would
suffice.

>=20
> > + if (cpu_is_isolated(cpu))
> > + return 0;
> > =C2=A0 raw_spin_lock_irq(&tmc->lock);
> > - trace_tmigr_cpu_online(tmc);
> > + trace_tmigr_cpu_available(tmc);
> > =C2=A0 tmc->idle =3D timer_base_is_idle();
> > =C2=A0 if (!tmc->idle)
> > =C2=A0 __tmigr_cpu_activate(tmc);
> > - tmc->online =3D true;
> > + tmc->available =3D true;
> > + tmc->idle =3D true;
>=20
> How so?
>=20
> > + cpumask_clear_cpu(cpu, tmigr_unavailable_cpumask);
> > =C2=A0 raw_spin_unlock_irq(&tmc->lock);
> > =C2=A0 return 0;
> > =C2=A0}
> > =C2=A0
> > +int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask)
>=20
> cpumask_var_t is wrong here. 'const struct cpumask *' is what you
> want.

You mean in the function argument? That's exactly how it is handled in
workqueue_unbound_exclude_cpumask. I get cpumask_var_t is not
necessarily a pointer, perhaps it's worth changing it there too..
Or am I missing your point?

>=20
> > +{
> > + int cpu;
> > + cpumask_var_t cpumask;
>=20
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#coding=
-style-notes
>=20
> > + if (!zalloc_cpumask_var(&cpumask, GFP_KERNEL))
> > + return -ENOMEM;
> > +
> > + cpumask_copy(cpumask, tmigr_unavailable_cpumask);
>=20
> What serializes this against concurrent CPU hotplug? I assume it's
> done
> by the caller, but then this code should have a lockdep assert to
> validate it. If it's not, then this is broken.
>=20
> As it is serialized it does not need a copy either, right?
>=20
> > + /* Was not excluded but should be excluded now. */
> > + for_each_cpu_andnot(cpu, exclude_cpumask, cpumask)
> > + tmigr_cpu_unavailable(cpu);
> > +
> > + /* Was excluded but should be included now */
> > + for_each_cpu_andnot(cpu, cpumask, exclude_cpumask)
> > + if (cpu_online(cpu))
> > + tmigr_cpu_available(cpu);
>=20
> My brain hurts by now.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_cpu_and(cpu, av=
ailable_mask, exclude_mask)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmigr_cpu_unavaila=
ble(cpu);
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_cpu_andnot(cpu,=
 cpu_online_mask, exclude_mask) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!cpumask_test_=
cpu(cpu, available_mask))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 tmigr_cpu_available(cpu);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> No?
>=20
> Also this patch is doing too many things at once. It want's to be
> split
> into:
>=20
> =C2=A0=C2=A0=C2=A0 Patch 1: Rename 'online' to 'available' (bit and funct=
ion names)
> =C2=A0=C2=A0=C2=A0 Patch 2: Add the available mask logic
> =C2=A0=C2=A0=C2=A0 Patch 3: Add the isolation functionality
>=20

Good point, I'll keep it in mind if the patch keeps this shape.

Thanks for the feedback,
Gabriele

