Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA21288DA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749686574; cv=none; b=rczKCZVQQeCGQgWnLKPg3FfyhjT93Hp/RFnTHptosqfjxagjP8RbBmnJNEggM4sYFou3vOxdyfyLGfLkkyOprNAiBGQZBcdWCGjh3awRv6UZwzicuqjRQri/qJpf+gCNF+Va2pi3OQLgUREl0H1i09Grey99tkPoejuIlS+fJ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749686574; c=relaxed/simple;
	bh=Q/mbrCPGvZtVCsK/mn8/zuy3mRqFS3sJTQpDWrqsrh8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=ZbcaPFd8yeK90ysMabyw3dfRgOsrRL7QNM7Ngbvn/jXfWXJDHpM7vY04YcgvKj8tqNQScSoNVkn5coMfbUd7SOqkfJxuCyqVXKPYJsrrqe9yDcZePmwsLu5emDKdJKf8M3tOlpaKIujWAw1/6PrmVDS6B1qDa1sIJ1on8KORsA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k1dywmDS; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k1dywmDS"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2fb347b3e4so167549a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749686572; x=1750291372; darn=vger.kernel.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQQxcFLDosIVv4JUv5/6nXKM2/vvgEnajjnxg425FeU=;
        b=k1dywmDS6U9rIImnV8MbAXcEUwlqBS/R+ZP6hA1wLaCCOPEL0eTbbaSGKJt79/0hGK
         g3Ra3FwjIdlJtGJrJ09qY+bLjMt8VF9IeMOHw6XVufPCJSqLAjRIWyQVIk4ibSK9PZgi
         iDI6J9JGTMnt22aKFeWt7SQJxK97yI+pd5ts5UEyTJ3qZkIenQZVBevs6ouBNdthkneo
         1otD2oGPgzky191kqaS1Wy8uz5hKxk2FsbtJFB4qwdGjLOQtV+JBWPnUUiqenCYmP3lI
         XssiN41f3OdhCxV6i9MpEFM0btPbyIPoMSfqBn1lBLCSuHe1TiCPCcDmMlS18fzB7TyD
         Is/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749686572; x=1750291372;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qQQxcFLDosIVv4JUv5/6nXKM2/vvgEnajjnxg425FeU=;
        b=eUwIPda2XoM1Y3HU+Dv78/k3dYC18ZhYbrRFs5YgWUQ8DK7WE6sdReSGWCg7tJPI0r
         BUAcsd8WrJMMYDm/sfRKn8/uqRAW86ll8sGTEgrfl8X4rZ2v5t7mubUN3RNhAdWjY13R
         g0XHtmIByRUoXsXTmWex0MuM5f4MlnAN9cqwz2ml0z09E8y3RslERFcFwwY3GSS+xcPf
         9Efdvg+22g07mJEsHqSJ9G+kyF+dg9OCNJEQBmWoWKH9/nuUFzDYagMsoBLuijmQW2A1
         TGNtMZhKj5DBt4YNRK76FeDbv10B/VJ2efrTphaS7PVbpIgQVKnKh0RX0Z8e1n1G1Z83
         L4zg==
X-Forwarded-Encrypted: i=1; AJvYcCU1d0pJzQKSvo4NsfEfWOj+EhdzkISnbeBKNmIabVb51INvzKpH03y9MZG2Z2y7+re/rLRoG7tiVil6RZY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4hC6NOTTgcGtqE1YI3wJe2B/32rmyI3/4wcXZ3ld+YYMTnG9B
	yKgHsbh1qufmz/qd2KdGCXmC+XGyOui3nOWco2/mW6MdBRq06xSSKXFA6z5JuEVP9hu9+CPx7Y6
	HguagHUOeUg==
X-Google-Smtp-Source: AGHT+IH8979V4AZvHAEEANCj1pHoa5xxhNYEoqChdfJBiTikePa1Ov290qW0O4RSQDdaO1PwbDsf4zl31SBf
X-Received: from pjbpx2.prod.google.com ([2002:a17:90b:2702:b0:313:230:89ed])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:510f:b0:313:2754:5910
 with SMTP id 98e67ed59e1d1-313bfbc310bmr2143164a91.15.1749686571909; Wed, 11
 Jun 2025 17:02:51 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:02:21 -0700
In-Reply-To: <20250612000224.780337-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250612000224.780337-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250612000224.780337-13-irogers@google.com>
Subject: [PATCH v1 12/15] perf vendor events: Update SapphireRapids events
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
Content-Transfer-Encoding: quoted-printable

Update events from v1.25 to v1.28.

Bring in the event updates v1.28:
https://github.com/intel/perfmon/commit/990bfdff270adf08d408534d6d66ba47ec6=
adb34
https://github.com/intel/perfmon/commit/b7b4d7f18cf9a893438777a571abc7ecc08=
7368b

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/arch/x86/mapfile.csv    |  2 +-
 .../arch/x86/sapphirerapids/pipeline.json     |  2 +-
 .../arch/x86/sapphirerapids/uncore-io.json    | 12 +++++++++++
 .../x86/sapphirerapids/uncore-memory.json     | 20 +++++++++++++++++++
 4 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-ev=
ents/arch/x86/mapfile.csv
index 252382751fa5..13eaed97b4ac 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -29,7 +29,7 @@ GenuineIntel-6-2E,v4,nehalemex,core
 GenuineIntel-6-CC,v1.00,pantherlake,core
 GenuineIntel-6-A7,v1.04,rocketlake,core
 GenuineIntel-6-2A,v19,sandybridge,core
-GenuineIntel-6-8F,v1.25,sapphirerapids,core
+GenuineIntel-6-8F,v1.28,sapphirerapids,core
 GenuineIntel-6-AF,v1.09,sierraforest,core
 GenuineIntel-6-(37|4A|4C|4D|5A),v15,silvermont,core
 GenuineIntel-6-(4E|5E|8E|9E|A5|A6),v59,skylake,core
diff --git a/tools/perf/pmu-events/arch/x86/sapphirerapids/pipeline.json b/=
tools/perf/pmu-events/arch/x86/sapphirerapids/pipeline.json
index 00b05a77c289..48bec483b49a 100644
--- a/tools/perf/pmu-events/arch/x86/sapphirerapids/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/sapphirerapids/pipeline.json
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
diff --git a/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-io.json b=
/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-io.json
index aab082ff9402..dac7e6c50f31 100644
--- a/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-io.json
+++ b/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-io.json
@@ -1901,6 +1901,18 @@
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
diff --git a/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-memory.js=
on b/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-memory.json
index aa06088dd26f..68be01dad7c9 100644
--- a/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-memory.json
+++ b/tools/perf/pmu-events/arch/x86/sapphirerapids/uncore-memory.json
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
--=20
2.50.0.rc1.591.g9c95f17f64-goog

