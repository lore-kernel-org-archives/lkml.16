Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2FE20D508
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738671189; cv=none; b=DEAKX81MWD3Kw+c3FQHOumjpzTMss0och2hvuc1sWuWFC5lncLj/1B8eRQ9Yuva4wBKz2eAKmObc15c5OVqRjCQ3vHGBl+YcDEdcg+nTKBfT+YfmoXcbhhogLAxUh2Z4MEFn4QHXrFuJ/YwR9a6rR0Xg1Wjp1BKwCajWy/0/SPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738671189; c=relaxed/simple;
	bh=1ChJVMwytVdbYvt/4/qb5G3b6WARxrARCtulIVtaHZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bejeOwGwwCvFiFwfqmm/EEytQFcNNPbHxNpemEGlp0tUsy22BocPA5rLwMADwPUunlXBRz0MqCCP1RQfbVNCqN3k97erkS9mikn05T+CSoA7IzqKYzMyEsqo5juf+QpGY4apaGlqd+zD6vG4gag6oPkmrnEeLP408DmDy/4sIC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ksum3pjv; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ksum3pjv"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso10041491a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738671185; x=1739275985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRRnjWlfIVm6w/pghY+MVcet6bWLZj7mP0DYoi0BL1c=;
        b=Ksum3pjvBEzrIZ+lnQ+aYc7Y8+FYEmjEgZxU+l9/VRAtgVnuIYZOKneKq9WfM40gmr
         mcRi4a6RwU4qAWLfwdyEjzYacBCwUFtCOOLAPCZXXdVDeg4pjoUkY/84Cjo5WUCKDMM9
         sVKhgZQey42FendZB5HGksm1pR1AEG5RwcQJTlcfQNHyzobVHCBhXjiedeJ0di3AlC0T
         5LImAgAw+cDuaWQJuBHKhwRU7+Feep11yk/+XWE9nk+LcI/J5RrXnDi8UbAzzYO2dNRh
         GosLVqeJI91VELX4mHwEB/xVw7J4Y+Ig7bvGCVAU8uj3ux8khkHDG5UlVwwUY32SBZdn
         HQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738671185; x=1739275985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRRnjWlfIVm6w/pghY+MVcet6bWLZj7mP0DYoi0BL1c=;
        b=FDpiWuYPuYFzJg5mVSXhmV87Elq2COxC68k8lksf+wsYERBUYm5mivpvmIqVP7D2hR
         ytUyBl9zAcdHmxwsRKsumDR8ZIFasLFu2KfCH7N7K1fVqZT2CbGtJV4gH7EZtPV5bcbz
         PHAmyO43ZtPhMGwImI4oTf9kqhXxRWBAL9TkepNwnzv/fzNarfmlj+LtZLHeIAS1Gcgb
         Ke/CbjacwYk196ZWFJxgGWWx1T3ShuyIb5Xc3whcfSmeNuk/GpnSaLSZPvGxCJVBDHOv
         CQ9yLSpT3gKGVg8J+w04m4UV6t9VP0CUEHhhS6HiDv8bsI1o992Rv47Sbva4hFdJ+AaQ
         WjMA==
X-Forwarded-Encrypted: i=1; AJvYcCUPA5Uddjw4EodZg9IjCVMOH8bdPUFCINCsh26cO5Ju9HJJMdlRjsrwaiFQ4Z+B9yhant5FNWY13gkqsQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDA4gIYV5oyfgTUOwGHw6mqPwNasbZPQimMdsN/BCBDtTR3yAi
	ILR42FbBmukiTHx6O/g1uWPFbl8yta6zcbj2UlkaR2s7Ua7HFbNRvZc1TPQzpz65rlTjDs1MNoB
	wx6u/1t6A+ocOZtHRLNwVgzeXMl8=
X-Gm-Gg: ASbGncvvL6x12RdMO3rrOHprBiBSbszfpXpvyFMlTWHD1QGYEJwKVJPSC8eMRMp5RTO
	cylFXGth3wHbr/jHCMm41liEKr9B51zRooYB2FG8WMpmt3vKuI8fEEcx3BK+WDTVu7R/eDlM=
X-Google-Smtp-Source: AGHT+IE8Pb8E8/DVhgn/1Bnw4b6MVo2ceJNIa27kOu65bnvqFs44utskf4y0UnDllMDniLmc/WtPM98e2H1LcdkVUhE=
X-Received: by 2002:a05:6402:26c9:b0:5d4:1ac2:277f with SMTP id
 4fb4d7f45d1cf-5dc5efc1b98mr28418744a12.9.1738671185148; Tue, 04 Feb 2025
 04:13:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201163106.28912-1-mjguzik@gmail.com> <20250201163106.28912-4-mjguzik@gmail.com>
 <20250203180623.GC1003@redhat.com> <CAGudoHEWJqJf4mhcs1+Oes3qK1zFOYnb8Dnkj0aQD52yjMO=ZQ@mail.gmail.com>
 <20250204112236.GA6031@redhat.com>
