Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F54205AC1
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747494903; cv=none; b=ANUrc6mMZ7rw0Nq6Yozv5XqdNavEeSm6Y6QhZyw+I3mTv1WW+8j/HS6sdG4CcckFPPy4nYiU6vmbEpv+L2pLxRPAdso8QjPE2v2fOSTPAS4HIf6ofALBO3grXu10tqIujS/DFvJBRNY1yj/eJm8eNqE1bJ+IzU/LCrQHm9vE3VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747494903; c=relaxed/simple;
	bh=/ztD58wSr3hkwLimw8rX0TDM9G65KhOB8R0a8UCmA28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O+sWILk2p1ySccOaKWIDmydBlT28cXMkvx3dTzqk7NQAkArkv4H5ylT47LrIOu562empFD9P0po9E7ter1lb1c4a0nRg41HGp4i4U1sIr212olSMFLNr+n5C4yhj9iUrGfEDGgOP8WSemCplip1oMo8N/MwvX7a7tGe3gxiE/xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f3fgH6nx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FEwdrgfU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f3fgH6nx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FEwdrgfU"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747494899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBAG2g4xyGz7CfWeA4doPef9u1z6R836/J0iL0cRwyg=;
	b=f3fgH6nxBjmGr+BbIcchOikAFPLpv7+AUN9SuQ0vNdfbfeyaz1TERKl5fCBrpEJwoTjvOh
	KK97UNKSWEmDGoHwrUaWA1yC4Kkw4zwxYNrwAoLS2i8yEqVPOMEYmCXUw2vALj5k9RrAiP
	ciJpfS3K4ASY3DmNhLp0AXbb5u0lB/WTEhma5qNZDBVM5Tkp00DAUih/IjehqtzQR/nqf6
	qJ+oRAJCmA8X1wyfQ4ta/Wyv24D7KBZouOqhdgd9W80jmRxhEExJirAdhscI8D69DKlTkX
	YvA36UTDDYOZAPz7j6kP8YSmkwFpBQn1xkpUCfLjtcQusfAEXTrXEs1O3C+rWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747494899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBAG2g4xyGz7CfWeA4doPef9u1z6R836/J0iL0cRwyg=;
	b=FEwdrgfUVWPnkOHDd0POjSgHKV+sn8q9B2IAcJFhhiSB661BWX1XTDgopKfBLQLnC4GyGf
	Jgwwc7d3tPaDw1CQ==
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
Subject: [PATCH v2 1/5] selftests/futex: Use TAP output in futex_priv_hash
Date: Sat, 17 May 2025 17:14:51 +0200
Message-ID: <20250517151455.1065363-2-bigeasy@linutronix.de>
In-Reply-To: <20250517151455.1065363-1-bigeasy@linutronix.de>
References: <20250517151455.1065363-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Use TAP output for easier automated testing.

Suggested-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 .../futex/functional/futex_priv_hash.c        | 150 ++++++++----------
 1 file changed, 63 insertions(+), 87 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/t=
ools/testing/selftests/futex/functional/futex_priv_hash.c
index 4d37650baa192..72a621d9313f3 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -51,15 +51,16 @@ static void futex_hash_slots_set_verify(int slots)
=20
 	ret =3D futex_hash_slots_set(slots, 0);
 	if (ret !=3D 0) {
-		error("Failed to set slots to %d\n", errno, slots);
-		exit(1);
+		ksft_test_result_fail("Failed to set slots to %d: %m\n", slots);
+		ksft_finished();
 	}
 	ret =3D futex_hash_slots_get();
 	if (ret !=3D slots) {
-		error("Set %d slots but PR_FUTEX_HASH_GET_SLOTS returns: %d\n",
-		       errno, slots, ret);
-		exit(1);
+		ksft_test_result_fail("Set %d slots but PR_FUTEX_HASH_GET_SLOTS returns:=
 %d, %m\n",
+		       slots, ret);
+		ksft_finished();
 	}
+	ksft_test_result_pass("SET and GET slots %d passed\n", slots);
 }
=20
 static void futex_hash_slots_set_must_fail(int slots, int immutable)
@@ -67,12 +68,8 @@ static void futex_hash_slots_set_must_fail(int slots, in=
t immutable)
 	int ret;
=20
 	ret =3D futex_hash_slots_set(slots, immutable);
-	if (ret < 0)
-		return;
-
-	fail("futex_hash_slots_set(%d, %d) expected to fail but succeeded.\n",
-	       slots, immutable);
-	exit(1);
+	ksft_test_result(ret < 0, "futex_hash_slots_set(%d, %d)\n",
+			 slots, immutable);
 }
=20
 static void *thread_return_fn(void *arg)
