Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26145217666
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481554; cv=none; b=bgR5E4EEiBmGqjRLolxt+KYtTB8OMbWZji3sklW2tx8aNhtT70s+ymEFB0e4kaLdvZysbdQM28m7iTbIiV3YqkXh6PlqjFt9/H/AWxG5d0thq9jnviyJuQ5lHKTUofxus2PZqsNDaNLl2uKIRPV1dorEITkDOwbLvAaAaQdro0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481554; c=relaxed/simple;
	bh=xCRs4dzrc6WcXYmCwUPWRARDoPNR6pE48wQDzbnDrFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T8ZvUOeGSKlwoXODe4JN1mRmPqEfSmklBCGHE7HdZZPO+yk1i47U6eh0P0zyFpMFCrOyyrDzzJlnXR8yr74CWnfqx+oGFPAbul1pCdtw6b6iLaxhDv2IqEs6dbH76NU/vs7wS2+3AgpqdE3Z81zW+j8LX3F1XtoprcAxpHLoVNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=rd1RwZ+5; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="rd1RwZ+5"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2350fc2591dso1776395ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 11:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481552; x=1752086352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0vokW/WVWIh/diYEqZYuuuvilgnskYyUw0dTfGNSpI=;
        b=rd1RwZ+5nubdEQxYyJFun87C00oSIIPar2SyPLa2/vR41WjfK5wDB9i1LDVOJDpgqF
         8mK9mxPgO5iLW9e81d87+vOykBOkJSpy5k4/eqbi8L6WlqU3ZpVUQToBsGfcbuVW53MR
         6m+g6CF3ijwp+YW7yc1A472ZsLTMAurLhw4fXlbLyrn3ZMKvAjlS3awXzBr9Y8qy+ys1
         J3mb8zyJv/tEcP1rp75BdLzpVC/urUFC6R2Wlgey/2IHxk2sarL33GYm5w55fyyzQbqO
         y2JPdIcPnxWB5UOYSMmDP0WDSsezjeOveo7nWLAxA1wJJ5JzuxQ81IQjOhix55O32dz6
         MXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481552; x=1752086352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0vokW/WVWIh/diYEqZYuuuvilgnskYyUw0dTfGNSpI=;
        b=kpgJOz5o1gwJSUqdFqTIewfH/m8kWTRLDZHupiz2fNASYRB3fBey7Ut0uk34ZfxRRb
         xfhoRsiyJ/gSS6CMQswOKjTto3KOUdC2Xm5pBcqUJL+BYz6ZdTQpmw1FjWJLuoDUv0d2
         1KR3UcBBnNKHHrIVWWbt60lNHPmFlVHhKk+u6og4GMplIwRYSoqZPDr1WKFpNXsyZZmM
         3BAN7NTscw1+PhajHatH45oqPdjdYx2lgsVFR+5/Vg9+7LYF37rC0N9q6WCcj/yfJl2K
         U/dppGfLnP/HwecLMQ90AlLWRtWR4KEc9O8iskNLgdfifrZo5as6/wPkcVKOTj4vrYV7
         LYCg==
X-Forwarded-Encrypted: i=1; AJvYcCUe41N2DMarqB1kR/zSbM5Eu9UmIrAD+DC3JITtx/gxFAlQp1H/GgfwrfV3/Oflz80ZbWNUQFsNy40/qlM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Gxo5rTfsqralYEDX+/j6uv4gWdWUTRVRqWdmTyv6RaWUieFN
	uR8Sr4yLCtpjhfaasavQg6DWaZquYiAmOLasRiuSER+lhoxYiswsLVTE7VDs3ZEqICk=
X-Gm-Gg: ASbGncuLqlknyI5pAeYFvTP7nPddjbz9DSUTALK6mB3sBkMpU5+QRUtakUlSqdxPj3c
	I9CPPo2IqJ5pfgxmrgrxNMCw4/YNAZBGBv22s++d/Uzd6MSW4/BqvJ1fYydRccBjY1kdKUjhAVn
	Oys/EqceLSZNBZgcn/c3xuXgSgcshqb4e57zFgijVyI9eckf/DumkHVjJghT6Ftn3d/FAVHpT1C
	2uet/Y7IbolN86Qn1Zlq1nGRh6w9UwJxFKsZC0QODCEI3WOcVNnwI2yPGc6BreIPZq/joQzAIWI
	dNHRh/+7eTZZdxOIVARXjYZ5ptISy/le3LAwLS5HShyT+FzpbkxxMF78NYcUce4Zdr/uyvIojfJ
	8//CMvaD4Zc4xXY0Scarg0Ng=
X-Google-Smtp-Source: AGHT+IGquOgZW20g+Jug5sdpx4963ZXWIcFE/S5pAht3IG0Kq6KeWcjOPzHMuBzGwiWByDwygshOwQ==
X-Received: by 2002:a17:903:1105:b0:235:f059:17de with SMTP id d9443c01a7336-23c793f0bc4mr7420165ad.15.1751481552430;
        Wed, 02 Jul 2025 11:39:12 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:11 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@armlinux.org.uk,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v8 00/10] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Wed,  2 Jul 2025 20:35:58 +0200
Message-ID: <20250702183856.1727275-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds basic support for Microchip LAN969x SoC.

It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
which allows to avoid the need to change dependencies of the drivers that
are shared for Microchip SoC-s in the future.

DTS and further driver will be added in follow-up series.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Move to using ARCH_MICROCHIP as suggested by Arnd
* Dropped any review tags due to changes

Robert Marko (10):
  arm64: Add config for Microchip SoC platforms
  ARM: at91: select ARCH_MICROCHIP
  arm64: lan969x: Add support for Microchip LAN969x SoC
  mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
  tty: serial: atmel: make it selectable for ARCH_MICROCHIP
  spi: atmel: make it selectable for ARCH_MICROCHIP
  i2c: at91: make it selectable for ARCH_MICROCHIP
  dma: xdmac: make it selectable for ARCH_MICROCHIP
  char: hw_random: atmel: make it selectable for ARCH_MICROCHIP
  crypto: atmel-aes: make it selectable for ARCH_MICROCHIP

 arch/arm/mach-at91/Kconfig     |  4 +++
 arch/arm64/Kconfig.platforms   | 49 ++++++++++++++++++++++++----------
 drivers/char/hw_random/Kconfig |  2 +-
 drivers/crypto/Kconfig         |  2 +-
 drivers/dma/Kconfig            |  2 +-
 drivers/i2c/busses/Kconfig     |  2 +-
 drivers/mfd/Kconfig            |  2 +-
 drivers/spi/Kconfig            |  2 +-
 drivers/tty/serial/Kconfig     |  2 +-
 9 files changed, 46 insertions(+), 21 deletions(-)

-- 
2.50.0

