Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686411DB346
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619280; cv=none; b=fQzNoZKprNKUjhjMenFrMLATnGAZDA2TY+spYK6fOhoTB/87vBNFh9x/aH6iKv+62Z/g+yCYH/Lej45zmhEtN/IjgiiX6ii2upUgMuNjTO5+RuFQyFov86jKclI2vTVPtvpMASSWcnluKn2LiMZuxi/pl4K1Nk03rNgiLb+qAGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619280; c=relaxed/simple;
	bh=DJndnfzFiBLMsi7xpDf1Phu8SmpCbGL4IAZ67mmPpGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpeIb3gYGsJ/FaBAn/6GrNWTT9fA1Ok4Vn+TaQ4vdWF7SbR4KnFgfGIcCHSssrI3Obg8lnQxSWUQFPt0vmt2YoZ8Jxgi54RvqxLyfKAPgNPncrD7awm42BVm1FO/2cXHz25XRvGCUhejVObEagza+BOsbhM4u99zZ+IIvZcsPmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QzfWmq/p; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QzfWmq/p"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2240aad70f2so329105ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 11:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743619276; x=1744224076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMqF0ymYt0ee7mHIx+0ayEuN+j7ZHpzGq6XJ7/HhyhM=;
        b=QzfWmq/pzcuOx+aW8Kl/Wvs+eY1NAKf8g2xlW5SfrkmB6CThtYIaelwYFlGkR3+Lm+
         VM/xJCsg7S3zBiwpa6B/dtLUuT0n9m+2v4ezSPWYliLp5d0ms5QCpWjhzQDuPQSyJG/s
         uACKH3vd78Ml0qheCjA+0CXJMFZXUe3Q/T2fK6rD+JEBvza4fdJljIfS9T8me/gU0Mdq
         QWKzDlK8GWpGwkqy6AG8WzvJYwC9bbusunFYDqNzXgy8VUUVCbcGAvE9pb5ku72Dnoaz
         4eXVMjmyWstQmYTiQJSSi3Kwwh2u1KJ+a5UW/NaKkg4aJrQI35Dx9lPuNQLYwObAHklM
         r25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743619276; x=1744224076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMqF0ymYt0ee7mHIx+0ayEuN+j7ZHpzGq6XJ7/HhyhM=;
        b=hdwgMuRHNhdgWyjsygcImgCUsLmaFFQB8HQpSVnT4li7zI5tdKNoPj1iyePoBGEqtE
         jegNFftxbKOVNn6VQqFRKS4Ug9HgsixySMzObfpApXBWtD43EMVL4D/FZFmpXy1o+B5s
         pltAJNdSihqfu4nLP9pIA0A9PuWyDR8QGqUCCoJLKtwnAFafkzzmmCtfQbNR8Y1xoimq
         EPGeSF0N/GKG0iW+C8hSd4vVc6fMXy9csemhwpY2cSWh+5IQSOgTAoMkU86JUb9Tl88E
         rhAHHTNmiqC8d474P5HXE4TlWs+n0riIhfvOontO+5ZFLzImHFqWDYBF7xV74OZrVEp/
         HKug==
X-Forwarded-Encrypted: i=1; AJvYcCXBgem48czXDSmMQNqT+vuuq/JuQm36Z4O44usirZL4MDkzPMqqSOl26/g6YZxBAj7wRx1tLsJOYJDT1k0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3eTWZFqF9a8OgMr7FHeQ1tTajfqW+pUTonDso6TKnjvUtSDyE
	GRDJVr6N6K61epOpdOM/f/cD/qErB+/NR61kNn53lvaG1/clYmM4o++s+5kxJrqQpP8NPUg/g1o
	/SEsZoHVXEXuJK+VFHrPHoHaSqWXn5wNl7ckGyuFDsNFxEF1TITW5meM=
X-Gm-Gg: ASbGncviIKOcpEUhz4eP1MvgdzCrSJKBoFMkWomAP+yU7ezHiRnaE1wcGkSakaElEwf
	5YU3vlxyLmA5q8HYR3a5gN8bXtHJ91XAgnM6UBjCe1g3r+lmyV362hkgWJAnRdV63QbOuryt0o/
	nfX8gnUJyzKhHaghHtDTsKbWZIoEN8JkKlCq4qci9NSZOTPS/y9tQp/A==
