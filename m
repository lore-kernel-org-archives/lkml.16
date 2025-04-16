Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4893C21C193
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820979; cv=none; b=UpPuPgckD7tfndi6Er9V89d7z88WsDKWuEGHHBVIwh27zWsH+E4G14culAJtF6R6zeLoS4hfPbA3HUUxQCO1114YpGa9f/Fct8rpzzUj7SoO6B6MnZncqS4XwPvUVhmLQi5/mFwWYpfOcotjPhGwh2sI9vx5iVH7eBGJYw33NLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820979; c=relaxed/simple;
	bh=lt2/Wz0SjlzjDIBrfeAz7OUWJL3HzSiG8nn58ykLWHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxKFiuo6PAUkHW7X9ugUmUrJAAz/qoCJ/JdlvSJG3EEnlWo6sXa823LClEsi1nxp8SH9PBxhOAMJ56zxJS3kEwaxDvXqIH4V2A9+IhFyFt0IYdF0lsgC+5RFPtiaeAfpIitaMWUOzYwsyKeLsB+3ZSQfsoN5NM3MrVjDeI+5YqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ihgWRmF1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HMHHdQQz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ihgWRmF1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HMHHdQQz"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744820974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lpOZgZc3132Vq4fULyCZrzofdl0twCFBC2bsdRhjlfw=;
	b=ihgWRmF1+gQpnKUExmKZPIueCgibq0kOzoLv51TnQnW2xlR1yt6T4EBqmggblVU+NWroBQ
	hUG58d3Ptx8mx2XmSgljG2/7yz25KVZGo0MQzURarq2xpebJ9NYPh+iPdawGP3VjQnS9fz
	pcXENi2Hvpwx3yctj7ZLaBtrJjzgRe3bQQ8Vca+30C3Li07ocZ1mO1G9ztA3s9uws42ZDd
	5Vv8yJjxSArYCRavjsIn5XluETuz9g7Z1dGDZ2qUt3g6+4+1jk4AxUetYenqeQRK/FmpIC
	d6lv01wD9+Gg0rCidueFFDICtdJ4xFfFtv4Z6Lf2mGt53M3gUUMQ6J2FdE13Ww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744820974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lpOZgZc3132Vq4fULyCZrzofdl0twCFBC2bsdRhjlfw=;
	b=HMHHdQQz4N38yU5YQDpJnCujHuh1RA1tnBn02XZ202b3CTdXPAp8codo4TEOYIIPe8SaDa
	/vrhQfJXBCiuUFAw==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v12 21/21] selftests/futex: Add futex_numa_mpol
Date: Wed, 16 Apr 2025 18:29:21 +0200
Message-ID: <20250416162921.513656-22-bigeasy@linutronix.de>
In-Reply-To: <20250416162921.513656-1-bigeasy@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Test the basic functionality for the NUMA and MPOL flags:
- FUTEX2_NUMA should take the NUMA node which is after the uaddr
  and use it.
- Only update the node if FUTEX_NO_NODE was set by the user
- FUTEX2_MPOL should use the memory based on the policy. I attempted to
  set the node with mbind() and then use this with MPOL but this fails
  and futex falls back to the default node for the current CPU.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 .../selftests/futex/functional/.gitignore     |   1 +
 .../selftests/futex/functional/Makefile       |   3 +-
 .../futex/functional/futex_numa_mpol.c        | 232 ++++++++++++++++++
 .../testing/selftests/futex/functional/run.sh |   3 +
 .../selftests/futex/include/futex2test.h      |  34 +++
 5 files changed, 272 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/futex/functional/futex_numa_mpo=
l.c

diff --git a/tools/testing/selftests/futex/functional/.gitignore b/tools/te=
sting/selftests/futex/functional/.gitignore
index d37ae7c6e879e..7b24ae89594a9 100644
--- a/tools/testing/selftests/futex/functional/.gitignore
+++ b/tools/testing/selftests/futex/functional/.gitignore
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+futex_numa_mpol
 futex_priv_hash
 futex_requeue
 futex_requeue_pi
diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/test=
ing/selftests/futex/functional/Makefile
index 67d9e16d8a1f8..a4881fd2cd540 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 INCLUDES :=3D -I../include -I../../ $(KHDR_INCLUDES)
 CFLAGS :=3D $(CFLAGS) -g -O2 -Wall -pthread $(INCLUDES) $(KHDR_INCLUDES)
-LDLIBS :=3D -lpthread -lrt
+LDLIBS :=3D -lpthread -lrt -lnuma
=20
 LOCAL_HDRS :=3D \
 	../include/futextest.h \
@@ -18,6 +18,7 @@ TEST_GEN_PROGS :=3D \
 	futex_wait \
 	futex_requeue \
 	futex_priv_hash \
+	futex_numa_mpol \
 	futex_waitv
=20
 TEST_PROGS :=3D run.sh
