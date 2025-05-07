Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E5A219A7A;
	Wed,  7 May 2025 20:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746648878; cv=none; b=KpdVTX4IY1ypdjezHa96+u+fmYdOf5w6YQvi7C2Sax43txIh0An7dPMHz+Zz2xA2D6I6DisUzDlkt4M+g9qrawNj/MfM29ap618FffsTICWXIYRcyq7kSdaB4WNSC/tP4mgq+9MLMS9FNgnvzx+NZmUsc57e+efN/fNi5fRQANk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746648878; c=relaxed/simple;
	bh=1wYB6g3HZmLcMhDaWBOpHrS4E4d1M7S0hY8EqdNaB7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T3p6lDhguuBRnHlVgj1QRRQzF79ZnX2MU3KpaIj1+SKZsq85GNlkekRC1DIhEaW75PsJbZK7ATEZIR5qEDTgKHydGOHdx6oG9L5if8FJNBAi+73OP0XR/kr8+RI7MaWFy3bt8Q+ZAZg6rCfwKGLldB4DnWa99a6bNAD7Z3tG5hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JEH0XLuo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JEH0XLuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746648874;
	bh=1wYB6g3HZmLcMhDaWBOpHrS4E4d1M7S0hY8EqdNaB7Y=;
	h=From:Date:Subject:To:Cc:From;
	b=JEH0XLuos0G9N9R/Vnss9oT0gjwD78a9Zvy7mAlh49Se033+o/gsmgiu1sPhxpemC
	 uw5xzDT4GBOS6u+JyKdAivFSP++gi0f7VTtBSzlXXQKfsOBy2Y+RAaV2C4/N4sY6Tf
	 mB/hPIwR7bf2wN+LZjkpA+8sz1Tmxd8bmtiDJMFMEmX77sL801A4/a2rAn0gLN5WT3
	 7Xy/3ZvWz6r/qAzkpd5cBMN06NzXB/3hfPYh6csVKN/IJSUXVGwLNT56LByTVgPWoE
	 z0OInyp/DFrYK6q35hbjVD7i4hnBI8TJ1UmKm0S2stwd29wdSIa8H0M+SS61Sv7bdY
	 xhcn9e/JIUdfA==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 37A0717E0707;
	Wed,  7 May 2025 22:14:32 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 07 May 2025 16:14:14 -0400
Subject: [PATCH] ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET set
 or disabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
X-B4-Tracking: v=1; b=H4sIABW/G2gC/x3MQQqDMBBG4avIrB2I0WjqVYqLNPPbzsJUEikF8
 e4NXT2+zTupICsKzc1JGR8t+k4VXdtQfIX0BKtUkzXWGWcm3g7feV8z9u7GIUbBwYIdSXgI0di
 HwyAIVA97xqrf//2+XNcPhNQ/VG0AAAA=
X-Change-ID: 20250507-mt8188-mt6359-accdet-depend-4ac02b5e4dea
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Zoran Zhan <zoran.zhan@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

Commit 0116a7d84b32 ("ASoC: mediatek: mt6359: Add stub for
mt6359_accdet_enable_jack_detect") added a stub for
mt6359_accdet_enable_jack_detect() in order to allow the mt8188-mt6359
driver to be enabled without requiring the mt6359-accdet to also be
enabled, since it is not always needed.

However, in the case that CONFIG_SND_SOC_MT8188_MT6359=y and
CONFIG_SND_SOC_MT6359_ACCDET=m, a link error will happen, which commit
b19fa45715ce ("ASoC: mediatek: mt8188-mt6359: select
CONFIG_SND_SOC_MT6359_ACCDET") solved by selecting
CONFIG_SND_SOC_MT6359_ACCDET.

In order to not require CONFIG_SND_SOC_MT6359_ACCDET as originally
intended, but also prevent the link error, depend on ACCDET being
enabled or disabled (which will force MT8188_MT6359=m if
MT6359_ACCDET=m).

Fixes: f35d834d67ad ("ASoC: mediatek: mt8188-mt6359: Add accdet headset jack detect support")
Fixes: b19fa45715ce ("ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET")
Suggested-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index e148d4d9416011252ddbc37111c3e7b9d59082f9..90e367586493d7a413efade6a8586c4770c459ab 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -228,8 +228,8 @@ config SND_SOC_MT8188
 config SND_SOC_MT8188_MT6359
 	tristate "ASoC Audio driver for MT8188 with MT6359 and I2S codecs"
 	depends on SND_SOC_MT8188 && MTK_PMIC_WRAP
+	depends on SND_SOC_MT6359_ACCDET || !SND_SOC_MT6359_ACCDET
 	depends on I2C
-	select SND_SOC_MT6359_ACCDET
 	select SND_SOC_MT6359
 	select SND_SOC_HDMI_CODEC
 	select SND_SOC_DMIC

---
base-commit: b19fa45715ce9cfcc597ed140df31115e969b39d
change-id: 20250507-mt8188-mt6359-accdet-depend-4ac02b5e4dea

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

