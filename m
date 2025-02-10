Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FC6231C89
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196463; cv=none; b=Y6jEouSRGBvFX9c2sy/0aLoIiL33VvTR0sOBwkDRzK+Bi1b7s8CACCsWUvzosM3jTMQ0rAClwuyFmeNYkcYHy3TAQXt6cEFZi4Hye6mKbT7jMKCkOKW6imHa1dWhqqV2Ag88zF2wXAsCyVIb9m9FoiUJwMNeFlKHnjIN4KjQkss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196463; c=relaxed/simple;
	bh=J7fJTbywPBvQzEHnTPoaWwICK6qAlEyeYpXhYZxKI2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpSxWGYBnd3wBfk6QD34TVb1mjarJmlrvfBrtBp1CfByfs/h3fJAKEBesRQTFB+YN4LVKpMOUCwONlRSWHHTzmw5p4gW66EsHsfoLhwDr+zT7ZA0HF+ViZ54MAm2hiSJd1IMlCik4H7FnK2lgDq2idjrq129WvcfJL4cVKcP+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=j6mnen1H; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="j6mnen1H"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-439307d83f0so12169665e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1739196459; x=1739801259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0mkagQrLShZVdk5H2255n0SRNzKdf8QaJ4Fo2H5hYY=;
        b=j6mnen1HwrdneAeZhSf0/+6Bd10V04jJ2+OIEov00TERceAY/P7KX2tQlfT6MHkPuJ
         3WcxrDtUrQHjUblPB4SRqBGQLeueyrFHLKQOB0u7p/YTyXJSST+J/gZeOwnh52o+ga16
         YXKfBdUMXIZJbbFncNhfPrj7Tq0jjv7hHDQKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739196459; x=1739801259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0mkagQrLShZVdk5H2255n0SRNzKdf8QaJ4Fo2H5hYY=;
        b=w0WM/b/ZfSwz98uPDGK3vvN45ZBg12byaIl7N1lcpnEv044N54om5nD/OiWD1jkKMb
         BetY2dJnFaWpTTSXHgjCZbGdVI3bWJnCMoLpi+hsS7ksdCIrCCKGpl9iOzldGQfDbJH4
         TX3rYobCmCjhh+8JOtlOiI0EEEwESrhdXbNh+NLYpALAjEl45PV3vH8DSneV8h+//KMI
         0a9OQBUd9Ou+b+EZclAb4XFoYpucwtKJsJwiM6QRA63zDksYWE0TtFduCRrv4DbFxPqv
         ARDH3H9eEQwN3gy3Z1+EIBg69hXbUBDjFB08OLVyqtZ5O3KUKSen2oqlkrlOiKgV1RrG
         xV4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8H7eSN57FrjjnvVyBqHZj/Bcldno1qejQL9x4t4iHgXUQPGz+e8YSlzVgwrwqkk60TgjovbD4NngoMns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxql6b7SAbwhdypgHI6dGA9Wwf0IqcikXstvHaBnE4WC9Q/emRt
	BKqp6b6aB1LswnnzWwHmDId/T18jj3xgrgRCw2I5xApA9CT8TyhLwKBuDHDecHZJjJhnez6kIhn
	ErkFVvT1NTlDqP31qJOi0GnKrE1fbRb9HSe78AQ==
X-Gm-Gg: ASbGncsnJes1t6o+afQ7vDddl6AMseYd4BGPiZjqDroXpe5a39UEhx632iqFts1Gl/Y
	FEIbjEG0wpa5TsHjukefwNsUC1S5LJ23Cp41+ZnlNsjLqwFsmyMYPqdqvR2w0j4Pv+Da4Qf8x
X-Google-Smtp-Source: AGHT+IGxIlrUl6KkSiVWsX9ssbEDQy6PoNPBsPKG4NuEx7YWW6vGApblEwLGUcefq/4kHgdnJjr16lfmTeY8Hcu8wsA=
X-Received: by 2002:a05:600c:1909:b0:434:fafe:edb with SMTP id
 5b1f17b1804b1-439249b04d2mr105436075e9.24.1739196458293; Mon, 10 Feb 2025
 06:07:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <EC77D83D-DD17-4CCD-9EF6-C4C39FCE16E7@oracle.com>
 <9DA1FAE6-A008-4785-BDF9-541457E29807@joelfernandes.org> <20250204220418.35949317@gandalf.local.home>
 <CAEXW_YQxTi2y_hY_e4AjLSa6RwVVLn3DPj5d4Cfewq0js-0UTA@mail.gmail.com>
 <20250205081635.397eacb0@gandalf.local.home> <CAEXW_YQY2zuU+XZjrYWLS860+PJno0nf9WAe1iPU=EyDkA7H4Q@mail.gmail.com>
 <20250206083039.0916ad24@gandalf.local.home>
