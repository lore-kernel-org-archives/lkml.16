Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A58922DF8D
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752252; cv=none; b=V53Vbl5T8upCGIQHj6ZbUbFS8jvYVKE0tnV53krIUbvlKyz3GSK7ZgITgdC0MbYxt4NGzJ0aG6oaehEQfRqFceyIH4bgHLKK0pNMhlC5vinA0VOiHaYMFtFsoAjyNiHUEQAav6lCunNB9M1I118Oh9r6gjYWrDuAJiT3RaJ2oyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752252; c=relaxed/simple;
	bh=kDrdBExXZPZvjIywWbAJO+ZE7wuteJ0moQFbVDamNXs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BNKf8WrsgpzTunN7cadsNGridib6ekRn/Nubu+suga3Aypm1tOifUvylFyBTmCuV1+Nia2SfHCx4GohY7BDddrtuBUOZer+yRTxRpKtpXj7fuqky96AzgsPVs59GLdXQmj5QoI2TnB72Z8udgq6qPWW/d4fgPInMDgVH1Sjh+k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D2mYY67X; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WSE9NVZV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D2mYY67X";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WSE9NVZV"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXhPZGp8ksTIzNtFwKUTjjLZk2nMVDrwGqLMHbiHCRA=;
	b=D2mYY67Xq6egJAavxqJG8/xdDhPvAcldKHnWp2BT6H3WaYV97yFxhUj2Eh2/H20yfsNn64
	w7E9b7OsWEZhIY+eDRv16St8a/qyJML6B0TLDJ+VhzLdhPc9Cl4kkNBMxjpdqDMldyg0al
	376k5lVNRZzY+EzJRA/jO1fpR82YLcxnBn78HvwhNdOD64e4AjL9EBXHLSXi57KJYwSHl8
	TuIXxTbZBSlKskmy6UDVK2c8kB2WRO095C1Gdy60T3cauB4XmFELyin07Yoae1Rw4BTR3I
	ZBj4qGviiyvi0aR0o5GGKDaCwA48Tw99oe18W10tnWyu+Yv+GiChdNQcefsuwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXhPZGp8ksTIzNtFwKUTjjLZk2nMVDrwGqLMHbiHCRA=;
	b=WSE9NVZVOA+aXWv+zhgFG3sK7Ez5q87oFKcwb9UEcmeirNn0+ZeYWyG7wyAfCPIjgx7Wrv
	PSA/0ZbacDYueCDQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Oliver Neukum <oliver@neukum.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 19/24] net/cdc_ncm: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:39 +0100
Message-Id: <219735f98754fb30dcfd892fbaa5766f9d78c1f1.1738746872.git.namcao@linutronix.de>
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
Cc: Oliver Neukum <oliver@neukum.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 drivers/net/usb/cdc_ncm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index d5c47a2a62dc..34e82f1e37d9 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -833,8 +833,7 @@ int cdc_ncm_bind_common(struct usbnet *dev, struct usb_=
interface *intf, u8 data_
=20
 	ctx->dev =3D dev;
=20
-	hrtimer_init(&ctx->tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	ctx->tx_timer.function =3D &cdc_ncm_tx_timer_cb;
+	hrtimer_setup(&ctx->tx_timer, &cdc_ncm_tx_timer_cb, CLOCK_MONOTONIC, HRTI=
MER_MODE_REL);
 	tasklet_setup(&ctx->bh, cdc_ncm_txpath_bh);
 	atomic_set(&ctx->stop, 0);
 	spin_lock_init(&ctx->mtx);
--=20
2.39.5

