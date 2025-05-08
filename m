Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35DD3C26;
	Thu,  8 May 2025 00:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746662558; cv=none; b=Z91NgoCMcAw1mi1f++Id6jf3U5SUJ0+Cf+Dboizs9gt8S6J5tWhCkEfuzLfrli1t3c7TP++4uZOCHJFkY+snwXbu8k4qpteD34lcoo3bCG8rOOqDicJOs+IPMTfMJ5iUV7/Rq8Webn642uOFw4C0POKxLo1UN61Bseq6hfCPmAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746662558; c=relaxed/simple;
	bh=RZ0y1uP90GEq56+q5V/PzS94n5kB+a9HMKSKJaxmvwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z7NmCdWwNpCBLdF/SYpG97dmwjPdcmedOBqv2T8cbAAoN981KTfhqyBNVxBAqYkeqpX0CECW+7Kqfdi1DWW04E9UP14FbTeHe0sgqNyLYUNQRgUIeBiAYtiO6R/wZGpfkT0tLqDEUf014/sLuQK67gCykgnLr5/hwTCdnNMsVW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=iIY6Tw3J; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="iIY6Tw3J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=ObupoRU6pNcQZTctX7AV4gtV8m7zTfozBBogOQijUF0=; b=iIY6Tw3JAh4eZU8z
	krti7VNS3xKLd2kkODU5/qV4mCYSRSrqEAeTBO0OCkalVwyIKMwso8hNcrx4WNgCNnFeLXcF5Uw74
	/qlpLGuUwuYYJ39s785i0loB/8t617qnt//NKjZw8YGhvlytkWEqoWqpAAcdU9KXQCPlhIH6g4wVG
	Vi/CgmeApU/mtE54CDyvKo3NoNWKDZK4fV1xBnh5QVQMPvjUEn0+l8YmL6rrSijKVTHDO+I+8o68e
	7nOIUa9I9YE+d69OndLOzJSYV8HUe6pDxzwlU5H5RlmrPMTuoDGFMAdK4KCLPuwY9r0NWAsBn6/cb
	KnIkRhadCLRgGk6wMQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uCoiY-002HSB-1K;
	Thu, 08 May 2025 00:02:26 +0000
From: linux@treblig.org
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ALSA: gus: Remove deadcode
Date: Thu,  8 May 2025 01:02:25 +0100
Message-ID: <20250508000225.195766-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

snd_gus_use_dec(), snd_gus_use_inc() and snd_gf1_print_voice_registers()
last uses were removed in 2007 by
commit e5723b41abe5 ("[ALSA] Remove sequencer instrument layer")

Remove them.

While there, remove big #if 0 blocks next to the code being deleted.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/sound/gus.h      |   6 -
 sound/isa/gus/gus_io.c   | 229 ---------------------------------------
 sound/isa/gus/gus_main.c |  14 ---
 3 files changed, 249 deletions(-)

diff --git a/include/sound/gus.h b/include/sound/gus.h
index cd8da68cab92..bdd60ffe15c2 100644
--- a/include/sound/gus.h
+++ b/include/sound/gus.h
@@ -578,14 +578,8 @@ int snd_gf1_new_mixer(struct snd_gus_card * gus);
 
 int snd_gf1_pcm_new(struct snd_gus_card *gus, int pcm_dev, int control_index);
 
-#ifdef CONFIG_SND_DEBUG
-extern void snd_gf1_print_voice_registers(struct snd_gus_card * gus);
-#endif
-
 /* gus.c */
 
-int snd_gus_use_inc(struct snd_gus_card * gus);
-void snd_gus_use_dec(struct snd_gus_card * gus);
 int snd_gus_create(struct snd_card *card,
 		   unsigned long port,
 		   int irq, int dma1, int dma2,
diff --git a/sound/isa/gus/gus_io.c b/sound/isa/gus/gus_io.c
index 1dc9e0edb3d9..f167eb8d516b 100644
--- a/sound/isa/gus/gus_io.c
+++ b/sound/isa/gus/gus_io.c
@@ -228,49 +228,6 @@ unsigned short snd_gf1_i_look16(struct snd_gus_card * gus, unsigned char reg)
 	return res;
 }
 
