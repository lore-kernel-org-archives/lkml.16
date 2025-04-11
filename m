Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E8E1EE019
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744351761; cv=none; b=dM1npQ1wS9FKuCXQk1nmkwZ19+xjohgg2kAaJtPFoSE3gsmhRfmScrBg6HOsYwwAklN9uXUd2hr0ieURY1gDUFanpYa8xA59BkmCgdTI+kPM119kd/iPoS2qQj29TR4N46L1WWdV5DR2s+l767l16EyOQo2sDripmruZM2rUxZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744351761; c=relaxed/simple;
	bh=fF3zlNOao4yJFnQIBs8A+l0xxD4t0vYm+VXrEfTfCu4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ftzMwEZgmh+y5qthRYkT9DhRKo8rXbJJN3LU88oqAMWP5L1TauIDbPW9qaOwFcGE1LJD7LaOCn03vINb3e2zfRHshfIVMfhHYyzWUCFb0w+6bkpeSZsiaYjgCrdJnPNkFXpKG12NrMICE3BjpzbGVy6nj6UZZeJl5respavsqjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UUaMhvYH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UUaMhvYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744351758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bduNq/HDxv96vZuLWz4nrmlejiXvLwQ3iviE7jW85Lw=;
	b=UUaMhvYHyf9P1SQgpmgsO4o3kHUwshNFHSIjNjaaIPZVB8Fy4MFrItg12Ft06nMgnb/2we
	Ei6GlvLjv10W4SXfNQqVgbTOfCKdV1rlVeNHTVAP1Fwm2Gjno9q6cwhk4B4UdCHZ0DCMHi
	ECV9MQR0pDJMlrBmTepsjuTNp/zzjGI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-nRjYTKUmOOmBwijsNULreA-1; Fri, 11 Apr 2025 02:09:16 -0400
X-MC-Unique: nRjYTKUmOOmBwijsNULreA-1
X-Mimecast-MFC-AGG-ID: nRjYTKUmOOmBwijsNULreA_1744351755
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac2a113c5d8so113555566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 23:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744351755; x=1744956555;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bduNq/HDxv96vZuLWz4nrmlejiXvLwQ3iviE7jW85Lw=;
        b=PPHw1XcSfNLyevpWq3r4GWNKnPAq0WSrwfDkmnXUUeqfCTp1u3thtNgOlfAzCyFdtS
         oNf94bdGmy88EjJ4xBhK1uFY5TFjYWHwn/N2IL1zbODLQBOKPEWyGXW5gPQ4q+IR4hab
         CxkuqhCQJbcLxUxB1VeDi7zYjRFsBYT9zAM1NIoKGeDCJyB7LP86dMqWoT7s37+o2xAC
         nhvm69dBWNPFv0px7WKknK169pa/C76DZTQt7L1es0GPn4M5lWIRUnPoSrLiEB0EGIuK
         Yc1hBzNtfjqpcVOCqzKoO6lzyS8ZENeSzcGXH5eT+41bx/5RvsHKTzWsz4UjC1dZ9dX4
         h8sA==
X-Gm-Message-State: AOJu0YyzjY3slHhZjQ3iwHMVMbj+9qDcDWUC/+s2GaO3hNqGKKhcn/vt
	KEg9Rp6okldcwY2k9vt8eQkde2b5g9E7YeO6yduNpotxKZdQyrGFNxWzXnq0TuBIam+LxvAMsFy
	RI6jDMgj1xmXrqM7Sw4+sb66rKe2nbUYYvBqgwrf8M2aHIZyXZYarYbg3rK8qTw==
X-Gm-Gg: ASbGnct0a4iodQEPfTiSi74S/JqDGfdjCwBIJ5ue7h2qROUj6Un4jRMYeBge0HwRANd
	qh/qxuiHNRGLwRgUTCJ36wzKeY/9s2mbYIaW/NcJVjk9gD3ivxB1KeO65WY/rLBqNHmYIlqxHk1
	kb2h3juWQY7i5JDPxJTQT1zDkSaz5ki+9uVJp0wGrLgsx6FXDPO/fOtFKQObKtJR0ivqtqA1cw1
	/2mUHSC+orn0miZ0zp4aasAj5mauoNSzBLbo0CgJ2AWUP/FEIYcW1QUIxEnZcbGZ44/Hs69dqZc
	w2OyfuIPx8hIKAX6qjAWM4xhl6HCZ1fwNSt3N9Y=
