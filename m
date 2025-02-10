Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEDC25743B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212698; cv=none; b=osxV2Plw+0Ypi62C78hF/wb1xOZEPbq4SzpebGPlAYLxenZLhyf7tK+xOeL1rVKZFRc9KcX/YAYP+1kJl5kcYTi8OghjXxpJMoFIieVa3xANZ4/GZxTCJ1fihpbXjm6w6NA4DkeyVGOShAQS/xSaASHZ/yEt/x0hTv+SU4/ACEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212698; c=relaxed/simple;
	bh=OFakRqNQKHADdpdhmZgfVErGfxtO80Hgq1mtytTW264=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=fUfmmnCoF7iiT5c0DHyYLRdC25pRqaIOhHA0Ij3ssgmARhwmGb8/dX+jaF1Mwaix4dcFxgIxLAz+qs9Y1V2TeRTBxeeHvkHFkglimFMi3qeASP7U2VIe8z3mKnTrn/61MF/OR4asIoJk57ebKAGUCMraeQOMFArllL/B8rN0xdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qtqYaJwH; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qtqYaJwH"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e5b2bf5a317so7255130276.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739212695; x=1739817495; darn=vger.kernel.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYBVa7z0m4z3JsO7DUulpiX1vMOJnR6DEMUcDKBuhfA=;
        b=qtqYaJwHcdPbGa6uWIo4NL37DHQxutq+G1HWSKu9sCcmi/Q2xzHRgTy2aml6ep5QG+
         Pid4BuVBXLm/ZBkcJoPWYH6JCDO/xiRYvdX2Pnt9OKINUQM2hIhVT/DsXXBhWufr4Khl
         Bqegvo9SsGH1j249gBHsRvmcaHtCDb+l1kBT2zrh+wbVN8mbLxjbY+XbY7GooIX7aBwg
         HJXH9dhph+ARkxHgDhzSM9UykfB9d9FcRHYdUhoyXyGhfKWWHoxlee+aIHsicgleplCN
         iK6qeq3urwPd8dEejrPEFwDXR4h1fGM0C+lvUlLG8f/74WCdB2BUXRaarjUx8xI1W5qL
         QzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212695; x=1739817495;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYBVa7z0m4z3JsO7DUulpiX1vMOJnR6DEMUcDKBuhfA=;
        b=blS+8Px/U1InGTUXDbuPTdyxk+//affoPLD5l6nBaZZmxPcJ2ibPjVM2KS7zCa4SDB
         pZv5aHK9y62nc+Cl2bslju+F8bu/j0Mpms9gUnTWL5OHP8/X58qIReuautUcLlDO4xhi
         lPJdJOTXIQC2OqskDlqkBNMoxlCyAaHYDPaYa/HHZ9sisEmrwWVOwODY+Ej2q5e13d30
         ifaTGk7SdeXRzYEFrBxktjAQbL8qhUWOo/7Wjam46ltDZ0ubz8fnX/on0Ni5Y8Gz4wMo
         XY6XfZCnbTI6Adx9ffK3uqJxqs9UOljffU/AKiTMgWWX/Vsyi/0/0tk36dj+Mw9ec/gF
         pSOw==
X-Forwarded-Encrypted: i=1; AJvYcCVM8p8RRYNHEl0ufsXxhBG5yqorfzS2yv6u9FebCGjvj0SuDqoU4B/WOnHLl9Ji48sPtjitwFScQoiwQ1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvGNJd+LQoKBQoQuN+PQYpiPpkuXQltAjnfT3BPyE1fzuJqC/s
	pqFKvUU9Mk+BzWEr96npj5MomiXC9UbGdn0hOtHcECQmItz8cEk7Hj8vbHg9NrUiVOXMEsBGGnL
	qwMQSag==
X-Google-Smtp-Source: AGHT+IHKeCisUol3zDmhjIr5zbOJ7wY6aZEFAXOChmLKaU4l4cT6Voj+AsLIzjf79+Pu4qf2BTOgzii8z1sH
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:c64e:af58:30d4:168d])
 (user=irogers job=sendgmr) by 2002:a25:7a44:0:b0:e5b:3445:d33c with SMTP id
 3f1490d57ef6-e5b461801d0mr111693276.3.1739212695310; Mon, 10 Feb 2025
 10:38:15 -0800 (PST)
Date: Mon, 10 Feb 2025 10:38:05 -0800
In-Reply-To: <20250210183808.130522-1-irogers@google.com>
Message-Id: <20250210183808.130522-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250210183808.130522-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Subject: [PATCH v5 1/4] libperf cpumap: Add ability to create CPU from a
 single CPU number
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Leo Yan <leo.yan@arm.com>, 
	Yoshihiro Furudera <fj5100bi@fujitsu.com>, Weilin Wang <weilin.wang@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Dominique Martinet <asmadeus@codewreck.org>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add perf_cpu_map__new_int so that a CPU map can be created from a
single integer.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/perf/cpumap.c              | 10 ++++++++++
 tools/lib/perf/include/perf/cpumap.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/tools/lib/perf/cpumap.c b/tools/lib/perf/cpumap.c
index fcc47214062a..f3054894ff0c 100644
--- a/tools/lib/perf/cpumap.c
+++ b/tools/lib/perf/cpumap.c
@@ -242,6 +242,16 @@ struct perf_cpu_map *perf_cpu_map__new(const char *cpu_list)
 	return cpus;
 }
 
+struct perf_cpu_map *perf_cpu_map__new_int(int cpu)
+{
+	struct perf_cpu_map *cpus = perf_cpu_map__alloc(1);
+
+	if (cpus)
+		RC_CHK_ACCESS(cpus)->map[0].cpu = cpu;
+
+	return cpus;
+}
+
 static int __perf_cpu_map__nr(const struct perf_cpu_map *cpus)
 {
 	return RC_CHK_ACCESS(cpus)->nr;
diff --git a/tools/lib/perf/include/perf/cpumap.h b/tools/lib/perf/include/perf/cpumap.h
index 188a667babc6..077133935bf4 100644
--- a/tools/lib/perf/include/perf/cpumap.h
+++ b/tools/lib/perf/include/perf/cpumap.h
@@ -36,6 +36,8 @@ LIBPERF_API struct perf_cpu_map *perf_cpu_map__new_online_cpus(void);
  *                     perf_cpu_map__new_online_cpus is returned.
  */
 LIBPERF_API struct perf_cpu_map *perf_cpu_map__new(const char *cpu_list);
+/** perf_cpu_map__new_int - create a map with the one given cpu. */
+LIBPERF_API struct perf_cpu_map *perf_cpu_map__new_int(int cpu);
 LIBPERF_API struct perf_cpu_map *perf_cpu_map__get(struct perf_cpu_map *map);
 LIBPERF_API int perf_cpu_map__merge(struct perf_cpu_map **orig,
 				    struct perf_cpu_map *other);
-- 
2.48.1.502.g6dc24dfdaf-goog

