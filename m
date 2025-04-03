Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF13253B7C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743708469; cv=none; b=OkTbtxQ+xK/sEQ9sg68t5WptLKzs54TV/w7zAk6cCJQwad3I9BCMjzyAXJSiMv8uQ6cpJbROO2O79d/DNKQ+ufEsMcnXQmTfu4U9pGFZdHltKzkPAD1CqWP7gQBqY8nrnvRbRJQFY8W+VOonDVS6WT02Rc63lJtNK25zns1sJ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743708469; c=relaxed/simple;
	bh=k8dHnwUvM3oXJEcKvwotvMHkHxhnimL4EtfdVqTVDyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=llJtH64RC70wEG8ms4W3qnnjtSC2gPWUGmIEVC0bzKziDgBsBIjsUQKzAFW0wMVS9Ec7kzYg/yAkVVlOBnaB9LmaPKdwi4FkcD0Zk/20fcJcIol/ES0pwZoDUNejrZM+rVEcVwRyKr3UUhosq9ay63m8LFK6m4O9njcqMckrnac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KcmAqpIb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KcmAqpIb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2240aad70f2so46235ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743708467; x=1744313267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrUJJ3x9NP701bOT0IVG1bUomB1XMaymQkr+l3383bE=;
        b=KcmAqpIbEEp/1Ft8bhlPM8QrrDyhIfz9NF7CJUFkXA86m+/D1SU3fxjSJSDy3FqbK9
         kIjnWxnTQKbsBwClMAcDNp2xeGdD1s7BYsYRQ/u30yjf+AG3newFBOuFGl7BDsdTRnOO
         773MOsYPrKqR6xcyvNajH6aFPzkMfK/YBpu3EfpPAgrU/1NjfRWqgr/ovt3Nh9RTi5KV
         3YUHgG0PJinxGSfuwjk/FriknrGRvRxTnBpBWeW2q2GIT6NbWMwftXBjgrhWYZebjkr+
         MZSXdX3x/U0Pg6J4u+gTy6RrTe9DFn+287Sr07QTdDIs5ttCELM9CPNh9TI4aeblR5WB
         gpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743708467; x=1744313267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrUJJ3x9NP701bOT0IVG1bUomB1XMaymQkr+l3383bE=;
        b=RGxfRbZ1g0COxTUD6iCMTVWguT0eSHZg9MamNN4fr4X5r05Kmd8cNKyBer2bhzni28
         417NT+ddCUvk+uYIOQUV71PEa6Ydc2IbBsUobtV4FcT5VWzFtmwKq8xEqd0OS/oZ5BWO
         gEpzKUWdRGxYQlPabftgXR5BjABWWPhBsufVvANcwYSGWihnG0yBr/Rok7KxI4DULpHx
         mhTJshEe05kQrqKOfnqvbrpxLhYiOtUvFlhTBuoxhJ8m/c6nbjeVMrdxVtGIfvbxjNkI
         te28FsBTSsIhDipH0zr77SNdOoQTkXfV8+bf3TQgQd//d9w7P9pKLNEj23pGK7xEa7tc
         88Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXPoe42RhJ4QfoVa2LzHoQt6c7DKl9gTb/0Sly3cIxiUp7SnyQPjaLwaZwevLpCjnY0lkeExXoralwYsqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBRBWd1D7CjlZ7WHx9QrqnUKWNZnMSsHjauBc/dn8OAZnVZ0Ok
	52fZGAIIMvAvTrRd74XjTRQSuVQB1LXnDI0mEV1kbJHBMoRYklMNMeVDEV5OeMt3cxrSKqQ+6ui
	Jvi/MI6F7uz8glWIAjI+qo/C7E/ZPz8e+pdWk
X-Gm-Gg: ASbGncsWlTgimDB++2tTdufib2HEIxRrrKkaU/DIaL/5ju8cnJxpMvaJtZKfaImelpd
	rzj+eIvkdV/QKd5taHGf5B1GeyPqm51YE+GSGgjtqF6NmTyMJsibmVDT28Bh6SnfPutzdbIqBVc
	qwfiUELn/X3JVHGGF85ppVlBfQ2CnqDDNb35VYZ0A2FIJ3NWwASV27Q9AVAv3M/Mk=
