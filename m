Received: from out.smtpout.orange.fr (outm-50.smtpout.orange.fr [193.252.22.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198347D3F4
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744440581; cv=none; b=YnZ3BbsE60oCdfID5/rV3Cm6tjI7hQTOQ4YN1Jl+9oDDoSIANd3u4H7RuwtKp9r/vf1IGIljT/3Shj22KKEYuzy3cxjnx9/Da22pJU6a+DEZxmqQ3YDA9otcRa7NO3D2I/+7ng2zdYd7l2NTIlHFDjpYBTg84hmdTXV12mDWn6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744440581; c=relaxed/simple;
	bh=mH7zDevPNYTr+1kdTDaCGMSroPfVGxNIdvITme9rG+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m7MLE3qJ5HUBSqHZH+b4+9HLLI/zu5C/vS7UDTFI7OgqbD1G5ZURnnrzZ3VyY1ihUffidU9s2JItZrKhsi9xLKDWcEzfEY4inPgffkcPV8LLDpleyRRR+5so9NqCs7xUbAzMYxzSPly6WcMAyNUyzerbZBztW53TgoIBZdAgcME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=LZHV+Smt; arc=none smtp.client-ip=193.252.22.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="LZHV+Smt"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3UgGulZ4tBkGO3UgKu651W; Sat, 12 Apr 2025 08:49:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744440578;
	bh=C8nI+H4mpuKXD1G5NCEn9hFgwdTXnNiDXVTLCrvw1Vo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=LZHV+Smt2NCFE5l6eSAbb7fTI+VUK7HWDKzyzi42IomwFbEQWq93V1xWTcIoI/YQn
	 vk3jUMyWVzutKVel8Qrq3zU+WOMPUmsIqBQIpw5FDTQ4TFJD3Pj7lBSU8389qJUF/u
	 n5uyjLithwgdA9GsxkZlcQWwQDubk9E/kKnN1CiCWBcHHXCBac6rs7lwZ1BnkMuQ2u
	 q0WRIAUILW+uHjN9zf/OdzhfryWnjAzplcV4R07od/6BoYDe2EN2fprBZyABk6jN8S
	 MEgMDjUiy1CegUXLQ5v0sDaSp4kXfmg3MHMiEkw3VVKUAYowWU3jhBcRSqtLV9qXdj
	 QMC309/znEtjQ==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:49:38 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/16] staging: gpib: nec7210: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:49:26 -0700
Message-ID: <2bdfadb59d11441d10c8e3994de49b876f8e7efe.1744438358.git.paul.retourne@orange.fr>
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
 drivers/staging/gpib/nec7210/nec7210.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/nec7210/nec7210.c b/drivers/staging/gpib/nec7210/nec7210.c
index 846c0a3fa1dc..eaa37f916b0b 100644
--- a/drivers/staging/gpib/nec7210/nec7210.c
+++ b/drivers/staging/gpib/nec7210/nec7210.c
@@ -79,7 +79,8 @@ void nec7210_parallel_poll_response(struct gpib_board *board, struct nec7210_pri
 		write_byte(priv, AUX_CPPF, AUXMR);
 }
 EXPORT_SYMBOL(nec7210_parallel_poll_response);
-/* This is really only adequate for chips that do a 488.2 style reqt/reqf
+/*
+ * This is really only adequate for chips that do a 488.2 style reqt/reqf
  * based on bit 6 of the SPMR (see chapter 11.3.3 of 488.2). For simpler chips that simply
  * set rsv directly based on bit 6, we either need to do more hardware setup to expose
  * the 488.2 capability (for example with NI chips), or we need to implement the
@@ -202,7 +203,8 @@ unsigned int nec7210_update_status_nolock(struct gpib_board *board, struct nec72
 		set_bit(SPOLL_NUM, &board->status);
 	}
 
-	/* we rely on the interrupt handler to set the
+	/*
+	 * we rely on the interrupt handler to set the
 	 * rest of the status bits
 	 */
 
@@ -482,7 +484,8 @@ static int pio_read(struct gpib_board *board, struct nec7210_priv *priv, uint8_t
 		}
 		if (test_bit(READ_READY_BN, &priv->state)) {
 			if (*bytes_read == 0)	{
-				/* We set the handshake mode here because we know
+				/*
+				 * We set the handshake mode here because we know
 				 * no new bytes will arrive (it has already arrived
 				 * and is awaiting being read out of the chip) while we are changing
 				 * modes.  This ensures we can reliably keep track
@@ -662,7 +665,8 @@ static int pio_write(struct gpib_board *board, struct nec7210_priv *priv, uint8_
 		if (retval == -EIO) {
 			/* resend last byte on bus error */
 			*bytes_written = last_count;
-			/* we can get unrecoverable bus errors,
+			/*
+			 * we can get unrecoverable bus errors,
 			 * so give up after a while
 			 */
 			bus_error_count++;
@@ -805,7 +809,8 @@ int nec7210_write(struct gpib_board *board, struct nec7210_priv *priv,
 	if (send_eoi) {
 		size_t num_bytes;
 
-		/* We need to wait to make sure we will immediately be able to write the data byte
+		/*
+		 * We need to wait to make sure we will immediately be able to write the data byte
 		 * into the chip before sending the associated AUX_SEOI command.  This is really
 		 * only needed for length==1 since otherwise the earlier calls to pio_write
 		 * will have dont the wait already.
@@ -827,7 +832,7 @@ int nec7210_write(struct gpib_board *board, struct nec7210_priv *priv,
 EXPORT_SYMBOL(nec7210_write);
 
 /*
- *  interrupt service routine
+ * interrupt service routine
  */
 irqreturn_t nec7210_interrupt(struct gpib_board *board, struct nec7210_priv *priv)
 {
@@ -1021,7 +1026,8 @@ EXPORT_SYMBOL(nec7210_ioport_read_byte);
 void nec7210_ioport_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned int register_num)
 {
 	if (register_num == AUXMR)
-		/* locking makes absolutely sure noone accesses the
+		/*
+		 * locking makes absolutely sure noone accesses the
 		 * AUXMR register faster than once per microsecond
 		 */
 		nec7210_locking_ioport_write_byte(priv, data, register_num);
@@ -1066,7 +1072,8 @@ EXPORT_SYMBOL(nec7210_iomem_read_byte);
 void nec7210_iomem_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned int register_num)
 {
 	if (register_num == AUXMR)
-		/* locking makes absolutely sure noone accesses the
+		/*
+		 * locking makes absolutely sure noone accesses the
 		 * AUXMR register faster than once per microsecond
 		 */
 		nec7210_locking_iomem_write_byte(priv, data, register_num);
-- 
2.49.0

