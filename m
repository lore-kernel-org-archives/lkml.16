Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823471CA81
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745548199; cv=none; b=qwd46JAlSKTcOmURSQI3VsLi0TWj3nMK9m5duQ0KSIX1Y+M93F+WvBIWUO3oVgHbICzVvIAeOWUZDfHZwLqCwh4qNEUuHbgkKBvC0mueoqIQLFeTkZkMMEzM35WVOq0snLAwWkPWX3Cfcs/4DvJkB68vWkvmGiFc6jtGJ/pjvCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745548199; c=relaxed/simple;
	bh=RIq6nWLsANYjEUOaH5xTN7IfE97SY3DRWNe9kb+GUsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktOi6RJELASiWaOyIJOtGZc+4w161GyIyqQvl+PJQATSyUx0R30ouS9TH833PdRFJmqZoQxwYFZ3baiJXH+NyeASjFGGzzFZqXCBN1VmbLUvtK4oqbTt85ByadkLyrwyjjmVlrS/ZpePOO9qwo3lqN8hCXRjvh+nSlGj3l81Rcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eye4I/yT; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eye4I/yT"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47ae894e9b7so36610021cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745548196; x=1746152996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhViaAYRE7TM87r7/Y4i/+7GynqUnX2QoCmSPmbjHwo=;
        b=Eye4I/yTHSwD8ZeehCNBCkm0lrHAQjpliPsCQknw8F849WgFwq4GjKRcofc+fPE5nx
         mvTUxN7gl7aIv+dtceOAg82RKm9NYoxgKLZiuSEUqOwt6T9fLpngR9KMjEr3EUS2HVOo
         5L+Xp4xON8GM2OffhIIX5NCuYL5T3ATvTSR69ebu8z/lr/6C1F+IKrQj6hEYMwN30gRM
         z419C6Xlqhy8PtCse9KA9Axh89XJsGtgSQLysEcf2u7+7/Sf7emnRTHIakBo7pddX4Zf
         n1d/U4i3FJPbUZNrC3L4NE8/ZsU2nPn2GW/+xAR194P5drSSSueLzztslzGnrrSN1sIF
         R6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745548196; x=1746152996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhViaAYRE7TM87r7/Y4i/+7GynqUnX2QoCmSPmbjHwo=;
        b=FBDYU0JOlEue5YNepxWYSKUX1dxsem45AdTETkuZdBUqWeW38N0GcTfjxe1SJhOt+A
         GE93R5hXNgbhLEeC6Lr/4xytSBWVzHGpyJYshDwtgpDoV1hODtMducByB+54dp7jwsyn
         T1GnfEUpLYRRcBOfK0VSjxRQXkGyxWVIvrjSOHt+5N9S94rJGHhH8MZ/J+00DO9ueWNJ
         MeW28qBypmwLEiHfj76S5CQWe4p5sjCtoGxnZ2g7WWS//E4vvfxFnKr/f4CChjnCdwgs
         Wbzm0ZCozIz9o9mM3YmbmvyiWOaY2OkfPRB5Ax72Q3OhaT+NnuenElLOV1Btc3OMmVtI
         JiCA==
X-Forwarded-Encrypted: i=1; AJvYcCU+dlgzhj2UDfj0n8N9AvJOJ5VCHkD4T1gJy2gBqbfIlszE1Wn3s9Q6kX0Y9wpkquAVEiO1rKkGEHPuYBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPUEpOlZZ0qUDMbTCS+DGkvEEIjorbZKHKyYw3V9u3345Zglvq
	/hF+A9S//tyqWcCL5iLIy+53vllW7lP5gh5neMnWJz+5A991b6d9dhNlVxBoCcOpXNxOp2D8Qgi
	OdMc6LQBXlQGpkOPoaiiqOpj42fo=
X-Gm-Gg: ASbGncvPWO5gQ7Y/DMlxotUdK+WfU8C9bfkOMYe5Ww9ISl1hTvO+Z7Ha1Z9/UeZSnZf
	maegPfiIjJlDD6sJS0bvepMeWFx4RSKgqu2+PcZPocRXM6IfgNmW9eU1cX0VnQxDKzLD9n3P+Ju
	xDuIxcbxlNCVDOPfOh6QeqOs0=
X-Google-Smtp-Source: AGHT+IFbr0t7eyJB2fzHYew0dDUMrslTYDpJuwflG9Pe7TcO6H0dWgBv8eaoeW4NQv6eib5gy292Gk/cv16IXezSZ54=
X-Received: by 2002:ad4:5bab:0:b0:6e8:fbe2:2db5 with SMTP id
 6a1803df08f44-6f4cba41ed0mr14265306d6.35.1745548196480; Thu, 24 Apr 2025
 19:29:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423174634.3009657-1-edumazet@google.com> <CALOAHbDT=z4xYQq0WXqGzAQycNhaBdCfZDs5mB5Rvyx9iK4JbQ@mail.gmail.com>
 <CANn89iLuGSZFrhfQGMRo579CCv4Cie9Vq3SNkcvYM9XPjmzccA@mail.gmail.com>
In-Reply-To: <CANn89iLuGSZFrhfQGMRo579CCv4Cie9Vq3SNkcvYM9XPjmzccA@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 25 Apr 2025 10:29:20 +0800
X-Gm-Features: ATxdqUHGmq6NF9zdtc5ZwmgD_3nE50kdd8e3fj0GPOgiJIhn1CIf_rKYYFaivO4
Message-ID: <CALOAHbDhPhuGK-Hd1SCN=5fx1ZEFXQnoubncvjwHw=+MHOBDPA@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: reduce false sharing on sched_balance_running
To: Eric Dumazet <edumazet@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Eric Dumazet <eric.dumazet@gmail.com>, Sean Christopherson <seanjc@google.com>, 
	Josh Don <joshdon@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 11:50=E2=80=AFPM Eric Dumazet <edumazet@google.com>=
 wrote:
>
> On Thu, Apr 24, 2025 at 7:46=E2=80=AFAM Yafang Shao <laoar.shao@gmail.com=
> wrote:
> >
> > On Thu, Apr 24, 2025 at 1:46=E2=80=AFAM Eric Dumazet <edumazet@google.c=
om> wrote:
> > >
> > > rebalance_domains() can attempt to change sched_balance_running
> > > more than 350,000 times per second on our servers.
> > >
> > > If sched_clock_irqtime and sched_balance_running share the
> > > same cache line, we see a very high cost on hosts with 480 threads
> > > dealing with many interrupts.
> >
> > CONFIG_IRQ_TIME_ACCOUNTING is enabled on your systems, right?
> > Have you observed any impact on task CPU utilization measurements due
> > to this configuration? [0]
> >
> > If cache misses on sched_clock_irqtime are indeed the bottleneck,  why
> > not align it to improve performance?
>
> "Align it" meaning what exactly ?

Such as :

static __cacheline_aligned_in_smp int sched_clock_irqtime;

> Once sched_clock_irqtime is in a
> read-mostly location everything is fine.
>
> The main bottleneck is the false sharing on these Intel 6980P cpus...
>
> On a dual socket system, this false sharing is using something like 4%
> of the total memory bandwidth,
> and causes apparent high costs on other parts of the kernel.
>
> >
> > [0]. https://lore.kernel.org/all/20250103022409.2544-1-laoar.shao@gmail=
.com/
>
> What part should I look at, and how is this related to my patch ?

Unrelated to your patch. Please ignore it if you haven't seen this issue.

--=20
Regards
Yafang
