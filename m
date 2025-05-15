Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CAC78F26;
	Thu, 15 May 2025 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315912; cv=none; b=Tj6+oZsAfw8aHM46J/i5DSUbFH532cAlT0FSW0am51+sjGvl4U0sSSDdA5Z5nZKsdLQBVnHFWm5ZDPHkKEDYiUjNWT9wCql+MWQ2YVad8734VRFlLxFX60DzcOBA4khp3MokRXbYvlCnGqQp8nLrV0LoQMUwSzL9mk8TjKvOyhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315912; c=relaxed/simple;
	bh=8VVU8NVRnTpjcLWUjqNAgSssaH4toawfwMWnPXvh4zU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DV86/D7xuh0/6LBnlJgVqKxic5Vtk6WistAukQ4Xlce0Q41+yakyo9V5zsuJ9LpjXWucHUSYScExGSKlEFQYgj0J3Nz9om1T2i9FLaGXnE4i/Po1THUCxdZQK2dcED5AkyCUiRxFasLNtAcMKW7v6lVUA32P1GrEVFAuaqKqJHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=n1iegtna; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="n1iegtna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747315909;
	bh=8VVU8NVRnTpjcLWUjqNAgSssaH4toawfwMWnPXvh4zU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n1iegtnaJRMXTSutf212UUiX+v9k41CzAhn8UMiV+FHxiMozVyEhPasaFgmbDOXsf
	 9ydE7VuFRNJi1ESO2sIOqYlgRl6+8RTzkX7XfldCKOjiPq8ZO8ZTn4iAgr7+oPxzOX
	 zve5KuPj+UOEp8gvbWnf54YcCdK5jTUDlOb8nhAHzQwGy6WbfwE7kxUWkQMtWVbXHj
	 tNYd9woATMW8GSRsV+4FioHg9JzBhxemu9srWBt+VZtAFVGF7n74y6g4kOdskW6c4y
	 WK6uxnrAqQdS8joyiXWnp492ZS2TqCL18WnJ6prwN+6S6VD688b5mYZQHXxkBPHyaZ
	 1CbpZrR9RTRTg==
Received: from apertis-1.home (2a01cb0892f2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 77B4017E00F0;
	Thu, 15 May 2025 15:31:48 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 15 May 2025 15:31:45 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8188: gce: add missing
 'clock-names'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-dtb-check-mt8188-v1-3-cda383cbeb4f@collabora.com>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
In-Reply-To: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
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

The 'clock-names' property is required by the dt binding.

Fix the following dtb-check error:
arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#

Fixes: 45682a4fffdd ("arm64: dts: mediatek: mt8188: Add Global Command Engine mailboxes")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index dec6ce3e94e92c8e1e2c3680cb3584394d9058bd..d5892ca35bc29f830d7894ba592aca3f58dc3bdc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1372,6 +1372,7 @@ gce0: mailbox@10320000 {
 			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
 			#mbox-cells = <2>;
 			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
+			clock-names = "gce";
 		};
 
 		gce1: mailbox@10330000 {
@@ -1380,6 +1381,7 @@ gce1: mailbox@10330000 {
 			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
 			#mbox-cells = <2>;
 			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
+			clock-names = "gce";
 		};
 
 		scp_cluster: scp@10720000 {

-- 
2.49.0

