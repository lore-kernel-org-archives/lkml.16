Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63C020B20A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749657743; cv=none; b=Eq1X/GPSgMkvCfJtQIAu3/eJdqx+eLbyuHnn/E52RYkU5c3Pfb+jBOHW78puwcDKX48eoy+Qr/8bmxhWoNgG2USzXnMwcrv33k8S9Tglvk+3a0HpMxRMkuDOtqYa7Le6hP3sWk2ziiJYt6MDMjGsqBobkvi0zdET5bHY67o4NnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749657743; c=relaxed/simple;
	bh=5UP/Uh+baE5hu8ZriWWaikkxKZ2IVDQvVgt8SzI9hYA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=C2XREv2KJeOsCDIOQaKJZEwTC5DiaVlvSzAd/2gyl8ATQLA4takVVXKIojMK0Ug9oublh9OksK3aNwfyGn7N4rv3jzwWXEETwZ4byE7WpUIwC8WyblN7Wt7pBXn3B9XvRTpfC0HaexWkE52K1CaDcuZeZVleXwvG1+RRgm64yX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=akjen1Kx; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="akjen1Kx"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-74620e98ec8so1002996b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749657741; x=1750262541; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PCZ/k0i1gq0AzAhn4fq1c48xkyywewYDsGvNpD6T3W0=;
        b=akjen1Kxx+KgU94Zmxx/Qoy8jrw/1UImb+pw/09WGwj67wNACR9B/PYbFzzhBqhjhy
         8RbgYG8OYU1GnF8WdBaaDXB3penr4v0bHAYbuR317qR7YS9IFhF4+hxIE5jFV4Qz1Ho2
         EbaWTuFmn9QJRiiC6e3ZYZ9T2FkLxOVF+fpgW34Qr9aVvDHECK+lIPdSi7ogy9ckQ5z/
         uCRe9AAssIC49+xcrjQ4lFx3Tr1eshEldSLFIbvt9GSNenhPhEjwWhhO1YZ6mrCCJUGl
         h4ravMsY3Jb6k4YXbHpXqLQiqcoPpEodP2bPCPdGjxMX+aIVkX4TR9O8FDoqBVTw8rLr
         mLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749657741; x=1750262541;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PCZ/k0i1gq0AzAhn4fq1c48xkyywewYDsGvNpD6T3W0=;
        b=Hd1X/TwiO7W6UHcxZujdjJ7QigjNDRAt5JpS7zECImc7sh6Pz85Pe/BVd9bz99EaTp
         HoWJ4ParbDjWuXvbReDHaKg5UOHMAqPKC1qterjahXDx+u04aVKXSKSLjJ43mX9lEx/Z
         suLrKCok36Z7BkYZMdBwCO5ZK0TeH7UFiEOa31GHVKUX8WnZguH4LaCNLza5Hxc2YEtP
         05PFcERoDpU9y4ofKR2MTQt4oY7huQgV2zX0IRuXyIz2DpQI9EgUDXzB6jADBspkLKox
         6o+nnyCTaugFdorn//gk7VCdJdp1PKJ1c7U8ZEVcbtLFVYcmcO4wjoU5Us9oxxs672U2
         wHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdbaxRU7V3VnHy/RxfBiX2SiqNh70AuJ1YPuRCGVoZwPT8FwhMJbqS5x4tx7DvSj/iiSXk2sWve3ibBwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuVXinJjWC37631l9qJfckQcvWBBwsv1YaTd+2HqATkM8+z81j
	78aN1a3YdEcazjt9/1E+vzF6kr/EQ86z1XaZYeUiAJOmR7Zk2IF8abXqJsgQ/zLSM5rnuqRky1r
	8sNJgD4kf8Q==
