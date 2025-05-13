Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373C920EB
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173580; cv=none; b=pDk6FCZhaYiuWrCp8ZHU6+k9KrQA//qV8t2Rds2VJFgkTxSsMVTCfkW1fKXZ/zjAPqMsGZoiq0qTdBRr2NZt84LU6YcsTZHwFKY8BURsNaH9ljOaQewwklLCm4s97Q4Ga/jvs0cYJxyWiBcPNsDlaenmDrPeRvgTmrGCxtDX72w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173580; c=relaxed/simple;
	bh=59VlnNQcrQbF9VoPWx9rTK6gSiYi9D6flZRl8TqbiJY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r7QJN8qOR/6guATNMJlJ2amwdYrNTGm8v7+t6/44cd5gerKEV/XNay5dCHB+rpiLtfHB97mNtb/Mwk+QcTHzWHCA7jHD7Fy6PfQuHpVFVZKNoAr0DMKdix1gIJE4xIjBQgxGulrsZ4Wf8qNPh7RCnW+r558Q3DuboKNZuOQOEck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4qV0C8/t; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4qV0C8/t"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30e0e8ba948so1506573a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747173576; x=1747778376; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wxh9BxVjJTo5yVA2IRbpjDRptGFFtiq3WHv5MWVzf+Y=;
        b=4qV0C8/tT6O+knwEpeIO6kRsCio/5PHP4L/R5DgB9wHl/ooJit4qxP323el0Yt4d5s
         S1qcGuz/Wmu6bZNQmd5AOXA58CO4waXL2GK2b0uEnpuhhwL4vSSvfBGsDWQDDd9VnfGI
         Ez8Qitq7tHQJKXEzsvMdWLusOxA8reRxMqCZ8NDK6qJv5S+24PTiVDONjY0NPDgDxd4+
         USUprfFbVXKuwQPoXULHFBUkfkimiHZo2JBjBKbyJzbajlZQhJ6kxYmPaJpx2UQaatlB
         UsjY2PmZO1A1iUewHZQb+kuTXKRjPjYJJXrn0O9bDwQSJ0fuQO0MZu6YFO2qijxe4qjn
         UWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173576; x=1747778376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxh9BxVjJTo5yVA2IRbpjDRptGFFtiq3WHv5MWVzf+Y=;
        b=i52ejUrXJwsVrgTGDORxLXfsRohTuV2HunW7U5Ud+AZjprBAH/FGdb01aQU2K4SUzV
         j0tMLM3leUXw9HSw/hiHfBQ6+3EbVzcgQylJSzJNWPyCl3ba87T3TVrGtts4BWdiTVeC
         cFFuClZlwftR2+84KoRojnCoWbcuxvVtGYlil5Za+1ZWl946ZqqwWcgf3EWp9wZtQP+F
         Xb5HfX8WVKj3KlthfVmU66UfzflSIV4S8mkfUrRgGQKcLFTu5HWoTX5CGC+UMUn5U+Pv
         1D1AXHPXWQmvpWyN9R9mrgP+YLgHJubqrxwyD9txGCxNbo0Q3+mX0BnkbAewx4gHV0HC
         mtWg==
X-Gm-Message-State: AOJu0YxYQ2af2Z36PlqiDNX6q+UbMqEXOwkEZbx88yYY6SZdlAqRjsFI
	GH0m1ckLLjXbWIQezqg6I1nYOkxPBl3XCv62fVTdF3QTlhu12/drVSEjwjetZKNHeQ3ck0ZcUKa
	rLZS3RPHzaUIHhk76QLI7WHKqv25RB9oo9q1VN9Dt+ie7+9Eo4tQ74y1TIwzUooj0RYvmk52aS+
	8BXqipVY2NIzr7fJgaJGdiYnoBmsu21o9EjhobttVS
X-Google-Smtp-Source: AGHT+IGjzCvvWC24UQLYpGjqozDFlayOjAbZNXIhc9Bx7yZY6KP50LdqPlIhi5YtpGxNXqNDP6O+tXNP1C4=
X-Received: from pjk3.prod.google.com ([2002:a17:90b:5583:b0:308:65f7:9f24])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3bce:b0:305:2d68:8d39
 with SMTP id 98e67ed59e1d1-30e2e5e6ca8mr1988712a91.12.1747173576315; Tue, 13
 May 2025 14:59:36 -0700 (PDT)
