Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC0A1373
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 00:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751069715; cv=none; b=BvWEYCZdH7hG5ux0nvNcNPMkbdkeZy/iXUtpAvJ3yBP4BcOT7k4UP3Mykml5UuRcaG78otjFh3hLC8T2mx7qv1blxqKuA+FNZvEL/JL5NoO2jHmTss9THPoSlvMT3458lY9/hvrBuWHBwh2TmoXXW2Zl3SqPPnicb1J3RhFVzV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751069715; c=relaxed/simple;
	bh=1Er7cuUr5mnVo/Gtd87+GOXxmrgUvCckwTeC1IZRNA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=T0mCu7RkYm1xbf6wSKbBJat9pO+DO2o0igW6yhkCAqq5+wW3QGSLGspnBTaOSJzS7Pz9YS1Tpa1z5cujW6CO3RPXQvxKYQTIm05Xnxv7CwyBNnoKqv3s90ZMPiP1eQSjz/9MpfXlcWY3xZqAr2qz4pkI/LO6cL9hNyQBUCZ63IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PR26Freb; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PR26Freb"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3df2fa612c4so64375ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751069713; x=1751674513; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoOQsl5opEdiN6zwsEykKI9j3tEvS2dRZvXIgdSxmx0=;
        b=PR26FrebUx5B6V+ge0jejRrPtTCejN3LooE5dgpAtSqF0S9E1var49dYRTWXYISuc0
         rdtRa7CAuyQKRGIlIStKD3BGKHzlQ0swJBSorV1xG/9DmALA2zOu/5GcXbooJ0jfVKFJ
         8fXlWLRGagu2aqs8q49j8990UkzaHggdYPZJ6b7XKR45SLiioPi4MdlYTUvepV7NaICV
         fTfSfHo+Y8K+GLmx+nkjRHyywhvQXNOjIKXDBZU1mPbLpabwvxJBjcg1BCS5OOFHqd0S
         eMVKc9ZOHCkcub22XhZpkdXaE4zkAKj/EAiik/o/15zyvSwD5tehokjKbhUZYIlnPIe6
         wmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751069713; x=1751674513;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoOQsl5opEdiN6zwsEykKI9j3tEvS2dRZvXIgdSxmx0=;
        b=df75qWnKZUt4SvOn/JrHsudYmmCsCp5yQb1drQ5Lcfj7BL7ZD2W5j8ZOG+aYZL4J+7
         JzYzA2NkMFQ0rJ22iTxHG2/x/DQFyRtCwaO07h2NtOdYZfaQiJMJjOWVBVoFmibVGPlC
         kdRpMtqlznbkTdpWAH3MENwKl9V4P9OuD3HjfD0YANM36oa4oOUugF9XsV7cm314R7m5
         tDn7Etlug0gRwg2z5plLxu5MbG9KeU2dfi/0iJa3Tgj+LtCz7X2S0eFnvVrsQC0mXDfC
         z1savpiM4/Wtywd76MtvbpmVJcLF5p5lyDHWDU7zuVPzilOx4IOEfQWMg+ujPxg4fRqD
         ui5g==
X-Forwarded-Encrypted: i=1; AJvYcCUrLExW3krPqgx005CymcQBPHRL74uCgO2lcRyoWbmY+J5i7Fac1yYYYR3VlmvFhh4fudU/DAeSvbo2O6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2dsbxRhw7UBViXMLpsbDdUIyK7vBartAPbFNMcqSPONUqA9Vz
	hnDb2pG+nNK4ZrxaP4aKcp2JQ9UpJyBIldIUxV+5wIH+zJG5MK9rkSuyGHXkwIOzmGyume/xRoq
	xHKn1iweK9O5k/bY8kjHW1rozpl9XmrwGjBCsr/3Q
