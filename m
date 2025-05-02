Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8648267716;
	Fri,  2 May 2025 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204213; cv=none; b=TTzvgpYCcNHnchGVWJK9Gb66I/ZpNLnE7RqwteHBPmUBi3srXOWFuMS16aXA/x3DpjUQN0sHySKF5IqF9/ZPd0UznClemRMngLZjeCbMV6Q//ycRvyrJNpgqbhW7Hlf1XiIgegmEx1KrrCggk8S3CFqnk39EsO9dXcwu9/J802g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204213; c=relaxed/simple;
	bh=ygx2bzlBgpHjz1t7Ya2NDxpOQ/Eveinyd42eds817pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjY6/3wqTUWkILLOwSGeAWnKtoDrSNbEjo4BvCWbQwwRSB4+dmmAOIQffXAY95m8odgra+u89XsR8ZeFu9mjHzR3oEMg+4vcLkkngqDe3frRzzYUaGmuNJ/SHTpIhY+6A9UMQQntZ20/76C+qidyenr8iSNoHDvNKR5qiZyVggE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=q1B+zzkp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="q1B+zzkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746204210;
	bh=ygx2bzlBgpHjz1t7Ya2NDxpOQ/Eveinyd42eds817pg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q1B+zzkpLiAT/IBpIvW7htAZx20VHLTySJOBTzYHqwk+TH6dQ0Pe6AiPO20GtF+FO
	 sgvYCFkgNFm1sCbT/KBekn5a2/oxtB6g/LDSOhGlFQ+fsG5IskGTEAs7MTE8hGDySt
	 uCakBdm8dsU0mOu5xjcN16OIPtgGEMtpn5kP9S6WrlGhe34bzrLPXuNk3TKbfGFxR6
	 yWcF+Q5HkbEVQ9c3doQW6RR62S2INKAa/O0SXSU3zD0JYST73UJf615bBRCR0XVbue
	 ph8cvwttJlHntLirMQ9iEyNBO2eIj2vk7U2eifOxk+lFWDOdRGKAgTs5vWjJkitR7D
	 EWqy+WTxvnQ5g==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDDB817E125D;
	Fri,  2 May 2025 18:43:27 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 02 May 2025 12:43:22 -0400
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8365: Describe infracfg-nao as
 a pure syscon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250502-mt8365-infracfg-nao-compatible-v1-2-e40394573f98@collabora.com>
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

The infracfg-nao register space at 0x1020e000 has different registers
than the infracfg space at 0x10001000, and most importantly, doesn't
contain any clock controls. Therefore it shouldn't use the same
compatible used for the mt8365 infracfg clocks driver:
mediatek,mt8365-infracfg. Since it currently does, probe errors are
reported in the kernel logs:

  [    0.245959] Failed to register clk ifr_pmic_tmr: -EEXIST
  [    0.245998] clk-mt8365 1020e000.infracfg: probe with driver clk-mt8365 failed with error -17

This register space is used only as a syscon for bus control by the
power domain controller, so in order to properly describe it and fix the
errors, set its compatible to a distinct compatible used exclusively as
a syscon, drop the clock-cells, and while at it rename the node to
'syscon' following the naming convention.

Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index e6d2b3221a3b7a855129258b379ae4bc2fd05449..49ad4dee9c4cf563743dc55d5e0b055cfb69986a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -495,10 +495,9 @@ iommu: iommu@10205000 {
 			#iommu-cells = <1>;
 		};
 
-		infracfg_nao: infracfg@1020e000 {
-			compatible = "mediatek,mt8365-infracfg", "syscon";
+		infracfg_nao: syscon@1020e000 {
+			compatible = "mediatek,mt8365-infracfg-nao", "syscon";
 			reg = <0 0x1020e000 0 0x1000>;
-			#clock-cells = <1>;
 		};
 
 		rng: rng@1020f000 {

-- 
2.49.0

