Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01B9278152
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222207; cv=none; b=Q5y1Em0MPiAYU7kjqgZ9xH7KlAdeQkQhMRNsRIORiDpukvijVepASlLigQomJ4DLxC8/yHgrcPiUazqpLgSAG0l8YlGDy2H7n5pBjQJQFbLeeL+1QHGor9RFQ+FVr3t7TR/znfEKQeVjhMxF8VqWJu2dUdGsHEhzFnzVPLaLV7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222207; c=relaxed/simple;
	bh=gEfhsR+YoPTd+1QxR6mtYc1mb8cjKZInliuBpW2id+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=urEvy8wJkUmmq3zrCsUU904YGHxgr9DeggGFy70JOR4S7tHdbcEnSOM4cQqTRnubuuIRqSlU5Hg7momyezyJconZ32b2FaCnLLgNhmbLZ1gch0JqP9Ky8d6mjM3k50N7BrrvY63qMthejT7BSybG61ryvWOLzkSUuk+4yKBgQIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=GbRvxTLP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="GbRvxTLP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227b650504fso67404435ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222204; x=1744827004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=an0FxsYq4uBD3HW0f0sH22mhrpr0rxYqMH7xxOrISVU=;
        b=GbRvxTLPAn9AZmys36ppj6RAwr4WgzbawzyGca+04y20z6ucMHMViYOYXdQyGfBCzQ
         7dif+JB19QNyLE+bAuYj1CNQZR6OfmKG3MYP7vOkWArIe8IL79ZpcPA1hjyX9KO8iYrk
         ZmdleRqkXbPwTEl6x0vdSQVSWQPF+fIaUEEnJ999goLESuRLkSog+hnHVzAGVLjRbHpf
         7Ow+DuttpcwN2EeFAANI8m7XlPWdbwV6g+AsnV34EoTdjMigAU7pMhnued8oZmJTG2IX
         zQgdls2H1VDzW/0CZK6i6+LfwRneQ/SNuNeqpFvWR5qr5hoxs/bJuPJ4JiK8wF/DiAth
         1njA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222204; x=1744827004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=an0FxsYq4uBD3HW0f0sH22mhrpr0rxYqMH7xxOrISVU=;
        b=R5dcChD+COyh/rZJYbMLoCwL1ZDoLP2GDLaR+F79im1ceXJuDB2dElfZPBwCbX9lGf
         ZQ1zlFuZKf2/Yg0/WlxOCs63S2FoUIZRmL1C/om0apUzt3zq6PlWWRIDN2FXcwUhr4kh
         PuOW4YOncMSnsPfZYe6UQ3ae1df2jpEN4DIoo5ld1C5chfbiiWaiNTavH0s+X5/N03zV
         vDcTX2bb+8JPdMV7+C2MQkqQIRgcDcxc+B7TVulfSncXRfr53hGw2WS6jXF4uH836Wih
         AdMLruYCfM7Q6H7d2g9tBGfkRPLX2FpvAubZ2Y7aAB8vUIYjcQArn16E10dysWF2xCsL
         pB6w==
X-Forwarded-Encrypted: i=1; AJvYcCWiwWC45HWaqTz9jiy7aWtZupLjp95519ZWq8W/StKnzsgvY/vo8HQi7FgS2HbWlI4T0Yp1F0ebPdCCHnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjneaAL9kWdGK2DFk50sXc2uGt6G82ff0per9wbo6w+DFEoU2x
	67/0EfNIvid7ZvOwhWbCbQMiAsVqUBsixN7XqP/vX71nmE22yJmfxn9Ez4uCAw==
