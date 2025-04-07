Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AC71F4289;
	Mon,  7 Apr 2025 16:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044974; cv=none; b=eDSj5Yc7tUa86YzunmhsMPPOA/fJ7e29XWTGdPdl0Buj3K2C/Z5XTZi4VIDxtqCgpMD4Jm2AIG6L6+o9WL8nZGF+gUhYSuD2/LergjBjHLoZZiBF+YUhqXsVryczVBDXz81art/HSQzKAO+3v3gg7xGqk88qM8cmnFtgLoXcjFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044974; c=relaxed/simple;
	bh=ymohgFDi4LwP6+Gv1CbYrCj/hTTJ8VYbtY7mVpem+4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eZYS+S3lF0YjE3WUe2vTD41sQdhTW4TPIQH06aoOrUXIKA0ESvE5SwEB4NViQIJgS9ICut6KKvQGRO96V38jTTa71s0ubFbJFKB0epEgJMDfDmsaxZh+QLphTUuaLPFkXZ0cRfefRFcl1TGnQYu8II+NwZD9RgKhltcSte4pdeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pYgofEh3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pYgofEh3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2712CC4CEDD;
	Mon,  7 Apr 2025 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744044974;
	bh=ymohgFDi4LwP6+Gv1CbYrCj/hTTJ8VYbtY7mVpem+4I=;
	h=From:To:Cc:Subject:Date:From;
	b=pYgofEh3AKidigQiwzejSdSQLNcVkNiLqs1Jia4hB1g8iPGht4pKtBvKEie3ph6Sd
	 tSAvqQviln4Vz7K/7QG98uQiIMrDex6OJlzU11WhZT6HXOuTP+K77RPQUndUS2eJwm
	 qLtv3r2BJi1AKxHzspdtxHCu1BhQi66xvj/DUOQ9SrLzpTcyPYOC9LRuIDjen1kEZw
	 ZrjfbroFM2LCB0dT1J8EzKX45Dpkbtj7/4r/YoiAuwsdKHx8ygLx0cBbS4/YNKBCV9
	 JJFIYHO6XOv+NXJHhaEXwcnohZB89tg6AfP56DxdKM81pd+/xNyTZmkxgOWYKc4g8v
	 Idf/+cd1WnqAA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Zhang Yubing <yubing.zhang@rock-chips.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: phy: rockchip: Add missing "phy-supply" property
Date: Mon,  7 Apr 2025 11:56:06 -0500
Message-ID: <20250407165607.2937088-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several Rockchip PHYs use the "phy-supply" property, but don't
document it. Add it to the current known users.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Drop maxItems
---
 .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml   | 3 +++
 Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml  | 3 +++
 Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml  | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 888e6b2aac5a..3e101c3c5ea9 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -42,6 +42,9 @@ properties:
       - const: phy
       - const: apb
 
+  phy-supply:
+    description: Single PHY regulator
+
   rockchip,enable-ssc:
     type: boolean
     description:
diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index b42f1272903d..8b7059d5b182 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -47,6 +47,9 @@ properties:
       - const: pcs_apb
       - const: pma_apb
 
+  phy-supply:
+    description: Single PHY regulator
+
   rockchip,dp-lane-mux:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
diff --git a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
index ba67dca5a446..d7de8b527c5c 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
@@ -46,6 +46,9 @@ properties:
   reset-names:
     const: phy
 
+  phy-supply:
+    description: Single PHY regulator
+
   rockchip,phy-grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: phandle to the syscon managing the phy "general register files"
-- 
2.47.2

