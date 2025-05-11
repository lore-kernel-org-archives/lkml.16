Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B9F25D8F9;
	Sun, 11 May 2025 17:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746984605; cv=none; b=W3/frumMolhPwVuHvnRZHWGnwR/Fq62i73zyg8uJEcBV41n2tXBeK+hUrEIYWYkSJXvV6LG3eA8NQx/G2J6iKcprJyLacZAyLoSx/Vq0yuDi6MjdmJgYw4HQaNMXknPJYRefAr8scgqWFmTIqeKFFKtha0gMJJRLx9l2AIFGEzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746984605; c=relaxed/simple;
	bh=L8ISTwyG1IADicylx+Pj+Y2qCZL0KLNneW4S5qbDEs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eyx6b8rFl5b+zITFdXAvT5YFFrvQ2p3FhJjqP2mVuzV7hN/6klFFp0+Adjdff/cHDggCOxKZ5jhjCW2cJiyP8swyeb0zpGRFQIOtKQ/ern566+XHdC1Rsb6oLEfDH+v+bCyu0NaOelqIG8g7qhO1c4FAFcBoIWynfbxs7olsyHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=JAxIbc7L; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="JAxIbc7L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=NwTKBRWdHrYVu70Ib7exK/ao9Zbd7vdxnzvdtqBwN5s=; b=JAxIbc7LCgi52Vd+
	HzR9TTu+Z+zKGaE8+FPfWnqb0PeaxDEI1mul1qFcOQGWOPuD00ZJvTo9TbHxhhXytJQJ6VckRpIVm
	xE1gx61MnJe3SG0YZZHjHn5Mt4ZOz+8Oc3EdUd6O3MmSVt45eGkstd2wg+K29HW1J/DKpUnWkv4QD
	+rFhJk34fbE3SsPx0aRtmkPY+aXRnQ/fXNAJE6cOs8E68sF+IFJipC085gbsAznsW//TkZn/hwd1P
	0/BvbCRPpU+mmzp/ghOEAcP3aI1OoHg8rBAKnJmfZUJwu8xEED2bw6U5Oi8upRPNizxJH5JpwPOKH
	8XoGLF0S82WnQ2iXrw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uEAUv-002u95-1f;
	Sun, 11 May 2025 17:29:57 +0000
From: linux@treblig.org
To: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.h1@wp.pl
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ALSA: msnd: Remove midi code
Date: Sun, 11 May 2025 18:29:57 +0100
Message-ID: <20250511172957.1001583-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Nothing calls snd_msndmidi_new()
  thus nothing sets chip->msndmidi_mpu
    The call to snd_msndmidi_input_read is gated on that being set,
    so snd_msndmidi_input_read() won't be called either.

This is probably a missing call to snd_msndmidi_new(), but since
this is ancient code, it's probably best to remove it (especially
since I don't have the hardware to test it).

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/isa/msnd/Makefile        |   2 +-
 sound/isa/msnd/msnd.h          |   4 -
 sound/isa/msnd/msnd_midi.c     | 163 ---------------------------------
 sound/isa/msnd/msnd_pinnacle.c |   5 -
 4 files changed, 1 insertion(+), 173 deletions(-)
 delete mode 100644 sound/isa/msnd/msnd_midi.c

diff --git a/sound/isa/msnd/Makefile b/sound/isa/msnd/Makefile
index 5f8d6b472722..d56412aae857 100644
--- a/sound/isa/msnd/Makefile
+++ b/sound/isa/msnd/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-snd-msnd-lib-y := msnd.o msnd_midi.o msnd_pinnacle_mixer.o
+snd-msnd-lib-y := msnd.o msnd_pinnacle_mixer.o
 snd-msnd-pinnacle-y := msnd_pinnacle.o
 snd-msnd-classic-y := msnd_classic.o
 