X-Gm-Gg: ASbGncvkxsZT0+KIkRYWPQfMI586kUFE6fSzrf9pqx3BfklM5J2dk418pLzpqys55l9
	DU6E8Xogv3iEPwkqR5AFmRGcgzVVC4fAUmKTfJCQOAgME1jslXIFdZnzqxAy+8IFj4FlEVEi+Ox
	gY9vwDeJammfOFtAmFBLI96+ShTMI6MXhVJ1E3rwNx3yfceW0lB+/gbe99CeogdT+XRGjIticsF
	r+1xHYny3UBP7LOzxBFJyoWT/34yA4/KMtai60Zf5fBOwecJBxO6L5HPpcwdU9ZcNo6xPQowNVg
	n/45qzk4Pc0/V9EYaIU18tVhowlTtD+6mpudS5osCs4yuxq3Bh1LO/gBsELzsx2M0qctjfAifc2
	jdJwU1A==
X-Google-Smtp-Source: AGHT+IE3kUl81k0hClM8Ad7ImAATUx6ek6FXvVXLWgJF6nDXh+flCLY+nppP7EVGSmCcP17bDVjCuQ==
X-Received: by 2002:a17:903:3bce:b0:220:e1e6:4457 with SMTP id d9443c01a7336-22ac3f9a6f1mr48849095ad.26.1744222204059;
        Wed, 09 Apr 2025 11:10:04 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e38263sm1716573b3a.91.2025.04.09.11.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:03 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 07/23] staging: gpib: nec7210: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:37 +0000
Message-ID: <20250409180953.398686-8-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/nec7210.h | 33 +++++++++++----------
 drivers/staging/gpib/nec7210/nec7210.c | 40 +++++++++++++-------------
 2 files changed, 36 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/gpib/include/nec7210.h b/drivers/staging/gpib/include/nec7210.h
index 5c57fbffb9d0..97a56f74258b 100644
--- a/drivers/staging/gpib/include/nec7210.h
+++ b/drivers/staging/gpib/include/nec7210.h
@@ -78,11 +78,11 @@ enum {
 };
 
 // interface functions
