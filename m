Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7750617A5BD;
	Sat,  3 May 2025 20:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303332; cv=none; b=IjEqBw7t7PkRNwh0k4LwkYp+Bs2um4CQeOJBc37s/um4R6c8DbyQdDCz++Ii30Z4IFrkbmMkHBe1u+xY3idWKVuAT4NyVZAuR+46bi2taM6O53Czp1CkhowqgimjZofwKUVvho42tLp1ytItUfQAcrRVHaXrlp4DklSNpclB7ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303332; c=relaxed/simple;
	bh=u3ua8SVsGbv2CUAQqgjAJ98rDBUFgwOnKD/5uJ/FBdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDDHDCGbyz5WOLXF9dEagyrqM6oGaB8tHZ53d+b37P8GrQksTiaimzPflhl7mrh4jz7CReXi4cbO16zT3qRxPsS50U0QCHj7eDX5cwjt4+p8UMGVnhm1Ge851zQgGCY7OvIKpnUrknkiKYi+uJDlkNWzpnTiVQaq/TzLklw7kpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=K6rLuwsd; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="K6rLuwsd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=34MJqkf/MBQYKv6xrK8XN0qAOR0duJ0rHYmPfngbh7c=; b=K6rLuwsdadtqWUhzyG6NiJeYTT
	e24OrcraKgE07kdnkScvcOBxqW05tuaFktsIVZwoby/fab4bvAA34iRWoRduslEZ/z1W9vlLfyMvu
	XzSbt5hMjFUHQ3fcdOCGLGhdHmPeURFxDhRh2hprGhp76NdaNgKua8ZXfKHRrkIplrTqXq1h2jNys
	KwMN/kHQvFKRyp1lpu4YXPwtvXnvEngKkl8qKqGL7d0jUoB5DME3IPNj0+8vy619QAjjhrpbEqc4G
	uYbPrHXhJzFM41WmeKv5uugogvqY44nt60vls3umup4hYvLfhWNGm8m1B8Osk1H0jYs5buU3OM7z+
	6Cgvv6lQ==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJGh-0001hY-Em; Sat, 03 May 2025 22:15:27 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: phy: rockchip,inno-usb2phy: add rk3036 compatible
Date: Sat,  3 May 2025 22:15:10 +0200
Message-ID: <20250503201512.991277-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503201512.991277-1-heiko@sntech.de>
References: <20250503201512.991277-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for the USB2 phy in the Rockchip RK3036 SoC.

Apart from some bits that got swapped around in the phy registers, the
block is nearly the same as the one on the rk3128.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../devicetree/bindings/phy/rockchip,inno-usb2phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index 6a7ef556414c..7bcefe8c22d1 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - rockchip,px30-usb2phy
+      - rockchip,rk3036-usb2phy
       - rockchip,rk3128-usb2phy
       - rockchip,rk3228-usb2phy
       - rockchip,rk3308-usb2phy
@@ -184,6 +185,7 @@ allOf:
           contains:
             enum:
               - rockchip,px30-usb2phy
+              - rockchip,rk3036-usb2phy
               - rockchip,rk3128-usb2phy
               - rockchip,rk3228-usb2phy
               - rockchip,rk3308-usb2phy
-- 
2.47.2

