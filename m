Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A891EB5EC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743184278; cv=none; b=PhHEo6digu1FZkLDLwD8SK5WuS0N3ItVF0kjgf+bnSI0R7FPHwyrBJGfPchhnVWfH1IZU5oIgGdbHm8pp5SbpCTbqCFoXHiDRjSXJNQWbrbA0dyBo7iOsGi19dqlwREb1TrHxOTaq23evjwFzQg3IbTQNJug8Hy3le1B5yBGup0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743184278; c=relaxed/simple;
	bh=jhC27Zaa9rTrkKMgldvX9P8aqnSagvdFSdc7U7Jyn3M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=pb5KakqI21j/kKkwUip7ddjQrGm5TSvQ8Ay2+nQ9GWZketKPSEeI7xtaniGabjn/BH1X1ivbwve+tHNW2BYDW4F+1JQxeRd9Cj+OYd3ozqzTZYx7W4UTcOJ83tDrXJKL+XeHXB53VJBp6LrcevY2JGBd7Gxwr06r3QRkkzjmqKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZY1VfFj/; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZY1VfFj/"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30364fc706fso4167479a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743184272; x=1743789072; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTzW5K68zOFl8tHWsLxW3KBGNqm+tt/wZjBTGwX9wNE=;
        b=ZY1VfFj/zMYq5qW3C2+lRc6PMrKcqhUrb2Fy/RvAU1WJJldTDMzYALK3dLnmIcKDKO
         0txvXUhCVraxwn31VrYvYUWulF9r+lLC3tjkpZ5jnxuxC7aBqObl6fJzMj3j9z/lN96Y
         xJySjOWjMQz6ninDPEtPkbm91F1tMArOfxsPlC5jG/RkRuaCd9YYwudPfgItLrDnWXFo
         NLyakcsOqo2Yzo0rcKfvxZo40oRUm39pg5H9DZDdHQKs+nMXsg9A+M9VzjThh/yBRxOY
         F9DSvNtb+o1T+vCjYA5dZGQ4xUY2S4y0/igSB9nIwqzCaIBuuN55tRcb+wUPouj76D0F
         Jokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743184272; x=1743789072;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTzW5K68zOFl8tHWsLxW3KBGNqm+tt/wZjBTGwX9wNE=;
        b=wKyfv2HLyp1L1Ox8Ip6tbtJeAACh1SGm6y0znLY7o+4QLZ8St7aSIKBWrYuOCE88/y
         8nWGG9/ygQwk+cLFfpAwC7/8rmnHKqJ311O29/GvPHQj+7VnY/gjx6Ju7B9ffvlF3puV
         Vv/n/scuZL1G8XFf9VhH9x0x75HLh8btdnqe2gV5fjxBcAytanE2ninZDyGRuOKANLhu
         L/stBEZgFMXVBtXd+YX6b+CJ8fHa0fZXvb2iC5/B+/mE1aYOxAaJMIsntZOz25gBxoPZ
         nw8HhwEbFAQJeOAv5V5siW4Qf/Xl85yAYEnoRHlU55hrlXjmtKyw028MHKRgwCWBLTOG
         mrpA==
X-Forwarded-Encrypted: i=1; AJvYcCUCvg1+BRIgExD5ibQqHk6ChxxXa21lLAO6e4w4gdH4qi8wlDz0J/I92jEmgOjrHuhZKWy3+znKDMRy//4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9MQFkwlgM4sDzUhE4ix6SCaLVpDiI0NZuwU1/+N5D5TF0gfJd
	hALV2ldAxVGMMcmnlpfu9cqkQbI8Eo0COC2c/9Wb6ZF+qBg4CNU+/XzIQdH5WMzRFXRyqC9Z6m2
	2CMWMhw==
