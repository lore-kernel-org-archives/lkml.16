Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA22221FB2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749059176; cv=none; b=TCKdqaiueQGh5JQY7KRCQ/821cYFpce0KDV9Alad+Md0pXoTckZ49kbWUZuzVHBvU5BwGIwx9B0snsBBDSrdbWsBwLI4owQpQx+/aQ/u7j3Vo2an/ENJtA/1ZGMFKC31TjbSjkli89egWw5eWHDbiX0Lu2w0YbXHDkpodxGYe8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749059176; c=relaxed/simple;
	bh=dHzaMbefGtUz9d2v361l8pFL/wSt8FJRI3z4e3U91Xw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=VA/3OpY69LXB9FFsJWDc0S9tDVPaZgMJHKrjR0vGupAorC910YS3qhP1bUZtCDCZ47XF05e1rHKnQ+1YtZnuf//IbHqrsf4ok/dFfzcssppHKCDdJ6yVSJNtcCNC14zdFal4WTzEr9y2b3BU5bL4dogTct32R3szSCF04JiMGcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3sMelFos; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3sMelFos"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-740270e168aso110602b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749059173; x=1749663973; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0E+HpHSoytdzCXhtaWooQBDGQQ29joWOWrbhKZJfAKM=;
        b=3sMelFosVbjhs3g2oWpsrBrfzgAto9TiGkm9w2KnjA0hvkEEerBX/ANXkVtQkcKiz3
         dSTsKKcxt0k9afV9QTHJGS1sicixc9Ouj2lfHvb8leEw8TKbt3mxOCeTREE3TNo2Z8dH
         3XGzBp3DWRIo6O/LioL6aQsbm+17ISxDXmArIlm89AwSYAsoaaXYJ/2GB+HHonu2EjQx
         QZz/2ablYdAd5OF+8vS1ati2MxDpPGx9hB8jD5JK0zVrMu5Yxg8GL+sm/8x5cWa9QAEt
         Jkr4JX6g9FyoC4x/pKAGIdTrHwAt1gYeJu+EySWs83mTHKTUYcVQ//e0z0unvAbhXPx5
         bd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749059173; x=1749663973;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0E+HpHSoytdzCXhtaWooQBDGQQ29joWOWrbhKZJfAKM=;
        b=WlaU7KO7EowtgqUlmcUHV+7w1zQeXNUor2prQ94u+EQ//j/NokmI3GIu4FgZnNBxaU
         dDZ7IEzYIWwO9bLi1wnIl8v2lflLZMF4mmAnwjPCQuCkSk85np+KXiS5TDQWUsV38Y5C
         3EP5nLGzDPZykt8EgJ625xrlsSLHNIarKJhIrBAV6NOzgm8guc23yGWyqeGpgcEXVyCQ
         lP9YzqYxzj0cjvOl0Qqr5nH4Sg9dXC8kZrAhhiWzoYms99puhwJGuX3/6GIWvBRF+1hh
         0HbOtfYH7GxaGzEuUAcjl26sLtncMGrAMXvscwP/oUJQtDpSSJrmYJQuy1FkEUnv2oZP
         aCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/LgoVznhGN3OslWJJdN9KCLy1O0XSmZM6FmzeWKaL6qYL3qPovXtI5o0L1Db8bSjCzyvK0mMWFwbPKrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrxXbQamuRDvsqRBaLoKemCQjECTlwj9jMzjawqDhCuGOhv9Yu
	R07v06yKZbV2rZeAnhE5m33hjR+a6VYLKjWcHP8CeJV82Q4e20PfKIbytaBMvTUZToRogZcvVm7
	6qSnoa0IUBQ==
X-Google-Smtp-Source: AGHT+IH5n1tYBLYem5kFcijv1sTEBP7t8TJ17INcbQ/3M8b4vkg65AehKSeRUnE6Wp2T+YtUgx/2F1npQi72
X-Received: from pfbfp12.prod.google.com ([2002:a05:6a00:608c:b0:746:2747:e782])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6e48:b0:206:a9bd:a3a3
 with SMTP id adf61e73a8af0-21d22cda336mr4789909637.24.1749059172883; Wed, 04
 Jun 2025 10:46:12 -0700 (PDT)
Date: Wed,  4 Jun 2025 10:45:42 -0700
In-Reply-To: <20250604174545.2853620-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604174545.2853620-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250604174545.2853620-9-irogers@google.com>
Subject: [PATCH v4 08/10] perf bench evlist-open-close: Switch user option to
 use BPF filter
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Veronika Molnarova <vmolnaro@redhat.com>, Chun-Tse Shao <ctshao@google.com>, Leo Yan <leo.yan@arm.com>, 
	Hao Ge <gehao@kylinos.cn>, Howard Chu <howardchu95@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Levi Yun <yeoreum.yun@arm.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Gautam Menghani <gautam@linux.ibm.com>, 
	Tengda Wu <wutengda@huaweicloud.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Finding user processes by scanning /proc is inherently racy and
