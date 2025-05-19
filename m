Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE7E269CE4
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642864; cv=none; b=U5XSLypN/PHZ22cfEHqEZWgU0kv4lg/CTdmbsRagvHkXToBb5Om367G+3tKUMgWgYUrjkJdfPPiIhZtIPCHFkAxCEPPTl9CJuTEJQ7ZBsTipGCk4vOCc5Yzn3Mr38HGgZrgfg3NtgAdU9J5mDiRhnVUh6WFn3CNzZHbjWZRopvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642864; c=relaxed/simple;
	bh=jSeqdWl1GwCYu7ApC/CsdSOboMo1BfT/Qan01LPNn0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WRcmzUgw8B3IiY3qqdKPnhFArxgJlRSkoGChA/NBW7yr0qoKidX+L3oSkyxNkUenHYyvegCEyPoZUzjGX+G4DpaM9b+1+Fu+Gm+xJcfA4FVltfwDZ+JV3d0weXK2ezKktDHy9QRZAmq49mXo4bfjPiTxT4GNO3KeSml6I37Ve0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Jjtz3w8k; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Jjtz3w8k"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so23141745e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747642859; x=1748247659; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t/k62NGDDYYiEZcY3g4rv/NbFRxjHY8ftixszCG/oSM=;
        b=Jjtz3w8kYh2wtBvCdhKcPt2N1TU7oVzvgLndZTfCeq3pr6RflvHyaCFATyPhg1tQLC
         HcSiOr+N+1YU/dNB7FEzVxE2i3CD169PZ2eijatqKjBCgqL5DCihON2Y/a69cuSBB897
         TK89kwbCJDPmBZdvO8SRi6foz0CwlM2C9azErGHFTmRhG1BnKDO5xM5igzHj6eq6mlqo
         Hy4F7OWijZkDD7sxpkRcJpUg3S0sj9kKlx8Qlbt7RIgQfsL73XO34bnLc+XY4j3vbNAc
         7j652USlwzPkFA3htXi0CYCzKdILGUbdr74kKysjbcQRlh0CXhJl4ObaV+jFxI+TcXIn
         43xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642859; x=1748247659;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/k62NGDDYYiEZcY3g4rv/NbFRxjHY8ftixszCG/oSM=;
        b=tChG95DMGXOgauCtBfvsf195BiRUF1kH5VYWbOg/bhXaDRxAGVN/qSh/NKruFtEa7e
         QcpktdNhuSaljXCSE8G1hOh0+gd9HC9v8duMIQkn3fwQU99I9nM2+XS6UAM3BRhLQfeY
         miTpHOTjPEb5+1XazfaU35vr0rVMqkEThwROTaitmqW2DcvwgI46ZnX1t3uFRaKe7y54
         W+CyOA6pfgZQp7D/W+Cv9bfDOp8dFqxeROERDtuq0uknNL2J5dXECa1NEsO4265SYs9S
         gFFZmYGTnFattSr6cTMKw+hxV5q9IsCXi19iHRHnRx5rc2tZYIk8XYq+U3Ry+9L2Ud1j
         GLOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZboJvdCAQo7JnBdZGcwIue5hFXG7CNfSGA0dOFcm3++HMeWg3JkEbWtIcVHY06X9mS/KrfaAWNDntkCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7FrSpj9yX5oMIL/Up38nJVBAu+gNcZzsJSVPMWGuj/YoN7K3h
	3i8XwEZmi34iKSW1F+CShHxedTRmR7iU0QEbrSSnFA2VneUsboVdJooeWlGjWnh+/5k=
X-Gm-Gg: ASbGncs48ErTNJrLQ6LKxn22d5Tel3e/7fB1Pacge/XrTnjLHZ50sIuoCqtWLL/uO03
	CLnuh/pxRMFwKa4WvJ/9+OkGT8RGFrtDm/Cc97f9iR0QZh7iG0izE9rj8a+emEcAyW+neYxKIe1
	2Z4RyS+fQfUiJz40CXG7PAzSKJs6Z9nB5nbIXQHdfuXNejBRj5UjLciYu6qirJfpUUIZC42IjMx
	Qf9jnU6sZQp26zc9qof32WdgrslGd5YrfwoKq3XwQibgCZvR47ttzDQOtab+AorXJ+E8BXez8ZS
	wsOkPib0F1tAKRP2OlJd1Bx5vlyCI/IN76r2N7lqBH+Uy6U5Xi1sC9U=
X-Google-Smtp-Source: AGHT+IFGzPPtx3PF8r11/vjc9a7/gcX2mANQelOTEbdI5fy6+2ZiOLqEmQuRVs3+LIEHWfWk7aen0w==
X-Received: by 2002:a05:600c:628d:b0:441:d438:159d with SMTP id 5b1f17b1804b1-442fd60cee6mr100229085e9.6.1747642859405;
        Mon, 19 May 2025 01:20:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:9e23:ebb5:83ee:38e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd50eda6sm127139875e9.13.2025.05.19.01.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:20:59 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Mon, 19 May 2025 10:20:56 +0200
Subject: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOfpKmgC/2XMSw7CIBSF4a00dyyGR1tbR+7DdADIbW9UMGCIT
 cPexU4d/icn3wbJRXIJzs0G0WVKFHwNeWjALtrPjtGtNkguO97xlt1t8Egz6wcUakSDSp2gvl/
 RIX126TrVXii9Q1x3OIvf+m9kwQTThkvRY4t6HC5Grw8y0R1teMJUSvkCb6YuMKEAAAA=
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nishanth Menon <nm@ti.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1

After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
select on ARCH_K3 are not needed anymore.
Select MAILBOX by default is not needed anymore[3],
PM_GENERIC_DOMAIN if PM was enabled by default so not needed.

Remove it and give possibility to enable this driver in modules.

[1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
[2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
[3] https://lore.kernel.org/all/20250507135213.g6li6ufp3cosxoys@stinging/

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
Changes in v2:
- Remove some other config after comment from Nishanth. 
- Link to v1: https://lore.kernel.org/r/20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com
---
 arch/arm64/Kconfig.platforms | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..bf9e3d76b4c0 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -135,11 +135,7 @@ config ARCH_SPARX5
 
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
-	select PM_GENERIC_DOMAINS if PM
-	select MAILBOX
 	select SOC_TI
-	select TI_MESSAGE_MANAGER
-	select TI_SCI_PROTOCOL
 	select TI_K3_SOCINFO
 	help
 	  This enables support for Texas Instruments' K3 multicore SoC

---
base-commit: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
change-id: 20250504-kconfig-68f139fbf337

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>

