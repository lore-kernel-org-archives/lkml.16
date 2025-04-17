Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CC21E5213
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850756; cv=none; b=nb7j29vashec9gNd+PaIRpCzbK/xWmrXYheIc3DP3LpHTgA/ygLwNJA+NoydU2XpWzUso4ocg53Dh/FGYGZ3NTz/lQuZ2Ug8XQvCivXWb3O/QEuhpTeBvOvgYWm5uQnQk9g8edBVujJRxg2LPaUEh77kDXeXDRSlyMSj+PzJ/Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850756; c=relaxed/simple;
	bh=fYsvzXlBg63Ifhk+KNPCOiQkv/56x0+I1RDaP7FG//4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rlB9WMIQRfrBl/ooSPzB+VHGX31ulZVU2PPTD8F6JEyQPV5+yikd7UKBwLZaMxzpYuy+BuOSUyPzJzsxLNLiKPG3CmwpjeyVffDd+iTINCHjCgCW9/31BUIPmLMghF7xpZvL0YcwQ+IBC+Fhg7nstk1sSYxBEKWW1XmEaU0JKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=OoioDZ2W; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="OoioDZ2W"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7398d65476eso208554b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850754; x=1745455554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCBQK1D7ftGWqyhzo3vdXyAI8mTZHY6bLe9FdeFPrbc=;
        b=OoioDZ2WEb1oWTDa0b5gOCy1qdnRYd24gd8QZfApqekmpurKcNXj7ZkdrS2JGz2z8c
         tlYFJbq+RUQWNarSk4/QeEPl/t71dUDP28F6Ancqhv1aD5zVXyeXBSGmVulAwh47pcJw
         Rzx6NqQ0+FakH5z6KjLWazpNeg/ohEjh8NTJ3v43k4n9Vo29tB56gYb45FauNTKzAGdk
         Nb8YHeezwCV+Mx++CmHK4xJ62kR/vlLqEhr4f3Zw+np0dkdoc+1hTK5anJK2ko9CqJBU
         eefnA3R88QQdWMIvj/Qzwl6zfyqISepPPOtGuh6GIg6GhKJvZHANS5Lea+G3WBCz6PYC
         /vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850754; x=1745455554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCBQK1D7ftGWqyhzo3vdXyAI8mTZHY6bLe9FdeFPrbc=;
        b=EJ3ptUeNzjum8Ele9C9UDqafhkPVffQRv0igoh3VyCEK7AP9lg/XfpOlsRylFUrc+l
         hx1npYrBFj3DSu/HcaOoZIgzFUh1/Grz414FIqRfO/4/2Sjl4/D7lz43FYUCntc+n78x
         jPq1MQU/I9obySGi5evDvdXK5leT/3SEXMLRrty8XPPXCEehKEBVC7lumTbER1Yp3xBX
         IyOj6ztGnCOk0tMuBACMysX5jgJhr3QYH4vSMUzOFMJ1lhQUvJzQHzHSwpeNryuliNDl
         ken+ebgDlyNGcgtYmkwltftISQoWfJnEF3w0tQTw1qJSRd97DFkjGosRuvVf0eW0GrMV
         zEVw==
X-Forwarded-Encrypted: i=1; AJvYcCX3eROlDCPhZyftjbxxE7YwLybHvjLZqydldeXZwKEvrn39FxvgYKjDXTNgg2fOzKktjo8GP5Itbd5GP+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6OHNkcRX3luqPtUXweeO/haM+gdvCfcXq2dg/NcKmrYtsN0XD
	qIXj+RfrBAdVQszzJwRfj8OAhyL+SqkSBahzcj+Ilnxz4DdxxDDynL7/5c5JWGUpdYpVynKWqkI
	=
