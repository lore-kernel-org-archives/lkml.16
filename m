Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80261A2398;
	Sun,  6 Jul 2025 04:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751775856; cv=none; b=G8mM2Lyl5oqDfd6Bzx1saWx0mHiLK3LSk149WvI7YFd1CDLUWEruZxMAvkvdjmz9s/bUOlhAKTWOj/gd3lC1lTIuO6PGPIZPTTf03amCcrSrBubokJJGCfIDcr1o4+yUrpvIUxV7qb37omk/tntbr4Eplhlaj8wfTuytKRPymSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751775856; c=relaxed/simple;
	bh=ilbqnZF8TuVnAN3y3GWH2VfNDKZe9e3nRHgSDeYTZKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGp9Yx5INwGwPQptgQbVm2m/hbCJqpyrRcMigDkin4q6YE5msoRsbuoT6Kz8BEQ5pnjX5nrhRzFr9V7mL4xeSKK4IX84hbrXWLhd7Oh2TXvyEjpnVjXrigjxCm3nM/ADL+mOB/4dYSlGF4NV2EK/44P8gUfhae5yv/ZHw14OE8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJurcbq+; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJurcbq+"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7490acf57b9so1474336b3a.2;
        Sat, 05 Jul 2025 21:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775854; x=1752380654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/nsEzkMIZE8SZ9hqeEaMWmjFodhjCqtmCwZs7Lm9Pk=;
        b=BJurcbq+INdeIcbmuwUL0IdRssGxJRqu4r6jilS6yAE6xx5qrw15TqF6X8K6yecTe5
         rhAHc9ycJwJsvJ6btKMBx7N5fVVX70HIe2YlE9B3S7/p/hwlvhJoNFt/RytmfC07CZim
         jbXmYL0u7jEUufT2W7Rc2USe4SA75zjAZQPjg4qIgBEqbNrQLFYr/33RTGP4lDxyVePE
         VKXckhJRKQg2VTJjtfXFUkWeDMfb/h5SYyHZevKoyq0jdBhsAnI8v7EJZ6H1Hb2OJFcZ
         fOvZoedKrdxplAWh6EpvtI7IPPxnrbN46h1+dW0HZED8BPFmW3uZ1NoFyxNGAo1GyVE2
         KA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775854; x=1752380654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/nsEzkMIZE8SZ9hqeEaMWmjFodhjCqtmCwZs7Lm9Pk=;
        b=Du9QZmWxuyd3YtB5XY/qnRlZtr2KQQeOfSZ47o8aHxHeJL+17oo7qsDQexDP7FWZVi
         V9RwJcTZKxvg+hkVHjjGN5U+SnCOVZy6TsuJw4+nlQJHJLqOesXfK/ahQjSTUnpZmbNP
         9wHPNqff6bVz0EB8ElykjZSRnfwZ2xehY/kIwgrPHuu/gVtglhx0RuvSYOe89xr/X78w
         7/qmVqdoHXopbqrBUyLqUC00OKpyUc6uGs90GM8I0/Dr7kpUjmHTwDzaFPPFS+8SqwD5
         WEJ5xZ1iz7xu2keWq8OE1TmJkAIsQXatXj8qTIzGp18pNivF7Z2kSChstsLuaA2Lp564
         LnOg==
X-Forwarded-Encrypted: i=1; AJvYcCUAfW6ibpQ3Cx9WY8A/apWqvZLv+Zkw/qbNnLVWX4yLQxJhLRVogIO0jgFcuXdzLtz84ebN7KGkbb1JshSO@vger.kernel.org, AJvYcCWRizOgw0lWwOQBBOiYDrjh71XJbKXc5IsefQNuk71W01BBIE4uZBZVeHr7z7EA0OTdVxmUzpkKQEQE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4w+HE6tMnrccm/IF4CeXJ1vuFO1J3r5OotiB2ZY+FYCKa9B3w
	RGNF8C1S8v5lpybRKjAGekTsKaiLBi9JMDRq70BtJR/B7TB8e70UUm5OVrQYgdzb
X-Gm-Gg: ASbGncvy0JxbUBD+S97JfHLvqMY7P40wmaz/Ypw7uPJnC20E9C4Z6+mqIhBPdTrSZOj
	uN3J+f2dzosdMKLmfzpB9LIxzBYnYRvMm3cZ/XBDklt1e3u2rKli4ZjTWzKvcFYccsWt/0g/FKR
	jBQPPZKBuNY81HiDZm26EqEGxuCKG0e+lWedBG4yKrDbH9bQ0YjIXPnSd76Z9GdFuAVKUlPEMjc
	EFmZhqebQKHO4YbL3LEMHHDsYc4SOQ9WcygCgzUfG3ufqzSdO5HSRjuYzlYDzcN8+ONBiBFU2hV
	W1szKIKnT2uAKwskAzDxttNGTOH2ETgXGcyds2ZstdKWOmCknquhmrM4mDnXMUT5MNo+CmsdOna
	QUT4O+Iso1iAjgaQegnbiFcIcKzGLVS+ns+mxFuY=
X-Google-Smtp-Source: AGHT+IEjl+yr878AvrYNBjUfIgoQ/EbccqkuBkxrKmYuvGD506F5090znUS4nJqBcY59mIfrNTOXHw==
X-Received: by 2002:a05:6a00:2e21:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-74ce65c5262mr10425610b3a.16.1751775854164;
        Sat, 05 Jul 2025 21:24:14 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:13 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 3/9] ARM: dts: aspeed: Fix DTB warnings in ast2600-facebook-netbmc-common.dtsi
Date: Sat,  5 Jul 2025 21:23:53 -0700
Message-ID: <20250706042404.138128-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Ren <rentao.bupt@gmail.com>

Fix deprecated spi-gpio properties in ast2600-facebook-netbmc-common.dtsi.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - None (the patch is introduced in v2).

 .../dts/aspeed/ast2600-facebook-netbmc-common.dtsi     | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
index 00e5887c926f..208cf6567ed4 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -31,9 +31,13 @@ spi_gpio: spi {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
-		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		/*
+		 * chipselect pins are defined in platform .dts files
+		 * separately.
+		 */
+		sck-gpios = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
 
 		tpm@0 {
 			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
-- 
2.47.1

