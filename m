Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3961229B38
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 03:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751512197; cv=none; b=frRiYC7z/NpWeHDa3c+5PNchS/OR63Qvd6Z8rgDltqtz2YfbHkxMIMg7wMVq6RhLV2dcLPzDTgBekmS6vk56hrV5WlTb6l7PZiHdeqBR3acGJQo3cvdf0Ipvs+vMZFLpNiAy57DxUfAyIxjvbXwybuFR8qp2Nrnt7Q9X+wua8d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751512197; c=relaxed/simple;
	bh=JnCo2aoHFSJ11Aw5PF1ftslLuVHtM2rnPxMlpD4sHYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLGfCB09G8qEW8U60Fy/5On+ctOGmiVcBJiNIBx50ELjDqVbngeao/tetQqjHHewsU3VEloq168Y6xMpnoLPCm6hvk97iCMdLwK4+gm9BnoePNIjbw9YJjWbpftvRy+5UxVzPFL6b6EsabjpEnUB9cd73f5eYYRdKW947E03/TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tv777b7Y; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tv777b7Y"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so119825ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 20:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751512194; x=1752116994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwA3weHf33UXUUiOiLIv8oEn40SuH4N/NO2dHdlTtm4=;
        b=Tv777b7YTdH2eQmEpz8OwWcMwIO6rbERaspV87/nXcQHHW2lNT2WB0VPGkOmHpWiU3
         bs9ivfTVNEshYOgrEwY+lWqq9TUZ4tuNoDsmpjzBadwJ/o+JcbPcUakWtG7/Yw/jPNgh
         LtzGQkUAf/fyAukY4ItfCpcK1xqmn8yX5/YpXHEh4sYJVI8ULA/TbVjR8YEZeumP5je8
         s6L1HtBbbmZ9ks5q6/eNWWTtBC0mLi6jwbL47YNPj22/37sPyKLQfhsS2KWhWqMP4ZL/
         Hhbksk/a3Amk6KpsOglL26y27gsovT2b5qASHZhp3GCm5Wh+pXbd+Ny2gHMFkmFNl8C3
         8edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751512194; x=1752116994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwA3weHf33UXUUiOiLIv8oEn40SuH4N/NO2dHdlTtm4=;
        b=TtLx0C5eZQkz5f71LG7vcVRfn5kYT6Q55IFbAqtx73I5qasiUBX0InwwhYj8yH8RL7
         EGfLy3kkI6hxgI2ouulTp9/FoA/lCfB52OYEp9PTIGs0kX0Heh42BU4cgaeGGM0vBjLM
         oFa08Jopcc2H0GTt7gwGWHjFEx7FPv0ZWgszNUi+8zxMIlc98eWwnv4w7GtbHvOfWg2D
         FY/R7MSg4u65mMb3o3I0t82pWtosKS3fFwM0l+eYVa+0fOQlGGZ41L96MYlIoViCncyn
         ijh2//fNJgjX3M196Fh+2pxO5dXrAdy6c+bdQQ9saI9snEsrPGRP0A/45L/XRiEF/5/9
         8TDw==
X-Forwarded-Encrypted: i=1; AJvYcCVHKoy8KgFogtGrFsHg2ktTA18mqoA8ylVYF/trhXG4qHckEc4ML6ryRjsFrha9G4tHcAJspHR3QETVdeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuiHI0hMHIHj4G6yAbBC9HSw7LNN5CobYQNWJHzOM2xiQfTLfS
	/gQw6eoIpz1ZzGGx01zS4o1dCbFdup7oktO3+aZOA5H2dCKJYuxlsuzjPmu9IUtGh2zvvaPtPvS
	u729TXA8vaFbYCw3Wg3CaYq/4TdQkBfxVwAtJdoma
X-Gm-Gg: ASbGncsPvmCM0GYml2a/0tgqI37g1QXRhK08P6PS9m3VgzTUevHkM03+PMPnQN6rIhg
	Qk8PI6EJmz84oo2ERt7nFixU2Nv2mihH/ZgYTVIADdUL3PtD1XFU6kHJQa0qainy9UgYUo8HNHL
	pyORM39Vi0R0jI5o0LTOrDpxKQCKqTW58bZG15UoQR711D
X-Google-Smtp-Source: AGHT+IEXHJ3CbfVBewiNP3m8cBhI4iq/+6/9THX/DJXwQBljwiviqC1+5WHP5TzSI6evYlTvpTNbgvBi0QNghl9XDGE=
X-Received: by 2002:a05:6e02:16c6:b0:3dd:bdcc:5b29 with SMTP id
 e9e14a558f8ab-3e05d28fc57mr975795ab.21.1751512193547; Wed, 02 Jul 2025
 20:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703014942.1369397-1-namhyung@kernel.org> <20250703014942.1369397-6-namhyung@kernel.org>
