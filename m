Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30A32222AF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 03:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751512129; cv=none; b=m1dpgc1lgpZScYyZ0gTGI7Y+Rsnu2Mb6NaOaTSvrE8xZxyYd9WREQufj4kolBiOnw3CTVLzZUM+qPfsNAHhDimkVxc4Pca4NkXk9//uZmpd+UQRN8eWLWSbxSY3jqC8cL5CbpepGlA/BW3qW1pJIcrI2qHYTDXgTfgPNwFvfXUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751512129; c=relaxed/simple;
	bh=op7fFYQsqedYMoYxnWAfomX89MXZxyET8q9eDkziSMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnuNP06adUrFfcMq2jAkT5RD9CouFDPSHRyArLEanU6bhE388+bU9woN6xSvRl4RPExu0lRZ0nVzR/C24bsdPQs0wPW9oF7EzfUvR8vjRddazVos2eZl+OQkHNh6AV8Q6ESWvlcoabU8zA+onR2mjtGyN9Hx/Y+lJVbrzk1lHeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lM4bLrpz; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lM4bLrpz"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3df2fa612c4so94275ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 20:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751512127; x=1752116927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUDJ8eu+uUAX5PKe0K4IOvc9aQTZPpKAuPpmuZfXJFs=;
        b=lM4bLrpzdh77ruOq0DvO/hQ0KAmSJ3yzotFHkJuC9Hm/B60jUtD2bGE34Gahr2ASRV
         ZbeL2jeT3wbAHlqeQ6hhr/CWrzQ63uNKNdMKFV9p2QdxYLbsyxTvlHVS0+wsp0QPe8Vc
         lVzYwDCFGGbrjCxEKLPbH1ViCyRnMKIuwcxOVhj9pa2UL6S90939sqE/P0crzAXxEJFB
         PlbGmz6U4P0S6yidKNy2uX8WJFvpffBXwgPRpDmmoXo8SlO2P4PiHGeWHX7xyDqy7Il9
         dAdi5Utr3opt0kU/mc1eyn1kBqYD4LwwnPE7diXs7EMj1JMK4ZwivbsesTVYCY6w8tW4
         VuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751512127; x=1752116927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUDJ8eu+uUAX5PKe0K4IOvc9aQTZPpKAuPpmuZfXJFs=;
        b=Y/DgOoUivUm4LWj5qpT5/SDfgYIZJd3qZhm++Pa3/4AMgCq3PGrGG+3pmWVaY29WtQ
         TR7xZFbfONQB/9LigVtjVN9JwBVG5oJnIR3/Qxza0JyCg+uNXh7mMeUPz6rnREx79izT
         hkMFy/NH7r/U8+LRxfT1B6AbR+yYeMxw0VzMqfx5G4LDU3rj3lY9t0UsKbHIcV5GKAZP
         YnyEdkvEhToug89ukiZaAoqlj7Qekk6RiadyWniAFs2JLFfwaPQwKZupUkugfF3POZoK
         pHwsOZM8NECub45deVGySfIt2CmrwPDpXKhU2CJ13FtV0B2LcsBt3YQnj31TRJ1HTBZG
         mzoA==
X-Forwarded-Encrypted: i=1; AJvYcCV5xEeIptZuTe1kA94fIrdBZ0o8SA0mPNTF52qzwPyn9wy9JcwuHlwfGmTwG56AURKhDGG/NFv8T0reFxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB63m2ltp3V/JYWLDDIjjcxCGYnZtOgHhm05kq2lKnTnADYWgQ
	Y5B6HdIHH61gvhr9EeLzBvYNWfnkRTUfSa7kxXxaLgP9W9yT79I917AgejJ/GZmMjIzQHIkCq8Y
	J9O9o925IYBguvZPfV8lBVRz1WLX9DUGBOqZQ5tnH
X-Gm-Gg: ASbGncsY2Yv8KO+X8HJ0of2hZXX5ejlAfOPUyHwPm0vIN+WQXCrAg85fvYXWHk95ouN
	CUeI9tE0Z5gXqweet+g7Uo2UCrt5kEzm18VHouvY5TK+OlTLXmXYbrwHGSC1/41OYd42gQfmNBm
	bZ4QsRjSlAZpUJPcglef42G5t7f6PT+DYrg8L5eeYC06O4
