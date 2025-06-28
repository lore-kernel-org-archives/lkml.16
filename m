Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C942206BC
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 04:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086244; cv=none; b=kGm/6R4EhpSCsnTE+6viJ3DLz83T7vFfgy/p+ZNkF10Cyzo/raFkXJDKcmLQZCEDjfgzf4gjaWf29aVCJMW5PO7lUFXJs/Hg7INZTGJwvIAJTobg8iY+BXxRPo0gc93B+P6OXeeQ1VLpyu/dPMST+rMv262+VRF3x5JM6dqRMWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086244; c=relaxed/simple;
	bh=i87jvX210l24c7RqxS+bUYqmgL8+oZvqMbe8qDfav9Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=dVkjRl4dlIIEd8HlT3w7ViR8q/1cXW/dgSkHShLB5pOzq4SzKUmuOp/Up6COlN2WHPgb0bDs7ybX7Vsz6DVujf/omzarIZLFl8QvJbVPE3u6V36yLAYIeml3HBuAWhi0t5Qg3V4k37XISuuNFvT2LBS1y/qefyIi1qEmqhwd5Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aJ+jm1rN; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aJ+jm1rN"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7492e654cdeso1209379b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751086242; x=1751691042; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=62dSX49aFLikEjIUMEVRlCmIJbHK4eeNScGSo/Mzprs=;
        b=aJ+jm1rNOBubjVU9ObHed7zV966+EE3F08U9Iq11pfrqyPe/kZtiLrt9kIE1RVEreD
         kgWGX8AEe0HqLDZ038FEkXCzIkdnHjc8kM0Xd6NroJv7eTwuU29u7mgp+Gzg0+9pr3du
         c4+pH+hxuuVrnGW+ZMAkRAIwA6CMDqnVFrEvB5j//hc35DKUtRgorTnJTPEtmpQbPEvD
         hoMmVE1oRPRlzTGwLKA5C+8EAb2y/M4GI7+GkrJoWyeKd1PMKSNotvInJv++jBY/DwpX
         LMkfJzxOn5GBhW96Rq71vpnvoac9GdxXVP3M8xpLiZ6gXgTLW4Cyk2WkUEkn8ANYPZK5
         mSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751086242; x=1751691042;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62dSX49aFLikEjIUMEVRlCmIJbHK4eeNScGSo/Mzprs=;
        b=u0aHnY1jqMjj/1vW31qgmhfyoYZrgPgFlzpvMazLDkmYC83URFsN2bKw6pWyuDlT93
         9YrFShhXsz183fnu1yuk2KhkU3UNIqljwART7WAeA8T0wp38kqm1ZjbrcNhhCCjiK8uJ
         TxXWT5Xne6Ruj/ozlfEKpkruftazTQ/xU5+H6wBkYkDPvstYvy6SD+QlPEWBClqmyoFF
         Vx7LIEZw0c9xDK14EpRVJLUa7cm8FK1n3IKsitK7N0dS1b3ZKsOjQb8boHqVtG1ObnQX
         kJYXHraQN67sja0axx9zSUmm8GvoX0LNxZJKcriPBT6r8IGdWeWraO+Vy7LQJHok5wtz
         Z0tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOC9IBk7hJHSsvmrOE18hsfP9RH6S4dVN8gDU6wODgvK4/ONAJEmVxhqxaEb0B6e50LHpGfCJ/WoeijxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2w/JIThKO/c9X5OuEG493oWcHzqA91k+oV4p5zo4xLTyGTEOg
	jW3CUorfvTkAmTL1rGrj/RDMxyzAtGkzds7wbwUbbefABsL6hUtC5vxSbQfZZco4m76jA10c1fG
	YQW6sN6b6bg==
X-Google-Smtp-Source: AGHT+IG99HEcqbVp6hJeqxokNAhzYk5D92KArJfEufqUq/84mgt0/AFPB7xsfDOz0Rde1yeTQ+0ZMo1csF9L
X-Received: from pfbfb10.prod.google.com ([2002:a05:6a00:2d8a:b0:747:af58:72ca])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d55:b0:740:9d7c:aeb9
 with SMTP id d2e1a72fcca58-74af6fd703bmr7302327b3a.21.1751086240144; Fri, 27
 Jun 2025 21:50:40 -0700 (PDT)
Date: Fri, 27 Jun 2025 21:49:58 -0700
In-Reply-To: <20250628045017.1361563-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250628045017.1361563-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250628045017.1361563-5-irogers@google.com>
Subject: [PATCH v5 04/23] perf build-id: Mark DSO in sample callchains
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
2.50.0.727.gbf7dc18ff4-goog

