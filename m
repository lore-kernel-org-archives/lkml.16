Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3944D634
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750292760; cv=none; b=rOLxCPfLj7EOzHmFJgplNOIHEYXTLOXs2JFwMGKo25uTnm1IFcOu7LPbtoWXFw69lpolHcz+JUXlM92qb4e8FHHb5IJpCUi1hp8lLA/HE0/8l17/vhlPMqPovukTJrsCrA1Tclv7YlSSV4OIilnxhW1DxXtlX92d/wvjhTRBdcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750292760; c=relaxed/simple;
	bh=HU1E8aM3TVhNI0cCzg9X63hUgWeXgl9SyxMRZww9RJs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=XP26ei6XFQA4t96w3yyzwypWK0KsaVmtPghLMkOGahmpFmGWo/Sf4mocnKAGqymGDO0BAZLyWcfOCz4k1xzpbmOt0Woppo4PeNJU+KeQAblxoPqDsRwDq/aiFpQkU/hfglc/iisXu5VmCgsx/TLM2mofG0OQhiXSWUgFUPUoO1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XuUgUnsd; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XuUgUnsd"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2eb60594e8so166036a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750292758; x=1750897558; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bz9sQ1jYIkFwDy+0Jm9AH/eJ9D8RS+YeR4yr3JjwJe0=;
        b=XuUgUnsd5uS9PWxcrJvHqGMDm75cy4amenZPC4wZE0vUy4P5QjERiJ9SQJ9OCEwmZh
         vSP9iUtr1C+K++2wQtAwhnpNKwSWj4NpkWfzlLzWVrUkZGhgx5wsKvxolV9oxvi9g+9q
         GUgJxTqKXtDN2wuMSu9Ai0coufaLPzoPMLqjj2xiH8DTlhfcAMFfHK4iMhDM+J6/Br5i
         GNb9FVGMUFRrcai3lJz9GgU8emXoMay5IJNLP0AH4bxzjn4fRjrymiEnmGGXs+NAiFlN
         FKo8wvLoK/cBb3d66xGVEP3W+UdU0t7/aENT+XCx12OM0zLUoEF2hRKMCKDms1Lc7Td/
         J8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750292758; x=1750897558;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bz9sQ1jYIkFwDy+0Jm9AH/eJ9D8RS+YeR4yr3JjwJe0=;
        b=oCKUoImIP5+Xj3NMnhls6b4SdThqg9kDPMMCHitbDVnFvc3gxqHL1ucqlleXB+dZNP
         ldATcBOXsuGQxVgDF2r8bTDvddPLh/pHaW1RxXAesz4MiiPkheRFRADUodiPTQg9dhQT
         y9LC+SFOMezSMJmEDS5xZSvjD5bCOc94bCe7RaBmI6J3aaFMuSKjA15RuIZZxMCCgyKP
         XTtsSbo+41R/kzlRxMqPgEgSJBqX80D9APuOOMLsHazTz5BlP6Y8R9SXC7YzOGx2A9Xv
         vkHZDlOcgVfq34PH2LfE2+uqVlmwVj7QSHCgG0xHGYci/8CluvsoDJ4Byr6PcTvrkN2e
         0Wsw==
X-Forwarded-Encrypted: i=1; AJvYcCWAw2A1DixJfatuFm5g+R9C4+Id4OrCz3GiLzgLHXn4hO119WVFnmPThsZMkAFBQI1Qo+yom1cEQsYugf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCpObrYA9yEP2E8R/AAJk+ZqZ0NLUog2U1Ac3DUMi71sTZJ3zN
	nNuZrJQQkOdS+KEM9SZP9RjI7rDbsH3g/JX/iR40mLF3l1JdfcAqtoN+qGSZiprVgWHkSao5Ylm
	VQHMv2u5b1A==
X-Google-Smtp-Source: AGHT+IEyPukKZOVUfM8A6d07f+coolTaxEhOh98UNY0RPJ2hfefaBNkrDs16/EbZqdai7uqY6nO4GSftqohC
X-Received: from pfblj6.prod.google.com ([2002:a05:6a00:71c6:b0:746:24d7:a6aa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:8cc6:b0:20f:94bd:eecf
 with SMTP id adf61e73a8af0-21fbd7ffb6bmr28154130637.42.1750292758445; Wed, 18
 Jun 2025 17:25:58 -0700 (PDT)
Date: Wed, 18 Jun 2025 17:25:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250619002555.100896-1-irogers@google.com>
Subject: [PATCH v1] perf test: Add header shell test
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a shell test that sanity checks perf data and pipe mode produce
expected header fields.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/header.sh | 74 ++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100755 tools/perf/tests/shell/header.sh

diff --git a/tools/perf/tests/shell/header.sh b/tools/perf/tests/shell/header.sh
new file mode 100755
index 000000000000..813831cff0bd
--- /dev/null
+++ b/tools/perf/tests/shell/header.sh
@@ -0,0 +1,74 @@
+#!/bin/bash
+# perf header tests
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+err=0
+perfdata=$(mktemp /tmp/__perf_test_header.perf.data.XXXXX)
+script_output=$(mktemp /tmp/__perf_test_header.perf.data.XXXXX.script)
+
+cleanup() {
+  rm -f "${perfdata}"
+  rm -f "${perfdata}".old
+  rm -f "${script_output}"
+
+  trap - EXIT TERM INT
+}
+
+trap_cleanup() {
+  echo "Unexpected signal in ${FUNCNAME[1]}"
+  cleanup
+  exit 1
+}
+trap trap_cleanup EXIT TERM INT
+
+check_header_output() {
+  declare -a fields=(
+    "captured"
+    "hostname"
+    "os release"
+    "arch"
+    "cpuid"
+    "nrcpus"
+    "event"
+    "cmdline"
+    "perf version"
+    "sibling (cores|dies|threads)"
+    "sibling threads"
+    "total memory"
+  )
+  for i in "${fields[@]}"
+  do
+    if ! grep -q -E "$i" "${script_output}"
+    then
+      echo "Failed to find expect $i in output"
+      err=1
+    fi
+  done
+}
+
+test_file() {
+  echo "Test perf header file"
+
+  perf record -o "${perfdata}" -g -- perf test -w noploop
+  perf report --header-only -I -i "${perfdata}" > "${script_output}"
+  check_header_output
+
+  echo "Test perf header file [Done]"
+}
+
+test_pipe() {
+  echo "Test perf header pipe"
+
+  perf record -o - -g -- perf test -w noploop | perf report --header-only -I -i - > "${script_output}"
+  check_header_output
+
+  echo "Test perf header pipe [Done]"
+}
+
+test_file
+test_pipe
+
+cleanup
+exit $err
-- 
2.50.0.rc2.701.gf1e915cc24-goog

