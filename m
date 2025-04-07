Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10D1224AE6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 05:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744002092; cv=none; b=fTiuEaOBF89vq8OjLpBWSipMIV0i3pA09o+9XDXsH3F8ioBLVNk7Lhbg4FbXXVV+rNUqpRilPFCmtZLSGTSbsI77/6ngQ9TWGM3T7mxzerQpcw9l3tm4mnFpUVMrQlHSl5d6Rv4N8cSw5tFQjR6nqUtecW4fisZ0s9u7eJtm0RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744002092; c=relaxed/simple;
	bh=pgA22qZPkNb7zHVoAYDr39LnkgEB6ecOZTk58/HOErU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=EQeHAnr7azQxFVH7BfC7WE5HIvUeR1E4fC9kgXa8dv6X7MLwB1ZKtf7GwMU1I+U0RcMSoUTkebHN3hDTkSfWwABvbDIiYIiDgWl0kCLRbfS6BRFtzC2npcP8nEb/dVvtUVCDvOwtSvbTSg/oLMS8x6+/svWQp68nr0LconYdO+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k7U11RmZ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k7U11RmZ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3054210ce06so5734053a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 22:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744002090; x=1744606890; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aJzpjcltssyTndX39CXnR31oCFaKZdU16+qgh2x63Vg=;
        b=k7U11RmZnWcv8BgfVFaKQye2KgCv+M5d1VThIIshDpjC2puuo+7xPyT1Oe2a9QZwRc
         NBltd9esVepA0KovyFLR7TNkN2Sz2TJfjtFBTT58ph08Uei/sBZvi8fKNfux2FZqGWk1
         fUDHuld26Xkuzse/IA9iAajrQBM1wgHTRLnrnNR3I7FCvF1jfvJowCHoSHLmCffcGazS
         Jp2pWjGDHbE2gdZBt22TzHNfvoPwtHlnQPnqlO/KoTvpCJISK1oMRDjZfNG1ZYz4Bkt5
         gYj6Y3I83eoiYgO5TAGdZlmI5kyPRl33Q1357xRmZhSJ1aI/fkLlYaVHnXdEkljLc/6o
         MrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744002090; x=1744606890;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJzpjcltssyTndX39CXnR31oCFaKZdU16+qgh2x63Vg=;
        b=PE8fnUW+Rd0Q30vXIQ89u6tclPmaMdnULw3iXmxioYFBgZUO75EtczYoYsVC3eyR2d
         UwpXv0WOd6Jg7E3W0xblh7Fo40QLTtApZPZ8WAtxxKDoLi3460abB7OOd8bBBEWIgBGB
         4l4HB9s9iCxzxbmxG4gtnXbUx4sM9l1d9iJ999Sw8R2S45v+OCi6I/0Su7WI8vAF/cO6
         kDMgDwWJnvzW6AbmihQeI5L+qe282XpC1vFq5u8/B7HTj71bwVs1/aSZQqigvmJYaOiU
         Q+xJDophcrpEV3KK/WDxqan6Two8B9aIRBiunF2YL92z4pBOPINp78P8HNmU+RwwPBRS
         OOcw==
X-Forwarded-Encrypted: i=1; AJvYcCU+Frvy1O0NXjy+nKruCsLAo0uLdC48JhEG0MN6eEvozCPqNdEgvP4ptrcqjDBOmd3qCadVoN1K/jSVLwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLy2+yRZxnLa0jKPMo61RrOLILtf+SZZgE6VIWbT1VAxDfiNQ2
	iuVo/N3edIucJe7SP5+jtzaB6os1a31vY4YpLtu58blanH8hbRF9i8jrUQ4987O6Fri9YPxx98h
	evA8g2Q==
X-Google-Smtp-Source: AGHT+IF04qgBoVxDOc49hH7Vp/li+r40rUQDo1djjDt+aWnNZByAYG8kgDAXB8ulUE/trExk1fRrj4gFhiq7
X-Received: from pjbdb3.prod.google.com ([2002:a17:90a:d643:b0:2ea:3a1b:f493])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f0c:b0:2fe:a515:4a98
 with SMTP id 98e67ed59e1d1-306a48b3f9dmr14334638a91.31.1744002090039; Sun, 06
 Apr 2025 22:01:30 -0700 (PDT)
Date: Sun,  6 Apr 2025 22:00:56 -0700
In-Reply-To: <20250407050101.1389825-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407050101.1389825-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407050101.1389825-12-irogers@google.com>
Subject: [PATCH v2 11/16] perf intel-tpebs: Add mutex for tpebs_results
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

Ensure sample reader isn't racing with events being added/removed.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 51 ++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 452ce3698221..29616d087bce 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -16,6 +16,7 @@
 #include "debug.h"
 #include "evlist.h"
 #include "evsel.h"
+#include "mutex.h"
 #include "session.h"
 #include "tool.h"
 #include "cpumap.h"
@@ -32,6 +33,7 @@ bool tpebs_recording;
 static LIST_HEAD(tpebs_results);
 static pthread_t tpebs_reader_thread;
 static struct child_process tpebs_cmd;
