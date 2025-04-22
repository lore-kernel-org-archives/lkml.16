Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6E91F130A;
	Tue, 22 Apr 2025 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328301; cv=none; b=Ud4WZ24WahWvQt5L48Z0Q1GaQq7WdDU7XfVuglMGg0sAYg68+J0KcJWAPcxh4IAial+M56aC0x9zre+Pxk+ftV79daTbpBH81rP6Mf0A2wVRBX07dZEI1J6ruhDtWEJQs6mNPmZ9/SuZnVQzlRMEdV+Mf2E5sQT+oPmMNUdo5aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328301; c=relaxed/simple;
	bh=u7PWWpWnN+JCQGAkrXpy7x5BE2/HL8HUyp74PolVQSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RGo62d6rZOCRFfjTnE5OiUz2neZnAvhvnT09Y/XfQay761UcZLC476zLxyfC+IDqOQn6QM6saB1hC2K8pmrzmVbSpmKCb2zzmqUBYgQd1EtLsf6NJDCLkNVEKVA6TgTqNAjd8UWHUwWJN5zacmP6Wo3zV37gj1ZW7jcSjuelRXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=dHL7NjiA; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="dHL7NjiA"
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout3.routing.net (Postfix) with ESMTP id 2BF2561533;
	Tue, 22 Apr 2025 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1745328291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zRgDtNzjWlmBlKxgWUbFr0kAVAlRPqY5m6T9fKKPW3o=;
	b=dHL7NjiA8amuAFu6yBPSJyGRV2Xc4f5iapRfCA6kBrRytrXMqaXIZ5FEDM+JI9AZ1HQbXW
	KKbn+vRVMb4kf7g6PCIL/uPQr2uexGgzeZDsCN0VmPi73soRHtIj0t2H/hZBJKHxgBks3l
	yFhOGuZ4jpnPz7Y3OsBKhZIpCofp/z0=
Received: from frank-u24.. (fttx-pool-217.61.156.53.bambit.de [217.61.156.53])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 5273180318;
	Tue, 22 Apr 2025 13:24:50 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Daniel Golle <daniel@makrotopia.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 1/8] dt-bindings: arm: mediatek: add bpi-r4 2g5 phy variant
Date: Tue, 22 Apr 2025 15:24:24 +0200
Message-ID: <20250422132438.15735-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422132438.15735-1-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 70918b30-8a60-4b29-a71b-ede4dba2605d

From: Frank Wunderlich <frank-w@public-files.de>

Add new compatible for Bananapi R4 with 2.5G phy.
Base board is compatible with existing BPI-R4 only 1 SFP is replaced
by RJ45 port and use mt7988 internal phy.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v3:
- new patch adding compatible for 2.5g variant
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..3aed03df0e3c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -104,6 +104,10 @@ properties:
           - enum:
               - bananapi,bpi-r4
           - const: mediatek,mt7988a
+      - items:
+          - const: bananapi,bpi-r4-2g5
+          - const: bananapi,bpi-r4
+          - const: mediatek,mt7988a
       - items:
           - enum:
               - mediatek,mt8127-moose
-- 
2.43.0

