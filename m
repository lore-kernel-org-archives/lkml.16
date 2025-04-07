Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046812561A5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 21:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744060247; cv=none; b=chyVmjfW4vYgbhywxSf6NRHQaWnIr4LquHDdBGJos3SIpq9lFyP5TbhFkpPWfI37r3CLAlEaOjMASITQmtRu3nuCiq/TJHQkIdzUmqJr13gpZ9V9Fi1C9Wr+FRl3K5PV8NcxvE78tr+NRNZ+1ho13xfPDvNPxffzL90kqzU4KgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744060247; c=relaxed/simple;
	bh=DOdUTxLI7/zQjgCEpln88RgVE7J5L5+nYgmvVB4LmPU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=ZL/DwHzHJeUG/yUvI1r5SQsj23E/lVs2zxEJOiYHkKX5X6WSREsDprNxdCegC4xhIiWsHKKYQu1EvA7DyJHuJiWqJkR5g+f5p2OjaXJCthYTIzar+jk5quJmlCvy/sFQIBXTY11Y5tyGEDhNmLxmPiZcKCMi1GiodaBQ1bzoNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CCEP7HrN; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CCEP7HrN"
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-72b881599f6so4481612a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 14:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744060245; x=1744665045; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bbV+FoNiQvVRc13/UCAfNK3Jak/b5U1tJ5tpMxpqA0g=;
        b=CCEP7HrNwBRsKmyyVSru7yW+4opRoVEczz/hVTAnlXjP8M9MuBUJ0qcIkrkB5Iu7p1
         lQsQm/QGLdPJJ72rputOtaBQ90PSdIpa5FwCHmtGgl26YX/WsNWk1jjWEDyOgMGFEZUX
         GAHkYzXMBBxYrwNqe4BRR4DUSFTQ2vZgqQW50QS8CsjTJGsTuQsvJfNBCXKL77DOvRSE
         FESa8h7Pg8Ve4s8QD51wnGSrc2TyzWR7ceNUme/X/zkGsmLgTTd4Yi/vrwDWWUFh8+Si
         wUSPklJvK82AgPKa5t5dbOWKttlKO0Z9vuXDK+m8y3B/V5XtaapyBYZpdV568tuHx+r3
         CVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744060245; x=1744665045;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbV+FoNiQvVRc13/UCAfNK3Jak/b5U1tJ5tpMxpqA0g=;
        b=i0uZhHZNaQFSgGpOB0mTiKCwPbFGFcWB+/KQp8qvxj0MCFKMTZxQipGHttcIfXrhA3
         rZWIKN+SLpW8Vhjcl9GWrLqzs4DccYC8DVdP4kpZhNUVpIw+u6nb1XuVOwYQEovd4KEn
         aS14btcYaE5xf1WLbOXDUngN7srS7mzMcm/8o1mY82MNNiUDlFOXc2WwbH4e+JMSj+ZS
         s21kqLi0pWarzSEh0y5jl8JR7g80TH+xzSGHW7T9L8Xh5AcIpXo9SK64Rf60sQjZ8HXU
         IjapaWNFWw4R44wNj+HTBpNlCZJ3TXtAdg6ANDonOZGskrPuQ89l3kZwYaEq6rUMeZBW
         ex3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVu5h+z9RhYG5H/SjTwOYOXwT9Py+iAtr61YcsmaJLMd6BuDYdZBFrBAvl+39PytY+WVH/UA+dT/RurqNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2/jLKLQLtajg980QxD5YCD3AXa26uTsJJyGeC21eUUtPION3z
	MFpesz4Mzznpmi7fOzagkrouTHJViHuk+AXZ0rUXEkXlRIe08oxlirVOPf1YcckdV2FVmqMSQGd
	qkbYj5Q==
X-Google-Smtp-Source: AGHT+IHvSiuBOO02/UbSYhhz96i5QSBrJEvlzEK8IJSZdcVPKNE6XbUiOCTXlBXY1mne4J6Eb41byqs/Fhez
X-Received: from oacsc18.prod.google.com ([2002:a05:6871:5e12:b0:2b8:e26f:1d53])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:d8c:b0:72b:87bd:ad47
 with SMTP id 46e09a7af769-72e366b0c07mr8386588a34.3.1744060245194; Mon, 07
 Apr 2025 14:10:45 -0700 (PDT)
Date: Mon,  7 Apr 2025 14:09:34 -0700
In-Reply-To: <20250407210937.131681-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407210937.131681-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407210937.131681-14-irogers@google.com>
Subject: [PATCH v3 13/16] perf intel-tpebs: Use stats for retirement latency statistics
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

struct stats provides access to mean, min and max. It also provides
uniformity with statistics code used elsewhere in perf.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index a9446e7a1c5c..de9fea601964 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -18,6 +18,7 @@
 #include "evsel.h"
 #include "mutex.h"
 #include "session.h"
+#include "stat.h"
 #include "tool.h"
 #include "cpumap.h"
 #include "metricgroup.h"
@@ -42,12 +43,8 @@ struct tpebs_retire_lat {
 	struct evsel *evsel;
 	/** @event: Event passed to perf record. */
 	char *event;
-	/* Count of retire_latency values found in sample data */
-	size_t count;
-	/* Sum of all the retire_latency values in sample data */
-	int sum;
-	/* Average of retire_latency, val = sum / count */
-	double val;
+	/** @stats: Recorded retirement latency stats. */
+	struct stats stats;
 	/* Has the event been sent to perf record? */
 	bool started;
 };
@@ -145,9 +142,7 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 	 * latency value will be used. Save the number of samples and the sum of
 	 * retire latency value for each event.
 	 */
-	t->count += 1;
-	t->sum += sample->retire_lat;
-	t->val = (double) t->sum / t->count;
+	update_stats(&t->stats, sample->retire_lat);
 	mutex_unlock(tpebs_mtx_get());
 	return 0;
 }
@@ -522,7 +517,7 @@ int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread)
 			return ret;
 		mutex_lock(tpebs_mtx_get());
 	}
-	val = rint(t->val);
+	val = rint(t->stats.mean);
 	mutex_unlock(tpebs_mtx_get());
 
 	if (old_count) {
-- 
2.49.0.504.g3bcea36a83-goog

