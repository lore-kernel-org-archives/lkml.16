Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F2D1F582C;
	Wed, 14 May 2025 12:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226192; cv=none; b=ri4rRuMTRZoqPcCo1sa1qZ4zEQB83HocAmLb0DyMn50Hs5RJghxc7l0ujqEgzmvANqdfbdyClLRwmxrNOjwlu7VOqrvJtSVW/wjb9NyWvuZ/uVwo6vfV5DR1ycFbzlCNiRCw12rZl/M9sXJdQDfr0FLTPFU5dKhqRL5YnWzdtrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226192; c=relaxed/simple;
	bh=wvsdiJsKD6QmRj9PJvvy8ci556EOSrI0fkrAAdKIOKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PngAyhmSt34RGlSZh6rsNjfp/poD9tcT35dCYu95c8zV9bB5P82uPm1igENfNfAM0cuKxs5gOC7CO4bs0QSOyGI01ymJm0MqiWv6mnqkLkcPkPQwwNA1iewrxNRr+2RobKuKtFS3UaKcnwHk8lJeLit4DH5Q2fX69x09VdomVGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZAGp3nc+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZAGp3nc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747226188;
	bh=wvsdiJsKD6QmRj9PJvvy8ci556EOSrI0fkrAAdKIOKw=;
	h=From:Date:Subject:To:Cc:From;
	b=ZAGp3nc+C+oM1pLvBZf1p1hJ50zvG+FWZ2DUD1ve3bBQIqFDmdBdNPaimrjLxr+XA
	 FoIb2Nfubsbu35iLBy2PMx7JNFL0dxqI5boaMh5GUCoS5lHlPLnnZOWWKnIMK5jdML
	 b/Nsrf/V1a+DJhA0QzVJ2XJYIerYfHPiQTQJVdSg8Vx9sdMwb0scKCIzUlLJQQVRxx
	 f9OYr9Vb5q2Oppo8JhTMpwGJVkYEFJ1rcdkfmIRRHHTjWfV3e6Y1TOLMTVdF9hU5PO
	 Ynt2WZmumt8xQrEk1hVLyCARePli78UyZDa8TnErutCk7x7OlgZLORL1vmM0rDl3ND
	 ZdR5Lxa819lJA==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B10217E090E;
	Wed, 14 May 2025 14:36:24 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 14 May 2025 08:36:06 -0400
Subject: [PATCH] regulator: dt-bindings: mt6357: Drop fixed compatible
 requirement
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250514-mt6357-regulator-fixed-compatibles-removal-bindings-v1-1-2421e9cc6cc7@collabora.com>
X-B4-Tracking: v=1; b=H4sIADWOJGgC/xWNywqDMBBFf0Vm3QGjRkt/pbiIZkwH8pBJKgXx3
 xuXh8u554RMwpTh1ZwgdHDmFCuoRwPrx0RHyLYydG2nW616DGXs9YRC7utNSYIb/8jimsJuCi+
 ect1COozHhaPl6DJqGtVmBtLPYYL6vAvd1l19z9f1B4DEtDqFAAAA
X-Change-ID: 20250513-mt6357-regulator-fixed-compatibles-removal-bindings-5e61fa4e5847
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen Zhong <chen.zhong@mediatek.com>, 
 Fabien Parent <fabien.parent@linaro.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

Some of the regulators on the MT6357 PMIC currently reference the
fixed-regulator dt-binding, which enforces the presence of a
regulator-fixed compatible. However since all regulators on the MT6357
PMIC are handled by a single mt6357-regulator driver, probed through
MFD, the compatibles don't serve any purpose. In fact they cause
failures in the DT kselftest since they aren't probed by the fixed
regulator driver as would be expected. Furthermore this is the only
dt-binding in this family like this: mt6359-regulator and
mt6358-regulator don't require those compatibles.