X-Gm-Gg: ASbGncuWtuszUE8b0SCFJeUDgxstG9XSc6m6qbyXRLoCxwYCkv8WK/acj0tBqIr5vXU
	4hKztep1LyTACvc9Mhf0WMKj3iiMC3gjDHED3FLvYQ83tCVzKuz76JECUqR86sM5umuCWNbqh2N
	NQGhOVGIQf0SY3SCOypMu61ogb4NMZ0Mc2lpYi0J5UvG+Dz+GjJk4KCHaRvFhmF9fXe3EWroEWy
	IJvls/fGwS/uHcu0Ndave3vdNgMbhA9ar1EmrypowIUtEHlA2Ej0z3dsjYYdCZq7OeUjcdfxgyF
	bAlllKaEvqze1uF9lcqOy9RmXAXsjTTejTGrHAzC968Ivo5JYMkG8Saox1jiGMGbreNi8b9PfJy
	L9A28dg==
X-Google-Smtp-Source: AGHT+IE5d2cYcaqmHR1uGy2fSlz8Xvu+yT8MbmWw+3sV5rUZZCWh2SmRKaB6XFrRMYzc4D6DFHDzhA==
X-Received: by 2002:a05:6a00:98a:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-73cdbf14228mr1405113b3a.4.1744850754029;
        Wed, 16 Apr 2025 17:45:54 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd219894bsm11148251b3a.34.2025.04.16.17.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:53 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 14/14] staging: gpib: tnt4882: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:33 +0000
Message-ID: <20250417004533.86765-15-matchstick@neverthere.org>
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
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 28 ++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index d26a388912c9..9f7f8b311da3 100644
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
@@ -275,7 +275,7 @@ static void tnt4882_release_holdoff(struct gpib_board *board, struct tnt4882_pri
 	}
 }
 
-static int tnt4882_accel_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int tnt4882_accel_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			      size_t *bytes_read)
 {
 	size_t count = 0;
@@ -450,7 +450,7 @@ static int write_wait(struct gpib_board *board, struct tnt4882_priv *tnt_priv,
 	return 0;
 }
 
-static int generic_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int generic_write(struct gpib_board *board, u8 *buffer, size_t length,
 			 int send_eoi, int send_commands, size_t *bytes_written)
 {
 	size_t count = 0;
@@ -542,13 +542,13 @@ static int generic_write(struct gpib_board *board, uint8_t *buffer, size_t lengt
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
@@ -595,7 +595,7 @@ static irqreturn_t tnt4882_interrupt(int irq, void *arg)
 }
 
 // wrappers for interface functions
-static int tnt4882_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int tnt4882_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 			size_t *bytes_read)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -615,7 +615,7 @@ static int tnt4882_read(struct gpib_board *board, uint8_t *buffer, size_t length
 	return retval;
 }
 
-static int tnt4882_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int tnt4882_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 			 size_t *bytes_written)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -623,7 +623,7 @@ static int tnt4882_write(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int tnt4882_command_unaccel(struct gpib_board *board, uint8_t *buffer,
+static int tnt4882_command_unaccel(struct gpib_board *board, u8 *buffer,
 				   size_t length, size_t *bytes_written)
 {
 	struct tnt4882_priv *priv = board->private_data;
@@ -674,7 +674,7 @@ static void tnt4882_remote_enable(struct gpib_board *board, int enable)
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int tnt4882_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int tnt4882_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -721,7 +721,7 @@ static int tnt4882_secondary_address(struct gpib_board *board, unsigned int addr
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int tnt4882_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int tnt4882_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 
@@ -738,7 +738,7 @@ static int tnt4882_parallel_poll(struct gpib_board *board, uint8_t *result)
 	}
 }
 
-static void tnt4882_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void tnt4882_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -767,14 +767,14 @@ static void tnt4882_parallel_poll_response(struct gpib_board *board, int ist)
  * this is just used by the old nec7210 isa interfaces, the newer
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
@@ -810,7 +810,7 @@ static void tnt4882_serial_poll_response2(struct gpib_board *board, uint8_t stat
 	spin_unlock_irqrestore(&board->spinlock, flags);
 }
 
-static uint8_t tnt4882_serial_poll_status(struct gpib_board *board)
+static u8 tnt4882_serial_poll_status(struct gpib_board *board)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
-- 
2.43.0