X-Gm-Gg: ASbGnctNpAwEzkmxZZ4PJwh4gph4O4qaZus//WncCkR3VHDICixAnitEiZAP1I0XUDj
	K9WovN9Bn0hw2cxQ4xFW7TWRSdC7uIQJ3LNxRlFvYZMJOmOgnGRV+O6RlDJWM8hKWR/ka7wed8l
	+zZAQqlo0kjz/tjWFLKIAEqva3Uavnm+SDPEW5CBWP6f4O
X-Google-Smtp-Source: AGHT+IEDZ42ZgQtsZCztOR56YzCSdOoZYIJObkm30G0nbZwTWOUkPCJaCvlFabCjBamsuV29DLo/6T9l4TUTeRSsA/o=
X-Received: by 2002:a05:6e02:1aa1:b0:3dc:7edc:5f42 with SMTP id
 e9e14a558f8ab-3df55711c08mr1475035ab.12.1751069712899; Fri, 27 Jun 2025
 17:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612000224.780337-1-irogers@google.com>
In-Reply-To: <20250612000224.780337-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 27 Jun 2025 17:15:01 -0700
X-Gm-Features: Ac12FXwjYznVK1OfJmWgcte1ezsCRI8fePEaqYwmo-Apm0zeE-monUoe1ZLkNnk
Message-ID: <CAP-5=fVGqnWuQNYM9XULyLuDvx-yAuyCMRh=uS0gybiEsYH9jw@mail.gmail.com>
Subject: Re: [PATCH v1 00/15] perf vendor events: Update Intel events
To: Thomas Falcon <thomas.falcon@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Caleb Biggers <caleb.biggers@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Edward Baker <edward.baker@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 5:02=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Update:
>  - ADL/ADLN v1.29 -> 1.31
>  - ARL 1.08 -> 1.09
>  - CLX 1.23 -> 1.25
>  - EMR 1.11 -> 1.14
>  - GRR 1.07 -> 1.09
>  - GNR 1.08 -> 1.10
>  - ICX 1.27 -> 1.28
>  - LNL 1.11 -> 1.14
>  - MTL 1.13 -> 1.14
>  - PTL new v1.00
>  - SPR 1.25 -> 1.28
>  - SRF 1.09 -> 1.11
>  - SKX 1.36 -> 1.37
>  - TGL 1.17 -> 1.18
>
> Updates from:
> https://github.com/intel/perfmon
> with:
> https://github.com/intel/perfmon/pull/312
> Running the script:
> https://github.com/intel/perfmon/blob/main/scripts/create_perf_json.py

Hi, these Intel event updates are still awaiting review.

Thanks,
Ian

