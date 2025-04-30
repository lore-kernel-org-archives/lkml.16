Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DD6126BF1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000319; cv=none; b=iLz9B6VEDlFVsOPWYdbT/ryLB8qsOA3HTHxRadCjLC4ad2Ekd4rO+pOCt12OFpfm6QAh0OICRs6+1JqwPHM22INlJCPJ95ilUCU48DO/ZGsmD0NfpMO98OFGBRZL96kGWrPnP72I1+fhbGtHfp+A9sqqlKIHef+V7EDsgsjuszQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000319; c=relaxed/simple;
	bh=UEHCt+Q3JQHVieOZCfu3Z0WEpp2J0aoECNuUpYubuHM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PdsFHuK8vTaxeAIT1e1Pem4qySbMsYVsEkGdSR7sHt5Gm6jVmsD0JNAp3b5mqZSyfHF9Ymj7tQM2fbMHiieZQpjSIEmMuASy1G67NmUAOx315/XxKk8eSEgo7osaK0rbxZVQPcfQGtGFtJ8MNL9uGgAGi1PBXDlUI/tC1P9/6jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RL0CXMHU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RL0CXMHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746000314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nB56TF+Zw4cv0c6u+SO2vMiun24QXC2VdPkX58uRxLY=;
	b=RL0CXMHUOQZ21UwDt2uv6CGnKHczlZMIrOW/ttlQYMep8kFKC3I5m5gQPUqlrFrlz4+23B
	Nhb5KD0yvmy9qwp0+sPqTR2nOTKcLI/EmRS4sWcAIM8SeSaEbbR/v8jV3fHsv53Kb29P3N
	lxJne6se0+u14mWZ7DBZ7lbM3p0PyQo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-we6wmxo0Pbqemxvx09XpuA-1; Wed, 30 Apr 2025 04:05:12 -0400
X-MC-Unique: we6wmxo0Pbqemxvx09XpuA-1
X-Mimecast-MFC-AGG-ID: we6wmxo0Pbqemxvx09XpuA_1746000311
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso2951764f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000311; x=1746605111;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nB56TF+Zw4cv0c6u+SO2vMiun24QXC2VdPkX58uRxLY=;
        b=J+HOmjgAXYB99u/9gxNao+4bHKxfyJXVZhDf6l1wRKFJGID9kVxsMJkvxBlNEJ93wB
         4dPjiLwarW3KdvoFNF27rXqNqZWxkq9Vy+lelWdM+9P7VATm+Dn9ymdretgrC2XBdwtu
         RH6Kv/lHsifpGLgEFaHIfO+eDUzTrLV6eYCiLysM1E/FAcs3JV5RFoQ0PIGx4M1z1ku6
         FyQGmEskhsHsd0PTYyo+1udILVzeoqNFUSHvuDBR62FI7S2F2kgnAlrm9QMeONpcrXBg
         QqWMm8hh7nH6m53gYwtQrIcE8mXVpye+jicAYEisKz4Uc+4hbQkc0n1f5UUTlXWMUljM
         l8mg==
X-Forwarded-Encrypted: i=1; AJvYcCWOjhJQOPlfCb2G633ehyXFj2KRS2obVKdoBw5Rb0fRcN2d0B9SA3ztZ0LeQ1e/HP3AW8q90xHUEg47pW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF7b3PkGRvLfJ2ZF+crxyFUS3jxxbvGFSX3H/NfMVI2Z6Zd+VG
	zHmD91lBPUrVipQu0xqFcNu6ILX3/ai/v7tgQ2vbqtFwZjgnxT9SS+Gn51RVy1oZMvAj3hc7n0X
	kntccPgCK7PlZd6Z9aRE4nG92Yc4bmnWWIoHR3vVPjsj0/xygmvvSyXA0BeeigQ==
X-Gm-Gg: ASbGncv1HRzAIdiqqK1oN7SvpMDOabOBoePPibmXquPXo9OptlfQfRW879Afb+oS8rS
	5Eme1U9jmGhxaBhDCw+viiJI25meTQEqopIcKkuEIIvBaF9LuKkeMMCivNec16sIK/UNVz6DWlG
	dmWGYmYojV8lDnZ2nNdxQV6Nhe7vOMFch9sBvkLQrPSBWO8cqm7WPyy6OSB4oPjmjDObwGizfVH
	iLVMN0wJ1Ltp2NcClD1H3dyYX9FlCUJcowSK+OHfybriUSolipr5Qj6d70c0jeOxmBo3uj2UIJ1
	mtHqbviNTE8gv3cU4I3cBqSjTxAltGcae+IEhQ==
