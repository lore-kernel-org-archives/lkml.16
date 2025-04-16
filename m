Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B1E212F9A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820979; cv=none; b=Y0oHa0Osc1EJiXD/ACaFt10IWD5qKOjo3yqfWCHPTIt9Nva/nSgnXLpdHnE83otA1Mlysr3ye2iFlDg0QKOxU7ZWkZ+Ds7m68ohzdabg2rcD1y9ZZt09oOwE/kvK0QnZmQ/VY3VodFDWaCOOZcyObSU3BxTVdJCfdBqw6L9Cmu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820979; c=relaxed/simple;
	bh=LejZZ2spwtKIitLCsmp0xqCJ9M7wTNnxW8YjPik6nE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bOCwR/t7Sr6iVaOCTj2BdEoAe/8qhkndbrA5SMS1pOQmKKIvxId6E+vny91pTOpnujGvTRSm3EEgLfh5hPY77gpZHL3emhW1y6f+aihvkK5LuYBsT6gX7ABumq28lARE43WK2xCEf+yYTTF/UX0U+At7VIHDh99OAG+R3KtCRbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qQe0eMdf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/Mt8oejq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qQe0eMdf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/Mt8oejq"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744820974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTntC0IAr7OMmtpTw+HekjeIoPDIhXwXUNcMKwKnyz8=;
	b=qQe0eMdfCF80WPHou54JiBKl1bMnw9vye1okjYvxnr4YqU8uL51/Hu9ShXBRlFMx2yJtg5
	tr+tGX9y3NvBnOh41u0w5r/F6zGRUFS6xsKlMbwZ2oYS3znnNrmmMxy2dIKvI4q9WbA+B8
	GBfWmw9CqIbrigjz6CLwDQt6vIFRcg+2R2HLhfX5A2WkBt8jo9Hz6JixNCmpSJ7hvApYGa
	MdlK7bsNPCIbx9UzWEmlCDsv6Zz/4yDkpBacwh14lkAxtnUqiF2zh17+4sdDxLyiuJf8+A
	r9eB36nExxq/Q7Ef97J6KXz1kWpfJipgTfi+aNNM25XRY4DI0EONQtWQTmx4DQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744820974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTntC0IAr7OMmtpTw+HekjeIoPDIhXwXUNcMKwKnyz8=;
	b=/Mt8oejqchbpsPGnQvl1erzIzcsIjQX1QO72Eg0fkyf/j4v0EAJMJdKvqxFClj5csLzcR1
	DYFH0mTtZ2bcsDDg==
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
Subject: [PATCH v12 20/21] selftests/futex: Add futex_priv_hash
Date: Wed, 16 Apr 2025 18:29:20 +0200
Message-ID: <20250416162921.513656-21-bigeasy@linutronix.de>
In-Reply-To: <20250416162921.513656-1-bigeasy@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Test the basic functionality of the private hash:
- Upon start, with no threads there is no private hash.
- The first thread initializes the private hash.
- More than four threads will increase the size of the private hash if
  the system has more than 16 CPUs online.
- Once the user sets the size of private hash, auto scaling is disabled.
- The user is only allowed to use numbers to the power of two.
- The user may request the global or make the hash immutable.
- Once the global hash has been set or the hash has been made immutable,
  further changes are not allowed.
- Futex operations should work the whole time. It must be possible to
  hold a lock, such a PI initialised mutex, during the resize operation.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 .../selftests/futex/functional/.gitignore     |   5 +-
 .../selftests/futex/functional/Makefile       |   1 +
 .../futex/functional/futex_priv_hash.c        | 315 ++++++++++++++++++
 .../testing/selftests/futex/functional/run.sh |   4 +
 4 files changed, 323 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/futex/functional/futex_priv_has=
h.c

diff --git a/tools/testing/selftests/futex/functional/.gitignore b/tools/te=
sting/selftests/futex/functional/.gitignore
index fbcbdb6963b3a..d37ae7c6e879e 100644
--- a/tools/testing/selftests/futex/functional/.gitignore
+++ b/tools/testing/selftests/futex/functional/.gitignore
@@ -1,11 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
+futex_priv_hash
+futex_requeue
 futex_requeue_pi
 futex_requeue_pi_mismatched_ops
 futex_requeue_pi_signal_restart
+futex_wait
 futex_wait_private_mapped_file
 futex_wait_timeout
 futex_wait_uninitialized_heap
 futex_wait_wouldblock
-futex_wait
-futex_requeue
 futex_waitv
diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/test=
ing/selftests/futex/functional/Makefile
index f79f9bac7918b..67d9e16d8a1f8 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -17,6 +17,7 @@ TEST_GEN_PROGS :=3D \
 	futex_wait_private_mapped_file \
 	futex_wait \
 	futex_requeue \
+	futex_priv_hash \
 	futex_waitv
=20
 TEST_PROGS :=3D run.sh
diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/t=
ools/testing/selftests/futex/functional/futex_priv_hash.c
new file mode 100644
index 0000000000000..4d37650baa192
--- /dev/null
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -0,0 +1,315 @@
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
+
+#include <linux/prctl.h>
+#include <sys/prctl.h>
+
+#include "logging.h"
+
+#define MAX_THREADS	64
+
+static pthread_barrier_t barrier_main;
+static pthread_mutex_t global_lock;
+static pthread_t threads[MAX_THREADS];
+static int counter;
+
+#ifndef PR_FUTEX_HASH
+#define PR_FUTEX_HASH			78
+# define PR_FUTEX_HASH_SET_SLOTS	1
+# define PR_FUTEX_HASH_GET_SLOTS	2
+# define PR_FUTEX_HASH_GET_IMMUTABLE	3
+#endif
+
+static int futex_hash_slots_set(unsigned int slots, int immutable)
+{
+	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, slots, immutable);
+}
+
+static int futex_hash_slots_get(void)
+{
+	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_SLOTS);
+}
+
+static int futex_hash_immutable_get(void)
+{
+	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_IMMUTABLE);
+}
+
+static void futex_hash_slots_set_verify(int slots)
+{
+	int ret;
+
+	ret =3D futex_hash_slots_set(slots, 0);
+	if (ret !=3D 0) {
+		error("Failed to set slots to %d\n", errno, slots);
+		exit(1);
+	}
+	ret =3D futex_hash_slots_get();
+	if (ret !=3D slots) {
+		error("Set %d slots but PR_FUTEX_HASH_GET_SLOTS returns: %d\n",
+		       errno, slots, ret);
+		exit(1);
+	}
+}
+
+static void futex_hash_slots_set_must_fail(int slots, int immutable)
+{
+	int ret;
+
+	ret =3D futex_hash_slots_set(slots, immutable);
+	if (ret < 0)
+		return;
+
+	fail("futex_hash_slots_set(%d, %d) expected to fail but succeeded.\n",
+	       slots, immutable);
+	exit(1);
+}
+
+static void *thread_return_fn(void *arg)
+{
+	return NULL;
+}
+
+static void *thread_lock_fn(void *arg)
+{
+	pthread_barrier_wait(&barrier_main);
+
+	pthread_mutex_lock(&global_lock);
+	counter++;
+	usleep(20);
+	pthread_mutex_unlock(&global_lock);
+	return NULL;
+}
+
+static void create_max_threads(void *(*thread_fn)(void *))
+{
+	int i, ret;
+
+	for (i =3D 0; i < MAX_THREADS; i++) {
+		ret =3D pthread_create(&threads[i], NULL, thread_fn, NULL);
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
+static void usage(char *prog)
+{
+	printf("Usage: %s\n", prog);
+	printf("  -c    Use color\n");
+	printf("  -g    Test global hash instead intead local immutable \n");
+	printf("  -h    Display this help message\n");
+	printf("  -v L  Verbosity level: %d=3DQUIET %d=3DCRITICAL %d=3DINFO\n",
+	       VQUIET, VCRITICAL, VINFO);
+}
+
+int main(int argc, char *argv[])
+{
+	int futex_slots1, futex_slotsn, online_cpus;
+	pthread_mutexattr_t mutex_attr_pi;
+	int use_global_hash =3D 0;
+	int ret;
+	char c;
+
+	while ((c =3D getopt(argc, argv, "cghv:")) !=3D -1) {
+		switch (c) {
+		case 'c':
+			log_color(1);
+			break;
+		case 'g':
+			use_global_hash =3D 1;
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
+
+	ret =3D pthread_mutexattr_init(&mutex_attr_pi);
+	ret |=3D pthread_mutexattr_setprotocol(&mutex_attr_pi, PTHREAD_PRIO_INHER=
IT);
+	ret |=3D pthread_mutex_init(&global_lock, &mutex_attr_pi);
+	if (ret !=3D 0) {
+		fail("Failed to initialize pthread mutex.\n");
+		return 1;
+	}
+
+	/* First thread, expect to be 0, not yet initialized */
+	ret =3D futex_hash_slots_get();
+	if (ret !=3D 0) {
+		error("futex_hash_slots_get() failed: %d\n", errno, ret);
+		return 1;
+	}
+	ret =3D futex_hash_immutable_get();
+	if (ret !=3D 0) {
+		error("futex_hash_immutable_get() failed: %d\n", errno, ret);
+		return 1;
+	}
+
+	ret =3D pthread_create(&threads[0], NULL, thread_return_fn, NULL);
+	if (ret !=3D 0) {
+		error("pthread_create() failed: %d\n", errno, ret);
+		return 1;
+	}
+	ret =3D pthread_join(threads[0], NULL);
+	if (ret !=3D 0) {
+		error("pthread_join() failed: %d\n", errno, ret);
+		return 1;
+	}
+	/* First thread, has to initialiaze private hash */
+	futex_slots1 =3D futex_hash_slots_get();
+	if (futex_slots1 <=3D 0) {
+		fail("Expected > 0 hash buckets, got: %d\n", futex_slots1);
+		return 1;
+	}
+
+	online_cpus =3D sysconf(_SC_NPROCESSORS_ONLN);
+	ret =3D pthread_barrier_init(&barrier_main, NULL, MAX_THREADS + 1);
+	if (ret !=3D 0) {
+		error("pthread_barrier_init failed.\n", errno);
+		return 1;
+	}
+
+	ret =3D pthread_mutex_lock(&global_lock);
+	if (ret !=3D 0) {
+		error("pthread_mutex_lock failed.\n", errno);
+		return 1;
+	}
+
+	counter =3D 0;
+	create_max_threads(thread_lock_fn);
+	pthread_barrier_wait(&barrier_main);
+
+	/*
+	 * The current default size of hash buckets is 16. The auto increase
+	 * works only if more than 16 CPUs are available.
+	 */
+	if (online_cpus > 16) {
+		futex_slotsn =3D futex_hash_slots_get();
+		if (futex_slotsn < 0 || futex_slots1 =3D=3D futex_slotsn) {
+			fail("Expected increase of hash buckets but got: %d -> %d\n",
+			      futex_slots1, futex_slotsn);
+			info("Online CPUs: %d\n", online_cpus);
+			return 1;
+		}
+	}
+	ret =3D pthread_mutex_unlock(&global_lock);
+
+	/* Once the user changes it, it has to be what is set */
+	futex_hash_slots_set_verify(2);
+	futex_hash_slots_set_verify(4);
+	futex_hash_slots_set_verify(8);
+	futex_hash_slots_set_verify(32);
+	futex_hash_slots_set_verify(16);
+
+	ret =3D futex_hash_slots_set(15, 0);
+	if (ret >=3D 0) {
+		fail("Expected to fail with 15 slots but succeeded: %d.\n", ret);
+		return 1;
+	}
+	futex_hash_slots_set_verify(2);
+	join_max_threads();
+	if (counter !=3D MAX_THREADS) {
+		fail("Expected thread counter at %d but is %d\n",
+		       MAX_THREADS, counter);
+		return 1;
+	}
+	counter =3D 0;
+	/* Once the user set something, auto reisze must be disabled */
+	ret =3D pthread_barrier_init(&barrier_main, NULL, MAX_THREADS);
+
+	create_max_threads(thread_lock_fn);
+	join_max_threads();
+
+	ret =3D futex_hash_slots_get();
+	if (ret !=3D 2) {
+		printf("Expected 2 slots, no auto-resize, got %d\n", ret);
+		return 1;
+	}
+
+	futex_hash_slots_set_must_fail(1 << 29, 0);
+
+	/*
+	 * Once the private hash has been made immutable or global hash has been =
requested,
+	 * then this requested can not be undone.
+	 */
+	if (use_global_hash) {
+		ret =3D futex_hash_slots_set(0, 0);
+		if (ret !=3D 0) {
+			printf("Can't request global hash: %m\n");
+			return 1;
+		}
+	} else {
+		ret =3D futex_hash_slots_set(4, 1);
+		if (ret !=3D 0) {
+			printf("Immutable resize to 4 failed: %m\n");
+			return 1;
+		}
+	}
+
+	futex_hash_slots_set_must_fail(4, 0);
+	futex_hash_slots_set_must_fail(4, 1);
+	futex_hash_slots_set_must_fail(8, 0);
+	futex_hash_slots_set_must_fail(8, 1);
+	futex_hash_slots_set_must_fail(0, 1);
+	futex_hash_slots_set_must_fail(6, 1);
+
+	ret =3D pthread_barrier_init(&barrier_main, NULL, MAX_THREADS);
+	if (ret !=3D 0) {
+		error("pthread_barrier_init failed.\n", errno);
+		return 1;
+	}
+	create_max_threads(thread_lock_fn);
+	join_max_threads();
+
+	ret =3D futex_hash_slots_get();
+	if (use_global_hash) {
+		if (ret !=3D 0) {
+			error("Expected global hash, got %d\n", errno, ret);
+			return 1;
+		}
+	} else {
+		if (ret !=3D 4) {
+			error("Expected 4 slots, no auto-resize, got %d\n", errno, ret);
+			return 1;
+		}
+	}
+
+	ret =3D futex_hash_immutable_get();
+	if (ret !=3D 1) {
+		fail("Expected immutable private hash, got %d\n", ret);
+		return 1;
+	}
+	return 0;
+}
diff --git a/tools/testing/selftests/futex/functional/run.sh b/tools/testin=
g/selftests/futex/functional/run.sh
index 5ccd599da6c30..f0f0d2b683d7e 100755
--- a/tools/testing/selftests/futex/functional/run.sh
+++ b/tools/testing/selftests/futex/functional/run.sh
@@ -82,3 +82,7 @@ echo
=20
 echo
 ./futex_waitv $COLOR
+
+echo
+./futex_priv_hash $COLOR
+./futex_priv_hash -g $COLOR
--=20
2.49.0

