Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A731A5BAD
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 05:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748064104; cv=none; b=jyKR0owI9pUOvtuM5OK6oRCN5J+tse+MfZmIV1EDH0etJUTLFig0edb5LgIQr6SgSuPLKOlv9Z42WmFT/oybWTAhzGHXzgfUPGKTVZu6HI7+/F9/AZms9Q8nN6DbAT1F7E4xWAoklLdKPvLB4mgcN2WJj+9/QPfeJgTEf+XdwE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748064104; c=relaxed/simple;
	bh=CxJGVYe9gQWEypwBZmgwMYlPMVvbtIIqNvj32ACzzR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N0Tf5BVpSZMSEDVOSo/m2SIf25nodG4jyUnbbapjcXNCMZAMHULLnxyT4T6zp8nFCAMg1m5r/cmjos4MnMgh6jePem+RVDOOxP3zhVZEo7YECS4FvVnwcSt2eeiKpcaqQ72Z8w3HOndUs1NuyGUftc/EPxkDjkK37YstZUr/fJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KzTJ7w7J; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KzTJ7w7J"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so77154766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748064099; x=1748668899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9Vj2sz8u3fgQAY0zH4yjJJsJuXYHYmr/5RzLXpeQpg=;
        b=KzTJ7w7JRU3uBYTnn09a70sQrd+t2FrMKTBGh1Pk9fvJO4MP/n6rM0Ew0dfZLojAFG
         SbLax91wVaPUvRpU50mJEU0MUpKGXwRLyhUlfxO/hFXz+NmEb4jurvsQCx3nAuYMrMaB
         kFWJPl5ohPi3xG9wgKkOC0ia6cnll7XScCDw68S5bwMZ2RFogAOgaVu39mK3cuuKXokN
         Z2lIvUfL8XYH0/j+e3rXrKFSysz8Q5NrbUB/muR303vteLrvMzcfUe//8bf1MZcUP+fL
         ATN/MObBzyv8i0YuR77i1u39YZ4o86M8bV4ScJEQBqtva9kWCoCnRyJt/3jwpzyYZii1
         mVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064099; x=1748668899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9Vj2sz8u3fgQAY0zH4yjJJsJuXYHYmr/5RzLXpeQpg=;
        b=wWdzwVHaeZAa1LJvdlJlVFfoYPnonMtfzQlJ1PIZq5I1JAGTuR+FnMdobHdJ1B7VHW
         bsC3YCt+2qmPdJlCewPq9DvSH2b6oX5QyOQ/5kv0MrhkJyKWB/CqEKuYXqBCK/ue1ssS
         h20LFTkGt4iVBGLRRSILYQGABgl7NcR2bqZatxxeBw3KwOe+au8T0ix4KSEU++Gwm1uf
         lsRJ5KLn97q0pqfQbRW58latNZW5q2tCG7rZERHIX4Ixturlatu/76OY8GuznF5JBg4n
         C+UZcmdQTj/hih7tyz7fCtoyEAsdy4oLBeyemp0qr3l4QPbM3tuvCuJ5d+3R+9NW46h9
         LUag==
X-Forwarded-Encrypted: i=1; AJvYcCV3/UaE9kDuDSsCKvBA2ruMqzBRUPeL4Oo559npcyGOOsMCIVmw8qaDc52To+7KI89qOiqjCzOUKj7fbVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR8tvEf5E0Y3HkTecMrDqwo+hoZx9BqvSOh86bLGwhTaz0AKs0
	zFN4A+Pv2SH83F3ByTalBWbfU4ITGxNUooyx1rcOEjuIY/J3dg7VPptMgVlKAzXguQ0=
