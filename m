Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DF9213E9E;
	Wed,  7 May 2025 06:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601146; cv=none; b=up8Zv2ZN6JvsiduGmhC29JpETy2e/SNQKpQGPq2xGKUtsNbYrmOWWfiyBhL1y3yElqwidMbz0oSnn9rjwfEJOAKi0pgIDoBbsX6UPBW6wMoNFcqBmL8ci0RFzbEvIvFW+wdPLkAjV/wHYlsqjLlIVBWpbQLqYAN1bVUfmMBu3ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601146; c=relaxed/simple;
	bh=np1yhCpp/qpjWGPuT2g9hwqJ7HuHqaWY+xGRBXC7yJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rrk/ChP0GhXXWNGAzL6mx9EXVAlrUr/r8ui1zEcu2rV7WbFZsRWao2sw04ZRRp3MdONQ2AH8A8qA81l9jDunVcKUKmQZT8LjqJ0kqQe8msnz0jHQ1trPYjGXBPEVQS2bb2DWiwm6zJYOnlzr9nX3UYw/RD6hHKnc854qA7gHYME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNmGmRh1; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNmGmRh1"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so5111619a12.2;
        Tue, 06 May 2025 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746601144; x=1747205944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZxCy7mrct22eBjkvKCaCp8i27n4yjdKKChzB9Nlcrw=;
        b=JNmGmRh18Ryefrk2VGf+25+2y70iQdj5x2ea/Ju2DjaddhKZvtaoxrwH8bkA+n5hLi
         LBeNmtzWqlNViuiVyKfl2PX4okCkRAO3Bps51yoEzBxvxrNnc//XLTpqCAE8bqq8TD8n
         0kRovToarB3BtWzaXaLbu5SiqeSLRu9dJadiJo/AbqomFs+94yzGTASRiFD2dHJ3gKNK
         CVX40+Bh9bw6bwgYh5jamFQmHSgF/xMuFiyUj6Ot5fMNEGq22OvfAChtoaoh0urZSGr+
         +meLuQMbDeg+qXLhsSgeKPTXH7135P9A4IrJb6S+XwznGZURwsbTpviXS+9EeDsVPr97
         6NaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601144; x=1747205944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZxCy7mrct22eBjkvKCaCp8i27n4yjdKKChzB9Nlcrw=;
        b=dOPKb4vEUvKzBrhtTyR+FrRx1tMClMNRp0D+XkbSsL5i1DoUrfW5tMqtucvwmGuC76
         o8Wr1A7dyS69mOOCG8HfDgkqVmgdp+O0SQVKvVXAblQlgHe3Ag//2uMkjj7903zya7mJ
         QJWLgUgA4/9IRH7w8MI2/e+U1aztDHSBkEWkY2tloGC35280e1C8RVojr77BhrCKBz2u
         3BfSPSNniCXJ7o6CBruDd7Ka3iKhS+CjjD7S3QDst+l3gV6p3dnvBtvjy+N7Lwz5Eqjz
         cM2KXPDCY3f35hxConZr1/ub+q/MT2lBjsmR0WuImjYrhgqub4eGxw0DVtM5eXzUMt39
         F19g==
X-Forwarded-Encrypted: i=1; AJvYcCWwYDLKDn5JF5u5NqyzowO2WEtMzGkT0NnM3iORERCBmCrHoIDUGEB/g38bywCPuGzCqaWXmmLBCJqJ@vger.kernel.org, AJvYcCXqMnPmn3Bd0csL/HtMYgUx2MgswuDkhSxxb9RCi6Dz3FQNlt0KYXzV01LHNS8owO4D8jT2Red1IkgAXnb5@vger.kernel.org
X-Gm-Message-State: AOJu0YyJTfXkUZk7sr79EzIDLkjP8suA3uWqRp9oZrrhQYpGGyJ0Aj1z
	d2KCl/Ae+6lUhmlW6A3wmcF8M25cBUYTNA45GkVHwMdxLHypGUabV8iTP1C4JCcb9g==
