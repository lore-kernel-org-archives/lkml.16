Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA18022E3E7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752246; cv=none; b=BR8xQMokKfgemOTzxXpSNU9NOj0eiPloVu/KhE01268uhgg3qTJuLLrQHlbxlZ7JJMRs4VIYCw62Jk/5TyFvOZ7kkgWKhVKGHaxlGK5TT6J6mSwSqMmWTcgrTJnfEEAFzLpE4FJwqBYifPuSth+bIuQ2D91KN9/UhI9IqOuuvG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752246; c=relaxed/simple;
	bh=k6FJM8A7IZMjnAHkGmzy5gyKoGKw+ALfkcMEcY2Dwc8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sbe7wqxe9y/9/KMX1DzPBXeAYxEMd34LqD6WmFm4v4GWzLnadbOO0CNtgvN3vZGi4aPOWBp1q2aGTGi2Zk5YWLA8UJNSCQwPobk0qmnJAkefr7m2ufsVdHPoR3RIzu9rCpvwDZPtKfAHisX27eqsDSLYjxWaeeOV97gk8J4pmB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jiWC+f/N; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RC0MocB1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jiWC+f/N";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RC0MocB1"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sezEbb7+sY5/PrxDb1jUkphwMQV7ifxmPKrPGiY0mkA=;
	b=jiWC+f/N5NJV3cmrKir5cyB+vKNZE73gyu9RPD/i57QFQMEGnfnx7TUaze9f9LJb2eIgMI
	Uujv9VpJS7n8YwbmiaqmELPqBiYwtPvqglIFOtO950gBpHx/EgJw04930EF1hytqAQggFW
	Gix4s5g4kzflyTROZRxLjm0k45xvyOqVaIIuG8JTJ0A9GlNTDrvf8TtLNgeCRi4EB51iHY
	nA1qH0rOFvVwRekS5XzoshjaMZPqbqqDPNW5gSuX0sWOC8Tffa7zWoyLgsJJJcRlCLuu7F
	huaGeDdzdBIk4L7wV6qkNFFbol1R+RvQayuubjFmIJpoSvroirBeA8yI+8D88g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sezEbb7+sY5/PrxDb1jUkphwMQV7ifxmPKrPGiY0mkA=;
	b=RC0MocB1cU/1Hsg0rQ7tKOXXJdmZMAMOIjFjsjbxUJMmhR8F2jD5xfduaog4DhPlZuYfuh
	KOt/3geJ+Ul8qYBQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 13/24] net: ieee802154: at86rf230: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:33 +0100
Message-Id: <9f701c1b64e248539772aee62e130a7e50bbf1b0.1738746872.git.namcao@linutronix.de>
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

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 drivers/net/ieee802154/at86rf230.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ieee802154/at86rf230.c b/drivers/net/ieee802154/at=
86rf230.c
index f632b0cfd5ae..fd91f8a45bce 100644
--- a/drivers/net/ieee802154/at86rf230.c
+++ b/drivers/net/ieee802154/at86rf230.c
@@ -776,8 +776,8 @@ at86rf230_setup_spi_messages(struct at86rf230_local *lp,
 	state->trx.tx_buf =3D state->buf;
 	state->trx.rx_buf =3D state->buf;
 	spi_message_add_tail(&state->trx, &state->msg);
-	hrtimer_init(&state->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	state->timer.function =3D at86rf230_async_state_timer;
+	hrtimer_setup(&state->timer, at86rf230_async_state_timer, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
 }
=20
 static irqreturn_t at86rf230_isr(int irq, void *data)
--=20
2.39.5

