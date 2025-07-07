Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B004A06
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873365; cv=none; b=if+oyRg9ACRwUR+3OHeWDtZujDQmiEP174MzY11krZJls8OQIcokS535zaxDh9hr1spu87oD/Eeun+zNtmWJdguR7RyVuPIkzzQIlV+XJFrU9hMmZXmOf0PkRHH2si8eIw5QnI815n1TT5wFVPp9RiMi9gZl1WmdZUUKELfn6/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873365; c=relaxed/simple;
	bh=a0jwSxd8Taiyadtysu1pNvv5ign0mV2IiSRRuAPBis0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TQkEHlgQL0tG30Cf3dJVtmpnQEpP6V06D641sDBmIxqslIujz/yV+Ct5QPzy4qqKHpGNk97Dbb/CStGMvbkgWSKMcj6+LkO3cY0ZaaUsj+UO0Udqpf4MFlF85NH8YGPNgBYRs7qtGU1n+Jltwr5OE9LYakhFpa+P2M9qXmp3hz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwlGSQSs; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwlGSQSs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b20fcbaf3aso497547f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751873362; x=1752478162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f7BZqFkfOFsbvgNq/dMOXUdgZS94yQFfuDJDCmTrvc8=;
        b=RwlGSQSspA5R1kc5p//pKHdEa3wIH+1cXDzRoto1F1RMzqTcgvVXlj+REr+1OHZIFT
         xpRG9JMxujcfeNeXpVrlaTckU/FON27u8tqJfU6H+UjKjGhSY35WZ2uE1f3gpTsDBhTZ
         gqPUZn2OGwSNbgKBTpEd/gEjLoxpyxoKRFuUcNMgdho8TS+rsmG+9t0SgqREvim4blgL
         MU6NGiVl+W6QOfRnHnMuBEXIdy47WprnrUy4yWTDUUBcJN+OXexzJ+hXHrb0BIDhUfG9
         fM8T0DszcZZSJAmhC+gydCz8Oh76Pty5xrenpxtxaGAOXsLInWJq7u/SNOQdoPyFPdz8
         ++iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873362; x=1752478162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7BZqFkfOFsbvgNq/dMOXUdgZS94yQFfuDJDCmTrvc8=;
        b=RvvTemC/s5aZFHSbWfLZRUMSC0D/D9ZxXXS1CSpRbfF5Y0+Oyo4De4dxZUX+7VeusP
         HB0GmfIlzBl1DJNBwdxLzevrPZueEob1cmK1nWAOAhSDuaAb48b+WSYDvMYrCGuhHE2p
         EKqVfKf128dgXNodAMvaQPUqYCAEJ0jXkJdWUtAK2aZdhQv8s3FvZFcYvif2mbzsc3sD
         Y7015qCm8u1U5p5YR+deOrqdJO+Kc7kHUV5/j8nSra+lrqBepPai8e4qyd+G3D2m7bc1
         en7J/+Tsdj3lwnYyrfHG4X6lIb+ameyoOrFdTFhjr3e1q+SgVv/poIlnIiZ1lq4JKTKM
         4Ggg==
X-Forwarded-Encrypted: i=1; AJvYcCWvLt6g0tunq6qq/wYvRtjIBHkD0hWRQRXDSz9ldvH+j2ID7RV97leA8Jr36gOBCXjvA03aIH2R5UYpVdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWG/j2dYt09GfHLFuXOFMuGudcSBIMJAq+NEb6qdDJOjBHH07j
	Yrjq04suDYDa+e4qGh9tmG2+1R1X47fwGFy7HgN+OQ4iZLPGaI2lrOrY
X-Gm-Gg: ASbGncszAW3FFGRGTe4J96NsIAL9wJ0jNRtVRaEWgZWJg6p/JI+EW+cnuHRC45B693e
	1JUU0NFEaIaRdBNiG8i/AQvDrWJO29t3MR6620uXKsS6y5qud4c3pFICzwHxom4ZjBSQwfH3c2M
	acfZNKvZ+tD1Idfu0QNu2yy9M/KUUhxqgDM03mlVWirC9viYJb+YvlEYhGXYdzHgkFXW3SC8RA4
	NJY15NmhcPODnLJCCU0yHz/UgrVgXzPUuEQi0Er5c/F3iW1rwXOe64LnoPX9rj6hQX6rOtaprhI
	WdEqQeqzMZ5jxKFgzA2epra4iZvC59m5QkK+V/z2UymiCqYAsdJ738Q2H8AFxTEeOlxqaJxOI7X
	LclVbIykFQbN3gs4=
X-Google-Smtp-Source: AGHT+IHji7PN/GJFmbMU9res4F6B0DmJU3BUQZ93VGwv1mxSzlZuoVKlPVnXhlUOtz7ZsOT9N7jXRA==
X-Received: by 2002:a05:6000:4007:b0:3a3:6a3d:163a with SMTP id ffacd0b85a97d-3b496604c59mr3115795f8f.12.1751873362269;
        Mon, 07 Jul 2025 00:29:22 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:ef01:c9dd:1349:ddcf])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b471b97f10sm9478350f8f.57.2025.07.07.00.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:29:21 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: rockchip:  Add missing check after DMA map
Date: Mon,  7 Jul 2025 09:15:50 +0200
Message-ID: <20250707071555.17704-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA map functions can fail and should be tested for errors.

Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 63e7b9e39a5a..c5d7cd8a6cab 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -656,9 +656,16 @@ static int rk_nfc_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
 
 	dma_data = dma_map_single(nfc->dev, (void *)nfc->page_buf,
 				  mtd->writesize, DMA_TO_DEVICE);
+	if (dma_mapping_error(nfc->dev, dma_data))
+		return -ENOMEM;
+
 	dma_oob = dma_map_single(nfc->dev, nfc->oob_buf,
 				 ecc->steps * oob_step,
 				 DMA_TO_DEVICE);
+	if (dma_mapping_error(nfc->dev, dma_oob)) {
+		dma_unmap_single(nfc->dev, dma_data, mtd->writesize, DMA_TO_DEVICE);
+		return -ENOMEM;
+	}
 
 	reinit_completion(&nfc->done);
 	writel(INT_DMA, nfc->regs + nfc->cfg->int_en_off);
@@ -772,9 +779,17 @@ static int rk_nfc_read_page_hwecc(struct nand_chip *chip, u8 *buf, int oob_on,
 	dma_data = dma_map_single(nfc->dev, nfc->page_buf,
 				  mtd->writesize,
 				  DMA_FROM_DEVICE);
+	if (dma_mapping_error(nfc->dev, dma_data))
+		return -ENOMEM;
+
 	dma_oob = dma_map_single(nfc->dev, nfc->oob_buf,
 				 ecc->steps * oob_step,
 				 DMA_FROM_DEVICE);
+	if (dma_mapping_error(nfc->dev, dma_oob)) {
+		dma_unmap_single(nfc->dev, dma_data, mtd->writesize,
+				 DMA_FROM_DEVICE);
+		return -ENOMEM;
+	}
 
 	/*
 	 * The first blocks (4, 8 or 16 depending on the device)
-- 
2.43.0