X-Google-Smtp-Source: AGHT+IG0ZLZ/nkBWVfSY6dXkVV2WwCDI0h4rjtwWi23plFtJ5RNDkDznvEK6svyIfsqMxVXo7kX/WVBqL1tz
X-Received: from pfbih24.prod.google.com ([2002:a05:6a00:8c18:b0:747:abae:78e8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ac2:b0:740:58d3:71a8
 with SMTP id d2e1a72fcca58-7486d292d6fmr4653966b3a.1.1749657739944; Wed, 11
 Jun 2025 09:02:19 -0700 (PDT)
Date: Wed, 11 Jun 2025 09:01:56 -0700
In-Reply-To: <20250611160206.552030-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611160206.552030-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611160206.552030-6-irogers@google.com>
Subject: [PATCH v2 05/15] perf python: Correct pyrf_evsel__read for tool PMUs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, John Garry <john.g.garry@oracle.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Howard Chu <howardchu95@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Andi Kleen <ak@linux.intel.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Gautam Menghani <gautam@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tool PMUs assume that stat's process_counter_values is being used to
read the counters. Specifically they hold onto old values in
evsel->prev_raw_counts and give the cumulative count based off of this
value. Update pyrf_evsel__read to allocate counts and prev_raw_counts,
use evsel__read_counter rather than perf_evsel__read so tool PMUs are
read from not just perf_event_open events, make the returned
pyrf_counts_values contain the delta value rather than the cumulative
value.

Fixes: 739621f65702 ("perf python: Add evsel read method")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/python.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index b724478fe34a..201fe04fb6dd 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -10,6 +10,7 @@
 #endif
 #include <perf/mmap.h>
 #include "callchain.h"
+#include "counts.h"
 #include "evlist.h"
 #include "evsel.h"
 #include "event.h"
@@ -893,7 +894,7 @@ static PyObject *pyrf_evsel__read(struct pyrf_evsel *pevsel,
 {
 	struct evsel *evsel = &pevsel->evsel;
 	int cpu = 0, cpu_idx, thread = 0, thread_idx;
-	struct perf_counts_values counts;
+	struct perf_counts_values *old_count, *new_count;
 	struct pyrf_counts_values *count_values = PyObject_New(struct pyrf_counts_values,
 							       &pyrf_counts_values__type);
 
@@ -914,8 +915,35 @@ static PyObject *pyrf_evsel__read(struct pyrf_evsel *pevsel,
 			     thread);
 		return NULL;
 	}
-	perf_evsel__read(&(evsel->core), cpu_idx, thread_idx, &counts);
-	count_values->values = counts;
+
+	/*
+	 * Ensure evsel's counts and prev_raw_counts are allocated, the latter
+	 * used by tool PMUs to compute the cumulative count as expected by
+	 * stat's process_counter_values.
+	 */
+	if (evsel->counts == NULL) {
+		int nthreads = perf_thread_map__nr(evsel->core.threads);
+		int ncpus = perf_cpu_map__nr(evsel->core.cpus);
+
+		evsel->counts = perf_counts__new(ncpus, nthreads);
+		if (evsel->counts == NULL)
+			return NULL;
+		evsel->prev_raw_counts = perf_counts__new(ncpus, nthreads);
+		if (evsel->prev_raw_counts == NULL)
+			return NULL;
+	}
+	/* Set up pointers to the old and newly read counter values. */
+	old_count = perf_counts(evsel->prev_raw_counts, cpu_idx, thread_idx);
+	new_count = perf_counts(evsel->counts, cpu_idx, thread_idx);
+	/* Update the value in evsel->counts. */
+	evsel__read_counter(evsel, cpu_idx, thread_idx);
+	/* Copy the value and turn it into the delta from old_count. */
+	count_values->values = *new_count;
+	count_values->values.val -= old_count->val;
+	count_values->values.ena -= old_count->ena;
+	count_values->values.run -= old_count->run;
+	/* Save the new count over the old_count for the next read. */
+	*old_count = *new_count;
 	return (PyObject *)count_values;
 }
 
-- 
2.50.0.rc0.642.g800a2b2222-goog

