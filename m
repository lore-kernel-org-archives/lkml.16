Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6987B1CF8B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 04:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744951102; cv=none; b=gHMLNDdETFm3jUfUlGgttlHNHXsSKT7hLA1qQ56G3P5KbLmq3c2FLKAVyfryWVZXZczyqFTPdDe0dWl70fKKcH4Z26tXotU+VDCUhCj5ZMXJ070jCm0nX9Wfz45LRawDhuzk9zuik0jNhfIN7tow/7DzO5P8tC95ObVU94xY97o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744951102; c=relaxed/simple;
	bh=vfu58btUgceDW5CcoAg4ZjLX+XL7N+MOmIt4/J/6gt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghSlINO3U5W8D/B/pTJFfsBEjS29FxDzpObiTEg6JqzWhLnRmi40g7kM9fFQjNknRuRzEH6/hY0k3vZTcKQ224CeUjTcz/AN2yA0KrccxztQOg0+9BWH8axDpxeuMxNrZAORzp1Fuw3mFkyCVGw7Z5Fom1fys3OTWQDirHlL97Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AkGJv7rV; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AkGJv7rV"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4774611d40bso187521cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 21:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744951098; x=1745555898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alu2R4F3B7RUJL8sloJCdr8FVEoYU8rWGzhQ01p1ka8=;
        b=AkGJv7rV1dbqGgsTA4UQs44O93ySE8y7t7G2Vf7DNE+Oyx6lF24VCcOOr3LptTnuVd
         /wQAcFAFCmMR9SQpB3LcZwkA2kVX+G3PE/ypCvI9UkgKwI/Ak/89Eps2djtwyL+FotID
         AI/02KuYUYdmEcoAb859PHawmWaWc4p9pbdhztFuQwYrt8KuNzqtQfXa1HQy1qf+7icZ
         ZgwXKWiflQCr1JQqe1ULernpNdmYGGQMXqgcf97l2BS2R7HkvAEZS96JxK/cZryMTHU8
         poHbE5VucddBPlz15AjQnZTSEs9Qp72ciuW0V/4lJl6VEWaZcGnCWKRu8pJZ2Fvc8utC
         FB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744951098; x=1745555898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alu2R4F3B7RUJL8sloJCdr8FVEoYU8rWGzhQ01p1ka8=;
        b=GZbo2WBH7FdIPGP9V7aWjqTzoZ8Ze/xCE2LmApvoxEM9x6i6wDolK3piVyj/qqNgu0
         SivQTNgrnKRCkjNs7Kbt46Z0hFv+sFU+h2Pl25PDB/g12ABxDN6Ybu5arhqhcZ6zKN5p
         Dm4K03SlHyd5TmGrA6B7XPccaNKOBQw5yqEwxCWufyTIgrppuyInmPSzfqw1ZI/vpVuB
         zGdGixLwThJfAOrz0mL1KvvWVA10KsAGrgwcSUaupw6/7ilFW0A9925eiTDqPCxvbe1y
         WCKqg11ILc8WDtOTnRJVeMNNticGJTow+N3NjBJFsKA9y2Mem2JwgaqzLm2N3rRk4SQK
         xU9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhUQJk6fWKs9LRpzdkJDGf29Wkw5VrV/Xu4bpXJOdfgMsrn6Dvx/TYgIPZlB6RpkwMG//rzFGIxsvBTqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY6Sp+LTqn2SyPhsdlCJIJa5STicrUJNQPnSS7Y3pm7yqYA9UI
	3FufDLjUSuT3WKyiAItzug9qBynp1Vk5EoP6gjLe9ebJbm9XvszNrpaM3ZQJJR0pxK5NA5V4FxT
	KQKE4MyNJYd8mw6k7/0LL+N9Mn2Y8kP6nXBU2
X-Gm-Gg: ASbGncshcY0gYOY+jEQVfdKikNfBHv1apkGD4Bsyew2kNB8eqs0QRnwNtwUu6EnSXhx
	FLjenojYyVfXZ/LOCqCV8UM1Ztv12MJeW0t+shZDc5D39ZoGl+VYEW7TJIwma5OIZaELPkfBIx3
	VPwow3u/gbllLM06ODGUKDdb6anAzJld2wugoAbVXpitAKH7PupaTCfPg=
