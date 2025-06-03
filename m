Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0F01DF751;
	Tue,  3 Jun 2025 17:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970091; cv=none; b=EuJ1KKHJQQKo4NUUMDxYu8k19G9SRpGQPPPQ5zUko8Z2IOW7JczmKtVXJUuwDwY4TrQay1yVCljp+1LEgA0YDtGCZ7+PHzmCFko4utuhuUsVlj/32fbhSMTocPw2LXVRXfbdRd0MJA9a6y34csFHaYjWGyUbbgck08s5ceQBfdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970091; c=relaxed/simple;
	bh=c8oPro+LjYG34KNqLDV5AQvA8UmqCuFwCYmZWvt03co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ijv/IVsDya2sGmmB3bIDTpYfVYr6BIYoF+RlJu9SOmXZnAVM2hd9b05bIR6zd2pACW+qgp/jAPakYzTF1OXGUO+/jMe6FPjSxhOYnfbAdgizpc/awugFD4yfzyQtBlwANnb6JemAYLkIq8+98Wo5Dn0d25MXbJ2BWBPV5dfRKBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkyABGlL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkyABGlL"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442ea341570so41351005e9.1;
        Tue, 03 Jun 2025 10:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748970088; x=1749574888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0p9YpOZL8B3n4fRaefj3Tpdxqsf7wGzn2I1TfFc3lfU=;
        b=hkyABGlLqpzuvSTkYBLhAOyDBS4Bi/Z614ag/OX0BtVjuam7cPaG9xtV38RQ3Sk4Cq
         Tk5Fj4gFMjXdsIjohxwOYUo72VsnewmgpvBOVHRdRhSWrHHh5JWcc4+Jk7G86O2JH95Q
         rr8+5wg72yZdbvU2n2GvSp5XAx/T8IEfmdCKLjbNV5h2tTFWcjnYxi3/fXfDKk8lxQpu
         FLcdUibNf6au11P00CMSqjLlolv0zCtN2KTKzfCRMYmV4zuwGfmt6pleQAqVHvUWASGN
         6i8O+MagUdhwZwNxkyYPCjlF+2XbUuyP8QvQ078gEgVAbBY82KysMNN4zA7tCSv+Ggiv
         xk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970088; x=1749574888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0p9YpOZL8B3n4fRaefj3Tpdxqsf7wGzn2I1TfFc3lfU=;
        b=a7l8C0T9pa1dZHZi7rb2HGSq3YJ6lZNVyprc+qq0lACWK/Up3NnDQfyFg+A5fF2EMv
         3yAkkLz/O+r9mpAYVjmBNPEJWeJSvFqfGM+PM/AcKpQBCzn3pM6nfPI9ouaWs+sSqrES
         oK4RmVfDJ4hc1tNAden8HAMR4lgiEm7oMByqpeJlgmyFQIyj63jT1ufkC8pC+WWwTYSK
         SJo3GlYfJcR93M8a+feUP6E5bjBuRkMptNny/lfJ5Rm+7W2JRROpOmak/C+6wuXOXumW
         qExZn/0ud9TpNxGuStgt2t9XH6d74uiQtGZhJd1wWglTzcNbnidI9sm9SYok2BM4SapJ
         ARSg==
X-Forwarded-Encrypted: i=1; AJvYcCUrwvAoiQk1xaSqNvqFdZGHh8qnrsLM32pRoG7/YZKCFponXSHG+A/K90HNflCbeb8n+XVaYMFj5kn6HJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1q4kHh86Fc22rkfWKglmLzu7gnEEFz0VXWp8LqfTeChnEiytf
	21EFd33u2im5khlwVct2E7ZXUsxFGd77kzTQvGEX0zvD3Zb/1Fz5yPS/rUEfR2vi60Fwig==
