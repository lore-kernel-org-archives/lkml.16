Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F85F22C328
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752419; cv=none; b=BdpcjW7f40BR1dtvFYO864eND9vkF5bkwMpwsQP6tAQotup05VzfBA07Tv+24UPWV9crDVjWT2sEQbRPG9ecMs1rzo+VCnc3tiTXHZzCiXt96YngPHnSihp7zxVXfY5Zb2Q7/AkYvj7yAGYigbt9yCrIq70QlXMIxZad3xD6ILI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752419; c=relaxed/simple;
	bh=Rg9GfJh77Bm7aQMkxsWnJDVGul1724SU4heYtJAJUDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=syqRYrVSEC72LF/rfDNjZ4Ssxh7jBzqedHEhReEfs9+ScNQwd5z3snpV3mFO7ad1LA4lEMv2lnVJvMbpWKjiI99hCsDoRa5fNamSbWOS1ypBwVWDKqRkh2ddZB1LThNI42lebbK0W7c7WZt0KaiHdHImr7EotpQCOhalbwsTJdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SMilxc0g; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n0wjuQrC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SMilxc0g";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n0wjuQrC"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvf3qRQO08DkoSLT62NozBkSWJH+iwOHnaBM/cWiAXA=;
	b=SMilxc0gkEn4D900IrDtHKDFVzRVRaJY63jN7NNRn4/FB7FbvETnD1xT1dx7002+i/ul4Z
	369ukzCLdThXOkDm4GXbhY2lIxDwwMPO2uwpnsLWtryLD+zZYofG2BHCQFgBbk6n7cqkL7
	19277dqUzTUzMRGt05qPGV3C8vSW/EhGO2Y5RF5bhVijb+aRlxKDnChi0ezZGZtEatZPib
	4el1l7LFVE2VqLe33a5JwtXHXlAH3/jxB1n0vNtR3LfjKdRIrVCBcH+PR7RcaAWF+7WMpt
	WU2HRkG2PqCg2vj2WFhsOe8KNtNTRlE7V1arr8xW5h7Nm3BhtW/VGB+A0FUR1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvf3qRQO08DkoSLT62NozBkSWJH+iwOHnaBM/cWiAXA=;
	b=n0wjuQrCZgRdQ0zScQStVzJ3+6Z6JnVIi7Ah4GBJy/28pNJV9SvBKw7pnoPD768rmljecf
	5TgDHR0/CxsvzqAw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 06/45] usb: musb: cppi41: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:45:54 +0100
Message-Id: <80d59a56c76c76ace982417e4dc8ddd37a5441d7.1738746904.git.namcao@linutronix.de>
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
 drivers/usb/musb/musb_cppi41.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_cppi41.c b/drivers/usb/musb/musb_cppi41.c
index 9589243e8951..4cde3abb7006 100644
--- a/drivers/usb/musb/musb_cppi41.c
+++ b/drivers/usb/musb/musb_cppi41.c
@@ -760,8 +760,8 @@ cppi41_dma_controller_create(struct musb *musb, void __=
iomem *base)
 	if (!controller)
 		goto kzalloc_fail;
=20
-	hrtimer_init(&controller->early_tx, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	controller->early_tx.function =3D cppi41_recheck_tx_req;
+	hrtimer_setup(&controller->early_tx, cppi41_recheck_tx_req, CLOCK_MONOTON=
IC,
+		      HRTIMER_MODE_REL);
 	INIT_LIST_HEAD(&controller->early_tx_list);
=20
 	controller->controller.channel_alloc =3D cppi41_dma_channel_allocate;
--=20
2.39.5

