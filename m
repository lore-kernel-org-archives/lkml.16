Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A4E15D1
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751818174; cv=none; b=dqLoPVhp+2nQ0yIfbLNAZUjDh0trJnNzII+fWlf4MQ/agmToBvcWQ1iZJQE5XsG9UI91aF8CWaGcjFNX63B5x222W4HoVrc5LVBlq/emLKdMjJlYaqOMvVo/iF9ns079LDeWaoU/vy3emAeQ1aVTbwnnj3HSX6BlMl9QTIPCkHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751818174; c=relaxed/simple;
	bh=dluMG5TwwdUhJImwnbyIw4PVkx2mgF/2C48hpLjNHs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CfeK5xAVg6MI00D56LMwlZF+A+ncvc84a+UT3r3vBjKI6K16yedQi9a5H8JsCulC1uSkAu1H2gWQZP9h8s/Bu7ZPwhII+IEZ8bIalUdT32H1RiiUp12eXJ9+qMBa/FrgeBBXEjKNlIC5WyJq9KA92TA3RIiMp59UiQBRUj3uXdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SHLyWrSg; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SHLyWrSg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751818168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GCVdB7erSf5MrQ7MsULHMTx9BYT2MXfK/PWg2XLJn78=;
	b=SHLyWrSgVjMTH1jt7nyh98k5cyutOKCHjRVA6VD5KUT1buWJrZlJL84C4g+fGhM198RSJY
	FKNOYMdAaY6I1r400D/d2r/NB9lG6vN/qZzC9kuWI4a1TMXF3RTxGFy6/RWgy8wbgr3vN6
	GLVi4wiwAgVVi3hdi0gxNuzJsH1/Bhw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: mts64: Replace deprecated strcpy() with strscpy()
Date: Sun,  6 Jul 2025 18:09:03 +0200
Message-ID: <20250706160906.416270-1-thorsten.blum@linux.dev>
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
 sound/drivers/mts64.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/mts64.c b/sound/drivers/mts64.c
index 17f215bad0ec..bbeebbe467ea 100644
--- a/sound/drivers/mts64.c
+++ b/sound/drivers/mts64.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <sound/core.h>
 #include <sound/initval.h>
 #include <sound/rawmidi.h>
@@ -763,7 +764,7 @@ static int snd_mts64_rawmidi_create(struct snd_card *card)
 		return err;
 
 	rmidi->private_data = mts;
-	strcpy(rmidi->name, CARD_NAME);
+	strscpy(rmidi->name, CARD_NAME);
 	rmidi->info_flags = SNDRV_RAWMIDI_INFO_OUTPUT |
 		            SNDRV_RAWMIDI_INFO_INPUT |
                             SNDRV_RAWMIDI_INFO_DUPLEX;
@@ -791,7 +792,7 @@ static int snd_mts64_rawmidi_create(struct snd_card *card)
 		mts->midi_input_substream[substream->number] = substream;
 		switch(substream->number) {
 		case MTS64_SMPTE_SUBSTREAM:
-			strcpy(substream->name, "Miditerminal SMPTE");
+			strscpy(substream->name, "Miditerminal SMPTE");
 			break;
 		default:
 			sprintf(substream->name,
@@ -929,8 +930,8 @@ static int snd_mts64_probe(struct platform_device *pdev)
 		dev_dbg(&pdev->dev, "Cannot create card\n");
 		return err;
 	}
-	strcpy(card->driver, DRIVER_NAME);
-	strcpy(card->shortname, "ESI " CARD_NAME);
+	strscpy(card->driver, DRIVER_NAME);
+	strscpy(card->shortname, "ESI " CARD_NAME);
 	sprintf(card->longname,  "%s at 0x%lx, irq %i", 
 		card->shortname, p->base, p->irq);
 
-- 
2.50.0