-int nec7210_read(struct gpib_board *board, struct nec7210_priv *priv, uint8_t *buffer,
+int nec7210_read(struct gpib_board *board, struct nec7210_priv *priv, u8 *buffer,
 		 size_t length, int *end, size_t *bytes_read);
-int nec7210_write(struct gpib_board *board, struct nec7210_priv *priv, uint8_t *buffer,
+int nec7210_write(struct gpib_board *board, struct nec7210_priv *priv, u8 *buffer,
 		  size_t length, int send_eoi, size_t *bytes_written);
-int nec7210_command(struct gpib_board *board, struct nec7210_priv *priv, uint8_t *buffer,
+int nec7210_command(struct gpib_board *board, struct nec7210_priv *priv, u8 *buffer,
 		    size_t length, size_t *bytes_written);
 int nec7210_take_control(struct gpib_board *board, struct nec7210_priv *priv, int syncronous);
 int nec7210_go_to_standby(struct gpib_board *board, struct nec7210_priv *priv);
@@ -90,7 +90,7 @@ void nec7210_request_system_control(struct gpib_board *board,
 				    struct nec7210_priv *priv, int request_control);
 void nec7210_interface_clear(struct gpib_board *board, struct nec7210_priv *priv, int assert);
 void nec7210_remote_enable(struct gpib_board *board, struct nec7210_priv *priv, int enable);
-int nec7210_enable_eos(struct gpib_board *board, struct nec7210_priv *priv, uint8_t eos_bytes,
+int nec7210_enable_eos(struct gpib_board *board, struct nec7210_priv *priv, u8 eos_bytes,
 		       int compare_8_bits);
 void nec7210_disable_eos(struct gpib_board *board, struct nec7210_priv *priv);
 unsigned int nec7210_update_status(struct gpib_board *board, struct nec7210_priv *priv,
@@ -100,15 +100,14 @@ int nec7210_primary_address(const struct gpib_board *board,
 			    struct nec7210_priv *priv, unsigned int address);
 int nec7210_secondary_address(const struct gpib_board *board, struct nec7210_priv *priv,
 			      unsigned int address, int enable);
-int nec7210_parallel_poll(struct gpib_board *board, struct nec7210_priv *priv, uint8_t *result);
+int nec7210_parallel_poll(struct gpib_board *board, struct nec7210_priv *priv, u8 *result);
 void nec7210_serial_poll_response(struct gpib_board *board,
-				  struct nec7210_priv *priv, uint8_t status);
+				  struct nec7210_priv *priv, u8 status);
 void nec7210_parallel_poll_configure(struct gpib_board *board,
 				     struct nec7210_priv *priv, unsigned int configuration);
 void nec7210_parallel_poll_response(struct gpib_board *board,
 				    struct nec7210_priv *priv, int ist);
-uint8_t nec7210_serial_poll_status(struct gpib_board *board,
-				   struct nec7210_priv *priv);
+u8 nec7210_serial_poll_status(struct gpib_board *board, struct nec7210_priv *priv);
 int nec7210_t1_delay(struct gpib_board *board,
 		     struct nec7210_priv *priv, unsigned int nano_sec);
 void nec7210_return_to_local(const struct gpib_board *board, struct nec7210_priv *priv);
@@ -120,18 +119,18 @@ unsigned int nec7210_set_reg_bits(struct nec7210_priv *priv, unsigned int reg,
 				  unsigned int mask, unsigned int bits);
 void nec7210_set_handshake_mode(struct gpib_board *board, struct nec7210_priv *priv, int mode);
 void nec7210_release_rfd_holdoff(struct gpib_board *board, struct nec7210_priv *priv);
-uint8_t nec7210_read_data_in(struct gpib_board *board, struct nec7210_priv *priv, int *end);
+u8 nec7210_read_data_in(struct gpib_board *board, struct nec7210_priv *priv, int *end);
 
 // wrappers for io functions
-uint8_t nec7210_ioport_read_byte(struct nec7210_priv *priv, unsigned int register_num);
-void nec7210_ioport_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned int register_num);
-uint8_t nec7210_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num);
-void nec7210_iomem_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned int register_num);
-uint8_t nec7210_locking_ioport_read_byte(struct nec7210_priv *priv, unsigned int register_num);
-void nec7210_locking_ioport_write_byte(struct nec7210_priv *priv, uint8_t data,
+u8 nec7210_ioport_read_byte(struct nec7210_priv *priv, unsigned int register_num);
+void nec7210_ioport_write_byte(struct nec7210_priv *priv, u8 data, unsigned int register_num);
+u8 nec7210_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num);
+void nec7210_iomem_write_byte(struct nec7210_priv *priv, u8 data, unsigned int register_num);
+u8 nec7210_locking_ioport_read_byte(struct nec7210_priv *priv, unsigned int register_num);
+void nec7210_locking_ioport_write_byte(struct nec7210_priv *priv, u8 data,
 				       unsigned int register_num);
-uint8_t nec7210_locking_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num);
-void nec7210_locking_iomem_write_byte(struct nec7210_priv *priv, uint8_t data,
+u8 nec7210_locking_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num);
+void nec7210_locking_iomem_write_byte(struct nec7210_priv *priv, u8 data,
 				      unsigned int register_num);
 
 // interrupt service routine
diff --git a/drivers/staging/gpib/nec7210/nec7210.c b/drivers/staging/gpib/nec7210/nec7210.c
index 9b4870f1b421..2998ed0ea528 100644
--- a/drivers/staging/gpib/nec7210/nec7210.c
+++ b/drivers/staging/gpib/nec7210/nec7210.c
@@ -23,7 +23,7 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB library code for NEC uPD7210");
 
