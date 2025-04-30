Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BAC2882D4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 20:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746043281; cv=none; b=bZnlrQ2wOEPfEZAB+bU8cz3uvyfN3lYe6QTwdiDk4mzWSBOcxuAdyJyFbknRUSpQxR1cfwXLfZUZoAeuxloxmTb/kYxscFHRjcmvYaMcfjGbHazIblok0dcZP9p8q9aG+mgSh7RnxnEXQnPsQbcPWtPVPSrQpFvjRY4+6NDeRo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746043281; c=relaxed/simple;
	bh=IeDDCZCEXYK8H15EfdB2ycNez3dvrWyEpkVr1ZAn2zk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=qWKbfe0yrloYJLPVWLNycmGoUIzI7R9upw6iewmb1zGw4AEWqRfhxq+mbKGIZw37ahmyYFFMrDB9iyIuCqOP8MW5hPxZpOd+PTGQ2v+oanr5/h5WrA/xXQVLXqfA4N1zdQ/RmG68O4mFVARVcIXPR45NftCk4sgeMGVJ4xa699w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MzJa1FTZ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MzJa1FTZ"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af972dd0cd6so108689a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746043277; x=1746648077; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q4mgaxp2PNRzYuPFI4nl6JEz+Vc7zbRAR2iy6HA/VcQ=;
        b=MzJa1FTZ6ItBoLa7fIa419lbBPX1Ftv5Og4yutekEwjf3QdDjF0oM+SRS5qlI9qvOm
         RANK4l3cOPU7IjuFBjyOopC8wGRDFFtZojdNnUs1Dyf2iq8hyBJKFWFbHD1GLzcO5qYo
         yJcXW7uhMrtJ5G/GHxZBsuEhQV4nW3U89GWxWf9YvoIvdyJzjbme4JPMWkCDFVah6yUQ
         QQeMP0I1hBBoDZHlkdg2kCHfrdFTFyBJu4EDY9zqRG4YQPAV1liahGzrUfC3z2VogRX4
         qOehruOb9hosDdFKIvthMll9jN5yUmODCNnl2QcbV71D8CHKhUyUXjZM3NsLC9dmBxE5
         j0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746043277; x=1746648077;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4mgaxp2PNRzYuPFI4nl6JEz+Vc7zbRAR2iy6HA/VcQ=;
        b=LNloFIRCYxovr6wltBu+f31Jv3t3ozMfL+fkIMDJJ8yDH5zn0sjSO523kQ1wD2H/iJ
         ULPF7YHEZB4Ymqh6BIY44Nxb+jEXAv49ZYpqQyoshtPP8M2bf2g96l7Mf9wzFUfYDarE
         0JTzUtlE1G2v75pWh6i7/CGIhtwoxuUvZXkFluuPNgZ5vouSJ9Jjk9/5t+z+2ubRZw3i
         jVkIFWut+8ZMp9aJGRBn5bVh6SdQcflzNGQs1lWV9RKzqAiS+aZa/lxMlZVGsVYP0xJR
         Q30tpqmw8gnAuEQNRKfp/FTVBC5J3uz3BIohvyKqMphwsjVpUl/8OlFmJckTGg74Vi+l
         NwHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXlpouqIVPDWosn3geZwNh/KyHU9MfE6r+AFx1Hf9g1lgw7YypbZth2CAcyjriXQf4yEK27GJmuOq8RBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJQRbvf7K7oBXrrGcZIRF+VMcXKv97XPgaFgm3VPEuxQqN1j5u
	PyQZipdf4XLZ6LNS3Gs6pu2xKuPCv+f7DgvggL8+rEcufRwFhrLaJ/IRvwEdoN6OhlZQFpUo5Mc
	Co3531g==
X-Google-Smtp-Source: AGHT+IEwy2caukEcTPbu8Rd8PJTVi66QeaVPAWQtLK+ABKf9p00gzD24MAHOci7axAO8NUNJtvFirOvSphhn
X-Received: from pgbcp11.prod.google.com ([2002:a05:6a02:400b:b0:b15:9c5d:9278])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:900d:b0:1f5:706b:5410
 with SMTP id adf61e73a8af0-20a899070e9mr5395476637.38.1746043276760; Wed, 30
 Apr 2025 13:01:16 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:01:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430200108.243234-1-irogers@google.com>
Subject: [PATCH v1] perf intel-tpebs: Filter non-workload samples
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Weilin Wang <weilin.wang@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If perf is running with a benchmark then we want the retirement
latency samples associated with the benchmark rather than from the
system as a whole. Use the workload's PID to filter out samples that
aren't from the workload or its children.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 59 ++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 7fd6cae1063e..4ad4bc118ea5 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -3,7 +3,7 @@
  * intel_tpebs.c: Intel TPEBS support
  */
 
-
+#include <api/fs/fs.h>
 #include <sys/param.h>
 #include <subcmd/run-command.h>
 #include <thread.h>
@@ -121,6 +121,59 @@ static int evsel__tpebs_start_perf_record(struct evsel *evsel)
 	return ret;
 }
 
+static bool is_child_pid(pid_t parent, pid_t child)
+{
+	if (parent < 0 || child < 0)
+		return false;
+
+	while (true) {
+		char path[PATH_MAX];
+		char line[256];
+		FILE *fp;
+
+new_child:
+		if (parent == child)
+			return true;
+
+		if (child <= 0)
+			return false;
+
+		scnprintf(path, sizeof(path), "%s/%d/status", procfs__mountpoint(), child);
+		fp = fopen(path, "r");
+		if (!fp) {
+			/* Presumably the process went away. Assume not a child. */
+			return false;
+		}
+		while (fgets(line, sizeof(line), fp) != NULL) {
+			if (strncmp(line, "PPid:", 5) == 0) {
+				fclose(fp);
+				if (sscanf(line + 5, "%d", &child) != 1) {
+					/* Unexpected error parsing. */
+					return false;
+				}
+				goto new_child;
+			}
+		}
+		/* Unexpected EOF. */
+		fclose(fp);
+		return false;
+	}
+}
+
+static bool should_ignore_sample(const struct perf_sample *sample, const struct tpebs_retire_lat *t)
+{
+	pid_t workload_pid = t->evsel->evlist->workload.pid;
+	pid_t sample_pid = sample->pid;
+
+	if (workload_pid < 0 || workload_pid == sample_pid)
+		return false;
+
+	if (!t->evsel->core.attr.inherit)
+		return true;
+
+	return !is_child_pid(workload_pid, sample_pid);
+}
+
 static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 				union perf_event *event __maybe_unused,
 				struct perf_sample *sample,
@@ -140,6 +193,10 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 		mutex_unlock(tpebs_mtx_get());
 		return -EINVAL;
 	}
+	if (should_ignore_sample(sample, t)) {
+		mutex_unlock(tpebs_mtx_get());
+		return 0;
+	}
 	/*
 	 * Need to handle per core results? We are assuming average retire
 	 * latency value will be used. Save the number of samples and the sum of
-- 
2.49.0.906.g1f30a19c02-goog

