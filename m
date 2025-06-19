Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00F428B7E6
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341123; cv=none; b=t8b9pXkKat98oG/gk4XdxcpqV9EWt6umftobB1nVFFe6vAEwGwUZFGg+v0jfMnIO080bZlIFMkAfk9CfUh6vmugsJkCR5Wvt1v7OFEdoYLWEQSWZ5cFYuuzwsScdcyoXGTUVM7NlWjj0LARGBUpBXxUKjO1uPxI4O1DCS6lJNhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341123; c=relaxed/simple;
	bh=PfwZzjjqJBdpG245rW9fZ43Yt8RFpe6Kf9hR0M/wvXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YL5QnSUxnZXv6STltVfhCejZHn0XuS+aMQlPpXTbj1fdcTPJKDogPFpsysphpIAylwVclh+8po0dk2snzpFQ3HdmOzFnMDlKoV31fwJzxeScvM83PLqdNAD2XJob2VhJPL/ACHb0uMkDFHFzCMbMvERi1CkYMC67114njQDyeYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dCAvpyf9; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dCAvpyf9"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3ddb4a7ac19so2263535ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341121; x=1750945921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=dCAvpyf9Z0VOPh8ylz0gxA/Ry4F/iakNbUZlBTD30BgGjdsZZ1C9PZe4S2wocvsBdM
         E/hATG0spFH0cIx8NEBrW2ghqL1l5Rj6aqzjBLKGy9Z+vFSjbMUirk1HbYRmD1f44Pjj
         Y+63OPoSWo2vvEK8vc1v5EaDcjlv494rfuCwrXRxsLpETjIUhQm5LeragzeklcDlEZed
         759Xmj1KEXYiPhG1fSB2mVdI7cAwtDQ3v+7G6ATrC4Uk72WqqmZZjEzHdEQMULi6tDcE
         E8L2Q5lgtNDvL6NhHF/sx6SgE21joXlzwJ/DrxXjH8Xy/9c6H6sHPDsG54DJWLx+PB71
         zhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341121; x=1750945921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=ZyPmUD22lynamfz5iOMeP72FBnthJNw1Hct1Hiy/pTXoGgkkdy4kzcQHMkBdXWVJjz
         6QE3sh2TyLvspeyyyUdtDhU9VCwhXnrYE3rnSQM7mFrXyx5Uuh5Mwn1F7jif9SFC01+5
         c7jRP+0Slden9VXv4zKRDztO8zCmb2f3XzZqx5avXXg7r8OFvxssUAyELZEs682XWPJZ
         RJvRhkWT8r2ZVn4AnqpWC2FlxRKXjeAKIMbCj57fVfcYheP/3mGNDfEvKZBplTVTkZIS
         TZRmvNCkrZkGT1L1bREpRaxWWgdwQgGmZHTrMEMLcEYZXfYBXuLZEKpIMVIFmNt6Hh19
         RV0w==
X-Forwarded-Encrypted: i=1; AJvYcCUgO49HYzs0OAYKG8ZlvuBOb5PuojULXzKssEJYBvP07CyEyVhJ9xNecsfoTXG4xaj3U6sjiGGg+H+TmUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUwSvdmbyjtA5ah9MlDigKtkxvtxrs7Z6Mp1bGlsaLdCRhZD6j
	EJ7IaHKBaER2z2RclTvBhVbmKGnq9fgUx5hbt6krXA495iF/OzSAr0Ex1I23QUiHfBg=
X-Gm-Gg: ASbGncuFE43eirwcKbCOuHPNE95XwmyF+zFsiatp0RlrfQX4efLG4Ml+Ibb4vXJxBHB
	apyX9Y1tDnYIIZPuOwOqdigM40+elDIWxeFBGDLgyuM9z/1fjS4gcAVC+5ZCGSSv9jyGMO0OZXN
	1aR4YzVhuvmtOG5mna154UeoeLlDMO4VeKYhOm2zAY7M0qqRfp/KZYSBXh8EPNbnWuWBzgCvJXM
	EKTYyQyta3C7oI2YMw4a40iCe5gAFZ4W4Abk80h0ZTWi5i0NAhMKUktcGmtV8RDtw/mAz+QKtUE
	xd9jZZVLGHOEQ7h0iFjdmqKj0ZTHz+L+yFDrKgkca8a8shgdLQLQ+83TKtLss5meTWts9MJGrBR
	KytBYGTSWkxLD4Dy3Wm1bL+tyaKLwJkQ=
X-Google-Smtp-Source: AGHT+IHj8sY+G51cZweLxsNTuI+RcoQ3J14uLhguTkGCZ/n1ocvbZQ66NvjsIqkyJEywVvtJQ7ynrg==
X-Received: by 2002:a05:6e02:260e:b0:3dd:d18a:2d71 with SMTP id e9e14a558f8ab-3de07c4c33cmr286057795ab.2.1750341120674;
        Thu, 19 Jun 2025 06:52:00 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:52:00 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] riscv: dts: spacemit: enable the i2c8 adapter
Date: Thu, 19 Jun 2025 08:51:48 -0500
Message-ID: <20250619135151.3206258-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619135151.3206258-1-elder@riscstar.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define properties for the I2C adapter that provides access to the
SpacemiT P1 PMIC.  Enable this adapter on the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 15 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 11 +++++++++++
 3 files changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012..7c9f91c88e01a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,21 @@ &emmc {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		status = "okay";
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86f..9d6d4503fe751 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,6 +11,13 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	i2c8_cfg: i2c8-cfg {
+		i2c8-0-pins {
+			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
+				 <K1_PADCONF(94, 0)>;	/* PWR_SDA */
+		};
+	};
+
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
 			pinmux = <K1_PADCONF(68, 2)>,
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 14097f1f6f447..a85239e8e430b 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -483,6 +483,17 @@ gpio: gpio@d4019000 {
 				      <&pinctrl 3 0 96 32>;
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			interrupts = <19>;
+			clocks = <&syscon_apbc CLK_TWSI8>,
+				 <&syscon_apbc CLK_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
-- 
2.45.2

