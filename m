Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC611F4C80
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 22:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743634062; cv=none; b=FGMDg/UbjBT1gMKZHdBmouaC8VghUeFn07T4sXIkzVdr0DDPdl8fpfwBnQekah5CP1TuKfv2UQBjgMq5Y4tTNl9JEkXPzGuf+c9JNIvlX8zB7H+yDpxuBNXXeNjl0hK6AObebyX9jGQNrpM52ksKgQmkdIp0c2QWrfe3NMepUFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743634062; c=relaxed/simple;
	bh=Ru4BtfRe0+B+AhvIy0A0rpVg8flFQ1mMl/i+zMrdb/Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=KtmfFQi2AWOG1DDTbJUl5szzax0zEf9Mq6HqahfTG28BwyoDY/vIJoga40F8uEoYFrpnA79DM4c835UGqeZAMfATEQ8A7LHgJgjRa1APND2L6TzrC0NObC4xH6lAdP546MYn5Ve1jtFSh6NpBiQT73QlsT+tn1Z9DAvk4I7ooBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WT2SO4lc; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WT2SO4lc"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22412127fd7so2135495ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 15:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743634059; x=1744238859; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p0XfgBiQEup7soca2GQu1jS4gphlsvFj7U02mWvvqnM=;
        b=WT2SO4lcHB6k+VZwe6iVDjeOWSodvqU11puDNM0ZrFDQLQnsBSOQkE0vcya/ndsRd2
         l7C0rY8DYaQnmwCS5faQ8t2iayqkJ0ZsmoNwBJKKsvecFX50yyISdgJfIKja5932CuHc
         B+s03DDiFv73AFvU3X1p92m50uHez0jnpwTgetJTS/bANI8/8EGlVTR3wNss8X5PB8EH
         2A2uFI/HVp6BzLxHahWp3RFL8Obk/XZs+Bngx95EiTNIVEnrhUcvc0xDCqlL9T7xUFXd
         UuilacOebv/jn99Od9QFbO9aQG4mJsEG0LgY6nf9PEw6suuXU7xhTTEzcXuVaMj5M9eh
         +i9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743634059; x=1744238859;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0XfgBiQEup7soca2GQu1jS4gphlsvFj7U02mWvvqnM=;
        b=FQKFDx3rupjmy13xeGTUJE91jPm/8u8plWS3kQdhmJ4QedpyIM30kZjhDSWU561oo8
         L7L62038mlcVX4fb8XikdP3C2x2kY/05VCk2O4CFUtOL4nH1f7Veh+4MfrYsVRfLTizB
         UdEq8JM1GLvYts6HmM4iI3+3IpQN/2v2HjbGHZATApYtQneiIsZmePYEJtBspVSNSoox
         UmiKA6tI8MoRZwp/oHXT3R//RxeeSgeTfVq5cbH5XvxzzlbI15HG+4WTI+L30ez+uO72
         IXjP/k0m53DOHulEZe8E3SvD5NHiXAoGvj21uEAGxgsDUkvW9qqWodx8gzsGp1VycpCM
         iVeQ==
X-Forwarded-Encrypted: i=1; AJvYcCURLM3AU8QtZj3iyjFbI2BOr4rESGpxc6LKN/FM6DWn6LROtb3TFj25HsNFAq7efNEQ/uCcX+e7g24JGUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ8LDlFF8OeacHkkP/vDKfmsYwzxFMoxwLK2UwYTJS2NnKld9S
	E9Ed5A/8BKe7AFrrGbcH3w4zPhhcRL1PZHJ07GWzUgQ6ES1K17z0mvXsC87HUwLDlaoJ29Acp0k
	usMaqkA==
X-Google-Smtp-Source: AGHT+IF0Vjt6VVHETz8kshE5LncADXihIg29Va9KdRuVYgUjgV6CB7EP15IrICdtzLpP1VDf5PAxLTAA4v5y
X-Received: from plpm12.prod.google.com ([2002:a17:903:3dec:b0:220:dc21:7a39])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:11c7:b0:224:1ec0:8a16
 with SMTP id d9443c01a7336-2292f9622b5mr265565235ad.21.1743634059263; Wed, 02
 Apr 2025 15:47:39 -0700 (PDT)
Date: Wed,  2 Apr 2025 15:47:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250402224722.88740-1-irogers@google.com>
Subject: [PATCH v7 0/2] Prefer sysfs/JSON events also when no PMU is provided
From: Ian Rogers <irogers@google.com>
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

At the RISC-V summit the topic of avoiding event data being in the
RISC-V PMU kernel driver came up. There is a preference for sysfs/JSON
events being the priority when no PMU is provided so that legacy
events maybe supported via json. Originally Mark Rutland also
expressed at LPC 2023 that doing this would resolve bugs on ARM Apple
M? processors, but James Clark more recently tested this and believes
the driver issues there may not have existed or have been resolved. In
any case, it is inconsistent that with a PMU event names avoid legacy
encodings, but when wildcarding PMUs (ie without a PMU with the event
name) the legacy encodings have priority.

