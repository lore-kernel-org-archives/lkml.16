Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE28238174
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817561; cv=none; b=skV4d6wK6KCYTDr5ytZPQGvbbjlxoPiInh7K9M+yhJPvikS4upLf/UyETrYwX0ArEhCArHBum1oyds2y4bPl28CqoD4vAE6dpqOBIB8LLAvX4cKtktOUhrCes5yYKdfb71FeH3rBUe2OPSbz0e8opHq1PTqG8OnSR9gIEFe3OCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817561; c=relaxed/simple;
	bh=PD46+ourdXDcszKYFR2bVHsQctHZM0RLmWsbQVapegI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D7k7ntas0jVs1mzl7QsSEAcEsdHlEh3XDOgRArLKmMkUpaqfq4cNyplR3pf6r2vnnlxxQEUsUtBhSC50D6PXbpcb3zbnVUJ3mIbyChvigz/Ro14bOx+LTnXU2PG3UYq4nEaFlULzSQ8SRgNqqAU0o00Pcc8ioHXddFT2Q5U81Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w2JVM/O4; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w2JVM/O4"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso40827885e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747817558; x=1748422358; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WHj8OpGfndLIKKcorEWM8n6SM67qF6VgisoF/dxjdy4=;
        b=w2JVM/O4iqm+ROVS+0S8saBRPo8czB5haJSKpA1pTS/nZ+1A+Me/mwCkLlk/YX1oyw
         n0iJ7eKjrYn64fTbe79+o9lB1nTM9iVeTuT63THtLlwi9rNE4q+GX7wHNiC2WxuZeCe2
         fAcq0b8DebGA9b88sHAh3bTi/pt5e0t5YEoEX0YDQCIPB0kOk0dED5+7V+BhwrMKuMu0
         djbbleyinVChJSHqKuMM4KtRv8facIbE65TXKg1/hWSbvGQ/CLvqwTJJnTDk18uXkpYV
         gK3uQk4EYYC3itbItSV+0l2sS2W+vhdjWPbDMlU35IZXnSW87mwnmpJeuRfaGeLDY8li
         4SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747817558; x=1748422358;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHj8OpGfndLIKKcorEWM8n6SM67qF6VgisoF/dxjdy4=;
        b=wA2Chz3g1UgMx87urEmiMYoYsVWDSwAuNmzbd/zV+vE09Ln2i5qCcS4lwuZOQuY52v
         jI9XD8jr2CCCNHodUt1dM9JizAE8PmGi+2e881l+OTVZ66KDqlkFD3Qu+36mSvICKNvL
         tyUD1YUsvn0CLSidajYm5CGNT2MGf3DCv405X+NJ+fUoODdnsAg3UQtlYcRZbX8E5mD/
         kmhcsJZyR0KyBqf6q2Zdj3H12eacSc/h7Vxy7kg+DpcicdzV76GfBZwgM+9gXktiHp59
         yxQcgmk6oUfDdBBTzpcg88+DktEEhOa0sOao8B9w5ry51HenxEwfHahF7CWbKndD3FNy
         IdHA==
X-Forwarded-Encrypted: i=1; AJvYcCV2kQdIPXzTQUSnNotuUim5N40Hpu2gL5NDtcLjdm5qXE9FpDMSnwJ6DleqLUExgWGxq7IxVyhOTpOELQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMJRAcFNb32YUPGqUx4QzGCclK0EaUUR/5wYtOfmga8Yd488Tk
	pqphpa/IwyN1EefU/DB1Xv+B4nvzUQSM7CA4yCQYfk3arACeZM8vycOsXxDu7yKsqX3BofXU89x
	O++xXduyCiw==
