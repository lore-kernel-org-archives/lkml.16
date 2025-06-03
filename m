Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3180934545
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748968557; cv=none; b=AjRr/mXACtmKFUJz8oz2N6TBbw8nMLSovHhib4+hWTzLnK/trbwrtuZMctMDhUqacJORegyYVWeyjcg2f0wCIRSnNT09tT+vpBMvnHiXX7EgGHS0DpagxTBMJh7iAkjishVTQA+qEe7c/OuKVCKWTBLLtVCgXEVdSWIWYoaM5no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748968557; c=relaxed/simple;
	bh=6AiboAM753C2y77QPsLWkLPl03sSiuINf6uJhzRfeX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kC7A1VkPN8+58AsOShss8rUkysm6RQyRT+5tyNcj/pFCjvXOY69j64rH7MYkUcK7YpS50EsybpXUQLJmwh86873/8uX8nXbuhFdh01Q7yFSUd+lZ4dz/vkt5WbAq4cI76gODrWiDp0uayJ210T74clJv/fC95C2tBxFMDKedIrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mdHVA8Hx; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mdHVA8Hx"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so203125ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748968555; x=1749573355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1JJhe93aKmuUIp6Geegm1dS5Nt0JMr6aDfHu0zjllY=;
        b=mdHVA8HxDJmOGqQsqnigeyshw6rbgDYDQlSevoAvJURpmU1BZvQXUYlYb2Y4Z2Ecrf
         bPzQ7kz8dDQBcRt/pVRUvWD94vYOnW/l2cLYaj7qR1z+3poZiiYOtpaaZDNKdQkKwCF6
         9IisVl4e+SWcO6El7Buf+CbadDNgONRvCYbC7zTuUcbuyuBFT5MQLDZsmpczbgMCSI4e
         DQmeBCgw2osjIKpc/HMMcA5UXq+3CQC5QpNltiKPq/R7KyG5Njzh6qOZH2iBLGv191Ts
         5v0Ux2cG2+y7rS+w1+fVcDVqMVVYblaPp/+0IBXfwZ+YiSyo4Eof6zkZI49Y5tAVCpui
         rR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748968555; x=1749573355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1JJhe93aKmuUIp6Geegm1dS5Nt0JMr6aDfHu0zjllY=;
        b=sQzWfjjJr8F9nniIlpyut4nSoKvZBAh5mreJzMyI79lR3wA1rsQvBQDnp19zQWkcRx
         x8jV9f77UVHWGSEB5quQffftd1SdaSHpktnGKuursoss1ATddvGD2dezJPucSFpaHOpX
         gFs8ZhTWlUUWQ9qGTgtoXtCToJKxn74N9MnZTeJJeK90M/yo5nXfNhEV2ZIz8rRHlBOT
         xCNMnqBz6VhQw4FrQl9ptBq9hjKie2yoJKDxuaZYb4LlzuJekr0N4EUPpemfK6fFd7O3
         StZvf4EowCIxfcTlCcRV2NjnC1MZv4sTvKj7Xen6tGB3vXghVfI13p6acum9zf4oDHWj
         oYTw==
X-Forwarded-Encrypted: i=1; AJvYcCVSJdgmHcOV2+jLZOUP+3ByJ6QaHIY1KGiTSmopllLt7BRl4+NtpKrhwjhryCStxaqkdvTQ515X9L0UQR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7NVoWo3ExplMNOniq/xcTeTo6xGEWcB9gqOCqeVguLIKi6S/y
	z2xkfrQuvMwAsDyC0+R7Gpfruj7F9bPGzqChm4k351BTq77GmRyCsLfi2x9mDbsWkG9AgGPUelf
	myG2Z6X6xWoF5Vl9bOK6G+1B75lmTatRvueB2ki+GJUrls7lyHVsS5xRAHi0=
X-Gm-Gg: ASbGncuMX+ZHWPUrAqeTsrLEVfjcu9jeC9GUJDbKNLPlPLbtLSc48Rb70UUTbffen28
	PPEtYkn0XBcX3wChDi5K2KPVLpMEPWcEt9UiwjanL9+oUGoWxv6kLy6bFdkQbeKqQqTg0tqLZmD
	dNRpEPwRpKbVcWJ5iPXxxnCGNGyAY5VhfJJffU9c6PG/gh7P0QVf4+K9REV4DaJFzyHhSbGpie
