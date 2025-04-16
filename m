Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D85A1F9EC0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744838924; cv=none; b=qBsCf5Zq7Vu3XR4vvbXIl5Iixv37c8iNRATrx/AZPH1oTmnpcKf6S5TU37JPkG1EhOQgKYrNMBsgUiSe+5vSxV5lsS26av9U0oxzNUsmnITkE8EpfPnjwmu5dTtrXVBC2KWU4EE9kwpGAOxTd5MoHwdlkPMWv3w/BaF6KGrC8UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744838924; c=relaxed/simple;
	bh=eoBVnnPUhgVF1cfvk81joMfYh08VkzZEArlWxDLnqpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JI6m1EYnRX/BwsUH7L1RhWgel3wjZn38bV7HE9+k9CaqQi//VuOqqqmOvrTGlwg7GpjrNf/p9ZHLggVFABdPyNS2HycyjJwqYR9Dp8DAfu8mXuamuHuGsjyxxlxfwlIQeDCcocnqiN3/Eiwk9hsYtmVSU0Mi1Y4fpkjV0+PYmE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xa5ANgX+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xa5ANgX+"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54ac9d57173so1306847e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744838919; x=1745443719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pLWTE1bHrznzcsCBjQv6jrPRN7G/ZiWPfg7vnmSYcI=;
        b=Xa5ANgX+eOrTARE4Ubmi+h/sBFX+VGSRvMSToKXIm+4pOCkawSmUwO95sn9LPo3Xjj
         8zfDxbIYHD/Y+7wzv55ApubBThzrjBREvc6nYGcf+O31bQnRxuKn+ZxVT8v1xiVrzGdD
         /HPADqM/0117qz13ZgOKrBn7q+YxarXdIHw0JGU4RadQGdChFbU1PqysCWOMIoVYvjlq
         IA4JISOcHQFHzg4qhSUmeUAiT5iw1dFv6FO3BL6WIYshkM3kPSsdXqcgXc6jBhPa+z4p
         9m790w5u9BUEtQ9e85oed/cidzGqwBQ5MdJFLvft25Qy9sN0//+1wJ2Y0dDDmKAF2Vmg
         p+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744838919; x=1745443719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pLWTE1bHrznzcsCBjQv6jrPRN7G/ZiWPfg7vnmSYcI=;
        b=U7RkdZdjybU9RwluN8okFC7rjovdJqhJ9x0A1zM4S9DXwhtVxLhn6Gx9oAFwFBMvrs
         2FwBPFGOn5HwnSUL5xKTFiKalL1IARvFaQ46b3j3nSX8qAkGmIzPbIGc+6cvr7Ro6MaQ
         +ndaKzafhT7Cvc4PW7MLp9VxMYR7jCdrQniYgGv4rqqS1LGD9Di0p+ZO5mZjS72kBJp6
         BU5bwFqiyneDoHumbWH2SLnuciKXIXygs0n/h8NKkAm7f+rNmR4bpIEZJhmB3/XP5QFz
         4g2zvgEHNCuHDqsk0TKiFhNXFX/UPrw8EW0gpZtw78cJETeQZIgqEwgqFpI0X6GONiiZ
         t/8g==
X-Gm-Message-State: AOJu0Yxo0NAR/jhpy8EEje+8/31sM8AYaFVB6dsTx4q7zliEmSZFRUrq
	S2PfyTUXtSYoU49VJk8mTYicQwMXud2PM04/nA50v3oFeuGbTBVvDYNLgUcLVGDe3FVdi1UJLuP
	UyoywLGwznoV+fL0lo5jSfCqoAYgUNw1qraY=
X-Gm-Gg: ASbGncujtLd7dn24FlD+L0x0F2jKk6UoQH+CgwYLKjNTez6aEKPVAHFiJ59oHzPR5an
	/AP0HF9hINV4FLZCkGEPG+1/E5Ax0IvPuSzuo13/pTQnetEh1YAYmn4LR+WMHQDnhOCScHYz5Kc
	rmnkILNpTDlgzBKF50AvYdSg==
