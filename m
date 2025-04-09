Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A90E2777E1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222203; cv=none; b=F6RNt9Q1f8iEzaZ9ZCu/lf855mo4cbLpFkdTVgUM/4TSY3FKBDofRCT400OUVM3zwGzOZeSZNT1UyZxooXGjycwzJPDysNWiZtYLLtmCd96tuUIRo4NONJ22vKQlSe8eIMLlgSznX6J+WAUMI3CFJAmXKool7G1YggwqKbt83gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222203; c=relaxed/simple;
	bh=jqUPwEQlcnwZt3/asgScigP93X2I5b2gZl/ENeZQ3iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7lV0qtRkA8Cn+4OR2Gr28A+1wY6dO9Qm1DEZL4ZVJxu1tIOCkat1tz75WalZ528lSDkbSZkrQ0bAL2Saq6wbmd6SwZmxcjAYw9TARgO4M6kj8YtqnG6qKNUPmIGH8cj9Ji4wtk1yeX+LzTC8qAbQ/SN6VdlSif3lRrXz8zK0gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=LeFCH64w; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="LeFCH64w"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2243803b776so102464195ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222200; x=1744827000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CecMt/raU8dnOgWd9SQV1F1UDBfO/Dd21R5LTc9yaMI=;
        b=LeFCH64wXKQ8Z0xKSvZLfG/yi/3rmx75V/t2EhPAwG90Ur78LPxbu5avrMIJuO4El3
         Hnxa0xY11qA+TyWaQP+LofyWTw3ytUFF5NwtfkMNZmKHKFVroy1QstqJfBMKSgcYr9hf
         GhzhegwzI1CTAk6tKh58rdXIvh5nWU5HIA06hsIke26N4gPiqfMqwuuef6pWaJqB5d9y
         VidxkCAsgx0FSG1VgOs+9o+d5UarjsCAhjhE9gGDbe0LwQQESYZsYqyEhpLKuIwdhHkx
         9GKDNvPtfT7BEnCcrPTyFa7PiQhVxDgSvqZFFqZuCpW1c1enPk3naMRhQQMRchYi6eyD
         +gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222200; x=1744827000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CecMt/raU8dnOgWd9SQV1F1UDBfO/Dd21R5LTc9yaMI=;
        b=kghnDXxOiXyeC+pKpHWSqngzJL3Vm1QmveikmXIF4UjR31z7umIFvN4pMs544yDDz3
         qu8s6dbwd4r+LTtkWVLA7j2LQb2AW0YA6qZbZTAwaKneoA6vYEvHOKz6dKWfum5AY7fv
         2jX6hEUSoAd39cxTizjXy3vVvmHRrxtwG08Y1+5/jP4vYdxZs+1hgbfnYmvm4ZEf5Fgd
         +RS8C7SLctdHk5lfDN4nCYHO9YWGhw9Wg+MkRYjTR6nYfSoOgDqJG9YtkkSDNoXCnXsJ
         DQTJk0fMAidxtTOEb8O8NY9RwuJY03yrCvmS3eVhVFY63uOeRYdUWMResOhweaaOOx01
         yjFA==
X-Forwarded-Encrypted: i=1; AJvYcCXjfn+z/RV8o/JmjNOrgxOVQp5jaNFMZuvIGyWgL5ZdHgd3sYyLazn2XuuHBfZ/6u/LycpeCnFFbYdfug4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSNNbKIJdI1MWkEn7nzcNXskXGecmMvEmyWmzUN1uUcOx4oc66
	4pqimaj9ZPlePUIE/Id8Arnj2U3w4J+k2b5nQBmcAbYcVHyuWun+TDtF42ZVwg==
X-Gm-Gg: ASbGnctcUTp30SuAEcr+3y8sact3dhg0Kg9O3ANZ3TNYphJcf1EWzrWENbHev2zHej7
	wGVcTTHLDgxdVokoalHy9u/rhs6TKG5F4QYv9N042B/H4xJFWoIUSd4Ds++gPT7NWRsQ5Smv2Fu
	tNwxdwf5I8D5krBwgZdzxwPnBtqTiMtkCOaZiPyoRpHsRjNwARYEysg1t3yVfnUI8q8wHQNuI80
	5iowiFQ9pWrQN9Qjv5P4HU7keCjhwteV7+tZR/zZIAYE3LloD6q6nL7r9lF7YwCkCxsVWgpLjk2
	v/f3Yszg8Vs98FCr9psPPEGdZq/7Q2qcOfRh7mpXDDVnxXq71pUxzeP3IqcbBw+td4cJFr2IZJI
	Em2ZuvQ==
