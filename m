Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EDA25E803;
	Mon, 23 Jun 2025 12:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680113; cv=none; b=mbVJNxjlFUsMDEV0yahGEfU0pGF/+dLyYbS27ov/0pbL9wRpBAP35+RWljDxmYz+84p/D5za8LYwa+KuiAYJtrIuJ3UFcMRXi1Q+L6rYFIdxng3C4/yj8PDKXE35pSV5QhSH0jzCHU6FGT82nv1tTF1w+jYtfL5CWn56nG7B6gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680113; c=relaxed/simple;
	bh=q4xguAEv20thxhkNrNlpmM17Rq+I44PLFPaJdl62SdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jaOWcC6WPZiLVbx1ivxkwPO34qfQBBDbowoD4ZJl+rJy9vxyeJ/EgLbMigLUWomlPYVEoKpKQcuSrRs1c4Ckzk+h4d2zeuGAhJhwlA7CgqOPjQpnCVyCwkENiuVPH5JUcC7mKeCA55PJ2J+S0GPQ2c/A8Fg6L3BKiUhDnLoCIdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=or0ZvmSf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="or0ZvmSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680110;
	bh=q4xguAEv20thxhkNrNlpmM17Rq+I44PLFPaJdl62SdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=or0ZvmSfj/H5UL8XHYNj8c1tbJRxWQgEOqYkV/7HUnP5kNFdZLzrJqsxl7ooqoror
	 kTMdyqyjThxetQcsb3CNO8A/1q2Y6LkRHnei18u/m10no7W6o5ULXcKydpep3lkxD9
	 xNp+1os8VOUkDQBQzssLAugosURYjGRPChCGlbKI1f3pKtSIKo9pnRgdBHosp+/CIx
	 Q3FoUGe0q9nSxiJK3Xb/dPDvH0T+KVRAd/bGXK0oymkkLMBIch+w1vd6QsJb+jaazU
	 NiSmDBV56mo/Eln7K6/YtMVF/LKcJpJ9ZAkI7u4bgGhmHsil6sJj2lUYBVpux3b9CB
	 dQuAAOe2aF/Ag==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AE1417E0EC0;
	Mon, 23 Jun 2025 14:01:49 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/4] dt-bindings: regulator: mediatek-dvfsrc: Add MT6893 support
Date: Mon, 23 Jun 2025 14:01:41 +0200
Message-ID: <20250623120144.109359-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
References: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC's
regulators over DVFSRC.
This SoC uses different values for the vsel, hence it is not
compatible with the currently supported ones.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
index 704828687970..acac5c869f2c 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt6873-dvfsrc-regulator
+      - mediatek,mt6893-dvfsrc-regulator
       - mediatek,mt8183-dvfsrc-regulator
       - mediatek,mt8192-dvfsrc-regulator
       - mediatek,mt8195-dvfsrc-regulator
-- 
2.49.0

