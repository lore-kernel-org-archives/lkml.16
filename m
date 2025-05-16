Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7334817993;
	Fri, 16 May 2025 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404763; cv=none; b=QkUspaJc3rEBWdytNp6wwhlkCRXyI3kdgyexdrTAIN0AeWa4qAhyb1vd7Dw9dlh9JkYTvItVvodYc1LL4aaNx55N9L3nK5rt8cPv9ZdUAvdREOnKHYVaSXv5OoWLgjIl0MJUZMg89yyykRukA1GuICsQOFJ+0ezOEWeIQ0oTtgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404763; c=relaxed/simple;
	bh=NJBXz1AbfA1GAlcdN/Q5wV2specP9Nphdtb3gDoHx0w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gwJLOt2vrZ9vYPYz3+VMxPzopG+aPDRR4oCKjQCTS/tYEtMHqYejxZeZwgPROBVFP9hNzdlHuj2G69di/tlZopkdb0p0c6eoorloYfYJEanWt7kRI4/1w8xW+tNFyNKGL0KVIrqfx4J85NaOtqdgb9c/cUUKxDGgNLzALniNlCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T/A/AYau; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T/A/AYau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747404753;
	bh=NJBXz1AbfA1GAlcdN/Q5wV2specP9Nphdtb3gDoHx0w=;
	h=From:Subject:Date:To:Cc:From;
	b=T/A/AYauLsmBu4sQJbPeliv7IlBOZ6fFwHkjQAa2shZHy8/PAw1oy+R2r/LldxCbt
	 AiRvfpDNeGAFc0/YXTQeP/T3twG9+CtDfnZTYrjAOHlokBXP5aiW1NnvjOnYPuJljF
	 7dWu31C1keUQVt9hG36WTqtHspRx8kiSo10TgHDkJo7ySAPXtF2AnyN4sOLDf0fCtz
	 Liht9dTnNuwaTeZIjqEQuKY6HlKwPkX2JlxI6Iikj3qB9dOBaJ20fC3PZ3/J7EbXcx
	 XofAYAsCTT8oyR7ypUcb5/KEAZsDA+RaYVlVoCh1D24pdGDfQ6Ndgyf7DYC/L07tlU
	 hcX5le4nii21A==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600C8F85Cf092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D081117E00F0;
	Fri, 16 May 2025 16:12:32 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 0/2] mt8188: Fix missing reset DT property
Date: Fri, 16 May 2025 16:12:12 +0200
Message-Id: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALxHJ2gC/32NQQ6CMBBFr0Jm7ZgWnKS68h6GRTsdpBEoaQnRE
 O5u5QAu30v++xtkSUEy3KoNkqwhhzgVqE8VcG+np2DwhaFWNSnShH5xyL3wC8fFaGOQbEfKkye
 +NlBmc5IuvI/koy3ch7zE9DkeVv2zf2KrRoXsbWMaduIu3Z3jMFgXkz1zHKHd9/0L/tVK47QAA
 AA=
X-Change-ID: 20250515-dtb-check-mt8188-5af50d5d5c93
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Garmin Chang <garmin.chang@mediatek.com>, 
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

Hi all,

This patch series addresses some issues found in the MediaTek MT8188 device tree
and its corresponding bindings:

The #reset-cells property was missing in the MT8188 clock controller binding and
device tree nodes. This causes DT validation errors.

Patch 1 updates the binding to declare #reset-cells as a valid property.
Patch 2 adds #reset-cells to all affected nodes in mt8188.dtsi.

To: kernel@collabora.com
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Garmin Chang <garmin.chang@mediatek.com>
To: Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Changes in v2:
- Change the wording for patch 1/2
- Drop the fix tag on patch 2/2
- Drop the former 3/3 patch in favour of another solution:
https://lore.kernel.org/all/20240911104327.123602-1-angelogioacchino.delregno@collabora.com
- Link to v1: https://lore.kernel.org/r/20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com

---
Julien Massot (2):
      dt-bindings: clock: mediatek: Add #reset-cells property for MT8188
      arm64: dts: mediatek: mt8188: Add missing #reset-cells property

 .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml       |  3 +++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                       | 10 ++++++++++
 2 files changed, 13 insertions(+)
---
base-commit: bdd609656ff5573db9ba1d26496a528bdd297cf2
change-id: 20250515-dtb-check-mt8188-5af50d5d5c93

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>

