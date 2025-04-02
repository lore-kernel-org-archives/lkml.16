Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC66194C61
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743612450; cv=none; b=SMIb30qZlXSo/uNOD43Db6yw9ooWtYWCaLwHkjqWdp8v7DWJXIvHvEhMSPycPIonTnlQuAnWK0Rc17CA7q22oYGfOtoSnVxwnsQ/KtaLsb61TN40233tjaUZL3lPB4OYBH+wuaPaN0zHT4Mu6t04Sal/ScaBi8ION7WX4iQL9zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743612450; c=relaxed/simple;
	bh=NqnWpcdFkNGPmqWCPNT6GGaIm7Gc0q9VpwYczE12dRI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=jkDqTwgVUajV9zJdWiF4TmsOWo3/xV7ajRNuWSlSOLz0770fMPdPQq5cKp+/LfQ4g0S0o078y6dpGmctyZYdH7xjoe59Dwk1jtaEfAR0yZLlQmDGN827zj3UerM2VyMZvYxQrJeqBFd+On50nB2puYFm4gyPdz8JfT9zndQVRTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DZtx6scp; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DZtx6scp"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af953100791so32254a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743612449; x=1744217249; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVMZzaRI0SYaZ9HIFXqjbn9kAaASuQl6uCuXVUyZL/Q=;
        b=DZtx6scpFfBz8rSgUPbSLmPQCvHPoa6efBBrD7egb8evAyZ1DXZOmunPS+VQ5SV528
         5XESpzmHGrRoeKqXwBXfFOKKtg7TbqUVbCjIVo0YL55ArhNXNULC3oE72CxNOXd4uMJ8
         KjoPSvmxSHQmuxSqossSOe2VA6Li+4SK7hKcAP1MCZVrB4+vgCACIxpeK19MIobPn170
         qpxqRyuZ642Vwfq2m2hfw3MyAvQkl+aDbBbVOUaRgu3C6yR/TrivX+SIwubPZVUF/Hc+
         E054taC6TgALqAuSRi3yZkL4lO98cIgKt2TSHqxWJH0Idkv9oyBOrpL6QVFab/3sjd6V
         ZbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743612449; x=1744217249;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVMZzaRI0SYaZ9HIFXqjbn9kAaASuQl6uCuXVUyZL/Q=;
        b=Mmv69gtjgPoSr8OgZ3YfmdFlYJj7xH0Wr1bEnWJvSsFF1N43+V0jBJoEECN/DRQtsa
         D5ozJs2qEpsV6YBkEFqDO8WlRYO2O45xvi2NaG2vjsXgz8+oq/BxevPiQ3gSpS1D12VN
         vVrZEJZURvT0IDR6OBYRNOqb3OptFCBQj3idV4MPcINIiMGFnfNFaZuCSOVQIK0R/LjG
         wGbcBlLm4PsQgdXDpXS8xWb6hbGwTz7QgyWF2dw4+gsAr4CPN+yRGhfkRwRdAjPy5Vkk
         DJcDXXB0VedMfvfdMbFCWAfmlcbVJk/86rLBjb/54le6LQg8liMxfeeXxldlPMV2TpdI
         hM1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0G4YCzHh8e7JNzS8WZl3f1sY1woCSobwytGe048abHk/59hK02S//eddFFlHcwEi1CtQp9MghqYx1w1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEk8cOnkYHCHkPzapWh0rjJH7HverMNLPGwgcWDGOImOzahYuF
	QJQRp+QtViANj4v3O9nYndfgpQLxLJcMfsGqkzUf4K4Lrn4Nv6V3ftMNg0Y3OIb7n8kvWjPmfRW
	6HqaiJQ==
X-Google-Smtp-Source: AGHT+IGGJmZgIYf85aQoyCz2a/j1TJQUoHxYvSUmi17IBOewaANMK1sOAl6iEA30oqxeC5Z9G95o7Gt5xxAV
X-Received: from pjbqj14.prod.google.com ([2002:a17:90b:28ce:b0:301:1bf5:2f07])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e4e:b0:2ee:e518:c1d8
 with SMTP id 98e67ed59e1d1-3053215ce9bmr27226504a91.30.1743612448791; Wed, 02
 Apr 2025 09:47:28 -0700 (PDT)
Date: Wed,  2 Apr 2025 09:47:17 -0700
In-Reply-To: <20250402164720.3847573-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402164720.3847573-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250402164720.3847573-3-irogers@google.com>
Subject: [PATCH v2 2/5] perf stat: Remove print_mixed_hw_group_error
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Levi Yun <yeoreum.yun@arm.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Andi Kleen <ak@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

print_mixed_hw_group_error will print a warning when a group of events
uses different PMUs. This isn't possible to happen as
parse_events__sort_events_and_fix_groups will break groups when this
happens, adding the warning at the start of perf of:

  WARNING: events were regrouped to match PMUs

As the previous mixed group warning can never happen, remove the
associated code.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/stat-display.c | 31 -------------------------------
 tools/perf/util/stat.h         |  1 -
 2 files changed, 32 deletions(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index 1115efb380fb..aab3697aed63 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -798,30 +798,6 @@ static void abs_printout(struct perf_stat_config *config,
 	print_cgroup(config, os, evsel->cgrp);
 }
 
-static bool is_mixed_hw_group(struct evsel *counter)
-{
-	struct evlist *evlist = counter->evlist;
-	u32 pmu_type = counter->core.attr.type;
-	struct evsel *pos;
-
-	if (counter->core.nr_members < 2)
-		return false;
-
-	evlist__for_each_entry(evlist, pos) {
-		/* software events can be part of any hardware group */
-		if (pos->core.attr.type == PERF_TYPE_SOFTWARE)
-			continue;
-		if (pmu_type == PERF_TYPE_SOFTWARE) {
-			pmu_type = pos->core.attr.type;
-			continue;
-		}
-		if (pmu_type != pos->core.attr.type)
-			return true;
-	}
-
-	return false;
-}
-
 static bool evlist__has_hybrid_pmus(struct evlist *evlist)
 {
 	struct evsel *evsel;
@@ -886,8 +862,6 @@ static void printout(struct perf_stat_config *config, struct outstate *os,
 		if (counter->supported) {
 			if (!evlist__has_hybrid_pmus(counter->evlist)) {
 				config->print_free_counters_hint = 1;
-				if (is_mixed_hw_group(counter))
-					config->print_mixed_hw_group_error = 1;
 			}
 		}
 	}
@@ -1587,11 +1561,6 @@ static void print_footer(struct perf_stat_config *config)
 "	echo 0 > /proc/sys/kernel/nmi_watchdog\n"
 "	perf stat ...\n"
 "	echo 1 > /proc/sys/kernel/nmi_watchdog\n");
-
-	if (config->print_mixed_hw_group_error)
-		fprintf(output,
-			"The events in group usually have to be from "
-			"the same PMU. Try reorganizing the group.\n");
 }
 
 static void print_percore(struct perf_stat_config *config,
diff --git a/tools/perf/util/stat.h b/tools/perf/util/stat.h
index 2fda9acd7374..1bcd7634bf47 100644
--- a/tools/perf/util/stat.h
+++ b/tools/perf/util/stat.h
@@ -100,7 +100,6 @@ struct perf_stat_config {
 	int			 times;
 	int			 run_count;
 	int			 print_free_counters_hint;
-	int			 print_mixed_hw_group_error;
 	const char		*csv_sep;
 	struct stats		*walltime_nsecs_stats;
 	struct rusage		 ru_data;
-- 
2.49.0.504.g3bcea36a83-goog

