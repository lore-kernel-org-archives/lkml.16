Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75292066F5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041478; cv=none; b=FOTJIjJdcD6eOExNkTzmFsxwOKZBWFks1XBfujOAX7YzAeJj12g/fQ0Elnl9Umpf/erZfzCgCWSrg+TGSLWb3uqTDk2h5OQ0Hor/p51cjlXSnLQEwmbPDoR2bhqwgIJtMj6qiR/KX4B1TzMZtp+Zmorvq4xm6hZb7kAeufRI9Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041478; c=relaxed/simple;
	bh=/HU00ieQBIUIR0aAgwtAN1WOYXF/cezNNGTBq+PfTj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgAQ9U4yKZ7zFLR/qRq0K+bTuWN60Ar/diHHLuQAq7D8YLFhmnFbNdx0w0LyMY1VOT71nUzUUbnHYd7XGr+T6eV0APz9KWuJVhyhH0gjOhdJDxVt34n00KqYzSmiM27hEZjhcvQ9ietW0TLkqaUcDSFeFaElrbZmqPE6nZq5i6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Pp1WFIHp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KfNCIMb2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Pp1WFIHp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KfNCIMb2"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744041472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j6vUDPLxCGc9wD33fZGUNE2aAZ3Nc4AuJ6xxO4D9DEk=;
	b=Pp1WFIHprgEf6yzMCMNL2nJahHzgk6prLufkk2k0MT7CsiQr0Esvx5TftIwHMrWXdnytA6
	t/iXbCrF1AusTOjeTxZmRjuAVGHz+i/IL5sGbFoQqIM3n3jxn+8TXm4OhNOed93JZMsUZ0
	jTEu6wO0eD3UtNuC1mYbqA4EBS0fpKjTU0xBmA6lh1ESeDhRUY7IFnAV0q37G/e5Eljrd0
	uxu+/8SFUu2ZqmVi61pHa4DOmXyjjAb+9oanP0YeuYg3tVxt9asisTEIv9rYvsOqZIiiCW
	4cIoOhkoxKs4P28hYk39A55/aC+/orObdWnwZ9oWRUkeccRX1/ysHUcOazlekQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744041472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j6vUDPLxCGc9wD33fZGUNE2aAZ3Nc4AuJ6xxO4D9DEk=;
	b=KfNCIMb2lkjrLdQNYPc8YAgL0bI2WPzoajmciWfWpufAJV8zr5H2RmlSKCw136UNapnprN
	kte/EpTKjkbVbrCg==
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
Subject: [PATCH v11 11/19] futex: Create helper function to initialize a hash slot.
Date: Mon,  7 Apr 2025 17:57:34 +0200
Message-ID: <20250407155742.968816-12-bigeasy@linutronix.de>
In-Reply-To: <20250407155742.968816-1-bigeasy@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
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

