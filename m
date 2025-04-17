Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76E01CAA71
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850749; cv=none; b=T27vFPoEDAFBIJiBzHmV6mcgJ0rVQbF0Yze9OH6ChqhQCYYkg4M40UiQA4lJunTKhigsKJlWlmqvEbFQx0yon3+Tdf9uUmNiUtF/hxvb8n06xOJ5nxiZTzFdlp9+I60auZhYbbqdN1kfgaI9IQ17Ea8Y0NbHkKdbGmcOaDU6KQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850749; c=relaxed/simple;
	bh=j+MTmHFRQP0zHm00kamesmDnYTv1fzOMNJlvemIhMc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pm03dkZYJ4tFEGtMC5yZsEDMz2MdX0KXm8mk5Biqcj1RrsJs9D8zW2Ur3z+8y3sojS78TqL5OJzyXK4ADGrwIVhppZgLqmXzVusobiHT6zAuSHwwSp2eVD2UTuk4hCTad08oEIx3+LYcsJHm8cKNjgT4MFhBZTMa0Qo5CFh+Z7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=RWgsdZLi; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="RWgsdZLi"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2241053582dso3398725ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850747; x=1745455547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ckx60dJiiATx8q3ipdm187MmOymO4PQNEigjQjcjyXo=;
        b=RWgsdZLio0B+4ILb0ZyhC/zPMasVx2pO7q+3xZy6EyyU0+hZpMcOr04MWvqo0uZ4p3
         N/r/Hw/w8WGG9JG37xXxR424w0TiADozScfqNBBQSYGLtgcrcpngltrG7wIJl2Pnts6x
         pmbML2EC7t3DBB8qTLPta5wtdbVZB4XtztzAEjDa0c1o3BxbC9sr3wwSTUTnArrikOp+
         9VbDTSbzDGQj4bvajOgVs3DTTKe8y5YbMOaQiFjBpD19xdZPQpLfC/a5V2qciz87fLfq
         K0myxa+wPJgHIauDodx24GZgDeApHxjt0x0CEBFQOqmXrrqqsIiO8BD93KfJ7qlpPMFQ
         hwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850747; x=1745455547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ckx60dJiiATx8q3ipdm187MmOymO4PQNEigjQjcjyXo=;
        b=B3hgPBjedWVB3w/6JdFO6v673E9dXKC47NGIXEDZVH963khjpCGsADcdy6lVFJbSUA
         aw8E45T1/zUYE0R8+/9Zw/hHlaPaDVU4ozJFgnfDU1bE2Kt859dOf8yH5UvbCkfV3YHG
         Ko0Jtpu6CNaDis6ULDsULRdq/PKe5yWjEOfkMyINGLaIOKE4I/LlX0BennNqKYJntJi7
         z32M0Wn7je5qhQV7qbR8RbQq3Hrcr+vvAu61rW+d2GBh31/i42z6Wko8Te6toHUjqQAT
         9UzZNF62+G+52ZlLvnmGW+/2V4GZFhlX/zDE90aOpCHgInmHLFYt5FQ6EVwpVzaNcBhv
         lBhg==
X-Forwarded-Encrypted: i=1; AJvYcCWKoWyPP6eXAqoXHRZuhpgpjdN9ZclGM9abj0hLbwx7Mf0Mr+YiHOjEMwxFYW3ppTLb5yq6mTNP/qfYQA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiOwrtUBPiOA4mRPn1+fQu9m/knajY5u+1T6dt2kmV8tgtOgYN
	rU7YF/fMVsFW7LIXqZpEYxplNsiMF3E7IhmSUiVBdhTWip1AxnSNESsQiIA+5hh8fhhPOLrS6Zw
	=
