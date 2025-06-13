Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED6D2E6D00
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814935; cv=none; b=o948ey8W8+wZiv0Ka/rOL/ZUDCovb6b7LFPT+v+RRO0jEv5eN2M6n2EVQb4VJcKGQZBClL95N86QaMJ70WTY2nqz1cSj0MZ1IQFR+a0FVt9PjzWBf9SLcP1oHRNfZjAy8R9Z6VgFQ52WZzFrQZ6nPBN/hHgJHasVGnKq93irxSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814935; c=relaxed/simple;
	bh=NeAtc85pNHGt2Bai6eksDz8QG2jTguYaO2Sb/fwRluw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InDXX4IedbE/R4OF41B7xYaIIca7PgL3kbdz4KiSUQA3R2ByguWrA8Tol7duu61ha2SbBJ49xxSpu7HZQxC/4/p5jZZl0XPy3y4BrtILar6F9kk2I0P61njmTuVrfp8a5V9Jc4cOgj8Xm3VnIhZ34NFubcKi+sqRGJhRK25Rd6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=rS089sCC; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="rS089sCC"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so24310671cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 04:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814932; x=1750419732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hP34e2q5Xb/n9epu9K3/GerhfTkPidCRzY+znM8yDWs=;
        b=rS089sCCi7q9xklN7ra53x1njs+9nCw8pf1r+Zu0GXeLIgkFtWC3a32IswDYXj7DAT
         bjiBjlsBhREhb/0VbNe6x+uC0vDQn+5bd/Wyc9f0THQTkUm2Y+ZmhfOGrWdqsuOiQKph
         cH22pL4cCUVl/90jYWSp+rrtB+QdqE3BzvXPIVs7c8xIWKygA63uV99M9CE1xntGRMOG
         9daASeLc4cH4AyAUofnGXi2EQRObXsITNqeK+gDSsYCpFLJcHzZ5wR0ET3fPqZ7EjaA3
         HFwkL/N39MH45MD8+KUoCQ1YgAi+tMjdrv+hhVBJsOV0GZElAyOp0Q0GGfcmvVebm3vG
         JojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814932; x=1750419732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hP34e2q5Xb/n9epu9K3/GerhfTkPidCRzY+znM8yDWs=;
        b=djSKssayXzZzn6byrprfo/czkQCG5YGfTA0c86L+/FD54slONHqpPfOPXnMY3BB+Pj
         T72hUX0X+OGeXHon+efsiZIYxgmZxvX6n6GrwoU/0W3uhScOo57EPK9xID6G20S3bAOO
         /etTi9WKjt51OdxDoke8VAME56OKUbcRaiO63YL2zJ3ZRN0GYLOQhc/PdHQuYDciFI73
         Occnq/IgMWfrf1psTHokgEzcB9+b0gLjBacDqLBpQ40NgFej6vkbnWYMrfidHx2Blw+h
         dZ7I0brwo8zFLe0yPM7+ANglz01Gh0VJfXATgOYrPgQFbXxfZy/wuJUiio/nbqKCeM11
         8hVg==
X-Forwarded-Encrypted: i=1; AJvYcCVVW4v3aj6PYTqP/Tjw04K/gGobx4L+xffToc3UCMWCGHsl7b98jre0gyi2qJrttpv8WqVatnMzMagaBUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3vvAFQ4eOkhLVPXUWysDVV18aQT2Q34XUIJIJY+23wTIfAfZd
	T3gSzN1FOf9zTXtVrUwBXhHeEvr9TxXGXKJg7WSSKOleA5dz8UOGmf5Nh71dRQzyn/I=
X-Gm-Gg: ASbGncs2y95Vrk5FHHxa0HrqrsPaPb6GF+6+MFqKLTzddlgWt7bTVw1nNRmcjcVf56A
	6csHaLPFRJjdvtBdJQM4vB8I7fVmCGFxIm1C3QMMthTLKfWEc00ygXVslMD+l8GDaKVcnB44orG
	oBSHV2cJMMEMI0ejqgFmLX+chzkiLVGsfU/kiRM505diakbLD8gBPT35Jl4QQM0CluRazKkC00c
	zVX90kUa2GBuLsVvzHLdN3IOD0kNPl4khEIzPIV7evJEU4jBtqx/u61YkczJP7Y7+jPeXsr17re
	GGIApMdtpoL1Vcnf5aiO8WmtGWg0p301l+f9h94vDAJ9XFInEKRymkE/MB7vQN2Q85ZMwFDdXZU
	gI6U/pD3C0hY5DzX0oEd86w==
X-Google-Smtp-Source: AGHT+IEvwSeOVrcJVMZPPA8Mgajhh3j4DaXHPn6mHw+5/rNyArLRJaLGgxD9f3JE53WDOm92ws1YcA==
X-Received: by 2002:a05:622a:4807:b0:494:a447:5bbb with SMTP id d75a77b69052e-4a72fec2119mr49140131cf.16.1749814931845;
        Fri, 13 Jun 2025 04:42:11 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:42:11 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 5/6] char: hw_random: atmel: make it selectable for ARCH_LAN969X
Date: Fri, 13 Jun 2025 13:39:40 +0200
Message-ID: <20250613114148.1943267-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses Atmel HWRNG driver, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/char/hw_random/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index c85827843447..8e1b4c515956 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -77,7 +77,7 @@ config HW_RANDOM_AIROHA
 
 config HW_RANDOM_ATMEL
 	tristate "Atmel Random Number Generator support"
-	depends on (ARCH_AT91 || COMPILE_TEST)
+	depends on (ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST)
 	default HW_RANDOM
 	help
 	  This driver provides kernel-side support for the Random Number
-- 
2.49.0

