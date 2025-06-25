Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1530F26A08D;
	Wed, 25 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866236; cv=none; b=Vyaa7QAD5OGIvA41uK05VcPl2cVIMVuDbewFXBuaVrlAaLbaaxRfQoyLdjCc9BlG3J7In5S3CxsZdaGa9v6XNC4ZRWRknIFoK7OVz86onop/SF/MzJGR0W+EwUeUFVqqQjwtxuyW8xRxV4sb06hFzQ42bpAZoFfXLi1BgGBFrJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866236; c=relaxed/simple;
	bh=YC8xCXCQvhRvw7UfBSmZrmTpgNm5p4gRUHfAxCi3uBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/vTl/dSHqESBPt6fKhC0XCyHkdCrGHyKoRg9nfy6NQIqW12AYuSZUtQ6jUmmvKhutM7ZOD0MEa4v7OOpTVC+KT8skHYqPJPN/lZ5NbY6cDtsjMwCMBGKBqqseiRPDeK+1SkLq/UZNmYM1OXro7iGk8qFiuaoLg9KLHHGOs8Eog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8CEsXkI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8CEsXkI"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2363616a1a6so100245ad.3;
        Wed, 25 Jun 2025 08:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750866234; x=1751471034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCwVhyi7LrS0Mr9IkZPeUKS3dkG/nZ+Hto/3dQfFA64=;
        b=Q8CEsXkITgWhva8EjoUtmOrszAOVx/UYmUQdSjLgqA758Fceq2w6/EBUe13mniBWAX
         1sdvAtFogd94ymaBmejkOwpz6xyKfkmL7WR3X7Sg/EMp0LPmF0K+44SrySkzPxqtImFv
         J4WCwHUAhOA9z6kgBW6BfgpaXxpzxZRlTQoorHAgKYME3WIhOviqYZl3KLqu82qSLl3m
         6I5HwVK61mf+GV7Rfvj9TFQSv450J3YnAtnloyhUE11sB7sEH4hU4tsR8pMxYjSX7J3W
         BhaBZxgOt1n4fT9IFrrTglfePCYCX7T8P3VFkHMJQW2kPGLMAueYRApZ/r+VM2PexdP5
         vDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866234; x=1751471034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCwVhyi7LrS0Mr9IkZPeUKS3dkG/nZ+Hto/3dQfFA64=;
        b=cbzy7pujqJprXyr5Hj/9QFlZtKk5bA1IVM71cTzPbrU7+XHJryXb1iSC7lK9vy1HHT
         zoUce9z2aoYJL7Ov+K0u+N/ZgYV7pa09WTTdJ4G1blH9HvFmyf2pRlQMt/+uJDTKRRMs
         bdUAAeQKeXgxmWxRm7e1gMt0bFg+DPG0gKxFV8YoHYz7rJUnZJiICqH21KVeB4aY68yh
         pVIhHuygfkxMPY0O52y+liL+gqUne0sXQALsDCQ7XRXJH1dZ5uaP69en4eFkg/N0Apl3
         BMW4qSXK3iCkcfLfuVPncw0qnPs16edb1A9hnH/JL6NT+f4OJp2CvJPUrQji2eTjzbIM
         1O5A==
X-Forwarded-Encrypted: i=1; AJvYcCUiem6FC8J0r8zV14gBT5A2QHvwzm13Wc26PCgwLEdYElDvVpXCQPTuROf7oRbtR63NuDjTQG8H/V+WKJLR@vger.kernel.org, AJvYcCWHf8tAj9mRzkxyc4iiBt0rJgQPK2trINEHwPpB+lKjj8H2lqzQAiaQUGQozJy1ed9dh4WsRjmjnh7c@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7AiAz7ZJ3Dd0fDo2CzHHTur3W4dyGcxE4y+QiSC6U9oq13kR1
	wV9l/a3IqK5n8g1HeqXuTMYNDVabeD01K8mAhiP4daM2KRuwLlvGiPI4
X-Gm-Gg: ASbGncuvaP+aXpi5CLC27r4D7jjrkfmBTb7lEJZyd68z5hav6G0J15lJEurQ3VrzhBX
	duAKsFF/aR/kh4TrszU8LJH69VsZ//Yp1gYOYx+9Dor/vIBDd6s6EoaNEp7w+Gtpbs7J8/fa3wl
	u09HTHnhDHFe4umiHLZ32V3DnbUZgtseczbVDLMM0ZCVloo5sq4rZRfG5fXVUOnRjtCQaEvRapN
	rKrl9RSGnvqTwrq/27TVdzBdawPaYlZdG4o4Z4ou37sO55KXH+4Ap/c8mv3SIETpGBbqfhsocdr
	ElZxJy3VAdXCNm+Rt2DooySSZbOP/zTyVKd+yGmAMfEr6XdoDlrQs/aAYOMKDuH+kg==
