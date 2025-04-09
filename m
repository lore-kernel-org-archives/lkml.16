Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BFD27CB25
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222220; cv=none; b=b2k6cor83U56sANJUnWeIVnftCl+FeQzwe7xvwnbI35+fpUDBcW9wb+T3oE9wpmnjtSBjjEzR7xiDspwZ/RIjUB4IdFTKUeCVGbLY+Qt3ovemkzZoosNT1aiAR8bGmXpMI1KTuoFvAxMQtup3ifsTYWPWXiWkUM4wifNy3KmXvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222220; c=relaxed/simple;
	bh=7K/Ey0gHYN42qnHgygKczjLg5EqGKk8ytvPGlUSZALE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t6eHTh4h36373ptdGpNbzgsS2R/KIselnfRg383kQ4pZKkSMwUN58Ql2X7r4GAHhrYZtAdrwv8NasDZ7QYIIIs5S8ZyyIbWY/ZGRqULMKhWBqC2rKBqcX+jL1WcFhNc8X5UOLOBMQiSDp3A1HW7Gi0BwfbuHnyPUDOLjqIBAYB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=AxKgDb6q; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="AxKgDb6q"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-739be717eddso5633038b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222217; x=1744827017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCUDjguyHlhjk06kpVPD65mb7rJ1QHXPUgq+Tlq7pMU=;
        b=AxKgDb6qT5MFb67SoE4yScMerG8J116dws7/PMTiDQnxbwfdaTbmyqJEfEzFRdCS5I
         MD78svRVb08QARRCK/XNI9/06OKPEcwziwxYjBW7BmA89VWbn0Ej66AztgE323fOTfs2
         wk9Z0uxcCvH89eVqxMJDV8RNIOxPie6kkY5B9W2PLMcaQ8LrWiYlueGsC3ow/OoZLfu7
         Jmb/X1tcqzasDP/6I/64ioSpqBxLf7E9z9FrMa5sxiIVCoUvE8bzxxhdIlclEmYs+1Uy
         bHhYQkc1b9sRkwnQIAR4yNZiZvdqBjRZQIlS1ttI6Z2smctocU6HQAe/sqlbpSyegw7i
         /wdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222217; x=1744827017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCUDjguyHlhjk06kpVPD65mb7rJ1QHXPUgq+Tlq7pMU=;
        b=r4q5V7PgGA+qQJuEmawJNqtTisz015qr41FbfpKg/+xnrSU4AC7bwWgS+cChaTg1Xs
         nKrIGBZGOoNMY/al26MesfirrWjHthq1KVVMRYDhO/VuoXPAYa1YxUuaenj1E1HKKnxc
         lFftl4wX/jv1FTAFUZKTwPn5a4mQQsP4FF3FbOOePc8nz7y64t9VFHVz8X4G8KNlEC4w
         FTxGvE19Be+rd+TFzbRBfBUAvhdSMtOiMT0jKK4E/NbYGDAAjc07GChNObU5jO/9JR+r
         B0jX7MfhpZRrmLCN2XhjXtF2lY8jo1+1/Lp9TvFPzx+zWWuJvu5cU2eA/OHafy9w/NtW
         uAdg==
X-Forwarded-Encrypted: i=1; AJvYcCUi8XXcgBfma5SJrtZYdw07qBz7DfhB35uF4mHyr3+1ZjhkvDYDbW7wAIxtSqJZMQHfRLRutSNuosJoDV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLB9vIr5HpChIIQveali2849EDX3TALsWcA5NIhAXPakSUlvj6
	PDJJVMMmQ++77C8Sg1PivS6PXq8ihPXSMmoBsmteTQpRGFeckpStDLEZ1oMcW1htwf3bzZxwDUs
	=
X-Gm-Gg: ASbGnctk4T6YpvoP7lrvYwKgUmu43iG+Y7h7mVCP+IGgtAXrhl+TQpgugKNgFTxFUUW
	e0N4n+t2eWDX/DdJF42reYDbq4KUMKaA76cW1Vt0HJAbpF4p+2IFXgNqYoV3czGUvNSmm41N3dZ
	Xe3awm7N4NXYXOu25MITjLuzh/hG4WJE5gZgryhARbRFt60hgqlpsOHlrkUQERbV/9/QA+DkwIo
	w4Aa805B6qzg4HmcdT8uyiQGwvL5PZVp463WTVprAFcMHSvnZqrbXvUF5gyjrZ5aCUBKx1s8sFl
	jTa8nDHelr2cohl672edhlah1GSXhQwmzqQ/jVt/rKA1C+JElX1cnQ91pmSxLUwQhL3w1FIGSui
	dK+IOLA==
