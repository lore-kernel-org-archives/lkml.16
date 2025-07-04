Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FB016A956
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 01:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592048; cv=none; b=pxEJRpLG9A4EnIvGNO7ZJU9lXFrfVTgR62jiIHAGoya5OGy6zD/zof9q9ezrPMbe8taxsfY+yvPdNPWr7JrX0rTyP/rbqxJuX636cVIfFZVMksuOWw6Yaizbuf1xt4RrK0X3eS8PApM9CJk2AuZqMlgiVGSvSaI9CxWtONP3c/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592048; c=relaxed/simple;
	bh=EKADNKUOgcvSk8Q6BTbOeHECDDwL51pLlaVHXkuF9ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6sesOjOgkYUk86A/sHvXJoAXPT0SFOA09oI4jriFIV6PIszH0pndAaYVisgm0BmD7gvKpVgW2rWpIeI/cWyNxsVAyWgx8l/rHaZSWSOfmMaxbVPmPm6hyDZU/3WunR0tH2z00w0DPNaYh4ezgn0X5OdNDu/lxf9zIs39us8wQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TRhmP+4Z; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TRhmP+4Z"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-735a6d7c5b1so349898a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 18:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592046; x=1752196846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7CrtMSRtoJpcPfB9qnSXOsewkw4Z1pqaBofqmAf1qY=;
        b=TRhmP+4ZN2cgqp/nAQmEmS7AcH1GtB+zTe3fxY5hmhnHOLQaEK6Pi1Ru/l/yqXmpVA
         HctzQ8cKxhMfRyza7N0XQZl9BhNl2/BbEuugZuCHdaB5erKPPO67/UnB2PhDu47ckzSv
         if3iIXAbR2RJBWsqee6xKGTfO1UU2eFSLl7EDpZY9kUN3pknJ3vH3mqr0+dVqP36Re5u
         bJgzyieV6+sdwvluNYPmmvFyAkOohk2wtTUQjlsQEGizAU5erPtoivdkwSfS4YlVKfMR
         fthzuLFXkrYUv8LBMKrOyKJnQqjhrvAeigQ8aF8b+6VbhNL1lsZBAbFcTXP1Bzv9tyw6
         gFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592046; x=1752196846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7CrtMSRtoJpcPfB9qnSXOsewkw4Z1pqaBofqmAf1qY=;
        b=OaNCPy801VOBI5u1logl00OX5zxGxfe1FiCzvOIn2hOU1EbZsBMKZwz53c+opAQW90
         7/lyIDGqortLtOxL1IS/boUy6uJNOBfd9Kt/rRmH1ye4i5uj2a45u5gUSjLbDOUJwlEL
         6tGST/tqgj7Fx/ED7SOBOjQVe5mOuJMYpCxYS57zYmFY0v49wGEs/Z3mOgYGnhtJ66cM
         0gzZdH7JD+aP3dcbDR/nchhXN14mg6vF1rKx2roAIGfw2PBfPbwgErtmSXRUU2uVkvNR
         69SU494isX//z6xUR4jSPkGdbrsew3T83nHTr/fn5Yk1Zgcqkjtgsgq+nbb6AOR6OFYK
         Rzvw==
X-Forwarded-Encrypted: i=1; AJvYcCVIWgexfTo8TWW6HuNSOUwRklLYWK8Ubf1x6jHz9ll2o9eibjYY9ciOvjIFfpoarI1K0zgJChFKABzZ2yE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKBr6+DEE+OSnmk/4/A/Ky/35TijlC6gq6Ymd8cTVP6syTQzC+
	ii60K9+Ov3JbqJvg4nikeqPAc4jdcOneT2pwOMkj7VDSJappuryG7ca8MpoeznjtUQc=
X-Gm-Gg: ASbGncuDo7rKZ275rEwBAjqGATLtNeVjsuGZDH93AlQGxD3kPt+uWvsNCi1JMthviFi
	D2Zua05/L6QcaT62n3tKDrs9ogjoHg2+k0+gAT+OvNjQb+z8++5/jSN1zhnI9/Gw+o79H3VXUc/
	ncZUD3M37/WIBrRN6OJgez3Z1zay/OM+T8MUmKM7UlXjkBk8lHBuvXM/UAxUJJNVve4HrgGW/sx
	n6xx0ZdoUeBbE1xwePAlkaF0ZciuhCFu488cuusbysxXtD1HAJ7+uRpKSmbZPUc1kG9dV0kk/xI
	XxEOVg7HlgrhQmAxM422wk6FT+BuMh3Dyln98tRVBGLjBlU5G0SjzKlhUmGtOWJ3LLwTdQ==
X-Google-Smtp-Source: AGHT+IH4YcJJL/QSinLf0papR/EWjmhqn+rfvAaSq4Pn0BhKlOqBtDpJZuz+HI7qT2qYaiQUGHT87A==
X-Received: by 2002:a05:6830:8204:b0:73a:6d48:dec6 with SMTP id 46e09a7af769-73ca489e0d3mr227940a34.5.1751592046061;
        Thu, 03 Jul 2025 18:20:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73c9f9621f0sm204964a34.61.2025.07.03.18.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:45 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:44 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 4/4] arm64: dts: s32g: Add USB device tree information for
 s32g2/s32g3
Message-ID: <e3e5041e-254d-44c3-b645-532d4d7a8f9e@sabinyo.mountain>
References: <cover.1751591078.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751591078.git.dan.carpenter@linaro.org>

This adds the USB support for the s32g2 and s32g3 SoCs.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: New patch

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 23 +++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index ea1456d361a3..4be6534ed01d 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -376,6 +376,29 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		usbmisc: usbmisc@44064200 {
+			#index-cells = <1>;
+			compatible = "nxp,s32g2-usbmisc";
+			reg = <0x44064200 0x200>;
+		};
+
+		usbotg: usb@44064000 {
+			compatible = "nxp,s32g2-usb";
+			reg = <0x44064000 0x200>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
+					 <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
+			clocks = <&clks 94>, <&clks 95>;
+			fsl,usbmisc = <&usbmisc 0>;
+			ahb-burst-config = <0x3>;
+			tx-burst-size-dword = <0x10>;
+			rx-burst-size-dword = <0x10>;
+			phy_type = "ulpi";
+			dr_mode = "host";
+			maximum-speed = "high-speed";
+			status = "disabled";
+		};
+
 		i2c0: i2c@401e4000 {
 			compatible = "nxp,s32g2-i2c";
 			reg = <0x401e4000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 991dbfbfa203..191d2dab4254 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -435,6 +435,29 @@ uart1: serial@401cc000 {
 			status = "disabled";
 		};
 
+		usbmisc: usbmisc@44064200 {
+			#index-cells = <1>;
+			compatible = "nxp,s32g3-usbmisc";
+			reg = <0x44064200 0x200>;
+		};
+
+                usbotg: usb@44064000 {
+                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
+                        reg = <0x44064000 0x200>;
+                        interrupt-parent = <&gic>;
+                        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
+                                     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
+                        clocks = <&clks 94>, <&clks 95>;
+                        fsl,usbmisc = <&usbmisc 0>;
+                        ahb-burst-config = <0x3>;
+                        tx-burst-size-dword = <0x10>;
+                        rx-burst-size-dword = <0x10>;
+                        phy_type = "ulpi";
+                        dr_mode = "host";
+                        maximum-speed = "high-speed";
+                        status = "disabled";
+                };
+
 		i2c0: i2c@401e4000 {
 			compatible = "nxp,s32g3-i2c",
 				     "nxp,s32g2-i2c";
-- 
2.47.2

