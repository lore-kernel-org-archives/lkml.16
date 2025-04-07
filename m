Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2314922172E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 20:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056654; cv=none; b=c6kalCbPJAtXF/lr5WFpCBOIhI6Jtkmo5uptS2SGswxc5+7YkA8maKceMIll02+HhvNXVBihnSkXl8AuaQFWxQdFLmS9O5VNg2VqUCBf7UVbPaXTULRmgWEw5B8yDf+YAarEnJMOzI/u2cWkF77qtUoKxBpM3WUbTlBF/b/eJQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056654; c=relaxed/simple;
	bh=tS3SKiaM2en9L5ylpM7k7fvIypNAtlItij9iJZP6c6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5/9NdSvrDmQFPynUl1TAR5R9NyW0RyWdFRUGK6IZvdmWYOhJVHxVtpHFflvkSs6/xMJ3BBGgyTqaO+K3RMeHWPb7KnkpLLPyzwg1xWPf/GkSnpOXdX/jz6dJQc8IFgop4cD4L4c3Irhq38HI1yy3HMluVhy5E1F3aP/1hbAVxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t6zXveJC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t6zXveJC"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2240aad70f2so64315ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 13:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744056652; x=1744661452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7+onzGrcUcanNk1k/W89dalFr+6FKt16h47NMk8eSs=;
        b=t6zXveJCcLNGhcweV6HvzYHErJHwpsDjyA/+u3Ghe96dWsfGdeM2s95B4w5GC9AJe/
         GUjkB4Yi/yBCTVkw7NLnPrQGjQM6ODVGssBzbllIIqoLS6ikuF3rrEJGeF5PMyESKlN1
         pSAzuTX9hCnJlMv81XLS/4JzOWcJIRb/c8dwI2Ndr2z1s/RWNaSMkJqWCl3rUc7rgO6F
         5t0yZIAZp0aT3P7qQJcocpYbqwP0ZKZf70MxppwhB1WGbyahdvBdHPKd67Bk3up/ZiVZ
         RSR7ipOeMbQYipgXbwUEgrM2eUZi8249Cxq0nRsAMbRYWf6xhMFOZfPtUI05Gf1vgqSO
         UG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744056652; x=1744661452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7+onzGrcUcanNk1k/W89dalFr+6FKt16h47NMk8eSs=;
        b=MWoxuYK4r3JDF0IgE+KEYb9KhAJQuqiohiDKaZb/kmtoCyjq5RjoQgRNhErZTo6Opm
         MqDBh6B7fVAfERYWRst76IM4KUH1Pr8vOXoH1VkLAQay+vvCykNfOcY8vILs7R/s7Ltz
         q5/s4ZeSQQ2zDRhlg4EkJbI44rLACb9NrQq96vTBLjU6K5Pk+QgMsx2Jm2sEqw2YyDow
         k5nVfAk9OL4wMv7h8FUFkqWkHcFd8IzojOZu1SjfLyfFzl7zzC5YUe4MjR9pjksxqkrB
         z9k0jrQS2BpyGdi0FK3926IBZlkjr2lwvIyz8FaYTgFI2sL9p0nN30K4JmT+f/LazgQt
         e0fg==
X-Forwarded-Encrypted: i=1; AJvYcCUjUwG3mAbMI9/xBeRpinK8T7l3sIfkACwBOc7gan7R2c9dI3C6YRDO24bbiywnLhfQMCjtKg8nWjqdh3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKjzc/dEKMOL8eH9ngdCJJHb1EQFuGybkxUwqpyv2RZjKSWEIn
	caTnVTQ/Rg/D+1fj74LgIIMrA3EDCZa1eNFX9WYOhNDNje4LV9FNCPQrxqvBCa8BVEcVuyObywN
	PHqSUzcJ2ytlropU+P48Ze6MZndalJTcHz2FP
X-Gm-Gg: ASbGncsmzpmPk4EU50rnOWfwpk6jCjhqxGHFYR/tPo7eE7YIYSNcpxW1dUN45orWsU1
	iASpPFzwKUSMvJ+q64nCki24NcLvMBymCklrwFR8+TYS3heaeTpOO3vTciSqX18VFWa3FhdqMmF
	LP5GpBl6JyEByxTkglcKSP8i4BeqI5CWr3wpAuepkj4/NYP4yxVLn1IsvpSkiO93Jrag==