@@ -97,10 +94,8 @@ static void create_max_threads(void *(*thread_fn)(void *=
))
=20
 	for (i =3D 0; i < MAX_THREADS; i++) {
 		ret =3D pthread_create(&threads[i], NULL, thread_fn, NULL);
-		if (ret) {
-			error("pthread_create failed\n", errno);
-			exit(1);
-		}
+		if (ret)
+			ksft_exit_fail_msg("pthread_create failed: %m\n");
 	}
 }
=20
@@ -110,10 +105,8 @@ static void join_max_threads(void)
=20
 	for (i =3D 0; i < MAX_THREADS; i++) {
 		ret =3D pthread_join(threads[i], NULL);
-		if (ret) {
-			error("pthread_join failed for thread %d\n", errno, i);
-			exit(1);
-		}
+		if (ret)
+			ksft_exit_fail_msg("pthread_join failed for thread %d\n", i);
 	}
 }
=20
@@ -127,6 +120,9 @@ static void usage(char *prog)
 	       VQUIET, VCRITICAL, VINFO);
 }
=20
+static const char *test_msg_auto_create =3D "Automatic hash bucket init on=
 thread creation.\n";
+static const char *test_msg_auto_inc =3D "Automatic increase with more tha=
n 16 CPUs\n";
+
 int main(int argc, char *argv[])
 {
 	int futex_slots1, futex_slotsn, online_cpus;
@@ -156,56 +152,50 @@ int main(int argc, char *argv[])
 		}
 	}
=20
+	ksft_print_header();
+	ksft_set_plan(22);
=20
 	ret =3D pthread_mutexattr_init(&mutex_attr_pi);
 	ret |=3D pthread_mutexattr_setprotocol(&mutex_attr_pi, PTHREAD_PRIO_INHER=
IT);
 	ret |=3D pthread_mutex_init(&global_lock, &mutex_attr_pi);
 	if (ret !=3D 0) {
-		fail("Failed to initialize pthread mutex.\n");
-		return 1;
+		ksft_exit_fail_msg("Failed to initialize pthread mutex.\n");
 	}
-
 	/* First thread, expect to be 0, not yet initialized */
 	ret =3D futex_hash_slots_get();
-	if (ret !=3D 0) {
-		error("futex_hash_slots_get() failed: %d\n", errno, ret);
-		return 1;
-	}
-	ret =3D futex_hash_immutable_get();
-	if (ret !=3D 0) {
-		error("futex_hash_immutable_get() failed: %d\n", errno, ret);
-		return 1;
-	}
+	if (ret !=3D 0)
+		ksft_exit_fail_msg("futex_hash_slots_get() failed: %d, %m\n", ret);
=20
+	ret =3D futex_hash_immutable_get();
+	if (ret !=3D 0)
+		ksft_exit_fail_msg("futex_hash_immutable_get() failed: %d, %m\n", ret);
+
+	ksft_test_result_pass("Basic get slots and immutable status.\n");
 	ret =3D pthread_create(&threads[0], NULL, thread_return_fn, NULL);
-	if (ret !=3D 0) {
-		error("pthread_create() failed: %d\n", errno, ret);
-		return 1;
-	}
+	if (ret !=3D 0)
+		ksft_exit_fail_msg("pthread_create() failed: %d, %m\n", ret);
+
 	ret =3D pthread_join(threads[0], NULL);
-	if (ret !=3D 0) {
-		error("pthread_join() failed: %d\n", errno, ret);
-		return 1;
-	}
+	if (ret !=3D 0)
+		ksft_exit_fail_msg("pthread_join() failed: %d, %m\n", ret);
+
 	/* First thread, has to initialiaze private hash */
 	futex_slots1 =3D futex_hash_slots_get();
 	if (futex_slots1 <=3D 0) {
-		fail("Expected > 0 hash buckets, got: %d\n", futex_slots1);
-		return 1;
+		ksft_print_msg("Current hash buckets: %d\n", futex_slots1);
+		ksft_exit_fail_msg(test_msg_auto_create);
 	}
=20
+	ksft_test_result_pass(test_msg_auto_create);
+
 	online_cpus =3D sysconf(_SC_NPROCESSORS_ONLN);
 	ret =3D pthread_barrier_init(&barrier_main, NULL, MAX_THREADS + 1);
-	if (ret !=3D 0) {
-		error("pthread_barrier_init failed.\n", errno);
-		return 1;
-	}
+	if (ret !=3D 0)
+		ksft_exit_fail_msg("pthread_barrier_init failed: %m.\n");
=20
 	ret =3D pthread_mutex_lock(&global_lock);
-	if (ret !=3D 0) {
-		error("pthread_mutex_lock failed.\n", errno);
-		return 1;
-	}
+	if (ret !=3D 0)
+		ksft_exit_fail_msg("pthread_mutex_lock failed: %m.\n");
=20
 	counter =3D 0;
 	create_max_threads(thread_lock_fn);
