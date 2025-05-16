Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46C41D5ACE
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747411435; cv=none; b=C5RTjzAGuxr+X+SpOPZGAKQmOpo0Zur32BgzzoBsfUqz7u9EKEoxInYnnrg9izpwKnd1BPhRwMu8PkmYpyZGgw3MUl2nDeRllZKoGtoZYgnZjbksaZn9d6pnqWAZ6nBE8oWchXHqTOdSBVOS18zSOxSkRmfDAIjDiFcgw8KciJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747411435; c=relaxed/simple;
	bh=UEOKv11enIFpCK2oVRSy1ul3aPEAXc6EBGaVRdNt/hM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i/y6+DJWRVUZ8mI3MyTRR8j+6Ydm0twi4bqJYv3ND4lOW3wGW69mpY9dOoePc6hSN60veKIHMfEZpVAj4COiyQpwGWsltL4YksqM69LCiMAUfdWPi4hLPzs1qtnqSDFgiu3zAHpJa3/UI24nir6/sz8hoFhlkz76adhLuaQmUiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NHlOhMpr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qOpNI+uL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NHlOhMpr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qOpNI+uL"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747411430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtVBdKPTm7T943W3PPJoranNLaZ2FktfS3xeuVJaJVs=;
	b=NHlOhMpr27FKduk6nv3Ug1XL/kmTDeR8zj4XV6oVCP69DqQ9DHV7o9wr+7mWNzNgzR+m6y
	r5YBBi/3swe9aPUXKfKN6HPx6oXY6o6Jln407X1sMSr3fN2DprURf5IH3ZrPBd8CE+bTTY
	R5DYhHThjO+m4Z1Xakg80z+GegZoVj4sKzfbJNSGkAjZJ4I1uIA8okNlpk/I/1IKWWwd31
	4Mbdx/s7J62xRX3WwcQwx2ad3tI0fTylL9fRdvvxX8KRRsGTFssc6GjMZb/oVizyOT6f3w
	e51iM/rxQsMjhyH2kelTjxb5M1y5/UhbWUcgHg+NUs9LQeWjx3r2XCarQh5Z9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747411430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtVBdKPTm7T943W3PPJoranNLaZ2FktfS3xeuVJaJVs=;
	b=qOpNI+uL88mQrbp4GJ3ET/NDGKqnV071Fozcd9kpHv3L4j4ifPEGH404DqeityfBBJzGXx
	ToeHvWItNJFAXHCQ==
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
Subject: [PATCH 5/5] futex: Correct the kernedoc return value for futex_wait_setup()
Date: Fri, 16 May 2025 18:03:39 +0200
Message-ID: <20250516160339.1022507-6-bigeasy@linutronix.de>
In-Reply-To: <20250516160339.1022507-1-bigeasy@linutronix.de>
References: <20250516160339.1022507-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The kerneldoc for futex_wait_setup() states it can return "0" or "<1".
This isn't true because the error case is "<0" not less than 1.

Document that <0 is returned on error. Drop the possible return values
and state possible reasons.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/waitwake.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index b3738fbe83c62..e2bbe5509ec27 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -585,7 +585,8 @@ int futex_wait_multiple(struct futex_vector *vs, unsign=
ed int count,
  *
  * Return:
  *  -  0 - uaddr contains val and hb has been locked;
- *  - <1 - -EFAULT or -EWOULDBLOCK (uaddr does not contain val) and hb is =
unlocked
+ *  - <0 - On error and the hb is unlocked. A possible reason: the uaddr c=
an not
+ *	   be read, does not contain the expected value or is not properly alig=
ned.
  */
 int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
 		     struct futex_q *q, union futex_key *key2,
--=20
2.49.0

