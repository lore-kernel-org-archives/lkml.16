Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865B8254B06
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 21:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744060239; cv=none; b=tJ4E8cVDcKiKL7VwzmlWFeceWUYr+/K8KPjs2XofdpTgKYXs8edERp+55fRH8Jcc0XOKxfNk8j+FxFEZc2+6loMNNSdUVq7gOgQ212aiRS0M/Y2wi+gUymPB635x6+Gw40m0HsDNzhIn9+tFaUoO862gvMhY0o6EDMxs24Bq6bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744060239; c=relaxed/simple;
	bh=x712Sf+REbTmULA7rLtp2gm66BCVWDC8OsSNLy0MlXs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=MY8Fl1cxH9ml+bOINsNPB4GgQm0hicj90aHB60nCt3/1YORjt+RLZSL0EYsbk8555O7M027oUpgKb6jMrE5N7E/ksXAf+n1oqvA+3jARPe18Zn6ggVN3LJm32UwiFBRPyCGYOO+8DzvKbix/R+tuDKAOgo1hamf3coKsqdykQV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2sRiGEmx; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2sRiGEmx"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af5329791f1so3586966a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 14:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744060237; x=1744665037; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1svmlgZ1hdj/s5BLTsbiEJmcy0BtMBOLnzcKMtls/k=;
        b=2sRiGEmxPhylJN01ed7DX+uPbo4/HxTftRN7SFmz+MNBdNuVUZhxHGZOwFkX30y1Ql
         nNchujkbAMZlG+zxFS4ROe5Zc29+MZ/UvqLuWSZSNWVZhLT9e7vhW7xNfPLEokEHUuWj
         rEnWFfB0uvpYXwXfR/paTMdYvU8r+yax0v8msk9RBIj83tGnXSgz2Q63HwC9SbVREcma
         +tN1j1J/AIznTQKepFIDLa+hVIiSaGQqpQSQU7qi935qmevtHU9suBzqeTIX4xKKN3wh
         37fOmt4axZ+N9dVUMZoZHuShCNqbXUTmxZfsEEUtFtWbCAKiaEFgWBCvuh6v4pKdT4/2
         OujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744060237; x=1744665037;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1svmlgZ1hdj/s5BLTsbiEJmcy0BtMBOLnzcKMtls/k=;
        b=vZ5W7l4qj9GpZTZPGwR6xMZgfJPCBCOw3NvPYZ9dnfXnANbIvZXNA20QVzj1p13wuJ
         xgySAghZ9r4q0NCC/MmnxjeOotctiqsORpS60YDoLK1Esk6ClY6dKjTdHmdIdyg4+GaF
         iUhjA0aZP6P/3Cii2EvtejwhkCvbBPSrQAGfiYT9mUE4l+9FxJZ8qNPXTJAvPw/Wo7O3
         VIyBsZrCvHaQ6yuk3qNsxGoh515xkkSfg4SZaqWWXJu7DwOQTHwHZ9W1u5WzW6cYNmDj
         e7rhIoKp8wCxOMzpMNyfVvlK2riQdX1Jlvy3KmzkCQ6TLutQOT8Y7Jn13yGS0ag5HXZP
         TTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX89xrg0Y0tIKeQjO3d3CEE3cr8+BT6X+O2JxTe4BTWE7hyggDu5lcAhhaqOqosaynSERqkKWhPWEwagqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU1S8HzVrs655xWbwirssCEotyJTP/5YS+9Eaux480jrRkmrfn
	mw+oR2iJ39h9RKTgAq2bA4OswJbudPeqRX1/zcCXR31vHFIWZGCZ5qh6Fse8TVwHh2jTVhyknKd
	Y1ikMiA==
X-Google-Smtp-Source: AGHT+IH+afIrKpqPXcZF8fKrH42N9R2uOY/IteCCDWB/4EJvLNqiOBA8K/dKFiY/HEtJU79AGqPXXoYPbFhz
X-Received: from pjboi8.prod.google.com ([2002:a17:90b:3a08:b0:2f4:465d:5c61])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b83:b0:2e2:c2b0:d03e
 with SMTP id 98e67ed59e1d1-306d0bf1183mr987286a91.5.1744060237034; Mon, 07
 Apr 2025 14:10:37 -0700 (PDT)