X-Google-Smtp-Source: AGHT+IEpoqDsLNfFDG2B0+s19DfJD6eoaqnHAmvuMcI3TQLKixPYl42RVNsjOwUOk6XsLEAPT4Fm5kkcciSp
X-Received: from pjbso14.prod.google.com ([2002:a17:90b:1f8e:b0:2ff:84e6:b2bd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5244:b0:305:2d68:8d91
 with SMTP id 98e67ed59e1d1-30532165d91mr217042a91.28.1743184272369; Fri, 28
 Mar 2025 10:51:12 -0700 (PDT)
Date: Fri, 28 Mar 2025 10:49:54 -0700
In-Reply-To: <20250328175006.43110-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328175006.43110-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250328175006.43110-24-irogers@google.com>
Subject: [PATCH v5 23/35] perf vendor events: Update nehalemep events
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Caleb Biggers <caleb.biggers@intel.com>, Weilin Wang <weilin.wang@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Perry Taylor <perry.taylor@intel.com>, Thomas Falcon <thomas.falcon@intel.com>
Content-Type: text/plain; charset="UTF-8"

Update event topic moving other topic events to cache and virtual
memory.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../pmu-events/arch/x86/nehalemep/cache.json  | 32 +++++++++++++++
 .../pmu-events/arch/x86/nehalemep/other.json  | 40 -------------------
 .../arch/x86/nehalemep/virtual-memory.json    |  8 ++++
 3 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/nehalemep/cache.json b/tools/perf/pmu-events/arch/x86/nehalemep/cache.json
index b90026df2ce7..c9d154f1d09a 100644
--- a/tools/perf/pmu-events/arch/x86/nehalemep/cache.json
+++ b/tools/perf/pmu-events/arch/x86/nehalemep/cache.json
@@ -239,6 +239,38 @@
         "SampleAfterValue": "100000",
         "UMask": "0x2"
     },
+    {
+        "BriefDescription": "L1I instruction fetch stall cycles",
+        "Counter": "0,1,2,3",
+        "EventCode": "0x80",
+        "EventName": "L1I.CYCLES_STALLED",
+        "SampleAfterValue": "2000000",
+        "UMask": "0x4"
+    },
+    {
+        "BriefDescription": "L1I instruction fetch hits",
+        "Counter": "0,1,2,3",
+        "EventCode": "0x80",
+        "EventName": "L1I.HITS",
+        "SampleAfterValue": "2000000",
+        "UMask": "0x1"
+    },
+    {
+        "BriefDescription": "L1I instruction fetch misses",
+        "Counter": "0,1,2,3",
+        "EventCode": "0x80",
+        "EventName": "L1I.MISSES",
+        "SampleAfterValue": "2000000",
+        "UMask": "0x2"
+    },
+    {
+        "BriefDescription": "L1I Instruction fetches",
+        "Counter": "0,1,2,3",
+        "EventCode": "0x80",
+        "EventName": "L1I.READS",
+        "SampleAfterValue": "2000000",
+        "UMask": "0x3"
+    },
     {
         "BriefDescription": "All L2 data requests",
         "Counter": "0,1,2,3",
diff --git a/tools/perf/pmu-events/arch/x86/nehalemep/other.json b/tools/perf/pmu-events/arch/x86/nehalemep/other.json
index f6887b234b0e..5fe5ca778e9f 100644
--- a/tools/perf/pmu-events/arch/x86/nehalemep/other.json
+++ b/tools/perf/pmu-events/arch/x86/nehalemep/other.json
@@ -15,46 +15,6 @@
         "SampleAfterValue": "2000000",
         "UMask": "0x1"
     },
-    {
-        "BriefDescription": "L1I instruction fetch stall cycles",
-        "Counter": "0,1,2,3",
-        "EventCode": "0x80",
-        "EventName": "L1I.CYCLES_STALLED",
-        "SampleAfterValue": "2000000",
-        "UMask": "0x4"
-    },
-    {
-        "BriefDescription": "L1I instruction fetch hits",
-        "Counter": "0,1,2,3",
-        "EventCode": "0x80",
-        "EventName": "L1I.HITS",
-        "SampleAfterValue": "2000000",
-        "UMask": "0x1"
-    },
-    {
-        "BriefDescription": "L1I instruction fetch misses",
-        "Counter": "0,1,2,3",
-        "EventCode": "0x80",
-        "EventName": "L1I.MISSES",
-        "SampleAfterValue": "2000000",
-        "UMask": "0x2"
-    },
-    {
-        "BriefDescription": "L1I Instruction fetches",
-        "Counter": "0,1,2,3",
-        "EventCode": "0x80",
-        "EventName": "L1I.READS",
-        "SampleAfterValue": "2000000",
-        "UMask": "0x3"
-    },
-    {
-        "BriefDescription": "Large ITLB hit",
-        "Counter": "0,1,2,3",
-        "EventCode": "0x82",
-        "EventName": "LARGE_ITLB.HIT",
-        "SampleAfterValue": "200000",
-        "UMask": "0x1"
-    },
     {
         "BriefDescription": "All loads dispatched",
         "Counter": "0,1,2,3",
diff --git a/tools/perf/pmu-events/arch/x86/nehalemep/virtual-memory.json b/tools/perf/pmu-events/arch/x86/nehalemep/virtual-memory.json
index e88c0802e679..accd263cfbfd 100644
--- a/tools/perf/pmu-events/arch/x86/nehalemep/virtual-memory.json
+++ b/tools/perf/pmu-events/arch/x86/nehalemep/virtual-memory.json
@@ -88,6 +88,14 @@
         "SampleAfterValue": "200000",
         "UMask": "0x20"
     },
+    {
+        "BriefDescription": "Large ITLB hit",
+        "Counter": "0,1,2,3",
+        "EventCode": "0x82",
+        "EventName": "LARGE_ITLB.HIT",
+        "SampleAfterValue": "200000",
+        "UMask": "0x1"
+    },
     {
         "BriefDescription": "Retired loads that miss the DTLB (Precise Event)",
         "Counter": "0,1,2,3",
-- 
2.49.0.472.ge94155a9ec-goog

