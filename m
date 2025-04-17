Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6655B1A841B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850745; cv=none; b=nfxeR6ro/OgdHYKw8NrA3UKtNsAaO/b9B+9lFOJyve859qqKiWUdtIoJovXpcOLZ3z6sZ4W35+3SAwLLINw9j1alhzRDjWfv69ZPNlBLu1IzqArKqC070CgaO3LBuNkmlM5OVWrZSdMGVf9GcS8NHU6d2iye6EaRdnu9ZlmtzTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850745; c=relaxed/simple;
	bh=iWVSSf+TpSw8Rneoj2znRVsY2B7CQDvvXidmWGGapFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXEzZUm6Fb8hhsXlssDuiAyR8/tyoQDkANAdpcluzlwOe9sn5ErjTQIlxzYM3TlnzZt5vdWuu4u362MRhYR1DM04iZMGcJazivH/KAl4vZ/zKO1L1hbxXAaHg4o8sl6qRWFZ5Gn4sCLt6T4JH8y5Z5F4jmNKM5YyFN+QqdjdkHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=RGscWTV9; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="RGscWTV9"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af28bc68846so168670a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850744; x=1745455544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zs3nmp6bNInwEcGoHF3GJbe7f1ZKHiGtLyO1UFwX8eI=;
        b=RGscWTV9qy3037j5morjL4i/4pBesZBnDQlNObMrYK0Pb5JUBxQ+VzlkPuASnejgf7
         rIXaKv0uAs6M4UCIVfy9RX6oAy/pWttJ1o/zCHxOJeoDFBOhhrij3nOBxdvFJRPvkCzd
         5t51vXJFgk6LUdgB0+gstqHn6C0xMslUeJDX+4z/8YdlJwwEdbjHdOLF4KXDAUfVLQ4n
         vs8BKG7AKr3m4CROfJw8JDsEepqzbLMaqwcLOfkNFgjjCyYdFKCyqFy4xIQmIb8lFqzo
         3htnqYuxZuZFH3452xI2uDHj9IkRnQ0INdylut4/NnO11MZVIYKd2+/v5R/jPgc+0cQz
         EGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850744; x=1745455544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zs3nmp6bNInwEcGoHF3GJbe7f1ZKHiGtLyO1UFwX8eI=;
        b=mHUuA4k8xMUqUGcVtUnRRVYPRoTIqWRTO4dhrK4dii2eD07JdsAIPdcN9qnhybbHEG
         r/SBT32dcMS8UWi3X6iXRasfymWF1B7TFvFY1IBzzSkGHl/A/7br2gv6yBvGbF/TLC2t
         ocF+Co6r/KHTdd79yErR3xBvSMJWhlH06kw4nuB3/G29qJW1lVaGhm0h56U2SO7HSBf8
         wGPSxVKjj+s7E1e6uEeDcndKOltvd+/agth8mjHb7Ksvn6TvtDfAK1HDFKm8Hd+9/gZY
         OZtxfvd9tQN60d048mtLb9FuhSLtHI34FiTKFKO2xdkrzBMUvTmC5pEf1jzIpgpzL5WA
         AtIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCln1eJFaRP+5kSwjcNyq3AhmSwGySRbUPf5WBTvGMXw/RUuD6ECzvK+4D32uNICc8JBNPicrN5wbfwpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDlIw1nZ26Z6SAlJyVotmPUTEPCQk6Bv0B+rvvhwaDZa//Dq1D
	2WRQEFwEmIcmnP6O4ihYdOX8yC9jUW5XqcjlNSF/N+UQEIo78jCMyG4psOOVmHK74RSAcEpHRFU
	=
X-Gm-Gg: ASbGncsU4sIOzQIvJq9wpAkkEpfZx4aw5lCd8RWJmyj69iayY7TM+D89PZRsXXKytq6
	9tMCqME0HBbrJbcbUv1lAw4vu/8ieEuHUgleAbJ1GD3z0lMV7cO2+/+TnTFKj2gbz5gPmX4q73G
	W2SUFksCFvOOvKt9js/gHrBnd1crBZHpftUGQV134bNngGOwACAUAZuXATZRoczd2chgks9ukuW
	rghJSKSOg/rOpnqQ0EBF054X5JwLxHyX5Rb3pLqnvOVJeYH9UUKJSeH7GiFOIX7qvmS3ZVyq6J/
	kwCyDJ0kUtk1A7BbL+VhJjZZ+pkdBgW600XaIPnL8sz+Dr0K6KGMxqNAWRwDKiZRzgNrSpbW1Pd
	Wypx/Tw==
X-Google-Smtp-Source: AGHT+IEYNueiE3luc8qMrFrdGYAYawhzOBpu4NBs+ZVADOQuSYHRpkJHJm1C/3UpgRm3wnl83uuhZw==
X-Received: by 2002:a17:903:98f:b0:21f:164d:93fe with SMTP id d9443c01a7336-22c35990b8amr69624635ad.53.1744850743664;
        Wed, 16 Apr 2025 17:45:43 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611d8c64sm2319526a91.9.2025.04.16.17.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:43 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 05/14] staging: gpib: cec: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:24 +0000
Message-ID: <20250417004533.86765-6-matchstick@neverthere.org>
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