diff --git a/tools/testing/selftests/futex/functional/futex_numa_mpol.c b/t=
ools/testing/selftests/futex/functional/futex_numa_mpol.c
new file mode 100644
index 0000000000000..30302691303f0
--- /dev/null
+++ b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+ */
+
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <pthread.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <numa.h>
+#include <numaif.h>
+
+#include <linux/futex.h>
+#include <sys/mman.h>
+
+#include "logging.h"
+#include "futextest.h"
+#include "futex2test.h"
+
+#define MAX_THREADS	64
+
+static pthread_barrier_t barrier_main;
+static pthread_t threads[MAX_THREADS];
+
+struct thread_args {
+	void *futex_ptr;
+	unsigned int flags;
+	int result;
+};
+
+static struct thread_args thread_args[MAX_THREADS];
+
+#ifndef FUTEX_NO_NODE
+#define FUTEX_NO_NODE (-1)
+#endif
+
+#ifndef FUTEX2_MPOL
+#define FUTEX2_MPOL	0x08
+#endif
+
+static void *thread_lock_fn(void *arg)
+{
+	struct thread_args *args =3D arg;
+	int ret;
+
+	pthread_barrier_wait(&barrier_main);
+	ret =3D futex2_wait2(args->futex_ptr, 0, args->flags, NULL, 0);
+	args->result =3D ret;
+	return NULL;
+}
+
+static void create_max_threads(void *futex_ptr)
+{
+	int i, ret;
+
+	for (i =3D 0; i < MAX_THREADS; i++) {
+		thread_args[i].futex_ptr =3D futex_ptr;
+		thread_args[i].flags =3D FUTEX2_SIZE_U32 | FUTEX_PRIVATE_FLAG | FUTEX2_N=
UMA;
+		thread_args[i].result =3D 0;
+		ret =3D pthread_create(&threads[i], NULL, thread_lock_fn, &thread_args[i=
]);
+		if (ret) {
+			error("pthread_create failed\n", errno);
+			exit(1);
+		}
+	}
+}
+
+static void join_max_threads(void)
+{
+	int i, ret;
+
+	for (i =3D 0; i < MAX_THREADS; i++) {
+		ret =3D pthread_join(threads[i], NULL);
+		if (ret) {
+			error("pthread_join failed for thread %d\n", errno, i);
+			exit(1);
+		}
+	}
+}
+
+static void __test_futex(void *futex_ptr, int must_fail, unsigned int fute=
x_flags)
+{
+	int to_wake, ret, i, need_exit =3D 0;
+
+	pthread_barrier_init(&barrier_main, NULL, MAX_THREADS + 1);
+	create_max_threads(futex_ptr);
+	pthread_barrier_wait(&barrier_main);
+	to_wake =3D MAX_THREADS;
+
+	do {
+		ret =3D futex2_wake(futex_ptr, to_wake, futex_flags);
+		if (must_fail) {
+			if (ret < 0)
+				break;
+			fail("Should fail, but didn't\n");
+			exit(1);
+		}
+		if (ret < 0) {
+			error("Failed futex2_wake(%d)\n", errno, to_wake);
+			exit(1);
+		}
+		if (!ret)
+			usleep(50);
+		to_wake -=3D ret;
+
+	} while (to_wake);
+	join_max_threads();
+
+	for (i =3D 0; i < MAX_THREADS; i++) {
+		if (must_fail && thread_args[i].result !=3D -1) {
+			fail("Thread %d should fail but succeeded (%d)\n", i, thread_args[i].re=
sult);
+			need_exit =3D 1;
+		}
+		if (!must_fail && thread_args[i].result !=3D 0) {
+			fail("Thread %d failed (%d)\n", i, thread_args[i].result);
+			need_exit =3D 1;
+		}
+	}
+	if (need_exit)
+		exit(1);
+}
+
+static void test_futex(void *futex_ptr, int must_fail)
+{
+	__test_futex(futex_ptr, must_fail, FUTEX2_SIZE_U32 | FUTEX_PRIVATE_FLAG |=
 FUTEX2_NUMA);
+}
+
+static void test_futex_mpol(void *futex_ptr, int must_fail)
+{
+	__test_futex(futex_ptr, must_fail, FUTEX2_SIZE_U32 | FUTEX_PRIVATE_FLAG |=
 FUTEX2_NUMA | FUTEX2_MPOL);
+}
+
+static void usage(char *prog)
+{
+	printf("Usage: %s\n", prog);
+	printf("  -c    Use color\n");
+	printf("  -h    Display this help message\n");
+	printf("  -v L  Verbosity level: %d=3DQUIET %d=3DCRITICAL %d=3DINFO\n",
+	       VQUIET, VCRITICAL, VINFO);
+}
+
+int main(int argc, char *argv[])
+{
+	struct futex32_numa *futex_numa;
+	int mem_size, i;
+	void *futex_ptr;
+	char c;
+
+	while ((c =3D getopt(argc, argv, "chv:")) !=3D -1) {
+		switch (c) {
+		case 'c':
+			log_color(1);
+			break;
+		case 'h':
+			usage(basename(argv[0]));
+			exit(0);
+			break;
+		case 'v':
+			log_verbosity(atoi(optarg));
+			break;
+		default:
+			usage(basename(argv[0]));
+			exit(1);
+		}
+	}
+
+	mem_size =3D sysconf(_SC_PAGE_SIZE);
+	futex_ptr =3D mmap(NULL, mem_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | =
MAP_ANONYMOUS, 0, 0);
+	if (futex_ptr =3D=3D MAP_FAILED) {
+		error("mmap() for %d bytes failed\n", errno, mem_size);
+		return 1;
+	}
+	futex_numa =3D futex_ptr;
+
+	info("Regular test\n");
+	futex_numa->futex =3D 0;
+	futex_numa->numa =3D FUTEX_NO_NODE;
+	test_futex(futex_ptr, 0);
+
+	if (futex_numa->numa =3D=3D FUTEX_NO_NODE) {
+		fail("NUMA node is left unitiliazed\n");
+		return 1;
+	}
+
+	info("Memory too small\n");
+	test_futex(futex_ptr + mem_size - 4, 1);
+
+	info("Memory out of range\n");
+	test_futex(futex_ptr + mem_size, 1);
+
+	futex_numa->numa =3D FUTEX_NO_NODE;
+	mprotect(futex_ptr, mem_size, PROT_READ);
+	info("Memory, RO\n");
+	test_futex(futex_ptr, 1);
+
+	mprotect(futex_ptr, mem_size, PROT_NONE);
+	info("Memory, no access\n");
+	test_futex(futex_ptr, 1);
+
+	mprotect(futex_ptr, mem_size, PROT_READ | PROT_WRITE);
+	info("Memory back to RW\n");
+	test_futex(futex_ptr, 0);
+
+	/* MPOL test. Does not work as expected */
+	for (i =3D 0; i < 4; i++) {
+		unsigned long nodemask;
+		int ret;
+
+		nodemask =3D 1 << i;
+		ret =3D mbind(futex_ptr, mem_size, MPOL_BIND, &nodemask,
+			    sizeof(nodemask) * 8, 0);
+		if (ret =3D=3D 0) {
+			info("Node %d test\n", i);
+			futex_numa->futex =3D 0;
+			futex_numa->numa =3D FUTEX_NO_NODE;
+
+			ret =3D futex2_wake(futex_ptr, 0, FUTEX2_SIZE_U32 | FUTEX_PRIVATE_FLAG =
| FUTEX2_NUMA | FUTEX2_MPOL);
+			if (ret < 0)
+				error("Failed to wake 0 with MPOL.\n", errno);
+			if (0)
+				test_futex_mpol(futex_numa, 0);
+			if (futex_numa->numa !=3D i) {
+				fail("Returned NUMA node is %d expected %d\n",
+				     futex_numa->numa, i);
+			}
+		}
+	}
+	return 0;
+}
diff --git a/tools/testing/selftests/futex/functional/run.sh b/tools/testin=
g/selftests/futex/functional/run.sh
index f0f0d2b683d7e..81739849f2994 100755
--- a/tools/testing/selftests/futex/functional/run.sh
+++ b/tools/testing/selftests/futex/functional/run.sh
@@ -86,3 +86,6 @@ echo
 echo
 ./futex_priv_hash $COLOR
 ./futex_priv_hash -g $COLOR
