Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE7F205ADD
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591188; cv=none; b=lIq1JQtMFnkuuqoxmI2c9N6ErC1jQafLSLmMQTuomj8YhjpY+e30HXQNZ17dLd395KUSSJ6o6vHavTMlYIBCRMYMyUUMSdBcWTnKxZEtpx/+BIzIXF/9o5aUpbqzM/bj9c5rV7XQ7UtDnVqAcX8vhIXPkCPvp/2U6+i0cl2D90M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591188; c=relaxed/simple;
	bh=tQ0PK3PxF+Mh6rd67NIZ/6W+nOrnjXuL8xhzSXA7qDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikgN8JUloE48B+EVnzIt3K3SFG79x6xGxdt+Q2GAKIob/NNzSRcznd5D7aTE8LVxKFwYS2FXRakpEyGjKO5oLBm5FSS531Mgt/ZHrPGzDd2a7JH968KUVN1YJnGNazD9U1uBhYB/YKq0340IHkvk9KTVQ9l7VDfnHULTLLrEUok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IIYlNcfU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X2H94ubr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IIYlNcfU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X2H94ubr"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lA7nLRMSPeonOj1Bx6zFLlkUTG+IdFmNM3dz0lX9bDA=;
	b=IIYlNcfUI6QrlaOEvYeV56VgsuxQQtuxGVrnKRXL8gJNBVupG6BKtcik49pQ7U/IMRr3yT
	jkYMJu6q4myqfSEiN9UpkPnqg5tuhmnyleUw5p+1fhmxa+RtSvapfYOkZBiaXsfVzgJwEC
	8yn//Fu7puA+bOugbmEMSTDO2gQZtbzUV2Y0OdfxKwgpfVwz6xYGEB1I9tDPuLnTjouvho
	rYvbQUW5AcHFSueHYMJMe0eFHzApw3iN2gt5Htt2fKrZqP/ewRQNETkNUkKbsemIX/e3j5
	j5UpA5oK8YUp0D7ujvKlvxCpRLtMZxBHfkavdK3gwWRsmu6oYcEi56N0P/JMZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lA7nLRMSPeonOj1Bx6zFLlkUTG+IdFmNM3dz0lX9bDA=;
	b=X2H94ubrQ8HuUlmEJOolniCAcYEDtNAVVIciDNc87m0QUJ58vFzxiOPQgL5HRPf281c1zN
	FFKFxvdCrdGG9QCQ==
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
Subject: [PATCH v8 02/15] futex: Create helper function to initialize a hash slot.
Date: Mon,  3 Feb 2025 14:59:22 +0100
Message-ID: <20250203135935.440018-3-bigeasy@linutronix.de>
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
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
index ebdd76b4ecbba..d1d3c7b358b23 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1124,6 +1124,13 @@ void futex_exit_release(struct task_struct *tsk)
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
 	unsigned int futex_shift;
@@ -1141,11 +1148,8 @@ static int __init futex_init(void)
 					       futex_hashsize, futex_hashsize);
 	futex_hashsize =3D 1UL << futex_shift;
=20
-	for (i =3D 0; i < futex_hashsize; i++) {
-		atomic_set(&futex_queues[i].waiters, 0);
-		plist_head_init(&futex_queues[i].chain);
-		spin_lock_init(&futex_queues[i].lock);
-	}
+	for (i =3D 0; i < futex_hashsize; i++)
+		futex_hash_bucket_init(&futex_queues[i]);
=20
 	return 0;
 }
--=20
2.47.2

