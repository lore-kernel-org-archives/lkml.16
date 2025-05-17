Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B23B207A22
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747494904; cv=none; b=PIDIN5USQEQ7w5h2DUJbG74YZ4GoiwQnEe1fMtJfsual6kDjXPRw45U5QMNe8GPHGBwbe7cNO8EUn+fFZcu/hBR2YBUoYTMGgN7sOFbMUteydXSmozAnOXA6jf3iSVYxQNrJuwNo1aj96UNIDhvY1k1CarzHZrWJqnsYQWesfPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747494904; c=relaxed/simple;
	bh=xrw/4Wa70FNBVuuwvIbx94B9KkA7A1h5zM7t86zhlvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m7cejRVDxaxJjArYI4C6+IWhI7obIcnLBWbNYyqWgapxl71BUZTLPb/ZzILcJD6DAFZ7DY2gTmU/BQPXSrRqORCuKBDrAA0eIa1q6O8rghumcfp+9RT+Xifnhl1HBT9Q2NApi1tsIVRjHtmhXVaNiYXnfbVDkQfuCwrRLe/qUSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J1yj5TJS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pLq3KsFG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J1yj5TJS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pLq3KsFG"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747494901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mMIptnBrOzGmCpOc2DaVkApQWy1JRd4QqrU7q7taBvE=;
	b=J1yj5TJSb69gxjiBlRIVdY4zIDC9RvkAPTxlH/eQZjJUqcR5pUlz/D7o1nqYMLawEQZC19
	ixfAobzVvBVXYsWibG+gCTvOiiQH9IcfowLiWIchgjkDhkXdl8hHgcFxwAw2Crl4CPADIR
	+zkjH3N7H7KNSB+DUDJC4x9VCXxQMLmICPv/V167Bemmd0anW2DFJ9lBw0pXHKkXDJUrg2
	waJC079/DqwDBXZuH6oOsut5+3w+ow9yvxyeE0pNm/CO/Bqj6rQASPRsP4Ipz/daVDBqek
	Hr3X8iXMQoiNUZgeYVc/9Nk1wRzvh6zxgHO7DyVKw6ad/xQi2SXZFsCXVGRLGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747494901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mMIptnBrOzGmCpOc2DaVkApQWy1JRd4QqrU7q7taBvE=;
	b=pLq3KsFGldOa5NaL8WWywlqolJTR9AU6fQg6GEbTuW6MSJwW3FJk/wJDC2hi/NRC/93s/f
	NClvIptlQUKWj3Dg==
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
Subject: [PATCH v2 4/5] tools headers: Synchronize prctl.h ABI header
Date: Sat, 17 May 2025 17:14:54 +0200
Message-ID: <20250517151455.1065363-5-bigeasy@linutronix.de>
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

The prctl.h ABI header was slightly updated during the development of
the interface. In particular the "immutable" parameter became a bit in
the option argument.

Synchronize prctl.h ABI header again and make use of the definition in
the testsuite and "perf bench futex".

Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 tools/include/uapi/linux/prctl.h              |  1 +
 tools/perf/bench/futex.c                      |  4 +++-
 .../futex/functional/futex_priv_hash.c        | 21 ++++++++++---------
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/pr=
ctl.h
index 21f30b3ded74b..43dec6eed559a 100644
--- a/tools/include/uapi/linux/prctl.h
+++ b/tools/include/uapi/linux/prctl.h
@@ -367,6 +367,7 @@ struct prctl_mm_map {
 /* FUTEX hash management */
 #define PR_FUTEX_HASH			78
 # define PR_FUTEX_HASH_SET_SLOTS	1
+# define FH_FLAG_IMMUTABLE		(1ULL << 0)
 # define PR_FUTEX_HASH_GET_SLOTS	2
 # define PR_FUTEX_HASH_GET_IMMUTABLE	3
=20
diff --git a/tools/perf/bench/futex.c b/tools/perf/bench/futex.c
index 02ae6c52ba881..26382e4d8d4ce 100644
--- a/tools/perf/bench/futex.c
+++ b/tools/perf/bench/futex.c
@@ -9,12 +9,14 @@
=20
 void futex_set_nbuckets_param(struct bench_futex_parameters *params)
 {
+	unsigned long flags;
 	int ret;
=20
 	if (params->nbuckets < 0)
 		return;
=20
-	ret =3D prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, params->nbuckets, p=
arams->buckets_immutable);
+	flags =3D params->buckets_immutable ? FH_FLAG_IMMUTABLE : 0;
+	ret =3D prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, params->nbuckets, f=
lags);
 	if (ret) {
 		printf("Requesting %d hash buckets failed: %d/%m\n",
 		       params->nbuckets, ret);
diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/t=
ools/testing/selftests/futex/functional/futex_priv_hash.c
index 72a621d9313f3..2dca18fefedcd 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -26,13 +26,14 @@ static int counter;
 #ifndef PR_FUTEX_HASH
 #define PR_FUTEX_HASH			78
 # define PR_FUTEX_HASH_SET_SLOTS	1
+# define FH_FLAG_IMMUTABLE		(1ULL << 0)
 # define PR_FUTEX_HASH_GET_SLOTS	2
 # define PR_FUTEX_HASH_GET_IMMUTABLE	3
 #endif
=20
-static int futex_hash_slots_set(unsigned int slots, int immutable)
+static int futex_hash_slots_set(unsigned int slots, int flags)
 {
-	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, slots, immutable);
+	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, slots, flags);
 }
=20
 static int futex_hash_slots_get(void)
@@ -63,13 +64,13 @@ static void futex_hash_slots_set_verify(int slots)
 	ksft_test_result_pass("SET and GET slots %d passed\n", slots);
 }
=20
-static void futex_hash_slots_set_must_fail(int slots, int immutable)
+static void futex_hash_slots_set_must_fail(int slots, int flags)
 {
 	int ret;
=20
-	ret =3D futex_hash_slots_set(slots, immutable);
+	ret =3D futex_hash_slots_set(slots, flags);
 	ksft_test_result(ret < 0, "futex_hash_slots_set(%d, %d)\n",
-			 slots, immutable);
+			 slots, flags);
 }
=20
 static void *thread_return_fn(void *arg)
@@ -254,18 +255,18 @@ int main(int argc, char *argv[])
 		ret =3D futex_hash_slots_set(0, 0);
 		ksft_test_result(ret =3D=3D 0, "Global hash request\n");
 	} else {
-		ret =3D futex_hash_slots_set(4, 1);
+		ret =3D futex_hash_slots_set(4, FH_FLAG_IMMUTABLE);
 		ksft_test_result(ret =3D=3D 0, "Immutable resize to 4\n");
 	}
 	if (ret !=3D 0)
 		goto out;
=20
 	futex_hash_slots_set_must_fail(4, 0);
-	futex_hash_slots_set_must_fail(4, 1);
+	futex_hash_slots_set_must_fail(4, FH_FLAG_IMMUTABLE);
 	futex_hash_slots_set_must_fail(8, 0);
-	futex_hash_slots_set_must_fail(8, 1);
-	futex_hash_slots_set_must_fail(0, 1);
-	futex_hash_slots_set_must_fail(6, 1);
+	futex_hash_slots_set_must_fail(8, FH_FLAG_IMMUTABLE);
+	futex_hash_slots_set_must_fail(0, FH_FLAG_IMMUTABLE);
+	futex_hash_slots_set_must_fail(6, FH_FLAG_IMMUTABLE);
=20
 	ret =3D pthread_barrier_init(&barrier_main, NULL, MAX_THREADS);
 	if (ret !=3D 0) {
--=20
2.49.0

