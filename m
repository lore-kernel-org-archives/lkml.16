Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5E2293469
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301078; cv=none; b=Yf1OL6Ea53BquoEeJHEURd0mC6dDDZQ+HkmehpO3Q+aeCUJ53YNaJkGwyOvd8Lk5I17pwX2mWKTperWaIg/lSGieRRg5icCqLXN2AH/czCssOCskSTS/abs43vNaZ+LNHwh9R77VdNHnDfVdXj0E53Zna7Z9cVgYM4Pd68JCg80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301078; c=relaxed/simple;
	bh=9X4LsLsiTtkFTa9g5XQK0rwXa3btreWk3AyWCv2dhv0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=KWlt8PRdMWKastdKEKeu4h4N2V/14zpM3qITNzAmBR2QNjAd4Rw5ywVmN9nIeLzyaw+uWdVTw90KjneW65wa7RrvPaHzUIWk30ro2j582IOG6MLfyi0cpMXFDgkiyrE8u1H2MmhHCA7hFTS9/9D1NbrP/EuuUOAP/UYpob2ZGXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IGJbeSZV; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IGJbeSZV"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748a4f5e735so2287401b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751301077; x=1751905877; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2Hfhae+5rpIAG5vQAXdbbEaNNTzOqfrwelmS2yj4Dc=;
        b=IGJbeSZVmLKCc3zp8s7uvn62HXAnv6qFdFWN+LFjcxVhnncAtgdSgEoNiO5udVm3fh
         z+GY4f9glrYisJBOBJIdMycdJtXFz987VMlcBDaOU+cKhfwall+16JNA1BfkHWWyh4QM
         V2usGSoFSRss+9M9WBCHxKyoJu41kdyUsiWdhuJdEFXINEaxiSp7FoBZ3PBKfFHowxMf
         piReV270wLlH1dEbSDWDkn5OL8seGIG0VTcL80f9YfxzbTE+1CcU3D3OORlSMhLywmnh
         VEQWVMqKnhWQFs/FRXsp1xLFhYMW5t1qI1exCQXMwqPNAqW6/Vwmh7Zv/5tFDwj4bcfu
         lFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751301077; x=1751905877;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2Hfhae+5rpIAG5vQAXdbbEaNNTzOqfrwelmS2yj4Dc=;
        b=IBflhPQLfwKYFeUhdCvZ8qnGBUbHzeBqI4FwYgIKCwsW0wOvZo6TNjNKPwLy4Xyev3
         4IeswezvWvScVKh5wYTA3t+CbRkT0X0Neaxhq6o22NaGKl5DOJvoXWXUv/Zii9H99Np2
         T0nqEJ+ilHNHVL+sW9JNYq5ZnMckH/+rlwUdVoHI8Fnq8p0/OdTCQynLfoX6WjkOXx1s
         bsNCD4sWBZv6Pxvp+tHRxs37kF0id5LaiHmkU9V6ukwVSKAPfGehwz4LBSKMZhZV7CBu
         P8fO5wEXZkYuWgC6yOiLRrqQCLDr5DxBoFZQzprCAyMdXgIuwkdnRrT9duUq1EG0GHdx
         t4tw==
X-Forwarded-Encrypted: i=1; AJvYcCWIADGIppZyWVAoRzbcJcFEv7+OQNGkCQHfL+oFVGWXL/mdRDmEdXQmrYDsi4BO8x62JlyfiOG/nD3URV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFkCq9I4mJ4qJzQgMHMRmULrXzShI0RoVjGQP4Yne6BJrLxx7O
	4//BaooX+CfUxNiwoVeXqPueO00ZWps05H8wKdHjHthUEC9c4EGWQY/P+rM+srBw4nk1auSnkWh
	uggRuPz9VEw==