@@ -215,14 +205,17 @@ int main(int argc, char *argv[])
 	 * The current default size of hash buckets is 16. The auto increase
 	 * works only if more than 16 CPUs are available.
 	 */
+	ksft_print_msg("Online CPUs: %d\n", online_cpus);
 	if (online_cpus > 16) {
 		futex_slotsn =3D futex_hash_slots_get();
 		if (futex_slotsn < 0 || futex_slots1 =3D=3D futex_slotsn) {
-			fail("Expected increase of hash buckets but got: %d -> %d\n",
-			      futex_slots1, futex_slotsn);
-			info("Online CPUs: %d\n", online_cpus);
-			return 1;
+			ksft_print_msg("Expected increase of hash buckets but got: %d -> %d\n",
+				       futex_slots1, futex_slotsn);
+			ksft_exit_fail_msg(test_msg_auto_inc);
 		}
+		ksft_test_result_pass(test_msg_auto_inc);
+	} else {
+		ksft_test_result_skip(test_msg_auto_inc);
 	}
 	ret =3D pthread_mutex_unlock(&global_lock);
=20
@@ -234,17 +227,12 @@ int main(int argc, char *argv[])
 	futex_hash_slots_set_verify(16);
=20
 	ret =3D futex_hash_slots_set(15, 0);
-	if (ret >=3D 0) {
-		fail("Expected to fail with 15 slots but succeeded: %d.\n", ret);
-		return 1;
-	}
+	ksft_test_result(ret < 0, "Use 15 slots\n");
+
 	futex_hash_slots_set_verify(2);
 	join_max_threads();
-	if (counter !=3D MAX_THREADS) {
-		fail("Expected thread counter at %d but is %d\n",
-		       MAX_THREADS, counter);
-		return 1;
-	}
+	ksft_test_result(counter =3D=3D MAX_THREADS, "Created of waited for %d of=
 %d threads\n",
+			 counter, MAX_THREADS);
 	counter =3D 0;
 	/* Once the user set something, auto reisze must be disabled */
 	ret =3D pthread_barrier_init(&barrier_main, NULL, MAX_THREADS);
@@ -253,10 +241,8 @@ int main(int argc, char *argv[])
 	join_max_threads();
=20
 	ret =3D futex_hash_slots_get();
-	if (ret !=3D 2) {
-		printf("Expected 2 slots, no auto-resize, got %d\n", ret);
-		return 1;
-	}
+	ksft_test_result(ret =3D=3D 2, "No more auto-resize after manaul setting,=
 got %d\n",
+			 ret);
=20
 	futex_hash_slots_set_must_fail(1 << 29, 0);
=20
@@ -266,17 +252,13 @@ int main(int argc, char *argv[])
 	 */
 	if (use_global_hash) {
 		ret =3D futex_hash_slots_set(0, 0);
-		if (ret !=3D 0) {
-			printf("Can't request global hash: %m\n");
-			return 1;
-		}
+		ksft_test_result(ret =3D=3D 0, "Global hash request\n");
 	} else {
 		ret =3D futex_hash_slots_set(4, 1);
-		if (ret !=3D 0) {
-			printf("Immutable resize to 4 failed: %m\n");
-			return 1;
-		}
+		ksft_test_result(ret =3D=3D 0, "Immutable resize to 4\n");
 	}
+	if (ret !=3D 0)
+		goto out;
=20
 	futex_hash_slots_set_must_fail(4, 0);
 	futex_hash_slots_set_must_fail(4, 1);
@@ -287,7 +269,7 @@ int main(int argc, char *argv[])
=20
 	ret =3D pthread_barrier_init(&barrier_main, NULL, MAX_THREADS);
 	if (ret !=3D 0) {
-		error("pthread_barrier_init failed.\n", errno);
+		ksft_exit_fail_msg("pthread_barrier_init failed: %m\n");
 		return 1;
 	}
 	create_max_threads(thread_lock_fn);
@@ -295,21 +277,15 @@ int main(int argc, char *argv[])
=20
 	ret =3D futex_hash_slots_get();
 	if (use_global_hash) {
-		if (ret !=3D 0) {
-			error("Expected global hash, got %d\n", errno, ret);
-			return 1;
-		}
+		ksft_test_result(ret =3D=3D 0, "Continue to use global hash\n");
 	} else {
-		if (ret !=3D 4) {
-			error("Expected 4 slots, no auto-resize, got %d\n", errno, ret);
-			return 1;
-		}
+		ksft_test_result(ret =3D=3D 4, "Continue to use the 4 hash buckets\n");
 	}
=20
 	ret =3D futex_hash_immutable_get();
-	if (ret !=3D 1) {
-		fail("Expected immutable private hash, got %d\n", ret);
-		return 1;
-	}
+	ksft_test_result(ret =3D=3D 1, "Hash reports to be immutable\n");
+
+out:
+	ksft_finished();
 	return 0;
 }
--=20
2.49.0

