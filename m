Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D4D22B5A1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744779098; cv=none; b=XdyhrD9DZaoOsh5FVqYXSCeFhZOu26XcyOEFgUO5ccZPQ0lP91cPFrsKw2JXojjcEFnriefrLdDzLhe6Hdg4SqaZjAdpK8etTD6pyP7DULMfsb2MWDpHnamuKjbALHNQc8lc+W8M9rgk3CikTnugOLkF39sOIlDDZK8TwwgZ0mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744779098; c=relaxed/simple;
	bh=ZOTsHlfTpSL/Ly5DC6zov/N/ZrnqIeX3TnDUs6l3nhc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=Mg8OFC55HHmOGkpp/5w8cMAYMRX39Ord2CySEj1KHSHz9GxcH4iqkORUD12XrP2Ba7tDg5kqkEeUs9cRzwAQzBmCw29uF0JXTO8xGSwfTt6sEiYybUfkehruXYVtLdBT4bNgsvK48fkATIBhJuysZFQoEUTNt8P6muObDGngDgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ALyIc9lm; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ALyIc9lm"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af91804dd0bso3889528a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744779096; x=1745383896; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qWGXJXdrT9sF0I7mA7+F4IJQ0dt51AALQlFzat3VGFk=;
        b=ALyIc9lmsya7hbSYBGhFkjjikTAy914pDgFnU+vAidHMd4d2elxqc8EAMz5nYh3BGI
         iqwNP0vXImDIjM51BSBBRre96DBO/MpOr/s4yM2HicNqHJZdI2pCehr3heRjT/h7g/4D
         ugtGFhMY2axdl86/xFeRmsDQS9A1ZmifdHJUaI1igchCciM6PfsdmGY3xP1l+E3RzuoD
         w1wE+F8CTxS/m+GFsVUc2VkKbkGiRF8KSpoSZ3rEqAmW7Lz0GaUjEOpArdqUhulv5oas
         ovZu9CYtDxSocOeINqhTCg6uOwFZn+HvvbN4oDHgqhoVem5sWyG3flp4VUnoWcfYqPhC
         ESrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744779096; x=1745383896;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qWGXJXdrT9sF0I7mA7+F4IJQ0dt51AALQlFzat3VGFk=;
        b=qoCzTbEuLxpIiBXJgkPP3Hm/2akn1I9qbf3huwSIhltpGlIObZLmGyY7aeZj4wkWI2
         8HpzV9iwFKFVzmFGSHGkUh+ZZ+5+aEsOkbJmzfn4oILhCZGgLqAj3U26l8UG6jwq3Z7F
         bYwiVfei06YN2c/lEhb0rb+ZW7u50FeUeMWZ2OAu+MW0B1wQI8oSre4zefgMUpm9TQlc
         Y2tlr+lAfIKgzci4az1Tnnr3N1XHEYmuDqUFfJXiFJL6QUAw/GOfcjFhisfIuU6N/Jjy
         M2sgy2ulzvgRazKcYytmYK+nY3XqsdzjgX0vA1ahb7MQsquu4UHp7qOZkmPYzQx3DmJW
         0YWg==
X-Forwarded-Encrypted: i=1; AJvYcCXPfl3qNspwVtwM7bMK/hwQq7FN4vj4wwpkQO8VWy1+pRt8a69fkxVgoTtOjFEQaISjYRu1DjTzJ8xvcz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJxijR6GYnPOTCkvWyLGcnSeU2RKIXgeNlCf8dywH0+SfU0a3z
	uaP2kYwH07Gv3bBbyFtdtxHg63d/iZeO+oukL18kuQGGNTIV6lT/zdnRuY7wV2mqRG/JlNIPGga
	7AjxN3Q==
X-Google-Smtp-Source: AGHT+IFzs+p393a7mxlM3r7qnHxaFIdEo/RP9id0OjOQIRti4PH7xmLH1y5HCxIonfQ1rdoHNlT/H3fbkkEy
X-Received: from pjzz8.prod.google.com ([2002:a17:90b:58e8:b0:2fa:15aa:4d2b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:6c4:b0:2fe:84d6:cdf9
 with SMTP id 98e67ed59e1d1-3086415d88emr495438a91.26.1744779096558; Tue, 15
 Apr 2025 21:51:36 -0700 (PDT)
Date: Tue, 15 Apr 2025 21:51:17 -0700
In-Reply-To: <20250416045117.876775-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416045117.876775-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250416045117.876775-5-irogers@google.com>
Subject: [PATCH v8 4/4] perf perf_api_probe: Avoid scanning all PMUs, try
 software PMU first
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Ze Gao <zegao2021@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>, Leo Yan <leo.yan@arm.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"

Add PMU names when geting events to probe. The first is only ever used
but by not specifying a PMU name perf_api_probe will load all the
PMUs.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/perf_api_probe.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/perf_api_probe.c b/tools/perf/util/perf_api_probe.c
index 1de3b69cdf4a..a910cde4d78b 100644
--- a/tools/perf/util/perf_api_probe.c
+++ b/tools/perf/util/perf_api_probe.c
@@ -59,10 +59,10 @@ static int perf_do_probe_api(setup_probe_fn_t fn, struct perf_cpu cpu, const cha
 
 static bool perf_probe_api(setup_probe_fn_t fn)
 {
-	const char *try[] = {"cycles:u", "instructions:u", "cpu-clock:u", NULL};
+	struct perf_pmu *pmu;
 	struct perf_cpu_map *cpus;
 	struct perf_cpu cpu;
-	int ret, i = 0;
+	int ret = 0;
 
 	cpus = perf_cpu_map__new_online_cpus();
 	if (!cpus)
@@ -70,12 +70,23 @@ static bool perf_probe_api(setup_probe_fn_t fn)
 	cpu = perf_cpu_map__cpu(cpus, 0);
 	perf_cpu_map__put(cpus);
 
-	do {
-		ret = perf_do_probe_api(fn, cpu, try[i++]);
-		if (!ret)
-			return true;
-	} while (ret == -EAGAIN && try[i]);
-
+	ret = perf_do_probe_api(fn, cpu, "software/cpu-clock/u");
+	if (!ret)
+		return true;
+
+	pmu = perf_pmus__scan_core(/*pmu=*/NULL);
+	if (pmu) {
+		const char *try[] = {"cycles", "instructions", NULL};
+		char buf[256];
+		int i = 0;
+
+		 while (ret == -EAGAIN && try[i]) {
+			snprintf(buf, sizeof(buf), "%s/%s/u", pmu->name, try[i++]);
+			ret = perf_do_probe_api(fn, cpu, buf);
+			if (!ret)
+				return true;
+		}
+	}
 	return false;
 }
 
-- 
2.49.0.777.g153de2bbd5-goog

