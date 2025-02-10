Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D9925334D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228937; cv=none; b=FkWUzgQ2dkwc4bVWF2oCur7dm83gU04LFKW0pAvYa7jKXs4QbRgxVwCsEgSD7cZ1PS3o20evaHZ6cfyEtd3bXKGph3N++7H+/7T1maquT63DEstI1ylsLDaRFDZ4HVAO0iHBRDNLetJTpYGfjd+MApgPZjPECOwqEjz7FqBkeK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228937; c=relaxed/simple;
	bh=fINcPpwYH1eooxLnlCXYV9UBGR9hVoXZdDMYpFYul4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djSfSwPaDdtJ3A/JXeqEYKDFaclkLksiPzBooUV7p2YHKfFO3phHIzsTPdOu0vJxhas7V7purx4guGLaBQyHEDS1B5thhS06ckR13ug/KRU7Pq+BJ03vgYBXgOaftuv3I1euyAPSg+IBcIJj8wlOTUSlF9PQ+xRX9eJkcCC57os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h29t15vo; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h29t15vo"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5de6c708315so3423094a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739228933; x=1739833733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bM7OppAJHJA54+hF0HuhHJkeWAYVArWtZB3N6/aZ9k0=;
        b=h29t15vohDOYzvn3w22yM1AZmfzrIO431kElJV3A6qOjO0atqf024USjhDt4LRg9/V
         qhUL7BO7B4ipyVYpeMQhiisFLAhMNtx9IHyYcKUhxc1jRkc6wJDLMpjtyOkR1mRZcHjU
         /wqHA70grYcUl5TlvK8IkqCevRaffLddpKxUQCMa/9EyQVVBR9bFUBChmuxSY1nAl8oL
         K+LEJpsYIU3/nF9qZpJeaV6kzkr0fk/az6FfXQxK5GWGYY46cbzDv74oG4JOWIwaRNtK
         uyPX2/o3nZ0JAS0SjDw8hzaPx732IwLnfPIcSR+qSCMT0/WALY/587uPe5I+UqOg+6nT
         ivww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228933; x=1739833733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bM7OppAJHJA54+hF0HuhHJkeWAYVArWtZB3N6/aZ9k0=;
        b=uYM1l8yaiq6+VC8BR5/w5vNSZpauhmoK8nKOCNrMe9UqJ6KV3Va7IUtYs6mhvaKWdw
         Sy/f1EUmrs75VrGBpARvLVhYuVNF6SIP6QGtihM4MbAFJwu1K00+grpSvMTm+g+VYoMc
         uiodppIPCq1PHfv+E09EdYDE1QK/0xnkp98dgQit0YVES79OkJFOnewtoKElNTyT4J5Q
         OW6TyGSrvcWVad/Ys06yEbKX6iY7ZdvtK8aOJ1Bl8CV4jslTMV9R1tZXxt6b4bx9PhO+
         RerdGGw6h2zetKSFKjFv07mselBx50A4ziGBZEPzoKHgPRxvlmE6fjRJtwocfHmAl/U+
         0PGw==
X-Forwarded-Encrypted: i=1; AJvYcCV6U/fwupe/us4NEjF2KHQvG0TRatAh2dDRdYnvrpMi38YNYcBnlrt9azNvdhDVK+7g2y3IQZ06H+5BfWg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7oq0qsSd5yz580IR40DGV/GnXDQr//lERX0tKup2diCCUwzG5
	5SkBdYTBxhcFOkyRarwO2QcMJwKEgVfpATN2XQyvvLmqJau9s5HYh1gVx9s3Sra6r88Qn73IC2S
	LsmcHLnJOBTctXGHc0JPkYyeg/A0WNYGs
X-Gm-Gg: ASbGncsJFhj0qNl4qluGC8MoCE/n3PcDJEfVRACfyUu1cLFSC0UMb4ga3pu/lDlTngr
	nL5ifFQkGbu32YxJH3NGGx5GW0XiY5syk/fZf7pXWhA0SADMPn6Ymbz/ewLfyxVH7cW/nbKNk
X-Google-Smtp-Source: AGHT+IGlSrhvu1VCfPZpz5yJ7tLEYktjlbuRE+EfLAP/DE0dy9fWNFKJAT6/L6gPlZ+UNFGup260rlI2mcml6ClPXHE=
X-Received: by 2002:a05:6402:5252:b0:5dc:767d:f032 with SMTP id
 4fb4d7f45d1cf-5de4507349emr15750094a12.24.1739228933141; Mon, 10 Feb 2025
 15:08:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210210541.867037-1-mjguzik@gmail.com> <202502101454.DE164D34@keescook>
