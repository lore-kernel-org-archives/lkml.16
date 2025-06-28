Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D2722B5AC
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 04:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086281; cv=none; b=sEfwPzFZqrPSGRq1y3I1yUMUgqIbAQYNX8lgI9mlIcsq8GRwI5MseoFHZ6D8p/MYwrF09OQ40fcfaLaiTzX3IIgBAscgP5uXkvDnSrUFMWVyix4XkQlkVLSgp07TtzPaEtOwJI0cuPlBP1ixDktHjMzcC5pCG+jLFf6O8nkn2JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086281; c=relaxed/simple;
	bh=XZ2G4kiVjld4rU4LFsnLYgXf2Edy2O94yr2BpTWHjrM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=obO0R/mqhA24y5o/u3ahNRgs5UeEIm/8QM6aIz1H3RBnnIkleHbSeGarhHQ3w2MJ97CfS9d8K8vVflQr8Tcu6ftgRCKg+Z7tKJ2jpprpHCLxBcamPG68kua2ySvyNqIX7FrQsXEQE5kSrMkUmvSnwA8lqdgLQxu7Sm2WYkaWoa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xa1G2V36; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xa1G2V36"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748cf01de06so1350452b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 21:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751086279; x=1751691079; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=igXQM6BRQW3014Wvuqhh3drIYdWuvzh4LJQBcoyEMvA=;
        b=Xa1G2V36UbE6ecX6ZmvwWONOex3/rxpxmva18laYL2ot7ASqMS/qt3SZAFkkpKJ28A
         AcHhdv+jFCNqHGTTbN88MWCwNwGSXQg/ojivOLQaI2xEBYLnOAWiMhXPR8gflSAeJaTT
         kQsMRVx5ivu58LrcbtJ+Ttq8b0gMk1u72pzH1Li9i0Km1ZtBDvGtTrgts5B1nIG9I0qa
         wDmFsTE4y1VJQ/0qrtwuh4ZsNpP5kG9VBvS06ny5fdxgViXNLsQJ/bgGKJlLRxeQv819
         XmWJUU2tRFAcdOw4Fp9yPMnt9UiUy59QCXnxLZufTRwlPPZHJ+k3qozDD55z+9WcGAGK
         VOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751086279; x=1751691079;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igXQM6BRQW3014Wvuqhh3drIYdWuvzh4LJQBcoyEMvA=;
        b=h9ACf9L84bwLoAMZ82f1hL4iQbRu25T3nBKyqHZyO3xzopewjeKbqAJFal+Ytr2kn8
         MmwD4xXbXpdZfzrWEIOuL9EzUwd5PU74+ludVp68Eo5903a/4ShttZxM+865Pu87g5st
         fiS6AyDUs4XgllT+yqcGC4VTbFDBb9nCq7piHkY71RBSfGLNQEU9IzylYiA4FXqgiQrD
         93rpEPwyN1sMzk3fDT6DIYuRSc8pZceogpK1He3bsLnOMemufsz+daVEUvMUUWGpHGAZ
         WDAvX+xFro6SVWaUj1onM23OAfPllP2nf09yr2s4p+wQueZf/5V1cpvgP6ifXd6yjfwl
         Y3GA==
X-Forwarded-Encrypted: i=1; AJvYcCWelzELD/obWg6Ra9ZYUTf4QpxckB3hGXCRVePi9V5AFtO7jBQhcLQPDB6Y+zD9P1TpWKkrgbdyqy7aSlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCI/aM9duB3mhsuhVzOH0e4uN2FmmIn7/xGlhctlGq3b3nbjpA
	qm87KXYPBmZf7ogP7rPB2UzB9JNHVc3cflX23qfETrtdM4EWioHjVDjhk/ZeynVFdJwudzn29jb
	amM3I3RUtSA==
X-Google-Smtp-Source: AGHT+IGlr6aNseajtUasZEJx8sFDfiqYdn+3ReaGiasBgRfrtEPijj3lkiCuoFZfZnQw3dWyqb7RcC1LSJ5S
X-Received: from pgb12.prod.google.com ([2002:a05:6a02:340c:b0:b2f:64be:6881])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:900f:b0:1f5:709d:e0c6
 with SMTP id adf61e73a8af0-220a17ef512mr7681833637.42.1751086279488; Fri, 27
 Jun 2025 21:51:19 -0700 (PDT)