diff --git a/sound/isa/msnd/msnd.h b/sound/isa/msnd/msnd.h
index 533d71cee9ba..3d7810ed9186 100644
--- a/sound/isa/msnd/msnd.h
+++ b/sound/isa/msnd/msnd.h
@@ -216,7 +216,6 @@ struct snd_msnd {
 	int			captureLimit;
 	int			capturePeriods;
 	struct snd_card		*card;
-	void			*msndmidi_mpu;
 	struct snd_rawmidi	*rmidi;
 
 	/* Hardware resources */
@@ -286,9 +285,6 @@ int snd_msnd_DAPQ(struct snd_msnd *chip, int start);
 int snd_msnd_DARQ(struct snd_msnd *chip, int start);
 int snd_msnd_pcm(struct snd_card *card, int device);
 
-int snd_msndmidi_new(struct snd_card *card, int device);
-void snd_msndmidi_input_read(void *mpu);
-
 void snd_msndmix_setup(struct snd_msnd *chip);
 int snd_msndmix_new(struct snd_card *card);
 int snd_msndmix_force_recsrc(struct snd_msnd *chip, int recsrc);
diff --git a/sound/isa/msnd/msnd_midi.c b/sound/isa/msnd/msnd_midi.c
deleted file mode 100644
index 3ffc8758bec2..000000000000
--- a/sound/isa/msnd/msnd_midi.c
+++ /dev/null
@@ -1,163 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (c) by Jaroslav Kysela <perex@perex.cz>
- *  Copyright (c) 2009 by Krzysztof Helt
- *  Routines for control of MPU-401 in UART mode
- *
- *  MPU-401 supports UART mode which is not capable generate transmit
- *  interrupts thus output is done via polling. Also, if irq < 0, then
- *  input is done also via polling. Do not expect good performance.
- */
-
-#include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
-#include <linux/ioport.h>
-#include <linux/errno.h>
-#include <linux/export.h>
-#include <sound/core.h>
-#include <sound/rawmidi.h>
-
-#include "msnd.h"
-
-#define MSNDMIDI_MODE_BIT_INPUT		0
-#define MSNDMIDI_MODE_BIT_OUTPUT		1
-#define MSNDMIDI_MODE_BIT_INPUT_TRIGGER	2
-#define MSNDMIDI_MODE_BIT_OUTPUT_TRIGGER	3
-
-struct snd_msndmidi {
-	struct snd_msnd *dev;
-
-	unsigned long mode;		/* MSNDMIDI_MODE_XXXX */
-
-	struct snd_rawmidi_substream *substream_input;
-
-	spinlock_t input_lock;
-};
-
-/*
- * input/output open/close - protected by open_mutex in rawmidi.c
- */
-static int snd_msndmidi_input_open(struct snd_rawmidi_substream *substream)
-{
-	struct snd_msndmidi *mpu;
-
-	mpu = substream->rmidi->private_data;
-
-	mpu->substream_input = substream;
-
-	snd_msnd_enable_irq(mpu->dev);
-
-	snd_msnd_send_dsp_cmd(mpu->dev, HDEX_MIDI_IN_START);
-	set_bit(MSNDMIDI_MODE_BIT_INPUT, &mpu->mode);
-	return 0;
-}
-
-static int snd_msndmidi_input_close(struct snd_rawmidi_substream *substream)
-{
-	struct snd_msndmidi *mpu;
-
-	mpu = substream->rmidi->private_data;
-	snd_msnd_send_dsp_cmd(mpu->dev, HDEX_MIDI_IN_STOP);
-	clear_bit(MSNDMIDI_MODE_BIT_INPUT, &mpu->mode);
-	mpu->substream_input = NULL;
-	snd_msnd_disable_irq(mpu->dev);
-	return 0;
-}
-
-static void snd_msndmidi_input_drop(struct snd_msndmidi *mpu)
-{
-	u16 tail;
-
-	tail = readw(mpu->dev->MIDQ + JQS_wTail);
-	writew(tail, mpu->dev->MIDQ + JQS_wHead);
-}
-
-/*
- * trigger input
- */
-static void snd_msndmidi_input_trigger(struct snd_rawmidi_substream *substream,
-					int up)
-{
-	unsigned long flags;
-	struct snd_msndmidi *mpu;
-
-	mpu = substream->rmidi->private_data;
-	spin_lock_irqsave(&mpu->input_lock, flags);
-	if (up) {
-		if (!test_and_set_bit(MSNDMIDI_MODE_BIT_INPUT_TRIGGER,
-				      &mpu->mode))
-			snd_msndmidi_input_drop(mpu);
-	} else {
-		clear_bit(MSNDMIDI_MODE_BIT_INPUT_TRIGGER, &mpu->mode);
-	}
-	spin_unlock_irqrestore(&mpu->input_lock, flags);
-	if (up)
-		snd_msndmidi_input_read(mpu);
-}
-
-void snd_msndmidi_input_read(void *mpuv)
-{
-	unsigned long flags;
-	struct snd_msndmidi *mpu = mpuv;
-	void __iomem *pwMIDQData = mpu->dev->mappedbase + MIDQ_DATA_BUFF;
-	u16 head, tail, size;
-
-	spin_lock_irqsave(&mpu->input_lock, flags);
-	head = readw(mpu->dev->MIDQ + JQS_wHead);
-	tail = readw(mpu->dev->MIDQ + JQS_wTail);
-	size = readw(mpu->dev->MIDQ + JQS_wSize);
-	if (head > size || tail > size)
-		goto out;
-	while (head != tail) {
-		unsigned char val = readw(pwMIDQData + 2 * head);
-
-		if (test_bit(MSNDMIDI_MODE_BIT_INPUT_TRIGGER, &mpu->mode))
-			snd_rawmidi_receive(mpu->substream_input, &val, 1);
-		if (++head > size)
-			head = 0;
-		writew(head, mpu->dev->MIDQ + JQS_wHead);
-	}
- out:
-	spin_unlock_irqrestore(&mpu->input_lock, flags);
-}
-EXPORT_SYMBOL(snd_msndmidi_input_read);
-
-static const struct snd_rawmidi_ops snd_msndmidi_input = {
-	.open =		snd_msndmidi_input_open,
-	.close =	snd_msndmidi_input_close,
-	.trigger =	snd_msndmidi_input_trigger,
-};
-
-static void snd_msndmidi_free(struct snd_rawmidi *rmidi)
-{
-	struct snd_msndmidi *mpu = rmidi->private_data;
-	kfree(mpu);
-}
-
-int snd_msndmidi_new(struct snd_card *card, int device)
-{
-	struct snd_msnd *chip = card->private_data;
-	struct snd_msndmidi *mpu;
-	struct snd_rawmidi *rmidi;
-	int err;
-
-	err = snd_rawmidi_new(card, "MSND-MIDI", device, 1, 1, &rmidi);
-	if (err < 0)
-		return err;
-	mpu = kzalloc(sizeof(*mpu), GFP_KERNEL);
-	if (mpu == NULL) {
-		snd_device_free(card, rmidi);
-		return -ENOMEM;
-	}
-	mpu->dev = chip;
-	chip->msndmidi_mpu = mpu;
-	rmidi->private_data = mpu;
-	rmidi->private_free = snd_msndmidi_free;
-	spin_lock_init(&mpu->input_lock);
-	strcpy(rmidi->name, "MSND MIDI");
-	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT,
-			    &snd_msndmidi_input);
-	rmidi->info_flags |= SNDRV_RAWMIDI_INFO_INPUT;
-	return 0;
-}
diff --git a/sound/isa/msnd/msnd_pinnacle.c b/sound/isa/msnd/msnd_pinnacle.c
index 635403301a15..8caf431677e5 100644
--- a/sound/isa/msnd/msnd_pinnacle.c
+++ b/sound/isa/msnd/msnd_pinnacle.c
@@ -142,11 +142,6 @@ static void snd_msnd_eval_dsp_msg(struct snd_msnd *chip, u16 wMessage)
 		}
 		break;
 
-	case HIMT_MIDI_IN_UCHAR:
-		if (chip->msndmidi_mpu)
-			snd_msndmidi_input_read(chip->msndmidi_mpu);
-		break;
-
 	default:
 		dev_dbg(chip->card->dev, LOGNAME ": HIMT message %d 0x%02x\n",
 			HIBYTE(wMessage), HIBYTE(wMessage));
-- 
2.49.0

