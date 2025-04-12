Received: from out.smtpout.orange.fr (out-70.smtpout.orange.fr [193.252.22.70])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3AD18D625
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744439153; cv=none; b=jFDhkfifTtsvyAom1Z847HdGEvbLqav/nM/v+vUfr0gfrTpfqCx9XRIaO2m7yoLOJjUlzt+aYmEENueMdb+MrsgLI/xzIYMBnIU/1R5GMnIp97sV6Yu6HYMcjUKaLvzJoICKhtLy56tkAKQ8iXJu0oVkPWP9V/TpcgSQn2gx7+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744439153; c=relaxed/simple;
	bh=lPyIFdWe8cCysi4YaOYgh9rhKLE2LGD2GRB0Akzsb4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oAUuW/A2tLxQ5NhwCr1H3GWVlxoZHhpJEY6EGunC8ukxnzqM0cslTjjPUFWsNANT94vDqq3m96X7kM0BJThu0VINlA9y8yvatTF2Asv853FFKAm0Q6dvUA6G4ZwHK6xuht2fcfjvBkUHmSpX6HM5ZBDJ6fiGqzxVEx7y0NP1Tg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=Y6IXwY4j; arc=none smtp.client-ip=193.252.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="Y6IXwY4j"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3UI4u7H5JdZ1m3UICuov7R; Sat, 12 Apr 2025 08:24:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744439082;
	bh=NM+fH7qiGwC50T/qCbhnnCq1sgqkLyAbaAAuVcX4cr4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Y6IXwY4junAnE27N95ouK72RclgePNlnnEWesXAFZ1/n+v9qTSnhOC9Xe8FR0C0uh
	 rTnDSQrb8vDiDSOgFnyqXBIIJ+TfX42wh3d6ncEcxH3rhpwyEF1CIPwglcGxc3cVHR
	 2oI+ETECqM2wdBfjkW0D7ubfwKL3VcMWhcKt3Yo2NaoYijAk6DOkogWet8yUMb33+n
	 UjewhnUWWDhM5idF6Ey9O3a5jSu1NJd9gYDInZV4j6jeTbpJ721RIXYcZp3cm0xwm9
	 o/g1nZauJHRNNDdLBYQwsJwANrr2u5l6FVZKibkE7OB0bvf4R7GlwrW7ij8ESre8dA
	 A5JIt8y9h0TrA==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:24:42 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/16] staging: gpib: cb7210: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:21:54 -0700
Message-ID: <f4b504b59c500ed5a666422128c90340e8ff4f63.1744438358.git.paul.retourne@orange.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744438358.git.paul.retourne@orange.fr>
References: <cover.1744438358.git.paul.retourne@orange.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the style of multiline comments to comply with the linux kernel
coding style.

Signed-off-by: Paul Retourné <paul.retourne@orange.fr>
---
 drivers/staging/gpib/cb7210/cb7210.c |  9 +++++----
 drivers/staging/gpib/cb7210/cb7210.h | 14 ++++++++------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 6b22a33a8c4f..86aaef001924 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -905,7 +905,8 @@ static int cb7210_init(struct cb7210_priv *cb_priv, struct gpib_board *board)
 	cb7210_write_byte(cb_priv, cb_priv->hs_mode_bits, HS_MODE);
 
 	write_byte(nec_priv, AUX_LO_SPEED, AUXMR);
-	/* set clock register for maximum (20 MHz) driving frequency
+	/*
+	 * set clock register for maximum (20 MHz) driving frequency
 	 * ICR should be set to clock in megahertz (1-15) and to zero
 	 * for clocks faster than 15 MHz (max 20MHz)
 	 */
@@ -1275,9 +1276,9 @@ static int cb_gpib_config(struct pcmcia_device  *link)
 } /* gpib_config */
 
 /*
- *    After a card is removed, gpib_release() will unregister the net
- *   device, and release the PCMCIA configuration.  If the device is
- *   still open, this will be postponed until it is closed.
+ * After a card is removed, gpib_release() will unregister the net
+ * device, and release the PCMCIA configuration.  If the device is
+ * still open, this will be postponed until it is closed.
  */
 
 static void cb_gpib_release(struct pcmcia_device *link)
diff --git a/drivers/staging/gpib/cb7210/cb7210.h b/drivers/staging/gpib/cb7210/cb7210.h
index 2108fe7a8ce5..ea92a81689fa 100644
--- a/drivers/staging/gpib/cb7210/cb7210.h
+++ b/drivers/staging/gpib/cb7210/cb7210.h
@@ -134,7 +134,8 @@ enum bus_status_bits {
 
 /* CBI 488.2 HS control */
 
-/* when both bit 0 and 1 are set, it
+/*
+ * when both bit 0 and 1 are set, it
  *   1 clears the transmit state machine to an initial condition
  *   2 clears any residual interrupts left latched on cbi488.2
  *   3 resets all control bits in HS_MODE to zero
@@ -189,11 +190,12 @@ static inline unsigned int irq_bits(unsigned int irq)
 }
 
 enum cb7210_aux_cmds {
-/* AUX_RTL2 is an undocumented aux command which causes cb7210 to assert
- *	(and keep asserted) local rtl message.  This is used in conjunction
- *	with the (stupid) cb7210 implementation
- *	of the normal nec7210 AUX_RTL aux command, which
- *	causes the rtl message to toggle between on and off.
+/*
+ * AUX_RTL2 is an undocumented aux command which causes cb7210 to assert
+ * (and keep asserted) local rtl message.  This is used in conjunction
+ * with the (stupid) cb7210 implementation
+ * of the normal nec7210 AUX_RTL aux command, which
+ * causes the rtl message to toggle between on and off.
  */
 	AUX_RTL2 = 0xd,
 	AUX_LO_SPEED = 0x40,
-- 
2.49.0

