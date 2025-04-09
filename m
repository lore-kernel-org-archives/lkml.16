Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC0C2777EA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222220; cv=none; b=XF2WZL+DpDL17vpqmGxPIovpyn5xBzHb056Z76QkTKKP5I2dry0Zev+EVmcW4nD8Q2YUA1GJ7eW5LFH+CabclRm82HHwWA8BiRMfbkorO4gB+VnwaxMG2JUu2+dnBFaOInSKsJ3uB4MqZM2dBnocI3n2dIyas+ZdYie/prOcg7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222220; c=relaxed/simple;
	bh=w2YzpdWlDBDV9vUBM5jDBBVZIFC1lTCI/u5LtobYl/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJOlll+wUAhlyEFfVDDkXSPuIzPSbG6+RniFyvKdlImWKexyfRRe9NM1Cln1ubxb3VeBJ2TiVvXHca/HcCuJ02H5dwwCvHZmteSdWQIHqhhAUzk977s1MC01W5wXBP9VZpLTEehKU40kHYLaMAXvJL1+p2IIyRJYbtPHKmSagR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ZrWGrZk2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ZrWGrZk2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227b828de00so72059185ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222216; x=1744827016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jJtvIiGmaqv063/TYbeDFEuemkLKlqs8hde2cOBC8k=;
        b=ZrWGrZk28JPvLiPS41RZcSoMf64wQV8Eo81CosbCvnxy6RtGFPsG/x7Paj6oBrVoW4
         SabJHGooEavyxoc516bpxzZDwiJilD1mExOi5yuUL1n5HQlw87/LedN5ekTDMsfI0qMK
         QTFt9PZJQXwQwLd9PSci7oP8qsIiVynBsVrrO7pj3pAzrlTzeaS+B8qr53HcoT/KbsLV
         SV7HFqn/4OE2gR9REtcevfp+ZMxN34eDjKMpDMOwo+jt3pnBA982x15Nv//lw3Bew2I4
         zDYKVcdrvBXtETq33Qa4oqJbXZdp+Fb+wKdjSPpAe7N2ljd0sTF4wymDWTh6F3ERZLvr
         UX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222216; x=1744827016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jJtvIiGmaqv063/TYbeDFEuemkLKlqs8hde2cOBC8k=;
        b=MG5VHHS65XCzpTp1ns3PtrplywnLSXj3oSpTBIXat+VvsNXcIXuzAfvtyu/L2VWX2y
         +EV03WjwBFbE3mk5EjDyuDs2OBT5PeZwAcMD4JNPTrwNqu4dA0oiZKj9fRwDSL/UTtz+
         5ea1/1kqzj7TNImMjLQPCbex+djTS5PpP4HBILovFz9j+Jif3+Bla+yEgtt4pJOJ2aDB
         IcK54Zaqi5f9IZyF31NXBcOwqSYThyFXgedE+qupplOett4HuyKlPD7o1URNrZMsQUEZ
         MCfok+ah9EdTKBK0ZkoDIDROVTs3Hjm4Wl59qeb4dGHthDX4QZupOrVqVmFBT21yoE9F
         OSSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGDxGXe1llKZ/s/e2VfZVK9LCav5eMQA2K0F9uFFlE23SzLVOlmxwXWGijoFUYR5/uoPTs2RD+jghEKEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK4eEZqbtplhNo6JQ2D/yB/J65kTI0ahW9RhFSVBN7QP2igzeu
	yWZ2+Y5FC4QOQhMzDYM4nA90cOYNApmEYJ+OqZ7cleif0Wh/kq9wO1rSVvsGfQ==
X-Gm-Gg: ASbGncsupiVcibusNSQbIU4nwpkG85M6+caUf05Zfu+XjayPhzQbVeZn40jLBH1123k
	gwQBv2xbNak3ntsI5k2VIKPJDcMm5k0Vr+sXdcX08QbirK/Nonpg1gc7VSv4pErpdpQaf+3Bdcx
	qPfUYS+wpJr80gFfbvmJi0URkgjxuyqKBx2zzET9iPW8CXf0pADtFLcCP5XFvebwyxY+NMhT0Kj
	klKZ30HAUOg7Zt76VkU8OgkX8XTScdUIx+zaXfLEgqOr5Y6SEwLg+SSfL0XZnxM4q+18FjYmv+U
	7j87o2QtBqkGGgCHVhzdauKgSdZ6F2TK4a1CdlkTQmoXyndV9F3YvimUsVoWyddTWk+x2c9Cz8R
	qraDpHQ==
X-Google-Smtp-Source: AGHT+IGB/0bIECaDIXnib5X73HwOOL+qMK7CDMDksWIM6RbyaIUKObzVvYfnCaDEiPhA+ErrdWoC8A==
X-Received: by 2002:a17:902:f644:b0:224:c46:d167 with SMTP id d9443c01a7336-22ac29a7d25mr57633465ad.16.1744222216056;
        Wed, 09 Apr 2025 11:10:16 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e5171dsm1653480b3a.153.2025.04.09.11.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:15 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 17/23] staging: gpib: hp_82335: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:47 +0000
Message-ID: <20250409180953.398686-18-matchstick@neverthere.org>
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
 drivers/staging/gpib/hp_82335/hp82335.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 32b3aba673d9..1ef85a54626b 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -29,7 +29,7 @@ static void hp82335_detach(struct gpib_board *board);
 static irqreturn_t hp82335_interrupt(int irq, void *arg);
 
 // wrappers for interface functions
-static int hp82335_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp82335_read(struct gpib_board *board, u8 *buffer, size_t length,
 			int *end, size_t *bytes_read)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -37,7 +37,7 @@ static int hp82335_read(struct gpib_board *board, uint8_t *buffer, size_t length
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-static int hp82335_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
+static int hp82335_write(struct gpib_board *board, u8 *buffer, size_t length, int send_eoi,
 			 size_t *bytes_written)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -45,7 +45,7 @@ static int hp82335_write(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-static int hp82335_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int hp82335_command(struct gpib_board *board, u8 *buffer, size_t length,
 			   size_t *bytes_written)
 {
 	struct hp82335_priv *priv = board->private_data;
@@ -88,7 +88,7 @@ static void hp82335_remote_enable(struct gpib_board *board, int enable)
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-static int hp82335_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int hp82335_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct hp82335_priv *priv = board->private_data;
 
@@ -123,14 +123,14 @@ static int hp82335_secondary_address(struct gpib_board *board, unsigned int addr
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
 
@@ -144,14 +144,14 @@ static void hp82335_parallel_poll_response(struct gpib_board *board, int ist)
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
 
@@ -226,12 +226,12 @@ static inline unsigned int tms9914_to_hp82335_offset(unsigned int register_num)
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