-int nec7210_enable_eos(struct gpib_board *board, struct nec7210_priv *priv, uint8_t eos_byte,
+int nec7210_enable_eos(struct gpib_board *board, struct nec7210_priv *priv, u8 eos_byte,
 		       int compare_8_bits)
 {
 	write_byte(priv, eos_byte, EOSR);
@@ -44,7 +44,7 @@ void nec7210_disable_eos(struct gpib_board *board, struct nec7210_priv *priv)
 }
 EXPORT_SYMBOL(nec7210_disable_eos);
 
-int nec7210_parallel_poll(struct gpib_board *board, struct nec7210_priv *priv, uint8_t *result)
+int nec7210_parallel_poll(struct gpib_board *board, struct nec7210_priv *priv, u8 *result)
 {
 	int ret;
 
@@ -86,7 +86,7 @@ EXPORT_SYMBOL(nec7210_parallel_poll_response);
  * 488.2 set srv state machine in the driver (if that is even viable).
  */
 void nec7210_serial_poll_response(struct gpib_board *board,
-				  struct nec7210_priv *priv, uint8_t status)
+				  struct nec7210_priv *priv, u8 status)
 {
 	unsigned long flags;
 
@@ -103,7 +103,7 @@ void nec7210_serial_poll_response(struct gpib_board *board,
 }
 EXPORT_SYMBOL(nec7210_serial_poll_response);
 
-uint8_t nec7210_serial_poll_status(struct gpib_board *board, struct nec7210_priv *priv)
+u8 nec7210_serial_poll_status(struct gpib_board *board, struct nec7210_priv *priv)
 {
 	return read_byte(priv, SPSR);
 }
@@ -251,7 +251,7 @@ void nec7210_set_handshake_mode(struct gpib_board *board, struct nec7210_priv *p
 }
 EXPORT_SYMBOL(nec7210_set_handshake_mode);
 
-uint8_t nec7210_read_data_in(struct gpib_board *board, struct nec7210_priv *priv, int *end)
+u8 nec7210_read_data_in(struct gpib_board *board, struct nec7210_priv *priv, int *end)
 {
 	unsigned long flags;
 	u8 data;
@@ -415,7 +415,7 @@ static inline short nec7210_atn_has_changed(struct gpib_board *board, struct nec
 	return -1;
 }
 
-int nec7210_command(struct gpib_board *board, struct nec7210_priv *priv, uint8_t
+int nec7210_command(struct gpib_board *board, struct nec7210_priv *priv, u8
 		    *buffer, size_t length, size_t *bytes_written)
 {
 	int retval = 0;
@@ -464,7 +464,7 @@ int nec7210_command(struct gpib_board *board, struct nec7210_priv *priv, uint8_t
 }
 EXPORT_SYMBOL(nec7210_command);
 
-static int pio_read(struct gpib_board *board, struct nec7210_priv *priv, uint8_t *buffer,
+static int pio_read(struct gpib_board *board, struct nec7210_priv *priv, u8 *buffer,
 		    size_t length, int *end, size_t *bytes_read)
 {
 	ssize_t retval = 0;
@@ -568,7 +568,7 @@ static ssize_t __dma_read(struct gpib_board *board, struct nec7210_priv *priv, s
 	return retval ? retval : count;
 }
 
-static ssize_t dma_read(struct gpib_board *board, struct nec7210_priv *priv, uint8_t *buffer,
+static ssize_t dma_read(struct gpib_board *board, struct nec7210_priv *priv, u8 *buffer,
 			size_t length)
 {
 	size_t remain = length;
@@ -595,7 +595,7 @@ static ssize_t dma_read(struct gpib_board *board, struct nec7210_priv *priv, uin
 }
 #endif
 
-int nec7210_read(struct gpib_board *board, struct nec7210_priv *priv, uint8_t *buffer,
+int nec7210_read(struct gpib_board *board, struct nec7210_priv *priv, u8 *buffer,
 		 size_t length, int *end, size_t *bytes_read)
 {
 	ssize_t retval = 0;
@@ -642,7 +642,7 @@ static int pio_write_wait(struct gpib_board *board, struct nec7210_priv *priv,
 	return 0;
 }
 
-static int pio_write(struct gpib_board *board, struct nec7210_priv *priv, uint8_t *buffer,
+static int pio_write(struct gpib_board *board, struct nec7210_priv *priv, u8 *buffer,
 		     size_t length, size_t *bytes_written)
 {
 	size_t last_count = 0;
@@ -742,7 +742,7 @@ static ssize_t __dma_write(struct gpib_board *board, struct nec7210_priv *priv,
 	return retval ? retval : length;
 }
 
-static ssize_t dma_write(struct gpib_board *board, struct nec7210_priv *priv, uint8_t *buffer,
+static ssize_t dma_write(struct gpib_board *board, struct nec7210_priv *priv, u8 *buffer,
 			 size_t length)
 {
 	size_t remain = length;
@@ -767,7 +767,7 @@ static ssize_t dma_write(struct gpib_board *board, struct nec7210_priv *priv, ui
 }
 #endif
 int nec7210_write(struct gpib_board *board, struct nec7210_priv *priv,
-		  uint8_t *buffer, size_t length, int send_eoi,
+		  u8 *buffer, size_t length, int send_eoi,
 		  size_t *bytes_written)
 {
 	int retval = 0;
@@ -1012,13 +1012,13 @@ EXPORT_SYMBOL(nec7210_board_online);
 
 #ifdef CONFIG_HAS_IOPORT
 /* wrappers for io */
-uint8_t nec7210_ioport_read_byte(struct nec7210_priv *priv, unsigned int register_num)
+u8 nec7210_ioport_read_byte(struct nec7210_priv *priv, unsigned int register_num)
 {
 	return inb(priv->iobase + register_num * priv->offset);
 }
 EXPORT_SYMBOL(nec7210_ioport_read_byte);
 
-void nec7210_ioport_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned int register_num)
+void nec7210_ioport_write_byte(struct nec7210_priv *priv, u8 data, unsigned int register_num)
 {
 	if (register_num == AUXMR)
 		/* locking makes absolutely sure noone accesses the
@@ -1031,7 +1031,7 @@ void nec7210_ioport_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned
 EXPORT_SYMBOL(nec7210_ioport_write_byte);
 
 /* locking variants of io wrappers, for chips that page-in registers */
-uint8_t nec7210_locking_ioport_read_byte(struct nec7210_priv *priv, unsigned int register_num)
+u8 nec7210_locking_ioport_read_byte(struct nec7210_priv *priv, unsigned int register_num)
 {
 	u8 retval;
 	unsigned long flags;
@@ -1043,7 +1043,7 @@ uint8_t nec7210_locking_ioport_read_byte(struct nec7210_priv *priv, unsigned int
 }
 EXPORT_SYMBOL(nec7210_locking_ioport_read_byte);
 
-void nec7210_locking_ioport_write_byte(struct nec7210_priv *priv, uint8_t data,
+void nec7210_locking_ioport_write_byte(struct nec7210_priv *priv, u8 data,
 				       unsigned int register_num)
 {
 	unsigned long flags;
@@ -1057,13 +1057,13 @@ void nec7210_locking_ioport_write_byte(struct nec7210_priv *priv, uint8_t data,
 EXPORT_SYMBOL(nec7210_locking_ioport_write_byte);
 #endif
 
-uint8_t nec7210_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num)
+u8 nec7210_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num)
 {
 	return readb(priv->mmiobase + register_num * priv->offset);
 }
 EXPORT_SYMBOL(nec7210_iomem_read_byte);
 
-void nec7210_iomem_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned int register_num)
+void nec7210_iomem_write_byte(struct nec7210_priv *priv, u8 data, unsigned int register_num)
 {
 	if (register_num == AUXMR)
 		/* locking makes absolutely sure noone accesses the
@@ -1075,7 +1075,7 @@ void nec7210_iomem_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned
 }
 EXPORT_SYMBOL(nec7210_iomem_write_byte);
 
-uint8_t nec7210_locking_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num)
+u8 nec7210_locking_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num)
 {
 	u8 retval;
 	unsigned long flags;
@@ -1087,7 +1087,7 @@ uint8_t nec7210_locking_iomem_read_byte(struct nec7210_priv *priv, unsigned int
 }
 EXPORT_SYMBOL(nec7210_locking_iomem_read_byte);
 
-void nec7210_locking_iomem_write_byte(struct nec7210_priv *priv, uint8_t data,
+void nec7210_locking_iomem_write_byte(struct nec7210_priv *priv, u8 data,
 				      unsigned int register_num)
 {
 	unsigned long flags;
-- 
2.43.0