X-Google-Smtp-Source: AGHT+IFh/3bgYFguMH7eFhirkvhQPvKAOiXZ08RVGnzMWTKsxCEMSJGpRh3c7mpk/YYsri4IoerMfBBx7pk7pmZrEPk=
X-Received: by 2002:a17:902:ecc5:b0:215:65f3:27ef with SMTP id
 d9443c01a7336-22977502490mr377005ad.12.1743619276296; Wed, 02 Apr 2025
 11:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328175006.43110-1-irogers@google.com> <24f97eb6f76bfd2fcc968f93a8aeda390d54cc98.camel@intel.com>
In-Reply-To: <24f97eb6f76bfd2fcc968f93a8aeda390d54cc98.camel@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Apr 2025 11:41:04 -0700
X-Gm-Features: AQ5f1JoMlBs6mOfvVij5bd4m6rFdr7wF15K2U2MBE4e4yJPZobG2yAygAqeFUg8
Message-ID: <CAP-5=fWjjvXVRD5L9Gi0_kbwGh+MzVFD0a2NRT2P8bTNu+jicQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/35] GNR retirement latencies, topic and metric updates
To: "Falcon, Thomas" <thomas.falcon@intel.com>
Cc: "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, 
	"Biggers, Caleb" <caleb.biggers@intel.com>, "Hunter, Adrian" <adrian.hunter@intel.com>, 
	"Taylor, Perry" <perry.taylor@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, 
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>, "Wang, Weilin" <weilin.wang@intel.com>, 
	"acme@kernel.org" <acme@kernel.org>, "afaerber@suse.de" <afaerber@suse.de>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, 
	"namhyung@kernel.org" <namhyung@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 12:16=E2=80=AFPM Falcon, Thomas <thomas.falcon@inte=
l.com> wrote:
>
> On Fri, 2025-03-28 at 10:49 -0700, Ian Rogers wrote:
> > Add default mean, min and max retirement latency values to GNR
> > events. Update the topics on a number of events previously
> > "other". Switch TMA metrics to the generated version. Add TMA 5.02
> > metrics for sandybridge, ivytown, ivybridge and jaketown.
> >
> > Events and metrics generated from the data and scripts in:
> > https://github.com/intel/perfmon
> >
> > v5: Additional metrics constraints from:
> >     https://github.com/intel/perfmon/pull/299
> >     PDIST descriptions added from:
> >     https://github.com/intel/perfmon/pull/292
> >     Original retirement latency, .. updates in:
> >     https://github.com/intel/perfmon/pull/298
> >
>
> Metrics tests are passing on Granite Rapids, Arrow Lake and Alder Lake
>
> Tested-by: Thomas Falcon <thomas.falcon@intel.com>

Thanks Thomas, for Alderlake I ran into an issue fixed by:
https://lore.kernel.org/lkml/20250402183806.3947021-1-irogers@google.com/

Ian

