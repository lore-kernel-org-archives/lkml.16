Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B59210F4A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748380106; cv=none; b=jz2orqgTVaVem1l4WjQvWyc5Ja4HWaNCjt2x/y7nG+zn2yM29Fhuin7ENK7trAflHkDGfZbxN54bGe07ncqZNKVQbZj+GmixP4Ec7RpSyWJ6Zg+W4wFyHWTBeBrq2mOuG8I0K3h/DMwyG4A+ZuoZag/TRW/rGpLi6fH2vqbJ3zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748380106; c=relaxed/simple;
	bh=Z7WVupvj16WfsVDhIQF8YtdP4WrWMtSMWgQEYIEu1vU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o++yiCBglSTWRgqbmyO/TSlx5r7xqpLAdPkyJncZWqmROHdnHGmgrYlZYPFu4dgUZ5FTJkpoybVjWIGbjUunyU/eWwLjU1lEnNb3X8gZ9JOXkodL/URwREB7q9yJEn2pcK7+hC4mbBbeBigOdIhbDV34xt/uJhPUJwIj1N/PNAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vA0RSf52; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vA0RSf52"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3dc8897f64cso20955ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748380104; x=1748984904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubiEBlty5LLcHWhiL4ftQwDPhybt329gmxk4FbujYzU=;
        b=vA0RSf52eAT3MzQ103gQTZdOlUel13IjLRI5yMuS1pR/POvoe+tzIAbDj9OdWkfcik
         e6r5ohgxauLPsClKf2KFIAeO/aaEjLtnstBHoEZP9ICy1y5BEIG6wr56d1JhrGtNKXkB
         ZXC6v5tUF8bwMkmgvXhv1PQCAi03oCIbL9o5EFgSe9uRgh3l0tvWg8MfdugQxd1GLVUH
         3JVJE4dOtDMMcqEGWC6gWuJilWVoxUoChUe/QJQhD1ypa8hv3POedTRNlJth2J+3GwX3
         QOpq0nSv37krXq+mMNs2UzYXe19D9h1U7avZ6m0gBE3FMv/NS6xa0ZE2d2gDAvLi+1Z4
         aH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748380104; x=1748984904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubiEBlty5LLcHWhiL4ftQwDPhybt329gmxk4FbujYzU=;
        b=UlKb/cquUNJsDAtcNnUJ+xa78o5Vt4IROCUxAFVTIp8GXI8Un/pGVcdhqxz/q0OUI3
         PVdDPTfrUEzOjrSlVuwydWzz0PT4XR63kdE/MjofCss5ybpDoE4FppV0SXgACChGUGvJ
         ucR6bEAKqknwl76IC0xK1J1K4eKf5Lhz41TZNKqSXeO6aQQiyCA1DG1CXMtZh23nUeZ+
         3sCV9LBebkayzSWUi7JSBVKAwJTCM7afGmE4Pe5ChGfr91yMCm/b0FrsbgAufQ2UBkkO
         s24DUneH7AAFUx//casZB5ufUmIxaXV4ZhngityU7ssvqFC7NUM+I6oBobBcimp6M/j/
         nXWw==
X-Forwarded-Encrypted: i=1; AJvYcCU9jPTPKvL52xN9d13+RrDbKLoLf8unsfcefsSX182R6D291rv7riq3nJKDsO/yWx0JtUQG9h682U0EoUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFKXEr16wX2l3G+E3SI6J8eRnre1bITMJ1W/0nTWKtTZg6SnIM
	2wl3sYApiLMdppVn53ErFjMFrnYPd38KdSIkDrDP3SZSloXtfQfRhSs0xbz1J673f7v6B/SbSaM
	J22jZtT+WC0skecBEea3K2x0UPRP86k7qv7WmoB17
X-Gm-Gg: ASbGncuazajgilPzsAVoa4lwxtIriC9Vk5tbmjbdAxEXHZD+SUS78O4VvoN6oJerxzT
	Bq1G8iw0YDwtV+OkAz/u2IrhlGXA6GgRwLfjlLm858JID/TqmTMIAHqEtM33j2GFtCNvjeIOWK7
	S2Psz6VnDTIXma3cLWG2bfGm5Ktxuug/PPOjPW2hagy+64Es0h/bmhqj0kac76uuho5EMMes2+
