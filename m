Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131318F5C;
	Sat, 21 Jun 2025 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750514018; cv=none; b=eRm2zTKTpV4FZ6FPjgZAzTT4jSvXEMggEKxlSNuaQ1dpn6QJdL28eGapnlgt8t2ZS1rGbPSHiaVHL4zM0CG59/1gzWbqZ1p0qUUkPJlGMtBz9CQB/+EyPJRpQWj+t16T7yR0q3NTaQFZLeiQ8iAtGGvpoKD4E+Eu6Ot5Cn22CMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750514018; c=relaxed/simple;
	bh=KsF5PKXjAY3Cx3H01+h3wogIpa3o2Izv1KlwW3dlvGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzCJfxHTEoYeGNVLFhHWPH67EeoPwRC/DaTK+psRRxfWvLC02T+1Bddb6ZqMrLawvFiiDHw/TymCxmcXyxt429heC6GoFc53akKKnSVnu6vUJBGcjPH98nvYGet7K3DtOzKLf/gphReVZxiROGEWTUAU62ifDMeu/lbI15SykYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMvAKnYS; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMvAKnYS"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235ef29524fso5220215ad.1;
        Sat, 21 Jun 2025 06:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750514016; x=1751118816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bTflLiAJEMI7+0/3feKtggy4eDDBbx+qju7cZDBIaN0=;
        b=EMvAKnYShmepOJflMkw7LefDU9HxAcbjLy2R83MEoVgLHOkv9zKwV8UIC4RckiCrt5
         Ix+OhgyxQ2zHDZgWfCdt2AhlJ8btS70mdIHklaUTgGI0mkDvsI4rN9yj9khMArBRNCzZ
         dy7heG1MI6khWRDrM7GDTsIeyavLbZR/QfoFZGby502DOH13dMUpgErpaQkJdEGDt+di
         tEk1LF7B5BF8Hfu/8dGz+OmKfGSrZPvFikm7gJ1LjIiTGXYDbScCG+0HbV0j4BDCAXBu
         /8p9fDi+lzvbtAoShphjbjUSVhoj/LECeiB5fuMfTP/vlB8GKTV8fsWdO0MxBG9m1RfI
         zvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750514016; x=1751118816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTflLiAJEMI7+0/3feKtggy4eDDBbx+qju7cZDBIaN0=;
        b=HzBEpP4MVTfqK94Fet0hxbPw05qjT5DtOSm1jvBxbBwJX2KvXfOFF4476Tmjq8xjjE
         ORjfMTlDmHyh/j2PA8NUJqvkL2ouVVmF4B2mUCT4c0sdk9hZa6h7ie6zjYHGwb5lOLqt
         pt1SeLPQEvTeYo0SWQDjZLzCY+4IR//kYq7rY/riAKIFM+bNObIr7zU8K7ZEBrjwLRc5
         zCCmucEs3S/fwNjoO/Gfcb5Vt6DNR/MC98V2M2vG63ZouDHhGzyOCC5dN9AYsfslA4Oz
         oyQ8U96LN/11ZbvbNk2h33QcMqa6qTLNoCBy+rlzOZu4xPDH6ilLvSN3DKbGA6cV4JJU
         AeKw==
X-Forwarded-Encrypted: i=1; AJvYcCWUdxtuS6pJMiKPKDUW3BQXAstA4eZcYM7k8Wm0MadK3/tEYEU3FwWzjyfzjvcOwnAjkKAY1tlbEjf3o5Cj@vger.kernel.org, AJvYcCXQ+N8FQNpvtFyQFe8Djeom7PPSmXTLcPhyQISZ38Rnm7w+0cwDlkmC2LSniwNiEDSQRoEa2wL7ZCUy@vger.kernel.org
X-Gm-Message-State: AOJu0YytVx+q6NjEsyOVMPT4BfdO/GDrEqmIfo8h24lC8nmDLsVcrh1b
	WermY+HtfcO0kRe6Y+utqIb27rch8jMAE0tWlYF7br2HgNYpXUsmxXvo
X-Gm-Gg: ASbGncurV699sKktFhcjmg0x3bxM4xvjJcxTLbIxlUiDY3FgiExD3IB3dvmMERhvMSv
	Iuoqe0f+Kmc5//qKodLn8BdOJfx51Qm4K1fiIaAUBQ2G1cuptVDLLCg2w+/5FpB6939yoOEm8XN
	Rl4NN9QBAYLLFvViV6YJA6cGE3gSFpWDtpS6nErPfxX7Zs8RnrC/1UxcyBdXgm4FsxpHoPywsJ0
	FjHv3khHJh5x9PjWw6U0ACaLdm15TNBsM2ofjpEH0Zrd3hwG62G5XFKxsXfxbNMTw45sWptO1Qz
	5+GiU/SSjl6HJBaLDzb/xlYnUeRBgDPFURbiQCe96H5ONQVPUx5r3gJBsGn923U=
X-Google-Smtp-Source: AGHT+IHNSz1H+Y6EvxrMfpwVtSmD5EjhjR2Uj7VVL9JBRhFfCwNGQaZuAsJ9UFVRyUwVzOhTpkaRDg==
X-Received: by 2002:a17:902:d4ce:b0:235:f1e4:3381 with SMTP id d9443c01a7336-237d9a2539fmr35469485ad.8.1750514016224;
        Sat, 21 Jun 2025 06:53:36 -0700 (PDT)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86103c1sm40700275ad.105.2025.06.21.06.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 06:53:35 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Add bluetooth support to ArmSoM Sige7
Date: Sat, 21 Jun 2025 21:53:14 +0800
Message-ID: <20250621135319.61766-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ArmSoM Sige7 has onboard AP6275P Wi-Fi6 (PCIe) and BT5 (UART) module
which is similar with Khadas Edge2. This commit enables bluetooth
at uart6.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 .../boot/dts/rockchip/rk3588-armsom-sige7.dts | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
index ae9274365be..39197ee1983 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
@@ -373,6 +373,20 @@ vcc5v0_host_en: vcc5v0-host-en {
 			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	wireless-bluetooth {
+		bt_reset_pin: bt-reset-pin {
+			rockchip,pins = <3 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_pin: bt-wake-pin {
+			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_wake_host_irq: bt-wake-host-irq {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
 };
 
 &pwm1 {
@@ -767,6 +781,28 @@ &uart2 {
 	status = "okay";
 };
 
+&uart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wakeup";
+		device-wakeup-gpios = <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
+		max-speed = <1500000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_wake_host_irq &bt_wake_pin &bt_reset_pin>;
+		vbat-supply = <&vcc_3v3_s3>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};
+
 &usbdp_phy1 {
 	status = "okay";
 };
-- 
2.43.0

