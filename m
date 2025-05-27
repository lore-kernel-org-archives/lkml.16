Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AFC202C30
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379049; cv=none; b=LKmZ2AT0sZqxpWSP0m0tQgRRaa4lu1cOSxhJFA9ylN7l83q/XwTOUuhfkAjLmkS09545sO44sUOsxtD+bLGHEKa6XiP6X0ooH3e1l9w/SvDqKAU3Wzq8QPqhlLgTVVzBb0+GuNXttsVfEFJ+TX/tj6NO8Q5d4BESy4Z7QLSwFuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379049; c=relaxed/simple;
	bh=trD6KtQO0saqCALL8fa0XS+Fe0+p0+rW4uwTKveEimk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ld7b5FhCzi7/jwftxK4zPccAz8ML6zgUgXo5jS2cxn00hTJ4VB+ke/m3D5uBOmw9SVDK3qGQmUmlrA0rzlUiYKjzyH3dfj6d1NigThw2p/4K1z/pLrQqxu+rhWEOHxxZ3nOhe350YzO6ZOEigj+LoRbhmxag0stth2VfUnU1Uh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JXKVHqUV; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JXKVHqUV"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so11585ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748379045; x=1748983845; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yg78/YNDfk4qRmPOviB0ojUMAFS7yO2rfR7kV/GP/g=;
        b=JXKVHqUVLB9MaCe4sFyfZ8qALZVfYwjE6M1ENmcMXIW2CLLosu+oVgyArNbToxEt6i
         qoST3+5yr7FytduANEajl24AT9qQIp3KCwa3dQ2Ov7617rfPmVsh1LPKlNzS5kP2z4ah
         AkbYsaompdceUUDCr3st4eUTxxI4JuMMYf/resVADJqf0nPz61BupvELMuE6ZfkDRbkU
         SnWn2bz7NLQe2fBT8+xVLU9W31r0ldacLxgSVy3G5Ix1FUIzBEj1/fBpx7NR1DpToihN
         Fdz0qe67EtyzEnKxwxEk3NND6x7x43UEGhLKEo4OBlB+Mc1q+8C0/wyMjrVTxBg4j0mg
         eRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379045; x=1748983845;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yg78/YNDfk4qRmPOviB0ojUMAFS7yO2rfR7kV/GP/g=;
        b=vqSGkPA4fBCxM14GYPWiLHGckqJ5Le6/KFUb+o/pP1b6ikWuUvth9sN/BUzX3KDu8C
         oM7RXl+9HVUmCzBaBZn/5mI8gcFhiMrJVGfLRG5HxbS119Gq/N1fNLSM690p6nRtn7rU
         jPrUpLc3xnvA5v/BaPRNUlcby25uRICi+U5P/PkByJvu0kCHldW7bGBBpPORAmEVeSe0
         oU1otLSE3q4KPSW/X4qdYXczCKZhttBPP96PZ5yaReBdVFytboWqu1aAayOVawJiZZHS
         1TiXuxExfGmNHDsXEdpu2j0svU7fqh/zSS0rqG/DGDMm6eUtSoukIMxOJ1i3Oe04fdlt
         ld3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIHH4qRehJg1VvWH1hTbhUWNC36CUja/AEw/PjpExTt3c1oaPzg5ErrxgVvBLBrAaCbJ2cSKTdfp7okl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAgLaijHju/4eWcIjI3jVL24RLc4mYHIKZSne7gG5a5BOnr61t
	ghpvXv4vRH6MdX1mjYbO0ZkOiT77eKVGIZx1KrisMbaF0cay/vi7Lmdvh4SeySb0mpo5eUDfPDU
	O+WK/PTqPLzcXGuEpSWw+M5hClL4LcJSav/sxBhB6
X-Gm-Gg: ASbGnctzefhanBoRbPpiy/K943ciZsyOPzUHjc22b3Sa4URnngTsf418WMvBT/P7dpz
	SkdRVoHjyW8wOixuWqVHlpK9cF6QupmDTckcvJLT9cFHYHJh4ppVsWCMF+e4OAqtw9EwA4hNfdW
	ilzQao/cSkHni2rajmEdOe0A7iUMeA4YHFMRkV9Z8fayUawOKPO76hAfzBTYL8RbM37LBPovBU
X-Google-Smtp-Source: AGHT+IE/1T4kZf05oCu4sfIETu9/i2DgQZVrCIQBbMPl3WP/1lslJa5mXkQgfThkOpftvtd6CrCAYg36F6e8ogwjHkI=
X-Received: by 2002:a05:6e02:170a:b0:3dc:7e01:6f6a with SMTP id
 e9e14a558f8ab-3dd88fbc93cmr887775ab.26.1748379045105; Tue, 27 May 2025
 13:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416045117.876775-1-irogers@google.com>
