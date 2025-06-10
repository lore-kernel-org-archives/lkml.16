Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672F628F513
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557950; cv=none; b=kUMyW7PJ/XoehItTvT+ClBHUZc22SEjsmZ2hZ5Xv1c4FzInJm2Gh7Xa+tTVQc8oYUDwLMgis/SNx/QmlanhpeqwSMo7G4vt1eG851SGH+dy+5t+430asGnxhs7EJ5iYjAW0bhis0iTeC5jxK7HkOxQf72tPauYKofMK5A1PTizw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557950; c=relaxed/simple;
	bh=1TdCJVE90zc0uyWujCuswdWM8W/ne8tamClZI14mU+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IiYKObbOEjHZNALm3Vzq6XR5+HB799QtTb5+FhjQby1bo2h0XFRns7SpN0IRAUm3fsjVeBMnFYCcxzoKBACPXLQc0UHTlOsj6NX42IXAfsleTH6OUh0+4+sfjsYktvNq2XfIy3NSwqD3QHIj5HMDIC7PW37fZKLZJ36cKCCspFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VsIkrWmG; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VsIkrWmG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749557943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YUwa1ViRWulotG3v7RHXQ5HOR2NEuBqQc72Nd6jY0H4=;
	b=VsIkrWmGB5orYIpgBr//Td/JFwFBSYO/Ae8YRUZuOP6+A8qMRyilZ13SHGCIrZK3hnfOc6
	0DY8vuuTLC0zeIk/7RwYynJXvYVly65vcbo91NkIrTMcvueqAdPdtrEQ0DHcpuh38A4Jbe
	FrG+/onZjg/oJs277tYlHuxyw1gexvU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: mips/sgio2audio: Replace deprecated strcpy() with strscpy()
Date: Tue, 10 Jun 2025 14:18:33 +0200
Message-ID: <20250610121835.2908-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use strscpy() instead.

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/mips/sgio2audio.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/mips/sgio2audio.c b/sound/mips/sgio2audio.c
index 4e2ff954ff59..1af177f25c68 100644
--- a/sound/mips/sgio2audio.c
+++ b/sound/mips/sgio2audio.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/module.h>
 
 #include <asm/ip32/ip32_ints.h>
@@ -685,7 +686,7 @@ static int snd_sgio2audio_new_pcm(struct snd_sgio2audio *chip)
 		return err;
 
 	pcm->private_data = chip;
-	strcpy(pcm->name, "SGI O2 DAC1");
+	strscpy(pcm->name, "SGI O2 DAC1");
 
 	/* set operators */
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -700,7 +701,7 @@ static int snd_sgio2audio_new_pcm(struct snd_sgio2audio *chip)
 		return err;
 
 	pcm->private_data = chip;
-	strcpy(pcm->name, "SGI O2 DAC2");
+	strscpy(pcm->name, "SGI O2 DAC2");
 
 	/* set operators */
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -892,8 +893,8 @@ static int snd_sgio2audio_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	strcpy(card->driver, "SGI O2 Audio");
-	strcpy(card->shortname, "SGI O2 Audio");
+	strscpy(card->driver, "SGI O2 Audio");
+	strscpy(card->shortname, "SGI O2 Audio");
 	sprintf(card->longname, "%s irq %i-%i",
 		card->shortname,
 		MACEISA_AUDIO1_DMAT_IRQ,
-- 
2.49.0

