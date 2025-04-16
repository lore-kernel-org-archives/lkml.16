Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA4E207DF8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803754; cv=none; b=guZGsizzcfKMndJ8GWAgS6ACyzW7+5A71s/U4pYaoBE9t0e7viwNyo+GN7BHWTWDW27uGQO3ntX0Usyf/WuzLe1D8F4uruLXoqqE+rXRyxehmUQcUDXTwjuPIs/4nOAEoZ3RLNbx0vjaFeqe6CXk0tOOLVTmG6uIV0pxRufaXoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803754; c=relaxed/simple;
	bh=fhjBaG3805Bjow0iETFxpVFlxLgrLOz/rjATud4UPgk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JnkBfgkFzuNAkuWi67/ZgwHafvF+3jKNPVSAMWiBk0Bm4B244q9tgL8NNmabuSxPqBSnkRERdFcyIRFyyZmGE9Uq2fgzQZeZHeGOujd6VjrG8KdDH7Op9vIAJ3di3+Ylt2645RpxcAg40TvsurXWT3tAZ76s6/qH37SJ6EaAQv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LpvCq4GB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LpvCq4GB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744803750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5z6fNojRF9NHhV/lCWIoxNXIATTm+tKBZ0meFI94ucc=;
	b=LpvCq4GB58rT4vTIl/mwZE3L9BlOWg8uNlebMauZA3padTXhVKxZQNP8U+ptuWTguAaxdE
	Rp3vwmPQ9XnqIX1Zb7b2rlEeVVhp7mnsagsxXJGBcsUFFRlARzKaKFrMIz1dmc+9TBagIz
	jSPw9dBoY4AfpyYKZH+3Wy5hkzGpt/s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-Vie_iH2lMuq6RkfCyGJk_A-1; Wed, 16 Apr 2025 07:42:29 -0400
X-MC-Unique: Vie_iH2lMuq6RkfCyGJk_A-1
X-Mimecast-MFC-AGG-ID: Vie_iH2lMuq6RkfCyGJk_A_1744803748
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39126c3469fso2620528f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744803748; x=1745408548;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5z6fNojRF9NHhV/lCWIoxNXIATTm+tKBZ0meFI94ucc=;
        b=P8fzi3J8+A/rTkLXLYlGCztNCR4JIOAfxAk9+VXW8TbyjlNPvV2YlMckZoFvRe/gwc
         l7+NKi6U9sxd8kF93wr+In2IG4RflJTT79tUW53LGmKLLDCJcsuXmHTPszm5WiKC+xz0
         UFdqFXR/smlorz2wUtXAb2FjdVUfhLPNSKc211WNaH1/y8vrxP6J/RUtP4ybiD4YrS8E
         N4rdn6szmdSnqW6AaQnbIEcivgBWB4I6I0GPsnxkJidpIa1UoXcLvHnfElBnYAHSN9t3
         f8dSbl0rVr3wJlnIiuKdHtA3OiUSDo81005YGMvTKpZHnEbiR6o/JzxoipdbMxg8JM96
         ebBg==
X-Gm-Message-State: AOJu0Yx21zYNA2IqWXVdSoji1YB/az1/gXzuyTRz70GR1VfUEfGSmldN
	VeH6WUS/0Vg/owULA+nWOx5Lsa7yTitp7RN+8taoADfmIBY/k/EmwVvlDFzjLXnWyycZUQolSk8
	e5Mu1oUvXAOo4dV3zk6rQ8KLe6ydk8DlQuOLgkqVoFQb3QkjhKhJvwQXs3Jjmjw==
X-Gm-Gg: ASbGncuas1IACEiscOAvHSJ/JSLld+Eh/m2h5TAefalTfv+32HRnlTxOZKRaX4EwpLO
	gwT9daWSikvHtWGNCom5b66Ijm0itPm+tBtG6A638ybDAXNEmjnJJNJFYCj/Cw2jB9ho+YY2Uts
	q+B1gsfD0hFrBeEaPIR5jR7qa1C0uzBUqGRXDTjrduCxgbVUV7YJD4F2T0qlYgquuLrJ3H2S6Ir
	pssFGWq7wTgwuFX2d0zFcfTkzYpDnndaIiJRDja3mnBQf5zF4nkYyjwnlGgT/DHQ/Cjx49N0wpi
	HJ/IRwz2aUfX2oaAhS/HCqrS16LdHSeONF5n+KU=
X-Received: by 2002:a05:6000:40dd:b0:391:31f2:b99a with SMTP id ffacd0b85a97d-39ee5b1306cmr1578462f8f.5.1744803748218;
        Wed, 16 Apr 2025 04:42:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6R2KyCnqE4BlOLHRHu9NIuucKIPl2UpGmWdgO/Fo74a/ok/xC5KTJ0F0Bf4hfUIeu2l85dA==
