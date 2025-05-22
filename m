Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E35319C554
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936932; cv=none; b=aDqspSVXAeVgtku4cJzqLlV4D4i8AXlAMfZVtTvI9DVsTXfwUdj1XTGaYf2HmVW+mETy4oharBQYUWa3gUjAg8rOmZUP5m2hiNbdHtA2BdM5Ot5Q/rCv0CuPkuE6RaXNNyLb7F4MQ8G4V4xxq2W14Lsw58Z0lT5l7Bi+46uuOWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936932; c=relaxed/simple;
	bh=fU1TDpkM78sBqyAAn65xPosK5fVvZ7Y1pL9QFc9qna8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oJA/hp19NqIWOTKGx0F5hXfiSPZYHyhmIfsKcTFzNF44j4VvLoufmLonYTMu0XtRkFnnrh4gWslSr+g3BvDkahCkvAcCaVn65BWeUGmJzQKVZUgdBWh3NoM8q1Q1QScOfKP4mYjS6BsMOInPI5cmNStcwV6ieMGjKa2P4v366dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qpSD4Ag2; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qpSD4Ag2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747936926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ddo6/t51Ad7jbh1RDELKsmA+85tSYxxw1JYFqZMDRG0=;
	b=qpSD4Ag252jeNzMrw9zTEucNN68Txb6+CBaeVOjfgNFG2daUT9aLpuQH5erDSoqWwAS8Nc
	lsInP/dzY5RrdC+n88bNlQhps5A/JrTKMZmq0tKFIG7fAWgHvPdvpse16enUOtCv77qDPs
	fRu+xVqhxafjsjyx6w8lCKmKC52J0f4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: atmel: Replace deprecated strcpy() with strscpy()
Date: Thu, 22 May 2025 20:01:09 +0200
Message-ID: <20250522180111.12144-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use strscpy() instead. Use strscpy() to copy the
long name because there's no string to format with sprintf().

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/atmel/ac97c.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 84e264f335ca..693d48f08b88 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/mutex.h>
+#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/io.h>
 
@@ -589,7 +590,7 @@ static int atmel_ac97c_pcm_new(struct atmel_ac97c *chip)
 
 	pcm->private_data = chip;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	chip->pcm = pcm;
 
 	return 0;
@@ -748,9 +749,9 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 
 	spin_lock_init(&chip->lock);
 
-	strcpy(card->driver, "Atmel AC97C");
-	strcpy(card->shortname, "Atmel AC97C");
-	sprintf(card->longname, "Atmel AC97 controller");
+	strscpy(card->driver, "Atmel AC97C");
+	strscpy(card->shortname, "Atmel AC97C");
+	strscpy(card->longname, "Atmel AC97 controller");
 
 	chip->card = card;
 	chip->pclk = pclk;
-- 
2.49.0

