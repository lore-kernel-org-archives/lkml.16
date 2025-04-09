Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E26B27C159
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222215; cv=none; b=mKTWC8T7l9sWWNF3UgD1EhKXAslgxz/MiGYuQtHYcsizvu3/FJlEnTomqEk+CKWqpUP8GpO7F4tcn6EsjRId5bvr+/ubUJ0P2VFB/1i/WOqN6hxtDVxy/guq3r9lYmBGi80GuPZHwWEaUzg2tVPKNdR8066Gw3SsdBghuZGHcyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222215; c=relaxed/simple;
	bh=iWVSSf+TpSw8Rneoj2znRVsY2B7CQDvvXidmWGGapFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djKBJQAgL1cHdOODqhN+Q8hFqPVKZIUv8FnOGnbb4CeBsyw3Jecm5XBPLCw+3wHJvfkNK6MbiH4SrACsFaEquLGGz1Mrzfm6iy2xhnCU1mW2ggyDzKrpaBeMgaWjMehfuGsFYcyeGsDmQA/nvmjWeqLZz2UN7EmPQr07YjIoMjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=mBf4mqgm; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="mBf4mqgm"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73972a54919so6930920b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222212; x=1744827012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zs3nmp6bNInwEcGoHF3GJbe7f1ZKHiGtLyO1UFwX8eI=;
        b=mBf4mqgm3l1ZyDYaSuoVkMZwQO5WNpFFp0OWeuKoXBXQzXObREtzhSy+AFFU1aWIPp
         d04JU1QdpFmTIZiIbTvc2d0hXwCeRyqTIF05zg81KgEo2zesYFSbGT51Jhq/s0myzlsW
         ydiaUwDEKHL6se2JggrdY0TOCi2HvTOkQ7OI6ZOrirw2/5tMXbJrEhDk++HIEtXkQvho
         ec4qAv2fEC7qpTNlWmWdukCufkRZPP5ODAN/SOkZ/QJY/P6fzsY84S0D1qZPToPKFJmU
         aLeNPIrghfzlHQty9kXNcP0mkx1s50F3DdYtFKiZdc4Y8UGBSUrd2xlGyGC7/y0rT32G
         KFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222212; x=1744827012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zs3nmp6bNInwEcGoHF3GJbe7f1ZKHiGtLyO1UFwX8eI=;
        b=Av2EIgiDIYFSIE5txYO+tKFMPbuK5JtYubzedq+QsduKzW3q1flFv6IIfSp38YVdGg
         HHWeVnxl40ofx2VbK7+ntGBAZgxyAmfsLfRriC2C0fxQaiRl4ZkKxbZqoIaOsLexoz6k
         0a4U9W4OMk35IiqqVVAUS7bxNOw/1VABB/MNE+NqMNDHZZhQWdGp+yYeSltXz4BJVXz2
         DdDQCjRSgRQcJJRHqh0zG+JInfurIAfalKbVBVoP1rBkBwrchaXq0f65F1FNzhbKTLT8
         OIALkezdTNxyQOTSYDRJCXCTpg/LiRLpsL8sH5+AAKmlHh1DZXVMXbuiIXUs8RYcGBxa
         7sWg==
X-Forwarded-Encrypted: i=1; AJvYcCVo+87DbzYlL5dZRn7o98xEQJladL+8AKuyftghHYtCjkFvs0uAEF/+z8XkweiZfxw9cOfZ+5H6rwoE4jQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhs4cFpjxwieN6L2vKyBxlDOoxzo21zIPZu6rhY4x+4LopWlr6
	RD2/lryQRrj946WVuElK1BwhZnHbEaxDi847Pe9nfF6M4s341jWTQlGYqxGR8mgoQmslW41IIuk
	=
X-Gm-Gg: ASbGncuv6X9DUY4Rxjj0SZQSSqUrqy5VV5rInnzhE1tB5bqc6KQ6h4AzyOuEmuqo8qX
	pE8NLr3+3md9cPMOvJOifFZLMZ90oEqVQIOgJq3Bq9K4IM9QZqbTP7Q5sJskPJYr8pisT3Qh8UB
	gHcC2TpXLRPS98JojqPKH6K1FXsl1Nk28hrGThvaPPCreQTtjaN1nqfOsp02T8IBZ0yYWMrmjAv
	JhRtdu/CLO0MZkH2/y11pAbkVs8iL6vTmVWvsY8Yacb4f7Y9uxN5uIchIzL09g65gFuiIUN605q
	Aq8ynqWsFxPS1XAqZe5WbhwffGwK0ms6juNnexR8pJv+pO0NTHBA6nC9fWytmyG7rGWjHLyy2QN
	SWnifyS7PR/FsgIIJ
X-Google-Smtp-Source: AGHT+IFgXXOdrl9fOh82u6pMjdXaCsAwnKkLGKii5e4bOy42s4jjP9CSVNZ7Fa1eaRYc1XrPVYdOlA==
X-Received: by 2002:a05:6a00:1909:b0:735:d89c:4b9f with SMTP id d2e1a72fcca58-73bae30a7e1mr4765168b3a.0.1744222212520;
        Wed, 09 Apr 2025 11:10:12 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2b913sm1718533b3a.12.2025.04.09.11.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:12 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 14/23] staging: gpib: cec: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:44 +0000
Message-ID: <20250409180953.398686-15-matchstick@neverthere.org>
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
 drivers/staging/gpib/cec/cec_gpib.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 1b02222881b9..737d78736ea5 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -45,7 +45,7 @@ static int cec_pci_attach(struct gpib_board *board, const struct gpib_board_conf
 static void cec_pci_detach(struct gpib_board *board);
 
 // wrappers for interface functions
-static int cec_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int cec_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 		    size_t *bytes_read)
 {
 	struct cec_priv *priv = board->private_data;
@@ -53,7 +53,7 @@ static int cec_read(struct gpib_board *board, uint8_t *buffer, size_t length, in
 	return nec7210_read(board, &priv->nec7210_priv, buffer, length, end, bytes_read);
 }
 
-static int cec_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int cec_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 		     size_t *bytes_written)
 {
 	struct cec_priv *priv = board->private_data;
@@ -61,7 +61,7 @@ static int cec_write(struct gpib_board *board, uint8_t *buffer, size_t length, i
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int cec_command(struct gpib_board *board, uint8_t *buffer,
+static int cec_command(struct gpib_board *board, u8 *buffer,
 		       size_t length, size_t *bytes_written)
 {
 	struct cec_priv *priv = board->private_data;
@@ -104,7 +104,7 @@ static void cec_remote_enable(struct gpib_board *board, int enable)
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int cec_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int cec_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct cec_priv *priv = board->private_data;
 
@@ -139,14 +139,14 @@ static int cec_secondary_address(struct gpib_board *board, unsigned int address,
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int cec_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int cec_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-static void cec_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void cec_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct cec_priv *priv = board->private_data;
 
@@ -160,14 +160,14 @@ static void cec_parallel_poll_response(struct gpib_board *board, int ist)
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-static void cec_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void cec_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-static uint8_t cec_serial_poll_status(struct gpib_board *board)
+static u8 cec_serial_poll_status(struct gpib_board *board)
 {
 	struct cec_priv *priv = board->private_data;
 
-- 
2.43.0

