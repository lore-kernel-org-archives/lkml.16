Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3706A20C01C;
	Wed, 30 Apr 2025 06:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745995806; cv=none; b=SzG0EWA1sCLhvvYX6vF2L7nnIqqrK8I5dM5EzIUfboxYT8FNx8K84ywidWgiLiqEukMdwlHc5ZUt94Wn8TUj5AjLn5PWg6Q4ZOLrGANN+IBwGhri1QtHEcL/yHrHUqBFBmgl76hidpz62NuldFlmdIkOc8Ww9s/sbxXfQfcYfRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745995806; c=relaxed/simple;
	bh=7o0PGly54Zp/AzBT/JM05c9KWMgzTPvh4JiH1iVx85U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qD2TYI3I/MGHlrmBx0TAZsav38/KVrnwY7Tsd4qKsxh5vPK+GEmgrSsV1F/ARZ+FRcewcXm5ITugbnVjEjkydQX1yg1phcVTWofB2A+xUeyN4/53dudVotPikrrFAx32/0a12XUu1XMyiqRG8F/xPE4RM19sovcUiOdVvw03lYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngJRZa2k; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngJRZa2k"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb615228a4so118287466b.0;
        Tue, 29 Apr 2025 23:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745995803; x=1746600603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oXm4nz3WDuUHxKThxISaC4MDw6D9O5zwow0ZgRQDyA=;
        b=ngJRZa2k+d4XOpe0J3c+uCV+idMF7iFjsNKRaW/f+DVoyHVetzVdnU01wOFXdagly6
         JbnKFpovYiyTghn7/fVYMy+KVZp9rSb3y6cpC8UeouvC7eP8r6Ot5i0fkZerCV0yVdBq
         sZyEo11ZNORUcB5ygjrol8L0AaLnWF9pOUN7QXprkc13QVcx8bTYmW1bu3G/01tTamor
         UPeLm7tz6NWqPgU0yRKisvtHZW1dNIZKnXa5rrv98BLtbkbhiEjzfqpw434zCNDlMD/d
         Y1/ruhVvovlhb1rDbms86pi4iy/E9QTBYRiNl4z40S8oQ+M8loIFFldLowGXbyUlo+QR
         AVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745995803; x=1746600603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+oXm4nz3WDuUHxKThxISaC4MDw6D9O5zwow0ZgRQDyA=;
        b=byhGKF85wdp6RqqPomhDQyQFVS61Ps5oa/ilijLzJrr5XWNqn5H5j/Atgtu8AWnGQy
         8RGuQRQ/OJBQhcXWQMopCklFNZX511+w/Ve/hAMgXWa5kyTpbcgtODPdNq+LF6/iR0sf
         cFubFml4NndK0+hmo1DTsTCLcEMYvPwtGr0lOmwPnb42Gz3bw+N8K3gPBYjp59yWFVmV
         fZ6waMFXXKQLJqVA6J0SO1EClIzJEuyEk8RLKA9WT09aDusCFtajNCUVub1Kh2WAZep2
         MaO3A3YbWA9+OvFBp6iNUGf/QTqC/pyerar1E5GyP/EB38OBwh0HOQjWK48aISVNPVMy
         WcvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmH9xHvjQ5Y2d7OR1gOmjD6tWyPhzLRaC1tlKZOP70S54HAyjga+HYiywry6oOB2T0OlYFV97jB8Lc@vger.kernel.org, AJvYcCXI8BlwN+/k/Ysznmt0m2Qo2MaQsNPbdQrE4Jz/T1Bm0jRshl9465axgwD/9Jk5xEPXtvzW5E2dGCin@vger.kernel.org, AJvYcCXyjVzbYgtxJYO5qP9ojUMmmegwwEAEOKy7z4QxJ9IxB/rTKN8t8sg3Fbhq80ExanQxzyfXON/ka7nU9xpa@vger.kernel.org
X-Gm-Message-State: AOJu0YzqXiktrgonH6KP1dKcjsYfNuhXwJkb6+1BPH00w/fi8LGBuUyi
	hI5B229klaPpFTM/kUlhz1+mjY4SK4virb5txODowWHKmiMe1izP
