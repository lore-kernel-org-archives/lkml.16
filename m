Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B559829D05
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749686557; cv=none; b=N/M+iOf8XU25jpJeR3MRPWBKJQb976vigRk2GcU7C8XkFC7iWzq6aYcWxenTN3ZX1E+MU/v0UoTDAHwRX2kLQ0m+bJariZ5b955yrdjwIms0wsI7qkvxbaZrDhJ04/4FKCly3B8rPH8jta/W29wH7rKafsQ6W2XH1ItP/dHZFwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749686557; c=relaxed/simple;
	bh=4u9wGmC3K7aitMip7IvJOasH9dqpAvmpGI4x4GWcC/o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=dF50FoPFjYbqswM/y4PFhjd+SxhHimPpOLSZqrbKblGnxX7lX6hqR6jwAIm3y6ZgPE4V9uyxsFmKnTTAJoQFkzC0lmTKmxdmP+MMeEo/XqdsSyBiBu1twoF5tEkH/aicUfCe1y2Ptq1U4ggbdM28yWJrjm1uWFTDp8i8nvXyYdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pCLDBSyP; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pCLDBSyP"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-2e990e17650so254889fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749686554; x=1750291354; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ih/2Krak2K0Y4P0EoYj2MysRqZoU1OAJbZgqKg3SuLY=;
        b=pCLDBSyPrfvy4WRSOyok5HJbraORqIT4V/vZ3gxDvlnTJ17ce6Do7b7u1h2sz25v+k
         dtfHyLdhxMIzdMBx46uZj6JwyZ4YVLp5nwX2pFDY5weIo4CaR+2v5yBoSU6Ihv9RwwmF
         x0YtyrJjBqsOwfg0vKnwGwCwY4vvkppt2QpQBAftkgmtwm5WuoEj9PQsDMVJbreqOM88
         jZUgeC63l4kOcA4V9HQ9MSV6tnJqo/SpC0mbT0+e7iw/zz5WaZP+gtAEvtugymxIfOY+
         d3uT86S1MBjedHn/+bJL14RuSpfneoEDxXWQj35NtrUSmzBErTLSLL9k3iIwhWWm7KuV
         7fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749686554; x=1750291354;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ih/2Krak2K0Y4P0EoYj2MysRqZoU1OAJbZgqKg3SuLY=;
        b=eM6aunwB8BZyj/VDNLGODcTHxTL4UEM7fyHzZ/m52SasLQHU7Qq14ThCq8um2qO9SG
         j/1lXjFeslokeeTUweQLuZEXaT8U8ODCxD2G6hTY4L4I960iPvoY/P83laBGJysr6uhe
         7lUpKuG7AWkcNEOsa5DEyBjSZFLJcHNvN22JFqY0aasMuQt5U37Ezowh5RJpoSMQ8StX
         V2NYn0YIOawk3SKHY82UT9XaOKvXuncN2jWhLTeHmoM3YhnEX9cVhrSPXx2sKq76u7at
         sxWwerClf4c4ldPi6onikhVJ6YiA2WH3V/lMUmr/mVzMw8nYfSVnFM/hgfx8ZwyrxvSn
         3cSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6FUMtPY3wz2KsL6ibesYsN1kdOE8eHmsGtjstTbcdureiUnH/3yrneYH07sRPwoWTtJYA4uC7db1vkdg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj3K87j4SD4LEQ2f+ppfd4vrzHnu+FzRcZHKnSEaPdbR0bQJHq
	VxoXzuL65AFUMU6ooswCeCSc2qgjXnUL6SbOwfJkAArIUnW2q3pWMydW90AwlgJ75mbInNrT/mD
	C31JVOVNqNQ==
