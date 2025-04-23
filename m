Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8600B281363;
	Wed, 23 Apr 2025 17:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430930; cv=none; b=k42STR9It0q/S5QvfjCsFnWJoEygf4ANvjsKb6oBheXW3h8HvKkV5cG/rNay6WrJbr+6OGru9/CRRX+YR0O8Rsft4S86fr+F2yqAwxXMWi2IefcJT4uFEO7W42xSEY23jpJ25SGNwHSoEMjdNOdtnbrqcktEwZk22nf9nITXhaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430930; c=relaxed/simple;
	bh=LqTlMOTyKG90SxBm+2LsZ2iBreijTKs5MFtLinl8fsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XHNaJKUCWHj0rbeYUH4xNwpFe9GawF5lrvw72AJMUuTW/CkRUmQJ953MN+PKzsTRtdvLH84cWT8Nl3vkjD3niHgzi/JiRrKD2mfZ+UeGYSBlXzlEBYl/Jj/dn7teAgRjwxuamKDKIfQjri9gwfK/VwY2OL8lC2oYuFAtcBjBkXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNvGBCsb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNvGBCsb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BB20C4CEEF;
	Wed, 23 Apr 2025 17:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745430930;
	bh=LqTlMOTyKG90SxBm+2LsZ2iBreijTKs5MFtLinl8fsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kNvGBCsbdqjOAF544rxoGi05ba6IN4WQJTp17lFw5UzH/NVUwtiJWNrOS9czjB+VP
	 vAEM3sfCx9tTVWYT6vj75enijhdyVy15wXh5DCRHv9h12isKyLtO7b/ajoc0zOwZ7B
	 1o8dn+hkR+BeW23r2+64LK58eH3Lpz1EijX4M5kHhxhqbMPngS1w5kiN6f1S8OUOM8
	 v5Lop9Xzu2CZOI2hZmP5zkpO+CK0p1KzhIHsp4edaiWEfj05JWUsK4Z/1VQTpNYoh5
	 gGCUa+YgikIiVQUu8B8KWOZ9lbhQLihpmPOGsHGnvrhUHuusdGv3ZtvC5e2om6St3u
	 unrVOURvPh0ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F709C369D9;
	Wed, 23 Apr 2025 17:55:30 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 23 Apr 2025 19:55:15 +0200
Subject: [PATCH v3 3/3] arm64: dts: apple: Add PMIC NVMEM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-spmi-nvmem-v3-3-2985aa722ddc@gmail.com>
References: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
In-Reply-To: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745430928; l=6241;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=DeM6S5yU1Q9D23iuqXSnII2ozGmlxUQVX++5KZ42rPY=;
 b=Ai7Nln+DzzV3GQSsmZ+tI5PCZmUQAQ4amLuRHrvvziuYtd41qu5TH5212WbhtJhuxcbbTd2w+
 F+Y+V3vr6+BBScoWU/r6wjWSvU8GpOYw3oktJIod+SQhSLjTZXgSDsV
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Hector Martin <marcan@marcan.st>

Add device tree entries for NVMEM cells present on the PMIC

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Nick Chan <towinchenmi@gmail.com>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Co-developed-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001.dtsi      |  1 +
 arch/arm64/boot/dts/apple/t6002.dtsi      |  1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 50 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 50 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 50 +++++++++++++++++++++++++++++++
 5 files changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index 620b17e4031f069874aaabadbf06b7b29ec4031e..d2cf81926f284ccf7627701cc82edff31d4d72d6 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/spmi/spmi.h>
 
 #include "multi-die-cpp.h"
 
diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index a963a5011799a0480f88688fb4372a31f0bbf806..e36f422d257d8fe3a62bfa6e0f0e0dc6c34608a4 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/spmi/spmi.h>
 
 #include "multi-die-cpp.h"
 
diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 4c224e686ffe5602329f7f394d3354559c4130ab..110bc6719512e334e04b496fb157cb4368679957 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -50,6 +50,56 @@ nub_spmi0: spmi@2920a1300 {
 		reg = <0x2 0x920a1300 0x0 0x100>;
 		#address-cells = <2>;
 		#size-cells = <0>;
+
+		pmic1: pmic@f {
+			compatible = "apple,maverick-pmic", "apple,spmi-nvmem";
+			reg = <0xf SPMI_USID>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				pm_setting: pm-setting@1405 {
+					reg = <0x1405 0x1>;
+				};
+
+				rtc_offset: rtc-offset@1411 {
+					reg = <0x1411 0x6>;
+				};
+
+				boot_stage: boot-stage@6001 {
+					reg = <0x6001 0x1>;
+				};
+
+				boot_error_count: boot-error-count@6002 {
+					reg = <0x6002 0x1>;
+					bits = <0 4>;
+				};
+
+				panic_count: panic-count@6002 {
+					reg = <0x6002 0x1>;
+					bits = <4 4>;
+				};
+
+				boot_error_stage: boot-error-stage@6003 {
+					reg = <0x6003 0x1>;
+				};
+
+				shutdown_flag: shutdown-flag@600f {
+					reg = <0x600f 0x1>;
+					bits = <3 1>;
+				};
+
+				fault_shadow: fault-shadow@867b {
+					reg = <0x867b 0x10>;
+				};
+
+				socd: socd@8b00 {
+					reg = <0x8b00 0x400>;
+				};
+			};
+		};
 	};
 
 	wdt: watchdog@2922b0000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index bdb1cb9e406a441e458b1c735359b0148146e91b..20faf0c0d80927b2e18dd966a61b5507b322c72f 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -747,6 +747,56 @@ nub_spmi: spmi@23d0d9300 {
 			reg = <0x2 0x3d0d9300 0x0 0x100>;
 			#address-cells = <2>;
 			#size-cells = <0>;
+
+			pmic1: pmic@f {
+				compatible = "apple,sera-pmic", "apple,spmi-nvmem";
+				reg = <0xf SPMI_USID>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					boot_stage: boot-stage@9f01 {
+						reg = <0x9f01 0x1>;
+					};
+
+					boot_error_count: boot-error-count@9f02 {
+						reg = <0x9f02 0x1>;
+						bits = <0 4>;
+					};
+
+					panic_count: panic-count@9f02 {
+						reg = <0x9f02 0x1>;
+						bits = <4 4>;
+					};
+
+					boot_error_stage: boot-error-stage@9f03 {
+						reg = <0x9f03 0x1>;
+					};
+
+					shutdown_flag: shutdown-flag@9f0f {
+						reg = <0x9f0f 0x1>;
+						bits = <3 1>;
+					};
+
+					fault_shadow: fault-shadow@a67b {
+						reg = <0xa67b 0x10>;
+					};
+
+					socd: socd@ab00 {
+						reg = <0xab00 0x400>;
+					};
+
+					pm_setting: pm-setting@d001 {
+						reg = <0xd001 0x1>;
+					};
+
+					rtc_offset: rtc-offset@d100 {
+						reg = <0xd100 0x6>;
+					};
+				};
+			};
 		};
 
 		pinctrl_nub: pinctrl@23d1f0000 {
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 950d1f906ba3023c1d118179207a2099345aae94..e95711d8337f6cea898e88a3d564caf2c4f94404 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -787,6 +787,56 @@ nub_spmi: spmi@23d714000 {
 			reg = <0x2 0x3d714000 0x0 0x100>;
 			#address-cells = <2>;
 			#size-cells = <0>;
+
+			pmic1: pmic@e {
+				compatible = "apple,stowe-pmic", "apple,spmi-nvmem";
+				reg = <0xe SPMI_USID>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					fault_shadow: fault-shadow@867b {
+						reg = <0x867b 0x10>;
+					};
+
+					socd: socd@8b00 {
+						reg = <0x8b00 0x400>;
+					};
+
+					boot_stage: boot-stage@f701 {
+						reg = <0xf701 0x1>;
+					};
+
+					boot_error_count: boot-error-count@f702 {
+						reg = <0xf702 0x1>;
+						bits = <0 4>;
+					};
+
+					panic_count: panic-count@f702 {
+						reg = <0xf702 0x1>;
+						bits = <4 4>;
+					};
+
+					boot_error_stage: boot-error-stage@f703 {
+						reg = <0xf703 0x1>;
+					};
+
+					shutdown_flag: shutdown-flag@f70f {
+						reg = <0xf70f 0x1>;
+						bits = <3 1>;
+					};
+
+					pm_setting: pm-setting@f801 {
+						reg = <0xf801 0x1>;
+					};
+
+					rtc_offset: rtc-offset@f900 {
+						reg = <0xf900 0x6>;
+					};
+				};
+			};
 		};
 
 		pinctrl_smc: pinctrl@23e820000 {

-- 
2.49.0


