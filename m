Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6361EB18A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747684318; cv=none; b=Vz9zaUzLM7KUd/8YioNwQUohRpUS79qtjTR68Vy1venyDXMd3DZA2ZIpHxRRHYe1GBtMQ/9ZHMEGfj7kGYakgm+zKoJd0gxCxmTTc4iu8Soj3gnsgMfOR8oht7dJSV8jWOcMFGWLyF6WS0SQPVWIOTL4IQW6Get3ena05luK57Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747684318; c=relaxed/simple;
	bh=wSUBB0n7ZmXH+UZYhUGH2ab9S+F7UVZV611oueo5Zhs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HVOLYdiM844R5oAGJV/g3SpMllNnhatIvh9hJpYHi4YL3aMo4N2OrmadI4KV3YpC4206JJtFSfMaOeYtz9mHXqNKxeg9kbdZfnQqC+rvVTxgulgsNCcvCVtCKsHHa419FNgVPzuFnty2xTRE91inuLJLaK+s4Ag1nwoB0eckQVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RJPt+/XO; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RJPt+/XO"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742d077bdfaso1778969b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747684316; x=1748289116; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EKiITlsh+r6D22WzLP2+vzcG5nZw6vhMhfHcTnZ3OSk=;
        b=RJPt+/XOBzBdAqNc/yWHRtim1WmAPD+g9ZeQCuAAMU8Pu/GXG5g8eY4LxeToQTmsuh
         mobM5yumu2tdNQPfoLe5vPi2j07AQ8GikO04csutbpiV2cnfYxAhVO3jy1mb+Rs/cheL
         rpdkrhXc9x4SwXYy7KFpyBVVz7+NkdIQWpFueFQKTGWc9rixk/7/f45OzE9Y9ISvpiGm
         ab1FnTvkaO7P3Jsw7EhiZWeqjG3KQgxKhaQr09G+/iqrlwpAsp2ZRIVKXshtUA75wPde
         +sTqsqpEye+7EziHKM2gD/Tn2K5o3vTcBfWckaMHyLx4JrJvSgP+mG8PFg/R34hq4GYl
         Qj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747684316; x=1748289116;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EKiITlsh+r6D22WzLP2+vzcG5nZw6vhMhfHcTnZ3OSk=;
        b=WJpuBpYb7ZdO43cPH8UNtIK4LxroVyMTsHws/vtVpQsNMgeapPMOv/NZYSNo39eFgx
         5isr9sWHbGIdYGjL6bFKY7bVrFlvwMB5DEZ1Gvow4kTvgbRUeUvJ48BZhSf5OP4fCFW8
         c52pGfNOAkxbJuGLN4XIvJSGonQl0/9LQsVs1RUvgBFoguuJyxogMn0nTi22D9+5gX86
         4sgAAYkYleg2Bd/N8VzTaeT9DNIhIoPUAzkBO8aBQDl0WShp5LY7NhElwCI40gBXE9rS
         GbmoFjOHTSTDmMGxQ8dKvXqjaAq+t2DNMYFpqcGnINTfzx4IYIAkB3xZNhe88bSk9EKo
         5Vjw==
X-Forwarded-Encrypted: i=1; AJvYcCWcyo6pbflo5cpaMBN9RlqpYvilrmau7lnJN6zhAIcC/WYrBlYfAV+qTg1zii91BuTdpAwRwAxc0WZKIvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQIGf9G0y42c8+CgvuRyk0UQezg9uf9Oz/PCFGeDgkij6TLGEx
	0gfHjIYgN+Xwq6yq6tuM7haNoPpyYNSfEHS6eDkUX0bHy7KLTq8uDGcMUwlP08/E1yBvXLSab9X
	0coeR48iT0w==
X-Google-Smtp-Source: AGHT+IH5zsKkEUA1pW6qKPhBDHd2obRiYx0CxtSdOHrKmtqpdcl5siZm3Qz5k7QsG4OzyZ0Ftx/SSqj0ivrB
X-Received: from pfnv17.prod.google.com ([2002:aa7:8511:0:b0:742:9cbb:bca1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:888e:0:b0:737:6fdf:bb69
 with SMTP id d2e1a72fcca58-742a981b2b8mr19623796b3a.13.1747684315907; Mon, 19
 May 2025 12:51:55 -0700 (PDT)
Date: Mon, 19 May 2025 12:51:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519195148.1708988-1-irogers@google.com>
Subject: [PATCH v3 0/7] perf python: Add missing infra pieces for counting
From: Ian Rogers <irogers@google.com>
To: Gautam Menghani <gautam@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: maddy@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

Add the missing infra code in the perf python bindings for measuring and
reading the counter values for the given perf event. Demonstrate the
usage of this with counting.py - a python version of counting.c

Ian v2 -> v3:
1. Make the read API use CPUs and threads rather than indices as
   discussed in:
https://lore.kernel.org/linux-perf-users/20250512055748.479786-1-gautam@linux.ibm.com/
2. Add python cpus and threads functions to evsel so that these can be
   iterated to avoid reading CPUs not present on a parsed evsel.
3. Clean up bits of the perf_thread_map libperf API.
3. Allow a command line event to be specified for parsing, for example:
```
$ tools/perf/python/counting.py -e data_read
For evsel(uncore_imc_free_running_0/data_read/) val: 23062 enable: 1612523 run: 1612523
For evsel(uncore_imc_free_running_1/data_read/) val: 22423 enable: 1599354 run: 1599354
```

Gautam v1 -> v2:
1. Use the existing iteration support for evlist
2. Drop the use of next method
3. Use existing helper functions for python example

Gautam Menghani (4):
  perf python: Add support for perf_counts_values to return counter data
  perf python: Add evsel read method
  perf python: Add evlist close support
  perf python: Add counting.py as example for counting perf events

Ian Rogers (3):
  libperf threadmap: Don't segv for index 0 for the NULL perf_thread_map
  libperf threadmap: Add perf_thread_map__idx
  perf python: Add evsel cpus and threads functions

 tools/lib/perf/include/perf/threadmap.h |   1 +
 tools/lib/perf/threadmap.c              |  17 +++
 tools/perf/python/counting.py           |  36 +++++
 tools/perf/util/python.c                | 178 +++++++++++++++++++++++-
 4 files changed, 231 insertions(+), 1 deletion(-)
 create mode 100755 tools/perf/python/counting.py

-- 
2.49.0.1101.gccaa498523-goog