X-Google-Smtp-Source: AGHT+IFM6aCaAnTZgWJLQFU9sciXGF5r2oMwHsTg5zSOSHjen7sZq+xA7ayIBUrH5uWa2GUi9xeI+IBf87mr
X-Received: from pfvf13.prod.google.com ([2002:a05:6a00:1acd:b0:748:f3b0:4db2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3392:b0:749:ca1:1d02
 with SMTP id d2e1a72fcca58-74af6eaa39emr17432914b3a.6.1751301076568; Mon, 30
 Jun 2025 09:31:16 -0700 (PDT)
Date: Mon, 30 Jun 2025 09:30:51 -0700
In-Reply-To: <20250630163101.1920170-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250630163101.1920170-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250630163101.1920170-7-irogers@google.com>
Subject: [PATCH v2 06/15] perf vendor events: Update GrandRidge events
From: Ian Rogers <irogers@google.com>
To: Thomas Falcon <thomas.falcon@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Caleb Biggers <caleb.biggers@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Update events from v1.07 to v1.09.

Bring in the event updates v1.09:
https://github.com/intel/perfmon/commit/8c74d09c8544421256a79f4f21e548ad756f5b7f
https://github.com/intel/perfmon/commit/18c7d2a75e45eacf5553f900ae2097a1290f5bed

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../arch/x86/grandridge/grr-metrics.json      | 30 +++++++++++++++----
 .../x86/grandridge/uncore-interconnect.json   | 10 +++++++
 .../arch/x86/grandridge/uncore-io.json        | 12 ++++++++
 tools/perf/pmu-events/arch/x86/mapfile.csv    |  2 +-
 4 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/grandridge/grr-metrics.json b/tools/perf/pmu-events/arch/x86/grandridge/grr-metrics.json
index 1c6dba7b2822..878b1caf12de 100644
--- a/tools/perf/pmu-events/arch/x86/grandridge/grr-metrics.json
+++ b/tools/perf/pmu-events/arch/x86/grandridge/grr-metrics.json
@@ -106,6 +106,30 @@
         "MetricName": "io_bandwidth_write",
         "ScaleUnit": "1MB/s"
     },
+    {
+        "BriefDescription": "The percent of inbound full cache line writes initiated by IO that miss the L3 cache",
+        "MetricExpr": "UNC_CHA_TOR_INSERTS.IO_MISS_ITOM / UNC_CHA_TOR_INSERTS.IO_ITOM",
+        "MetricName": "io_full_write_l3_miss",
+        "ScaleUnit": "100%"
+    },
+    {
+        "BriefDescription": "Message Signaled Interrupts (MSI) per second sent by the integrated I/O traffic controller (IIO) to System Configuration Controller (Ubox)",
+        "MetricExpr": "UNC_IIO_NUM_REQ_OF_CPU_BY_TGT.UBOX_POSTED / duration_time",
+        "MetricName": "io_msi",
+        "ScaleUnit": "1per_sec"
+    },
+    {
+        "BriefDescription": "The percent of inbound partial writes initiated by IO that miss the L3 cache",
+        "MetricExpr": "(UNC_CHA_TOR_INSERTS.IO_MISS_ITOMCACHENEAR + UNC_CHA_TOR_INSERTS.IO_MISS_RFO) / (UNC_CHA_TOR_INSERTS.IO_ITOMCACHENEAR + UNC_CHA_TOR_INSERTS.IO_RFO)",
+        "MetricName": "io_partial_write_l3_miss",
+        "ScaleUnit": "100%"
+    },
+    {
+        "BriefDescription": "The percent of inbound reads initiated by IO that miss the L3 cache",
+        "MetricExpr": "UNC_CHA_TOR_INSERTS.IO_MISS_PCIRDCUR / UNC_CHA_TOR_INSERTS.IO_PCIRDCUR",
+        "MetricName": "io_read_l3_miss",
+        "ScaleUnit": "100%"
+    },
     {
         "BriefDescription": "Ratio of number of completed page walks (for 2 megabyte and 4 megabyte page sizes) caused by a code fetch to the total number of completed instructions",
         "MetricExpr": "ITLB_MISSES.WALK_COMPLETED_2M_4M / INST_RETIRED.ANY",
@@ -162,12 +186,6 @@
         "MetricName": "llc_data_read_mpi_demand_plus_prefetch",
         "ScaleUnit": "1per_instr"
     },
-    {
-        "BriefDescription": "Average latency of a last level cache (LLC) demand data read miss (read memory access) in nano seconds",
-        "MetricExpr": "1e9 * (UNC_CHA_TOR_OCCUPANCY.IA_MISS_DRD_OPT / UNC_CHA_TOR_INSERTS.IA_MISS_DRD_OPT) / (UNC_CHA_CLOCKTICKS / (source_count(UNC_CHA_TOR_OCCUPANCY.IA_MISS_DRD_OPT) * #num_packages)) * duration_time",
-        "MetricName": "llc_demand_data_read_miss_latency",
-        "ScaleUnit": "1ns"
-    },
     {
         "BriefDescription": "Load operations retired per instruction",
         "MetricExpr": "MEM_UOPS_RETIRED.ALL_LOADS / INST_RETIRED.ANY",
diff --git a/tools/perf/pmu-events/arch/x86/grandridge/uncore-interconnect.json b/tools/perf/pmu-events/arch/x86/grandridge/uncore-interconnect.json
index 2c18767511f3..c7250332d8aa 100644
--- a/tools/perf/pmu-events/arch/x86/grandridge/uncore-interconnect.json
+++ b/tools/perf/pmu-events/arch/x86/grandridge/uncore-interconnect.json
@@ -261,5 +261,15 @@
         "PerPkg": "1",
         "UMask": "0x8",
         "Unit": "IRP"
+    },
+    {
+        "BriefDescription": "Message Received : MSI",
+        "Counter": "0,1",
+        "EventCode": "0x42",
+        "EventName": "UNC_U_EVENT_MSG.MSI_RCVD",
+        "PerPkg": "1",
+        "PublicDescription": "Message Received : MSI : Message Signaled Interrupts - interrupts sent by devices (including PCIe via IOxAPIC) (Socket Mode only)",
+        "UMask": "0x2",
+        "Unit": "UBOX"
     }
 ]
