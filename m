Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064CE28A408
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292035; cv=none; b=Ph9W524zPnBzN27HCueyRBECoXCdqdxU94slq+uh8tzPcaoNnZ5sFkRUIjwNaWDdSIm9Twwkc1SetTIAGilE4PQ579LR/q5JEZKTsx5HxpciP2H4AUe9LjWgN3smymyZeso/Efsun0yymiE1xLlcWQouFPX2HT+HRxrUhn6FVmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292035; c=relaxed/simple;
	bh=rdXMxe9MlhtGiGrgNonK4THtQrdCLGpl7emzvcpnyoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VL2ejV1+ZG3GdUdXuwbAlRtOxVoy43HNgmwF4E3TAA6Fic9BMoasTE4kwqs2EBA6Yr80d8XBVPk/GOE4Xyf6hEfuXeoG5sBaenYDnQUcQZJR2A/07T9SPR4PyyMMHLEcN4NZDmYyrMEQPftPa+p/++RVIXne+drgyD/Os9+zSSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ls/OebOw; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ls/OebOw"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2254e0b4b79so10488525ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292033; x=1744896833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nh0VanLTR8k7JGV4ABz+/PnmlXleZHArR9ROXTfckbg=;
        b=ls/OebOw6P4RDf6gw/517J5cbesAcDraLMJmZ+nd/B2lZoxjlNXbXDiY6rp/pOnJfW
         paJqi6hJAUfAwRAWkVNO9ygFw5BvTD0m7cWaixIcm3FOifOojsCQXprdnOlNSntANi2v
         y3Jm7sgTxXIKMwnDk2A2tTPeXh7wAIqT6dYuNqbz9xnSf/IfqvjAVjJlt81vWgy9JwnC
         twumPvwXb2RYjfXOMMdcKeVZ2dRi2fB2l5OJkZBqYbCeAVkoLqdSPU90I4L27qB3n+ME
         YHsTDwOEMAcik6AWnz9lqS6j8Um4xhF/djFZ/ifeAsflIpJMSOBtd5SZOHceu890cfR2
         RJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292033; x=1744896833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nh0VanLTR8k7JGV4ABz+/PnmlXleZHArR9ROXTfckbg=;
        b=YhRkqXo9ThExUWaoK8Z1BqVQtqJ91FnPEN80mDqMOdDWiFSAGOemtwNYsoEWk/XcGN
         n0GF+zs0rudLLMdtND8BWs1XJTGl0hrAckTxpYwtm9jZ0vOnRTnCKEyvEMMbinVDCulJ
         Kq05ux2/JNMIfBzxozmzA+HMyX9qjZGEOfdh2Nb9ucJFAJpY+woYHGCBk4M8IdGVY+WU
         yiSea55P4otRqPl/HwjbmTD6AnKKs8qnJtGBgXyU6N75W0++9SgzJ9Bjh5QuWmso+5OI
         FTpf5H1KReRukENwhNfP1BasSSbKhY9FiIpl0Wuu9JBJW4oTVATO77psECZxxpb4m0/M
         9Xzw==
X-Forwarded-Encrypted: i=1; AJvYcCUeTp1/loruQlw2pO49A8wU4OP6pdd48u/duXLwB3nrvaO4KlX+ACfHPZoHkRF5aUlsEgf2byTN6GpTLlo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy17OQPBq8S+BopePBPIA0c/S3Z6jvyYWXxBjvZAR+pBiLQkDB+
	L1O61iRPnxNtBTbYQ/7rYWTzShyGTwzhpEuNOIHNbZlh20FRdnGo
X-Gm-Gg: ASbGncuxfmFRZPIK8o6iIRWFLcEqsfvz665gpSW8W6LSBIcmJUV2+sJyvVFljBIDw/W
	Wy5wqQhwdLp0szVVs7tj2eMYiH5gtM+Nz4vBp18KPFAgy95JrKvbMzEtgkCzGHMFKM1bl4RM6Yo
	HpV8sxu9WiTF9nRF81OBgtvOa/Htz/65CH5j4ysQ9tS3zM9cZfVPDcF33hH5GN4vOMWQ8owRzPp
	m27Sv6kDwSTJ5ci2oYjomEicP55tZLGg/vaeSoTkwNWLya/dJvXQSsmEA0BcheeMUL+KYt71jcB
	aMhHbIHfghx3lSHkUYEOuKv2tfkjdusAmLKAtnDkvqpBArbCU8bHkWA=
X-Google-Smtp-Source: AGHT+IEhJosZc1PPq47EzJpgLKAV0sW8OUksWP/T0By+TlgLPTsHhEsBRkYklsNnL3vMaEPTFuyMZg==
X-Received: by 2002:a17:902:f686:b0:220:e655:d77 with SMTP id d9443c01a7336-22be03cf8d3mr28766255ad.36.1744292033274;
        Thu, 10 Apr 2025 06:33:53 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:33:52 -0700 (PDT)
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
Subject: [PATCH v1 1/6] phy: amlogic: phy-meson-gxl-usb2: Simplify error handling with dev_err_probe()
Date: Thu, 10 Apr 2025 19:03:16 +0530
Message-ID: <20250410133332.294556-2-linux.amoon@gmail.com>
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
 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 14ea89927ab14..6b390304f723c 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -237,7 +237,6 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
 	struct phy_meson_gxl_usb2_priv *priv;
 	struct phy *phy;
 	void __iomem *base;
-	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -266,13 +265,9 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->reset);
 
 	phy = devm_phy_create(dev, NULL, &phy_meson_gxl_usb2_ops);
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

