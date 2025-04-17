Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42D91CAA81
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850750; cv=none; b=XtI9rrlGlbz9MCPjSA+MV8fUOjjy1mRDF3z7GcAXrDTeHOsmg/dBSXiW2DC8SikiY0dBAKPL/RV4BDRvB867c5LVbwoo0MCVHM5PNuzL+E/lem7EypAN127PtmE+Dlm/6wyKWDOm+ilggf3Va5MFcGYdkrzCcE4qXqQnmcKsb90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850750; c=relaxed/simple;
	bh=Uf8hdJ0esOyHrstMds9ztbt/YWlLDotxQpLQRfIe4TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XagDPA7iUc102aQQdtw8Qrn9OfIH9q8jbRZI04Zaf7AspQOr0U0oYx4SDcCdMIhB5IFThKNg0AurDDa0Qp58R/QobLo2AKzCb5RXNzG8mZ8zewAZLQ3oaZa0DjDBxQfHJqSmYrRbWBYQ6QIqDgbWLK7XTFn6HfTrFj5mGA4hrJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=lOlxMlJ/; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="lOlxMlJ/"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af548cb1f83so182657a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850748; x=1745455548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2BNNM03a2O4ef/en52iuKrDen3mrX992h2ND005joM=;
        b=lOlxMlJ/BE3cnkx7pmR3zi+d1hxcRAVrQKMiiOKEj8lJcYNE0+ae9pa7UbD9Kdd2Ts
         8w2JmHEz8s/OO6Dz8Tfugc6CfHIClcE77/UMpjHgFmkmWKFivlO5tyN98BTyJzYXIrGy
         mQ42EyEVZxpKzYby+v4v+a0sS4d68+JFKpKflJp5H4zgRtR1l32fD9X/vEpR3RUia3YO
         by0KAT/aWQ+CFoUqLqgNTacAkENgPm8eXF3dwkalzKqQILhVWWoIVcO5eUte7oqBxX9+
         +l94SRlA7A45lnNuWE49EKf0z6NUioivIirMdVoTR6+c35wGzBl0YdH2NgWdNDVKk+9b
         5cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850748; x=1745455548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2BNNM03a2O4ef/en52iuKrDen3mrX992h2ND005joM=;
        b=vT8tgMQ7wZMle+vmdZouRcj66tpWHgX7yuXUoEFS9bIC+JC4gfQZ8SAEKeDD5f6QSU
         d0l7Aakf/49GXCICt5w3AEVmH1JNAfJj2E75f7XrUK2kOoT0pybQ9C/JWMtIaIr3Jxez
         Oalx/ddLPJtsHRcfu9KdOd+bfuMX+ECrUH1cs+qDSl6/kuDIMOCMX5NCbVasGpxrBOUg
         O97bNl4erw0gkBt5Nqg472Ngvh+YOVH+xF3khgveu6mxi8wPvwh62gqXkAnuZy40L40d
         w3RpmVnx8DCxFlAchWFQscWBC9sJPVbIlcF1RAeFwezdjMXe5joSmtO0jQJMKBZf138g
         HCEw==
X-Forwarded-Encrypted: i=1; AJvYcCUKsK65v47Ecp3ckWPtKiUtSyH0PX1rbFBFRqM55KFQhBukHqThZNHD9Y+FjoYl47IYMPFDfKKMbz5bzaw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpmch32WhkE39tZS+F9XG8OjTu45oz+iGvgh+VeRErK12hxql9
	VCfKnFVft1mowbpzi8JBWnQkYlmgrxY8Ic5PJ6XMlSPXE3dvVshXfavsG1tuEA==
X-Gm-Gg: ASbGncvkbRoYodmIb0o7lnxNUbbboy9gO/be+nS5rim/18EWsMpVv4DVuJUcQdNLCvb
	+i2Sz93tqezSOdssiZwbq6TYBNYd4QiED+XlD0kobWVz1Btj9yQO8CoQ0Uc8EdsA6goeXKN0fFQ
	thgYYPdoxsQOHbrP+dehLfVtU4tJaRrCefE5kOKjZiO1Mi4H2W8ii51ESWNcS+NUR/h1EVsoMLm
	wKcLRrKwAgEtEIZ9DVhmOw5A3lLLD+OyE9UP3i0AalXqfCjw7+P0r3pN1rWFSIYce8AbD42olm5
	0NPJVZHW/M3mhP6QxoZeXyiVVVUKiwJNwiTaLOREljKQi7qHjCc/P1+L7ddzWgwHDMtFJVDEQNP
	wq2Sy9Vu1BBfLgOKx
X-Google-Smtp-Source: AGHT+IFzMm2aNT6RpalNo0wsv5DWAsKuoxz22GVHDVmjA01s3MjQDoyRKWUNBlEOLCN7cBdZcj/+6A==
X-Received: by 2002:a17:903:2a8f:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22c358db5e2mr61585775ad.15.1744850748219;
        Wed, 16 Apr 2025 17:45:48 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611f002esm2275671a91.15.2025.04.16.17.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:48 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 09/14] staging: gpib: hp_82341: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:28 +0000
Message-ID: <20250417004533.86765-10-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417004533.86765-1-matchstick@neverthere.org>
References: <20250417004533.86765-1-matchstick@neverthere.org>
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
index 1a32a2cc421e..41accfdbc49a 100644
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
@@ -173,7 +173,7 @@ static int restart_write_fifo(struct gpib_board *board, struct hp_82341_priv *hp
 	return 0;
 }
 
-static int hp_82341_accel_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp_82341_accel_write(struct gpib_board *board, u8 *buffer, size_t length,
 				int send_eoi, size_t *bytes_written)
 {
 	struct hp_82341_priv *hp_priv = board->private_data;
@@ -256,7 +256,7 @@ static int hp_82341_attach(struct gpib_board *board, const struct gpib_board_con
 static void hp_82341_detach(struct gpib_board *board);
 
 // wrappers for interface functions
-static int hp_82341_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int hp_82341_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			 size_t *bytes_read)
 {
 	struct hp_82341_priv *priv = board->private_data;
@@ -264,7 +264,7 @@ static int hp_82341_read(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-static int hp_82341_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int hp_82341_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 			  size_t *bytes_written)
 {
 	struct hp_82341_priv *priv = board->private_data;
@@ -272,7 +272,7 @@ static int hp_82341_write(struct gpib_board *board, uint8_t *buffer, size_t leng
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int hp_82341_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp_82341_command(struct gpib_board *board, u8 *buffer, size_t length,
 			    size_t *bytes_written)
 {
 	struct hp_82341_priv *priv = board->private_data;
@@ -320,7 +320,7 @@ static void hp_82341_remote_enable(struct gpib_board *board, int enable)
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-static int hp_82341_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int hp_82341_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -355,14 +355,14 @@ static int hp_82341_secondary_address(struct gpib_board *board, unsigned int add
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
 
@@ -376,14 +376,14 @@ static void hp_82341_parallel_poll_response(struct gpib_board *board, int ist)
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
 
@@ -480,12 +480,12 @@ static void hp_82341_free_private(struct gpib_board *board)
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

