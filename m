Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2562A2918D8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652543; cv=none; b=GNrZbGaUSSh1R7EIEWfm+jKJt8K+W664LZOtSLVfNjpvjpmgWMaYaaX6XPjJH2j2Wy0KRAVJVIMr8nh/iUfcBcdF3kboaCMp0ngaWShQjdY6Du0Y3pCSAHHpwgPzQ1UDavCvm4IxZU1ajle7k1qwxzvOxx9DIVnpj39NpyYobec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652543; c=relaxed/simple;
	bh=XQBjLpvUcKT1rbTwpwSIA4ZEcfX1eZFeIrszq9/gIZc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=cpMGEk6Ci9KLlve8VXWi5kiy2umgtdME8/t3sb3BGY5Uzw+ZLKGGaaEJrJIdlGZ1DNkuqSDVpjk0RfBsZjEe9hWjBaUVF/67D35uWxkJU5GWb66lUCVWuP/uNr6HU3ZfLH7pPqSXkwZ3z616wOZE3f/J862b7dImbhprFI9FOHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=luR06qGR; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="luR06qGR"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22647ff3cf5so37372285ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744652541; x=1745257341; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3YaC980+r1nZ2D8a7F/BKfpCPrV+UZzeRb3LiqHQpw=;
        b=luR06qGRNmLjcrXzsgdBHMATB3ggM3StNV8KU6HYDlJPCGpHYkHIRccwNVzEiW9QHp
         4fwfKmeBd9/7Wsy2pxjrzjFMToqzP0WtWf/sDNSBQs+sWugtXc4ozGvmFPGMDEmVZzo0
         7tOOBtxU7CRS6UzKRDzNLhvGg5SFNzBz8lIN8hjpl+mLAMHOnJOx8jwwCrJxqKigIPhj
         0Ne4iUq1pRrQFofpz1gqJZlVNYJi7lSSgkqDRKfgLIQV16WCp25rT982K0g+KrExJlCb
         CYVx5o5F9X7tXlX5Yj3ZEZzU/53gI98KqHrBn8AKRUy25ekYAIhuvEgP4xbNjedyETmm
         SwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744652541; x=1745257341;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3YaC980+r1nZ2D8a7F/BKfpCPrV+UZzeRb3LiqHQpw=;
        b=nbt3qeEBl1A1zK6pEOISzIEm612JKl2uNrrNf05Qzt/osGWaU/t6OiyP7tf4WwgbeR
         zYzabWTzVtWWUnMYCw7GTL345o+FNppX0WVZPcal94hi57lc+AZMkqiCSyCsKPJ4bRGj
         53HfegTV1EC/4mQLL9RIJUVTG6xYFeDs+L9rTB7Bgk7fsjv7PunoA4BNJuD8tG1fXWDc
         CuDxvedLhNnN6Xtu/naMnZnTF5hSDkW0ShrXkSVivJAj/imDTm1QlEPXbKxmuATfxSVk
         Hop1nhnLdF7jANnCJsy6Ll/XkPDoy8EIraz13T+Bx3YSxg7LSMk3px0l/r5A0v6JcgRC
         DhXA==
X-Forwarded-Encrypted: i=1; AJvYcCU2eI3QuHMlaiatNdJUJkpbjuo1io1XGBJEiNmww9di2CxeVPxaPPesSBHlF4HV/Cloqeo7DjdcL2/yFzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMghdreOlpZrvAS/eZhMLprBphBzPh28pY0Pi/zxGEWTGGfwEH
	OMgU4iCc8rRmxnBSufe9UAKv4Z13WFNwOACQsleYyzkjNH1UtoRRJ+J+IHfNLh798nBUwteCX7C
	nVh/YQw==
X-Google-Smtp-Source: AGHT+IF5D6jK1ghfd0t52mg85WD4BqRqb97G15GYc+m35//A00eC8Z31mPAniL9z9mLgfFeaaxaeb3nP3bkJ
X-Received: from pldy12.prod.google.com ([2002:a17:902:cacc:b0:226:453a:f2db])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2444:b0:220:c813:dfd1
 with SMTP id d9443c01a7336-22bea4f398emr184470065ad.36.1744652541411; Mon, 14
 Apr 2025 10:42:21 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:41:31 -0700
In-Reply-To: <20250414174134.3095492-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414174134.3095492-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250414174134.3095492-14-irogers@google.com>
Subject: [PATCH v5 13/16] perf intel-tpebs: Use stats for retirement latency statistics
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Caleb Biggers <caleb.biggers@intel.com>, 
	Weilin Wang <weilin.wang@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Perry Taylor <perry.taylor@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>
Content-Type: text/plain; charset="UTF-8"

struct stats provides access to mean, min and max. It also provides
uniformity with statistics code used elsewhere in perf.

Signed-off-by: Ian Rogers <irogers@google.com>
Tested-by: Weilin Wang <weilin.wang@intel.com>
Acked-by: Namhyung Kim <namhyung@kernel.org>
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
2.49.0.604.gff1f9ca942-goog

