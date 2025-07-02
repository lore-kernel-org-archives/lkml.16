Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B523315521
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481602; cv=none; b=R5MM7f9fS5eBD/valM5lRoNldZ1Mq1ypz0LQ+sIA88xHayFkD6l6wBPQoQsX/V0/kSaz4ood12Cdrn837H2JPQmeyA43CbiYv5XxQj2O8AppZTB9qaXXZJMTXmGXohcRZvlpf5bOdxPNTs5pOJr4mUlt5aTKnaNF59SQ/hQgbrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481602; c=relaxed/simple;
	bh=ufOVlqAt3uI1zr6bmRH+USzQKY4G3SQiQndGTVQ2HBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmHOnLCsALy8tPpN/9/JOh0rzEEpQc2DyWkE5AS4ZimpTH+zbjB/3qF2otFdIfnZPEUzg6VYMznquWQa/BvHz+28nM09+gl5k6D5uIIL1jsbnB27QKWiZdnEvi8mCcVVJGUWrY3wEdSV0NPcVse34iYjtqMZm87ItBW6+BbZby8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=WgWn0EPl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="WgWn0EPl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234c5b57557so48239715ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 11:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481600; x=1752086400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JBF3cwldevDNRr7SqXWBuHyX5mq5fUVy8++B9pNBuc=;
        b=WgWn0EPl4z9gSviEI9KEWNs4eztRqIE0YqYE8ajxkBtXvP3Wf0dGq6hnqL2G95//LY
         cpis32hI+BvVHFzMxWYvFqxhCvm90IA8ceAUBEEStj8fr0Qhoh5E2owuvpCeulrgCmAS
         zwsRsqtxi2kOVnTXmZgN53Tvei9GjOh6QYSOTjOK5pUOYU2jLGZujsXZBio26anN4Bhr
         1GwyzQwQ0vymmFyzaOD6AFnYJjpPd5iTduf6u68XBY8J1c8HJM55khjJ1ysW+AgV6bCk
         Jq9QFyMIeyC8mDdL2TgAzuq7Jb948wUtdxvyxN838xnWYYVx82Ru1LT4jHiJsYd1q0AZ
         zAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481600; x=1752086400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JBF3cwldevDNRr7SqXWBuHyX5mq5fUVy8++B9pNBuc=;
        b=CaUckgw74C43eR1rn4OreNoG/q1CyjYxdyZbUBck/Nri1ybFZHrATYYSUHZ3NBEBT/
         3FwhQ7Pa4VXxFmDh5Xmnj1y6tx3LZSfTBNljkjzKC4bOFgCJOIo6ZUvnAybJuj7nxY4t
         unlRSQHzHR364hjS/Wubq2pPlr1IubEdmQksMimzW4UtiRPTK2jg2aXkhn/ulkUy+a76
         n7fI2ZT3VHbXyYJFW2+i4lMwXhlTfU7t5wJdhPRlOfUSn7ClCYKzRia8NgyRlnytrJpS
         Q22ttSoFpidFWg4ZSpirmrrBQ70tCHLzshU+mcuJUkd1pBwu+d8iu85/SQTUPgJZgCwX
         S+vg==
X-Forwarded-Encrypted: i=1; AJvYcCWugbWrAnBdDr/EekdIAacmD0CPBOJZEexRJEmDC+UU+XcByJiMIsOpJu9i9+7ZPzVghrFf/xsue/4cA88=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUKJWEjt4G4NVau0YDfEkibCIHSHBIF8YVgkleoOUKEwA1678X
	syHuisy1wvmjNE1i+QM6hG4Acy/4gCsi5ZJOREWsh7+10n+reueHTcz7XzNOMvfl6HQ=
X-Gm-Gg: ASbGncsNtHcV0/KUlLXKDyUS9dJKThWmymVNrqRUkZTFzl+kF5WGqkBc9f3WSlxK9Cm
	BtsnK2roFaNvLkU0sgFRNjyqNJCEO6CqRbx+srnzuIb2IjuhLaYQojN1iIDc8tC864nw4YKiI6x
	cuPA1NEb2U2cPQ/CetBR5IdJwRDQFy9M3j4lPic1nS3P9QpG7ui14AB4l+K9PGrTk2/0UuP99UN
	1mQi+E9/daTbW4x1zr55+saxS3g1tEm41I4JxAJ+5sZrz6qElWmegd+rBKrR1eYCuw4XjHZz59Q
	qnaLlX3HHc87DRH0ID+iJU2oBrhGtJxRJ7FVSl/xnS5xXL0y0IvSnIIpwKsMrqFkbN6SwAxEVaj
	BHFG3bHEc6WDOvu2UyUzLClFXKevoXob4tA==
X-Google-Smtp-Source: AGHT+IHb5I71nz8YJIIhY789TZ8DXVSueuTS+Cp9Lta7fg4qamQr3ZvWLBc2y6VdIoWci5wbIzzqcQ==
X-Received: by 2002:a17:903:3204:b0:235:c9a7:d5fb with SMTP id d9443c01a7336-23c7965da40mr5474425ad.16.1751481599876;
        Wed, 02 Jul 2025 11:39:59 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:59 -0700 (PDT)
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
Subject: [PATCH v8 07/10] i2c: at91: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:05 +0200
Message-ID: <20250702183856.1727275-8-robert.marko@sartura.hr>
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

LAN969x uses the Atmel TWI I2C, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 0a4ecccd1851..0101529c80a9 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -414,7 +414,7 @@ config I2C_ASPEED
 
 config I2C_AT91
 	tristate "Atmel AT91 I2C Two-Wire interface (TWI)"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	help
 	  This supports the use of the I2C interface on Atmel AT91
 	  processors.
-- 
2.50.0

