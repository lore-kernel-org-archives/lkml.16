Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9936026739A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743709441; cv=none; b=rbIjykDmPj9FoNttm2AbtAH5AFmy7S4pPyWPuF/aV/J4lgPNC7wRObdeJByn8aHNln8mIxRC7HDDx8bYjAqQeLl6eJyvxdCvTVQkFzA33Qbvu1DRlRRvawoNLSNoPERcNPgHnma6TK4TEwj7sGI+1wE7hAjq44ItL/oKt+itDqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743709441; c=relaxed/simple;
	bh=T+mzRhe6HKJiK9RRzofrD2YayCT8Ai2sVKhFqc9XRqQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=bDbwoY0jlkW1xMGeY5wkWBdXJ190kcpir05wXpukKzJzG5hDHOeebxqkYbXRvsvV4zbFkSK8i0tx2OjNv0SqyC7XncfFM4qrk+aMadr3VxZ9mDN1YGcPaShnGXWxk+lg2DCw7VMiDivTNfYPvEirc/K6DphaEjEn6DU+ywoPT/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BBFNDvmB; arc=none smtp.client-ip=209.85.167.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BBFNDvmB"
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-3f6a46c4dd9so925835b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743709438; x=1744314238; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oigN7fX14J5RTgizOqqAZQvGiIy12HcnQqfSi7qOEf4=;
        b=BBFNDvmBcyckxZHNSwYYpVs3vmxDMOoVUv3SewLs2gsx4IUge3rdx40S1fCRTf4qso
         K7coq2Ar4rvSHox/YW+uCXpNMyrATJYKhPRWc2ZDzLfeJytu8AGLMpekrx5VkXcb9IeR
         JqnWzwI5dYd4JrjWFcY9hxh1QN/zZwfhmJ78VN0INgzwTQK5T79CkKKMGlcSsIXdwDlX
         /5ykxpIFEpguD0E2guJ198Hcug2QCXQyD6u9gR83tdv1324rAd17IT3N8WzULJeCq+3Y
         BAff8V4vHOMxgxLYZhO9JOofncvUFRqBaCkKnj4/9403TkrtH3MTBmeycVGn9lpiW9+b
         wyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743709438; x=1744314238;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oigN7fX14J5RTgizOqqAZQvGiIy12HcnQqfSi7qOEf4=;
        b=M01aN/lGb8GJtgP89EEorOC+xWXv8iSV6VdLkhvV1xBhJbCRWSSHV9Guyw7MDENcW+
         tr23Zt84pfj0Jzvikv/XFM+wosQbTuuWBcKefJk4/w4366eFpHm2eSWsfQX17aw49Pl4
         DUEAyCc+SKj/yPxcIlPoCv5Y+X3QDnF2+I/BzDM3UiD5vlyyJYrUkdXiXw1cgQT96cyn
         ZJPLFnOipHe0Uy/kqPawXKD5qS8k26S3q9G/iF3MGCHSU6cGF6R1Pfk/4Gu3SVrt5FmG
         LiAjz72cW9JkKlPhl/WMrsNXuENgrjZ2fuLKhw/SfA7TyFUrpP/vJn5QDHslRc1VjudH
         nZHA==
X-Forwarded-Encrypted: i=1; AJvYcCW8lsXvNFsKepHse7yRhcn/qCbC5YDFzgfiZPFbAUnzRKK8cunmyqTTAJZHAZx3RH9vgiI/IuvshxblkMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGvetYaTIneBOQdG4RC9W9O3M71xqfub5pjFAV/n0mp6gERf+M
	z9/h2iD6WhKrp1AKFx0XKN6oaSHmgUVFqRHsMItqs1x9wmTN6A0jXTHzBesMoa2TOwPRu15UZhS
	/rsWRPA==