X-Received: by 2002:a17:906:f1d1:b0:aca:d649:72ea with SMTP id a640c23a62f3a-acad6497352mr59422266b.34.1744351754781;
        Thu, 10 Apr 2025 23:09:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx5COGNoO1BzAij6r3Tq85m1WsO99uIIPdBpPpSn6yEkwUnzsBHgs3C0kwKICd4VlbxAtivw==
X-Received: by 2002:a17:906:f1d1:b0:aca:d649:72ea with SMTP id a640c23a62f3a-acad6497352mr59420366b.34.1744351754388;
        Thu, 10 Apr 2025 23:09:14 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be941asm393302666b.54.2025.04.10.23.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 23:09:14 -0700 (PDT)
Message-ID: <360fe1770511702e35081e950bf2a362a4c092a8.camel@redhat.com>
Subject: Re: [RFC PATCH 7/9] rv: Retry when da monitor detects race
 conditions
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Tomas Glozar <tglozar@redhat.com>, Juri
 Lelli <jlelli@redhat.com>
Date: Fri, 11 Apr 2025 08:09:12 +0200
In-Reply-To: <20250411045225.gP4DqmFt@linutronix.de>
References: <20250404084512.98552-11-gmonaco@redhat.com>
	 <20250404084512.98552-18-gmonaco@redhat.com>
	 <20250411045225.gP4DqmFt@linutronix.de>
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

On Fri, 2025-04-11 at 06:52 +0200, Nam Cao wrote:
> On Fri, Apr 04, 2025 at 10:45:20AM +0200, Gabriele Monaco wrote:
> > DA monitor can be accessed from multiple cores simultaneously, this
> > is
> > likely, for instance when dealing with per-task monitors reacting
> > on
> > events that do not always occur on the CPU where the task is
> > running.
> > This can cause race conditions where two events change the next
> > state
> > and we see inconsistent values. E.g.:
> >=20
> > =C2=A0 [62] event_srs: 27: sleepable x sched_wakeup -> running (final)
> > =C2=A0 [63] event_srs: 27: sleepable x sched_set_state_sleepable ->
> > sleepable
> > =C2=A0 [63] error_srs: 27: event sched_switch_suspend not expected in
> > the state running
> >=20
> > In this case the monitor fails because the event on CPU 62 wins
> > against
> > the one on CPU 63, although the correct state should have been
> > sleepable, since the task get suspended.
> >=20
> > Detect if the current state was modified by using try_cmpxchg while
> > storing the next value. If it was, try again reading the current
> > state.
> > After a maximum number of failed retries, react as if it was an
> > error
> > with invalid current state (we cannot determine it).
> >=20
> > Monitors where this type of condition can occur must be able to
> > account
> > for racing events in any possible order, as we cannot know the
> > winner.
>=20
> Is locking not simpler? I understand raw_spin_lock() doesn't work
> because
> it steps on some tracepoints. But how about adding something like
> raw_spin_lock_notrace()?

It is probably simpler, but I think it would require also to disable
interrupts (some events occur in interrupt context), I'm not sure the
introduced overhead is going to be worth it in the fast path, but
that's kinda what I wanted to learn in this RFC ;)

>=20
> static inline bool raw_spin_lock_notrace(raw_spinlock_t *lock)
> {
> 	preempt_disable_notrace(); //probably not required,
> tracepoint handlers do this already
>=20
> 	if (!do_raw_spin_trylock(lock))
> 		do_raw_spin_lock(lock);
> }
>=20
> My LTL series theoretically also has this problem, but I have never
> got it
> during testing yet. We should use the same solution for both DA and
> LTL.

Yes totally, on the long run we might get some common utilities for
this kind of things that aren't too monitor specific. But for now I
wouldn't worry too much.

>=20
> Also, can you please Cc me in your RV patches?
>=20

Right.. will do!

Thanks for your feedback,
Gabriele