X-Google-Smtp-Source: AGHT+IF0pXpoY52fqhA3oW8On3xQ2utlN6BtI/CBDPXt++Fm3oLlC6tIO8ZtVEag++ICgiy4SZcHMg==
X-Received: by 2002:a05:6a00:a91:b0:736:32d2:aa8e with SMTP id d2e1a72fcca58-73bae4b9158mr4829808b3a.6.1744222217327;
        Wed, 09 Apr 2025 11:10:17 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69505sm1655899b3a.168.2025.04.09.11.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:17 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 18/23] staging: gpib: hp_82341: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:48 +0000
Message-ID: <20250409180953.398686-19-matchstick@neverthere.org>
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
 drivers/staging/gpib/hp_82341/hp_82341.c | 26 ++++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index f2306245ce4c..fc0c4e45eb4f 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -25,11 +25,11 @@ MODULE_DESCRIPTION("GPIB driver for hp 82341a/b/c/d boards");
 static unsigned short read_and_clear_event_status(struct gpib_board *board);
 static void set_transfer_counter(struct hp_82341_priv *hp_priv, int count);
 static int read_transfer_counter(struct hp_82341_priv *hp_priv);
-static int hp_82341_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int hp_82341_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 			  size_t *bytes_written);
 static irqreturn_t hp_82341_interrupt(int irq, void *arg);
 
-static int hp_82341_accel_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int hp_82341_accel_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			       size_t *bytes_read)
 {
 	struct hp_82341_priv *hp_priv = board->private_data;
@@ -172,7 +172,7 @@ static int restart_write_fifo(struct gpib_board *board, struct hp_82341_priv *hp
 	return 0;
 }
 
-static int hp_82341_accel_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp_82341_accel_write(struct gpib_board *board, u8 *buffer, size_t length,
 				int send_eoi, size_t *bytes_written)
 {
 	struct hp_82341_priv *hp_priv = board->private_data;
@@ -255,7 +255,7 @@ static int hp_82341_attach(struct gpib_board *board, const struct gpib_board_con
 static void hp_82341_detach(struct gpib_board *board);
 
 // wrappers for interface functions
-static int hp_82341_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int hp_82341_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			 size_t *bytes_read)
 {
 	struct hp_82341_priv *priv = board->private_data;
@@ -263,7 +263,7 @@ static int hp_82341_read(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-static int hp_82341_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int hp_82341_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 			  size_t *bytes_written)
 {
 	struct hp_82341_priv *priv = board->private_data;
@@ -271,7 +271,7 @@ static int hp_82341_write(struct gpib_board *board, uint8_t *buffer, size_t leng
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int hp_82341_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp_82341_command(struct gpib_board *board, u8 *buffer, size_t length,
 			    size_t *bytes_written)
 {
 	struct hp_82341_priv *priv = board->private_data;
@@ -319,7 +319,7 @@ static void hp_82341_remote_enable(struct gpib_board *board, int enable)
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-static int hp_82341_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int hp_82341_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -354,14 +354,14 @@ static int hp_82341_secondary_address(struct gpib_board *board, unsigned int add
 	return tms9914_secondary_address(board, &priv->tms9914_priv, address, enable);
 }
 
-static int hp_82341_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int hp_82341_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	return tms9914_parallel_poll(board, &priv->tms9914_priv, result);
 }
 
-static void hp_82341_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void hp_82341_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -375,14 +375,14 @@ static void hp_82341_parallel_poll_response(struct gpib_board *board, int ist)
 	tms9914_parallel_poll_response(board, &priv->tms9914_priv, ist);
 }
 
-static void hp_82341_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void hp_82341_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	tms9914_serial_poll_response(board, &priv->tms9914_priv, status);
 }
 
-static uint8_t hp_82341_serial_poll_status(struct gpib_board *board)
+static u8 hp_82341_serial_poll_status(struct gpib_board *board)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -479,12 +479,12 @@ static void hp_82341_free_private(struct gpib_board *board)
 	board->private_data = NULL;
 }
 
-static uint8_t hp_82341_read_byte(struct tms9914_priv *priv, unsigned int register_num)
+static u8 hp_82341_read_byte(struct tms9914_priv *priv, unsigned int register_num)
 {
 	return inb(priv->iobase + register_num);
 }
 
-static void hp_82341_write_byte(struct tms9914_priv *priv, uint8_t data, unsigned int register_num)
+static void hp_82341_write_byte(struct tms9914_priv *priv, u8 data, unsigned int register_num)
 {
 	outb(data, priv->iobase + register_num);
 }
-- 
2.43.0

