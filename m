Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94B21EDA06;
	Wed, 30 Apr 2025 06:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745995808; cv=none; b=G+KbWSyoO0+oWU/1HnV947mkTO4a1ScHpA3G3JTTN1Dz3ss9cVjCVlpg91gTezbWQ+egSpWrPoCHkEjMMQyEhEZhTQwzIlVGr1fboaaI9Vy2QsTKGgPNzen46O5MP+GuMUfvcvMwMJmOZDLHqERLk9dHPV9Bj2JFkQYk+kGNaoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745995808; c=relaxed/simple;
	bh=M9rq9oFw+UkWiS2ohCmOPp//dr0JkxVTdRZ0ZPivqko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T/UFz05PcUOSIxn9K/gXy6ucckFLNC6yNuqSM8uDl285eeBsiW5WQWQcIBU8jVLYKsa/Au9ZoeVTlMeIat9CjW3rTfsxDsQstkpvRynlixIfYFFD5vTH3xOPw7noc0Bda5B2TJSULyXt3PnqyD6YVoaCTAeE0adZ2G00Ws2Zyf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1ABVKKf; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1ABVKKf"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aca99fc253bso1057075966b.0;
        Tue, 29 Apr 2025 23:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745995805; x=1746600605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W38qJgQggiQg2lvqTHQjb5sSrqA6eRXyZhsynRatk9o=;
        b=F1ABVKKfLzDL2HwMwvPFcZZkrAnqgyPeC4pbULu/sL3UuTavanJs6SaRVFoLYpma1C
         oKXssq8s+vSpI7K6b4EC8cdiXVce2wYNGpBwijSD5ST2R4a9fND67rxTwe2PnZu7P+Z/
         5Jf5YHsIuBZ2kfk9aZekQWFbPj2MIZhjL85bGJKPCOKC50i3DPiedgB244W4HSgpxIh1
         ogcJKXCv7ObN1JlPgeB8LjC1Yg/c/RwRmJzDxBS4phxUyJhBtUrKjjOlx0a2JbFb184n
         iJgQRzzK31aHqtR4Vm6KDphC59/xC0u27n3NdZv5BD00YTvRC7k+RcZRRDObezy5JwOD
         e9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745995805; x=1746600605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W38qJgQggiQg2lvqTHQjb5sSrqA6eRXyZhsynRatk9o=;
        b=wJcKBo85AHbsd9MrL5wa9X6m11QEGDa3fi/1YFCSM/RREiUa7Pm2dMZ3WzwlgpmVnY
         gqVObiwxql+1ljl1liw3fHGm9hETh2tK2YGHmnDMbGvbSY10+8DfABslR8HyWBb5wESi
         6oJkddMgRrU6+1r1VIApd6MPv6KxQYCAgtuMxIWl4wpxUshzVmAGELGpr0dw2WTjN4zA
         lGmCeWxbnR2b1mY1BDwut/Ei5PFAL6Q3fN+ygdVd+qXAxuKxgwZ7HYK2AxZ0kci+VNez
         /gWyX/0AWStzf0OF1WBWaaOEbxN55XPd9GQlIYSHh4e7eob2DcF8lJhBEAhZKujiWI5V
         aDLg==
X-Forwarded-Encrypted: i=1; AJvYcCWwonkhzq9UQ19GLrYYANOqjF0ZrpatYUGz207OVjOzHPA67Fuo+eYSLBk1+I4hTwC8rxyWz1nc/Nja@vger.kernel.org, AJvYcCXmHgwRPIN2586aJlxHJHO5BFn2O07zH8E5XKHmYm/3c6165W8FZUyzVBwVbnpg2Aco9JrWH8+YqOj9@vger.kernel.org, AJvYcCXtQ+rFJoRpxTImFJklzi9/ByPuv7yCrIpa2GUfi9Pc5SzfPnftj/WZ0a5dJFdtI8yqGOu3gry1nIdQkYvN@vger.kernel.org
X-Gm-Message-State: AOJu0YzgnkEvqXxQcBa1bybibf6MKvqcFC2gADQpRmJzS/MFC5oDwLay
	xQfLXYuPS1D7Qj+mHmSiDAoZtpnaLrxIWuFmLUyhuT7vDZDXMTIZ
X-Gm-Gg: ASbGncs8hbnZRPV4rrT1DjTrSBzOfA8isp0GsMSm1TTDTxda0PK8lDqMyjfe9FSlHMs
	fjLdzW5Ju7q9dPd6DtH4OpgbGAoVA9Cs/FEF/rU569dXy77B50t++KEjAUONAZnO1uWkuGi1DuZ
	qVceIHkoXb8/AX2weKPLEyu48lIPUgrjTAeh1OOzpb23jToUmmBmC3WGM5j3Kj2STyc6Pq7vjtI
	3FCj7dGzzO7rKOn9HWINUtGGiSqK8TwPiDOE2ysnuN9zlFyEkQ1Tu5wyCLdXAz/O/P3a4Ntbzax
	J7CymRkMbS1E9alvl6zUF643O5fk99y+TCZaAyWC3j40SU1h+gG9kQZu+LmI9kV1rzwS6kLYiao
	5VuK0yI0wtuo=
