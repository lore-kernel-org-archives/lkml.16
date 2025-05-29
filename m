Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260DF252296
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748493618; cv=none; b=j1PGwBRNBbgNK1X46irR4rQxrbkkJ2yxusksiBvq51OQtDd1C8WchtiC4B64NuZtG2B3FdRgQvUuRZWjWFofaJswOg2EAAcNzQVTHEBg0k7Azv2r61+aD2Ld3Him7beZ2xrlBIWrZPlm6Xbs24H0WLgpz7NvTEXCTb3xZF3uU1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748493618; c=relaxed/simple;
	bh=8sjuAjOj2orpAYr10kkA5Z/nzFBBjR+5CoUq/1YdQGA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=kL5fnLuTwvuhPoZqK7xPUWqkTJ+zKwfzLHJjR9DRGbRoVQ07UlIni7GHX/nATbpTTy9emxRLh/BNmifbhbR6oD2WBF6ZUPB5Fo9x+dydWq2j488CE32e1nOPU1FEyJ3PQyLMGE3B/WvHvYSe7A1jVRbf764wr7oTMvJtrW/XbaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hA5dK5me; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hA5dK5me"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-231d13ac4d4so7625295ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748493616; x=1749098416; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3cc4XfHjT63tW0sHOE7oV+T/kyDzOGhrcNlU3mn958=;
        b=hA5dK5me8MybiChD+cFQ2wvGDS8mnZjvhADjQsPFDtCpGnm+rFIVhgsHb7aDPPnBZr
         OWfCLdf2dhBDxM87YtYGseGoNNB61ouxMTAon9/QBtMXP3lbKQC/kMWwH+zTRsA3dMij
         kokdgJeUd3LQuKg+XM3FBWETAgGIx4T/rM0gVk5wv/8EBEcBjEosF4uOHNal7Fj/zVzN
         9sfUjsI73zBADvJCE5oqjxYf20rE6Dx6f+2QLQ+mStLxQO4ABZPLTeQCiX7t6i5szeOg
         JgAk6iFpHzrLe3tMFUdHo4jagXEHoG2e8h98gJmXxMwoFAGy/5uBLDQ953JHrqYCqIgO
         Np+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748493616; x=1749098416;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3cc4XfHjT63tW0sHOE7oV+T/kyDzOGhrcNlU3mn958=;
        b=vqPQ5/bXBbLYJ5zoE5LbFyfjk7LUTWszICNOQek179E5PjAjZ1zm/U2u7/fQKh8DZE
         15v/cWTe7M9KLodE1V7hSaX+c+Rc8rxw6hnQfvcZZaqM+d1EnpFaQSEhhHZQOI+5D+0Z
         xWL8+DJGThV9m2kNaurct389mbslx3uw7m0ZVkUf0TKYDOwDeYdT/evyBt13/3uoBfxW
         WRwXmAgiXqnycArB61jrP7dm7aa1IB6zjIVtHZ6fIkXv5LUJHpnS9eCOxmJ2DBkskKe1
         /VOuuanHoMwUovCMwTqCsoZHqMsQR1ufSqc9HX1WhfvgFQaJ3X00K5TB7TqB0xIRVPbZ
         xIPw==
X-Forwarded-Encrypted: i=1; AJvYcCXNLE5KcIg+KKW3ev6sz3/+7Vqs29k5YIOZA3P7WgR0e2C+NSXEQvyv0t4BqqqTPpXBNOFLHMo1gmcAvRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLsBtK1A6xxBtnb3raZ2dhf9P4uUabJql+cOXpR75n5eckkj9Y
	Ky/o+lo4P6O5f5O9mazKJSCBeI9NS8PX/pS0KO/1WKvC6AsJs2fitY6aiuevWVGyUkJgSbccFgQ
	rny6fmydv0Q==
X-Google-Smtp-Source: AGHT+IH+nZZXQ1e5vfxdxY87E7j36c97TAZI0T6FIGcXkXjpMxDQyv++Eq5U9c3zbazcw0Gy3vnoxfpD0cNc
X-Received: from plbp4.prod.google.com ([2002:a17:903:1744:b0:223:225b:3d83])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1311:b0:234:bca7:2921
 with SMTP id d9443c01a7336-234bca736d0mr74929435ad.33.1748493616471; Wed, 28
 May 2025 21:40:16 -0700 (PDT)
Date: Wed, 28 May 2025 21:39:41 -0700
In-Reply-To: <20250529044000.759937-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529044000.759937-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529044000.759937-6-irogers@google.com>
Subject: [PATCH v4 05/24] perf build-id: Mark DSO in sample callchains
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Graham Woodward <graham.woodward@arm.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Zhongqiu Han <quic_zhonhan@quicinc.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Chun-Tse Shao <ctshao@google.com>, 
	Yujie Liu <yujie.liu@intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, Levi Yun <yeoreum.yun@arm.com>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Matt Fleming <matt@readmodwrite.com>, 
	Veronika Molnarova <vmolnaro@redhat.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Zixian Cai <fzczx123@gmail.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Ben Gainey <ben.gainey@arm.com>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, Martin Liska <martin.liska@hey.com>, 
	"=?UTF-8?q?Martin=20Li=C5=A1ka?=" <m.liska@foxlink.cz>, Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Previously only the sample IP's map DSO would be marked hit for the
purposes of populating the build ID cache. Walk the call chain to mark
all IPs and DSOs.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/build-id.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/build-id.c b/tools/perf/util/build-id.c
index aa35dceace90..3386fa8e1e7e 100644
--- a/tools/perf/util/build-id.c
+++ b/tools/perf/util/build-id.c
@@ -42,10 +42,20 @@
 
 static bool no_buildid_cache;
 
+static int mark_dso_hit_callback(struct callchain_cursor_node *node, void *data __maybe_unused)
+{
+	struct map *map = node->ms.map;
+
+	if (map)
+		dso__set_hit(map__dso(map));
+
+	return 0;
+}
+
 int build_id__mark_dso_hit(const struct perf_tool *tool __maybe_unused,
 			   union perf_event *event,
 			   struct perf_sample *sample,
-			   struct evsel *evsel __maybe_unused,
+			   struct evsel *evsel,
 			   struct machine *machine)
 {
 	struct addr_location al;
@@ -63,6 +73,11 @@ int build_id__mark_dso_hit(const struct perf_tool *tool __maybe_unused,
 		dso__set_hit(map__dso(al.map));
 
 	addr_location__exit(&al);
+
+	sample__for_each_callchain_node(thread, evsel, sample, PERF_MAX_STACK_DEPTH,
+					/*symbols=*/false, mark_dso_hit_callback, /*data=*/NULL);
+
+
 	thread__put(thread);
 	return 0;
 }
-- 
2.49.0.1204.g71687c7c1d-goog

