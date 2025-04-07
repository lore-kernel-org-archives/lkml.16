Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B9B223711
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 05:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744002084; cv=none; b=KmxC7FpixuTGplaGkaGGCAaZ3aDUlje7aE8TuyzELXF8ybbannLO3C417OxAJ9wyGfHWLcDiBkuVjTIBdDkEBZ8/cx1co4Ux95gKTIcab4X0hsKwYr2QnoM/J2b0fA3ScIdcL7wu7yDmx/3F5qLXakL9hdngHqIf0r4O1uvM5PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744002084; c=relaxed/simple;
	bh=dmk99xLT8Nx0mz4ddF1+mWBkWibkJI69saN0P2VeVFI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=f6fMyW4MXY6YqjlIX1+ufY/DZ27ZY233OjxmCQHsLFWWGXAKwqlB3G5dg8lXkybfJoEwH42HyxBba/bRJc7azOZyz3+H5RyCCZLN+JgD6TkSWOFq7WAghOO8RHD66konHiqwZ/8pDiDZu2lnqTiYc+jfdwwKOqKtDpVs3iO4/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=una14eo1; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="una14eo1"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff7aecba07so3817935a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 22:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744002082; x=1744606882; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hurkMSaqLGDLbW/1AFRFsncWr/nyXd3OBuzAUIRrz+4=;
        b=una14eo1Cfsh0MLKEqWh7qX94r3f6YKZsK1qN6P7UCqWSGOSMilDmfSpuJcbxxAhlw
         Kg3NuYsQruCbIQGl+GW955dkjiYtpcWHdBMYThgzIgJMYNrj/8wuRH3ilEY/EoDtDVMd
         9s0ap4iRd0d30o0bVoIhdto8vGXhtd2UfIUc5Sd45HOu5ZhNTBRgGI5JYOs+YCs6NhJ9
         M+saRZUV7lyxwdcgwW3Qu1T1s7IHbCtbYDy8qn2ShhWuf1OVHZ1fo0KEega5m7MSlOea
         r01SQpIijXxm3of/tUWnU9RLfcjBiqeOep9IbQe+/DwZ3hLfKop5nYv6fe+HfuAX1Mb3
         KxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744002082; x=1744606882;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hurkMSaqLGDLbW/1AFRFsncWr/nyXd3OBuzAUIRrz+4=;
        b=kLG0l6ELlLiwnSomlHACBIcn3dlzaMnnkNiUxN6CLUQHJIaVuWlgJYeWSi0vzqA5Vu
         sO0QXVrTfRmfAxH45w/G4fWTLUptKVksLSsf6yJ/hWpZyeaxfGrHLiZ2iTkNaSK6vPol
         f43A2OBqBGehuB5VIxAZ31rSTkVmTX/CUnX26LVMp/cDA1I8QrPGc9Up1tyMmC/Kzmx2
         fNo9ZLaqYmnkbEzylmGOSmXxHOq4Xl8kWT54cZ1ox+dkCFulSMUw/Ykgko5FTTGOBeiI
         xsd3F9WJTFtj2iNVuWhiehhoIRuwS9NLx56STZFPa0Q3F2YuFo6wf6z2TOmRLHUs3Uuq
         iiWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlbfCuE42r3fW7bOo9oykadGqyV3/vPjBzyAjjUHdALe7XOOU+y5gkGVqCsMyZpSl2JqdCyZm1tMbCc8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqLcBjSMj0w/6iqZJJiHRhtNh0WchsNyo2EzQTlG1xp4m08ubW
	xV6yma9njU+df39AbalGV31NTm0RHqQgP9o7J5qqBDQtRgDdaRoNiW0u5L0lyt5MjNVn1lNM+Rj
	zjrfXrA==
