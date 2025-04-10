Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE61E5702
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744252878; cv=none; b=HwVsAv+5i1opatqlXcuazHijHMM7aiMh8C78fT85QuAHh+4R8HZAjInYcSc03p5rGgwhpyyiNvbLEogzvUW5Bsak/rfxQLh8MusV83MWYjOgWBMe6EeCGyC+TMLtCs+3o1uJ1H79GJ81IjiqbIthvpO/atnb0k81AmuvxAYSds8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744252878; c=relaxed/simple;
	bh=K1uI3BgOLpNU3c/dPlGn6O+fNCX4PSeSETqGOFDq2/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFy9DNcnRswNa41e12aKKZgAhZld2RVlHvf22w+WjnUQzWGf+gG94Ru4fpjuZgzg3nide4TyerykqohXc2cCb0EtMMWJa64mtURJAFoEgd7Dspr1+9ShUdJ8YR8F6KcZnHZaOu2eAxg9PExxbBmaZTH5SENzD6drjqQ9uH9hcLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0/9s4UQI; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0/9s4UQI"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so376661e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 19:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744252875; x=1744857675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mEbSaV3IFoOUbSGNJB9bI99s6y7XneTXliYuLT9ZK0=;
        b=0/9s4UQIJAhoYvpngVOXJGA/xrGePmVcF914qFV6x5TDlQokULvd67rT3+4U5MZmS3
         9ejV+O8RSZjeWRmD8ywGmMbzhjlBSf0JrdmbhCTtvAem9azb2DbSJCIPzuLYp6Iij2NP
         7FAFxrFKjg6zGsxPGLyZUiraIwl13tDGogVKfsQBdZDn9mC3yjiyKQAqacet3LQR4w3Y
         bQIrCtzLbKSc3RAUKpzSdB5dJw/ZRhAd+QBDdV76OtKm5h7Y0uYaIQACk3dAmw0vOr1x
         8IHtAv8prAzstd/TKUruel3VBQgG6KkOyyvvXAwuO8LWt4XKRCqtoqYaxywaFpqTDL9K
         jplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744252875; x=1744857675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mEbSaV3IFoOUbSGNJB9bI99s6y7XneTXliYuLT9ZK0=;
        b=o9x9dZpe/RAqXnUPAIlVtC8OaAjLKk4GrKse+wDRTAACUNHVRz915ArdL1Bk8bIj3/
         ihCtw5lJSbiWGa7LY3BTCqLSoFb0eRFX3fAJZeMGg1xXP+mmnMWpBHwT7HxVcbhAmy7V
         DnKAecoEUsOIP6B+eqcP/klniKcGX8JDZWvaKVIjrHnmgqedYUPTiU8fBpRDlng4zQkV
         yKk0KNsy9hO5IXzNoclqHqIvuQ4MD4mdtqXc+FDnUkWE3zWyllueoq9e+FX8CgtVT5I/
         Gj+BJrpg/wtHKR0V06Fh9W1/OvGQQga6AktZAG4F/f/JhhX9JtRyKkXh/pROWT99ke+H
         iLjQ==
X-Gm-Message-State: AOJu0YyhKgeo5uUKIpoYDjpZkFSMB64y4qNDqX7bygL8M3l9atVkpy8a
	hlvCmyvcYP3Uvm6JbJwh6xtOULhG3aYBpZPrM5QVWI8OoENR5//hRA97sP3zDlDi8axCZ+HjEIj
	BhIgUatWagii6RVl5H03u8oxY8eW2i03G6d3XTloK/Mys73WhRCQ=
X-Gm-Gg: ASbGnct+o67Oa6i6ZGf3i+XIE+1HOObWKeMPUyg/YHTvl6NBvZZbx9xKCxAj9IdthSH
	gioyjmrPe4zojAw/iy+xpZCHN75Fe0HNz4C6O7gEKTcJtd8RY2m8uw/+qppabuv89h4EXr7UnJA
	IAtZ04Fv/b2gKUzjmgzakFqPoAyyt3fks4KFdoQ1FRe2mfzUx4h99CMDJ71iL2+Q==
