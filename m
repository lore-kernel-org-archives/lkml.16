Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com [212.61.153.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7059B28935B;
	Thu, 22 May 2025 19:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.61.153.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747942175; cv=none; b=CdHgehT1ev2fDWZDkct6prw8i2gahrayh/VOYCiXRQSa5GJzcZ2CsVS9Jp2HgFfCxZ49G+GuWNl6bD1Lj+TvI4KZJ84VxZ/gSPg8bZloxzr5fpdsK6RQ5IsexFtI3zuM+6/Hf8JHPpbjRjODRh+o3a4jlRiaFDqYM1tcprDYPgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747942175; c=relaxed/simple;
	bh=C1siEeHd/5KKzCsa/rDYOwK9FIq5Jb7UZp1q+zF9z6Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OTmT1lQ3hxYxMwYMsTNNMv4PmNHVD+KTvh0vQ5hslUuW7llpqmxfdpikisSLKVyhWhzP+rqA8hMAsdXUEzfSu7TSmGdVbbKoevQcF2Is/iI1B5QSUcItLaJB7PrfizkoVHrB0OKsCryh8RuuuemnxjJxruQ+UdL/ZxtpTtqBr10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; arc=none smtp.client-ip=212.61.153.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 22 May
 2025 21:24:22 +0200
Received: from lnxdevrm02.prodrive.nl (10.1.1.121) by EXCOP01.bk.prodrive.nl
 (10.1.0.22) with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Thu, 22 May 2025 21:24:22 +0200
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>
CC: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 1/3] dt-bindings: regulator: add pca9450: Add regulator-allowed-modes
Date: Thu, 22 May 2025 21:23:22 +0200
Message-ID: <20250522192325.1099680-1-martijn.de.gouw@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The PCA9450 has support for forced PWM mode on the buck controllers.
Add support to control this mode.

Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
---
 .../bindings/regulator/nxp,pca9450-regulator.yaml  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
index 4ffe5c3faea07..c7327474c64ba 100644
--- a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.yaml
@@ -100,6 +100,15 @@ properties:
               PMIC default "STANDBY" state voltage in uV. Only Buck1~3 have such
               dvs(dynamic voltage scaling) property.
 
+          regulator-allowed-modes:
+            description: |
+              Buck regulator operating modes allowed. Valid values below.
+              Users should use the macros from dt-bindings/regulator/nxp,pca9450-regulator.h
+                0 (PCA9450_BUCK_MODE_AUTO): Auto PFM/PWM mode
+                1 (PCA9450_BUCK_MODE_FORCE_PWM): Forced PWM mode
+            items:
+              enum: [ 0, 1 ]
+
         unevaluatedProperties: false
 
     additionalProperties: false
@@ -143,6 +152,7 @@ allOf:
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/nxp,pca9450-regulator.h>
 
     i2c {
         #address-cells = <1>;
@@ -179,6 +189,8 @@ examples:
                     regulator-max-microvolt = <3400000>;
                     regulator-boot-on;
                     regulator-always-on;
+                    regulator-inital-mode = <PCA9450_BUCK_MODE_FORCE_PWM>;
+                    regulator-allowed-modes = <PCA9450_BUCK_MODE_FORCE_PWM>;
                 };
                 buck5: BUCK5 {
                     regulator-name = "BUCK5";
@@ -186,6 +198,8 @@ examples:
                     regulator-max-microvolt = <3400000>;
                     regulator-boot-on;
                     regulator-always-on;
+                    regulator-allowed-modes = <PCA9450_BUCK_MODE_AUTO
+                                               PCA9450_BUCK_MODE_FORCE_PWM>;
                 };
                 buck6: BUCK6 {
                     regulator-name = "BUCK6";
-- 
2.39.2