Commit d77e89b7b03f ("arm64: dts: mediatek: mt6357: Drop regulator-fixed
compatibles") removed the compatibles from Devicetree, but missed
updating the binding, which still requires them, introducing dt-binding
errors. Remove the compatible requirement by referencing the plain
regulator dt-binding instead to fix the dt-binding errors.

Fixes: d77e89b7b03f ("arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../bindings/regulator/mediatek,mt6357-regulator.yaml        | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
index 6327bb2f6ee080a178ff3e982768c5eb0595e771..698266c09e25359a516d969a0487cc94444b842d 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
@@ -33,7 +33,7 @@ patternProperties:
 
   "^ldo-v(camio18|aud28|aux18|io18|io28|rf12|rf18|cn18|cn28|fe28)$":
     type: object
-    $ref: fixed-regulator.yaml#
+    $ref: regulator.yaml#
     unevaluatedProperties: false
     description:
       Properties for single fixed LDO regulator.
@@ -112,7 +112,6 @@ examples:
           regulator-enable-ramp-delay = <220>;
         };
         mt6357_vfe28_reg: ldo-vfe28 {
-          compatible = "regulator-fixed";
           regulator-name = "vfe28";
           regulator-min-microvolt = <2800000>;
           regulator-max-microvolt = <2800000>;
@@ -125,14 +124,12 @@ examples:
           regulator-enable-ramp-delay = <110>;
         };
         mt6357_vrf18_reg: ldo-vrf18 {
-          compatible = "regulator-fixed";
           regulator-name = "vrf18";
           regulator-min-microvolt = <1800000>;
           regulator-max-microvolt = <1800000>;
           regulator-enable-ramp-delay = <110>;
         };
         mt6357_vrf12_reg: ldo-vrf12 {
-          compatible = "regulator-fixed";
           regulator-name = "vrf12";
           regulator-min-microvolt = <1200000>;
           regulator-max-microvolt = <1200000>;
@@ -157,14 +154,12 @@ examples:
           regulator-enable-ramp-delay = <264>;
         };
         mt6357_vcn28_reg: ldo-vcn28 {
-          compatible = "regulator-fixed";
           regulator-name = "vcn28";
           regulator-min-microvolt = <2800000>;
           regulator-max-microvolt = <2800000>;
           regulator-enable-ramp-delay = <264>;
         };
         mt6357_vcn18_reg: ldo-vcn18 {
-          compatible = "regulator-fixed";
           regulator-name = "vcn18";
           regulator-min-microvolt = <1800000>;
           regulator-max-microvolt = <1800000>;
@@ -183,7 +178,6 @@ examples:
           regulator-enable-ramp-delay = <264>;
         };
         mt6357_vcamio_reg: ldo-vcamio18 {
-          compatible = "regulator-fixed";
           regulator-name = "vcamio";
           regulator-min-microvolt = <1800000>;
           regulator-max-microvolt = <1800000>;
@@ -212,28 +206,24 @@ examples:
           regulator-always-on;
         };
         mt6357_vaux18_reg: ldo-vaux18 {
-          compatible = "regulator-fixed";
           regulator-name = "vaux18";
           regulator-min-microvolt = <1800000>;
           regulator-max-microvolt = <1800000>;
           regulator-enable-ramp-delay = <264>;
         };
         mt6357_vaud28_reg: ldo-vaud28 {
-          compatible = "regulator-fixed";
           regulator-name = "vaud28";
           regulator-min-microvolt = <2800000>;
           regulator-max-microvolt = <2800000>;
           regulator-enable-ramp-delay = <264>;
         };
         mt6357_vio28_reg: ldo-vio28 {
-          compatible = "regulator-fixed";
           regulator-name = "vio28";
           regulator-min-microvolt = <2800000>;
           regulator-max-microvolt = <2800000>;
           regulator-enable-ramp-delay = <264>;
         };
         mt6357_vio18_reg: ldo-vio18 {
-          compatible = "regulator-fixed";
           regulator-name = "vio18";
           regulator-min-microvolt = <1800000>;
           regulator-max-microvolt = <1800000>;

---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250513-mt6357-regulator-fixed-compatibles-removal-bindings-5e61fa4e5847

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

