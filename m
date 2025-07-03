Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113F322173A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 03:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751512033; cv=none; b=htxICOk3WlK41N+2bCAV/NiTJbB8iWLa0DlgdjHvYUQ8UTqLMw+bNz05oRoPpFkzo8JNcDxG8jvUEF0o1p/taObmsl2dX3wo0KLPssFq8ejIg7ZtV3HlFD32aQot10HNGDeZh31EvAEIOS9/PLwWKsJiXc9EpBjEvPfGFvU0Nok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751512033; c=relaxed/simple;
	bh=+ZATG8MmQCBGSF5dYU4YlHtLm8hybc8Ex7jkOHX11X8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGZ5txQnLMUVJi6PGJoA7mliYBYyk100vMHFRxeYDQAi4W4zonCKxoukruLTHwshl8oEL5XUehyHC/ZVj2Aa/lL/AfyH4QGn3mdC3yZ/6dG0a/bgihqgV1/gUnlCPlJ+APPX7ZGx5bBYfglJhy/ErbgGEVFx1ybLsUweDrknTIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xqw1a+zo; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xqw1a+zo"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so119175ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 20:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751512031; x=1752116831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7SUaReiNC2TQWYv6+yztoHLJpAPx6fpeRbEmg2kLDo=;
        b=Xqw1a+zofxhipFRzgyC3FEoSx09zi/u7jRXIP5DdgPeYM1pYjkMUGkBYNAQilRa9F9
         cDHsBFxwzcVg6UQvHZBsn5NQCVFuvvYAvHARN0cP94NKGTFwtooJ3KuLK+sx0XrJnxjM
         zbMJk7WioYJA3MfptuE6ekY31yWQAG8CxBswMDTeCi0IF3HjnZy++rX250ysY5XObKq9
         FfAwHCRVvnCvrmg1YTkdrpC41IkA9t0aOeUP8Uk1HDjf1fHhmOs9sow6C6pasqoa0FRj
         5jC4BolMJMw2xr6SVZQog3Rg2FJoFi0zPymlDeYlecxfDHqf/iZnOWY/iVRZ3fxyNWF8
         bkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751512031; x=1752116831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7SUaReiNC2TQWYv6+yztoHLJpAPx6fpeRbEmg2kLDo=;
        b=EbQH02h/CpEmsNwQ+EOHfHS8lp5KCTga59t+Yag4OyNoL9ZIcAmsSFSngTgj9XISHj
         Nm4QAtaqu8vTox8vGRrwMqtc4yCw6JW7dLm6rF+1Bqk1OSSYUg65TWjZse6p+EdL97be
         ypAS4YMLjKXqhhfb+rxUN8MFyDXHNiWmM5GZ+0pP8KhOsRjwzv1PKjUXFgQDk6uoJ2JX
         /7AvrA1GzIFbzF+rqcoWWEXXsSIGlt95XByKT12m7wovZuKKgPi0bwzooMYkHnxR1wfR
         3k77zY9w9qp+lsjXl8QtA0GcL2tGqNHvHvLt6xD/rqqDUW7kzdRikQm+GiP2IJEbkSDM
         gE5g==
X-Forwarded-Encrypted: i=1; AJvYcCWjuFDNhJDWFDsgphVl+re4QFbhDpC1SDImLcB2RyHDLNYsWndscswI5DlzrmKfHxFAwqELBQGO2ATmylY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza+cvj6zzZ5PsGnVvk2ODnooRXOa9dotQIU9lQPvthQ38kfQWZ
	CanBpGiB5W5VHq4z0hLBFsyqpdIZQIJ/wPrvLU8SQkT09wBK1elXv0WN1DYbDAdOzyO4kGBpHxU
	TXzXWEMXd0+xIFWNvi/k3O/wSw6zaonf/mJ++BFeq
X-Gm-Gg: ASbGncvLVSETfjApDAX4boyKDyw23YAWN1f6oQuRI+SVzOmnYC9LOt3BORMGoPLH/JC
	aYo+iRt7XHN+txuPJuSD0xAE2xG5+02hVSMj5JKoIb1XQb+PUv1lmzWkza1R5q9TZ0SqkM9RIvX
	kSneLtMWYc5x32HZl3tgb9R1QyOy6CtTdzKQr4XzEwM9nMsLhyjkhMAo0=
