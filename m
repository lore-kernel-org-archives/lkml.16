Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF31215F5C
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748496215; cv=none; b=P8uiL8o06EgKRZYR/wVnKmlnWEWEcozFMXBnLwUgr98/FgUsAjb49uo6f+Utf9bS5S/LTcP/+ZDXwIqgAGmFnywfrQWofZaXIOPbfqX5MToqugDu+20ER6V9+xHHHK5dFpSH9lMbRRFUVsWVtsQazaF+8ft45L5DuOFQmGbB8Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748496215; c=relaxed/simple;
	bh=bSDjDJQ48k1zmpv3llovIWKPCMjb9YC7052Peote2wM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=IzVfWBwIiLNPoY0+yuKp7tpWGcZg+l+5AIFF4wXBIG2HQSYcp1IITfhOENx3WEaLZXCw0zYgxEwcYezcYNUCyPvV+2BpOBY37djnrjql7UiHRMnWOxr35yanvMsXSO9yyrASUyiqV/DTohPlMiSn+0OAe6T1P5JKr92OntTw6nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bWD/asSN; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bWD/asSN"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso541927a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748496213; x=1749101013; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qaN+oF9TY82Jt9dHLarNCVurtUh9xsOGoGQ7ZdqpUPM=;
        b=bWD/asSNVTU0SXGy6HuN4eiRKXO07l+GaYhHesA570FYPec3RthVBmSR9X0/aX3uKk
         GrmoW1AhoZKVdSEnaLXWYtpSzxwUNUcjeOiaO7Yth6z4a9scOGjgmDZU8FXX1POo1ZKg
         MZBWCunP2nXW6doMVAxZ5jpZ3HhGzzot8qbWZtingbiXb9zdmFLONuEjYR3fdelMXOrr
         QPill/qmDlH9WAVejhZLy0ksHPrhCsaJhPGKnTjcL+IpM111Zay/jpH89btmN743SuhB
         93OF4c9WTFlMTNt5gc9E0exWJ004psLQaA2hqLH7fRU2IhrgVBxXGa2DMHGz1OPkdu9T
         +e+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748496213; x=1749101013;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qaN+oF9TY82Jt9dHLarNCVurtUh9xsOGoGQ7ZdqpUPM=;
        b=Joan9tIU+zHH2hK5C4vuV+9YF7gDAGXn02t+aS9tbwDuD7+hdSTWLR1SYinmN1faDU
         wAgWmHt2dGy6eUURpm5MgVG6bEkQj57aK5vLNYE9ZF/jetHWvPevKu99ukkXfnzD3W26
         QNnF+1axx6p4F57CUviZwfduf8v2xX7SnAZHUgLQRpiH7/+jHb+HmbpJ5osj7+/sxVEh
         wBvFs4cDMxsE1j20E3L1DodAElQqKPLfWWVIeouu+jlXE78LUjHd+fMEeGLH9oYh69xI
         w4G+ff0cYbrlYdQ5bJRca37ePz7tMawrlwkCkOuUSLf2C1MS3oen0MqXBq3Dp+cdVyP7
         cimg==
X-Forwarded-Encrypted: i=1; AJvYcCWI/I4xtEnF8nUfgtOtG2f2HMkcxgU+BA0oFWZzzwKPyLoMKZ7y+LheBUsp3CDJxxS/ODb7zoTJc4D8QL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrOj+U32TEZbY7N9nnhQfAU0fRciQ691uLkOSLpujlpC2l1GyJ
	JZAtE7w9htdulLVFEdAsaGY5lsnVfjGdaUs89t65trFUr46FAfi6GIao6PzWD9XI9/53nZLVhSy
	qLMMWgBF0pA==
