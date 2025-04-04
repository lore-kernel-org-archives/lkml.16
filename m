Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A9313D531
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743793913; cv=none; b=CIa6lVBlIbouV/Uo8AzpyJt29gLb2shACWHaCMO3L2F3bumtpf++iuAW/scfzfLzz9TMTkm5Vyn+wQX09yePxhsUoFZrCY78JZHIVPeCo2kmUS7gxNLftxNHPGBsy0Gb0Jt57UcObupf+4LHINS4JzIKqsPbjxZ+k2uIJ9YC+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743793913; c=relaxed/simple;
	bh=xi19atCPonx7ikyWbXZW2dlKdhfpRJYt1yc54MrA1E8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S+xux9gdx2c+yTgyJt+k8s7evnwt+lL+2pL0gjBmWyyb+RmmNU/y9e8p3y3xCzl3yWQXXxiYSUZeJJsr3CM+fuoc4Zw7QkpH37PCr4QjHieeE+f0kRkJcG2r4aMD4e0iWxOX1GjhXIUM6uXnTTkvzactRxaYpyPed+g1BiXRCTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=I9WM4FUQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="I9WM4FUQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227b650504fso23665285ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743793911; x=1744398711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P2Rxwu2W6v3oVYS31v0sGvc4FOg7imKPmmcVRwTmg0c=;
        b=I9WM4FUQE2YS8rqE9cWKA7dC1EGNG6c7Jn7osTv2Mrj1wJ0wkw4lRdfB/J9Jf7bVav
         5kW1TBC9gQJ7SSgo2H+ialXjRtrSJ2y0qCzBjH9tDZq4xhHWNXRAmFBTXS5R47uDW9HI
         nKaxMbL6Vkz96Y5xcvkE0LXiOXaIOTtDUk+KvX/+JldhDsnS36Ijm9CVs5AQZzvE1Rgo
         qMQd42uEAiDsCEzkXj5RUFeUHohcP6IzTqDg3LP84AXLurAlbq4r8wZNtoRYQEzTxBkp
         fQWXCVsQeIfma7N0+fDx8ivb1neK3XAHOiqVAHgtUwqVR5uS+wFK+/vihfhQgvqQrKy6
         JrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743793911; x=1744398711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2Rxwu2W6v3oVYS31v0sGvc4FOg7imKPmmcVRwTmg0c=;
        b=cz+jyya1SaqOxUYdbxKSizALpsKYazZIl1U1EB8tbLjGT2kbIG98Ib8ouK+WeMNPBQ
         S6P5rUpE4y/ip5dQ6JAkp3KjLiRw/qgJxfy4uLoXlpeIkU3+Fye1FckGxtyRdxVAgRqv
         y6m6P8NWfe/wOFGfhBrki+lod3RFnuIFlhajxF4KPJT5ij9pV6mglIOTUjPidkz1PXRa
         zxd9hzB0xAArK2MS4sYHcFG1/OIi48IlvKaZHjm8LnPy7ZIohIXo23jeUBf3yvmWZ68R
         YZsoP3l4KleR3RLc5sipWZpOHoiBOv9WwWjkh1W7sPxr+xG6ik6aDXwTNr7pkfOyn93q
         Op/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbw2203B7wyXen0t18aA0zGJeUdUZKAEKEo4zbBQxiaBTQetJkOyORbnD9qWT/ENz/qRJEfrC/McMf5wo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYLMkYjzHm5d+pW0B6UjjMbEBGh2WLyOn2UbXkVMk+1XueLjz9
	tmMk8R7j2ap4l4hXyGjNwuJMKRueC9tj87pxCFHqiMHCbRF8sArY7fzd49v93Dw=
X-Gm-Gg: ASbGncs46p/5KF+nxELlW0SHdC1TqQisO7ikcjffjN1HBp1MkkNQ/ylrokwh573A4T/
	PZyqW9zEHSp/DRKZMIfnGEZ1mbNEr1Hp4Scura72RWA+mMZXksMT1ukCdS0A3zyxTPIM4jeViTc
	AmVQXwXSu4cnHG4dOLMNZrILEopeD+GxlK1F83ZSQ6FhiJtyXRd3AmgcRa+W1dHtvIwrHJgB42W
	h6v4O3EOZihvfjqtbVpA0kLYtqTagzW3vTNHCnZZlEPXJVm/BbpkVuVhh7505ZGmQNKqk69Crxk
	IS13YzBHz6syUxo3Wi3Vnt65gkrEZqBWMu8180fGTNjZAb1kJrsP7Fn+WrE0QC5GQLom9VbKQEe
	Ytn1qqquUezpHvuFeJmy0upi/H0xVpNkj
X-Google-Smtp-Source: AGHT+IEeaWCRdJ1SjZlMdTv0mv60UblHOMQY35gjKkojH5fDMz6tEXAoQmV0/K8Q81Wh61GvPwgWpg==
X-Received: by 2002:a17:902:ef03:b0:21f:6fb9:9299 with SMTP id d9443c01a7336-22a8a06cc5dmr54287345ad.27.1743793910520;
        Fri, 04 Apr 2025 12:11:50 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:2c9e:1e72:3ae7:b81c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e1bfsm36105765ad.168.2025.04.04.12.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 12:11:50 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH] ARM: dts: nuvoton: Add MMC Nodes
Date: Fri,  4 Apr 2025 12:11:44 -0700
Message-ID: <20250404191144.4111788-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have the driver support code, now we just need to expose the device
node which can export the SDHCI and SDMMC properties for the 2 MMC
controllers in the npcm7xx. Tested on real hardware to verify that the
MMC controller is functional with filesystem access.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index e337f40ae0f2..791090f54d8b 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -149,6 +149,29 @@ gmac0: eth@f0802000 {
 			status = "disabled";
 		};
 
+		sdmmc: mmc@f0842000 {
+			compatible = "nuvoton,npcm750-sdhci";
+			status = "disabled";
+			reg = <0xf0842000 0x200>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =  <&clk NPCM7XX_CLK_AHB>;
+			clock-names = "clk_mmc";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc8_pins
+					&mmc_pins>;
+		};
+
+		sdhci: mmc@f0840000 {
+			compatible = "nuvoton,npcm750-sdhci";
+			status = "disabled";
+			reg = <0xf0840000 0x200>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =  <&clk NPCM7XX_CLK_AHB>;
+			clock-names = "clk_sdhc";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sd1_pins>;
+		};
+
 		ehci1: usb@f0806000 {
 			compatible = "nuvoton,npcm750-ehci";
 			reg = <0xf0806000 0x1000>;
-- 
2.49.0.504.g3bcea36a83-goog

