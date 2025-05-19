Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341222036FF
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652225; cv=none; b=PjRSEj321knOmS4rAN+a7OY5HTyJUeXaJq2QTfWUN8yVSPJ9d5wfsT0r94w6kQJ4bRSSYO/TmN747M4m2mWXRO0OyvGH/k9VlqKKMlT6WAN0cTtRg3rRWWU6O6tRnj/WodD5Dlg27YRMN2OXjicdzvtwgNgFBeeyXWXll1WMfSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652225; c=relaxed/simple;
	bh=pLbbXHsxCQKulVcxyJdYcSQPgL54r5yeJRnX/H9pEzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M0MW7VzhHcpNDdwuuvxOUwllZLP44nuZPoBpvBbFjHyKTDY0fHIGylZjVjG84eAsNAmHG6iAECdMbEziJEqyZPgHcDokhoetugTzrITU0DAwAVNngN8/4IZf6guH18YOhVvOuqpAyqoK3DshL9xEYPjgFwplWVSXGjsGNAPHsdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EWqcA/6Y; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EWqcA/6Y"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747652208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1Ri5khetRAp7XKEBwxtbGIwt1g/atUnCLsuPDPXBtD4=;
	b=EWqcA/6Y0dGVU0c2wnSXKbw3+3rSJYJZV23biDj+ZGYwv8uyxkww1n7vXUsd1+LS9TUNB3
	8/wZQvYnTQ0ISCf4o9pvsf0ZMq5kQvIWZLPps3Sw3Q/lZY7O+X3UHoeDwYPtb85SgmwC5T
	pCZubvY1Bbyje37Qi2SvNgCAnlmfVpE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: n64: Replace deprecated strcpy() with strscpy()
Date: Mon, 19 May 2025 12:56:25 +0200
Message-ID: <20250519105628.491675-1-thorsten.blum@linux.dev>
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
 sound/mips/snd-n64.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/mips/snd-n64.c b/sound/mips/snd-n64.c
index bff6d85b8fe2..e1b2ff65d850 100644
--- a/sound/mips/snd-n64.c
+++ b/sound/mips/snd-n64.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
+#include <linux/string.h>
 
 #include <sound/control.h>
 #include <sound/core.h>
@@ -327,14 +328,14 @@ static int __init n64audio_probe(struct platform_device *pdev)
 		goto fail_dma_alloc;
 
 	pcm->private_data = priv;
-	strcpy(pcm->name, "N64 Audio");
+	strscpy(pcm->name, "N64 Audio");
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &n64audio_pcm_ops);
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, card->dev, 0, 0);
 
-	strcpy(card->driver, "N64 Audio");
-	strcpy(card->shortname, "N64 Audio");
-	strcpy(card->longname, "N64 Audio");
+	strscpy(card->driver, "N64 Audio");
+	strscpy(card->shortname, "N64 Audio");
+	strscpy(card->longname, "N64 Audio");
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-- 
2.49.0

