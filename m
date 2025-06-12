Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909822905
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749686559; cv=none; b=MTSre7D+4ZCQ6+28Q5GQHBCh+DxIA1Po2fCBoVq7Fb99sX+MAVA0T4ppsRVs0CeFvzM/Na+dQONAYbSahPzeJh2H+VqLUFhZYPzEazPqM2FyzeTQ4qiOU40FoOq7tHnpf2Q95ajpD/1aVhf4qn7009AxQtJw/DjHRSndOmiFRKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749686559; c=relaxed/simple;
	bh=iUk18DC8Dj4iIJuFuI5ee/WnJ53SmQtPzEUuaSmQYYI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=mNooe/BgU6T/N5PM+NTg+5JGnxNdjvUCiEzmBXbWzyG92gZk9SKibmB08Tjl9L+0CmY8ZSJFb3sTdwXds70euMVErGK6zFlhgNhVdI9y7YetzJ6rEMbqnQQDrPhvo+kOGsXDWXPqRyvIgF/ymMUpQOEpiC7nC1whhH9W8bsn5NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SSSetGeh; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SSSetGeh"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-739f707258dso135356a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749686556; x=1750291356; darn=vger.kernel.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBzXt7aOCAP70nk+7o4IIKdMqZfqaJRnyIRRHXlcFAc=;
        b=SSSetGehHbBo0AgCCkjMo7ok7VpQ4kswxD/TVvnnoByUul6NCumegZEe68A/vFsj8h
         zUgGFwBLHIv78S0ZIPccLpo1Q15IwqY2phdcStxYMqDCOiIihUP2WLcl+Bc+vcDe9IjU
         Spb658emECxiEZ1oGrhq6d32hw4f9/IS6vBqujiDBH6AukQWNICWKbvyIC2X22oM/tC9
         4yx6JhRVczIQ8C6/0LUacKmnKAOOf8xWCUDm6FYIS40mrauFcD+wDMxOFACHf1tI45yi
         /vnhuTgOlXQUej6jOVyHSWxveLD0CGRZVaDqHgTuBzQA/ZUxRsQMbI9DSmHMzafelBVC
         FiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749686556; x=1750291356;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bBzXt7aOCAP70nk+7o4IIKdMqZfqaJRnyIRRHXlcFAc=;
        b=QP5d/fcCurT6CzmkZj8NfZGORYI2vIaeMvmQPaNnu8Z0kEUTeHr/dUGKH3pt6Wf45W
         Jx9gOM5cGVGxxwlc6t87pkIpZWg8KZmF/MhY4nEmi31Ymv6TPSXv1NuNIQ+p05BcXHVr
         ehRviVhfLDWsIpYEWwLolxlJOcJ3ZbyLcvP94WBfvqGRqLIDLN9DwIciEFl2i0ZEJRw1
         WFXMXZp+/Fx+AA4Tnc+E7y1i1RP9C3l+XV936ufS1u+7McOIYkS+z4LLyqnBWjIxKWyR
         Hdkm7vBZahI7DqAf0t026/GoG6b9WL50qks3LdsYr2PqeUPlRHTf9vo39EjSMCVhZEeR
         jknQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBfz7BS9PgIgoksmYwp/InbSSHqderVHrLubHv8ZwIcVHSyd2CkCLIEixLAQFcrkJDCFPN3cPAejhZatM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOA0ivQ/A2DQeVDXUoiOsfeqe1/sVTCTc9j7JbRf1cVNX4A14y
	BhGLpRhkY5MiadUgQdxM2T8ZgHDw4BJM7mvEtCokHRVe/MNYjFb3etBIM++6EFZi5XO6NgC6eC+
	PXIN5Bvp60A==
