Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4BB19066D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744844144; cv=none; b=pRNyb+h9VLMnKD/JmMxYy8abDJpKduJtW05zkfmT1fleN98HZTILFyiJtzPYnA/GgW9LEjxR8mFE5eLd66VaNupEulyZuse/E54VGJXLARth30n0nKqHiIJUh2v9jYrJz7shdsRMMUxv7nEbWIUAVBr5rV0QfkxRh6gRLkyN3iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744844144; c=relaxed/simple;
	bh=IWl4z6zISDYB1Okx1/CdfcAELWchcRepRb+ULsIdnLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDtwSvYdTLqOQXtb9gf5TgCX/nvpOzLAVoAbbbms4RIJIbpy0ShaEffqTq9NLx4husMRYR0aBLxPwpE0ipTzwGJT6lM639ROHjNULUJTDxtQrEOGsWcHVYwME8uutn8xetD65OK6M9GpGRtc3MHA5kMiLGDrV3ijmKuuixjN/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MbtzVc1u; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MbtzVc1u"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30c44a87b9cso1054031fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744844140; x=1745448940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kk2QUkzAiC3W8j+MP1AcSloqfrga4mbqgzZTCPWhcPU=;
        b=MbtzVc1uDhOa7ZGXuibvprF+2YTs0UJlA1TxiozmedeWOZaPN7o9FB5jrDG5EXf3Pw
         pQGO66g+U83T8tUi9NHvpnXcF5HvKhyhw3Sv4MwPdD215Rts/6LYMCsVS0SXeZKxHb66
         lu5os6m2sTqZxi2BcqXp0yEQOWhC7R1Y/f7VDBQAJPQadlvkYo0OVzk0kqeztOie1cOp
         DevW+t7CHj99Ez2Ry7cVhM9AaPon8xOXYn0fVAQsII/8Nv4ur+IM6rtHLU23CF80Tnom
         nqCDWMz8WI8RgeiYVn4XxHclP29et8BCOVRVPR4LyH5yCC+vUBGt87IFZR9vx0Wxqe66
         gkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744844140; x=1745448940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kk2QUkzAiC3W8j+MP1AcSloqfrga4mbqgzZTCPWhcPU=;
        b=Wst90qTdXMhU4lNtycan+VONRhdHMFsLs1G9KOdYCW5EFb6bHiscUldk0WKlUXK6Rm
         FsPnfWy/Wo78nDjvKw0VCTM1yCVr3P5DHvR9x7NGqPm2l4l9adAcEK4eoT8RdGT5hIfq
         ZU9AD7QALA7aSP9j/vWRoRnRaT3w7CP0BUkd7PQe+nF94FfZhOebfSXNI2dHPjAvttpI
         AVz6BcP7F3Suvxj55Vsnt5LE/OPq40jIwM64YvzFuaiexWP1AdKsuUsrF8RAkcRi6ejk
         GIGFO0qYwZENESWxr5otmFlaqr3+Wyh/SH831oBl2rgx556uQlI3ab2y8gfiUOc51dKe
         oVNw==
X-Gm-Message-State: AOJu0YxvqRMGzDIrJDYIpHYxZZzMophQXG7Wyb660uzIftRNvumN2Ziv
	Xb/klow8e6pyJnxrsiZZUf+PyU19sOuzTFzcnlvdzSZ40u2wLWN9GPoZGEoj8MsGIvdb/v/6w9O
	GeYPwvx8BA9mJT3ba+8L+qVBTW1fNLhWFuI0=
X-Gm-Gg: ASbGncvWi5hmOvJKV9fqnfe5KLlvbOy39iCSoRrQ8+JT4Cy4j1MZsEr2saCHg3XXLNC
	/xhIeYVD9Bf59G4GhKVvsRq7t3n5KHeeBTfqDLujQrS01z+XS1XVLsLkyV9lS04uzlwvTi9stnl
	+p845tMUh6GgFG8aL7cZ9XXd7PQkot4UrJKY94yON7gUCglJtAUqs=
X-Google-Smtp-Source: AGHT+IEnTkhhMEdOto23G0uJQeItc+SC1uJFWPeKQ7prh63BQEScdTCn5JdYtMfoNeZC4/3D/U3nAP53NoabpFou7S0=
X-Received: by 2002:a05:6512:e94:b0:54a:d68f:6ecc with SMTP id
 2adb3069b0e04-54d64a7b3ddmr1104066e87.2.1744844140080; Wed, 16 Apr 2025
 15:55:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412060258.3844594-1-jstultz@google.com> <20250412060258.3844594-6-jstultz@google.com>
 <Z_zYZAbv86MlITOM@jlelli-thinkpadt14gen4.remote.csb>
In-Reply-To: <Z_zYZAbv86MlITOM@jlelli-thinkpadt14gen4.remote.csb>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 15:55:27 -0700
X-Gm-Features: ATxdqUHl2S0cDFio7pW7soxJw5R-0QY12ZY7JDs_ewOHOlJoIGjzQl9JuS72ulE
Message-ID: <CANDhNCo--B2vNOkNjzKsO2F-UbNuR-mYVCyDJZk0OqTq+=U1_A@mail.gmail.com>
Subject: Re: [PATCH v16 5/7] sched: Add an initial sketch of the
 find_proxy_task() function
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

On Mon, Apr 14, 2025 at 2:42=E2=80=AFAM Juri Lelli <juri.lelli@redhat.com> =
wrote:
>
> Hi John,
>
> On 11/04/25 23:02, John Stultz wrote:
> > Add a find_proxy_task() function which doesn't do much.
> >
> > When we select a blocked task to run, we will just deactivate it
> > and pick again. The exception being if it has become unblocked
> > after find_proxy_task() was called.
> >
> > Greatly simplified from patch by:
> >   Peter Zijlstra (Intel) <peterz@infradead.org>
> >   Juri Lelli <juri.lelli@redhat.com>
> >   Valentin Schneider <valentin.schneider@arm.com>
> >   Connor O'Brien <connoro@google.com>
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
> > [jstultz: Split out from larger proxy patch and simplified
> >  for review and testing.]
> > Signed-off-by: John Stultz <jstultz@google.com>
> > ---
>
> ...
>
> > +static struct task_struct *
> > +find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_fl=
ags *rf)
> > +{
> > +     struct task_struct *p =3D donor;
> > +     struct mutex *mutex;
> > +
> > +     mutex =3D p->blocked_on;
> > +     /* Something changed in the chain, so pick again */
> > +     if (!mutex)
> > +             return NULL;
> > +     /*
> > +      * By taking mutex->wait_lock we hold off concurrent mutex_unlock=
()
> > +      * and ensure @owner sticks around.
> > +      */
> > +     guard(raw_spinlock)(&mutex->wait_lock);
> > +
> > +     /* Check again that p is blocked with blocked_lock held */
> > +     if (!task_is_blocked(p) || mutex !=3D __get_task_blocked_on(p)) {
> > +             /*
> > +              * Something changed in the blocked_on chain and
> > +              * we don't know if only at this level. So, let's
> > +              * just bail out completely and let __schedule
> > +              * figure things out (pick_again loop).
> > +              */
> > +             return NULL; /* do pick_next_task again */
> > +     }
> > +     return proxy_deactivate(rq, donor);
>
> Nitpick. We might either want to use donor (and remove p) or use p
> everywhere in the function; think makes it more clear.

Ah, yes, in this step it, it would be more clear.  The two separate
values are important later when we walk the chain, since we use p to
iterate down the chain, but if we cannot find a proxy to run, we need
to deactivate the donor.

I'll rework this chunk to just use donor in this step.

thanks
-john
