Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E5A1E1A17
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179065; cv=none; b=NFOlpDLum1VoIJFlJ3ip5vWZh/ECKKaytkAunXtjwXbjHk0JV4DNNeA6wBs0tlOwIC1OY7myquIjN5ws5cBRuck8EjfLcn41E3dp71qIBNJ4FKd5lBBaK2ggwkZCNGVJsJ/mp5BYFYH5oyt7sQmzbk6LrAIyqCbqfh5IEbPw/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179065; c=relaxed/simple;
	bh=uzrqNAXM/KeEjp8qWr6xTf3VLWW7e0MNaK/cvBjUNjU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=GBu1dX+ww1o7jHjVf4FF2BPbEAwZ+r0Y8L/CogHaRc4tRWbjLcAA/gUUZarw17Tj8sFvseNDFAnLhQTqccgOsowmb4y1S3BqJ/Z+H4g+dkmv7AeBA+0eQsDGy8I3s6nINlzqLDtj0gHFdiRuaIdXkH5pzXCuNMB/v3QIz3oa/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=myj2VGBz; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="myj2VGBz"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2242ce15cc3so57888705ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744179063; x=1744783863; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fqf5UWKI2N4Og32+0x3lkK0y6IoadYAF1NX3nVy0tDA=;
        b=myj2VGBzUEMh9WWBl8PbndsnolpHgWAFjY+H89MlE4NCQDk/nYGLm50jWfoc5TZm7a
         OJwWE2D/YQcMXiXHN5/8Btg8cnxPWXv9YdsavlPvWNxi17+7LZYJdSS6DLKH6AaVd92G
         FjnKd00JRbhPPE7oqcoGEyueKA/y8broW+VwFY5xLgnHH/NHRerovynrmf1Ry6WYNK6x
         JNnJ1UhporZKoIpHSkvjyjVyQRLoVBpUtY7VW9F5NEXsgb7bMU2CYu1LIDJ9GHTtpBAW
         L9agZBtxjPGR3Spv3ldU+YPSk78k9C8L9FSXMCiLSpBTnKaU7r879cbjgKuakGvhsuna
         YsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744179063; x=1744783863;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fqf5UWKI2N4Og32+0x3lkK0y6IoadYAF1NX3nVy0tDA=;
        b=HfRFq60OaTIbjMimvMAonvq6VJV8KtHvgiXmH4VmQImeLvaSIuvMfAseL5JBpL5xV6
         BeuJGPtLonQ54rckEz2qFRFQiffcqcJUuyFpKIa9inovEsj/RKIDE8z4Y0tf4bNn0LiS
         PrJupBxliCTJd4J1T68OOfG3zxukP392eOIVvJfct8oJeH017mqBLA+EzQJjkuaci404
         AaGeT4ippKc8VWc/bj7K9vcc1OBjIBqkRq1KHHyHmBVeUlj/SnFPsywdhMs+hT9XzP0G
         9mqLw40FgAS3wL0fjw0sZFxw+49Dplcfc7hZA7sSti0ci6JlM9PpaDl4hANB9QGiiMPH
         rCQw==
X-Forwarded-Encrypted: i=1; AJvYcCVjQD2lce01nrrTKs0hd/+5IkjxP/JM2Dhr9GmWDVokUtv/FbNrYz9QyPHjGOBhvosVC0hFopvWxvcQclk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDhnq92+2sxrpiaovyvhoeUrccNCkEQYw2mLn2Q9mmtFX/YRpI
	X0mll3aAfN5e5UFSioyQgQypMWkgfzZBnAWlCKXJDHr/L7cGvAZFjZCb+TlsG0BcEnyXGKsTinL
	zYBPhAg==
X-Google-Smtp-Source: AGHT+IGTJmhyKoOQj5ofXOm1qSdH7c8rI40Gef8T69sqKGe8/stfnPpqWWQ8Denfs/4DODYgAhfMLIhSLSVj
X-Received: from pltf12.prod.google.com ([2002:a17:902:74cc:b0:224:2ae9:b271])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d2d0:b0:223:5525:6239
 with SMTP id d9443c01a7336-22ac2a1a660mr27592605ad.38.1744179063507; Tue, 08
 Apr 2025 23:11:03 -0700 (PDT)
Date: Tue,  8 Apr 2025 23:10:33 -0700
In-Reply-To: <20250409061043.700792-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250409061043.700792-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250409061043.700792-7-irogers@google.com>
Subject: [PATCH v4 06/16] perf intel-tpebs: Reduce scope of tpebs_events_size
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

Moved to record argument computation rather than being global.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 2b04deaf66ff..e3bed86145b9 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -29,7 +29,6 @@
 #define PERF_DATA		"-"
 
 bool tpebs_recording;
-static size_t tpebs_event_size;
 static LIST_HEAD(tpebs_results);
 static pthread_t tpebs_reader_thread;
 static struct child_process tpebs_cmd;
@@ -86,15 +85,20 @@ static int get_perf_record_args(const char **record_argv, char buf[],
 static int evsel__tpebs_start_perf_record(struct evsel *evsel, int control_fd[], int ack_fd[])
 {
 	const char **record_argv;
+	size_t tpebs_event_size = 0;
 	int ret;
 	char buf[32];
 	char cpumap_buf[50];
+	struct tpebs_retire_lat *t;
 
 	cpu_map__snprint(evsel->evlist->core.user_requested_cpus, cpumap_buf,
 			 sizeof(cpumap_buf));
 
 	scnprintf(buf, sizeof(buf), "--control=fd:%d,%d", control_fd[0], ack_fd[1]);
 
+	list_for_each_entry(t, &tpebs_results, nd)
+		tpebs_event_size++;
+
 	record_argv = calloc(12 + 2 * tpebs_event_size, sizeof(char *));
 	if (!record_argv)
 		return -ENOMEM;
@@ -226,7 +230,6 @@ static struct tpebs_retire_lat *tpebs_retire_lat__new(struct evsel *evsel)
 		return NULL;
 	}
 	list_add_tail(&result->nd, &tpebs_results);
-	tpebs_event_size++;
 	return result;
 }
 
@@ -289,7 +292,7 @@ int evsel__tpebs_open(struct evsel *evsel)
 	if (ret)
 		return ret;
 
-	if (tpebs_event_size > 0) {
+	if (!list_empty(&tpebs_results)) {
 		struct pollfd pollfd = { .events = POLLIN, };
 		int control_fd[2], ack_fd[2], len;
 		char ack_buf[8];
-- 
2.49.0.504.g3bcea36a83-goog

