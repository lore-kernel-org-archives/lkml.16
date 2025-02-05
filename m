Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EA9236A64
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752427; cv=none; b=jSbUVwDeoS7DRoIM2C0GneyV8oc8KOKt9kkRYi694AYEBt05pOU+p3mVhpLH4Vmu7xKRGqKcoRoQTqblgWdQzLiz8PHcbbza22+kGLFJTGxAyBiV56G5OOpuX2J5BTi0AdkCTTPhK1K41VClEOcjSXnytr+G7RJdpsHwPExjBlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752427; c=relaxed/simple;
	bh=RFLYUzbalhETD9CyCFmQSUv5KmIEk+DmHSLgayDdvTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N+I3+QCDdrNMjrz4FWETaCNtkeQrZiC+ps6qFoYn0pakxaTeW/nT7hEq0ji2cpxavPJX+U9Kx/vlEYknBeladsZ+O+uWvXRVTDyAe60nKfNeKRJyAZC9Wd/LY2H4rems+RJtwZA9X0/YZsCdHxMToxuJZexJnVsB7V7jTuYwVgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TE90k0iM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AwPRy24y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TE90k0iM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AwPRy24y"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZohldlZlnrCImAsUW/zApiBKklUGRKifvgPCxKR9QU=;
	b=TE90k0iM7mTnjSYXjJJ8xe+ce+ieTdYwjJPSCM0UcgLGoJB6dpT3hjgNUeiK/f7jl1FMTP
	PY3hA0ZsnBBMwhS0cXuliQE+YbGcnTSLt/m70G8udDgRWPmkK9iBIzAW19J7yGvEMoo7SZ
	XLKNkEe1DaEWTVqgJBo5Z/k2qmEXhLWzgOjVVVlOsD51xVUADIUHdZqz0juALIRZ3igGMD
	S2Vb7I7kK276pRSMTzBFeTrfkLBz/LnMAWTYaEEN9ot7XZbGE/272/nilVWhhpFTmnoTw0
	0ds0CQRyQpdSz3XU6xSSKQWI7S/WIhVyMZBvSYgg9e3ki5CzhV/8RfDlQBa3CQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZohldlZlnrCImAsUW/zApiBKklUGRKifvgPCxKR9QU=;
	b=AwPRy24yFiP6eouH7C+z3a1KZ1C4YslMwfav3VXWsEqWkOem1Bt1TtJlVkL2KtK1wgyAWP
	HJwEi4E+UfHKXsCQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 34/45] drm/i915/pmu: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:22 +0100
Message-Id: <71198b93c438866fe2be7323e59cdbf21aa0d493.1738746904.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746904.git.namcao@linutronix.de>
References: <cover.1738746904.git.namcao@linutronix.de>
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

Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/gpu/drm/i915/i915_pmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pm=
u.c
index e55db036be1b..0ce87f188d11 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -1264,8 +1264,7 @@ void i915_pmu_register(struct drm_i915_private *i915)
 	int ret =3D -ENOMEM;
=20
 	spin_lock_init(&pmu->lock);
-	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	pmu->timer.function =3D i915_sample;
+	hrtimer_setup(&pmu->timer, i915_sample, CLOCK_MONOTONIC, HRTIMER_MODE_REL=
);
 	pmu->cpuhp.cpu =3D -1;
 	init_rc6(pmu);
=20
--=20
2.39.5

