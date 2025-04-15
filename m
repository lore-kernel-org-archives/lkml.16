Received: from mail-m155116.qiye.163.com (mail-m155116.qiye.163.com [101.71.155.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A651C700B;
	Tue, 15 Apr 2025 05:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744693224; cv=none; b=T0euRrie4V0Jl2H6fCvnBmD0yC0458ChUsYcPfY5jOoiHBSbYw/c8YILA+x2nWXHL9OGD40Y0O7mRK1GSPMR6tkEeBXPqkGn+OpfM+DapeIs/jSropChSAwKDEHJjpireaanQCSEwZ27fCWvm5QnBlW4z3c1ItgI7NNLSVO3d3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744693224; c=relaxed/simple;
	bh=8jqYI0EByecC2fLiUKI6Pqa1siE9R5RfGBsWg72hUB8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MP9pSn3C26KO2bCJimQIIi5RjfOaSSHRDcDJ06vr8UJkKo/Yl01kyQJN9uTI8thjhvlmSC7EGFn7lathmmohu4MsZHbHsHSfMUGThmrHSS5c/T06+tOmpo1h8XI3YqaXg/n/LWPPUvrm/Vx4A74FJNU+oOejK1fXWS5AyKgVUs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=AltgW+jK; arc=none smtp.client-ip=101.71.155.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="AltgW+jK"
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11e63de92;
	Tue, 15 Apr 2025 13:00:07 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: phy: rockchip,inno-usb2phy: add rk3562
Date: Tue, 15 Apr 2025 13:00:04 +0800
Message-Id: <20250415050005.52773-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0sdVkJOGkJIH04YH0tJS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9637d1a3b703afkunm11e63de92
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pxw6DRw4GDJDChoYCxMRDEpK
	QiowCRFVSlVKTE9PTUJISUtCTUNKVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUlLTk43Bg++
DKIM-Signature:a=rsa-sha256;
	b=AltgW+jK0JJUfNplT0CLT0w63zWHfOzrDxZzdcHNwmDCZ0cyjgReKmoLn4YVzJXgoH8gPHpqk1nbS0Bf0wLKTyfNKPWuyfCFlyf9glBxs7bF3MKUB6+q4DSopGib8RCZoOG0o+6MGW+iY94a5G4x5sSkBWQryFmLxaAGkhN/Du8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=g+mEjASylUFx9fn2pmmTmSoWE7P1UK6z/VvOamLA1/s=;
	h=date:mime-version:subject:message-id:from;

Add compatible for the USB2 phy in the Rockchip RK3562 SoC.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v2:
- Collect review tag

 .../devicetree/bindings/phy/rockchip,inno-usb2phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index 6a7ef556414c..6f56e7c70f3d 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -19,6 +19,7 @@ properties:
       - rockchip,rk3328-usb2phy
       - rockchip,rk3366-usb2phy
       - rockchip,rk3399-usb2phy
+      - rockchip,rk3562-usb2phy
       - rockchip,rk3568-usb2phy
       - rockchip,rk3576-usb2phy
       - rockchip,rk3588-usb2phy
@@ -190,6 +191,7 @@ allOf:
               - rockchip,rk3328-usb2phy
               - rockchip,rk3366-usb2phy
               - rockchip,rk3399-usb2phy
+              - rockchip,rk3562-usb2phy
               - rockchip,rk3568-usb2phy
               - rockchip,rk3588-usb2phy
               - rockchip,rv1108-usb2phy
-- 
2.25.1