X-Google-Smtp-Source: AGHT+IFC19tsfuQPixis7ay1Xm+bdk+kwkB9BYg+I79ohPGf1lOfpeTXatheczSFGZbUtpWsKY7PyGbXULUeOy5SVW0=
X-Received: by 2002:a17:903:3c63:b0:200:97b5:dc2b with SMTP id
 d9443c01a7336-22a8a1c8d68mr351785ad.15.1743708466450; Thu, 03 Apr 2025
 12:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210183808.130522-1-irogers@google.com> <20250210183808.130522-4-irogers@google.com>
 <0924de97-67ec-4c8a-8c5c-66264bdd2748@linux.intel.com> <CAP-5=fVU1A+faRRCJjNsZuO5-0ifpT1C=846qpL_fjfUgVO1bw@mail.gmail.com>
 <fc8e6ede-af8b-4777-a003-585886eff897@linux.intel.com>
In-Reply-To: <fc8e6ede-af8b-4777-a003-585886eff897@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 3 Apr 2025 12:27:35 -0700
X-Gm-Features: AQ5f1JrOupIqzr5lnud3nuMCm0V_TLYZMDyWlGqg1ZyEAYJDKn4kpO_tjN6FM2s
Message-ID: <CAP-5=fWS+uSvzHNNL_ezGykVtVf7LtuLG8OohGmL3TDBOy921g@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] perf parse-events: Set is_pmu_core for legacy
 hardware events
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
	Yoshihiro Furudera <fj5100bi@fujitsu.com>, Weilin Wang <weilin.wang@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Dominique Martinet <asmadeus@codewreck.org>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 12:25=E2=80=AFPM Liang, Kan <kan.liang@linux.intel.c=