> > v4: Generate grandridge metrics from the spreadsheet using conversion
> >     with the core type of crestmont.
> >
> > v3: Generate sierraforest metrics from the spreadsheet using
> >     conversion with the core type of crestmont.
> >
> > v2: Fix arrowlake PMU/cpu prefixes.
> >
> > Ian Rogers (35):
> >   perf vendor events: Update alderlake events/metrics
> >   perf vendor events: Update AlderlakeN events/metrics
> >   perf vendor events: Update arrowlake events/metrics
> >   perf vendor events: Update bonnell events
> >   perf vendor events: Update broadwell metrics
> >   perf vendor events: Update broadwellde metrics
> >   perf vendor events: Update broadwellx metrics
> >   perf vendor events: Update cascadelakex events/metrics
> >   perf vendor events: Update clearwaterforest events
> >   perf vendor events: Update elkhartlake events
> >   perf vendor events: Update emeraldrapids events/metrics
> >   perf vendor events: Update grandridge events/metrics
> >   perf vendor events: Add graniterapids retirement latencies
> >   perf vendor events: Update haswell metrics
> >   perf vendor events: Update haswellx metrics
> >   perf vendor events: Update icelake events/metrics
> >   perf vendor events: Update icelakex events/metrics
> >   perf vendor events: Update ivybridge metrics
> >   perf vendor events: Update ivytown metrics
> >   perf vendor events: Update jaketown metrics
> >   perf vendor events: Update lunarlake events/metrics
> >   perf vendor events: Update meteorlake events/metrics
> >   perf vendor events: Update nehalemep events
> >   perf vendor events: Update nehalemex events
> >   perf vendor events: Update rocketlake events/metrics
> >   perf vendor events: Update sandybridge metrics
> >   perf vendor events: Update sapphirerapids events/metrics
> >   perf vendor events: Update sierraforest events/metrics
> >   perf vendor events: Update skylake metrics
> >   perf vendor events: Update skylakex events/metrics
> >   perf vendor events: Update snowridgex events
> >   perf vendor events: Update tigerlake metrics
> >   perf vendor events: Update westmereep-dp events
> >   perf vendor events: Update westmereep-dp events
> >   perf vendor events: Update westmereep-dp events
> >
> >  .../arch/x86/alderlake/adl-metrics.json       | 489 +++++++--------
> >  .../pmu-events/arch/x86/alderlake/cache.json  | 284 ++++++---
> >  .../arch/x86/alderlake/floating-point.json    |  29 +-
> >  .../arch/x86/alderlake/frontend.json          |  78 +--
> >  .../pmu-events/arch/x86/alderlake/memory.json |  82 ++-
> >  .../pmu-events/arch/x86/alderlake/other.json  | 209 +------
> >  .../arch/x86/alderlake/pipeline.json          | 308 +++++++---
> >  .../arch/x86/alderlake/virtual-memory.json    |  43 +-
> >  .../arch/x86/alderlaken/adln-metrics.json     |  54 +-
> >  .../pmu-events/arch/x86/alderlaken/cache.json | 107 +++-
> >  .../arch/x86/alderlaken/floating-point.json   |   1 +
> >  .../arch/x86/alderlaken/memory.json           |  50 ++
> >  .../pmu-events/arch/x86/alderlaken/other.json | 102 +---
> >  .../arch/x86/alderlaken/pipeline.json         |  55 +-
> >  .../arch/x86/alderlaken/virtual-memory.json   |   3 +
> >  .../arch/x86/arrowlake/arl-metrics.json       | 566 +++++++++---------
> >  .../pmu-events/arch/x86/arrowlake/cache.json  | 200 ++++++-
> >  .../arch/x86/arrowlake/frontend.json          |  39 +-
> >  .../pmu-events/arch/x86/arrowlake/memory.json |  36 +-
> >  .../pmu-events/arch/x86/arrowlake/other.json  | 197 +-----
> >  .../arch/x86/arrowlake/pipeline.json          | 230 ++++++-
> >  .../pmu-events/arch/x86/bonnell/other.json    |   8 -
> >  .../pmu-events/arch/x86/bonnell/pipeline.json |   8 +
> >  .../arch/x86/broadwell/bdw-metrics.json       | 256 ++++----
> >  .../arch/x86/broadwellde/bdwde-metrics.json   | 180 +++---
> >  .../arch/x86/broadwellx/bdx-metrics.json      | 268 ++++-----
> >  .../arch/x86/cascadelakex/cache.json          | 404 +++++++++++++
> >  .../arch/x86/cascadelakex/clx-metrics.json    | 389 ++++++------
> >  .../arch/x86/cascadelakex/other.json          | 404 -------------
> >  .../arch/x86/clearwaterforest/cache.json      |  35 ++
> >  .../arch/x86/clearwaterforest/memory.json     |   2 +
> >  .../arch/x86/clearwaterforest/other.json      |  22 -
> >  .../arch/x86/clearwaterforest/pipeline.json   |   6 +-
> >  .../arch/x86/elkhartlake/cache.json           | 296 ++++++++-
> >  .../arch/x86/elkhartlake/floating-point.json  |   1 +
> >  .../arch/x86/elkhartlake/memory.json          | 261 ++++++++
> >  .../arch/x86/elkhartlake/other.json           | 404 +------------
> >  .../arch/x86/elkhartlake/pipeline.json        |  31 +-
> >  .../arch/x86/elkhartlake/virtual-memory.json  |   4 +
> >  .../arch/x86/emeraldrapids/cache.json         | 284 +++++++--
> >  .../arch/x86/emeraldrapids/emr-metrics.json   | 475 +++++++--------
> >  .../x86/emeraldrapids/floating-point.json     |  43 +-
> >  .../arch/x86/emeraldrapids/frontend.json      |  78 +--
> >  .../arch/x86/emeraldrapids/memory.json        | 231 ++++++-
> >  .../arch/x86/emeraldrapids/other.json         | 332 +---------
> >  .../arch/x86/emeraldrapids/pipeline.json      | 259 +++++---
> >  .../x86/emeraldrapids/virtual-memory.json     |  40 +-
> >  .../pmu-events/arch/x86/grandridge/cache.json | 155 ++++-
> >  .../arch/x86/grandridge/counter.json          |   2 +-
> >  .../arch/x86/grandridge/frontend.json         |   8 +
> >  .../arch/x86/grandridge/grr-metrics.json      | 204 ++++---
> >  .../arch/x86/grandridge/memory.json           |   2 +
> >  .../pmu-events/arch/x86/grandridge/other.json |  29 +-
> >  .../arch/x86/grandridge/pipeline.json         |  52 +-
> >  .../arch/x86/grandridge/uncore-cache.json     |  45 +-
> >  .../arch/x86/grandridge/uncore-memory.json    | 338 +++++++++++
> >  .../arch/x86/graniterapids/cache.json         | 305 +++++++---
> >  .../arch/x86/graniterapids/counter.json       |   5 +
> >  .../x86/graniterapids/floating-point.json     |  43 +-
> >  .../arch/x86/graniterapids/frontend.json      | 105 ++--
> >  .../arch/x86/graniterapids/gnr-metrics.json   | 487 +++++++--------
> >  .../arch/x86/graniterapids/memory.json        | 206 ++++++-
> >  .../arch/x86/graniterapids/other.json         | 243 +-------
> >  .../arch/x86/graniterapids/pipeline.json      | 261 +++++---
> >  .../arch/x86/graniterapids/uncore-cache.json  |  42 ++
> >  .../graniterapids/uncore-interconnect.json    |  90 ++-
> >  .../arch/x86/graniterapids/uncore-memory.json | 240 ++++++++
> >  .../x86/graniterapids/virtual-memory.json     |  40 +-
> >  .../arch/x86/haswell/hsw-metrics.json         | 206 ++++---
> >  .../arch/x86/haswellx/hsx-metrics.json        | 222 ++++---
> >  .../pmu-events/arch/x86/icelake/cache.json    |  60 ++
> >  .../arch/x86/icelake/icl-metrics.json         | 385 ++++++------
> >  .../pmu-events/arch/x86/icelake/memory.json   | 160 +++++
> >  .../pmu-events/arch/x86/icelake/other.json    | 220 -------
> >  .../pmu-events/arch/x86/icelakex/cache.json   | 273 +++++++++
> >  .../arch/x86/icelakex/icx-metrics.json        | 399 ++++++------
> >  .../pmu-events/arch/x86/icelakex/memory.json  | 190 ++++++
> >  .../pmu-events/arch/x86/icelakex/other.json   | 463 --------------
> >  .../arch/x86/ivybridge/ivb-metrics.json       |  76 ++-
> >  .../arch/x86/ivybridge/metricgroups.json      |   5 +
> >  .../arch/x86/ivytown/ivt-metrics.json         |  80 ++-
> >  .../arch/x86/ivytown/metricgroups.json        |   5 +
> >  .../arch/x86/jaketown/frontend.json           |   8 +
> >  .../arch/x86/jaketown/jkt-metrics.json        |  40 +-
> >  .../arch/x86/jaketown/metricgroups.json       |   5 +
> >  .../pmu-events/arch/x86/jaketown/other.json   |   8 -
> >  .../pmu-events/arch/x86/lunarlake/cache.json  | 182 +++++-
> >  .../arch/x86/lunarlake/frontend.json          |  39 +-
> >  .../arch/x86/lunarlake/lnl-metrics.json       | 560 ++++++++---------
> >  .../pmu-events/arch/x86/lunarlake/memory.json |  75 ++-
> >  .../pmu-events/arch/x86/lunarlake/other.json  | 358 +----------
> >  .../arch/x86/lunarlake/pipeline.json          | 253 +++++++-
> >  tools/perf/pmu-events/arch/x86/mapfile.csv    |  14 +-
> >  .../pmu-events/arch/x86/meteorlake/cache.json | 352 ++++++++---
> >  .../arch/x86/meteorlake/floating-point.json   |  28 +-
> >  .../arch/x86/meteorlake/frontend.json         |  82 +--
> >  .../arch/x86/meteorlake/memory.json           |  90 ++-
> >  .../arch/x86/meteorlake/mtl-metrics.json      | 553 ++++++++---------
> >  .../pmu-events/arch/x86/meteorlake/other.json | 149 +----
> >  .../arch/x86/meteorlake/pipeline.json         | 252 +++++---
> >  .../arch/x86/meteorlake/uncore-memory.json    |  18 +
> >  .../arch/x86/meteorlake/virtual-memory.json   |  40 +-
> >  .../pmu-events/arch/x86/nehalemep/cache.json  |  32 +
> >  .../pmu-events/arch/x86/nehalemep/other.json  |  40 --
> >  .../arch/x86/nehalemep/virtual-memory.json    |   8 +
> >  .../pmu-events/arch/x86/nehalemex/cache.json  |  32 +
> >  .../pmu-events/arch/x86/nehalemex/other.json  |  40 --
> >  .../arch/x86/nehalemex/virtual-memory.json    |   8 +
> >  .../pmu-events/arch/x86/rocketlake/cache.json |  60 ++
> >  .../arch/x86/rocketlake/memory.json           | 160 +++++
> >  .../pmu-events/arch/x86/rocketlake/other.json | 220 -------
> >  .../arch/x86/rocketlake/rkl-metrics.json      | 385 ++++++------
> >  .../arch/x86/sandybridge/frontend.json        |   8 +
> >  .../arch/x86/sandybridge/metricgroups.json    |   5 +
> >  .../arch/x86/sandybridge/other.json           |   8 -
> >  .../arch/x86/sandybridge/snb-metrics.json     |  36 +-
> >  .../arch/x86/sapphirerapids/cache.json        | 343 ++++++++---
> >  .../x86/sapphirerapids/floating-point.json    |  43 +-
> >  .../arch/x86/sapphirerapids/frontend.json     |  78 +--
> >  .../arch/x86/sapphirerapids/memory.json       | 231 ++++++-
> >  .../arch/x86/sapphirerapids/other.json        | 382 +-----------
> >  .../arch/x86/sapphirerapids/pipeline.json     | 259 +++++---
> >  .../arch/x86/sapphirerapids/spr-metrics.json  | 469 ++++++++-------
> >  .../x86/sapphirerapids/virtual-memory.json    |  40 +-
> >  .../arch/x86/sierraforest/cache.json          |  25 +
> >  .../arch/x86/sierraforest/memory.json         |  24 +
> >  .../arch/x86/sierraforest/other.json          |  49 +-
> >  .../arch/x86/sierraforest/pipeline.json       |   9 +
> >  .../arch/x86/sierraforest/srf-metrics.json    | 204 ++++---
> >  .../arch/x86/sierraforest/uncore-cache.json   |  32 +
> >  .../arch/x86/sierraforest/uncore-memory.json  | 240 ++++++++
> >  .../arch/x86/skylake/skl-metrics.json         | 367 ++++++------
> >  .../pmu-events/arch/x86/skylakex/cache.json   |  74 +++
> >  .../pmu-events/arch/x86/skylakex/other.json   |  74 ---
> >  .../arch/x86/skylakex/skx-metrics.json        | 385 ++++++------
> >  .../pmu-events/arch/x86/snowridgex/cache.json | 296 ++++++++-
> >  .../arch/x86/snowridgex/floating-point.json   |   1 +
> >  .../arch/x86/snowridgex/memory.json           | 261 ++++++++
> >  .../pmu-events/arch/x86/snowridgex/other.json | 404 +------------
> >  .../arch/x86/snowridgex/pipeline.json         |  31 +-
> >  .../arch/x86/snowridgex/virtual-memory.json   |   4 +
> >  .../arch/x86/tigerlake/tgl-metrics.json       | 383 ++++++------
> >  .../arch/x86/westmereep-dp/cache.json         |  32 +
> >  .../arch/x86/westmereep-dp/other.json         |  40 --
> >  .../x86/westmereep-dp/virtual-memory.json     |   8 +
> >  .../arch/x86/westmereep-sp/cache.json         |  32 +
> >  .../arch/x86/westmereep-sp/other.json         |  40 --
> >  .../x86/westmereep-sp/virtual-memory.json     |   8 +
> >  .../pmu-events/arch/x86/westmereex/cache.json |  32 +
> >  .../pmu-events/arch/x86/westmereex/other.json |  40 --
> >  .../arch/x86/westmereex/virtual-memory.json   |   8 +
> >  151 files changed, 12770 insertions(+), 9855 deletions(-)
> >  delete mode 100644 tools/perf/pmu-events/arch/x86/clearwaterforest/oth=
er.json
> >
>
