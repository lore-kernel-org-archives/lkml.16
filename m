Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123752566FC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807144; cv=none; b=MSSx0fVT6FBj1ZyGTY3bgoUipcusHs75fqDwELXh5olx8T3CliprQ33gqc050IzQwpXUVmlyRs4Qa/lXO0ShXI8by6GOOfPHZQozdPw7mrTO+7gUmTk4JABRHjxx+RBG5pDBuENt7FDmn6pxU2XtWEEydxagmjQWiyD4Th4lt64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807144; c=relaxed/simple;
	bh=qsd+J5obkf/JJPWjGyBw6D2rofd/ROvvLqQ/ikiIxws=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=UNS0gizCDvqxsReBfSsCNxkvViwYefYr9LeDuADpY+VNBbgZK0jNyHm68vCpsTTF6OkdIS4brX/IjXNnwITzf818XOx4QFUvQWBDLQuqEST91uSoSeB0LsUAIhRQj8RkftQfSDohmVhqIoWOvefRlnFdogy3ziI/o0ACuuXu+8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FCAKFo6r; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FCAKFo6r"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-748e4637739so156950b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750807142; x=1751411942; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pngvqSmCovapbXdYFYPO9SgyKEbtBPIrkfwlrt81RZ0=;
        b=FCAKFo6rxAwpqw1D95y3R5wTVVWRO7J4Cm/vD49uCvkk5oFHYHcI+hPsYEESHjCGim
         b4F+A30bRBiConuFHZFHdU8RXXWbQmMbMXZbdwZi7sxg3SGQXv2sTGXUBAlGWjQuCOtl
         +IRqHdN8fI51+DmyZbW1f0UF6AusfG9j/4Y9XyywBCzmES3BHt9KTnvx5kxLTqMXP0gp
         ZdKnF9AOgZT4oRPtCwee4t69DujvWFxXLP6GHITKP+CYMWCucbdKijxuDr7dCSGIrx3m
         oLzT7KJ7deEPM503AyfvdVDLfWt2LeDgOjlWYmg2RtH0ZxKqwchhzm+nSdbISxAKUqbJ
         1ZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750807142; x=1751411942;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pngvqSmCovapbXdYFYPO9SgyKEbtBPIrkfwlrt81RZ0=;
        b=JObeMrY5kpd6hTU4zwNsc9733CrVIUTseUdHjp8W1PPcb+S+/Y9hE/ELDRvTXqkTZk
         l0CNTWg46wPuLHe6on4uW5K1m/RaxZKES/VhUKKW3Q5FEczzW+Axn7U2rBP9QbSdcyUY
         u75UnwiqV+a0+ywj2nb9YPJCpzj+Ve9hRMWb35zQfpmF1Cys3EY03CKEqC7vZGydlw0C
         KQrLFEAlhbzrQfuodmGaUG3siil++Jld3b8aZPvdv8ClWW/b/jmFrNXJQq3gKuG6C0ui
         ohLP8Fr96bRAeyLjoRtirlR5oZMJ24Z1pmhCGfNgp0hs+h6oKTu36bSFqZL6oOIhuINn
         OX6w==
X-Forwarded-Encrypted: i=1; AJvYcCVVMn4GTPltH4BrQ0RcsROiqrUCeIIVkTzwr6BSjNHk8jy2Bczj4m1fISa7IlgXZTFxDeUah/P8FwRts1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv6zUxnzIAsQbPbgaPYqC6ypn2qD1MVwd/oPDjO14Q0THXuevV
	82ez9OyOVzaJDJRvK8frtCkHlPS8Bam6on7T+eDA2sHh5SDtzHx94FN4TjEt7YbF70uplXPJqRG
	hf8HeG3AdLw==
X-Google-Smtp-Source: AGHT+IFV3B9OhuWzDeSllzGXDR7OZvOBgi6Pi0GJ0cqbrlPswzFv236wUfDx8y9GXBFd4lYwDCtu44HkGh5n
X-Received: from pfbki22.prod.google.com ([2002:a05:6a00:9496:b0:748:da37:7e37])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1891:b0:744:a240:fb1b
 with SMTP id d2e1a72fcca58-74ad4bf80dcmr1309549b3a.5.1750807142180; Tue, 24
 Jun 2025 16:19:02 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:18:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250624231837.179536-1-irogers@google.com>
Subject: [PATCH v4 0/3] Add support for a DRM tool like PMU
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	Thomas Richter <tmricht@linux.ibm.com>, Junhao He <hejunhao3@huawei.com>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, matthew.olson@intel.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

DRM clients expose information through usage stats as documented in
Documentation/gpu/drm-usage-stats.rst (available online at
https://docs.kernel.org/gpu/drm-usage-stats.html). Add a tool like
PMU, similar to the hwmon PMU, that exposes DRM information.

v4: Rebase over changes like the auto merge stat to first wildcard PMU
    change and the clean up of tool PMU initialization.

v3: Minor tweak to the test so the skip (exit 2) doesn't trigger the
    trap cleanup.

v2: Add support to only scan hwmon and drm PMUs if the event or PMU
    wildcard can match. Add a test as requested by Namhyung. Add file
    comments.

v1:
https://lore.kernel.org/lkml/20250211071727.364389-1-irogers@google.com/

Ian Rogers (3):
  perf parse-events: Avoid scanning PMUs that can't contain events
  perf drm_pmu: Add a tool like PMU to expose DRM information
  perf tests: Add a DRM PMU test

 tools/perf/tests/shell/drm_pmu.sh |  78 ++++
 tools/perf/util/Build             |   1 +
 tools/perf/util/drm_pmu.c         | 686 ++++++++++++++++++++++++++++++
 tools/perf/util/drm_pmu.h         |  39 ++
 tools/perf/util/evsel.c           |   9 +
 tools/perf/util/parse-events.c    |  33 +-
 tools/perf/util/pmu.c             |  15 +
 tools/perf/util/pmu.h             |   4 +-
 tools/perf/util/pmus.c            | 101 ++++-
 tools/perf/util/pmus.h            |   2 +
 10 files changed, 951 insertions(+), 17 deletions(-)
 create mode 100755 tools/perf/tests/shell/drm_pmu.sh
 create mode 100644 tools/perf/util/drm_pmu.c
 create mode 100644 tools/perf/util/drm_pmu.h

-- 
2.50.0.727.gbf7dc18ff4-goog

