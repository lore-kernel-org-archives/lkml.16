Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83B82C08C8;
	Tue, 24 Jun 2025 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771357; cv=none; b=CFX7UBDxsHjIzao2bh+K0Doac72Zzt+LzIOofUpGqFG6hawoP39+fk/rw4b/sO8hLCDUu6tryqMWYHHxRmlbzkmhDsRsgAYFlnRwwszxzprbI3DsHdgHq+t81rpYN9++090xX+/5Ktjs+6NjfrVHSDt6KKNvukKcfTnze4FBU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771357; c=relaxed/simple;
	bh=79hwNg/h+KLzi/UfUtU3TIanMW4tFKK7x6IFhy1QsJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iPNmXQco33k8B0QQrYPQotmZ5+UBsIE15pOtZrhszrKnCtZapZtzh2hNrq++MjfMsXuNh8oZi86Fd7wYiQpYkrqBYddKvxf/9rnqKVV8PsGp6cnmvYbI9y0tzmLtSVR1NynA81PR/BPEDmnW76S27GplVLSHFlLzxEJ3FB48MUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CB5C4CEE3;
	Tue, 24 Jun 2025 13:22:32 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: phy: apm,xgene-phy: Remove trailing whitespace
Date: Tue, 24 Jun 2025 15:22:29 +0200
Message-ID: <5b8e9b4f645bcac9d50059e513abba4db7e1aaea.1750771156.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing whitespace which hurts my eyes.

Fixes: 65ad0d068c426c2f ("dt-bindings: phy: Convert apm,xgene-phy to DT schema")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/phy/apm,xgene-phy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/apm,xgene-phy.yaml b/Documentation/devicetree/bindings/phy/apm,xgene-phy.yaml
index d1e6b112b6de97d9..0674391feeae0091 100644
--- a/Documentation/devicetree/bindings/phy/apm,xgene-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/apm,xgene-phy.yaml
@@ -8,7 +8,7 @@ title: APM X-Gene 15Gbps Multi-purpose PHY
 
 maintainers:
   - Khuong Dinh <khuong@os.amperecomputing.com>
-  
+
 description:
   PHY nodes are defined to describe on-chip 15Gbps Multi-purpose PHY. Each
   PHY (pair of lanes) has its own node.
-- 
2.43.0

