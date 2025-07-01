Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AB11DDC11
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371561; cv=none; b=hHpWPPTRqpaxIbj1oDPuXkqyIOgMZqdUwS8VEXWYZGG6f5tCNS1ODLE3h2NulGiwH8opu/AIkR5WgMPla4omVPCXcju2VMmIqAbvWVHVrQurcBiGsDET5RNNZKfhpKTCrdjh3jvF0oCSb0WuL/BK4xvNno8BjXryVOb7MomYWP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371561; c=relaxed/simple;
	bh=7deDd/ZCfoMKf6kJjEI2cAJHBO9rb69uxr6+NvD3rJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GkV+xNmu8nW48Y8wmprSVZwOwwUKad9SHQA2ZUUYhUd6oNWuRXDUC/D+g9U5JZEAZevp5Tpo8kao8Mmf8laESLKMbJ1hOCM2SffpDYxuxPQTiAE6wrVOSlEkUE6ekzGck8LTkrwwszU7i1fIjDp4FF+WFqO+KSWHclRXtMEGqJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pI8VOVcE; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pI8VOVcE"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751371545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LIxrt0/rPsw1/RvYlC+bC/HFMwGL1pDNVfdMHrUT7EU=;
	b=pI8VOVcE1PYTibv9Vb+fi6dGPTt8DdhE7xYOJLA0nDoYfhjjgu2euwln/D/o7wE9RP1rcI
	iNCoiNKKcDXiD1me1GMGM3QJeWkgZDmESZ4wez/QmFaSGNvYOw6g09UtlEJP0MmUNcUA5o
	ZEs03iEXoFmnQd/MCgZvuEfi7uxAbbE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcmtest: Replace deprecated strcpy() with strscpy()
Date: Tue,  1 Jul 2025 14:05:25 +0200
Message-ID: <20250701120525.185831-2-thorsten.blum@linux.dev>
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
 sound/drivers/pcmtest.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 39f1e1fe4c44..19b3f306c564 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -36,6 +36,7 @@
 #include <sound/core.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
+#include <linux/string.h>
 #include <linux/timer.h>
 #include <linux/random.h>
 #include <linux/debugfs.h>
@@ -555,7 +556,7 @@ static int snd_pcmtst_new_pcm(struct pcmtst *pcmtst)
 	if (err < 0)
 		return err;
 	pcm->private_data = pcmtst;
-	strcpy(pcm->name, "PCMTest");
+	strscpy(pcm->name, "PCMTest");
 	pcmtst->pcm = pcm;
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_pcmtst_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_pcmtst_capture_ops);
@@ -613,9 +614,9 @@ static int pcmtst_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "PCM-TEST Driver");
-	strcpy(card->shortname, "PCM-Test");
-	strcpy(card->longname, "PCM-Test virtual driver");
+	strscpy(card->driver, "PCM-TEST Driver");
+	strscpy(card->shortname, "PCM-Test");
+	strscpy(card->longname, "PCM-Test virtual driver");
 
 	err = snd_card_register(card);
 	if (err < 0)
-- 
2.50.0