X-Google-Smtp-Source: AGHT+IHrWF+kytFlHDMFjo7g+NYVgwa4HX8kGshwbl7Hc5qiy2oO5icw6WuvqDkWkj/KvF+s474GgtiK7jIf
X-Received: from oacny23.prod.google.com ([2002:a05:6871:7517:b0:2c1:64e4:adb9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:6418:b0:72c:4032:76f
 with SMTP id 46e09a7af769-72e367f05ecmr667407a34.12.1743709438610; Thu, 03
 Apr 2025 12:43:58 -0700 (PDT)
Date: Thu,  3 Apr 2025 12:43:36 -0700
In-Reply-To: <20250403194337.40202-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250403194337.40202-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403194337.40202-4-irogers@google.com>
Subject: [PATCH v6 3/4] perf parse-events: Set is_pmu_core for legacy hardware events
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

Also set the CPU map to all online CPU maps. This is done so the
behavior of legacy hardware and hardware cache events better matches
that of sysfs and json events during
__perf_evlist__propagate_maps. Fix missing cpumap put in "Synthesize
attr update" test.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 37 +++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 5152fd5a6ead..783177c5f140 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -232,21 +232,30 @@ __add_event(struct list_head *list, int *idx,
 	    struct perf_cpu_map *cpu_list, u64 alternate_hw_config)
 {
 	struct evsel *evsel;
-	struct perf_cpu_map *cpus = perf_cpu_map__is_empty(cpu_list) && pmu ? pmu->cpus : cpu_list;
+	bool is_pmu_core;
+	struct perf_cpu_map *cpus;
 
-	cpus = perf_cpu_map__get(cpus);
-	if (pmu)
+	if (pmu) {
+		is_pmu_core = pmu->is_core;
+		cpus = perf_cpu_map__get(perf_cpu_map__is_empty(cpu_list) ? pmu->cpus : cpu_list);
 		perf_pmu__warn_invalid_formats(pmu);
-
-	if (pmu && (attr->type == PERF_TYPE_RAW || attr->type >= PERF_TYPE_MAX)) {
-		perf_pmu__warn_invalid_config(pmu, attr->config, name,
-					      PERF_PMU_FORMAT_VALUE_CONFIG, "config");
-		perf_pmu__warn_invalid_config(pmu, attr->config1, name,
-					      PERF_PMU_FORMAT_VALUE_CONFIG1, "config1");
-		perf_pmu__warn_invalid_config(pmu, attr->config2, name,
-					      PERF_PMU_FORMAT_VALUE_CONFIG2, "config2");
-		perf_pmu__warn_invalid_config(pmu, attr->config3, name,
-					      PERF_PMU_FORMAT_VALUE_CONFIG3, "config3");
+		if (attr->type == PERF_TYPE_RAW || attr->type >= PERF_TYPE_MAX) {
+			perf_pmu__warn_invalid_config(pmu, attr->config, name,
+						PERF_PMU_FORMAT_VALUE_CONFIG, "config");
+			perf_pmu__warn_invalid_config(pmu, attr->config1, name,
+						PERF_PMU_FORMAT_VALUE_CONFIG1, "config1");
+			perf_pmu__warn_invalid_config(pmu, attr->config2, name,
+						PERF_PMU_FORMAT_VALUE_CONFIG2, "config2");
+			perf_pmu__warn_invalid_config(pmu, attr->config3, name,
+						PERF_PMU_FORMAT_VALUE_CONFIG3, "config3");
+		}
+	} else {
+		is_pmu_core = (attr->type == PERF_TYPE_HARDWARE ||
+			       attr->type == PERF_TYPE_HW_CACHE);
+		if (perf_cpu_map__is_empty(cpu_list))
+			cpus = is_pmu_core ? perf_cpu_map__new_online_cpus() : NULL;
+		else
+			cpus = perf_cpu_map__get(cpu_list);
 	}
 	if (init_attr)
 		event_attr_init(attr);
@@ -261,7 +270,7 @@ __add_event(struct list_head *list, int *idx,
 	evsel->core.cpus = cpus;
 	evsel->core.own_cpus = perf_cpu_map__get(cpus);
 	evsel->core.requires_cpu = pmu ? pmu->is_uncore : false;
-	evsel->core.is_pmu_core = pmu ? pmu->is_core : false;
+	evsel->core.is_pmu_core = is_pmu_core;
 	evsel->auto_merge_stats = auto_merge_stats;
 	evsel->pmu = pmu;
 	evsel->alternate_hw_config = alternate_hw_config;
-- 
2.49.0.504.g3bcea36a83-goog

