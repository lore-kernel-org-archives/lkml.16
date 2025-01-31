Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF601F2360;
	Fri, 31 Jan 2025 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738347242; cv=none; b=NBtbxW63njK2yFRywfmMmC3HD7DBbO7WVww34E/6lmn6m91h5LEPNVwIfvFL7NxxwIn9gdpZNrt5E6Y0+sW51kRXNGn9Imal/17tKOAmCcefexMEuMu11GGlz/TewDavxxmpb+5QhR7BV/CzmTAe3ySzZu7eevJl5eY8Awz1cLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738347242; c=relaxed/simple;
	bh=oSZj2mqvkLxBORbTCSITwqBVG2fzKvqkrOn5Jmie/9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=laB1jGxT5ZogBknasN0fGVz2KdHrhbu/jpCaECgqwqcW9Dv6f8DQw9JO93na1yC+FdGB8H7udLRq1ezddSRztk/60tlaJPK2OwsO/okwNeZhtIXuX4fRaTQXnd2WY6+Bylkm8Q5eEX7SPDeBOAAy8gdEa53rkxBzg2FjryHWH5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKO4XnUD; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKO4XnUD"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dc82e38c10so1972139a12.3;
        Fri, 31 Jan 2025 10:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738347239; x=1738952039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAPozP4IneH+whBW7y4JwsioLb146azVsz4FWFU1mlo=;
        b=OKO4XnUDATqoZaaQ1uj7idlHaLdASWKkgvlTkYb2k9NIRAZzAfkVe5kGL+0AUnNyrL
         wlnrUD3IfrvPSwlQzzB//7+6Qa69yoOVh83wVqw5pDyAkjUU/DmrmwflvPkzuhNVwSZX
         r1MobWqOlTfsMqvWzAVCr2RHyoi5qnNbcsETTnDklA83zeM71aOd8HJGRhbfvPu3RqHh
         X9kMmOQxJTo6Ez2hb6KFi5myLVFxRocw4HB6AxgfIny4b4VrhcSx9KDxKnoJg1TGVwmt
         XlZPimHzJQsIwYRnKGJkjTqAnd5ev4aV3KV8M3xOHGDRKJzB4/wXqxvj7IP4XAkY68BJ
         9wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738347239; x=1738952039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAPozP4IneH+whBW7y4JwsioLb146azVsz4FWFU1mlo=;
        b=krKp2WTBcjpQtOo8sf65QYC0r4wiORoOKrwOkfumwgr8FnetaUhd55O7BjLKiUqV1a
         6BR41Is3klMHK6ghIqk+L8huserWOF3IoVGIkck1rE8iVxD9HEgPE7MsA6YOXcn7ReDI
         B3lnwrvTqi8Pggc32eu2UrPpEWSR8cNWe4+Y4RR29Zrk0USFWgfWNWDXiJQONkwpV3MP
         OvmI5WyhsOS8wE+6EBkohTeCEYs4RTH5WgjWq8L0jqG4AjUhXVP+fc/z3DALQeXnP4v5
         +ihwECAfPInsv3h3Mr7tK40fLkLhM2C4PYnlX2zc3UFIcNkJz8br2/sa3a3LhCMa6ktC
         uQPA==
X-Forwarded-Encrypted: i=1; AJvYcCVfsph1QyGqWMA5F/+PGfc/ijyAtlt9joOUQ8opkGvIQAjBKxcb+MSoJxFC/+V46s3+tAOL0C6epJhqZGP0@vger.kernel.org, AJvYcCVjdj4I8Nd2x+6NnaKoWX79PezIJb5WzRVSYfDWm1MvuT5ryiiT/7u5fVC+hS1LJIN/C77FSgHpeaNJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yweh2/8Qpqa8seh4Mg9umpI4LlN7ieLhPMQeYTGrsKC7zKziJjt
	AGCxmvDrRRCrwy/UMeCOUFQXwCQj6rkBTDkaUy9ocdnRP0GWympSQB/ekA==
X-Gm-Gg: ASbGncsEyU1757I3noqIEFtomOwJmnG/8UqsYRCPb3yjWujG4x8YTWMn/MXPLIKrrvG
	d46rhO3KyTDRhGFNYSRLmJmdswd1yWfmbCrInS1uhaU6IHCyjib9SjUVntcHXEhQR2Pg5p59fGd
	EfFgenhKcczHgG5XZIbroIGBxgsCXrDeTTCdZRxCo3wbe8nuddGDyMDrvJzKRLTUAtvTobbceSm
	nrUq7es1QtzZ+GQS5wJChVstNCXy8HFnIyOsJ4SYgPv3WW1JshWbX1Cu9oIAPxMW2KyPnObap9M
	zdhfEmHbGAux9ZsVhWdeOU8OpoIrlmYVgCJDl9lfdWLoQf7QXVnO6yrXKUsNEQ==
