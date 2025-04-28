Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399CC212FBE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876063; cv=none; b=gt0n+ZvE7/fd0YeZxqAkloMBCw/iS0ZpHYOw+3IA1/Jb+GcA8USoRqtRoYyjW4ppYqpoMgQChyDtuFC6UniIlZpxMwULmkL22sAIauUuIlkFxH3UM1frDUbeJPIwvyUHAWyDr/y9+ta/1afmJkEtxVLHJdIiV2a9/KJzTUZn8E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876063; c=relaxed/simple;
	bh=HTKDxSb83GljAcKwgB1tWyhvT8jeauFTb7sWIZG+NHI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=pEmU7LbfluIF2uI3+MCa4z2keyoD1aG2O2oRCT4BHWxQ+m0UC4X2EmGkpAGcll9+oF3LE/imvEjwHW70h/ID3Wz4riB9w39l7QvHPubfndyby3CScJjFl/J7Kt93RahgBhGxYyEZP9PhfoYE84a0g+RdWoG7AHuUvILGwPQ52cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yu00/8Wk; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yu00/8Wk"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af8d8e0689eso5340627a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745876061; x=1746480861; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NruyO827J8Aq2CmIQSrBjSup56z+26r+Jphuwb//5zM=;
        b=yu00/8WkEO4Vj92UIDPo6XmZ0pONQmBSPCMLvcdk8p3vEJi6u+UXQs35GduDSHpRh1
         jfHRmQufy8QjC3bUkVxtFU+KeUklbn7TA1kOinbMLT+PWu3B/6D2pTI5PwQhOOilNIhD
         f4MPZYh6IZjem0eJmVKHkieGeUy6+n2qGNAaCu2I48O38YUb+CQaYiAyJyZ+zU9l4LoC
         i0WDfYVqKUlJKVLbud3YuaPcEfag3wppGB4s8IcB6wo1efRLGVlp6KfPQquZMPZ4bVy+
         sI+N0wZmiK1R2PNWO+1/KUiS1VfA6n3xa3m3RSa4MO1OZltOm0HSygYUEMszkwQdRtWH
         McRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745876061; x=1746480861;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NruyO827J8Aq2CmIQSrBjSup56z+26r+Jphuwb//5zM=;
        b=ka5TmEGx4TEuk4sI8XlzJA+zU8HdAU5jgZHnUiIZo6SJ+g7uBK+CgfAgaK1SZFXmiq
         q3sJbnx36J7OE4xZAF+B97y9wtXSDjQ2OTbMhA4sHPa2r/3QbFpnQe8WccoG2WdD5FvB
         yiaL/zDYkQHUeFIYPA1RKNG5SpsLOvQKa3T5AMjS04uInDMQbvBdxu0/mz6S8aLVKjIL
         j6ZLU2mpWmOtxqn0TvArjtZ0StwrJopQ22x9Lu+QcJ5meL/fHXyuG6/CmLutTJnUF4v6
         djj61/VAyjIQNkZyg4LwiORrWc5nVcFGdG+yGgyhz4jVhrVFcZJRAaZjQ2zdPj9/M2pT
         3fcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhtRg8eaVBrSx4fNoghxalwadVFxNsVNdQ8pHq+3BR1Q2V1/0CruUW6tNgCKYsJQmukXYufbuiNw1q4wI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhhQ3irgdU/jECgkJfEqNCzOAo1sV7oZOjb84NqqNScRZsx6CN
	lg9qegG+CbYv43mLF9XCFBgCEArwwyV0Sir2xVdxFlc5vLeHeoRABLC0XuqKI5fDFYYdiaqGRPK
	MWUUazw==
X-Google-Smtp-Source: AGHT+IFr1DUcLf4fJFO8qlUiM8teqy5JWXpOKomw5UGogwqkVc1K1AS6v5CJ/1Z+7wZHpieRsK/3Zo3kT+oD
X-Received: from pjm7.prod.google.com ([2002:a17:90b:2fc7:b0:2fa:a101:743])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5185:b0:2ff:6fc3:79c3
 with SMTP id 98e67ed59e1d1-30a21552a93mr2262278a91.9.1745876061588; Mon, 28
 Apr 2025 14:34:21 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:34:04 -0700
In-Reply-To: <20250428213409.1417584-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250428213409.1417584-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250428213409.1417584-6-irogers@google.com>
Subject: [PATCH v3 5/9] perf build-id: Mark DSO in sample callchains
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
2.49.0.901.g37484f566f-goog

