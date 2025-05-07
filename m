Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F7928C2A4
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627325; cv=none; b=Fj5GKYVp7EqoKGVTIGhfBH7RMT0+Skb0NCrkdxEp7RI+4anwo+wk006rxvyDMgvKzqs1wnxzn02ENoy1484Rah1NWLJHF83rfczcS2CvXLhpuYqj99CN3wTI586htGZS96BXzQ3xufmN0pvwe4LnSjo/83nBeTmZA0HBDcOMWH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627325; c=relaxed/simple;
	bh=RKMneX1wQOhwOyRqZHFY/RTQfW6urNlhtUZHaTk0CvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzNmKVt3zonDubRLA/9gwWKEILuvOCbxxllmCtZUFC9jNkJFY1zLx4jBW5ZjGtqu9COYBLpajqUxSXu0aAMISLhigVGo7qvW2PF9ieNhknD2ntyOC1ptG6nbvXCpYh9R1aWO1zznBb5T9kNdAz5uUYvQsvFP5axUo8WakAtDKg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=V7JN6WA3; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="V7JN6WA3"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30ddad694c1so74074481fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746627321; x=1747232121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8kbahxvpfkE5SUIJ9O+RAhHkMsjfPizkD68mJarweeM=;
        b=V7JN6WA3kO9kuBo1l87bOyniRKlsIKllpzU1KwqWf2Pl1IGYAFv2HWs3Z0OZpWqIWP
         2wtHHx1HtCiliJ0eFha76/mlGh8as/sNzPBj/PACgPiRfa7S4Gqs40L1wGiDLee5aLeS
         tN66l8tHbbLNdhJsmgKsnsLXvjSPqK9xctC/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627321; x=1747232121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8kbahxvpfkE5SUIJ9O+RAhHkMsjfPizkD68mJarweeM=;
        b=UcL8S4neYzmDeXcR2Voq5fauxNbnWxci1opn6NhW+DZK3lZ4Wsq+AOYtJh1Rhfm3Yu
         TaJImP9vnAXd/MnU14J1QFobm5ybU+jlQg5OK0slszP81VAumEf3H7muGY3uqlwLAo2W
         7zsp89O/kptHsdwaHaL8qKLiEm3FSx0vWgFSTCmGV1gT1sGtquqHHQL3Ey2M4bpZKwLx
         i76DzilCRt/fRDsVdTfUvpoLx5031CBoKwSLoiHmMvC6obAlUiheijIAdg46nSwI8Au6
         w5QaR9T6rrlDUWM8ApLFph/vwFOEeIgByJFDap09tSZCtPbit6KTrh+5n+zD2fkPbVnO
         Q2UQ==
X-Gm-Message-State: AOJu0YwzY98zZw9NrKpe3xOdz6JWPymUeWftPIJlIwi+q/7XRWinbi0g
	z7EtHo1SO0sIbQAT1nkGOBfRdrZYHtmNhdu+94IdUgqLyLJLQPoh4Iy1u/qJg79JKF69mGgXs6I
	M
X-Gm-Gg: ASbGnctBJ4sfSduX9nayQIkC3/7HGALBAx3g1WHJWmjZbj1q8ivnzHu1J02RE+S66l2
	h6qOMPr2EK+ITQfECUNLMh+YbP+fNeF/PD8WoiDg2as1Qqq3r9Fwofa3wSX5GoJtoc4Vg+J8ueH
	9kT3cvSR9xvhHnFyc7YfQh/pbATzmiMz790/M48ye7OAYS/vzocjGVXY40UJje28qF+qaszgUvZ
	/Rdpqe+66EScoTpxnH5sNnKv4sQJeMPYM8CpOXXjqPt0VqeMz3GNS5LaWCyIZIbWWMtJIju3jN1
	Dr66RtIUzPkjVNF/DCCW4qW3OwA/FegMvDZHyh66GZRq7ehh9hEhKBuoYRJhZq8m53T914j5Khl
	9qYt74x2w7VYdeRSbGDquYNglOdHSaw==
X-Google-Smtp-Source: AGHT+IHdlj7CpNVBpX0ik+NG/wdlK6dMWu7TW5P7ZwM+3Yc0y5PuGMTHr+/cHr3uiayAfwmPefwgnQ==
X-Received: by 2002:a17:907:2d23:b0:ac7:4d45:f13e with SMTP id a640c23a62f3a-ad1e8bc3151mr378991766b.13.1746627310389;
        Wed, 07 May 2025 07:15:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c02f3sm927944966b.92.2025.05.07.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:15:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: mxs: use padconfig macros
Date: Wed,  7 May 2025 16:14:58 +0200
Message-ID: <20250507141504.1332054-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert mx2{3,8} dts files to use the padconfig macros defined in
mxs-pinfunc.h.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts    |  6 +++---
 arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts     | 12 ++++++------
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts b/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts
index cb661bf2d157..613f13b6c8a8 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts
@@ -93,9 +93,9 @@ MX23_PAD_LCD_DOTCK__GPIO_1_22
 						MX23_PAD_LCD_HSYNC__GPIO_1_24
 						MX23_PAD_PWM3__GPIO_1_29
 					>;
-					fsl,drive-strength = <0>;
-					fsl,voltage = <1>;
-					fsl,pull-up = <0>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts b/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts
index 0b088c8ab6b6..fad08f6c008f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts
@@ -83,9 +83,9 @@ hog_pins_a: hog@0 {
 					fsl,pinmux-ids = <
 						MX23_PAD_GPMI_D07__GPIO_0_7
 					>;
-					fsl,drive-strength = <0>;
-					fsl,voltage = <1>;
-					fsl,pull-up = <0>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
 				key_pins_a: keys@0 {
@@ -94,9 +94,9 @@ key_pins_a: keys@0 {
 						MX23_PAD_ROTARYA__GPIO_2_7
 						MX23_PAD_ROTARYB__GPIO_2_8
 					>;
-					fsl,drive-strength = <0>;
-					fsl,voltage = <1>;
-					fsl,pull-up = <1>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_ENABLE>;
 				};
 			};
 		};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
index d004b1cbb4ae..f170df37b3f8 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
@@ -102,9 +102,9 @@ mmc_pwr_cfa10036: mmc_pwr_cfa10036@0 {
 			0x31c3 /*
 			MX28_PAD_PWM3__GPIO_3_28 */
 		>;
-		fsl,drive-strength = <0>;
-		fsl,voltage = <1>;
-		fsl,pull-up = <0>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
 	};
 };
 
-- 
2.43.0

base-commit: 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
branch: modify-mx28-pad