In-Reply-To: <20250703014942.1369397-6-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Jul 2025 20:09:41 -0700
X-Gm-Features: Ac12FXxAzfpEgisJE9Q7lMR6b7WxYi4yZIZKQDLrblBd0vccQT1yOURI4IoeEyI
Message-ID: <CAP-5=fX2gUk-R-cYjv7j4SF=Sya9hFS_7HMOpzpR6V0KSQq59w@mail.gmail.com>
Subject: Re: [PATCH 5/8] perf sched: Fix memory leaks for evsel->priv in timehist
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
> It uses evsel->priv to save per-cpu timing information.  It should be
> freed when the evsel is released.
>
> Add the priv destructor for evsel same as thread to handle that.
>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/builtin-sched.c | 12 ++++++++++++
>  tools/perf/util/evsel.c    | 11 +++++++++++
>  tools/perf/util/evsel.h    |  2 ++
>  3 files changed, 25 insertions(+)
>
> diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
> index 83b5a85a91b7ffbd..a6eb0462dd5be20f 100644
> --- a/tools/perf/builtin-sched.c
> +++ b/tools/perf/builtin-sched.c
> @@ -2020,6 +2020,16 @@ static u64 evsel__get_time(struct evsel *evsel, u3=
2 cpu)
>         return r->last_time[cpu];
>  }
>
> +static void timehist__evsel_priv_destructor(void *priv)
> +{
> +       struct evsel_runtime *r =3D priv;
> +
> +       if (r) {
> +               free(r->last_time);
> +               free(r);
> +       }
> +}
> +
>  static int comm_width =3D 30;
>
>  static char *timehist_get_commstr(struct thread *thread)
> @@ -3314,6 +3324,8 @@ static int perf_sched__timehist(struct perf_sched *=
sched)
>
>         setup_pager();
>
> +       evsel__set_priv_destructor(timehist__evsel_priv_destructor);
> +
>         /* prefer sched_waking if it is captured */
>         if (evlist__find_tracepoint_by_name(session->evlist, "sched:sched=
_waking"))
>                 handlers[1].handler =3D timehist_sched_wakeup_ignore;
> diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
> index 9c50c3960487feee..3896a04d90af71f3 100644
> --- a/tools/perf/util/evsel.c
> +++ b/tools/perf/util/evsel.c
> @@ -1657,6 +1657,15 @@ static void evsel__free_config_terms(struct evsel =
*evsel)
>         free_config_terms(&evsel->config_terms);
>  }
>
> +static void (*evsel__priv_destructor)(void *priv);
> +
> +void evsel__set_priv_destructor(void (*destructor)(void *priv))
> +{
> +       assert(evsel__priv_destructor =3D=3D NULL);
> +
> +       evsel__priv_destructor =3D destructor;
> +}
> +
>  void evsel__exit(struct evsel *evsel)
>  {
>         assert(list_empty(&evsel->core.node));
> @@ -1687,6 +1696,8 @@ void evsel__exit(struct evsel *evsel)
>         hashmap__free(evsel->per_pkg_mask);
>         evsel->per_pkg_mask =3D NULL;
>         zfree(&evsel->metric_events);
> +       if (evsel__priv_destructor)
> +               evsel__priv_destructor(evsel->priv);
>         perf_evsel__object.fini(evsel);
>         if (evsel__tool_event(evsel) =3D=3D TOOL_PMU__EVENT_SYSTEM_TIME |=
|
>             evsel__tool_event(evsel) =3D=3D TOOL_PMU__EVENT_USER_TIME)
> diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
> index 6dbc9690e0c9258c..b84ee274602d7d2b 100644
> --- a/tools/perf/util/evsel.h
> +++ b/tools/perf/util/evsel.h
> @@ -280,6 +280,8 @@ void evsel__init(struct evsel *evsel, struct perf_eve=
nt_attr *attr, int idx);
>  void evsel__exit(struct evsel *evsel);
>  void evsel__delete(struct evsel *evsel);
>
> +void evsel__set_priv_destructor(void (*destructor)(void *priv));
> +
>  struct callchain_param;
>
>  void evsel__config(struct evsel *evsel, struct record_opts *opts,
> --
> 2.50.0.727.gbf7dc18ff4-goog
>
