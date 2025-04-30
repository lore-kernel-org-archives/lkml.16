Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F21EDA06
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746050663; cv=none; b=brsv1cJ1Shpf3DVDWn/QPX1pWJMkqyOl+mVB3RT+OPX8IaUnpt68BbJLnij5UN6aqnJ8cNaLWBNTUZ1FmoDoymJ+ielQRlpe9E8Yz6xHpyfAioLEK5rBSTDSPHTiI1a33QP4uROX3Urz5vYynZWnvs0OaCn794frfdlpub68pl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746050663; c=relaxed/simple;
	bh=V+uBfjWF7Nv/iGZBpfHhVifIs7t6R8r7ypyIiHDWEtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iew6DML6hHRzfK4saiR5/MPtqckzgnJ5mWxEsc8GjLXgj5YaeGxz8Veo90CQ+NFbUkubvmqwjOtzJYdwdjkS4BrnpCSxVTT1rW2ecEX2Y3QlnbwfbEyHI9cbm2H1RI+R8ry0DZv21SxGLTQ5Ng/raZOJSKOoQqdEqrOGmAGqIss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RKzyXW/2; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RKzyXW/2"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54af20849adso379198e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746050660; x=1746655460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfxhSPdXLWl6PO+Mfnzt5fptOWyX9muDxmvIopUSBvA=;
        b=RKzyXW/2u5TU3Zxy5u/YZuBSLgACmkHGodzwSQdLLNoaY+HOdh8HqzUSpUXaHpW9i3
         xtp9PX34IbgzReTRCNJ6Cl30cwvaN9iBLBMU/i4ukeAaBu95HGgfEMSrcscT1tOrQxTc
         97gj/5946RfveAtWVrJHr+sr4Zcj/rHZFhHeTi813mWRhZ1CDgWnfc6fy4e9c88MTvcq
         VZfU27PgcU95tdPM/GlsxzKQGTfbW46KrgBQlIDyUXaHoBvgisjHnyLKWxxM/dDW0naK
         dy6MUMYsavNkS5NQsETUztQ9bPkq0XHXZ9l/mlsRn3v/ct+a80Zq11lbZMJIKAp5VUIR
         iUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746050660; x=1746655460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfxhSPdXLWl6PO+Mfnzt5fptOWyX9muDxmvIopUSBvA=;
        b=iqBwo/ryJTXVolRoZXOByQ1Ords42QpCMGvWlBJ7Q1mHcwsYvKOcJlsvrXHAspio3r
         YVJ3VN3pD9XitUyFlUIxMZgDZIeRr8/8MQG5uCnWqCnJZ6ESIfmBQDmEwlWc65+SPH9J
         srdM31+tyGkQ9nInUwYgR2/cGFJchzAI1uJavT/sVLUrhTM7GF4rvQPId2roPT3wYy2Y
         xQiI0f5U6idYuwaxXY/oWd764pHPAFhygkFZ5g4gXt/TOeWIxZQvUKyreVPvxRiZlem7
         57AQnIgBjLrPqgRffnDZur/TwjwWoYz/+3BuQEGjYBq5ZsSGf4JAmgk8oPeY/GPGIbJX
         Hb9w==
X-Gm-Message-State: AOJu0Yy9Xwl4jqd/E34DjmKfqfDvcG4wIlw8qc/sG0OKVryKGnCx2/dt
	cG+ltwhxC8fq52KIdRM1M0EBsjhHOg6trKLT3OAiAuIzcd751wVRiSIdPv925rxs2niHWyM1xiX
	UJ5MsmQlJl4RAHtkLuS5hyXRQa2tc7j64snE=
X-Gm-Gg: ASbGncu5Un4F/u6M2+/TM7hZoLgmGxMlI3RqwmE+29xWq26UhBQgADrLI7OjKPVCBNq
	auUF9cI+9HNn60HfyRobC4sYvuIl1ZKOKXOSLMUH4hyGQ12hQgIlNVLNOv3U7EH5h5KYdsoCCRX
	Uu3oxhEKMPwDFM3unSM3AiUHPk0x4MAdlT0IpOb91erHtc8V1qMSfwUUDTVdgQvg==
X-Google-Smtp-Source: AGHT+IG/8XC2NFmxTFwX9kl2NaGxudCN0erWY1DDz4TdrxeXHNJsucbZQoyHbYf6Kj0GoWtPlplQwodcUM5AtJ5hTdw=
X-Received: by 2002:a05:6512:2389:b0:54e:8189:2eac with SMTP id
 2adb3069b0e04-54ea7a4d63bmr34121e87.12.1746050659490; Wed, 30 Apr 2025
 15:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429150736.3778580-1-jstultz@google.com> <20250430124339.GM4439@noisy.programming.kicks-ass.net>
In-Reply-To: <20250430124339.GM4439@noisy.programming.kicks-ass.net>
From: John Stultz <jstultz@google.com>
Date: Wed, 30 Apr 2025 15:04:06 -0700
X-Gm-Features: ATxdqUEPBTTnnnzc6fwH0xN6iGwKVVt4J9u9-p1eu6QNfqq2iLCXi9JPLxl9Zys
Message-ID: <CANDhNCq7qvW-CujA+bYzoK1=BJ_TEk6WD2fQJtOpcTC1fjNcfA@mail.gmail.com>
Subject: Re: [PATCH v3] sched/core: Tweak wait_task_inactive() to force
 dequeue sched_delayed tasks
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, kernel-team@android.com, 
	peter-yc.chang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 5:43=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
> On Tue, Apr 29, 2025 at 08:07:26AM -0700, John Stultz wrote:
> > It was reported that in 6.12, smpboot_create_threads() was
> > taking much longer then in 6.6.
> >
> > I narrowed down the call path to:
> >  smpboot_create_threads()
> >  -> kthread_create_on_cpu()
> >     -> kthread_bind()
> >        -> __kthread_bind_mask()
> >           ->wait_task_inactive()
> >
> > Where in wait_task_inactive() we were regularly hitting the
> > queued case, which sets a 1 tick timeout, which when called
> > multiple times in a row, accumulates quickly into a long
> > delay.
> >
> > I noticed disabling the DELAY_DEQUEUE sched feature recovered
> > the performance, and it seems the newly create tasks are usually
> > sched_delayed and left on the runqueue.
> >
> > So in wait_task_inactive() when we see the task
> > p->se.sched_delayed, manually dequeue the sched_delayed task
> > with DEQUEUE_DELAYED, so we don't have to constantly wait a
> > tick.
>
> ---
>
> (that is, I'll trim the Changelog a this point, seeing how the rest is
> 'discussion')
>

Ah, thanks. I've noted you tweaking my commit messages before merging,
so I'll try to do better about leaving ephemeral notes (and Cc lists,
apparently) after the "---" fold.
My apologies for the trouble!


> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index c81cf642dba05..b986cd2fb19b7 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -2283,6 +2283,12 @@ unsigned long wait_task_inactive(struct task_str=
uct *p, unsigned int match_state
> >                * just go back and repeat.
> >                */
> >               rq =3D task_rq_lock(p, &rf);
> > +             /*
> > +              * If task is sched_delayed, force dequeue it, to avoid a=
lways
> > +              * hitting the tick timeout in the queued case
> > +              */
> > +             if (p->se.sched_delayed)
> > +                     dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAY=
ED);
> >               trace_sched_wait_task(p);
> >               running =3D task_on_cpu(rq, p);
> >               queued =3D task_on_rq_queued(p);
>
> Lets just do this. I'll to stick it in queue/sched/core.

Ok, thanks so much!
-john
