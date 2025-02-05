Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0287622C35E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751995; cv=none; b=hrH+Tq+7lYdENmccwGA5vfLooF5XgDom8lRYyMbfaPakXQA/SjmX6fIh+HO5ywQ4buVGzuObfY9f6TOmDOWHkA5z+NgTb91NHTvTlrXF6RjYKWdbdlvCN1qBfDsN5Jg/auzqDLI/gtroMag8REviuU+dJdALYmqR4JmlfxUV7n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751995; c=relaxed/simple;
	bh=X1zs9uqKGi8uKdjEt3XVg3WcfuXPHIdBOG9LeRMoQH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hiqXUnsJ/1aLEAURH64roplNsE7cO4Wi96RIAXCtNSYSVQtMh07LpW8lE/Fj2R3YCPYAwNDc5EPD7XMPZBKsNJoOxzLQS0Hn+1AW9/FGTSF8nZmx8o/GJxCXfveEWm+gwI4qR2fU5RvOO5MRrcbsoy9cm1Eiq/em7goNYuttHuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ss0gwx2J; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5NY5bxDQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ss0gwx2J";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5NY5bxDQ"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aqsFRu2Tbr71eXe3T9g4bJRh+N0SdDyyC7qIzDx3xRA=;
	b=Ss0gwx2JmGTgLfzw6fcd1rtWQJqZIwZwAYpJHsahRaipi93nj11z4juqkKbNyiyReS2i6a
	DkHJ7XIt29lt/KUSytttKmFBHUgL95PyNFlZwgrMUztbrpoYi/DBYVbSJ4eTv8bOb7RB2T
	bRSSM0oRkykwIZ8S6BBo0WhRNAiJm/2AKhikCj6Vy+RtCgNZWbFMpFbbhLXd+LbJev9Goz
	wS5DeP8fW1JQDKvgH6Pew9JCK0jh97b8hng+3EkYhpVHFSKwSc9qwm0bY3q8v8YX4M4j5F
	6SLG420stBu5T5JnJ6yeO4ayrqwegks1m2kF+RX21CbufLVXZZj+NLL2o4u3gw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aqsFRu2Tbr71eXe3T9g4bJRh+N0SdDyyC7qIzDx3xRA=;
	b=5NY5bxDQwmILpP00IbTesi/Hcr0Eoo4z1qb9l/fx/kKNC26Bu0503DoJMqbEyHFAMNR3Po
	j5gwURvPq6dplsAg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH v2 12/31] s390/ap_bus: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:56 +0100
Message-Id: <d8a3919c09caa671e64d9f9bbf726aa8a885a844.1738746821.git.namcao@linutronix.de>
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
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
---
 drivers/s390/crypto/ap_bus.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/s390/crypto/ap_bus.c b/drivers/s390/crypto/ap_bus.c
index 26e1ea1940ec..62feb2c639d5 100644
--- a/drivers/s390/crypto/ap_bus.c
+++ b/drivers/s390/crypto/ap_bus.c
@@ -2326,8 +2326,7 @@ static inline int __init ap_async_init(void)
 	 */
 	if (MACHINE_IS_VM)
 		poll_high_timeout =3D 1500000;
-	hrtimer_init(&ap_poll_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	ap_poll_timer.function =3D ap_poll_timeout;
+	hrtimer_setup(&ap_poll_timer, ap_poll_timeout, CLOCK_MONOTONIC, HRTIMER_M=
ODE_ABS);
=20
 	queue_work(system_long_wq, &ap_scan_bus_work);
=20
--=20
2.39.5

