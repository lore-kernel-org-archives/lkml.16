Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685804B1E41;
	Thu, 15 May 2025 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315910; cv=none; b=SNRL4tIyCNzdlomRKxZKwLJoMNvQ27ZU3MReNIGFbKISUHXuebf39BPQFz7qe3XnjFq3YaFcEYK76VxV+N6DrEPYUayma07UallRyGSMaYANfTJwHvopm45CfYqFRL4Q5pgVMhfu72MU248lUgxc0qJWg18Y1FRRKhF9A6Bfmik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315910; c=relaxed/simple;
	bh=+qZaWRvZ9Dgx+EpqRZQgSt4qBnNCWnJbJUmOtKwdjgE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y97VzUp4Y48GFy8hOx5bGAg2iAKgfUvs/jVAE/kJ3jc1gUvGuGkrXItzybWZ82UCDQa0waokod3xJQoMuGQLBPBJLJKmX9BczRuI7PmQHMIbOSVlJbnthXs72EXcBjPAsYSXVtrObBuxgtdkS/BqvdPxnjcxxzwdaUdEOWRii4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UUpIT/pF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UUpIT/pF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747315906;
	bh=+qZaWRvZ9Dgx+EpqRZQgSt4qBnNCWnJbJUmOtKwdjgE=;
	h=From:Subject:Date:To:Cc:From;
	b=UUpIT/pFbKME4d3DBPwv84lQlVe92KlvTuedp+1qewWET30JdynRQQ8oehrCBQOZH
	 LpEPzxP1uMK7Q8aGd4yQTzsJmrXkyM39iT9EPn78NVcpJBwM1/O0nO5uX59pFl5+44
	 us/b6QjAOPK3rRTd+upxGroPb9TWqEmX2uktlApbUxw8ykdjpzuz+jDcK0YVJuFaye
	 sfYZOtc8jrDfxims7Q/2TT/ESVwRNZUgmjn7+4sTpMzELv+j10AXzv1ofd0030S/T5
	 S+/zrf0h6HXo3XFDMbC2tTeoTnVjcRXcbZpAsNnni6vRBZmE9PvG/YXu/0VciQsy+h
	 iAYHGqkVeIMMg==
Received: from apertis-1.home (2a01cb0892f2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AEB6417E02BE;
	Thu, 15 May 2025 15:31:45 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/3] mt8188: Fix missing reset and clock-names DT
 properties
Date: Thu, 15 May 2025 15:31:42 +0200
Message-Id: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7sJWgC/x3MQQqAIBBA0avErBvQYsC6SrQonXKILDQiCO+et
 HyL/19IHIUT9NULkW9JcoQCXVdg/RRWRnHF0KiGFGlCd81oPdsN98toY5CmhZQjR7ZroWRn5EW
 efzmMOX+RhBF7YgAAAA==
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

The clock-names property was missing from the Global Command Engine (GCE) mailbox node,
which also triggers a dtb-check failure.

Patch 1 updates the binding to declare #reset-cells as a valid property.
Patch 2 adds #reset-cells to all affected nodes in mt8188.dtsi.
Patch 3 fixes the missing clock-names property in the GCE node.

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
Julien Massot (3):
      dt-bindings: clock: mediatek: Add #reset-cells property for MT8188
      arm64: dts: mediatek: mt8188: Add missing #reset-cells property
      arm64: dts: mediatek: mt8188: gce: add missing 'clock-names'

 .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml     |  3 +++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                     | 12 ++++++++++++
 2 files changed, 15 insertions(+)
---
base-commit: bdd609656ff5573db9ba1d26496a528bdd297cf2
change-id: 20250515-dtb-check-mt8188-5af50d5d5c93

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>

