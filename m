Received: from out.smtpout.orange.fr (out-70.smtpout.orange.fr [193.252.22.70])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9477FD
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744439152; cv=none; b=i2U4m53ajZycX1fnc1+l/fmXM9Q/rLqFtORusZTXSY1h6rPIY11rEPJrnXInE6WS3cthtMmOd/IpPiAENhOjlmeJYPXjF/1CoMJPz0ajbtM/JD49RDWGN2cbF8WnpQ86aTYTPU7o/PSpHLzccGcj1Nq8E6E3CfE5vstuWubXsso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744439152; c=relaxed/simple;
	bh=lSN97m/THny4yQwhMPj6R5BDbaRm2P89lemSwdrQVfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=thL0dIfuaO9Ki5qeZV5QKkfgQQW307q7CEqHacCDNrVFUsk1ZnPdjFVY2nlwmhCX5m3Pm/KET7jH4VAdtCkts0gEMyOQdkFeboX0Q41gA5zMoTl1p1fEZkh1W0YVFhVtXAXXF/Z4QTkswZtkbKpTbqFkuRkAk2TClKjGC4A09vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=nlynygVl; arc=none smtp.client-ip=193.252.22.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="nlynygVl"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3UI4u7H5JdZ1m3UIHuovDz; Sat, 12 Apr 2025 08:24:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744439087;
	bh=c9ReeE86kF/374t3a4BHV3Ao7MfSs6fX9dP4Nmlbeak=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nlynygVlKs6+fLo6h1S6ATsjCu7tNZCcZFL2zKxvqoXHfnocO65oRXSMfAkiP0lJL
	 5CekNIBHE0HQ6pd3N32iDnsmz7m6sZgBlOD4VJBTEm4C7XEsMbJ3lAakd0fX2Owzp7
	 pTEQ+m3NrDPv+braAW0FdWDRtJ0yNCA/xMkJTz2JuAFoF4AUwO1Nz9vrHoK/Z9YZMw
	 +pUj+g4ay+hcMhpEyX0AY5cY7cfvzXelzcg22gowNkAu+UaNtkcB+wv4RBv+jGP6e+
	 9joZTYHTszhduqrnbCIYlUIlMxAwyRzkQ6usCCtQOryb5YkhTl+laG7D5PFY10w8O4
	 d8AoGYbqeWfWA==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:24:47 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/16] staging: gpib: eastwood: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:21:56 -0700
Message-ID: <ce51b42401d7bdbcc08c8c000b69c23905856cbe.1744438358.git.paul.retourne@orange.fr>
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
 drivers/staging/gpib/eastwood/fluke_gpib.c | 51 ++++++++++++++--------
 drivers/staging/gpib/eastwood/fluke_gpib.h | 17 +++++---
 2 files changed, 44 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index a6b1ac169f94..a782b2297b0c 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -254,7 +254,8 @@ static int lacs_or_read_ready(struct gpib_board *board)
 	return retval;
 }
 
-/* Wait until it is possible for a read to do something useful.  This
+/*
+ * Wait until it is possible for a read to do something useful.  This
  * is not essential, it only exists to prevent RFD holdoff from being released pointlessly.
  */
 static int wait_for_read(struct gpib_board *board)
@@ -276,7 +277,8 @@ static int wait_for_read(struct gpib_board *board)
 	return retval;
 }
 
-/* Check if the SH state machine is in SGNS.  We check twice since there is a very small chance
+/*
+ * Check if the SH state machine is in SGNS.  We check twice since there is a very small chance
  * we could be blowing through SGNS from SIDS to SDYS if there is already a
  * byte available in the handshake state machine.  We are interested
  * in the case where the handshake is stuck in SGNS due to no byte being
@@ -310,7 +312,8 @@ static int source_handshake_is_sids_or_sgns(struct fluke_priv *e_priv)
 		(source_handshake_bits == SOURCE_HANDSHAKE_SIDS_BITS);
 }
 
-/* Wait until the gpib chip is ready to accept a data out byte.
+/*
+ * Wait until the gpib chip is ready to accept a data out byte.
  * If the chip is SGNS it is probably waiting for a a byte to
  * be written to it.
  */
