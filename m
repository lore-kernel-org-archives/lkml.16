Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE46B1EB1B3;
	Fri,  7 Feb 2025 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941526; cv=none; b=hp8TJZmU1LBKfd4TlOD323jhb9ePjorDr3EMZiicmDaYcxkoLIcRAiAD64TmUoJIt4FficA88xmBB8jpZYmgEyGJImaFRZUNS14eDkJAA+I2TeyPyFG43nM5h/0eo+xB+79nK2lmqQpEBNF+I9EXTU+FVNPaktymniwHO/oW2Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941526; c=relaxed/simple;
	bh=CN3+JuK+9gG4rZwQyx1SxziYFUpyVC/10T8zzKMX1ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UR7KU3N6A+SeIH728ltS5nzNdW8PTibazI1DB/3mYLty4NpZIMgZcwmdHEFQhLHhCZX84/ZhuTsal6NfXijhO3tnsEtJiL4BmgZMftchswuiLTmGDQxpn9rfGOPKEqjUHcPxs6oZV0L1EJSgV63qKXgLTJs32wd+1Kas6rI/hmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oinCfeuK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oinCfeuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738941523;
	bh=CN3+JuK+9gG4rZwQyx1SxziYFUpyVC/10T8zzKMX1ns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oinCfeuKKWe++o0wr6s0PbX99P299S/FiMlvo9RIzdEKmsW1YCB1USm2kYyOokBfI
	 iisu58WnSb0MyZ5oEiFVvXuyky2MDmu7SVx7Cr/OgjWfSO+LYPRQN1yOqt0R7Sl4Uz
	 H+Mlv+4Xf2TsppmDpg6nbQDyaYuhhHiR9j5A9CkXiJXpDA12T2bVH2OlsejirOpGnn
	 hvnexFSrfpkP9NEjpsHiCgPkXoKj5Vea9izHwvmpTwczbdgkaG6l+6YwrMvOHp8dGB
	 g+VtRDzARGIkYHwZmDsXSpaVYRGX5zx/7UqXwECnb2b0sCnYvNwpT+bfNk3s0BT2Mf
	 ckVCMhqBOebiA==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2547B17E1164;
	Fri,  7 Feb 2025 16:18:42 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 07 Feb 2025 16:18:32 +0100
Subject: [PATCH v3 3/3] arm64: dts: mediatek: mt8370: Enable gpu support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-mt8370-enable-gpu-v3-3-75e9b902f9c1@collabora.com>
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
In-Reply-To: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738941518; l=1567;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=CN3+JuK+9gG4rZwQyx1SxziYFUpyVC/10T8zzKMX1ns=;
 b=8y9YPPVMz5TCKK1Bvd8KcC0qBES8eUGrCm1D8d4DYAYmYyEpr50J81o9H3sz0X+cRwdhkQgPX
 EGze/5F8wAFCU877jbxUEhwceg+H4wSpZSm4dIebnoM9xrVE/Zp/2ou
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

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8370.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
index cf1a3759451ff899ce9e63e5a00f192fb483f6e5..2f27f7e7ab813b97f869297ae360f69854e966e1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
@@ -59,6 +59,15 @@ &cpu_little3_cooling_map0 {
 				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 };
 
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