Date: Mon,  7 Apr 2025 14:09:30 -0700
In-Reply-To: <20250407210937.131681-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407210937.131681-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407210937.131681-10-irogers@google.com>
Subject: [PATCH v3 09/16] perf intel-tpebs: Refactor tpebs_results list
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

evsel names and metric-ids are used for matching but this can be
problematic, for example, multiple occurrences of the same retirement
latency event become a single event for the record. Change the name of
the record events so they are unique and reflect the evsel of the
retirement latency event that opens them (the retirement latency
event's evsel address is embedded within them). This allows an evsel
based close to close the event when the retirement latency event is
closed. This is important as perf stat has an evlist and the session
listen to the record events has an evlist, knowing which event should
remove the tpebs_retire_lat can't be tied to an evlist list as there
is more than 1, so closing which evlist should cause the tpebs to
stop? Using the evsel and the last one out doing the tpebs_stop is
cleaner.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-stat.c     |   2 -
 tools/perf/util/evlist.c      |   1 -
 tools/perf/util/evsel.c       |   2 +-
 tools/perf/util/intel-tpebs.c | 150 +++++++++++++++++++++-------------
 tools/perf/util/intel-tpebs.h |   2 +-
 5 files changed, 93 insertions(+), 64 deletions(-)

diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
index 68ea7589c143..80e491bd775b 100644
--- a/tools/perf/builtin-stat.c
+++ b/tools/perf/builtin-stat.c
@@ -681,8 +681,6 @@ static enum counter_recovery stat_handle_error(struct evsel *counter)
 	if (child_pid != -1)
 		kill(child_pid, SIGTERM);
 
-	tpebs_delete();
-
 	return COUNTER_FATAL;
 }
 
diff --git a/tools/perf/util/evlist.c b/tools/perf/util/evlist.c
index c1a04141aed0..0a21da4f990f 100644
--- a/tools/perf/util/evlist.c
+++ b/tools/perf/util/evlist.c
@@ -183,7 +183,6 @@ void evlist__delete(struct evlist *evlist)
 	if (evlist == NULL)
 		return;
 