X-Google-Smtp-Source: AGHT+IGWcvzkBvq8jmBAsjviJF989kf1zOeiNyvGlhhQKDFltg8ev0+f+RBT2T2e2+uKiGuvpYe8r88vdtJjEIlbvqQ=
X-Received: by 2002:a05:6e02:330c:b0:3e0:5a50:e2d3 with SMTP id
 e9e14a558f8ab-3e05d2370b1mr1186895ab.1.1751512126897; Wed, 02 Jul 2025
 20:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703014942.1369397-1-namhyung@kernel.org> <20250703014942.1369397-5-namhyung@kernel.org>
In-Reply-To: <20250703014942.1369397-5-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Jul 2025 20:08:35 -0700
X-Gm-Features: Ac12FXxPkYbbvgvoFHKyzwrAX7rCGhZ_cr3yYCuD_mwPSbwVCg9AjF0wFBFf0IM
Message-ID: <CAP-5=fU+nJreGEc1HVsYOL1Ba=YFE4G7OQqtQ=iwH=6+Crxssw@mail.gmail.com>
Subject: Re: [PATCH 4/8] perf sched: Fix thread leaks in 'perf sched timehist'
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 6:49=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> Add missing thread__put() after machine__findnew_thread() or
> timehist_get_thread().  Also idle threads' last_thread should be
> refcounted properly.
>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/builtin-sched.c | 48 +++++++++++++++++++++++++++++---------
>  1 file changed, 37 insertions(+), 11 deletions(-)
>
> diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
> index b73989fb6acef8d6..83b5a85a91b7ffbd 100644
> --- a/tools/perf/builtin-sched.c
> +++ b/tools/perf/builtin-sched.c
> @@ -2313,8 +2313,10 @@ static void save_task_callchain(struct perf_sched =
*sched,
>                 return;
>         }
>
> -       if (!sched->show_callchain || sample->callchain =3D=3D NULL)
> +       if (!sched->show_callchain || sample->callchain =3D=3D NULL) {
> +               thread__put(thread);
>                 return;
> +       }
>
>         cursor =3D get_tls_callchain_cursor();
>
> @@ -2323,10 +2325,12 @@ static void save_task_callchain(struct perf_sched=
 *sched,
>                 if (verbose > 0)
>                         pr_err("Failed to resolve callchain. Skipping\n")=
;
>
> +               thread__put(thread);
>                 return;
>         }
>
>         callchain_cursor_commit(cursor);
> +       thread__put(thread);
>
>         while (true) {
>                 struct callchain_cursor_node *node;
> @@ -2403,8 +2407,17 @@ static void free_idle_threads(void)
>                 return;
>
>         for (i =3D 0; i < idle_max_cpu; ++i) {
> -               if ((idle_threads[i]))
> -                       thread__delete(idle_threads[i]);
> +               struct thread *idle =3D idle_threads[i];
> +
> +               if (idle) {
> +                       struct idle_thread_runtime *itr;
> +
> +                       itr =3D thread__priv(idle);
> +                       if (itr)
> +                               thread__put(itr->last_thread);
> +
> +                       thread__delete(idle);
> +               }
>         }
>
>         free(idle_threads);
> @@ -2441,7 +2454,7 @@ static struct thread *get_idle_thread(int cpu)
>                 }
>         }
>
> -       return idle_threads[cpu];
> +       return thread__get(idle_threads[cpu]);
>  }
>
>  static void save_idle_callchain(struct perf_sched *sched,
> @@ -2496,7 +2509,8 @@ static struct thread *timehist_get_thread(struct pe=
rf_sched *sched,
>                         if (itr =3D=3D NULL)
>                                 return NULL;
>
> -                       itr->last_thread =3D thread;
> +                       thread__put(itr->last_thread);
> +                       itr->last_thread =3D thread__get(thread);
>
>                         /* copy task callchain when entering to idle */
>                         if (evsel__intval(evsel, sample, "next_pid") =3D=
=3D 0)
> @@ -2567,6 +2581,7 @@ static void timehist_print_wakeup_event(struct perf=
_sched *sched,
>         /* show wakeup unless both awakee and awaker are filtered */
>         if (timehist_skip_sample(sched, thread, evsel, sample) &&
>             timehist_skip_sample(sched, awakened, evsel, sample)) {
> +               thread__put(thread);
>                 return;
>         }
>
> @@ -2583,6 +2598,8 @@ static void timehist_print_wakeup_event(struct perf=
_sched *sched,
>         printf("awakened: %s", timehist_get_commstr(awakened));
>
>         printf("\n");
> +
> +       thread__put(thread);
>  }
>
>  static int timehist_sched_wakeup_ignore(const struct perf_tool *tool __m=
aybe_unused,
> @@ -2611,8 +2628,10 @@ static int timehist_sched_wakeup_event(const struc=
t perf_tool *tool,
>                 return -1;
>
>         tr =3D thread__get_runtime(thread);
> -       if (tr =3D=3D NULL)
> +       if (tr =3D=3D NULL) {
> +               thread__put(thread);
>                 return -1;
> +       }
>
>         if (tr->ready_to_run =3D=3D 0)
>                 tr->ready_to_run =3D sample->time;
> @@ -2622,6 +2641,7 @@ static int timehist_sched_wakeup_event(const struct=
 perf_tool *tool,
>             !perf_time__skip_sample(&sched->ptime, sample->time))
>                 timehist_print_wakeup_event(sched, evsel, sample, machine=
, thread);
>
> +       thread__put(thread);
>         return 0;
>  }
>
> @@ -2649,6 +2669,7 @@ static void timehist_print_migration_event(struct p=
erf_sched *sched,
>
>         if (timehist_skip_sample(sched, thread, evsel, sample) &&
>             timehist_skip_sample(sched, migrated, evsel, sample)) {
> +               thread__put(thread);
>                 return;
>         }
>
> @@ -2676,6 +2697,7 @@ static void timehist_print_migration_event(struct p=
erf_sched *sched,
>         printf(" cpu %d =3D> %d", ocpu, dcpu);
>
>         printf("\n");
> +       thread__put(thread);
>  }
>
>  static int timehist_migrate_task_event(const struct perf_tool *tool,
> @@ -2695,8 +2717,10 @@ static int timehist_migrate_task_event(const struc=
t perf_tool *tool,
>                 return -1;
>
>         tr =3D thread__get_runtime(thread);
> -       if (tr =3D=3D NULL)
> +       if (tr =3D=3D NULL) {
> +               thread__put(thread);
>                 return -1;
> +       }
>
>         tr->migrations++;
>         tr->migrated =3D sample->time;
> @@ -2706,6 +2730,7 @@ static int timehist_migrate_task_event(const struct=
 perf_tool *tool,
>                 timehist_print_migration_event(sched, evsel, sample,
>                                                         machine, thread);
>         }
> +       thread__put(thread);
>
>         return 0;
>  }
> @@ -2728,10 +2753,10 @@ static void timehist_update_task_prio(struct evse=
l *evsel,
>                 return;
>
>         tr =3D thread__get_runtime(thread);
> -       if (tr =3D=3D NULL)
> -               return;
> +       if (tr !=3D NULL)
> +               tr->prio =3D next_prio;
>
> -       tr->prio =3D next_prio;
> +       thread__put(thread);
>  }
>
>  static int timehist_sched_change_event(const struct perf_tool *tool,
> @@ -2743,7 +2768,7 @@ static int timehist_sched_change_event(const struct=
 perf_tool *tool,
>         struct perf_sched *sched =3D container_of(tool, struct perf_sched=
, tool);
>         struct perf_time_interval *ptime =3D &sched->ptime;
>         struct addr_location al;
> -       struct thread *thread;
> +       struct thread *thread =3D NULL;
>         struct thread_runtime *tr =3D NULL;
>         u64 tprev, t =3D sample->time;
>         int rc =3D 0;
> @@ -2867,6 +2892,7 @@ static int timehist_sched_change_event(const struct=
 perf_tool *tool,
>
>         evsel__save_time(evsel, sample->time, sample->cpu);
>
> +       thread__put(thread);
>         addr_location__exit(&al);
>         return rc;
>  }
> --
> 2.50.0.727.gbf7dc18ff4-goog
>