+
+echo
+./futex_numa_mpol $COLOR
diff --git a/tools/testing/selftests/futex/include/futex2test.h b/tools/tes=
ting/selftests/futex/include/futex2test.h
index 9d305520e849b..b664e8f92bfd7 100644
--- a/tools/testing/selftests/futex/include/futex2test.h
+++ b/tools/testing/selftests/futex/include/futex2test.h
@@ -8,6 +8,11 @@
=20
 #define u64_to_ptr(x) ((void *)(uintptr_t)(x))
=20
+struct futex32_numa {
+	futex_t futex;
+	futex_t numa;
+};
+
 /**
  * futex_waitv - Wait at multiple futexes, wake on any
  * @waiters:    Array of waiters
@@ -20,3 +25,32 @@ static inline int futex_waitv(volatile struct futex_wait=
v *waiters, unsigned lon
 {
 	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clocki=
d);
 }
+
+static inline int futex2_wait(volatile struct futex_waitv *waiters, unsign=
ed long nr_waiters,
+			      unsigned long flags, struct timespec *timo, clockid_t clockid)
+{
+	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clocki=
d);
+}
+
+/*
+ * futex_wait2() - block on uaddr with optional timeout
+ * @val:	Expected value
+ * @flags:	FUTEX2 flags
+ * @timeout:	Relative timeout
+ * @clockid:	Clock id for the timeout
+ */
+static inline int futex2_wait2(void *uaddr, long val, unsigned int flags,
+			      struct timespec *timeout, clockid_t clockid)
+{
+	return syscall(__NR_futex_wait, uaddr, val, 1, flags, timeout, clockid);
+}
+
+/*
+ * futex2_wake() - Wake a number of futexes
+ * @nr:		Number of threads to wake at most
+ * @flags:	FUTEX2 flags
+ */
+static inline int futex2_wake(void *uaddr, int nr, unsigned int flags)
+{
+	return syscall(__NR_futex_wake, uaddr, 1, nr, flags);
+}
--=20
2.49.0