X-Google-Smtp-Source: AGHT+IHN92Qo+dvAQ+28gXK4ziIoW7+YAMLhjXmIJg8gQMeMAzSdi5uWrQ0PalJRetFQ24Rbp1Pf8A==
X-Received: by 2002:a17:902:e881:b0:234:909b:3dba with SMTP id d9443c01a7336-23823fe1503mr62865065ad.20.1750866234331;
        Wed, 25 Jun 2025 08:43:54 -0700 (PDT)
Received: from ubu24.. ([2400:2410:dfca:c200:951d:3a1e:f612:1525])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86628ffsm134229795ad.156.2025.06.25.08.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:43:51 -0700 (PDT)
From: Taishi Shimizu <s.taishi14142@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Rafal Milecki <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Taishi Shimizu <s.taishi14142@gmail.com>
Subject: [PATCH 2/2] ARM: dts: BCM5301X: Add support for Buffalo WXR-1750DHP
Date: Thu, 26 Jun 2025 00:43:15 +0900
Message-ID: <20250625154315.114139-2-s.taishi14142@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250625154315.114139-1-s.taishi14142@gmail.com>
References: <20250625154315.114139-1-s.taishi14142@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree support for the Buffalo WXR-1750DHP, a consumer Wi-Fi
router based on the Broadcom BCM4708A0 SoC.

Hardware specifications:
* Processor: Broadcom BCM4708A0 dual-core @ 800 MHz
* RAM: DDR3 256 MB
* Ethernet Switch: Broadcom BCM53011 integrated via SRAB
* NAND Flash: 128 MB (8-bit ECC)
* SPI Flash: None
* Ports: 4 LAN Ports, 1 WAN Port
* USB: 1x USB 3.0 Type-A port

Signed-off-by: Taishi Shimizu <s.taishi14142@gmail.com>
---
 arch/arm/boot/dts/broadcom/Makefile           |   1 +
 .../broadcom/bcm4708-buffalo-wxr-1750dhp.dts  | 134 ++++++++++++++++++
 2 files changed, 135 insertions(+)
 create mode 100644 arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts

diff --git a/arch/arm/boot/dts/broadcom/Makefile b/arch/arm/boot/dts/broadcom/Makefile
index 71062ff9adbe..2552e11b5e31 100644
--- a/arch/arm/boot/dts/broadcom/Makefile
+++ b/arch/arm/boot/dts/broadcom/Makefile
@@ -51,6 +51,7 @@ dtb-$(CONFIG_ARCH_BCMBCA) += \
 dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm4708-asus-rt-ac56u.dtb \
 	bcm4708-asus-rt-ac68u.dtb \
+	bcm4708-buffalo-wxr-1750dhp.dtb \
 	bcm4708-buffalo-wzr-1750dhp.dtb \
 	bcm4708-buffalo-wzr-1166dhp.dtb \
 	bcm4708-buffalo-wzr-1166dhp2.dtb \
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
new file mode 100644
index 000000000000..43a4a8e58b40
--- /dev/null
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Author: Taishi Shimizu <s.taishi14142@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm4708.dtsi"
+#include "bcm5301x-nand-cs0-bch8.dtsi"
+
+/ {
+	compatible = "buffalo,wxr-1750dhp", "brcm,bcm4708";
+	model = "Buffalo WXR-1750DHP";
+
+	chosen {
+		bootargs = "console=ttyS0,115200";
+	};
+
+	memory@0 {
+		reg = <0x00000000 0x08000000>,
+		      <0x88000000 0x08000000>;
+		device_type = "memory";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-aoss {
+			label = "AOSS";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&chipcommon 2 GPIO_ACTIVE_LOW>;
+		};
+
+		/* GPIO 8 and 9 are a tri-state switch button with
+		 * ROUTER / AP / WB.
+		 */
+		button-bridge {
+			label = "WB";
+			linux,code = <BTN_2>;
+			linux,input-type = <EV_SW>;
+			gpios = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* GPIO 3 is a switch button with AUTO / MANUAL. */
+		button-manual {
+			label = "MANUAL";
+			linux,code = <BTN_0>;
+			linux,input-type = <EV_SW>;
+			gpios = <&chipcommon 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		button-restart {
+			label = "Reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
+		};
+
+		button-router {
+			label = "ROUTER";
+			linux,code = <BTN_1>;
+			linux,input-type = <EV_SW>;
+			gpios = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-power0 {
+			label = "bcm53xx:white:power";
+			linux,default-trigger = "default-on";
+			gpios = <&chipcommon 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-power1 {
+			label = "bcm53xx:amber:power";
+			gpios = <&chipcommon 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-router0 {
+			label = "bcm53xx:amber:router";
+			gpios = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-router1 {
+			label = "bcm53xx:white:router";
+			gpios = <&chipcommon 15 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-usb {
+			label = "bcm53xx:green:usb";
+			gpios = <&chipcommon 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-wan {
+			label = "bcm53xx:white:wan";
+			gpios = <&chipcommon 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+		};
+
+		port@1 {
+			label = "lan4";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan2";
+		};
+
+		port@4 {
+			label = "lan1";
+		};
+	};
+};
+
+&usb3 {
+	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+};
+
+&usb3_phy {
+	status = "okay";
+};
-- 
2.43.0

