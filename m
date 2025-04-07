Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42122489F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 05:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744002090; cv=none; b=ouf9gTHpCudH8tAqCADbPQIWsMT1ud32vklSL6bRUxE98S+aHSoFjzO/68t5sduxxDc53UqaxaYxBEzMXhzJcsiK9vmz2PE0YNDuEMDkysYpLeZWIU7hNQEHfh784h3c1XTW5ef/bfU9J+uyOCzggsyA6W6ZOI19PADLj5az0vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744002090; c=relaxed/simple;
	bh=IFNfdI150vfN3Xo7/oCHlYzJh62CBUFp0b4auUgNBxw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=LyVArlDCuYu0I39f/MQkvYctSNre7vzLXp78JDBCixGhL/uoaP0vPhahb26IWYJAQmyFoMTPTwLQNmM2I3sZ5BCQYf0uyZlEtIp7yhq4Caa4fMe6z9fUihymx9TB5LN8NIZU+o2sJ7RlBPbHEa1h9WQze1lTRAngt/fBzDLctBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MmLGtOgK; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MmLGtOgK"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-2c23beea898so2865567fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 22:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744002088; x=1744606888; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TQsKQ1vCjAU+l2hcTiBlNbndjH+ZisU6X+PObJgZnSg=;
        b=MmLGtOgKgteDHYftzUH7Q9e3SYh4gjvTDcuBkcSzaNajuRUatQQscISiTw0c8h243v
         SdcU1CwQSR94HigBnDqPqy+ZOeDEbqge3Jx4ECvBpw3QlJHmTUZklKfEaNTvQmWid/Sm
         tTppPB57HV+kA6GOLNrCQifbEZ6Xo9LHXHXiseUwIzFb5l9mDlzaO6iZMYDk0bRSLuJZ
         +yEIsYmGw12qyn7VQEch/cWsnwkBp6+Aof8sIVNwzjU26vxHX1DK/m2vt8giC4I4RI/n
         hRPivP9SIAJDfEE9/te30Tb0dfr8jQ+8dJIMtT+IuciEOYnG7fqmCQ8/ol2dGmh9GqIY
         876g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744002088; x=1744606888;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQsKQ1vCjAU+l2hcTiBlNbndjH+ZisU6X+PObJgZnSg=;
        b=KBZEw1bgG32BAHTjsIgBnKN6IsYqDwUw4YznEcJAGbBEHmQ7pyiB3V4ivJk9hYwOFR
         YujFiayGcuYLLoLjzCbS2X0sdnd7brRsrOAn5SkShXKDNLqYM6u0I3EVdq43jyA/rfds
         srANdF/8roefrL3uCM8exLpCT+6pfcswPmNlztlKnR7NrD4U9Y3zB1SNXuDPfs+Tvm9Q
         OiFqiPaSkWqM8yQADjJEMdCwqS1jUJMZVy3H4ydBUVMbW3wUB7Y7+zTY8YVoXMGiQXpX
         j/JtrBfaKcB6vOhmMvyDjY7twTsc6sP0NQyespcFICiv1InJBqCKE72BJsfMTTqt9Fim
         kQWA==
X-Forwarded-Encrypted: i=1; AJvYcCUKyho3DXLjuHSTpL/otf6guhUsND3v7UMN4ohyswXiaEbuQXeo54sb6OEjxUJ6rnCOW91nvznKG6zoB+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6yNcT/bLMdGhqIVQaedYaSOJsnf+sm7Wl0rG6IsDOv/4btJQu
	TlrhdnW1q2TW4qAEfhmTQLWLq8jro8H9eXdF7TyRP+D1gCDGasie2AquPeFnAYbjtNMLGTtrJNb
	1mcrdFw==
