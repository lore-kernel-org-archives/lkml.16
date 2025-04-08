Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F67C2185B8;
	Tue,  8 Apr 2025 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101056; cv=none; b=Iex+0vc5hyZAAkBA1GNh1DqXHW+8Z4tuO2Y8AAeAQqymx1jP5F8ROP7nTYZH06ozjsh4UnmcbOkjnTvMbDix5dCvo2YkxEgsXMO/zbSYXD7fMRo9AnBuy+TKy1ythc+pSeXrhycx04lHCsBzMf2rR8+B+f7XJhE1M/MqAbjfc7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101056; c=relaxed/simple;
	bh=lLmyixWXAbXg0lni7YXARd4/32mTDXbWO3DIdMLH52Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IFiHKLPG0qh1R3/VfIakSnc+wY2IqLH3LLsC+nhXNunf8HcyZK8sWfnZtPeJ8xDorCRx2Z3q9axKlOVHCenPV3i8Zq/owrwujgFmVGL2aQyINgV8SSkM1mshqPdcZcN7xFrB2Iy7fqe7nWTeT6aJZYBgPeJ2MAI+4cyOK/srQmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RW21bC4r; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RW21bC4r"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744101053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FWMs3klgdUMUUkP/EPWbPqpleRG22QBfuc8WaQGwHc8=;
	b=RW21bC4rHw74KpRNsn2V4yil/rI19bvggTjEpqBlGGZLEEXrayzX7dG8xeKTnneXs+PeaI
	0ez78D27oelXuT8/PSdPNdDg+17GlBhXc6g8ldJXJ4r5vbu3lMBzoeuPCKwmZIFOgCazdR
	lcB9RIGOk7sArt1uKTmYCm3B5cJ1ofM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: cs46xx: Remove commented out code
Date: Tue,  8 Apr 2025 10:30:12 +0200
Message-ID: <20250408083015.796638-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The code has been commented out ever since commit 1da177e4c3f4
("Linux-2.6.12-rc2"), remove it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/pci/cs46xx/dsp_spos_scb_lib.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/pci/cs46xx/dsp_spos_scb_lib.c b/sound/pci/cs46xx/dsp_spos_scb_lib.c
index 1f90ca723f4d..28faca268196 100644
--- a/sound/pci/cs46xx/dsp_spos_scb_lib.c
+++ b/sound/pci/cs46xx/dsp_spos_scb_lib.c
@@ -201,13 +201,6 @@ void cs46xx_dsp_remove_scb (struct snd_cs46xx *chip, struct dsp_scb_descriptor *
 	if (ins->scb_highest_frag_index > ins->nscb) {
 		ins->scb_highest_frag_index = ins->nscb;
 	}
-
-#if 0
-	/* !!!! THIS IS A PIECE OF SHIT MADE BY ME !!! */
-	for(i = scb->index + 1;i < ins->nscb; ++i) {
-		ins->scbs[i - 1].index = i - 1;
-	}
-#endif
 }
 
 
-- 
2.49.0