X-Google-Smtp-Source: AGHT+IFunB1WZJOvCrU6qAZ7pG8L+8ePNsYYz+4+b8kjMPC7K9HInXnW0MwEJi2DpughPFsWElHa8VwChggI
X-Received: from oabnw8.prod.google.com ([2002:a05:6870:bb08:b0:2e3:bfae:8df5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:938a:b0:2c2:c92a:5789
 with SMTP id 586e51a60fabf-2eab7219068mr520036fac.5.1749686554665; Wed, 11
 Jun 2025 17:02:34 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:02:12 -0700
In-Reply-To: <20250612000224.780337-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250612000224.780337-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250612000224.780337-4-irogers@google.com>
Subject: [PATCH v1 03/15] perf vendor events: Update Arrowlake events
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Caleb Biggers <caleb.biggers@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Edward Baker <edward.baker@intel.com>
Content-Type: text/plain; charset="UTF-8"

Update events from v1.08 to v1.09.

Bring in the event updates v1.09:
https://github.com/intel/perfmon/commit/cf3be6daf0a751ad270b67890dfdb2261dfc75da

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../pmu-events/arch/x86/arrowlake/cache.json  |  13 +-
 .../arch/x86/arrowlake/frontend.json          | 135 ++++++++++++++++++
 tools/perf/pmu-events/arch/x86/mapfile.csv    |   2 +-
 3 files changed, 148 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/arrowlake/cache.json b/tools/perf/pmu-events/arch/x86/arrowlake/cache.json
index 70175404540d..91929d8bcf47 100644
--- a/tools/perf/pmu-events/arch/x86/arrowlake/cache.json
+++ b/tools/perf/pmu-events/arch/x86/arrowlake/cache.json
@@ -237,7 +237,7 @@
         "Unit": "cpu_lowpower"
     },
     {
-        "BriefDescription": "Counts the number of L2 Cache Accesses that miss the L2 and get BBL reject  short and long rejects (includes those counted in L2_reject_XQ.any), per core event",
+        "BriefDescription": "Counts the number of L2 Cache Accesses that miss the L2 and get BBL reject  short and long rejects, per core event",
         "Counter": "0,1,2,3,4,5,6,7",
         "EventCode": "0x24",
         "EventName": "L2_REQUEST.REJECTS",
@@ -728,6 +728,17 @@
         "EventName": "MEM_LOAD_RETIRED.L1_HIT",
         "PublicDescription": "Counts retired load instructions with at least one uop that hit in the L1 data cache. This event includes all SW prefetches and lock instructions regardless of the data source. Available PDIST counters: 0",
         "SampleAfterValue": "1000003",
+        "UMask": "0x101",
+        "Unit": "cpu_core"
+    },
+    {
+        "BriefDescription": "Counts retired load instructions with at least one uop that hit in the Level 0 of the L1 data cache. This event includes all SW prefetches and lock instructions regardless of the data source.",
+        "Counter": "0,1,2,3",
+        "Data_LA": "1",
+        "EventCode": "0xd1",
+        "EventName": "MEM_LOAD_RETIRED.L1_HIT_L0",
+        "PublicDescription": "Counts retired load instructions with at least one uop that hit in the Level 0 of the L1 data cache. This event includes all SW prefetches and lock instructions regardless of the data source. Available PDIST counters: 0",
+        "SampleAfterValue": "1000003",
         "UMask": "0x1",
         "Unit": "cpu_core"
     },
diff --git a/tools/perf/pmu-events/arch/x86/arrowlake/frontend.json b/tools/perf/pmu-events/arch/x86/arrowlake/frontend.json
index 67cc83de18d3..56cf1ec63200 100644
--- a/tools/perf/pmu-events/arch/x86/arrowlake/frontend.json
+++ b/tools/perf/pmu-events/arch/x86/arrowlake/frontend.json
@@ -58,6 +58,22 @@
         "UMask": "0x2",
         "Unit": "cpu_core"
     },
+    {
+        "BriefDescription": "Counts the number of instructions retired that were tagged with having preceded with frontend bound behavior",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.ALL",
+        "SampleAfterValue": "1000003",
+        "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "Counts the number of instructions retired that were tagged with having preceded with frontend bound behavior",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.ALL",
+        "SampleAfterValue": "1000003",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Retired ANT branches",
         "Counter": "0,1,2,3,4,5,6,7,8,9",
@@ -82,6 +98,80 @@
         "UMask": "0x3",
         "Unit": "cpu_core"
     },
