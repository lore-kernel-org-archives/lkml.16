Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E462122B8A7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752416; cv=none; b=guHagR2fvvW54Vzze1J5FZDpqT8OtwhOq+rVL09OmkokrCDOnlZDwTVCh7BgM6e9yAcaNot4zZnSPj92rnKCOBFTQSNyTxYQcvC9xRKLpTiOrob54QoiHH0xC+9V3GVLfQDoAJx+cIDjVj5g2uUajyK9Iimg5rlp2S0EwvLbPAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752416; c=relaxed/simple;
	bh=4wFcTX3wMnVDoO3GkNbuopZ53RpcdlNMKNXdbqe9f88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lI2rJWQIw11kXaIgkjxcehVHxHe5xbdBImSZveilvfnIn2s9wHUoQ2RrkD5pktjL4DegpVAlg21rkk5jRIl4rkgcRIhs3LSjM2FuiaHw2TJaKAjn2qgAZXaLLGlA/193Hv5bkh5wVEXFTgA9TspXEwdDTXMeFGTX9JlYkty1tto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cUbkwa8o; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3F+gZPbw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cUbkwa8o";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3F+gZPbw"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9sPbT35dj6zGty1qMvXfnsZKqYf1bYS/WfOmBMbiefg=;
	b=cUbkwa8o4zpk+XxyHb0w5ZMCk9h1zDutyziPwVrMIpBu4jf2yzBmOY4L6NA+X7qkcnB3PC
	rIk02dWXqKgeKzkfHtCalhx7vukohDcnbjMF6SXRWnBuxZkTkV7fmpKDs+wtxyH/rj9gqY
	vLev/uTdU6GGQo5sS1Lbg2wMNPEOvSns7ordcNf/q/2mZ/6DsvooUZKr2kmCitj9jnS3xD
	X/oEkQDeI3x7uGiluR10jev0CYPz/DQvVB3XMVFablyEHwHYXbkxy8z8c37t+Ni6YqvQ5p
	tglnV1i6Pwh+5H++MWzlD7yohMXL4vZl9mkFVv0DG7PdR7y0bUVh0ORTWRrcww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9sPbT35dj6zGty1qMvXfnsZKqYf1bYS/WfOmBMbiefg=;
	b=3F+gZPbwgf0Xk/ApN+OoXVUUd80Mzhg9qu4I/DHm2gx7zS8Fk9iZuX8aizfmHeOegx3WZk
	n1g/t8Epnur+tmDQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 02/45] usb: dwc2: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:45:50 +0100
Message-Id: <ab5762d4fd512ac318e7962109d80547d38419cd.1738746904.git.namcao@linutronix.de>
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
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/dwc2/hcd_queue.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index 238c6fd50e75..2a542a99ec44 100644
--- a/drivers/usb/dwc2/hcd_queue.c
+++ b/drivers/usb/dwc2/hcd_queue.c
@@ -1459,8 +1459,7 @@ static void dwc2_qh_init(struct dwc2_hsotg *hsotg, st=
ruct dwc2_qh *qh,
 	/* Initialize QH */
 	qh->hsotg =3D hsotg;
 	timer_setup(&qh->unreserve_timer, dwc2_unreserve_timer_fn, 0);
-	hrtimer_init(&qh->wait_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	qh->wait_timer.function =3D &dwc2_wait_timer_fn;
+	hrtimer_setup(&qh->wait_timer, &dwc2_wait_timer_fn, CLOCK_MONOTONIC, HRTI=
MER_MODE_REL);
 	qh->ep_type =3D ep_type;
 	qh->ep_is_in =3D ep_is_in;
=20
--=20
2.39.5