X-Gm-Gg: ASbGncus3f8y4elfzqsig2mehS9h9Xumh3FYuHjYZIwhNYcM7mzj0qE6lOjUZNmjFHL
	Q0DlOIdFFBYQNtbzaAzhkGUoErxoa9BV3gUWwaNowGvTF/AxjRnnbajaW1xSwO6KFEa7KfnAMIa
	gj1E6PAzKy6wxGXhPbF5rfE13S+IYKS6SPmNaeNHnIijGRckPGAuM7npX9z5k6sF/3eD3Ta4ptF
	08aGZNal0Cmj13UWGF3GTe7I7nL2hRdiF4pv2q/dlsAjgdyGW298ZeyjnYNo1mY5b7Qb2/spFht
	G4fyoN96O18qZKREju8BcK01WDcYI8tEtDeYuYWRL4M/0zU4ML7iJY+sd78UL8nSUqFlBrB5V7r
	itPUQWcn7J9WeLARZ2wmokmFtdTgvorPmjLY=
X-Google-Smtp-Source: AGHT+IF8pgsRiLru+xzCs3/kYK9IFFjLgdgCKETe4qhqLvBb/0iNzUicN2Yb4j1NXVYdjuG8Y5CZ0A==
X-Received: by 2002:a17:907:d06:b0:ad2:2ef3:d487 with SMTP id a640c23a62f3a-ad85b329c74mr142108566b.58.1748064099139;
        Fri, 23 May 2025 22:21:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1106778066b.178.2025.05.23.22.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:21:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 24 May 2025 06:21:29 +0100
Subject: [PATCH v2 2/4] arm64: dts: exynos: gs101-pixel-common: add Maxim
 MAX77759 PMIC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

On Pixel 6 (and Pro), a MAX77759 companion PMIC for USB Type-C
applications is used, which contains four functional blocks (at
distinct I2C addresses):
  * top (including GPIO & NVMEM)
  * charger
  * fuel gauge
  * TCPCi

This change adds the PMIC and the subnodes for the GPIO expander and
NVMEM, and defines the NVMEM layout.

The NVMEM layout is declared such that it matches downstream's
open-coded configuration [1].

Note:
The pinctrl nodes are kept sorted by the 'samsung,pins' property rather
than node name, as I think that makes it easier to look at and to add
new nodes unambiguously in the future. Its label is prefixed with 'if'
(for interface), because there are three PMICs in total in use on
Pixel 6 (Pro).

Link: https://android.googlesource.com/kernel/google-modules/bms/+/96e729a83817/max77759_maxq.c#67 [1]
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- update commit message slightly
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index d6ddcc13f7b20c6dfbe92e86abafe965870d0c78..de5c8d236b705505c0745827c5c6b67d94ba6227 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -188,6 +188,60 @@ usbc0_role_sw: endpoint {
 			};
 		};
 	};
+
+	pmic@66 {
+		compatible = "maxim,max77759";
+		reg = <0x66>;
+
+		pinctrl-0 = <&if_pmic_int>;
+		pinctrl-names = "default";
+		interrupts-extended = <&gpa8 3 IRQ_TYPE_LEVEL_LOW>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		gpio {
+			compatible = "maxim,max77759-gpio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			/*
+			 * "Human-readable name [SIGNAL_LABEL]" where the
+			 * latter comes from the schematic
+			 */
+			gpio-line-names = "OTG boost [OTG_BOOST_EN]",
+					  "max20339 IRQ [MW_OVP_INT_L]";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		nvmem-0 {
+			compatible = "maxim,max77759-nvmem";
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				reboot-mode@0 {
+					reg = <0x0 0x4>;
+				};
+
+				boot-reason@4 {
+					reg = <0x4 0x4>;
+				};
+
+				shutdown-user-flag@8 {
+					reg = <0x8 0x1>;
+				};
+
+				rsoc@a {
+					reg = <0xa 0x2>;
+				};
+			};
+		};
+	};
 };
 
 &pinctrl_far_alive {
@@ -211,6 +265,13 @@ typec_int: typec-int-pins {
 		samsung,pin-pud = <GS101_PIN_PULL_UP>;
 		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
 	};
+
+	if_pmic_int: if-pmic-int-pins {
+		samsung,pins = "gpa8-3";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
 };
 
 &pinctrl_gpio_alive {

-- 
2.49.0.1151.ga128411c76-goog

