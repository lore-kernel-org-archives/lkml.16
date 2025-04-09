Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1228C27CCDC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222224; cv=none; b=mlg/zRgp+zlcz8E4rhp7x62HpmSXkEqiLDAazOioY7dpgFRrAKJQaFjXwi7s4In73aF13a/vg7AnUYf54A5TSRIb26qcCdwN9IrPFzmjJ7Dgs8DoVgRwr2slHFsioA/HlXajjM2OfQswPsJn6mzZM6FFFkVB39pjpHBO+RAif7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222224; c=relaxed/simple;
	bh=heLv2BrU53GaTy+A/cnx1uyIrI3xYfKZCn0fDBen1s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDgr4qPE8X7Lfs2oJZ2+l9wy9McsiCehOiCbTMib5hQaKQXdwPRAi2VqRjkdKawptiXaMPE4r+ietZC7Qwcu8RyjE97NM7kqGeNLBNYUmARebyCyElsiF9CdoAa5H9wsPbymDVGOHTwfz+PJi+APQ+zszJHyTsU70HTwDRQLe8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=IGtMkOEU; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="IGtMkOEU"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso8668419b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222222; x=1744827022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38edrlY0+fe0F8svEiRpze9+JSsT5C2v7XxklLezuhg=;
        b=IGtMkOEUvSoVqdAegrEjcRiHYJXmimQ0YuOkGc5uDCBTUBeV/cYSXaesUoVXqiDk6Y
         UOkSygVy5H1kCcgojsVFHZRbK8gFv0IB0mIYPyeoVROccZmEf/UMbxj0lEsJR55P8El1
         bBtSrZkKBLPKEvWn1z2ZpWTxR/eHSM9OSNhc+E95r4IvVHZDz6Cgr+Wnw/v0WOeo3dqx
         HmFm6ZcyqRGJgMB2JYxYtj/p8Oi1sb14//YXgZ5VlrkQewSMvMmpWimBbGa4h84HuvHe
         85zh3dQpCbamdDLUuTt2up7gbvdMC+mppcqLu4iWm13e3d/bwBTGYnN4MoRC3bBFnbm9
         DICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222222; x=1744827022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38edrlY0+fe0F8svEiRpze9+JSsT5C2v7XxklLezuhg=;
        b=WRFFWntVKQ/AYGVCxwZCRSc0v31asqD6mI1NjAHbq8Voinn63X3bXLICxQNsq27Jl+
         2Ng5sdOZi0U/CJNmIzI9V7/RT0r7m9d93GSZRgxKSNXTwknPS2iYdsrj36oGcrsmGtbd
         u9qiHWRyIsePywlC6xbIdLjFESbNMw5YgXN3U3iSDtrSqenfRhHB2QoNHM1Az3eJGkf3
         M5iloVoui5MvNv/tyDotaQf28AClhAGgCkAE4cxCYJz+qLvNv/tILCNjCgfSQVfXx0l2
         4VvoWImGajON03QEf9hIKBovJf1oyqB++Is4mn8J1UXTW0M847Pcb9nIjdHbI6IZbvLm
         KJNg==
X-Forwarded-Encrypted: i=1; AJvYcCU4C2jkw8/7fg5hHe5NjAuY13yVhJAJLB3nSPYdhTQd3Lh2ooYNghnQs6dYVOp9BX2IyVgnRmF+f5xX1fY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLUsUZciXnTqr5ChEcwOyIciUUKwEqsd04pu0Emyr/o8tbz7kM
	1AzkLscTRQQFvsuVDUM/899IkGAyjFLryHAITAubfDJHMB/gmsq4JuG7Tt6/RQ==
X-Gm-Gg: ASbGnctbtfj5DNIvdxReljnIk/BbItQhE4dDZT8EovpalQKCCPkjG7CS9TW1NaeEvcw
	+rqjIEnTWsl9ZDmUM3LrPRamH0wTt9G6p0PM8zZsG72tp7G2cmvKsD2ZTaQzjRA4pU2vsLJLDrK
	DoeKBmkDYoVKgItVbxheZDEqtcY0s3ap8WZyJzefROWm488Di9QpGiUgzPq9ZxK0Avv4KbZCLx5
	kH84kbvmMpQZsPOYItVHUuI7rwbJxd4i68k4XEFhd6v4r8bQJFbEOLJgRu/FaaaHFoW8iOJneOP
	3FFjD3BXorkSFHnUFM/D18Ug5+OF3/11IQ/l2PYNFaS1EKh7438CoIbkiVY4etuExBGZWAldaS6
	N3xMTvg==
