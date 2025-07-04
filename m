Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3842D59E1;
	Fri,  4 Jul 2025 17:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751649258; cv=none; b=hPqi0PqT+IUCrshWfnGLJGfvGwzhbospzb550mMk2Pv+VoW/ESd5GxZMj5etHwSOVUmGSluJxzzGI02Tbcn5btIsQROTVhnm3U66MejYfB4Ty2nz4VfJ3/e1zAr60CpiuHSCMZBMiK4ekRpBANyQ3aagkDDTGLYKGlRFhFbjxq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751649258; c=relaxed/simple;
	bh=S8cWKIiwtDiSfStJh84KCei6d3DwGM2GwUkVOE4faQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z8aztsvLWWnhvC1GdRrCRl39M+55+IP3ZdoY79QA10ypA0Bs+Qv8Xqh9EtT38OEu335mWF699kbr6hDKQxIX/pmlP7HSjCmrIlzU2E+NSEzgft8ClhSRMpdPSgWI8oINB8y7F2z2cvR0VLIVjBIo9lyQ6up9vBQGA1denH0QUQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KWDkUUao; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KWDkUUao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751649254;
	bh=S8cWKIiwtDiSfStJh84KCei6d3DwGM2GwUkVOE4faQo=;
	h=From:Date:Subject:To:Cc:From;
	b=KWDkUUaoYN5CRfFZTT0YTXnnnEB67PNOS49ze/RoxK2MOpu2GIqsGC51CPfCScOQp
	 F1da3abN0+7q7KS+1jti0WYgANv+bom883yz9AN/RxV5sgRzrMgKeEdRAPJqTdhSMD
	 Roht7RWoTZrdIMj8W+Q5mLTPXAPv6+NMDghupC6Rh2gJiiG9yoZ00laB98vtWBawuf
	 z3vzpz5Iv9sAqRPoUb9UK6qOhDtaMleOppXfUvPp8Ulmv5EJhF3O+aTlQMFj4IUFyC
	 7c401ccgr0l//zJOOjLAIhJBg+zAYYreTsYw1VN7Hbjy2Hmp45gq/GsLRBqmZ9LIcj
	 hy20ndBaFDmkw==
Received: from jupiter.universe (dyndsl-091-248-191-229.ewe-ip-backbone.de [91.248.191.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7161A17E0202;
	Fri,  4 Jul 2025 19:14:14 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 19F71480039; Fri, 04 Jul 2025 19:14:14 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 04 Jul 2025 19:14:14 +0200
Subject: [PATCH] arm64: dts: rockchip: Enable HDMI receiver on RK3588 EVB1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rk3588-evb1-hdmi-rx-v1-1-248315c36ccd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOULaGgC/x3MSwqAMAwA0atI1gZStVi9irhQm2oQP6Qggnh3i
 8u3mHkgsgpHaLMHlC+JcuwJJs9gWoZ9ZhSfDAUVlmqqUNfSOod8jQYXvwnqjda4sjHUEFGAVJ7
 KQe7/2vXv+wG/4P39ZQAAAA==
X-Change-ID: 20250704-rk3588-evb1-hdmi-rx-51839109000f
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1392; i=sre@kernel.org;
 h=from:subject:message-id; bh=S8cWKIiwtDiSfStJh84KCei6d3DwGM2GwUkVOE4faQo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGhoC+Ynu96nCSNsKxpenn4F4N4nZhIray6ew
 sopv3oLcmldc4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoaAvmAAoJENju1/PI
 O/qa3gcP/0pAVYqWKnbMQo58dsFsLmzMm+rZ72RwyO8pvHgKJYwDUuibJYQSMwAI12W//vIOQ8S
 p6KZ4YmF7BClcHA/2cJiIk8Q3WygeLfOxxKjry6LEFOHjqy7Vn0jd7VNXZMbkX77LAdWAmf5kfx
 mxGLyjZYTTgS5CHmVi2NVw14gdZxmB9esDEk8SrIY2ycV1fntN5MiNFjnoTW/uQuxaCWaydbqCF
 W91WhRcOmdUozfmD7ybDOUKUMeRYRQBNZPHNDPGyYxQv8WPCWO5yvZ1BO0xO4VJWxkcEjcrBv3R
 BtxMDzAlrkusn71xdJ1hLCMhLVT0kUBGQlB/6ONIM17NFattTZ+pEo9CD78m4Fd+XigeE6X1Lvn
 OX6jhcFIt9th7c9n97je48RiKodHBJWZRcwOPIs7PheGVkYiq7zJAgoMAoWo/W9ZMkt/S29xz2t
 niKYxym7MgwzzKR+bREw9LGaIaNqADBmVeDh/vVZKFerZNdVwsFs/bfhI8UhQbuENmGfUBc2tT8
 gzfjdpcWb1fCmmLeI/BHAd+jEsNadaUjZHELSAAbou1DUNf8oqyaqQZ8GqvEHVipUCZwc6GzDZ1
 8vRFAXLbgBYF3igUVZ6tX9dMdGSSr0Zb99AlM25zr2V9WA5/+v4yeVFmOCqmRLu+Qnkqqy4c3Ba
 LWGGlvGbb4XH7C0LXrk8fCA==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Enable HDMI input port of the RK3588 EVB1.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 8e912da299a218b61623e6973d2f955504bd44aa..ff1ba5ed56ef5b985c54fa9e1a433fc81f988f8b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -391,6 +391,17 @@ hdmi1_out_con: endpoint {
 	};
 };
 
+&hdmi_receiver_cma {
+	status = "okay";
+};
+
+&hdmi_receiver {
+	hpd-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_hpd>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -582,6 +593,12 @@ rtl8211f_rst: rtl8211f-rst {
 
 	};
 
+	hdmirx {
+		hdmirx_hpd: hdmirx-5v-detection {
+			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;

---
base-commit: e05818ef75bee755fc56811cb54febf4174d7cf2
change-id: 20250704-rk3588-evb1-hdmi-rx-51839109000f

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>