X-Google-Smtp-Source: AGHT+IE1FRjkxqSrMUYAtHpboKXEb5qYfxSjFFPrmX5VvQZf1ca2S58pHUtMawkHMYe4I+37S80L1THtrcvekZsQb/Q=
X-Received: by 2002:a92:c26e:0:b0:3d1:7948:faa2 with SMTP id
 e9e14a558f8ab-3ddb784fe91mr4469215ab.7.1748968554848; Tue, 03 Jun 2025
 09:35:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528175832.2999139-1-kan.liang@linux.intel.com>
In-Reply-To: <20250528175832.2999139-1-kan.liang@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 3 Jun 2025 09:35:43 -0700
X-Gm-Features: AX0GCFsXnugARyFUAwyMmxEVfVUFa7CRQu8_8DPtLfEzF6_0MHgqu_M7qqrzQFI
Message-ID: <CAP-5=fUr0nqZ9KNsATeN64GHwUkHA4+uFpy34woOnboAVnOHgg@mail.gmail.com>
Subject: Re: [PATCH V2] perf: Fix the throttle error of some clock events
To: kan.liang@linux.intel.com
Cc: peterz@infradead.org, mingo@redhat.com, namhyung@kernel.org, 
	mark.rutland@arm.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, eranian@google.com, ctshao@google.com, 
	tmricht@linux.ibm.com, leo.yan@arm.com, Aishwarya TCV <aishwarya.tcv@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 10:59=E2=80=AFAM <kan.liang@linux.intel.com> wrote:
>
> From: Kan Liang <kan.liang@linux.intel.com>
>
> The Arm CI reports RCU stall, which can be reproduced by the below perf
> command.
>   perf record -a -e cpu-clock -- sleep 2
>
> The cpu-clock and task_clock are two special SW events, which rely on
> the hrtimer. Instead of invoking the stop(), the HRTIMER_NORESTART is
> returned to stop the timer. Because the hrtimer interrupt handler cannot
> cancel itself, which causes infinite loop.

I'm having a hard time understanding this. Currently in the code we
have two PMUs for cpu_clock and task_clock:
https://web.git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/tree/kernel=
/events/core.c#n10729
```
static struct pmu perf_cpu_clock; /* fwd declaration */
static struct pmu perf_task_clock;
```
This is weird as both of them are programmed using type
PERF_TYPE_SOFTWARE (1) and there is a corresponding sysfs PMU at
`/sys/bus/event_source/devices/software/type` so wouldn't it make
sense for there to be 1 PMU? Anyway, the stop functions are similar:
https://web.git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/tree/kernel=
/events/core.c#n11804
```
static void cpu_clock_event_stop(struct perf_event *event, int flags)
{
        perf_swevent_cancel_hrtimer(event);
        cpu_clock_event_update(event);
}
...
static void task_clock_event_stop(struct perf_event *event, int flags)
{
        perf_swevent_cancel_hrtimer(event);
        task_clock_event_update(event, event->ctx->time);
}
```
and I think you are talking about perf_swevent_cancel_hrtimer:
```
static void perf_swevent_cancel_hrtimer(struct perf_event *event)
{
        struct hw_perf_event *hwc =3D &event->hw;

        if (is_sampling_event(event)) {
                ktime_t remaining =3D hrtimer_get_remaining(&hwc->hrtimer);
                local64_set(&hwc->period_left, ktime_to_ns(remaining));

                hrtimer_cancel(&hwc->hrtimer);
        }
}
```
but I'm not seeing where HRTIMER_NORESTART comes into this.

> There may be two ways to fix it.
> - Add a check of MAX_INTERRUPTS in the event_stop. Return immediately if
> the stop is invoked by the throttle.
> - Introduce a PMU flag to track the case. Avoid the event_stop in
> perf_event_throttle() if the flag is detected.

