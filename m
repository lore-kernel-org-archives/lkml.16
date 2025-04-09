Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A04317A2E7;
	Wed,  9 Apr 2025 20:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231786; cv=none; b=h58NqdqPP0cFfnGdqQql3ejvpxgZ0yoi7Fszd7Aiuz0V05XgUytLuXQ0E33uwovbbAFC2ZYRW4NdNFOSjuBuewJDT5HBXbVXY/f909TkaxcFxMXtmvGpOBBBOJAPruRVAiRJXJ06/ASGzMk/GudJJGzxL6zNG5fpRt0WV4zlAMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231786; c=relaxed/simple;
	bh=NozBD7uf0mEfFz72Q+HWrklJjBxU4koxeAHUjP0UPPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i7e/gYqaYt6ch9NY/UtecMKMzxlgPb41+JTkQ41CMbQKA4F41Fa1XRrFNue4ugRsuqFtLKFDCoARjboR2iU0hetVHgUBM/O/pUFLYov2YLhZo9dPyMVJUfmad4zJuhoY4OvCiWD4A82RuyY5MK5LxYmn2s2+WOT2ASxMnjl16yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPEFewp/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPEFewp/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C6CC4CEE2;
	Wed,  9 Apr 2025 20:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744231784;
	bh=NozBD7uf0mEfFz72Q+HWrklJjBxU4koxeAHUjP0UPPw=;
	h=From:To:Cc:Subject:Date:From;
	b=vPEFewp/CEcOJm4xepNr29RV9Rod7H/Ms9KcO6fUCblcJOCu/YMbBG+0m1TJ7FDNx
	 GMpWrvRPy+b3LIXhad4p9gSDtnXzK5xeJLwHpcIk59o0wNqrctHMFenwNr4c8dvXcS
	 AXg4ZnGvbXVRXRIis9CseshHE0kaftyQY62TrEY2P/4g/fl4ZRWZxZ7uDaEEFiH2WZ
	 f7ODITtnT+Q4KcVeN/n4GhrKjOUE3mYj3bgfEcDg8ca82jvGUKflz/wKW3KpOivKEf
	 N3MnePIr1K/d9o04u35mVI85M5ci4hkZy+1aGPmzp3g8nPVfZUUvrpPoV/0UB72vt9
	 ZzkdbHE5kgowQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: marvell: Drop unused "pinctrl-names"
Date: Wed,  9 Apr 2025 15:49:35 -0500
Message-ID: <20250409204936.1521405-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"pinctrl-names" depends on "pinctrl-[0-9]" properties, but none are
present for the pca9555 nodes.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-7040-db.dts | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-db.dts | 2 --
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi     | 1 -
 3 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index 2b5e45d2c5a6..3add6506ff20 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -124,7 +124,6 @@ &cp0_i2c0 {
 
 	expander0: pca9555@21 {
 		compatible = "nxp,pca9555";
-		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x21>;
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
index 9d45e881a97d..21ecb9c12505 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
@@ -122,7 +122,6 @@ &cp0_i2c0 {
 	/* U31 */
 	expander0: pca9555@21 {
 		compatible = "nxp,pca9555";
-		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x21>;
@@ -131,7 +130,6 @@ expander0: pca9555@21 {
 	/* U25 */
 	expander1: pca9555@25 {
 		compatible = "nxp,pca9555";
-		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x25>;
diff --git a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
index be56a2336265..50e9e0724828 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
@@ -209,7 +209,6 @@ i2c@1 {
 			/* U12 */
 			cp0_module_expander1: pca9555@21 {
 				compatible = "nxp,pca9555";
-				pinctrl-names = "default";
 				gpio-controller;
 				#gpio-cells = <2>;
 				reg = <0x21>;
-- 
2.47.2

