Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952E0183CB0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 05:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744002073; cv=none; b=jRqJRXnzZ/1vBZ0Hz9h8XiMLh+qKFTtE4e4aAf/SA8rZM9UN7aRoDr5lP3zfF9vtAYmRIfetbKQjakbiuGfVuUsiXqDSafAunR6zF2vGWP7VxNo5on92n6LhRx9k+kPIIJKPWPHxAnloQzLzQQebmvG5GDtb9FzwyF6NCv8d8x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744002073; c=relaxed/simple;
	bh=oTGRBpcL/2sIHNUD+/BM6BV/LmnMI5XK3yo3xDS6KyQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=lcroLb3h1X2J7J5sGEGmLXUQgYpPJo3lEMLbc86TNyO7x9K7efbVH6NDRxCJJQsduH4wbEx+FVG6/9z/77MHxHhlI1fzicALUJCcPFjJatwgIN8zyaRUN1vIgD0k+9wmloQ4Di9w6g5tWG51vKLX+PezmXXtaTnIiBFyWiPZqFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OOrxBJBa; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OOrxBJBa"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-225505d1ca5so33478175ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 22:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744002071; x=1744606871; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pClnDyLnT+OkOC5ziZK4pcS5wTXzmuK+3iocOmka5vs=;
        b=OOrxBJBa5y8DxC9IHKI8LS2ReAl02ZJXELuGJau/kfwRoTlWFNmll+iOlgA6a4INqe
         da2YGLRGLak3OgvEG6ifVsaANBbm6ZtF4yyFwHDBuwwXlTPCLEIn172TLWQYuWXKAw/f
         nbPHdbHY/r8B/LvdZt6e++Ii2qE6AL543HSyxPx1jcQHYy2FVq7VWDy4JUYA/zo4DVdq
         t96gYbkm0H2AtFugVFz4rxAbIRHjZVfuOR45o81qtJJ1YXBIW6Byw+UlQ/H/5+zOjtsY
         HncLl+frBUux+4v5SDoCZ83MM11cT+E/5JnVH42bsBk1GJ0ux1tCb4azWVbDTKOIjkyX
         l1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744002071; x=1744606871;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pClnDyLnT+OkOC5ziZK4pcS5wTXzmuK+3iocOmka5vs=;
        b=mTy/74fVrmskQKDpOiMbtVxHhtLGHgAsfF8yc0+rYnfxblYBrkPUTxAbsUH3QRsvH5
         Mn+MOOiyhgC8QKjXK8ZB2suk1Av9XMsAfYw3mJH0TYmeiMhRodYWiRckZJydz7G0tfE/
         TM8LZCdTfHCXIpfyriWbpcThw9Nn6REh3/cRkHEoe+vjwZv+CJQTUHhvaNMtjJcckd8o
         a7kMCee/2IYnKPOJ0yFOsenIyJ3rb8/xLQtxWwwDcWsN31csiYO3iEJK22fR1GFG36kF
         33gUAVkm0IsY/MkMOWB592f7f3yoai21i//RTSN5brzQeZBqIolGdLRb3wtIC53mgUNn
         MN5A==
X-Forwarded-Encrypted: i=1; AJvYcCVwGp3Mdfl99z8DcFO/4Oc8BQ5xRP2mJwvXGoYY1WGLnQGWubd/rHUIVIyeZMjWundt4Vb4QXLPKY9p3fE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSC2+f8ccp1Jwrl4S0TNEIDQKy/ZtQWWEnHeYZK7IVlqiSkcnG
	0Q89Il9dQ86QUmO43ZVq3VhaEQXEZ6RgtdDcwhC0/Fal9D/Cuz9z5gS6Eq4A3AqrardjwYWGl9l
	WyPZo/w==
X-Google-Smtp-Source: AGHT+IHtXYrhzXX5JxDuzoW7tJBuh4QL0x7CroaLG2+rZjoBqiO7OwMRkspeZawt4VsOgtX+FEZKpBCnt1kK
X-Received: from plbmf5.prod.google.com ([2002:a17:902:fc85:b0:227:e538:4d17])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d48a:b0:220:f7bb:842
 with SMTP id d9443c01a7336-22a8a0b3707mr133401375ad.42.1744002070815; Sun, 06
 Apr 2025 22:01:10 -0700 (PDT)
Date: Sun,  6 Apr 2025 22:00:46 -0700
In-Reply-To: <20250407050101.1389825-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407050101.1389825-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407050101.1389825-2-irogers@google.com>
Subject: [PATCH v2 01/16] perf intel-tpebs: Cleanup header
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

