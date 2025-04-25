Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A30229B36
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745617230; cv=none; b=Be7C4hdF3VTxorR1+3LQqnSq5XVLXnej/L3ufP0xQaVpFjp2Tcn+rQujrLSnFDFE37ihNRj98Wf8nskrMXdA2cnEYeAMpC6yE0kEje4+mxoluBAk4SbTHg+XX0wQIsY3j8uRd/sS0lCCgrVA4hdbl51nvo0xHf0on4pIGZiroGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745617230; c=relaxed/simple;
	bh=gbjo4h3GHQFtFeOpJumdcLDVg3ih8INOSDQkXhcieIM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=HvPrJIv6QHKYNssM/mQdcFpjPpQE2rRW52AfXQQAPbN3NQjdeUkFkXGzYCG9BLKvjVHzTx7EQFaWp3/e05ZktkhZJQ7d1eZuXifMaf8SsZnE/uRsek+/Y9b2Qevq1K2KZr+WkxtshzYsOdF/NRmY2GTibZFzGaAWGaPoFrruo8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XdLYba0l; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XdLYba0l"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b048d1abbbfso2618547a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745617228; x=1746222028; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bR45kodXZkA7EQ9UBPLhC24dTzfJslYN2Nb1yPoIsJQ=;
        b=XdLYba0l+X8n6rkMQT8Xj350nyZz6Qg78/3VH2nwTepRw+Kw4qqsq3hFQkZO+ex+Xu
         C59ILn0/o5H8xOA5er286nwcUglG81PHsDEzuFywVNMg/elUx1SLFrFhv46WuL6kTvfP
         CLsQjNFsEy+xdmFLFU/QWdHXa/t9oBAZRXC4DQbL4Tbe0dkvGFN3JK2DfYVT76w3hc+/
         k+rxf3ZfmAPJ0eocXMq5ifELflQpueyMbnUb5Lmc1lku2ZVq/ot3OrjPBfSr8ZJqqOrh
         gUsx2zr7Xn3eJEtwDtCQJys4DkCZ0Ks3YztQ1HKg0nCU8ts+t6zGw2+aftF8/sKuvCer
         tRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745617228; x=1746222028;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bR45kodXZkA7EQ9UBPLhC24dTzfJslYN2Nb1yPoIsJQ=;
        b=XC/9TZiD2Y+80alJkR73U9/8eXhMsckqqVz0LIdPDNj+etQrp27TGQ0eUTIeunbLOP
         GesTqlW8iGOeUMnghTLJg0+ciAjZO4RLRWraOlp9AM8RB2j2vwSt/x55B6YgoYdvv+nh
         eowAmsWWbrisxZNEoHZx7SprbAipGiM0qTG7U8449zTyF3l6nG3PiX5LHEVaxAgHoJ5C
         kW+DXXXvA24ozWK3n8IFCnumAWxoiUXGy1CLgdjXSCTGKdx7+HmPwfyHUX8r9gxqrmFc
         DqTAeqpsQN49z2h3l449/vWuhAVY0gOA+hwYKrsnHWvn+bJjt2hQ+4PlL7VpFbJINesN
         qhng==
X-Forwarded-Encrypted: i=1; AJvYcCVFv3l3eXWer7NUUn+K4VvwqrFDWp+0IqIL3BdDhM9TQlPaK7pTtnCElm1nS8tGUdUXQ+aFtIYJEomVIEs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhw17+HzcELd+XHHuM6KSqI/R3tQ+f6JHXUO1TmnZsMi1VwBH6
	9E4yq5fiMV4KkfVHmSxqmUjhgG5wd3HNnP+ig31x2rlpFlaEYcew+w2VezUYb9K02gZUvh81Wex
	U2K1EZQ==
X-Google-Smtp-Source: AGHT+IHu6jNsVxg2hinctPs3rIG3x23hifof5G2en1Olm7EYab4lBNXfdy6kgi4Gh069LsoL9yjCAM48VRnS
X-Received: from pgbcl20.prod.google.com ([2002:a05:6a02:994:b0:af2:7bd1:57e6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:12c4:b0:1ee:ef0b:7bf7
 with SMTP id adf61e73a8af0-2046a57d131mr1026446637.19.1745617227918; Fri, 25
 Apr 2025 14:40:27 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:40:01 -0700
In-Reply-To: <20250425214008.176100-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250425214008.176100-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <20250425214008.176100-4-irogers@google.com>
Subject: [PATCH v3 03/10] perf parse-events: Add parse_uid_filter helper
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Veronika Molnarova <vmolnaro@redhat.com>, Hao Ge <gehao@kylinos.cn>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Levi Yun <yeoreum.yun@arm.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dominique Martinet <asmadeus@codewreck.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Tengda Wu <wutengda@huaweicloud.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add parse_uid_filter filter as a helper to parse_filter, that
constructs a uid filter string. As uid filters don't work with
tracepoint filters, add a is_possible_tp_filter function so the
tracepoint filter isn't attempted for tracepoint evsels.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 19 ++++++++++++++++++-
 tools/perf/util/parse-events.h |  1 +
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 2a60ea06d3bc..540864fc597c 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -2460,6 +2460,12 @@ foreach_evsel_in_last_glob(struct evlist *evlist,
 	return 0;
 }
 
+/* Will a tracepoint filter work for str or should a BPF filter be used? */
+static bool is_possible_tp_filter(const char *str)
+{
+	return strstr(str, "uid") == NULL;
+}
+
 static int set_filter(struct evsel *evsel, const void *arg)
 {
 	const char *str = arg;
@@ -2472,7 +2478,7 @@ static int set_filter(struct evsel *evsel, const void *arg)
 		return -1;
 	}
 
-	if (evsel->core.attr.type == PERF_TYPE_TRACEPOINT) {
+	if (evsel->core.attr.type == PERF_TYPE_TRACEPOINT && is_possible_tp_filter(str)) {
 		if (evsel__append_tp_filter(evsel, str) < 0) {
 			fprintf(stderr,
 				"not enough memory to hold filter string\n");
@@ -2508,6 +2514,17 @@ int parse_filter(const struct option *opt, const char *str,
 					  (const void *)str);
 }
 
+int parse_uid_filter(struct evlist *evlist, uid_t uid)
+{
+	struct option opt = {
+		.value = &evlist,
+	};
+	char buf[128];
+
+	snprintf(buf, sizeof(buf), "uid == %d", uid);
+	return parse_filter(&opt, buf, /*unset=*/0);
+}
+
 static int add_exclude_perf_filter(struct evsel *evsel,
 				   const void *arg __maybe_unused)
 {
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index e176a34ab088..289afd42d642 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -45,6 +45,7 @@ static inline int parse_events(struct evlist *evlist, const char *str,
 int parse_event(struct evlist *evlist, const char *str);
 
 int parse_filter(const struct option *opt, const char *str, int unset);
+int parse_uid_filter(struct evlist *evlist, uid_t uid);
 int exclude_perf(const struct option *opt, const char *arg, int unset);
 
 enum parse_events__term_val_type {
-- 
2.49.0.850.g28803427d3-goog

