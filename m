Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F2C2D4B52
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301095; cv=none; b=Ju3BWnaP9oyhgsAGli1DiKDZuGk2qEBjfl/0d7K0Jps1NDeoxZNZx/vexqgTTh7fpJ6eSLOuSyEEpAAzorsikQ0/497QulOD9tIpJyOZ/JKCYt3/72M3Q9JtXrLmX8MW9M+bXIj3F1EHsjQtvfMJu6198vARscaptSH89+2vELw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301095; c=relaxed/simple;
	bh=EAr6RrtFQl3yGnUqGwOlrUzkpXUWc+2Qk+FF83cNPFA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=X6ngYTVEJFWgebjWj5tKbCzQY0Ns3lkkNz3t363yuxnHZ16mcS8G/iBqV5AOpKnPr/vcClEMlixzq6GtCAFwJiHJOKPIo3L8X9ZBBYU1VAcZvIsE2ZurzCTUpeTjBWioETm5qZRpZO3elzFot9CdQKp3XHUmi18McqcHQ0t8OEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mI5EFfBX; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mI5EFfBX"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so4402225a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751301093; x=1751905893; darn=vger.kernel.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O93yuuBrN5j1m23sGtIa8teySV5SU0bQ4t+orEdV4gk=;
        b=mI5EFfBXnVxSlgT1/GQxICjkHc4wvCxXPj7thZod4IMZlaBBjcSSOu8PD2LQpA2rNn
         9kgzWK59G5KdsKZ3Fk/IhZNuIeK7/b0/NNaPQ2yQt3aKMkxV4rIXXzSvpfAcWSFJBh0G
         Dd+b9IXAO+mybnb2gLVdBDFLBqC9MivmbuuQUeLr3a24WPuvh5ujD8YLupv2Wkt88kV9
         SEv3jdPzzry4AH3CdDnC3nyQq1xLg4T8ssmGlISxWk/rQtaymvEDQ6TfsG8P1IwCwuNC
         NpN5MIv5uk4JT6TsDyimy/Yyi5k8dBzNFHSDMwuGMY+3JTmDY/ZPgOgxfFxAWg4LMxZt
         KpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751301093; x=1751905893;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O93yuuBrN5j1m23sGtIa8teySV5SU0bQ4t+orEdV4gk=;
        b=pRI2HC6GXF6z30NDf+0gKOjSBtXB9M76ijXJLrZMtmucz4aKtMLHkQ/yMDpkBvLtb4
         gWoccn/XDktPLaXI2ERVHGMTaYABy+ThXx4QqrBzuD1MbtDCpbgVNaIC6I95lJD4k4eL
         5xgwX91hCDs7UlhFHEdFHO3mk916UnC/7XBZEepncTCTM2Gd9y/ADUaBPlxG08kbFAoa
         DPcUynqbshmWoRD+4lnNCiYNHiwV92CMIKwxHhuRF/ANCDnORE9yWRgBCxpUzZigRu9+
         Hk50QPqk/mMYbAGfNCj0Bkt7/AUNSheM/lFDkgD9idudl3xtBW8lgC/qqr0K2kY1bKH8
         +FAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEd1vn1KfH71irqK3ljpy3lDhrShTdj4inp/E4QKg3HD8fIecT8R4jrL9kAZZtCm7R31/k64imyjzr19g=@vger.kernel.org
X-Gm-Message-State: AOJu0YykHeYd+JiOKDSl9w6vzg74O6haeDretDoCO76A0sgExXt1MwT/
	/NMZd/eQA59OuVm9xGu1Mhhgme6d1BiEogZ+b+fdInFlv5mdLIE5UrgAADIJSaF51AladM6iO3v
	GqS/wjyudqw==
X-Google-Smtp-Source: AGHT+IGlhAXRVd62WJs68wzgkQHNAHMb/DvZ6Hqv2uFVhQEXhs2r5yuuU5AxSx87NvrIdcBsgwrIq9qoSKnZ
X-Received: from pjj14.prod.google.com ([2002:a17:90b:554e:b0:312:eaf7:aa0d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2247:b0:311:c93b:3ca2
 with SMTP id 98e67ed59e1d1-318c8eb9988mr19643825a91.6.1751301092806; Mon, 30
 Jun 2025 09:31:32 -0700 (PDT)
Date: Mon, 30 Jun 2025 09:31:00 -0700
In-Reply-To: <20250630163101.1920170-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250630163101.1920170-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250630163101.1920170-16-irogers@google.com>
Subject: [PATCH v2 15/15] perf vendor events: Update TigerLake events
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

Update events from v1.17 to v1.18.

Bring in the event updates v1.18:
https://github.com/intel/perfmon/commit/943fea37d0d54232605f12abf72a812ac31=
4cd1d

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/arch/x86/mapfile.csv             | 2 +-
 tools/perf/pmu-events/arch/x86/tigerlake/pipeline.json | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-ev=
ents/arch/x86/mapfile.csv
index 2d9699efff58..354ce241500b 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -35,7 +35,7 @@ GenuineIntel-6-(37|4A|4C|4D|5A),v15,silvermont,core
 GenuineIntel-6-(4E|5E|8E|9E|A5|A6),v59,skylake,core
 GenuineIntel-6-55-[01234],v1.37,skylakex,core
 GenuineIntel-6-86,v1.23,snowridgex,core
-GenuineIntel-6-8[CD],v1.17,tigerlake,core
+GenuineIntel-6-8[CD],v1.18,tigerlake,core
 GenuineIntel-6-2C,v5,westmereep-dp,core
 GenuineIntel-6-25,v4,westmereep-sp,core
 GenuineIntel-6-2F,v4,westmereex,core
diff --git a/tools/perf/pmu-events/arch/x86/tigerlake/pipeline.json b/tools=
/perf/pmu-events/arch/x86/tigerlake/pipeline.json
index 7ef1bac08463..b417e1db9e07 100644
--- a/tools/perf/pmu-events/arch/x86/tigerlake/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/tigerlake/pipeline.json
@@ -497,7 +497,7 @@
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
--=20
2.50.0.727.gbf7dc18ff4-goog

