Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCF828C5D8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292062; cv=none; b=QmQm2O5ihvA41UrNStOz4sZlA9BU76VD58pJobM0QOe9jQhMX42arrjhw+XUX/OIwLpZRHscbtrJSVhb/Y4pSPM3uZyV3vXc/r7hIiTkxCqTHJ27oN9VKiRl0AKOU+NL66SResE4Ewkdur7aorcJDjZi1GeamAKM1IstlrEVReQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292062; c=relaxed/simple;
	bh=H2/UX7n+Kzz47tTU6RvNuKVCWo3ZBMBdtcTOcUn9WSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYUKhjR67zuWv+IgWW2+Wf4Uc23mXYGjwz8uJwuTEAFZueWWEJoLTPy8lfYwk+GWZwaJqM3rvtVKCOJjca969TIVCpuTbdGRarS5JVHZy7IVrr5A57WD5BE3NvX4A2gnOfM0TTWFanpjXAF8n3V1PS8EoryNFSC3PCqpA4FTe00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DU6gh5rU; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DU6gh5rU"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22409077c06so10880575ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292061; x=1744896861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snDm+R9HSu34qLr874FxLnOvyHahTzryBYCxyI70mec=;
        b=DU6gh5rU5lG9r/QDIdiLanZDdMBbO3W9iStDKbojfhCuxnfI3rH2Tq49rum9j6rSWo
         3npQbaTqbpiwhPNYgf8gakf9OCIh9Hr0d/ASAOz2Ou3La6qp7ygH2aWSwT1whEMJbgmc
         ernraw/jND0enOPe/SQa/VVzW4DeTB9Mn8hUrVTmGxMQTnquTn2XaWA4WWX8pkV83tiS
         kdGHPkATVRn3HhlflOYMOCwsss1tNN947sbvNfN6iHbODH7rRlas8pX0L9f+vTPDFQ6k
         gpJSA6vQ6XKNR1PMc0SYfDCvwU41+Zx79y8kkLa162uCaaI+H1KnDO7uTtaVqN1bNHJC
         FloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292061; x=1744896861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snDm+R9HSu34qLr874FxLnOvyHahTzryBYCxyI70mec=;
        b=BAEVwYyRVKocI4iXxdNYnQTljkSS4oC0bz/MaYDm0GjPdU+mtHiwml/W3CPjXhYP8M
         K+lTKeMIugtYA19KreICaon+kWVZ7uSfIV/rIB7e0pVngrIUGVJX+/JTNN8iXiTAx4Kv
         4ek+Bg/RCWzjBBzEnbTLE46cZDYNAlTEf50syqkfNhptxT4n5b86WOGaAWSKOy5Xt8jh
         46OpdNZwJ8lRRp9IrCcvy1DzEfSQa68sekfVPTiHv8u8X495SYbAMtCNKHfDCM2fxkha
         avYP/viEmTHaRe3M4rn31ti/4a903H6q/T1YwE7HB4uAVXF4qixiJ4hVNiSBYqn+N7Q1
         d1XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpGp1n6YuH8x7DIUUubW/GaSSwVJOhvF9jUeJDfpfsNa/fZnYoF1i/Ys8KiH1uIbAmwKUo0geT/AtJO9g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtx+0Y8DBmUnD63SJV+MCj900vM2gyNaOrfQXE0cx4D//b3bfP
	+oqyNS3inGOG9MhmLcZ2RjvIvAnUUJYwzBBzG5ETaShLBeW9oP/d
X-Gm-Gg: ASbGnctZUy7I+oUB0bjmXx0QmGayMQh5t3s77/Fby5gh+rIOBdEUfshNCsDMi8vtQGQ
	p4LNMVodk/L7ly/gsSczF0POnhON0Yc0cpyAZqMl/K+vlwg3A1bNzYGYg7lyC/0COdsmWiKT2CP
	KQHBXTRxIRBTUOTwVEyab1no8zwA99hcQkgHdflldSBdeHlfByQ7+326gf/ksFkPnHKRf57qftu
	MDhp6FdTrIh0G8dpd8WWcjZu5ILN0UqLedSMId+jiwS/MRCPdls2XlAv00MJZN0yfo0RbD1Yxt8
	hLMhokH3ouovoF575o9FiaAjbOt0lnfawi0uG95IVbJrfUtNCv07OZc=
X-Google-Smtp-Source: AGHT+IG8FTT4kfyWPBOyAb7OIrEAVZZGG4LdxWb3S85G2ZZGHkha/cC8RTwaJM0VFBFY0ZFSfbmjFw==
X-Received: by 2002:a17:902:e748:b0:229:1cef:4c83 with SMTP id d9443c01a7336-22be02d9318mr30954625ad.4.1744292060733;
        Thu, 10 Apr 2025 06:34:20 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:34:20 -0700 (PDT)
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
Subject: [PATCH v1 6/6] phy: amlogic: phy-meson-axg-pcie: Fix PHY creation order in axg-pcie probe
Date: Thu, 10 Apr 2025 19:03:21 +0530
Message-ID: <20250410133332.294556-7-linux.amoon@gmail.com>
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

Reorder the PHY creation in the axg-pcie probe function to ensure all
the resource is mapped before creating the PHY. This change addresses
the issue where the PHY creation was attempted before
mapping the necessary resources, potentially causing failures.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson-axg-pcie.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
index 54baf7b8930e1..14dee73f9cb57 100644
--- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
@@ -136,11 +136,6 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->phy = devm_phy_create(dev, np, &phy_axg_pcie_ops);
-	if (IS_ERR(priv->phy))
-		return dev_err_probe(dev, PTR_ERR(priv->phy),
-				     "failed to create PHY\n");
-
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
@@ -158,6 +153,11 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->analog))
 		return PTR_ERR(priv->analog);
 
+	priv->phy = devm_phy_create(dev, np, &phy_axg_pcie_ops);
+	if (IS_ERR(priv->phy))
+		return dev_err_probe(dev, PTR_ERR(priv->phy),
+				     "failed to create PHY\n");
+
 	phy_set_drvdata(priv->phy, priv);
 	dev_set_drvdata(dev, priv);
 	pphy = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-- 
2.49.0

