Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E270421ADD1;
	Mon,  7 Apr 2025 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049410; cv=pass; b=OotxHc5nco5z9niRmCtLnkJzw86xyVdzdN/Vf+e9ExPvX3FSPufaC8675HeWCELCHMptRe2FFA6HCI2Pu6+CtJU8r7KcV4QYEd9wwllS7+0xctDcOoR2hbnkbd2CHIeMjV4WBfIbp0le9fgydjBxHz8zjygGdSV6OKIo9qFZNWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049410; c=relaxed/simple;
	bh=WHMo83QFX5Y4aHzt6iXLGVOrh0Gsn8Dtefbxdh7h32A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RAdSyexbYb5Vc+Ru472qakP89OfxkQA0wHWUViSjJid/QP23ewbjTo2Qq6FW6BqAncb1+g19Ut19HpS5V5Omvf9uLSSnwDGsM8lvJKh1NG9aeM4Tgk3n7ua9q2BXeIvijSPidRVH21xHoE3J8nW1kq7V3iC80FYaluP4a1KVcgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=ivoK+cH/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ivoK+cH/"
ARC-Seal: i=1; a=rsa-sha256; t=1744049386; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SRDEYS6j7qhew185kGpHfxeaN4cvGqAabO/XZ/1tkRb6AGo9vfk+FnKWZvX+jzWjRkYmsDv2G1Osl/9YHzsbul1rGCP1SRutcB5TkJIdJH1gto3fNjW5vWcQ7PbU0NTngFrDg7FkI2v+K4386sEAoRwEAqFKQ/y1S0bCMYarIY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744049386; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Hsk96FSguk/Ky1tsPSxd4I1gk9mUryoWRi27TGtLokQ=; 
	b=ddnwQZSeCMBZzuXQSpkEIVK7rEE1SzrACFBi2Xkif1UW3cOOXt61RQBDvDyRJx+k04qI7PXVTXPRK8zw+H0NWDCJpy0IRwUCuuRFiFNWWk+w/F7aTFfz6ShkX8X7sL7BOk3GB5pUvuLGiIAAnCcYbkwu6/1yaYhMKLyZ/FKEY4U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744049386;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Hsk96FSguk/Ky1tsPSxd4I1gk9mUryoWRi27TGtLokQ=;
	b=ivoK+cH/E3m7x3WDEoPCvqr/fH9WPvYqfA4ggDfOCrchVl6Wb+YFCM6VWnPIhuIY
	rJSmK1axaj6w6jWu+GQXPemHEka0uTYf3UhUVSNXdG230dwT5BiO8x1gpFSAiTDO8X6
	p2MwAmrGGlgOnwfNwFcdGomYKDgi0Rel2Cmyhq5g=
Received: by mx.zohomail.com with SMTPS id 1744049384577926.4016780097427;
	Mon, 7 Apr 2025 11:09:44 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 07 Apr 2025 20:09:14 +0200
Subject: [PATCH 1/4] dt-bindings: phy: rockchip,inno-usb2phy: add port
 property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-rk3576-sige5-usb-v1-1-67eec166f82f@collabora.com>
References: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
In-Reply-To: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

USB connectors like to have OF graph connections to high-speed related
nodes to do various things. In the case of the RK3576, we can make use
of a port in the usb2 PHY to detect whether the OTG controller is
connected to a type C port and apply some special behaviour accordingly.

The usefulness of having different bits of a fully functioning USB stack
point to each other is more general though, and not constrained to
RK3576 at all, even for this use-case.

Add a port property to the binding.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index 6a7ef556414cebad63c10de754778f84fd4486ee..3a662bfc353250a8ad9386ebb5575d1e84c1b5ba 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -78,6 +78,11 @@ properties:
       When set the driver will request its phandle as one companion-grf
       for some special SoCs (e.g rv1108).
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the PHY to a USB connector's "high-speed" port.
+
   host-port:
     type: object
     additionalProperties: false

-- 
2.49.0

