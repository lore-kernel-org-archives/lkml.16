Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CF61EDA09;
	Mon, 19 May 2025 19:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747684171; cv=none; b=EPMVkELSXrzEbVNDsCnIoT/v7A4nLKbkMxWhxg4+7SyBYvBTnvDB2tVeQUfxOfWiXxM51/M0bvUVP2lGwHvTTNnqoXIZ4gvQXvkv6qHMpABtdMXWhUShqQVrl/JlSr1VE1h22TInrrs4JGIFc6hBR3ZBwT+iyRDf7k/d5xG9wZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747684171; c=relaxed/simple;
	bh=JAHTKn8lVgXuUVHRTPHzx458VYN8Zmh2D4bwM7zCltE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pr96Yq/Q6xWoAcmT2TX1co2hry85PbCKCzcjQt84W7V2OXxn4EDsP1JKEZ0/SQTe6RjK4wYArBQgv7Qx/crc3og9cmIe+uiS9GKZalTkfk/tokOZkkoEiZOnqS4rwHGgFrq3Wyb0+RCDrUPzaI1DowYkxLBORjK1WB9Efo5aW00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZcnNGys; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZcnNGys"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-30e57a373c9so4751379a91.2;
        Mon, 19 May 2025 12:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747684169; x=1748288969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hw19EiGToKy2THNoRev7BZGz3jBlbmgZK3UBr01gL+I=;
        b=OZcnNGysIDwTU1QvqrrUb5cPZfDQgsIBhqFLdZJDWaSjcLeEs+2soIWMGJGIyorZon
         I+BfaKuAsLxzpU1obEwracNsmgQEJRlfi32l+HL/PrjehZ8i3MWdp3wbS7DiDAB49P/n
         SIiEO52vGGUDXlJH0mtXRGzYiwQEy5Rv9aak0GuPepkD0xndqPnZ+YI1GV3XR9xgneNL
         KqV9q4mG0BZhB3NtRXJny0FO3EVP3Lj4sP1Npnrk808S1GCWuMXkjZXib+/Tz5apesIz
         hWYIO5qrjz4yZ7d9vt9BRvTnvDZR9pjATFGw6dGXXfMsqpwKbk7S225GcFV4Y97Rl0zP
         Ah3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747684169; x=1748288969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hw19EiGToKy2THNoRev7BZGz3jBlbmgZK3UBr01gL+I=;
        b=lM9lgT817TLVKUX38JWF1UE/++qTVSnSnjEDMQazOpwT3u4rMaFjnK17Gd7ovkD1cT
         +BLxVhH0C1I5fbT+FxpBGV874xLyjF/MyTW1moltbPVUrdBH7JZXGo4dvcCkkYmAtqZL
         k5GW4rYI9KFZol2EEY9WNPgOqJzXmkG4nLVM4j5S2tB2Iee32ZmV0cnCcfAo1BvqHYFu
         zbwNLeeOLLtnY4ZxJxhW+03ZXonl0wZPYwmszctuJC20ZQcBPQHB6ZH2WmFcxWbI/HrO
         NDVOcvzdbzGT63503DKoJafNBUGue/lDjbSO9+p7Jnor4DNM03er3FQzqHmzbuiMjwG4
         8Ozw==
X-Forwarded-Encrypted: i=1; AJvYcCUItI3w6WNPCYcKGixib3KZa7sexzFFc5SkyYVukFd7F7spCh5c0nE6pgCmXH8AogiAHVzZtGBUp0kh6Wc=@vger.kernel.org, AJvYcCWKy3Ky14/K9+/BL88v84Z80T1ZJZYfAkVnmw2CmSlW6ufFKtkUXEeVyZKUyv9waILXxzNMtL3CL60/OI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx14BcQBID89ZwPaRa9UO8jFeAj6nzFbq7u9zoNOFtE+iWNsi8h
	C+HYSuuoEYjq6yAkpRDZIjTylJK2Xnlhha1hiGVwwOd1ewJCLtWEFZ6v
X-Gm-Gg: ASbGncteDcMjVjPiUdonhN26Gc/iQozQxWv7Bxhdod3a6KTFAPVF6lTRJQHhq58Ymja
	7F0ja4o0BLjEEPCfKNwqd8gXznycaP1jRr61ZpuP6cdz3ExJk74mefETbG1FmjQkbLsHKH/Dak5
	NqvFCJKzBnZ8o3nc8AwwFpSN+Jn1Vs7Nqslx6ZEkK84blqoCNSm8gOcYD1w+JuH3yhkIs4V4wDv
	PNKbncmszLcR1CH+0fvFLw86NmQDSMlCpFaD4/PkspbIvZ+33fqkGgp1PwJjHwlGEOCtSAutKy0
	QLyuCEe9Nr8G3j/anjduBderHJ1j02uNhQj3+wxbOWWsGfK5K/xpFgMS16ghJ9vtlRjY1Q==
X-Google-Smtp-Source: AGHT+IHnVKVbYxmr+S8L6MVseig+zzby2xRqN+CEjlLhV5A3fcWvh+4ML4zRmQfCRfQVUbsS/9KOXQ==
X-Received: by 2002:a17:90b:1648:b0:30a:3dde:6af4 with SMTP id 98e67ed59e1d1-30e7d5be456mr19786507a91.31.1747684168635;
        Mon, 19 May 2025 12:49:28 -0700 (PDT)
Received: from sid-Inspiron-15-3525.. ([106.222.234.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb08450csm6705252a12.55.2025.05.19.12.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 12:49:28 -0700 (PDT)
From: Siddarth Gundu <siddarthsgml@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: u.kleine-koenig@baylibre.com,
	zhujun2@cmss.chinamobile.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddarth Gundu <siddarthsgml@gmail.com>
Subject: [PATCH] ALSA: dbri: replace strcpy() with strscpy()
Date: Tue, 20 May 2025 01:18:33 +0530
Message-ID: <20250519194833.106463-1-siddarthsgml@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() is deprecated; use strscpy() instead.

Both the destination and source buffer are of fixed length
so strscpy with 2-arguments is used.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>
---
- test-compiled and no functional changes intended

 sound/sparc/dbri.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index 69f1c9e37f4b..93cbe158009f 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -60,6 +60,7 @@
 #include <linux/io.h>
 #include <linux/dma-mapping.h>
 #include <linux/gfp.h>
+#include <linux/string.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -2239,7 +2240,7 @@ static int snd_dbri_pcm(struct snd_card *card)
 
 	pcm->private_data = card->private_data;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, card->shortname);
+	strscpy(pcm->name, card->shortname);
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
 				       NULL, 64 * 1024, 64 * 1024);
@@ -2446,7 +2447,7 @@ static int snd_dbri_mixer(struct snd_card *card)
 		return -EINVAL;
 	dbri = card->private_data;
 
-	strcpy(card->mixername, card->shortname);
+	strscpy(card->mixername, card->shortname);
 
 	for (idx = 0; idx < ARRAY_SIZE(dbri_controls); idx++) {
 		err = snd_ctl_add(card,
@@ -2613,8 +2614,8 @@ static int dbri_probe(struct platform_device *op)
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "DBRI");
-	strcpy(card->shortname, "Sun DBRI");
+	strscpy(card->driver, "DBRI");
+	strscpy(card->shortname, "Sun DBRI");
 	rp = &op->resource[0];
 	sprintf(card->longname, "%s at 0x%02lx:0x%016llx, irq %d",
 		card->shortname,
-- 
2.48.1

