Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1C7227EA8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 21:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744060253; cv=none; b=fQfKIzlR39dS9C4JRy3Vom87iZRTOlKWMoeHXpOceHci0CnbXfV52Lf5EDRbU8KjAYx5i4akXjo9l4oot0j3LiLLCBQUR+4Af7iYm+HtfVSv6yofVDaiLKiOPGyoOqjiznJORoK0hUzOSleBwtS7RUYizgcxRM0yJjOjs4m99Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744060253; c=relaxed/simple;
	bh=4/dJlTWkcf5FOf5+oh0Up7fh8r5QO82sMonPjvpz42s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=WKcGDWC03blFcw4OwoS0dnThrKBgZ7l+edfzxfbm0aKeadirGrCf4d/60+QleHIYlqYzJccPZuTBLQ2iX4RDF51WdkyvNqq1QHhMH8owezcGot74Xr6f7vfnIFOZzhRY6w3LLA/sDFs9Rqc860vmVA9gbYEzcQdyN4ucVQHcMUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k1xalQf+; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k1xalQf+"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-227ea16b03dso68118055ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 14:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744060251; x=1744665051; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AtCRHQR2grinPcYBxNOrxZNvf1a5RF1zR0pJL1Q63Gw=;
        b=k1xalQf+IohWxoOhqhCy3+DOLKylYi0MuPRj4O1Nu9cBMY/h/vfcNuHPdUB7p2Or+I
         YJGtkr2Qs+E+uYG4vCdmcIRXK0Em+F7KmIsgNcHKEj4O89xfI4Zl5eUweFcWTLpKgAXA
         QExPa2fwACRqtsiMrpEnYmKCcySMphE3XC5e2MjRKGwkWHQayNUd6u6htNuIgc8cwTEL
         ZWN8tHGFjRWpKktzOqcuskqq3EpswFrlfRRnMSA33Ns8IO1UMJ3nu48P5WHP9EtvO3Xi
         btnM3b9S1YkJtaj8p4gGw6X6jcgaZhJkif+plbhREOwRi6op1W4fs5eaWGBjGE/9zgMd
         SkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744060251; x=1744665051;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtCRHQR2grinPcYBxNOrxZNvf1a5RF1zR0pJL1Q63Gw=;
        b=E4JIAgyjOSimXAxd0nplm3WgnroV4Lu3R5CiqimQsEZoLjk408rM0z6Xw6LHR+RygZ
         YwyM6m6xB3YrzbElfm+BwJXBchLQ9DgAC4RRlT0aBPYQsXiqELvG3pD2f5Yrjqic8RNJ
         yKv6paQnzBv2ptec5uASwQSlaq+HmIiexwLSa1fAA7Bi4eOk6hwBWQMgqsIW8+mLbFT7
         h3vsCtHUxpM0C1crt7AdUa1uT4JpcO5SrjouGuWT1ACsE2q7qIF661nFKPQQZ49DTRZQ
         /2wZ67yCQqVCmV34AMW2a8BIdheAuZ2JL9IGyIHS0dPJ+ohWuexPzz5OoRWIyPTuWP2R
         jfog==
X-Forwarded-Encrypted: i=1; AJvYcCVkq+AgCb3d3nVvk0p5EcSnYzMlFIJNpeCVJqjcKLUMi1nD1vUOakqKPAKszpoI6uI8tH/1uKzVue+lSpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcpBBmMJUQuRRu0HV+ol9+GStS4kNENhJtDVPrDEAwQzGdhcg0
	vw+CpdOprFnUPkA5xS6HTSKDZNqpM5IIL+dIAe9hixkb5IDtTmXgsZ2a46Azvy+9DPXKur/pNMX
	mgHdumA==
X-Google-Smtp-Source: AGHT+IGqB05o89f/GZLTfHiKkNCXx4VfitNRXgR4OWmwniHUHrAOl4AGxryB83reY0YfENZ/8BQg9qCCsrJy
X-Received: from plgy12.prod.google.com ([2002:a17:903:22cc:b0:223:49cb:8f99])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d50e:b0:21f:85ee:f2df
 with SMTP id d9443c01a7336-22a8a05524fmr190586515ad.15.1744060250746; Mon, 07
 Apr 2025 14:10:50 -0700 (PDT)
Date: Mon,  7 Apr 2025 14:09:37 -0700
In-Reply-To: <20250407210937.131681-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407210937.131681-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407210937.131681-17-irogers@google.com>
Subject: [PATCH v3 16/16] perf record: Retirement latency cleanup in evsel__config
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

Perf record will fail with retirement latency events as the open
doesn't do a perf_event_open system call. Use evsel__config to set up
such events for recording by removing the flag and enabling sample
weights - the sample weights containing the retirement latency.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evsel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 661a07cbdb25..6a84893e3c58 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1440,9 +1440,10 @@ void evsel__config(struct evsel *evsel, struct record_opts *opts,
 		attr->branch_sample_type = opts->branch_stack;
 	}
 
-	if (opts->sample_weight)
+	if (opts->sample_weight || evsel->retire_lat) {
 		arch_evsel__set_sample_weight(evsel);
-
+		evsel->retire_lat = false;
+	}
 	attr->task     = track;
 	attr->mmap     = track;
 	attr->mmap2    = track && !perf_missing_features.mmap2;
-- 
2.49.0.504.g3bcea36a83-goog

