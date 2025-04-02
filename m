Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43EB27735
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609369; cv=none; b=oW73eSbRjegF7bKrX4QnfKJU/U8B+t/7gbRSkJRrM3qaQHBljErsOPktC4yFCfrBawI/jcJ7Vy16ielTOKzQafTVznc72XFiW2IYukMTeiCfgRpkQlji7obg2tHcFZfO90d13JjS0PKOtTF0/NSNh4TA/Xa2VcShBiuGBSuwnXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609369; c=relaxed/simple;
	bh=XyKWvti3hY0z1mAL7iZwtV9RhqKk9pL7yLKr6k17Vo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTeNL+UsvMeVZvTQzqDXIsl0E/8u2qUQdQujRG3sVDlnerqmkfed97+u0mWpOYldYAcIRucky0aa34msK/saAT501OIUjSy0cAL5338nhRIz0ul9OIXbxqHIA9x4iy1rV5/XMMaWkX9oEYUtiIEkBF1DVMRiW11GGpBx5WaDg9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EZGwfC3C; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EZGwfC3C"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2263428c8baso207275ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743609367; x=1744214167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNIV6sAGnQHOVULr8YLORl8QJ6tuDPUwRvq/LUw32V4=;
        b=EZGwfC3CWr0bFnLkj71GDCVXohUy0Lyzpbh+Wt0p2YE8iXpV+qcIP4G5bhPjcYIC3C
         Ov+763Vqckbys6cyVSXAIgDoJALTg+NU79lONSHocojDjV5P4EOy1VqpAfzoQQn73sF3
         gNwGRSGgnw44XTxNHcl5LrBQ8h7SrG3TtwZRC9VKxFCqawB8SEAaqUgFPblp0gVYTMDq
         tu8lb6GevrEWh+YLs+rTzi4Rv42l5IyrBp6+zQ4t8OTbc898xMZKOOZRMQztesAqagwq
         n9rudgiKhl3gZhB9FXvyzgSPkm8Le2OKeWHFRTTLmB31rudZBS0R0Ehgdfh9oBAV4OS6
         XJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743609367; x=1744214167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNIV6sAGnQHOVULr8YLORl8QJ6tuDPUwRvq/LUw32V4=;
        b=XHTwy0E2uySjtr+UapuM3gGXUS0nGkUE1tfDwEt6bEA9Oj0JTSnUtaXTJ3Vv6ex0SN
         HExazpeihKPnE+JOCXerUzu+U8zhRiDKETHpL5MzMW7sm/HiHdWTNMK580st2kAUUDVo
         eEwksXM1ot+1eoIHyjle3YisA8MzzehBEiVdVN8LE5C8OkX+78Chp8KxamqY8kAkyq0z
         yf3I8ye3q+0W89KoCwqzF7AulttjqJVkBzzUcZLsudlKRS9su+Hw+a92sOHNO+QcukUb
         gEQmNXQPiozOyHauApLYQIuuleETIdijiJb49iH856XBvMw341o7s5O3K0g0NRs15AWj
         kjGw==
X-Forwarded-Encrypted: i=1; AJvYcCUv5yOF78SEuCE1GvDkDg5sqdZ/KWzXYB3NXFL+qF6fNLKLXbH/BuOQsO2rNEdbawuup+O+7pXPcTUm99U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyReEmGt111odpzYXcm/sBVCaTk0rx2EFp7Lur6RCwUGBYNED/k
	lPsOFA5yUAmHHz8rmrFUrpS1DPxdmdlOpOMHvM9F+E2s9vjowsaQT6vVY37D/xL4Du2Da6GHbZJ
	PC0gtqHDhNXSow8ZVVkhVatfxyJWEAObEKZIR
X-Gm-Gg: ASbGncsNOYE2nmHGDIMuvsgYrjSZ33DMco8Ougs/YqLKaqeK1l0LR8jgT3w/tu3LCK3
	3C+sKY968Gj4AGeVVMU03SLkGqjH1vBCodmDFOFXVW3B+UWRgxVb7oF4rBeAT/4cUpb0LZknB6M
	YNvtLbrc5BYkosZqfQcq6tTN7brfjDK/nT0MWm9Fv012hz6knGLA+FPw==
X-Google-Smtp-Source: AGHT+IFzrgWVYDk+TtJJE6DjKy6EC96iuo5v0H9HJQj8F7da7ncAwuctzGF+VTodNwtBQT2yGiZ9Bh8gH2JawBjPj6Y=
X-Received: by 2002:a17:902:ccd1:b0:215:9ab0:402 with SMTP id
 d9443c01a7336-22969e8bbcdmr4328925ad.18.1743609366923; Wed, 02 Apr 2025
 08:56:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318041442.321230-1-irogers@google.com> <20250318041442.321230-4-irogers@google.com>
 <a1d59121-f56d-409d-88e9-32fe0b748aa2@linux.intel.com>
