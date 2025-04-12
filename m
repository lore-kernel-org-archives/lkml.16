Received: from out.smtpout.orange.fr (out-67.smtpout.orange.fr [193.252.22.67])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C927FD
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744441762; cv=none; b=jefz7dhRmYAVTMGQ3NDqRwxbZ+ha1bWQzM5dRa9xqGrxN6v0hvCaTb6KLzZygqx1OlgsQon7I5HAcMA9Hw2rIrEnVFsCpSGnPZtuMXWo1B0f0K/rG+ZTl3wtv/8CiGQJkIifkVHBdRokfS39fM98f8St9CzeXzIkY7Mc+A1YPcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744441762; c=relaxed/simple;
	bh=ObI/eBXSwueiLbh/W262pQOsW5q9GzUhDYiqINvHFH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=izi/W5GvOWE7qT93Up4rC9I4ExRDY6osFeDCFr3XAR7Hd8FNwNm4FBaewebpzLN+eKlUtMiLf88EHzGF+a6ks2A31iz2DKVzJK1OxXZ+ewk8ckBIuxpZnxoznEPsy497WsqAtz+jsibSASH6UWVmCeH79crHH0a9cFqLpdiCWG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=pTCrFZNz; arc=none smtp.client-ip=193.252.22.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="pTCrFZNz"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3Uy7uq3PTX7PJ3UyBuK7yP; Sat, 12 Apr 2025 09:08:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744441686;
	bh=RdrGqUxYKIUxWcSWCmpIVhg02jT+Jr6I9gU2Sw+YTQQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=pTCrFZNzdtVCa+fssemeB7n3RXcpYzabWHbCCZ6JiKkSnfpZERmK+i+ewxRc6l1Li
	 E1LmB7ER1BCuaOG2XS4RniSK5GiW6TLyJNq1WK22sSOD6UanmwjqGtCL7NBvJHV781
	 +HqN8x1P5+loRH+QMLNzKtJsiaJTnUH3Lig4McPKjAh74Hh705Faty7QZdh1kpX2Mo
	 fMVytaAfzpLqqjPe6xOrqpbMcSONAfLOu/tI8KZ5rwZlbcRUNFawaOBmyHlVXjmOda
	 FVYvwPJQU3DMkqo2mZzx/uEi9oJ88W8LIz1qWYjFJgvJrBt1CH0+mUcbeGXtE2/5L4
	 69Ahz092Y/lsg==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 09:08:06 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/16] staging: gpib: ni_usb: fixes multiline comments style
Date: Sat, 12 Apr 2025 00:07:54 -0700
Message-ID: <4b2762d349e06db8f541a86ca0ec429bc1351097.1744438358.git.paul.retourne@orange.fr>
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
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 40 +++++++++++++++--------
 drivers/staging/gpib/ni_usb/ni_usb_gpib.h | 32 +++++++++++-------
 2 files changed, 47 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 9f1b9927f025..62735a0cb4ec 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -74,7 +74,8 @@ static unsigned short ni_usb_timeout_code(unsigned int usec)
 		return 0xff;
 	else if	 (usec <= 300000000)
 		return 0x01;
-	/* NI driver actually uses 0xff for timeout T1000s, which is a bug in their code.
+	/*
+	 * NI driver actually uses 0xff for timeout T1000s, which is a bug in their code.
 	 * I've verified on a usb-b that a code of 0x2 is correct for a 1000 sec timeout
 	 */
 	else if (usec <= 1000000000)
