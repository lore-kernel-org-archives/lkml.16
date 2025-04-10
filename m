Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7F228A40D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292046; cv=none; b=fhxPbwAJrdFibcH2aTXuUGAtN9tLJP3ZUzg/1xQ4naRqlwhGaOITNjlS+EQKAPw0u8GboclMjmF5GVpWaanJu93YGgapPCbyv1M3m9xYckTNPY5ip56KNn6tpU2u/x6w29xHxGqx+oKRsx/8NQtX3NKTwHW3SCOD00X/UVPfq4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292046; c=relaxed/simple;
	bh=+iwC96jwlb8lQZDN7MMp+YNgpicBSru9Wsh/4/g8qp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qh9KHJJ6/eo0Bs0URWFc3CiZ3qL/9shmgcxy3cM/Y+4qHpLxvt2ZZzVw17A9TwQX8QiY6NhHobka90qhDc59p/dvLU5hXCtwUcvItQBTQSGpGD4frEK46Ia1baDpmXFCKTF69AzQYLngfN2IawYloxdXZAyvRWRMgEM1JTwSWsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCI2dtvH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCI2dtvH"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2279915e06eso7896415ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292044; x=1744896844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppfroywA/WF+8dvpxb3LW0A1l9sdjedjaaEGMEvs0rQ=;
        b=QCI2dtvH/nq379Qp86jvridWaTC1NVecQL1lHoLzlxyL0QSJHu9r3o5QEqYuiU8Kdy
         2jEXxKafoFGmIhaYN669h2uKabsT2Uf95Ag4DXVrmIAOXEooOVaAu5zX3YMPykQwZGO4
         8Gf3FxKTzOC/pKLBfCIatnZYzdZuYVMJpSduTxPk4kn8/z7AdNInem8+0nUYhhUnodjr
         NqKHYBzTkn/fTK38o/9s9BDtd7s9QP5eh7KKtOF4FfNEVp0JlmRgUDQFcYWKRw3DILlz
         IyUgYxlXH431pRt94nN0AFB3otVEFjFPqqT6zLUvcCcKjFlcRj6+sajec4nEgguk8h8n
         IW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292044; x=1744896844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppfroywA/WF+8dvpxb3LW0A1l9sdjedjaaEGMEvs0rQ=;
        b=lBNMfseKxwcx6A/Rq4i2X3yEemNHhjfvpX4mdy2lSHncBhSQcaiIsN6mldfvpPxPKv
         UgU4H/fnaKoJK0KSjIJV1ijayKNUqYnAuGdDrw4r9qjfNtsDNELESZjAISIkecw1NwJ6
         zWMmrHsj/GEGekRBgfLBjzyi7C7cMZXYeISaZ4lGRGegKTcmSQ7zKtbtSiv1GbBuGxBf
         +AiSVRJN9BtJDwjICGGL4NCpPU/A6m7zM1f5QrvFiKzKocOn4deFIMDsq2mwzEXzm0tZ
         WtqbpySjxCGurAAex8eaZDqWJszGf1DoEcEDxl61S2ZOOZBJoZqLkx/1EyJyyE0xLWXM
         o/sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjPBE4n9/9aK5BopO+HS3S6OdKNmtVj4kt65u9ToLipYDJAgoozYvpwni85ypWA8M9WI2S5HvTPaqX5A0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz41/8O+aB8ZLRD42CTNffk1ypl9gY7PUDVwqiCheMWSOEvXM4/
	5HApmEfd70UF9FV13uMh1t+hBjWkOgcL8N0cFzWPAgIsrLUey5Bh
X-Gm-Gg: ASbGncs6ih3WdCNiJaA90CowbWqtPkG8zLanSBCDuaItAzl0erTHTwLwjqCiCfrx7WG
	5vb8yMsVk/JQaK/D5lzWTaPDEigLYcVtU9FB1xngiY28QQIxjd2N+QG3GjUc/YbPCn+GqpVgABA
	S3njRNPE7AA2NLCeihdsje3PgohA6zNFnRt/e0ijQ6uutFuSWw+vmti3pRCEFKgBsW72wvM8b+K
	szWVyesinDUGBgvuEXzkILeZMH0RRRbwMjg9p8N8idZvQxBKSpQS8qP5p9jMYltdTrh3EQOJ5Z0
	gB5AmyPlPSGNjSO88018RF8xKfhZEpXudRAhzhdwLf/WgNQpKccI9BU=
X-Google-Smtp-Source: AGHT+IEx7fjFPOwJFBqQcxYwcNEjjXqC0n7A40gc7RBPd72Er1kad1UbyK8eNmLCNZzCP+fmYv0iMg==
X-Received: by 2002:a17:902:db01:b0:216:53fa:634f with SMTP id d9443c01a7336-22b42c44052mr47156885ad.48.1744292044230;
        Thu, 10 Apr 2025 06:34:04 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:34:03 -0700 (PDT)
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
Subject: [PATCH v1 3/6] phy: amlogic: phy-meson-axg-mipi-pcie-analog: Simplify error handling with dev_err_probe()
Date: Thu, 10 Apr 2025 19:03:18 +0530
Message-ID: <20250410133332.294556-4-linux.amoon@gmail.com>
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
 drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
index ae898f93f97b2..c0ba2852dbb8e 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
@@ -200,7 +200,6 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
 	struct phy_axg_mipi_pcie_analog_priv *priv;
 	struct device_node *np = dev->of_node, *parent_np;
 	struct regmap *map;
-	int ret;
 
 	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -219,12 +218,9 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
 	priv->regmap = map;
 
 	priv->phy = devm_phy_create(dev, np, &phy_axg_mipi_pcie_analog_ops);
-	if (IS_ERR(priv->phy)) {
-		ret = PTR_ERR(priv->phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to create PHY\n");
-		return ret;
-	}
+	if (IS_ERR(priv->phy))
+		return dev_err_probe(dev, PTR_ERR(priv->phy),
+				     "failed to create PHY\n");
 
 	phy_set_drvdata(priv->phy, priv);
 	dev_set_drvdata(dev, priv);
-- 
2.49.0

