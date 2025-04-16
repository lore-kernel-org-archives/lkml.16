Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6B514A4DB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744846240; cv=none; b=tJ5joHIg7riiKAN24jcTSMafEq9SX6Ikek9Ov1o5U21luvcxh4X+NKWvyHdehGgvNoPVpfkrB0+OhLvpeDa5S25tQOQo4GRuxx0on8A1h6KF9JalTNwN5MfVSdhWt4HtNoui3YXHTu8tcfTIamPG7g7XHl/D+3Z1IKs855+Bi2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744846240; c=relaxed/simple;
	bh=MGPfDFapz4BLNYKGYss7MDGUC5ybmRtpmFWGYPx2mZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQ5IqGRF0oLiHz9B1L6vujK+d3jr2QeQ85kCkpXGfNOjIXMYkw8wofOhexUOPtuQi9urs1fe0SXtGc+biLSt+B5cOU/9mJBJKJHCFb7uppLUCF5dbdpUKO5kuzzmaPGBx2Wgdw/dvkp17Yut4bfuT2MGitIkjja73oroQfOpOu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CF95M2EU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CF95M2EU"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54b0d638e86so239251e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744846236; x=1745451036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Z6vGJVoxuYAhoJIx7oKCLO44WKCyLiGoqfVIYBCsWg=;
        b=CF95M2EUl0aUdUR37bDolW+tmTFVBV426I7TLxMyqLJLQ8KcV2Nefa/A3u9OepVYif
         Ppp6pVZsyLWG1SF5zVvNns3FbKk9O3lfYOAMEftuidM42FSmUaUoCvimcMKtWMtPiA1r
         2h8+aESYAYEwI6K/NcIGDc64mSKdKcY0YsuV0grEjVYZPpFaLo7Drns85COliR2qsHgM
         YY+XcqwfothzKKB0jkhtxxGI87SIh42/xy8WoKSsfODaiESWGp2ZhqZZCTegYr/q9hbm
         apHZgAVCm0DHgsJsjz7oQ/0BzSUpmK45g3Lgu0/7S76f2EXpK/mOdncYXOPhw7GGcQxC
         1cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744846236; x=1745451036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Z6vGJVoxuYAhoJIx7oKCLO44WKCyLiGoqfVIYBCsWg=;
        b=bnFbR2uphd5Fk7qHrolIa7swmmvNL656xVA99rh1H0u0nvo9XvZd+tmNms0D20VngW
         usLR68E507NEALXBaoe+ZRLjuukcFv2IuwXowmtXW0fDqK3X/JPaP+flXcaBDqdSs0hC
         Jovgd+P1ztaqY+63TY0PjjZfS2SV8+AnKagUPWZ5BJTTexw/3Bio80h8ifq8vzHReEgs
         SPA+iGZ9ZgKG38OQW0uXbjyU+505i240YnTWoCWnDKNoZ6tOHaRIMZO3a1U0HzH7HaYn
         AwlcwE+zX4rB7VK0965szEAudBf+yPFa8yw+8+Y74t6nvhIO9SC5GM+LY1wVSqto5ZyP
         Gsmg==
X-Gm-Message-State: AOJu0Yz7nDU90IY+pw06dn+DPidvZ0DMf/O2F6L5oeZ6XAIrB5H43uIW
	i/SCP7VVuaE0oajyDPSslIbQ0t+VcTSYtVajaBEeffPJIQvL82njeFJrbcg551RiM7Gh8nufvY3
	EA6F2MFCVmBK1r8QwbX2Wf8qj8MPhLMeQwJ8=
X-Gm-Gg: ASbGnctReD3BdNgTzZHmGou09bPSj6QftClPBAzTNGk04ZywhpjL0/jqdz84FTvlLsN
	mC3Mhz+tnOAZkqKbNO8cFJ6PBTOokuCnMsv8OFtOnqNav3P/L/GoVWMKE9MbXUKJC82hmdQW0Ir
	atCxwET+W/5Icwrtzd2ppKUZ8LrGQtX5xw5XFP+0orIsQwzfjFCWZar1ngwMofHQ==
X-Google-Smtp-Source: AGHT+IFB23tmXtRBj+12nwIqC1ZCL1yU9X/Z2OFoInvMwSpJ9jZHEMfE/KlbuStjW8Y1RN0OfC2R8jhYdoSUrIujAsE=
X-Received: by 2002:a05:6512:1193:b0:545:c33:4099 with SMTP id
 2adb3069b0e04-54d64aa9ed7mr1096786e87.27.1744846236398; Wed, 16 Apr 2025
 16:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412060258.3844594-1-jstultz@google.com> <20250412060258.3844594-5-jstultz@google.com>
 <Z_zVULdTgt9J4rqf@jlelli-thinkpadt14gen4.remote.csb>
In-Reply-To: <Z_zVULdTgt9J4rqf@jlelli-thinkpadt14gen4.remote.csb>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 16:30:24 -0700
X-Gm-Features: ATxdqUFf2WEILAdDyp6Ahmsq2H3HNNGpHsDb-CFD0fgipOuLUR8YWoI-oYuPnts
Message-ID: <CANDhNCq1X9dcLCwb9Uod=C-i7giwqWkTso+a6S8n+wXCghq+MQ@mail.gmail.com>
Subject: Re: [PATCH v16 4/7] sched: Fix runtime accounting w/ split exec &
 sched contexts
To: Juri Lelli <juri.lelli@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 2:28=E2=80=AFAM Juri Lelli <juri.lelli@redhat.com> =
wrote:
> On 11/04/25 23:02, John Stultz wrote:
> > +static s64 update_se_times(struct rq *rq, struct sched_entity *se)
> >  {
> >       u64 now =3D rq_clock_task(rq);
> >       s64 delta_exec;
> >
> > -     delta_exec =3D now - curr->exec_start;
> > +     delta_exec =3D now - se->exec_start;
> >       if (unlikely(delta_exec <=3D 0))
> >               return delta_exec;
> >
> > -     curr->exec_start =3D now;
> > -     curr->sum_exec_runtime +=3D delta_exec;
> > +     se->exec_start =3D now;
> > +     if (entity_is_task(se)) {
> > +             struct task_struct *running =3D rq->curr;
> > +             /*
> > +              * If se is a task, we account the time against the runni=
ng
> > +              * task, as w/ proxy-exec they may not be the same.
> > +              */
> > +             running->se.exec_start =3D now;
> > +             running->se.sum_exec_runtime +=3D delta_exec;
> > +     } else {
> > +             /* If not task, account the time against se */
> > +             se->sum_exec_runtime +=3D delta_exec;
> > +     }
>
> ...
>
> > @@ -1213,7 +1224,7 @@ s64 update_curr_common(struct rq *rq)
> >       struct task_struct *donor =3D rq->donor;
> >       s64 delta_exec;
> >
> > -     delta_exec =3D update_curr_se(rq, &donor->se);
> > +     delta_exec =3D update_se_times(rq, &donor->se);
> >       if (likely(delta_exec > 0))
> >               update_curr_task(donor, delta_exec);
>
> Considering that we calculate delta_exec in updated_se_times using
> exec_start of the sched_entity passed as argument, is it correct to use
> donor in the above?

Sorry, I'm not sure I quite understand your concern here.  Why are you
thinking using donor might be problematic here?  We're passing the
donor->se in to calculate the delta_exec.

I'll grant that "update_curr_common" maybe isn't the best name for the
calling function anymore, as we're really only working on the donor
here. Is that what your concern stems from?

Apologies for not quite understanding right away. I really appreciate
your review and feedback!

thanks
-john