In-Reply-To: <a1d59121-f56d-409d-88e9-32fe0b748aa2@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Apr 2025 08:55:55 -0700
X-Gm-Features: AQ5f1Jo2iRe2Ngg7VrH4fUw31urDjxhb_isUqel5DFqkmdjYPwU52b61WPr6uCU
Message-ID: <CAP-5=fWdvhoiKd41PUewR5TaaYOcuUPp5WThoOzt0rDrjTfruQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] perf evlist: Refactor evlist__scnprintf_evsels
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Levi Yun <yeoreum.yun@arm.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Andi Kleen <ak@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, Dominique Martinet <asmadeus@codewreck.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 8:26=E2=80=AFAM Liang, Kan <kan.liang@linux.intel.co=
m> wrote:
>
>
>
> On 2025-03-18 12:14 a.m., Ian Rogers wrote:
> > Switch output to using a strbuf so the storage can be resized. Rename
> > as scnprintf is no longer used.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/builtin-record.c |  9 ++++++---
> >  tools/perf/util/evlist.c    | 19 +++++++++----------
> >  tools/perf/util/evlist.h    |  3 ++-
> >  3 files changed, 17 insertions(+), 14 deletions(-)
> >
> > diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
> > index ba20bf7c011d..cea5959adadc 100644
> > --- a/tools/perf/builtin-record.c
> > +++ b/tools/perf/builtin-record.c
> > @@ -51,6 +51,7 @@
> >  #include "util/clockid.h"
> >  #include "util/off_cpu.h"
> >  #include "util/bpf-filter.h"
> > +#include "util/strbuf.h"
> >  #include "asm/bug.h"
> >  #include "perf.h"
> >  #include "cputopo.h"
> > @@ -2784,13 +2785,15 @@ static int __cmd_record(struct record *rec, int=
 argc, const char **argv)
> >               record__auxtrace_snapshot_exit(rec);
> >
> >       if (forks && workload_exec_errno) {
> > -             char msg[STRERR_BUFSIZE], strevsels[2048];
> > +             char msg[STRERR_BUFSIZE];
> >               const char *emsg =3D str_error_r(workload_exec_errno, msg=
, sizeof(msg));
> > +             struct strbuf sb =3D STRBUF_INIT;
> >
> > -             evlist__scnprintf_evsels(rec->evlist, sizeof(strevsels), =
strevsels);
> > +             evlist__format_evsels(rec->evlist, &sb);
> >
> >               pr_err("Failed to collect '%s' for the '%s' workload: %s\=
n",
> > -                     strevsels, argv[0], emsg);
> > +                     sb.buf, argv[0], emsg);
> > +             strbuf_release(&sb);
> >               err =3D -1;
> >               goto out_child;
> >       }
> > diff --git a/tools/perf/util/evlist.c b/tools/perf/util/evlist.c
> > index 49e10d6981ad..96cfc7ed1512 100644
> > --- a/tools/perf/util/evlist.c
> > +++ b/tools/perf/util/evlist.c
> > @@ -35,6 +35,7 @@
> >  #include "util/util.h"
> >  #include "util/env.h"
> >  #include "util/intel-tpebs.h"
> > +#include "util/strbuf.h"
> >  #include <signal.h>
> >  #include <unistd.h>
> >  #include <sched.h>
> > @@ -2468,23 +2469,21 @@ struct evsel *evlist__find_evsel(struct evlist =
*evlist, int idx)
> >       return NULL;
> >  }
> >
> > -int evlist__scnprintf_evsels(struct evlist *evlist, size_t size, char =
*bf)
> > +void evlist__format_evsels(struct evlist *evlist, struct strbuf *sb)
> >  {
> >       struct evsel *evsel;
> > -     int printed =3D 0;
> > +     bool first =3D true;
> >
> >       evlist__for_each_entry(evlist, evsel) {
> >               if (evsel__is_dummy_event(evsel))
> >                       continue;
> > -             if (size > (strlen(evsel__name(evsel)) + (printed ? 2 : 1=
))) {
> > -                     printed +=3D scnprintf(bf + printed, size - print=
ed, "%s%s", printed ? "," : "", evsel__name(evsel));
> > -             } else {
> > -                     printed +=3D scnprintf(bf + printed, size - print=
ed, "%s...", printed ? "," : "");
> > -                     break;
> > -             }
> > -     }
> >
> > -     return printed;
> > +             if (!first)
> > +                     strbuf_addch(sb, ',');
> > +> +          strbuf_addstr(sb, evsel__name(evsel));
>
> The evlist may include hundreds of events. The error msg will be too
> huge for the case.

I hear you, lots of uncore PMUs :-) I keep wanting to the PMU with an
evsel to be a list. As you suggest in the next feedback, let's add an
option to have some maximum for the perf record use case.

Thanks,
Ian


> Thanks,
> Kan
>
> > +             first =3D false;
> > +     }
> >  }
> >
> >  void evlist__check_mem_load_aux(struct evlist *evlist)
> > diff --git a/tools/perf/util/evlist.h b/tools/perf/util/evlist.h
> > index edcbf1c10e92..5fe5cfbbebb1 100644
> > --- a/tools/perf/util/evlist.h
> > +++ b/tools/perf/util/evlist.h
> > @@ -20,6 +20,7 @@ struct pollfd;
> >  struct thread_map;
> >  struct perf_cpu_map;
> >  struct record_opts;
> > +struct strbuf;
> >  struct target;
> >
> >  /*
> > @@ -430,7 +431,7 @@ int event_enable_timer__process(struct event_enable=
_timer *eet);
> >
> >  struct evsel *evlist__find_evsel(struct evlist *evlist, int idx);
> >
> > -int evlist__scnprintf_evsels(struct evlist *evlist, size_t size, char =
*bf);
> > +void evlist__format_evsels(struct evlist *evlist, struct strbuf *sb);
> >  void evlist__check_mem_load_aux(struct evlist *evlist);
> >  void evlist__warn_user_requested_cpus(struct evlist *evlist, const cha=
r *cpu_list);
> >  void evlist__uniquify_name(struct evlist *evlist);
>