X-Google-Smtp-Source: AGHT+IEWdTot1olMr/SB3OsmQZpPucADaNdLkNX6bbSQ65NuI0raqXpFQ0q/lKOiIktv57Kf0k0N/CeF9yvDSAWf+eQ=
X-Received: by 2002:a05:6512:1594:b0:549:39b1:65c2 with SMTP id
 2adb3069b0e04-54d3c64227dmr142943e87.48.1744252874511; Wed, 09 Apr 2025
 19:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134712.93062-1-hupu.gm@gmail.com>
In-Reply-To: <20250407134712.93062-1-hupu.gm@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 9 Apr 2025 19:41:03 -0700
X-Gm-Features: ATxdqUFSDmo2HVchmBi3JFwyIhe2RoKpkw6j2H5bS_MSn7KY53jrE8MktrY79Qs
Message-ID: <CANDhNCosvML9XKH8HV1QBXKzxt3zMWxzsPSUfYxoyPCORf6Krw@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: hupu <hupu.gm@gmail.com>
Cc: linux-kernel@vger.kernel.org, juri.lelli@redhat.com, peterz@infradead.org, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 6:47=E2=80=AFAM hupu <hupu.gm@gmail.com> wrote:
>
> Move the proxy_needs_return() check earlier in ttwu_runnable() to avoid
> unnecessary scheduling operations when a proxy task requires return
> migration to its original CPU.
>
> The current implementation performs several operations (rq clock update,
> enqueue, and wakeup preemption checks) before checking for return
> migration needs. This is inefficient because:
>
> 1. For tasks needing return migration, these operations are redundant
>    since the task will be dequeued from current rq anyway
> 2. The task may not even be allowed to run on current CPU due to
>    possible affinity changes during blocking
> 3. The proper CPU selection will be handled by select_task_rq() in
>    the subsequent try_to_wake_up() logic
>
> By moving the proxy_needs_return() check to the beginning, we:
> - Avoid unnecessary rq clock updates
> - Skip redundant enqueue operations
> - Eliminate meaningless wakeup preemption checks
> - Let the normal wakeup path handle proper CPU selection
>
> This optimization is particularly valuable in proxy execution scenarios
> where tasks frequently migrate between CPUs.

Hey hupu! Thanks again for your review of the proxy series and your
sharing of this improvement!

The proposal sounds attractive, however...

> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index ca4ca739eb85..ebb4bc1800e3 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4162,6 +4162,10 @@ static int ttwu_runnable(struct task_struct *p, in=
t wake_flags)
>
>         rq =3D __task_rq_lock(p, &rf);
>         if (task_on_rq_queued(p)) {
> +               if (proxy_needs_return(rq, p)) {
> +                       _trace_sched_pe_return_migration(p);
> +                       goto out;
> +               }
>                 update_rq_clock(rq);
>                 if (p->se.sched_delayed) {
>                         proxy_remove_from_sleeping_owner(p);
> @@ -4174,10 +4178,6 @@ static int ttwu_runnable(struct task_struct *p, in=
t wake_flags)
>                          */
>                         wakeup_preempt(rq, p, wake_flags);
>                 }
> -               if (proxy_needs_return(rq, p)) {
> -                       _trace_sched_pe_return_migration(p);
> -                       goto out;
> -               }
>                 ttwu_do_wakeup(p);
>                 ret =3D 1;
>         }
> --

Unfortunately this patch crashes pretty quickly in my testing. The
first issue was proxy_needs_return() calls deactivate_task() w/
DEQUEUE_NOCLOCK, which causes warnings when the update_rq_clock()
hasn't been called. Preserving the update_rq_clock() line before
checking proxy_needs_return() avoided that issue, but then I saw hangs
during bootup, which I suspect is due to us shortcutting over the
sched_delayed case.

Moving the proxy_needs_return above the if(task_on_cpu())
wakeup_preempt() logic booted ok, but I'm still a little hesitant of
what side-effects that might cause.

Part of the approach with proxy_needs_return() from ttwu_runnable() is
making sure everything is ready for the queued task to run, but in the
case where we need return migration, to dequeue the task and cause
ttwu_runnable() to fail, forcing the rest of try_to_wake_up() to
complete.  I do really appreciate your thoughts here though, as I
agree that the potential enqueue/dequeue/enqueue could be wasteful.

I'll take a bit more time to see how we might be able to avoid this
extra work without skipping needed steps. If you have further ideas,
I'd love to hear them!

thanks again!
-john