X-Gm-Gg: ASbGncu/0+HOwC+gFAPJE6LBMc86RzJ3Q9d+x60fBMHhmpJFb6zhmQj9MAS1xyfzZ/l
	HCJhcqD24afnXkkvfag5ymgiSUfHZZseM1gulrkIg0zCqO/G3ghsLknTvCkAWO2cjG9ihhMPrpv
	r7rYwNvroMpv0vgdVLAQta5GW1eR4yyppdaW4XZ3h+sx0tNikpJ6rSb+UzWirkq73wRXtralSdo
	4eQK/rXAxVllBrs429PuzfnWcwYDU20X2gU20lfPmFJ6Pbio/n7CP2PRpbbX7bXzpIUz4gGjc0n
	tGCzDhijp+c/Vb2r6L2xyQ5gp02/XHzkllTe7R6f00iCXG4VRYhpgtQBWIi5mls=
X-Google-Smtp-Source: AGHT+IGgS0h9enKlNVOXLCfCrbumo8HB67DCYKoAL9Eq5wVn3b4dSk1Ow5ZwYG7Bteh8MSXTpAgMzA==
X-Received: by 2002:a17:90b:4acd:b0:308:5273:4df8 with SMTP id 98e67ed59e1d1-30aac183be0mr3784024a91.10.1746601143894;
        Tue, 06 May 2025 23:59:03 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae525db4sm1315529a91.22.2025.05.06.23.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:59:03 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 07 May 2025 10:58:33 +0400
Subject: [PATCH v2 4/4] ARM: dts: vt8500: list all four timer interrupts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-vt8500-timer-updates-v2-4-65e5d1b0855e@gmail.com>
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
In-Reply-To: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746601114; l=3301;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=np1yhCpp/qpjWGPuT2g9hwqJ7HuHqaWY+xGRBXC7yJw=;
 b=FFRTMlEYxUjfk04F5tcy6Fu8t48a/oBMv1JKyKZORF6YvISOkxhzZ46nWOvKjhQlm3S+G5IK4
 3dTVT2mgNcyDZhB9T7QOJuQOdzVCuj62wFbHfp0HeZC4noLZjEbkFui
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia SoC timer can generate up to four interrupts corresponding
to four timer match registers (firing when the 32-bit freerunning clock
source counter matches either of the match registers, respectively).

List all four interrupts in device trees.

This also enables the system event timer to use a match register other
than 0, which can then in turn be used as a system watchdog (watchdog
function is not available on other channels)

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 2ba021585d4889f29777a12473964c29f999f3a0..d1dd37220d41becece5d24fbb19aa71b01723e35 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -111,7 +111,7 @@ clkuart3: uart3 {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007900 {
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 99c064c916b2279797f71261ca9306e9dcd4bbd8..2b1819f0c5412648a83cd3eeb495f68d2e4100ef 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -209,7 +209,7 @@ clksdhc: sdhc {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007100 {
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 0d6c7bd87f7dcce0eef056d04c38ab1de5d52639..042eec78c085d19fc97d7f0f9721399c0716ff74 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -181,7 +181,7 @@ clksdhc: sdhc {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007900 {
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 0158c0ba5dd110957eac38775d3bf3ebd2ab4154..56342aa1d993a43e7ee766f93151c6d456496262 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -253,7 +253,7 @@ pwm: pwm@d8220000 {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007900 {
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index c4bfb4d30aad0358b39cbf30edf0c63e32167bbd..03e72f28d31b1cfdcfa71ede93b8943971bae4e3 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -240,7 +240,7 @@ pwm: pwm@d8220000 {
 		timer@d8130100 {
 			compatible = "via,vt8500-timer";
 			reg = <0xd8130100 0x28>;
-			interrupts = <36>;
+			interrupts = <36>, <37>, <38>, <39>;
 		};
 
 		usb@d8007900 {

-- 
2.49.0

