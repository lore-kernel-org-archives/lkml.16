Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225C735897
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281078; cv=none; b=gyf6Z9rKcjUghPZicnU2QeVZcgz82zpWq5I+nY6rsMJnf+nTJuwp6tQEPOQMYIZoez+bE06xEjF9jj+0kF5SOg4GpPUxmsBrKP4g8P0ErkzB7Ywd5RYzphgPvtWHvfiDg1VuxEpPk/mODV5coJRs09dQcIYpQyw6pI6nuaR4oEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281078; c=relaxed/simple;
	bh=MobM1ZbX6aRV9UmkAFxVoFzxstIlyJGielzDULNf7wE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QWL6VbOkSr2KJqVeRgcTRARg7644L8OVMDUHr3v6qHMqH/KEqbKaF+H/rvgNDSY5DR+9TZJbsmi1gax0B+s7P1pvL6jOr3luAWxKebSOQhqpGhE3EtsTiuqDTnswW2zfHTsj2KbJoBfS+HpNzQ5j/Gorsbqjg5/rCivo3blfsu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OVvi0MSz; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OVvi0MSz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751281074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9l9T37/bFIK8I1hFZmW5GbvmNO4fMy5s189v6q0GSH8=;
	b=OVvi0MSztZ4K549FddRFLbfJvIvEwlr+o7uTV7EBfQNt73dow7mGsFiiSNwZGSvNgbwD5i
	8gnycO7l2rdQ1lrBlZnLulUmuuun/p9LMdQTaMyR2XqGKNZPL4Gbd2qk5P1yjO+GZBIr3x
	Ts1CtvkKmQVVjD6cn7cHo19obHF8TTU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hrtimer: Replace deprecated strcpy() with strscpy()
Date: Mon, 30 Jun 2025 12:57:22 +0200
Message-ID: <20250630105723.1703-2-thorsten.blum@linux.dev>
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
 sound/core/hrtimer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/hrtimer.c b/sound/core/hrtimer.c
index e9c60dce59fb..c364bd126ac8 100644
--- a/sound/core/hrtimer.c
+++ b/sound/core/hrtimer.c
@@ -6,6 +6,7 @@
 
 #include <linux/init.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/hrtimer.h>
@@ -138,7 +139,7 @@ static int __init snd_hrtimer_init(void)
 		return err;
 
 	timer->module = THIS_MODULE;
-	strcpy(timer->name, "HR timer");
+	strscpy(timer->name, "HR timer");
 	timer->hw = hrtimer_hw;
 	timer->hw.resolution = resolution;
 	timer->hw.ticks = NANO_SEC / resolution;
-- 
2.49.0

