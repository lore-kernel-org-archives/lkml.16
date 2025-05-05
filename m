Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5C4244667;
	Mon,  5 May 2025 12:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447416; cv=none; b=vC5ZOC7e7aJdX6enUVobb7YZPgbdtyyjKGNkwB1An+67D4QjgpiQaReBtO2x7YUI0qnjrWfXLCqgs/xMmeNOuu3eSmU2eni8Tj4xfFMjO9f4HT67VJ5DQ+64PfDj9y3fWCvzbJXOevEHQryQ6KUJtKDdnFF+VsAumChWWlw1Bcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447416; c=relaxed/simple;
	bh=n6QfwCksWW+pyQnegmT93XTYwliUwf32XpZNPkCz+w0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TbCI7DkanHMkflP28QEG4Q+W0EM7XRCq7tqv8tb7+ACvqBZ697JMliNibic8gqdYZaPNxh1zgIXcka1fGTS5+4xtAOXIyQrg+lP20ojQn5YUbNy9mctKmCUc//RAPaFnyMV9qxeUa0OgxRtZ+oPfxMZmR45df89dK5hOiGdWaxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=N/KgUxJL; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="N/KgUxJL"
X-UUID: d12abdee29aa11f0813e4fe1310efc19-20250505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=R9tFr6NP/YvaJav3XxGA5IVoO2BI4qHSWUi9hJZDlRI=;
	b=N/KgUxJLnC7gZtokF5QZIg5K1lbpQmJxyynuHKtEjf/p5T6RUb+n/lJCLwiZ63tENhxgE1KAP4VKF8Y5V8HNLsqAyTWje8mycxmdttAg4o/UK3xd/fGHQ2AihwUScGkuHeS6CGaU/5qzv+TumBZ2WWn4fu4NtFdse/HRc7gLu2Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:53b1bd0b-8c0d-477c-8f19-d93d87b22595,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:8712ec7f-99e0-42db-8543-075f2c30d73f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d12abdee29aa11f0813e4fe1310efc19-20250505
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <sirius.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1507456145; Mon, 05 May 2025 20:16:47 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 5 May 2025 20:16:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 5 May 2025 20:16:46 +0800
From: Sirius Wang <sirius.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wenst@chromium.org>, Sirius Wang <sirius.wang@mediatek.com>
Subject: [PATCH 1/2] WIP: dt-bindings: arm: Add compatible for MediaTek MT8189
Date: Mon, 5 May 2025 20:15:45 +0800
Message-ID: <20250505121627.3944728-2-sirius.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250505121627.3944728-1-sirius.wang@mediatek.com>
References: <20250505121627.3944728-1-sirius.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This commit adds dt-binding documentation for the MediaTek MT8189
reference board.

BUG=b:387230785
BUG=b:387229727
BUG=b:362203280

TEST=emerge-skywalker chromeos-kernel-6_6

Signed-off-by: Sirius Wang <sirius.wang@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index fa1646bc0bac..05e827076a7f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -372,6 +372,10 @@ properties:
           - enum:
               - mediatek,mt8188-evb
           - const: mediatek,mt8188
+      - items:
+          - enum:
+              - mediatek,mt8189-evb
+          - const: mediatek,mt8189
       - description: Google Hayato
         items:
           - const: google,hayato-rev1
-- 
2.45.2

