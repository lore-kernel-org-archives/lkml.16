Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787721E0489
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743184284; cv=none; b=nQacx7Vs3R9Qieh4yA9308KQd1cEA3no61pzllCZ8y3HSUxFPdsdM6tKwrC3fwVIQRxwcw3AJ9u9aG/784KEdHuODCIyKZ858fcELLrcqV/Tryz6VO8YezzY6BcGKCiEeV+S2QbF0DnEPVq7WF1cWQgFiQSxUbrpG7b63Dh95Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743184284; c=relaxed/simple;
	bh=BsZ4beG/3MY0LIlMnfOtq+u6ug+ZXaSOs8YIhhZ38Cg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=BlR1fEOzpGwMDnsFjuNOMdEWE6LhVKPzB2oUldh10N6afIBnBTxI3vAMJn4ugxogwOr/6qBuqQSLeFyYB82W+ybZGZ17bf66wj6tuy/1SRn0gx1xiiMo+hH9+zBuLjuhJ/GLXTeO1a2o9OlpXsr/xRQ91gxExoDoxoJXir1M4fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1ZgjWzqv; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1ZgjWzqv"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so3892182a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743184274; x=1743789074; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LtdlsqM6blzGroFn64X29nm7pFzYH4kvfvsnMdFHGUE=;
        b=1ZgjWzqvp2YeGCm5h7mY2tpcEc+zsbk4+7ausrFBeDQdziadizDVxIFaxdY1etMS2S
         Be2clj9ZCbbp8gl3T7gA4b23cCJEdSkIUn0xcA9pXJQogGwRqLFnyADD00+lth2BqvKw
         5NS/S4xbK2tCKqi7BW+JfX5a5+mo1gWyp++oVk0Y7h4O4tNobeA7y9cwvMwnyt4sPppW
         1HFDKUcuTWMCKRemuN6gLX0sBmtPca5rk3OjcED/MnD/9NxGWd0NRz0c6k3Hd/8tDU+z
         I9YPf5qCfJYQaJuat4h9HrSQ+LqM8xsetGazanUThzwC6D1qp68m/FYIHE+kMoJj3HWT
         abzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743184274; x=1743789074;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtdlsqM6blzGroFn64X29nm7pFzYH4kvfvsnMdFHGUE=;
        b=JMYqmawMoWJbgfNz8hKCpYCg66R0gkG/qNyes5Sjsu1k/39Jvoj3Br/V850WzoEIaC
         8CajonnzXm0ZHAPyabwVgF+FAE5/5WWpJYa2scNSGxO8vT7+kbCuNfRgnWv40HgPLbnv
         yx3DcRctlc3S8mTp9PahLZ6Nti3tvJOD6/L82N4RgDmvzzQB+BHDSzasgPkrpbg46qTZ
         4srTnlvZVjhV3XM8Sv3ry5aXHEuRX5qfuju8yW+OetqhfG4eYYtBx02PFYfSArLCEZaU
         8XoAqL8Wo2f+JdgcWdbK9lEAqVNCAPknZnHXlLLxITSZmJNIoTL2MF4JgeABJgvv5TwG
         uGYg==
X-Forwarded-Encrypted: i=1; AJvYcCVPvcSdJ+mqQKEKSnulnByWD010Ouz55lVGW0UXXsWlGfz9U7u7CZC6Ms/zpl+xtrLqS+V8xZUECIDYtTI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye2UW/ywLJ1voULh8Ba7uPNIhBtN5pqUmsTrNC9SF6fdGiSK5o
	authDbye5HIpw4ir8XsN4Yo2w6HKz8SmUkJQP+lj44xYtvkT2WaH1XREVsdkDvs/T0L/tjq0EyN
	akMNAYQ==
X-Google-Smtp-Source: AGHT+IGMntAnEKQHnKU8+SixFJ4mEO7Dv9dtVjl1XNMDJARV3a1VD2Ewb9XgLLM6KUomcI3ki/3a66BT1aZD
X-Received: from pjbqc13.prod.google.com ([2002:a17:90b:288d:b0:2ea:5613:4d5d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c49:b0:2ff:796b:4d05
 with SMTP id 98e67ed59e1d1-30531fa15f5mr283639a91.11.1743184274468; Fri, 28
 Mar 2025 10:51:14 -0700 (PDT)
Date: Fri, 28 Mar 2025 10:49:55 -0700
In-Reply-To: <20250328175006.43110-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328175006.43110-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250328175006.43110-25-irogers@google.com>
Subject: [PATCH v5 24/35] perf vendor events: Update nehalemex events
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
 .../pmu-events/arch/x86/nehalemex/cache.json  | 32 +++++++++++++++
 .../pmu-events/arch/x86/nehalemex/other.json  | 40 -------------------
 .../arch/x86/nehalemex/virtual-memory.json    |  8 ++++
 3 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/nehalemex/cache.json b/tools/perf/pmu-events/arch/x86/nehalemex/cache.json
index 2c0ea6f8c4e0..b6c6b22a3188 100644
--- a/tools/perf/pmu-events/arch/x86/nehalemex/cache.json
+++ b/tools/perf/pmu-events/arch/x86/nehalemex/cache.json
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
diff --git a/tools/perf/pmu-events/arch/x86/nehalemex/other.json b/tools/perf/pmu-events/arch/x86/nehalemex/other.json
index f6887b234b0e..5fe5ca778e9f 100644
--- a/tools/perf/pmu-events/arch/x86/nehalemex/other.json
+++ b/tools/perf/pmu-events/arch/x86/nehalemex/other.json
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
diff --git a/tools/perf/pmu-events/arch/x86/nehalemex/virtual-memory.json b/tools/perf/pmu-events/arch/x86/nehalemex/virtual-memory.json
index e88c0802e679..accd263cfbfd 100644
--- a/tools/perf/pmu-events/arch/x86/nehalemex/virtual-memory.json
+++ b/tools/perf/pmu-events/arch/x86/nehalemex/virtual-memory.json
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

