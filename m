Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A315925C81E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 21:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745356489; cv=none; b=GW/Gd9/q+8rwyMw+psdO/gxMseRLZFH9AkDvf/CxrnytElRoy2dhn4JPzjOYl0u5PEN2jkRBojP9fUK//uq6RzGh/b7jckd54DpcVMURNRfNDvPiobMO5m3U4Zz9RTFQPWbMxE/yO53Ln+XA6v1xes22TJSOcY8tWtDtjyUtqyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745356489; c=relaxed/simple;
	bh=kOQVlPE5S70Vmqrmnry/YU6c18xXqnY7t5H/hhcFZHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3xlXpRYPiEaGnUnMq8VmSv+Y2r8MOTQQhLIPhHJizUZx8XS4/8ZepcDKkBub8aAAERM/pn/Bd7mQufI4mfT9Wf7OzvIZQp+J3MFRtnbHRj6YTHzDqtUD/jIBsRs+2sb1y5+Apaw/rzNQGeJiaDkUh6Hzi+hLHruhCeLh2IP5M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zAgbnrzu; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zAgbnrzu"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso55539541fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745356486; x=1745961286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zflmj+idPadD3Sr2VULlL/toWt8i3CfiGPY5w7txlbg=;
        b=zAgbnrzuxN22OSHRLXc6+eqLy4qnBYbc1eYRyYJ4xHnMp5yf2D2geSc7m+knoOYyNP
         Jq9H2y7iQu3KfGBRFAOo/Olimbd2xiuyaZxu40U7VpfS8frFxdi8GMqIX9yDKcO3pcXH
         BAE34FpiK+4H9u7iz+fAz9zPEc0sPdZbGZ5Zdn+9MXBOHoM8rmlxPibdMcETWVGLrcMo
         Rrz9TtEvJZze8u4HVf7swjGYuda4b1r75gzSJlpfFikksxXa93DFHHsKZThsunbgnATW
         Of3yjZfZZTco/5mT5UiBUql4R5Pf8ZosrFd/0ounf4iJ1Yf6Z94BSYovFTdP4Eu9oHH6
         O/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745356486; x=1745961286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zflmj+idPadD3Sr2VULlL/toWt8i3CfiGPY5w7txlbg=;
        b=evfZbRRAskpeNXl15n3HjU8dBcXaZVHMtHhDFEgleOx9JZY4rlQRsn+AmglyPgA61s
         HLsnbOcnRn7iuxyeMGdHsAz+pU8zlc3RQHVyZfGIIwE3uB7k/qCl6oRykDP8blMTNLnK
         wu54I7dshasbsN004dfOt2glf4j0rzIMfMEypS8Gwne12eUWFsNs1kx5Wsekw8iV//oi
         4aSaRIBF2fhG9UW3E19sOsV6s5GZxU6LbErAWZTYgwmep+7w0rSfqTQiNpvRNcupaLBe
         8DkSXlDlpQGIVQpvxZmzaWPWbthPM5VtvVVafhNqlEXlQapsZTl6Ce4QrwTrxhDNVZWH
         19Ig==
X-Gm-Message-State: AOJu0YwzrQzd7EqPh/7CAdZtgK3qIrVfw1ee2MoFUB4jHGrSem1o3QOh
	khwf4kLkJVvVApqjQXELO5ACs5IPd8wCyQE/K9hox41IFQc22SQ8upJ6VL7kIyRWZfM9oTRoo5G
	RQ0IAnT2vmdyNKy1s4vl4B+RdnaOA1Ntr/U8=
X-Gm-Gg: ASbGncujTm0De0xnaqymp3UY8Uqz893+TNWvOX7uqqNvws9fnvheHjh4bmNQKlw1d5H
	6kB1/D4tGCdzeF21B4qiTHvRx9Y5WJ8wgosg8i/lMhAq226B0oa+buWUXnKLK3KO7j5agkz8IUg
	bEgwWwxaRfP8ZWhbHN/9t9IOtU4pbtwZcJpf8bil3pWHxEPpJoGQ==
X-Google-Smtp-Source: AGHT+IEgzd1oyfFYUqZ42w9er5XjpMK+VVYx2hyYCkl3jvDlpKv+CaTGEv92Uid8qvXkZHgxkA6RhNkm4+GpiamAsCc=
X-Received: by 2002:a2e:b8c4:0:b0:30c:160b:c741 with SMTP id
 38308e7fff4ca-310904c7a43mr53887471fa.6.1745356485346; Tue, 22 Apr 2025
 14:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412060258.3844594-1-jstultz@google.com> <20250412060258.3844594-6-jstultz@google.com>
 <20250417111841.GL38216@noisy.programming.kicks-ass.net>
In-Reply-To: <20250417111841.GL38216@noisy.programming.kicks-ass.net>
From: John Stultz <jstultz@google.com>
Date: Tue, 22 Apr 2025 14:14:32 -0700
X-Gm-Features: ATxdqUEtpIFm4iI6LpiOnGc7uqMdOMrFiK1a1iDPNqEwY2ckhY_FwvBDw73Tfqs
Message-ID: <CANDhNCo=8uwpRyoE2oWRZvqWcWb3tJ6xHO6-eMTY-cqn78D1zw@mail.gmail.com>
Subject: Re: [PATCH v16 5/7] sched: Add an initial sketch of the
 find_proxy_task() function
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
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

On Thu, Apr 17, 2025 at 4:18=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
> On Fri, Apr 11, 2025 at 11:02:39PM -0700, John Stultz wrote:
> > +      * Because we got donor from pick_next_task, it is *crucial*
>
> pick_next_task()
>
> > +      * that we call proxy_resched_idle before we deactivate it.
>
> proxy_resched_idle()
>
> > +      * As once we deactivate donor, donor->on_rq is set to zero,
> > +      * which allows ttwu to immediately try to wake the task on
>
> ttwu()
>

Thanks for the comment tweaks, I've added them to my next version.

> > +     }
> > +     return proxy_deactivate(rq, donor);
>
> I was expecting a for() loop here, this only follows blocked_on once,
> right?

Yeah, this patch is only the simplest sketch of the find_proxy_task(),
which just deactivates the blocked donor and picks again (basically it
fails every time).
Initially I split it out to help test that keeping tasks on the
runqueue and deactivating them later would work properly.

It does not yet traverse the blocked on chain and actually find the proxy t=
ask.

I'll try to expand a bit more in the commit message so this isn't a surpris=
e.

thanks
-john
