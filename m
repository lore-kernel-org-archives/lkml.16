Received: from out.smtpout.orange.fr (outm-51.smtpout.orange.fr [193.252.22.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74708828
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744439580; cv=none; b=Jr/n4my1njkxchL785xOGRJZlBHH/MZ5XADq6GjGZCH9jRDjK4+cH6EHrqupDkY4Mo9+l8Bps7nIObi7laHqV/w6SOMVmL84atyO/FYyjuXexcourNa1zuQyI1nr5KeSg71CnBW5PjgzhSdxbQwP3k39hXygecuVomqDl4FKGjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744439580; c=relaxed/simple;
	bh=hVrTVhkxm+kDr6N2u4Zlx+XVHZLk8fgc8MojQnk3Or0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lzpCAC1xuEcV+ygHBY/gkjrrj7awNl2j7IypdNIu57SArHui3Ao4+MFiqACFT1YqEo+GpwSV5PVFKUmVzrZRajXpZNZfhhoaoAv99BC6ulj9ug8I9vGEf9vGPq6FsDvEiIah86YaVCOQZu6XDawI2iBfeF4ZQyCeQJCUmd6AKVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=AOUjC0dU; arc=none smtp.client-ip=193.252.22.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="AOUjC0dU"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3UP1uRIIxiefY3UP5upciJ; Sat, 12 Apr 2025 08:31:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744439509;
	bh=jr8S9LErN5v/hyKCUiP39DDZItTOS468y0EMeWscIAY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=AOUjC0dUb17orMdpzspkHd1u7i3jcOtgRDhRFddWXu4jDEc6J9RWAa00Xvw0ujVf6
	 agRjhDEx/ot9IU9uKGD4pu7Et9twusq92FlXUl9Xn+TWaDPYrvncloiIWq95/XwYdO
	 bHsD1WoUdsyASgDFCpCZP9tSGAe82nSrnfH8cNHXa5F+Vxd2HO0bKL7lZLWMhYo/Cz
	 uil/wnnYuTzvz5R3rTlYPJJzQ+wgyBeOKsBYJLuZnMIkIkSJOs4/eeywEnS2ShaHeF
	 ruT9OGMGhmINLxzw+cpspy0yyBAHdjKQCP/YQszlOF8ljPJwo9BOHkwoNZsAYNmuc6
	 uMXj2qdMvFekg==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:31:49 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/16] staging: gpib: fmh_gpib: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:31:37 -0700
Message-ID: <ecf59455b825f97e7866044bee1b1c149cd8e086.1744438358.git.paul.retourne@orange.fr>
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
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 66 ++++++++++++++++--------
 1 file changed, 44 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index 53f4b3fccc3c..8a2f758c828b 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -169,7 +169,8 @@ static void fmh_gpib_local_parallel_poll_mode(struct gpib_board *board, int loca
 	if (local) {
 		write_byte(&priv->nec7210_priv, AUX_I_REG | LOCAL_PPOLL_MODE_BIT, AUXMR);
 	} else	{
-		/* For fmh_gpib_core, remote parallel poll config mode is unaffected by the
+		/*
+		 * For fmh_gpib_core, remote parallel poll config mode is unaffected by the
 		 * state of the disable bit of the parallel poll register (unlike the tnt4882).
 		 * So, we don't need to worry about that.
 		 */
@@ -195,7 +196,8 @@ static void fmh_gpib_serial_poll_response2(struct gpib_board *board, uint8_t sta
 	}
 
 	if (reqt) {
-		/* It may seem like a race to issue reqt before updating
+		/*
+		 * It may seem like a race to issue reqt before updating
 		 * the status byte, but it is not.  The chip does not
 		 * issue the reqt until the SPMR is written to at
 		 * a later time.
@@ -204,7 +206,8 @@ static void fmh_gpib_serial_poll_response2(struct gpib_board *board, uint8_t sta
 	} else if (reqf) {
 		write_byte(&priv->nec7210_priv, AUX_REQF, AUXMR);
 	}
-	/* We need to always zero bit 6 of the status byte before writing it to
+	/*
+	 * We need to always zero bit 6 of the status byte before writing it to
 	 * the SPMR to insure we are using
 	 * serial poll mode SP1, and not accidentally triggering mode SP3.
 	 */
@@ -333,7 +336,8 @@ static int wait_for_rx_fifo_half_full_or_end(struct gpib_board *board)
 	return retval;
 }
 
-/* Wait until the gpib chip is ready to accept a data out byte.
+/*
+ * Wait until the gpib chip is ready to accept a data out byte.
  */
 static int wait_for_data_out_ready(struct gpib_board *board)
 {
@@ -377,7 +381,8 @@ static void fmh_gpib_dma_callback(void *arg)
 	spin_unlock_irqrestore(&board->spinlock, flags);
 }
 
-/* returns true when all the bytes of a write have been transferred to
+/*
+ * returns true when all the bytes of a write have been transferred to
  * the chip and successfully transferred out over the gpib bus.
  */
 static int fmh_gpib_all_bytes_are_sent(struct fmh_priv *e_priv)
@@ -523,7 +528,8 @@ static int fmh_gpib_accel_write(struct gpib_board *board, uint8_t *buffer,
 		if (WARN_ON_ONCE(remainder != 1))
 			return -EFAULT;
 
-		/* wait until we are sure we will be able to write the data byte
+		/*
+		 * wait until we are sure we will be able to write the data byte
 		 * into the chip before we send AUX_SEOI.  This prevents a timeout
 		 * scenario where we send AUX_SEOI but then timeout without getting
 		 * any bytes into the gpib chip.  This will result in the first byte
@@ -554,8 +560,10 @@ static int fmh_gpib_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
 		return result;
 	}
 	dmaengine_tx_status(chan, cookie, &state);
-	// dma330 hardware doesn't support resume, so dont call this
-	// method unless the dma transfer is done.
+	/*
+	 * dma330 hardware doesn't support resume, so dont call this
+	 * method unless the dma transfer is done.
+	 */
 	return state.residue;
 }
 
@@ -581,7 +589,8 @@ static int wait_for_tx_fifo_half_empty(struct gpib_board *board)
 	return retval;
 }
 
-/* supports writing a chunk of data whose length must fit into the hardware'd xfer counter,
+/*
+ * supports writing a chunk of data whose length must fit into the hardware'd xfer counter,
  * called in a loop by fmh_gpib_fifo_write()
  */
 static int fmh_gpib_fifo_write_countable(struct gpib_board *board, uint8_t *buffer,
@@ -768,8 +777,10 @@ static int fmh_gpib_dma_read(struct gpib_board *board, uint8_t *buffer,
 	// stop the dma transfer
 	nec7210_set_reg_bits(nec_priv, IMR2, HR_DMAI, 0);
 	fifos_write(e_priv, 0, FIFO_CONTROL_STATUS_REG);
-	// give time for pl330 to transfer any in-flight data, since
-	// pl330 will throw it away when dmaengine_pause is called.
+	/*
+	 * give time for pl330 to transfer any in-flight data, since
+	 * pl330 will throw it away when dmaengine_pause is called.
+	 */
 	usleep_range(10, 15);
 	residue = fmh_gpib_get_dma_residue(e_priv->dma_channel, dma_cookie);
 	if (WARN_ON_ONCE(residue > length || residue < 0))
@@ -793,14 +804,17 @@ static int fmh_gpib_dma_read(struct gpib_board *board, uint8_t *buffer,
 		buffer[(*bytes_read)++] = fifos_read(e_priv, FIFO_DATA_REG) & fifo_data_mask;
 	}
 
-	/* If we got an end interrupt, figure out if it was
+	/*
+	 * If we got an end interrupt, figure out if it was
 	 * associated with the last byte we dma'd or with a
 	 * byte still sitting on the cb7210.
 	 */
 	spin_lock_irqsave(&board->spinlock, flags);
 	if (*bytes_read > 0 && test_bit(READ_READY_BN, &nec_priv->state) == 0) {
-		// If there is no byte sitting on the cb7210 and we
-		// saw an end, we need to deal with it now
+		/*
+		 * If there is no byte sitting on the cb7210 and we
+		 * saw an end, we need to deal with it now
+		 */
 		if (test_and_clear_bit(RECEIVED_END_BN, &nec_priv->state))
 			*end = 1;
 	}
@@ -819,7 +833,8 @@ static void fmh_gpib_release_rfd_holdoff(struct gpib_board *board, struct fmh_pr
 
 	ext_status_1 = read_byte(nec_priv, EXT_STATUS_1_REG);
 
-	/* if there is an end byte sitting on the chip, don't release
+	/*
+	 * if there is an end byte sitting on the chip, don't release
 	 * holdoff.  We want it left set after we read out the end
 	 * byte.
 	 */
@@ -828,7 +843,8 @@ static void fmh_gpib_release_rfd_holdoff(struct gpib_board *board, struct fmh_pr
 		if (ext_status_1 & RFD_HOLDOFF_STATUS_BIT)
 			write_byte(nec_priv, AUX_FH, AUXMR);
 
-		/* Check if an end byte raced in before we executed the AUX_FH command.
+		/*
+		 * Check if an end byte raced in before we executed the AUX_FH command.
 		 * If it did, we want to make sure the rfd holdoff is in effect.  The end
 		 * byte can arrive since
 		 * AUX_RFD_HOLDOFF_ASAP doesn't immediately force the acceptor handshake
@@ -893,7 +909,8 @@ static int fmh_gpib_accel_read(struct gpib_board *board, uint8_t *buffer, size_t
 	return retval;
 }
 
-/* Read a chunk of data whose length is within the limits of the hardware's
+/*
+ * Read a chunk of data whose length is within the limits of the hardware's
  * xfer counter.  Called in a loop from fmh_gpib_fifo_read().
  */
 static int fmh_gpib_fifo_read_countable(struct gpib_board *board, uint8_t *buffer,
@@ -969,7 +986,8 @@ static int fmh_gpib_fifo_read(struct gpib_board *board, uint8_t *buffer, size_t
 	*end = 0;
 	*bytes_read = 0;
 
-	/* Do a little prep with data in interrupt so that following wait_for_read()
+	/*
+	 * Do a little prep with data in interrupt so that following wait_for_read()
 	 * will wake up if a data byte is received.
 	 */
 	nec7210_set_reg_bits(nec_priv, IMR1, HR_DIIE, HR_DIIE);
@@ -1166,7 +1184,8 @@ irqreturn_t fmh_gpib_internal_interrupt(struct gpib_board *board)
 		clear_bit(RFD_HOLDOFF_BN, &nec_priv->state);
 
 	if (ext_status_1 & END_STATUS_BIT) {
-		/* only set RECEIVED_END while there is still a data
+		/*
+		 * only set RECEIVED_END while there is still a data
 		 * byte sitting in the chip, to avoid spuriously
 		 * setting it multiple times after it has been cleared
 		 * during a read.
@@ -1179,7 +1198,8 @@ irqreturn_t fmh_gpib_internal_interrupt(struct gpib_board *board)
 
 	if ((fifo_status & TX_FIFO_HALF_EMPTY_INTERRUPT_IS_ENABLED) &&
 	    (fifo_status & TX_FIFO_HALF_EMPTY)) {
-		/* We really only want to clear the
+		/*
+		 * We really only want to clear the
 		 * TX_FIFO_HALF_EMPTY_INTERRUPT_ENABLE bit in the
 		 * FIFO_CONTROL_STATUS_REG.  Since we are not being
 		 * careful, this also has a side effect of disabling
@@ -1193,7 +1213,8 @@ irqreturn_t fmh_gpib_internal_interrupt(struct gpib_board *board)
 
 	if ((fifo_status & RX_FIFO_HALF_FULL_INTERRUPT_IS_ENABLED) &&
 	    (fifo_status & RX_FIFO_HALF_FULL)) {
-		/* We really only want to clear the
+		/*
+		 * We really only want to clear the
 		 * RX_FIFO_HALF_FULL_INTERRUPT_ENABLE bit in the
 		 * FIFO_CONTROL_STATUS_REG.  Since we are not being
 		 * careful, this also has a side effect of disabling
@@ -1444,7 +1465,8 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const gpib_board_confi
 			return -EIO;
 		}
 	}
-	/* in the future we might want to know the half-fifo size
+	/*
+	 * in the future we might want to know the half-fifo size
 	 * (dma_burst_length) even when not using dma, so go ahead an
 	 * initialize it unconditionally.
 	 */
-- 
2.49.0

