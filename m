Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854BA28E5E6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652529; cv=none; b=l4KCDwL1LjOX6zzdrPtcV3GaybdsHbhZACnwGrXGECh81H4fUZ6L/UUINFOXgwreLSEaoqbDX/LMAFh19hw0Yio6aK93jMj7bZSoExkwT0lDxd/AtueHtzgSD3M2jc3mn0BkpiiuwYDhwr77CaeSQMWjbLyD1IRbATRVsLzSrds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652529; c=relaxed/simple;
	bh=w1EZ7SZI9fDDkdvQk8qfQctTw0UoNSKrjDMhX8UQJ6o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=o6Zvr1hMnvj9ji1RwsJmN0Ckg7NsBgUKvKTnBQuycJsDg2Uz9FDkK6i1fO4sFusXOv+g1G5Z6zB+Ya+eQxwUgqJ3nqrn/Y8dCShe9RJWvvyaVeF1xPy3NZhG4/PW+mrixvjequn+zlugrlV8tAJbz6p6vUn7wc8QxPL5hZgpEfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HKAMQk6u; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HKAMQk6u"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3032ea03448so4255951a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744652528; x=1745257328; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Q/2QxvKgBwpNRidHntZVw+BDhIuLs7JcmHsBDszg6o=;
        b=HKAMQk6uyQ4d2hbT2CQGYw2EyU0nCaUcYQBim9slkRBiyV6TNDExb+7SEVCYVvOTid
         rz/t9N8Td5CvOqnIyWJNY8gBpq1j0NYOVkC3A3AOSFU4IsWi2QtLsFA7jhiFnyqoNML8
         H6Le1WMmXfWJeuFM30bwOyeJtj2tatoIu9aiRaJoJQD2qP2GBdrcO7DB0SrTK3XzCluT
         CKBWGaRf0uMTwSpD8cj1IZyObrnadgnpX6iYQMRd+BxhONOlrV8NI4JmNo+5JnTyOo3r
         TDwdNizLtzh38/1lIjy6xh6l2AqcnpVP7u/948H8VouZPBL9TZ274rvJMvlcBHT99nue
         3Mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744652528; x=1745257328;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Q/2QxvKgBwpNRidHntZVw+BDhIuLs7JcmHsBDszg6o=;
        b=UwDxcpSejWJASD0icRud0tt3bhXVBTHOeO0CTpsf+DBMW+x3UJAtfS7khqT+tH+cwY
         vJ6SVwaKLTqLgSUUlfw0Mi0Fc04cEygok0r2A72TnAbE/swYiOeVG7f5O27F8aJIymM2
         8HUvzMqlU9XHbsaSkqH5e0lG6no+AH3q0tBUwl7T1eMX4yfRBmFD3mcxlqvJuoCV1Lqb
         ZEIpc9eKCRT0TZ2AtRY5uwbo01F7/hDt9pTGK4drrCN5wKnbZKGv/KfT+X4N8aDVDWKx
         TXOcdcISPpBMSIdPnvpUzueINgOcL2oZsvzIlVNYbJrLbzu/RK/GQZy+CTaLJDCpvaeQ
         iL4w==
X-Forwarded-Encrypted: i=1; AJvYcCVqLduGf/FvGg2BHCoMU71yNKd754CKg5HIsi/Q0pHodh+tbegJ9O5QQRE+EwciFhwqz8eEJB8mxvMQFO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjJ/JoOgP4zHGD7aRPlAfiO5Din1DBaX3ExLA8t9ZHCXtopKV+
	lgSg+EwhrnNdJ26W4exmWphiy+RR8V4BtUnq7wHHf1HsoOeuCv0GyTvXP5i/4gms16cvSvNWPas
	47gu8+A==
X-Google-Smtp-Source: AGHT+IHsX72kv7nW5H7UmGDIZduBS3wpm/m1tbynchBPRllDDYnQyo+nLM9To+gQafBY2Scul4pL3voAlg1B
X-Received: from pjxx16.prod.google.com ([2002:a17:90b:58d0:b0:2e5:5ffc:1c36])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e183:b0:2fa:15ab:4df5
 with SMTP id 98e67ed59e1d1-308237c1177mr16263891a91.34.1744652527829; Mon, 14
 Apr 2025 10:42:07 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:41:24 -0700
In-Reply-To: <20250414174134.3095492-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414174134.3095492-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250414174134.3095492-7-irogers@google.com>
Subject: [PATCH v5 06/16] perf intel-tpebs: Reduce scope of tpebs_events_size
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

Moved to record argument computation rather than being global.

Signed-off-by: Ian Rogers <irogers@google.com>
Tested-by: Weilin Wang <weilin.wang@intel.com>
Acked-by: Namhyung Kim <namhyung@kernel.org>
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
2.49.0.604.gff1f9ca942-goog

