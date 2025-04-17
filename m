Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D134F225A3E;
	Thu, 17 Apr 2025 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879482; cv=none; b=r1tPEWYXT0NAiuT7oq79fpSVI/8T60uqplDRdkUELmBuNq6nCvBVz/Lzg9z0syRmV3W5BDHdGh1W1CXVvicYwAvEJgC18Vp6rs/NVQQ8JzegXFZmk2zYQ+9yuGEltVzs5I05WPyUQBlp7HiwbJ+oBJmjl5eFEs+YT70lQsq4uK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879482; c=relaxed/simple;
	bh=i22aKPunjfXrA9afWCfJfAgh+B/tbdFUIUcF/NQsLWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fGW9Kf5gS0MsKlugf/SJWG/xJ9yWQeiibnBa9+JvCYJhcG36l8/9euujDfi3d62aGS6kaIejCWbm1lZXLVIy9Id7xq6LXMqgexWyguWfCvFTc6xwTX/M1Z0X+kvqaTSCJxnndd++eoT3Z5Xhp0oUNJj82gIsbn+06Z9Wdho3JPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SR0WTokF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SR0WTokF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744879478;
	bh=i22aKPunjfXrA9afWCfJfAgh+B/tbdFUIUcF/NQsLWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SR0WTokFZY9+TbZfvQZfA/VvaXtct3qWXxo45Q8Qt3WoG7O3Af+qtIrXo4JACKE7I
	 bzyquzk/Al2CSCtR1Tvx2zO8bJl1f3oLvYx0m765Dbe6K+5iMQkRiSmKj9MrkZKx8A
	 mnU7WGfIgmnlwHUpClIqTZBjwLkvT7xpBmtNWKDUcIItzSU3GZFE/ZpdzIc4jN4tzT
	 n28fWAyqWF+iQs+8Xkc+29IQDSjBGHwcVGvrDoBTqaueWrO04iQFlRzy5mmWYJF6um
	 90UgiJfZ1LB3lDiVroB9bxuz7u7/lrtmecK/6XtXJs2mkokX1ZvtCS1O+rS4+bgIL7
	 SzlPE0eliuyhw==
Received: from apertis-1.home (2a01cb0892F2d600c8f85Cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B05117E3634;
	Thu, 17 Apr 2025 10:44:37 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Thu, 17 Apr 2025 10:44:34 +0200
Subject: [PATCH 3/6] ASoC: mediatek: mt8195: Add mt8195-mt6359 card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-mt8395-audio-sof-v1-3-30587426e5dd@collabora.com>
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

Other mt8195-mt6359 cards rely on external codecs,
add a card for board that only use the mt6359 codec.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index a370b8af8c282bbcafce82561312e24c515beea5..3115a098e22e53345adfa4a36a1a72ac5a16164d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -1524,6 +1524,18 @@ static const struct mtk_soundcard_pdata mt8195_mt6359_max98390_rt5682_card = {
 	.soc_probe = mt8195_mt6359_soc_card_probe
 };
 
+static const struct mtk_soundcard_pdata mt8195_mt6359_card = {
+	.card_name = "mt8195_mt6359",
+	.card_data = &(struct mtk_platform_card_data) {
+		.card = &mt8195_mt6359_soc_card,
+		.num_jacks = MT8195_JACK_MAX,
+		.pcm_constraints = mt8195_pcm_constraints,
+		.num_pcm_constraints = ARRAY_SIZE(mt8195_pcm_constraints),
+	},
+	.sof_priv = &mt8195_sof_priv,
+	.soc_probe = mt8195_mt6359_soc_card_probe
+};
+
 static const struct of_device_id mt8195_mt6359_dt_match[] = {
 	{
 		.compatible = "mediatek,mt8195_mt6359_rt1019_rt5682",
@@ -1537,6 +1549,10 @@ static const struct of_device_id mt8195_mt6359_dt_match[] = {
 		.compatible = "mediatek,mt8195_mt6359_max98390_rt5682",
 		.data = &mt8195_mt6359_max98390_rt5682_card,
 	},
+	{
+		.compatible = "mediatek,mt8195_mt6359",
+		.data = &mt8195_mt6359_card,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mt8195_mt6359_dt_match);

-- 
2.49.0

