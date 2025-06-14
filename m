Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97562E62D9;
	Sat, 14 Jun 2025 18:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749924913; cv=none; b=ZbzjqE3t6pHf4nKcY/lEXgH/2mUb+6Q1Dy98DuEx/68atiSUNO+BnoF3T8ZByXs4uXKntyqDvUUiHygGwKh4YISloBhfupkbUFyNKwgSHJRJuR1Yj4C4aMXnqLQbMzlnyhq5rb82nQ+R5Id7YnziCEAZywZd3Q2WrCSuc004O6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749924913; c=relaxed/simple;
	bh=+R55JLPva4RxIrp3zXjLnnlES7uYtBgDS2XhRWk7w0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzTUd78cFaqOlrP0GERwIxAmfpcm+9aot5oGyYtaoWbTetDVd9/1Tv5+gf//G9oLIUbCZKnF2Jyc6K3JDmt/Zq7FoNbApaHXsDQtL+Aw5YS9ztaWc6SlmNwNpgVqLOGouiykMDCg7FhrblSYiZqTJZVivSni01a/p9eFbkuRMK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mX0SZZWi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mX0SZZWi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441ab63a415so35093025e9.3;
        Sat, 14 Jun 2025 11:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749924910; x=1750529710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apK2Hae7QVQW8sVcfdULJFrMHKxa3eLsLFIQMUAHMeE=;
        b=mX0SZZWixclVBiTKvBP8QND07jtUelDBrKO0Y/gccQbaYbpcnJoFjQAkSM5KcgRq4F
         oL8pw478VB5vGO5113sUvDBUN3jXYrtxRDnYpbuB1mNRqrgaSZMB2eBwF/06lYp18uB7
         dmT/eGvenyKEC1Ujuvi85CxN6H2sC9X3rz78c3WHNbAM+yeNaQPgV4uMAIyaucGgdvz9
         EtllxXhZl7PUZkfZV13c44vZ3U2Qn46HH5j5sP5Z1pkkS/yvPqIeCjhkLk/5Qr7wOzVM
         q7gPBWp0t8PgJhswCUV/tFrAMmqZecMLNbLSSfGzmZrWandUxze6pNqrsrkW17od1t0c
         WEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749924910; x=1750529710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apK2Hae7QVQW8sVcfdULJFrMHKxa3eLsLFIQMUAHMeE=;
        b=pgAM5qPmExM4anzXHNXL7kSpWWftCum2cfheqn5oaC/+pJvHeAQDYrjS8hI2JbDQ99
         xmgZO4dw83/SsIyPDp9uv+wUGtZsp27e4Un/WE4Uqa7ARxsHTYT/tbP20hXzXrChcL3i
         u/5EeM7Mo3g5RBAicGZUR1IE8d1HIdz1ywSmadzq+rFeG8i9d6WobW6q9ZcW6F+DsP6l
         DtT1XoOZMXtgDIRCXCM/fM3XO4bb36iKDddNenkfsehYZ6nqlVxDmj4e8WcvoV6XVfbV
         gGAQXiYf/j9dRYuc9asbHyUZxL2wFh9Y2X8n0qG/EgbrIxs9Nbg/XVuPqlGZa3abjJiW
         cRbw==
X-Forwarded-Encrypted: i=1; AJvYcCU0SJMlUmeRnIjpryGCt4FYNBPWNTljtRA/EYXDANdt47fN5VbiZhZWCfampXrimPTY2co2jM9+SsXat+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSS8gGvaQFAsMRA/myZC0OM2S8989Sa3BXCVWAWnEn/kR8qecb
	8FR7Kow6KzSn9KwZ2piHvTlPQ4B35Hf8z6tCfRDbRGmW2cldPMZouEyUOkvwu78PR4v2kt+k
X-Gm-Gg: ASbGnct76CVkdwQCvoyrQJqorG+sr/x5l3ygT/Yq0A6eWk79CNpQF0lMnHUoq3dX5zw
	3utw4mDOinZC55IGjl95qI3pSWMcQTNLose//5/GBPLmvjbWcl8JUQiw0CKiERXESkMqpucKBWH
	vztYyoxjG49hrj17woBkW1/CGCLEbSCntIIN0Tw3BAJRhpwpXkAwXiqRX4YTowZMAM5HJUs7QVX
	dEesLfIj8prwsb5fPru0oiUgcUm6wo6737RTLkokEjNLplxMjk9RR85hV83wE1BAefvZr43xr1+
	e8CWZLmhJYbNpUA1HxwK8q5lvQ/oA1OuydYCov50U9yf8XDkoLQpgrq7aSLBDKl7OrYzwV6Uo6m
	Wgw==
X-Google-Smtp-Source: AGHT+IG6q7vHN/vHBeZAA7oir6GZzQ1YYg+JHtWFX9c9V66ye3en/szawBqlTQWpbngZPIMv57Kpdw==
X-Received: by 2002:a05:600c:1c12:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-4533ca46428mr41136945e9.4.1749924909606;
        Sat, 14 Jun 2025 11:15:09 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm88195255e9.4.2025.06.14.11.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 11:15:09 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 14 Jun 2025 22:14:34 +0400
Subject: [PATCH v2 2/4] arm64: dts: rockchip: add SDIO controller on RK3576
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-sige5-updates-v2-2-3bb31b02623c@gmail.com>
References: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
In-Reply-To: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749924902; l=1453;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=+R55JLPva4RxIrp3zXjLnnlES7uYtBgDS2XhRWk7w0Y=;
 b=lQ8gtAauPmLTaar8ct5JF/6gWJkN/9mNycR/7CqdRijYPpExgkmwe2W+HwUPoPvoTikFoFueB
 xsRMyp5Pe/7C9MoPRaip4yPdcJjhUDoiRmK+1fDz1g+a4EJ1/MNNWnv
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

RK3576 has one more SD/MMC controller than are currently listed in its
.dtsi, with the missing one intended as an SDIO controller. Add the
missing node (tested with the onboard WiFi module on ArmSoM Sige5 v1.2)

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 1086482f04792325dc4c22fb8ceeb27eef59afe4..d3225d20baadd56364655fdde6b33113b65484ad 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1695,6 +1695,22 @@ sdmmc: mmc@2a310000 {
 			status = "disabled";
 		};
 
+		sdio: mmc@2a320000 {
+			compatible = "rockchip,rk3576-dw-mshc";
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

