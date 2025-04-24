Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DBD292903
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524729; cv=none; b=obIYQHJylUose8Mgt/fc9VzV2rO0qsDzC6V8W8UcsXPKgdPBnSOuYXKaiZRkhQK3uJuQIMH028gPOfJ7qapslgwib3bbQ0zV6aI+Lz4O+BNBuGh/feLa2sB6dh/jadQKZtW4oglQ9PzgbGaHHwaUGYIpA6/aM/yj6iWiPTFFUYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524729; c=relaxed/simple;
	bh=OaLxK4NLbXyEfAebTw11HHE5mdZMWIyyvPjgkEfRWm8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=vFCrdbPcf6TPUtbXC9Wkv4COupFzck4YiKo42BQ/rOaqrtNMAfeuHuEHbiIcRqds54CpGqAHq8lkWiNd0abUj+KGEq5XkQDMivWuKjpI++FZtAtRM3EWvwati+Uq3G7KxHVxQLfjgddjv2G9wzn1IHdHxphlMu3YxVoPdMYJsgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uCVx8LHu; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uCVx8LHu"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3082946f829so2065265a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745524727; x=1746129527; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f6EGtFLa98WxK5zCboj+6ZTniMk5Dl/euWdE2ssUAQs=;
        b=uCVx8LHuOC3ACf9c8vDjdsQUONB/SMsQEc7WZRlvOI5r5Kvd/UrKuG1gbolFkl9uMa
         C7EPNTCKoTLSb3nj4T49qdNKxvoR6bQ/7m+VGfvWLgxDWnxj1s/HqNqWO0o4fuhlsO5+
         DDgwEak7WALozpJNz9m/s2UrST8yfg+ZrUHHQoVCVNldECYmtT4Avs4Pf7q218+2KM3d
         5Kfq56nKfRDiiYo2kGi9o4jZk1kfzVbiUdEhBKmYKG4mkPvTPV7LTDd7B92j6BkhjmnH
         fEztFw6679UOuXpKXq5M7i3Tm8UhsIJYzkbX6mTUPHxaSu51phNN6vv5U2J3GnWJB3rX
         jwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745524727; x=1746129527;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6EGtFLa98WxK5zCboj+6ZTniMk5Dl/euWdE2ssUAQs=;
        b=TsIwn95XPRtC39Zxlx3r6NaaytiHHA5FU8MhMM5Sx2yl6DGLOMkX9zGRzpYAgBhlQ/
         nZHEqijkHSpYbJIpaWswkj1YfJxGgIhoJeD167YaVZrmRnqgQiYsCGwBKO8iVIRTb+4I
         6lAysgqTDeAbfqojFj1aXzsBytRZCxq1N3YR3nwb+8HSjEZPZknfdbbCM7DXb/CqD8jD
         SY3U+GUvdYxFr5aMSCufKbmYPyY+lcM7zZ+y1JETFjwK9GlAPoeYiqtSFkFArWNxPYwJ
         J8My2utEEKe5Oonrk8qIgt48PRrZB/+Zd+RpNC0JxJ9wd6JpRJf8XqtCJTZBd92TmOpD
         1yMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0/KG8BwvWLsC18PXXjb/n2gYXWCsJwfCxPuCXihI1p50PygkEt2CeLun/a99xBmwlnRcTMUlq0JhHOhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMWZD5qoaw55M7StSm7dbGUjOKVLx6Acsm2ChqfhinYiYJjEjo
	WCR2CwCO3dKRzLatb2cYWFqbBiUUB0W3EqwtR8Xc/eImYetlnmGW3VpROGs+1010T+YzPSDsDX2
	kUhw9Bg==
X-Google-Smtp-Source: AGHT+IErnjW8J+G6I95oLXzVEkKCdON5M0MwKECmLZsiPhxu3n6KAp9BtXdppA02RaXscM/Sq/sPrm4dIg3F
X-Received: from pjbqn3.prod.google.com ([2002:a17:90b:3d43:b0:308:64af:7bb9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c8e:b0:306:b65e:13a8
 with SMTP id 98e67ed59e1d1-309ed26dbaemr5523150a91.8.1745524727133; Thu, 24
 Apr 2025 12:58:47 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:58:29 -0700
In-Reply-To: <20250424195831.1767457-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250424195831.1767457-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <20250424195831.1767457-7-irogers@google.com>
Subject: [PATCH v2 6/8] perf build-id: Mark DSO in sample callchains
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, James Clark <james.clark@linaro.org>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Zixian Cai <fzczx123@gmail.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Martin Liska <martin.liska@hey.com>, 
	"=?UTF-8?q?Martin=20Li=C5=A1ka?=" <m.liska@foxlink.cz>, Song Liu <song@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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
2.49.0.850.g28803427d3-goog