In-Reply-To: <20250204112236.GA6031@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 4 Feb 2025 13:12:53 +0100
X-Gm-Features: AWEUYZnWBw_jz5cDO1GIBMTrxH4MbqQJVNL_mw_DqrYzHljSZD2TA5sT15JmnPA
Message-ID: <CAGudoHFgb1YB79vrHsF4SCsqFmhUEQKDAxweAGwFUt=s4A5aNw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] exit: postpone tty_kref_put() until after
 tasklist_lock is dropped
To: Oleg Nesterov <oleg@redhat.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 12:23=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 02/03, Mateusz Guzik wrote:
> >
> > On Mon, Feb 3, 2025 at 7:07=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> =
wrote:
> > >
> > > On 02/01, Mateusz Guzik wrote:
> > > >
> > > > Instead of smuggling the tty pointer directly, use a struct so that=
 more
> > > > things can be added later.
> > >
> > > I am not sure this particular change worth the effort, but I won't ar=
gue.
> > > I'd like to know what Eric thinks.
> > >
> >
> > it trivially whacks an atomic from an area protected by a global lock
>
> Yes, but I am not sure this can make a noticeable difference... Let
> me repeat, I am not really arguing, I leave this to you and Eric.
> The patch looks correct and I have already acked it. Just it looks
> "less obvious" to me than other changes in this series.

Reducing lock hold time is basic multicore hygiene, doubly so for global lo=
cks.

Atomics are notoriously slow even if cache-hot.

I agree this change in isolation is not a big deal, but there are
several other "not a big deal"s in the area which will add up if
sorted out.

Given the triviality of the change as far as complexity goes, I would
argue that's a routine patch not warranting much of a discussion
(modulo the new struct, for that see below).

>
> And even if we do this, I am not sure we need the new
> "struct release_task_post", it seems we can simply move
> tty_kref_put() from __exit_signal() to release_task(), see the
> patch at the end.
>
> Nobody can touch signal->tty after the group leader passes __exit_signal(=
),
> if nothing else lock_task_sighand() can't succeed.
>

I wanted to keep "whack the tty" logic intact in order reduce any discussio=
n. ;)

This brings me to the release_task_post struct.

Suppose the tty thing does not get patched at all or gets patched the
way you are proposing here.

I still need a way to handle the pidmap stuff. Suppose to that end a
pid array gets passed directly.

Some time later another thing might pop up which gets determined
within the lock and wants to return the state to clean up after the
unlock. Then someone will need to add a mechanism of the same sort I'm
adding here. iow I'm future-proofing this and tty just happens to be
the first (even if not necessary) consumer. iow preferably the struct
(or an equivalent) would still be there without tty stuff.

Given the nature of the change there is a lot of opinionated
handwaving possible and "happy to change" vs "feel free to ignore" is
not a productive discussion, thus I would like to clarify: my primary
interest is to whack the pidmap thing out of tasklist_lock-protected
area and this bit I'm going to argue about. Everything else is minor
touch ups which I can drop without much resistance (I'll note though
there is more I can submit in the area later :P), but if you genuinely
want something changed, it would be best explicitly say it.

As is, given the prior ack, I intend to submit v4 with minor touch ups.

> But again, feel free to ignore.
>
> Oleg.
>
> --- x/kernel/exit.c
> +++ x/kernel/exit.c
> @@ -146,7 +146,6 @@ static void __exit_signal(struct task_st
>         struct signal_struct *sig =3D tsk->signal;
>         bool group_dead =3D thread_group_leader(tsk);
>         struct sighand_struct *sighand;
> -       struct tty_struct *tty;
>         u64 utime, stime;
>
>         sighand =3D rcu_dereference_check(tsk->sighand,
> @@ -159,10 +158,7 @@ static void __exit_signal(struct task_st
>                 posix_cpu_timers_exit_group(tsk);
>  #endif
>
> -       if (group_dead) {
> -               tty =3D sig->tty;
> -               sig->tty =3D NULL;
> -       } else {
> +       if (!group_dead) {
>                 /*
>                  * If there is any task waiting for the group exit
>                  * then notify it:
> @@ -210,10 +206,8 @@ static void __exit_signal(struct task_st
>
>         __cleanup_sighand(sighand);
>         clear_tsk_thread_flag(tsk, TIF_SIGPENDING);
> -       if (group_dead) {
> +       if (group_dead)
>                 flush_sigqueue(&sig->shared_pending);
> -               tty_kref_put(tty);
> -       }
>  }
>
>  static void delayed_put_task_struct(struct rcu_head *rhp)
> @@ -279,6 +273,10 @@ repeat:
>         proc_flush_pid(thread_pid);
>         put_pid(thread_pid);
>         release_thread(p);
> +
> +       if (p =3D=3D leader)
> +               tty_kref_put(p->signal->tty);
> +
>         put_task_struct_rcu_user(p);
>
>         p =3D leader;
>


--=20
Mateusz Guzik <mjguzik gmail.com>
