Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3E428C5D9
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301067; cv=none; b=dJpoZhe6itI6hvUecmLNrHbQ5nza8BTo9zlO0j9hmBVTqe7qba5zEYexezbqMvFzXal58f2JNJ1y9qzzw8D5OuH9yaMRv2qLe6mLpLbs4+lx+SXFdKiq8LpVDwsGD2JOf79Y8xTSeWtLiJ8ZZZSC5PkZ1u8EeYYTxDGpXomwLqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301067; c=relaxed/simple;
	bh=Hq1Dv1HriCptfHOHAaNT6VtDRHYYXLwcgxWifCR+7A8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=oXVGSPVGJnpjqzG0IFO6xAFibQ2JwukSs7a2pLrUc8trVe1SgQNGtJ8npPKhrpcEUO+TyMC4B+9wwsm/3/6zVk1htboCRxNHlzk7rj43Uf2QLaXdr88N/r5txhDUdS9VsPOrSamV/6Q/+cqYIdXGQSp9na4BaYMLRztZOZSXgFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aI2ztRa6; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aI2ztRa6"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748b4d5c045so2053822b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751301065; x=1751905865; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=17awNFfnXITyyfjVcSQBaJULwqYYxdzG2WXdRxCdX24=;
        b=aI2ztRa6kxzNzFuawaks6B3yJlGrTo4Kds6TFrBQjYgyJKahBrwKal21QgjhfmxJ2Z
         7sy2fanDf6pJTLCIuMZKL7cqWDOdRHLcxudA750A4vjRfQmt2qqERwfjkCQjp/GU5cdV
         AgQkybAoURSKxFS1OqouiSrIGdLWq+acBn1O7DZ5hYO4dWp3b/BvmFy3XULuoB7YegkV
         TXzDwsC9C3v0hLBrx+HOGdUo1gZ29h04dHaq3kJbi7T/FNfIRJKBuYBrxMJwnWtLft48
         aoNvfJracnhNRqHXirZ/DZWxyoyhm3bxlanbNgxJSZm5++y+LosA3mKe7mmJwew+44k2
         q4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751301065; x=1751905865;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17awNFfnXITyyfjVcSQBaJULwqYYxdzG2WXdRxCdX24=;
        b=OBMC/kgIcLXSqG1EY1sWa0fxr1xeit8L9VcPGZY8ZL3FHdH2OzPgdSCa2Wj9qpxTHq
         ADk5+YinhzU8ltxAt60ADp+wGPWwRRz6g9PwishL7D0VdHYvZMjxl7rLJRh9x/qB9sXp
         8ZQUxmLFTbGXKkzB/5R5U9yBz1rjVaYjx6g0x0t2EwETO1qSuftitK8wG4/mYvMkbpiF
         xM/q8rtDrXFk91XHUnSkKEWRluyUmFymEcHlq+qbGSvqjrCpnEKf++EhiDUE7Vss52gl
         FBImipIK1e7AQeX3sxavu7WumKlsiJm/DO60BAh4qeDNBCuyq2QUMAmnNF9k+pMEoPSW
         EKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxF8cew4ZBXo5QAXT/poeeb/wd371JEIjSRoiVVyjWuWafE5AA9mFm60WixQ3V9g+iT6SFdikXXFOUX5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPwlLtAQMxW+i3dzi1Hr/Hhp2dqvPo8ot9bJmwn80YcpS3Edeb
	2ti/5R8DuoN+riYh9iKFJkGgJjMCCsPWXu4Wtiwpr8pjEZCx+jcMyWunrEw/XEmyTUFPiHyZbqq
	K0kwgbC5Mvw==
