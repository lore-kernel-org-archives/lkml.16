Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B66182BC;
	Fri,  4 Apr 2025 21:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743802810; cv=none; b=b4KVDu8ikbzmAN6NT2Jx0d95tajTKLt40R44lsIt2bCe/i9lTalHnUlhrizNFKlXwElPR/uwqfaPCSR99tCkZvBvVFrPgEz3SR/1TNj2kc4Ou9wnGfXieywyMkL3rNV+jXAeHZoKjhuXZMzlbYCPJFrEiPD5QuOvZvzgWgz7T7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743802810; c=relaxed/simple;
	bh=V7d848cHNhzJZA8J34hAk1R4MXTjSl/J46lsLRCUZLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wl1nR3ZbUESCg7NBE7eKdDqkqd/+Yrikp40qhYcxCpbfSxCWWpRQA9s044Ec3flhKv+UgNApOw6It3gl0+5KslQe/2j9mg4E9X9JdCkwY1QYTDHWJ1CxsR4kKTqnV8A1UMAVPkjbsxOXbzL612XXwJ3uhuIvbkbqIw7thuNaJ4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPb3K7TH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPb3K7TH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE372C4CEDD;
	Fri,  4 Apr 2025 21:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743802809;
	bh=V7d848cHNhzJZA8J34hAk1R4MXTjSl/J46lsLRCUZLI=;
	h=From:To:Cc:Subject:Date:From;
	b=hPb3K7THrk0kK7YYelaNc6usDlkTX8U1HVosa9n7RRJttA6XP8jWcUd+a7yOD+4A4
	 CdhsxbCSsKYir16I1n68gswuryZKYdO5StbndqcCcnyHjnfU9XlytH9hj3nMNPMGO1
	 ig5pNZDJiR7kjrxbyrNyut9i1aORKxP0g0i2g/ARCSR63Qb0f8QIiv9DZ1fCqTTdqs
	 3Z80xb+fgG3tqw4mPsL7MEPkpFpvnHDNjDAiya2rui69gQRowHdz0mu0FSBqZLtw5S
	 aCFBnpVa6gYJuWMx60Z0OKnZiltLo0+VXpHoabzK87aAq+Szh+lHQeS342QhxRpJfh
	 3aMmgTMK0NBoA==
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
Subject: [PATCH] dt-bindings: phy: rockchip: Add missing "phy-supply" property
Date: Fri,  4 Apr 2025 16:39:57 -0500
Message-ID: <20250404213958.400852-1-robh@kernel.org>
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
 .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml   | 3 +++
 Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml  | 3 +++
 Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml  | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 888e6b2aac5a..5c09cdd98f0a 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -42,6 +42,9 @@ properties:
       - const: phy
       - const: apb
 
+  phy-supply:
+    maxItems: 1
+
   rockchip,enable-ssc:
     type: boolean
     description:
diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index b42f1272903d..bed12849ff06 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -47,6 +47,9 @@ properties:
       - const: pcs_apb
       - const: pma_apb
 
+  phy-supply:
+    maxItems: 1
+
   rockchip,dp-lane-mux:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
diff --git a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
index ba67dca5a446..0b3bab4c436b 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,pcie3-phy.yaml
@@ -46,6 +46,9 @@ properties:
   reset-names:
     const: phy
 
+  phy-supply:
+    maxItems: 1
+
   rockchip,phy-grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: phandle to the syscon managing the phy "general register files"
-- 
2.47.2

