Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA89E28EA52;
	Thu, 10 Apr 2025 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296008; cv=none; b=KJ8kRUNFfbWySQRhz+rvto9qsxaEsx11HCL4i86upZEGL3LIWKM/nEZ5a8EA/CHwRkoMLkYgfsQLsOa2Fu9CEY3+vnm0JIYhfsbeXGi+GJSDYaXcO5UjavKf9MHuSoJ0lt6jM7wFh2ituXA4ZcMeut9EbISknkv5OLQN7UgF9FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296008; c=relaxed/simple;
	bh=icgSlyT8oxnnPGuXt7Y2g4cMU2st21h/iIDOi7whekM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxesyxuKy2tF2UW211hezmiPq0IDAdoQFM2eTxSoKNiTIJ+tdqr1XgYE4ICjfwGSZsp0bFqXPSdydhyM9ntEX+OvMqr0AeLRwKoDUGp3zh8jQ+laNWRKAkikjj82W/13MBbYdEO46zKeywpBAK6zqMX4NCymY80bDxeDBmn5UM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZR42CSNh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZR42CSNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296005;
	bh=icgSlyT8oxnnPGuXt7Y2g4cMU2st21h/iIDOi7whekM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZR42CSNhj8cwmqQSIXezIYZEXc8W7USjy6K7mXEqiz05+UGfUGOh3/Cd5Gf28hS8R
	 ONKddh0ul61T+IL74Uq4vd2M9xb4fOiq4cOdvwLR0olEKC6Z0sodUi2a1n9/mRGq79
	 7he+6Sf7z3Vh+JXkiFaXlRVx2yTdoPIVVa/lNXedCtUx5gYQkEDOIM1o+cCdF5alMU
	 dz1AT3ZiKq7TMyXkODfnptTKhLtr2n2p3Od7or5eCl8aQVkctg9DGC43Z3tWnJ4MAw
	 UMbw/ftt0CBAt0REacBcvPdg8OQwa7T9b4+UKUMnPGxJxXgHtlGRrwAha8oQfLfDTQ
	 9jME0EOgPor3g==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0243617E1134;
	Thu, 10 Apr 2025 16:40:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: krzk@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/2] dt-bindings: memory: mtk-smi: Add support for MT6893
Date: Thu, 10 Apr 2025 16:39:57 +0200
Message-ID: <20250410143958.475846-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
References: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Smart Multimedia Interface's Common and Local
Arbiter HW as found in the MediaTek Dimensity 1200 (MT6893) SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/memory-controllers/mediatek,smi-common.yaml         | 1 +
 .../bindings/memory-controllers/mediatek,smi-larb.yaml           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 2f36ac23604c..0762e0ff66ef 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -33,6 +33,7 @@ properties:
           - mediatek,mt2712-smi-common
           - mediatek,mt6779-smi-common
           - mediatek,mt6795-smi-common
+          - mediatek,mt6893-smi-common
           - mediatek,mt8167-smi-common
           - mediatek,mt8173-smi-common
           - mediatek,mt8183-smi-common
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 2381660b324c..2e7fac4b5094 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -21,6 +21,7 @@ properties:
           - mediatek,mt2712-smi-larb
           - mediatek,mt6779-smi-larb
           - mediatek,mt6795-smi-larb
+          - mediatek,mt6893-smi-larb
           - mediatek,mt8167-smi-larb
           - mediatek,mt8173-smi-larb
           - mediatek,mt8183-smi-larb
-- 
2.49.0

