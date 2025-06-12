Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9784B24DCF1;
	Thu, 12 Jun 2025 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739144; cv=pass; b=mIAW3s+92hV1xcbO7/HBuj6UbrzDppjwCGtoqv1B1y4Z0YiEt402fIzxc8+YRelnicmX3kTntR6Q6/kPRYjvBZ+4qK8p4dOC3kp/UMnFcedWNUJ+GxdMKL7DEgKsEwEG/pmrZNkMTOAp1JEKIa8gfM99FJrL/cE2dbcmmyD3riw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739144; c=relaxed/simple;
	bh=7Iba+yAOIxpCZjQ/ocoKHkF9JozbNL0qkGyY/EWGMB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B65xYa+0Wq5dlOVdWGf7w8yrEXEoCxeeOq7oXDAYD8Kaj2j3jqyzrPbYiCe/uhDhiitXbXdFcdO6paizZAoFbsE3VC48/uZDUp3S7y4gUpMqlnHXFXQVCvoh1Jl4CqQ3WM/51jWgRZ27xwII5xiYqbb1ME1FjBUlZOGm4xcQiv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=OVbXLxNE; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="OVbXLxNE"
ARC-Seal: i=1; a=rsa-sha256; t=1749739130; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Hp3G8ROEQbeWJoK7N5HBK3D9jXIWLRscx3PVFjO/g1T2xkWbE/Uewze7ia8LQwVsvvPDN5R/1GuBFqAEXysV9BpNTorzKdotaQ3ESJFfEv3TeQA6M7uSpnxyAXqVdH+kQqWYjQ6tqx5QCvuXp6jooESsuUdQJcGFswtdCCpRDek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749739130; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ex8oQa+YqEYdb2fSXibJ5RTDwcm8bJDCkvBEZ+deQxs=; 
	b=bPokZiHrisMW+dSeWPXXE+AyO6REJap2XqnG/2zQuQfbQ1Vad5SZtJmKwcvwrgSqV4DL/KWm3+zbxtTnp8XmKGNUcZ6RdeYEcIjrXbTunmQPVta6/6R+CeHFfdyUbVpLO7qqWxgb+MJTA6QwaZaWWJa9J2luaaDdXkWjaqivO/Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749739130;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ex8oQa+YqEYdb2fSXibJ5RTDwcm8bJDCkvBEZ+deQxs=;
	b=OVbXLxNEZRbYJtTuOauDGPtwA5HcpqqIH3N3luJmESXP8XHBYHVSVgn3FRkuvOUt
	IKydVIUduYnvPc778E5mAUJtxdmuPKKY6LQB4obVF8V4oWGesROyTsl69LGJEB/tI+V
	9vK8PqEOL3bunsBO4sTAeOCc611nq/s7XRagjya7ziqqEeWiOSGZy7kssDhYb1gYmR9
	/Zkl5TU1ygTdTcY1cPxrCWFh6lrvOQBqcKiHOWULvAd4JE3tbAAeFdwhdDB6g817NI0
	ITNbgimg3cVDGIZuuM6qAjfJyquR94QdW/aRVzhcII7aCAvvhylo+F3k3ml5BnDutzp
	wNpYyHN+3w==
Received: by mx.zohomail.com with SMTPS id 1749739128525523.5659147415079;
	Thu, 12 Jun 2025 07:38:48 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] arm64: dts: mediatek: mt8173: lower SD clock and disable wp on Elm
Date: Thu, 12 Jun 2025 22:38:33 +0800
Message-ID: <20250612143833.2612714-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <20250612143833.2612714-1-uwu@icenowy.me>+zmo_0_

The microSD slot of Elm seems to have a little signal quality issue and
cannot work at 200MHz. In addition, a microSD slot cannot handle
write-protection.

Lower the clock frequency to 100MHz and add "disable-wp" property to
eliminate a note of assuming RW.

My Hana device, which is a Lenovo Flex 11 Chromebook, can handle 200MHz;
so hana DTSI still have its max SD frequency set to 200MHz.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 1 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dts       | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      | 1 -
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index dfc5c2f0ddefd..3147240cfa6ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -68,6 +68,7 @@ trackpad2: trackpad@2c {
 };
 
 &mmc1 {
+	max-frequency = <200000000>;
 	wp-gpios = <&pio 42 GPIO_ACTIVE_HIGH>;
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dts b/arch/arm64/boot/dts/mediatek/mt8173-elm.dts
index 2390d04204e83..3385183b60d36 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dts
@@ -13,3 +13,8 @@ / {
 		     "google,elm-rev5", "google,elm-rev4", "google,elm-rev3",
 		     "google,elm", "mediatek,mt8173";
 };
+
+&mmc1 {
+	max-frequency = <100000000>;
+	disable-wp;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 0d995b342d463..2a253a90bce1b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -402,7 +402,6 @@ &mmc1 {
 	pinctrl-0 = <&mmc1_pins_default>;
 	pinctrl-1 = <&mmc1_pins_uhs>;
 	bus-width = <4>;
-	max-frequency = <200000000>;
 	cap-sd-highspeed;
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
-- 
2.49.0

