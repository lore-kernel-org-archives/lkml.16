Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDBE1E520E;
	Wed,  9 Apr 2025 20:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231836; cv=none; b=Cr6bACFCc1uQhYDyLx1wlhGv7/OEZQSGuvhKl1jZuuN8dsRwfW4SBslhMxx/Zck0nkhacFtyOgZtG0sbX3Am4PMBBs0yTipOoEOn0lM0rD0GYeyxxRML2J3GimDt+Lr6dCU4A3zC5En+m7Lu+1g5KPXQoZt7p74RMcCLrcmFehs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231836; c=relaxed/simple;
	bh=ha/sFYVwv67xLp5xqyVpRwtjWeRe2Tkg8+E+AQktWgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YlDb5cU+5OLhrBt4QblTmDQuUUrvOFNaXyJnhz1APssC0wc8Mfr1dwbz/r+WWRzcUGTQA+fZ29fYrbcsqkSPp5t+xCnpx4LT9e5p/ib3avXyWkJUNvZBBnytfgHCPnjv3DGOlnxsBMWh9PHVq9iE0FMGJTE7Pu4gTfZJuZ1uLrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXQeaM+f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXQeaM+f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98447C4CEE2;
	Wed,  9 Apr 2025 20:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744231835;
	bh=ha/sFYVwv67xLp5xqyVpRwtjWeRe2Tkg8+E+AQktWgw=;
	h=From:To:Cc:Subject:Date:From;
	b=lXQeaM+fET/Oa1+E0vAsStRyBGOIXYZ9LJ5C7aN7XKUDpEiLGUtPFqqTaHO5S1emi
	 IF1BNRKURiaKbsmJzfR5Z3U+OpvVAm+hvoMhSM+MFokdWxzXUHLmMrOq+ITnrpgnqw
	 BnywndcvfGI5u+fdcpD7MoGFP4p5VmIgBr8afgZ70llzXgdtWjV11p2Oc1uYEvlt9V
	 8bU1OYwpBOmMTsKgeXKQYGxuPcdQjwn7SQZLs5hTMuerJ7Fv6n2zZYtC/XjwmNowI6
	 KW9blpbRg862v9jqPKkVh9ybM0QZoKZFcCK8F6mr071Pz6BbJNosuZ3TcQChPnlCIS
	 VaizwMgU+HcLg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm/arm64: dts: mediatek: Add missing "#sound-dai-cells" to linux,bt-sco
Date: Wed,  9 Apr 2025 15:50:00 -0500
Message-ID: <20250409205001.1522009-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing "#sound-dai-cells" which is required by the linux,bt-sco
binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/mediatek/mt2701-evb.dts      | 1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt2701-evb.dts b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
index 4c76366aa938..e97dc37f716c 100644
--- a/arch/arm/boot/dts/mediatek/mt2701-evb.dts
+++ b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
@@ -50,6 +50,7 @@ sound:sound {
 
 	bt_sco_codec:bt_sco_codec {
 		compatible = "linux,bt-sco";
+		#sound-dai-cells = <0>;
 	};
 
 	backlight_lcd: backlight_lcd {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index e1495f1900a7..9f53344fa83e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -105,6 +105,7 @@ sound: mt8183-sound {
 
 	btsco: bt-sco {
 		compatible = "linux,bt-sco";
+		#sound-dai-cells = <0>;
 	};
 
 	wifi_pwrseq: wifi-pwrseq {
-- 
2.47.2

