Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E02253921
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745441316; cv=none; b=uDaCVIKV/wuKozRMmsZHjZdTPO0scmBPd12OdTI5TjkfPCqO0euiILiyMUtZIHTL/Etl100q5iebSSoQD9uz++5le4ZTLqlYDNq3GPJq4+/4ZWQBDwn//YS0+kFBWJixc2I8NMcg6mzNIqK7QiuInYdEWuGYTnl9mjefuQ6ljI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745441316; c=relaxed/simple;
	bh=GMkKnDZs2TogS+OZnK3g/cGnwU+bgfYk9NTXbGCQMeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQHKgIt8L1datHWJY/g5LyenVcZhFP7OPasYRZKk1PpFkk+lmC+tt+5qL9gYdFzMv4/y0Y0hOeMZ9EOdKZ2o53MWMOrtnT3TDLolXh9qgRI2amiqml48LQGzHQuuRhw6EyBBIAra7yheL1kJLpIqcB5wfDP36E5wTfvtoKuyMRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r0h6jKF5; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r0h6jKF5"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d44cb27ef4so13745ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745441314; x=1746046114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T7e3sZe+hUN4WNXu8vyuvnIhtGlIZfELcc/drShjUE=;
        b=r0h6jKF5mxSbKqVCNQ927I7hJWgyo98H9GT+dnhO1gKb3UGJ+CSMRd8Q/IvINjVY0l
         FXDYO99siitfEa9lDCo3GO1wGNaTE2auPIYNrv5lyg+0ArAT3qNL7uziSkZD1S8ybrnc
         1LDmbsu2Ft+L8ujw4c/p4cmqM2uMxutt0D0ijYSTqrl3Ae3DD71cFARJB3+6B3dHW3vy
         lrueD8386q1CCvTXXKUjT1AW/MSbkOTbeJcLrCMyZOUHJFY5B/L9AjzWURMHuVUh9TsO
         QBNk5bsaB0Kv57yL5eNlFBrO1bQLv7MxfSG+Z7TjoGo24OCVTHKT/NTqIUr12CizMBHm
         7uDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745441314; x=1746046114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7T7e3sZe+hUN4WNXu8vyuvnIhtGlIZfELcc/drShjUE=;
        b=iN8vemMwhzREiKOjbDw0DJF3p4RwcnpYoHXvG1rQEGJcq5ykB93Gpd3nOdZqZrQkQc
         dOva4olD2b+Lm77WKwDUBokUuRn7houlwVZkJ2WNaPUX77tEyNnk5knshNGa5pJshm/L
         C0S1zatQLYxoj5ircmk3xfqem7m34rXC/G5sitTNKVmaAJeu9BAlQi71UUHKGCqJW7gR
         fTMCqNroigL/QJI5Buoif3tQFjwrZjK6jMkZfyk9oCbFOiDWsibjxoQif84+pno6XEvj
         6MfM0t3mfFzF9Wzl938R7YRIa+P/SaBngC+U++koVZd0qh3HLtPQGximC+A96tP+wvqw
         PN/g==
X-Forwarded-Encrypted: i=1; AJvYcCWz6kmSoQAsUGi77/47FCUzIcEY2ZDYDgg+Cz60PAcLEsqCjo3zMYT2aTsy2EXp9UaPTbJO/fHOjVJmIqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsdGKeEUAW7ZtVSvPicsJOYOVNCuUybU5THZjRoFfk1+quAbJw
	RrrkeYhBId6obtI7WeukqwTepWr/ORR/6aWvGWx26v+rVCg4zJ7sN/VJZEDLd/Ix9eNMgwoksuo
	BJ/zZyEVJtEXnrGceMVSlHZNq36x9mRLuZmzt
X-Gm-Gg: ASbGncsQLFIS7MbYxBIOKr4YFx4Is+5iqWSili76xgk3MIN6FzDEIwnKDZ4X7NZdIPd
	3j52JT6AW2MM41t8Zrdkl3tjEVTNWA59N/jPf0uRqPSkbIK0vvMxQKk/QU85wieGCXGJvUzvyII
	LBLOv2J2kwQ0APLLItnJOYOyQptWFAysWVlaiY2BZX/t6K+Q3Y0aE=
X-Google-Smtp-Source: AGHT+IExdZYQcSL4ZSE7r1r2DmT7LBXNbY8cNlCpvdhQiBrWm3wh+b/AgOTeN8dIsbroRlDeDuYqAySGeHwYi5u0CYk=
X-Received: by 2002:a05:6e02:1b05:b0:3ce:46e2:42c7 with SMTP id
 e9e14a558f8ab-3d9303a5da2mr152855ab.13.1745441313785; Wed, 23 Apr 2025
 13:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410044532.52017-1-irogers@google.com> <Z_dp7E2wtSek-KHo@z2>