I'm not sure what the issue is with the hrtimer_cancel from the
explanation up to here. If we can't cancel the timer can we have the
timer callback perf_swevent_hrtimer drop the event?

I can see how the patch is working around the problem but from an API
point-of-view having PERF_PMU_CAP_NO_THROTTLE_STOP seems to be adding
more possible complexity to PMUs. Possibly if the software event stop
worked better it would help other future users too.

Sorry for my ignorance in this and I'm likely missing the reason this
is the best solution. I think improving the commit message would help
other future people and not just me.

Thanks,
Ian

> The latter looks more generic. It may be used if there are more other
> cases that want to avoid the stop later. The latter is implemented.
>
> Reported-by: Leo Yan <leo.yan@arm.com>
> Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
> Closes: https://lore.kernel.org/lkml/20250527161656.GJ2566836@e132581.arm=
.com/
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
> ---
>
> Changes since V1:
> - Rebase on top of the latest tip.git
> - Add Tested-by from Leo
>
>  include/linux/perf_event.h |  1 +
>  kernel/events/core.c       | 23 ++++++++++++++++++++---
>  2 files changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 52dc7cfab0e0..97a747a97a50 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -305,6 +305,7 @@ struct perf_event_pmu_context;
>  #define PERF_PMU_CAP_EXTENDED_HW_TYPE  0x0100
>  #define PERF_PMU_CAP_AUX_PAUSE         0x0200
>  #define PERF_PMU_CAP_AUX_PREFER_LARGE  0x0400
> +#define PERF_PMU_CAP_NO_THROTTLE_STOP  0x0800
>
>  /**
>   * pmu::scope
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index f34c99f8ce8f..abd19bb571e3 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -2656,7 +2656,22 @@ static void perf_event_unthrottle(struct perf_even=
t *event, bool start)
>
>  static void perf_event_throttle(struct perf_event *event)
>  {
> -       event->pmu->stop(event, 0);
> +       /*
> +        * Some PMUs, e.g., cpu-clock and task_clock, may rely on
> +        * a special mechanism (hrtimer) to manipulate counters.
> +        * The regular stop doesn't work, since the hrtimer interrupt
> +        * handler cannot cancel itself.
> +        *
> +        * The stop should be avoided for such cases. Let the
> +        * driver-specific code handle it.
> +        *
> +        * The counters will eventually be disabled in the driver-specifi=
c
> +        * code. In unthrottle, they still need to be re-enabled.
> +        * There is no handling for PERF_PMU_CAP_NO_THROTTLE_STOP in
> +        * the perf_event_unthrottle().
> +        */
> +       if (!(event->pmu->capabilities & PERF_PMU_CAP_NO_THROTTLE_STOP))
> +               event->pmu->stop(event, 0);
>         event->hw.interrupts =3D MAX_INTERRUPTS;
>         if (event =3D=3D event->group_leader)
>                 perf_log_throttle(event, 0);
> @@ -11848,7 +11863,8 @@ static int cpu_clock_event_init(struct perf_event=
 *event)
>  static struct pmu perf_cpu_clock =3D {
>         .task_ctx_nr    =3D perf_sw_context,
>
> -       .capabilities   =3D PERF_PMU_CAP_NO_NMI,
> +       .capabilities   =3D PERF_PMU_CAP_NO_NMI |
> +                         PERF_PMU_CAP_NO_THROTTLE_STOP,
>         .dev            =3D PMU_NULL_DEV,
>
>         .event_init     =3D cpu_clock_event_init,
> @@ -11930,7 +11946,8 @@ static int task_clock_event_init(struct perf_even=
t *event)
>  static struct pmu perf_task_clock =3D {
>         .task_ctx_nr    =3D perf_sw_context,
>
> -       .capabilities   =3D PERF_PMU_CAP_NO_NMI,
> +       .capabilities   =3D PERF_PMU_CAP_NO_NMI |
> +                         PERF_PMU_CAP_NO_THROTTLE_STOP,
>         .dev            =3D PMU_NULL_DEV,
>
>         .event_init     =3D task_clock_event_init,
> --
> 2.38.1
>
