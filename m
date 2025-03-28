Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E2E1F460D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743184307; cv=none; b=l0iF8syOZ8NJBl/fkbHv9tlOUHqz42r54Yq6RK7rwh+u5aA40oPpvAcWXol1Ktj/e+vJukSoJQ7lb0vGMOCBRx0EqKQhqOTRVgQWXXNQBU9/NuGJUU8IMdBWTY7/E2Q+Jyujph7V89Ei8w1y/3VO9EbfdMsCiAGBrJCqEazc1Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743184307; c=relaxed/simple;
	bh=A9swew5sEkfqImlzOyxaOp5UaSlXTXcPjhn/IFm5au4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=IXcdgjpVRhRbq5q+42Z3VlK9LVi7suhOVc0ULBkR/1MMT2cSevQCEf27pUEHAU3/YN/uVsvKalWgLmepPSU02IdRBR7xqRUlIQQ38cOG+gQgJfnGfwzo7dbSCOzgVqd2YoqBRbp6LNn5s8wohAoAnUW0Jnb/iAmCq4ni/EJrubs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VB0QcNPM; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VB0QcNPM"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so4131947a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743184298; x=1743789098; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B9PeRUEXMecnZbPpuWEaRw8SWk1eFbJD5uYJN5nO9W4=;
        b=VB0QcNPMmtusySFgshuMAgOKow+QHuCDOO8TqxXwFm10uB4E7KoHQaJ0RdGVuc0Elx
         9KhbJUsGdW+8ePWAq1p7AY5xfD1BWf4mdIZVHerq/4YwyNy07N4COJF6Uhjs16VcCVKD
         vQQvLaBVl/v/ZrDzfGRj/acmY0azJgIZGzbH0r1iF4eqq0lgz7Bv2rrsq0Iata2xCoxE
         sw7Q4oedc1OPOZJidS+qF1wg2L6bpP0mwOkXNKqK7K+J2ewH6vAJMZXvg4GBBoUp58dS
         SuT2QvLJF5dh6BWr9xZ4Uy7sbwLbLqWVEYSz1MrhhsX4995UDX2VqfjZtDNC9k3PvO76
         MNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743184298; x=1743789098;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B9PeRUEXMecnZbPpuWEaRw8SWk1eFbJD5uYJN5nO9W4=;
        b=Wiviq62tjLZQocr+QGtxCUXmXx/Q8Uey83n4eINBoRGRvWJb8HmHLvwKIBCpfvRXpy
         HJnF/jqEzzDVup/bFI0nwx5iJ1L/bf4C9TqJ9wTki60UOMZNIcP+3UjYLYM4bK5C8SUH
         9621sHZx9cb9r5fnIV2s2e5MkzUzIlj3OrVo5KDYTfWb7fNnSr12GN24AZE28BfUGkHF
         mXfn7S+avcjiS98MW7Q5LERWKM8FbZJ81E6CzlovB+qgHqN9OieXxWmEhLKIEu2ZTZCu
         MG4//NU7RptYkyKYCa9yMHCKhpKBlr88NhPunx1giJBuQc027EQb7RyRIf2ntOQc1mNG
         f6tw==
X-Forwarded-Encrypted: i=1; AJvYcCWbxgYWi5uT6a/SmXwZKeq6ZLYY7g53N2rTNaknWJS0pj/bqY4nAY3dFfPWM2ddddu2cgOmQTjW0mToZYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxazpksB++Oz08Pv/jmlyRlQM5T9UQOYLaTZw7NN/JbDR8qJsVe
	ZDCMv6JaIql9ZEWrE/PNitPpp5F6Afv4HxoWMxbdWgnOrJ1dtGnC0XtSA/Uhoi9PTmiJ1x19Mc+
	hDW9TaQ==
X-Google-Smtp-Source: AGHT+IF0kIUNIu+iFFGAUHN5LWfn76UfsUopRI0ke9vlY10WWBKJY/MZZ3RnnFoMwb3xqA0Uqk9ZNADTiOxq
X-Received: from pjbqc13.prod.google.com ([2002:a17:90b:288d:b0:2ea:5613:4d5d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d0c:b0:2fe:a77b:d97e
 with SMTP id 98e67ed59e1d1-30531fa4ea8mr314087a91.11.1743184298118; Fri, 28
 Mar 2025 10:51:38 -0700 (PDT)
Date: Fri, 28 Mar 2025 10:50:06 -0700
In-Reply-To: <20250328175006.43110-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328175006.43110-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250328175006.43110-36-irogers@google.com>
Subject: [PATCH v5 35/35] perf vendor events: Update westmereep-dp events
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
 .../pmu-events/arch/x86/westmereex/cache.json | 32 +++++++++++++++
 .../pmu-events/arch/x86/westmereex/other.json | 40 -------------------
 .../arch/x86/westmereex/virtual-memory.json   |  8 ++++
 3 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/westmereex/cache.json b/tools/perf/pmu-events/arch/x86/westmereex/cache.json
index 9f922370ee8b..2a677d10f688 100644
--- a/tools/perf/pmu-events/arch/x86/westmereex/cache.json
+++ b/tools/perf/pmu-events/arch/x86/westmereex/cache.json
@@ -119,6 +119,38 @@
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
diff --git a/tools/perf/pmu-events/arch/x86/westmereex/other.json b/tools/perf/pmu-events/arch/x86/westmereex/other.json
index bcf5bcf637c0..c0cf8bae8074 100644
--- a/tools/perf/pmu-events/arch/x86/westmereex/other.json
+++ b/tools/perf/pmu-events/arch/x86/westmereex/other.json
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
         "BriefDescription": "Loads that partially overlap an earlier store",
         "Counter": "0,1,2,3",
diff --git a/tools/perf/pmu-events/arch/x86/westmereex/virtual-memory.json b/tools/perf/pmu-events/arch/x86/westmereex/virtual-memory.json
index 0c3501e6e5a3..1800c6ecbf80 100644
--- a/tools/perf/pmu-events/arch/x86/westmereex/virtual-memory.json
+++ b/tools/perf/pmu-events/arch/x86/westmereex/virtual-memory.json
@@ -152,6 +152,14 @@
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

