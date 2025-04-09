Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6377619D084;
	Wed,  9 Apr 2025 20:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231003; cv=none; b=szQv1zaypIavK4++lrcJVm5TH3kZW37X4XT2xV4YwNgHBcl3PNvTKtNiF61cNCfFUtjbLcsvp+hNRJ8M4VRuxTLDfVl4YwJE/BDktbkQm7GpgLatlJmkMQtE19rd1TlaAeI8vRcMDz5JyCcrIurnGl7LmIWiyom/HdfdnBN7dMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231003; c=relaxed/simple;
	bh=xJwJ3ShUG3Jlgyn6wMt/Wseu2u4t82y4o7Ga/V6vaWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L/LXSND3s6OM2MtzEvrzBVpkJWqcSy1p7vBGNYYJyylP+orMQMOw5WJCppxn+fz58/ZlfdD+3+iiqSPGw4XZTWVhqD8kAO7Fz3Llsiw1yV077ukDStZj8E7QnI6FeNX/KaoefxiIY4symWBoxdmzUCOnmSCi882xNYaNlNW6XuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKnvLt4c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKnvLt4c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C768C4CEE2;
	Wed,  9 Apr 2025 20:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744231000;
	bh=xJwJ3ShUG3Jlgyn6wMt/Wseu2u4t82y4o7Ga/V6vaWA=;
	h=From:To:Cc:Subject:Date:From;
	b=MKnvLt4cioOilD9bPLdftibKOo/l5OcBBcn/L+Fk0sULUO/YNuPcjArKphQSXG7q9
	 LzlHpAJMW4sxuhiCi3Y1AUM1svhqYxcka9M2Uf4WrTngF1yAzS1z4bKSvSazUb0TmV
	 alOnnLjgANZjqwxTUJ90W+M4aackwzJ6I2tKJYwVPZU63VRVAtSIw2nP8avE0M2FSJ
	 HP4vODCJpihvkkUUhCoaSgKP20mVcg0NkDrca3F/Ct9Fz7fRfNtFf6oifmdvv+t/UK
	 6KgDH5eE2WcSPYCkDTSKim89D4TzswUi9sWhFA4vAME+MFUCNPXY8ESH1K8Xuzcjld
	 Kf99XhzaN7H2A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm/arm64: dts: allwinner: Use preferred node names for cooling maps
Date: Wed,  9 Apr 2025 15:36:12 -0500
Message-ID: <20250409203613.1506047-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The preferred node name for cooling map nodes is a 'map' prefix. Use
'map0' like most other platforms.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi  | 4 ++--
 arch/arm/boot/dts/allwinner/sun8i-h3.dtsi    | 2 +-
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi   | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi b/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
index addf0cb0f465..6f88d8764e6a 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi
@@ -1225,7 +1225,7 @@ cpu0_very_hot: cpu-very-hot {
 			};
 
 			cooling-maps {
-				cpu-hot-limit {
+				map0 {
 					trip = <&cpu0_hot>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
@@ -1255,7 +1255,7 @@ cpu1_very_hot: cpu-very-hot {
 			};
 
 			cooling-maps {
-				cpu-hot-limit {
+				map0 {
 					trip = <&cpu1_hot>;
 					cooling-device = <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3.dtsi b/arch/arm/boot/dts/allwinner/sun8i-h3.dtsi
index eac2349a2380..cfd039840b43 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3.dtsi
@@ -262,7 +262,7 @@ cpu_very_hot_trip: cpu-very-hot {
 			};
 
 			cooling-maps {
-				cpu-hot-limit {
+				map0 {
 					trip = <&cpu_hot_trip>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
index a5b1f1e3900d..fa162f7fa9f0 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
@@ -146,7 +146,7 @@ cpu_very_hot_trip: cpu-very-hot {
 			};
 
 			cooling-maps {
-				cpu-hot-limit {
+				map0 {
 					trip = <&cpu_hot_trip>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
index d3caf27b6a55..51b61f0d2f44 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
@@ -207,7 +207,7 @@ cpu_very_hot_trip: cpu-very-hot {
 			};
 
 			cooling-maps {
-				cpu-hot-limit {
+				map0 {
 					trip = <&cpu_hot_trip>;
 					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-- 
2.47.2