> Ian Rogers (15):
>   perf vendor events: Update Alderlake events
>   perf vendor events: Update AlderlakeN events
>   perf vendor events: Update Arrowlake events
>   perf vendor events: Update CascadelakeX events
>   perf vendor events: Update EmeraldRapids events
>   perf vendor events: Update GrandRidge events
>   perf vendor events: Update GraniteRapids events
>   perf vendor events: Update IcelakeX events
>   perf vendor events: Update LunarLake events
>   perf vendor events: Update MeteorLake events
>   perf vendor events: Add PantherLake events
>   perf vendor events: Update SapphireRapids events
>   perf vendor events: Update SierraForest events
>   perf vendor events: Update SkylakeX events
>   perf vendor events: Update TigerLake events
>
>  .../pmu-events/arch/x86/alderlake/cache.json  |  56 ++-
>  .../arch/x86/alderlake/floating-point.json    |   1 -
>  .../pmu-events/arch/x86/alderlake/other.json  |   1 -
>  .../arch/x86/alderlake/pipeline.json          |  44 +--
>  .../arch/x86/alderlake/virtual-memory.json    |   3 -
>  .../pmu-events/arch/x86/alderlaken/cache.json |  52 +--
>  .../arch/x86/alderlaken/floating-point.json   |   1 -
>  .../pmu-events/arch/x86/alderlaken/other.json |   1 -
>  .../arch/x86/alderlaken/pipeline.json         |  42 +--
>  .../arch/x86/alderlaken/virtual-memory.json   |   3 -
>  .../pmu-events/arch/x86/arrowlake/cache.json  |  13 +-
>  .../arch/x86/arrowlake/frontend.json          | 135 ++++++++
>  .../arch/x86/cascadelakex/floating-point.json |   6 +-
>  .../arch/x86/cascadelakex/pipeline.json       |   2 +-
>  .../arch/x86/emeraldrapids/pipeline.json      |   2 +-
>  .../arch/x86/emeraldrapids/uncore-io.json     |  12 +
>  .../arch/x86/emeraldrapids/uncore-memory.json |  20 ++
>  .../arch/x86/grandridge/grr-metrics.json      |  30 +-
>  .../x86/grandridge/uncore-interconnect.json   |  10 +
>  .../arch/x86/grandridge/uncore-io.json        |  12 +
>  .../arch/x86/graniterapids/cache.json         |   9 +
>  .../arch/x86/graniterapids/counter.json       |  10 +-
>  .../arch/x86/graniterapids/gnr-metrics.json   |  36 ++
>  .../arch/x86/graniterapids/pipeline.json      |   2 +-
>  .../graniterapids/uncore-interconnect.json    |  19 -
>  .../arch/x86/graniterapids/uncore-io.json     |  27 +-
>  .../arch/x86/icelakex/pipeline.json           |   2 +-
>  .../arch/x86/icelakex/uncore-cache.json       |   2 -
>  .../pmu-events/arch/x86/lunarlake/cache.json  |  11 +
>  .../arch/x86/lunarlake/pipeline.json          |  18 +-
>  .../arch/x86/lunarlake/virtual-memory.json    |  18 -
>  tools/perf/pmu-events/arch/x86/mapfile.csv    |  29 +-
>  .../pmu-events/arch/x86/meteorlake/cache.json |   2 +-
>  .../arch/x86/meteorlake/frontend.json         |  72 ++++
>  .../arch/x86/meteorlake/pipeline.json         |   2 +-
>  .../arch/x86/pantherlake/cache.json           | 278 +++++++++++++++
>  .../arch/x86/pantherlake/counter.json         |  12 +
>  .../arch/x86/pantherlake/frontend.json        |  30 ++
>  .../arch/x86/pantherlake/memory.json          | 215 ++++++++++++
>  .../arch/x86/pantherlake/pipeline.json        | 325 ++++++++++++++++++
>  .../arch/x86/pantherlake/virtual-memory.json  |  62 ++++
>  .../arch/x86/sapphirerapids/pipeline.json     |   2 +-
>  .../arch/x86/sapphirerapids/uncore-io.json    |  12 +
>  .../x86/sapphirerapids/uncore-memory.json     |  20 ++
>  .../arch/x86/sierraforest/frontend.json       |  64 ++++
>  .../arch/x86/sierraforest/pipeline.json       |   8 +
>  .../arch/x86/sierraforest/srf-metrics.json    |  48 +++
>  .../arch/x86/sierraforest/uncore-cache.json   |   6 +-
>  .../x86/sierraforest/uncore-interconnect.json |  53 ++-
>  .../arch/x86/sierraforest/uncore-io.json      |  27 +-
>  .../arch/x86/skylakex/pipeline.json           |   2 +-
>  .../arch/x86/tigerlake/pipeline.json          |   2 +-
>  52 files changed, 1623 insertions(+), 248 deletions(-)
>  create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/cache.json
>  create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/counter.js=
on
>  create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/frontend.j=
son
>  create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/memory.jso=
n
>  create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/pipeline.j=
son
>  create mode 100644 tools/perf/pmu-events/arch/x86/pantherlake/virtual-me=
mory.json
>
> --
> 2.50.0.rc1.591.g9c95f17f64-goog
>
