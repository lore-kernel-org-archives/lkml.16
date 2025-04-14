Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565571624E9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744653996; cv=none; b=ghEnIjKwZQpGH0zB5NjJffr8jxTue5TFTwld7J9K/6G4MKyh1fl12FmP4pYWbWqz0Lr3Lhi4I+hPl8EenU/5UO8ZmEAYMDj5y8zMCBQiyu/sCYbVGJyaxID+svNRPluancKvRRgkPEwe9qhTM2SBXEMfIJTzCwGpalAB6pNteaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744653996; c=relaxed/simple;
	bh=8zVjCb/UGSAo5C0gMDiDXFtMd5BfohtkpmcQXIVXRwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=FYeozC6wbXU/gR4Z/IWkXVTFMgBtCrqN8/aqvC00OXY2mQ1Wda/FgpVS0Okltr13bHvB6Vs0CiX/3ExPqmiEtdRUbtTTd58qKXPCEUBJBld5N6xJhG+e7KQgs3Guq9H0+N0pjaIFiIpEsjoxBhG3Xpoh3PgzEhgiDXOom2L1H20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YWS9P44Y; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YWS9P44Y"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2240aad70f2so32215ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744653994; x=1745258794; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGegzkuau5VKiIZ0PPFyJacmq1CJAJegzyRx9CTAuno=;
        b=YWS9P44YPyJpXRkWoVIBG6Fw+ISU46Rq7+C/SZYywyD53ti/mrMaaEMPpp2u8zTnnU
         iaM/S/4E52MvA2ZT1rTwbKCbUpOgwszZWLmYYgblP9rS4T0RRkT+BdutYTh43rkcwQY5
         ePqaSOSJ3aJ58KQzvob7XSZO8sOYVyj8xlSXPV4BeTHbCX00ju8MijWcRjLG31MYdSE+
         1weKOvKrFhhOe0LE6mZ78zcV79QzjVZCJY7IEleNkWdkVPjPSyX6LVKkG78NIOeSl/+n
         +iMyJjmwD3tfAWRnM9yTyEzBiJwJd83oIV2qilK2wpdD5LBSfdgV6c4CYfL9EDR+oE2W
         kPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744653994; x=1745258794;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGegzkuau5VKiIZ0PPFyJacmq1CJAJegzyRx9CTAuno=;
        b=PzN5i2RXhjyyWjIormOWSQReRyIKLF6I8vi/yhGtoR1/A+QJYSPz5iexPiKBRRfMAf
         HMhcvOZTgnoaf8OIyySFg9pgxweDYSuI0MoR3xF1IuarYJCUFMKiTpA8pbHYXZP4xxeR
         baG6AAns3yvkvz31AYRUUPwR+cxJ0k9uJ4tBa4sumfy9vxEMQmy+sw5QwNb1pmJng+0+
         KUGw51GcfeYSDy9QpUIWp7g5L9+Ezvzj3VA+lORzfKbAZlxnpjZVtlfttjyDIRyHDPnV
         CCyqVk6D3sbUrFfhZ01x2R+TE2TmkgXIGLcunVWH4DzM6fg3HFDooCqq2XpRhkb+D8Qf
         Y40Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCZ/gJn8jXGkJhKcIaH2k/DqFNyhapmOq21A4Q3MnOX0DrQvIppyL64LPvZ8OcX7HMTiPam27vbtoFRFM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/c5JzelYRAlqfy09Slh86UeX19iCl/y3JNRPFlZh8kKpdBULB
	6b3fphWuDIlZAUT45TCXid4YgCW3oGmwG/b8p5QX5Egf36vYZ4ohRfYU8VLMdGcNc6mMzdzrDOa
	JhNso6Pf9Zut/joAGt6+4KYCkIB6ZDksRpVd7
X-Gm-Gg: ASbGncv0beiP6fHrmCPNgLFrQn7zHliroliOHZbbcev6kBHXXZqH6HK9ZV0e1Iw1Nyx
	FWvQ5fddOCeDVgaU2+kfoyIam6DR/XpGQ89xS/8fgImoETfHWmbSmzyWkWQb0hu8W/FAmz/x14P
	k3uZQdGUjG0P5HHGINO/+wlzY3R8UGQSUfWtIjnHHRSN3HMFHKtV17oMX148NcTg==
X-Google-Smtp-Source: AGHT+IGXdZFMHVBVUP+rOdugwNu+FycZt8Phm/uy0RTroNIx8GhjnHAirXxwDjibnSA1ymNKAghrxOOL6WQaMwgbSns=
X-Received: by 2002:a17:902:ccc1:b0:223:5182:6246 with SMTP id
 d9443c01a7336-22c25397599mr86525ad.23.1744653994059; Mon, 14 Apr 2025
 11:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402224722.88740-1-irogers@google.com>
In-Reply-To: <20250402224722.88740-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 14 Apr 2025 11:06:22 -0700
X-Gm-Features: ATxdqUFNY3Auh7Yc2VQjpoG_AhjRkkeCnC4qBSEAHDspR2GRKvKGUDNZ4aNBqIw
Message-ID: <CAP-5=fXDy-A7EFFpaznk-uQaQdSdRyTM-XU9Y0sFWP=nCg1Efw@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Prefer sysfs/JSON events also when no PMU is provided
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

On Wed, Apr 2, 2025 at 3:47=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
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
>
> Ian Rogers (2):
>   perf record: Skip don't fail for events that don't open
>   perf parse-events: Reapply "Prefer sysfs/JSON hardware events over
>     legacy"

Ping.

Thanks,
Ian

>  tools/perf/builtin-record.c    | 47 ++++++++++++++++++---
>  tools/perf/util/parse-events.c | 27 +++++++++---
>  tools/perf/util/parse-events.l | 76 +++++++++++++++++-----------------
>  tools/perf/util/parse-events.y | 60 ++++++++++++++++++---------
>  4 files changed, 140 insertions(+), 70 deletions(-)
>
> --
> 2.49.0.504.g3bcea36a83-goog
>
