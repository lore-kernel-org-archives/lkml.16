Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0EA22E413
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752000; cv=none; b=QSkmTqTQcQjZa7vWs0zrzCaeqBAO+eaiBjfN5tMb5S6MSVuoNuuPEY2QBJ32ObL/Ps5cphikwuQWbxGqT/dUZx/qrnMaG3/mBkmU9k9VL+IqzJlnMuzVcnLGEVYn3xsPnxGygDecPv3XoChQlVKwH90ygg/U3Gdj6bw7c/Ocogg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752000; c=relaxed/simple;
	bh=bYsHlKikMLRNHtZBFjXoHsPnWT52wEwdSd4/ICUqqxo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t0ZpKnZFkqQBXaWk1nS5rEzFXG9CCVyBrgX7oEbjtAhsoVreUbWPQkBPLNi7mSWtQCNs5l6FB7LPXiwmVxG/q+KNtokwmjhQ3896z7fCGXrthuifTVq6jj9+uBSqgFyGdvTJ2M2uaHoZdOBABccIkQ22A4O0RadzpW6CpHpjFwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BygJ3IwK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bFZTKcbo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BygJ3IwK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bFZTKcbo"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlZUudkxKiwKydn8CFoyh2y5DXuLVq+t1A6J7dtmCaw=;
	b=BygJ3IwKwe8gthDEq7WjtOwOOkk9dR25Zh+VWxtxNN+dbu29p45J4CGnH/mwwkCbZ+v4es
	AsUUVcynQZCCyshiRMn03+xovBVyXtB6s+EeaPE2vD0N/n8Xj4lzejWu4VH+7G4EKgWqkX
	PZcKMThnS638KXxpf0q37UaUdA7TfXdWNU1STf66+vgDNWLEiWWGoLeaXdbr+UNgSM+x2c
	nZlwJdndOQmzteQdOFyGfuxM3t3NIrnjwn8Cj9dt0W9RxtGn81KmbrxJ4JBjWTfX/hQQck
	G7aENp4Art76+hoPB/Yi94m0PU1P3IYRowGdIDFRRUOiLK0z6qZ2pnnz0hrc1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlZUudkxKiwKydn8CFoyh2y5DXuLVq+t1A6J7dtmCaw=;
	b=bFZTKcbonLLW8IGR0gMhPAny4+GE+mLbk7v0z0i6xWas9isxJq9digdcggHBs7qG54AucQ
	piC5EePY6rCcHMDQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH v2 31/31] hwrng: timeriomem: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:15 +0100
Message-Id: <010640f1668d40894a1721037c56f7a684dbcc5f.1738746821.git.namcao@linutronix.de>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>
---
 drivers/char/hw_random/timeriomem-rng.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/timeriomem-rng.c b/drivers/char/hw_rand=
om/timeriomem-rng.c
index 7174bfccc7b3..b95f6d0f17ed 100644
--- a/drivers/char/hw_random/timeriomem-rng.c
+++ b/drivers/char/hw_random/timeriomem-rng.c
@@ -152,8 +152,7 @@ static int timeriomem_rng_probe(struct platform_device =
*pdev)
=20
 	priv->period =3D ns_to_ktime(period * NSEC_PER_USEC);
 	init_completion(&priv->completion);
-	hrtimer_init(&priv->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	priv->timer.function =3D timeriomem_rng_trigger;
+	hrtimer_setup(&priv->timer, timeriomem_rng_trigger, CLOCK_MONOTONIC, HRTI=
MER_MODE_ABS);
=20
 	priv->rng_ops.name =3D dev_name(&pdev->dev);
 	priv->rng_ops.read =3D timeriomem_rng_read;
--=20
2.39.5

