Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC7022B5A1
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751999; cv=none; b=GtMYIRVlUOpzwttrIItlplU3au7eM3Qa1uGBckYx+1mbZljQZyCay79AZJ8bQ9TYDbb/2BEplZ8MqahLHp6N5aKSnffJlNq6tf2BwzJ4h87YDoLrx1/wnJLDeIwWO+qTUXN2Nby7RdmCI59brO9jXgljKzc/VvgWMB35pUCGYYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751999; c=relaxed/simple;
	bh=WDk3Pj+/QXFG7eK+JJZpo2nBVqSOunm3oDETZwEO9s4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sFHd/iEP9HK6ciogWFAetvGhPXvW/BKToE34SXHifqwCIUDwPYpL68dpsH/6Thu1MB74bj8ri2vHuTMCs2ZOh7XeEvYmcUZX9WOTL4FTDKCcQieBCe0iznBV2Fg+5kzpc19ooztw7tqRwU48zx/J4KP32tJ3NB+v36KIj1078CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BnJzlwd2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zDxii+3z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BnJzlwd2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zDxii+3z"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOiqioWOP7P055aeqZ3YUvgPYLoNFmwmd1hHdXSmsdU=;
	b=BnJzlwd2TB28sdTyxrbWEY595gfcSSZZFp/8SLx4//x5oT503vtOIfeRNCmWNPlZ3GpyV7
	8VVXzEc2aRRRQGAz/sWdu2AgHNytDo8DWqBgdr4lY4EfgxWKoQAHn/1a8ITxKORafvHOMp
	dU3ww3NLUO60p173pwzY9snz3JJo8ufuBL0alOXj/cF9SQCBB4+i5xn4ivipUBeOddbtG6
	cwj98d9AMH0kLDV/Ed32rzn8MsABb0clIAWXAM8Kfl6i66IdOeFjHxXtg6ZDeVu6M647mR
	JPH7Q0qoJlEpIYlHkwZhrBateu3EPhP7bjXS0wtiA9soZKDwTSvDZ2jh1ZIoJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOiqioWOP7P055aeqZ3YUvgPYLoNFmwmd1hHdXSmsdU=;
	b=zDxii+3zGTvSzG2f6YZhpsameWO9IcOOoxEBpP/KdUXqR6zITCCbP7JA4BC2KNc4T3dByO
	B45xEeetD88sXrCw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v2 28/31] PM: runtime: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:12 +0100
Message-Id: <8d1ce108b043896733ce08d3deea6e84941d499b.1738746821.git.namcao@linutronix.de>
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

Acked-by: Rafael J. Wysocki <rafael@kernel.org>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/base/power/runtime.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 2ee45841486b..425c43b2d478 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1764,8 +1764,8 @@ void pm_runtime_init(struct device *dev)
 	INIT_WORK(&dev->power.work, pm_runtime_work);
=20
 	dev->power.timer_expires =3D 0;
-	hrtimer_init(&dev->power.suspend_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS=
);
-	dev->power.suspend_timer.function =3D pm_suspend_timer_fn;
+	hrtimer_setup(&dev->power.suspend_timer, pm_suspend_timer_fn, CLOCK_MONOT=
ONIC,
+		      HRTIMER_MODE_ABS);
=20
 	init_waitqueue_head(&dev->power.wait_queue);
 }
--=20
2.39.5