In-Reply-To: <20250206083039.0916ad24@gandalf.local.home>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Mon, 10 Feb 2025 09:07:27 -0500
X-Gm-Features: AWEUYZnPqUrM38HMt3sXrxskO2VmAyr4EFBG6mWi16NIsKaWAigNoh4M4L1D3xA
Message-ID: <CAEXW_YThrUgbbmje_1hRtWzNC5SozirDwhpccZiV=Trhe7HiHw@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/2] sched: Extended scheduler time slice
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-mm@kvack.org, x86@kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, luto@kernel.org, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, willy@infradead.org, mgorman@suse.de, 
	jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Konrad Wilk <konrad.wilk@oracle.com>, jgross@suse.com, 
	Andrew.Cooper3@citrix.com, Vineeth Pillai <vineethrp@google.com>, 
	Suleiman Souhlal <suleiman@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Clark Williams <clark.williams@gmail.com>, 
	bigeasy@linutronix.de, daniel.wagner@suse.com, 
	Joseph Salisbury <joseph.salisbury@oracle.com>, broonie@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 8:30=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> On Wed, 5 Feb 2025 22:07:12 -0500
> Joel Fernandes <joel@joelfernandes.org> wrote:
> > >
> > > RT tasks don't have a time slice. They are affected by events. An ext=
ernal
> > > interrupt coming in, or a timer going off that states something is
> > > happening. Perhaps we could use this for SCHED_RR or maybe even
> > > SCHED_DEADLINE, as those do have time slices.
> > >
> > > But if it does get used, it should only be used when the task being
> > > scheduled is the same SCHED_RR priority, or if SCHED_DEADLINE will no=
t fail
> > > its guarantees.
> > >
> >
> > Right, it would apply still to RR/DL though...
>
> But it would have to guarantee that the RR it is delaying is of the same
> priority, and that delaying the DL is not going to cause something to mis=
s
> its deadline.

See Peter comment: "Then pick another number; RT too has a max
scheduling latency number (on some random hardware). If you stay below
that, all is fine.".

> > 3. Overloading the purpose of LAZY: My understanding is, the purpose
> > of LAZY is to let the scheduler decide if it wants to preempt based on
> > preemption mode. It is not based on any hint, just on the preemption
> > mode. I guess you are overloading LAZY by making LAZY flag also extend
> > userspace timeslice (versus say making the time-slice extension hint
> > its own thing...).
>
> I already replied about that. Note, LAZY was created in PREEMPT_RT for th=
is
> very purpose (but in the kernel), and ported to vanilla for a slightly
> different purpose.
>
> Here's the history:
>
>   PREEMPT_RT would convert spin_locks in the kernel to sleeping mutexes.
>
>   This made RT tasks respond much faster to events.
>
>   But non-RT (SCHED_OTHER) started suffering performance issues.
>
>   When looking at the performance issues, we found that it was due to tas=
ks
>   holding these sleeping spin_locks and being preempted. That is, the
>   preemption of holding spin_locks was causing more contention and slowin=
g
>   things down tremendously.
>
>   To first handle this, adaptive mutexes was introduced. These would spin
>   if the owner of the lock was still running, and would go to sleep if th=
e
>   owner goes to sleep. This helped things quite a bit, but PREEMPT_RT was
>   still suffer a performance deficit compared to non-RT.
>
>   This was because of the timer tick on SCHED_OTHER tasks that could
>   preempt a task holding a spin lock.
>
>   NEED_RESCHED_LAZY was introduced to remedy this. It would be set for
>   SCHED_OTHER tasks and NEED_RESCHED for RT tasks. If the task was holdin=
g
>   a sleeping spin lock, the NEED_RESCHED_LAZY would not preempt the runni=
ng
>   task, but NEED_RESCHED would. If the SCHED_OTHER task was not holding a
>   sleeping spin_lock it would be preempted regardless.
>
> This improved the performance of SCHED_OTHER tasks in PREEMPT_RT to be as
> good as what was in vanilla.
>
> You see, LAZY was *created* for this purpose. Of letting the scheduler kn=
ow
> that the running task is in a critical section and the timer tick should
> not preempt a SCHED_OTHER task.
> I just wanted to extend this to SCHED_OTHER in user space too.

Currently it does not "let anyone know" it is running in a critical
section though. Various paths (update_curr(), wake up) just do a
'lazy' resched until the timer tick has elapsed, or the task returns
to usermode/idle at which point schedule() is called. And it does this
only for FAIR tasks. That can well happen even if the currently
running task is not in a critical section in the kernel at all. Sure,
it may benefit critical sections in the upstream kernel but where is
that explicit?  I still feel we should not overload this in-kernel
mechanism for userspace locking and complicate things.

> > Yes, I have worked on RT projects before --  you would know better
> > than anyone. :-D. But admittedly, I haven't got to work much with
> > PREEMPT_RT systems.
>
> Just using RT policy to improve performance is not an RT project. I'm
> talking about projects that if you miss a deadline things crash. Where th=
e
> project works very hard to make sure everything works as intended.

No no no, I have done way more than applying just the RT policy. So
that means you do not know me that well;-).. I have worked on audio
driver latency, low latency audio, latency issues in vmalloc code,
preempt tracers, irq tracepoints , wake up latency tracers and various
scheduler overhead debug =E2=80=94 many of those issues dealt with sub
millisecond latency.. I also dealt with cpu idle issues in the
hardware causing real time latency problems (see my past talks if
interested).  I was partly a hardware engineer when I started my
career and have built circuits. I have Electronics and Computer
engineering degrees.

 - Joel
