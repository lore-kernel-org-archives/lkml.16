Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF622D4E3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752244; cv=none; b=XyZii7BELrCzPHt4lwOCzagGDbxfIKuQVUtTLNxlqcQ96ePh+jm89gDGzjMCwIJgmd7CWWNhgnl3Xm4m08vsffVfsheZxfkBqoBxzYTg/wPmP6WpHxMW6jcBEonSBPfY2RE4gXwZ7wWKnzLEfitNqABIlp/oPPyELQGmUxxVVuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752244; c=relaxed/simple;
	bh=Z/GBlEe99x0eYrCI5NcspUJh9vqNI4BOMKtDhh9RGsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DJzV76Eomj0U/jvIIY1fIuNVnU4iXn5jLcai/AixOJeh0IEBo+Mp/JzuWbkpsswDNest4xKF3kPzC6rI6tHDnLtqmEiuMw+HGpFRUR/2Nrq8WUAKBv8qLbpp/vhltOfQKK09uzyn3LSWC5AwM1iuYE4YJRAgfA/M6QcbOQGj9q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=icY5uib9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=q3kt3zD5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="icY5uib9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q3kt3zD5"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCwyU1L7BPQVGFnF3IHYTdxsLytt07nkQHlLaVg8xEQ=;
	b=icY5uib9ebsNbQR4JdMf+Qze8o+/o36oiKAOSIzrN/2Yl0AHfvs/Tel4574RYNHTSuGyL2
	4dX9QOy/PBV9XtnsIVIjCK3187MAui+ViGWlr2+gCwZWt8A7lcSd/smdMwA0WDNL0m9W1K
	Si7TXOH3IWbbMRqQmQVbMXcSr+k3zTWDlhaSndd+InDBODePNUn3RIHwAT2Ac76ciMQy7s
	xR0CW0Bzweeq+8YttMFyxYObMt/0SoGUBzYB6VNH6onmBLePrRFf9Q29hrYC5kXREpdaGn
	S0Hbx8puTDJsBlFzfy9X6wR6QmznJbrqbYRjm8uYp2q8uNbphf23StJ38BZ3GA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCwyU1L7BPQVGFnF3IHYTdxsLytt07nkQHlLaVg8xEQ=;
	b=q3kt3zD59WbaO9/g678oOTvv3zftxVkW2TxcsfR31AYGyptiay8Sd0C1SGFWatDR7fATj/
	nWN51+x9oCRvWdAg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 05/24] can: m_can: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:25 +0100
Message-Id: <f1a87fcba211f6ce262a2d23fd152185f452c32d.1738746872.git.namcao@linutronix.de>
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

Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 drivers/net/can/m_can/m_can.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.c
index d025d4163fd1..884a6352c42b 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2420,12 +2420,11 @@ int m_can_class_register(struct m_can_classdev *cde=
v)
=20
 	if (!cdev->net->irq) {
 		dev_dbg(cdev->dev, "Polling enabled, initialize hrtimer");
-		hrtimer_init(&cdev->hrtimer, CLOCK_MONOTONIC,
-			     HRTIMER_MODE_REL_PINNED);
-		cdev->hrtimer.function =3D &hrtimer_callback;
+		hrtimer_setup(&cdev->hrtimer, &hrtimer_callback, CLOCK_MONOTONIC,
+			      HRTIMER_MODE_REL_PINNED);
 	} else {
-		hrtimer_init(&cdev->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-		cdev->hrtimer.function =3D m_can_coalescing_timer;
+		hrtimer_setup(&cdev->hrtimer, m_can_coalescing_timer, CLOCK_MONOTONIC,
+			      HRTIMER_MODE_REL);
 	}
=20
 	ret =3D m_can_dev_setup(cdev);
--=20
2.39.5

