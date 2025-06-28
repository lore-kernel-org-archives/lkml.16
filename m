Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E7AD528
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 00:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751069379; cv=none; b=eYlPBpOL/pLbY9WkKHmkgc7RW+HTF4J1488+5mP8TrY8O+R8OUJCGxk9b+wuUrppIIni2qkJTYDjNJWxkUOmtdkiew5JA3znHYkf1Hwkff9v31OeipgpV6zIHZExojoqczMCo+wy7o0SYnIIIvs0HuWe8/9bH6tVUp//s3BtI+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751069379; c=relaxed/simple;
	bh=SCSVRXj5DB/cfKYLIvAW2+qqqcd9DzSoDst4X0cpuZc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=uOWQs0HmejhywjQ9r5aZ4Tji0dhMaGGngjVoyXD/9xfaxiLAnhYeLXojpM00+FiqElQswDkXmjXysoVVnxw72Ay5Fb293/W7CLisMoXigneyj5DRl5dTxtMiRfKNC9IDEekOsaJVWzAYgeVM1Ypeff/mR5F4m4BhaDLADMFpnPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Skwh/E83; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Skwh/E83"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2fb347b3e6so3020261a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751069377; x=1751674177; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uM9b0q174RElAGAUOsRC1+X9nDdEI4t5lPgRji4c5mk=;
        b=Skwh/E83+7tU5aJq06GugXApFjEYo9GfTRBpQYy/laBlZJTjtfYXtCMB0W1WKLrU+0
         g5pDOW0jT9EfWM+miDv3BtPx96YnJO3zfYcXRrTxmS/ZRjG9RQR1KiNoHe3MenuyJhmG
         LhUJJ6c9PgeScT4TvFixZ7LXM2i6V65v1v1c4vtS2HdWy0n2yYrL1rxFiO5HlN3JMyO/
         2VjKTGa54xuDYFIg5UUlCf2WcDT+IwOBr4qGLIo+j9JQGUNdNrNcjNOaM/iPN93U4Tvq
         fYYvCQ3jF5wInCTyoT+1fegyhehONGY3guwFimYXG2/tsne9LfuYryS/4+ojCa2i8Ai/
         R4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751069377; x=1751674177;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uM9b0q174RElAGAUOsRC1+X9nDdEI4t5lPgRji4c5mk=;
        b=V/svmEzAR6+XDVQy7+sYS9bE/fz/To9W3ap+XQhs8ePmy8OSJ6/q7JIojlXGOBd+9A
         6cTZ0LEae1oQZAz9Jby77nVuSD8BQZWASsIUUWQZgwOnrj780K0LqvgIjfeWvvmnGyJi
         t1N5JwJSt9M/eu7F54nOkItWKmAeLoh5nwAAfkhYH8J0oJ805GTmNFFF88F/NjDhUE5X
         UCeWSWQsYc2pATspMLWeeQa4aqiTUkPvXnONoIYc6aKMhbzFjdlUbSecd12XaLVj5tYy
         SHamUiGB9aEQaXQLOrJwtwZa53qDmeVkWJ1OrtdA/diHIspBmasZ1S58ijUefpfSfE7R
         tFEg==
X-Forwarded-Encrypted: i=1; AJvYcCULmmbpzTJhj4u4duyrZdYCSFuyOc4MWYKRkGKgWW2lPDStDtcyyMlDBSPgBJArh/h+GK4J0j1DTrWyeNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhkXkfPgYDoagdMqP6USNfPEBbDeTzXejUbzEqA0+sq3/Be4RW
	gYNzy8uqToow+ZsXbiZ4D24tvMTX/rNtTL5138MPMQm6lOMGLgQjY4K8GPWeydNmfC0R+DfSWPH
	AAaRK7Rvvhw==
X-Google-Smtp-Source: AGHT+IFGs6aHSOiyXNrCU00NCL/c6uJ+2lnXnQ91a3SG2R8GfL5Yw7XlkLgRRFH3xzwbNKmbtXllaDIxcXX4
X-Received: from pfbbd20.prod.google.com ([2002:a05:6a00:2794:b0:746:fd4c:1fcf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d0c:b0:21a:efe4:5c6f
 with SMTP id adf61e73a8af0-220a1265985mr8361320637.2.1751069377320; Fri, 27
 Jun 2025 17:09:37 -0700 (PDT)
Date: Fri, 27 Jun 2025 17:09:16 -0700
In-Reply-To: <20250628000929.230406-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250628000929.230406-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250628000929.230406-3-irogers@google.com>
Subject: [PATCH v4 02/15] perf parse-events: Minor tidy up of event_type helper
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
index 4cd64ffa4fcd..a59ae5ca0f89 100644
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
2.50.0.727.gbf7dc18ff4-goog

