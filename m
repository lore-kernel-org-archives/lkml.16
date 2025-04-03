Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3559926738B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743709439; cv=none; b=JpkJIVhZWa1DV67FPxqNFhM667dgSfTGEPHQ7tfsAr1ZrfxJhRpoDA6Nwb6ZufCVAcHRkjzh2Lm/jeF11+asf15wMpl+1lx5X2t/xnBykstgRa1nnmn/Zrs2BTdAyepzK7uyzA9cSHsCnOCXsFSkAFC+mhEz7qu3YlCdw98JJ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743709439; c=relaxed/simple;
	bh=QIZAAAk/MdLupLUpiD23XMSohaw76ST55IymoNR7/t4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=Hho9/B4vHHfg5VcVFBdnzDKBvZwdbc6PFTLP3IDGDaI6JOuD2qCSXvW91Lq0qlRwFyJrYrmKLCIQnhh9+YBjtcfuE4VttkVR2ssMHDpu12uTmL/dC1KHi4M3fsHWIowjqqW8vKlK9mutYjXxR8PU8dYZb9r7FG8H6RnR/bPJ208=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G0vx7jiJ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G0vx7jiJ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff62f96b10so2719705a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743709436; x=1744314236; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/yB/Gn9tHctPRNXn6w3PLBCiw087uLsUcXZZ/fWypWo=;
        b=G0vx7jiJiykxIrcG7OROFFpA/z+3PPqoWOXbx3UfH1PLGPxtTCpw0DD+/NYE8WDEqZ
         Odu73KISAhpSyPgnIla384+aEDeU4x1THx+MGRWUSb9Trn6lC1mfWnWVT9Slwbsrdx7T
         s3nrMnb8gRPEYHZgdhK9FarXRMrWU03nhq7uyWefT+B/6HqQLLVriR2U4gddLc0fiPhF
         LlBURa29d2qlO1hNzBb7xF9zWj+B7YEBmO1Cu4//mFeP5vezgJe5tipic7Nq1OipGtfx
         AkwtZZl6zpl3t/1KCue/fMdyGIY6bRjXyvaoeJLmAcV81JwGhAA7cjegL0aGYNaTVqOa
         J/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743709436; x=1744314236;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/yB/Gn9tHctPRNXn6w3PLBCiw087uLsUcXZZ/fWypWo=;
        b=o/kyRUzMZpP6xJjBx5Bm+JozWQiiK4hsgf8HcVK8Aj6S2stfiPSjWVGDivIMYCtYur
         /vDdexHf9umQ1YD9IqwsHntIAZGI8rNynVTaybOHb0tRr5uXDlSdzQfAurBsZboBCzwE
         ddhXsHJ9HRbwZ/rMYk6uc2AdohcZlXv3lZyp3sYai2rSbp1jQYgTWrMLLQTegAWVvl7g
         IRF9BhARxG8xAKl8bRAEbAaOJOqtsL8dXoxhef8W2/mnZ6pjFzGnsRJ81EId+H+p1SNe
         n1I0d9sr1piu+0WX4ca3oeL+oAuy3rYsm/nM1h7bjhHshFcx1yp8dF5GuD2VxWq9tuNR
         6dYA==
X-Forwarded-Encrypted: i=1; AJvYcCXGnZKsPHZede3L0fPbZo/c283KfUEqs8sQn5U6QjQ0eDnzT8j201uUu7pyF7DpMw4DtWEoUOp5dPIA/r4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDP9pPfo/BRN0nVd/2+rtn6W2NFSrHn6vbRO8Rl/tsjk+56vGS
	8nsLujyJvC8T9d5CqgGt1TrO571bWFMMRa5Rlh30r1uQg4/4EkfiMGUKFltrrlhz5zvnAYc70BB
	Fk5QFTA==
X-Google-Smtp-Source: AGHT+IHPrUcrSNE9tHepYVbX0KrHTiLPITA768YB/Ndnpp5L3XAiSB2Op4yPgZ2vCjpVSVdiYY4nuFOZlI6t
X-Received: from pjbpq18.prod.google.com ([2002:a17:90b:3d92:b0:2f8:49ad:406c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5247:b0:2ff:556f:bf9
 with SMTP id 98e67ed59e1d1-306a4e62893mr773485a91.4.1743709436490; Thu, 03
 Apr 2025 12:43:56 -0700 (PDT)
Date: Thu,  3 Apr 2025 12:43:35 -0700
In-Reply-To: <20250403194337.40202-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250403194337.40202-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403194337.40202-3-irogers@google.com>
Subject: [PATCH v6 2/4] perf stat: Use counter cpumask to skip zero values
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Leo Yan <leo.yan@arm.com>, 
	James Clark <james.clark@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Weilin Wang <weilin.wang@intel.com>, Andi Kleen <ak@linux.intel.com>, 
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
index e852ac0d9847..4afe963c6a93 100644
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
2.49.0.504.g3bcea36a83-goog

