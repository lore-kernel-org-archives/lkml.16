Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE4684D0E
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 04:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738211363; cv=none; b=nhUkR8tLAWiYHNxRG8EtlGN1A0bfdaZ6BDtJo4SXtlJR39zKdUbeiGHc0uvy0Q20wkXlt0X3SCrRMiHLsKOu6AteV4DVSoZMGSox3DtY4YOHrSFbLYCFSuM+h2wMDXypaw9Top4l60r3h4OwUxn9j3EdagAgIz5zr4nMUgj7qXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738211363; c=relaxed/simple;
	bh=XkZUUAzYq2VdR+SnU8f+2BvINi56b1QAaZY8AfY1MOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=bo4MJYsVtA86HNFSt63XNdWzYbdsjhKP8A1eZBmebNFnyUb2E55wDWoYAq0SQsxQ9EqGE97E1xPPE1bRU2RH9sKtAED9HyrzPgzhAovIEVG6Z19DLj3fV0hQPjL3r3wNH5iEVErlmrev4eiEIBIw1Xi+bfEXbyNrC5aCJDvC2p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rQ7KLfq2; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rQ7KLfq2"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a9d0c28589so61615ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738211361; x=1738816161; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1i1AoIWx1zHF/T3IVKv0v+96uu83BILbTfH1uwyBWc=;
        b=rQ7KLfq2l3HPyhJ1y3kYhlFOXNHsiA3wxPXW+LQjkZXlLpdZfvYJ5cNQxAryVv+gMc
         ru4Rjr/i7/KQz+QQMKspNN1Lm8XLjyg0A+s0Dw2CPRUR+L/uv6hee/ccZtt/k90YYJZv
         /IXGcAfR+8wyFF0/ysA/qTZIkoKoUT5Ek4t5AEKnWYulBg+c9XYT4W8ia0paNCXGpjvj
         0QTDhLu/ZxK3LOb+74nwBUf8djS6FGzf29BuPb8FKnaR1Y0bgy3Y4khPDuTWmpXsiwPE
         n+P3JQD0JYFQGrPaFjCxJW9biP/fgCb0HhYRxZUkBaqkjfZPt+WikopXxPR33ZbfMtyh
         jcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738211361; x=1738816161;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1i1AoIWx1zHF/T3IVKv0v+96uu83BILbTfH1uwyBWc=;
        b=I5e+XifNuhM2lbqTjukbb1bCoHLb2SFSaVHSs+/U8FkyZTRK9VvHANbrO3vGxHcWGf
         vbCssM3Kpz+WcZz+OgjoI0zRf5x7CR3+gpWFDZjpqwCk0NihP624RcgfdV8n+yRcQjC4
         82qVYgX26+pZioQFub9crtbq52iscngCSVl9FHHzV/V86ewhfPyVh9sT23umUMkGD/WI
         FitXg0aoKiZOZSE4bVfAfOZZZiTOVfEpJKXhehy3aT6YSe/OtCOH0BN8Sm4ik2D9Ao7F
         dnYM9McTPYaIzrQPqaILA+1DsWLGmMqzKJylgpiLtXRotdyGVh2G7QdvXnb+Q3Xmm7t+
         3deg==
X-Forwarded-Encrypted: i=1; AJvYcCVHSklkufCMoO6y1pDXebedXNF9S/mnul/ZByWh9CJzd6SAMwZ5NR8vyTs4pyPm/qZ0YHsae1HMc+a4qhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqTxdLXxiErAlJ4jFvzLBU89KU7ZFsfySNb6U73hL4RWMWetF0
	nfY20oVJ1izB404/jBeZY/cZscf4S/vh+STndwigCzE7612TEICjE8QRo+WxaC0PXFRMf0zyFKi
	YAAi+43VPSMgKefUFhctE43j2F70S8Kyw5CT7
X-Gm-Gg: ASbGncvzFjHRRAzSaVXwVJNt7w13WFsxsGoIi/RcL95culpH5NeGn7JkhLqNQpQwBdY
	v2/1L43TDdptMmUQoV7TipS1b9TUCA+qbwo+rbnA90lnrHZt+BPmM88xevZmFdQti6eu2YCVHvQ
	==
X-Google-Smtp-Source: AGHT+IEYsVtf4DjQppZMbQavtkgPg4WZGbr0zycmlgAXq2lMzIZmP6fyTP9R31pyi/iDI2WTzbV6XtapfuC+Hu6PrQw=
X-Received: by 2002:a05:6e02:1cad:b0:3a7:683e:2fb0 with SMTP id
 e9e14a558f8ab-3d00982fee9mr2299615ab.6.1738211360828; Wed, 29 Jan 2025
 20:29:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123074659.698123-1-irogers@google.com>
In-Reply-To: <20250123074659.698123-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 29 Jan 2025 20:29:09 -0800
X-Gm-Features: AWEUYZljnPgcRGAk0urV782d1e9WAh2Wm_5PCIIo0Lu0bAdkjglskriRJhacY-4
Message-ID: <CAP-5=fXtRFiZ=MAVbiifbc-1G3Dg-oxPweV9KqLTDrMK-hkL8Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] perf hwmon related improvements
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Ze Gao <zegao2021@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 11:47=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> Try to do less scanning of files/directories with or without hwmon
> PMUs. Don't merge all events with the same name, only merge those on
> the same PMU ignoring suffix. Tidy PMU name matching to distinguish no
> suffix or wildcard matching. Refactor uniquification so the evsels
> with the same name as other evsels in the evlist are uniquified.
>
> v2: Rename ignore suffix PMU name matching that is really a
>     wildcard/prefix match. Use a proper ignore suffix when not merging
>     counters purely on name.
>
> Ian Rogers (5):
>   perf evsel: Reduce scanning core PMUs in is_hybrid
>   perf pmus: Restructure pmu_read_sysfs to scan fewer PMUs
>   perf pmu: Rename name matching for no suffix or wildcard variants
>   perf stat: Don't merge counters purely on name
>   perf stat: Changes to event name uniquification

Hi, this series (v1 sent over 2 weeks ago) fixes broken event
aggregation where all events with the same name on different PMUs are
merged. For example, arm_cmn/cycles/ would be merged with
armv8_pmuv3/cycles/ if parsed through a glob. The bug was introduced
by:
https://lore.kernel.org/r/20221018020227.85905-16-namhyung@kernel.org
and the hope was this would be in v6.14 and the Fixes tag would see
the changes backported.

Thanks,
Ian

>  tools/perf/pmu-events/empty-pmu-events.c |   8 +-
>  tools/perf/pmu-events/jevents.py         |   8 +-
>  tools/perf/tests/pmu.c                   |  85 ++++----
>  tools/perf/util/evsel.c                  |   4 +-
>  tools/perf/util/evsel.h                  |   1 +
>  tools/perf/util/parse-events.c           |   2 +-
>  tools/perf/util/pmu.c                    | 252 ++++++++++++++++-------
>  tools/perf/util/pmu.h                    |   7 +-
>  tools/perf/util/pmus.c                   | 144 ++++++++-----
>  tools/perf/util/stat-display.c           | 111 +++++++---
>  tools/perf/util/stat.c                   |  13 +-
>  11 files changed, 418 insertions(+), 217 deletions(-)
>
> --
> 2.48.1.262.g85cc9f2d1e-goog
>