X-Google-Smtp-Source: AGHT+IHHRJRJoRVVv373ETzoRN0aw6OQoD6tbuJEgZ3VSq5A9ONhRxoH6jr/k8Z300LMtg7liYoqQzi0ty/2
X-Received: from oacny17.prod.google.com ([2002:a05:6871:7511:b0:2b8:55dd:faa7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:e38e:b0:29d:c832:7ef6
 with SMTP id 586e51a60fabf-2cd331bc71cmr4132687fac.39.1744002088039; Sun, 06
 Apr 2025 22:01:28 -0700 (PDT)
Date: Sun,  6 Apr 2025 22:00:55 -0700
In-Reply-To: <20250407050101.1389825-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407050101.1389825-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407050101.1389825-11-irogers@google.com>
Subject: [PATCH v2 10/16] perf intel-tpebs: Add support for updating counts in evsel__tpebs_read
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Weilin Wang <weilin.wang@intel.com>, 
	James Clark <james.clark@linaro.org>, Xu Yang <xu.yang_2@nxp.com>, 
	John Garry <john.g.garry@oracle.com>, Howard Chu <howardchu95@gmail.com>, 
	Levi Yun <yeoreum.yun@arm.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Rename to reflect evsel argument and for consistency with other tpebs
functions. Update count from prev_raw_counts when
available. Eventually this will allow inteval mode support.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evsel.c       | 11 ++------
 tools/perf/util/intel-tpebs.c | 52 ++++++++++++++---------------------
 tools/perf/util/intel-tpebs.h |  2 +-
 3 files changed, 25 insertions(+), 40 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 554252ed1aab..1d343f51225b 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1718,11 +1718,6 @@ static int evsel__read_one(struct evsel *evsel, int cpu_map_idx, int thread)
 	return perf_evsel__read(&evsel->core, cpu_map_idx, thread, count);
 }
 
-static int evsel__read_retire_lat(struct evsel *evsel, int cpu_map_idx, int thread)
-{
-	return tpebs_set_evsel(evsel, cpu_map_idx, thread);
-}
-
 static void evsel__set_count(struct evsel *counter, int cpu_map_idx, int thread,
 			     u64 val, u64 ena, u64 run, u64 lost)
 {
@@ -1730,8 +1725,8 @@ static void evsel__set_count(struct evsel *counter, int cpu_map_idx, int thread,
 
 	count = perf_counts(counter->counts, cpu_map_idx, thread);
 
-	if (counter->retire_lat) {
-		evsel__read_retire_lat(counter, cpu_map_idx, thread);
+	if (evsel__is_retire_lat(counter)) {
+		evsel__tpebs_read(counter, cpu_map_idx, thread);
 		perf_counts__set_loaded(counter->counts, cpu_map_idx, thread, true);
 		return;
 	}
@@ -1889,7 +1884,7 @@ int evsel__read_counter(struct evsel *evsel, int cpu_map_idx, int thread)
 		return evsel__hwmon_pmu_read(evsel, cpu_map_idx, thread);
 
 	if (evsel__is_retire_lat(evsel))
-		return evsel__read_retire_lat(evsel, cpu_map_idx, thread);
+		return evsel__tpebs_read(evsel, cpu_map_idx, thread);
 
 	if (evsel->core.attr.read_format & PERF_FORMAT_GROUP)
 		return evsel__read_group(evsel, cpu_map_idx, thread);
diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index e3227646a9cc..452ce3698221 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -415,49 +415,39 @@ int evsel__tpebs_open(struct evsel *evsel)
 	return ret;
 }
 
-
-int tpebs_set_evsel(struct evsel *evsel, int cpu_map_idx, int thread)
+int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread)
 {
-	__u64 val;
+	struct perf_counts_values *count, *old_count = NULL;
 	struct tpebs_retire_lat *t;
-	struct perf_counts_values *count;
+	uint64_t val;
+
+	/* Only set retire_latency value to the first CPU and thread. */
+	if (cpu_map_idx != 0 || thread != 0)
+		return 0;
+
+	if (evsel->prev_raw_counts)
+		old_count = perf_counts(evsel->prev_raw_counts, cpu_map_idx, thread);
 
-	/* Non reitre_latency evsel should never enter this function. */
-	if (!evsel__is_retire_lat(evsel))
-		return -1;
+	count = perf_counts(evsel->counts, cpu_map_idx, thread);
 
 	/*
 	 * Need to stop the forked record to ensure get sampled data from the
 	 * PIPE to process and get non-zero retire_lat value for hybrid.
 	 */
 	tpebs_stop();
-	count = perf_counts(evsel->counts, cpu_map_idx, thread);
 
 	t = tpebs_retire_lat__find(evsel);
-
-	/* Set ena and run to non-zero */
-	count->ena = count->run = 1;
-	count->lost = 0;
-
-	if (!t) {
-		/*
-		 * Set default value or 0 when retire_latency for this event is
-		 * not found from sampling data (record_tpebs not set or 0
-		 * sample recorded).
-		 */
-		count->val = 0;
-		return 0;
+	val = rint(t->val);
+
+	if (old_count) {
+		count->val = old_count->val + val;
+		count->run = old_count->run + 1;
+		count->ena = old_count->ena + 1;
+	} else {
+		count->val = val;
+		count->run++;
+		count->ena++;
 	}
-
-	/*
-	 * Only set retire_latency value to the first CPU and thread.
-	 */
-	if (cpu_map_idx == 0 && thread == 0)
-		val = rint(t->val);
-	else
-		val = 0;
-
-	count->val = val;
 	return 0;
 }
 
diff --git a/tools/perf/util/intel-tpebs.h b/tools/perf/util/intel-tpebs.h
index 5c671181ec60..218a82866cee 100644
--- a/tools/perf/util/intel-tpebs.h
+++ b/tools/perf/util/intel-tpebs.h
@@ -12,6 +12,6 @@ extern bool tpebs_recording;
 
 int evsel__tpebs_open(struct evsel *evsel);
 void evsel__tpebs_close(struct evsel *evsel);
-int tpebs_set_evsel(struct evsel *evsel, int cpu_map_idx, int thread);
+int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread);
 
 #endif /* __INTEL_TPEBS_H */
-- 
2.49.0.504.g3bcea36a83-goog