X-Google-Smtp-Source: AGHT+IHM+YlGnSWYef7grjfY5dUYEduUblnKk0XMvCUcC8hJMmh3RP8Dm0SIYn+4pFyq3s3JmtU2QND+TYl9b+7kbHc=
X-Received: by 2002:a05:6512:3e13:b0:549:8c0c:ea15 with SMTP id
 2adb3069b0e04-54d699a38e6mr107326e87.0.1744838918904; Wed, 16 Apr 2025
 14:28:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412060258.3844594-1-jstultz@google.com> <20250412060258.3844594-3-jstultz@google.com>
 <Z_zOjrlVng8eyFDh@jlelli-thinkpadt14gen4.remote.csb>
In-Reply-To: <Z_zOjrlVng8eyFDh@jlelli-thinkpadt14gen4.remote.csb>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 14:28:26 -0700
X-Gm-Features: ATxdqUEwID9qbIHICHDZY7xPEerynw5B9WMpYJNwxX6wqmzMOh0e3X1F4KRHx3w
Message-ID: <CANDhNCr8sza8fhdc1vxoRXuojdPsO4ZG8RZzvyfjSc7S45uhRw@mail.gmail.com>
Subject: Re: [PATCH v16 2/7] locking/mutex: Rework task_struct::blocked_on
To: Juri Lelli <juri.lelli@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef <qyousef@layalina.io>, 
	Ingo Molnar <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com, 
	"Connor O'Brien" <connoro@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 2:00=E2=80=AFAM Juri Lelli <juri.lelli@redhat.com> =
wrote:
>
> Hi John,
>
> On 11/04/25 23:02, John Stultz wrote:
> > From: Peter Zijlstra <peterz@infradead.org>
> >
> > Track the blocked-on relation for mutexes, to allow following this
> > relation at schedule time.
> >
> >    task
> >      | blocked-on
> >      v
> >    mutex
> >      | owner
> >      v
> >    task
> >
> > This all will be used for tracking blocked-task/mutex chains
> > with the prox-execution patch in a similar fashion to how
> > priority inheritance is done with rt_mutexes.
> >
> > For serialization, blocked-on is only set by the task itself
> > (current). And both when setting or clearing (potentially by
> > others), is done while holding the mutex::wait_lock.
> >
> > Cc: Joel Fernandes <joelagnelf@nvidia.com>
> > Cc: Qais Yousef <qyousef@layalina.io>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Juri Lelli <juri.lelli@redhat.com>
> > Cc: Vincent Guittot <vincent.guittot@linaro.org>
> > Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> > Cc: Valentin Schneider <vschneid@redhat.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Ben Segall <bsegall@google.com>
> > Cc: Zimuzo Ezeozue <zezeozue@google.com>
> > Cc: Mel Gorman <mgorman@suse.de>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Waiman Long <longman@redhat.com>
> > Cc: Boqun Feng <boqun.feng@gmail.com>
> > Cc: "Paul E. McKenney" <paulmck@kernel.org>
> > Cc: Metin Kaya <Metin.Kaya@arm.com>
> > Cc: Xuewen Yan <xuewen.yan94@gmail.com>
> > Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Suleiman Souhlal <suleiman@google.com>
> > Cc: kernel-team@android.com
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > [minor changes while rebasing]
> > Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Signed-off-by: Connor O'Brien <connoro@google.com>
> > [jstultz: Fix blocked_on tracking in __mutex_lock_common in error paths=
]
> > Signed-off-by: John Stultz <jstultz@google.com>
> > ---
>
> ...
>
> > @@ -940,6 +954,14 @@ static noinline void __sched __mutex_unlock_slowpa=
th(struct mutex *lock, unsigne
> >               next =3D waiter->task;
> >
> >               debug_mutex_wake_waiter(lock, waiter);
> > +             /*
> > +              * Unlock wakeups can be happening in parallel
> > +              * (when optimistic spinners steal and release
> > +              * the lock), so blocked_on may already be
> > +              * cleared here.
> > +              */
> > +             WARN_ON(next->blocked_on && next->blocked_on !=3D lock);
> > +             next->blocked_on =3D NULL;
>
> Here and below, why the WARN_ON() if the fact that blocked_on has been
> cleared already it's an OK situation? Ah, maybe it's catching the more
> worrying situation that the lock has changed since the task blocked?

Right. Just trying to make sure we aren't getting into any mismatched
usage of the lock.
If it has been cleared already, that's ok, but I want to make sure
otherwise that it is the lock we are expecting.

Appreciate the review. Let me know if you have any further questions
or clarifications!

thanks
-john