om> wrote:
>
>
>
> On 2025-04-03 11:44 a.m., Ian Rogers wrote:
> > On Thu, Apr 3, 2025 at 8:17=E2=80=AFAM Liang, Kan <kan.liang@linux.inte=
l.com> wrote:
> >>
> >>
> >>
> >> On 2025-02-10 1:38 p.m., Ian Rogers wrote:
> >>> Also set the CPU map to all online CPU maps. This is done so the
> >>> behavior of legacy hardware and hardware cache events better matches
> >>> that of sysfs and json events during
> >>> __perf_evlist__propagate_maps. Fix missing cpumap put in "Synthesize
> >>> attr update" test.
> >>>
> >>> Signed-off-by: Ian Rogers <irogers@google.com>
> >>> ---
> >>>  tools/perf/tests/event_update.c |  1 +
> >>>  tools/perf/util/parse-events.c  | 37 ++++++++++++++++++++-----------=
--
> >>>  2 files changed, 24 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/tools/perf/tests/event_update.c b/tools/perf/tests/event=
_update.c
> >>> index d6b4ce3ef4ee..9301fde11366 100644
> >>> --- a/tools/perf/tests/event_update.c
> >>> +++ b/tools/perf/tests/event_update.c
> >>> @@ -109,6 +109,7 @@ static int test__event_update(struct test_suite *=
test __maybe_unused, int subtes
> >>>       TEST_ASSERT_VAL("failed to synthesize attr update name",
> >>>                       !perf_event__synthesize_event_update_name(&tmp.=
tool, evsel, process_event_name));
> >>>
> >>> +     perf_cpu_map__put(evsel->core.own_cpus);
> >>>       evsel->core.own_cpus =3D perf_cpu_map__new("1,2,3");
> >>>
> >>>       TEST_ASSERT_VAL("failed to synthesize attr update cpus",
>
>
> The above change should have been merged.
> 2c744f38da7a ("perf test: Fix leak in "Synthesize attr update" test").
>
> It makes the patch failed to be applied to perf-tools-next.

Thanks Kan, I'll send out a rebase.

Ian

> >>> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-e=
vents.c
> >>> index 6c36b98875bc..8cccf1e22cdf 100644
> >>> --- a/tools/perf/util/parse-events.c
> >>> +++ b/tools/perf/util/parse-events.c
> >>> @@ -231,21 +231,30 @@ __add_event(struct list_head *list, int *idx,
> >>>           struct perf_cpu_map *cpu_list, u64 alternate_hw_config)
> >>>  {
> >>>       struct evsel *evsel;
> >>> -     struct perf_cpu_map *cpus =3D perf_cpu_map__is_empty(cpu_list) =
&& pmu ? pmu->cpus : cpu_list;
> >>> +     bool is_pmu_core;
> >>> +     struct perf_cpu_map *cpus;
> >>>
> >>> -     cpus =3D perf_cpu_map__get(cpus);
> >>> -     if (pmu)
> >>> +     if (pmu) {
> >>> +             is_pmu_core =3D pmu->is_core;
> >>> +             cpus =3D perf_cpu_map__get(perf_cpu_map__is_empty(cpu_l=
ist) ? pmu->cpus : cpu_list);
> >>>               perf_pmu__warn_invalid_formats(pmu);
> >>> -
> >>> -     if (pmu && (attr->type =3D=3D PERF_TYPE_RAW || attr->type >=3D =
PERF_TYPE_MAX)) {
> >>> -             perf_pmu__warn_invalid_config(pmu, attr->config, name,
> >>> -                                           PERF_PMU_FORMAT_VALUE_CON=
FIG, "config");
> >>> -             perf_pmu__warn_invalid_config(pmu, attr->config1, name,
> >>> -                                           PERF_PMU_FORMAT_VALUE_CON=
FIG1, "config1");
> >>> -             perf_pmu__warn_invalid_config(pmu, attr->config2, name,
> >>> -                                           PERF_PMU_FORMAT_VALUE_CON=
FIG2, "config2");
> >>> -             perf_pmu__warn_invalid_config(pmu, attr->config3, name,
> >>> -                                           PERF_PMU_FORMAT_VALUE_CON=
FIG3, "config3");
> >>> +             if (attr->type =3D=3D PERF_TYPE_RAW || attr->type >=3D =
PERF_TYPE_MAX) {
> >>> +                     perf_pmu__warn_invalid_config(pmu, attr->config=
, name,
> >>> +                                             PERF_PMU_FORMAT_VALUE_C=
ONFIG, "config");
> >>> +                     perf_pmu__warn_invalid_config(pmu, attr->config=
1, name,
> >>> +                                             PERF_PMU_FORMAT_VALUE_C=
ONFIG1, "config1");
> >>> +                     perf_pmu__warn_invalid_config(pmu, attr->config=
2, name,
> >>> +                                             PERF_PMU_FORMAT_VALUE_C=
ONFIG2, "config2");
> >>> +                     perf_pmu__warn_invalid_config(pmu, attr->config=
3, name,
> >>> +                                             PERF_PMU_FORMAT_VALUE_C=
ONFIG3, "config3");
> >>> +             }
> >>> +     } else {
> >>> +             is_pmu_core =3D (attr->type =3D=3D PERF_TYPE_HARDWARE |=
|
> >>> +                            attr->type =3D=3D PERF_TYPE_HW_CACHE);
> >>> +             if (perf_cpu_map__is_empty(cpu_list))
> >>> +                     cpus =3D is_pmu_core ? perf_cpu_map__new_online=
_cpus() : NULL;
> >>
> >> All online CPUs? Is there a problem for hybrid?
> >
> > For hybrid if you do cpu_atom/cycles/ then the PMU is found by
> > perf_pmus__find here:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git/tree/tools/perf/util/parse-events.c?h=3Dperf-tools-next#n1651
> >
> > The wildcard case (e.g. perf stat -e cycles ...) scans all the PMUs>
> passing the respective pmu into __add_event:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git/tree/tools/perf/util/parse-events.c?h=3Dperf-tools-next#n1382
>
> Yes, the pmu should always be available for hybrid case.
>
> >
> > For non-hybrid the PMU is given by perf_pmus__find_by_type which only
> > returns a PMU if there is an exact match on the type, ie it won't
> > return perf_pmus__find_core_pmu  when asked to lookup the PMU for a
> > legacy type, evsel__find_pmu will do this though.
> >
> > Anyway, the assumption in this legacy configuration no PMU case is
> > that the event is heading to all CPUs, which is true for software and
> > tracepoint. For hybrid we could get into this kind of problem is sysfs
> > isn't mounted, but I think we're pretty generally broken in that case
> > anyway.
> >
> > Fwiw, I'm carrying these changes in google's tree and test it on my
> > hybrid desktop:
> > https://github.com/googleprodkernel/linux-perf
>
> OK. I will do some tests then.
>
> Thanks,
> Kan
>
> >
> > Thanks,
> > Ian
> >
> >> Thanks,
> >> Kan> +          else
> >>> +                     cpus =3D perf_cpu_map__get(cpu_list);
> >>>       }
> >>>       if (init_attr)
> >>>               event_attr_init(attr);
> >>> @@ -260,7 +269,7 @@ __add_event(struct list_head *list, int *idx,
> >>>       evsel->core.cpus =3D cpus;
> >>>       evsel->core.own_cpus =3D perf_cpu_map__get(cpus);
> >>>       evsel->core.requires_cpu =3D pmu ? pmu->is_uncore : false;
> >>> -     evsel->core.is_pmu_core =3D pmu ? pmu->is_core : false;
> >>> +     evsel->core.is_pmu_core =3D is_pmu_core;
> >>>       evsel->auto_merge_stats =3D auto_merge_stats;
> >>>       evsel->pmu =3D pmu;
> >>>       evsel->alternate_hw_config =3D alternate_hw_config;
> >>
> >
>