-#if 0
-
-void snd_gf1_i_adlib_write(struct snd_gus_card * gus,
-		           unsigned char reg,
-		           unsigned char data)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&gus->reg_lock, flags);
-	__snd_gf1_adlib_write(gus, reg, data);
-	spin_unlock_irqrestore(&gus->reg_lock, flags);
-}
-
-void snd_gf1_i_write_addr(struct snd_gus_card * gus, unsigned char reg,
-			  unsigned int addr, short w_16bit)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&gus->reg_lock, flags);
-	__snd_gf1_write_addr(gus, reg, addr, w_16bit);
-	spin_unlock_irqrestore(&gus->reg_lock, flags);
-}
-
-#endif  /*  0  */
-
-#ifdef CONFIG_SND_DEBUG
-static unsigned int snd_gf1_i_read_addr(struct snd_gus_card * gus,
-					unsigned char reg, short w_16bit)
-{
-	unsigned int res;
-	unsigned long flags;
-
-	spin_lock_irqsave(&gus->reg_lock, flags);
-	res = __snd_gf1_read_addr(gus, reg, w_16bit);
-	spin_unlock_irqrestore(&gus->reg_lock, flags);
-	return res;
-}
-#endif
-
-/*
-
- */
-
 void snd_gf1_dram_addr(struct snd_gus_card * gus, unsigned int addr)
 {
 	outb(0x43, gus->gf1.reg_regsel);
@@ -418,189 +375,3 @@ void snd_gf1_select_active_voices(struct snd_gus_card * gus)
 		udelay(100);
 	}
 }
