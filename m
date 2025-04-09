Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EE41DC991
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179056; cv=none; b=nBklLcOHm7Gvz3ATH7NucVNxIpmYhmqvkUb5pjndk7NKC/oKTMYyVLW2j99rJLS04z8ThhVQ/hE4H9uVN+RbAw7v37qFNJvapz2VDLL57yLf+qlWZTWdx9jwoBAkvMSM/Z3nmyMLEPnbtqo+CO3B/edpyy2lDbw1jgR+soa5GAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179056; c=relaxed/simple;
	bh=oTGRBpcL/2sIHNUD+/BM6BV/LmnMI5XK3yo3xDS6KyQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=EcCsmV7imSsuy5EjCZeM2asr3UDy40qhiHm2quAD+4PDwHBXa5WynwGpxN+S1UiSCfcKCHqZ+G/+hKh/Qdmpol9eL7oscUR3VGaiL65ki/29yBqF8ZyqJqI4gCkfwGzdwqZFZ/L03W5WeyCQUfu5xtncmUA86nxWafk9whFwuAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=utc5F+p5; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="utc5F+p5"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2241ae15dcbso75124375ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744179054; x=1744783854; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pClnDyLnT+OkOC5ziZK4pcS5wTXzmuK+3iocOmka5vs=;
        b=utc5F+p5i8vGgDi7rk2VOnkRn2aBXxGKW0y0hlcIOKmS6h9rFaCVAp5mXDPNj4dYy0
         QK+w0IzcgZfmjWjJhn58gozjTMjwtLbUSuWazE2cMhezg57AT5pNiP6vxPAkDMJvFOr8
         dLi60j4BzYhvbk8uUege1ntniM4wSq1Rwqb0OqcMgj3XIgfjgKF4s3kLVPMHRdmGJ7g3
         7B+R04sIgUfNWRbrlLzmc36knsx2QkB5HuYCh7K8EfAz2l7FrXds5r2cGhowwDYT32Zq
         GNpPd+91DsZpK/jYvfa1q5jC7WiPa59v1kvfagiZGdstBVvmlMscl1ouYxcivWH1t8mG
         xhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744179054; x=1744783854;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pClnDyLnT+OkOC5ziZK4pcS5wTXzmuK+3iocOmka5vs=;
        b=Fy8ywh25tz1S9ycbo/12NAVo6ZISfC5vLwNZ4BqVO/wKYY1j9i/ljDpDgvEj6mxu9M
         f3IGnsYUGXwuSE8BVLh7nzLNXVuvhHsWnoJkjiJVs/YQ4wQI3gxv8fG6Xa5WwawSKGrL
         j5sEemKil+lN+85N418gicw9a84PA4N+wIErytGxQwH79iIuRUzKpWcYHgK5VahDlO2i
         sB3NKmJ1y9sJ65Bv23Cdg52CGES2RxNHDIZnJq2YUX9B6ZtsN/BsUD5JneXjaiTEEhGm
         Zzgm1qoeViIpRF4KB73btRtJKABUF5rWSkAdIF9Stj60qJT2xCiln+KIeyNqxsLlHc+M
         /RxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNrMWgwtM6H8GG13hp+fd3aPoEJMUb6vUbCAk0Vz+57bBcxi/KqwgzdvwkydzewV99fP6cB4ZhRg2w9yw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGUQuxmt/UquwGUcbXqquQpiVZSp1QNqxm5vXYCgPhjcsJx06V
	cZvoswnKiW2SE2xFSpRq5wj8xzXWaX35YAZCOrYTqY5+RGZyN9A/tgJCupXvuhstcrn6TidKJic
	77zjrUA==
X-Google-Smtp-Source: AGHT+IHJ7OZd30Pwnp9LWB65mMC8ePjlrwbBobAW63Dt1IVdQiKqKLmW2rrxhqIOsCAyzqlVhIjp4+dUdqxj
X-Received: from pjtu11.prod.google.com ([2002:a17:90a:c88b:b0:2f4:4222:ebba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2acd:b0:21f:1202:f2f5
 with SMTP id d9443c01a7336-22ac3f2dd64mr17492915ad.8.1744179054277; Tue, 08
 Apr 2025 23:10:54 -0700 (PDT)
Date: Tue,  8 Apr 2025 23:10:28 -0700
In-Reply-To: <20250409061043.700792-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250409061043.700792-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250409061043.700792-2-irogers@google.com>
Subject: [PATCH v4 01/16] perf intel-tpebs: Cleanup header
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

Remove arch conditional compilation. Arch conditional compilation
belongs in the arch/ directory.

Tidy header guards to match other files. Remove unneeded includes and
switch to forward declarations when necesary.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/Build         |  2 +-
 tools/perf/util/intel-tpebs.c |  1 +
 tools/perf/util/intel-tpebs.h | 30 ++++++------------------------
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 946bce6628f3..815274b199fd 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -161,7 +161,7 @@ perf-util-y += clockid.o
 perf-util-y += list_sort.o
 perf-util-y += mutex.o
 perf-util-y += sharded_mutex.o
-perf-util-$(CONFIG_X86_64) += intel-tpebs.o
+perf-util-y += intel-tpebs.o
 
 perf-util-$(CONFIG_LIBBPF) += bpf_map.o
 perf-util-$(CONFIG_PERF_BPF_SKEL) += bpf_counter.o
diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 2c421b475b3b..3503da28a12f 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -19,6 +19,7 @@
 #include "tool.h"
 #include "cpumap.h"
 #include "metricgroup.h"
+#include "stat.h"
 #include <sys/stat.h>
 #include <sys/file.h>
 #include <poll.h>
diff --git a/tools/perf/util/intel-tpebs.h b/tools/perf/util/intel-tpebs.h
index 766b3fbd79f1..63c16e759a71 100644
--- a/tools/perf/util/intel-tpebs.h
+++ b/tools/perf/util/intel-tpebs.h
@@ -2,34 +2,16 @@
 /*
  * intel_tpebs.h: Intel TEPBS support
  */
-#ifndef INCLUDE__PERF_INTEL_TPEBS_H__
-#define INCLUDE__PERF_INTEL_TPEBS_H__
+#ifndef __INTEL_TPEBS_H
+#define __INTEL_TPEBS_H
 
-#include "stat.h"
-#include "evsel.h"
-
-#ifdef HAVE_ARCH_X86_64_SUPPORT
+struct evlist;
+struct evsel;
 
 extern bool tpebs_recording;
+
 int tpebs_start(struct evlist *evsel_list);
 void tpebs_delete(void);
 int tpebs_set_evsel(struct evsel *evsel, int cpu_map_idx, int thread);
 
-#else
-
-static inline int tpebs_start(struct evlist *evsel_list __maybe_unused)
-{
-	return 0;
-}
-
-static inline void tpebs_delete(void) {};
-
-static inline int tpebs_set_evsel(struct evsel *evsel  __maybe_unused,
-				int cpu_map_idx  __maybe_unused,
-				int thread  __maybe_unused)
-{
-	return 0;
-}
-
-#endif
-#endif
+#endif /* __INTEL_TPEBS_H */
-- 
2.49.0.504.g3bcea36a83-goog