X-Google-Smtp-Source: AGHT+IHDJtY/2c6fXiE2M6SJD4QN66toVQpvNWxET8tGnEUZy7qObhe8e+RKYr/Jiu/2SWeO2//H748sAcwK
X-Received: from wmbdt15.prod.google.com ([2002:a05:600c:630f:b0:43c:f8ae:4d6c])
 (user=dvyukov job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f42:b0:43b:cb12:ba6d
 with SMTP id 5b1f17b1804b1-442fd60b543mr196886765e9.3.1747817557800; Wed, 21
 May 2025 01:52:37 -0700 (PDT)
Date: Wed, 21 May 2025 10:47:49 +0200
In-Reply-To: <cover.1747817128.git.dvyukov@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747817128.git.dvyukov@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <0dc8992f3fe4a76d7fdd73f553236a570dc5a5eb.1747817128.git.dvyukov@google.com>
Subject: [PATCH v7 4/4] selftests/rseq: Add test for rseq+pkeys
From: Dmitry Vyukov <dvyukov@google.com>
To: mathieu.desnoyers@efficios.com, peterz@infradead.org, boqun.feng@gmail.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, aruna.ramakrishna@oracle.com, 
	elver@google.com
Cc: Dmitry Vyukov <dvyukov@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a test that ensures that PKEY-protected struct rseq_cs
works and does not lead to process kills.

Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Fixes: d7822b1e24f2 ("rseq: Introduce restartable sequences system call")

---
Changes in v7:
 - Add rseq_unregister_current_thread() call in the test

Changes in v5:
 - Use static for variables/functions
 - Use RSEQ_READ/WRITE_ONCE instead of volatile

Changes in v4:
 - Added Fixes tag

Changes in v3:
 - added Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
 - rework the test to work when only pkey 0 is supported for rseq

Changes in v2:
 - change test to install protected rseq_cs instead of rseq
---
 tools/testing/selftests/rseq/Makefile    |   2 +-
 tools/testing/selftests/rseq/pkey_test.c | 101 +++++++++++++++++++++++
 tools/testing/selftests/rseq/rseq.h      |   1 +
 3 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
index 0d0a5fae59547..e5fd819011582 100644
--- a/tools/testing/selftests/rseq/Makefile
+++ b/tools/testing/selftests/rseq/Makefile
@@ -17,7 +17,7 @@ OVERRIDE_TARGETS = 1
 TEST_GEN_PROGS = basic_test basic_percpu_ops_test basic_percpu_ops_mm_cid_test param_test \
 		param_test_benchmark param_test_compare_twice param_test_mm_cid \
 		param_test_mm_cid_benchmark param_test_mm_cid_compare_twice \
-		syscall_errors_test
+		syscall_errors_test pkey_test
 
 TEST_GEN_PROGS_EXTENDED = librseq.so
 
diff --git a/tools/testing/selftests/rseq/pkey_test.c b/tools/testing/selftests/rseq/pkey_test.c
new file mode 100644
index 0000000000000..5dc214cd7a1e6
--- /dev/null
+++ b/tools/testing/selftests/rseq/pkey_test.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: LGPL-2.1
+/*
+ * Ensure that rseq works when rseq data is inaccessible due to PKEYs.
+ */
+
+#define _GNU_SOURCE
+#include <err.h>
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <ucontext.h>
+#include <unistd.h>
+
+#include "rseq.h"
+#include "rseq-abi.h"
+
+static int pkey;
+static ucontext_t ucp0, ucp1;
+
+static void coroutine(void)
+{
+	int i, orig_pk0, old_pk0, old_pk1, pk0, pk1;
+	/*
+	 * When we disable access to pkey 0, globals and TLS become
+	 * inaccessible too, so we need to tread carefully.
+	 * Pkey is global so we need to copy it onto the stack.
+	 */
+	int pk = RSEQ_READ_ONCE(pkey);
+	struct timespec ts;
+
+	orig_pk0 = pkey_get(0);
+	if (pkey_set(0, PKEY_DISABLE_ACCESS))
+		err(1, "pkey_set failed");
+	old_pk0 = pkey_get(0);
+	old_pk1 = pkey_get(pk);
+
+	/*
+	 * Prevent compiler from initializing it by loading a 16-global.
+	 */
+	RSEQ_WRITE_ONCE(ts.tv_sec, 0);
+	RSEQ_WRITE_ONCE(ts.tv_nsec, 10 * 1000);
+	/*
+	 * If the kernel misbehaves, context switches in the following loop
+	 * will terminate the process with SIGSEGV.
+	 * Trigger preemption w/o accessing TLS.
+	 * Note that glibc's usleep touches errno always.
+	 */
+	for (i = 0; i < 10; i++)
+		syscall(SYS_clock_nanosleep, CLOCK_MONOTONIC, 0, &ts, NULL);
+
+	pk0 = pkey_get(0);
+	pk1 = pkey_get(pk);
+	if (pkey_set(0, orig_pk0))
+		err(1, "pkey_set failed");
+
+	/*
+	 * Ensure that the kernel has restored the previous value of pkeys
+	 * register after changing them.
+	 */
+	if (old_pk0 != pk0)
+		errx(1, "pkey 0 changed %d->%d", old_pk0, pk0);
+	if (old_pk1 != pk1)
+		errx(1, "pkey 1 changed %d->%d", old_pk1, pk1);
+
+	swapcontext(&ucp1, &ucp0);
+	abort();
+}
+
+int main(int argc, char **argv)
+{
+	pkey = pkey_alloc(0, 0);
+	if (pkey == -1) {
+		printf("[SKIP]\tKernel does not support PKEYs: %s\n",
+			strerror(errno));
+		return 0;
+	}
+
+	if (rseq_register_current_thread())
+		err(1, "rseq_register_current_thread failed");
+
+	if (getcontext(&ucp1))
+		err(1, "getcontext failed");
+	ucp1.uc_stack.ss_size = getpagesize() * 4;
+	ucp1.uc_stack.ss_sp = mmap(NULL, ucp1.uc_stack.ss_size,
+		PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
+	if (ucp1.uc_stack.ss_sp == MAP_FAILED)
+		err(1, "mmap failed");
+	if (pkey_mprotect(ucp1.uc_stack.ss_sp, ucp1.uc_stack.ss_size,
+			PROT_READ | PROT_WRITE, pkey))
+		err(1, "pkey_mprotect failed");
+	makecontext(&ucp1, coroutine, 0);
+	if (swapcontext(&ucp0, &ucp1))
+		err(1, "swapcontext failed");
+
+	if (rseq_unregister_current_thread())
+		err(1, "rseq_unregister_current_thread failed");
+	return 0;
+}
diff --git a/tools/testing/selftests/rseq/rseq.h b/tools/testing/selftests/rseq/rseq.h
index f51a5fdb04443..cdb34cbad1adb 100644
--- a/tools/testing/selftests/rseq/rseq.h
+++ b/tools/testing/selftests/rseq/rseq.h
@@ -8,6 +8,7 @@
 #ifndef RSEQ_H
 #define RSEQ_H
 
+#include <assert.h>
 #include <stdint.h>
 #include <stdbool.h>
 #include <pthread.h>
-- 
2.49.0.1143.g0be31eac6b-goog