+static struct mutex tpebs_mtx;
 
 struct tpebs_retire_lat {
 	struct list_head nd;
@@ -51,6 +53,19 @@ struct tpebs_retire_lat {
 
 static struct tpebs_retire_lat *tpebs_retire_lat__find(struct evsel *evsel);
 
+static void tpebs_mtx_init(void)
+{
+	mutex_init(&tpebs_mtx);
+}
+
+static struct mutex *tpebs_mtx_get(void)
+{
+	static pthread_once_t tpebs_mtx_once = PTHREAD_ONCE_INIT;
+
+	pthread_once(&tpebs_mtx_once, tpebs_mtx_init);
+	return &tpebs_mtx;
+}
+
 static int evsel__tpebs_start_perf_record(struct evsel *evsel, int control_fd[], int ack_fd[])
 {
 	const char **record_argv;
@@ -59,13 +74,15 @@ static int evsel__tpebs_start_perf_record(struct evsel *evsel, int control_fd[],
 	char cpumap_buf[50];
 	struct tpebs_retire_lat *t;
 
+	mutex_lock(tpebs_mtx_get());
 	list_for_each_entry(t, &tpebs_results, nd)
 		tpebs_event_size++;
 
 	record_argv = malloc((10 + 2 * tpebs_event_size) * sizeof(*record_argv));
-	if (!record_argv)
+	if (!record_argv) {
+		mutex_unlock(tpebs_mtx_get());
 		return -ENOMEM;
-
+	}
 	record_argv[i++] = "perf";
 	record_argv[i++] = "record";
 	record_argv[i++] = "-W";
@@ -101,6 +118,7 @@ static int evsel__tpebs_start_perf_record(struct evsel *evsel, int control_fd[],
 	list_for_each_entry(t, &tpebs_results, nd)
 		t->started = true;
 
+	mutex_unlock(tpebs_mtx_get());
 	return ret;
 }
 
@@ -112,9 +130,12 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 {
 	struct tpebs_retire_lat *t;
 
+	mutex_lock(tpebs_mtx_get());
 	t = tpebs_retire_lat__find(evsel);
-	if (!t)
+	if (!t) {
+		mutex_unlock(tpebs_mtx_get());
 		return -EINVAL;
+	}
 	/*
 	 * Need to handle per core results? We are assuming average retire
 	 * latency value will be used. Save the number of samples and the sum of
@@ -123,6 +144,7 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 	t->count += 1;
 	t->sum += sample->retire_lat;
 	t->val = (double) t->sum / t->count;
+	mutex_unlock(tpebs_mtx_get());
 	return 0;
 }
 
@@ -229,7 +251,6 @@ static struct tpebs_retire_lat *tpebs_retire_lat__new(struct evsel *evsel)
 		return NULL;
 	}
 	result->evsel = evsel;
-	list_add_tail(&result->nd, &tpebs_results);
 	return result;
 }
 
@@ -282,16 +303,22 @@ static struct tpebs_retire_lat *tpebs_retire_lat__find(struct evsel *evsel)
 static int evsel__tpebs_prepare(struct evsel *evsel)
 {
 	struct evsel *pos;
-	struct tpebs_retire_lat *tpebs_event = tpebs_retire_lat__find(evsel);
+	struct tpebs_retire_lat *tpebs_event;
 
+	mutex_lock(tpebs_mtx_get());
+	tpebs_event = tpebs_retire_lat__find(evsel);
 	if (tpebs_event) {
 		/* evsel, or an identically named one, was already prepared. */
+		mutex_unlock(tpebs_mtx_get());
 		return 0;
 	}
 	tpebs_event = tpebs_retire_lat__new(evsel);
 	if (!tpebs_event)
 		return -ENOMEM;
 
+	list_add_tail(&tpebs_event->nd, &tpebs_results);
+	mutex_unlock(tpebs_mtx_get());
+
 	/*
 	 * Eagerly prepare all other evsels on the list to try to ensure that by
 	 * open they are all known.
@@ -317,6 +344,7 @@ static int evsel__tpebs_prepare(struct evsel *evsel)
 int evsel__tpebs_open(struct evsel *evsel)
 {
 	int ret;
+	bool tpebs_empty;
 
 	/* We should only run tpebs_start when tpebs_recording is enabled. */
 	if (!tpebs_recording)
@@ -336,7 +364,10 @@ int evsel__tpebs_open(struct evsel *evsel)
 	if (ret)
 		return ret;
 
-	if (!list_empty(&tpebs_results)) {
+	mutex_lock(tpebs_mtx_get());
+	tpebs_empty = list_empty(&tpebs_results);
+	mutex_unlock(tpebs_mtx_get());
+	if (!tpebs_empty) {
 		struct pollfd pollfd = { .events = POLLIN, };
 		int control_fd[2], ack_fd[2], len;
 		char ack_buf[8];
@@ -436,8 +467,10 @@ int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread)
 	 */
 	tpebs_stop();
 
+	mutex_lock(tpebs_mtx_get());
 	t = tpebs_retire_lat__find(evsel);
 	val = rint(t->val);
+	mutex_unlock(tpebs_mtx_get());
 
 	if (old_count) {
 		count->val = old_count->val + val;
@@ -460,9 +493,13 @@ int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread)
  */
 void evsel__tpebs_close(struct evsel *evsel)
 {
-	struct tpebs_retire_lat *t = tpebs_retire_lat__find(evsel);
+	struct tpebs_retire_lat *t;
 
+	mutex_lock(tpebs_mtx_get());
+	t = tpebs_retire_lat__find(evsel);
+	list_del_init(&t->nd);
 	tpebs_retire_lat__delete(t);
+	mutex_unlock(tpebs_mtx_get());
 
 	if (list_empty(&tpebs_results))
 		tpebs_stop();
-- 
2.49.0.504.g3bcea36a83-goog

