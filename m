Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0B819007D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747411433; cv=none; b=TlaiIDV6NJLfA64zdMsEsoVGbefbu6BI30cBRcumtS/FQK7L22wcM9uY9M4YcgLoLJ1Y7dBmUOSeeWEwC3KwnQJuWmaNvfwgbt1IwVX/w54l7nhPqILhGXdPQc0BEznA6M5nVolLmq52GavVPRdizK5d/izUPLxMAefhmqokjXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747411433; c=relaxed/simple;
	bh=7quEVCGbCH2J/NQogOv1jyN8vMCSyQTngwDy7ifxKfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qKV6XGVZS/ex+hh0bZ1Ii5xwytrbD0I3HstgIYYlRKSeJlBs75zYsYgwZSL+4eAzOWS1SRrXu924tLXW3zxjaqbmndh04GsMzdJ8PDYV9khObrANn+OPNnr3QMLCvhuN2mwZXzGGZ8SQHZ9Qn9yxETB77XpYnjAP53BOvmZa7pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=No/NinQ6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5KEMvBkG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="No/NinQ6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5KEMvBkG"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747411429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OgPtag8YLEfLZf6k4CCxGs8DpMmSVn6yKu/hnu3LgNs=;
	b=No/NinQ64fCwmsVpXXpPwIbCWz0G6bsJx8FkPbotC21FOXsmSFRfZH2NyIKc+mVTKVunpW
	3lAZlUpjJo5g5yo0sYp4hZkZMLfJKZeWQ57YPEsXDAnOyErDdnYetSiMnSgeC11GYnK6vu
	S4qDbj04l1cVDjJ0v7K28FWERfIIzTvk8ooWoImZ0KMYDlP+22wBv3uXs5CIlFSZ8zhVp+
	8m/OUsq6nsjizQ6BunYs3KyHfHssi5mXo7sT/T05/2wFKzw3L+qpf+3NNCQF2WeTDCIG0X
	4FoehmvOhm4GK5GdhgVAdfJfPBEMrL+HDLbJ+RyWi5raVo7eU3hKaa0Pe0+IoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747411429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OgPtag8YLEfLZf6k4CCxGs8DpMmSVn6yKu/hnu3LgNs=;
	b=5KEMvBkG54Kusk+LD7LLRUPLvPjlSD1UQYhLrMYlQ+mTkQgwSfG5AjdRuBgsXbC+/OSirP
	ObaRlBWSn7jzZXAw==
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
Subject: [PATCH 2/5] selftests/futex: Use TAP output in futex_numa_mpol
Date: Fri, 16 May 2025 18:03:36 +0200
Message-ID: <20250516160339.1022507-3-bigeasy@linutronix.de>
In-Reply-To: <20250516160339.1022507-1-bigeasy@linutronix.de>
References: <20250516160339.1022507-1-bigeasy@linutronix.de>
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
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 .../futex/functional/futex_numa_mpol.c        | 65 +++++++++----------
 1 file changed, 32 insertions(+), 33 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_numa_mpol.c b/t=
ools/testing/selftests/futex/functional/futex_numa_mpol.c
index dd70532f293ec..d18949ea915aa 100644
--- a/tools/testing/selftests/futex/functional/futex_numa_mpol.c
+++ b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
@@ -61,10 +61,8 @@ static void create_max_threads(void *futex_ptr)
 		thread_args[i].flags =3D FUTEX2_SIZE_U32 | FUTEX_PRIVATE_FLAG | FUTEX2_N=
UMA;
 		thread_args[i].result =3D 0;
 		ret =3D pthread_create(&threads[i], NULL, thread_lock_fn, &thread_args[i=
]);
-		if (ret) {
-			error("pthread_create failed\n", errno);
-			exit(1);
-		}
+		if (ret)
+			ksft_exit_fail_msg("pthread_create failed\n");
 	}
 }
