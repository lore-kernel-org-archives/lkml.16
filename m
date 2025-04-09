Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F327703C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222217; cv=none; b=Y/V3zUxT1GGDq2g4Ep/k5eS1B0YeuylBtt9tNbo6ClNC+TTbC82U6j52j1c9F6oPP549C0dnNMhr3/WWHS/KzWGFtxJyiBdivN8OMsEk+Q9edJ9B6edn20sohtwswRMRVdiyn9x8k+x0duCtCCL1OeruvQ8fyIqYBZLoyDORTx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222217; c=relaxed/simple;
	bh=HRwow9ClQsrXSbnVN6eKngDAH8a3mB3oX0jq3BVbb2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdGlfx9exeCs8ErsuN/ATu5mJtEM9YvXr/d6LgpOp/7cKa7NK3Jr/WThXeEDTyAwoGTuxTbRz7KbEAKK0kwTKfcpVY8ifW0Z5INpq27x1lh2Ef9wmqbJDdTzIm1B+C5EcHlLj0ovl3n36fFN8yq1qIKa+xaCBQiHmfsEpTZOV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=fYCWyGbn; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="fYCWyGbn"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227b828de00so72059055ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222215; x=1744827015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKllNz6gZ/alTRBBxLGzP5qPEaY07InopJtWbOeGT40=;
        b=fYCWyGbnDiOecR+icZpS1abjGclIkZIVDvlJ1qcSmRro+dpgSxujLcDDUEJAbLxruB
         a3hvHeX1LlKfU3PBZaeMFdimWAgWYhIkdZjTrdNc4V6NFD41bvsvVL5bKIdZ3ioXhV6I
         R7FNLrHnl7kfYZ8nt5yzNLZ+NAFMluERT4hHscefQALFuOHMZPzMsTHUUaUsSREbraNM
         9cNjxOa9NjSRUjfk6aUipdfCpyWLUIiVdqEKIjtA5OPUTQjwKnnKuVqoYrLbef2x3prY
         h+P/+37Ip8UzOKqKwKYKqQ5DQ3ZLaHOFTG1N5KSq0SzHdaQiaXwTwc5nTiIFSG43OLhn
         RUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222215; x=1744827015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKllNz6gZ/alTRBBxLGzP5qPEaY07InopJtWbOeGT40=;
        b=sDPlDWzmqrrLgfLm1kXKGDyZWp5MRpbRi/rwZQ96hM9AClMGhX5+VM0aJs/it1K127
         RKsVVTZOR8nfgGDKF2OefJmNqPKKDhlMjnYCtmzcalbnPgfbqqeZgwv2NL2tWx6Zexd9
         L0QotqM42EH2q+c++DH+4toC+iHwGlG3myk8vKX0y8GzPIZrt3OAY4XfhLEIq5AB2hcP
         8gTjNKYBQSSxgACoPnNaW1BbRXVOaqLgoJR4fdmVhdgzDlw7SU8IIL9Mo3+qXXjm7V8o
         +2c/osuIcm9FlVk+/jLK3RBFQG4xp7NFhun20f4w5kdPprOkLYFsc6ZNxNaSkRmOHpRQ
         RoVg==
X-Forwarded-Encrypted: i=1; AJvYcCXBYSkiOqk0GI2xypJRmmvG1scJ8v5VuCJhqTCdLSe1r7Av16pLBh41dW04MHVBqXU5ueEup3d9ZFBYMO0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ASCToGYq9dHDfV5MIsPs+MWJ3KD6B4hNK9+mh24RnSh8EGrs
	hqB6ujkIOXPB+HPrj4uBtA3NqXk2UGg0urvx+vajWYgxniXReGHkdN1cssA7pA==
