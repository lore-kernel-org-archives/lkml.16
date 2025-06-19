Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382823BB44
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750292441; cv=none; b=SwZwMdLfM011taRSWW3AilIermcZY800y6JtBwiejOsNUemcD9RV8l7j0ziDfBiwnFdRYroOX9iIyvuOGL1lcYzd7XaWJnol2W24M++oUs5NSAWGOqaa0mHLmkC2QfFyJNgSuylQ2JzizA9M1XS8BE/WsqFvKWe6eHexYS9yMNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750292441; c=relaxed/simple;
	bh=TJzEuRcTs3pgnl5+aNUn6R+549T0G5ZtZVRr/ru1MtU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=jJQrfdHht/1UW3ezYXloq1Q6Jh4B+S/Yk5qyA9uDFfFKJYH5blL13swZ36LqXC7ddhbKG1jpQ9On88h1pZTjUbvJd+eKtTqg1izPk29NMnRF7a5zLBULSrKWCHOThRBptAFvZC3c1u1DjXgSqSaTVKZxmYKnHZcTYRDES0W1NV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AV7aCawe; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AV7aCawe"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235089528a0so1473235ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750292439; x=1750897239; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tPEaY4LYHaNMR9iNHEGQNkRo5fkHgYkHVhgZiejUeM=;
        b=AV7aCaweZ17iqHY8BwvNEwbgWUspFTdDkn9EolAeBp5e2eVrAmqM7VYFElPOvsVEH3
         5sGpznhHVbZXXJLVsYBpR930VIn1L1OhNOtFZ7+4nbWCDm+W2xvIEAQdg/lu9W7YfZ7c
         h6c1bYdcUvZ/f7sb5afdldfGC8i3ZN2EE5HY3lQoo9nRA7XqrHTI4EEGExBN2MPRYL/T
         yaDbjojefIaMCevGAcHMmNfLCF5UWhx30UbOS5IQdYBh/5mCh6/6qlINruqajFPS1YlF
         GdF2wDXOBstb+HBx8B02ofUgWNZ9uf3zrdSHycOxeuie4nZWJiujQb441oT6BcYeHi+2
         CCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750292439; x=1750897239;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4tPEaY4LYHaNMR9iNHEGQNkRo5fkHgYkHVhgZiejUeM=;
        b=n20bQA6AkXrIbSMVwFxFF2l1MeikdUpxKUUOxpjUc9L4N7BrsoLmK9z3/XoHvMxeTt
         PyWdjMtHhnnoShsz7GeagB2o6B2vA/QM+mPSOa0heniD++N1bVnzjEnZs+oe53Zvvlhy
         YrHdmV7xNpYgFRj2hT/OVbjNYSmY8y5GC48uhAbYAGA4I0AexOSL/AB8UvRW/IbceuTF
         Qz3rUvDsX33uTHmUMylDhVQNW5z+XYI6DpZz8NFHl/jz0+hDUhd+yedNzD84l/kQijL4
         ZuZ74ELG+B0KrQZ1TDVBw4EygxHykRhCKlJO+VbpV/AWX0dZuycMBmd51m+TS4DO+JMv
         qOUA==
X-Forwarded-Encrypted: i=1; AJvYcCVg2uRvam/NJpV0MbxmLCUCXDUwBU66T48HywWkQl+F9MgR88ikfkTrzTphnz1vXAKaA7MUMXgfDfTfUJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzhGm3f/dKDA0KYlo7aIgNVwmPCd8nmjmAc15BPMjy7zO1QlAM
	sOhNugGJ+enGR1bXrc01rtI8vKi76Vr1ScNTXTFLJjqjxhBEf8J3N5Kr9aUDYhW75DFMpH1T2fW
	WPoSOHrc7zw==
X-Google-Smtp-Source: AGHT+IFVrRcx7oQgwwfjZnSnBmzKEeXLqPtQpJbeQx8kRgrjbWTDw8AznIlz5aWVyIMWMyTUZH+yQf/VYvEV
X-Received: from pjbsw5.prod.google.com ([2002:a17:90b:2c85:b0:313:d346:f02e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:11c6:b0:231:c89f:4e94
 with SMTP id d9443c01a7336-237cbfbb942mr22430385ad.21.1750292439404; Wed, 18
 Jun 2025 17:20:39 -0700 (PDT)
Date: Wed, 18 Jun 2025 17:20:34 -0700
In-Reply-To: <20250619002034.97007-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250619002034.97007-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250619002034.97007-2-irogers@google.com>
Subject: [PATCH v2 2/2] perf test: Add sched latency and script shell tests
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
v2: Skip the test if not root due to permissions.
---
 tools/perf/tests/shell/sched.sh | 91 +++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100755 tools/perf/tests/shell/sched.sh

diff --git a/tools/perf/tests/shell/sched.sh b/tools/perf/tests/shell/sched.sh
new file mode 100755
index 000000000000..0a4fe3f414e1
--- /dev/null
+++ b/tools/perf/tests/shell/sched.sh
@@ -0,0 +1,91 @@
+#!/bin/bash
+# perf sched tests
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+if [ "$(id -u)" != 0 ]; then
+  echo "[Skip] No root permission"
+  exit 2
+fi
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