The situation is further inconsistent as legacy events are case
sensitive, so on Intel that provides a sysfs instructions event, the
instructions event without a PMU and lowercase is legacy while with
uppercase letters it matches with sysfs which is case insensitive. Are
there legacy events with upper case letters? Yes there are, the cache
ones mix case freely:

L1-dcache|l1-d|l1d|L1-data|L1-icache|l1-i|l1i|L1-instruction|LLC|L2|dTLB|d-tlb|Data-TLB|iTLB|i-tlb|Instruction-TLB|branch|branches|bpu|btb|bpc|node

meaning LLC that means L2 (which is wrong) both match as part of a
legacy cache name but llc and l2 would only match sysfs/json
events. The whole thing just points at the ridiculous nature of legacy
events and why we'd want them to be preffered I don't know. Why should
case of a letter or having a PMU prefix impact the encoding in the
perf_event_attr?

The patch doing this work was reverted in a v6.10 release candidate
as, even though the patch was posted for weeks and had been on
linux-next for weeks without issue, Linus was in the habit of using
explicit legacy events with unsupported precision options on his
Neoverse-N1. This machine has SLC PMU events for bus and CPU cycles
where ARM decided to call the events bus_cycles and cycles, the latter
being also a legacy event name. ARM haven't renamed the cycles event
to a more consistent cpu_cycles and avoided the problem. With these
changes the problematic event will now be skipped, a large warning
produced, and perf record will continue for the other PMU events. This
solution was proposed by Arnaldo.

v7: Expand cover letter, fix a missed core_ok check in the v6
    rebase. Note, as with v6 there is an alternate series that
    prioritizes legacy events but that is silly and I'd prefer we
    didn't do it.

v6: Rebase of v5 (dropping already merged patches):
    https://lore.kernel.org/lkml/20250109222109.567031-1-irogers@google.com/
    that unusually had an RFC posted for it:
    https://lore.kernel.org/lkml/Z7Z5kv75BMML2A1q@google.com/
    Note, this patch conflicts/contradicts:
    https://lore.kernel.org/lkml/20250312211623.2495798-1-irogers@google.com/
    that I posted so that we could either consistently prioritize
    sysfs/json (these patches) or legacy events (the other
    patches). That lack of event printing and encoding inconsistency
    is most prominent in the encoding of events like "instructions"
    which on hybrid are reported as "cpu_core/instructions/" but
    "instructions" before these patches gets a legacy encoding while
    "cpu_core/instructions/" gets a sysfs/json encoding. These patches
    make "instructions" always get a sysfs/json encoding while the
    alternate patches make it always get a legacy encoding.

v5: Follow Namhyung's suggestion and ignore the case where command
    line dummy events fail to open alongside other events that all
    fail to open. Note, the Tested-by tags are left on the series as
    v4 and v5 were changing an error case that doesn't occur in
    testing but was manually tested by myself.

v4: Rework the no events opening change from v3 to make it handle
    multiple dummy events. Sadly an evlist isn't empty if it just
    contains dummy events as the dummy event may be used with "perf
    record -e dummy .." as a way to determine whether permission
    issues exist. Other software events like cpu-clock would suffice
    for this, but the using dummy genie has left the bottle.

    Another problem is that we appear to have an excessive number of
    dummy events added, for example, we can likely avoid a dummy event
    and add sideband data to the original event. For auxtrace more
    dummy events may be opened too. Anyway, this has led to the
    approach taken in patch 3 where the number of dummy parsed events
    is computed. If the number of removed/failing-to-open non-dummy
    events matches the number of non-dummy events then we want to
    fail, but only if there are no parsed dummy events or if there was
    one then it must have opened. The math here is hard to read, but
    passes my manual testing.

v3: Make no events opening for perf record a failure as suggested by
    James Clark and Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>. Also,
    rebase.

v2: Rebase and add tested-by tags from James Clark, Leo Yan and Atish
    Patra who have tested on RISC-V and ARM CPUs, including the
    problem case from before.

Ian Rogers (2):
  perf record: Skip don't fail for events that don't open
  perf parse-events: Reapply "Prefer sysfs/JSON hardware events over
    legacy"

 tools/perf/builtin-record.c    | 47 ++++++++++++++++++---
 tools/perf/util/parse-events.c | 27 +++++++++---
 tools/perf/util/parse-events.l | 76 +++++++++++++++++-----------------
 tools/perf/util/parse-events.y | 60 ++++++++++++++++++---------
 4 files changed, 140 insertions(+), 70 deletions(-)

-- 
2.49.0.504.g3bcea36a83-goog

