Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch [83.166.143.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08CB19DFAB
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738250085; cv=none; b=FDguURVmHzVkVXDXtrHGlQ2vLDjJ6FBQhrpE2w7Z3h8UVawmkSyudOfDpSDhCGv/Fc+8nrWsWfkPndo4y69Vz0mZBJ12bah9aeCDfibY1aRi6ld+iDQfiStzJ5VW4xr+tDvdBOcKB3Yxid7wjSzmaat9qY8Mihk/0GvVKXz8eKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738250085; c=relaxed/simple;
	bh=IfUbrFELIDUrYT3MvWpVsIhY0wkuJJxlPAxVzB9Vw7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lrY6ofHJiU9Lu56jTsJamAUzIcfc0G8AWE6SuYEq3FCv2GASjYB1i7xe7Ow/y9vIjZOHvY2fd4U9DltbdFPApI5Uaa3ptTCMGKb0jcFGzXhVEJpi6mc+Ho7Lj6XMyzxkGKfrdlBzCEnOSn/Fv6KFU5M5n/dETSdeYq49XONQ7Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=83.166.143.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YkMy33hq4zgqy;
	Thu, 30 Jan 2025 16:14:35 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YkMy25swpzvPg;
	Thu, 30 Jan 2025 16:14:34 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 30 Jan 2025 16:14:25 +0100
Subject: [PATCH] arm64: dts: rockchip: add support for sound output over
 HDMI on RK3399 Puma Haikou
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-rk3399-hdmi-audio-v1-1-406244333111@cherry.de>
X-B4-Tracking: v=1; b=H4sIAFCXm2cC/x2MWwqAIBAAryL73YIPguoq0UfqVkukoRSBdPekz
 xmYKZApMWUYRIFEN2eOoYJqBLhtDish+8qgpW6lMhLTbkzf4+YPxvnyHNFW7bT1resU1O5MtPD
 zP8fpfT9W/cVVYwAAAA==
X-Change-ID: 20250130-rk3399-hdmi-audio-b130c2bd5c81
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The Haikou carrierboard exposes an HDMI connector and audio can also
be output, therefore let's enable it on RK3399 Puma.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
index 947bbd62a6b09ce55320d0889ee8cf50ca59dfd4..a60779bbbaaa54ebc5060907ab876a4d679f7da3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dts
@@ -154,6 +154,10 @@ &hdmi {
 	status = "okay";
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 	clock-frequency = <400000>;
@@ -191,6 +195,10 @@ &i2c6 {
 	clock-frequency = <400000>;
 };
 
+&i2s2 {
+	status = "okay";
+};
+
 &pcie_phy {
 	status = "okay";
 };

---
base-commit: 72deda0abee6e705ae71a93f69f55e33be5bca5c
change-id: 20250130-rk3399-hdmi-audio-b130c2bd5c81

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

