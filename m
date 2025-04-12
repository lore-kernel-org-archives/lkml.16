Received: from out.smtpout.orange.fr (out-70.smtpout.orange.fr [193.252.22.70])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3841A1A23B1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744481420; cv=none; b=UzPQGaDZVsnHTsK1qDRBtW/YhP6AuArm/ofTxjpYTUzNbwFoPVVb7tW7vJLLLxbpm8fi0Z5HS6w6xBrqEaQw8/yNBAL1p1pSRnvW6CKtFs6gNcA0Q9Qq3yfcHqsl0dGYW4hIaXHo7vBKS7pVbUPGoXe3v0gMM7oo9ZAVjUHShd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744481420; c=relaxed/simple;
	bh=gaudnVqMUoy2Fr1V0TmMlGZFF+5NS84yjRnDGzpWB6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OozAPVV04r4IjkuB7JaEHyNmlGGKKUD2aDEcQDvVYYxjXwLevoxzZzpnvAzTP71kh4ssyW2T6jlFbtxfyJQTdD4gpnpe4kNy0iZktEnT7HRw4jRYZSfRyuoXyDc00LUaS742DP6Y4F5Ci9BAZMwdnDq0CDIYZlv54xnBhKZoIx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=kvmJKXx9; arc=none smtp.client-ip=193.252.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="kvmJKXx9"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3fIuuykkq5k813fIyuvf6X; Sat, 12 Apr 2025 20:10:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744481415;
	bh=GUegS7DJ1heWnU9cJ9eegjqKTPOLv20pbEP3tyGJKzA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kvmJKXx9qbM5D5vGzgyuDLqe+GcT8lcR71Yuhox5O8f2v92bRo0xrkz0wwEy/wSbG
	 OegatmqpSg2iRCzRog4XHNiD+0s2tMG4S8otOWAUOSWv1H8FYzkopVKjkwicF6A1IH
	 Y8+kzIVAz0sTE+6JK17smXOUpX4vDsu3MJ6bAKrrSmzn5EWyDD6goosb+zdcDAa4iP
	 CnZsb1V/Us+OSxHU4UnbheRXy8cdpFGIQjr/f9AyOCI3nl/wdrkeNYaTrM73CHA7O8
	 xviyUrHhjqW24VWyzU3Xl+G4K01ZMCJw3Gp9OjfTlDhlSrR/bliOJngfpwNC1u87VK
	 BnY9/bMTYMOMQ==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 20:10:15 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/16] staging: gpib: tnt4882: fixes multiline comments style
Date: Sat, 12 Apr 2025 11:10:05 -0700
Message-ID: <2b72df3bfc4a3f57679d2af52112e58acb5c259f.1744438358.git.paul.retourne@orange.fr>
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
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 32 ++++++++++++---------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index c35b084b6fd0..51ddade6819a 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -258,7 +258,8 @@ static void tnt4882_release_holdoff(struct gpib_board *board, struct tnt4882_pri
 
 	sasr_bits = tnt_readb(tnt_priv, SASR);
 
-	/*tnt4882 not in one-chip mode won't always release holdoff unless we
+	/*
+	 * tnt4882 not in one-chip mode won't always release holdoff unless we
 	 * are in the right mode when release handshake command is given
 	 */
 	if (sasr_bits & AEHS_BIT) /* holding off due to holdoff on end mode*/	{
@@ -384,7 +385,8 @@ static int tnt4882_accel_read(struct gpib_board *board, uint8_t *buffer, size_t
 
 	nec7210_set_reg_bits(nec_priv, IMR1, HR_ENDIE, 0);
 	nec7210_set_reg_bits(nec_priv, IMR2, HR_DMAI, 0);
-	/* force handling of any pending interrupts (seems to be needed
+	/*
+	 * force handling of any pending interrupts (seems to be needed
 	 * to keep interrupts from getting hosed, plus for syncing
 	 * with RECEIVED_END below)
 	 */
@@ -531,7 +533,8 @@ static int generic_write(struct gpib_board *board, uint8_t *buffer, size_t lengt
 
 	nec7210_set_reg_bits(nec_priv, IMR1, HR_ERR, 0x0);
 	nec7210_set_reg_bits(nec_priv, IMR2, HR_DMAO, 0x0);
-	/* force handling of any interrupts that happened
+	/*
+	 * force handling of any interrupts that happened
 	 * while they were masked (this appears to be needed)
 	 */
 	tnt4882_internal_interrupt(board);
@@ -760,7 +763,8 @@ static void tnt4882_parallel_poll_response(struct gpib_board *board, int ist)
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-/* this is just used by the old nec7210 isa interfaces, the newer
+/*
+ * this is just used by the old nec7210 isa interfaces, the newer
  * boards use tnt4882_serial_poll_response2
  */
 static void tnt4882_serial_poll_response(struct gpib_board *board, uint8_t status)
@@ -788,7 +792,8 @@ static void tnt4882_serial_poll_response2(struct gpib_board *board, uint8_t stat
 			priv->nec7210_priv.srq_pending = 0;
 	}
 	if (reqt)
-		/* It may seem like a race to issue reqt before updating
+		/*
+		 * It may seem like a race to issue reqt before updating
 		 * the status byte, but it is not.  The chip does not
 		 * issue the reqt until the SPMR is written to at
 		 * a later time.
@@ -796,7 +801,8 @@ static void tnt4882_serial_poll_response2(struct gpib_board *board, uint8_t stat
 		write_byte(&priv->nec7210_priv, AUX_REQT, AUXMR);
 	else if (reqf)
 		write_byte(&priv->nec7210_priv, AUX_REQF, AUXMR);
-	/* We need to always zero bit 6 of the status byte before writing it to
+	/*
+	 * We need to always zero bit 6 of the status byte before writing it to
 	 * the SPMR to insure we are using
 	 * serial poll mode SP1, and not accidentally triggering mode SP3.
 	 */
@@ -1581,10 +1587,10 @@ static int ni_gpib_probe(struct pcmcia_device *link)
 }
 
 /*
- *	This deletes a driver "instance".  The device is de-registered
- *	with Card Services.  If it has been released, all local data
- *	structures are freed.  Otherwise, the structures will be freed
- *	when the device is released.
+ * This deletes a driver "instance".  The device is de-registered
+ * with Card Services.  If it has been released, all local data
+ * structures are freed.  Otherwise, the structures will be freed
+ * when the device is released.
  */
 static void ni_gpib_remove(struct pcmcia_device *link)
 {
@@ -1611,9 +1617,9 @@ static int ni_gpib_config_iteration(struct pcmcia_device *link,	void *priv_data)
 }
 
 /*
- *	ni_gpib_config() is scheduled to run after a CARD_INSERTION event
- *	is received, to configure the PCMCIA socket, and to make the
- *	device available to the system.
+ * ni_gpib_config() is scheduled to run after a CARD_INSERTION event
+ * is received, to configure the PCMCIA socket, and to make the
+ * device available to the system.
  */
 static int ni_gpib_config(struct pcmcia_device *link)
 {
-- 
2.49.0

