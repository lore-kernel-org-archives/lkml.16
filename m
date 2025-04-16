Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F2E238D5B;
	Wed, 16 Apr 2025 12:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744804958; cv=none; b=CocNr0yQKqC02vOKPHUYaFmGGFHBupUfKnf8sYZPo17WHWQy8c+nPfzvqkElaNAvk0CNCJ53gMmmFsX5Tl47SyTvUd9/a01P2O6cimW+e4Opv0HQIX2HhGoB0qDMIQ1jlRxkHvT4rd6ZICxxsNAxEIsmbY9InSJEedHECgSHURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744804958; c=relaxed/simple;
	bh=cM020cuSN9YCkIudH4gTD63dk7wurpSzieojCHTZoV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QfemV2UIgjfYijDSXeRcqW0VK23yPuriB7PiczcGicQ338EITBK6oFctycTPvWGsJJSkH+mu/fwU+3R83yORNUQQemIjZBKLxcXJC4gKAhFAuySlggFIiVP5NTxv3gN+9GLzjlA6Vr2NNHUxpCiUnMZEPc5c7B0R/eGmw6FuosU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qDzIIwuD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qDzIIwuD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744804948;
	bh=cM020cuSN9YCkIudH4gTD63dk7wurpSzieojCHTZoV8=;
	h=From:To:Cc:Subject:Date:From;
	b=qDzIIwuD2tTc8xfLuYi6dXeT1OBfQQ11jG0Rg4rAbhP20bz+NljpRlzkadmQvYL/w
	 ydqn/1nafMKr3IJQLCY8tOGZun/AKnaOWiVU11AnNNSb6ILNLnbbDXSnDDTfLSR/GU
	 tfJoU0YRe7xS6vhqf46L2/CCxUv9aN9BJQ4uPlSV80qEWHC6sSIcvtUmdycyhy3+yo
	 w/r6dxBB93KqrlSsr6+0tS4W6yLJDGNgu4DgZc2dxUy7oVynq9RoMSrv8rWU8kHnLn
	 3y0hCtGcVVaZQRSws35jziNMEsYtMRlEkzig4a6JIWq3zPB0GXSdGvPx5Yix2utNOW
	 SQ2QWe9FvW7KQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A8E017E362B;
	Wed, 16 Apr 2025 14:02:27 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mandyjh.liu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support for MT6893
Date: Wed, 16 Apr 2025 14:02:25 +0200
Message-ID: <20250416120225.147826-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible string for the scpsys block found in the MediaTek
Dimensity 1200 (MT6893) SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
index 768390b92682..0e1d43c96fb9 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     items:
       - enum:
+          - mediatek,mt6893-scpsys
           - mediatek,mt8167-scpsys
           - mediatek,mt8173-scpsys
           - mediatek,mt8183-scpsys
-- 
2.49.0

