Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093D727CCCA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222223; cv=none; b=uJakewxc1GsL3YGTGMjJ/ak35oK/RcAk5uf1IQoJNRp5a+MRZre3IvzSSbVUhNj8d3Z1e9HmAs7U3ZLnl/S4FU7DR0s8mh8euqHFX30Ja+mo7LbxFthNvkcCldCQhNY1DW9iVcJs4bMhRjIcztTAGg1LvbjMdhDLHv2WAtPdTow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222223; c=relaxed/simple;
	bh=g0pUBnrCER9vi/uHzG6ZglEsQbz9E6xPX0lJ/XuBETw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6D4KSN0lf+F1yrmXq8D7pQWjtnBT4bE/F08ETml0pXZGoiaheTKDLR2+bUC5+7MhEtG36I1ymRgVTjrg29DPnIzsWTJ34q0QAUhpPjg3MSEgDBVlFcDqMnBuBYIbbp5y80Ht2fK7sueTwqkrIrtWMzCEncDIWEODeFo3DG5k/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Dd/9H8p3; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Dd/9H8p3"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so5877550b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222221; x=1744827021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FLKFFQ9i4XIZfKACP78QxP1j7KMWGBYwP32irrX6ZA=;
        b=Dd/9H8p3M99e0t2m03S0cVde75Tpv0dDk75h4mj20vuwxeLch8ASocQ4bL6eJ9zhIi
         +kaFzC9jZJIneqRv5DCPr9kDtC9eQB7WULTZ8VfWqFaXBtEzHAnLDww0LjFZuM14r/d9
         0Kqjeu13zkpMh7Zd8p3rI/eFar4j06m+RoYaZVzRRlhMn/F3rFExqEvcvwWQFEgWkzLI
         ccaCXWWsPZhhrkTauHq9kUsVUNMOSTIHmzKl1mlq1WZtTkwEtg4tJymQqudtlRe7q+8w
         00E4EGtQh3hjZg4hsmQ+TLP8gsOTl90nePG3NeVXgHZ/8lHzk+zrd/0gP+2b7Z3RGKDx
         pEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222221; x=1744827021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FLKFFQ9i4XIZfKACP78QxP1j7KMWGBYwP32irrX6ZA=;
        b=H4sOy7KZBqMDvh2Vmj5EKFEn0uCRrFhlC85pCnNThdYHjAuX0PhyjZtG9LWmGti2Pe
         e84liTYLEIsVp1c68fowIkr6nyjvFSpmD/szIIqc+lXMODJhIw0guGAzcqeybXXj3/eT
         wEa+DYk4YVYNdrKLN3IDdCEFDJVmuE4zv/uHDQo/SKHVn1tQ/7BKMJGpuFPRR6ZJJolz
         PaWGxn8/98XWsepZTUF5Tu/h231aAonzh0hIcwFHJ4n9cQRJaJTvYgzFt4LBRNCM6AeV
         m4DPygguDZVRWEspL7YlcOuYrJhLxs6s5pqyRpkNV959p9gu8g8SESXinmeFiGC7xm2l
         1iwg==
X-Forwarded-Encrypted: i=1; AJvYcCWnjn1OAa/cyMMHb3qRmCtrHYPxp+7l5K5eFDjO+HFXm8zXB61AHKY17qg0/Sf2y/knmCPh/XmazbZr4Ek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1im/71/0nlQWKBG1wtRW2yIYkEzJx2Z5FdOz8qjUrh9ZJY8lk
	IBRhDoBCu9f9zs0XpJO0+nnnM5W3eglLziFquTpYmyChGclmGXqbhCv/MoIpBA==
X-Gm-Gg: ASbGncs8VIqcfRqD0eWtGY2JuO3zr217Rz0Z/6g73Prc/3xBUfW0RxqC1Vy12PsA4KV
	QXd6BPzxA4T0cBytmCqkKC5SyGPLH4dnS6OtAbI7J/fNOE3P7Kns3gSIHxBHfjCR2MdoFJldPQP
	zwhEKot9dks2S/LbaoNCC7ehCmyybOqtLa4iU0wp8uO8S4DvEzSfE9BTn5VaffY6qJkuiiI2wP1
	l+N7stQqgfhWNqGnTDN2IilLkeLYkASR+83ZOMxbGrA45VKtUCjjGoEcgNtSNDEwqLTn+trIEsx
	HlQKOPYhTjwjIeuKVQmVRrvtS+7OS4gZS7EiK0yhIk0Xg4OXespqcYPQzXo9BFK7Z4eAjtWCMhG
	iPxRWCg==
X-Google-Smtp-Source: AGHT+IGrc/r461LfxO/5HwDZpbR9rF3NopxWy3YbffIA2xCfTE5p2cuoXQhv3y/TizY/v/DsgC0R2w==
X-Received: by 2002:a05:6a00:3c8f:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-73bae551c59mr5308879b3a.23.1744222221103;
        Wed, 09 Apr 2025 11:10:21 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e4d8bfsm1648486b3a.124.2025.04.09.11.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:20 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 21/23] staging: gpib: pc2: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:51 +0000
Message-ID: <20250409180953.398686-22-matchstick@neverthere.org>
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
 drivers/staging/gpib/pc2/pc2_gpib.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index a33ebd951e79..c202d015e725 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -90,7 +90,7 @@ irqreturn_t pc2a_interrupt(int irq, void *arg)
 }
 
 // wrappers for interface functions
-static int pc2_read(struct gpib_board *board, uint8_t *buffer, size_t length, int *end,
+static int pc2_read(struct gpib_board *board, u8 *buffer, size_t length, int *end,
 		    size_t *bytes_read)
 {
 	struct pc2_priv *priv = board->private_data;
@@ -98,7 +98,7 @@ static int pc2_read(struct gpib_board *board, uint8_t *buffer, size_t length, in
 	return nec7210_read(board, &priv->nec7210_priv, buffer, length, end, bytes_read);
 }
 
-static int pc2_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int pc2_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 		     size_t *bytes_written)
 {
 	struct pc2_priv *priv = board->private_data;
@@ -106,7 +106,7 @@ static int pc2_write(struct gpib_board *board, uint8_t *buffer, size_t length, i
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int pc2_command(struct gpib_board *board, uint8_t *buffer,
+static int pc2_command(struct gpib_board *board, u8 *buffer,
 		       size_t length, size_t *bytes_written)
 {
 	struct pc2_priv *priv = board->private_data;
@@ -149,7 +149,7 @@ static void pc2_remote_enable(struct gpib_board *board, int enable)
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-static int pc2_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int pc2_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct pc2_priv *priv = board->private_data;
 
@@ -184,14 +184,14 @@ static int pc2_secondary_address(struct gpib_board *board, unsigned int address,
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-static int pc2_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int pc2_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-static void pc2_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void pc2_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	struct pc2_priv *priv = board->private_data;
 
@@ -205,14 +205,14 @@ static void pc2_parallel_poll_response(struct gpib_board *board, int ist)
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-static void pc2_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void pc2_serial_poll_response(struct gpib_board *board, u8 status)
 {
 	struct pc2_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-static uint8_t pc2_serial_poll_status(struct gpib_board *board)
+static u8 pc2_serial_poll_status(struct gpib_board *board)
 {
 	struct pc2_priv *priv = board->private_data;
 
-- 
2.43.0

