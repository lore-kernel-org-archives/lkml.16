Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019C84C6C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 00:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751069378; cv=none; b=kK4OAJEdcDJHwssIatoq7v6c9v6WGpvDlYTi07/XEbVVdzuqjyximXHkfmq1WkE6PsNdqcjlmsnuaAbf0HR8/mQss67fBNp8geDeCR1XC6b+hOQBAEUUFNUEEL7s/3I7vUqkbGmHnwjQ0mynZHglEh36D5S+a0kGGL0Gs034Nao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751069378; c=relaxed/simple;
	bh=2GC+gz3NU/TsQzR0IgAKnBmtJMBkRxMKJ10VQOb4VUE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=R9KKVtvJ88UacWsJiixf8dWwQ8d5qPkT5GXldtvcqUnNdJCyxviLnubu97gSOfipGpieKtSc5lv2eDipUrB/s++63wPWhpBj0pKSrUmcc903YlZhUy20B1sgs8Da22tbZvxpSrwA+TwQ9T3o9ih6B9HSn1FhAoyeeEE3jUjjHtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IznjzVJb; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IznjzVJb"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23638e1605dso690575ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751069375; x=1751674175; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FeoLfxu6vl8iu0oh1ON8hijy8JrvEUox5uGVMnB9N0M=;
        b=IznjzVJb+I52tkmfFQVjuywt0wWpMz/91DTviwaAVxrbsFEfczg0gpTzJnBcaf8YN7
         X+P0OuiGI4K0ZtKLsMukwgE8I1pzPl4Qw96XeCNTJulgUHhd3yZIKUu0onfuU2ysVk41
         epcE/vYRJoCJBBOfQ3pJ63C+nRXbaP086r1sToOUL+HX7mhzZwENmaYE8LtjlqqByqF3
         IPqPeI963weO62ju0sMiW52y5lVVUALw2hb2Ggd9LzDwJFUWxDxJyga5vMREslQYBhKB
         JPyU6NLkrH8ATrZGENOt2OzcHUwr1OZVaXNfBCsecaMsyPfo6Q102PAEK7aEj9sl22+5
         nKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751069375; x=1751674175;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FeoLfxu6vl8iu0oh1ON8hijy8JrvEUox5uGVMnB9N0M=;
        b=uQx1HmNxShaqvoK8SRvREgcQbJTclTwvxfHVp5q7XAX0MQdEttcdPpdDbLhbdFnMES
         q7epCAhSSZJF+xJls8wj9/E9If6ahYpxJzeL1zUPGbnEhfbbW+StS86a1Qdt3vKcet3u
         b6nJ6SIClnxtxPOgl/H2KXeIpLmxgm4mBEOLYi/Z3O7zqBFEIoU9qJ4drGxfv1SJeKaG
         DhQSGke/I/ifO9U9yIclGR1Emle0bUVYAljWobV0SIhTIJy/iIytSrPa0agJHpuFpCde
         DsF6VQWo9fIoC2zWZdfFeP5w30iAqZzoicA2Iq3oBzU6lxyI7NBGXLdBxyaSrTAyI7r/
         MyqA==
X-Forwarded-Encrypted: i=1; AJvYcCVwH995j/lfdlqLZkRCQD+9Nc4r/ZXllrH+bdRNlKnptjlt9dWEukVuQWalCZ77YKgTi9PvQXOXc8ZPEX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxstjXS/EaMTxo3stuOSrP9EqWQYc4JtwEsKqOXfZMZIyTXm8wm
	2b2+cXHIt6rp6Dtk2efOJMnRElDWbLD/bO5q+fDDNrO5VtRHbKMwHDVoG/pWXke35V3W58EiN6n
	p/CXgQRzYVw==
X-Google-Smtp-Source: AGHT+IHjF3eVZ4rb+9Jd0Y0bCQYcJEukiIKzVekz1mGzbrQ6INpOqjJFImlq0ucLFt1Eu8t6Qi1Is8EUx6zl
X-Received: from pjn8.prod.google.com ([2002:a17:90b:5708:b0:312:151d:c818])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a67:b0:234:8a4a:adac
 with SMTP id d9443c01a7336-23ac3afda4emr57508945ad.20.1751069375191; Fri, 27
 Jun 2025 17:09:35 -0700 (PDT)
Date: Fri, 27 Jun 2025 17:09:15 -0700
In-Reply-To: <20250628000929.230406-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250628000929.230406-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250628000929.230406-2-irogers@google.com>
Subject: [PATCH v4 01/15] perf hwmon_pmu: Avoid shortening hwmon PMU name
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

Long names like ucsi_source_psy_USBC000:001 when prefixed with hwmon_
exceed the buffer size and the last digit is lost. This causes
confusion with similar names like ucsi_source_psy_USBC000:002. Extend
the buffer size to avoid this.

Fixes: 53cc0b351ec9 ("perf hwmon_pmu: Add a tool PMU exposing events from hwmon in sysfs")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/hwmon_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/hwmon_pmu.c b/tools/perf/util/hwmon_pmu.c
index c25e7296f1c1..75683c543994 100644
--- a/tools/perf/util/hwmon_pmu.c
+++ b/tools/perf/util/hwmon_pmu.c
@@ -344,7 +344,7 @@ static int hwmon_pmu__read_events(struct hwmon_pmu *pmu)
 
 struct perf_pmu *hwmon_pmu__new(struct list_head *pmus, int hwmon_dir, const char *sysfs_name, const char *name)
 {
-	char buf[32];
+	char buf[64];
 	struct hwmon_pmu *hwm;
 	__u32 type = PERF_PMU_TYPE_HWMON_START + strtoul(sysfs_name + 5, NULL, 10);
 
-- 
2.50.0.727.gbf7dc18ff4-goog

