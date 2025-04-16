Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF7C218593
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820974; cv=none; b=ROdCKcFJeEPH/L/Dxiq6vr7mm9iil650SPXhAJdCJhdBf2GUPFiPKg1rcZDosA0xyllwROj5sY1lIfE0ogU103+b1onYhWynNQy10fPcP5fIhJjrDKBqMlMW4QdIYu2gq+R8m2AV8HkdKjee3OUs+p3N8saY5+f3Ve8N+m7HwOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820974; c=relaxed/simple;
	bh=/HU00ieQBIUIR0aAgwtAN1WOYXF/cezNNGTBq+PfTj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nnDLGjFDDB0Cd2ct+IunblxU7YGPV341qO5c8EksXis3ZURATLrpHUEGD3/VcR0zNisjPQd8tCLP18ILb5T6C1cLS97r176gQyJNUtO7rlPwFNBFDE/UcsPeyMzaNZzL/xGqYH7VVSSaKMEwMDgQwXyQ5ezxrok01LLGjWG5diE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NlaJcZrQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DQNvwQ7m; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NlaJcZrQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DQNvwQ7m"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744820970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j6vUDPLxCGc9wD33fZGUNE2aAZ3Nc4AuJ6xxO4D9DEk=;
	b=NlaJcZrQScjEmlBuKYmTydsoEN07cDRv/EdvY9ds5/iFLZ97q+n4FOpRs8lWJ9UHyjnDeQ
	M3pD12pLgD/+WHPbFcctColDQb77Qcrwoi/GTPDZ7+FL8BdfokniLbyQKY91EGMQTO/uky
	85xKW4oEyPhaxjgu7FVIk68NjLmEaqS5r+i+xKVa5PscdNghsYUwv0OJjecH9gVoXEL3+1
	ziz8FpADwSx9blGP6homxKK+9LMSrW8NV0ZeUJ/zti/CDJ+Jx/9EJYK8C0Sa3tZPvC62f/
	ubaIx2yH8kCu2742mQ/PHSGq3Q64cCYlDPeTTwAOoBFmh8mLKE4aBqTouv0BoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744820970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j6vUDPLxCGc9wD33fZGUNE2aAZ3Nc4AuJ6xxO4D9DEk=;
	b=DQNvwQ7mnpj5ycM87W5QO/RBkaCCuc+mNAE3LbXn0FTx9R2AkhRdeKVMJaeGIVEtAB1VAr
	rcj3ds4eQytpp7Dg==
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
Subject: [PATCH v12 11/21] futex: Create helper function to initialize a hash slot
Date: Wed, 16 Apr 2025 18:29:11 +0200
Message-ID: <20250416162921.513656-12-bigeasy@linutronix.de>
In-Reply-To: <20250416162921.513656-1-bigeasy@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Factor out the futex_hash_bucket initialisation into a helpr function.
The helper function will be used in a follow up patch implementing
process private hash buckets.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 1443a98dfa7fa..afc66780f84fc 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1160,6 +1160,13 @@ void futex_exit_release(struct task_struct *tsk)
 	futex_cleanup_end(tsk, FUTEX_STATE_DEAD);
 }
=20
+static void futex_hash_bucket_init(struct futex_hash_bucket *fhb)
+{
+	atomic_set(&fhb->waiters, 0);
+	plist_head_init(&fhb->chain);
+	spin_lock_init(&fhb->lock);
+}
+
 static int __init futex_init(void)
 {
 	unsigned long hashsize, i;
@@ -1177,11 +1184,8 @@ static int __init futex_init(void)
 					       hashsize, hashsize);
 	hashsize =3D 1UL << futex_shift;
=20
-	for (i =3D 0; i < hashsize; i++) {
-		atomic_set(&futex_queues[i].waiters, 0);
-		plist_head_init(&futex_queues[i].chain);
-		spin_lock_init(&futex_queues[i].lock);
-	}
+	for (i =3D 0; i < hashsize; i++)
+		futex_hash_bucket_init(&futex_queues[i]);
=20
 	futex_hashmask =3D hashsize - 1;
 	return 0;
--=20
2.49.0

