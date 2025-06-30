Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD329346B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301077; cv=none; b=fCtriWfT4k1rCI1QzlTLw6dwx4ZEim7u3qvdGUUmyuBYjU7bwFf+8coPZcWP1Oe403vVp7bEq2a4TpiCvSR//ffdCUpv/VFIuhK57T/Nv+xBJWVsf69p8p4C586v57nNi5ueNh0d+ZVQ2gPCG0rNvFP1uHUaeijDMXk4Qu+e078=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301077; c=relaxed/simple;
	bh=Rd97YZXDuhHmk4QTcdy7ZTfD55Dg79JLB/cjYH5tLX8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=OghDvAv70ZWEsQbv3NCnp5JgeApbs8nIPnXqJigjAdz9S9fCYjsloFqodHjD43uZWZXCn/KeC9Ge2XVbd1O1jlCm7HFp7AngSzxa69m4lxIyHmEDcYp8lhSaGRUyEgi2qg5kAoS+N29MJoqnUXpJMxa1DN2Fvj+1vYWtM6vXV50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mdrxAePj; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mdrxAePj"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-747dd44048cso5414020b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751301074; x=1751905874; darn=vger.kernel.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXuQ+pYqGnfZrtXQnkbDBwKSbrvGKzOOx0TOeOV9NMM=;
        b=mdrxAePj8iSBJsbubEPl2XQS1RtFKbkPJ2+PCMcfRc/5uPVt7ArSYmQBTese2IbNsk
         HFUpOUeJkhD99gbAZ76sGhiVxAWwGCt2BQ+vSaH0XJM/Hw2K8RF0xVqq9tLNL0dre7s5
         4urXcXKfe6ucefUUoqvrfiADlFkjr1qovd26WUpHWWc3sd94fMEbsfg3rLBC0wt6MbHL
         6FUEWSl1qqQ2m9DAE2xF6DivbNBYpLjqZrswbgzPF0gSyPxBmhLmB7X7Vuxijv2lp08q
         hcYqnDxkIyzu/CuO2Yyl4fJokkudqwpSmxR/CEg5ca2aQGLlV2SnccUwCmVnI7Jsqtew
         zpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751301074; x=1751905874;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZXuQ+pYqGnfZrtXQnkbDBwKSbrvGKzOOx0TOeOV9NMM=;
        b=W2WYX4s3tXkopIDiP1qROl0wGT9lFo9/t4Pus4+jmUw/a01Qe2LF5ve/dxnSCSo1wj
         zHaLWSX3eHCpw3feJH3y6RsT8PgPVnoDR7a45Hyf5pOlUGkGFQsRUF/4+X0FKVByTX1R
         jiEwsyv8t/4x2Rk+a7zEO0vlyiTXwrToNIdUvtlQPH/qWf79oM/n0TLs+Oc0AzMd5ZtE
         xRM22SY4lv2jwW1AMpy+07SCv2TnV+xH1IwCzVbn7X/PWydL+bEJ0WcTc7fpRxEGVUZW
         G8CASrPGP6z1BO7IuQYmMMHbP6TIPrDwpjAeb9ZAm2zxK79m9WFlYJ24gUZTe/1aWtlL
         9bdA==
X-Forwarded-Encrypted: i=1; AJvYcCWSOdvbdT0t3uRUHtOZQPHwMDPmqjsECfoqIl6hHvfoPluz4WIt1uwGdZDWviMzbkyCk1t9E4HGikS4KFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZk/2kAMsLUjArmmTgIAihHV2v70/DrSmg67AjWUn+YX9d+yyT
	xnkpC0w9LMZfnWMp+VfBX9QgWZe0z8pplW50L+zDzVkRUJcMwkFRLiPWYO3cNCDMvqk4ZuQsoAI
	xBusSIjqpxQ==