X-Google-Smtp-Source: AGHT+IHjzWnxD2XD3L1Jf342C7O1SzUgh0rDb6JTrBpiRFpWlpQLSDGIIpqqDYnrMqq6egnjPFnAhADSn+UL
X-Received: from pfbgi3.prod.google.com ([2002:a05:6a00:63c3:b0:746:2897:67e3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9283:b0:736:3979:369e
 with SMTP id d2e1a72fcca58-74af6ee09d2mr18468951b3a.9.1751301065373; Mon, 30
 Jun 2025 09:31:05 -0700 (PDT)
Date: Mon, 30 Jun 2025 09:30:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250630163101.1920170-1-irogers@google.com>
Subject: [PATCH v2 00/15] perf vendor events: Update Intel events
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

Update:
 - ADL/ADLN v1.29 -> 1.31
 - ARL 1.08 -> 1.09
 - CLX 1.23 -> 1.25
 - EMR 1.11 -> 1.14
 - GRR 1.07 -> 1.09
 - GNR 1.08 -> 1.10
 - ICX 1.27 -> 1.28
 - LNL 1.11 -> 1.14
 - MTL 1.13 -> 1.14
 - PTL new v1.00
 - SPR 1.25 -> 1.28
 - SRF 1.09 -> 1.11
 - SKX 1.36 -> 1.37
 - TGL 1.17 -> 1.18

Updates from:
https://github.com/intel/perfmon
with:
https://github.com/intel/perfmon/pull/312
Running the script:
https://github.com/intel/perfmon/blob/main/scripts/create_perf_json.py

v2: Rebase, no conflicts.

Ian Rogers (15):
  perf vendor events: Update Alderlake events
  perf vendor events: Update AlderlakeN events
  perf vendor events: Update Arrowlake events
  perf vendor events: Update CascadelakeX events
  perf vendor events: Update EmeraldRapids events
  perf vendor events: Update GrandRidge events
  perf vendor events: Update GraniteRapids events
  perf vendor events: Update IcelakeX events
  perf vendor events: Update LunarLake events
  perf vendor events: Update MeteorLake events
  perf vendor events: Add PantherLake events
  perf vendor events: Update SapphireRapids events
  perf vendor events: Update SierraForest events
  perf vendor events: Update SkylakeX events
  perf vendor events: Update TigerLake events

 .../pmu-events/arch/x86/alderlake/cache.json  |  56 ++-
 .../arch/x86/alderlake/floating-point.json    |   1 -
 .../pmu-events/arch/x86/alderlake/other.json  |   1 -
 .../arch/x86/alderlake/pipeline.json          |  44 +--
 .../arch/x86/alderlake/virtual-memory.json    |   3 -
 .../pmu-events/arch/x86/alderlaken/cache.json |  52 +--
 .../arch/x86/alderlaken/floating-point.json   |   1 -
 .../pmu-events/arch/x86/alderlaken/other.json |   1 -
 .../arch/x86/alderlaken/pipeline.json         |  42 +--
 .../arch/x86/alderlaken/virtual-memory.json   |   3 -
 .../pmu-events/arch/x86/arrowlake/cache.json  |  13 +-
 .../arch/x86/arrowlake/frontend.json          | 135 ++++++++
 .../arch/x86/cascadelakex/floating-point.json |   6 +-
 .../arch/x86/cascadelakex/pipeline.json       |   2 +-
 .../arch/x86/emeraldrapids/pipeline.json      |   2 +-
 .../arch/x86/emeraldrapids/uncore-io.json     |  12 +
 .../arch/x86/emeraldrapids/uncore-memory.json |  20 ++
 .../arch/x86/grandridge/grr-metrics.json      |  30 +-
 .../x86/grandridge/uncore-interconnect.json   |  10 +
 .../arch/x86/grandridge/uncore-io.json        |  12 +
 .../arch/x86/graniterapids/cache.json         |   9 +
 .../arch/x86/graniterapids/counter.json       |  10 +-
 .../arch/x86/graniterapids/gnr-metrics.json   |  36 ++
 .../arch/x86/graniterapids/pipeline.json      |   2 +-
 .../graniterapids/uncore-interconnect.json    |  19 -
 .../arch/x86/graniterapids/uncore-io.json     |  27 +-
 .../arch/x86/icelakex/pipeline.json           |   2 +-
 .../arch/x86/icelakex/uncore-cache.json       |   2 -
 .../pmu-events/arch/x86/lunarlake/cache.json  |  11 +
 .../arch/x86/lunarlake/pipeline.json          |  18 +-
 .../arch/x86/lunarlake/virtual-memory.json    |  18 -
 tools/perf/pmu-events/arch/x86/mapfile.csv    |  29 +-
 .../pmu-events/arch/x86/meteorlake/cache.json |   2 +-
 .../arch/x86/meteorlake/frontend.json         |  72 ++++
 .../arch/x86/meteorlake/pipeline.json         |   2 +-
 .../arch/x86/pantherlake/cache.json           | 278 +++++++++++++++
 .../arch/x86/pantherlake/counter.json         |  12 +
 .../arch/x86/pantherlake/frontend.json        |  30 ++
 .../arch/x86/pantherlake/memory.json          | 215 ++++++++++++
 .../arch/x86/pantherlake/pipeline.json        | 325 ++++++++++++++++++
 .../arch/x86/pantherlake/virtual-memory.json  |  62 ++++
 .../arch/x86/sapphirerapids/pipeline.json     |   2 +-
 .../arch/x86/sapphirerapids/uncore-io.json    |  12 +
 .../x86/sapphirerapids/uncore-memory.json     |  20 ++
 .../arch/x86/sierraforest/frontend.json       |  64 ++++
 .../arch/x86/sierraforest/pipeline.json       |   8 +
 .../arch/x86/sierraforest/srf-metrics.json    |  48 +++
 .../arch/x86/sierraforest/uncore-cache.json   |   6 +-
 .../x86/sierraforest/uncore-interconnect.json |  53 ++-
 .../arch/x86/sierraforest/uncore-io.json      |  27 +-
 .../arch/x86/skylakex/pipeline.json           |   2 +-
 .../arch/x86/tigerlake/pipeline.json          |   2 +-
 52 files changed, 1623 insertions(+), 248 deletions(-)
 create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/cache.json
 create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/counter.json
 create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/frontend.json
 create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/memory.json
 create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/pipeline.json
 create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/virtual-memory.json

-- 
2.50.0.727.gbf7dc18ff4-goog