results in perf_event_open failures. Use a BPF filter to drop samples
where the uid doesn't match.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/bench/evlist-open-close.c | 36 ++++++++++++++++------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/tools/perf/bench/evlist-open-close.c b/tools/perf/bench/evlist-open-close.c
index 79cedcf94a39..bfaf50e4e519 100644
--- a/tools/perf/bench/evlist-open-close.c
+++ b/tools/perf/bench/evlist-open-close.c
@@ -57,7 +57,7 @@ static int evlist__count_evsel_fds(struct evlist *evlist)
 	return cnt;
 }
 
-static struct evlist *bench__create_evlist(char *evstr)
+static struct evlist *bench__create_evlist(char *evstr, const char *uid_str)
 {
 	struct parse_events_error err;
 	struct evlist *evlist = evlist__new();
@@ -78,6 +78,18 @@ static struct evlist *bench__create_evlist(char *evstr)
 		goto out_delete_evlist;
 	}
 	parse_events_error__exit(&err);
+	if (uid_str) {
+		uid_t uid = parse_uid(uid_str);
+
+		if (uid == UINT_MAX) {
+			pr_err("Invalid User: %s", uid_str);
+			ret = -EINVAL;
+			goto out_delete_evlist;
+		}
+		ret = parse_uid_filter(evlist, uid);
+		if (ret)
+			goto out_delete_evlist;
+	}
 	ret = evlist__create_maps(evlist, &opts.target);
 	if (ret < 0) {
 		pr_err("Not enough memory to create thread/cpu maps\n");
@@ -117,10 +129,10 @@ static int bench__do_evlist_open_close(struct evlist *evlist)
 	return 0;
 }
 
-static int bench_evlist_open_close__run(char *evstr)
+static int bench_evlist_open_close__run(char *evstr, const char *uid_str)
 {
 	// used to print statistics only
-	struct evlist *evlist = bench__create_evlist(evstr);
+	struct evlist *evlist = bench__create_evlist(evstr, uid_str);
 	double time_average, time_stddev;
 	struct timeval start, end, diff;
 	struct stats time_stats;
@@ -142,7 +154,7 @@ static int bench_evlist_open_close__run(char *evstr)
 
 	for (i = 0; i < iterations; i++) {
 		pr_debug("Started iteration %d\n", i);
-		evlist = bench__create_evlist(evstr);
+		evlist = bench__create_evlist(evstr, uid_str);
 		if (!evlist)
 			return -ENOMEM;
 
@@ -206,6 +218,7 @@ static char *bench__repeat_event_string(const char *evstr, int n)
 
 int bench_evlist_open_close(int argc, const char **argv)
 {
+	const char *uid_str = NULL;
 	const struct option options[] = {
 		OPT_STRING('e', "event", &event_string, "event",
 			   "event selector. use 'perf list' to list available events"),
@@ -221,7 +234,7 @@ int bench_evlist_open_close(int argc, const char **argv)
 			   "record events on existing process id"),
 		OPT_STRING('t', "tid", &opts.target.tid, "tid",
 			   "record events on existing thread id"),
-		OPT_STRING('u', "uid", &opts.target.uid_str, "user", "user to profile"),
+		OPT_STRING('u', "uid", &uid_str, "user", "user to profile"),
 		OPT_BOOLEAN(0, "per-thread", &opts.target.per_thread, "use per-thread mmaps"),
 		OPT_END()
 	};
@@ -245,15 +258,8 @@ int bench_evlist_open_close(int argc, const char **argv)
 		goto out;
 	}
 
-	err = target__parse_uid(&opts.target);
-	if (err) {
-		target__strerror(&opts.target, err, errbuf, sizeof(errbuf));
-		pr_err("%s", errbuf);
-		goto out;
-	}
-
-	/* Enable ignoring missing threads when -u/-p option is defined. */
-	opts.ignore_missing_thread = opts.target.uid != UINT_MAX || opts.target.pid;
+	/* Enable ignoring missing threads when -p option is defined. */
+	opts.ignore_missing_thread = opts.target.pid;
 
 	evstr = bench__repeat_event_string(event_string, nr_events);
 	if (!evstr) {
@@ -261,7 +267,7 @@ int bench_evlist_open_close(int argc, const char **argv)
 		goto out;
 	}
 
-	err = bench_evlist_open_close__run(evstr);
+	err = bench_evlist_open_close__run(evstr, uid_str);
 
 	free(evstr);
 out:
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