X-Google-Smtp-Source: AGHT+IFGfvG10pChwqHSHT1UNV20wP+FQW0t3Ub143hnR0QRTHYD6VIoB+5qifx4baBy8GOgaFLszVAk4PTP
X-Received: from pfld20.prod.google.com ([2002:a05:6a00:1994:b0:739:8cd6:c16c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6da8:b0:21f:568c:712c
 with SMTP id adf61e73a8af0-220a12e39c1mr22258906637.14.1751301074433; Mon, 30
 Jun 2025 09:31:14 -0700 (PDT)
Date: Mon, 30 Jun 2025 09:30:50 -0700
In-Reply-To: <20250630163101.1920170-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250630163101.1920170-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250630163101.1920170-6-irogers@google.com>
Subject: [PATCH v2 05/15] perf vendor events: Update EmeraldRapids events
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
Content-Transfer-Encoding: quoted-printable

Update events from v1.11 to v1.14.

Bring in the event updates v1.14:
https://github.com/intel/perfmon/commit/6f6e4c8c906992b450cb2014d0501a9ec1c=
da0d0
https://github.com/intel/perfmon/commit/e363f82276c129aec60402a1d64efbbd41a=
f844e

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../arch/x86/emeraldrapids/pipeline.json      |  2 +-
 .../arch/x86/emeraldrapids/uncore-io.json     | 12 +++++++++++
 .../arch/x86/emeraldrapids/uncore-memory.json | 20 +++++++++++++++++++
 tools/perf/pmu-events/arch/x86/mapfile.csv    |  2 +-
 4 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/emeraldrapids/pipeline.json b/t=
ools/perf/pmu-events/arch/x86/emeraldrapids/pipeline.json
index 00b05a77c289..48bec483b49a 100644
--- a/tools/perf/pmu-events/arch/x86/emeraldrapids/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/emeraldrapids/pipeline.json
@@ -684,7 +684,7 @@
         "Counter": "0,1,2,3",
         "EventCode": "0x4c",
         "EventName": "LOAD_HIT_PREFETCH.SWPF",
-        "PublicDescription": "Counts all not software-prefetch load dispat=
ches that hit the fill buffer (FB) allocated for the software prefetch. It =
can also be incremented by some lock instructions. So it should only be use=
d with profiling so that the locks can be excluded by ASM (Assembly File) i=
nspection of the nearby instructions. Available PDIST counters: 0",
+        "PublicDescription": "Counts all software-prefetch load dispatches=
 that hit the fill buffer (FB) allocated for the software prefetch. It can =
also be incremented by some lock instructions. So it should only be used wi=
th profiling so that the locks can be excluded by ASM (Assembly File) inspe=
ction of the nearby instructions. Available PDIST counters: 0",
         "SampleAfterValue": "100003",
         "UMask": "0x1"
     },
diff --git a/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-io.json b/=
tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-io.json
index 94340dee1c9c..d4cf2199d46b 100644
--- a/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-io.json
+++ b/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-io.json
@@ -1821,6 +1821,18 @@
         "UMask": "0x4",
         "Unit": "IIO"
     },
+    {
+        "BriefDescription": "Posted requests sent by the integrated IO (II=
O) controller to the Ubox, useful for counting message signaled interrupts =
(MSI).",
+        "Counter": "0,1,2,3",
+        "EventCode": "0x8e",
+        "EventName": "UNC_IIO_NUM_REQ_OF_CPU_BY_TGT.UBOX_POSTED",
+        "Experimental": "1",
+        "FCMask": "0x01",
+        "PerPkg": "1",
+        "PortMask": "0x00FF",
+        "UMask": "0x4",
+        "Unit": "IIO"
+    },
     {
         "BriefDescription": "ITC address map 1",
         "Counter": "0,1,2,3",
diff --git a/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-memory.jso=
n b/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-memory.json
index aa06088dd26f..68be01dad7c9 100644
--- a/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-memory.json
+++ b/tools/perf/pmu-events/arch/x86/emeraldrapids/uncore-memory.json
@@ -2145,6 +2145,16 @@
         "UMask": "0x1",
         "Unit": "MCHBM"
     },
+    {
+        "BriefDescription": "ECC Correctable Errors",
+        "Counter": "0,1,2,3",
+        "EventCode": "0x09",
+        "EventName": "UNC_MCHBM_ECC_CORRECTABLE_ERRORS",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "PublicDescription": "ECC Correctable Errors.  Counts the number o=
f ECC errors detected and corrected by the iMC on this channel.  This count=
er is only useful with ECC devices.  This count will increment one time for=
 each correction regardless of the number of bits corrected.  The iMC can c=
orrect up to 4 bit errors in independent channel mode and 8 bit errors in l=
ockstep mode.",
+        "Unit": "MCHBM"
+    },
     {
         "BriefDescription": "HBM Precharge All Commands",
         "Counter": "0,1,2,3",
@@ -2759,6 +2769,16 @@
         "UMask": "0x3",
         "Unit": "iMC"
     },
+    {
+        "BriefDescription": "ECC Correctable Errors",
+        "Counter": "0,1,2,3",
+        "EventCode": "0x09",
+        "EventName": "UNC_M_ECC_CORRECTABLE_ERRORS",
+        "Experimental": "1",
+        "PerPkg": "1",
+        "PublicDescription": "ECC Correctable Errors : Counts the number o=
f ECC errors detected and corrected by the iMC on this channel.  This count=
er is only useful with ECC DRAM devices.  This count will increment one tim=
e for each correction regardless of the number of bits corrected.  The iMC =
can correct up to 4 bit errors in independent channel mode and 8 bit errors=
 in lockstep mode.",
+        "Unit": "iMC"
+    },
     {
         "BriefDescription": "IMC Clockticks at HCLK frequency",
         "Counter": "0,1,2,3",
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-ev=
ents/arch/x86/mapfile.csv
index 9a60e95a2e15..e139a099374a 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -9,7 +9,7 @@ GenuineIntel-6-4F,v23,broadwellx,core
 GenuineIntel-6-55-[56789ABCDEF],v1.25,cascadelakex,core
 GenuineIntel-6-DD,v1.00,clearwaterforest,core
 GenuineIntel-6-9[6C],v1.05,elkhartlake,core
-GenuineIntel-6-CF,v1.11,emeraldrapids,core
+GenuineIntel-6-CF,v1.14,emeraldrapids,core
 GenuineIntel-6-5[CF],v13,goldmont,core
 GenuineIntel-6-7A,v1.01,goldmontplus,core
 GenuineIntel-6-B6,v1.07,grandridge,core
--=20
2.50.0.727.gbf7dc18ff4-goog

