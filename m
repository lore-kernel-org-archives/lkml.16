Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3E92F7CE3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481622; cv=none; b=EQL3iztmQuA9fCOJB2xbr985PEcVEEwstoDhb/n5ij979kB5deAk3ikA+r8hBAI96KImLokEnOIFW5YCH6rhJkHUfEsERDIx5J9Zng1HZxVMYyPCHCDl1H6uBlTjXLYC8D2PrkcJrGDkwsGHXXg5r8/wng9OFDgjeFWSG73MkoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481622; c=relaxed/simple;
	bh=uR10k/MNsD2KTqxwxNLmNVi+dmMLfNBNQQvEqJsmDa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5yfVrqOpoJLvDvxAokKF8p1+vsq5YJ72yRp3b+asRU8r7KkIaX5+jOEUinnZu+WlQx8yrriSfYUG/pQN4CeC7CK2V8uCFFRDW1KpAsWM0BDdoqrTGO+3fotLfCAE0vb0VPC+GT7pPirk8K7WgtS15qd+aRRVe/9TdrFIAhdFEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=bpKlO2zr; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="bpKlO2zr"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2350b1b9129so32529075ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481620; x=1752086420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbnTNMFdG2kGnp4zBFs5MgPMup5zL0Zfe8VUfuWUBv8=;
        b=bpKlO2zreZ4Dw49+XpbddUTu/s8vYAQrprCuWs4FMzPVmKsaPdOuGCsWR7P1CqUmbg
         aQXF8g30FFZD5HNZyapB4pHSUbOyYpShNABIOSJeF7xGeUWbj4AX/3ZV1HDR54SHW6Rb
         Z3I2jzQ9kzZ7gNPHpWswVYvPn+vp4X6sGWtxGhoDSfhtEvRs+TdGQdFYGEl399uTOuM9
         q4F0gD+M1bd1ywcOJgEP3AkYT573RvKvzsJjjUXed9oHnxqOHG3qpQ6WfelMU9UwhLBc
         5m0gvn/DJ+suKGPTJMvaf7teqS/TEBabuLP2Y/uTeE7cMjkuNPOo6sGA8HYDgDcceTdF
         kQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481620; x=1752086420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbnTNMFdG2kGnp4zBFs5MgPMup5zL0Zfe8VUfuWUBv8=;
        b=gHJN5SGJBYrrW9PpYGwqj9QtsUbfwm+M5oRm8JXn14xQ05xwAfAvxPOrpnao/PIXoi
         +Y6FiraFWI1WrYrmM+b3/b6mq5lh08NZSBZ4Tch7tRdA/54RI4P5QL0KJJl8Z4K6zCP0
         QY2ZNSCvauEQk8eQMQ6jsxoIoFbxjsr2n91tsgkoH79gNYsJxT+p3vTf6KsNylTr+c28
         lFRzztybqG2+DXZt4SDxrn0PhNmQF4vhRAGfdiuuJU9Fcba7dKHHOajR+lOvSpGlyFSq
         NEoKMY3iOt7p82xp/XGJgJIZCy6/Yhs9dm/kSNvdvXsBBrZs0HMIvhg56S8p/vErb/zg
         7Zdg==
X-Forwarded-Encrypted: i=1; AJvYcCUHJvzIGQIQwt7BNm4NGDrmXbt2sY6cbFiIXl9EahfwcqOFwND5JjDhSDxLo7/QrMTacbrTxbODmLRreqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOAZ3Bt+Xoh9xHb08mOZKAs7tM0K0VjHiEi1m4/oZPBJuvl7jB
	mOODeFqSCRba9eiZW+Yot34iqaX2ICyLVpQHHnNiIfg4PNYUKx8Khakg0+HHckhp7L4=
X-Gm-Gg: ASbGncszNnljGEWn31JW85acwEFVC72rfpUfr7246BqLrSGSCj84pFgE4WXqcV0le9a
	Gk0cPTezEIVZJJNlSV3AEPeu+6F/8Qrb+Va2VQem2q881dVpHaKqsh7gDuIVFxHkKxsRc0aEuOG
	niF5cPB8mTfyTaF37si40OOobFOIsr44TjERRk0w+vX5oUFVR08z6/n2qQdJu/TjxhJQPPlBMeB
	C4sbxG/SDHZsoNp7d3+71A7/ZkC0YfyTsFVrtQDXrjdGaN8sHvb9d5azlkBGLpKOXfOp8GF08Q1
	4JytkG+GBrxqMM9e0JLKgF9cieNm7T6WtSX71qoNDJeoZRHMMcApHBKmbiOOPuQfp0FMnZKrfmQ
	aTiRHRWClzzJUY/OTgdZVIlQ=
X-Google-Smtp-Source: AGHT+IG4Ha6X6nXWuDRiiAtD/IybzMavhr6X2melJ3MACMJlG77wfbwOcD6VvpmvkGPoSxTpUxzwhg==
X-Received: by 2002:a17:902:e751:b0:235:2403:77c7 with SMTP id d9443c01a7336-23c797b92e4mr4443315ad.37.1751481620268;
        Wed, 02 Jul 2025 11:40:20 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:40:19 -0700 (PDT)
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
Subject: [PATCH v8 10/10] crypto: atmel-aes: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:08 +0200
Message-ID: <20250702183856.1727275-11-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the Atmel crypto, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 04b4c43b6bae..7c1717c35b76 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -439,7 +439,7 @@ config CRYPTO_DEV_ATMEL_AUTHENC
 
 config CRYPTO_DEV_ATMEL_AES
 	tristate "Support for Atmel AES hw accelerator"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	select CRYPTO_AES
 	select CRYPTO_AEAD
 	select CRYPTO_SKCIPHER
-- 
2.50.0

