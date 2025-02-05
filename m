Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B430822DF93
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752245; cv=none; b=csAumsUrkpRbiOMajyfP5p7jSgz5L1EP57D26OmcuC1ZReli0a8hUnx70GfER2Giqn7jdugPahmN1GjxViqXlVfse9/tj9DS/NgK/QglXYy9I3cX5Jz7G1I0n8EB5zlYd4cbAloPN3iePMIb+LfX+DxnPdsVZX8AlRvY5lTFpuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752245; c=relaxed/simple;
	bh=WB7Sz4ejRDVueHNK+tC3/5MoEvrbKEvZjeDu2iFiqvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RJ9mP2QJYOgyrsDS4An/j0J4y9CQPMwDQrRBG932Ts2oHex+AF/1b39gGxdIxqgegPR2pCmPvbfTl3qAKdRkn7hmFunQHtaDmZNV+n85G0+t5lWJm8YpS98PkpHuJDmqlhj/BsL80iot3KZaGoCtXqbDItcyF4sC5be1MyLmYP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=beRbNNTb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7FMOjote; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="beRbNNTb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7FMOjote"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kXbEjIfblj0q6q8IAyE5cVLoy2zVe2T6ldPU/EDiUms=;
	b=beRbNNTbI9y94ovgkDcQznY5hDD+hB2VxU9ePN0Lfx+ta7ackCcCwZdUfsmIyRzjA9O1pJ
	aytAz/TgtEE5GsXBCTAcwtVJhGNQ1w2UZNXfAi7nEFXL7L+bD+f6nVmAHuEaRLEG21teZC
	xEipW5YrrMaj1NoarvyDfus+uuHxawrEc5GuGe/JCNHF96aFAJtHLeZF/CO2adMCIi3zn6
	Bw1vY5T8w2r2UybIIlq0gZReJ2S4tqwBqDKcVbGtO/OzAviDnkDftTXilyHrPiSWL7yzcO
	7nDD+1oyXLclxJ+LHBMBUq/+7QHtcBsMTPA/U1SKn3u46rSxuXDtme0xD6Wi8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kXbEjIfblj0q6q8IAyE5cVLoy2zVe2T6ldPU/EDiUms=;
	b=7FMOjoterwVhDHroJ4uQSSUUf0qUaLvU/VlQreeLcCpHJSOoAnBzFy3njsPU8UBdsJfIqq
	q3YXSe6MqIwsBhAA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 11/24] net: ethernet: hisilicon: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:31 +0100
Message-Id: <11f5140e157cc0cd02a715f531217b021743aa71.1738746872.git.namcao@linutronix.de>
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
 drivers/net/ethernet/hisilicon/hip04_eth.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hip04_eth.c b/drivers/net/ether=
net/hisilicon/hip04_eth.c
index a376d4bdf281..18376bcc718a 100644
--- a/drivers/net/ethernet/hisilicon/hip04_eth.c
+++ b/drivers/net/ethernet/hisilicon/hip04_eth.c
@@ -934,8 +934,6 @@ static int hip04_mac_probe(struct platform_device *pdev)
 	priv->chan =3D arg.args[1] * RX_DESC_NUM;
 	priv->group =3D arg.args[2];
=20
-	hrtimer_init(&priv->tx_coalesce_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-
 	/* BQL will try to keep the TX queue as short as possible, but it can't
 	 * be faster than tx_coalesce_usecs, so we need a fast timeout here,
 	 * but also long enough to gather up enough frames to ensure we don't
@@ -944,7 +942,7 @@ static int hip04_mac_probe(struct platform_device *pdev)
 	 */
 	priv->tx_coalesce_frames =3D TX_DESC_NUM * 3 / 4;
 	priv->tx_coalesce_usecs =3D 200;
-	priv->tx_coalesce_timer.function =3D tx_done;
+	hrtimer_setup(&priv->tx_coalesce_timer, tx_done, CLOCK_MONOTONIC, HRTIMER=
_MODE_REL);
=20
 	priv->map =3D syscon_node_to_regmap(arg.np);
 	of_node_put(arg.np);
--=20
2.39.5

