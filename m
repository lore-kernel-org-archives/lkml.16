Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3C1253B58
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 13:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751550215; cv=none; b=YMPjb5s7R2W5OGqNgD8tYlerFAsPNnjs6aWC8wVUhguLmy46yFqJ/9HlImJ0gdeRQnE/cfxmZ6OVw3wMC1A+uW/S4L6qckv7PaABSHv7xEx3agLxhDQDF8/ljSgxgPGP8Dx+0EJVK0U08CgL9SuqsgQFFe0XstonIMsnoKklNJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751550215; c=relaxed/simple;
	bh=CPmgw9I24JNo04C5Nglumml8Nlv1618UCc3ZX+8Bz5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KK8HYOfTA4Pnz1rApD6FfakZ0H6O1e2DYsUoBSPJvk0uhSamSOjzAjBPZszEzfa4Kw9da8r/ht4Y05EQOTrOZ6SXp1iU4Tg3gbB+tceyotUgrlHU3/GFVpM44ezpb6xuM0+8UMVm9i6oJoAhKdOUKpx5GqJfjxYlsVQKALSRLys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V+4YXpRq; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V+4YXpRq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751550211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uLZ1+VGFtPtiLcMWksYvgcdRP5NaIXfFAtrP5Zm3srE=;
	b=V+4YXpRqCaSHtM1qGHvkRjuC8fS0F6DbyJuD8uNQ/rrX4h/dXlVWNU2eMITmfUuDkVUCkr
	eefQnSWyghHbqDWO07lJBS/tH7lC/Z9DRwVoSkV/WFlN6iUsqOKvIw8RiA5X1lthm0fZLK
	bukoS/guub0+ZAE1BWBLDDcV//HktUw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: mtpav: Replace deprecated strcpy() with strscpy()
Date: Thu,  3 Jul 2025 15:42:52 +0200
Message-ID: <20250703134255.3948-2-thorsten.blum@linux.dev>
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
 sound/drivers/mtpav.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/drivers/mtpav.c b/sound/drivers/mtpav.c
index 851f34e2cdd0..91828f496738 100644
--- a/sound/drivers/mtpav.c
+++ b/sound/drivers/mtpav.c
@@ -46,6 +46,7 @@
 #include <sound/initval.h>
 #include <sound/rawmidi.h>
 #include <linux/delay.h>
+#include <linux/string.h>
 
 /*
  *      globals
@@ -605,11 +606,11 @@ static void snd_mtpav_set_name(struct mtpav *chip,
 	else if (substream->number >= 8 && substream->number < chip->num_ports * 2)
 		sprintf(substream->name, "MTP remote %d", (substream->number % chip->num_ports) + 1);
 	else if (substream->number == chip->num_ports * 2)
-		strcpy(substream->name, "MTP computer");
+		strscpy(substream->name, "MTP computer");
 	else if (substream->number == chip->num_ports * 2 + 1)
-		strcpy(substream->name, "MTP ADAT");
+		strscpy(substream->name, "MTP ADAT");
 	else
-		strcpy(substream->name, "MTP broadcast");
+		strscpy(substream->name, "MTP broadcast");
 }
 
 static int snd_mtpav_get_RAWMIDI(struct mtpav *mcard)
@@ -697,8 +698,8 @@ static int snd_mtpav_probe(struct platform_device *dev)
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "MTPAV");
-	strcpy(card->shortname, "MTPAV on parallel port");
+	strscpy(card->driver, "MTPAV");
+	strscpy(card->shortname, "MTPAV on parallel port");
 	snprintf(card->longname, sizeof(card->longname),
 		 "MTPAV on parallel port at 0x%lx", port);
 
-- 
2.50.0