Date: Tue, 13 May 2025 14:45:03 -0700
In-Reply-To: <20250513215401.2315949-1-ctshao@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513215401.2315949-1-ctshao@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513215401.2315949-4-ctshao@google.com>
Subject: [PATCH v4 3/3] perf test: Add stat uniquifying test
From: Chun-Tse Shao <ctshao@google.com>
To: linux-kernel@vger.kernel.org
Cc: Chun-Tse Shao <ctshao@google.com>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, howardchu95@gmail.com, 
	linux@treblig.org, yeoreum.yun@arm.com, ak@linux.intel.com, 
	james.clark@linaro.org, weilin.wang@intel.com, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The `stat+uniquify.sh` test retrieves all uniquified `clockticks` events
from `perf list -v clockticks` and check if `perf stat -e clockticks -A`
contains all of them.

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
 .../tests/shell/stat+event_uniquifying.sh     | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100755 tools/perf/tests/shell/stat+event_uniquifying.sh

diff --git a/tools/perf/tests/shell/stat+event_uniquifying.sh b/tools/perf/tests/shell/stat+event_uniquifying.sh
new file mode 100755
index 000000000000..5ec35c52b7d9
--- /dev/null
+++ b/tools/perf/tests/shell/stat+event_uniquifying.sh
@@ -0,0 +1,69 @@
+#!/bin/bash
+# perf stat events uniquifying
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+stat_output=$(mktemp /tmp/__perf_test.stat_output.XXXXX)
+perf_tool=perf
+err=0
+
+test_event_uniquifying() {
+  # We use `clockticks` to verify the uniquify behavior.
+  event="clockticks"
+
+  # If the `-A` option is added, the event should be uniquified.
+  #
+  # $perf list -v clockticks
+  #
+  # List of pre-defined events (to be used in -e or -M):
+  #
+  #   uncore_imc_0/clockticks/                           [Kernel PMU event]
+  #   uncore_imc_1/clockticks/                           [Kernel PMU event]
+  #   uncore_imc_2/clockticks/                           [Kernel PMU event]
+  #   uncore_imc_3/clockticks/                           [Kernel PMU event]
+  #   uncore_imc_4/clockticks/                           [Kernel PMU event]
+  #   uncore_imc_5/clockticks/                           [Kernel PMU event]
+  #
+  #   ...
+  #
+  # $perf stat -e clockticks -A -- true
+  #
+  #  Performance counter stats for 'system wide':
+  #
+  # CPU0            3,773,018      uncore_imc_0/clockticks/
+  # CPU0            3,609,025      uncore_imc_1/clockticks/
+  # CPU0                    0      uncore_imc_2/clockticks/
+  # CPU0            3,230,009      uncore_imc_3/clockticks/
+  # CPU0            3,049,897      uncore_imc_4/clockticks/
+  # CPU0                    0      uncore_imc_5/clockticks/
+  #
+  #        0.002029828 seconds time elapsed
+
+  echo "stat event uniquifying test"
+  uniquified_event_array=()
+
+  # Check how many uniquified events.
+  while IFS= read -r line; do
+    uniquified_event=$(echo "$line" | awk '{print $1}')
+    uniquified_event_array+=("${uniquified_event}")
+  done < <(${perf_tool} list -v ${event} | grep "\[Kernel PMU event\]")
+
+  perf_command="${perf_tool} stat -e $event -A -o ${stat_output} -- true"
+  $perf_command
+
+  # Check the output contains all uniquified events.
+  for uniquified_event in "${uniquified_event_array[@]}"; do
+    if ! cat "${stat_output}" | grep -q "${uniquified_event}"; then
+      echo "Event is not uniquified [Failed]"
+      echo "${perf_command}"
+      cat "${stat_output}"
+      err=1
+      break
+    fi
+  done
+}
+
+test_event_uniquifying
+rm -f "${stat_output}"
+exit $err
-- 
2.49.0.1045.g170613ef41-goog

