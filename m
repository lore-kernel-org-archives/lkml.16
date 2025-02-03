Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7AB2066F1
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591193; cv=none; b=Jw4SS/Qxkmp8Fzk2hpDQoxQU85dvol9Ws3IPf9Anytnq+2K67ClCne/h3rbRogjwG3fZXpZRCZVf5pRJDPh8fj2vbndW33iF5ZJtXg8ypUuk5Dis3XPXnKelaX8BwIC8nOzy7YxQFYwK2lDCH7sdjf9JazjoigHBKnDEyPseAQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591193; c=relaxed/simple;
	bh=ljv1o7TtJkciS0Z3bcBYUZl790/dhvDSZEkPyI4+Bzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qah4+acub0zgdLRckKC1tMEJpkXdGyaGv5ioCVig1Stt2H8JADl0+2uarKo72zz777nhPEUV6OVQz/yR7/MQixGXPhkJYJjNtkxCuT0/I28LDAOqofc/FHEq0UQE6676JzrONUkDs48PFfMQQifYUXwNgzs3ms5i3vCaIHXXLaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0ieeXSA0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GZAKcxCh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0ieeXSA0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GZAKcxCh"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UmCfPL4peB7Probbyc3F6ku38xfucU5l2syASfQjPfU=;
	b=0ieeXSA0pSHAUojPhUZHGRYYnFulBq+pMwLcG6tH3JnE1JYpVHfk9UaKWrU5/F+ANFDA0m
	vpNgHh4TsplLjZBUeaf/iAZ/TdC26C06j1Aq857wdy+EiLEeB2aBzrIRXlFXsX975q/w0n
	Nhmi3periXcoUh4yXF0s7JnlgDMlLiiwW3KC3kEVYtl9fHFKBecYmgIGwL7ipa33Rjw7Gg
	SgruXpwcq7JpJVRFCR0QsEXcDfYHW7oruzExCRbKASaWTp6HBIvlKFO8beXBEU7RZXUDxn
	DAa8jzvT4s74LLgCkMZHbpYtTk3YZfy49M77kox060e39uzJGBpdMEojayFsng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UmCfPL4peB7Probbyc3F6ku38xfucU5l2syASfQjPfU=;
	b=GZAKcxChK7oCL0kJam/EJJGZLm+xbC/JGp6WTMh/YrDqOQsnUJNzOoLTv0nWymDI/L+QfV
	OKl6Ii/8mYlinnCw==
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
Subject: [PATCH v8 14/15] futex: Use a hashmask instead of hashsize.
Date: Mon,  3 Feb 2025 14:59:34 +0100
Message-ID: <20250203135935.440018-15-bigeasy@linutronix.de>
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The global hash uses futex_hashsize to save the amount of the hash
buckets that have been allocated during system boot. On each
futex_hash() invocation this number is substracted by one to get the
mask. This can be optimized by saving directly the mask avoiding the
substraction on each futex_hash() invocation.

Rename futex_hashsize to futex_hashmask and save the mask of the
allocated hash map.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 9a12dccb1c995..9e32bfa7ba4ab 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -52,10 +52,10 @@
  */
 static struct {
 	struct futex_hash_bucket *queues;
-	unsigned long            hashsize;
+	unsigned long            hashmask;
 } __futex_data __read_mostly __aligned(2*sizeof(long));
 #define futex_queues   (__futex_data.queues)
-#define futex_hashsize (__futex_data.hashsize)
+#define futex_hashmask (__futex_data.hashmask)
=20
 struct futex_private_hash {
 	rcuref_t	users;
@@ -276,7 +276,7 @@ struct futex_hash_bucket *futex_hash(union futex_key *k=
ey)
 	hash =3D jhash2((u32 *)key,
 		      offsetof(typeof(*key), both.offset) / 4,
 		      key->both.offset);
-	return &futex_queues[hash & (futex_hashsize - 1)];
+	return &futex_queues[hash & futex_hashmask];
 }
=20
 bool futex_put_private_hash(struct futex_private_hash *hb_p)
@@ -1411,8 +1411,8 @@ static int futex_hash_allocate(unsigned int hash_slot=
s)
 		hash_slots =3D 16;
 	if (hash_slots < 2)
 		hash_slots =3D 2;
-	if (hash_slots > futex_hashsize)
-		hash_slots =3D futex_hashsize;
+	if (hash_slots > futex_hashmask + 1)
+		hash_slots =3D futex_hashmask + 1;
 	if (!is_power_of_2(hash_slots))
 		hash_slots =3D rounddown_pow_of_two(hash_slots);
=20
@@ -1477,7 +1477,7 @@ int futex_hash_allocate_default(void)
 		 */
 		buckets =3D roundup_pow_of_two(4 * threads);
 		buckets =3D max(buckets, 16);
-		buckets =3D min(buckets, futex_hashsize);
+		buckets =3D min(buckets, futex_hashmask + 1);
 	}
 	if (current_buckets >=3D buckets)
 		return 0;
@@ -1518,24 +1518,25 @@ int futex_hash_prctl(unsigned long arg2, unsigned l=
ong arg3)
=20
 static int __init futex_init(void)
 {
+	unsigned long i, hashsize;
 	unsigned int futex_shift;
-	unsigned long i;
=20
 #ifdef CONFIG_BASE_SMALL
-	futex_hashsize =3D 16;
+	hashsize =3D 16;
 #else
-	futex_hashsize =3D roundup_pow_of_two(256 * num_possible_cpus());
+	hashsize =3D roundup_pow_of_two(256 * num_possible_cpus());
 #endif
=20
 	futex_queues =3D alloc_large_system_hash("futex", sizeof(*futex_queues),
-					       futex_hashsize, 0, 0,
+					       hashsize, 0, 0,
 					       &futex_shift, NULL,
-					       futex_hashsize, futex_hashsize);
-	futex_hashsize =3D 1UL << futex_shift;
+					       hashsize, hashsize);
+	hashsize =3D 1UL << futex_shift;
=20
-	for (i =3D 0; i < futex_hashsize; i++)
+	for (i =3D 0; i < hashsize; i++)
 		futex_hash_bucket_init(&futex_queues[i], 0);
=20
+	futex_hashmask =3D hashsize - 1;
 	return 0;
 }
 core_initcall(futex_init);
--=20
2.47.2