X-Gm-Gg: ASbGncv+jSutwy4PxUlzJuMYmZbTd4wHtze4Vbh51P0Vu1oO5bIWpRDTI8D6ELWJ66u
	f124VheqT4RfvRJo9y8fzsVwMb2TwPiJqX4JdYuksoBFxVw/ww0E1UaMpWsQW4h1VA+swrfOVjd
	iDb78AmhdLqEmJCBfKhlMeQ+xe0OG+D2VMNsShZzw6UfG+Lx490rFvAAWH9PtzRN5N9ggKv4sgk
	ANAmhVrjVDUCxMkTps2i7PlRjnCPsfwNT27EDXWHWjVaLi/rLJC9HNYKaaBh1NJAw411SbHsSJY
	3N402HiFr3TRL5sk9zcsqEehwbb/9+oNupeGlXXVgfGcw9CRW40YvbmInAsU5mQsZ+XyqLuPYg8
	DHJ+MbuCs+b/KkZ8SQeobmwhmUg==
X-Google-Smtp-Source: AGHT+IGKbbxaD/kDR25Rzuty7F9u0AzUaO85ccvL/fcRDLMAZpN9DkbpbEz7a6jeAZtl5y9tr7w8Ow==
X-Received: by 2002:a05:6000:4313:b0:3a3:6b07:20a1 with SMTP id ffacd0b85a97d-3a4f89dcaa6mr12878180f8f.40.1748970087673;
        Tue, 03 Jun 2025 10:01:27 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-93.alshamil.net.ae. [92.99.174.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b92bsm18574640f8f.9.2025.06.03.10.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:01:27 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 03 Jun 2025 21:01:15 +0400
Subject: [PATCH 3/4] arm64: dts: rockchip: enable wifi on ArmSoM Sige5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
In-Reply-To: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748970076; l=3205;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=c8oPro+LjYG34KNqLDV5AQvA8UmqCuFwCYmZWvt03co=;
 b=eLODa75WBe+LmN+NItUXL47WxdQX+Yvyylq1SEXx0DI4a0xKhhPyz+6YV8/1KeWZqxgqANvVE
 DWTk2XdUEkEC3pxm4GXu2D8tvEDqIdwm8behElnGAhMO/x1U173bCk4
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

ArmSoM Sige5 uses a soldered-on SDIO connected WiFi module. Namely,
board v1.1 uses a Realtek based BL-M8852BS2, while v1.2 uses a Broadcom
based BW3752-50B1.

Add required device tree nodes in the SoC .dtsi for the SDIO controller
and pinctrl / clock wiring in the board .dts for the module itself.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 36 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 16 ++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 7ce1fb1380b0863c902fdd9cbc7454ee6011cf92..dcd033859398312f7693bebb7f080ee4f2ecaa32 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -219,6 +219,15 @@ vcc_5v0_host: regulator-vcc-5v0-host {
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_host_pwren>;
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
 
 &combphy1_psu {
@@ -781,6 +790,16 @@ usb_host_pwren: usb-host-pwren {
 			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
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
@@ -808,6 +827,23 @@ &sdhci {
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
diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 1086482f04792325dc4c22fb8ceeb27eef59afe4..a09582470bb7f654b711308da1e51fa8571ca1e8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1695,6 +1695,22 @@ sdmmc: mmc@2a310000 {
 			status = "disabled";
 		};
 
+		sdio: mmc@2a320000 {
+			compatible = "rockchip,rk3576-dw-mshc", "rockchip,rk3288-dw-mshc";
+			reg = <0x0 0x2a320000 0x0 0x4000>;
+			clocks = <&cru HCLK_SDIO>, <&cru CCLK_SRC_SDIO>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <0x100>;
+			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <200000000>;
+			pinctrl-0 = <&sdmmc1m0_clk &sdmmc1m0_cmd &sdmmc1m0_bus4>;
+			pinctrl-names = "default";
+			power-domains = <&power RK3576_PD_SDGMAC>;
+			resets = <&cru SRST_H_SDIO>;
+			reset-names = "reset";
+			status = "disabled";
+		};
+
 		sdhci: mmc@2a330000 {
 			compatible = "rockchip,rk3576-dwcmshc", "rockchip,rk3588-dwcmshc";
 			reg = <0x0 0x2a330000 0x0 0x10000>;

-- 
2.49.0

