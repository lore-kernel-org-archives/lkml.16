Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78182ECE8F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052279; cv=none; b=LS+qfK4HOWenmhYrN6h3dE5QmWmQmYmqPtl8Cx7AP6wG8bzSpjCNk2hNSj0AUl6R6hbosgyW/CSslLb3bsXwa3cFzTmf/3bE+154DCxH0psgqsJLHCuiIOJk5db5yFPahs9+jKCgvWWLpkXh/5J9blmDV1b7Q9Pzpm5iNOIspcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052279; c=relaxed/simple;
	bh=lgYxdkzJdj0+0t5WyUgo4PCHs3tbjzs842Cp3cxBP/Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=FAWCoKKxlEn064Uo+qr/WtZNXO5pvfhv3sdUKnQpRH13nI9b3uH3FI/jx5oI0uHKdCX/hDMWq7xAgtRbbSL0C2ckNdLlAaQaeKLEUPwLuLYTcW8Yjrk1cThdVMOC8g4uNmPDE5Uf5ZHvGuYjNSbtzqOkBuNQ9u6cvF3uwf7LcwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gw8m1d2T; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gw8m1d2T"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b3184712fd8so204940a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751052275; x=1751657075; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdEvbWob6zhzrdFMiDw/dSDXdj7k9xYWPtf9BpTTpI8=;
        b=gw8m1d2T5MEz7f/d5Fsjx7e+ygRpE2dOPgjhQoLLOXT2hnC4VwdNeBx8mj7FA+Gj8N
         E315TGITOjUsv+EYq+yc0NyFxJ8pEOdxKTtaWv1T7zMm0DdZ6fFtJw43bfzXWDKlH0Hc
         Ue9yiXe9BXvegdzsAJhDQihxxiywa6l1nuuWhYWc4cfWscDHxwQpXlzm7SFi+Gm2FWKc
         lgRxZqRzyxhrYEyYl0cz9PG6RJTOCWadGnI3BHqu424t3i3+3A2SJhSViBhLLCOsgLp0
         AzI9/BT9id/O5BxYTOOTEiCxdVee0lq8yMzwmuajIGv1Yp4e8+YR74D8tO/Zz6E4/sLl
         54oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751052275; x=1751657075;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdEvbWob6zhzrdFMiDw/dSDXdj7k9xYWPtf9BpTTpI8=;
        b=pYvji2NFD3eGkjFOGeqaiYNz2byllvem5wCPgmTr7T5QF+6MNKTSVoqnZHbCZN2KT2
         phAoRJXRfJd4Xwfc17f24hywKfg+PHIq2X7QnPIimhi7SQmtJfcI9PKQf4PYry9vAFSv
         Sh07kBA+h5xraS4SAUEefE2WIIrmzdIiTyp8y0yGacsCzgEcx6zi4F9qXXh1dW8pyXxR
         TmwkiXFFRx6r7fVKEbzKKvd+y6XWbzWol2alP90/1ZMITmD/QNvMqUyNmR3a1h7ufWH/
         6x/xW4JJjkKsc11RCrWutDaARoApNCIQeeK290Ri47qgtrlNhJc8vnGvrurDzGjrChw2
         V5WA==
X-Forwarded-Encrypted: i=1; AJvYcCUVkRl6lsUKKULb3II0uJs3P2X7lO7x/ONHQncKMv4IwseEVreC/53qmqted4lgmei17VkD7LB5rh2Twoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YziAm7g2MHNtkEmGKJPZ+0677Gv2pMyy40tnYFpebrJHQGgLubi
	wDOmWrt3vnmoEA9x4rCaENe3KpMtBcwzAliDZclIgMd6nCUgfst7VCY+P4PxWl6XVjPMoKTP4UQ
	0Pz4iuytVqA==
X-Google-Smtp-Source: AGHT+IHaVlcHMhPYb35nHDGk44Oi5XKnOLvZEee26fFWEnJwjvFGPUo6h1rXqkaQAH2aOY6DuQV+FK19EpdO
X-Received: from plbjy7.prod.google.com ([2002:a17:903:42c7:b0:234:dbbb:e786])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3bc8:b0:235:91a:2c
 with SMTP id d9443c01a7336-23ac463e5fcmr68496205ad.42.1751052275409; Fri, 27
 Jun 2025 12:24:35 -0700 (PDT)
Date: Fri, 27 Jun 2025 12:24:12 -0700
In-Reply-To: <20250627192417.1157736-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627192417.1157736-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250627192417.1157736-8-irogers@google.com>
Subject: [PATCH v1 07/12] libperf evsel: Factor perf_evsel__exit out of perf_evsel__delete
From: Ian Rogers <irogers@google.com>
To: Thomas Falcon <thomas.falcon@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ben Gainey <ben.gainey@arm.com>, 
	James Clark <james.clark@linaro.org>, Howard Chu <howardchu95@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Levi Yun <yeoreum.yun@arm.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Blake Jones <blakejones@google.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Anubhav Shelat <ashelat@redhat.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Song Liu <song@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This allows the perf_evsel__exit to be called when the struct
perf_evsel is embedded inside another struct, such as struct evsel in
perf.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/perf/evsel.c                  | 7 ++++++-
 tools/lib/perf/include/internal/evsel.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/lib/perf/evsel.c b/tools/lib/perf/evsel.c
index 127abe7df63d..13a307fc75ae 100644
--- a/tools/lib/perf/evsel.c
+++ b/tools/lib/perf/evsel.c
@@ -40,7 +40,7 @@ struct perf_evsel *perf_evsel__new(struct perf_event_attr *attr)
 	return evsel;
 }
 
-void perf_evsel__delete(struct perf_evsel *evsel)
+void perf_evsel__exit(struct perf_evsel *evsel)
 {
 	assert(evsel->fd == NULL);  /* If not fds were not closed. */
 	assert(evsel->mmap == NULL); /* If not munmap wasn't called. */
@@ -48,6 +48,11 @@ void perf_evsel__delete(struct perf_evsel *evsel)
 	perf_cpu_map__put(evsel->cpus);
 	perf_cpu_map__put(evsel->pmu_cpus);
 	perf_thread_map__put(evsel->threads);
+}
+
+void perf_evsel__delete(struct perf_evsel *evsel)
+{
+	perf_evsel__exit(evsel);
 	free(evsel);
 }
 
diff --git a/tools/lib/perf/include/internal/evsel.h b/tools/lib/perf/include/internal/evsel.h
index b97dc8c92882..fefe64ba5e26 100644
--- a/tools/lib/perf/include/internal/evsel.h
+++ b/tools/lib/perf/include/internal/evsel.h
@@ -133,6 +133,7 @@ struct perf_evsel {
 
 void perf_evsel__init(struct perf_evsel *evsel, struct perf_event_attr *attr,
 		      int idx);
+void perf_evsel__exit(struct perf_evsel *evsel);
 int perf_evsel__alloc_fd(struct perf_evsel *evsel, int ncpus, int nthreads);
 void perf_evsel__close_fd(struct perf_evsel *evsel);
 void perf_evsel__free_fd(struct perf_evsel *evsel);
-- 
2.50.0.727.gbf7dc18ff4-goog

