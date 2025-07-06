Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A708B14EC73;
	Sun,  6 Jul 2025 04:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751775853; cv=none; b=To+x5SUCQS6EcAZQFL/jloxZ3i+9FhFk9On78Q0raeQIz3Lqmn7ipEZchXrcZBbwe+wegwsWdsOllGRl3dftVk5WKDEPcV/nz54oP73v0ROKEXOPs0F/wPApHvwI1vDlRMIa6LERsnjH6Jdkp/YuBExPKuJ9OkUua23X+LhEWoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751775853; c=relaxed/simple;
	bh=BvvRN70iFSH4LHKvU3GB/DNMZqNSfXp5FaX4tU7Y/Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTLVe/zE9c0p/V+BXdkIqJX2QwiigmLzFvumcUm2e6Z3ALk+rD8hR2SpDzsVUdXdU9qeBpMzkMJ6GugXkzZbraAXoxZLbiKbVyu96n1U9gdfuwbhgKo1rPRuvn421M8qx5mD3nYp7WcOOKC86BBUXDeUaRld9rmZTvHKN6E1AM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5UCMMGM; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5UCMMGM"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7481600130eso2916925b3a.3;
        Sat, 05 Jul 2025 21:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775851; x=1752380651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onJ/SiPYut3DmOwlVXhMRtyJ+CvjIISGxDqve7qmTAs=;
        b=V5UCMMGMZdEP6hxaFUtmjepw4R9/WVB5tC/HtyZWBOc9Tx+BZM0wINzSFyGDqDyrro
         RhTbzn+oVVQ9ajWXQh61J0mFdsVyA0ySg54njTiHqFqGqksM+p9jKpQftPOYk/SI02Bh
         8XAO8SX9cB+D2tK16XBKddhYEm1fh6rV6aTLxHdttKELGabRyhjKQ6GDpA9BpduTFk3Y
         o4mpsACH1Lf/CYL0wcv2bJW802dkVbHz2sgYMcP8WD9b2bduN44JFe0eOfZUPAfLn2Yp
         WYsIbCyTAIoCm3teG9n4IdYs2fPO1m2O3ijDjdP/4tJ0RLzPO1+b69yJXp5Gs5xSUYXV
         wZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775851; x=1752380651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onJ/SiPYut3DmOwlVXhMRtyJ+CvjIISGxDqve7qmTAs=;
        b=JW5xvXtDMdRssR3hMfdarBxk3wPlcuiswruipYjouA7PWVvUn1LwLmTPNFHSudcdWr
         Amd2vDWe5G8VOtyAXikn2toaGPLZdv4nXOFoy88Mpay3PQeOCqweOxEu/zNq0iIOAKdX
         Y0rdB7qVWDxsxYyaUbJiyGfak5Jj3zY8MewdtKWwe9CWZR325M4eSHkiXh0pgblvJGBx
         ZLnVFWyupBDqX4YRgMQWHbD45VmwwhQz10h25EqzcyZj2OirDZtsaT6HjvT3lYEHsrK8
         3tA9RR/0HEDy9mp84ktSy+PwBHrXL/G7fTtKFDIIRnMUIBayG5z4KugXEi8ct6enRQg4
         RqRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx6hkxixCe4xkY2N+P0/1y0NV/6dX2PzVa4NpUWDEgJrwWalT2oH7+uIxYSChnT8h7JEfhDJiBOSII@vger.kernel.org, AJvYcCXa08EkwKWgDPDiX7TJmSqYAFPL2qQCzhfnjVfg8eWL2jKZYxSBIEIoTgOLVzREqyZDLTDyzNh4DjqMYaoi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl6PM2bAhysXvV3hm2kPuint4u4H0eJhecHDkU7Z+henE8U+zS
	MzjOblLbl8K+iRRd6I+ONCpCXNycB9gOLQkMTWqeTpsg177TBV4IYD3hngmSrJ1S
X-Gm-Gg: ASbGncte1baQdIduxA9KqEFrTIK9Oz2wACK10+/Li4PNs36LGtRx5eQL0QebZlC7XdL
	F65ywxUKg0Gh10EcFN+GF0jIAQDykiFDWNYiHTeLhMn8ktpl1jXFS7Z+HQdmLW1A3jtX0NkOFkl
	xU+T16U6XG/9RX3mAZLqYjNMEKGVgnAA0OhTHkahTjnSDgxJm/X1j7JBIRKQYp0vf10sBohvlrN
	cU7wi2nqtR/1xnO2RsR7GuXWZuk8sqIWOBvQDszEyxa/XLcNwjb8/IE03n6p2NvpiNZU6pv+vl8
	pkv7Ci6iY1DOQYiZ80ipXXTYhhmAoJspVPbSnOWpY3WR1iz8mqMuyNHKeGbD9XN87LjZsEWcJ20
	pF3wZLU1+HojVnna3nrdNHiOS7vB75z3wPlA5qY0=
X-Google-Smtp-Source: AGHT+IHvMM2cUvioZG3LBq/FM/U+WNpT82w7MGHWKcdsUztGTKRn4oRqsD6DH0I/+oFoaIi0vt+LAQ==
X-Received: by 2002:a05:6a00:130f:b0:748:2f4e:ab4e with SMTP id d2e1a72fcca58-74ce66697a2mr11229443b3a.11.1751775850900;
        Sat, 05 Jul 2025 21:24:10 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:10 -0700 (PDT)
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
Subject: [PATCH v2 1/9] ARM: dts: aspeed: wedge400: Fix DTB warnings
Date: Sat,  5 Jul 2025 21:23:51 -0700
Message-ID: <20250706042404.138128-2-rentao.bupt@gmail.com>
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

Fix the deprecated spi-gpio properties in wedge400 dts.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - None (the patch is introduced in v2).

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
index 5a8169bbda87..3e4d30f0884d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
@@ -75,9 +75,9 @@ spi_gpio: spi {
 		#size-cells = <0>;
 
 		cs-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_LOW>;
-		gpio-sck = <&gpio ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_HIGH>;
-		gpio-miso = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_HIGH>;
+		sck-gpios = <&gpio ASPEED_GPIO(R, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_HIGH>;
 		num-chipselects = <1>;
 
 		tpm@0 {
-- 
2.47.1

