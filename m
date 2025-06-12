Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B7418E1A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749686566; cv=none; b=jTjn5NFLsB/m2QnvzpsfIjZbDsIK2p0L01BMYm4MA2sg9ODg1I05V2FlG+oSUiLjdABXgCoWW76/ONIHwreO49Eb1HQdqJNN9VGORAtxoXkdBSmGy+n0e17keiR7oo94K0uBhkDgwlMYz4j/5VSE/foiqlQE+PrxU+fmw/3HxUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749686566; c=relaxed/simple;
	bh=hkeiTY0ICit0AyGfTjKyAMDc5M/ce+3k+W9hyAWbq4g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=ZTOnozoCIuCQkqyWV2pkIdgPFJLdd3dyBrQlyH/PDs8yrBAVdK/amGdAMRGkIQl3Kz6B1mGUDY2JBWn5IlDom3HOvMvZj+WvKjI0WCiaRAh3vqKzoIzuMXMEBgpTmk9ub7t0GO/qaaMob1JWweChtB5ZoRx1Ls1dd2uqIFQN8ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bQj4mK7g; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bQj4mK7g"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-313b0a63c41so501526a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749686564; x=1750291364; darn=vger.kernel.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOsRkprJL03zu9ig7fckI2iHwzkKxj9dCopS2Vaq8YI=;
        b=bQj4mK7gyEinBXYJ+M0XS/U+hRBczO9ef2d/hd8z8HS10cait3I76BHv4Z+jqXFiib
         FrB41fZo/RGhRjmXgbDwPFGVNUXVfJUH2x3qk1zfwx1WDGlRd5GOPFFbNXlvW8Gb0GDf
         rl9dFnH6hiM02VHDb4wuRTkJYIBn8TAUeqcmKRjWi4un4JVvxBTyu0T/e4KJJaBiHbej
         JfHirTlGCy22Rs5C11TBRmX9gaFy4W6pgMNGVGBj8+vhYPUHyF17JSuRAgizUeEyijdB
         Ju53yQ8d+5as8yiQeIShzHQpHYCSiLltt6ga8/EpDR7nh92IQJu80qkMA4e//7OkTy8b
         QT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749686564; x=1750291364;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sOsRkprJL03zu9ig7fckI2iHwzkKxj9dCopS2Vaq8YI=;
        b=qgaNepnyaBBsbhh31eULgk9+oKFU4b6yhhFzMVMoANGryMjuWV3eQhXnobTqCq2t37
         hk0Ogt+xQJAB/Dvs0a2nsyB+3OXz+sV9GMt42ia4rMviloSjxrmTz3ZlnzploUArG2aD
         NLXn3xbLdXnb+aTZEYSUUDDXfv7zcu0S/yjJJhyitbosCG3v6JHihiqP6emh0qhYoefc
         G/8L3iXYyZjFJ6bLy259ROqEdI4N/lnFlDK7XdyUGaoiK0Mu68BBfNR76qmr8Hd0nRP7
         yBBtfja7zjujmxX2MrP04GJs0qkYNMMALFS7L5pMbOVch2VlNkQsjRyYUrLE8bW8QGri
         cy4g==
X-Forwarded-Encrypted: i=1; AJvYcCW+kIBveKeN4oowsa+thIoqFR3PXGKLEFcjNSK8UtttO0Y4FuIBAiap0rEn5qiI+6ywaEN3BZBuRfvB380=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXgHebl3oh8ErvarQjHFNmmU8TVaaL8dpfDf08KZvzVGr70Pls
	4ZiCB3gEoEDCqARUMrrD2cppzNvAh+RxG+LRYQqSeXHnH6X/40Jxw+BEHvkHQ1NWgxLZmrqf1cw
	Csw+pQ3lprw==
X-Google-Smtp-Source: AGHT+IEXEB1VxBlgadyiDbTddOcshvTp9BkillUG2rNdPvHHwhKasf1oXPkEXLFmuDv4Qr8uBmyO4HCoMi4M
X-Received: from pjbeu7.prod.google.com ([2002:a17:90a:f947:b0:311:f309:e314])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3502:b0:312:51a9:5d44
 with SMTP id 98e67ed59e1d1-313af0fd2cemr7774631a91.5.1749686564461; Wed, 11
 Jun 2025 17:02:44 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:02:17 -0700
