Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6B52701CA;
	Fri,  2 May 2025 23:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746229948; cv=none; b=K1mr0r6Ps6NDosABBmLKs7iBMGGCZgjd2zR8pIhNJt4RQ50SCHbmJusLn4ldoSoQQQBdXIfIYzz8wX7D0dhWME4TyY+b2LisKJ95H2Jnn7ZVjbj3D01ZbX9Yoz/NTacEEvGZfMktJsvKYIZQf3QzNqTQSSIMfRMIGAUdnE317TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746229948; c=relaxed/simple;
	bh=r3SOx+4tIs5UVWHOWyBMj6xgY1H/nNSg6vJd+lwSRuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rq5tnMEffksEQRhBN4MWQMr821O0caEKzjFkNi0xhuuoVBo2XVm9Okqd7rHKU55xDs5tf87ajpPPBvgBfXyKW13+0ftiV8rXij3pQl4v4rRqov5VI9Izrt6AkKR+tCfI7PVAGqag9SeVEYqekGPGdYErnFJSicVcN6z2Mnh8nL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=sk7lKHbq; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="sk7lKHbq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=dE2TbXySXTyn4iP/oq6u//q/0QbdJINWiIw94sh6vOs=; b=sk7lKHbqW/hRWCmZ
	WUcx6VXicF1ojfirGnHwMAlpUIZinUOpcC6Xvvj/OmWcTIFCskMLvTyCP2gmP9Xkvb4U82dCyhHyn
	yXeQ2OIK9TQ9g8tfVcVbw6Favoq/qdBoBFSsMH3hGaT1q+9xM6G1iJuPQg7AyT83jU6yXcxVCpv/e
	a90+3wS5pD0xZFQ73AyAPCNb1IzNoYQSnlmIvMFJ4xGtK+2uZnAaqQl5fbnkjQ+Szremir2cHZWAO
	TXfbfOkIDG1QieJSMr9e7559R4ds1Q56dKh7/9nQAuTVXOBVIbtgCcheT99JEAOIq0FXiWBFQphpm
	YL8UpCy4MhfpJNh0ww==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uB0B4-001BML-1E;
	Fri, 02 May 2025 23:52:22 +0000
From: linux@treblig.org
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 4/5] ALSA: core: Remove unused snd_device_get_state
Date: Sat,  3 May 2025 00:52:18 +0100
Message-ID: <20250502235219.1000429-5-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502235219.1000429-1-linux@treblig.org>
References: <20250502235219.1000429-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

snd_device_get_state() last use was removed in 2022 by
commit 7e1afce5866e ("ALSA: usb-audio: Inform the delayed registration more
properly")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/sound/core.h |  1 -
 sound/core/device.c  | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 1f3f5dccd736..64327e971122 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -326,7 +326,6 @@ void snd_device_disconnect(struct snd_card *card, void *device_data);
 void snd_device_disconnect_all(struct snd_card *card);
 void snd_device_free(struct snd_card *card, void *device_data);
 void snd_device_free_all(struct snd_card *card);
-int snd_device_get_state(struct snd_card *card, void *device_data);
 
 /* isadma.c */
 
diff --git a/sound/core/device.c b/sound/core/device.c
index b57d80a17052..cdc5af526739 100644
--- a/sound/core/device.c
+++ b/sound/core/device.c
@@ -237,26 +237,3 @@ void snd_device_free_all(struct snd_card *card)
 	list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
 		__snd_device_free(dev);
 }
-
-/**
- * snd_device_get_state - Get the current state of the given device
- * @card: the card instance
- * @device_data: the data pointer to release
- *
- * Returns the current state of the given device object.  For the valid
- * device, either @SNDRV_DEV_BUILD, @SNDRV_DEV_REGISTERED or
- * @SNDRV_DEV_DISCONNECTED is returned.
- * Or for a non-existing device, -1 is returned as an error.
- *
- * Return: the current state, or -1 if not found
- */
-int snd_device_get_state(struct snd_card *card, void *device_data)
-{
-	struct snd_device *dev;
-
-	dev = look_for_dev(card, device_data);
-	if (dev)
-		return dev->state;
-	return -1;
-}
-EXPORT_SYMBOL_GPL(snd_device_get_state);
-- 
2.49.0

