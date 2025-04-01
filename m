Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9EE21859F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 23:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743551797; cv=none; b=XHdsg0W8dt+xAiz4sHbkTNAMl5AMol9JpS1oF3j8fPy7isPMVUPaN5ivLo9hyG7JYQpmFYHuO2+nJJOUhdRQw0d4CU55E6TCXFk79AimD7MlGvwC7hCuR8V55tISlVm68rX2DtJGvWvY+WcKVxRot8G5XHy8tLo00qYpKypMbwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743551797; c=relaxed/simple;
	bh=/oLB4lfTgEqsm45al5pc3NIWRfW5hWKG0WWTFCddDho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LIxQhw32EJRBn8dt3mbAA+hn8Na93Jfuo/ZXN59Qc98lMFgsevV1ZecRpZs3PVFSpmXRj1zbiBn4tdsvKQBP8zFDLTHFVu2OhtD9Er5BiUCBG1UICCqNnN3MB5gFgNsVJj1/5DAeffxyQXXaqF0EhjvZPBenwhU6y7dRliZRFBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=DIP2NIJw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="DIP2NIJw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22423adf751so114498925ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 16:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743551794; x=1744156594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6ihHnN8ilmRZM8hNAaeCWLomeBOtyWBXorZNgeS24M=;
        b=DIP2NIJwv7+ufEqpvnAlpksAqCUtbwOxe4qZyDmZlwRvo5uoKLDxS6jtqc3KpATcke
         zmIaMXdYYZAR3UTHHUKfFoq0UI9ldLRvXPvHQeoS55pod0uNVKi7JslSSS3/K9PWVj50
         xX57jsFHSb2/obx663FahJBoi5o4m5pxw55H3lNgXYLOTFqEHRq9SMl5rdvYLcxWU18o
         ATd7Ufoi09x/w0ZcwC4nGfRyAysG6JOOVka5Re3M46s5jsnP/irycK09sFQURaN+ui5X
         u7AI3wSMhLKx2NY/HZeEYueMsobKGt5k009ScA57y+B9Wpx8808iBB3ZWdxkUN0WZeob
         FlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743551794; x=1744156594;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6ihHnN8ilmRZM8hNAaeCWLomeBOtyWBXorZNgeS24M=;
        b=lBigobaqaou4eZ6B1C8C5iyUsyvvZY+55vRK6hVN/YgJn/+kaY/8pyOEDXhN8R2hdD
         Lz3i3beQ494Omr4BxIw2C/ioWG21czQixxyUboJuXAHkFb6MmrGA4m0b8LPdXvTuyjW6
         gGpMu92YeNWhei/4CzruMR/6WooWagX4x3PIfQfW2rrQhFiBNIUH7pYeMrzE7p8RlrBV
         T8cRnyKnBCHYPsng/HUj0dUnH9z2Au+Q7hNOJrCAjRHnLVLytw62LAqt0Dvlg659sOP1
         +OmH7rVRaLk4YC9TezZMHn0/f+ByJWqpXaAlA9hH8bL42PI85eGvmIpy5AaLB9hxf3yf
         UvsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP89/kd5uZLawJG5OMafOTYXY4TTQNly/x1rFnE9urXkmhaTs10jQ3/SMNMfUaK2jqIcrbSo5sVYZ8XYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC+p6PrPWX0F01dfbKNTbMm6hW2a3k+6gHmuC42iSac4GttuMZ
	zKKP5xT1HcO9VH9LjmF7kqOqVLSz+bYEWnk2EA/k+5YLRUeL8oFYSTgG0NcLrPc=
X-Gm-Gg: ASbGnctgwRtqCaR/PWPzt+qqAULEVfxdkGXRP6pHda/c4u066GjzSiixkfFmnnsMBJK
	VIAymolhU1PoYwAfCDh4KS3223O91q3qVLhu2/9NJzsR80Yt2sZ/u0ifYVxIwlmsR9IEYdAH73U
	8l7w4eZNs05R2fYzEfxZQGX7TtFEpoBujjfHtGuHLI/I8qw16Y23nWLmherCqRYiduHAAtjxreC
	iGVqQwu+XuxEaFAHWQm0Ozslc+lJ/cC/Q0Q4Z6c3Z9B1IeRMZFLMledtkmCtCgqFP5Wz8+ug5l9
	ubldTfLrLa/D6kX5KRRzqWOHsa5rzwqllbpySrn77gxc1PNOpCoEJL0nonTtT+rRSE6qLOlzyUC
	ydK47se/KxAx6nNdOLwuNaScYvMsKz8g=
X-Google-Smtp-Source: AGHT+IFylzDbhBQ/sL2ExeIt5kLtcQJnLm0bfmikXo5VViRiVMSH4IaRuk3kFMVNKPfBS80Y7hZfgQ==
X-Received: by 2002:a05:6a00:1486:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-739b611955fmr5416229b3a.21.1743551794244;
        Tue, 01 Apr 2025 16:56:34 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:895:611e:1a61:85c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970def428sm9646836b3a.32.2025.04.01.16.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 16:56:33 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v2] ARM: dts: nuvoton: Add UDC nodes
Date: Tue,  1 Apr 2025 16:56:30 -0700
Message-ID: <20250401235630.3220150-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Reply-To: 20240925093956.2449119-1-william@wkennington.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver support was already added but we are missing the nodes in our
common devicetree.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
V1 -> V2: Fix udc -> udc nodenames, fix reg values for npcm750

 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 71 +++++++++++++++++++
 .../arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi | 65 +++++++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 5a466e97955a..e337f40ae0f2 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -99,6 +99,11 @@ rst: rst@801000 {
 		};
 	};
 
+	udc0_phy: usb-phy {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
+
 	ahb {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -193,6 +198,72 @@ fiux: spi@fb001000 {
 			status = "disabled";
 		};
 
+		udc5: usb@f0835000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0835000 0x1000
+			       0xfffd2800 0x800>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc6: usb@f0836000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0836000 0x1000
+			       0xfffd3000 0x800>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc7: usb@f0837000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0837000 0x1000
+			       0xfffd3800 0x800>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc8: usb@f0838000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0838000 0x1000
+			       0xfffd4000 0x800>;
+			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc9: usb@f0839000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0839000 0x1000
+			       0xfffd4800 0x800>;
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			nuvoton,sysgcr = <&gcr>;
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
index 30eed40b89b5..f42ad259636c 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
@@ -58,5 +58,70 @@ gmac1: eth@f0804000 {
 					&rg2mdio_pins>;
 			status = "disabled";
 		};
+
+		udc0: usb@f0830000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0830000 0x1000
+			       0xfffd0000 0x800>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc1: usb@f0831000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0831000 0x1000
+			       0xfffd0800 0x800>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc2: usb@f0832000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0832000 0x1000
+			       0xfffd1000 0x800>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc3: usb@f0833000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0833000 0x1000
+			       0xfffd1800 0x800>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc4: usb@f0834000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0834000 0x1000
+			       0xfffd2000 0x800>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
 	};
 };
-- 
2.49.0.472.ge94155a9ec-goog

