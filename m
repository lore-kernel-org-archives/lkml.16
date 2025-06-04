Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED2214223
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749059174; cv=none; b=C63Ln8CX108ejpE1x/y5eHGaMUBYw/uFU0FvaX82AsPc0UyYvtwXP9MmgXTG+V/11j9zO7Pp5IKDEqs2G34E1wL17ORrv+58p7IvGVThJ/WbDoU8yJ3NkTrMOTYxNpwNmioebdeSlCapvzidBb42Nh0KBuTyfzYxd1O0gXnK+wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749059174; c=relaxed/simple;
	bh=8RJTcbaavtRa5sssuUXNrJxuZWZPCsk1MDl7ZbD+Gww=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=nMr5bKZm/Rx5sPuxHBwVAVsCpqAVkIU0bNV+ylBGJHJF2k0LMuHad7lqhGARRJu1FcKGshpT2HACtdlh6vyTDd7J+BAns2QDBqsoYR4NrWfDX0jiAN9FMsmtR3gUPpJaUoxJKwtb5J4GbC0+SIz2X1wY5uHR6i7bg5DMlValz/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zlPWCFzW; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zlPWCFzW"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-72c316b7bfbso5675a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749059171; x=1749663971; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9yNfn5eRAho4EtZBNKkQLz+u3xqVjqDGPhEDNh7DTo=;
        b=zlPWCFzW9bZLo1g3Lwjsbw7mt6NYV9vAqHJtPeYRcZpQRZGnBAAfsMFLMUje4y9DXA
         sNbY9+sMjbtmkV8lc9XYtiViYYDJKLptcjHJvNfpaPs4PktpgQnejhrvo+1+QD/Q98Mz
         b1BAOo712tlyQnMmPcSe9TXY47PujMzrgncheIMDGlEd4V83Zvg8sAAjN2lSFrKCa6TR
         yhbvaHpXf2uiiXHuyVnfFBh2XKhyvc/BtYID1SER4f02d37umvvORGgfDdDqno2g/lbq
         acaidgsBXJ5R5cRWzNZuQcKrh4hoKO8FhnqFjq9FH8mp/CbGsRnBnfJtG7jiQASLzpiF
         AbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749059171; x=1749663971;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9yNfn5eRAho4EtZBNKkQLz+u3xqVjqDGPhEDNh7DTo=;
        b=hzpeO7jKPFiTeNE4W+hOVHsg1aHJ/qsiqK2QKuoFEduY4IVJCopCqNGi3ahnC6qadx
         TV0PBrswOL9PNjOVpExQBnVNySVPotjxy15K44kx1dQqns3vSy8Tl+p9WTA3lCRZlJC/
         3r8p6g1vrO62/vI+ZxaBUS++gX5NBlPq+5Osx3u+J0lnpXWnVFWmmqktHvVVa+sjEFu8
         2jd0kkQXb7brKUi6rFogFqFpeTzf0li6Adi+cpIjvcoOL7FSe9BM6JO/x1hVF4vS61tK
         7ZmxRYpFw32qQ8k1sv6KHKCqQQdSFL1M9J+69xHH0OtL4awrwZYB0zYHfZb/l38NAfUR
         PGog==
X-Forwarded-Encrypted: i=1; AJvYcCWtApMiqqDB5L7RMNC7//vzwPVCV+BghSR/ZbGKyoMqCjmJ5pRaVnJOd2fbXn/v/pye5Kh5OwE/omSQA18=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhOHA+BA8jsjGuxFmzefzeiACv/xk7D5pekSUrcOldhnST1f33
	qexri5lixAYFkDR/B+ptjwGfDe4gfluoLeuixcVeSsRixVbpXKkkxb3SpTlV6d2KuXWDGueIIpU
	bfdJpe+Zodw==
X-Google-Smtp-Source: AGHT+IE4gdMazXA+ZZ6u3qKDsWCX/dGkg5TUamz7U+qJ4v0aidP3AWFrx6m+vMK2PI1EgHELPCzVbt1PxPI4
X-Received: from oabky6.prod.google.com ([2002:a05:6871:4046:b0:2b8:45b4:8afc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:8a2a:b0:29e:503a:7ea3
 with SMTP id 586e51a60fabf-2e9bf641bb8mr2664304fac.36.1749059171203; Wed, 04
 Jun 2025 10:46:11 -0700 (PDT)
Date: Wed,  4 Jun 2025 10:45:41 -0700
In-Reply-To: <20250604174545.2853620-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250604174545.2853620-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250604174545.2853620-8-irogers@google.com>
Subject: [PATCH v4 07/10] perf trace: Switch user option to use BPF filter
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
where the uid doesn't match. Ensure adding the BPF filter forces
system-wide.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-trace.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index 2ab1b8e05ad3..4bb062b96f51 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -236,6 +236,7 @@ struct trace {
 		struct ordered_events	data;
 		u64			last;
 	} oe;
+	const char		*uid_str;
 };
 
 static void trace__load_vmlinux_btf(struct trace *trace __maybe_unused)
@@ -4412,8 +4413,8 @@ static int trace__run(struct trace *trace, int argc, const char **argv)
 		evlist__add(evlist, pgfault_min);
 	}
 
-	/* Enable ignoring missing threads when -u/-p option is defined. */
-	trace->opts.ignore_missing_thread = trace->opts.target.uid != UINT_MAX || trace->opts.target.pid;
+	/* Enable ignoring missing threads when -p option is defined. */
+	trace->opts.ignore_missing_thread = trace->opts.target.pid;
 
 	if (trace->sched &&
 	    evlist__add_newtp(evlist, "sched", "sched_stat_runtime", trace__sched_stat_runtime))
@@ -5445,8 +5446,7 @@ int cmd_trace(int argc, const char **argv)
 		    "child tasks do not inherit counters"),
 	OPT_CALLBACK('m', "mmap-pages", &trace.opts.mmap_pages, "pages",
 		     "number of mmap data pages", evlist__parse_mmap_pages),
-	OPT_STRING('u', "uid", &trace.opts.target.uid_str, "user",
-		   "user to profile"),
+	OPT_STRING('u', "uid", &trace.uid_str, "user", "user to profile"),
 	OPT_CALLBACK(0, "duration", &trace, "float",
 		     "show only events with duration > N.M ms",
 		     trace__set_duration),
@@ -5804,11 +5804,19 @@ int cmd_trace(int argc, const char **argv)
 		goto out_close;
 	}
 
-	err = target__parse_uid(&trace.opts.target);
-	if (err) {
-		target__strerror(&trace.opts.target, err, bf, sizeof(bf));
-		fprintf(trace.output, "%s", bf);
-		goto out_close;
+	if (trace.uid_str) {
+		uid_t uid = parse_uid(trace.uid_str);
+
+		if (uid == UINT_MAX) {
+			ui__error("Invalid User: %s", trace.uid_str);
+			err = -EINVAL;
+			goto out_close;
+		}
+		err = parse_uid_filter(trace.evlist, uid);
+		if (err)
+			goto out_close;
+
+		trace.opts.target.system_wide = true;
 	}
 
 	if (!argc && target__none(&trace.opts.target))
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

