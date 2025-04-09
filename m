Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EC01E04AD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178884; cv=none; b=oDWmmBIMpcG2kIcnhw/KhP41rb3INQs6xleB0pCMvFmj/zBR+RLXH0br2tEmtqbNG5hHv/Ywx79xEE3QYdIENGQM8Xj0ARE+A3Veimj0wH2eGAfay7w2msU6FLbb2hWAsJdFmQeLNw29xxCxsP4aQ4h3Pq9LkirNH+eeVnAlfAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178884; c=relaxed/simple;
	bh=JVanJEDpcMknG2x/X1wULUkE8JUqUZb8O7VIacDzqk4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=WHweTcD6nrKB4ThTdd5Nj11FnrDfY43iAHkFztXjW9G3Nd0d+IDEAjPtWYh8QAR1YMtDuq8rjXOI6MWwTW7LhoNZzd+Yw4hW4grGJwqXhsiQZO+SQRHMkQJd6y5l0Q7kwDz1qve2xKjnl58NlVciXYE4yZrsLx4txoSuDGIkCfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lnSYi8aK; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lnSYi8aK"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2242ade807fso101881805ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744178881; x=1744783681; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EpNqTL2jhuFhMzQj4yTZFm6mW4YS6L/CEY0JlzRGbe8=;
        b=lnSYi8aKN2oFUwmNMVXAwaFx5aVOrD3m+4R0EsJq5kpLrC4VJPTm4GbnVJQg7tUcj9
         1PHe33Zk+7obvwej9Az8+I3jbswkxLqJnN3dI3noplHg6Q/5+A0OGwvJ4XdGi0yP9lce
         BBVmYBSnfPNNNZRzsDHrixjuSdZe4V67kPK+9NzT2M7agUeRXfdzuPwoNcZatGaxKffz
         k9B1qfvFKrbYLoR57usNCAy7iIJEC3Cx8/q/8/cI+SDt2nJf+rEjxC3fEb5+yzNP+BpE
         NUy67ZmcW5cBFzJaR8BDsovCfDJIKIcEKvKegZ9PkNrTdATgWr329EqBqAusIVAFOvlN
         irhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178881; x=1744783681;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpNqTL2jhuFhMzQj4yTZFm6mW4YS6L/CEY0JlzRGbe8=;
        b=j3DHXR5EUYj0cTnaTnsPmZd+IJB2xVUVJrHzNBCSMqlz0DcGhoCVGumD4zlRbtLHW2
         lO+mhe2mDkKr8i4zoX5ocXcrcxSY/HuiNeA1CoMAp+a4HKUswHOLP7RKhtAfJlabYTf7
         MHP3fNBOq9hV99B8nxlZaHBustDUvG4gw1GbDrL1mUMnV3LcDDAPH/S4hyMIy7Ho/+10
         HtG9vyPHqeA1auteVq46ymn+OW0f4eI8YD0Z+3zopyLQcHOQEZV3MO6bboNTeaIff04n
         2P9+im+GrZP4DujNNiWxHdqkUrZ/xHmTZvFOx8b6zzKNw11SKxQrzgUGSVtWKS3+8dEW
         l/mw==
X-Forwarded-Encrypted: i=1; AJvYcCWKXyxGUvBrv8qri0WjPDzBsOn+OACl+wBdcIJNmO/Zr0HMxmg8a/SOKNQNbN0qLnRc2gE/AnixJiLUbSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhnJvIv2qJ2tiHSuDKwpGNuR25qPCC4TxiJx+Zc929ZCuosg7g
	I5ZlPLHaTl+A6GZgLijzLmeIGQtmZdaCct17bgvQNNlH1Kpynbdeqk80+rPhBOBMYy8QY7jlAKw
	3o2OmCA==
