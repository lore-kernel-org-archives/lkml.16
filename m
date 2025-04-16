Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C2C21767A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820974; cv=none; b=mDZACD3KKUVUrtaphFn4HJVblReH0vbPPn3orb88Ur/1gY6muM9kK2VizfI3/RbRfJ0JFAs+JwYWa8tU8Bn19zVC7m8P8W37Q6GF8zJqM5l3zRloDp/UGojfsf+C4ZpRCOAcDyNiC+geOELjFh4OZEPjFRgU7aJu0wDMinWsdZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820974; c=relaxed/simple;
	bh=NMtemmKnPmyQcs6axqNmBbUMi56qsYrZm/MNY3rHVaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aacd8Ozf1DoUn+Vez5IqWMzydpEuEVLY0FbmOubmFY0TcCITuzW6P1cFPTzkJGJK5aMCpRc3BD3kvL6X+pr3fZTct31ekLsDNFrU1iGXkYn3vTVBnBTJINQJjB4AsgsGYv+0nL9pHB01fu0mF9GYsQ8ctcP+D7AdCXSD5KqMZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YoETatFi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IMRNbKaq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YoETatFi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IMRNbKaq"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744820969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0GEZ2YVGNjbG0flB6FM5Jwo67WRq8Fq4s1znrOXO320=;
	b=YoETatFiGDluO6Ep8ZEOYVmHp0mqSfCmlsnzDw6Y/QtqrcmSXGWD6uzDKU6Arrsi0Je3Mi
	qLAG7Hq71GwFveQFdV6oA2vQXVJxOKJLWg+MlFCVtPv5aOA8WRT5uT5u3Fxk+V22TvnXqF
	WuVjli/PFT+n/N4ws2ZYDV3pMAO4GUzuaC8SgG+QnnF23nIbw73bPQy3Mzs9Nonq4JEYbg
	kaZZurGf8Uvdr/izALeKbxN+kfNmIpjtg3BQ2nY/s3wYEkBcd9kU/p8wSuj8N9/TNhg4sM
	7K6QDI0psKg0QaO81hBC5Q4xYMkQ702fox5tlfK82Q5VZTMPgpSG60qzS4rmDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744820969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0GEZ2YVGNjbG0flB6FM5Jwo67WRq8Fq4s1znrOXO320=;
	b=IMRNbKaq4fnAhJboRshzX7YG9P3vtJXCjc2Gz1DrcFCOh2H/VAHqNPSHW1DN7DZeh2x1XS
	LyUnvZTwAWmrHFDQ==
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
Subject: [PATCH v12 08/21] futex: Acquire a hash reference in futex_wait_multiple_setup()
Date: Wed, 16 Apr 2025 18:29:08 +0200
Message-ID: <20250416162921.513656-9-bigeasy@linutronix.de>
In-Reply-To: <20250416162921.513656-1-bigeasy@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

futex_wait_multiple_setup() changes task_struct::__state to
!TASK_RUNNING and then enqueues on multiple futexes. Every
futex_q_lock() acquires a reference on the global hash which is dropped
later.
If a rehash is in progress then the loop will block on
mm_struct::futex_hash_bucket for the rehash to complete and this will
lose the previously set task_struct::__state.

Acquire a reference on the local hash to avoiding blocking on
mm_struct::futex_hash_bucket.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/waitwake.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index d52541bcc07e9..bd8fef0f8d180 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -406,6 +406,12 @@ int futex_wait_multiple_setup(struct futex_vector *vs,=
 int count, int *woken)
 	int ret, i;
 	u32 uval;
=20
+	/*
+	 * Make sure to have a reference on the private_hash such that we
+	 * don't block on rehash after changing the task state below.
+	 */
+	guard(private_hash)();
+
 	/*
 	 * Enqueuing multiple futexes is tricky, because we need to enqueue
 	 * each futex on the list before dealing with the next one to avoid
--=20
2.49.0

