Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765B21D7E31
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846420; cv=none; b=u7o5ZYj3t1HZx4gYBqgk1b3t43RGb03QQIqaiTfYRFteAh8bp9cXMXr/u9wSGrwv7XsEzb0AKfwEgbWlJ+G6HJwQRa47Gva+4k9MlCgk0SbehDxGo/0qRItfVKRTl71sQb/ozTlNny9lHdX3mHh/srKxnBz7CZ4B+2Amb0G4hdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846420; c=relaxed/simple;
	bh=/6cG1UExbTK3wCJmRyYwDHluktLcBVaJoz4/gFUB1E0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=r8byBcPYW1XNC1wDOED9O5FtRewItwKRIw4OAEgKCmln8GpO55SMHAU8G3LF/icQm/iFyaoPQwmTfaji2x59tyz7f4O/jzjavC8Mm/VI921ZvpP/3qikVeYnVsx7rxdTnnRYPNTEwdLnOvzxz1Pc+RDN0Ahf9bYba6tsdqh8DmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kuaV04Ut; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kuaV04Ut"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742a091d290so5009918b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747846417; x=1748451217; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PJDwk9lUeWYqaloF3KP9PdD4INzzphYEk8OumbojYXE=;
        b=kuaV04UtUQ/nHpyA22eSMbQpi0dMGmJ9hFFpVxM13ZAplbVHc7mhbQpyXrZlvsGWsz
         etp18hWXJ37waASPbFCTShBHJOFtw1uxT62/vwQRM1CBzDm/p8f0Z4dXpsEwNASd0c4c
         7GfSPSzktfjuQER/L0qQ6F58AXfogu6vsxarznfjIzFfT3maz/C8FK8vdSZKHpMry0K1
         UZvlLZaWydPfwhvvVnahQppwwsD8tGgKb5M771p8Wd3ydtKIeEvg4UIS4Yo7rWB4oB2D
         AGTA7b9t0pze1345gDRRrCFWmgUQUKI4/+v9WwWvrQYi+DWlktfRzEWIi4ALy/AyM15r
         4BkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846417; x=1748451217;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJDwk9lUeWYqaloF3KP9PdD4INzzphYEk8OumbojYXE=;
        b=IM0xUeENzSb9Q4mRyhYLbDY1KZtkS456a/aSLon62KV7BrQM8TQlwgY1jJOPSE7qbF
         T2EKI6D0mcTnhUwiuQg4NItn/8w+JVpeJyHQ1JU5evK52KXbo88pKRiAPfWz4LxFgoEy
         NobCSicyViX6RCXX6eW/1GQIFqWX8Wj+t1DC45KzZJL8ow0IYrlLSosDI/1edknN4amF
         7YjDCOos711A1fnaBqg5kGFtHqUrs6FmJK8beoW5AM8nRvuuABqNKeuWn8/059KmXSVO
         fsLgtBUyVJC6nqPZkCt4B4vf/nX6PhxQeExch7Pr7zFA1XvI6zFrGGEX0S7lsWgFiP/k
         7ZBg==
X-Forwarded-Encrypted: i=1; AJvYcCW7Wh3ELJ02c2hkKRTeuV2dGZcf0IjBbEg7tSVWFiUGdiNPuXudQEIlB/A8kjImJDlQDnzHbxbo3/QOTho=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiUGtw3Cm+XwdT1om/3T3zctrOOft8jajpVMtiM2EiNDrum0Ie
	xLGdoxfVsQ7j5I7KA2ZmPDo/6kbTXKkTLxsKhCQ4uxp9KWBjJtkH6kdGqGKIVX0Ot8fUEHXKqI3
	CU9TCq+37cQ==
X-Google-Smtp-Source: AGHT+IHNtvMZiy9V/nlqZBj/BZJ3CVXw8tEEjM3Ced/VNZbyxdocjSeMDVn2IQN64SDBVY8MSfqlpS++GleC
X-Received: from pfblc16.prod.google.com ([2002:a05:6a00:4f50:b0:740:b061:1007])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2da5:b0:740:41e4:e761
 with SMTP id d2e1a72fcca58-742a98c144emr28807373b3a.22.1747846417381; Wed, 21
 May 2025 09:53:37 -0700 (PDT)
Date: Wed, 21 May 2025 09:53:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250521165317.713463-1-irogers@google.com>
Subject: [PATCH v3 0/3] Generic weight struct, use env for sort key and header
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Ravi Bangoria <ravi.bangoria@amd.com>, Leo Yan <leo.yan@arm.com>, 
	Yujie Liu <yujie.liu@intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Matt Fleming <matt@readmodwrite.com>, 
	Chun-Tse Shao <ctshao@google.com>, Ben Gainey <ben.gainey@arm.com>, Song Liu <song@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kajol Jain <kjain@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"

The arch directory is a barrier to cross-platform development as files
and behaviors within it are inherently platform specific. Sample
parsing should be generic but the PERF_SAMPLE_WEIGHT_STRUCT handling
was only present if building for x86 or powerpc. The sort key and
headers should be specific to the session that is being executed and
not to the machine perf is being run upon. These patches clean this
and associated code up.

v3: Code reorganizations suggested by Kan Liang.
v2: Avoid changes to include/perf/perf_dlfilter.h as suggested by
    Adrian Hunter.

Ian Rogers (3):
  perf sample: Remove arch notion of sample parsing
  perf test: Move PERF_SAMPLE_WEIGHT_STRUCT parsing to common test
  perf sort: Use perf_env to set arch sort keys and header

 tools/perf/arch/powerpc/util/Build         |   1 -
 tools/perf/arch/powerpc/util/event.c       |  60 ----------
 tools/perf/arch/x86/include/arch-tests.h   |   1 -
 tools/perf/arch/x86/tests/Build            |   1 -
 tools/perf/arch/x86/tests/arch-tests.c     |   2 -
 tools/perf/arch/x86/tests/sample-parsing.c | 125 ---------------------
 tools/perf/arch/x86/util/event.c           |  46 --------
 tools/perf/builtin-annotate.c              |   2 +-
 tools/perf/builtin-c2c.c                   |  53 +++++----
 tools/perf/builtin-diff.c                  |   2 +-
 tools/perf/builtin-report.c                |   2 +-
 tools/perf/builtin-script.c                |   2 +-
 tools/perf/builtin-top.c                   |  16 +--
 tools/perf/tests/hists_cumulate.c          |   8 +-
 tools/perf/tests/hists_filter.c            |   8 +-
 tools/perf/tests/hists_link.c              |   8 +-
 tools/perf/tests/hists_output.c            |  10 +-
 tools/perf/tests/sample-parsing.c          |  14 +++
 tools/perf/util/dlfilter.c                 |   2 +-
 tools/perf/util/event.h                    |   5 -
 tools/perf/util/evsel.c                    |  17 ++-
 tools/perf/util/hist.c                     |   4 +-
 tools/perf/util/hist.h                     |   2 +-
 tools/perf/util/intel-tpebs.c              |   4 +-
 tools/perf/util/sample.h                   |   5 +-
 tools/perf/util/session.c                  |   2 +-
 tools/perf/util/sort.c                     |  67 +++++++----
 tools/perf/util/sort.h                     |   5 +-
 tools/perf/util/synthetic-events.c         |  10 +-
 29 files changed, 150 insertions(+), 334 deletions(-)
 delete mode 100644 tools/perf/arch/powerpc/util/event.c
 delete mode 100644 tools/perf/arch/x86/tests/sample-parsing.c

-- 
2.49.0.1143.g0be31eac6b-goog

