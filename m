Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AD513A3ED
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747411433; cv=none; b=T7JFuGNFJN4+nX5C1iA+cdm9/JEEieqwmZeeujdckD9WEuYcATGwgDLEjqqYOLGN1OhX/2u6RtUVKL5M+d8EMYTjHRYw8Q+eATy5qRS6A9s+DtGcCD5U4EYG+uG5nrW3ehYFYVdAASYnwk4xlA8QAKnkUNRwWp8r6by8io0ll7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747411433; c=relaxed/simple;
	bh=Q3h53einSp2rQD+2e6peNlK0GqD6WCe3aehcIGdB/OY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kB7IT3u0uOLgRXlulxeiHGvjwV0WRTTAg9oaK8dINIqCap83hRrrmZZg2/CIcRLVg69qSOZIlfzPod4Jh2skzNNebo+5gWMbtRuR7YQxXvIIOiz8tZSiWvKIuyyQWdJWwF5LGN3hW7uECb3olkRYQcuPtvwNYjfQZdCcccVKIzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4VFj0kdP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9agI9YLt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4VFj0kdP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9agI9YLt"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747411430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HGohYDFWFlr+myl6Dzhrw+soITHCqOqPB4Qu9PLO+4E=;
	b=4VFj0kdPmmldFasr6fsNhg++FuUNzmnEh5gCBORHOnT2zzgNpUcJB622DlF7IOeIdJm9HT
	GPIBCvxDgxU9QNS74+q9S3pcFyurXt3/kNptbhJQzpllVJ3YeMhAXJ4xsuBa1DL/L80RSQ
	8EzDfJqt1j2hNvvm+V8wFcKDwCLHCitQ1tStmhRFwo7A8avqZS99HSZzFOcTUP7DaFz2U+
	4znN+AwKIyfC+SHffdV4NjcWC63+jspxbCyvWEmPdwswMsEiImtnz/lwYrraIdScrf8VMw
	FXktsx0z2YJSf2qselJvV+Swj8dpPJ6HVarOOqsOLdI04+MilSNrYJTJCoUF5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747411430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HGohYDFWFlr+myl6Dzhrw+soITHCqOqPB4Qu9PLO+4E=;
	b=9agI9YLt5aCMdchmuD9n6NFRwdWCRngnfoNe0YLE6uUNi+sOdshTTcCa2rNgC6R4oXvSNU
	asN3Kf90ttBO9AAw==
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
Subject: [PATCH 4/5] tools headers: Synchronize prctl.h ABI header
Date: Fri, 16 May 2025 18:03:38 +0200
Message-ID: <20250516160339.1022507-5-bigeasy@linutronix.de>
In-Reply-To: <20250516160339.1022507-1-bigeasy@linutronix.de>
References: <20250516160339.1022507-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The prctl.h ABI header was slightly updated during the development of
the interface. In particular the "immutable" parameter became a bit in
the option argument.

Synchronize prctl.h ABI header again and make use of the definition in
the testsuite.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 tools/include/uapi/linux/prctl.h               |  1 +
 .../futex/functional/futex_priv_hash.c         | 18 +++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

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
diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/t=
ools/testing/selftests/futex/functional/futex_priv_hash.c
index 72a621d9313f3..32abd9acdf186 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -30,9 +30,9 @@ static int counter;
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
@@ -63,11 +63,11 @@ static void futex_hash_slots_set_verify(int slots)
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
 			 slots, immutable);
 }
@@ -254,18 +254,18 @@ int main(int argc, char *argv[])
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