X-Google-Smtp-Source: AGHT+IHZ1LLzkCEwF559t3LCCUZtKVtU3ObfDbP7nBkfmc0pcDLh3AMazVb14C6j0Prw425sg83X7vLAv9b4
X-Received: from oabut18.prod.google.com ([2002:a05:6870:ad92:b0:2b8:ecea:83a6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:b69d:b0:2c1:650b:fc86
 with SMTP id 586e51a60fabf-2eab4029b77mr787435fac.1.1749686556666; Wed, 11
 Jun 2025 17:02:36 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:02:13 -0700
In-Reply-To: <20250612000224.780337-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250612000224.780337-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250612000224.780337-5-irogers@google.com>
Subject: [PATCH v1 04/15] perf vendor events: Update CascadelakeX events
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

Update events from v1.23 to v1.25.

Bring in the event updates v1.25:
https://github.com/intel/perfmon/commit/86f146e15626b0fd3b032cab4538cafaaf2=
d0635
https://github.com/intel/perfmon/commit/fef03ffc333ae44d1e9d695b4e67e5bbb44=
29729

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../pmu-events/arch/x86/cascadelakex/floating-point.json    | 6 +++---
 tools/perf/pmu-events/arch/x86/cascadelakex/pipeline.json   | 2 +-
 tools/perf/pmu-events/arch/x86/mapfile.csv                  | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/cascadelakex/floating-point.jso=
n b/tools/perf/pmu-events/arch/x86/cascadelakex/floating-point.json
index 1c709983b65f..3ef6f00f1135 100644
--- a/tools/perf/pmu-events/arch/x86/cascadelakex/floating-point.json
+++ b/tools/perf/pmu-events/arch/x86/cascadelakex/floating-point.json
@@ -111,7 +111,7 @@
         "Counter": "0,1,2,3",
         "EventCode": "0xCF",
         "EventName": "FP_ARITH_INST_RETIRED2.128BIT_PACKED_BF16",
-        "PublicDescription": "Counts once for each Intel AVX-512 computati=
onal 512-bit packed BFloat16 floating-point instruction retired. Applies to=
 the ZMM based VDPBF16PS instruction.  Each count represents 64 computation=
 operations. This event is only supported on products formerly named Cooper=
 Lake and is not supported on products formerly named Cascade Lake.",
+        "PublicDescription": "Counts once for each Intel AVX-512 computati=
onal 128-bit packed BFloat16 floating-point instruction retired. Applies to=
 the XMM based VDPBF16PS instruction. Each count represents 16 computation =
operations. This event is only supported on products formerly named Cooper =
Lake and is not supported on products formerly named Cascade Lake.",
         "SampleAfterValue": "2000003",
         "UMask": "0x20"
     },
@@ -120,7 +120,7 @@
         "Counter": "0,1,2,3",
         "EventCode": "0xCF",
         "EventName": "FP_ARITH_INST_RETIRED2.256BIT_PACKED_BF16",
-        "PublicDescription": "Counts once for each Intel AVX-512 computati=
onal 128-bit packed BFloat16 floating-point instruction retired. Applies to=
 the XMM based VDPBF16PS instruction. Each count represents 16 computation =
operations. This event is only supported on products formerly named Cooper =
Lake and is not supported on products formerly named Cascade Lake.",
+        "PublicDescription": "Counts once for each Intel AVX-512 computati=
onal 256-bit packed BFloat16 floating-point instruction retired. Applies to=
 the YMM based VDPBF16PS instruction.  Each count represents 32 computation=
 operations. This event is only supported on products formerly named Cooper=
 Lake and is not supported on products formerly named Cascade Lake.",
         "SampleAfterValue": "2000003",
         "UMask": "0x40"
     },
@@ -129,7 +129,7 @@
         "Counter": "0,1,2,3",
         "EventCode": "0xCF",
         "EventName": "FP_ARITH_INST_RETIRED2.512BIT_PACKED_BF16",
-        "PublicDescription": "Counts once for each Intel AVX-512 computati=
onal 256-bit packed BFloat16 floating-point instruction retired. Applies to=
 the YMM based VDPBF16PS instruction.  Each count represents 32 computation=
 operations. This event is only supported on products formerly named Cooper=
 Lake and is not supported on products formerly named Cascade Lake.",
+        "PublicDescription": "Counts once for each Intel AVX-512 computati=
onal 512-bit packed BFloat16 floating-point instruction retired. Applies to=
 the ZMM based VDPBF16PS instruction.  Each count represents 64 computation=
 operations. This event is only supported on products formerly named Cooper=
 Lake and is not supported on products formerly named Cascade Lake.",
         "SampleAfterValue": "2000003",
         "UMask": "0x80"
     },
diff --git a/tools/perf/pmu-events/arch/x86/cascadelakex/pipeline.json b/to=
ols/perf/pmu-events/arch/x86/cascadelakex/pipeline.json
index 3dd296ab4d78..9a1349527b66 100644
--- a/tools/perf/pmu-events/arch/x86/cascadelakex/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/cascadelakex/pipeline.json
@@ -542,7 +542,7 @@
         "Counter": "0,1,2,3",
         "EventCode": "0x4C",
         "EventName": "LOAD_HIT_PRE.SW_PF",
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
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-ev=
ents/arch/x86/mapfile.csv
index b2db2bb658ce..9a60e95a2e15 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -6,7 +6,7 @@ GenuineIntel-6-(1C|26|27|35|36),v5,bonnell,core
 GenuineIntel-6-(3D|47),v30,broadwell,core
 GenuineIntel-6-56,v12,broadwellde,core
 GenuineIntel-6-4F,v23,broadwellx,core
-GenuineIntel-6-55-[56789ABCDEF],v1.23,cascadelakex,core
+GenuineIntel-6-55-[56789ABCDEF],v1.25,cascadelakex,core
 GenuineIntel-6-DD,v1.00,clearwaterforest,core
 GenuineIntel-6-9[6C],v1.05,elkhartlake,core
 GenuineIntel-6-CF,v1.11,emeraldrapids,core
--=20
2.50.0.rc1.591.g9c95f17f64-goog