X-Received: by 2002:a05:6000:18a7:b0:3a0:7af4:22f0 with SMTP id ffacd0b85a97d-3a08f771d4fmr1732938f8f.29.1746000311157;
        Wed, 30 Apr 2025 01:05:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGARGD8732Iyf7PLFzegTdHNH3vw0wYmayS6Emgi/MGuLtPES5jhLmSHKkignoD9bx1KoYxrw==
X-Received: by 2002:a05:6000:18a7:b0:3a0:7af4:22f0 with SMTP id ffacd0b85a97d-3a08f771d4fmr1732896f8f.29.1746000310784;
        Wed, 30 Apr 2025 01:05:10 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8d60asm16563441f8f.18.2025.04.30.01.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:05:10 -0700 (PDT)
Message-ID: <c0dca589e8615e1e0105cf1ae20f3f613992d33d.camel@redhat.com>
Subject: Re: [PATCH v5 21/23] rv: Add rtapp_sleep monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de, Peter Zijlstra	 <peterz@infradead.org>, Ingo
 Molnar <mingo@redhat.com>, Will Deacon	 <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Waiman Long	 <longman@redhat.com>
Date: Wed, 30 Apr 2025 10:05:07 +0200
In-Reply-To: <20250429172055.QICnVQ2s@linutronix.de>
References: <cover.1745926331.git.namcao@linutronix.de>
	 <57ea14992e148121fc010a200986e4db60ac2de0.1745926331.git.namcao@linutronix.de>
	 <bfe8322cf5817037af57f10ffbffcd9b30f43b42.camel@redhat.com>
	 <20250429172055.QICnVQ2s@linutronix.de>
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