@@ -232,7 +233,8 @@ static int ni_usb_nonblocking_receive_bulk_msg(struct ni_usb_priv *ni_priv,
 	mutex_unlock(&ni_priv->bulk_transfer_lock);
 	if (interruptible) {
 		if (wait_for_completion_interruptible(&context->complete)) {
-			/* If we got interrupted by a signal while
+			/*
+			 * If we got interrupted by a signal while
 			 * waiting for the usb gpib to respond, we
 			 * should send a stop command so it will
 			 * finish up with whatever it was doing and
@@ -240,8 +242,9 @@ static int ni_usb_nonblocking_receive_bulk_msg(struct ni_usb_priv *ni_priv,
 			 */
 			ni_usb_stop(ni_priv);
 			retval = -ERESTARTSYS;
-			/* now do an uninterruptible wait, it shouldn't take long
-			 *	for the board to respond now.
+			/*
+			 * now do an uninterruptible wait, it shouldn't take long
+			 * for the board to respond now.
 			 */
 			wait_for_completion(&context->complete);
 		}
@@ -684,7 +687,8 @@ static int ni_usb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
 		retval = 0;
 		break;
 	case NIUSB_ABORTED_ERROR:
-		/* this is expected if ni_usb_receive_bulk_msg got
+		/*
+		 * this is expected if ni_usb_receive_bulk_msg got
 		 * interrupted by a signal and returned -ERESTARTSYS
 		 */
 		break;
@@ -794,7 +798,8 @@ static int ni_usb_write(struct gpib_board *board, uint8_t *buffer, size_t length
 		retval = 0;
 		break;
 	case NIUSB_ABORTED_ERROR:
-		/* this is expected if ni_usb_receive_bulk_msg got
+		/*
+		 * this is expected if ni_usb_receive_bulk_msg got
 		 * interrupted by a signal and returned -ERESTARTSYS
 		 */
 		break;
@@ -893,7 +898,8 @@ static int ni_usb_command_chunk(struct gpib_board *board, uint8_t *buffer, size_
 	case NIUSB_NO_ERROR:
 		break;
 	case NIUSB_ABORTED_ERROR:
-		/* this is expected if ni_usb_receive_bulk_msg got
+		/*
+		 * this is expected if ni_usb_receive_bulk_msg got
 		 * interrupted by a signal and returned -ERESTARTSYS
 		 */
 		break;
@@ -1192,8 +1198,9 @@ static int ni_usb_enable_eos(struct gpib_board *board, uint8_t eos_byte, int com
 static void ni_usb_disable_eos(struct gpib_board *board)
 {
 	struct ni_usb_priv *ni_priv = board->private_data;
-	/* adapter gets unhappy if you don't zero all the bits
-	 *	for the eos mode and eos char (returns error 4 on reads).
+	/*
+	 * adapter gets unhappy if you don't zero all the bits
+	 * for the eos mode and eos char (returns error 4 on reads).
 	 */
 	ni_priv->eos_mode = 0;
 	ni_priv->eos_char = 0;
@@ -2045,8 +2052,10 @@ static int ni_usb_hs_wait_for_ready(struct ni_usb_priv *ni_priv)
 			unexpected = 1;
 		}
 		++j;
-		// MC usb-488 (and sometimes NI-USB-HS?) sends 0x8 here; MC usb-488A sends 0x7 here
-		// NI-USB-HS+ sends 0x0
+		/*
+		 * MC usb-488 (and sometimes NI-USB-HS?) sends 0x8 here; MC usb-488A sends 0x7 here
+		 * NI-USB-HS+ sends 0x0
+		 */
 		if (buffer[j] != 0x1 && buffer[j] != 0x8 && buffer[j] != 0x7 && buffer[j] != 0x0) {
 			// [3]
 			dev_err(&usb_dev->dev, "unexpected data: buffer[%i]=0x%x, expected 0x0, 0x1, 0x7 or 0x8\n",
@@ -2127,7 +2136,8 @@ static int ni_usb_hs_wait_for_ready(struct ni_usb_priv *ni_priv)
 	return retval;
 }
 
-/* This does some extra init for HS+ models, as observed on Windows.  One of the
+/*
+ * This does some extra init for HS+ models, as observed on Windows.  One of the
  * control requests causes the LED to stop blinking.
  * I'm not sure what the other 2 requests do.  None of these requests are actually required
  * for the adapter to work, maybe they do some init for the analyzer interface
@@ -2343,8 +2353,10 @@ static void ni_usb_detach(struct gpib_board *board)
 	struct ni_usb_priv *ni_priv;
 
 	mutex_lock(&ni_usb_hotplug_lock);
-// under windows, software unplug does chip_reset nec7210 aux command,
-// then writes 0x0 to address 0x10 of device 3
+	/*
+	 * under windows, software unplug does chip_reset nec7210 aux command,
+	 * then writes 0x0 to address 0x10 of device 3
+	 */
 	ni_priv = board->private_data;
 	if (ni_priv) {
 		if (ni_priv->bus_interface) {
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.h b/drivers/staging/gpib/ni_usb/ni_usb_gpib.h
index 4b297db09a9b..b011e131201c 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.h
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.h
@@ -113,27 +113,37 @@ enum ni_usb_bulk_ids {
 
 enum ni_usb_error_codes {
 	NIUSB_NO_ERROR = 0,
-	/* NIUSB_ABORTED_ERROR occurs when I/O is interrupted early by
-	 *	doing a NI_USB_STOP_REQUEST on the control endpoint.
+	/*
+	 * NIUSB_ABORTED_ERROR occurs when I/O is interrupted early by
+	 * doing a NI_USB_STOP_REQUEST on the control endpoint.
 	 */
 	NIUSB_ABORTED_ERROR = 1,
-	// NIUSB_READ_ATN_ERROR occurs when you do a board read while
-	// ATN is set
+	/*
+	 * NIUSB_READ_ATN_ERROR occurs when you do a board read while
+	 * ATN is set
+	 */
 	NIUSB_ATN_STATE_ERROR = 2,
-	// NIUSB_ADDRESSING_ERROR occurs when you do a board
-	// read/write as CIC but are not in LACS/TACS
+	/*
+	 * NIUSB_ADDRESSING_ERROR occurs when you do a board
+	 * read/write as CIC but are not in LACS/TACS
+	 */
 	NIUSB_ADDRESSING_ERROR = 3,
-	/* NIUSB_EOSMODE_ERROR occurs on reads if any eos mode or char
+	/*
+	 * NIUSB_EOSMODE_ERROR occurs on reads if any eos mode or char
 	 * bits are set when REOS is not set.
 	 * Have also seen error 4 if you try to send more than 16
 	 * command bytes at once on a usb-b.
 	 */
 	NIUSB_EOSMODE_ERROR = 4,
-	// NIUSB_NO_BUS_ERROR occurs when you try to write a command
-	// byte but there are no devices connected to the gpib bus
+	/*
+	 * NIUSB_NO_BUS_ERROR occurs when you try to write a command
+	 * byte but there are no devices connected to the gpib bus
+	 */
 	NIUSB_NO_BUS_ERROR = 5,
-	// NIUSB_NO_LISTENER_ERROR occurs when you do a board write as
-	// CIC with no listener
+	/*
+	 * NIUSB_NO_LISTENER_ERROR occurs when you do a board write as
+	 * CIC with no listener
+	 */
 	NIUSB_NO_LISTENER_ERROR = 8,
 	// get NIUSB_TIMEOUT_ERROR on board read/write timeout
 	NIUSB_TIMEOUT_ERROR = 10,
-- 
2.49.0

