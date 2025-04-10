Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C80B202F71;
	Thu, 10 Apr 2025 14:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296028; cv=none; b=l7Y76y1EhcKT68eDnke9BiP3I8ZA62r9QZT2i9etB3L0jt01ORZ93oVyTi8WDL3QnrnQGlKrGzdVTjkIDU37SRo7znwjXtiu0Zw/G5RVkgZs4rKpFeVa5Y6E9GtEsW0Y2nCKtFF26+SiNlCBtgMF7jRvh+i4EjmxfVHV0YTu0qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296028; c=relaxed/simple;
	bh=+1AxlEWA9rTUJ3K473VBMo8O6oTItzctYKiPygH70ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwnRKbWAYNsyaI8MB/d88up/D8cu7h/L5zWLka5tHcQgGMH2VgSDPJQJd96VsBdnp9/c/E30hDbNpn1UWz7GX7Br3UUCuklaJGwrwpr2l8W8TrBYCqdibcnfYNDQnknmFswjty1qmzgCq8fYmYqXsnBH7UmUT4/kUK7GVSagIZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SwiOi4fO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SwiOi4fO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296024;
	bh=+1AxlEWA9rTUJ3K473VBMo8O6oTItzctYKiPygH70ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SwiOi4fOM/NJPjvApcSl6ve/pmqa8sBStsNbIXyG9w0bL7zdiDHC/U1ewJhK9cEqE
	 js2eN5Ib/EIvjOipBGTnS47Hw91PCubuBgeqeXumw/NbFckQX+zekJqs0Dp/TvaC03
	 DMux40KKxpbuuO/Au7f1Rey2ls9bhmFtfJB39uOD21zGGCYwEgISNraff0L8Oz/+jj
	 rYzeSq1wlaImgaDg7wvCq/e+rokIWWO7PPUXi2+aKPJY6XbpfIjuQmdobsHEoNwwlr
	 ndUJJ15r8gI4tMWJM24a7axEsuiTNoub/sKJq1dKFWDTERg84blLOJ1EpeH2RaeyzL
	 HboI8eq3ctuBw==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A3D617E1072;
	Thu, 10 Apr 2025 16:40:23 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/5] dt-bindings: soc: mediatek: dvfsrc: Add support for MT6893
Date: Thu, 10 Apr 2025 16:40:15 +0200
Message-ID: <20250410144019.475930-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC's
DVFSRC hardware, introducing capability to communicate with it.

Even though this SoC uses the same basic version of the DVFSRC
IP as MT8195, the vcore-vdram parameters are different, hence
no fallback compatibility is possible.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
index 1ad5b61b249f..4c96d4917967 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6893-dvfsrc
           - mediatek,mt8183-dvfsrc
           - mediatek,mt8195-dvfsrc
       - items:
-- 
2.49.0