+    {
+        "BriefDescription": "Counts the number of instruction retired that are tagged after a branch instruction causes bubbles/empty issue slots due to a baclear",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.BRANCH_DETECT",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x2",
+        "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "Counts the number of instruction retired that are tagged after a branch instruction causes bubbles/empty issue slots due to a baclear",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.BRANCH_DETECT",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x2",
+        "Unit": "cpu_lowpower"
+    },
+    {
+        "BriefDescription": "Counts the number of instruction retired that are tagged after a branch instruction causes bubbles /empty issue slots due to a btclear",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.BRANCH_RESTEER",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x40",
+        "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "Counts the number of instruction retired that are tagged after a branch instruction causes bubbles /empty issue slots due to a btclear",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.BRANCH_RESTEER",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x40",
+        "Unit": "cpu_lowpower"
+    },
+    {
+        "BriefDescription": "Counts the number of instructions retired that were tagged following an ms flow due to the bubble/wasted issue slot from exiting long ms flow",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.CISC",
+        "PublicDescription": "Counts the number of  instructions retired that were tagged following an ms flow due to the bubble/wasted issue slot from exiting long ms flow",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x1",
+        "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "Counts the number of instructions retired that were tagged following an ms flow due to the bubble/wasted issue slot from exiting long ms flow",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.CISC",
+        "PublicDescription": "Counts the number of  instructions retired that were tagged following an ms flow due to the bubble/wasted issue slot from exiting long ms flow",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x1",
+        "Unit": "cpu_lowpower"
+    },
+    {
+        "BriefDescription": "Counts the number of instructions retired that were tagged every cycle the decoder is unable to send 4 uops",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.DECODE",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x8",
+        "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "Counts the number of instructions retired that were tagged every cycle the decoder is unable to send 3 uops per cycle.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.DECODE",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x8",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Retired Instructions who experienced a critical DSB miss.",
         "Counter": "0,1,2,3,4,5,6,7,8,9",
@@ -103,6 +193,15 @@
         "UMask": "0x20",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of instructions retired that were tagged because empty issue slots were seen before the uop due to icache miss",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.ICACHE",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x20",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Counts the number of instructions retired that were tagged because empty issue slots were seen before the uop due to ITLB miss",
         "Counter": "0,1,2,3,4,5,6,7",
@@ -301,6 +400,42 @@
         "UMask": "0x3",
         "Unit": "cpu_core"
     },
+    {
+        "BriefDescription": "Counts the number of instruction retired tagged after a wasted issue slot if none of the previous events occurred",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.OTHER",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x80",
+        "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "Counts the number of instruction retired tagged after a wasted issue slot if none of the previous events occurred",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.OTHER",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x80",
+        "Unit": "cpu_lowpower"
+    },
+    {
+        "BriefDescription": "Counts the number of instruction retired that are tagged after a branch instruction causes bubbles/empty issue slots due to a predecode wrong",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.PREDECODE",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x4",
+        "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "Counts the number of instruction retired that are tagged after a branch instruction causes bubbles/empty issue slots due to a predecode wrong.",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xc6",
+        "EventName": "FRONTEND_RETIRED.PREDECODE",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x4",
+        "Unit": "cpu_lowpower"
+    },
     {
         "BriefDescription": "Retired Instructions who experienced STLB (2nd level TLB) true miss.",
         "Counter": "0,1,2,3,4,5,6,7,8,9",
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-events/arch/x86/mapfile.csv
index 8a2ee64cad7e..b2db2bb658ce 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -1,7 +1,7 @@
 Family-model,Version,Filename,EventType
 GenuineIntel-6-(97|9A|B7|BA|BF),v1.31,alderlake,core
 GenuineIntel-6-BE,v1.31,alderlaken,core
-GenuineIntel-6-C[56],v1.08,arrowlake,core
+GenuineIntel-6-C[56],v1.09,arrowlake,core
 GenuineIntel-6-(1C|26|27|35|36),v5,bonnell,core
 GenuineIntel-6-(3D|47),v30,broadwell,core
 GenuineIntel-6-56,v12,broadwellde,core
-- 
2.50.0.rc1.591.g9c95f17f64-goog

