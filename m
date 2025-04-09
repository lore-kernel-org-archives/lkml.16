Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7C21E3779
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178890; cv=none; b=oYouWUHo3XekImBKB0I6bvA6uBdhbitx/gVXFd1kVg4F+qrb8I6MhKqRxC8ynEOWbA18ytJz+cwokllSdDYIZaGd7lsCgLEffzdl3zTp+NgowEfR1RcgQSYc2WORZHrhevrmrVA40WKL6G2KiVc338C3CQNB/iQSrm3/qe0ahmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178890; c=relaxed/simple;
	bh=dmk99xLT8Nx0mz4ddF1+mWBkWibkJI69saN0P2VeVFI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=pCiGzhXjNoshaxeWzFJz8G8NOvJcalpycDJp9R4Q7DYBcIwJQtbpUPi0D3alPNL9TrSl8wDJeSoS9lXqqEKDpPpECusquW5vl9nZwSW4TJD1bINvd8M4EOrHbhVBiFtEvFOcz768gE2yhODGDYAxzQ9f/92ip87erLiSNM02pOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a+rA8mRv; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a+rA8mRv"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3052d29759bso9292489a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744178887; x=1744783687; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hurkMSaqLGDLbW/1AFRFsncWr/nyXd3OBuzAUIRrz+4=;
        b=a+rA8mRvJ5OTqLMAKKcvgqXTTFlz9gqNXx+Seq5jJmMvgceQa+BLSvKgVHG8k5EM5j
         zSEXGQuHxghXgSqZ/aLBwfTEhjNqMBJSYe2DHdz5vqmAfGa4ZKL/XoZupaEkXGR/0wBK
         BLbHICr5B03kAvcfZeGBKLmqarmSnPeVU+kHKUBYMaWQ1Tt/lU7fwFu+3V9B/vnBNbGh
         8+U2V2hmcGs75Ak0nkK/636nN0piVLhOT8ew4U7FVqZ1A74B8kSZBvGiq++v/SPAAvWL
         Lp3t/A24RxRm4ncqk78Vy4SHtgxj8tBQ50RWsJnDm2Uc0/pff7rn2dtGu9aYx6+uBHWs
         FLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178887; x=1744783687;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hurkMSaqLGDLbW/1AFRFsncWr/nyXd3OBuzAUIRrz+4=;
        b=wLjpJR9hCeX5I2WhJvFQqT6opBsTO8/8nC/FI4pWrTVL6GHXTJrXbVLfxRrqbBAwWc
         m08iesZVOH+GDicTrov1XuMCOC7iiz+RWa3b6v7CagFmt+Zgx3TZUPcsrKqxDXc/drBi
         4MLuaCcrdi/zIpBqAEj7WHBXEiMxyaBng9BB1Atxuism2mao7b2EnxTiZcgz4ikJ0MOT
         bBntiLx0paU/aJyxKtbHqoiOkC0/olPzmQvXnz2KW0xYO7+lxhU57qryn1/xKxxXw8Um
         Blfozo2z1SD3WgM0GgQAmnQ3Vne0nVDEvw8Jx03Yj5Z51vlqRhQz6+GyD55ZNqakquiI
         u+DQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/sNymdXO+rpjPrHGQVEz9nU3FocR8TummR0DADbbmIw/Btzb3sJWHD6C+s3oVAzTSRP6WLV8lQfLXJvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAVmJ2j7gL1Fioxj4aVlRW6+WkfCXmFVmo+0RUXPMNekylGl2W
	vEsGUH6iuZKxEvxk/0spi1MfDnx7Sal27WBPj0kp5ijztbJGuLqSOOxglDq5Ke29yt4sv0yFkzX
	9KzCfOw==
X-Google-Smtp-Source: AGHT+IGDBd1RJDjnp6C+cFyERKUExc5ASS2VzUckmoLnYpHkRVZBs1hw2I96gdK0fDr9JWUQ4ACs+bhXeAVK
X-Received: from pjkk7.prod.google.com ([2002:a17:90b:57e7:b0:2fa:1fac:269c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ece:b0:2ee:5bc9:75c3
 with SMTP id 98e67ed59e1d1-306dbb8db11mr2441976a91.5.1744178887340; Tue, 08
 Apr 2025 23:08:07 -0700 (PDT)
Date: Tue,  8 Apr 2025 23:07:34 -0700
In-Reply-To: <20250409060744.698511-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250409060744.698511-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250409060744.698511-8-irogers@google.com>
Subject: [PATCH v4 07/16] perf intel-tpebs: Inline get_perf_record_args
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

