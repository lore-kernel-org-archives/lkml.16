Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5711F098F;
	Wed, 30 Apr 2025 07:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996841; cv=none; b=OgpUAmTiictWCkGePDw9jKydY5Zq7OjjAmeYkYQahoT3zL90deYnu+1pzZuu77d1sV58YOFOD28v2c7AmzR8rR0rln1sZN7OdHmcf440HReY3FmmTp2QkIfttb7uTdfWFvqVm7xA28nMJrOD4JMPHBDqNyZfl9md8CRhZxGXyFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996841; c=relaxed/simple;
	bh=gWHaYIo9B3VudHVZ8I6m6gLwDBRYmLzx2Lunvk1Jg8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=akGx+tNqDE3hybYbGM9CaWEUAdVDRck5u5BT6iBNx1GqZ7eVjDwad6WSnErKfXUzvmMCeJSDRw+I9+aXmwfcKHHTs+p8vFAjp+K9M7icohJfVMm+Od2bvNpWw2DNOHufFyramDoq5BQIOUqqGoEMn/nsHN45Lx7fI+jS0Cm5V0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CG+KYfTY; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CG+KYfTY"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso1320264a12.1;
        Wed, 30 Apr 2025 00:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996838; x=1746601638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QtDdKSd6hN5lH6sDk00ZJYQhob5LTcjf68AShtqVBV8=;
        b=CG+KYfTYW9p1ftw3YLbZhrTucPbM0WHlr0KyMYSlkaq+YKGWzir6tfmUvhvN37+0Z+
         6AXpiWewQF9pRQKjcGpNE5JTgSH8pzMfjTivVzVEn4jpO5W7gTzlyBbI87MFNtS8zIBF
         Tn9S1mNRHKaDDksyX86HhputQVoLkKL7A6uWuItIJrudfT29nn1phybcy2Ls+Qmx148l
         otKQHKnkKZad+/c4W8SlFKsHldIjIw/sh8QtULLb8X83WaGwgZnc5/UYisyYFv1fNVJQ
         XYS3mwepOBCzTUOLJ6c6Tq+X7nI046NaTXWjcAVyQe6I0SToabyWeuh3AcizbUqqa0yQ
         9eRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996838; x=1746601638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtDdKSd6hN5lH6sDk00ZJYQhob5LTcjf68AShtqVBV8=;
        b=ht5LQjoT3TrrsmkKA1Fv55I6qlTt/sCXjOnZlitqOzYX/2fRF1PKy6eheLmTbUAg4d
         6GUhEnwrDh31SpvSAq1hwZ5evRiVrf0rj3b3W2A4pjjmY0+qxUVXl9cAZdHkYOwNLaZD
         PZ8q3NsmzL4FgdgWEXkz9UvXdLXr6iugLVqKmWVNiP5BBwRe5n9MBzuacc6yIvFStYAl
         Dy4LGnXyyXr9b31uc8Yg2pHXtx1tE2MTHwotDkt47BxX1Cfj3XKPWyNNVmw2bF0slx2r
         rGzfuALP6MnBSPzt2WDLX+X7/CkhRMH3fLj0DkXk6Ih9PW4WDq3Mi2TEnpfw7S+n2Q6c
         ljow==
X-Forwarded-Encrypted: i=1; AJvYcCWIoAOBGDKjxMlmp8iTrscdEmReokvy/N2J62A4fCEILUJ1mgEjCZ9zQNuvRpw8DkKd53yT5prOTBGqd3kU@vger.kernel.org, AJvYcCXTiLUPnSCZZYJ4wc3LPaOqGI58erDqG7CgwE8XYBFqT0l7HgQ3S48DTy7M99KGSg2XnbFkCk8w2TeF@vger.kernel.org
X-Gm-Message-State: AOJu0YxiA+lmyx8dYp6v3LZxe+8Yy7p5PSkDBayQvG+eiR+KDwXdOnme
	nL7FVlVJJq4o6m+jACJ89qHXH8GNZ/EZCWXY7sO/NCFTyOD0VKX1
X-Gm-Gg: ASbGncv5n7VaOFHiWcgY3G2EBCnOqoEGWU0ChX2I41wDiedVGQHNT3PPUpS09r78UMp
	4p7QvuG0AryddKJJNxeDKD96DHHw7l70Fe8KrqbWEA67Zld1BhO9eKcZ5qDCL611xFvjxzpCFL0
	3g7IgQueu3TV92B7VzrfOKhnzfBHdmuvV2emfs3Oops6JeNGCXW3rhNxwOItZlmVJZhKclVs7rv
	Ds/gQFXdeXOBysx+UqWdoRy6ijT+eWt4JESzpCbWZbedmTWt9tEsrgrc2aHhX4HrtiVmx+fF22+
	R0/LbKDgCuu5kG7Z7LT7Xb3CmJ3N/iYXfWy6j9PdyXvbqbpDpFxANMJfHl6SZhxft++B2Kak96Q
	ECy9Vv7xqK/4=
X-Google-Smtp-Source: AGHT+IGLsEQ2XB9GY0oZX93R83Gm/kDCuM0Gfi+QTVfEqedLRsCSzqXsS1050oalSdYUuJ19J55ccg==
X-Received: by 2002:a05:6402:51d2:b0:5e4:d52b:78a2 with SMTP id 4fb4d7f45d1cf-5f89fe7004amr1565048a12.15.1745996838003;
        Wed, 30 Apr 2025 00:07:18 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:17 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:07 +0200
Subject: [PATCH v8 3/9] ARM: dts: Drop DTS for BCM59056 PMU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-3-e4cf638169a4@gmail.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=4265;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=gWHaYIo9B3VudHVZ8I6m6gLwDBRYmLzx2Lunvk1Jg8U=;
 b=9YDN793N1EYkLoW7/rTMIWadtYdPcuFWIfUbe5118bJ35AYqfaDAHoRth/dpGV9LgREn/B8y/
 KZXTO9opxm3D9iEBhezjtHc3sJ7TellQdkMGWZ2Z+iOxNf085fYk8jF
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The BCM59056 PMU has its own separate DTSI, meant to be included
in a DTS file after defining the pmu node on some I2C bus.

This seems rather unintuitive; drop the DTS in favor of adding the
BCM59056 PMU node directly into the device DTS files.

If the amount of subdevices supported by the BCM590xx grows, and
a common device tree turns out to be beneficial, it can be reintroduced
in the future.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- PMIC -> PMU in commit message
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
2.49.0

