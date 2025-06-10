Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37FA226520;
	Tue, 10 Jun 2025 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572560; cv=none; b=GHHMWuCG2U6f1IBetlM7w1eMkZSoKipbKVWPS2Okx0oZUwvH5k4pVOEZoEkgVrqfrJbVBi9fLMF4WJk5Dg2Oyxm7qiccOaVVCp7Ac5LYzYsjlCcOYKmyh8yQIStqjcguJTUvMO4wBwH7QqjGlNEJMBI/N3Ko5rF+xGHg1Cf0a7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572560; c=relaxed/simple;
	bh=+t743NmkX1ADopyo7PCrJxNUgdYBmCORK6PWhHIF75w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VYfstcls2FGfbs2TDGSOgYKPhX36XHx3TdST8Ed9feOK/X1n5omOCeZCvJlAjt26sCNUjOPTsvjv1sCpMXaDGmwcE5QbZMAvhlKQy0oVLTJFUyC+xhay8ThGuoghRTHMT+JR6kmIS0SqoA68Wb6oS0B1xBL08aKJzSg+vSOg2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bGvFy4TQbzqkH;
	Tue, 10 Jun 2025 18:22:30 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bGvFx5nLjz14f;
	Tue, 10 Jun 2025 18:22:29 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 10 Jun 2025 18:22:16 +0200
Subject: [PATCH v2 1/3] arm64: dts: rockchip: fix endpoint dtc warning for
 PX30 ISP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-ringneck-haikou-video-demo-cam-v2-1-de1bf87e0732@cherry.de>
References: <20250610-ringneck-haikou-video-demo-cam-v2-0-de1bf87e0732@cherry.de>
In-Reply-To: <20250610-ringneck-haikou-video-demo-cam-v2-0-de1bf87e0732@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

dtc complains with the following message for DTSes which use the ISP:

arch/arm64/boot/dts/rockchip/px30.dtsi:1272.19-1276.6: Warning (graph_child_address): /isp@ff4a0000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

Typically, it is expected from the device DTS(I) to update the SoC DTSI
nodes if they have more than one endpoint, so let's assume there's only
one endpoint in port@0 by default, instead of forcing board DTS(I)s to
/delete-property/ address-cells and size-cells to make dtc happy.

Because PX30 PP1516/EVB's endpoint@0 is the only endpoint and
considering its parent node now has no address-cells property, dtc
complains (same messages for PX30 EVB):

arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi:447.29-451.6: Warning (avoid_default_addr_size): /isp@ff4a0000/ports/port@0/endpoint@0: Relying on default #address-cells value
arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi:447.29-451.6: Warning (avoid_default_addr_size): /isp@ff4a0000/ports/port@0/endpoint@0: Relying on default #size-cells value
arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi:447.29-451.6: Warning (graph_endpoint): /isp@ff4a0000/ports/port@0/endpoint@0: graph node '#address-cells' is -1, must be 1
arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi:447.29-451.6: Warning (graph_endpoint): /isp@ff4a0000/ports/port@0/endpoint@0: graph node '#size-cells' is -1, must be 0
arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dtb: Warning (graph_child_address): Failed prerequisite 'graph_endpoint'

so we fix that by removing the reg property. dtc still complains (same
messages for PX30 EVB):

arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi:447.29-450.6: Warning (unit_address_vs_reg): /isp@ff4a0000/ports/port@0/endpoint@0: node has a unit name, but no reg or ranges property

so we also remove the @0 suffix off the node name.

Fixes: 8df7b4537dfb ("arm64: dts: rockchip: add isp node for px30")
Fixes: 474a77395be2 ("arm64: dts: rockchip: hook up camera on px30-evb")
Fixes: 56198acdbf0d ("arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-evb.dts     | 3 +--
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi | 3 +--
 arch/arm64/boot/dts/rockchip/px30.dtsi        | 2 --
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
index d93aaac7a42f151590808083e3956a0f64ce7710..bfd724b73c9a7647f661b4799df00edd838f1085 100644
--- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
@@ -483,8 +483,7 @@ &isp {
 
 	ports {
 		port@0 {
-			mipi_in_ucam: endpoint@0 {
-				reg = <0>;
+			mipi_in_ucam: endpoint {
 				data-lanes = <1 2>;
 				remote-endpoint = <&ucam_out>;
 			};
diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
index 3f9a133d7373a122861931b7c8199bee485234a5..b4bd4e34747ca0bc5a6407bf8b0a3de8c08899a7 100644
--- a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
@@ -444,8 +444,7 @@ &isp {
 
 	ports {
 		port@0 {
-			mipi_in_ucam: endpoint@0 {
-				reg = <0>;
+			mipi_in_ucam: endpoint {
 				data-lanes = <1 2>;
 				remote-endpoint = <&ucam_out>;
 			};
diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index feabdadfa440f96c0134a0bb05e64a0c7b5adf2e..8220c875415f52bb2098af5c0647cae8fe5c9aed 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1271,8 +1271,6 @@ ports {
 
 			port@0 {
 				reg = <0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 		};
 	};

-- 
2.49.0