X-Gm-Gg: ASbGncts9bOeH2uVj2YGgiqwbzWHEBeu9VzveQMQkL8YE4V3ZnrQzZKaNtxYhuDTfnM
	eHm1/M/Jfp9gWS/8cV274ZoQTjUyORkVEVplRReayHoYv6Hk6L1jYcXmkvIdPLxJHGmGlJHf1tc
	FIzMS1ckVD9YE4+EEyOhjstMTjbiXPRrRytCLteG6rLHtfWmhCNA727UZSFLs5NgaV23JS4U38M
	ulYUJqCiX4NW1x5TlRvpwmWWYaLXSPq8Jeq1vfapthjiwNjERIoLLwOqkYr8Jb5nFt+/ABg2Rd7
	qytVBQ0dKZM8fSiaBJCDPAI5ty/NO0Z/63egDxgEZUfP5QlP3dFi4r1RHjPvEP3kgavR3H/y2r2
	P/2MU+w==
X-Google-Smtp-Source: AGHT+IENtajno4seXWKvWjtKFEsr6sD6i0sgai4p/SCr4G27WgG+SGKVgRRrpwv6dhiSzXAZcXqHAw==
X-Received: by 2002:a17:903:46cd:b0:224:6a7:a5b0 with SMTP id d9443c01a7336-22ac298006amr62975275ad.2.1744222214900;
        Wed, 09 Apr 2025 11:10:14 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c69bsm15261225ad.72.2025.04.09.11.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:14 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 16/23] staging: gpib: gpib_bitbang: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:46 +0000
Message-ID: <20250409180953.398686-17-matchstick@neverthere.org>
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
 drivers/staging/gpib/gpio/gpib_bitbang.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index c586f739c251..1fb44e2c64a5 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -324,7 +324,7 @@ static void set_data_lines(u8 byte);
 static u8 get_data_lines(void);
 static void set_data_lines_input(void);
 static void set_data_lines_output(void);
-static inline int check_for_eos(struct bb_priv *priv, uint8_t byte);
+static inline int check_for_eos(struct bb_priv *priv, u8 byte);
 static void set_atn(struct gpib_board *board, int atn_asserted);
 
 static inline void SET_DIR_WRITE(struct bb_priv *priv);
@@ -353,7 +353,7 @@ static char printable(char x)
  *									   *
  ***************************************************************************/
 
-static int bb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int bb_read(struct gpib_board *board, u8 *buffer, size_t length,
 		   int *end, size_t *bytes_read)
 {
 	struct bb_priv *priv = board->private_data;
@@ -491,7 +491,7 @@ static irqreturn_t bb_DAV_interrupt(int irq, void *arg)
  *									   *
  ***************************************************************************/
 
-static int bb_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int bb_write(struct gpib_board *board, u8 *buffer, size_t length,
 		    int send_eoi, size_t *bytes_written)
 {
 	unsigned long flags;
@@ -728,7 +728,7 @@ static irqreturn_t bb_SRQ_interrupt(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int bb_command(struct gpib_board *board, uint8_t *buffer,
+static int bb_command(struct gpib_board *board, u8 *buffer,
 		      size_t length, size_t *bytes_written)
 {
 	size_t ret;
@@ -920,7 +920,7 @@ static void bb_remote_enable(struct gpib_board *board, int enable)
 	}
 }
 
-static int bb_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int bb_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct bb_priv *priv = board->private_data;
 
@@ -987,12 +987,12 @@ static int bb_secondary_address(struct gpib_board *board, unsigned int address,
 	return 0;
 }
 
-static int bb_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int bb_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	return -ENOENT;
 }
 
-static void bb_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void bb_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 }
 
@@ -1000,11 +1000,11 @@ static void bb_parallel_poll_response(struct gpib_board *board, int ist)
 {
 }
 
-static void bb_serial_poll_response(struct gpib_board *board, uint8_t status)
+static void bb_serial_poll_response(struct gpib_board *board, u8 status)
 {
 }
 
-static uint8_t bb_serial_poll_status(struct gpib_board *board)
+static u8 bb_serial_poll_status(struct gpib_board *board)
 {
 	return 0; // -ENOENT;
 }
@@ -1364,7 +1364,7 @@ inline long usec_diff(struct timespec64 *a, struct timespec64 *b)
 		(a->tv_nsec - b->tv_nsec) / 1000);
 }
 
-static inline int check_for_eos(struct bb_priv *priv, uint8_t byte)
+static inline int check_for_eos(struct bb_priv *priv, u8 byte)
 {
 	if (priv->eos_check)
 		return 0;
-- 
2.43.0

