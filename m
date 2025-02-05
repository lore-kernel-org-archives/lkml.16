Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559B022CBD9
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752420; cv=none; b=RxNwrRyaNmHOMuYM/kiJGkpg5S6RSsWflgAPWaF7smxpyqrG/in0WkOB1nQSCLFay8HtJDSZQ6hyP3u5TZFbeiDksCwvQk5zNfNxp/47qbtuAJ1GWNX/IVi68TsaFGIV1KP3HlNQfmR9kUMIIIWgcElI1cAs4IYIjjXJ76+LvZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752420; c=relaxed/simple;
	bh=erx5xAWDlD4b8HLZ50YbxNbkvzsNscu0QSeHZJaA3x0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p440zZkHuZnGggR9ehvNj/CVrdyTZMxO3veLXqdfCHVUfi42Nd4xzyGVCz1FrZDeeF/pRPrNzI/TUOeg1QUFtyLmHbRrV0+g9ycWr5eRGSMKRjshLcsr75lbG8mKwPlaT4+77AE3f+PMibp/o4C2xu9sxYF7CX7Pr9VCXphU4OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TamDG5MB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9uQY8NXc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TamDG5MB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9uQY8NXc"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BmTo87BGjQSdJn5pPW+/LOkuzGYnx4VhJELMXUw9vl0=;
	b=TamDG5MBT4FidypA7QAlsskPi6tRixzVJL8nRyp9mOZFeAmuj7DvrKpUEZnpgesS3exqSA
	/RPMd3aNpT34kyk5ftMUCfyn8IWeJr4A73VB/sDIpPVGpNC2GjwuU/cZVQdEFuK5UaVFsm
	bQY2s9DoV2ftpLiwDQ72w9/sCdNS9NGpR4FABnJnt+eRf8hjBKtY3gYMA0fWW7hBfFDYOx
	ba1D1x3oU4o1rSQjXBO6EPpo0q6HQt1gADUrMHN8DMfukG5oghoB12DMe1XqwJzWxPrekB
	dxLoHPDj61AxDcWrsv6U4I09qO0V9VytOhaI80SbwD0INiRUCfEDEqK62QXKXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BmTo87BGjQSdJn5pPW+/LOkuzGYnx4VhJELMXUw9vl0=;
	b=9uQY8NXcvbOI+GL0/Fm2MUJzz51pMemplj1tAgjPsuFxEM/Q3WwH38qg5lu6+BkEOrIsxg
	DP50aRaz9C47RYAg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 09/45] serial: amba-pl011: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:45:57 +0100
Message-Id: <78e8c0d1b38998eab983fad265751ed13c2b9009.1738746904.git.namcao@linutronix.de>
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

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/serial/amba-pl011.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl01=
1.c
index 04212c823a91..98f178bdbcbe 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -2867,11 +2867,10 @@ static int pl011_probe(struct amba_device *dev, con=
st struct amba_id *id)
 			return -EINVAL;
 		}
 	}
-
-	hrtimer_init(&uap->trigger_start_tx, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	hrtimer_init(&uap->trigger_stop_tx, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	uap->trigger_start_tx.function =3D pl011_trigger_start_tx;
-	uap->trigger_stop_tx.function =3D pl011_trigger_stop_tx;
+	hrtimer_setup(&uap->trigger_start_tx, pl011_trigger_start_tx, CLOCK_MONOT=
ONIC,
+		      HRTIMER_MODE_REL);
+	hrtimer_setup(&uap->trigger_stop_tx, pl011_trigger_stop_tx, CLOCK_MONOTON=
IC,
+		      HRTIMER_MODE_REL);
=20
 	ret =3D pl011_setup_port(&dev->dev, uap, &dev->res, portnr);
 	if (ret)
--=20
2.39.5