X-Google-Smtp-Source: AGHT+IGi4nr4uu5DwyMe89B/B2XeU0JbtjfUvPVxQheAk6nr7EZaATSMknm1NcmCFyaijtNthI1BsQ==
X-Received: by 2002:a17:907:9706:b0:ac4:3d8:2e90 with SMTP id a640c23a62f3a-acee21ac4f1mr121190266b.13.1745995804779;
        Tue, 29 Apr 2025 23:50:04 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e5087e4sm881222866b.73.2025.04.29.23.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:50:04 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 08:49:55 +0200
Subject: [PATCH v5 8/8] ARM: dts: bcm11351: Add corresponding bus clocks
 for peripheral clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-kona-bus-clock-v5-8-46766b28b93a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745995792; l=2485;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=M9rq9oFw+UkWiS2ohCmOPp//dr0JkxVTdRZ0ZPivqko=;
 b=OdprBJxu6bYvEz4g13X57RkSXRPf141xn4hepWxbKQ+MH/bYARWYLKPBu1VTkmNPn1Ll3fsyX
 aazvhCMBHOBAXCm5bACkm2hqeg9k6rpp8NTuzcygaGSWnWLsxfjEWL4
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Following changes in the clock driver, add matching bus clocks for
existing peripheral clocks. Replace the usb_otg_ahb fixed clock with
the real bus clock.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Add this patch (BCM281xx bus clocks)
---
 arch/arm/boot/dts/broadcom/bcm11351.dtsi | 33 ++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm11351.dtsi b/arch/arm/boot/dts/broadcom/bcm11351.dtsi
index 53857e572080d752732c512ed27f942756d59c46..fac5cf5a46bd9a4b7e09a2e65c3e807d1b4ef960 100644
--- a/arch/arm/boot/dts/broadcom/bcm11351.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm11351.dtsi
@@ -233,7 +233,9 @@ aon_ccu: aon_ccu@35002000 {
 			#clock-cells = <1>;
 			clock-output-names = "hub_timer",
 					     "pmu_bsc",
-					     "pmu_bsc_var";
+					     "pmu_bsc_var",
+					     "hub_timer_apb",
+					     "pmu_bsc_apb";
 		};
 
 		master_ccu: master_ccu@3f001000 {
@@ -246,7 +248,14 @@ master_ccu: master_ccu@3f001000 {
 					     "sdio4",
 					     "usb_ic",
 					     "hsic2_48m",
-					     "hsic2_12m";
+					     "hsic2_12m",
+					     "sdio1_ahb",
+					     "sdio2_ahb",
+					     "sdio3_ahb",
+					     "sdio4_ahb",
+					     "usb_ic_ahb",
+					     "hsic2_ahb",
+					     "usb_otg_ahb";
 		};
 
 		slave_ccu: slave_ccu@3e011000 {
@@ -262,7 +271,17 @@ slave_ccu: slave_ccu@3e011000 {
 					     "bsc1",
 					     "bsc2",
 					     "bsc3",
-					     "pwm";
+					     "pwm",
+					     "uartb_apb",
+					     "uartb2_apb",
+					     "uartb3_apb",
+					     "uartb4_apb",
+					     "ssp0_apb",
+					     "ssp2_apb",
+					     "bsc1_apb",
+					     "bsc2_apb",
+					     "bsc3_apb",
+					     "pwm_apb";
 		};
 
 		ref_1m_clk: ref_1m {
@@ -325,12 +344,6 @@ var_52m_clk: var_52m {
 			clock-frequency = <52000000>;
 		};
 
-		usb_otg_ahb_clk: usb_otg_ahb {
-			compatible = "fixed-clock";
-			clock-frequency = <52000000>;
-			#clock-cells = <0>;
-		};
-
 		ref_96m_clk: ref_96m {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
@@ -396,7 +409,7 @@ usbotg: usb@3f120000 {
 		compatible = "snps,dwc2";
 		reg = <0x3f120000 0x10000>;
 		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&usb_otg_ahb_clk>;
+		clocks = <&master_ccu BCM281XX_MASTER_CCU_USB_OTG_AHB>;
 		clock-names = "otg";
 		phys = <&usbphy>;
 		phy-names = "usb2-phy";

-- 
2.49.0

