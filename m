Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0067F170826
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791812; cv=none; b=ndkqItXz1tn0qOiKxGE1hLl6AVrToeXmHpOJ3hwPZAoxKUvm+dNVtZ0ZAlR6u7S5QniyUOIuQFXws3GrmMhgXdW6Cb50/IJOFOsL8EfubivEIuyTAaVVWcDoKCCIRkFBPa2yDscsm4aEcEKNjjh699eudNnXKmdoN4Q6ZzHmcjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791812; c=relaxed/simple;
	bh=EW0xPWjuMvCS93oxJalyE9u8qUrwacrh1msaGtQ0pQc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=hEdc7sZ+xtUoSv9JbQ6QwaJ/5TC1QiI7b4FnlYo0Q/3AjjkmRxtaxI6D982TUKe2ZRDfAXxthCXNPbLPEyJ3WqElSjrX33twfppHFoITbKsP0U0+3oNMILcwDwcLONXBp3fhvGkSZXgZe3KTEQnNvjkCtZxGWRP22A1XXYcFJs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=atQ51aGD; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="atQ51aGD"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2356ce55d33so12201595ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750791810; x=1751396610; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mue4OatHqKQgcnJuH11t4Xo+RNvOkSJfMi17AAIhEug=;
        b=atQ51aGDXSCoDgB3667njA67rCSRnpwqJEmtJ93QSwFs66ycnokTCZL3TTrklp3sa5
         Ad8hgEEQLBvpwNAs7noaiGXFSosTwbQ0IXOgDLTKwzUsj88vKORSzLHgdrS0xecYB+TL
         0/07go64zSZ3AzJFAGQkM8Tm4XBHj9TdT88XtQxe214vf+1yvlW7Bhm50SCWlliAqVQN
         BUAjKCNZ3G7B14ONCKiFiM5gX2zssSqkeS+MSr53GQqnikyPHeMMeKSEIhgd9u+2CWua
         wiVyeZtV8XHvRSHsxOheg/NbFccuea4uxg52rqcSR7VQ188NBVWaoTj5JmWXcDjxrLbB
         nG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791810; x=1751396610;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mue4OatHqKQgcnJuH11t4Xo+RNvOkSJfMi17AAIhEug=;
        b=JOHs8Z5dorIRy4Vh4/54s18cimY7ZA5xZDcM2+/nA93IMyiMRtudhUG35icJIauKDw
         SOu5s9zqvLToddGA8kqtyr3JRHza0S8k9PohYmD9fhwC+gt88NvIAQWPA3FuK6G4vrKY
         tjp/6StRqGZdUV2hLISIYfeOXIdjqui5Qht3kRanw/8NAYEHmbXuGwXoc7MwG/GUJ3NL
         88r57kfTUCxXzHlboIhn9ANXXPeXKHChXOiWjsw4ObdsPzHrkliP0zCYf91KIeQzFOYI
         S1T4GuG7YN+WVX/oVAibgtQ0Zutj8AE3gQ32jobSBKk9d3035sSfR3Z1revABbl3y46R
         VhHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeIZLiab51681EHKEnwOOVaqb/j4KevzCrAWg3c26TZwoCF6nr1/l9OldHJk3xwWnnobgdJEdlVTdwc0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxuTiEjvd1yXYcqJDfBXetg5fuU9TErZH4iR0EI+JlRePIH8P6
	Nq8JybSE+N51qJbTCCYGoBltmShAGOAkkNU/aJYsF/+4Bdv85nNKQrgg0LJDcT0oLh2g0FL0tKm
	zCptuIIyzSw==
X-Google-Smtp-Source: AGHT+IHoUFBbRYTquRk0WPMcZ4uILJkDxh4x7sG+l81HGpvgVH/BdM5ulwNwPspJWXq1m+PZtX7Aa2KJGOCn
X-Received: from pgbdp11.prod.google.com ([2002:a05:6a02:f0b:b0:b2f:6641:f70f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c94f:b0:235:c9ef:c9e1
 with SMTP id d9443c01a7336-23823f6d39bmr7301675ad.5.1750791810303; Tue, 24
 Jun 2025 12:03:30 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:03:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250624190326.2038704-1-irogers@google.com>
Subject: [PATCH v1 0/5] perf test: Sanity check file descriptors are cleaned up
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Howard Chu <howardchu95@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Dmitry Vyukov <dvyukov@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Some recent patches showed we were leaking file descriptors:
https://lore.kernel.org/lkml/20250617223356.2752099-2-irogers@google.com/

When a test is forked the file descriptors >3 can be closed and then
any file descriptors >3 left after the test are leaks. Add this
checking to the forked test code. Prior to that clean up some file
descriptor usage so we can assert that only file descriptors are
cleaned up. Sometimes the file descriptor being held open is the
result of a memory leak, so fix those.

Ian Rogers (5):
  perf dso: Add missed dso__put to dso__load_kcore
  perf test code-reading: Avoid a leak of cpus and threads
  perf hwmon_pmu: Hold path rather than fd
  perf dso: With ref count checking, avoid dso_data holding dso live
  perf test: In forked mode add check that fds aren't leaked

 tools/perf/tests/builtin-test.c | 69 +++++++++++++++++++++++++++++++++
 tools/perf/tests/code-reading.c |  7 ----
 tools/perf/tests/hwmon_pmu.c    | 11 +++---
 tools/perf/util/dso.c           |  4 ++
 tools/perf/util/hwmon_pmu.c     | 38 +++++++++++++-----
 tools/perf/util/hwmon_pmu.h     |  4 +-
 tools/perf/util/pmus.c          |  2 +-
 tools/perf/util/pmus.h          |  2 +-
 tools/perf/util/symbol.c        |  1 +
 9 files changed, 112 insertions(+), 26 deletions(-)

-- 
2.50.0.714.g196bf9f422-goog

