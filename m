Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651E81F37BC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743624983; cv=none; b=O6OqJdCGMo6nsgemsQDaj5VQA/9u/hiacVcfmAOGz5O1n3jhspSKjr33vpmBs+QGQ57KjFw5qFELQFq8d1emSvsLdAq7Bwm3RkaYTBxBjqsj7x+9CU6v1FDvm75hvK7Gm/EB+OOA3NVlugtbrz9awTFLZvmkqFb+PtE8b3acbgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743624983; c=relaxed/simple;
	bh=WStuIdPt8lRJg1FWf8KPFEILp1PnsGADoTb7+XPTPCo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=OIi1C//H4nP4fWX2Qjp5GCuDbvSoM5zkNtm3dqdaAzQv+9QxdKEMcjy7vftF9AlMvumfuoK/CWtgqbDVOmnoWdm7gkR9ksg6qKIhG9wh5u3DEaik7u/k/RMNR2HZvkAS2QIMFceEASulMj6ld2BB72YrQEsHneAefHT3LAT2XU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZcX2JdaF; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZcX2JdaF"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-229170fbe74so1925055ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743624982; x=1744229782; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3tDmbLrtoU9NWl61/Y1ycLMfPN40NbRlPLTERdTcD4c=;
        b=ZcX2JdaFK797Fd6wlJs0yu/IEeo4JQOLQzzFfk6L3La+glK+BVZJmPYLQ3bBCseKE1
         mqtUrgbxgA0EWcEdYFbUxdzFd7MU5aUL/PTlRFO1Z0Bmj44MBOoIXJtjF4WTzCMW7d9Y
         jRMPV0idDeTqVtGMSHIxeYzsnetKIw6N1jerS1o1c+xKigQwtdRzkiS2CM3uFOhthdlU
         IlIL9HhSedN8i5ZWqh9vCn5Qvx0UR8hPgXYb7tRI+EGMMiPg66lNfE8CIouRJZCtHdUK
         dTiM8JwTScXqfuhiuzsKPjz/p/1+NP6ClW+OKEiAORrH+Go8vO2ReRHwe+0gwrm+8p5e
         CmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743624982; x=1744229782;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3tDmbLrtoU9NWl61/Y1ycLMfPN40NbRlPLTERdTcD4c=;
        b=qgeDLIH1VK/ddBmucpMv0RRtTgOq8o/opyqZVDSQENE6530xrXJDXKS5X45bpSfIIO
         YyUB7Undh/v06I4OUwX+uproWJSLOTgOuAad95dm2dZ5+82Vz3kK7YphrDEIkH1N3N37
         pP9//Y3yrQiNPkwVK3I3SKjedQO4269lvuZOUBvB/z7q3YckOyRJtSdanHSe3wiIeCPd
         abgJsFo5PwNbLVtZt0XCkN0h2HX6ArVke1zgO5BDtomAFXiNF57NRPBjVC8Sxt4VonqG
         yZIk4/mj+wDg1lZC6/mlYosrtCl0uCDXCD2mqU+Cwo0JVvKsz1ZWyFGn+U2li55l7tvZ
         J91w==
X-Forwarded-Encrypted: i=1; AJvYcCX+Jr0I82BonAE6M0yiOkztiddUZZf1GyTIGkExnAKyBJz99wcTenHb3nQ3G3FVNOTOnVV3czt0HEuNB74=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSlhqwCZE4segZjCn0R2DEY+zevVnKbt2AKRtAm52RntX3v57U
	v22Sqx51wntGf6tyO3ATMqY46qTfvWCSshm5pVGgVsyieEkVEzpJruM7FzPnAgDSmrJ4Xj+0BHY
	X8LHI4g==
X-Google-Smtp-Source: AGHT+IFPE0DDi1RjFCqnrb0Hi7HSJbP/alBx968X4Vig8llhyMTnMqG2kWgh2WhFFwFKqa7GG5ipt79Ci8Zq
X-Received: from pleu12.prod.google.com ([2002:a17:903:41cc:b0:220:c367:eb6d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ebd1:b0:223:3630:cd32
 with SMTP id d9443c01a7336-2292fa162abmr287207785ad.53.1743624981872; Wed, 02
 Apr 2025 13:16:21 -0700 (PDT)
Date: Wed,  2 Apr 2025 13:15:48 -0700
In-Reply-To: <20250402201549.4090305-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402201549.4090305-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250402201549.4090305-5-irogers@google.com>
Subject: [PATCH v3 4/5] perf evlist: Add groups to evlist__format_evsels
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Levi Yun <yeoreum.yun@arm.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Andi Kleen <ak@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Make groups visible in output:

Before:
{cycles,instructions} ->
cpu_atom/cycles/,cpu_atom/instructions/,cpu_core/cycles/,cpu_core/instructions/

After:
{cycles,instructions} ->
{cpu_atom/cycles/,cpu_atom/instructions/},{cpu_core/cycles/,cpu_core/instructions/}

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evlist.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/evlist.c b/tools/perf/util/evlist.c
index ffb5be41a465..6ebe0795e1c9 100644
--- a/tools/perf/util/evlist.c
+++ b/tools/perf/util/evlist.c
@@ -2471,13 +2471,18 @@ struct evsel *evlist__find_evsel(struct evlist *evlist, int idx)
 
 void evlist__format_evsels(struct evlist *evlist, struct strbuf *sb, size_t max_length)
 {
-	struct evsel *evsel;
+	struct evsel *evsel, *leader = NULL;
 	bool first = true;
 
 	evlist__for_each_entry(evlist, evsel) {
+		struct evsel *new_leader = evsel__leader(evsel);
+
 		if (evsel__is_dummy_event(evsel))
 			continue;
 
+		if (leader != new_leader && leader && leader->core.nr_members > 1)
+			strbuf_addch(sb, '}');
+
 		if (!first)
 			strbuf_addch(sb, ',');
 
@@ -2485,9 +2490,15 @@ void evlist__format_evsels(struct evlist *evlist, struct strbuf *sb, size_t max_
 			strbuf_addstr(sb, "...");
 			return;
 		}
+		if (leader != new_leader && new_leader->core.nr_members > 1)
+			strbuf_addch(sb, '{');
+
 		strbuf_addstr(sb, evsel__name(evsel));
 		first = false;
+		leader = new_leader;
 	}
+	if (leader && leader->core.nr_members > 1)
+		strbuf_addch(sb, '}');
 }
 
 void evlist__check_mem_load_aux(struct evlist *evlist)
-- 
2.49.0.504.g3bcea36a83-goog

