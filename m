Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C4321D581;
	Tue, 20 May 2025 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747740623; cv=none; b=AJjWLYrDvEcOCAHQMQzqcImq/YaRKSik1fHrZZblsaCp8m/MdFISJqGRhd/sInWbI9aU4JAmnVhVLMx6SwiFDTOsP2oQqeWuOrqRj9QAB1eAlEYVTtKmXtFtytJeADnWn4SA0RKA6ehFZ8stuwqeieYdIsyWlsf5lWSXQPZBR/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747740623; c=relaxed/simple;
	bh=O1AJ7JmMxdWQV2IgVukQ24F0/JQ7Cyra/8jwvRKG64o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WUrf0YJsdnedPAXBFE44xzZTZliXl++gLjAQEha+D4eL/UOmDZKlQqTlic3WAMI+uAJ9s6WBmI1ujNZF3F3ut9yrzDRO3UTIqJ0jlXlvfzDDJ/MamLp+GXkrg/tYvAa5sCHhSvazZTyrh0b0igVZqRKyHho41KnIjZWTEJSZaqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=An8FXgtL; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="An8FXgtL"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-30ed99132abso2135371a91.3;
        Tue, 20 May 2025 04:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747740621; x=1748345421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVmGprzIT1qas59bg3drprextcCuuSplhZMAI1pdd7U=;
        b=An8FXgtLTFoySwZvHFBJDN9wYKHejL5n1R/9iZKKdq89s+J7zV0zaCaCQLeOVVUUL2
         wjr5XR2fnBosXTlQf0RyzvPFyXlH6Rm/hc1ZVw2oFeVgh6QGUECZAxNkgCplbq9lFSO7
         vN0u7Sp34octAaMv5tcRr9gsGx7VhuiJBc0hW51bqXIQ+88yOgA9wP/d+rb3Q2yGEzec
         1RIxswf9emP20C3daV1NLWV77JuDKl6AZTfNz5AkibnY+pb+rVe4erYk5trUE9OpCn5h
         vZ0KBMD6DQsDR5nv7T9Q4LroDIKeI0eAu8c0oMFsYgs5PzdjB3vZMm2EwQHrKf8USaUs
         O2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747740621; x=1748345421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVmGprzIT1qas59bg3drprextcCuuSplhZMAI1pdd7U=;
        b=nBLcJx3gh6TN5z1Sa02jlAZh5kjdssHti133Ck+u+MO30T6BUnheLsVoLqP8xk5B9T
         Ogt7vU/Z8nB16T4TT1K5NuKcFTOfKzuLoGjrdDQKGkvRL5uRZfYcRuNnXbvhgo/Qm5uv
         YZXCmTMsjv8F9WMX7Hrnr4BuQm364ZGympn42qTkGwsuzn7gN0I8dAK2vxvl+wgYE/vn
         jbc0Y3s5AaabF/m8l2G2BtPdjFcV7MeiuxVCq3h76yLRZxfkw61GEjba1j7c7FrG6CEb
         MWjxFycr1KAvLVYmfIO4aiULEcw5ZyyrUrUYzhrHIudpJHBZ6ra3sxRz68jFGpzyHEZC
         syWg==
X-Forwarded-Encrypted: i=1; AJvYcCVC5+xpoD7CosNrLwuY5TrIVFI5gCW+FCC7ZGq+LqThNLngKR9Z40yeOMrTMH+BzWxcMHvuOE3TC5VYpvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+P8B2wu9bGUEJOJzALcit7YMzXyiLds43aJcrL/HsuFwWwEX
	ebA+TNi5WayNLRYk+CbBenkSbs3fWm95eX1/L1cgEk53m5/He1WlsuMg
X-Gm-Gg: ASbGncuomfkLSIOoRBIweQZWd0eaqpVDdOOKRgh2otsY4x9sDjgsPCAzItUBVV3KIt3
	RJ+l5F+sswgmjickRcJA1REeujaUgGvtXEOciCR+uV9N7hJk5ctkWNhGY6bG5QQsOJ/SOrn99Qb
	TfEV3OeaRqUw3bcvMg02OB+e9/kfrkVoHUNYVRglmZ4Zt31mQVKV9fMg5ghUFP68i8/nnWQGbeK
	vmkTaAinOgNYlZBWi980ulHMlka7xfkaiELFvmAziFL6zVizMuPTNkUR4MkTjkEOaRHmGbR76YP
	wgdl+bdKmg3Gfg0ikYzLkVhy4KrqJzf7yH1GP4S0AfceiHReZY1dE5Sw6r2qyTmcRlSur4oKoo7
	dObBC6lRp+qzkBcVn
X-Google-Smtp-Source: AGHT+IGTMqeXJhFDTiiG1VwY9JcXuorjPRKgbVm4nDjUtWCqjClpfsMQGvEpxxzOIvO/vdgEVEL82Q==
X-Received: by 2002:a17:90b:4c0a:b0:305:5f25:59a5 with SMTP id 98e67ed59e1d1-30e7d5bb748mr25665289a91.35.1747740620939;
        Tue, 20 May 2025 04:30:20 -0700 (PDT)
Received: from sid-Inspiron-15-3525.. ([106.222.235.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36368e44sm1481296a91.1.2025.05.20.04.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 04:30:20 -0700 (PDT)
From: Siddarth Gundu <siddarthsgml@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddarth Gundu <siddarthsgml@gmail.com>
Subject: [PATCH] ALSA: amd7930: replace strcpy() with strscpy()
Date: Tue, 20 May 2025 17:00:12 +0530
Message-ID: <20250520113012.70270-1-siddarthsgml@gmail.com>
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

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>
---
 sound/sparc/amd7930.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/sparc/amd7930.c b/sound/sparc/amd7930.c
index 9bdf3db51d62..e73d3b262f57 100644
--- a/sound/sparc/amd7930.c
+++ b/sound/sparc/amd7930.c
@@ -39,6 +39,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/string.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -754,7 +755,7 @@ static int snd_amd7930_pcm(struct snd_amd7930 *amd)
 
 	pcm->private_data = amd;
 	pcm->info_flags = 0;
-	strcpy(pcm->name, amd->card->shortname);
+	strscpy(pcm->name, amd->card->shortname);
 	amd->pcm = pcm;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
@@ -874,7 +875,7 @@ static int snd_amd7930_mixer(struct snd_amd7930 *amd)
 		return -EINVAL;
 
 	card = amd->card;
-	strcpy(card->mixername, card->shortname);
+	strscpy(card->mixername, card->shortname);
 
 	for (idx = 0; idx < ARRAY_SIZE(amd7930_controls); idx++) {
 		if ((err = snd_ctl_add(card,
@@ -1007,8 +1008,8 @@ static int amd7930_sbus_probe(struct platform_device *op)
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "AMD7930");
-	strcpy(card->shortname, "Sun AMD7930");
+	strscpy(card->driver, "AMD7930");
+	strscpy(card->shortname, "Sun AMD7930");
 	sprintf(card->longname, "%s at 0x%02lx:0x%08Lx, irq %d",
 		card->shortname,
 		rp->flags & 0xffL,
-- 
2.48.1

