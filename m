Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918A61494A3
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 00:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751069387; cv=none; b=dIDUCfYfLKsWph7gGzGMRZeKpjoYccNYB1PdAjt8pVbo5YyW0i1J1z9nwC26MX2WOJArcpCZiHe3hEutWReqojjxqW49tgAd0ilcmXi+tSrbvNNMX/TL51tVU2il5ZlwiLv2/G5v+mCTcKPFKb5arvX/YVB/0VW7GMJxWuvsD5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751069387; c=relaxed/simple;
	bh=fo0r240oHzpIwxpAOm3xs8m1o38s6/S9m0BaZW72G60=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=K+pYCF5G2Xre2wgDVxHHPN/Ka8IjFXR5dsfSV380UHl6TM6NiYToX2jehioswSIPPmbLWKUGkKBXlJHPgoipI7USq8SNnb548mv9OKQc6mn+fK8wMpIKrImIYCHXng26BmE6NCkNTqqTK0jZEx2SvZFiqvogNx4ErIjx2XP2feQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4GJvbUOO; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4GJvbUOO"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso859555b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751069385; x=1751674185; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rfCNuQAe9HbC089g4sg7a1ik2VZAO1ML1zW0HGkG2nY=;
        b=4GJvbUOO/Q5qDTKf1kdkzxtkGkLQFiQmsEQaxWjmTE7C4UVSbSvwGh6OV6GQcwrvFD
         11QO4xRVpQlBWXUiNm5xbeuSht7UNPuURIW2X98h0Hd5Kt/K1sMb8WqlvxhegdYq+Ei1
         q5KrUkV0+ghp+8OHrDTM71+byXx3AAqElKoOz3FpeF3SRWmGBFBIxnec3LJOgdiZRntk
         AkRx9tCNhCfLv6OKfn3yuGhbpjqCfgp4cupVBil05Xqr2wTGohLQedXvXNhlnzwqbx60
         k3JkzrKzQbLO3FDVnlNuHeJ/oWDebHo7KE884Szzx3IiPdYFWs6SLO5bKNGG6iD44kgn
         9/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751069385; x=1751674185;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rfCNuQAe9HbC089g4sg7a1ik2VZAO1ML1zW0HGkG2nY=;
        b=F66GZBnKAXg7+i/mkBKZGQnWTT+Ug1acHXPMY3hBZdBzTxAXS3aWN2ow1xhFDTf3RN
         FtLicJCadvbV+90cKAbum13P09vt6cSkP0xcqJ7ITG27dd1oyXGmuUs9QEBtv2foO7OR
         rAj6RHYlD7OXPsp/b7MfsbTy2iPxayfN+1cYFZFHgvKDXmr19OZB1OCzF8HkyBGeNOgo
         XnXDc2Kiq4LvDQc9NHwK7pPeaSmlatActPuuLrgQWzgsoQjuA9gjbH69LNSfVXipSBe+
         +cfY4Nu3L2DuciXcT+xn45818xromleiBb0Q/5p/c3GoWlBUns9FzycbLbBeLZQ0uzsi
         Pk/w==
X-Forwarded-Encrypted: i=1; AJvYcCUjD1ox3+t4NkLHQXK9/3v50JK9RcnO/CYiul94OkAZVKMz3GirO2XaYhWiWQWzcxVHH+nhHDfXW6Z5eTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxedwDmLWqzjDtFRHzgTaDB7Mb72x2MICA03JSB9fXQp7nB09eU
	vpy5+iYLu/3Q4a3NpznOrsrHXxT9NWxSW/2N1crwQsJ60LM7MR7J027lkLL81U5diTw0Thu+OYV
	k7FCb7yPgwA==
X-Google-Smtp-Source: AGHT+IHYrPuyNcxRNZkv92pYoCGxK6FD0ZGQWmWeIIB811AyLZuxmsar+jXhV4T0x/m8l+FiUYUiW35A9qh5
X-Received: from pfbiv27.prod.google.com ([2002:a05:6a00:66db:b0:748:ea16:c7ad])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9194:b0:1fa:9819:c0a5
 with SMTP id adf61e73a8af0-220a1277105mr7507317637.11.1751069384940; Fri, 27
 Jun 2025 17:09:44 -0700 (PDT)
Date: Fri, 27 Jun 2025 17:09:19 -0700
In-Reply-To: <20250628000929.230406-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250628000929.230406-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250628000929.230406-6-irogers@google.com>
Subject: [PATCH v4 05/15] perf python: Correct pyrf_evsel__read for tool PMUs
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
2.50.0.727.gbf7dc18ff4-goog

