Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBB02E6D37;
	Sat, 14 Jun 2025 18:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749924915; cv=none; b=rOuttpSbc2Gsa1b4EnxqLlp6ObnJ21fu0UhySultcxzPFLpgwA9KIbPe7ej7/ybYYmlu/XtYyfhMcrOQvi9G4pxLxmZNgZsCt91xdeoOfME03C/PFYvQWzN8r2oJZSMA+A4mwvXcOkGKxp2bolB5emteebYC8NXZuHj+G0QxSYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749924915; c=relaxed/simple;
	bh=3DJgRHBIHaRkfSksrkJeFZcxwEJRSeWYIwn581kib/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GISQaraDaOUjf1YoEJKIh/86LJ+BKLCqn/6Z6T1OHsdnCBfr8YSGgLZ9VZgsP9BFMmmz+sROrfDo11fx/oNdZZBDtAJPK6msRh4D5pypPw87Gb8c0IowWiLMAjWLVwHXvhJcsIJCjRHBwatTMkeROY4Zl9kz912MtaoOBZ0AOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsoeaAHo; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsoeaAHo"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453398e90e9so12142715e9.1;
        Sat, 14 Jun 2025 11:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749924912; x=1750529712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8mxLnGx9jfWVN0B9okkdbNhtWc3iZ46snC2AVhjIeE=;
        b=RsoeaAHocNavkKzgpmxPsVzr6hfvo1qkxgZQ1YIJLRi+pKE6K3sgpetCZjNTZdFfJr
         g9Fye7bHgAVDRKPpHbZ8bF69E7tVyNtDA85O6WI9jp5LZFq75D2/jYyQw5hWoprIWWG4
         XDBJPk3UOypatGhquh9XsGhZrIHLclNcuiO+ycdfINRJkLjqbNJcVgmEL0Dg2pRVqvyW
         7GEoe9c5jwa1/77W9UBI0mJZkeGyIRQfOrsywND1V92q8mfhHbMwMtGObcVcWE+733ce
         bxgciUSipRORa/Y90ycuzanF6VL6q5i9uL6JlTrndNvjb94KbBHgQ5IeslhPk/kIvmCg
         k3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749924912; x=1750529712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8mxLnGx9jfWVN0B9okkdbNhtWc3iZ46snC2AVhjIeE=;
        b=iy0A14jn17giAVH4JwMiKxZxd0eeyaWf7qkMCj5nZ4i9XLV/Tv4wg28JstV93oQgGL
         KOqCbjBogAll2p+oMieTMj3kdousjFxZuJ7WWAV7xlzQsdACubZ0NPQYZqDj95sNr8Zj
         hUD3IuqQszm3Vobz83rDaYFrqmNrESBb+jU5YA/HDeVbJwdERxzvRFtY4aVlos6lIxhc
         3XiGLFHowAFXpCQHA1caTaEf2ECRZLNFUT/KYoqzauMrt5TIa29niPc/oRd7ScUlX2XN
         i24GflHfufo6PB1ZyTFiNABuNLJccpBtVEXs4vuMVoP5/amWoAtlKOgdiCCzH0aJS3yO
         3UdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1l4QWCqLCdJOsG06pntLvt2kHyMwFuH8hPKEQSnstvlkCF09/s5aXk5Uchn+vyF+RPOYAGU8WpmWR3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwF+gwL1h431dEhUhIE4edUuAVPw91jWZMSxG916LQml7Qzzyl
	Dnn+ZH+m08MsVgWiYMEAL9rKU60hiR0ul1rfdVi6eszIHQlwe66R+o8k
