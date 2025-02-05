Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFF522DFA6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751999; cv=none; b=kFwdeuDBzv/7nB54U52lDVdaSdCer4gq7tBEwi9RdLmVvFSpZvudaWD8U0bLaZLV1krRB75kgEjHOBzTq4GCNYQlnDPtQDnIjv92VP6bS9ohL3viA8AAbEEiYYsweKBn/YaWkRWNRa1tW09LaH4WiXK68vNFJhlgJ6+JqA62chY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751999; c=relaxed/simple;
	bh=cjGLDB4uw7VJdeD9v7ShG6mzkICmyEUJnIKg6kx80YY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fujCAd8pS/NYJn4CgIDVOiOVZspf8qKWbTAz8xJxY4Jng7AZWuhNz3aa0J8buswIn1KSZmCo+gfwhhKMEKbFXzy8gq9/fK6/fmk3Vb0q3I/nYhdRjs9I/Yxmn5YYUvx7Ji5FVfTa2heSJRc7ZYByS4Z3gMB8ca101A8tcWuOeVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WRMvQbwh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yxR8s+o0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WRMvQbwh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yxR8s+o0"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lPFQmOLrJY7Wod6zKIr9KTO2ridC0Dt/GDqBloeipRw=;
	b=WRMvQbwhNpVbf3lhgP+ghTYmjLOtIBiCOT2/zVAjqwrW0ZwtzmMfADVV+u95Lmd4a9n/9R
	96et1kCGdYWUveBHbUxg3EI8uQNrvt5nXzzysNqsBL2meDVCyu498G5T07nKFP/P8ZQNXj
	W3Afpz2uWYkZE3s7Mk50b/z/CVYrOyGX4tO8IDwCNOT1WpNdHtdECkLLPgG6nRJrQ2QAlq
	AkdNsLigm7winYg6Bl2HHWfRe3qgb7g65/MyPJUmx6JX3HtvDk1g0x8dsqz+x8UooNZRXD
	OtKiGRse7Od7th7iajyyZhBivdkgCl8/HB7iWF/JeoRU1G/THXCuK6jhQPoGDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lPFQmOLrJY7Wod6zKIr9KTO2ridC0Dt/GDqBloeipRw=;
	b=yxR8s+o0BVP8XUqjgeXS0yTPQ31Y9/7nIUP6NWWJcjVRSDDUpPPbY3aX7lIuXBgaMDHZPe
	cGdENvNaBrLnk8AA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v2 25/31] block, bfq: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:09 +0100
Message-Id: <d0d57e1dab46b617856dfb93c721d221cc31ab0b.1738746821.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746821.git.namcao@linutronix.de>
References: <cover.1738746821.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely.

Replace hrtimer_init() and the open coded initialization of
hrtimer::function with the new setup mechanism.

Patch was created by using Coccinelle.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jens Axboe <axboe@kernel.dk>
---
 block/bfq-iosched.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
index 167542201603..abd80dc13562 100644
--- a/block/bfq-iosched.c
+++ b/block/bfq-iosched.c
@@ -7315,9 +7315,8 @@ static int bfq_init_queue(struct request_queue *q, st=
ruct elevator_type *e)
=20
 	INIT_LIST_HEAD(&bfqd->dispatch);
=20
-	hrtimer_init(&bfqd->idle_slice_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL);
-	bfqd->idle_slice_timer.function =3D bfq_idle_slice_timer;
+	hrtimer_setup(&bfqd->idle_slice_timer, bfq_idle_slice_timer, CLOCK_MONOTO=
NIC,
+		      HRTIMER_MODE_REL);
=20
 	bfqd->queue_weights_tree =3D RB_ROOT_CACHED;
 #ifdef CONFIG_BFQ_GROUP_IOSCHED
--=20
2.39.5

