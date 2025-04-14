Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514F028DEF6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652527; cv=none; b=MFv4d4cCoaOL4p6P+BHfJVxKmtTxxOEkN4fwxD5qKhA7yqlOoX6rVQAB068TY2Lhfyb84WQ6/yQUdh++YfsIsltT3FyTR39AL+RSMp5zq1YseARoAFXJf2sQpxZXDz+aHSqOAhQSONcS0prnT0YFAoayod7+rSWlTUN6j8zMiCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652527; c=relaxed/simple;
	bh=DFjxBYDyDfEAtlYSsxu3IuiLYb25T54vCkre2zk9ReI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=A5BqghCtvZdwQWYKz6Htm/A6XpzpOmPUZeutIR23t7JDrhPFmTMLtNMvkh+NQCz3K64Tzk4t3/5eJOe4EtdxUTUMozDd548MA1idga1nt0OhZ5md2nOC7JZAGY5MlLDrps+PDjczblsiVZM+U1BrjzRC5Ocyq11WqZxi33mFoCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qQYeeKP6; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qQYeeKP6"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-72e313f527cso3990043a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744652525; x=1745257325; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/6B+tTNmgbE+npKfz9VIYvdTpAi1BUpsjCK1/o5jdOk=;
        b=qQYeeKP6DpOyQbZ8QhtwVOnZp0LLeWrDGMquyhR68bAt/5BHOBkrO2bvbrAjdIokVD
         GvKJnNolbR8okjvNH9A01mH2wggVsqRXKfYGYkBV7wutYWguAz9ZI9i1ebuedlmQCzhc
         7bp0uUmEPRt/FryhIQPTC6ce6LiyWI5uTPg/YyOTOurlCvTfxTgpR5XSY+3siN1x2mAx
         qeJhvjpIauvDxNGlbdYfRTr0fT4kZyYt1s0RKT9ob+whyOn3PUquLeTzCFsyl6HHFwBj
         Z26hsYN9/Gf8GPg5RxukvssX3n9Q6ZOkGcIsHPtnUBvoNI3uOtjt11QKC4VsbPxwrWxy
         HCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744652525; x=1745257325;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6B+tTNmgbE+npKfz9VIYvdTpAi1BUpsjCK1/o5jdOk=;
        b=MNMD2FMCrPaZfBOUbd4T7etCtj8cOlPA3+70DtA6oIyJm+5EQOstGGZizICQKnuuvW
         Z2eZ9H/2IN41626AZIqyDeL8Ecss3Sq3ZRWG4Ojt5oyZdHZflmUBvi+YwQtKN4OzPUhH
         kZz8gB2HLlnKaTAmh4K+egv1K6DkrT42n3P7inPxtwfx8yHX0KCiMAeU++utz88ReqPg
         UTq5oD9U/+/wova0vV2hxWq7QteE7fBktHG2/PCcLbkpDW7CY7bXx5RPi/h41w2RvLei
         IRd+TvSozNiCSDEFYI281Tlpdw/hAqUO3BqHf4uK9dQdDGTuWGAs+zgzcvo8FgAcOsSQ
         piyg==
X-Forwarded-Encrypted: i=1; AJvYcCWBV9X5iZTfrJORs6QjBalAy5lHSxlTYQKlVAuTk8qbr5Qi8u+iTWwdrclG0tFd6A2NeUdE13WDa9qnPcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9OPrvwtaONt4MX4fJCzSes5uxmPUy0Aa5f68w8+28QkMeOyA4
	f44O4fYeRybXzmU/MBbGGvfRm6sdyW2hjNdknZ0YEZZ7hQxsbdFGNa8NnvYb0/8dfqEOfkqham8
	yOE240g==
X-Google-Smtp-Source: AGHT+IFZfQRoFisi7/6v7utCC2NsJldmcEFv3ovdDOV3Vl+uF2EaQpByAfXxRfOr3QgYOXe434yeoSfClnHM
X-Received: from oacoz11.prod.google.com ([2002:a05:6871:788b:b0:29d:f69c:1743])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:2aa5:b0:72b:8aec:fbd4
 with SMTP id 46e09a7af769-72e862d8597mr9409860a34.3.1744652525506; Mon, 14
 Apr 2025 10:42:05 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:41:23 -0700
In-Reply-To: <20250414174134.3095492-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414174134.3095492-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250414174134.3095492-6-irogers@google.com>
Subject: [PATCH v5 05/16] perf intel-tpebs: Move cpumap_buf out of evsel__tpebs_open
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Caleb Biggers <caleb.biggers@intel.com>, 
	Weilin Wang <weilin.wang@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Perry Taylor <perry.taylor@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>
Content-Type: text/plain; charset="UTF-8"

The buffer holds the cpumap to pass to the perf record command, so
move it down to the perf record function. Make this function an evsel
function given the need for the evsel for the cpumap.

Signed-off-by: Ian Rogers <irogers@google.com>
Tested-by: Weilin Wang <weilin.wang@intel.com>
Acked-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/perf/util/intel-tpebs.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 2186818b2c9b..2b04deaf66ff 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -83,12 +83,15 @@ static int get_perf_record_args(const char **record_argv, char buf[],
 	return 0;
 }
 
-static int start_perf_record(int control_fd[], int ack_fd[],
-				const char *cpumap_buf)
+static int evsel__tpebs_start_perf_record(struct evsel *evsel, int control_fd[], int ack_fd[])
 {
 	const char **record_argv;
 	int ret;
 	char buf[32];
+	char cpumap_buf[50];
+
+	cpu_map__snprint(evsel->evlist->core.user_requested_cpus, cpumap_buf,
+			 sizeof(cpumap_buf));
 
 	scnprintf(buf, sizeof(buf), "--control=fd:%d,%d", control_fd[0], ack_fd[1]);
 
@@ -287,8 +290,6 @@ int evsel__tpebs_open(struct evsel *evsel)
 		return ret;
 
 	if (tpebs_event_size > 0) {
-		struct evlist *evsel_list = evsel->evlist;
-		char cpumap_buf[50];
 		struct pollfd pollfd = { .events = POLLIN, };
 		int control_fd[2], ack_fd[2], len;
 		char ack_buf[8];
@@ -305,10 +306,7 @@ int evsel__tpebs_open(struct evsel *evsel)
 			goto out;
 		}
 
-		cpu_map__snprint(evsel_list->core.user_requested_cpus, cpumap_buf,
-				 sizeof(cpumap_buf));
-
-		ret = start_perf_record(control_fd, ack_fd, cpumap_buf);
+		ret = evsel__tpebs_start_perf_record(evsel, control_fd, ack_fd);
 		if (ret)
 			goto out;
 
-- 
2.49.0.604.gff1f9ca942-goog

