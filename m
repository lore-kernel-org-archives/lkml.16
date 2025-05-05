Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C284194A67;
	Mon,  5 May 2025 05:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746422471; cv=none; b=RCthrD17wwMeo8AKnPXZX0j2OSLN0g6rFxHmqnQ3bglOnLA9PwPZ++9IcmP8tbUkXm8zNHPramQyLq103SVFAZgCmnpfOh1+8+0ExhsRDQa2jWKZrpF86kkDLfCZO9QUwFBpRC2Zv0Dez2FCCfH+Qc2gkxzCyC8IJIUoadAlcw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746422471; c=relaxed/simple;
	bh=eFUNJz44umhXOHrb3M8tG09Hn9kgygwm89YtP0GIyOk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yg7HtM9KpJiqQt0m7WBfFRc45owDgs0cehD6j2CZVSS59ZVPMtZnb8GL0nEMsNT32avw6IUa4e7a6tZzhB6DDOpXXQ6e64SgGUOj/5PV/kPKCTdYah0L5Fvf9WzQbGJDqBMaEqVcHskf0a6JYD8K3HLT+PgJbK0Z1qoMC70XMzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5Kr3f55; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5Kr3f55"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9358DC4CEE4;
	Mon,  5 May 2025 05:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746422471;
	bh=eFUNJz44umhXOHrb3M8tG09Hn9kgygwm89YtP0GIyOk=;
	h=From:To:Cc:Subject:Date:From;
	b=j5Kr3f5558Cu0uGP7jS1QGHwsAcFOt5cbr8JZHzqZq21yX1qU6YrdAJU/GWazYj4m
	 PrGK6QZXEy3ZE+uW89sYOQruR6G+9IyPPwyigS3IXgx/98Cc2+Otpl3y1+zLO/bWHI
	 exIiGxegMJaCQX6GXkIN1YUGy8eR6oFJoswGvXSh84uUCuysabLEhngAcUyBIHr2jl
	 O3dxTQiRQeVIZe5GW6lBfEyJPO18wGHQQOSXB9wwlUkjoz8oWvOW4Ne8c2wYpE3nes
	 24XB7cdY1kk9nhYBaG53d3LKuZubPEgAJRdVN8oR1p/tpwl5ECoMKDYMErd3c93TKq
	 WqQc2KQQLhWXg==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Zoran Zhan <zoran.zhan@mediatek.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET
Date: Mon,  5 May 2025 07:20:52 +0200
Message-Id: <20250505052106.1811802-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The driver support was added without selecting the codec, which leads to
a link failure:

aarch64-linux-ld: sound/soc/mediatek/mt8188/mt8188-mt6359.o: in function `mt8188_mt6359_init':
mt8188-mt6359.c:(.text+0x19f0): undefined reference to `mt6359_accdet_enable_jack_detect'

Fixes: f35d834d67ad ("ASoC: mediatek: mt8188-mt6359: Add accdet headset jack detect support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 3033e2d3fe16..e148d4d94160 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -229,6 +229,7 @@ config SND_SOC_MT8188_MT6359
 	tristate "ASoC Audio driver for MT8188 with MT6359 and I2S codecs"
 	depends on SND_SOC_MT8188 && MTK_PMIC_WRAP
 	depends on I2C
+	select SND_SOC_MT6359_ACCDET
 	select SND_SOC_MT6359
 	select SND_SOC_HDMI_CODEC
 	select SND_SOC_DMIC
-- 
2.39.5