X-Google-Smtp-Source: AGHT+IEQwdCoq6ssid8K1M7dKnqK1w8BnxQuH4nU8TPJG+w0y8sO/BUglZoz0UfWFnGOaEnnZC+3anrdokcAlx3LzeE=
X-Received: by 2002:a05:622a:491:b0:476:f4e9:314e with SMTP id
 d75a77b69052e-47aecc92a27mr1623031cf.25.1744951098055; Thu, 17 Apr 2025
 21:38:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744906694.git.sandipan.das@amd.com> <8ecf5fe20452da1cd19cf3ff4954d3e7c5137468.1744906694.git.sandipan.das@amd.com>
In-Reply-To: <8ecf5fe20452da1cd19cf3ff4954d3e7c5137468.1744906694.git.sandipan.das@amd.com>
From: Stephane Eranian <eranian@google.com>
Date: Thu, 17 Apr 2025 21:38:05 -0700
X-Gm-Features: ATxdqUEwPg2OmVNqmUmBlYhcX7bAmP2fEDLfnUqgavDPvjEmBbvMRWdI1M5qi94
Message-ID: <CABPqkBS+k4Om3-sQWGBFN-imhiU8fXYsiDR1XAyp0Ro3uknCHw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] perf/x86/amd/uncore: Use hrtimer for handling overflows
To: Sandipan Das <sandipan.das@amd.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, songliubraving@meta.com, ravi.bangoria@amd.com, 
	ananth.narayan@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 8:44=E2=80=AFPM Sandipan Das <sandipan.das@amd.com>=
 wrote:
>
> Uncore counters do not provide mechanisms like interrupts to report
> overflows and the accumulated user-visible count is incorrect if there
> is more than one overflow between two successive read requests for the
> same event because the value of prev_count goes out-of-date for
> calculating the correct delta.
>
> To avoid this, start a hrtimer to periodically initiate a pmu->read() of
> the active counters for keeping prev_count up-to-date. It should be
> noted that the hrtimer duration should be lesser than the shortest time
> it takes for a counter to overflow for this approach to be effective.
>
The problem I see is that the number of uncore PMU varies a lot based
on the CPU model, in particular due to the L3 PMU.
Is there a timer armed per CCX or only a global one that will generate
IPI to all other CPUs?

