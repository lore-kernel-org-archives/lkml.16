Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5A01E5214
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179074; cv=none; b=BokPklSXmjTafXZgNaxokYCsylF6QfiTCdQrEM0Q5zBtME0d9VSxh2RVzxpZkvBwqWXMl7ltHAmLxa1C1YiK/dsKY07EGzWpI89O9i3uX/5S3zIfXIHy8g5gcp4JjJMyqG2SkDMCeRMfTuepTYozHBUm5kaUHRtGzqsVQIcjLD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179074; c=relaxed/simple;
	bh=midHO3Z3byxoUBHfKzM92TodrGzwSNi/xUV5ijTnPeg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=OKNmyEhuX8MJ61TXEOIjEprR2kDRSF5pndjFXJ2VcgZyqRUobgbFbY0LH0nsx1oj0SVIaC0q/wz2mA7HoB/tgR4eaTcIXG+M6G+D/l8llraxs5A3E451x27nloOBIJpWq9Hwa8rek1j8ly45riDv398ijRk+zZXZQTci1nMrcb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0McdWFul; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0McdWFul"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff55176edcso6240832a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744179071; x=1744783871; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w1vjvtqlcWS/+dNR0OE++xaid1m3UsjjNffN8GtQ4ds=;
        b=0McdWFul/Wi25VdqgeYmYPN7JG746DbMtBGFY8efs4P/DjGWvFiUeOvRMzOC+1+szp
         wL+bDCO88/wsFcaJoQ7PNrNlJM8G+LAfRouqp5Rl5wUhO3hPc4HS8nvjr/zmMDxlgACM
         w29OJL8UIzDQSqjJBwfgOnM35uWbP7t9PCPa5JELTPN968NK04bIuEk2f6n9zA6zCciq
         LeCX9tPdXYW9okDtHP16D3AWV0AQtUa0DXpg3zuijf747mQ3SzAg+2zH33vkj/WtieCu
         FzAK9wN6UrAAzE0RpCZtZomv7FkF+DOrYJcufCPfcvZ9koKc1M5ecn6vSjz1ouw8lpeI
         GbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744179071; x=1744783871;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1vjvtqlcWS/+dNR0OE++xaid1m3UsjjNffN8GtQ4ds=;
        b=Tlb9GLZVsMSUVnfYcOraahXxC4zH1X7BwAWGODKnpOzlti1lZX5cxHp1BC8lrVicjD
         MUPwdPDRbygj42I13X2HnGw/YHeIbvVTZkrWUiasO+saVgIFlxcwQKCtioafGT2/wKU1
         8jqN07AySh+dHxU5oTeV4FgdGF01gCpcTZb1xj8+OMk40NgandRJtBwB+5aHCYvM6Wh2
         Q68Ry79cBMNmNF8Sf9+NilP/BX9oUOAxoR2Wo7qox1Jhb0XDWdLtJoyYaaqlt3pvpIz7
         Gu0qj3aOipxoWt5He67hXTuS+vx6wSy2Tst8iZ/MiZmqld1ITS4VVdqr8oNzEsHg6mQY
         rq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1JRuWJ7YYErp16ra6/aTueBqyTSuuQEJxBI6IJWR02DB4Fw8i03IDZZxkAq9AhMym0YAzMhmigfHKq1o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoiwhueur44+e5Q7D1IdAIVGS49S9aFhDRtpyFMvZz8CkW9MzE
	K9Q5d9C7mS1GMpUQ3uau4dlvdu4//vfv3jLEjipBUYOCE1UTmiXS7tau2Y7pzw+Cw12iymuWWJ3
	L82Q54Q==
X-Google-Smtp-Source: AGHT+IFUqriEnNWkji09+BChNslJUIhYxFT9jFxGPtzLHIA6YRE0+DT7QXaOh2FImmCJKdJLSPcdpVpP0l+G
X-Received: from pjoo16.prod.google.com ([2002:a17:90b:5830:b0:2ef:82c0:cb8d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5251:b0:2ff:618c:a1e0
 with SMTP id 98e67ed59e1d1-306dbc3a097mr2703541a91.29.1744179071202; Tue, 08
 Apr 2025 23:11:11 -0700 (PDT)
Date: Tue,  8 Apr 2025 23:10:37 -0700
In-Reply-To: <20250409061043.700792-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250409061043.700792-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250409061043.700792-11-irogers@google.com>
Subject: [PATCH v4 10/16] perf intel-tpebs: Add support for updating counts in evsel__tpebs_read
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
index a723687e67f6..f648fca17556 100644
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