X-Google-Smtp-Source: AGHT+IFf7l0FRxTgMKZUycey8xKIKLXESGcbBpMRHTMH2F6GHI62YOsUKOSUl848EsIQfL7D7M3u8MLdCIa+
X-Received: from pjbta11.prod.google.com ([2002:a17:90b:4ecb:b0:2fc:2ee0:d38a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2744:b0:2fe:e0a9:49d4
 with SMTP id 98e67ed59e1d1-306a60e4ab5mr15148453a91.2.1744002082122; Sun, 06
 Apr 2025 22:01:22 -0700 (PDT)
Date: Sun,  6 Apr 2025 22:00:52 -0700
In-Reply-To: <20250407050101.1389825-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407050101.1389825-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407050101.1389825-8-irogers@google.com>
Subject: [PATCH v2 07/16] perf intel-tpebs: Inline get_perf_record_args
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

Code is short enough to be inlined and there are no error cases when
made inline. Make the implicit NULL pointer at the end of the argv
explicit. Move the fixed number of arguments before the variable
number of arguments. Correctly size the argv allocation and zero when
feeing to avoid a dangling pointer.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 75 +++++++++++++----------------------
 1 file changed, 28 insertions(+), 47 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index e3bed86145b9..c4c818f32239 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -47,72 +47,53 @@ struct tpebs_retire_lat {
 	double val;
 };
 
-static int get_perf_record_args(const char **record_argv, char buf[],
-				const char *cpumap_buf)
+static int evsel__tpebs_start_perf_record(struct evsel *evsel, int control_fd[], int ack_fd[])
 {
-	struct tpebs_retire_lat *e;
-	int i = 0;
+	const char **record_argv;
+	int tpebs_event_size = 0, i = 0, ret;
+	char control_fd_buf[32];
+	char cpumap_buf[50];
+	struct tpebs_retire_lat *t;
+
+	list_for_each_entry(t, &tpebs_results, nd)
+		tpebs_event_size++;
 
-	pr_debug("tpebs: Prepare perf record for retire_latency\n");
+	record_argv = malloc((10 + 2 * tpebs_event_size) * sizeof(*record_argv));
+	if (!record_argv)
+		return -ENOMEM;
 
 	record_argv[i++] = "perf";
 	record_argv[i++] = "record";
 	record_argv[i++] = "-W";
 	record_argv[i++] = "--synth=no";
-	record_argv[i++] = buf;
 
-	if (!cpumap_buf) {
-		pr_err("tpebs: Require cpumap list to run sampling\n");
-		return -ECANCELED;
-	}
-	/* Use -C when cpumap_buf is not "-1" */
-	if (strcmp(cpumap_buf, "-1")) {
+	scnprintf(control_fd_buf, sizeof(control_fd_buf), "--control=fd:%d,%d",
+		  control_fd[0], ack_fd[1]);
+	record_argv[i++] = control_fd_buf;
+
+	record_argv[i++] = "-o";
+	record_argv[i++] = PERF_DATA;
+
+	if (!perf_cpu_map__is_any_cpu_or_is_empty(evsel->evlist->core.user_requested_cpus)) {
+		cpu_map__snprint(evsel->evlist->core.user_requested_cpus, cpumap_buf,
+				 sizeof(cpumap_buf));
 		record_argv[i++] = "-C";
 		record_argv[i++] = cpumap_buf;
 	}
 
-	list_for_each_entry(e, &tpebs_results, nd) {
+	list_for_each_entry(t, &tpebs_results, nd) {
 		record_argv[i++] = "-e";
-		record_argv[i++] = e->name;
+		record_argv[i++] = t->name;
 	}
-
-	record_argv[i++] = "-o";
-	record_argv[i++] = PERF_DATA;
-
-	return 0;
-}
-
-static int evsel__tpebs_start_perf_record(struct evsel *evsel, int control_fd[], int ack_fd[])
-{
-	const char **record_argv;
-	size_t tpebs_event_size = 0;
-	int ret;
-	char buf[32];
-	char cpumap_buf[50];
-	struct tpebs_retire_lat *t;
-
-	cpu_map__snprint(evsel->evlist->core.user_requested_cpus, cpumap_buf,
-			 sizeof(cpumap_buf));
-
-	scnprintf(buf, sizeof(buf), "--control=fd:%d,%d", control_fd[0], ack_fd[1]);
-
-	list_for_each_entry(t, &tpebs_results, nd)
-		tpebs_event_size++;
-
-	record_argv = calloc(12 + 2 * tpebs_event_size, sizeof(char *));
-	if (!record_argv)
-		return -ENOMEM;
-
-	ret = get_perf_record_args(record_argv, buf, cpumap_buf);
-	if (ret)
-		goto out;
+	record_argv[i++] = NULL;
+	assert(i == 10 + 2 * tpebs_event_size || i == 8 + 2 * tpebs_event_size);
+	/* Note, no workload given so system wide is implied. */
 
 	assert(tpebs_cmd.pid == 0);
 	tpebs_cmd.argv = record_argv;
 	tpebs_cmd.out = -1;
 	ret = start_command(&tpebs_cmd);
-out:
-	free(record_argv);
+	zfree(&tpebs_cmd.argv);
 	return ret;
 }
 
-- 
2.49.0.504.g3bcea36a83-goog