> Signed-off-by: Sandipan Das <sandipan.das@amd.com>
> ---
>  arch/x86/events/amd/uncore.c | 63 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>
> diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
> index 010024f09f2c..e09bfbb4a4cd 100644
> --- a/arch/x86/events/amd/uncore.c
> +++ b/arch/x86/events/amd/uncore.c
> @@ -21,6 +21,7 @@
>  #define NUM_COUNTERS_NB                4
>  #define NUM_COUNTERS_L2                4
>  #define NUM_COUNTERS_L3                6
> +#define NUM_COUNTERS_MAX       64
>
>  #define RDPMC_BASE_NB          6
>  #define RDPMC_BASE_LLC         10
> @@ -38,6 +39,10 @@ struct amd_uncore_ctx {
>         int refcnt;
>         int cpu;
>         struct perf_event **events;
> +       unsigned long active_mask[BITS_TO_LONGS(NUM_COUNTERS_MAX)];
> +       int nr_active;
> +       struct hrtimer hrtimer;
> +       u64 hrtimer_duration;
>  };
>
>  struct amd_uncore_pmu {
> @@ -87,6 +92,42 @@ static struct amd_uncore_pmu *event_to_amd_uncore_pmu(=
struct perf_event *event)
>         return container_of(event->pmu, struct amd_uncore_pmu, pmu);
>  }
>
> +static enum hrtimer_restart amd_uncore_hrtimer(struct hrtimer *hrtimer)
> +{
> +       struct amd_uncore_ctx *ctx;
> +       struct perf_event *event;
> +       int bit;
> +
> +       ctx =3D container_of(hrtimer, struct amd_uncore_ctx, hrtimer);
> +
> +       if (!ctx->nr_active || ctx->cpu !=3D smp_processor_id())
> +               return HRTIMER_NORESTART;
> +
> +       for_each_set_bit(bit, ctx->active_mask, NUM_COUNTERS_MAX) {
> +               event =3D ctx->events[bit];
> +               event->pmu->read(event);
> +       }
> +
> +       hrtimer_forward_now(hrtimer, ns_to_ktime(ctx->hrtimer_duration));
> +       return HRTIMER_RESTART;
> +}
> +
> +static void amd_uncore_start_hrtimer(struct amd_uncore_ctx *ctx)
> +{
> +       hrtimer_start(&ctx->hrtimer, ns_to_ktime(ctx->hrtimer_duration),
> +                     HRTIMER_MODE_REL_PINNED_HARD);
> +}
> +
> +static void amd_uncore_cancel_hrtimer(struct amd_uncore_ctx *ctx)
> +{
> +       hrtimer_cancel(&ctx->hrtimer);
> +}
> +
> +static void amd_uncore_init_hrtimer(struct amd_uncore_ctx *ctx)
> +{
> +       hrtimer_setup(&ctx->hrtimer, amd_uncore_hrtimer, CLOCK_MONOTONIC,=
 HRTIMER_MODE_REL_HARD);
> +}
> +
>  static void amd_uncore_read(struct perf_event *event)
>  {
>         struct hw_perf_event *hwc =3D &event->hw;
> @@ -117,18 +158,26 @@ static void amd_uncore_read(struct perf_event *even=
t)
>
>  static void amd_uncore_start(struct perf_event *event, int flags)
>  {
> +       struct amd_uncore_pmu *pmu =3D event_to_amd_uncore_pmu(event);
> +       struct amd_uncore_ctx *ctx =3D *per_cpu_ptr(pmu->ctx, event->cpu)=
;
>         struct hw_perf_event *hwc =3D &event->hw;
>
> +       if (!ctx->nr_active++)
> +               amd_uncore_start_hrtimer(ctx);
> +
>         if (flags & PERF_EF_RELOAD)
>                 wrmsrl(hwc->event_base, (u64)local64_read(&hwc->prev_coun=
t));
>
>         hwc->state =3D 0;
> +       __set_bit(hwc->idx, ctx->active_mask);
>         wrmsrl(hwc->config_base, (hwc->config | ARCH_PERFMON_EVENTSEL_ENA=
BLE));
>         perf_event_update_userpage(event);
>  }
>
>  static void amd_uncore_stop(struct perf_event *event, int flags)
>  {
> +       struct amd_uncore_pmu *pmu =3D event_to_amd_uncore_pmu(event);
> +       struct amd_uncore_ctx *ctx =3D *per_cpu_ptr(pmu->ctx, event->cpu)=
;
>         struct hw_perf_event *hwc =3D &event->hw;
>
>         wrmsrl(hwc->config_base, hwc->config);
> @@ -138,6 +187,11 @@ static void amd_uncore_stop(struct perf_event *event=
, int flags)
>                 event->pmu->read(event);
>                 hwc->state |=3D PERF_HES_UPTODATE;
>         }
> +
> +       if (!--ctx->nr_active)
> +               amd_uncore_cancel_hrtimer(ctx);
> +
> +       __clear_bit(hwc->idx, ctx->active_mask);
>  }
>
>  static int amd_uncore_add(struct perf_event *event, int flags)
> @@ -490,6 +544,9 @@ static int amd_uncore_ctx_init(struct amd_uncore *unc=
ore, unsigned int cpu)
>                                 goto fail;
>                         }
>
> +                       amd_uncore_init_hrtimer(curr);
> +                       curr->hrtimer_duration =3D 60LL * NSEC_PER_SEC;
> +
>                         cpumask_set_cpu(cpu, &pmu->active_mask);
>                 }
>
> @@ -879,12 +936,18 @@ static int amd_uncore_umc_event_init(struct perf_ev=
ent *event)
>
>  static void amd_uncore_umc_start(struct perf_event *event, int flags)
>  {
> +       struct amd_uncore_pmu *pmu =3D event_to_amd_uncore_pmu(event);
> +       struct amd_uncore_ctx *ctx =3D *per_cpu_ptr(pmu->ctx, event->cpu)=
;
>         struct hw_perf_event *hwc =3D &event->hw;
>
> +       if (!ctx->nr_active++)
> +               amd_uncore_start_hrtimer(ctx);
> +
>         if (flags & PERF_EF_RELOAD)
>                 wrmsrl(hwc->event_base, (u64)local64_read(&hwc->prev_coun=
t));
>
>         hwc->state =3D 0;
> +       __set_bit(hwc->idx, ctx->active_mask);
>         wrmsrl(hwc->config_base, (hwc->config | AMD64_PERFMON_V2_ENABLE_U=
MC));
>         perf_event_update_userpage(event);
>  }
> --
> 2.43.0
>