X-Google-Smtp-Source: AGHT+IHWrSuUHmclcYa3jCDaOU5UkOUrlkqe2H0fLdEtTzge1nWxb7xP/I+0/IpsWJWjW+o1Ebqhf0otOeGT
X-Received: from pjbsf12.prod.google.com ([2002:a17:90b:51cc:b0:311:e7e6:6d4d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c42:b0:312:e9d:3ff2
 with SMTP id 98e67ed59e1d1-3120e9d467fmr4282912a91.7.1748496213260; Wed, 28
 May 2025 22:23:33 -0700 (PDT)
Date: Wed, 28 May 2025 22:23:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529052322.381947-1-irogers@google.com>
Subject: [PATCH v2 1/2] perf machine: Factor creating a "live" machine out of dwarf-unwind
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Howard Chu <howardchu95@gmail.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Michael Petlan <mpetlan@redhat.com>, Andi Kleen <ak@linux.intel.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Factor out for use in places other than the dwarf unwinding tests for
libunwind.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/dwarf-unwind.c | 35 ++++------------------
 tools/perf/util/machine.c       | 53 +++++++++++++++++++++++++++------
 tools/perf/util/machine.h       |  1 +
 3 files changed, 51 insertions(+), 38 deletions(-)

diff --git a/tools/perf/tests/dwarf-unwind.c b/tools/perf/tests/dwarf-unwind.c
index 4803ab2d97ba..525c46b7971a 100644
--- a/tools/perf/tests/dwarf-unwind.c
+++ b/tools/perf/tests/dwarf-unwind.c
@@ -15,7 +15,6 @@
 #include "symbol.h"
 #include "thread.h"
 #include "callchain.h"
-#include "util/synthetic-events.h"
 
 /* For bsearch. We try to unwind functions in shared object. */
 #include <stdlib.h>
@@ -37,24 +36,6 @@
 #define NO_TAIL_CALL_BARRIER __asm__ __volatile__("" : : : "memory");
 #endif
 
-static int mmap_handler(const struct perf_tool *tool __maybe_unused,
-			union perf_event *event,
-			struct perf_sample *sample,
-			struct machine *machine)
-{
-	return machine__process_mmap2_event(machine, event, sample);
-}
-
-static int init_live_machine(struct machine *machine)
-{
-	union perf_event event;
-	pid_t pid = getpid();
-
-	memset(&event, 0, sizeof(event));
-	return perf_event__synthesize_mmap_events(NULL, &event, pid, pid,
-						  mmap_handler, machine, true);
-}
-
 /*
  * We need to keep these functions global, despite the
  * fact that they are used only locally in this object,
@@ -202,8 +183,12 @@ noinline int test__dwarf_unwind(struct test_suite *test __maybe_unused,
 	struct machine *machine;
 	struct thread *thread;
 	int err = -1;
+	pid_t pid = getpid();
 
-	machine = machine__new_host();
+	callchain_param.record_mode = CALLCHAIN_DWARF;
+	dwarf_callchain_users = true;
+
+	machine = machine__new_live(/*kernel_maps=*/true, pid);
 	if (!machine) {
 		pr_err("Could not get machine\n");
 		return -1;
@@ -214,18 +199,10 @@ noinline int test__dwarf_unwind(struct test_suite *test __maybe_unused,
 		return -1;
 	}
 
-	callchain_param.record_mode = CALLCHAIN_DWARF;
-	dwarf_callchain_users = true;
-
-	if (init_live_machine(machine)) {
-		pr_err("Could not init machine\n");
-		goto out;
-	}
-
 	if (verbose > 1)
 		machine__fprintf(machine, stderr);
 
-	thread = machine__find_thread(machine, getpid(), getpid());
+	thread = machine__find_thread(machine, pid, pid);
 	if (!thread) {
 		pr_err("Could not get thread\n");
 		goto out;
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 2531b373f2cf..c5e28d15323f 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -20,6 +20,7 @@
 #include "path.h"
 #include "srcline.h"
 #include "symbol.h"
+#include "synthetic-events.h"
 #include "sort.h"
 #include "strlist.h"
 #include "target.h"
@@ -128,23 +129,57 @@ int machine__init(struct machine *machine, const char *root_dir, pid_t pid)
 	return 0;
 }
 
-struct machine *machine__new_host(void)
+static struct machine *__machine__new_host(bool kernel_maps)
 {
 	struct machine *machine = malloc(sizeof(*machine));
 
-	if (machine != NULL) {
-		machine__init(machine, "", HOST_KERNEL_ID);
+	if (!machine)
+		return NULL;
 
-		if (machine__create_kernel_maps(machine) < 0)
-			goto out_delete;
+	machine__init(machine, "", HOST_KERNEL_ID);
 
-		machine->env = &perf_env;
+	if (kernel_maps && machine__create_kernel_maps(machine) < 0) {
+		free(machine);
+		return NULL;
 	}
+	machine->env = &perf_env;
+	return machine;
+}
+
+struct machine *machine__new_host(void)
+{
+	return __machine__new_host(/*kernel_maps=*/true);
+}
+
+static int mmap_handler(const struct perf_tool *tool __maybe_unused,
+			union perf_event *event,
+			struct perf_sample *sample,
+			struct machine *machine)
+{
+	return machine__process_mmap2_event(machine, event, sample);
+}
 
+static int machine__init_live(struct machine *machine, pid_t pid)
+{
+	union perf_event event;
+
+	memset(&event, 0, sizeof(event));
+	return perf_event__synthesize_mmap_events(NULL, &event, pid, pid,
+						  mmap_handler, machine, true);
+}
+
+struct machine *machine__new_live(bool kernel_maps, pid_t pid)
+{
+	struct machine *machine = __machine__new_host(kernel_maps);
+
+	if (!machine)
+		return NULL;
+
+	if (machine__init_live(machine, pid)) {
+		machine__delete(machine);
+		return NULL;
+	}
 	return machine;
-out_delete:
-	free(machine);
-	return NULL;
 }
 
 struct machine *machine__new_kallsyms(void)
diff --git a/tools/perf/util/machine.h b/tools/perf/util/machine.h
index b56abec84fed..180b369c366c 100644
--- a/tools/perf/util/machine.h
+++ b/tools/perf/util/machine.h
@@ -171,6 +171,7 @@ void machines__set_comm_exec(struct machines *machines, bool comm_exec);
 
 struct machine *machine__new_host(void);
 struct machine *machine__new_kallsyms(void);
+struct machine *machine__new_live(bool kernel_maps, pid_t pid);
 int machine__init(struct machine *machine, const char *root_dir, pid_t pid);
 void machine__exit(struct machine *machine);
 void machine__delete_threads(struct machine *machine);
-- 
2.49.0.1204.g71687c7c1d-goog

