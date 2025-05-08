Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2FD26F478
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717079; cv=none; b=koPYTw3B5w6Y8OkOy82T/NCu3SNYLDs43JhC13BNqBWVAUKIIY++FMVn817JHELSSVO6StVEzqoW2klWdAABmUMILJAUvplFmL+Zr7qXCedaZD1AikUdE4p25fLyZWAlE/8YNIL0NZylOauQ8NDsIU1aoAbNRpHDEwMXB5c+uwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717079; c=relaxed/simple;
	bh=Bvl5ba3YwvsEiX7qFzTQrsZHe1T6nf+edYW5UyyKea4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z57XSsOeJsHMHYDPd7ZEE4xSF0ToQcw16jBf+pLB6Sd4lMBZU2cX7xEEZVWKjdmdWP6pvVkre6TYW3NP4LeHBbFm1GL4gAnuavSucigjpBMp0GQh+dFTG5mc7w/s4ktlsMAVdbwaPVF9y3gZ2xBSQCr+Qi1gmxjUAb7PBtfo3IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e2T1lxaN; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e2T1lxaN"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so166415ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746717075; x=1747321875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHfS18XLHw1fuH23fouICv2ZdP/LcvdC0OJaySiiGfE=;
        b=e2T1lxaNeCi59Le6g1OQQtPEn6zezlnfCTETfES65jvKNwekNYw7M4sr2911S4AVLd
         MHlyLfwHQhGKiSUjktszG5d95RhYqGM3QQJfje7PEiqk7M4W8RmYu5/2dzwj4u2NYff9
         UbdDNN6A6hllzF4zU7HK7XtrwUngSvX0qcJm85fQOmxPERE0YbKE+g8Kea2bFnG2U9WV
         gIUCufQPfg/aMTsi6SUnhFOPq5usMjNwFG4HONKBCot0WlSK/ikxfjdyfQQ3tyD5fFCe
         a8+geMNfgqmIiNV5Hh+tO/6kSPE7TmmVSDLnvfcFe8Bjg0heRsWGPY0WXioFxyDf/Xc2
         21Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746717075; x=1747321875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHfS18XLHw1fuH23fouICv2ZdP/LcvdC0OJaySiiGfE=;
        b=iGj7Y9cRuXjYnyNGX0RHlgKNx5bu3r2vCxgkDiF2/F+TSqDQOBtje8wzKCVEilgy2/
         RtryIq14bh3TD6KzThbWFqGFZZR5WfmNPxhT9JzwQk9SP+4tSgoLDqnH2ThwY0DvIx+M
         2JVQkiBsDKfeFa6jxntha+KeMEbOCkheqhhfdWLkoEujTSzLU7LP5RV02ROo0Njt2vG3
         8+Yf9SeQeASFI6qO49hOdhqRJR5POyoyXUSKcSnMFcaHk9af/BIDzuXldv9LEdSXFXKt
         VTOWVMP65VHd9WfnLcshQdQ+9WsOCXx24XGF1SfzoqRhUFDiwBkgO0H4N/zYNdvjl8Y1
         izDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqekP8/a0Ln88k5663k84+03vt0QA2ONt3Ph2eNErydHVm5cQEwtl2Tf8JhRjYPNWJhR89ipncPvFXvL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvFvyT0WXamC0QJWLHax5/6pUevK3wyn2ahdlMEgSXV72CvgGA
	3O2Jm34tNBE9LRIF0nRkN2COyP+J5vWUYSNVDJEacdcaGm4epuhD7giuskU3hIv3hhGCFxHZmAQ
	1d9sYeFMVMwZAeYHYSL264wSo4DovFEzVE5Cc
X-Gm-Gg: ASbGncuSDdJuWvCJisqGuVjWpGLh3/w3OxbzKrKwxuO9ZTP81951VHYGun49TAdVhvX
	/jNDlzHYR1VJTfKFsoF5TY1qnLWqSIMyw6SeaVyZ51946HD2pbH7KRuse98fdOR8IpJZLLn6vpp
	Z2hmo8jeixj1gkjPj46LPIL6I5hV2/0G+nK59fI6bEd6ugwfanOiY=
X-Google-Smtp-Source: AGHT+IFFJVUbQXfgmM72qK+a/tgW1VnOX0I3j7G1qITzcwyR32vYuWtr/9hkpF6ADEctErBKN9iWetyfgg4nZJcpIAo=
X-Received: by 2002:a92:cd8f:0:b0:3d9:6498:ea24 with SMTP id
 e9e14a558f8ab-3da78cdd14amr3932905ab.6.1746717075312; Thu, 08 May 2025
 08:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507215939.54399-1-namhyung@kernel.org>
In-Reply-To: <20250507215939.54399-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 8 May 2025 08:11:03 -0700
X-Gm-Features: ATxdqUGIwKyO1AluhVQQEoLGtf3xZKIZYsFgUCWs6YV1c4qBENQQbw397sVgnp8
Message-ID: <CAP-5=fWE=jquq9WqReAu+Mow4r6LPgOOvxEXb-L5vK+UwThjGw@mail.gmail.com>
Subject: Re: [PATCH v2] perf pmu: Use available core PMU for raw events
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 2:59=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> When it finds a matching pmu for a legacy event, it should look for
> core pmus.  The raw events also refers to core events so it should be
> handled similarly.
>
> On x86, PERF_TYPE_RAW should match with the existing cpu PMU.  But on
> ARM, there's no PMU with the matching type so it'll pick the first core
> PMU for it.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/pmus.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
> index b99292de76693dbb..3bbd26fec78a10e2 100644
> --- a/tools/perf/util/pmus.c
> +++ b/tools/perf/util/pmus.c
> @@ -727,14 +727,21 @@ struct perf_pmu *evsel__find_pmu(const struct evsel=
 *evsel)
>         legacy_core_type =3D
>                 evsel->core.attr.type =3D=3D PERF_TYPE_HARDWARE ||
>                 evsel->core.attr.type =3D=3D PERF_TYPE_HW_CACHE;
> -       if (!pmu && legacy_core_type) {
> -               if (perf_pmus__supports_extended_type()) {
> -                       u32 type =3D evsel->core.attr.config >> PERF_PMU_=
TYPE_SHIFT;
> +       if (!pmu && legacy_core_type && perf_pmus__supports_extended_type=
()) {
> +               u32 type =3D evsel->core.attr.config >> PERF_PMU_TYPE_SHI=
FT;
>
> -                       pmu =3D perf_pmus__find_by_type(type);
> -               } else {
> -                       pmu =3D perf_pmus__find_core_pmu();
> -               }
> +               pmu =3D perf_pmus__find_by_type(type);
> +       }
> +       if (!pmu && (legacy_core_type || evsel->core.attr.type =3D=3D PER=
F_TYPE_RAW)) {
> +               /*
> +                * For legacy events, if there was no extended type info =
then
> +                * assume the PMU is the first core PMU.
> +                *
> +                * On architectures like ARM there is no sysfs PMU with t=
ype
> +                * PERF_TYPE_RAW, assume the RAW events are going to be h=
andled
> +                * by the first core PMU.
> +                */
> +               pmu =3D perf_pmus__find_core_pmu();
>         }
>         ((struct evsel *)evsel)->pmu =3D pmu;
>         return pmu;
> --
> 2.49.0.987.g0cc8ee98dc-goog
>