In-Reply-To: <202502101454.DE164D34@keescook>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 11 Feb 2025 00:08:41 +0100
X-Gm-Features: AWEUYZnoAmtbG2Y2v7r1qD5x6XXWK7KXbILoU2j-KL6tsZrF6nV_g-Ft9GMPghY
Message-ID: <CAGudoHFiTYi8SeFmRDYH-n=yCxr1-78JMrbVaiGNcfnnHVBRrw@mail.gmail.com>
Subject: Re: [PATCH] seccomp: avoid the lock trip in seccomp_filter_release in
 common case
To: Kees Cook <kees@kernel.org>
Cc: luto@amacapital.net, wad@chromium.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:57=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Feb 10, 2025 at 10:05:41PM +0100, Mateusz Guzik wrote:
> > Vast majority of threads don't have any seccomp filters, all while the
> > lock taken here is shared between all threads in given process and
> > frequently used.
> >
> > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> > ---
> >
> > Here is a splat from parallel thread creation/destruction within onep
> > rocess:
> >
> > bpftrace -e 'kprobe:__pv_queued_spin_lock_slowpath { @[kstack()] =3D co=
unt(); }'
> >
> > [snip]
> > @[
> >     __pv_queued_spin_lock_slowpath+5
> >     _raw_spin_lock_irq+42
> >     seccomp_filter_release+32
> >     do_exit+286
> >     __x64_sys_exit+27
> >     x64_sys_call+4703
> >     do_syscall_64+82
> >     entry_SYSCALL_64_after_hwframe+118
> > ]: 475601
> > @[
> >     __pv_queued_spin_lock_slowpath+5
> >     _raw_spin_lock_irq+42
> >     acct_collect+77
> >     do_exit+1380
> >     __x64_sys_exit+27
> >     x64_sys_call+4703
> >     do_syscall_64+82
> >     entry_SYSCALL_64_after_hwframe+118
> > ]: 478335
> > @[
> >     __pv_queued_spin_lock_slowpath+5
> >     _raw_spin_lock_irq+42
> >     sigprocmask+106
> >     __x64_sys_rt_sigprocmask+121
> >     do_syscall_64+82
> >     entry_SYSCALL_64_after_hwframe+118
> > ]: 1825572
> >
> > There are more spots which take the same lock, with seccomp being top 3=
.
> >
> > I could not be bothered to bench before/after, but I can do it if you
> > insist. The fact that this codepath is a factor can be seen above.
> >
> > This is a minor patch, I'm not going to insist on it.
> >
> > To my reading seccomp only ever gets populated for current, so this
> > should be perfectly safe to test on exit without any synchronisation.
>
> Unfortunately, this is not true. SECCOMP_FILTER_FLAG_TSYNC may operate
> on non-current. See the paired smp_store_release() and smp_rmb() uses.
>

Ok I see:

  630
   631                 /* Make our new filter tree visible. */
   632                 smp_store_release(&thread->seccomp.filter,
   633                                   caller->seccomp.filter);
   634                 atomic_set(&thread->seccomp.filter_count,
   635                 =E2=94=82          atomic_read(&caller->seccomp.filt=
er_count));

My grep was too naive :)

> > This may need a data_race annotation if some tooling decides to protest=
.
> >
> >  kernel/seccomp.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/kernel/seccomp.c b/kernel/seccomp.c
> > index 7bbb408431eb..c839674966e2 100644
> > --- a/kernel/seccomp.c
> > +++ b/kernel/seccomp.c
> > @@ -576,6 +576,9 @@ void seccomp_filter_release(struct task_struct *tsk=
)
> >       if (WARN_ON((tsk->flags & PF_EXITING) =3D=3D 0))
> >               return;
> >
> > +     if (tsk->seccomp.filter =3D=3D NULL)
> > +             return;
> > +
> >       spin_lock_irq(&tsk->sighand->siglock);
> >       orig =3D tsk->seccomp.filter;
> >       /* Detach task from its filter tree. */
>
> If this can be made provably race-safe, I'd be fine with the idea, but
> at present, all seccomp.filter manipulation happens under
> sighand->siglock...
>

The loop in seccomp_sync_threads actively skips every thread with the
PF_EXITING flag set, while it is an invariant that any thread passed
to seccomp_filter_release has the flag. So one only needs to ensure
visibility.

The flag gets set in exit_signals().

If the target thread is the only remaining there is no sighand lock
taken, but there is also nobody to execute seccomp_sync_threads.

If there are more threads, the flag gets set under the sighand lock.
Meaning by the time it gets unlocked, any other thread executing
seccomp_sync_threads is going to spot it and refrain from messing with
the exiting thread.

I'm going to need to sleep on it, maybe I'm missing something, but I
think this *does* work as is despite my failed initial assertion of
only current messing with it.

--=20
Mateusz Guzik <mjguzik gmail.com>
