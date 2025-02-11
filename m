Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B549924F5A1;
	Tue, 11 Feb 2025 14:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739283269; cv=none; b=aTgSaVFP8qdbugsKhj2QWHyRVr5dqaLeKY8F0bp0ls5MtVvN9MsojYosARbLZZ1x6xToADHzX0fh0/rpnb0TuOvsY4JNV+DoaNdzRFG5p5b+itre6jbyGof2hDjmx9z37rtHRJ8eHBkfLwcy/yUqQQGXLuuHdmeuELF/OcIdVfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739283269; c=relaxed/simple;
	bh=r8GSQt4Fmtk2nUUtsyC/9rHcXIOOOzg63rG69cNIuyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o/v2IEv+qR+pPWB0UMKIS2MEHB2gGW2xmTx/EmNEIb3h+q8mbL5H2zOPtEZLReDEWv9J1YFEKBJh/FPuWF6z7/ruZIRM3pRWMc+rblApYVUaf3K6wKlMYnsVnWNTlMDv8GwKdyRZfL/owBevZkyLG5LfgfH0yLI7TMCAUseEVxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=laCkDPdT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="laCkDPdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739283266;
	bh=r8GSQt4Fmtk2nUUtsyC/9rHcXIOOOzg63rG69cNIuyg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=laCkDPdTknse85VhAVNJGiJax/fYG8P+5oXXFk/i2BLlJUdp/VjazgWQlXPg4gX58
	 KnvtkuiXZaLTbMa4T9+YGkrvIi2YQ5FuLFRX7MIJsgg4FFiTh9mejtBJYXo97QPUdE
	 YqDPYTb6IIaz09HuftSoc5Q+gaIJscJI+kmLDGbiK5ayzTn1f3mljYFT4SnQYwu0UQ
	 7VIwC0FdZZB8hIviV1SeETqUdvhvVG43PiyMtbVHznMlLqpgmLQxr1slFzcKLhn7yg
	 DytAyLij5vj0ILhHQXmYl5XIQgFbldJ8Zzt1aQYBRC71WJXhgkCE/afpKq4JocZp7r
	 x8qTMi8figsQA==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A64117E14D5;
	Tue, 11 Feb 2025 15:14:24 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 11 Feb 2025 15:13:10 +0100
Subject: [PATCH v4 3/3] arm64: dts: mediatek: mt8370: Enable gpu support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-mt8370-enable-gpu-v4-3-77deb7a75c23@collabora.com>
References: <20250211-mt8370-enable-gpu-v4-0-77deb7a75c23@collabora.com>
In-Reply-To: <20250211-mt8370-enable-gpu-v4-0-77deb7a75c23@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739283261; l=1948;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=r8GSQt4Fmtk2nUUtsyC/9rHcXIOOOzg63rG69cNIuyg=;
 b=RVgfl0lBwwqykOnm/tB7a5QYLPJ6sXQ+7vvt2INaxPYJU0jW5tuJvYC24r5c3i3nKE+Ek1rWl
 bwgif4T/yvxDR5oWO/zeRR/Irr8/RIx77r+XCzRueqnHD/qvOk79nbZ
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add a new gpu node in mt8370.dtsi to enable support for the
ARM Mali G57 MC2 GPU (Valhall-JM) found on the MT8370 SoC, using the
Panfrost driver.

On a Mediatek Genio 510 EVK board, the panfrost driver probed with the
following message:
```
panfrost 13000000.gpu: clock rate = 390000000
panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
   80000400
panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
   Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
[drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
```

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8370.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
index cf1a3759451ff899ce9e63e5a00f192fb483f6e5..7ac8b8d0349455922a73f35db607b2b27cad23d7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
@@ -59,6 +59,22 @@ &cpu_little3_cooling_map0 {
 				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 };
 
+/*
+ * Please note that overriding compatibles is a discouraged practice and is a
+ * clear indication of nodes not being, well, compatible!
+ *
+ * This is a special case, where the GPU is the same as MT8188, but with one
+ * of the cores fused out in this lower-binned SoC.
+ */
+&gpu {
+	compatible = "mediatek,mt8370-mali", "arm,mali-valhall-jm";
+
+	power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
+			<&spm MT8188_POWER_DOMAIN_MFG3>;
+
+	power-domain-names = "core0", "core1";
+};
+
 &ppi_cluster0 {
 	affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
 };

-- 
2.48.1

