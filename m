Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D937257453
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212700; cv=none; b=iayfIID0kLZeyn0ZxfdJDlcpzPwCnNXYN+pbd2Co7nMrYk5r4Jg2UqH1m+ugp7gm0l+ANMN78wXhFSmCRGkS+ESqmZg7T0jL8lP+v7l91vlzOOLrrQos4IvBGuFQ0scyfYE8soCw8r/2f+fTonTQs6J9vOYdxvfWbQV6EG3VDpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212700; c=relaxed/simple;
	bh=6ixW3uqiFvuVD+HyDPYyEDMckDxt6jrLcM7mLWSWT0Q=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=dvv4GKo74EUKe/c19gmrsTm5wyhCebuDbSzMR6Ere0Qj5kFcR41RE6wK/sLUTYSiiSuY3IcKNhF13suetBVigUjQvlSRYBiDg5YQDJ50Xkn+lF/Kix+uhVJ6uI7hNL64ir3Gl9ug0gOJrNf1hAQyySVbXjmA/6o9IoIP2sxrFmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rj+Wbo4I; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rj+Wbo4I"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e5b3ae2e0d9so5755070276.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739212697; x=1739817497; darn=vger.kernel.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HCljTNPPwHKTDTDfBQ8knfX7jWJi09j9Ne8EmTtzMbc=;
        b=rj+Wbo4IrdqiKPq7fPxzwq4og/dn5lf5HVF4v9SCGpNciqwQt0mr1MIU8JSqL5hJFE
         rEpEduaTca1qABu0c1BSc07NnIyfFy1iiscbtDolkts0nb1mtIn+Qwfn3OIsANLeqFt0
         nvQlfLUu7/qCudzAg7HCteeUJ7fm1UhY7ct5cnBJ2jnm37do0rERqoYPZcIQalIaskkp
         eXSv5cPBM4jYygcgT6pghc3X/3sqFYasXd3h7U1mn7qpLLr6fU17BeMYs7100XihQw84
         KZMR7n1cKmqKGsnCrQluqIFgvjFpCASJ1OX8hMzB5s9O+r0YWfvzZnsuP/mAYA3Kew0Z
         7h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212697; x=1739817497;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCljTNPPwHKTDTDfBQ8knfX7jWJi09j9Ne8EmTtzMbc=;
        b=wus2Y/EOz3HG8Xm9UKc69ExYQHyq+L0zp+ZKmyZnRbr3xY+WHneRbiISyz/bLcoldr
         IRMCSdkM4E6ncYOlW5dqrY/I74FaJrG+TrflXQDJeCSC/T8kMPDgQq1y+4+b61w4FvLt
         HWmCFG2tCUihaT4Wp8lGaZTiZlWAHe+yiSFQsVW0tsmLriU7FLUibNnTFc0ViKeHqm8+
         3BYJVb7T5+dHtMm8o4qQtASbFQZ8AiUusWWJfN2ilN0VvHc5My95I5Cv96yIrDO/p779
         ZYeYNajvToBGruZUQnHzO10hCW1pJhU/ZST/WA7+OQR0voS7UlAliDVNyq6giLtJM/SJ
         N0Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUbCMqp7zErwHMfRiWpb7VXR/KRv+4myo55B8RL2b+PzC44M8EijKueVT9u8jZHqfmr2li56Va1DJsIkds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM50HD4mc+qByi+UgBVNkEz47uHg4eZY8X8irQusoE9xh3zWMD
	qTMYrv1q/b3eiiVqDAGohiVxsQOsLD1EJ64zAdJwP7q/O4VbARDKviny7rODXgTGQQlRE2+BNt2
	8a4ChOQ==
X-Google-Smtp-Source: AGHT+IF/3fXdDMGjHwsubbKV2X/CqJQNFBb0YnBrBMqMQu/nTbASFKI5+C4RdgJWfhkPD5Ov2HtATvcRKtCT
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:c64e:af58:30d4:168d])
 (user=irogers job=sendgmr) by 2002:a05:6902:1365:b0:e58:98ba:77a8 with SMTP
 id 3f1490d57ef6-e5b46261c65mr114792276.6.1739212697325; Mon, 10 Feb 2025
 10:38:17 -0800 (PST)
Date: Mon, 10 Feb 2025 10:38:06 -0800
In-Reply-To: <20250210183808.130522-1-irogers@google.com>
Message-Id: <20250210183808.130522-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250210183808.130522-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Subject: [PATCH v5 2/4] perf stat: Use counter cpumask to skip zero values
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Leo Yan <leo.yan@arm.com>, 
	Yoshihiro Furudera <fj5100bi@fujitsu.com>, Weilin Wang <weilin.wang@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Dominique Martinet <asmadeus@codewreck.org>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When a counter is 0 it may or may not be skipped. For uncore counters
it is common they are only valid on 1 logical CPU and all other CPUs
should be skipped. The PMU's cpumask was used for the skip
calculation, but that cpumask may not reflect user
overrides. Similarly a counter on a core PMU may explicitly not
request a CPU be gathered. If the counter on this CPU's value is 0
then the counter should be skipped as it wasn't requested. Switch from
using the PMU cpumask to that associated with the evsel to support
these cases.

Avoid potential crash with --per-thread mode where config->aggr_get_id
is NULL. Add some examples for the tool event 0 counter skipping.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/stat-display.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index e65c7e9f15d1..126fe6cc8893 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -1022,8 +1022,16 @@ static bool should_skip_zero_counter(struct perf_stat_config *config,
 		return true;
 
 	/*
-	 * Many tool events are only gathered on the first index, skip other
-	 * zero values.
+	 * In per-thread mode the aggr_map and aggr_get_id functions may be
+	 * NULL, assume all 0 values should be output in that case.
+	 */
+	if (!config->aggr_map || !config->aggr_get_id)
+		return false;
+
+	/*
+	 * Tool events may be gathered on all logical CPUs, for example
+	 * system_time, but for many the first index is the only one used, for
+	 * example num_cores. Don't skip for the first index.
 	 */
 	if (evsel__is_tool(counter)) {
 		struct aggr_cpu_id own_id =
@@ -1031,15 +1039,12 @@ static bool should_skip_zero_counter(struct perf_stat_config *config,
 
 		return !aggr_cpu_id__equal(id, &own_id);
 	}
-
 	/*
-	 * Skip value 0 when it's an uncore event and the given aggr id
-	 * does not belong to the PMU cpumask.
+	 * Skip value 0 when the counter's cpumask doesn't match the given aggr
+	 * id.
 	 */
-	if (!counter->pmu || !counter->pmu->is_uncore)
-		return false;
 
-	perf_cpu_map__for_each_cpu(cpu, idx, counter->pmu->cpus) {
+	perf_cpu_map__for_each_cpu(cpu, idx, counter->core.cpus) {
 		struct aggr_cpu_id own_id = config->aggr_get_id(config, cpu);
 
 		if (aggr_cpu_id__equal(id, &own_id))
-- 
2.48.1.502.g6dc24dfdaf-goog

