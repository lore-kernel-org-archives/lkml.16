Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823D72F6FB3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481609; cv=none; b=pVVxS5g26d2sljOvPuZnRhL2spfpHz1RxsLZow82dkO3tyR7LvxcpQ11Brb8w+/ujV8mfP/8qEtz2yAo1RtwxzVeDetHpGxfRbUBAWb5DQniBUpix2k/eLkl31iKeJLn9kJsSKWqeTFaFhNz3jeWNqs1Hanf6o8i4YrfDtgD46Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481609; c=relaxed/simple;
	bh=F6mJ3voGjUkQtf+0vAv2Qcihci6oK1DMUpz/FxyVtPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4RC9Sg52r+6W5aLY5uTMDDfsmNwL17OPxlrrYuTy/3TBG+1ij3ZRWwPzbIsHpTrmhyt/GliLPwS66vFlxeHmUXMmWlAIZymxehSfICzW7kXmpiK263TY69AcKKGBcuSvSEUuVmdPEwxEEQ856yrHpJTK6gK6HN5r5tDZpcCDoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=ecBqhTYv; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="ecBqhTYv"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234b9dfb842so45450255ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 11:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481607; x=1752086407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbC/GH7strBGwb0IdiVA7md1jfacDKOVYkS3o8tcID0=;
        b=ecBqhTYv0hRooOBvI24/4iP/zgUK2IigwYvfFYISQFRMloFFOaQHLu0va/BSmYQgA+
         1TL6cbtR7PX3ubrW0AQUqOJGN+kieja0LvdoauASfFdYsX0LXn4Ty556aEtUxiwefdOp
         2kk+nvcF0TNNB7sQgDRsnI+vAyAE75IQI4zVvR9sYCEIKRlDRZ5EE0xu4wERBZisz0JA
         axhw7QLczIqIh5aSnS/dNCpSrvzu8OKZWxg5XIRb/ix4Qsw9a1XZShq99HmWiIxbldU1
         s4uTAqhECBVgFKBmNnGrky3yiMmjH0z53yaP1B0G6n11MLChfbyGG3ZqF5vsEcIpg2ua
         AlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481607; x=1752086407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbC/GH7strBGwb0IdiVA7md1jfacDKOVYkS3o8tcID0=;
        b=bE2ikN7PDyP62Eeeej5LoCG1Yi1WdjUdj4o/hQYf2LcD8pckOFUXWD93JM2F0AZId7
         v8iGdd+6jabXuayYYzCnY2VqbpkIH1XhiaLl869RxLaFOhfy+1n7uYhnnAxsnC2qXtxE
         fkOM8iwNYKv9el/Zx15Fpfg1cK9A4s46t2JmGVp0Vsnn6kyIiQW0z+JVbDOxMjG2Ch5J
         rpMIP6mmlaXNxyz9SrnDWxHW3lEtkV8aONIKqlbIvhzfmYfr0+RgZhEzwHDUWF9c2Ubr
         Ef8ydTIcvL/kGDuIEVOMTOwfhMA5nUtUInpuQMWTizVfwG6gX3mmJM4V3J4wwrC41DQC
         UXWg==
X-Forwarded-Encrypted: i=1; AJvYcCVNky6uwAZNmkZQWCz0sHyBzHPFS7JhxfEMZJwuB/g83B22wUxf6Hgc9y9w7vY6Qk/ouf5tibcU9I4Rc3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTork0u4utX7m8+NKc6O9suyiEqnMRuPBtjKxEor8TpGjl9k4r
	gYdoENyoq2aCOmjHfQHXD2FTX5f3Z+aBoKi3g79QlwVNXMe/fQaCVkGYuJd99oKOc3k=
X-Gm-Gg: ASbGncszzeHsuVEpYsi6YepnQVdcfqo0HAfmQ1FBoQud6i7ZT9psUPHrUf0Q7Z2w5IG
	B0+XWbRBSqYvqewFr6y+a/wRMwD0MClhi1/zzCmrPuTkCr9QL/rNi5ER/uP8EC5te665ZyDMpLs
	sJNPkKtsY7aDDoVuW1cVs0JDIqlFhdDktEMOBjQ20z/B9jB9d9ksKt5CYe1rzNcW6y08LLaL1Q8
	49tpodfel04y/9xPyYQmw7zw9RnrFRFJklvDx2ywubpGftBmbe0/kr16D/5Wbr/A/uTo97O2Hyd
	PF9vN0698fJS16Z5mdB+8hzWhG5fRk/lE9dVfK4PokykrCQCO+fdgRdpQnv9g7xOenNgUkeQeqz
	fQm/mJtppx9iEKpCr3u62u/I=
X-Google-Smtp-Source: AGHT+IFr57CoKx0dtGw3L8LbGIOnkIEZXLju9E0LUunBcEwcIBFNROCo+7NEiDnUKvwkV1U4hmG4cA==
X-Received: by 2002:a17:903:2f8a:b0:234:dd3f:80fd with SMTP id d9443c01a7336-23c6e4dbafcmr49910685ad.2.1751481606631;
        Wed, 02 Jul 2025 11:40:06 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:40:06 -0700 (PDT)
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
Subject: [PATCH v8 08/10] dma: xdmac: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:06 +0200
Message-ID: <20250702183856.1727275-9-robert.marko@sartura.hr>
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

LAN969x uses the Atmel XDMAC, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 3bc79f320540..05c7c7d9e5a4 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -110,7 +110,7 @@ config AT_HDMAC
 
 config AT_XDMAC
 	tristate "Atmel XDMA support"
-	depends on ARCH_AT91
+	depends on ARCH_MICROCHIP
 	select DMA_ENGINE
 	help
 	  Support the Atmel XDMA controller.
-- 
2.50.0

