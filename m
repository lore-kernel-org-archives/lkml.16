Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4B7232797
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752425; cv=none; b=NeKZzTwpmVSobzIu+FP/giaKJoLh1Zqag4rAIiQCIgVsc01uHaSJd2zFCphvqM7U7UlzZm70yYaNgmj/OMl7IumyaoqKdGO5mgUauyTEkLGFnFfQMyng1nMj1OnfvxoMdmah+11g3oerzcdv6aw97StX2DBbuz18SEwaH2fwkz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752425; c=relaxed/simple;
	bh=8Av4eiiOTjw6EEArD4Pccww4bBCja3feTOuf/zOJYqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xeqz3VIw+GD7ON/yZ72fysOYX5drJORFE5g/bVgc8BPigvhypyNILiEkKh0WwP8BJ5POKvUVb7u3rKDsrAblzmf3yUsEygYJMPe/qpUvkkAWDEWJvURJXrTZ6+RMiyxPJkqJuNjaBrKuioOhzIH+bd4o37c2AcESMsN95hcoUnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=43QK6Eq/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BYQckxXJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="43QK6Eq/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BYQckxXJ"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gNF3htQ0JUteoaO+U1h1sEzucko4rV0CXRP7nYtd4w=;
	b=43QK6Eq/oK1eoQibdpTHHtk3d6s8xO8Ib+Kd+MTzS48zTRJ9Kg7acJzRNjVyxzQMeIoP2L
	5oBJq4lsGD/KSX8T0z/54E0UzA51lXFTg79INhihGru1FmEGovtq1U2pNKNprcCnWZ4tWn
	RcXlRxkNNclCxodkpie3B3BRuqxFR/vljQtBiNIVWabj80nWlxaMcJdfYsK45Snq0XCt1h
	DMHedRzVvAD6KjyL8ZrgBux/re6yvXMet0PTHlVvck+ToJA1YfsHtI4uo6OaDOvpOSxkq8
	Jy8kgF8Ya5+BKTXG2KZbH+xnVChKtE1BSJEIsw1DpgDzXKgzVc/+v7pEl8VsWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gNF3htQ0JUteoaO+U1h1sEzucko4rV0CXRP7nYtd4w=;
	b=BYQckxXJy5GRuNv5kQtBO+1aealKx+1LuECKi2fhuG/xKeY+Ijb5np2KYHd29QFGvgTo7v
	5MM5nmWyKUtcVeAw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 28/45] i2c: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:16 +0100
Message-Id: <6a0d31244560b76cc7e76954bf68dbe14a4761e3.1738746904.git.namcao@linutronix.de>
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
Cc: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ee0d25b498cb..9e5d454d8318 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1723,8 +1723,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		return -ENOMEM;
=20
 	spin_lock_init(&i2c_imx->slave_lock);
-	hrtimer_init(&i2c_imx->slave_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	i2c_imx->slave_timer.function =3D i2c_imx_slave_timeout;
+	hrtimer_setup(&i2c_imx->slave_timer, i2c_imx_slave_timeout, CLOCK_MONOTON=
IC,
+		      HRTIMER_MODE_ABS);
=20
 	match =3D device_get_match_data(&pdev->dev);
 	if (match)
--=20
2.39.5