X-Google-Smtp-Source: AGHT+IHoZxutGzmd16g94lt9IBw6O7MX/54Ga1V1i+5hpRoHP4YJuBjLu50GYG2rtBTuMJ5QzPno55nn/wrKxIWR17A=
X-Received: by 2002:a17:902:b217:b0:223:5182:6246 with SMTP id
 d9443c01a7336-22ab725654cmr191135ad.23.1744056652041; Mon, 07 Apr 2025
 13:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407050101.1389825-1-irogers@google.com> <20250407050101.1389825-15-irogers@google.com>
 <8b06ba86-c7a4-45b4-8a51-525ef5e2187a@linux.intel.com>
In-Reply-To: <8b06ba86-c7a4-45b4-8a51-525ef5e2187a@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 7 Apr 2025 13:10:40 -0700
X-Gm-Features: ATxdqUF6l0-gzvwyT-2R2aVJlMbq2swNwzJrnCRzH9P47Tddh5wotwlpyq8us1A
Message-ID: <CAP-5=fUV5PQKGehqXVb6poodePnhaEv39=YyRJKto0h0xnF7wg@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] perf stat: Add mean, min, max and last
 --tpebs-mode options
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Weilin Wang <weilin.wang@intel.com>, 
	James Clark <james.clark@linaro.org>, Xu Yang <xu.yang_2@nxp.com>, 
	John Garry <john.g.garry@oracle.com>, Howard Chu <howardchu95@gmail.com>, 
	Levi Yun <yeoreum.yun@arm.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 12:56=E2=80=AFPM Liang, Kan <kan.liang@linux.intel.c=
om> wrote:
>
>
>
> On 2025-04-07 1:00 a.m., Ian Rogers wrote:
> > Add command line configuration option for how retirement latency
> > events are combined. The default "mean" gives the average of
> > retirement latency. "min" or "max" give the smallest or largest
> > retirment latency times respectively. "last" uses the last retirment
> > latency sample's time.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/Documentation/perf-stat.txt |  7 +++++++
> >  tools/perf/builtin-stat.c              | 27 ++++++++++++++++++++++++++
> >  tools/perf/util/intel-tpebs.c          | 20 ++++++++++++++++++-
> >  tools/perf/util/intel-tpebs.h          |  8 ++++++++
> >  4 files changed, 61 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/Documentation/perf-stat.txt b/tools/perf/Docume=
ntation/perf-stat.txt
> > index 2bc063672486..61d091670dee 100644
> > --- a/tools/perf/Documentation/perf-stat.txt
> > +++ b/tools/perf/Documentation/perf-stat.txt
> > @@ -506,6 +506,13 @@ this option is not set. The TPEBS hardware feature=
 starts from Intel Granite