X-Gm-Gg: ASbGncseffjxptjyIzA+rCl1FSM9nteaw+qCB5EzwDIp59yDnpTGJ8/xQyDgRVN8nxX
	b4L56iAtv7m9PVp9r6fhPAW5ldR9MJRDQM/3uLJyPr+ulRBcCsdrv5w8NewU22OaYG90OK+x9iy
	QRaZmT7sOFJ1ORuLrrO0bfrw1W0xYdanAvKrlnlbJKbAZyUGD5fl2WYhb+JvEQf8snWeoeva2Nc
	E8ZQh1QdPd3wAT/KRHfUfdqX6Z4RPXcwLGJRr/rOzqW32SFdeU8EkD9X14LW70+6DcOWNXSv631
	oCIhJ5LhfBWxq3iEN8ITaxVxM0Fz+V2Wlkn2Ad1Uxp1ljc7KnwVHVNEgg+CMqtCgKBsV2sZPMZ1
	A7zBk1Q==
X-Google-Smtp-Source: AGHT+IHYrFT5dAL+C82IX4ktyem8/uw/i49r6KNMVsvIbtHJn2HOu9uoeECYGG2O16oWWcDdJ2lEyg==
X-Received: by 2002:a17:903:2451:b0:224:1001:677c with SMTP id d9443c01a7336-22c358c568fmr49927625ad.9.1744850747009;
        Wed, 16 Apr 2025 17:45:47 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0e6dsm20988265ad.52.2025.04.16.17.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:46 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 08/14] staging: gpib: hp_82335: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:27 +0000
Message-ID: <20250417004533.86765-9-matchstick@neverthere.org>
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
 drivers/staging/gpib/hp_82335/hp82335.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 7f14ecb46026..3d08d2f726e1 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -30,7 +30,7 @@ static void hp82335_detach(struct gpib_board *board);
 static irqreturn_t hp82335_interrupt(int irq, void *arg);
 
 // wrappers for interface functions
-static int hp82335_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp82335_read(struct gpib_board *board, u8 *buffer, size_t length,
 			int *end, size_t *bytes_read)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -38,7 +38,7 @@ static int hp82335_read(struct gpib_board *board, uint8_t *buffer, size_t length
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-static int hp82335_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int hp82335_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 			 size_t *bytes_written)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -46,7 +46,7 @@ static int hp82335_write(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int hp82335_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp82335_command(struct gpib_board *board, u8 *buffer, size_t length,
 			   size_t *bytes_written)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -89,7 +89,7 @@ static void hp82335_remote_enable(struct gpib_board *board, int enable)
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-static int hp82335_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int hp82335_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct hp82335_priv *priv = board->private_data;
 
@@ -124,14 +124,14 @@ static int hp82335_secondary_address(struct gpib_board *board, unsigned int addr
 	return tms9914_secondary_address(board, &priv->tms9914_priv, address, enable);
 }
 
-static int hp82335_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int hp82335_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_parallel_poll(board, &priv->tms9914_priv, result);
 }
 
-static void hp82335_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void hp82335_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct hp82335_priv *priv = board->private_data;
 
@@ -145,14 +145,14 @@ static void hp82335_parallel_poll_response(struct gpib_board *board, int ist)
 	tms9914_parallel_poll_response(board, &priv->tms9914_priv, ist);
 }
 
-static void hp82335_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void hp82335_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_serial_poll_response(board, &priv->tms9914_priv, status);
 }
 
-static uint8_t hp82335_serial_poll_status(struct gpib_board *board)
+static u8 hp82335_serial_poll_status(struct gpib_board *board)
 {
 	struct hp82335_priv *priv = board->private_data;
 
@@ -227,12 +227,12 @@ static inline unsigned int tms9914_to_hp82335_offset(unsigned int register_num)
 	return 0x1ff8 + register_num;
 }
 
-static uint8_t hp82335_read_byte(struct tms9914_priv *priv, unsigned int register_num)
+static u8 hp82335_read_byte(struct tms9914_priv *priv, unsigned int register_num)
 {
 	return tms9914_iomem_read_byte(priv, tms9914_to_hp82335_offset(register_num));
 }
 
-static void hp82335_write_byte(struct tms9914_priv *priv, uint8_t data, unsigned int register_num)
+static void hp82335_write_byte(struct tms9914_priv *priv, u8 data, unsigned int register_num)
 {
 	tms9914_iomem_write_byte(priv, data, tms9914_to_hp82335_offset(register_num));
 }
-- 
2.43.0

