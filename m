Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57961F03F2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266261; cv=none; b=bIvacFZRzkxF6x+UpcMLa9OEeV+77C/mrq1Oa5Hr1NWhdaIulwfWX7GvVWu4JbrNVT4MnkHmENSlmMRJe+EaeoH0mc5y+4CLWuvSmTUE+R2cWBKAiTK+zTLePwmEFaglkE/bOZUq7yq+WixFLpnksszn0Y4M5pQGwvuhiGffot0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266261; c=relaxed/simple;
	bh=A/I48PbBb5I5iIc6Shl7ozap+VkugdClZDkBLg/W4xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgzIn6CDDaiHFcUXVLUgn/hb3ODUiI1Tk6cLQjfy+vJz8DkH8vHQnOI0vdhCQeF5bGlaScfOO8qsb56QGxBd4eAhc6BzcRKFU/I65Ym3Rdoq3mrTXVQ3nb8i48jl78Y74YRetoRoF4Uqf2wyOxwYEjZwJtaUA4lM7W+P+UW83ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=maZWnNaa; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="maZWnNaa"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dc5b8ed86so2249004f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739266258; x=1739871058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GF075tACuMVMVh8PNKT0nRFACsnr6kvsDOiw0epdSs=;
        b=maZWnNaaEaLZshsyOEyl9lTSgdoaKdOWmW9cZIB1VNcPq4qWtFmwwLocWEuIbYufdB
         NZ0MgxaeLYfhJSn2OuENObg68VAandSxjvb38OcS/iZKEpSXXfkiK959ntgpYTPIKq6s
         rxEDwkWOCj+wjm9MRx4o0C5wIFrnrC7Qoc4bU179D37xOiL3CgNeY3pEKQgaca6ZSVDZ
         p/o6ENiOcVgz+zQ3/hxLuWY9IpFrFE7ZnBnEK1IuQwWkQAtOKzUaSlyjWFJgxr988+0a
         vmRTIWgFbQwD0azCgxsSk4xnKtiVqrG/0/M59nF4TKL1baTQb8WApiReue7IyH7f96rO
         ejUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266258; x=1739871058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GF075tACuMVMVh8PNKT0nRFACsnr6kvsDOiw0epdSs=;
        b=lyLFIexNRNYlVrizIMqR9Xb0+5EnHtiD6IN6XWlgFYCfI4pxaj5P1TYsEZJ4ZAPxsB
         CgGTy5qzmK5IBbyTvcEVYdlUAvHCgYhogQIbvSnfaqgtfrGVPLfVp6BSes4T1ck6eQO5
         Zh+KSLwXdKfd6ICx8ncSsXf47u3aDc9bflVAblIRI7KhA8WWWzKIe5V0Xo9KpeWucWlY
         f6dqGvZU9vYOeHZyNYmiwc0DmR2mMPegSx8LD9FJGN471WiHiCgxskpOFDw59tDEqSUr
         EknWU9LQid4F8bjpnglLXwayqgbqxz++/slwW2NPf+gRj50Wrvzc7dhbvncwS2qyUgIM
         oDPg==
X-Forwarded-Encrypted: i=1; AJvYcCWpjRtQ3eR80MRcLRbO9GGyFTaLrukAgWegpcz++wLEvdiror3ngiqdBBi5e4EXdr8NKP5veEZK/I/MIVg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3BQAx2Axyj2eOMZI5R9hc/Us3adRy7B0XT2cDGjEJlv14bOHX
	vzf2Ua+BjoicLZxh0xygYSOYnn1HCoVspAN+zKQ15PwQrh0ycPJOGuP4EvQvi4E=
X-Gm-Gg: ASbGncu5Mn+B5BxHj+lT97jNZzJT2wIRJw8gjmeLlJP1evnYDGIYSgYy//CxOxwu4Gu
	1BdJWJxXdt6LI9j1xv5EGQz0YfnoHIRcnhbd9d6zbiT+v7Ymv4pCfU12f+uMfQ9fw7AlBgBCzWy
	t+VZNzfXwqHBiH8feFGDOsb6x3DipalcGVBBxAd/TX0sh6mmruZdwuVd1OHVU6a/KqBS6acmSEd
	brXO0FPdQ/wTRXl2ycDy0XDmK/zBpCuSUqhQt3NC3rkamXDlgwfh+b3KwceTgX6+LiElPvLsAB+
	zYSixcmSYKxEamSo+l5y9HZpu2Al9318ax4n91Pi5Sy+4I4pmbJ96yhyRZqUgf3goQnFiOw=
X-Google-Smtp-Source: AGHT+IFiydCLeAvyEeW/5ArSvXalUmxlAwauB30Q787ws04Fjnw5BBYoJGg7Bc0g2UUutEuxX4DAng==
X-Received: by 2002:a05:6000:1887:b0:38c:5fbf:10d6 with SMTP id ffacd0b85a97d-38de416d65dmr2356745f8f.7.1739266257863;
        Tue, 11 Feb 2025 01:30:57 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc672b55bsm12591296f8f.79.2025.02.11.01.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:30:56 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 11 Feb 2025 09:30:54 +0000