X-Google-Smtp-Source: AGHT+IEWUOHZgP8g4/g3KQWG8J1PQkBdlWsjrYzDs/V3gnf3e76QSCrxCzAE8HB12n1p9qtyZvIaBQ==
X-Received: by 2002:a17:902:d48b:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22ac2a1dee3mr64152325ad.40.1744222200490;
        Wed, 09 Apr 2025 11:10:00 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62b88sm15201115ad.41.2025.04.09.11.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:00 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 04/23] staging: gpib: fmh_gpib: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:34 +0000
Message-ID: <20250409180953.398686-5-matchstick@neverthere.org>
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
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 32 ++++++++++++------------
 drivers/staging/gpib/fmh_gpib/fmh_gpib.h |  6 ++---
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index 30fbf1065de2..261d663cf8c1 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -48,7 +48,7 @@ static struct platform_driver fmh_gpib_platform_driver;
 static struct pci_driver fmh_gpib_pci_driver;
 
 // wrappers for interface functions
-static int fmh_gpib_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_read(struct gpib_board *board, u8 *buffer, size_t length,
 			 int *end, size_t *bytes_read)
 {
 	struct fmh_priv *priv = board->private_data;
@@ -56,7 +56,7 @@ static int fmh_gpib_read(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return nec7210_read(board, &priv->nec7210_priv, buffer, length, end, bytes_read);
 }
 
-static int fmh_gpib_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_write(struct gpib_board *board, u8 *buffer, size_t length,
 			  int send_eoi, size_t *bytes_written)
 {
 	struct fmh_priv *priv = board->private_data;
@@ -64,7 +64,7 @@ static int fmh_gpib_write(struct gpib_board *board, uint8_t *buffer, size_t leng
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int fmh_gpib_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_command(struct gpib_board *board, u8 *buffer, size_t length,
 			    size_t *bytes_written)
 {
 	struct fmh_priv *priv = board->private_data;
@@ -108,7 +108,7 @@ static void fmh_gpib_remote_enable(struct gpib_board *board, int enable)
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int fmh_gpib_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int fmh_gpib_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct fmh_priv *priv = board->private_data;
 
@@ -143,14 +143,14 @@ static int fmh_gpib_secondary_address(struct gpib_board *board, unsigned int add
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int fmh_gpib_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int fmh_gpib_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct fmh_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-static void fmh_gpib_parallel_poll_configure(struct gpib_board *board, uint8_t configuration)
+static void fmh_gpib_parallel_poll_configure(struct gpib_board *board, u8 configuration)
 {
 	struct fmh_priv *priv = board->private_data;
 
@@ -179,7 +179,7 @@ static void fmh_gpib_local_parallel_poll_mode(struct gpib_board *board, int loca
 	}
 }
 
-static void fmh_gpib_serial_poll_response2(struct gpib_board *board, uint8_t status,
+static void fmh_gpib_serial_poll_response2(struct gpib_board *board, u8 status,
 					   int new_reason_for_service)
 {
 	struct fmh_priv *priv = board->private_data;
@@ -214,7 +214,7 @@ static void fmh_gpib_serial_poll_response2(struct gpib_board *board, uint8_t sta
 	spin_unlock_irqrestore(&board->spinlock, flags);
 }
 
-static uint8_t fmh_gpib_serial_poll_status(struct gpib_board *board)
+static u8 fmh_gpib_serial_poll_status(struct gpib_board *board)
 {
 	struct fmh_priv *priv = board->private_data;
 
@@ -393,7 +393,7 @@ static int fmh_gpib_all_bytes_are_sent(struct fmh_priv *e_priv)
 	return 1;
 }
 
-static int fmh_gpib_dma_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_dma_write(struct gpib_board *board, u8 *buffer, size_t length,
 			      size_t *bytes_written)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -471,7 +471,7 @@ static int fmh_gpib_dma_write(struct gpib_board *board, uint8_t *buffer, size_t
 	return retval;
 }
 
-static int fmh_gpib_accel_write(struct gpib_board *board, uint8_t *buffer,
+static int fmh_gpib_accel_write(struct gpib_board *board, u8 *buffer,
 				size_t length, int send_eoi, size_t *bytes_written)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -586,7 +586,7 @@ static int wait_for_tx_fifo_half_empty(struct gpib_board *board)
 /* supports writing a chunk of data whose length must fit into the hardware'd xfer counter,
  * called in a loop by fmh_gpib_fifo_write()
  */
-static int fmh_gpib_fifo_write_countable(struct gpib_board *board, uint8_t *buffer,
+static int fmh_gpib_fifo_write_countable(struct gpib_board *board, u8 *buffer,
 					 size_t length, int send_eoi, size_t *bytes_written)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -652,7 +652,7 @@ static int fmh_gpib_fifo_write_countable(struct gpib_board *board, uint8_t *buff
 	return retval;
 }
 
-static int fmh_gpib_fifo_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_fifo_write(struct gpib_board *board, u8 *buffer, size_t length,
 			       int send_eoi, size_t *bytes_written)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -699,7 +699,7 @@ static int fmh_gpib_fifo_write(struct gpib_board *board, uint8_t *buffer, size_t
 	return retval;
 }
 
-static int fmh_gpib_dma_read(struct gpib_board *board, uint8_t *buffer,
+static int fmh_gpib_dma_read(struct gpib_board *board, u8 *buffer,
 			     size_t length, int *end, size_t *bytes_read)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -848,7 +848,7 @@ static void fmh_gpib_release_rfd_holdoff(struct gpib_board *board, struct fmh_pr
 	spin_unlock_irqrestore(&board->spinlock, flags);
 }
 
-static int fmh_gpib_accel_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_accel_read(struct gpib_board *board, u8 *buffer, size_t length,
 			       int *end, size_t *bytes_read)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -898,7 +898,7 @@ static int fmh_gpib_accel_read(struct gpib_board *board, uint8_t *buffer, size_t
 /* Read a chunk of data whose length is within the limits of the hardware's
  * xfer counter.  Called in a loop from fmh_gpib_fifo_read().
  */
-static int fmh_gpib_fifo_read_countable(struct gpib_board *board, uint8_t *buffer,
+static int fmh_gpib_fifo_read_countable(struct gpib_board *board, u8 *buffer,
 					size_t length, int *end, size_t *bytes_read)
 {
 	struct fmh_priv *e_priv = board->private_data;
@@ -956,7 +956,7 @@ static int fmh_gpib_fifo_read_countable(struct gpib_board *board, uint8_t *buffe
 	return retval;
 }
 
-static int fmh_gpib_fifo_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int fmh_gpib_fifo_read(struct gpib_board *board, u8 *buffer, size_t length,
 			      int *end, size_t *bytes_read)
 {
 	struct fmh_priv *e_priv = board->private_data;
diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.h b/drivers/staging/gpib/fmh_gpib/fmh_gpib.h
index de6fd2164414..e7602d7e1401 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.h
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.h
@@ -124,13 +124,13 @@ static const unsigned int fifo_data_mask = 0x00ff;
 static const unsigned int fifo_xfer_counter_mask = 0x0fff;
 static const unsigned int fifo_max_burst_length_mask = 0x00ff;
 
-static inline uint8_t gpib_cs_read_byte(struct nec7210_priv *nec_priv,
-					unsigned int register_num)
+static inline u8 gpib_cs_read_byte(struct nec7210_priv *nec_priv,
+				   unsigned int register_num)
 {
 	return readb(nec_priv->mmiobase + register_num * nec_priv->offset);
 }
 
-static inline void gpib_cs_write_byte(struct nec7210_priv *nec_priv, uint8_t data,
+static inline void gpib_cs_write_byte(struct nec7210_priv *nec_priv, u8 data,
 				      unsigned int register_num)
 {
 	writeb(data, nec_priv->mmiobase + register_num * nec_priv->offset);
-- 
2.43.0