X-Gm-Gg: ASbGncuc8TsOu9G3aW6tw1Ihmj5RFC+ENxiEyA0O7PfR68T4r7ddsqW2sz4llWCpAVa
	k5evSNLmcUa+5QzufBEtNzsgcchkMIuPofvJcuEzeL1KOalY8dgfXIG4mCe69LDuSxD3Piulpn0
	l/gPkC+zWKiq/w9K4EDXwR7ZUrZTAWMi3WUkKDbe+FIfowbq3n1m9C3VXSN1Bwt/0DUpHjLQWaF
	e7oSr9RQ12oOpozdITtnqyNjV9vWj5gPmELSCSCDFwI8vNrNz87TNnZQ73vkpyQYgrTds+owMPQ
	EFmyig8KG6XvBCdBhNHrdRRlNEDaq0iq/amEjyWr06MS9uF+gYVFVG2KXnNIjIJL1vF0YliBOVV
	lhA==
X-Google-Smtp-Source: AGHT+IHfDffm8Xm7lmqJq0GV4IBSE6wyNVVkwdv76K0acnYFf+Fv6x3cdYOhC4q+/sM+5N2Ciwky2g==
X-Received: by 2002:a05:600c:3ac6:b0:450:ceb2:67dd with SMTP id 5b1f17b1804b1-4533cb5751bmr33952525e9.33.1749924911946;
        Sat, 14 Jun 2025 11:15:11 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm88195255e9.4.2025.06.14.11.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 11:15:11 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 14 Jun 2025 22:14:35 +0400
Subject: [PATCH v2 3/4] arm64: dts: rockchip: add version-independent
 WiFi/BT nodes on Sige5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-sige5-updates-v2-3-3bb31b02623c@gmail.com>
References: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
In-Reply-To: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749924902; l=3032;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=3DJgRHBIHaRkfSksrkJeFZcxwEJRSeWYIwn581kib/g=;
 b=pYDvU4yX90IhZRBowVTj2XS+CEv2E5YaZeW8Hepxa+3M9BRO7ucdAHue5BhB21KS+vq0N7egd
 OmhV/8hc5X4Ak4KWKLhBCtFtvIzyZKYELQQ5xj69W7R+1R+Hb+W1Ygh
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

ArmSoM Sige5 uses a soldered-on WiFi/BT module with WiFi on SDIO and BT
on UART. However, board v1.1 uses a Realtek based BL-M8852BS2, while
v1.2 uses a Broadcom based BW3752-50B1. They use the same pins and
controllers, but require different DT properties to enable.

Thankfully, the WiFi part at least works without explicitly listing it in
the device tree, albeit without OOB interrupt functionality.

Add required device tree nodes that do not depend on the board version so
that at least the WiFi module can appear on the SDIO bus.

WiFi OOB interrupt and Bluetooth function support are not enabled here, as
they require module specific properties.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 801b40fea4e8808c3f889ddd3ed3aa875a377567..fcc8b7d8c1cdc79efa7a37e9f0e5b0e6f3c8758c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -205,6 +205,15 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_5v0_sys>;
 	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&hym8563>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reg_on>;
+		reset-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &combphy0_ps {
@@ -757,6 +766,30 @@ pcie_reset: pcie-reset {
 			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
+
+	wireless-bluetooth {
+		bt_reg_on: bt-reg-on {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		host_wake_bt: host-wake-bt {
+			rockchip,pins = <1 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	wireless-wlan {
+		wifi_wake_host: wifi-wake-host {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		wifi_reg_on: wifi-reg-on {
+			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &sai1 {
@@ -784,6 +817,23 @@ &sdhci {
 	status = "okay";
 };
 
+&sdio {
+	bus-width = <4>;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-sd;
+	no-mmc;
+	non-removable;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+	wakeup-source;
+	status = "okay";
+};
+
 &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;
@@ -803,6 +853,13 @@ &uart0 {
 	status = "okay";
 };
 
+/* Used by Bluetooth modules, enabled in a version specific overlay */
+&uart4 {
+	pinctrl-0 = <&uart4m1_xfer &uart4m1_ctsn &uart4m1_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+};
+
 &vop {
 	status = "okay";
 };

-- 
2.49.0