X-Google-Smtp-Source: AGHT+IHRPj8UwgcWH6OIw9wepi1Xwi6EB7ZtS1zYMWIfFGxWen8LM1yvcLK7/5QE8x90kvED0B3M5A==
X-Received: by 2002:a05:6402:5291:b0:5dc:9002:3164 with SMTP id 4fb4d7f45d1cf-5dc90023384mr60378a12.5.1738347238821;
        Fri, 31 Jan 2025 10:13:58 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff67sm3223744a12.16.2025.01.31.10.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 10:13:57 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 31 Jan 2025 19:13:51 +0100
Subject: [PATCH v3 3/7] ARM: dts: Drop DTS for BCM59056 PMIC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-bcm59054-v3-3-bbac52a84787@gmail.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
In-Reply-To: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738347232; l=4056;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=oSZj2mqvkLxBORbTCSITwqBVG2fzKvqkrOn5Jmie/9I=;
 b=73obPnSj4YDjncrEoMGJIbbHDkG09Jt8NyBm9DLvJVFK79B70Im8wYGlKQWhqaIoO3fnUIzhY
 zgmrX+edcmYAFAzgdASTVPw5iL7QiYXUqkfbGK70Fhyu638boMdrouE
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The BCM59056 PMIC has its own separate DTSI, meant to be included
in a DTS file after defining the pmu node on some I2C bus.

This seems rather unintuitive; drop the DTS in favor of adding the
BCM59056 PMIC node directly into the device DTS files.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm28155-ap.dts | 68 +++++++++++-----------
 arch/arm/boot/dts/broadcom/bcm59056.dtsi   | 91 ------------------------------
 2 files changed, 32 insertions(+), 127 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm28155-ap.dts b/arch/arm/boot/dts/broadcom/bcm28155-ap.dts
index 2f3634545e64978888cd0b47fd5647a5e2eb8e07..cefaa9a3c45c9c90bffc08f739161d8ea21d98dd 100644
--- a/arch/arm/boot/dts/broadcom/bcm28155-ap.dts
+++ b/arch/arm/boot/dts/broadcom/bcm28155-ap.dts
@@ -37,7 +37,39 @@ &pmu_bsc {
 	status = "okay";
 
 	pmu: pmu@8 {
+		compatible = "brcm,bcm59056";
+		interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
 		reg = <0x08>;
+
+		regulators {
+			camldo1_reg: camldo1 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			sdldo_reg: sdldo {
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+			};
+
+			sdxldo_reg: sdxldo {
+				regulator-min-microvolt = <2700000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			usbldo_reg: usbldo {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			iosr1_reg: iosr1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+		};
 	};
 };
 
@@ -74,39 +106,3 @@ &usbotg {
 &usbphy {
 	status = "okay";
 };
-
-#include "bcm59056.dtsi"
-
-&pmu {
-	compatible = "brcm,bcm59056";
-	interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
-	regulators {
-		camldo1_reg: camldo1 {
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
-
-		sdldo_reg: sdldo {
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3000000>;
-		};
-
-		sdxldo_reg: sdxldo {
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <3300000>;
-		};
-
-		usbldo_reg: usbldo {
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
-
-		iosr1_reg: iosr1 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/broadcom/bcm59056.dtsi b/arch/arm/boot/dts/broadcom/bcm59056.dtsi
deleted file mode 100644
index a9bb7ad81378d88811c4473763c579d3d2c006a1..0000000000000000000000000000000000000000
--- a/arch/arm/boot/dts/broadcom/bcm59056.dtsi
+++ /dev/null
@@ -1,91 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
-* Copyright 2014 Linaro Limited
-* Author: Matt Porter <mporter@linaro.org>
-*/
-
-&pmu {
-	compatible = "brcm,bcm59056";
-	regulators {
-		rfldo_reg: rfldo {
-		};
-
-		camldo1_reg: camldo1 {
-		};
-
-		camldo2_reg: camldo2 {
-		};
-
-		simldo1_reg: simldo1 {
-		};
-
-		simldo2_reg: simldo2 {
-		};
-
-		sdldo_reg: sdldo {
-		};
-
-		sdxldo_reg: sdxldo {
-		};
-
-		mmcldo1_reg: mmcldo1 {
-		};
-
-		mmcldo2_reg: mmcldo2 {
-		};
-
-		audldo_reg: audldo {
-		};
-
-		micldo_reg: micldo {
-		};
-
-		usbldo_reg: usbldo {
-		};
-
-		vibldo_reg: vibldo {
-		};
-
-		csr_reg: csr {
-		};
-
-		iosr1_reg: iosr1 {
-		};
-
-		iosr2_reg: iosr2 {
-		};
-
-		msr_reg: msr {
-		};
-
-		sdsr1_reg: sdsr1 {
-		};
-
-		sdsr2_reg: sdsr2 {
-		};
-
-		vsr_reg: vsr {
-		};
-
-		gpldo1_reg: gpldo1 {
-		};
-
-		gpldo2_reg: gpldo2 {
-		};
-
-		gpldo3_reg: gpldo3 {
-		};
-
-		gpldo4_reg: gpldo4 {
-		};
-
-		gpldo5_reg: gpldo5 {
-		};
-
-		gpldo6_reg: gpldo6 {
-		};
-
-		vbus_reg: vbus {
-		};
-	};
-};

-- 
2.48.1

