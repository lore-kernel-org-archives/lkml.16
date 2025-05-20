Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7F921D3F1;
	Tue, 20 May 2025 11:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739409; cv=none; b=m45FOr2vfCuD+FsVwN45ONa3hjk6Tj3b5LgJoS+aHTG7VZj7AsARUWgh33dXfYXwYDqjV5b7aFI6/4OZExRaNcRmrKzb/r3QKn2l/YXsCTjrZB/545QSWkgdPkkZRucanEdckyysbNNbldcKVc7+V2n2bRVXjV93G9jDiHJomWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739409; c=relaxed/simple;
	bh=Xj2HD2MawbrtSBmFoR2etpcm9AJMpw2lNkY9iw6DYso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L4x3wOW65krHOaZPHt3BpN2PEVCX7vQRqYDWwj+FWqX0hw0qBseMaTejh6BcCtzwHCB7hzjOTKWxx8TbNiVL69M5BZExCwDsffI+IwRZunKa1BtTETQgKkxKZoyOPT6OQDKOdFFAzy6p6K/DUWIKacmpRkgXpQn1OjnFTxyBrqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iTReMvdV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iTReMvdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747739404;
	bh=Xj2HD2MawbrtSBmFoR2etpcm9AJMpw2lNkY9iw6DYso=;
	h=From:To:Cc:Subject:Date:From;
	b=iTReMvdVCpaCDVMuwX3W1czc++LprkMXOfYNLuwlLmxVk6948s9N/63vebV2laGb6
	 iIc6fDwRS+Jl0AqaAssQTditjtaCyj7TsQsNtU+E0ytyh0EEb3BH3tvNoWTq/RSH16
	 pWOwS+f42f2Xbef1NehzBQkih4pVNEepvmINY9sIpUpJchz8vqYWmyDglQLh7eOY29
	 2gv9dpirPGSIzem8EtxOWIRFTMv9/QdcgeQWD6317wf+yS6ZVJSDA4+pHcad3Yfz3P
	 XWx1w009+HKJX41OotXwUK7fVl1xLjZ4xhZQYm1Auozo2MFG3EVXs3F8C+B06TY78L
	 0fhkmqzptb78Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9313B17E0FD3;
	Tue, 20 May 2025 13:10:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] Revert "arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0"
Date: Tue, 20 May 2025 13:10:02 +0200
Message-ID: <20250520111002.282841-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As clearly seen on other non-MediaTek platforms, this is known to
eventually produce regressions in the future, as drivers may break
ABI and stop working with older firmware versions.

Although the firmware-name property was used in multiple MediaTek
devicetrees for the System Companion Processor (SCP) node, avoid
doing the same on MT8390 to lessen eventual ABI breakages that may
happen with a driver update to change the firmware retrieval logic
for the SCP.

This reverts commit 2f0066dae66f30386ecd6408410e27a4d6818c15.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

As strongly suggested by Arnd, I'm sending this revert. Driver changes
will follow as soon as possible, and most probably not in this cycle as
those should - at this point - be carefully engineered.

 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index aa8dd12a84ea..eaf45d42cd34 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1177,7 +1177,6 @@ &scp_cluster {
 };
 
 &scp_c0 {
-	firmware-name = "mediatek/mt8188/scp.img";
 	memory-region = <&scp_mem>;
 	status = "okay";
 };
-- 
2.49.0