X-Google-Smtp-Source: AGHT+IHzUdPHw0VsA8bstmhWA/+BW0/AQzs6DXm4FWh8WOjqWDH1jhE7cvSYnGM1zWdBm9BADozJE/aWx/AJCbkQ+F4=
X-Received: by 2002:a05:6e02:1a8a:b0:3dd:d288:eead with SMTP id
 e9e14a558f8ab-3e05c82b928mr2226965ab.18.1751512030923; Wed, 02 Jul 2025
 20:07:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703014942.1369397-1-namhyung@kernel.org> <20250703014942.1369397-4-namhyung@kernel.org>
In-Reply-To: <20250703014942.1369397-4-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Jul 2025 20:06:59 -0700
X-Gm-Features: Ac12FXyaUNMxABXTqEy9Dk0FLti18slQItx7W31uD8wKdN5fMeMEfGNGIaonqe8
Message-ID: <CAP-5=fU3F4uhqzhvmpjB69O3zs-qz5_n8=riLz3JoCqKn4156g@mail.gmail.com>
Subject: Re: [PATCH 3/8] perf sched: Fix memory leaks in 'perf sched map'
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
> It maintains per-cpu pointers for the current thread but it doesn't
> release the refcounts.
>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/builtin-sched.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
> index fa4052e040201105..b73989fb6acef8d6 100644
> --- a/tools/perf/builtin-sched.c
> +++ b/tools/perf/builtin-sched.c
> @@ -1634,6 +1634,7 @@ static int map_switch_event(struct perf_sched *sche=
d, struct evsel *evsel,
>         const char *color =3D PERF_COLOR_NORMAL;
>         char stimestamp[32];
>         const char *str;
> +       int ret =3D -1;
>
>         BUG_ON(this_cpu.cpu >=3D MAX_CPUS || this_cpu.cpu < 0);
>
> @@ -1664,17 +1665,20 @@ static int map_switch_event(struct perf_sched *sc=
hed, struct evsel *evsel,
>         sched_in =3D map__findnew_thread(sched, machine, -1, next_pid);
>         sched_out =3D map__findnew_thread(sched, machine, -1, prev_pid);
>         if (sched_in =3D=3D NULL || sched_out =3D=3D NULL)
> -               return -1;
> +               goto out;
>
>         tr =3D thread__get_runtime(sched_in);
> -       if (tr =3D=3D NULL) {
> -               thread__put(sched_in);
> -               return -1;
> -       }
> +       if (tr =3D=3D NULL)
> +               goto out;
> +
> +       thread__put(sched->curr_thread[this_cpu.cpu]);
> +       thread__put(sched->curr_out_thread[this_cpu.cpu]);
>
>         sched->curr_thread[this_cpu.cpu] =3D thread__get(sched_in);
>         sched->curr_out_thread[this_cpu.cpu] =3D thread__get(sched_out);
>
> +       ret =3D 0;
> +
>         str =3D thread__comm_str(sched_in);
>         new_shortname =3D 0;
>         if (!tr->shortname[0]) {
> @@ -1769,12 +1773,10 @@ static int map_switch_event(struct perf_sched *sc=
hed, struct evsel *evsel,
>         color_fprintf(stdout, color, "\n");
>
>  out:
> -       if (sched->map.task_name)
> -               thread__put(sched_out);
> -
> +       thread__put(sched_out);
>         thread__put(sched_in);
>
> -       return 0;
> +       return ret;
>  }
>
>  static int process_sched_switch_event(const struct perf_tool *tool,
> @@ -3556,10 +3558,10 @@ static int perf_sched__map(struct perf_sched *sch=
ed)
>
>         sched->curr_out_thread =3D calloc(MAX_CPUS, sizeof(*(sched->curr_=
out_thread)));
>         if (!sched->curr_out_thread)
> -               return rc;
> +               goto out_free_curr_thread;
>
>         if (setup_cpus_switch_event(sched))
> -               goto out_free_curr_thread;
> +               goto out_free_curr_out_thread;
>
>         if (setup_map_cpus(sched))
>                 goto out_free_cpus_switch_event;
> @@ -3590,7 +3592,14 @@ static int perf_sched__map(struct perf_sched *sche=
d)
>  out_free_cpus_switch_event:
>         free_cpus_switch_event(sched);
>
> +out_free_curr_out_thread:
> +       for (int i =3D 0; i < MAX_CPUS; i++)
> +               thread__put(sched->curr_out_thread[i]);
> +       zfree(&sched->curr_out_thread);
> +
>  out_free_curr_thread:
> +       for (int i =3D 0; i < MAX_CPUS; i++)
> +               thread__put(sched->curr_thread[i]);
>         zfree(&sched->curr_thread);
>         return rc;
>  }
> --
> 2.50.0.727.gbf7dc18ff4-goog
>