X-Google-Smtp-Source: AGHT+IGsDXVWrZkD5gojboocvpfp/EzMRYtO/bs6qHclqg8s1RcUpu0icEHcFOIg2h3bPvGcpLE9Rg==
X-Received: by 2002:a05:6a00:2284:b0:730:99cb:7c2f with SMTP id d2e1a72fcca58-73bae4b9277mr4012868b3a.6.1744222222347;
        Wed, 09 Apr 2025 11:10:22 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d469b9sm1653631b3a.48.2025.04.09.11.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:22 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 22/23] staging: gpib: tnt4882: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:52 +0000
Message-ID: <20250409180953.398686-23-matchstick@neverthere.org>
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
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 28 ++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index f123d427f835..3e87129c6d53 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -236,7 +236,7 @@ static int fifo_xfer_done(struct tnt4882_priv *tnt_priv)
 	return retval;
 }
 
-static int drain_fifo_words(struct tnt4882_priv *tnt_priv, uint8_t *buffer, int num_bytes)
+static int drain_fifo_words(struct tnt4882_priv *tnt_priv, u8 *buffer, int num_bytes)
 {
 	int count = 0;
 	struct nec7210_priv *nec_priv = &tnt_priv->nec7210_priv;
@@ -274,7 +274,7 @@ static void tnt4882_release_holdoff(struct gpib_board *board, struct tnt4882_pri
 	}
 }
 
-static int tnt4882_accel_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int tnt4882_accel_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			      size_t *bytes_read)
 {
 	size_t count = 0;
@@ -448,7 +448,7 @@ static int write_wait(struct gpib_board *board, struct tnt4882_priv *tnt_priv,
 	return 0;
 }
 
-static int generic_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int generic_write(struct gpib_board *board, u8 *buffer, size_t length,
 			 int send_eoi, int send_commands, size_t *bytes_written)
 {
 	size_t count = 0;
@@ -539,13 +539,13 @@ static int generic_write(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return retval;
 }
 
-static int tnt4882_accel_write(struct gpib_board *board, uint8_t *buffer,
+static int tnt4882_accel_write(struct gpib_board *board, u8 *buffer,
 			       size_t length, int send_eoi, size_t *bytes_written)
 {
 	return generic_write(board, buffer, length, send_eoi, 0, bytes_written);
 }
 
-static int tnt4882_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int tnt4882_command(struct gpib_board *board, u8 *buffer, size_t length,
 			   size_t *bytes_written)
 {
 	return generic_write(board, buffer, length, 0, 1, bytes_written);
@@ -592,7 +592,7 @@ static irqreturn_t tnt4882_interrupt(int irq, void *arg)
 }
 
 // wrappers for interface functions
-static int tnt4882_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int tnt4882_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			size_t *bytes_read)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -612,7 +612,7 @@ static int tnt4882_read(struct gpib_board *board, uint8_t *buffer, size_t length
 	return retval;
 }
 
-static int tnt4882_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int tnt4882_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 			 size_t *bytes_written)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -620,7 +620,7 @@ static int tnt4882_write(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int tnt4882_command_unaccel(struct gpib_board *board, uint8_t *buffer,
+static int tnt4882_command_unaccel(struct gpib_board *board, u8 *buffer,
 				   size_t length, size_t *bytes_written)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -671,7 +671,7 @@ static void tnt4882_remote_enable(struct gpib_board *board, int enable)
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int tnt4882_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int tnt4882_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -718,7 +718,7 @@ static int tnt4882_secondary_address(struct gpib_board *board, unsigned int addr
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int tnt4882_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int tnt4882_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 
@@ -735,7 +735,7 @@ static int tnt4882_parallel_poll(struct gpib_board *board, uint8_t *result)
 	}
 }
 
-static void tnt4882_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void tnt4882_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -763,14 +763,14 @@ static void tnt4882_parallel_poll_response(struct gpib_board *board, int ist)
 /* this is just used by the old nec7210 isa interfaces, the newer
  * boards use tnt4882_serial_poll_response2
  */
-static void tnt4882_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void tnt4882_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-static void tnt4882_serial_poll_response2(struct gpib_board *board, uint8_t status,
+static void tnt4882_serial_poll_response2(struct gpib_board *board, u8 status,
 					  int new_reason_for_service)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -804,7 +804,7 @@ static void tnt4882_serial_poll_response2(struct gpib_board *board, uint8_t stat
 	spin_unlock_irqrestore(&board->spinlock, flags);
 }
 
-static uint8_t tnt4882_serial_poll_status(struct gpib_board *board)
+static u8 tnt4882_serial_poll_status(struct gpib_board *board)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
-- 
2.43.0