In-Reply-To: <20250612000224.780337-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250612000224.780337-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250612000224.780337-9-irogers@google.com>
Subject: [PATCH v1 08/15] perf vendor events: Update IcelakeX events
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

Update events from v1.27 to v1.28.

Bring in the event updates v1.28:
https://github.com/intel/perfmon/commit/c52728a46cf37ba271c09b1eb7093cfc82d=
fbf29

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/arch/x86/icelakex/pipeline.json     | 2 +-
 tools/perf/pmu-events/arch/x86/icelakex/uncore-cache.json | 2 --
 tools/perf/pmu-events/arch/x86/mapfile.csv                | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/icelakex/pipeline.json b/tools/=
perf/pmu-events/arch/x86/icelakex/pipeline.json
index f1446f1b67c6..f3a0d7f49af4 100644
--- a/tools/perf/pmu-events/arch/x86/icelakex/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/icelakex/pipeline.json
@@ -477,7 +477,7 @@
         "Counter": "0,1,2,3",
         "EventCode": "0x4c",
         "EventName": "LOAD_HIT_PREFETCH.SWPF",
-        "PublicDescription": "Counts all not software-prefetch load dispat=
ches that hit the fill buffer (FB) allocated for the software prefetch. It =
can also be incremented by some lock instructions. So it should only be use=
d with profiling so that the locks can be excluded by ASM (Assembly File) i=
nspection of the nearby instructions.",
+        "PublicDescription": "Counts all software-prefetch load dispatches=
 that hit the fill buffer (FB) allocated for the software prefetch. It can =
also be incremented by some lock instructions. So it should only be used wi=
th profiling so that the locks can be excluded by ASM (Assembly File) inspe=
ction of the nearby instructions.",
         "SampleAfterValue": "100003",
         "UMask": "0x1"
     },
diff --git a/tools/perf/pmu-events/arch/x86/icelakex/uncore-cache.json b/to=
ols/perf/pmu-events/arch/x86/icelakex/uncore-cache.json
index 8c73708befef..6f84ad47276d 100644
--- a/tools/perf/pmu-events/arch/x86/icelakex/uncore-cache.json
+++ b/tools/perf/pmu-events/arch/x86/icelakex/uncore-cache.json
@@ -8193,7 +8193,6 @@
         "Counter": "0,1,2,3",
         "EventCode": "0x35",
         "EventName": "UNC_CHA_TOR_INSERTS.IO_MISS_RFO",
-        "Experimental": "1",
         "PerPkg": "1",
         "PublicDescription": "TOR Inserts : RFOs issued by IO Devices that=
 missed the LLC : Counts the number of entries successfully inserted into t=
he TOR that match qualifications specified by the subevent.   Does not incl=
ude addressless requests such as locks and interrupts.",
         "UMask": "0xc803fe04",
@@ -8234,7 +8233,6 @@
         "Counter": "0,1,2,3",
         "EventCode": "0x35",
         "EventName": "UNC_CHA_TOR_INSERTS.IO_RFO",
-        "Experimental": "1",
         "PerPkg": "1",
         "PublicDescription": "TOR Inserts : RFOs issued by IO Devices : Co=
unts the number of entries successfully inserted into the TOR that match qu=
alifications specified by the subevent.   Does not include addressless requ=
ests such as locks and interrupts.",
         "UMask": "0xc803ff04",
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-ev=
ents/arch/x86/mapfile.csv
index 960076e3f66f..53c0d19c51d4 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -17,7 +17,7 @@ GenuineIntel-6-A[DE],v1.10,graniterapids,core
 GenuineIntel-6-(3C|45|46),v36,haswell,core
 GenuineIntel-6-3F,v29,haswellx,core
 GenuineIntel-6-7[DE],v1.24,icelake,core
-GenuineIntel-6-6[AC],v1.27,icelakex,core
+GenuineIntel-6-6[AC],v1.28,icelakex,core
 GenuineIntel-6-3A,v24,ivybridge,core
 GenuineIntel-6-3E,v24,ivytown,core
 GenuineIntel-6-2D,v24,jaketown,core
--=20
2.50.0.rc1.591.g9c95f17f64-goog

