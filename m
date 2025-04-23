Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7FD44C63
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745444517; cv=none; b=BlCEnB5hyKghHoQ/PvE3SDLF6M/ABiVHzw6+/qFltJVjqbfGkW0e8L/GVC/lca3bBA/ddKJwRWn837XU37T2zvemyF+3SJCu5ADxnh/H6PBWBDJToTMJCK9vBr/f1w+TOo8gEAWnrhbN8i9ig/AMfAJQfVEhdPnsyaa1afeFA5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745444517; c=relaxed/simple;
	bh=U9VBK3gjnTJrblQxsDkcKXmutHhDXZU1FYdnZ5oawQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSrseow0asuI7Th0jQkdKO9UBQv5ZGG9m74i4aF1FOAvxTX7SPfk2Bnpwnd+3XuXT/stLArQL7iLPDa2psPAtXAyJ1OFNyl3QuFHVtoMEkd+bNLPuWAoY2qaIdK6SRJ2TNgnEX6zUimFxwcEdjoUxgWiFd/AAO4cXHfxfpZH37o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D7GlxkMo; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D7GlxkMo"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so274833e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745444514; x=1746049314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64odXXuTKn3Sl/+kJ9ZqSGwEGYLUki1V+RYdfArCL8g=;
        b=D7GlxkMorGWia7G7jkObmH/HZ5x81qKYfjOzffHO2zSFQefYE/Q7QU0e89+5zUC193
         8mexEJmLBpi6q6aVQIXYv3DKiAbpeDo26INIx8gzFaVE3C21bS285LVy4BsdCq/JrB72
         9m3GRKlQDQ62ub6y7imG58iYpbNh5+4i0+iVvIYRS5hhVWfqfnjaSoBipjv9HzIHI4AT
         dsJEox527V5J/QY3uu5DdHKKKpUWa/me34w3qyIXfJDdpydj5M/GsPMbT6+/MCruWi3G
         l4vHtZoyy7bcFahHueal4z+5pwPd9mzFZrZKtX3sOlIMNViwsZTDuxSrZEcErTAUsHWG
         I6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745444514; x=1746049314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64odXXuTKn3Sl/+kJ9ZqSGwEGYLUki1V+RYdfArCL8g=;
        b=VBlkvS3ehGALBEYYKzJfXjQ6U5wtUMmC2QB0Qa7YbzVVykLF5PbVOtOsaGTW5/5o2V
         ceN/T04CR2A01bPeqi8HqyXIB7aXZ6c2uNLQN1Bec4GKiULYm+yxjJaGfluT5C5V8xDe
         w+8zEXQkY9zIuXVf5OyHR6xYq4k1ItLau8+Fx0bw01FH+gVqC3NNn+kNn9QeCgBRDOm/
         sr3MotBPXY7DYbHRag0J0jbiqjLiRBxpxCIisgOykRArYjnZ/VQ6NIdLcEdgvfgGtJTg
         ZptkKWoAruxXcxIKC39xwtJocpP6NbVTDr99ikakSmbVgtDkCp9ZHCrfCWLXzI55t3td
         Z99g==
X-Gm-Message-State: AOJu0YwG6hRxICLkhdjw6+T0t4bbku2P+61SrSjR34QytfAg4VmLELD8
	v0aRpUkVHWMdZ+JzXn5qVfFt32KRcLfLD722XFk3BEeiJkQeeRCVTgB18Ko5xLD72klAH90dtJH
	0pX/EikUA8vrfLnT1+UQCDgv1jAVhthea35A=
X-Gm-Gg: ASbGncvSoTAdhwf5ko3vI2aEZBzC1o4mK0gWWQNsvIKzsRUByGEaY2e90em0Zju/F1c
	azlgDtqAe4KSYs8YtrtCf2U+L3Wn2/Z8LQbyv/17+Z7Jzl9rxp9cPj3u4R0Mml4kOjquzr9ot1V
	zesKnqABC40ljW70xvJGSIW1VZ0lhi9zxT9DIVvrhEs7DyFdg9SFSXs3LQOyNEUw==
X-Google-Smtp-Source: AGHT+IG4bc1pMMdVoNn70/cV8GmYXHsqV3GyXmITZFiLGH5haLgS/YG6Y2MNjKx5OO2DsfdzMJxx/T/KLHiX5eXKS1c=
X-Received: by 2002:a05:6512:3d22:b0:549:8f06:8239 with SMTP id
 2adb3069b0e04-54e7c429557mr135616e87.51.1745444513697; Wed, 23 Apr 2025
 14:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422044355.390780-1-jstultz@google.com> <20250422085628.GA14170@noisy.programming.kicks-ass.net>
In-Reply-To: <20250422085628.GA14170@noisy.programming.kicks-ass.net>
From: John Stultz <jstultz@google.com>
Date: Wed, 23 Apr 2025 14:41:42 -0700
X-Gm-Features: ATxdqUH9dXFsNRNFp-uxzPEaP3zAu0B9S5Nis1BFPYgFHjScQiQJa6R4dvEf410
Message-ID: <CANDhNCp2J+dWKzXg8fX_3Cnx1WHFLag_t9J62-rFtcQYHbrcwA@mail.gmail.com>
Subject: Re: [RFC][PATCH] sched/core: Tweak wait_task_inactive() to force
 dequeue sched_delayed tasks
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, kernel-team@android.com, 
	Frederic Weisbecker <fweisbec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 1:56=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Apr 21, 2025 at 09:43:45PM -0700, John Stultz wrote:
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
>
> Argh, this is all stupid :-(
>
> The whole __kthread_bind_*() thing is a bit weird, but fundamentally it
> tries to avoid a race vs current. Notably task_state::flags is only ever
> modified by current, except here.
>
> delayed_dequeue is fine, except wait_task_inactive() hasn't been
> told about it (I hate that function, murder death kill etc.).

Hey Peter,
  So I hear your (sanguinary?) dissatisfaction with these functions,
but from your short discussion with Frederic it seems like
wait_task_inactive() and kthread_bind() are sticking around, so I'm
not sure what the next course of action should be.

Should I resend my patch (including Prateek's suggested tweaks to make
it a little nicer), so wait_task_inactive() is sched_delayed aware? Or
are you thinking we should solve this differently (ideally in some
form that can head to -stable to help folks hitting this in 6.12?)?

thanks
-john