@@ -441,7 +444,8 @@ static int fluke_dma_write(struct gpib_board *board, uint8_t *buffer, size_t len
 	if (test_bit(DMA_WRITE_IN_PROGRESS_BN, &nec_priv->state))
 		fluke_dma_callback(board);
 
-	/* if everything went fine, try to wait until last byte is actually
+	/*
+	 * if everything went fine, try to wait until last byte is actually
 	 * transmitted across gpib (but don't try _too_ hard)
 	 */
 	if (retval == 0)
@@ -508,7 +512,8 @@ static int fluke_accel_write(struct gpib_board *board, uint8_t *buffer, size_t l
 		if (WARN_ON_ONCE(remainder != 1))
 			return -EFAULT;
 
-		/* wait until we are sure we will be able to write the data byte
+		/*
+		 * wait until we are sure we will be able to write the data byte
 		 * into the chip before we send AUX_SEOI.  This prevents a timeout
 		 * scenerio where we send AUX_SEOI but then timeout without getting
 		 * any bytes into the gpib chip.  This will result in the first byte
@@ -539,8 +544,10 @@ static int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
 		return result;
 	}
 	dmaengine_tx_status(chan, cookie, &state);
-	// hardware doesn't support resume, so dont call this
-	// method unless the dma transfer is done.
+	/*
+	 * hardware doesn't support resume, so dont call this
+	 * method unless the dma transfer is done.
+	 */
 	return state.residue;
 }
 
@@ -608,7 +615,8 @@ static int fluke_dma_read(struct gpib_board *board, uint8_t *buffer,
 	if (test_bit(DEV_CLEAR_BN, &nec_priv->state))
 		retval = -EINTR;
 
-	/* If we woke up because of end, wait until the dma transfer has pulled
+	/*
+	 * If we woke up because of end, wait until the dma transfer has pulled
 	 * the data byte associated with the end before we cancel the dma transfer.
 	 */
 	if (test_bit(RECEIVED_END_BN, &nec_priv->state)) {
@@ -625,7 +633,8 @@ static int fluke_dma_read(struct gpib_board *board, uint8_t *buffer,
 
 	// stop the dma transfer
 	nec7210_set_reg_bits(nec_priv, IMR2, HR_DMAI, 0);
-	/* delay a little just to make sure any bytes in dma controller's fifo get
+	/*
+	 * delay a little just to make sure any bytes in dma controller's fifo get
 	 * written to memory before we disable it
 	 */
 	usleep_range(10, 15);
@@ -641,14 +650,17 @@ static int fluke_dma_read(struct gpib_board *board, uint8_t *buffer,
 	dma_unmap_single(board->dev, bus_address, length, DMA_FROM_DEVICE);
 	memcpy(buffer, e_priv->dma_buffer, *bytes_read);
 
-	/* If we got an end interrupt, figure out if it was
+	/*
+	 * If we got an end interrupt, figure out if it was
 	 * associated with the last byte we dma'd or with a
 	 * byte still sitting on the cb7210.
 	 */
 	spin_lock_irqsave(&board->spinlock, flags);
 	if (test_bit(READ_READY_BN, &nec_priv->state) == 0) {
-		// There is no byte sitting on the cb7210.  If we
-		// saw an end interrupt, we need to deal with it now
+		/*
+		 * There is no byte sitting on the cb7210.  If we
+		 * saw an end interrupt, we need to deal with it now
+		 */
 		if (test_and_clear_bit(RECEIVED_END_BN, &nec_priv->state))
 			*end = 1;
 	}
@@ -725,7 +737,8 @@ static gpib_interface_t fluke_unaccel_interface = {
 	.return_to_local = fluke_return_to_local,
 };
 
-/* fluke_hybrid uses dma for writes but not for reads.  Added
+/*
+ * fluke_hybrid uses dma for writes but not for reads.  Added
  * to deal with occasional corruption of bytes seen when doing dma
  * reads.  From looking at the cb7210 vhdl, I believe the corruption
  * is due to a hardware bug triggered by the cpu reading a cb7210
@@ -914,7 +927,8 @@ static int fluke_init(struct fluke_priv *e_priv, struct gpib_board *board, int h
 
 	nec7210_board_reset(nec_priv, board);
 	write_byte(nec_priv, AUX_LO_SPEED, AUXMR);
-	/* set clock register for driving frequency
+	/*
+	 * set clock register for driving frequency
 	 * ICR should be set to clock in megahertz (1-15) and to zero
 	 * for clocks faster than 15 MHz (max 20MHz)
 	 */
@@ -933,7 +947,8 @@ static int fluke_init(struct fluke_priv *e_priv, struct gpib_board *board, int h
 	return 0;
 }
 
-/* This function is passed to dma_request_channel() in order to
+/*
+ * This function is passed to dma_request_channel() in order to
  * select the pl330 dma channel which has been hardwired to
  * the gpib controller.
  */
@@ -1042,8 +1057,10 @@ static int fluke_attach_impl(struct gpib_board *board, const gpib_board_config_t
 	e_priv->dma_channel = dma_request_channel(dma_cap, gpib_dma_channel_filter, NULL);
 	if (!e_priv->dma_channel) {
 		dev_err(board->gpib_dev, "failed to allocate a dma channel.\n");
-		// we don't error out here because unaccel interface will still
-		// work without dma
+		/*
+		 * we don't error out here because unaccel interface will still
+		 * work without dma
+		 */
 	}
 
 	return fluke_init(e_priv, board, handshake_mode);
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.h b/drivers/staging/gpib/eastwood/fluke_gpib.h
index 3e4348196b42..dfe2d3c60deb 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.h
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.h
@@ -55,8 +55,10 @@ enum state1_bits {
 	SOURCE_HANDSHAKE_MASK = 0x7
 };
 
-// we customized the cb7210 vhdl to give the "data in" status
-// on the unused bit 7 of the address0 register.
+/*
+ * we customized the cb7210 vhdl to give the "data in" status
+ * on the unused bit 7 of the address0 register.
+ */
 enum cb7210_address0 {
 	DATA_IN_STATUS = 0x80
 };
@@ -124,11 +126,12 @@ enum bus_status_bits {
 };
 
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
 	AUX_NBAF = 0xe,	// new byte available false (also clears seoi)
-- 
2.49.0