In-Reply-To: <20250416045117.876775-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 May 2025 13:50:32 -0700
X-Gm-Features: AX0GCFtk6Ncs2e_GqsHxj_DiWhthI06H5P6Wv7pGvMZ2M9nALUnx3gSubJEv234
Message-ID: <CAP-5=fU3VW1MjHMiaPG+JirLCCunMC6bEWpsJ3h0E7bTDkh9cA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Prefer sysfs/JSON events also when no PMU is provided
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Ze Gao <zegao2021@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>, Leo Yan <leo.yan@arm.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 9:51=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> At the RISC-V summit the topic of avoiding event data being in the
> RISC-V PMU kernel driver came up. There is a preference for sysfs/JSON
> events being the priority when no PMU is provided so that legacy
> events maybe supported via json. Originally Mark Rutland also
> expressed at LPC 2023 that doing this would resolve bugs on ARM Apple
> M? processors, but James Clark more recently tested this and believes
> the driver issues there may not have existed or have been resolved. In
> any case, it is inconsistent that with a PMU event names avoid legacy
> encodings, but when wildcarding PMUs (ie without a PMU with the event
> name) the legacy encodings have priority.
>
> The situation is further inconsistent as legacy events are case
> sensitive, so on Intel that provides a sysfs instructions event, the
> instructions event without a PMU and lowercase is legacy while with
> uppercase letters it matches with sysfs which is case insensitive. Are
> there legacy events with upper case letters? Yes there are, the cache
> ones mix case freely:
>
> L1-dcache|l1-d|l1d|L1-data|L1-icache|l1-i|l1i|L1-instruction|LLC|L2|dTLB|=
d-tlb|Data-TLB|iTLB|i-tlb|Instruction-TLB|branch|branches|bpu|btb|bpc|node
>
> meaning LLC that means L2 (which is wrong) both match as part of a
> legacy cache name but llc and l2 would only match sysfs/json
> events. The whole thing just points at the ridiculous nature of legacy
> events and why we'd want them to be preffered I don't know. Why should
> case of a letter or having a PMU prefix impact the encoding in the
> perf_event_attr?
>
> The patch doing this work was reverted in a v6.10 release candidate
> as, even though the patch was posted for weeks and had been on
> linux-next for weeks without issue, Linus was in the habit of using
> explicit legacy events with unsupported precision options on his
> Neoverse-N1. This machine has SLC PMU events for bus and CPU cycles
> where ARM decided to call the events bus_cycles and cycles, the latter
> being also a legacy event name. ARM haven't renamed the cycles event
> to a more consistent cpu_cycles and avoided the problem. With these
> changes the problematic event will now be skipped, a large warning
> produced, and perf record will continue for the other PMU events. This
> solution was proposed by Arnaldo.
>
> v8: Change removing of failed to open events that are tracking so that
>     the tracking moves to the next event. Make software events able to
>     specified with a PMU. Change the perf_api_probe to not load all
>     PMUs through scanning, specify a PMU when parsing events.
>
> v7: Expand cover letter, fix a missed core_ok check in the v6
>     rebase. Note, as with v6 there is an alternate series that
>     prioritizes legacy events but that is silly and I'd prefer we
>     didn't do it.
>
> v6: Rebase of v5 (dropping already merged patches):
>     https://lore.kernel.org/lkml/20250109222109.567031-1-irogers@google.c=
om/
>     that unusually had an RFC posted for it:
>     https://lore.kernel.org/lkml/Z7Z5kv75BMML2A1q@google.com/
>     Note, this patch conflicts/contradicts:
>     https://lore.kernel.org/lkml/20250312211623.2495798-1-irogers@google.=
com/
>     that I posted so that we could either consistently prioritize
>     sysfs/json (these patches) or legacy events (the other
>     patches). That lack of event printing and encoding inconsistency
>     is most prominent in the encoding of events like "instructions"
>     which on hybrid are reported as "cpu_core/instructions/" but
>     "instructions" before these patches gets a legacy encoding while
>     "cpu_core/instructions/" gets a sysfs/json encoding. These patches
>     make "instructions" always get a sysfs/json encoding while the
>     alternate patches make it always get a legacy encoding.
>
> v5: Follow Namhyung's suggestion and ignore the case where command
>     line dummy events fail to open alongside other events that all
>     fail to open. Note, the Tested-by tags are left on the series as
>     v4 and v5 were changing an error case that doesn't occur in
>     testing but was manually tested by myself.
>
> v4: Rework the no events opening change from v3 to make it handle
>     multiple dummy events. Sadly an evlist isn't empty if it just
>     contains dummy events as the dummy event may be used with "perf
>     record -e dummy .." as a way to determine whether permission
>     issues exist. Other software events like cpu-clock would suffice
>     for this, but the using dummy genie has left the bottle.
>
>     Another problem is that we appear to have an excessive number of
>     dummy events added, for example, we can likely avoid a dummy event
>     and add sideband data to the original event. For auxtrace more
>     dummy events may be opened too. Anyway, this has led to the
>     approach taken in patch 3 where the number of dummy parsed events
>     is computed. If the number of removed/failing-to-open non-dummy
>     events matches the number of non-dummy events then we want to
>     fail, but only if there are no parsed dummy events or if there was
>     one then it must have opened. The math here is hard to read, but
>     passes my manual testing.
>
> v3: Make no events opening for perf record a failure as suggested by
>     James Clark and Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>. Also,
>     rebase.
>
> v2: Rebase and add tested-by tags from James Clark, Leo Yan and Atish
>     Patra who have tested on RISC-V and ARM CPUs, including the
>     problem case from before.

Ping. Thanks,
Ian

> Ian Rogers (4):
>   perf record: Skip don't fail for events that don't open
>   perf parse-events: Reapply "Prefer sysfs/JSON hardware events over
>     legacy"
>   perf parse-events: Allow software events to be terms
>   perf perf_api_probe: Avoid scanning all PMUs, try software PMU first
>
>  tools/perf/builtin-record.c      | 63 +++++++++++++++++++---
>  tools/perf/util/parse-events.c   | 47 +++++++++++++----
>  tools/perf/util/parse-events.h   |  3 +-
>  tools/perf/util/parse-events.l   | 90 ++++++++++++++++++--------------
>  tools/perf/util/parse-events.y   | 85 ++++++++++++++++++++++--------
>  tools/perf/util/perf_api_probe.c | 27 +++++++---
>  tools/perf/util/pmu.c            |  9 ++--
>  7 files changed, 235 insertions(+), 89 deletions(-)
>
> --
> 2.49.0.777.g153de2bbd5-goog
>
