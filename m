Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD472E1748
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814935; cv=none; b=lQg5tddhdjjF9eL04W6lDHdCCxqfcKbcrcrkhnewRZnX3av1Yi63u3O4Z/OKi9FbkIYrY0oyhmH+QgcPshSNavnyOVqGSNLFPSJzRAjP3ozsXQjwvoY0TdRCPcnUo91bLh14gxAcOY78brbgJDz+VdVeskuNpAuu5ccz2QrAxJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814935; c=relaxed/simple;
	bh=Nl0M0mtMMwH3HQiDa6E6C3fv9pPm34SWpTCcbO9Pcds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a3BDeCkWBEziVtHzt1eBIFBu7S9rDyLQqR9Ysnmv4Ho2Y8OSOk4FtwBNJImRNFCDqU+JvthzNuxgcgxzOgn3Ubl5DY1flfWiXQRvslUXVenCRxv+E5vROYvHmSgrmzuYzao2avKkBLm7ycWqk/p0jRRebAIMEBBvEY081ZCX5Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Ofnb+lhI; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Ofnb+lhI"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-735a6faec9eso1271782a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 04:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814933; x=1750419733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE5/rsY41g/vAp/0hcg6OhOgOrChXE3RFe9mIYZZ5WM=;
        b=Ofnb+lhIf2jsLbu4iZbv3MT92O7BrgUojfbvJnuy2ELPcjXEMVu8dZITvTOHyCnUHK
         2i0IfkebismxHMAE8SlfxWeb8JhQ9zJnl5eH7/m+9q59gjI/6J7wOgIBK+7yO4+DYh4U
         oMAMermLFqQ1q4OpVMc+3DOOWtwJLhq5Vn+9jQ5nKG/l4yapQKX4xmZ/+vXIZ7yTl17E
         rskwXSlhdMonWX4ujTorUvH7sIZ/BSILk2yNsNDCbSEZwvN3o7oAWFjpYeaDRAr3VvuL
         AclmRjRnK8kk42jq/CChVHXxmjR7IyxDg1LTR6i6l7c8RkaEE+j9ruANq2SNLx7VnbRV
         jUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814933; x=1750419733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PE5/rsY41g/vAp/0hcg6OhOgOrChXE3RFe9mIYZZ5WM=;
        b=wmWkR8vbSN3EHAPVZtkQuRRii/RnW3IzmXjz+VaDK61BZ6E+FKf2RfC3jBFpw8iIyk
         20WEgsZlulaG/9deCxBthuGT4K43kNHYnvhGoIMCG408U2NRRFDRJ92bmLyfcX+Gk2JK
         8cRR+vgc+2qZdRbu1mNsAyFFRX02rFQOhdDE0ZiIssUjacMej7AUH59aOlQj4RGMWKH4
         tV++/rC7Dq4H0o4b32OhFzkq4QOOBdUloQV0r0chZ8QyqndQenLV6uZVRHZlU7rG3c1I
         DBhO+YsmRhuQf/+QxXL2M+/hiaA2KnNPKnKVmSKWmMLWOZBiG1TEM532lH/4HPXvUGdM
         C28g==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8qEv5QTrjwzzNeuXXRHdO44yoe6fzFKtFSBMYa6tIs1FwTj5i/20iJsHGD2fZ4vF+6kS7KSRjvVsDXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH14Ur6Gzzr3yYWYLj4Ducs+ScHjAerDH/aNEomzjrdp8r67hu
	54J45OkXu7Ak62i+4x3w4phApd4XE1MyS+4GYPyoERc1Xjc1sSPyl3K0rUd3qERhSDhFVrT7d1h
	xEUMf
X-Gm-Gg: ASbGncsQ/RVV5enoFddpOmKM4FbYlbKte3l3oS7DYzMl3P/9A3m5G/9Rd1Nl5HwLbLW
	XCyRMpm0XMjVIaZNCSOC27A13/Hd7+Ng4fLDPhk4PYpRlh45klGcnj9W1UlhSqSiMRM3n/6RmVG
	q4XeCmayWqgsp5kZ5/WVHfUE0S4/4Lfq4pEhQMPl8KdAPql2P9QSEapyBsok/svwCCqMIkZkzGc
	65tSfKwfN9p/J2A7B+YEVrjCgIUXB6FaxLnl723ZXLyBn/Z4Tej4LH15VFSBQJrKMHug7MBy+Im
	emWc8nn8JR9BTA8vrAwShKXq+qGgUGszMAuzRdjFU8jnApHn+EVS44HcZJWnDFV0wZOQLItBS1V
	Gv9mtIgPEZwza4yKS7ZBmVQ==
X-Google-Smtp-Source: AGHT+IF3wVYZI/s3wM1PNe5izmwye5C2dxIzh460VAl75DrcM6tXXLw5OFqnGApeHtjQqkaMBAsXNA==
X-Received: by 2002:ad4:5ce1:0:b0:6fa:eaf9:89f1 with SMTP id 6a1803df08f44-6fb3e685f23mr33483696d6.44.1749814921454;
        Fri, 13 Jun 2025 04:42:01 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:42:01 -0700 (PDT)
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
Subject: [PATCH v7 2/6] spi: atmel: make it selectable for ARCH_LAN969X
Date: Fri, 13 Jun 2025 13:39:37 +0200
Message-ID: <20250613114148.1943267-3-robert.marko@sartura.hr>
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

LAN969x uses the Atmel SPI, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/spi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 60eb65c927b1..3b0ee0f6cb6a 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -145,7 +145,7 @@ config SPI_ASPEED_SMC
 
 config SPI_ATMEL
 	tristate "Atmel SPI Controller"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
 	depends on OF
 	help
 	  This selects a driver for the Atmel SPI Controller, present on
-- 
2.49.0