X-Google-Smtp-Source: AGHT+IEx0KhC3CwFMQDme2DZCtE576HmK2EHOC5yqvJLJfWsEtMFMyCqftDEJJaXDsMReWc+Ys7wnzCZMF3W
X-Received: from pjbtd8.prod.google.com ([2002:a17:90b:5448:b0:2f2:e97a:e77f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55cd:b0:2ff:5cb7:5e73
 with SMTP id 98e67ed59e1d1-306dbc0d002mr2454331a91.23.1744178881732; Tue, 08
 Apr 2025 23:08:01 -0700 (PDT)
Date: Tue,  8 Apr 2025 23:07:31 -0700
In-Reply-To: <20250409060744.698511-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250409060744.698511-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250409060744.698511-5-irogers@google.com>
Subject: [PATCH v4 04/16] perf intel-tpebs: Separate evsel__tpebs_prepare out
 of evsel__tpebs_open
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

Separate the creation of the tpebs_retire_lat result out of the
opening step. This is in preparation for adding a prepare operation
for evlists.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 133 ++++++++++++++++++++++------------
 1 file changed, 86 insertions(+), 47 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 566e0ddcad88..2186818b2c9b 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -37,7 +37,7 @@ static struct child_process tpebs_cmd;
 struct tpebs_retire_lat {
 	struct list_head nd;
 	/* Event name */
-	const char *name;
+	char *name;
 	/* Event name with the TPEBS modifier R */
 	const char *tpebs_name;
 	/* Count of retire_latency values found in sample data */
@@ -190,6 +190,82 @@ static int tpebs_stop(void)
 	return ret;
 }
 
+static char *evsel__tpebs_name(struct evsel *evsel)
+{
+	char *name, *modifier;
+
+	name = strdup(evsel->name);
+	if (!name)
+		return NULL;
+
+	modifier = strrchr(name, 'R');
+	if (!modifier) {
+		pr_err("Tpebs event missing modifier '%s'\n", name);
+		free(name);
+		return NULL;
+	}
+
+	*modifier = 'p';
+	return name;
+}
+
+static struct tpebs_retire_lat *tpebs_retire_lat__new(struct evsel *evsel)
+{
+	struct tpebs_retire_lat *result = zalloc(sizeof(*result));
+
+	if (!result)
+		return NULL;
+
+	result->tpebs_name = evsel->name;
+	result->name = evsel__tpebs_name(evsel);
+	if (!result->name) {
+		free(result);
+		return NULL;
+	}
+	list_add_tail(&result->nd, &tpebs_results);
+	tpebs_event_size++;
+	return result;
+}
+
+/**
+ * evsel__tpebs_prepare - create tpebs data structures ready for opening.
+ * @evsel: retire_latency evsel, all evsels on its list will be prepared.
+ */
+static int evsel__tpebs_prepare(struct evsel *evsel)
+{
+	struct evsel *pos;
+	struct tpebs_retire_lat *tpebs_event;
+
+	list_for_each_entry(tpebs_event, &tpebs_results, nd) {
+		if (!strcmp(tpebs_event->tpebs_name, evsel->name)) {
+			/*
+			 * evsel, or an identically named one, was already
+			 * prepared.
+			 */
+			return 0;
+		}
+	}
+	tpebs_event = tpebs_retire_lat__new(evsel);
+	if (!tpebs_event)
+		return -ENOMEM;
+
+	/*
+	 * Eagerly prepare all other evsels on the list to try to ensure that by
+	 * open they are all known.
+	 */
+	evlist__for_each_entry(evsel->evlist, pos) {
+		int ret;
+
+		if (pos == evsel || !pos->retire_lat)
+			continue;
+
+		ret = evsel__tpebs_prepare(pos);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 /**
  * evsel__tpebs_open - starts tpebs execution.
  * @evsel: retire_latency evsel, all evsels on its list will be selected. Each
@@ -197,10 +273,7 @@ static int tpebs_stop(void)
  */
 int evsel__tpebs_open(struct evsel *evsel)
 {
-	int ret = 0;
-	struct evsel *pos;
-	struct evlist *evsel_list = evsel->evlist;
-	char cpumap_buf[50];
+	int ret;
 
 	/*
 	 * We should only run tpebs_start when tpebs_recording is enabled.
@@ -209,49 +282,13 @@ int evsel__tpebs_open(struct evsel *evsel)
 	if (tpebs_cmd.pid != 0 || !tpebs_recording)
 		return 0;
 
-	cpu_map__snprint(evsel_list->core.user_requested_cpus, cpumap_buf, sizeof(cpumap_buf));
-	/*
-	 * Prepare perf record for sampling event retire_latency before fork and
-	 * prepare workload
-	 */
-	evlist__for_each_entry(evsel_list, pos) {
-		int i;
-		char *name;
-		struct tpebs_retire_lat *new;
-
-		if (!pos->retire_lat)
-			continue;
-
-		pr_debug("tpebs: Retire_latency of event %s is required\n", pos->name);
-		for (i = strlen(pos->name) - 1; i > 0; i--) {
-			if (pos->name[i] == 'R')
-				break;
-		}
-		if (i <= 0 || pos->name[i] != 'R') {
-			ret = -1;
-			goto err;
-		}
-
-		name = strdup(pos->name);
-		if (!name) {
-			ret = -ENOMEM;
-			goto err;
-		}
-		name[i] = 'p';
-
-		new = zalloc(sizeof(*new));
-		if (!new) {
-			ret = -1;
-			zfree(&name);
-			goto err;
-		}
-		new->name = name;
-		new->tpebs_name = pos->name;
-		list_add_tail(&new->nd, &tpebs_results);
-		tpebs_event_size += 1;
-	}
+	ret = evsel__tpebs_prepare(evsel);
+	if (ret)
+		return ret;
 
 	if (tpebs_event_size > 0) {
+		struct evlist *evsel_list = evsel->evlist;
+		char cpumap_buf[50];
 		struct pollfd pollfd = { .events = POLLIN, };
 		int control_fd[2], ack_fd[2], len;
 		char ack_buf[8];
@@ -268,6 +305,9 @@ int evsel__tpebs_open(struct evsel *evsel)
 			goto out;
 		}
 
+		cpu_map__snprint(evsel_list->core.user_requested_cpus, cpumap_buf,
+				 sizeof(cpumap_buf));
+
 		ret = start_perf_record(control_fd, ack_fd, cpumap_buf);
 		if (ret)
 			goto out;
@@ -321,7 +361,6 @@ int evsel__tpebs_open(struct evsel *evsel)
 		close(ack_fd[0]);
 		close(ack_fd[1]);
 	}
-err:
 	if (ret)
 		tpebs_delete();
 	return ret;
-- 
2.49.0.504.g3bcea36a83-goog

