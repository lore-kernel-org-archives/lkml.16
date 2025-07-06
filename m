Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4C21C54AA;
	Sun,  6 Jul 2025 04:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751775862; cv=none; b=jnTqx6vxB/EmhJgd9ME402Hud+E2TVXRBmP4s+8d++Ie4/ssmOBPjllbrSVs0+S/NK7uGsegiI6bRUvgBviLUKCqr/QVv/l3fZzTBom7QSPfZCIWwrPSxd6yK6G8ygzpjFwNHW8/zZ1E9FQT1hnoAeO34bBI3X/u6Zek9wP0yNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751775862; c=relaxed/simple;
	bh=bFP/OSPwfVEI7fCZaWROP9/QB+EszFYqM7erMBZkACw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3YoQ7uEXSubakQFcN36hd1628ASRRMwisRMGg4MQNIRFrGY2YnR4b5wMqZY/KPJXRg8VPklLxcRVpsZpzr2amzJTv2ZWSfGoNvnmPetJYUqMBd0mTsSr7xSHj7QuMnicZ3H2jkBGjswmS6fGNaFyzVsZ9J/iy2IQgLBfy8rsR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qn+2Nizz; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn+2Nizz"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7426c44e014so1602972b3a.3;
        Sat, 05 Jul 2025 21:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775859; x=1752380659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4zGUQOdnJ69KAUBlNTKEGfxN8OGbSwbnbCSpcFHfJs=;
        b=Qn+2Nizz0cx0hd6GxV/EhIjMpcCoLEFRv0Ri6XDgmlxbPvg3WQNi/NR90dEDpRcWxt
         v6OMTSzh673mAXNj1u8VKGF3EJHOPKYJM0fhgZftYPGclsIdLyyntAtwHg9qvezgQQIJ
         OpFLIn3UMj8ypDmz1lUs2NiQ3az/3TzESFBmSvWhvRlU6oBTjXH8WPuY8ckJ23HkVLIx
         J4GP+jVbWUv2GhvfDw5GsFx9mk3xg1P1lftA4+v9KHJDleqfK/BvS9BzKopfV/k0L4VW
         2fXJ3FdZFJrbtu1ajNM0J/+8YsoFp+RPl8hV/RfiNhhQesHOc2VYtnxfObd/0NjO32WT
         XdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775859; x=1752380659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4zGUQOdnJ69KAUBlNTKEGfxN8OGbSwbnbCSpcFHfJs=;
        b=EPZLc9Feu1MjU9IK3Y81cjIYidq/IldGOHUJE9WV3ogPoslEqhkJFFy4hUGbJAwjVT
         QuAXTBwG4G5QPLDmcK29cPq9PqalYohZ6NWACfWR0BkgIXGpdbmemTtrCwtcZDmGU+5y
         dBqGZtOFLkKJ1oVVn4SugyEDHcp1TqTDT5NE4dWf/ghOXkKSNWu/eC01WJKLH49Zd8x6
         k699lrwmAMD6AY8DZSU1c3yRNd3Z9sFO4cXlho+HZibWLZ6obM7lQc5wGoS7dNcrS90f
         C1B4twBRvlWl0IR1RChwZFrd8DYsSV4fUHze8its2jYS4vAggHAif02cnWOR+tFERNBa
         6+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCW57ly5vsFKnQI96DA1dWdLmGF15adXcLd9rlEagO0FhHeFylA5o1ujUlJuNtgpkbkmA0yGHrtN6c2Hn3HN@vger.kernel.org, AJvYcCWAwMucGL5Bc1FnFUkjHaI4yM6P6tKI5xDHWxvPc7+Sr7n+Tl8QFV4c2QK785Utq8LDC4Q6q/rtaeOj@vger.kernel.org
X-Gm-Message-State: AOJu0YwGKdCx8r3o0jL6iSeaPDT/S54JtBY9sKiVWF7B3/iiKdJ39shn
	BTTkESYSKn5XIEgHeLpZPOpbet3yyW5SRUfNFT0loH+9wawaHBlz8uGA
X-Gm-Gg: ASbGnctiQLXMocqbiN5blqv1G87tfjuLGhPc3me0Saf9bXGJ9BiBtMfrVFbJodR/CDe
	AtR2hoxENyxRrC629VYbl+RXwnDgtwZGnVZScZ8TwqHgdLN/bXSd2KUBrcVROU7NJkU3gQy2lMR
	+pzqMtG9LgKWAlh3VyQ0h2T+TkA1EeOKG8yg4T9HJ7Hhx7uH2NKNYk9kReGMHCuF32gs/kZJ+4h
	nyZQDG7+8Qe66uSPy6O/ZdZLW597VNtJ6VqOffmxzXUfkwfMzl8rpAMXMZ7YQSzPeRkdCAPUwD0
	CoV3j6RLj+wdL/s88gYgLMFczN0bL4h2hzEUiBCnvXVtdwlyQf0PH/4VId6htpvK3kb3QTIgoSW
	+nEQjJhqFYnIdhF0s+8uW+3w+T4UFuGTHD1C3g70=
X-Google-Smtp-Source: AGHT+IHRyoxO9wJjn3WxYHJI0BaRuQ8jiymleujUzsWOOYUm3nMO8dl2iwjV6yLqVVunAz/SEaHFiw==
X-Received: by 2002:a05:6a00:23c6:b0:748:fd94:e62a with SMTP id d2e1a72fcca58-74cf6f17155mr6130664b3a.1.1751775858985;
        Sat, 05 Jul 2025 21:24:18 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:18 -0700 (PDT)
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
Subject: [PATCH v2 6/9] ARM: dts: aspeed: Move flash layout out of Facebook netbmc-common.dtsi
Date: Sat,  5 Jul 2025 21:23:56 -0700
Message-ID: <20250706042404.138128-7-rentao.bupt@gmail.com>
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

Move BMC flash layout from ast2600-facebook-netbmc-common.dtsi to each
BMC platform so it's easier to apply different layout settings.

The fuji data0 partition was already extended to 64MB in Meta
environment. Elbert flash layout is not changed.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - None (the patch is introduced in v2).

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts     | 6 ++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts       | 6 ++++++
 .../arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi | 2 --
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
index 74f3c67e0eff..673cabbec92e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dts
@@ -50,6 +50,12 @@ spi_gpio: spi {
 	};
 };
 
+&fmc {
+	flash@0 {
+#include "facebook-bmc-flash-layout-128.dtsi"
+	};
+};
+
 &lpc_ctrl {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
index 840d19d6b1d4..71f58ad1ff06 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts
@@ -223,6 +223,12 @@ eeprom@2 {
 	};
 };
 
+&fmc {
+	flash@0 {
+#include "facebook-bmc-flash-layout-128-data64.dtsi"
+	};
+};
+
 &i2c0 {
 	multi-master;
 	bus-frequency = <1000000>;
diff --git a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
index 208cf6567ed4..4f819bf8c909 100644
--- a/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
@@ -54,8 +54,6 @@ flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "spi0.0";
-
-#include "facebook-bmc-flash-layout-128.dtsi"
 	};
 
 	flash@1 {
-- 
2.47.1

