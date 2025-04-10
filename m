Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1864F1372
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292058; cv=none; b=DdVmxk44pBl49PpmOK89bjbN6BHa0HtC7CIi6KjhMk2iIPZrq2B+t11ZU7QDPIXb4R73wNaQsWcF+ArGnBYvhAy1xE5LR/OekxCqWl8vHk1o79mgx2ujKI5rBQV4PtzGu7cV91+NN8grQ3l4lxH/d7I8LuVoLL8/GSSXqaYQbZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292058; c=relaxed/simple;
	bh=aUEvH8sTZK70D0w9K8q+BNCLK9IRIEnnqv5/uRVHSt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rt/KYrT9cFEb/4VAtlEuuzQpq7z61BOsD2kqZNaODpr/VzwYmQ4rJ+IYXNGiIZM0RFbUZwL3pMlCMembE61O+kTgvVHG61VPNEKJggv7IrC6DvbMe3LaAlhHM4nhE7vQKkc3BvwNtQIbrXD8dlENTUR48Ze6YmD4kYbbz+pN1J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoBxWfjH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoBxWfjH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22401f4d35aso8932465ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292055; x=1744896855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxeSbPIzszjGnSvrpOvcwkfeAlvfBRAjswzSiZSoXzQ=;
        b=aoBxWfjHnafyxNyfkBa0lPcpdKQvFvju+jYXtQshVXMkzLj3W0Oxy6A60AzBxL8Z6Y
         oRHKsTJs9GT8U0CrxvPB/R1sgGrAHx3G9I7qsrfQTGc0KkId+NILUL/9XSD6edsC9rcQ
         fJCYgZTBQwfxsk/qiifw7f/0nOwXp2qiVg7mMEy3twNfSlAYrhpKBA799jNgKdgid9l+
         uZcTjvCuIKiBurcf+zVJ+3Z95Bi8VfOdqFljRxreaysDiyw1NfiTj1DrOR0CVThY8GZY
         p7dTBLtCagN0UIAaHRl+Fh24kshl5rueejfbbbnvEY3UMdVBxDn/EvCnNtKHgnAMHTLg
         TzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292055; x=1744896855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxeSbPIzszjGnSvrpOvcwkfeAlvfBRAjswzSiZSoXzQ=;
        b=r+10d9D0hI5XM28CVrC/x/eMhndBk+uOe3OCehjoJWMcmPpE43o5BDJb54ua9sAy1y
         +ZsVraWsGKnuLFMnoS4QaBOHSv/dvdNRYqUlsSMLC2xV2O4DD4wLd664/yzlBtz+GaKD
         8EOaqj44tx4QP33dtPqCLYiMOQbiYEvdHnNSYs6ilcYmT50SLMvi6wcyYjT1xJtNul35
         Ay7/PJLYXTh04kwR62/Jn4GsN9ZMaG5L4wSYdiVwLk6UQ9VcK7KIdIlMKL3NrH56N0Qu
         9xJnXdUPOvsUY6N5jtvWsQQUVQ4VuK2DqxaxEcgwQJlmdARlTQhjFV8zXj3w3rI23YjS
         1Lfw==
X-Forwarded-Encrypted: i=1; AJvYcCUkBbiHx7aJEzC40aapu5/xw9zPOApJZrxyW/I82/UnbtOeWj+xbDaZdg4Vj6Gmm+FixweuYXIcvQjsOa8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZHw8NqYIpRlr+ZuKBf2d2JzX9S8Fucyjo1Xq1OO6YS40+0DjG
	XaxQgT8gzry/vWSknSR3RWSJUJ/nAbz38WLliHUaKQBF9k5mupZq
X-Gm-Gg: ASbGncu27DmGMb5flM9I2rp2BVkCNvO7P9/OeoxAsRy6BvPc3254j/v4I6XyEwPCzcj
	CYGF59bqdQIXpaZNRlosUlleUAOT2pb1ZAntGno8+jOzICGt7wLRZ5G3gEts+Tee29uvnp7OhMk
	+wdtvTU+MQDE+ZLxbnQw+/n2USmDbSRqBVwP/+vplkRQF1cDExYOTGw2GxzDSlUYWhfSCNRD0RE
	SDLj5oKutoSzF9Jmzw3DCWHu4Z6jZVvQt2a0As64J+g9azKwMwoVRbIJJLZ57AHlXAcvZRbc6P/
	syNU+nA2cMdR46no8NV8RIR5UV/4qKaXEosxa7P2qJspUvpG5EFFIhg=
X-Google-Smtp-Source: AGHT+IFfGKT+CjmFhjdjDFWm//5beQJ4RbUV7i3qqJwAHO8GX2iN4WUrgtrevE+4mbbu/BuXURpkQw==
X-Received: by 2002:a17:902:ccc8:b0:223:3396:15e8 with SMTP id d9443c01a7336-22b2edd1cb9mr51008155ad.22.1744292055287;
        Thu, 10 Apr 2025 06:34:15 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:34:14 -0700 (PDT)
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
Subject: [PATCH v1 5/6] phy: amlogic: phy-meson-axg-pcie: Simplify error handling with dev_err_probe()
Date: Thu, 10 Apr 2025 19:03:20 +0530
Message-ID: <20250410133332.294556-6-linux.amoon@gmail.com>
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
 drivers/phy/amlogic/phy-meson-axg-pcie.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
index 60be5cdc600b3..54baf7b8930e1 100644
--- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
@@ -131,19 +131,15 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
 	struct phy_axg_pcie_priv *priv;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
-	int ret;
 
 	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->phy = devm_phy_create(dev, np, &phy_axg_pcie_ops);
-	if (IS_ERR(priv->phy)) {
-		ret = PTR_ERR(priv->phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to create PHY\n");
-		return ret;
-	}
+	if (IS_ERR(priv->phy))
+		return dev_err_probe(dev, PTR_ERR(priv->phy),
+				     "failed to create PHY\n");
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
-- 
2.49.0