On Tue, 2025-04-29 at 19:20 +0200, Nam Cao wrote:
> On Tue, Apr 29, 2025 at 06:01:01PM +0200, Gabriele Monaco wrote:
> > On Tue, 2025-04-29 at 14:01 +0200, Nam Cao wrote:
> > > Add a monitor for checking that real-time tasks do not go to
> > > sleep in
> > > a
> > > manner that may cause undesirable latency.
> > >=20
> > > Also change
> > > 	RV depends on TRACING
> > > to
> > > 	RV select TRACING
> > > to avoid the following recursive dependency:
> > >=20
> > > =C2=A0error: recursive dependency detected!
> > > 	symbol TRACING is selected by PREEMPTIRQ_TRACEPOINTS
> > > 	symbol PREEMPTIRQ_TRACEPOINTS depends on TRACE_IRQFLAGS
> > > 	symbol TRACE_IRQFLAGS is selected by RV_MON_SLEEP
> > > 	symbol RV_MON_SLEEP depends on RV
> > > 	symbol RV depends on TRACING
> > >=20
> > > Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>
> > > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > > ---
> > > Cc: Peter Zijlstra <peterz@infradead.org>
> > > Cc: Ingo Molnar <mingo@redhat.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Boqun Feng <boqun.feng@gmail.com>
> > > Cc: Waiman Long <longman@redhat.com>
> > > ---
> > >=20
> > > [...]
> > >=20
> > > +RULE =3D always ((RT and SLEEP) imply (RT_FRIENDLY_SLEEP or
> > > ALLOWLIST))
> > > +
> > > +RT_FRIENDLY_SLEEP =3D (RT_VALID_SLEEP_REASON or KERNEL_THREAD)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 and ((not WAKE) until RT_FRIENDLY_WAKE)
> > > +
> > > +RT_VALID_SLEEP_REASON =3D PI_FUTEX
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or RT_FRIENDLY_NANOS=
LEEP
> > > +
> > > +RT_FRIENDLY_NANOSLEEP =3D CLOCK_NANOSLEEP
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and NANOSLEEP_TIMER_ABSTIM=
E
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and NANOSLEEP_CLOCK_MONOTO=
NIC
> > > +
> > > +RT_FRIENDLY_WAKE =3D WOKEN_BY_EQUAL_OR_HIGHER_PRIO
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 or WOKEN_BY_HARDIRQ
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 or WOKEN_BY_NMI
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 or KTHREAD_SHOULD_STOP
> > > +
> > > +ALLOWLIST =3D BLOCK_ON_RT_MUTEX
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or TASK_IS_RCU
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or TASK_IS_MIGRATIO=
N
> >=20
> > So, just thinking out loud, PI_FUTEX is a valid sleep reason,
> > technically also BLOCK_ON_RT_MUTEX is something you are allowing.
> >=20
> > In my understanding, the contention tracepoints already in the
> > kernel
> > can track all contention by kernel code and are leaving aside the
> > PI
> > futexes, which use the untracked rt_mutex_wait_proxy_lock.
> >=20
> > In your case, you are tracking PI_FUTEX via the system call, which
> > should cover the above scenario.
> >=20
> > Do you really need extra tracepoints to track this too? Or is there
> > any
> > other use of start_proxy_lock/wait_proxy_lock I'm missing here?
> >=20
> > I see the only case in which rt_mutex_start_proxy_lock is called
> > with a
> > task different than current is via FUTEX_CMP_REQUEUE_PI, wouldn't
> > considering this one too make the new tracepoints superfluous
> > (assuming
> > this one is even needed to be tracked before
> > FUTEX_WAIT_REQUEUE_PI).
>=20
> The monitor allows PI_FUTEX and allows BLOCK_ON_RT_MUTEX in different
> manners.
>=20
> PI_FUTEX is only a valid sleep reason. If a task sleeps with
> PI_FUTEX=3Dtrue,
> it still has to obey ((not WAKE) until RT_FRIENDLY_WAKE)
>=20
> On the other hand, BLOCK_ON_RT_MUTEX alone is good enough. Waker is
> not
> checked due to how rt_mutex is implemented: when a task unlocks an
> rt_mutex
> and wakes waiter, the task is priority-deboosted first before doing
> the
> wakeup, and we would see a false positive warning. See
> rt_mutex_slowunlock().
>=20
> In the case of futex_lock_pi(), both PI_FUTEX and BLOCK_ON_RT_MUTEX
> is
> true. Therefore we don't check the waker.
>=20
> However, in the case of futex_wait_requeue_pi(), PI_FUTEX is true but
> BLOCK_ON_RT_MUTEX is false. In this case, we check the waker.
>=20
> So, what happens if we don't have the tracepoint in *_proxy_lock()?
> The
> futex_lock_pi() may generate a false positive warning, because we
> check the
> waker and the waker may have lower priority.
>=20
> But now that you mention it, perhaps instead of PI_FUTEX, we could
> define
> FUTEX_LOCK_PI and FUTEX_WAIT_REQUEUE_PI separately. And we don't
> check the
> waker if FUTEX_LOCK_PI=3Dtrue. Something like the diff below.
>=20
> Then we wouldn't need the block_on_rt_mutex tracepoints anymore. And
> the
> specification is a bit more obvious.
>=20
> Having a second pair of eyes is great, thanks!
>=20
> Nam
>=20
> diff --git a/tools/verification/models/rtapp/sleep.ltl
> b/tools/verification/models/rtapp/sleep.ltl
> index 6e2f1ff31163..1f26e58e72f8 100644
> --- a/tools/verification/models/rtapp/sleep.ltl
> +++ b/tools/verification/models/rtapp/sleep.ltl
> @@ -3,7 +3,7 @@ RULE =3D always ((RT and SLEEP) imply
> (RT_FRIENDLY_SLEEP or ALLOWLIST))
> =C2=A0RT_FRIENDLY_SLEEP =3D (RT_VALID_SLEEP_REASON or KERNEL_THREAD)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 and ((not WAKE) until RT_FRIENDLY_WAKE)
> =C2=A0
> -RT_VALID_SLEEP_REASON =3D PI_FUTEX
> +RT_VALID_SLEEP_REASON =3D FUTEX_WAIT_REQUEUE_PI
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or RT_FRIENDLY_NANOS=
LEEP
> =C2=A0
> =C2=A0RT_FRIENDLY_NANOSLEEP =3D CLOCK_NANOSLEEP
> @@ -16,5 +16,6 @@ RT_FRIENDLY_WAKE =3D WOKEN_BY_EQUAL_OR_HIGHER_PRIO
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 or KTHREAD_SHOULD_STOP
> =C2=A0
> =C2=A0ALLOWLIST =3D BLOCK_ON_RT_MUTEX
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or FUTEX_LOCK_PI
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or TASK_IS_RCU
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or TASK_IS_MIGRATI=
ON


Well, it was more complicated than I pictured it, glad my babbling
helped in finding another solution ;)

I've got one more small remark though, the name ALLOWLIST doesn't give
justice to what you explained above.
It suggests me something potentially wrong that we can't do much about,
while in case of RT mutexes and futex lock, we just don't want the
monitor to yell in a perfectly RT-compliant scenario.

What is happening here, from what I see, is that the kernel is handling
the RT behaviour and your monitor is just meant to tell when userspace
is doing something it could do better (unless we deal with kthreads,
there we are in fact whitelisting the ones we know are not complying).

What about calling it RT_KERNEL_MANAGED_SLEEP or something along the
line to say we just trust what the kernel is doing?

Does this make sense to you?

Thanks,
Gabriele

