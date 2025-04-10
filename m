Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6E5257AEE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292052; cv=none; b=gQqgivYjfdryCukwgs15+Gwi1qJyttGjXOi6WnYF0pZRdBWBfMhZxj3SJkW1EQJ8Lh+ALgdmCqhKjdfuihwyuO9Tdlh1S851YvzaVxx9OaQ49B5hMQBqY4CYTuxMSLnSzk1kPTCP84Rb0JHKlM8mpK5E+hMzo0CQs5kjXgjEtv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292052; c=relaxed/simple;
	bh=c5zYOZZjjF1uCMgMgn0by0b3LS+K42JKxaRgPU5T4mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fBMiKaRtd5Wwdi9xMCcg5rHrKh44wEf0PEFiC01dBvkcFaPd37sRIRenzjUVF5UxuvwM+LiRdjWCC4biapOZzOFM5TjfkQawdn0oNWCXEZvoEMb4TWV3kB6XE20TG+hvUZjRsEKyqGkAixwuAzCqpTXfH29f2/voFErobTenKks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGLk62FV; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGLk62FV"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227b828de00so7129405ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292050; x=1744896850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ie2WYSBT3Vb3/RLr/kVYn30UdEBVb+2bXcwDKP51ids=;
        b=TGLk62FVlCkDP7L8Qm8pIaqRjyCj8M0JBZ6W3siETkmkHaq3tFZpUH5stAiNzH89Ez
         OY2vAz/YZ1EUpoCajPuOLsxCccE5L4qfVvWu70ai/lwn9EMM8Ln0nPqLC3gCniQ/hcw3
         eiQyh38V8e9DFq6AmLXJs3KegWEvpC8W5S5ls04glRIhZfsU/pxoCo20z1emWsHdZn8i
         wfiaLQCSdhoSPMk0/2lYYM7NFPEVVaEbTpCnRbsN64eNhguSmUx/EvvBR/6WOQ1T2pf7
         7iu31FMoOR2oLVp9ETpeeUe1BRiU1ICiHzupEL5894+c4958S1v94PQLY8GYcsfvnI1E
         0qWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292050; x=1744896850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ie2WYSBT3Vb3/RLr/kVYn30UdEBVb+2bXcwDKP51ids=;
        b=Jp7rHbNMjSqIzHYdUc4PTviHt2prGiOGL25ISi8JCRuMyA6VNJtbIzdi3Lr0UZ1HRS
         QyC07RsHltHjBe9Kidaf09Fw9KJh7yUdzP0n2uVgGbfp8gVOt+uIFHpmNhTm/UTT4Z1q
         dDNEi2gWCazZMXEJemgz33iP6xVLsi0qpTpGmISKG/6Apf3fC9ND7uDhGHfCDoqtRXLf
         B5/+qSHhsJ7m7lSpXOwnwyUKOMyx0ljwcOUD6PhKnHBx0P2c9/aKpM9TI2nbnqax5WrO
         OF4WWfzjubFPuMviTf8j3gh4NWPVyJ/HQsvd8FqdlZIXcXz5XWb0P9GMDxzeK5N9iZpA
         HfCw==
X-Forwarded-Encrypted: i=1; AJvYcCVLnhDY8YBzc2e/QvS+JEe76Xel76EEOj64jB2lQgzXce1rJs81E6JYo4h+x3DDMLO5lJj+0kkvmKTUQCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn1+hHnRfQCqGIZVliwGfV2dJCd7H72eSQ585gRfmhSe1FB3m8
	BlUm/dRW2TDn8Oz6DhV4RRO2bUeu02yOmIh2p/DS7a9dAkv3nSAahia/Rg==
X-Gm-Gg: ASbGncs++r+zt0JU7uOMUoD8gh0XGgJ3dTbCcanMSl1qFetR+3XwQBJBECN9BSZD9d1
	cG2ZwiuMpUnWyixBSm2jJMDpMqRKIwvLg9U3BdZGGuvSf3uuuOZQNvTcE+AdiD83pfMXuvqNkdY
	Nvhno/2MUDnb0SKUvGuTCr3pO4yBSsODI9Sfc/WalSo5xvybFASLkxMayAFTa6E/9yjc2as6Mnr
	iM54ixickKQ2XllePIQdlijqD24yRvqlW0JkdefhHLXhe0o/+8imly5wV6LWWM+/3m5gHuJh77S
	/wQT/ST30qMqplYXAGqt58pb8FsHgPZIoKE+nQ9Hgtiq4jhqeW2klWQ=
X-Google-Smtp-Source: AGHT+IFebE9GR8x4kSqiJ5cenp/8FxgShjyDitPJ8W8qx7xYFtufybCnsYQR0VTIIrJFw2c46H3Qfg==
X-Received: by 2002:a17:902:d2ca:b0:224:c46:d167 with SMTP id d9443c01a7336-22b2edceda8mr42616955ad.16.1744292049826;
        Thu, 10 Apr 2025 06:34:09 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:34:09 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 4/6] phy: amlogic: phy-meson-axg-mipi-dphy: Simplify error handling with dev_err_probe()
Date: Thu, 10 Apr 2025 19:03:19 +0530
Message-ID: <20250410133332.294556-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410133332.294556-1-linux.amoon@gmail.com>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dev_err_probe() for phy resources to indicate the deferral
reason when waiting for the resource to come up.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
index 08a86962d9492..c4a56b9d32897 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
@@ -377,13 +377,9 @@ static int phy_meson_axg_mipi_dphy_probe(struct platform_device *pdev)
 		return ret;
 
 	phy = devm_phy_create(dev, NULL, &phy_meson_axg_mipi_dphy_ops);
-	if (IS_ERR(phy)) {
-		ret = PTR_ERR(phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to create PHY\n");
-
-		return ret;
-	}
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "failed to create PHY\n");
 
 	phy_set_drvdata(phy, priv);
 
-- 
2.49.0

