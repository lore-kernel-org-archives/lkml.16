Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CBF2D3212
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301094; cv=none; b=adJ93AAdpHONy9UoVaAnYzvHfK6rztxSF1dyANzrq8b9W6nKBjcxM2hkCPqiiogV5uPK/zQTx6tc0mZveUPyvAkeCeMpLTTRmP5TMkEb+Wxn66IEguwsSjh2aQ4VWCcNF28SGvbmixjAg73p/ezeGuIYs54Go+4liQXUqmaFf0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301094; c=relaxed/simple;
	bh=UB3LC+DAsMPcMj2tI3JyN+CwaCI4DfXgOfh3KKQ9Vis=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=HjLAOd5JKxdgOXJN/Pbj9/lkY27ZWDAeurdi5o1xMReuL/jf7PypdVHYwbQDJNJJKnTOulcurtPaUV/DUXPGlcHVRnpylpvOM8okMbADPdRw/oupFGm1y+9ozVotghhspt8YjuynrKEzWUOzoYG1vzeUTSJl4YjfRapULPV299c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DwnQ/NWb; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DwnQ/NWb"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2356ce66d7cso30457025ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751301091; x=1751905891; darn=vger.kernel.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VNpGqNb2MHhnrI7sffrX6seyL0+K2TdL07Y5kBKeGQ=;
        b=DwnQ/NWbzWh1FJ1omtPNr6W4Bpi+H/+I/5ISwNLWzpCJ5WpWr7TwIK6H33wTlXypx/
         gUCClurXIwOlaeLe0xlnBn3UIWGcNJQUJLaCMzZGryXhsKyJFW1LCnB31Ni0vV+SJhCO
         HxYBRlKQqRbgZEMq+feWVnA+bb7zpPWGrmpQgL6kIuF+FCGcklxu0uT5j8wTCF3rD+Xz
         h+O0MWYd60fmBthpMkN6opNe332AAHV5DSkWAB+QqRfouKeXTzTPz0cOIhLQ0b2QZxS1
         DUum/bTW/6Dw3nbOfpw6wJuEYxq+BHGuGNBnrqaPHlUUcy5c3XJhzy5UDL1TtyjaFwpQ
         Ou8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751301091; x=1751905891;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9VNpGqNb2MHhnrI7sffrX6seyL0+K2TdL07Y5kBKeGQ=;
        b=PP3KirE0HNgRT6wkgn0TkoYqcHi5WNtjfLR87IGjaDr7m4YBUCQRV9Ll40rvWjeUxL
         4WPwIV78M2K2Y72Fbpo1FmraGGDBAfTbaC+i3s/QQ2Lkry5MxyUi2yRv5DVKw6VnVJEG
         i/tndpAQZGzNO68GHxIxiKuWTH8f2yJH/lVx7gQeRQXHY4nlm0QL5IIqeMxJWYuQ49Rm
         crzIeDI8BEEG4c7SgDETmustDktaT7DJFfa+kYkIbmNk6fPqBxws033DN7EELTVePKFS
         iRzeI8YespB0lkHqaUsr4SWkTRphGSG76GYcWM9r6SFjg63/ukZ/RkKSYOOo2/VXhAR5
         b1/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvhDu/CfU+z4Y2QOyDzcikZu0UDs7V90u2phE4M8Y5g0Q0dwXGoxqYNr314kttDY3I3A+gY+3N76bP8oM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLWNgRsjg1O4/eFZY8Hw/jImc9vVsgjtgTGvVdfmGso/J3VD+o
	9GKRGyvblp/YrzhdkD3rrlaIdS39/yktVYz1JzTWH7HXYS06OG9FBvTSxLZvMotJ038Y8vLMwWU
	Zfsu/zpjp7Q==
X-Google-Smtp-Source: AGHT+IFBDK6gJXuL74p8rOzSw7isbI3y77om1IjixdaHY38msI+2J2/4El5suMFOdxy2nN+pHGs+DlWYu8Lf
X-Received: from plil12.prod.google.com ([2002:a17:903:17cc:b0:231:def0:d268])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b2c:b0:235:15f5:cc30
 with SMTP id d9443c01a7336-23ac40debc6mr203270255ad.16.1751301091022; Mon, 30
 Jun 2025 09:31:31 -0700 (PDT)
Date: Mon, 30 Jun 2025 09:30:59 -0700
In-Reply-To: <20250630163101.1920170-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250630163101.1920170-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250630163101.1920170-15-irogers@google.com>
Subject: [PATCH v2 14/15] perf vendor events: Update SkylakeX events
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

Update events from v1.36 to v1.37.

Bring in the event updates v1.37:
https://github.com/intel/perfmon/commit/6ee8e4cadda8b6954bd84236e20fab95e34=
5578f

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/arch/x86/mapfile.csv            | 2 +-
 tools/perf/pmu-events/arch/x86/skylakex/pipeline.json | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-ev=
ents/arch/x86/mapfile.csv
index 54c2cfb0af9c..2d9699efff58 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -33,7 +33,7 @@ GenuineIntel-6-8F,v1.28,sapphirerapids,core
 GenuineIntel-6-AF,v1.11,sierraforest,core
 GenuineIntel-6-(37|4A|4C|4D|5A),v15,silvermont,core
 GenuineIntel-6-(4E|5E|8E|9E|A5|A6),v59,skylake,core
-GenuineIntel-6-55-[01234],v1.36,skylakex,core
+GenuineIntel-6-55-[01234],v1.37,skylakex,core
 GenuineIntel-6-86,v1.23,snowridgex,core
 GenuineIntel-6-8[CD],v1.17,tigerlake,core
 GenuineIntel-6-2C,v5,westmereep-dp,core
diff --git a/tools/perf/pmu-events/arch/x86/skylakex/pipeline.json b/tools/=
perf/pmu-events/arch/x86/skylakex/pipeline.json
index 3dd296ab4d78..9a1349527b66 100644
--- a/tools/perf/pmu-events/arch/x86/skylakex/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/skylakex/pipeline.json
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
--=20
2.50.0.727.gbf7dc18ff4-goog

