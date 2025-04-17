Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13AD225A47;
	Thu, 17 Apr 2025 08:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879482; cv=none; b=WR5EHlPZUsnpLsvonN22/680jfUELpG3Q8O4o4TE7cxAn2jYw+s6VC7H+29COh2WDLsyxz/8At7ypcxId6K/Wl3qpxNm9xDyz/sLPGlfS1JyZgf9glx7pq9ANGu9MZThGDMZWZUMzGWMEufiZMgrXpfaTa1QAayfsDIcKsTO32o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879482; c=relaxed/simple;
	bh=v23JT6QPcdjNmOFZ+Icy4Oan4WiHogN5p2dur86WsSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n8QDFsobSHqzG3TysH+4+JrQmdXwwGNP+bZLwZbazUpygOAftzZ21r/Z6Xfa1xHKUIf8WUY6rWdkkrgZKl6sPR53Y06te6R8xA8rZ0cypMv8KlyR5eKMed5m9aeX7Rz9Ql4Ya2bxCBvITqa8+43bKuBovAYg/uswVkseJcDDios=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BL5osxyy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BL5osxyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744879479;
	bh=v23JT6QPcdjNmOFZ+Icy4Oan4WiHogN5p2dur86WsSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BL5osxyyEoLBP8cwkPBkXrJiPkOMmvBPBis+4m/ayWLf7ukS72qW13VjcTDNm2RML
	 NCdkhRCeDTs2Vg1xTSjwRf9qxHzC8B4ruxLjyomsDZOG4w/dCjTHkY8OeHs6KT61cQ
	 sxzTlzzoi+bJxMwX4ydRDPQwNHbWO8VqCqwQLPnqg62xuDtEq7sc5IpNPG+1DljEZE
	 9av9S+AmDz+Z0ijadnhHtkOuxBtbuWJyh0nqXu+Wgi4si1apFdkp9ztvYoA4sOltEa
	 5J8dswTjqgxSHrniZ1rGfPNhsI4U87qX2SatELJBTIyrm0WOlUMYxOSzTwiX9xDjbD
	 MgxsrhwmAKuNw==
Received: from apertis-1.home (2a01cb0892F2d600c8f85Cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53D3C17E3654;
	Thu, 17 Apr 2025 10:44:38 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 17 Apr 2025 10:44:35 +0200
Subject: [PATCH 4/6] ASoC: dt-bindings: mt8195: add compatible
 mt8195_mt6359
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-mt8395-audio-sof-v1-4-30587426e5dd@collabora.com>
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
In-Reply-To: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
To: kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

Make it also compatible for platform without external
codecs.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
index 2af1d8ffbd8b58f1dce42b369fd699795183a7d7..54a53d15f40c0af56a2a0221025f3a090a05b6e6 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
@@ -21,6 +21,7 @@ properties:
       - mediatek,mt8195_mt6359_rt1019_rt5682
       - mediatek,mt8195_mt6359_rt1011_rt5682
       - mediatek,mt8195_mt6359_max98390_rt5682
+      - mediatek,mt8195_mt6359
 
   model:
     $ref: /schemas/types.yaml#/definitions/string

-- 
2.49.0