> >  Rapids microarchitecture. This option only exists in X86_64 and is mea=
ningful on
> >  Intel platforms with TPEBS feature.
> >
> > +--tpebs-mode=3D[mean|min|max|last]::
> > +Set how retirement latency events have their sample times
> > +combined. The default "mean" gives the average of retirement
> > +latency. "min" or "max" give the smallest or largest retirment latency
> > +times respectively. "last" uses the last retirment latency sample's
> > +time.
> > +
> >  --td-level::
> >  Print the top-down statistics that equal the input level. It allows
> >  users to print the interested top-down metrics level instead of the
> > diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
> > index 80e491bd775b..4adf2ae53b11 100644
> > --- a/tools/perf/builtin-stat.c
> > +++ b/tools/perf/builtin-stat.c
> > @@ -2327,6 +2327,30 @@ static void setup_system_wide(int forks)
> >       }
> >  }
> >
> > +static int parse_tpebs_mode(const struct option *opt, const char *str,
> > +                         int unset __maybe_unused)
> > +{
> > +     enum tpebs_mode *mode =3D opt->value;
> > +
> > +     if (!strcasecmp("mean", str)) {
> > +             *mode =3D TPEBS_MODE__MEAN;
> > +             return 0;
> > +     }
> > +     if (!strcasecmp("min", str)) {
> > +             *mode =3D TPEBS_MODE__MIN;
> > +             return 0;
> > +     }
> > +     if (!strcasecmp("max", str)) {
> > +             *mode =3D TPEBS_MODE__MAX;
> > +             return 0;
> > +     }
> > +     if (!strcasecmp("last", str)) {
> > +             *mode =3D TPEBS_MODE__LAST;
> > +             return 0;
> > +     }
> > +     return -1;
> > +}
> > +
> >  int cmd_stat(int argc, const char **argv)
> >  {
> >       struct opt_aggr_mode opt_mode =3D {};
> > @@ -2431,6 +2455,9 @@ int cmd_stat(int argc, const char **argv)
> >  #ifdef HAVE_ARCH_X86_64_SUPPORT
> >               OPT_BOOLEAN(0, "record-tpebs", &tpebs_recording,
> >                       "enable recording for tpebs when retire_latency r=
equired"),
> > +             OPT_CALLBACK(0, "tpebs-mode", &tpebs_mode, "tpebs-mode",
> > +                     "Mode of TPEBS recording: mean, min or max",
> > +                     parse_tpebs_mode),
> >  #endif
> >               OPT_UINTEGER(0, "td-level", &stat_config.topdown_level,
> >                       "Set the metrics level for the top-down statistic=
s (0: max level)"),
> > diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpeb=
s.c
> > index f9584b00fb05..e1bdab4bba6f 100644
> > --- a/tools/perf/util/intel-tpebs.c
> > +++ b/tools/perf/util/intel-tpebs.c
> > @@ -31,6 +31,7 @@
> >  #define PERF_DATA            "-"
> >
> >  bool tpebs_recording;
> > +enum tpebs_mode tpebs_mode;
> >  static LIST_HEAD(tpebs_results);
> >  static pthread_t tpebs_reader_thread;
> >  static struct child_process tpebs_cmd;
> > @@ -45,6 +46,8 @@ struct tpebs_retire_lat {
> >       char *event;
> >       /** @stats: Recorded retirement latency stats. */
> >       struct stats stats;
> > +     /** @last: Last retirement latency read. */
> > +     uint64_t last;
> >       /* Has the event been sent to perf record? */
> >       bool started;
> >  };
> > @@ -142,6 +145,7 @@ static int process_sample_event(const struct perf_t=
ool *tool __maybe_unused,
> >        * latency value will be used. Save the number of samples and the=
 sum of
> >        * retire latency value for each event.
> >        */
> > +     t->last =3D sample->retire_lat;
> >       update_stats(&t->stats, sample->retire_lat);
> >       mutex_unlock(tpebs_mtx_get());
> >       return 0;
> > @@ -517,7 +521,21 @@ int evsel__tpebs_read(struct evsel *evsel, int cpu=
_map_idx, int thread)
> >                       return ret;
> >               mutex_lock(tpebs_mtx_get());
> >       }
> > -     val =3D rint(t->stats.mean);
> > +     switch (tpebs_mode) {
> > +     case TPEBS_MODE__MIN:
> > +             val =3D rint(t->stats.mean);
>
> t->stats.min?
>
> > +             break;
> > +     case TPEBS_MODE__MAX:
> > +             val =3D rint(t->stats.mean);
>
> t->stats.max?

Good catch, will fix in v3.

Thanks,
Ian

> Thanks,
> Kan
>
> > +             break;
> > +     case TPEBS_MODE__LAST:
> > +             val =3D t->last;
> > +             break;
> > +     default:
> > +     case TPEBS_MODE__MEAN:
> > +             val =3D rint(t->stats.mean);
> > +             break;
> > +     }
> >       mutex_unlock(tpebs_mtx_get());
> >
> >       if (old_count) {
> > diff --git a/tools/perf/util/intel-tpebs.h b/tools/perf/util/intel-tpeb=
s.h
> > index 218a82866cee..9475e2e6ea74 100644
> > --- a/tools/perf/util/intel-tpebs.h
> > +++ b/tools/perf/util/intel-tpebs.h
> > @@ -8,7 +8,15 @@
> >  struct evlist;
> >  struct evsel;
> >
> > +enum tpebs_mode {
> > +     TPEBS_MODE__MEAN,
> > +     TPEBS_MODE__MIN,
> > +     TPEBS_MODE__MAX,
> > +     TPEBS_MODE__LAST,
> > +};
> > +
> >  extern bool tpebs_recording;
> > +extern enum tpebs_mode tpebs_mode;
> >
> >  int evsel__tpebs_open(struct evsel *evsel);
> >  void evsel__tpebs_close(struct evsel *evsel);
>
