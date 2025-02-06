Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F2E227587;
	Thu,  6 Feb 2025 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838422; cv=none; b=r96Mu0mIUDjHksel2QAtRIuraHDwaCWVcpk2wsQmPSKCEGSEo2OAZsZdJd9+u5vu2dkePsW/d+U1fPSmIVZ1xbVxxqxbbMtPphJYgHVIfKIHW/to+zFDkPgv7CDDVBNlHk3FOo2wVMkkDd3t/B7KTSu8riakqdWZ5c6jVEMKSOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838422; c=relaxed/simple;
	bh=GSjB3A6KBvPhf4n3kY6OKncABdUjFEgAT/3AxmzLb3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J7YYbRAr4zPdyQ9lqWziXjrEwT6KhOAIKH+Eff2WuC5mDiJSODn9cj/itplZDoTFP5k6iM3JMB2YZ67+96buvKuYLWWgThEcYsSUbaYdfXhDXhmFQ8VuIXbDWSv5fNQaDGztNu8zyrOfB24aOyD8Qyc4By8hLPmh9RcfKE3iWwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k0kwIOiM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k0kwIOiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738838418;
	bh=GSjB3A6KBvPhf4n3kY6OKncABdUjFEgAT/3AxmzLb3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k0kwIOiM+bR49RRMug+yDoaRX0Usz+UQlVbeFAY5n9+2/5T3jqNmoJ1YecPecyNOE
	 WNSh79RCsE4RDt/7LrP23/auSHnbd58/xzovVy48pMn3lZopRSHEc4d3DShfQb0Y7r
	 0brvDdDPY5+81kgbwQJTfcKwG+UNKBsz3lrSkwEekhZoMCsesbTGLxZObFo2ApfnQW
	 bH0apUzmgQRzq7aU5NF0ElOrbEbsUF8mjAUQsnwbSYFTI0bIKTXNMpfV3msIoRD11Y
	 10uZUqdD86eNeZfDJBiC632dyiWosK1TNG4J+SwdWX/2L/Ni4nEpJrIp9qMcFIQIXB
	 LHMRe7EhdZrsw==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C9B2517E0FE0;
	Thu,  6 Feb 2025 11:40:17 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 06 Feb 2025 11:38:08 +0100
Subject: [PATCH v3 1/4] dt-bindings: arm: mediatek: add mt8370-evk board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-dts_mt8370-genio-510-v3-1-5ca5c3257a4c@collabora.com>
References: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
In-Reply-To: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738838416; l=1483;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=GSjB3A6KBvPhf4n3kY6OKncABdUjFEgAT/3AxmzLb3s=;
 b=t9N83cQiRR1vdUYaKl741IVvzm8OfULIf8UfjC+JyplJVdzC4FrueiYhslZxTH30tIdBMjawW
 wzpMhwE8qD3AUxw7vuJWO8G/DGt9iHXdvfCKuzkBKsRYDXwYHBX7ljl
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

1. Add compatible for MT8370.
2. Add bindings for the MediaTek mt8370-evk board, also known
as the "Genio 510-EVK".

The MT8370, MT8390 and MT8188 belong to the same SoC family.
It is a less powerful variant of MT8390 SoC and their main
differences are:
 - Arm Cortex-A55 cores number (4 vs 6)
 - Arm Cortex-A78 core speed (2.0 GHz vs 2.2 Ghz)
 - Arm Mali-G57 GPU core number (2 vs 3)

Like MT8390, MT8370 hardware register maps are identical to MT8188.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 3ce34d68c213acae44c27bdee3a9bb0b9dbcd1fd..108ae5e0185d93976556a03768595961961bcc33 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -412,6 +412,11 @@ properties:
           - enum:
               - mediatek,mt8365-evk
           - const: mediatek,mt8365
+      - items:
+          - enum:
+              - mediatek,mt8370-evk
+          - const: mediatek,mt8370
+          - const: mediatek,mt8188
       - items:
           - enum:
               - mediatek,mt8390-evk

-- 
2.48.1