In-Reply-To: <Z_dp7E2wtSek-KHo@z2>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Apr 2025 13:48:22 -0700
X-Gm-Features: ATxdqUHWMdNSnRzm2rl_aY_rXQ9Wb0DO-h_rZ2fPkL42xi7zcht25wdHFLc9Iq4
Message-ID: <CAP-5=fU6NM4LZWt9SdTFX9JKTgfghwAVvtXc-qBuUb0vpUeTQA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Metric related performance improvements
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, Xu Yang <xu.yang_2@nxp.com>, 
	John Garry <john.g.garry@oracle.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	Thomas Richter <tmricht@linux.ibm.com>, Weilin Wang <weilin.wang@intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 11:49=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hi Ian,
>
> On Wed, Apr 09, 2025 at 09:45:29PM -0700, Ian Rogers wrote:
> > The "PMU JSON event tests" have been running slowly, these changes
> > target improving them with an improvement of the test running 8 to 10
> > times faster.
> >
> > The first patch changes from searching through all aliases by name in
> > a list to using a hashmap. Doing a fast hashmap__find means testing
> > for having an event needn't load from disk if an event is already
> > present.
> >
> > The second patch switch the fncache to use a hashmap rather than its
> > own hashmap with a limited number of buckets. When there are many
> > filename queries, such as with a test, there are many collisions with
> > the previous fncache approach leading to linear searching of the
> > entries.
> >
> > The final patch adds a find function for metrics. Normally metrics can
> > match by name and group, however, only name matching happens when one
> > metric refers to another. As we test every "id" in a metric to see if
> > it is a metric, the find function can dominate performance as it
> > linearly searches all metrics. Add a find function for the metrics
> > table so that a metric can be found by name with a binary search.
> >
> > Before these changes:
> > ```
> > $ time perf test -v 10
> >  10: PMU JSON event tests                                            :
> >  10.1: PMU event table sanity                                        : =
Ok
> >  10.2: PMU event map aliases                                         : =
Ok
> >  10.3: Parsing of PMU event table metrics                            : =
Ok
> >  10.4: Parsing of PMU event table metrics with fake PMUs             : =
Ok
> >  10.5: Parsing of metric thresholds with fake PMUs                   : =
Ok
> >
> > real    0m18.499s
> > user    0m18.150s
> > sys     0m3.273s
> > ```
> >
> > After these changes:
> > ```
> > $ time perf test -v 10
> >  10: PMU JSON event tests                                            :
> >  10.1: PMU event table sanity                                        : =
Ok
> >  10.2: PMU event map aliases                                         : =
Ok
> >  10.3: Parsing of PMU event table metrics                            : =
Ok
> >  10.4: Parsing of PMU event table metrics with fake PMUs             : =
Ok
> >  10.5: Parsing of metric thresholds with fake PMUs                   : =
Ok
> >
> > real    0m2.338s
> > user    0m1.797s
> > sys     0m2.186s
> > ```
>
> Great, I also see the speedup on my machine from 32s to 3s.
>
> Tested-by: Namhyung Kim <namhyung@kernel.org>

Ping.

Thanks,
Ian

> Thanks,
> Namhyung
>
> >
> > Ian Rogers (3):
> >   perf pmu: Change aliases from list to hashmap
> >   perf fncache: Switch to using hashmap
> >   perf metricgroup: Binary search when resolving referred to metrics
> >
> >  tools/perf/builtin-stat.c                |   6 +-
> >  tools/perf/pmu-events/empty-pmu-events.c |  66 ++++++++-
> >  tools/perf/pmu-events/jevents.py         |  66 ++++++++-
> >  tools/perf/pmu-events/pmu-events.h       |  23 +++-
> >  tools/perf/tests/pmu-events.c            | 129 +++++++++--------
> >  tools/perf/util/fncache.c                |  69 +++++-----
> >  tools/perf/util/fncache.h                |   1 -
> >  tools/perf/util/hwmon_pmu.c              |  43 +++---
> >  tools/perf/util/metricgroup.c            | 102 ++++++--------
> >  tools/perf/util/metricgroup.h            |   2 +-
> >  tools/perf/util/pmu.c                    | 167 +++++++++++++++--------
> >  tools/perf/util/pmu.h                    |   4 +-
> >  tools/perf/util/srccode.c                |   4 +-
> >  tools/perf/util/tool_pmu.c               |  17 +--
> >  14 files changed, 430 insertions(+), 269 deletions(-)
> >
> > --
> > 2.49.0.504.g3bcea36a83-goog
> >