-
-#ifdef CONFIG_SND_DEBUG
-
-void snd_gf1_print_voice_registers(struct snd_gus_card * gus)
-{
-	unsigned char mode;
-	int voice, ctrl;
-
-	voice = gus->gf1.active_voice;
-	dev_info(gus->card->dev,
-		 " -%i- GF1  voice ctrl, ramp ctrl  = 0x%x, 0x%x\n",
-		 voice, ctrl = snd_gf1_i_read8(gus, 0), snd_gf1_i_read8(gus, 0x0d));
-	dev_info(gus->card->dev,
-		 " -%i- GF1  frequency              = 0x%x\n",
-		 voice, snd_gf1_i_read16(gus, 1));
-	dev_info(gus->card->dev,
-		 " -%i- GF1  loop start, end        = 0x%x (0x%x), 0x%x (0x%x)\n",
-		 voice, snd_gf1_i_read_addr(gus, 2, ctrl & 4),
-		 snd_gf1_i_read_addr(gus, 2, (ctrl & 4) ^ 4),
-		 snd_gf1_i_read_addr(gus, 4, ctrl & 4),
-		 snd_gf1_i_read_addr(gus, 4, (ctrl & 4) ^ 4));
-	dev_info(gus->card->dev,
-		 " -%i- GF1  ramp start, end, rate  = 0x%x, 0x%x, 0x%x\n",
-		 voice, snd_gf1_i_read8(gus, 7), snd_gf1_i_read8(gus, 8),
-		 snd_gf1_i_read8(gus, 6));
-	dev_info(gus->card->dev,
-		 " -%i- GF1  volume                 = 0x%x\n",
-		 voice, snd_gf1_i_read16(gus, 9));
-	dev_info(gus->card->dev,
-		 " -%i- GF1  position               = 0x%x (0x%x)\n",
-		 voice, snd_gf1_i_read_addr(gus, 0x0a, ctrl & 4),
-		 snd_gf1_i_read_addr(gus, 0x0a, (ctrl & 4) ^ 4));
-	if (gus->interwave && snd_gf1_i_read8(gus, 0x19) & 0x01) {	/* enhanced mode */
-		mode = snd_gf1_i_read8(gus, 0x15);
-		dev_info(gus->card->dev,
-			 " -%i- GFA1 mode                   = 0x%x\n",
-			 voice, mode);
-		if (mode & 0x01) {	/* Effect processor */
-			dev_info(gus->card->dev,
-				 " -%i- GFA1 effect address         = 0x%x\n",
-				 voice, snd_gf1_i_read_addr(gus, 0x11, ctrl & 4));
-			dev_info(gus->card->dev,
-				 " -%i- GFA1 effect volume          = 0x%x\n",
-				 voice, snd_gf1_i_read16(gus, 0x16));
-			dev_info(gus->card->dev,
-				 " -%i- GFA1 effect volume final    = 0x%x\n",
-				 voice, snd_gf1_i_read16(gus, 0x1d));
-			dev_info(gus->card->dev,
-				 " -%i- GFA1 effect accumulator     = 0x%x\n",
-				 voice, snd_gf1_i_read8(gus, 0x14));
-		}
-		if (mode & 0x20) {
-			dev_info(gus->card->dev,
-				 " -%i- GFA1 left offset            = 0x%x (%i)\n",
-				 voice, snd_gf1_i_read16(gus, 0x13),
-				 snd_gf1_i_read16(gus, 0x13) >> 4);
-			dev_info(gus->card->dev,
-				 " -%i- GFA1 left offset final      = 0x%x (%i)\n",
-				 voice, snd_gf1_i_read16(gus, 0x1c),
-				 snd_gf1_i_read16(gus, 0x1c) >> 4);
-			dev_info(gus->card->dev,
-				 " -%i- GFA1 right offset           = 0x%x (%i)\n",
-				 voice, snd_gf1_i_read16(gus, 0x0c),
-				 snd_gf1_i_read16(gus, 0x0c) >> 4);
-			dev_info(gus->card->dev,
-				 " -%i- GFA1 right offset final     = 0x%x (%i)\n",
-				 voice, snd_gf1_i_read16(gus, 0x1b),
-				 snd_gf1_i_read16(gus, 0x1b) >> 4);
-		} else
-			dev_info(gus->card->dev,
-				 " -%i- GF1  pan                    = 0x%x\n",
-				 voice, snd_gf1_i_read8(gus, 0x0c));
-	} else
-		dev_info(gus->card->dev,
-			 " -%i- GF1  pan                    = 0x%x\n",
-			 voice, snd_gf1_i_read8(gus, 0x0c));
-}
-
-#if 0
-
-void snd_gf1_print_global_registers(struct snd_gus_card * gus)
-{
-	unsigned char global_mode = 0x00;
-
-	dev_info(gus->card->dev,
-		 " -G- GF1 active voices            = 0x%x\n",
-		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_ACTIVE_VOICES));
-	if (gus->interwave) {
-		global_mode = snd_gf1_i_read8(gus, SNDRV_GF1_GB_GLOBAL_MODE);
-		dev_info(gus->card->dev,
-			 " -G- GF1 global mode              = 0x%x\n",
-			 global_mode);
-	}
-	if (global_mode & 0x02)	/* LFO enabled? */
-		dev_info(gus->card->dev,
-			 " -G- GF1 LFO base                 = 0x%x\n",
-			 snd_gf1_i_look16(gus, SNDRV_GF1_GW_LFO_BASE));
-	dev_info(gus->card->dev,
-		 " -G- GF1 voices IRQ read          = 0x%x\n",
-		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_VOICES_IRQ_READ));
-	dev_info(gus->card->dev,
-		 " -G- GF1 DRAM DMA control         = 0x%x\n",
-		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_DRAM_DMA_CONTROL));
-	dev_info(gus->card->dev,
-		 " -G- GF1 DRAM DMA high/low        = 0x%x/0x%x\n",
-		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_DRAM_DMA_HIGH),
-		 snd_gf1_i_read16(gus, SNDRV_GF1_GW_DRAM_DMA_LOW));
-	dev_info(gus->card->dev,
-		 " -G- GF1 DRAM IO high/low         = 0x%x/0x%x\n",
-		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_DRAM_IO_HIGH),
-		 snd_gf1_i_read16(gus, SNDRV_GF1_GW_DRAM_IO_LOW));
-	if (!gus->interwave)
-		dev_info(gus->card->dev,
-			 " -G- GF1 record DMA control       = 0x%x\n",
-			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_REC_DMA_CONTROL));
-	dev_info(gus->card->dev,
-		 " -G- GF1 DRAM IO 16               = 0x%x\n",
-		 snd_gf1_i_look16(gus, SNDRV_GF1_GW_DRAM_IO16));
-	if (gus->gf1.enh_mode) {
-		dev_info(gus->card->dev,
-			 " -G- GFA1 memory config           = 0x%x\n",
-			 snd_gf1_i_look16(gus, SNDRV_GF1_GW_MEMORY_CONFIG));
-		dev_info(gus->card->dev,
-			 " -G- GFA1 memory control          = 0x%x\n",
-			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_MEMORY_CONTROL));
-		dev_info(gus->card->dev,
-			 " -G- GFA1 FIFO record base        = 0x%x\n",
-			 snd_gf1_i_look16(gus, SNDRV_GF1_GW_FIFO_RECORD_BASE_ADDR));
-		dev_info(gus->card->dev,
-			 " -G- GFA1 FIFO playback base      = 0x%x\n",
-			 snd_gf1_i_look16(gus, SNDRV_GF1_GW_FIFO_PLAY_BASE_ADDR));
-		dev_info(gus->card->dev,
-			 " -G- GFA1 interleave control      = 0x%x\n",
-			 snd_gf1_i_look16(gus, SNDRV_GF1_GW_INTERLEAVE));
-	}
-}
-
-void snd_gf1_print_setup_registers(struct snd_gus_card * gus)
-{
-	dev_info(gus->card->dev,
-		 " -S- mix control                  = 0x%x\n",
-		 inb(GUSP(gus, MIXCNTRLREG)));
-	dev_info(gus->card->dev,
-		 " -S- IRQ status                   = 0x%x\n",
-		 inb(GUSP(gus, IRQSTAT)));
-	dev_info(gus->card->dev,
-		 " -S- timer control                = 0x%x\n",
-		 inb(GUSP(gus, TIMERCNTRL)));
-	dev_info(gus->card->dev,
-		 " -S- timer data                   = 0x%x\n",
-		 inb(GUSP(gus, TIMERDATA)));
-	dev_info(gus->card->dev,
-		 " -S- status read                  = 0x%x\n",
-		 inb(GUSP(gus, REGCNTRLS)));
-	dev_info(gus->card->dev,
-		 " -S- Sound Blaster control        = 0x%x\n",
-		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_SOUND_BLASTER_CONTROL));
-	dev_info(gus->card->dev,
-		 " -S- AdLib timer 1/2              = 0x%x/0x%x\n",
-		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_ADLIB_TIMER_1),
-		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_ADLIB_TIMER_2));
-	dev_info(gus->card->dev,
-		 " -S- reset                        = 0x%x\n",
-		 snd_gf1_i_look8(gus, SNDRV_GF1_GB_RESET));
-	if (gus->interwave) {
-		dev_info(gus->card->dev,
-			 " -S- compatibility                = 0x%x\n",
-			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_COMPATIBILITY));
-		dev_info(gus->card->dev,
-			 " -S- decode control               = 0x%x\n",
-			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_DECODE_CONTROL));
-		dev_info(gus->card->dev,
-			 " -S- version number               = 0x%x\n",
-			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_VERSION_NUMBER));
-		dev_info(gus->card->dev,
-			 " -S- MPU-401 emul. control A/B    = 0x%x/0x%x\n",
-			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_MPU401_CONTROL_A),
-			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_MPU401_CONTROL_B));
-		dev_info(gus->card->dev,
-			 " -S- emulation IRQ                = 0x%x\n",
-			 snd_gf1_i_look8(gus, SNDRV_GF1_GB_EMULATION_IRQ));
-	}
-}
-#endif  /*  0  */
-
-#endif
diff --git a/sound/isa/gus/gus_main.c b/sound/isa/gus/gus_main.c
index 51ce405eba7a..7166869e423d 100644
--- a/sound/isa/gus/gus_main.c
+++ b/sound/isa/gus/gus_main.c
@@ -22,18 +22,6 @@ MODULE_LICENSE("GPL");
 
 static int snd_gus_init_dma_irq(struct snd_gus_card * gus, int latches);
 
-int snd_gus_use_inc(struct snd_gus_card * gus)
-{
-	if (!try_module_get(gus->card->module))
-		return 0;
-	return 1;
-}
-
-void snd_gus_use_dec(struct snd_gus_card * gus)
-{
-	module_put(gus->card->module);
-}
-
 static int snd_gus_joystick_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
 {
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
@@ -443,8 +431,6 @@ EXPORT_SYMBOL(snd_gf1_new_mixer);
   /* gus_pcm.c */
 EXPORT_SYMBOL(snd_gf1_pcm_new);
   /* gus.c */
-EXPORT_SYMBOL(snd_gus_use_inc);
-EXPORT_SYMBOL(snd_gus_use_dec);
 EXPORT_SYMBOL(snd_gus_create);
 EXPORT_SYMBOL(snd_gus_initialize);
   /* gus_irq.c */
-- 
2.49.0

