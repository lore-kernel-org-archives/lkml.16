Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7E2299924
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301082; cv=none; b=BAki2WJ7LsrH96fQzq+z4yaQscEKI0FLbUqc+B7LDwb9tYRkGcsJExdb0F/TZBghTF2xneaMlSjf+HWGgWYImqPUpDoTBFWgeci+npW5BG3LcPpDoNsM3U1qdIUmcb25CReNjq8UftD5tFZh613RrWfP86vs9EPtTKuTb7brhos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301082; c=relaxed/simple;
	bh=sRS7Gtylb6zmmWkrE5k0r/XG56fFw//pjn/SOKSj0FY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=OO9eV0p7R9uB6AJ23mew652KpH/SxflFHxpxx+kLSkzbm46XV/at+YWrelhyZQN+xvxIPtarL00Aa2r8CClsdnc19Xf4W+Nv0d252LRiYGJbKDpMzclTrUA6fUF25xyWlLjA5AvjGHxxjctkg/E1w2VjbovwHk0rp2Xfml7j5Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Dup6ZHc; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Dup6ZHc"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b3183193374so1851714a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751301080; x=1751905880; darn=vger.kernel.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7uH+zUAqqmYkd4i1H0IIyCkQzYRAUthnTfATCWP3FI=;
        b=2Dup6ZHcNmOPHeq9439iINORg3majCQf8uW52h3dq0dLM4BPgP1CukvKGZjcFvoKr1
         6/OKymcOIbdhb0UVz7e83imEXORMef6RpkD95ERDj8lW7KZNKD8afsWy5zLJy7sMlnvx
         EPrSX/D9CEUHZaMK7nSl2I1I6NsihtEq9lzx+PDnquOCYjzcgYNI8DIDjrJN1kaVg5Z1
         IK532mULu9E7HCX8PF17g95xaxk/WJT3TOzO1mQs/pIl7b+GuBHsFzkkGmuX2YfoxGEW
         yi7jJPnosnptBYxiHg7uLosZTzmX8GCf+xfrJLeCY1oTbL1dgf1DSi7LFrJQBS/Fxe7n
         l/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751301080; x=1751905880;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v7uH+zUAqqmYkd4i1H0IIyCkQzYRAUthnTfATCWP3FI=;
        b=wpew/L/+5CT+fehCFczz6qr5c6gK9IU42zsadLUiCXzSbpZlqUnUsdCprSczCciVMR
         D8PlsW9JCstIMPVN514/RGbElOeIqLMX8kpvJvY9uRe7AcSRd6zRjkD6veI5xqQbW6u9
         tcDpp9Dx8lZgSR4udTijlcRuCOInxs+aI5ne7nBJKpqppaM+M/l72T0XtzonmYr24N++
         FT2DAokcoNhqZzaIu7TlwFb28fgWcWG9yj9oZvPxb73QFTU/OHyPc+w2wN7aG6/8rfni
         w0o6yo3U/OoYrhmj/Df7zRdi0OprxYlNeySqycs++h7Z7G66dSl7k/iV9W2TuYmqYEwg
         zsSw==
X-Forwarded-Encrypted: i=1; AJvYcCUwtP+F1lhAthc07TUkCpRZ4JpwNcrShiX/xuZXx9kRnWeejC2HSVjpIUvSnnTDBllRXaT8Zqpojs3Gofc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvuGeda0aqNv4Q1EHpWOD18IiUpS5X1SePZ7oskry1iZHIUSxA
	qZTJjl2M/FOHKiO9fLNa7T16NGhKiGnjEq8RSKE8W8nI6lLn9sx4bTh3H0X99jfVBugUnHYzV2L
	2mhPUGFMrDw==
X-Google-Smtp-Source: AGHT+IFWzwOouegVUYgVBzdfVlIDYn/kbQRbN9BfUtxnUtP00uSASKw4/kXNprLHMt117HdGPMWzk+pRYSkB
X-Received: from pfhp11.prod.google.com ([2002:a05:6a00:a0b:b0:746:2a27:3025])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:918e:b0:220:e5e:5909
 with SMTP id adf61e73a8af0-220a1696693mr19922880637.20.1751301080153; Mon, 30
 Jun 2025 09:31:20 -0700 (PDT)
Date: Mon, 30 Jun 2025 09:30:53 -0700
In-Reply-To: <20250630163101.1920170-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250630163101.1920170-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250630163101.1920170-9-irogers@google.com>
Subject: [PATCH v2 08/15] perf vendor events: Update IcelakeX events
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
2.50.0.727.gbf7dc18ff4-goog