X-Google-Smtp-Source: AGHT+IH8GAJYpDplkuydkJu8WA/jhGPEYRVfjAxb8lYAz5mHHBeiaWfjPDPmvfhCEv1WeCyp1Cl49JqwlweQk7tq2MQ=
X-Received: by 2002:a05:6e02:b46:b0:3d5:bb1f:843e with SMTP id
 e9e14a558f8ab-3dd89c643f9mr217595ab.29.1748380103741; Tue, 27 May 2025
 14:08:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403202439.57791-1-irogers@google.com> <CAP-5=fXkayZ7pj+EctOtSBiTcGuyi6SHm9c5RZ3HyyPYcot9zA@mail.gmail.com>
 <aBKz_Tg-s20Qsv6k@x1>
In-Reply-To: <aBKz_Tg-s20Qsv6k@x1>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 May 2025 14:08:12 -0700
X-Gm-Features: AX0GCFvsfgIcbRHL9xzCP_HBfkVqBfuvNmKL4yVjwY42U8vH-HJaieCbVgbJ9dk
Message-ID: <CAP-5=fXZy=2AqmA1L42x57BwndR4cgUTrR6j0S-aHSnMuF9x9A@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for a DRM tool like PMU
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	Thomas Richter <tmricht@linux.ibm.com>, Junhao He <hejunhao3@huawei.com>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Brendan Gregg <brendan@intel.com>, 
	gabriel.munoz@intel.com, matthew.olson@intel.com, 
	brandon.kammerdiener@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 4:36=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Wed, Apr 30, 2025 at 08:21:59AM -0700, Ian Rogers wrote:
> > On Thu, Apr 3, 2025 at 1:24=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> > >
> > > DRM clients expose information through usage stats as documented in
> > > Documentation/gpu/drm-usage-stats.rst (available online at
> > > https://docs.kernel.org/gpu/drm-usage-stats.html). Add a tool like
> > > PMU, similar to the hwmon PMU, that exposes DRM information.
>
> Looks useful, I'll try to review and test tomorrow, but most probably
> Friday, as tomorrow is labour day in this part of the world.

Ping. Thanks,
Ian

> - Arnaldo
>
> > I'm reminded by Brendan Gregg's new blog:
> > https://www.brendangregg.com/blog/2025-05-01/doom-gpu-flame-graphs.html
> > that this is still outstanding. The patches also reduce some directory
> > scanning for the hwmon "PMU", they are in Google's tree:
> > https://github.com/googleprodkernel/linux-perf/blob/google_tools_master=
/tools/perf/util/drm_pmu.c
> >
> > Thanks,
> > Ian
> >
> > > v3: Minor tweak to the test so the skip (exit 2) doesn't trigger the
> > >     trap cleanup.
> > >
> > > v2: Add support to only scan hwmon and drm PMUs if the event or PMU
> > > wildcard can match. Add a test as requested by Namhyung. Add file
> > > comments.
> > >
> > > v1:
> > > https://lore.kernel.org/lkml/20250211071727.364389-1-irogers@google.c=
om/
> > >
> > > Ian Rogers (4):
> > >   perf parse-events: Avoid scanning PMUs that can't contain events
> > >   perf parse-events: Avoid scanning PMUs that can't match a wildcard
> > >   perf drm_pmu: Add a tool like PMU to expose DRM information
> > >   perf tests: Add a DRM PMU test
> > >
> > >  tools/perf/tests/shell/drm_pmu.sh |  78 ++++
> > >  tools/perf/util/Build             |   1 +
> > >  tools/perf/util/drm_pmu.c         | 689 ++++++++++++++++++++++++++++=
++
> > >  tools/perf/util/drm_pmu.h         |  39 ++
> > >  tools/perf/util/evsel.c           |   9 +
> > >  tools/perf/util/parse-events.c    |  30 +-
> > >  tools/perf/util/pmu.c             |  15 +
> > >  tools/perf/util/pmu.h             |   4 +-
> > >  tools/perf/util/pmus.c            | 101 ++++-
> > >  tools/perf/util/pmus.h            |   2 +
> > >  10 files changed, 952 insertions(+), 16 deletions(-)
> > >  create mode 100755 tools/perf/tests/shell/drm_pmu.sh
> > >  create mode 100644 tools/perf/util/drm_pmu.c
> > >  create mode 100644 tools/perf/util/drm_pmu.h
> > >
> > > --
> > > 2.49.0.504.g3bcea36a83-goog
> > >