Subject: [PATCH 2/2] mtd: spi-nor: use scope-based mutex cleanup helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-spi-nor-guard-mutex-v1-2-05ed77a484d9@linaro.org>
References: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
In-Reply-To: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739266254; l=6004;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=A/I48PbBb5I5iIc6Shl7ozap+VkugdClZDkBLg/W4xs=;
 b=M8SYru7/AL6WclLtCUHLw2NOZOMXHyS08tR6ubyxEcEb+BuFrMRefWlULpzaP4icIWZlwbluz
 Z0nLiWyXXYAAfj2CzZNJEmKOJEt+NYyUUIHjJluJ3o+nPlpEuQBlDMX
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Use scope-based mutex clenup helpers, it reduces the code size.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 71 ++++++++++++++--------------------------------
 1 file changed, 22 insertions(+), 49 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1bb4a500be6e..c9b970f35c6b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2014, Freescale Semiconductor, Inc.
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -639,32 +640,26 @@ static bool spi_nor_use_parallel_locking(struct spi_nor *nor)
 static int spi_nor_rww_start_rdst(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	int ret = -EAGAIN;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd)
-		goto busy;
+		return -EAGAIN;
 
 	rww->ongoing_io = true;
 	rww->ongoing_rd = true;
-	ret = 0;
 
-busy:
-	mutex_unlock(&nor->lock);
-	return ret;
+	return 0;
 }
 
 static void spi_nor_rww_end_rdst(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	rww->ongoing_io = false;
 	rww->ongoing_rd = false;
-
-	mutex_unlock(&nor->lock);
 }
 
 static int spi_nor_lock_rdst(struct spi_nor *nor)
@@ -1212,26 +1207,21 @@ static void spi_nor_offset_to_banks(u64 bank_size, loff_t start, size_t len,
 static bool spi_nor_rww_start_io(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	bool start = false;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io)
-		goto busy;
+		return false;
 
 	rww->ongoing_io = true;
-	start = true;
 
-busy:
-	mutex_unlock(&nor->lock);
-	return start;
+	return true;
 }
 
 static void spi_nor_rww_end_io(struct spi_nor *nor)
 {
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 	nor->rww.ongoing_io = false;
-	mutex_unlock(&nor->lock);
 }
 
 static int spi_nor_lock_device(struct spi_nor *nor)
@@ -1254,32 +1244,27 @@ static void spi_nor_unlock_device(struct spi_nor *nor)
 static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	bool start = false;
 
 	mutex_lock(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
-		goto busy;
+		return false;
 
 	rww->ongoing_io = true;
 	rww->ongoing_rd = true;
 	rww->ongoing_pe = true;
-	start = true;
 
-busy:
-	mutex_unlock(&nor->lock);
-	return start;
+	return true;
 }
 
 static void spi_nor_rww_end_exclusive(struct spi_nor *nor)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 	rww->ongoing_io = false;
 	rww->ongoing_rd = false;
 	rww->ongoing_pe = false;
-	mutex_unlock(&nor->lock);
 }
 
 int spi_nor_prep_and_lock(struct spi_nor *nor)
@@ -1316,30 +1301,26 @@ static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 	unsigned int used_banks = 0;
-	bool started = false;
 	u8 first, last;
 	int bank;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
-		goto busy;
+		return false;
 
 	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
 	for (bank = first; bank <= last; bank++) {
 		if (rww->used_banks & BIT(bank))
-			goto busy;
+			return false;
 
 		used_banks |= BIT(bank);
 	}
 
 	rww->used_banks |= used_banks;
 	rww->ongoing_pe = true;
-	started = true;
 
-busy:
-	mutex_unlock(&nor->lock);
-	return started;
+	return true;
 }
 
 static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
@@ -1348,15 +1329,13 @@ static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
 	u8 first, last;
 	int bank;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
 	for (bank = first; bank <= last; bank++)
 		rww->used_banks &= ~BIT(bank);
 
 	rww->ongoing_pe = false;
-
-	mutex_unlock(&nor->lock);
 }
 
 static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t len)
@@ -1393,19 +1372,18 @@ static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
 	struct spi_nor_rww *rww = &nor->rww;
 	unsigned int used_banks = 0;
-	bool started = false;
 	u8 first, last;
 	int bank;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd)
-		goto busy;
+		return false;
 
 	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
 	for (bank = first; bank <= last; bank++) {
 		if (rww->used_banks & BIT(bank))
-			goto busy;
+			return false;
 
 		used_banks |= BIT(bank);
 	}
@@ -1413,11 +1391,8 @@ static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 	rww->used_banks |= used_banks;
 	rww->ongoing_io = true;
 	rww->ongoing_rd = true;
-	started = true;
 
-busy:
-	mutex_unlock(&nor->lock);
-	return started;
+	return true;
 }
 
 static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
@@ -1426,7 +1401,7 @@ static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
 	u8 first, last;
 	int bank;
 
-	mutex_lock(&nor->lock);
+	guard(mutex)(&nor->lock);
 
 	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
 	for (bank = first; bank <= last; bank++)
@@ -1434,8 +1409,6 @@ static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
 
 	rww->ongoing_io = false;
 	rww->ongoing_rd = false;
-
-	mutex_unlock(&nor->lock);
 }
 
 static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t len)

-- 
2.48.1.502.g6dc24dfdaf-goog