=20
@@ -74,10 +72,8 @@ static void join_max_threads(void)
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
@@ -95,12 +91,12 @@ static void __test_futex(void *futex_ptr, int must_fail=
, unsigned int futex_flag
 		if (must_fail) {
 			if (ret < 0)
 				break;
-			fail("Should fail, but didn't\n");
-			exit(1);
+			ksft_exit_fail_msg("futex2_wake(%d, 0x%x) should fail, but didn't\n",
+					   to_wake, futex_flags);
 		}
 		if (ret < 0) {
-			error("Failed futex2_wake(%d)\n", errno, to_wake);
-			exit(1);
+			ksft_exit_fail_msg("Failed futex2_wake(%d, 0x%x): %m\n",
+					   to_wake, futex_flags);
 		}
 		if (!ret)
 			usleep(50);
@@ -111,16 +107,17 @@ static void __test_futex(void *futex_ptr, int must_fa=
il, unsigned int futex_flag
=20
 	for (i =3D 0; i < MAX_THREADS; i++) {
 		if (must_fail && thread_args[i].result !=3D -1) {
-			fail("Thread %d should fail but succeeded (%d)\n", i, thread_args[i].re=
sult);
+			ksft_print_msg("Thread %d should fail but succeeded (%d)\n",
+				       i, thread_args[i].result);
 			need_exit =3D 1;
 		}
 		if (!must_fail && thread_args[i].result !=3D 0) {
-			fail("Thread %d failed (%d)\n", i, thread_args[i].result);
+			ksft_print_msg("Thread %d failed (%d)\n", i, thread_args[i].result);
 			need_exit =3D 1;
 		}
 	}
 	if (need_exit)
-		exit(1);
+		ksft_exit_fail_msg("Aborting due to earlier errors.\n");
 }
=20
 static void test_futex(void *futex_ptr, int must_fail)
@@ -167,41 +164,41 @@ int main(int argc, char *argv[])
 		}
 	}
=20
+	ksft_print_header();
+	ksft_set_plan(1);
+
 	mem_size =3D sysconf(_SC_PAGE_SIZE);
 	futex_ptr =3D mmap(NULL, mem_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | =
MAP_ANONYMOUS, 0, 0);
-	if (futex_ptr =3D=3D MAP_FAILED) {
-		error("mmap() for %d bytes failed\n", errno, mem_size);
-		return 1;
-	}
+	if (futex_ptr =3D=3D MAP_FAILED)
+		ksft_exit_fail_msg("mmap() for %d bytes failed\n", mem_size);
+
 	futex_numa =3D futex_ptr;
=20
-	info("Regular test\n");
+	ksft_print_msg("Regular test\n");
 	futex_numa->futex =3D 0;
 	futex_numa->numa =3D FUTEX_NO_NODE;
 	test_futex(futex_ptr, 0);
=20
-	if (futex_numa->numa =3D=3D FUTEX_NO_NODE) {
-		fail("NUMA node is left unitiliazed\n");
-		return 1;
-	}
+	if (futex_numa->numa =3D=3D FUTEX_NO_NODE)
+		ksft_exit_fail_msg("NUMA node is left unitiliazed\n");
=20
-	info("Memory too small\n");
+	ksft_print_msg("Memory too small\n");
 	test_futex(futex_ptr + mem_size - 4, 1);
=20
-	info("Memory out of range\n");
+	ksft_print_msg("Memory out of range\n");
 	test_futex(futex_ptr + mem_size, 1);
=20
 	futex_numa->numa =3D FUTEX_NO_NODE;
 	mprotect(futex_ptr, mem_size, PROT_READ);
-	info("Memory, RO\n");
+	ksft_print_msg("Memory, RO\n");
 	test_futex(futex_ptr, 1);
=20
 	mprotect(futex_ptr, mem_size, PROT_NONE);
-	info("Memory, no access\n");
+	ksft_print_msg("Memory, no access\n");
 	test_futex(futex_ptr, 1);
=20
 	mprotect(futex_ptr, mem_size, PROT_READ | PROT_WRITE);
-	info("Memory back to RW\n");
+	ksft_print_msg("Memory back to RW\n");
 	test_futex(futex_ptr, 0);
=20
 	/* MPOL test. Does not work as expected */
@@ -213,20 +210,22 @@ int main(int argc, char *argv[])
 		ret =3D mbind(futex_ptr, mem_size, MPOL_BIND, &nodemask,
 			    sizeof(nodemask) * 8, 0);
 		if (ret =3D=3D 0) {
-			info("Node %d test\n", i);
+			ksft_print_msg("Node %d test\n", i);
 			futex_numa->futex =3D 0;
 			futex_numa->numa =3D FUTEX_NO_NODE;
=20
 			ret =3D futex2_wake(futex_ptr, 0, FUTEX2_SIZE_U32 | FUTEX_PRIVATE_FLAG =
| FUTEX2_NUMA | FUTEX2_MPOL);
 			if (ret < 0)
-				error("Failed to wake 0 with MPOL.\n", errno);
+				ksft_test_result_fail("Failed to wake 0 with MPOL: %m\n");
 			if (0)
 				test_futex_mpol(futex_numa, 0);
 			if (futex_numa->numa !=3D i) {
-				fail("Returned NUMA node is %d expected %d\n",
-				     futex_numa->numa, i);
+				ksft_test_result_fail("Returned NUMA node is %d expected %d\n",
+						      futex_numa->numa, i);
 			}
 		}
 	}
+	ksft_test_result_pass("NUMA MPOL tests passed\n");
+	ksft_finished();
 	return 0;
 }
--=20
2.49.0

