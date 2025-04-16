Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA58DDDC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744838334; cv=none; b=HvKf8BNnatU6nHSXHSx5jG8jXvUgt7OVc5ZZcHehNg7L5uRq1qVJhJnHQPHiQzf0kyztCz1Qo2uglvhofULb5E8k7qiFNNb65BgN1Nk0Ivuxstx9oHWVU6osg0RtvyMA4qTb8WrmnIOZ6EXC/32fRpeq/IAt7vfIsWrCfuMQZTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744838334; c=relaxed/simple;
	bh=Cb9U7IuKvx/uMfj+IYmsYQll/9YNL+DAxszLidr81mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7kGn7mER0AVZp7NF9DIumdsxmW4TejUpNGcYp6cp4H4lCrfEoqkQ83pAMvJnxIUENi1iUXw1eKjrGc+hZCDU917jTXgz8joRQyKrbtAThqBKjbxYGlpsX7IGocR84ioGzkBVP9JZFU2sysrfyohG0SXABlvqM2iu9+d11j94T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ESnrIi1P; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ESnrIi1P"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so681281fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744838329; x=1745443129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPjD7kzykoNRkWT+bYBlZ0ltwrwnmxdbeyMaNdWLgNc=;
        b=ESnrIi1P7fKa75cHhh8NULhVAtE2pCHmIUlk9YJ0vmnaXUSzlatosnaxVgp050A4xA
         BbGmTRr/oEyujmzJXDht512hO9AVldMtfm+QhTIM1emgPAF2lFlWEYgIdXeOGdVX8pFh
         eMLRe0YvN9eS9RRfvYtaCR+r0xX3hSrSVOl2LvyQ7i2eBQr3bkkCyOydxoiBEAT+a13r
         XFpVbXU1DQT1P6JDVOeWNVREt6ft3J+/EnJsKIuQrRd0AJbuRFWGpmATisJ7xNJpQTrn
         jUdkPEww0vQHnNV6omT9FpT4YfgexNV/CWhetMHB96GNnpBryeLEOYnaXpNXbyWKTWX0
         RNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744838329; x=1745443129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPjD7kzykoNRkWT+bYBlZ0ltwrwnmxdbeyMaNdWLgNc=;
        b=Toq8T6enVegsR0wGesrX28tYYKNlDfpAthz8oUXsDmyjiw/GWJJNsl3FaDkFm3Qv95
         CGMWSrbjju1rCkeN42aF//VMKoo+7s2FAbaf5/77DAgXcDlVSn+qdkFKzdlqrUAprLpx
         NPxO0lLNc6qFe6e9QMtjJP4fLb07K0aqI2M2IV/ycEx9UAKgzPi2NTJQVWYEhYJg3LFU
         LU6jehDOpvj7Hj8pR3//SMYjBdyUkjoWv2p97loSNaztMdqr1TJXHBwTTeV9GUkbmqbh
         ETkshc7dCLAZIsEcgFszY0qo3HWRWX5peIESt/FD1ErNv1TfLNvFF33nf7l8EGtMJe8R
         0l0Q==
X-Gm-Message-State: AOJu0YxgF3qUlQN0maeQWhctyOQSavDM16VTURiyADg8TpTVnSThp+sP
	1CB5Mht5j/TBBn/SXHx+mTvuc7hl9fT4lrJs2Se9vLoLvFrx3klnTBBxUp8d2mciybIKxRys2hu
	3HLYALmYS9VY9hcMcij8q2Zs89+3eIHcPyGM=
X-Gm-Gg: ASbGncsq6290S8qDxyEKfDFfIHk9DnHh8R9ujuPLKY1nsdTL2CMXzBlux9jXUek5pke
	VxEEotEG2AJnPzEAusr1wuZ1/GsB/mG4BS0xk0O57DnYwqYgJ7GY3sBAjQMJGFo262uTzGyM7EB
	6CBxJXfBaC3ursGZwrTz+IqA==
X-Google-Smtp-Source: AGHT+IFBNrWXxXPFrTAY+0FDAScfyGlGiRBIDpUisEdr9ISnjeZPpIXNV6FNV51uCLS7xz0lvxskzh1k1vbx3dPirx8=
X-Received: by 2002:a05:651c:b0b:b0:30d:e104:b592 with SMTP id
 38308e7fff4ca-3107f73a75cmr11736641fa.38.1744838328928; Wed, 16 Apr 2025
 14:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412060258.3844594-1-jstultz@google.com> <20250412060258.3844594-7-jstultz@google.com>
 <c0ac6885-96df-4a44-9ab8-f80f5f334e84@amd.com>
In-Reply-To: <c0ac6885-96df-4a44-9ab8-f80f5f334e84@amd.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 14:18:36 -0700
X-Gm-Features: ATxdqUFsVaVrscBgwBzU0ncqWE3NBLFHFFVvgmJbagcU1DlR6Ydg6HXX-mwcp10
Message-ID: <CANDhNCrb4CB5=3fkFAjC-OK=DfDmRtOavEk=8wYyK6BEk7-r5Q@mail.gmail.com>
Subject: Re: [PATCH v16 6/7] sched: Fix proxy/current (push,pull)ability
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Valentin Schneider <valentin.schneider@arm.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Metin Kaya <Metin.Kaya@arm.com>, 
	Xuewen Yan <xuewen.yan94@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com, 
	"Connor O'Brien" <connoro@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 8:29=E2=80=AFPM K Prateek Nayak <kprateek.nayak@amd=
.com> wrote:
>
> Hello John,
>
> On 4/12/2025 11:32 AM, John Stultz wrote:
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index ad45a8fea245e..eb07c3a1b8fa4 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -2166,6 +2166,9 @@ static void enqueue_task_dl(struct rq *rq, struct=
 task_struct *p, int flags)
> >       if (dl_server(&p->dl))
> >               return;
> >
> > +     if (task_is_blocked(p))
> > +             return;
> > +
> >       if (!task_current(rq, p) && !p->dl.dl_throttled && p->nr_cpus_all=
owed > 1)
> >               enqueue_pushable_dl_task(rq, p);
> >   }
>
> Do we need an early return in put_prev_task_dl() similar to the one in
> put_prev_task_rt()?

Indeed, that does look like something I've overlooked (and suggests I
need to do more deadline testing). Thank you so much for pointing this
out!
-john
