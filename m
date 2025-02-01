Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0F013E3F5
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 07:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738395808; cv=none; b=Ws2cCY7woEUBT0cXf8hd/AJaECYjlxVlUxSNw98+4+2q4Z1QNgQreZI0GX7XpO2VqbRzjF/Wi7t6ABWnGq0KyOXLhxCuY0Gx9g4qnZ3PjVTlvZgw5BoDY+JQjITMf8VDBmHg4qi40p8eyP6uVjXZtdoQH3zZTbPtArGkXwAU2Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738395808; c=relaxed/simple;
	bh=UBYXKIGypZj9VqksZhRL9+jdxZThDY6tClK/zdZW/5g=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=OQNuNK71M5HJn/sr7HXQW4NEfnSmx/G/DiUqPhr5L87D2HxkV31XdajWtSj6S4u4Gm+TdGH63GmRFY+zEUZ0xsX2WSxO8e64SY2gwsA7SIPGdMOVzjTD2XpQzFR9WAR+uEuRZqfF+fZ/Iy39zTPXVSsJcbRXNZzw+YUidAkg40U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R829D2y6; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R829D2y6"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6f788a1de55so19488867b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 23:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738395806; x=1739000606; darn=vger.kernel.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZvGhsd2oozVKIlbhhwRMg1QUNqaRs44ZEP4nrkktmU=;
        b=R829D2y6UrryzcP+uUb9sbNyeRznnnW+fXKMT0D3/jL+CyzYQZzHVlwqqS/c3nC1cf
         F25lvfug2NPgUgGuUgELLuE9AQi9qrNWwweG4IzJ4w7hi47V/YtcfP+FzrYtYCi0uRJq
         zIXXm5FNvwZbaOocK1L4ZJcQmvIenH1ycM0DKM9Ls4kQshYpUQV8odk8+H/T20ppTfma
         WqABN97zCZ+Exz5TYu/1M2F/MTGpfSH35yRuOw9tnRe6BH5b4EzVJOHrZ+BWbF3JLUoX
         cCx6uaKykbK1Zog4kfuJjPlij1um8jSnJ8+wMp0nnJ3Qkx5+aW2flkTf/xBaLcrSNi2B
         vzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738395806; x=1739000606;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZvGhsd2oozVKIlbhhwRMg1QUNqaRs44ZEP4nrkktmU=;
        b=fHDg6bgg/N/NqNkgyW4ryR611uybZGWaH7ihekrzGrVYUUqJ6M9rTqSuj1ylyojtiA
         be9Zge9Q8d9bsdK222E4Hg9MKSBIhfOrzPANCb/2g+YxYMbNrynZoxdKSm/LfuMdZDMG
         mthWTk2N1prFLrqaRK5k8sZJayhO6GSQUSb7yEy8+Rj8FS6XsKv7jQcw8IbvaySEInmT
         0oWQeZufCEA1IpVQALFuB+Cv6pOaS00tqzz876acX9BIZ9X6SIiG9VKhEVqLZ/DnVC7a
         2MQfzS1Bs33pFw0KahwODejBJwvqil7/L1pqmXTlAMMEju07tML2h+5my4LPMIJdN05V
         3giQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUsnHPiyZM6aM6FY8uljS50kTYuPY7p6Nve9lTX6KWVSH/wn5bsWSEv3S+XXjhE4VA6GmKTl23MGNu8+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBDegOgU17+rSEJIb8HOTyxrdj711iWfXpck89n6/fynyMhm8e
	cZYJEZOXLAGfQCO1WUxDq7eYHyCPjELJ69I+H2+7DExm6KsyL/U39B2gWyQB8gPmBwCwZ6oKZSh
	1V+fHag==
X-Google-Smtp-Source: AGHT+IG5RTcIIXxZpW/Ba46+cz83cBGqX9d83Ja1q5DUVm27EKh6cq4cxXgqfkkd4ac2K7KPedVSbpxIceRV
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:de26:87db:e4d0:62b6])
 (user=irogers job=sendgmr) by 2002:a81:b551:0:b0:6ef:4be2:ee09 with SMTP id
 00721157ae682-6f7a83fd155mr315467b3.3.1738395806029; Fri, 31 Jan 2025
 23:43:26 -0800 (PST)
Date: Fri, 31 Jan 2025 23:43:16 -0800
In-Reply-To: <20250201074320.746259-1-irogers@google.com>
Message-Id: <20250201074320.746259-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201074320.746259-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Subject: [PATCH v3 1/5] perf evsel: Reduce scanning core PMUs in is_hybrid
From: Ian Rogers <irogers@google.com>
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

evsel__is_hybrid returns true if there are multiple core PMUs and the
evsel is for a core PMU. Determining the number of core PMUs can
require loading/scanning PMUs. There's no point doing the scanning if
evsel for the is_hybrid test isn't core so reorder the tests to reduce
PMU scanning.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evsel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 026cf9a9893c..4009f7d58415 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -3866,10 +3866,10 @@ void evsel__zero_per_pkg(struct evsel *evsel)
  */
 bool evsel__is_hybrid(const struct evsel *evsel)
 {
-	if (perf_pmus__num_core_pmus() == 1)
+	if (!evsel->core.is_pmu_core)
 		return false;
 
-	return evsel->core.is_pmu_core;
+	return perf_pmus__num_core_pmus() > 1;
 }
 
 struct evsel *evsel__leader(const struct evsel *evsel)
-- 
2.48.1.362.g079036d154-goog