-	tpebs_delete();
 	evlist__free_stats(evlist);
 	evlist__munmap(evlist);
 	evlist__close(evlist);
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 121283f2f382..554252ed1aab 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -2759,7 +2759,7 @@ int evsel__open(struct evsel *evsel, struct perf_cpu_map *cpus,
 void evsel__close(struct evsel *evsel)
 {
 	if (evsel__is_retire_lat(evsel))
-		tpebs_delete();
+		evsel__tpebs_close(evsel);
 	perf_evsel__close(&evsel->core);
 	perf_evsel__free_id(&evsel->core);
 }
diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index e42f3ec39a64..a723687e67f6 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -35,10 +35,10 @@ static struct child_process tpebs_cmd;
 
 struct tpebs_retire_lat {
 	struct list_head nd;
-	/* Event name */
-	char *name;
-	/* Event name with the TPEBS modifier R */
-	const char *tpebs_name;
+	/** @evsel: The evsel that opened the retire_lat event. */
+	struct evsel *evsel;
+	/** @event: Event passed to perf record. */
+	char *event;
 	/* Count of retire_latency values found in sample data */
 	size_t count;
 	/* Sum of all the retire_latency values in sample data */
@@ -49,6 +49,8 @@ struct tpebs_retire_lat {
 	bool started;
 };
 
+static struct tpebs_retire_lat *tpebs_retire_lat__find(struct evsel *evsel);
+
 static int evsel__tpebs_start_perf_record(struct evsel *evsel, int control_fd[], int ack_fd[])
 {
 	const char **record_argv;
@@ -85,7 +87,7 @@ static int evsel__tpebs_start_perf_record(struct evsel *evsel, int control_fd[],
 
 	list_for_each_entry(t, &tpebs_results, nd) {
 		record_argv[i++] = "-e";
-		record_argv[i++] = t->name;
+		record_argv[i++] = t->event;
 	}
 	record_argv[i++] = NULL;
 	assert(i == 10 + 2 * tpebs_event_size || i == 8 + 2 * tpebs_event_size);
@@ -108,27 +110,20 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 				struct evsel *evsel,
 				struct machine *machine __maybe_unused)
 {
-	int ret = 0;
-	const char *evname;
 	struct tpebs_retire_lat *t;
 
-	evname = evsel__name(evsel);
-
+	t = tpebs_retire_lat__find(evsel);
+	if (!t)
+		return -EINVAL;
 	/*
 	 * Need to handle per core results? We are assuming average retire
 	 * latency value will be used. Save the number of samples and the sum of
 	 * retire latency value for each event.
 	 */
-	list_for_each_entry(t, &tpebs_results, nd) {
-		if (!strcmp(evname, t->name)) {
-			t->count += 1;
-			t->sum += sample->retire_lat;
-			t->val = (double) t->sum / t->count;
-			break;
-		}
-	}
-
-	return ret;
+	t->count += 1;
+	t->sum += sample->retire_lat;
+	t->val = (double) t->sum / t->count;
+	return 0;
 }
 
 static int process_feature_event(struct perf_session *session,
@@ -183,50 +178,98 @@ static int tpebs_stop(void)
 	return ret;
 }
 
-static char *evsel__tpebs_name(struct evsel *evsel)
+/**
+ * evsel__tpebs_event() - Create string event encoding to pass to `perf record`.
+ */
+static int evsel__tpebs_event(struct evsel *evsel, char **event)
 {
 	char *name, *modifier;
+	int ret;
 
 	name = strdup(evsel->name);
 	if (!name)
-		return NULL;
+		return -ENOMEM;
 
 	modifier = strrchr(name, 'R');
 	if (!modifier) {
-		pr_err("Tpebs event missing modifier '%s'\n", name);
-		free(name);
-		return NULL;
+		ret = -EINVAL;
+		goto out;
 	}
-
 	*modifier = 'p';
-	return name;
+	modifier = strchr(name, ':');
+	if (!modifier)
+		modifier = strrchr(name, '/');
+	if (!modifier) {
+		ret = -EINVAL;
+		goto out;
+	}
+	*modifier = '\0';
+	if (asprintf(event, "%s/name=tpebs_event_%p/%s", name, evsel, modifier + 1) > 0)
+		ret = 0;
+	else
+		ret = -ENOMEM;
+out:
+	if (ret)
+		pr_err("Tpebs event modifier broken '%s'\n", evsel->name);
+	free(name);
+	return ret;
 }
 
 static struct tpebs_retire_lat *tpebs_retire_lat__new(struct evsel *evsel)
 {
 	struct tpebs_retire_lat *result = zalloc(sizeof(*result));
+	int ret;
 
 	if (!result)
 		return NULL;
 
-	result->tpebs_name = evsel->name;
-	result->name = evsel__tpebs_name(evsel);
-	if (!result->name) {
+	ret = evsel__tpebs_event(evsel, &result->event);
+	if (ret) {
 		free(result);
 		return NULL;
 	}
+	result->evsel = evsel;
 	list_add_tail(&result->nd, &tpebs_results);
 	return result;
 }
 
+static void tpebs_retire_lat__delete(struct tpebs_retire_lat *r)
+{
+	zfree(&r->event);
+	free(r);
+}
+
 static struct tpebs_retire_lat *tpebs_retire_lat__find(struct evsel *evsel)
 {
 	struct tpebs_retire_lat *t;
+	uint64_t num;
+	const char *evsel_name;
 
+	/*
+	 * Evsels will match for evlist with the retirement latency event. The
+	 * name with "tpebs_event_" prefix will be present on events being read
+	 * from `perf record`.
+	 */
+	if (evsel__is_retire_lat(evsel)) {
+		list_for_each_entry(t, &tpebs_results, nd) {
+			if (t->evsel == evsel)
+				return t;
+		}
+		return NULL;
+	}
+	evsel_name = strstr(evsel->name, "tpebs_event_");
+	if (!evsel_name) {
+		/* Unexpected that the perf record should have other events. */
+		return NULL;
+	}
+	errno = 0;
+	num = strtoull(evsel_name + 12, NULL, 16);
+	if (errno) {
+		pr_err("Bad evsel for tpebs find '%s'\n", evsel->name);
+		return NULL;
+	}
 	list_for_each_entry(t, &tpebs_results, nd) {
-		if (t->tpebs_name == evsel->name ||
-		    !strcmp(t->tpebs_name, evsel->name) ||
-		    (evsel->metric_id && !strcmp(t->tpebs_name, evsel->metric_id)))
+		if ((uint64_t)t->evsel == num)
 			return t;
 	}
 	return NULL;
@@ -363,8 +406,12 @@ int evsel__tpebs_open(struct evsel *evsel)
 		close(ack_fd[0]);
 		close(ack_fd[1]);
 	}
-	if (ret)
-		tpebs_delete();
+	if (ret) {
+		struct tpebs_retire_lat *t = tpebs_retire_lat__find(evsel);
+
+		list_del_init(&t->nd);
+		tpebs_retire_lat__delete(t);
+	}
 	return ret;
 }
 
@@ -414,34 +461,19 @@ int tpebs_set_evsel(struct evsel *evsel, int cpu_map_idx, int thread)
 	return 0;
 }
 
-static void tpebs_retire_lat__delete(struct tpebs_retire_lat *r)
-{
-	zfree(&r->name);
-	free(r);
-}
-
-
-/*
- * tpebs_delete - delete tpebs related data and stop the created thread and
- * process by calling tpebs_stop().
- *
- * This function is called from evlist_delete() and also from builtin-stat
- * stat_handle_error(). If tpebs_start() is called from places other then perf
- * stat, need to ensure tpebs_delete() is also called to safely free mem and
- * close the data read thread and the forked perf record process.
+/**
+ * evsel__tpebs_close() - delete tpebs related data. If the last event, stop the
+ * created thread and process by calling tpebs_stop().
  *
- * This function is also called in evsel__close() to be symmetric with
- * tpebs_start() being called in evsel__open(). We will update this call site
- * when move tpebs_start() to evlist level.
+ * This function is called in evsel__close() to be symmetric with
+ * evsel__tpebs_open() being called in evsel__open().
  */
-void tpebs_delete(void)
+void evsel__tpebs_close(struct evsel *evsel)
 {
-	struct tpebs_retire_lat *r, *rtmp;
+	struct tpebs_retire_lat *t = tpebs_retire_lat__find(evsel);
 
-	tpebs_stop();
+	tpebs_retire_lat__delete(t);
 
-	list_for_each_entry_safe(r, rtmp, &tpebs_results, nd) {
-		list_del_init(&r->nd);
-		tpebs_retire_lat__delete(r);
-	}
+	if (list_empty(&tpebs_results))
+		tpebs_stop();
 }
diff --git a/tools/perf/util/intel-tpebs.h b/tools/perf/util/intel-tpebs.h
index cc98203719c8..5c671181ec60 100644
--- a/tools/perf/util/intel-tpebs.h
+++ b/tools/perf/util/intel-tpebs.h
@@ -11,7 +11,7 @@ struct evsel;
 extern bool tpebs_recording;
 
 int evsel__tpebs_open(struct evsel *evsel);
-void tpebs_delete(void);
+void evsel__tpebs_close(struct evsel *evsel);
 int tpebs_set_evsel(struct evsel *evsel, int cpu_map_idx, int thread);
 
 #endif /* __INTEL_TPEBS_H */
-- 
2.49.0.504.g3bcea36a83-goog

