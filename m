Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B91C2459D7
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281870; cv=none; b=QCPVDt9HNG5AyhXTnm95fEe/LJkvxR3GJ+vEBdyZOTUbdZ6+dN2Bc7tDm9D0nTfXB/wy7W0nR2J99jiE78bsZceMrTW5RnDxWAZFoJ3ikAUrXU7d5ucrS+ELRMMz4rBN5Cd8ndKUuNCfqmZ8HoChVQaZgrMd519/E0DkYr53j4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281870; c=relaxed/simple;
	bh=unaE4QpmWfFkrwyY6gnapqlQr2pcekqMs5k9DmYNBSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eKRSeYpdSZCqKgf3LO6IngUPnGEWlMx9FWyPcwyXC7OYFSj4KzkVJ5IW2UppSROTwElARelNnWqPw7oIwhEaB9nN9qDdskDnj8tHsnZI51aN2GNWKKoyRoEzeepF61pHBq7XxG9FqDc0itnyLPwJH+ShyIDY7CqK16oZqLr+jVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=b9qC218K; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="b9qC218K"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751281866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9EItM8uCcromE1ZWJwY/z7qNiYk/S67kMwkBT3643Mk=;
	b=b9qC218KF98kBDicl8IHDU683wXWNKjWFj58XVVc9jbkA50VlT/DsR1zpYrc3G4D5CiHNo
	IQetG5xYbgBLAwVd27l6aRJ+Cst0xujyV+K1OqGo+/xNj7/88Mz7gx6wzZfti0fet8pGMh
	/GWB8YCPHOPkfO3G28DlpSINMMuTAeA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Nam Cao <namcao@linutronix.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: dummy: Replace deprecated strcpy() with strscpy()
Date: Mon, 30 Jun 2025 13:09:44 +0200
Message-ID: <20250630110945.2225-2-thorsten.blum@linux.dev>
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
 sound/drivers/dummy.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 1d923cbe8cd0..5b7db00f3672 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/jiffies.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/time.h>
 #include <linux/wait.h>
 #include <linux/hrtimer.h>
@@ -684,7 +685,7 @@ static int snd_card_dummy_pcm(struct snd_dummy *dummy, int device,
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, ops);
 	pcm->private_data = dummy;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, "Dummy PCM");
+	strscpy(pcm->name, "Dummy PCM");
 	if (!fake_buffer) {
 		snd_pcm_set_managed_buffer_all(pcm,
 			SNDRV_DMA_TYPE_CONTINUOUS,
@@ -875,7 +876,7 @@ static int snd_card_dummy_new_mixer(struct snd_dummy *dummy)
 	int err;
 
 	spin_lock_init(&dummy->mixer_lock);
-	strcpy(card->mixername, "Dummy Mixer");
+	strscpy(card->mixername, "Dummy Mixer");
 	dummy->iobox = 1;
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_dummy_controls); idx++) {
@@ -1083,8 +1084,8 @@ static int snd_dummy_probe(struct platform_device *devptr)
 	err = snd_card_dummy_new_mixer(dummy);
 	if (err < 0)
 		return err;
-	strcpy(card->driver, "Dummy");
-	strcpy(card->shortname, "Dummy");
+	strscpy(card->driver, "Dummy");
+	strscpy(card->shortname, "Dummy");
 	sprintf(card->longname, "Dummy %i", dev + 1);
 
 	dummy_proc_init(dummy);
-- 
2.49.0

