Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99F62571B9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151834; cv=none; b=UIj5rZfw+GZEwe31s34YPpCYndgv12lyrTn8g2bQFv0o/DXc2vj2bGqjA5qeOU3w74IuiWgSJLh4LeJjFgIb4RQ4x6OSmIA17rQWd7MvJeBbSgxPlLWxh27QXYwFFxCwGA4jZTbZtPYt8P626qdpz4FdVTNs6xNhBIPaJRHvaS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151834; c=relaxed/simple;
	bh=oA4pyrX24y1bCy2gqUioXPrzN6EHIu1R3/OUBiH3obw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JXyfW6+iEsHx2bxaRY7tOm1TQDSP7vm47l7Vs+L2w3oYsHUjPAKTcjDmHs6TEjhcQz07RSlnVWgIdHPFotjOqzxGxe2wniyu7Y49lAQzTFrvCc8XKqUX9GBxr48Xatkzj7QyPpAdq34kfbIfMvlm2mjcbIjkjpv0O9hn7JdXKj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Q9Pi3gjY; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Q9Pi3gjY"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2243803b776so85484705ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151832; x=1744756632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48CnxiwOG1VbFBlXoNHKj2YQK9a79sPTwkYUOXtTir0=;
        b=Q9Pi3gjY3DMBimJbLCBOxMyaVNS8ovQSE53Uj3ilCtu98ElF7e8/QlrDCW5HysMmbq
         VvdZYocJNCCgWgyqE2drxRfIKpxiG2o9aM4u9rI01QBgJ15g/VzNkp5+kZdxkrcDVRDd
         dmuHs4AJ44Wee3snHEXKGu3jI3usNiDBFOYA+mKDoXELu+Tf5NhnH5AFlzBurpx/Gism
         K6sz6ReuJDDCPAU04aGvoDuey1k2Qbific5S8LKRIZNutQnhWPUi3wi4QKHQLfHH9Fhw
         tDB/s0xtZnHqY4fsYIXGVTTEQZJC0qi8UdRMXlPikMlHPIpdTlbmxhev0QEsH1/WpdXg
         /cPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151832; x=1744756632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48CnxiwOG1VbFBlXoNHKj2YQK9a79sPTwkYUOXtTir0=;
        b=p4hR009o/aV9NahxSEIKhbT3eOpmk4OZte4NTVebmgEQEatRdh8+gnKd9bK/JCUGsO
         xHeI7JAF6VVWnDLN+Mj2IQBvSyK2qW8wVKO5HIavpo8UjL+JI/uQxIpHVdyl3QoUdCzY
         r8dnmbvDdcswIVP4cchL+4oJg30FSTDXVZUpzImT1W8URfKC1RHVlZC1zSblRMOcVW3Q
         qdn+rE3Zxj1PUEme2o9GdN3/vfEBdJbVAImo/ImK6h/2elI2bGZTYyBT+3KIc8HO1pva
         UDl+5oCtATyZcMz9r0wwJrREMoD9bXYJlcHAK7HF9Tcu32KzO7utBfydAbD0NTZh2Q4I
         1Bsw==
X-Forwarded-Encrypted: i=1; AJvYcCW79zbtXUa5D+WWH+jI/Npmh5ABZfIvKxbBb9Ya7FP6Zp2IallhrFJ4/OZXir++NLmcHANvTPziaVCOpzI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr/6SQbQMpz4wiYAD5r9PNBzngogHn95t1AG7SBFk7mHMN2VUh
	523xvuXz9bq+cVt6MyO7JiMtpfyP4rIH7ZsiqtodTwLXfgFnYmRG8uiDMLY9gsukGmCwf5IDWP0
	=
X-Gm-Gg: ASbGncstH2QXCoLxccgzN2WmIIYcunvASCbVLiK35PF14xJ+ay5tKMhpS7VdhewsnDz
	yiBXASyx32kdFMC3B88g36TUwi3pyOYI3LljquCHsIaPlTWEQvHLLoHvMqNdrswgMUtsBNrSDcw
	95m0DA+MO1bxbMfShqb8xKGbNWcm4oVK08a3JJF4fwnUCNkoh5uMjFZryXwG+5jubhkjaLYtw2e
	TD6vpZzfMunfQAyy+Y66+5vJxG0BTt5eglW7JIhqc5b82Z/sxl7rJRtWLNavx7h/RRyzeFh+YsB
	b9F5urZOvltDlo6vRX0YYmkw888C3mycS0fV2viUPvuWDcbvwnWw7K6oaoObt2MsDqWuIUy8f2R
	iCAiwMFZt0g==
