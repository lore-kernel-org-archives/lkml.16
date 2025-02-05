Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D89D22D4E4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752244; cv=none; b=s7s2fHSWgee3TklOIcHZDQGvjSVsZndscVRu/z2MpiTW7vrDa9qGWHiM/4+RnPSkTaP06ttrR+RpabLzpjHRNYRDomaYbFREfcD3eQnxG79RaYF0Xga3EYbDsm+eZ3L1SzA3rd8j3fvSF9769rfxestJ7xxgifnbdEOJBTU8zIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752244; c=relaxed/simple;
	bh=bWAmgvL8Q34pHHBcCoZLxSJ/TleZDA4YnIXa8s01Rlg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OaONUJNxRZG4wgyrfn+HF4ETarRiYkNUXLj9rXa9YcvvoIOzYJTqbJL2aQ7scSRIBJuMBYwhw32k18ouTlsGyAa/uA8gZHSP9t4YOtax1O1uZ3W5oa1NnDI1QD9P9cQFK9ZqN3wDW2K4Y8RUd+y30D9quNbDCxnpoGrfaCyzqEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OdwENkv3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rI4TChHn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OdwENkv3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rI4TChHn"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7+l+bSFOf1AIAubKWoKxwbu1mYKkSTXIgD44N7Bug8=;
	b=OdwENkv3EdJfDwbCfgi3CMLKPEWqOCCyvrUEevj3kvFn8smJNUXGm7fwMzfhDcGLfTc7qc
	436226HBvnkT4ZlTxCMBFSzqbfJxHqsSWKeYUeS4KQq7120+a4s5UCpL5WYElEfKMrOMOE
	pOt9LK/8HXYk++Xi//WWekBZJKl0p4bwhWSs4iLpfo+y8tcHr+RkFpn5WQ+RNhkJy/EIYe
	zI9mVRzKSW3LUUmg4n9zfq158Nd6q9XqddETkzfjJgAfCr0Yec9/KQYOH6GTf+i1TRqfkR
	Waqn8vVnnSa/U1imupcI6FaPKIKwFcyr6XDh/gC481ktcea+vvQr7qMjvKvKiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7+l+bSFOf1AIAubKWoKxwbu1mYKkSTXIgD44N7Bug8=;
	b=rI4TChHntH8OH2NtaREpnPCUU9f0aEugIJmXREgQTvd481fAOOdcNx0d78Qpz5y4hZqIfC
	x2Yn8Yd7Xi6CMiDA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 10/24] net: ethernet: ec_bhf: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:30 +0100
Message-Id: <2d8fcf9bf83af507f1ca25cb068af2ac32cdcb2c.1738746872.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746872.git.namcao@linutronix.de>
References: <cover.1738746872.git.namcao@linutronix.de>
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
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 drivers/net/ethernet/ec_bhf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ec_bhf.c b/drivers/net/ethernet/ec_bhf.c
index 44af1d13d931..67275aa4f65b 100644
--- a/drivers/net/ethernet/ec_bhf.c
+++ b/drivers/net/ethernet/ec_bhf.c
@@ -416,8 +416,7 @@ static int ec_bhf_open(struct net_device *net_dev)
=20
 	netif_start_queue(net_dev);
=20
-	hrtimer_init(&priv->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	priv->hrtimer.function =3D ec_bhf_timer_fun;
+	hrtimer_setup(&priv->hrtimer, ec_bhf_timer_fun, CLOCK_MONOTONIC, HRTIMER_=
MODE_REL);
 	hrtimer_start(&priv->hrtimer, polling_frequency, HRTIMER_MODE_REL);
=20
 	return 0;
--=20
2.39.5

