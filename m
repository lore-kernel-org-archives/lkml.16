Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8334225FA06
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281324; cv=none; b=KYptPfhCtueZfPegF2ciF0mhhFgTsPMk/Dl2x1x/1awz1DaXYUaqdEzPkwU0JfTUxyKGCqStDoBeBJsbWQ2FccDq+Rrwy+hfrKK3DLLn6Z4Faj3EJAqD42iZ5Xu5yOd7niiZY4M8kkZZMamJXkuvsAl2cpbwkRVrssrnO0du1PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281324; c=relaxed/simple;
	bh=ExWOP/OkSf0lKmRzIhhYs7Typ5dWMqCzHI2WPebhL0I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=K/fW0vd1dHG8TwR5yH1qGeNUAS4tG7DG3wqxU7QQKRNipvHNuZlmbt6WC8J2r3WzF0Bkp26H7566Z7BE7n6IZllnTeS+PkXeGGd7WO5mllilwgSLyfxC7bSGQgTQhbkpOvyVPrV3pXmRlJ0BV5Ho+4CCD/D3sKBRA8c7IDjQza4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t4YdNKw3; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t4YdNKw3"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b31831b0335so158155a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750281323; x=1750886123; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oP7eGb859HKbPWx5tSNn2WyGCfeFJ17Uo6an/D8Mllc=;
        b=t4YdNKw3Z6FO1cCfpo/7Oftzf9pKISb0USriIs73JVf0b9JlDCEJFRhB17ZmMaYTNg
         p6L0SeMpZjpoIDfOrJi9FpVmiNW/tYCRPgorFWli6EZ5u/IcDNtnedTTeu62+Kw5Dz6C
         luYxsTpIm6fKQvEyWu5ZWKxkeU81INcdMXRs3D62K+4YALEKcDM3oj2tp5Bo61WlqDzc
         GKOksKUL0ZmD86kHhfsHi1od5Wl+W0ytyT8qG5AODlgSqIMw31qJACA6Khg0NdjWzhwi
         RVMp1GfonmTJn+58YKmUn8iUnnMclXICOWSMKjoK0S94/2um1tct6T7995Np+oALK62Z
         ATMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281323; x=1750886123;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oP7eGb859HKbPWx5tSNn2WyGCfeFJ17Uo6an/D8Mllc=;
        b=o3dhS4vSK8ESs4cBhFf1h/zsBeXaWrOJv5IaBqmbmXNiq6zwDRDCURFByJYYMxGgqf
         bTNfzI/tEfWBALGJmrI96SfVVqT4xtlVl0LcO2VelrgJoGC1f3cvQwdgt2FGgBEB2Gyx
         E2HSt0IOjvcBcmlqB5BGrnTjl/G7UsSp6+B230jtgGd//+VlMwhsgR4weyPtXCzjapSt
         0Q/YQSCdYaA6RyYQ3sK5DLH4+MsHQ8m++yn8bXc+8WVb0k2PqfVgqIBIDBaUMGnmkiVL
         rP6/PXMG0bg9DtLcX3fsyCgxeL1TztnVFwY6XIkuSfEgJpNSfZXBmxfdyEH4mDlsIfvY
         6PVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4WlG/rkK6ZpGmtjb/ksnHpOin4eINgIsdQmLo+bUedr0v22xdvxRhbRjIj5t5RIiHPw/fSCUE6kHagtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwImkN2Z2F3xNv0Op0Lz8T9ZC1mYN4yqtCMmmwlewv2jxf5kocY
	f6fXL/m2quVJkZq5NX7QYpg4+0KsrtiSHiblK8FlSUdre+F6aqZaPh2DwJT2q44p7Fg5jC0UCC/
	jf/kKLt1P1g==
X-Google-Smtp-Source: AGHT+IFoO01mJ2VDWg8qVIkIX66bAA7kynDzS7RjllwqsYD6uzi9jl0Qa6sjsPVMfaGFMsTfrwfaoy67M+9J
X-Received: from pgbfe24.prod.google.com ([2002:a05:6a02:2898:b0:b2f:556f:74a2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e687:b0:1f5:9330:29fe
 with SMTP id adf61e73a8af0-21fbd4c7e08mr23859898637.17.1750281322878; Wed, 18
 Jun 2025 14:15:22 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:15:14 -0700
In-Reply-To: <20250618211514.3084483-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618211514.3084483-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250618211514.3084483-2-irogers@google.com>
Subject: [PATCH v1 2/2] perf test: Add sched latency and script shell tests
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add shell tests covering the `perf sched latency` and `perf sched
script` commands. The test creates 2 noploop processes on the same
forced CPU, it then checks that the process appears in the `perf
sched` output.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/sched.sh | 86 +++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100755 tools/perf/tests/shell/sched.sh

diff --git a/tools/perf/tests/shell/sched.sh b/tools/perf/tests/shell/sched.sh
new file mode 100755
index 000000000000..ed6cab34b6f9
--- /dev/null
+++ b/tools/perf/tests/shell/sched.sh
@@ -0,0 +1,86 @@
+#!/bin/bash
+# perf sched tests
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+err=0
+perfdata=$(mktemp /tmp/__perf_test_sched.perf.data.XXXXX)
+PID1=0
+PID2=0
+
+cleanup() {
+  rm -f "${perfdata}"
+  rm -f "${perfdata}".old
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
+start_noploops() {
+  # Start two noploop workloads on CPU0 to trigger scheduling.
+  taskset -c 0 perf test -w noploop 10 &
+  PID1=$!
+  taskset -c 0 perf test -w noploop 10 &
+  PID2=$!
+
+  if ! grep -q 'Cpus_allowed_list:\s*0$' "/proc/$PID1/status"
+  then
+    echo "Sched [Error taskset did not work for the 1st noploop ($PID1)]"
+    grep Cpus_allowed /proc/$PID1/status
+    err=1
+  fi
+
+  if ! grep -q 'Cpus_allowed_list:\s*0$' "/proc/$PID2/status"
+  then
+    echo "Sched [Error taskset did not work for the 2nd noploop ($PID2)]"
+    grep Cpus_allowed /proc/$PID2/status
+    err=1
+  fi
+}
+
+cleanup_noploops() {
+  kill "$PID1" "$PID2"
+}
+
+test_sched_latency() {
+  echo "Sched latency"
+
+  start_noploops
+
+  perf sched record --no-inherit -o "${perfdata}" sleep 1
+  if ! perf sched latency -i "${perfdata}" | grep -q perf-noploop
+  then
+    echo "Sched latency [Failed missing output]"
+    err=1
+  fi
+
+  cleanup_noploops
+}
+
+test_sched_script() {
+  echo "Sched script"
+
+  start_noploops
+
+  perf sched record --no-inherit -o "${perfdata}" sleep 1
+  if ! perf sched script -i "${perfdata}" | grep -q perf-noploop
+  then
+    echo "Sched script [Failed missing output]"
+    err=1
+  fi
+
+  cleanup_noploops
+}
+
+test_sched_latency
+test_sched_script
+
+cleanup
+exit $err
-- 
2.50.0.rc2.701.gf1e915cc24-goog