X-Received: by 2002:a05:6000:40dd:b0:391:31f2:b99a with SMTP id ffacd0b85a97d-39ee5b1306cmr1578433f8f.5.1744803747822;
        Wed, 16 Apr 2025 04:42:27 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d2ddfsm18656915e9.10.2025.04.16.04.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 04:42:27 -0700 (PDT)
Message-ID: <645b612bb578deb43df6539462d079ab38a2c835.camel@redhat.com>
Subject: Re: [RFC PATCH 6/9] sched: Treat try_to_block_task with pending
 signal as wakeup
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Tomas Glozar <tglozar@redhat.com>, Juri
 Lelli <jlelli@redhat.com>
Date: Wed, 16 Apr 2025 13:42:25 +0200
In-Reply-To: <20250416092027.yShf-ReN@linutronix.de>
References: <20250404084512.98552-11-gmonaco@redhat.com>
	 <20250404084512.98552-17-gmonaco@redhat.com>
	 <20250413150540.3ZW7XJVs@linutronix.de>
	 <fb998d03b4ecc51834bf4383a71932ca877900cd.camel@redhat.com>
	 <20250415110455.0Qj-4EN2@linutronix.de>
	 <4e4b9c63-1b86-4d96-bcf3-0cdee8ba7c9e@redhat.com>
	 <20250416092027.yShf-ReN@linutronix.de>
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



On Wed, 2025-04-16 at 11:20 +0200, Nam Cao wrote:
> On Fri, Apr 04, 2025 at 10:45:19AM +0200, Gabriele Monaco wrote:
> > If a task sets itself to interruptible and schedules, the
> > __schedule
> > function checks whether there's a pending signal and, if that's the
> > case, updates the state of the task to runnable instead of
> > dequeuing.
> > By looking at the tracepoints, we see the task enters the scheduler
> > while sleepable but exits as runnable. From a modelling
> > perspective,
> > this is equivalent to a wakeup and the tracepoints should reflect
> > that.
> >=20
> > Add the waking/wakeup tracepoints in the try_to_block_task function
> > and
> > set the prev_state used by the sched_switch tracepoint to
> > TASK_RUNNING
> > if the task had a pending signal and was not blocked.
> >=20
> > Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> > ---
> > =C2=A0kernel/sched/core.c | 11 +++++++++--
> > =C2=A01 file changed, 9 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index f2f79236d5811..48cb32abce01a 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -6584,7 +6584,12 @@ static bool try_to_block_task(struct rq *rq,
> > struct task_struct *p,
> > =C2=A0	int flags =3D DEQUEUE_NOCLOCK;
> > =C2=A0
> > =C2=A0	if (signal_pending_state(task_state, p)) {
> > -		WRITE_ONCE(p->__state, TASK_RUNNING);
> > +		/*
> > +		 * From a modelling perspective, this is
> > equivalent to a wakeup
> > +		 * before dequeuing the task: trace accordingly.
> > +		 */
> > +		trace_sched_waking(p);
> > +		ttwu_do_wakeup(p);
> > =C2=A0		return false;
> > =C2=A0	}
> > =C2=A0
> > @@ -6721,7 +6726,9 @@ static void __sched notrace __schedule(int
> > sched_mode)
> > =C2=A0			goto picked;
> > =C2=A0		}
> > =C2=A0	} else if (!preempt && prev_state) {
> > -		try_to_block_task(rq, prev, prev_state);
> > +		/* Task was not blocked due to a signal and is
> > again runnable */
> > +		if (!try_to_block_task(rq, prev, prev_state))
> > +			prev_state =3D TASK_RUNNING;
> > =C2=A0		switch_count =3D &prev->nvcsw;
> > =C2=A0	}
>=20
> I couldn't reproduce the problem that this patch is solving. But
> staring at
> the srs monitor, I made an educated guess that this is to accomodate
> the
> transition "sleepable x wakeup -> running"?
>=20
> But for this transition, no real wakeup happens, just the task's
> state is
> changed to "sleepable" then back to "running", right? Sleep hasn't
> actually
> happened yet?
>=20
> If that is the case, would the patch below also solves it? It would
> turn
> the transition into "sleepable x set_runnable -> running", which I
> think
> describe it more accurately.

Yeah that's pretty much it, there are a few problems though:
1. set_state should occur in task context and not while scheduling
2. set_state doesn't expect a task switch to occur

One way to solve this is to do like you said but add a flag to the
tracepoint to tell the model this set state is a special one happening
while scheduling, after that one, we may be scheduled out.

I didn't really like adding another state so I dropped that.

However, a task can be woken up before being scheduled out (I'd agree
with you it's not quite a wakeup as it wasn't yet sleeping, but it
happens, e.g. p =3D=3D current in try_to_wake_up).
This case with the signal is, in that sense, a wakeup. We can even see
the tracepoint at times.

Anyway, that issue was mostly hypothetical, the patch also fixes the
prev_state (there's a patch by Peter on tip doing the same thing) and I
need to make sure it's really possible to see the issue after that too.

Thanks for looking into it,
Gabriele