X-Gm-Gg: ASbGnctFDJBuHg6Mq59YFzU3Nj4eISktkuBofXYpZX8KasRaD+j5yGz062iN3LGzGag
	caYWGrrVnAmFwZQuII+tCFkqFXUw7YGI5vlLp/wT6mXNRuBaYyIjljH2ChOAVDdleutE4ZBWWD1
	rr/Ul37mdMPW+GFOWdL2lWCK52Nc5ZLy+0qvrtqsbUDS6RWayEafASdqpnoiNHo59jGLGmhNno2
	BY/weRS1DOceYVuYgesIIQylumz7QAzLBAKuZPTby48sEOcZB5dkVOygVZCnnBXbkE/eAQr5h1t
	7YBvhhwMOni2HTaaDneAq+XAlBTvo/sQ37Jvc1D28WwHIc6/sZeg1ZGxm3jPUaach0CjaKIfgP8
	3ykg43toF/dE=
X-Google-Smtp-Source: AGHT+IFHsjk/e+HvU3k+Cfd3WPsaPabVVlDh+uQI6G5na3WSnoI1NcRuSIkqtFWwvUUhuTQ3dclIgw==
X-Received: by 2002:a17:907:805:b0:ace:4870:507c with SMTP id a640c23a62f3a-acedf98ee37mr138059266b.23.1745995803508;
        Tue, 29 Apr 2025 23:50:03 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e5087e4sm881222866b.73.2025.04.29.23.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:50:03 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 08:49:54 +0200
Subject: [PATCH v5 7/8] ARM: dts: bcm2166x-common: Add matching bus clocks
 for peripheral clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-kona-bus-clock-v5-7-46766b28b93a@gmail.com>
References: <20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com>
In-Reply-To: <20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745995792; l=2451;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=7o0PGly54Zp/AzBT/JM05c9KWMgzTPvh4JiH1iVx85U=;
 b=1dA93tYsefhzi4uXLzDvljB0WxnRigvMaDAEHcADOhOHtbEm7BxMbchFf/0n95t8rkzyVwsRq
 77T/WhVPQZ/Df5V2ACeLtCj4Zuc92SR2/qsb355hNs6EqxbRB+LVmXM
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Following changes in the clock driver, add bus clocks for timer, SDIO,
BSC and UART to the DTS clock output names. Replace the usb_otg_ahb
fixed clock with the real bus clock.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Change commit summary to match equivalent BCM281xx commit
---
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi | 28 ++++++++++++++++---------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
index 87180b7fd695e65b52c52743e6315cbcca385fba..ab6ad8c6d326171a6da1762ecd839bd82e9da482 100644
--- a/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi
@@ -143,7 +143,7 @@ usbotg: usb@e20000 {
 			compatible = "snps,dwc2";
 			reg = <0x00e20000 0x10000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&usb_otg_ahb_clk>;
+			clocks = <&master_ccu BCM21664_MASTER_CCU_USB_OTG_AHB>;
 			clock-names = "otg";
 			phys = <&usbphy>;
 			phy-names = "usb2-phy";
@@ -248,12 +248,6 @@ var_52m_clk: var_52m {
 			clock-frequency = <52000000>;
 		};
 
-		usb_otg_ahb_clk: usb_otg_ahb {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <52000000>;
-		};
-
 		ref_96m_clk: ref_96m {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
@@ -301,7 +295,8 @@ aon_ccu: aon_ccu@35002000 {
 			compatible = "brcm,bcm21664-aon-ccu";
 			reg = <0x35002000 0x0f00>;
 			#clock-cells = <1>;
-			clock-output-names = "hub_timer";
+			clock-output-names = "hub_timer",
+					     "hub_timer_apb";
 		};
 
 		slave_ccu: slave_ccu@3e011000 {
@@ -314,7 +309,15 @@ slave_ccu: slave_ccu@3e011000 {
 					     "bsc1",
 					     "bsc2",
 					     "bsc3",
-					     "bsc4";
+					     "bsc4",
+					     "uartb_apb",
+					     "uartb2_apb",
+					     "uartb3_apb",
+					     "bsc1_apb",
+					     "bsc2_apb",
+					     "bsc3_apb",
+					     "bsc4_apb";
+
 		};
 
 		master_ccu: master_ccu@3f001000 {
@@ -328,7 +331,12 @@ master_ccu: master_ccu@3f001000 {
 					     "sdio1_sleep",
 					     "sdio2_sleep",
 					     "sdio3_sleep",
-					     "sdio4_sleep";
+					     "sdio4_sleep",
+					     "sdio1_ahb",
+					     "sdio2_ahb",
+					     "sdio3_ahb",
+					     "sdio4_ahb",
+					     "usb_otg_ahb";
 		};
 	};
 };

-- 
2.49.0

