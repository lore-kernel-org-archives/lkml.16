Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8847D2192F9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750286364; cv=none; b=sKJM9fEThwMkZWNRv+/GCLBLh6ZGx9gSHuxB7m+RsvBAlSoE7C+PFFuk1OOQ1YDjhXplk0XfLSvBY3pEnf0h5NYT0lulMWcON2MV567hecSrm8gUdEfevc14600sB5noIL831Fa89l3osFFaBdHm5g9VBFfzWQErCaPjeMyImic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750286364; c=relaxed/simple;
	bh=mRzi5gZZa/1aX8R6tviTq7m+EnsXicE0VOTDCW15VJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TQMG9s3dVB9mGZC43Um5Liuan/mUZEKd5Pk+HGYXEAQUiDyIwC9f9wFsUPPzSXbQ/dy0xWP7s8pJbslICHZFoZu4HPq+Rg8di3stI/qA2yYujhwc+U5AqugL0OyUuB6QJLHwB6Fu2+N9LwbVQHctprFReaLDe6mHAYcXQSLx82k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q7wd+60l; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q7wd+60l"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750286350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ljL81Ck1+JUeY5YLPbbdbME/YZIcttGFjK9ox5olY5c=;
	b=q7wd+60l1RfuJC/8AZHUnsdqS3Rn0eSkckAggPP0AmYC9UU84X5p71c++ymE6/EAQTcC+U
	xyr+P4ir498K9r1SZIDH6FZjlazZCYCmAPFtNtSMh8/divHETSeatxfaEgxf9AIiTO8rHY
	1foXFmoMPFH/orAvg6KY/ZduH+8BmE0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: aloop: Replace deprecated strcpy() with strscpy()
Date: Thu, 19 Jun 2025 00:38:43 +0200
Message-ID: <20250618223844.1458-2-thorsten.blum@linux.dev>
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
 sound/drivers/aloop.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 4b02ec127cc0..e83e8ded1255 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/jiffies.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/time.h>
 #include <linux/wait.h>
 #include <linux/module.h>
@@ -1368,7 +1369,7 @@ static int loopback_pcm_new(struct loopback *loopback,
 
 	pcm->private_data = loopback;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "Loopback PCM");
+	strscpy(pcm->name, "Loopback PCM");
 
 	loopback->pcm[device] = pcm;
 	return 0;
@@ -1631,7 +1632,7 @@ static int loopback_mixer_new(struct loopback *loopback, int notify)
 	struct loopback_setup *setup;
 	int err, dev, substr, substr_count, idx;
 
-	strcpy(card->mixername, "Loopback Mixer");
+	strscpy(card->mixername, "Loopback Mixer");
 	for (dev = 0; dev < 2; dev++) {
 		pcm = loopback->pcm[dev];
 		substr_count =
@@ -1824,8 +1825,8 @@ static int loopback_probe(struct platform_device *devptr)
 	loopback_cable_proc_new(loopback, 0);
 	loopback_cable_proc_new(loopback, 1);
 	loopback_timer_source_proc_new(loopback);
-	strcpy(card->driver, "Loopback");
-	strcpy(card->shortname, "Loopback");
+	strscpy(card->driver, "Loopback");
+	strscpy(card->shortname, "Loopback");
 	sprintf(card->longname, "Loopback %i", dev + 1);
 	err = snd_card_register(card);
 	if (err < 0)
-- 
2.49.0

