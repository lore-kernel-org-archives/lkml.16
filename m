Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA75328C854;
	Mon, 30 Jun 2025 15:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297824; cv=pass; b=KStVylcVDzpngFHj5oitC+YsTd+SkEL71Zo4A8sZIeLvezI6TD2fG7hIrzN4E8D1MHE3xFL3IE1FQRcpqUtzKlK+X+fZ/zVN8fOMJgczUXouVV/fjVnLu97tw3Tb+qEVodeHt3+C6QWCjIMFLXI0kKp0dyYVmDxkLa9yxdwOYkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297824; c=relaxed/simple;
	bh=itLltfQ5+J07v3tyVQMUtG4Cminx94qx+PhNlxaF+DY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAoPxy919eDLuC0gaiR5BoLCnwbzffhV5uXvGysveIvh/CnAi8jYdZp0jrOhb7eNgMo7ggH1lcJ4aHtctBCX3aIPvt9FSgbTR7f1cQ1IopDeYFYPQ3X4fAnm57FhBPGseHnGwR42rLjzOzmThHYv4DmpCR/UDlHVjlsckgzRTgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=C0qIcSgX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="C0qIcSgX"
ARC-Seal: i=1; a=rsa-sha256; t=1751297805; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c30bn2kRQe+kHF0a5fjiGbGefd+J5bnPgFebggqvohGyd2hPWNvEK5943AQfllOP7lbJY2j378bASokshDacGIjcCH6Njydwjm/vvV7Wv1gAGFEnL+67ELHG3obfaMYS10+bQqWiga2JaPVDB93UjsV+exjYtPfQUathMC7Tf8c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751297805; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j9GQKLguf1mAV7iA4o9HzpFt+9CePr8v5rNhiPiX5m0=; 
	b=leNmZK2qTURJXbjcHDg5uZwU2RMI/kbyXSg4yJoLgaGUPlPJDZKZkDRfFgFK4xriV2CLfzEWOGWA7VxQ40rOLx2dFmjQkdDfvQNE8ZwSsyBXucHOFvmV39mH5avxocI96BZ+9drnckdExCg3gEguDurFYU5Vj0cCI5wNqGA+mp0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751297805;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=j9GQKLguf1mAV7iA4o9HzpFt+9CePr8v5rNhiPiX5m0=;
	b=C0qIcSgXOpIGsZkN89Sp8Rg75Ms36o45KysoBaWXz8Xuo5RjJgGyG0FMkxvvlCQ9
	k0eSrsHa3L2TWPy/nGPWFEtDENvLl1Vw468XBctqE3hwSyVHPR1auw6OKCH9KPkmqc/
	AFb1pIqJZKP4WtbqipgmTHkfXk6nI5ZPnbHopS+0=
Received: by mx.zohomail.com with SMTPS id 1751297804325888.6960560432937;
	Mon, 30 Jun 2025 08:36:44 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 30 Jun 2025 17:36:33 +0200
Subject: [PATCH 1/3] arm64: dts: rockchip: adjust dcin regulator on ROCK 4D
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-rock4d-reg-usb-wifi-v1-1-1057f412d98c@collabora.com>
References: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
In-Reply-To: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The ROCK 4D's actual DC input is 5V, and the schematic names it as being
5V as well.

Rename the regulator, and change the voltage it claims to be at.
Furthermore, fix vcc_1v1_nldo_s3's vin-supply as coming from
vcc_5v0_sys, and not the DCIN, as per the schematic. This makes no
functional change; both regulators are always on, and one feeds into the
other.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 6756403111e704cad42f6674d5ab55eb0306f1e3..352e3df165688219bfedc19734d9eb32c547ec44 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -57,13 +57,13 @@ user-led {
 		};
 	};
 
-	vcc_12v0_dcin: regulator-vcc-12v0-dcin {
+	vcc_5v0_dcin: regulator-vcc-5v0-dcin {
 		compatible = "regulator-fixed";
 		regulator-always-on;
 		regulator-boot-on;
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		regulator-name = "vcc_12v0_dcin";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "vcc_5v0_dcin";
 	};
 
 	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
@@ -166,7 +166,7 @@ vcc_5v0_device: regulator-vcc-5v0-device {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-name = "vcc_5v0_device";
-		vin-supply = <&vcc_12v0_dcin>;
+		vin-supply = <&vcc_5v0_sys>;
 	};
 
 	vcc_5v0_host: regulator-vcc-5v0-host {
@@ -190,7 +190,7 @@ vcc_5v0_sys: regulator-vcc-5v0-sys {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-name = "vcc_5v0_sys";
-		vin-supply = <&vcc_12v0_dcin>;
+		vin-supply = <&vcc_5v0_dcin>;
 	};
 };
 

-- 
2.50.0

