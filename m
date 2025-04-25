Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6831BD9D0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608813; cv=none; b=WeyXUbhmW70+4NQNIpuUu/tRsNMUHdQgv6tSGH5rRCrqs6ycBFMdIrtpEQvx7AizHvzjp4X2FFJVXeFTjT0Sz2DzoNB0DAKI6MyWWHCtjXEmFoYhuAcrNL+NAYDd5/8ii2dGFIJ7NqzgMHSfX+5JDDNIlrDu3JFQBjy2PS1lt8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608813; c=relaxed/simple;
	bh=UizIfOXDw7K3bISuywDn5DUtvUYwR+8wO0LDq5X4GLo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rzWafynvHiL8YcBfjulRui74EeMbzTkDc8Hxhw+jXFa6tVHaDfcDSn/EWbL7Z902A4StFxTf+gpqOsHh4EzChWKrk6B1qQgroV2BkLYMpirenMY/OM7nYS6NR5xwnV1AYJBbuPiEkBR6tbYDqKja+U6bvqBQrLUxkl5k4TaJxzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=AsIHlZ1j; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="AsIHlZ1j"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4768f90bf36so31125151cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1745608810; x=1746213610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tSiF7FhF0tHfOGpGfJXsH5sp5D81/QkR5l4lerbklaI=;
        b=AsIHlZ1jE5XQ8lJtsA313Q074M4NzIfxw6H6ZZ8/PkiY0qA1wrf4Wu63nT67La4+IS
         DI/452ay1qr6ra4NJBMe9TwWgrQ44uvzFdH2uOBqmmXFN3xuFmX4NFXnSGCqYslfTrkq
         M0n4v6bXEjgsqpcGn/JvAL8zSAjwxRd4t1cU0kviDwuKiQpKokpGYqLZ0QGFhR4kPPJ3
         pZqVt3sHDgVINVQ097OrkMNuiE3M0WxtxIFKKtk0gPwKDLEV3vPT3Iqjiq38iQOr0ajX
         paxSqEaSxPZ8iLOTA1OyJ4EJRkjLyNu8UnC/7lHctpugoHQEb5NYFT2Fw7vI4Hroh8o4
         jJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745608810; x=1746213610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSiF7FhF0tHfOGpGfJXsH5sp5D81/QkR5l4lerbklaI=;
        b=hGzfKqXgOb8wqxJ3MYFDrgSmN0+fJ8MIjMp8BWxNxYYwcG1Iu1XMs1gSAlk+yKyUvZ
         x+nwQPQ3rei6Xe5QicyGSDoxBA+MAi2P6sMXQ85jlsLDxmEBEFuCZVdYn/IamodR0hiv
         UaPJg7JBu6OYweTwQvEeySIcs0gfhKlycl2jkS0yVOIxLRq/U1P30dumYdYK3YONfBuU
         FCp1rF9fOGXWVo9511Gem4AqaaI/c3Cx22q5QAkJSjdY+gF917qw7L7jGr59SZMKFPzS
         SXwxgX2/iUhNAMLevHNlpEtsLqpDx1/9KJ+RAGEkKjPdpyZgTuQbosnSEhFHvatBmNeB
         CfDA==
X-Forwarded-Encrypted: i=1; AJvYcCXHmqz8hivxmtCLe2KrqgqeZYgzzXWnqwg/5SikJHGPWLfZiG+STzcg1Fh7d9JZLW5RAsZECGDEUUGsNl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEaJIQKXEDnTZ8PwoDK6uiy4KEUqxiI8LkQWyFz0gDptloxL/r
	MRYEURDD9tUilHM6DRzsO1mz9UnUcu83xwogk8nmZ6B2I242HU2t9FBqU8rZxA==
X-Gm-Gg: ASbGncuC1EDgU79XZIlDE/gztUafUAgGc8gznpa49Xjxhi9RIE62WV0QJF0tpsd0kfl
	/JQtSFHswszGDgd5xNaRzfqXJjFoWjhaRYn/iw3Rk80h2yv/26pL72Siwk0+ycYv1fR03Vp28tA
	zZ7CnDgc9IPAlCMpudvtxSZlbUI0BmSqdRUcGxFDVor82WSyZTDOFtPXfvE5veAmES9fm/eiEVV
	+Yvd7Ar+7ludaV1gwEQG3d/4UaDIUk2twX4SUcoTf4DasbxuddxAo+0nKa6By3q44y067twotXC
	DKaKRB/zDIeixxo9edsz8E0mVjpMmwXg72gY
X-Google-Smtp-Source: AGHT+IGY/FeexPuDpgYb8JxPjPFvAGcEWUmeISWIErTY/veMEqRNOKkQikr2E7yj9IXljqqh0c90qg==
X-Received: by 2002:ac8:7d4c:0:b0:476:a895:7e87 with SMTP id d75a77b69052e-481335610c0mr7228001cf.48.1745608810494;
        Fri, 25 Apr 2025 12:20:10 -0700 (PDT)
Received: from localhost ([2607:fb91:bdd9:47ad:b39:2164:cbe2:1695])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f1cc02esm29045181cf.30.2025.04.25.12.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:20:10 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christian Hewitt <christianshewitt@gmail.com>,
	stable@vger.kernel.org,
	Da Xue <da@libre.computer>
Subject: [PATCH v3] net: mdio: mux-meson-gxl: set reversed bit when using internal phy
Date: Fri, 25 Apr 2025 15:20:09 -0400
Message-Id: <20250425192009.1439508-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This bit is necessary to receive packets from the internal PHY.
Without this bit set, no activity occurs on the interface.

Normally u-boot sets this bit, but if u-boot is compiled without
net support, the interface will be up but without any activity.

The vendor SDK sets this bit along with the PHY_ID bits.

Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support");
Signed-off-by: Da Xue <da@libre.computer>
---
Changes since v2:
* Rename REG2_RESERVED_28 to REG2_REVERSED

Link to v2:
https://patchwork.kernel.org/project/linux-amlogic/patch/20250331074420.3443748-1-christianshewitt@gmail.com/
---
 drivers/net/mdio/mdio-mux-meson-gxl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mdio/mdio-mux-meson-gxl.c b/drivers/net/mdio/mdio-mux-meson-gxl.c
index 00c66240136b..3dd12a8c8b03 100644
--- a/drivers/net/mdio/mdio-mux-meson-gxl.c
+++ b/drivers/net/mdio/mdio-mux-meson-gxl.c
@@ -17,6 +17,7 @@
 #define  REG2_LEDACT		GENMASK(23, 22)
 #define  REG2_LEDLINK		GENMASK(25, 24)
 #define  REG2_DIV4SEL		BIT(27)
+#define  REG2_REVERSED		BIT(28)
 #define  REG2_ADCBYPASS		BIT(30)
 #define  REG2_CLKINSEL		BIT(31)
 #define ETH_REG3		0x4
@@ -65,7 +66,7 @@ static void gxl_enable_internal_mdio(struct gxl_mdio_mux *priv)
 	 * The only constraint is that it must match the one in
 	 * drivers/net/phy/meson-gxl.c to properly match the PHY.
 	 */
-	writel(FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
+	writel(REG2_REVERSED | FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
 	       priv->regs + ETH_REG2);
 
 	/* Enable the internal phy */
-- 
2.39.5

