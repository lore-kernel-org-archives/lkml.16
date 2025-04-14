Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849D518A6A9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626682; cv=none; b=ikygagz1mIBxgA6llu+qYKPxFKRjUCz9f4sExS9/FWjHEwTzmOTTvt2KCTwfavnBw1/k4b7HOm7HHuUuWY9NI4pqlxbRfNlCGb0KoVOY9OPUlYOtdOcwkzLurDv2bXvimfnpI+Bv+1KTAc0lMhCzeFBUrbhPWU/MeKsyKzXcawY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626682; c=relaxed/simple;
	bh=kIMlgp5TGUOOseR7iZZCDkjdX8ARLXQBj/JoVBpQImA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZJBxayLFCoqlDtlwbymVZAWC2qZTri6waOJmwFEmSMBdmpiBh3BLThPqmBYIT+zhx3OQtXmpSLaFA56yR9Q5CeEDvCyxp6+MDhkkiw5qAYAoq+fZy3a4gvp1AIyJhvC53OtWMWelopWsnkGNOnzXFDLVIw8Cx8ySA+JXFD3WATQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JKcA9fY8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JKcA9fY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744626678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tEXTEMOnMm7z+idzaLgSSjVPtHErNBCpVuQ3X+geJvM=;
	b=JKcA9fY8sSCVJB1NbYQENHRK3JOr6TxaUUiZ7AofJTIMFOTKtf5shLGyFK5pmwPFFVAR29
	QKKFTibMtbmfViLFenw57cefTzFnSSyHhwAfdqkgBRsmfYjOokRWQ8XLqm+x/5WTxdOcpV
	sVrLi7ZcgeI6cNmV2XsG4cNcxDd/K7Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-Ll-WK-tSO5uRplbQd-pXBA-1; Mon, 14 Apr 2025 06:31:17 -0400
X-MC-Unique: Ll-WK-tSO5uRplbQd-pXBA-1
X-Mimecast-MFC-AGG-ID: Ll-WK-tSO5uRplbQd-pXBA_1744626675
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so23125595e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744626675; x=1745231475;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tEXTEMOnMm7z+idzaLgSSjVPtHErNBCpVuQ3X+geJvM=;
        b=jyVNeTUerTdsQmQlHDwc81gz7SzHEV5dVO0I/JcxmXfpge7y7QyCrhRXvhEW58c79l
         YzTKrGTxoguTQqep7B50cLnXq/XtR1tZU/2pFFyV13W1dAd3Xf7PFLMI4qPz6z2+JqrR
         RmnpV458+LH10bcuUVSRu5Fqd3nd7RMkai/RavNKuy3D2EIjLxyTyWTex3EFUbBhSXim
         slG25OXtdsucUgJ817q+6RwmF4AjeNo12JBTy6Cz3pJv0Z182sB4OHqCXZpUdOfEKR6u
         PVUTTrPRId3/ge0000nv8qyCmn/BYfE6JBL3qahEZHi+K5sGQFIKe4b2pAdij+/aCJ88
         jQ4g==
X-Gm-Message-State: AOJu0YxZP60iI3Mf4g0f5KVm2NruaqWIgU61pbX0f8fAsVE+Q9NcLfQJ
	XV2I7J/Ceihye0zkdJpcg8H53eL8M7/8rjwXMmlqDr/CnDa4U9qvGBRtGGb+yvzhOb6TcNRSJhu
	yE4IXQzTIj6Lie0a8569DsyzndjN85T6Zestv5dKB3rbco0erDO6booUsZG8/0w==
X-Gm-Gg: ASbGncsfnkRFatqMGVq9iQ+SR4eXNdTz3HG6xztCb3c1YHEperloRftAeBGIWQ/SGZJ
	WkyI3rD/AfdvnlviCJ//KlFfqcPJzPrcQrjb4u5nAsSJxEuneD7Cl7aVcCTNux7l3MjOkofixd+
	spYkgoMeB/h+rzTswUWYq1RB11/v6pO1uCEdZmVNEqdCbHbJm3y/1IelRy9zet53QFsVUc40qXC
	K7FiqdNQUniGY7hAPgUKoUqX5dcYhBCjaEnO8TLrjoMRadIdhC2eDG51dhUk3QlVUmcHALapIRn
	rMX4t83J9yp9ztUpMpM/Mz9jzXthrCbIKq3hgA==
X-Received: by 2002:a05:600c:1e0e:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-43f2ea2a1a9mr134493495e9.4.1744626674841;
        Mon, 14 Apr 2025 03:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjvcDfZ4KSMe+l88JYrooH4MioiZ/VEKtsswQBc3T6IOzkQIGdSI64dEKx5A7zmGalzPIgpw==
X-Received: by 2002:a05:600c:1e0e:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-43f2ea2a1a9mr134493185e9.4.1744626674318;
        Mon, 14 Apr 2025 03:31:14 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f36558b21sm123159205e9.18.2025.04.14.03.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 03:31:13 -0700 (PDT)
Message-ID: <fb998d03b4ecc51834bf4383a71932ca877900cd.camel@redhat.com>
Subject: Re: [RFC PATCH 6/9] sched: Treat try_to_block_task with pending
 signal as wakeup
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Tomas Glozar <tglozar@redhat.com>, Juri
 Lelli <jlelli@redhat.com>
Date: Mon, 14 Apr 2025 12:31:12 +0200
In-Reply-To: <20250413150540.3ZW7XJVs@linutronix.de>
References: <20250404084512.98552-11-gmonaco@redhat.com>
	 <20250404084512.98552-17-gmonaco@redhat.com>
	 <20250413150540.3ZW7XJVs@linutronix.de>
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



On Sun, 2025-04-13 at 17:05 +0200, Nam Cao wrote:
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
>=20
> I don't think we should put trace_sched_waking() here.
> trace_sched_waking()
> "is guaranteed to be called from the waking context", and this is not
> the
> waking context.
>=20
> There is already a trace_sched_waking() in signal_wake_up_state().
> This is
> duplicating that, in the wrong context.
>=20
> ttwu_do_wakeup() alone should be sufficient?

Mmh, that's a good point.
The thing is: this happens when the signal is generated while we are
scheduling (on different CPUs), so we take a short-cut and put the task
to running directly.
This thing is already racy, so we may or may not see the waking/wakeup.

Now probably waking shouldn't be there for the reason you said, but I'm
not sure a wakeup not following a waking would be correct either.
I might be missing something here, though.

Thanks,
Gabriele

