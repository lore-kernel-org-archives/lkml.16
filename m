Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EAC1DE4F1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178878; cv=none; b=eOPObOla/mDeTvQ2lDP5k3EOpX0uqtF4SGPEwzJb3gPZl5MvBFsAcuyMUmSU+/ks7Nw+amk2BTFw/uKQkYJOBDQaH3XnpIlrVu6kTgTQ1qI0JBoGRkTwp/4SgpNWrnj/mv60nFw+OhwfWU4XPh8Nqq5NFPaiKdYOwYQGcNAnkC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178878; c=relaxed/simple;
	bh=oTGRBpcL/2sIHNUD+/BM6BV/LmnMI5XK3yo3xDS6KyQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=QBrzShuTloXVHd81/LPGQ6J1zrM28LeBttW1Eb5jGxE8zMaiFx6KRJ/LxEzrZ9zso2Pyxmj8VrRXgq3Pw+tNzE0k2AkpwHQty1Qb5+58RGuiJcPgduCK/mJrXB68MiTeWfN1k0Fw2ZscsaE2nb30T1KEvLrxDbuFs0mVPC1IZug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FLXpEtnN; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FLXpEtnN"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-227ed471999so53483485ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744178875; x=1744783675; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pClnDyLnT+OkOC5ziZK4pcS5wTXzmuK+3iocOmka5vs=;
        b=FLXpEtnNxLWt9dne0GZ+mnmjKCStMKxSmJ3JmKswa9u6HCwj3Uct+1nufMxyQCzkyl
         Gsi0iuh+HQV87F2Tzfv2HNjuboi0Skgt8y+2mF4yNmNL9U1ycEoFlvss7XKSQz4CyvhE
         yim0ggSgMXPGgMoZhhw+Aqo/aF0MMVkvqhhhUT6OBHfKQ3Ddg99skoXJcYiwZqc2Q+/s
         nQFSpA38f3RtZtjgB89JMLobIJPhn7yufd9BU1fKE3av6OGOyzOU+pUsPA/BzFu6Sq4s
         FrDYKUN8oVKxUsm5ZwNA4eB33NqVcfzeg/NPkVo5/vVJlYrqUeJwIfs6HleHZQ+2lVx4
         uFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178875; x=1744783675;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pClnDyLnT+OkOC5ziZK4pcS5wTXzmuK+3iocOmka5vs=;
        b=Pt4dXUyzyXGqhXXKZ64UstnrC5mEDUzvYpkf5J4wtbCiQWKNxNZOaTD9/PRyh6etEv
         G74oaNz17ZrtSpjk3plkhjRNpJ6dIQXboPyXwT70+T+CIDM50Y1HjAXChMk8OKzRL0bx
         DnzPvPQaO7jJN3g230kFe43PK0f9HfXdlQASK1cOLa6BK68zB8XMiIoOJWzNWUsuX+gP
         hxKW3ASBL9VEJ++JL2KdhwUdsUl6eYtpknfH4plJyaQWwm2wpuwXG+uectos/asW7iaR
         PUqZPHH5iwGr5mVXlxXNJUlxh0hU+UIhFyjb2jO8Ynuhqb5y8P54ZmXl7Bn4Rjm6dj4Y
         MM+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZH6ru5jyv99l1MM0vtbzs5hOTLYINAqee5GyRaHi7YtvjobvoG48TyLfen5JYRDxP+E3l8aAD+aO4fXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJtF4rDDah+/AvhmdkmDWJXD92W2tUpSHCqZ+YRHruzp32O71Y
	UOLoR2ZKoCmDkWUuX+XPNkzi0OetPF5eQMtaKTZIe5X+eyuIGZEh50VqNlitbyMLyQ3HtdeNzMS
	JcX7tzA==
X-Google-Smtp-Source: AGHT+IEDzxJvPRvCwd5uXhzLPWUQoc2F9jgGiMHYHy0Yf4lHZZIfXolXPCitAeiMp1B24JA3k+LAWUYq2fij
X-Received: from plg6.prod.google.com ([2002:a17:902:c246:b0:223:49f0:9077])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:187:b0:224:1c41:a4c0
 with SMTP id d9443c01a7336-22ac296e5e3mr19605125ad.9.1744178875499; Tue, 08
 Apr 2025 23:07:55 -0700 (PDT)
Date: Tue,  8 Apr 2025 23:07:28 -0700
In-Reply-To: <20250409060744.698511-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250409060744.698511-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250409060744.698511-2-irogers@google.com>
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