X-Google-Smtp-Source: AGHT+IE7laCrDlkJfZ2SLpK5B8rdk0gdRJBXS0kMSGA9v+TVbdwQ5sHhRHKe4IAEWaIN+FjdabLoGw==
X-Received: by 2002:a17:902:f686:b0:224:256e:5e3f with SMTP id d9443c01a7336-22ac29bc2b8mr9927275ad.25.1744151832207;
        Tue, 08 Apr 2025 15:37:12 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e132sm106704155ad.177.2025.04.08.15.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:12 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 08/18] staging: gpib: fmh: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:48 +0000
Message-ID: <20250408223659.187109-9-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 27 ++++++++++++++----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index b2c379ce4c88..30fbf1065de2 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -32,13 +32,15 @@ MODULE_DESCRIPTION("GPIB Driver for fmh_gpib_core");
 MODULE_AUTHOR("Frank Mori Hess <fmh6jj@gmail.com>");
 
 static irqreturn_t fmh_gpib_interrupt(int irq, void *arg);
-static int fmh_gpib_attach_holdoff_all(struct gpib_board *board, const gpib_board_config_t *config);
-static int fmh_gpib_attach_holdoff_end(struct gpib_board *board, const gpib_board_config_t *config);
+static int fmh_gpib_attach_holdoff_all(struct gpib_board *board,
+				       const struct gpib_board_config *config);
+static int fmh_gpib_attach_holdoff_end(struct gpib_board *board,
+				       const struct gpib_board_config *config);
 static void fmh_gpib_detach(struct gpib_board *board);
 static int fmh_gpib_pci_attach_holdoff_all(struct gpib_board *board,
-					   const gpib_board_config_t *config);
+					   const struct gpib_board_config *config);
 static int fmh_gpib_pci_attach_holdoff_end(struct gpib_board *board,
-					   const gpib_board_config_t *config);
+					   const struct gpib_board_config *config);
 static void fmh_gpib_pci_detach(struct gpib_board *board);
 static int fmh_gpib_config_dma(struct gpib_board *board, int output);
 static irqreturn_t fmh_gpib_internal_interrupt(struct gpib_board *board);
@@ -1335,7 +1337,7 @@ static int fmh_gpib_init(struct fmh_priv *e_priv, struct gpib_board *board, int
 /* Match callback for driver_find_device */
 static int fmh_gpib_device_match(struct device *dev, const void *data)
 {
-	const gpib_board_config_t *config = data;
+	const struct gpib_board_config *config = data;
 
 	if (dev_get_drvdata(dev))
 		return 0;
@@ -1351,7 +1353,7 @@ static int fmh_gpib_device_match(struct device *dev, const void *data)
 	return 1;
 }
 
-static int fmh_gpib_attach_impl(struct gpib_board *board, const gpib_board_config_t *config,
+static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_board_config *config,
 				unsigned int handshake_mode, int acquire_dma)
 {
 	struct fmh_priv *e_priv;
@@ -1454,12 +1456,12 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const gpib_board_confi
 	return fmh_gpib_init(e_priv, board, handshake_mode);
 }
 
-int fmh_gpib_attach_holdoff_all(struct gpib_board *board, const gpib_board_config_t *config)
+int fmh_gpib_attach_holdoff_all(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return fmh_gpib_attach_impl(board, config, HR_HLDA, 0);
 }
 
-int fmh_gpib_attach_holdoff_end(struct gpib_board *board, const gpib_board_config_t *config)
+int fmh_gpib_attach_holdoff_end(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return fmh_gpib_attach_impl(board, config, HR_HLDE, 1);
 }
@@ -1497,7 +1499,8 @@ void fmh_gpib_detach(struct gpib_board *board)
 	fmh_gpib_generic_detach(board);
 }
 
-static int fmh_gpib_pci_attach_impl(struct gpib_board *board, const gpib_board_config_t *config,
+static int fmh_gpib_pci_attach_impl(struct gpib_board *board,
+				    const struct gpib_board_config *config,
 				    unsigned int handshake_mode)
 {
 	struct fmh_priv *e_priv;
@@ -1570,12 +1573,14 @@ static int fmh_gpib_pci_attach_impl(struct gpib_board *board, const gpib_board_c
 	return fmh_gpib_init(e_priv, board, handshake_mode);
 }
 
-int fmh_gpib_pci_attach_holdoff_all(struct gpib_board *board, const gpib_board_config_t *config)
+int fmh_gpib_pci_attach_holdoff_all(struct gpib_board *board,
+				    const struct gpib_board_config *config)
 {
 	return fmh_gpib_pci_attach_impl(board, config, HR_HLDA);
 }
 
-int fmh_gpib_pci_attach_holdoff_end(struct gpib_board *board, const gpib_board_config_t *config)
+int fmh_gpib_pci_attach_holdoff_end(struct gpib_board *board,
+				    const struct gpib_board_config *config)
 {
 	int retval;
 	struct fmh_priv *e_priv;
-- 
2.43.0