Date: Fri, 27 Jun 2025 21:50:12 -0700
In-Reply-To: <20250628045017.1361563-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250628045017.1361563-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250628045017.1361563-19-irogers@google.com>
Subject: [PATCH v5 18/23] perf auxtrace: Pass perf_env from session through to
 mmap read
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

 auxtrace_mmap__read and auxtrace_mmap__read_snapshot end up calling
 `evsel__env(NULL)` which returns the global perf_env variable for the
 host. Their only call is in perf record. Rather than use the global
 variable pass through the perf_env for `perf record`.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-record.c |  8 ++++++--
 tools/perf/util/auxtrace.c  | 13 +++++++------
 tools/perf/util/auxtrace.h  |  6 ++++--
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index 546c54b34155..362312c764cb 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -775,7 +775,9 @@ static int record__auxtrace_mmap_read(struct record *rec,
 {
 	int ret;
 
-	ret = auxtrace_mmap__read(map, rec->itr, &rec->tool,
+	ret = auxtrace_mmap__read(map, rec->itr,
+				  perf_session__env(rec->session),
+				  &rec->tool,
 				  record__process_auxtrace);
 	if (ret < 0)
 		return ret;
@@ -791,7 +793,9 @@ static int record__auxtrace_mmap_read_snapshot(struct record *rec,
 {
 	int ret;
 
-	ret = auxtrace_mmap__read_snapshot(map, rec->itr, &rec->tool,
+	ret = auxtrace_mmap__read_snapshot(map, rec->itr,
+					   perf_session__env(rec->session),
+					   &rec->tool,
 					   record__process_auxtrace,
 					   rec->opts.auxtrace_snapshot_size);
 	if (ret < 0)
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 03211c2623de..ebd32f1b8f12 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -1890,7 +1890,7 @@ int __weak compat_auxtrace_mmap__write_tail(struct auxtrace_mmap *mm, u64 tail)
 }
 
 static int __auxtrace_mmap__read(struct mmap *map,
-				 struct auxtrace_record *itr,
+				 struct auxtrace_record *itr, struct perf_env *env,
 				 const struct perf_tool *tool, process_auxtrace_t fn,
 				 bool snapshot, size_t snapshot_size)
 {
@@ -1900,7 +1900,7 @@ static int __auxtrace_mmap__read(struct mmap *map,
 	size_t size, head_off, old_off, len1, len2, padding;
 	union perf_event ev;
 	void *data1, *data2;
-	int kernel_is_64_bit = perf_env__kernel_is_64_bit(evsel__env(NULL));
+	int kernel_is_64_bit = perf_env__kernel_is_64_bit(env);
 
 	head = auxtrace_mmap__read_head(mm, kernel_is_64_bit);
 
@@ -2002,17 +2002,18 @@ static int __auxtrace_mmap__read(struct mmap *map,
 }
 
 int auxtrace_mmap__read(struct mmap *map, struct auxtrace_record *itr,
-			const struct perf_tool *tool, process_auxtrace_t fn)
+			struct perf_env *env, const struct perf_tool *tool,
+			process_auxtrace_t fn)
 {
-	return __auxtrace_mmap__read(map, itr, tool, fn, false, 0);
+	return __auxtrace_mmap__read(map, itr, env, tool, fn, false, 0);
 }
 
 int auxtrace_mmap__read_snapshot(struct mmap *map,
-				 struct auxtrace_record *itr,
+				 struct auxtrace_record *itr, struct perf_env *env,
 				 const struct perf_tool *tool, process_auxtrace_t fn,
 				 size_t snapshot_size)
 {
-	return __auxtrace_mmap__read(map, itr, tool, fn, true, snapshot_size);
+	return __auxtrace_mmap__read(map, itr, env, tool, fn, true, snapshot_size);
 }
 
 /**
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index b0db84d27b25..f001cbb68f8e 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -23,6 +23,7 @@ union perf_event;
 struct perf_session;
 struct evlist;
 struct evsel;
+struct perf_env;
 struct perf_tool;
 struct mmap;
 struct perf_sample;
@@ -512,10 +513,11 @@ typedef int (*process_auxtrace_t)(const struct perf_tool *tool,
 				  size_t len1, void *data2, size_t len2);
 
 int auxtrace_mmap__read(struct mmap *map, struct auxtrace_record *itr,
-			const struct perf_tool *tool, process_auxtrace_t fn);
+			struct perf_env *env, const struct perf_tool *tool,
+			process_auxtrace_t fn);
 
 int auxtrace_mmap__read_snapshot(struct mmap *map,
-				 struct auxtrace_record *itr,
+				 struct auxtrace_record *itr, struct perf_env *env,
 				 const struct perf_tool *tool, process_auxtrace_t fn,
 				 size_t snapshot_size);
 
-- 
2.50.0.727.gbf7dc18ff4-goog

