Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632AD1D63F8
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750050932; cv=none; b=dlfQ5fm2YPE6EgeVPM8ZOoauobz3B3qJOOaXqhxYmPPOYOfmkgiMyzihoxmufSlqeMXzfVP+AxplxIYWf99hUDHEClyDgrJuHw/2xRYg1ZD+IEx0SEf5P2902UeAazeDcpBmplPmGXCormxDD22oTG1Nrpk4ycCrxaMNTydDscY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750050932; c=relaxed/simple;
	bh=+rzqLnUZ9aKJHwPLS6rKWr6+5uLxahK86bnCKy+9kCU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=QRKFsq0rkUPo+yBBxGn/Xy3ABV4DPFU7wpvqOIOyDwZHqJUEohaIzn6KuXIjDldgEsTRtHxyBowRccFVVA0+2Rlwk5kRs5ogBErzzUMCKHhxr7BkCnBjzc5pci3tBMiBRDGMYg8msWzRvmh3ul1nKDd1/25yQV8wkuSQNOJYr7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vTHwa3sW; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vTHwa3sW"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-747ddba7c90so3418872b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 22:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750050930; x=1750655730; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9cHBz9Jxgvdqu2C+765Nd/C5I0sI5XdrVknxJ/DmjSo=;
        b=vTHwa3sWOrisW1w0E0au4E4n2Vh2ejWi+rfOCUssgmcU1YqxCa4UETyB6oj7vXdNJg
         2cTsMUrX8AVveAF7H9sdCvK0u+wagpg3mRtN18xl9isBwd5J6NC9tc2ufwaUT885ua3o
         bQMpKXqId6rAxsw0bvLG/mniHQbrvtYr2TnrtCaJzM7ybhxy857xTGCx5yPuQjsZghPN
         uNPOES8pzYVBZ4u9K9VUIsOQnV/ajMe+pZhUebocw5aMGh0wtDX8vD7J1LeYZ6hokP+i
         qUGZtSF/gk2lA8l1WbqctRyghSYSKBwpIFLguVvJoX6xicT/pr2LmamTe4c3pRZtAMeo
         rSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750050930; x=1750655730;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cHBz9Jxgvdqu2C+765Nd/C5I0sI5XdrVknxJ/DmjSo=;
        b=qwL7lfVOdT6Oqk5G+AVoZJsFV1z1zuxBqojno6XEQJj9LPo0C1XXNW0npZLW3GVhuD
         BlvMOmU4h4q6M94c23eY+AZ/m9VDOc/Jgg331gxY5+/5gSFZ+/DmvB+MqiezfOCBQ81I
         9tD0Bacf+zxJTJmVjqz4zI2YreRiffwAzwPlDBa99LkzHBvY7U5Pn0ZRkAwROFaCOoUD
         u7p1Dn5vez7t1V1LTFHM4DBEXEEg8Mpis6/waJzgbauoy37fS0IrZrSqwzTp01EQPBoE
         oM+9zjdRdqCA3ncO8UKut5BisZEifTiFpRGar2GTi2daDA4Id3xAruEWTtxobOrjswAs
         fpDw==
X-Forwarded-Encrypted: i=1; AJvYcCW/Q9qGrnBNaUydh1omcY0mz8IHIT7bGPEtfr3xliCk7dp29AAUZhAqDHOvhmRtGSoFINkPu2sFTVnuU3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmWEZ502SUw+2kAm2YuWGv9fAwuw+1qjJDkph99Yl3i45nggMh
	PJhrjlt4Lmi32eEXiquTMMV695Fqu1cGLEAXBhXHLdZXg6hdXWb7VFyBkgikEBekX0AhkGpJBum
	28cHG4P2vFw==
X-Google-Smtp-Source: AGHT+IGsqLtLqfPivL8Z6UmUsOUy9pRSswLZ1JX/hHTzfJz7520mL2IlDRISK5F4XF1mIBfRUHSHqsf0SGe1
X-Received: from pgbdh21.prod.google.com ([2002:a05:6a02:b95:b0:b2e:b370:6975])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6186:b0:1f3:418d:91b5
 with SMTP id adf61e73a8af0-21fbd55a331mr12605812637.24.1750050930485; Sun, 15
 Jun 2025 22:15:30 -0700 (PDT)
Date: Sun, 15 Jun 2025 22:14:47 -0700
In-Reply-To: <20250616051500.1047173-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250616051500.1047173-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250616051500.1047173-3-irogers@google.com>
Subject: [PATCH v3 02/15] perf parse-events: Minor tidy up of event_type helper
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, John Garry <john.g.garry@oracle.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Howard Chu <howardchu95@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Andi Kleen <ak@linux.intel.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Gautam Menghani <gautam@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add missing breakpoint and raw types. Avoid a switch, just use a
lookup array. Switch the type to unsigned to avoid checking negative
values.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 31 +++++++++++++------------------
 tools/perf/util/parse-events.h |  2 +-
 2 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 7f34e602fc08..9dd0216cfae4 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -135,26 +135,21 @@ const struct event_symbol event_symbols_sw[PERF_COUNT_SW_MAX] = {
 	},
 };
 
-const char *event_type(int type)
-{
-	switch (type) {
-	case PERF_TYPE_HARDWARE:
-		return "hardware";
-
-	case PERF_TYPE_SOFTWARE:
-		return "software";
-
-	case PERF_TYPE_TRACEPOINT:
-		return "tracepoint";
-
-	case PERF_TYPE_HW_CACHE:
-		return "hardware-cache";
+static const char *const event_types[] = {
+	[PERF_TYPE_HARDWARE]	= "hardware",
+	[PERF_TYPE_SOFTWARE]	= "software",
+	[PERF_TYPE_TRACEPOINT]	= "tracepoint",
+	[PERF_TYPE_HW_CACHE]	= "hardware-cache",
+	[PERF_TYPE_RAW]		= "raw",
+	[PERF_TYPE_BREAKPOINT]	= "breakpoint",
+};
 
-	default:
-		break;
-	}
+const char *event_type(size_t type)
+{
+	if (type >= PERF_TYPE_MAX)
+		return "unknown";
 
-	return "unknown";
+	return event_types[type];
 }
 
 static char *get_config_str(const struct parse_events_terms *head_terms,
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index 1c20ed0879aa..b47bf2810112 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -21,7 +21,7 @@ struct option;
 struct perf_pmu;
 struct strbuf;
 
-const char *event_type(int type);
+const char *event_type(size_t type);
 
 /* Arguments encoded in opt->value. */
 struct parse_events_option_args {
-- 
2.50.0.rc2.696.g1fc2a0284f-goog

