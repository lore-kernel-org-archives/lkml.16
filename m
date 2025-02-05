Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63F122E402
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752000; cv=none; b=s1pCH4w+X3leuceDPnF9jopo/x2iQAx1Ya9Ro8jNPVMY9mXODeRJ2SExV/0Z4zNoEFUeuvq1KrwpMv/XnBkRz4jCWk+1hrrum6b2SKG6oDsrmhXdrKq9jI614uYsUOwx3mJeyhvvAL8rszrMq7yl+nykDLGvPnIENwnGPmjHwS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752000; c=relaxed/simple;
	bh=YP9HS0ptIzTEGC5ngli3p573WBUnzavxzSb8qjuKIEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N9QkNMQE7hb52VTEacGXepFlHiuwEAysdqIie6Vqn3L08WYQ3yZI0+I0Lb6lPPgOzkrzTZU4PS8WCim901CNlRXKVN/uGXsuZHoc8bI7k9nF9o1BmUgkrEAtTnOXX/quisDJmeOUOI6WLNlkscwWC/mT09VOSdzeBJY8kW8201E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uGkGTQUF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N9i+7Fb6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uGkGTQUF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N9i+7Fb6"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQNxZsLOvb0JOc8RLLPe5wcuFpbkYljvCLJQYULWDzI=;
	b=uGkGTQUFiSa/ABsiW/ub6veZTFhC+yBmIu674/3K4X5iklWfhvHoQ7QgEZKi2yna5BBkid
	gAve7/gFdp7gOQUPsFkNY4I0TE3DRKd+fCeoyQ695fzkz2L+ds4/ejNHBhGhWXgIc+wOYR
	HIsPBKzyFMHnnZVpLY3VajZv0aRDJm1ycCZsr4j+b28m3xYcKsXveS/QD0O6nOapCMqBBU
	T4vOja83JK3CHa8neN1+5kM5/eG2SWaSsxWh1OMGF152pC9OiRmWN2UZSFbBI4c0Tqrgf+
	DGLcu+u3GblgCgE69oOp3nljlI3KPruSI1Q6VCaY4F9zBGY5ybcEFXpwkMs7bw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQNxZsLOvb0JOc8RLLPe5wcuFpbkYljvCLJQYULWDzI=;
	b=N9i+7Fb6fXh97OOlAqu6latl06ZW0/D1xpoRgHa9qQF4TFtXSJAlGhvBMfINhQFGVgWoKf
	6j6uBFvrcvXSPKCA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 29/31] PM / devfreq: rockchip-dfi: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:13 +0100
Message-Id: <dfb35fb45eacdba7b8767052aa8c29ca157ac1b0.1738746821.git.namcao@linutronix.de>
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

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>
---
 drivers/devfreq/event/rockchip-dfi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/r=
ockchip-dfi.c
index e2a1e4463b6f..0470d7c175f4 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -642,8 +642,7 @@ static int rockchip_ddr_perf_init(struct rockchip_dfi *=
dfi)
 	if (ret)
 		return ret;
=20
-	hrtimer_init(&dfi->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	dfi->timer.function =3D rockchip_dfi_timer;
+	hrtimer_setup(&dfi->timer, rockchip_dfi_timer, CLOCK_MONOTONIC, HRTIMER_M=
ODE_REL);
=20
 	switch (dfi->ddr_type) {
 	case ROCKCHIP_DDRTYPE_LPDDR2:
--=20
2.39.5