diff --git a/tools/perf/pmu-events/arch/x86/grandridge/uncore-io.json b/tools/perf/pmu-events/arch/x86/grandridge/uncore-io.json
index c5b05c71c56d..764cf2f0b4a8 100644
--- a/tools/perf/pmu-events/arch/x86/grandridge/uncore-io.json
+++ b/tools/perf/pmu-events/arch/x86/grandridge/uncore-io.json
@@ -907,6 +907,18 @@
         "UMask": "0x4",
         "Unit": "IIO"
     },
+    {
+        "BriefDescription": "Posted requests sent by the integrated IO (IIO) controller to the Ubox, useful for counting message signaled interrupts (MSI).",
+        "Counter": "0,1,2,3",
+        "EventCode": "0x8e",
+        "EventName": "UNC_IIO_NUM_REQ_OF_CPU_BY_TGT.UBOX_POSTED",
+        "FCMask": "0x01",
+        "PerPkg": "1",
+        "PortMask": "0x0FF",
+        "PublicDescription": "-",
+        "UMask": "0x4",
+        "Unit": "IIO"
+    },
     {
         "BriefDescription": "All 9 bits of Page Walk Tracker Occupancy",
         "Counter": "0,1,2,3",
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index e139a099374a..f3fe686b6630 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -12,7 +12,7 @@ GenuineIntel-6-9[6C],v1.05,elkhartlake,core
 GenuineIntel-6-CF,v1.14,emeraldrapids,core
 GenuineIntel-6-5[CF],v13,goldmont,core
 GenuineIntel-6-7A,v1.01,goldmontplus,core
-GenuineIntel-6-B6,v1.07,grandridge,core
+GenuineIntel-6-B6,v1.09,grandridge,core
 GenuineIntel-6-A[DE],v1.08,graniterapids,core
 GenuineIntel-6-(3C|45|46),v36,haswell,core
 GenuineIntel-6-3F,v29,haswellx,core
-- 
2.50.0.727.gbf7dc18ff4-goog

