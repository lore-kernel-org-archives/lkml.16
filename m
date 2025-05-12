Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D97267B90
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747047581; cv=none; b=dpZCxa4iq3NJHikfnQFJclY1o54meX7bj0tKkOgGakNPdon3qRMBeCvVxu/CpCslhx/sXrl53WaClJQGco7YiapSA/8+UzPI4wq3OGQ3Ih7eX2/DHBL5HTpfaHv6NeaSaYnPX5W0j0QZgqeOq6m92n3VgknD/1PzHRmdn3h3Suo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747047581; c=relaxed/simple;
	bh=Mf1la858hqAJr8LutHXjNn3/rfRODDJSK6FlMwVDubU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ui72ds4B8sMkAWW83lSi7MkWzwzDSFhXD93OV83HPDTCbiC2IwAk9pqYjiKOo56qcQBIFMkT/YgoUH22c6LpeQkpiDNheTmWs2n1RSsx5+ErPBl972oJmXUfh/qb7FeLoJwfQ1BsvACqmKkwMpn2IOWTV9PYWIdp5PYvpE7rglo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iBP+OoD/; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iBP+OoD/"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747047577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8DSHevcaoSeQ5GAnjIxMyZYZhMqtaudfe/7o3ZKDxqg=;
	b=iBP+OoD/vqBhf3MMBUJ/na6ABzFMTGylfs4Jzkjm55thvzBUi0va4eHdlc4Lw9uARQuf6v
	wNp5iDxkJE5Km03ShON+UVYIL1J1SMPQ01Vu+DU9FjQarwZYOgMZMbVZlrT8pilDCbciAn
	xanXLwVLmh1MOXut6Q+aFGvCUCdY4+8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: sb: Replace deprecated strcpy() with strscpy()
Date: Mon, 12 May 2025 12:57:41 +0200
Message-ID: <20250512105754.35595-2-thorsten.blum@linux.dev>
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
 sound/isa/sb/emu8000.c  | 3 ++-
 sound/isa/sb/jazz16.c   | 5 +++--
 sound/isa/sb/sb16.c     | 5 +++--
 sound/isa/sb/sb8.c      | 5 +++--
 sound/isa/sb/sb8_midi.c | 3 ++-
 sound/isa/sb/sb_mixer.c | 5 +++--
 6 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/isa/sb/emu8000.c b/sound/isa/sb/emu8000.c
index 52884e6b9193..312b217491d4 100644
--- a/sound/isa/sb/emu8000.c
+++ b/sound/isa/sb/emu8000.c
@@ -14,6 +14,7 @@
 #include <linux/export.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/string.h>
 #include <sound/core.h>
 #include <sound/emu8000.h>
 #include <sound/emu8000_reg.h>
@@ -1096,7 +1097,7 @@ snd_emu8000_new(struct snd_card *card, int index, long port, int seq_ports,
 #if IS_ENABLED(CONFIG_SND_SEQUENCER)
 	if (snd_seq_device_new(card, index, SNDRV_SEQ_DEV_ID_EMU8000,
 			       sizeof(struct snd_emu8000*), &awe) >= 0) {
-		strcpy(awe->name, "EMU-8000");
+		strscpy(awe->name, "EMU-8000");
 		*(struct snd_emu8000 **)SNDRV_SEQ_DEVICE_ARGPTR(awe) = hw;
 	}
 #else
diff --git a/sound/isa/sb/jazz16.c b/sound/isa/sb/jazz16.c
index b28490973892..69d9bfb6c14c 100644
--- a/sound/isa/sb/jazz16.c
+++ b/sound/isa/sb/jazz16.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/string.h>
 #include <asm/dma.h>
 #include <linux/isa.h>
 #include <sound/core.h>
@@ -286,8 +287,8 @@ static int snd_jazz16_probe(struct device *devptr, unsigned int dev)
 
 	jazz16->chip = chip;
 
-	strcpy(card->driver, "jazz16");
-	strcpy(card->shortname, "Media Vision Jazz16");
+	strscpy(card->driver, "jazz16");
+	strscpy(card->shortname, "Media Vision Jazz16");
 	sprintf(card->longname,
 		"Media Vision Jazz16 at 0x%lx, irq %d, dma8 %d, dma16 %d",
 		port[dev], xirq, xdma8, xdma16);
diff --git a/sound/isa/sb/sb16.c b/sound/isa/sb/sb16.c
index 2f7505ad855c..752762117338 100644
--- a/sound/isa/sb/sb16.c
+++ b/sound/isa/sb/sb16.c
@@ -10,6 +10,7 @@
 #include <linux/err.h>
 #include <linux/isa.h>
 #include <linux/module.h>
+#include <linux/string.h>
 #include <sound/core.h>
 #include <sound/sb.h>
 #include <sound/sb16_csp.h>
@@ -337,12 +338,12 @@ static int snd_sb16_probe(struct snd_card *card, int dev)
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver,
+	strscpy(card->driver,
 #ifdef SNDRV_SBAWE_EMU8000
 			awe_port[dev] > 0 ? "SB AWE" :
 #endif
 			"SB16");
-	strcpy(card->shortname, chip->name);
+	strscpy(card->shortname, chip->name);
 	sprintf(card->longname, "%s at 0x%lx, irq %i, dma ",
 		chip->name,
 		chip->port,
diff --git a/sound/isa/sb/sb8.c b/sound/isa/sb/sb8.c
index 8726778c815e..6d5131265913 100644
--- a/sound/isa/sb/sb8.c
+++ b/sound/isa/sb/sb8.c
@@ -9,6 +9,7 @@
 #include <linux/isa.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
+#include <linux/string.h>
 #include <sound/core.h>
 #include <sound/sb.h>
 #include <sound/opl3.h>
@@ -162,8 +163,8 @@ static int snd_sb8_probe(struct device *pdev, unsigned int dev)
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, chip->hardware == SB_HW_PRO ? "SB Pro" : "SB8");
-	strcpy(card->shortname, chip->name);
+	strscpy(card->driver, chip->hardware == SB_HW_PRO ? "SB Pro" : "SB8");
+	strscpy(card->shortname, chip->name);
 	sprintf(card->longname, "%s at 0x%lx, irq %d, dma %d",
 		chip->name,
 		chip->port,
diff --git a/sound/isa/sb/sb8_midi.c b/sound/isa/sb/sb8_midi.c
index d2908fc280f8..57867e51d367 100644
--- a/sound/isa/sb/sb8_midi.c
+++ b/sound/isa/sb/sb8_midi.c
@@ -14,6 +14,7 @@
  */
 
 #include <linux/io.h>
+#include <linux/string.h>
 #include <linux/time.h>
 #include <sound/core.h>
 #include <sound/sb.h>
@@ -254,7 +255,7 @@ int snd_sb8dsp_midi(struct snd_sb *chip, int device)
 	err = snd_rawmidi_new(chip->card, "SB8 MIDI", device, 1, 1, &rmidi);
 	if (err < 0)
 		return err;
-	strcpy(rmidi->name, "SB8 MIDI");
+	strscpy(rmidi->name, "SB8 MIDI");
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &snd_sb8dsp_midi_output);
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT, &snd_sb8dsp_midi_input);
 	rmidi->info_flags |= SNDRV_RAWMIDI_INFO_OUTPUT | SNDRV_RAWMIDI_INFO_INPUT;
diff --git a/sound/isa/sb/sb_mixer.c b/sound/isa/sb/sb_mixer.c
index 9d23b7a4570b..b2709ed134b4 100644
--- a/sound/isa/sb/sb_mixer.c
+++ b/sound/isa/sb/sb_mixer.c
@@ -6,6 +6,7 @@
 
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/string.h>
 #include <linux/time.h>
 #include <sound/core.h>
 #include <sound/sb.h>
@@ -718,7 +719,7 @@ static int snd_sbmixer_init(struct snd_sb *chip,
 			return err;
 	}
 	snd_component_add(card, name);
-	strcpy(card->mixername, name);
+	strscpy(card->mixername, name);
 	return 0;
 }
 
@@ -799,7 +800,7 @@ int snd_sbmixer_new(struct snd_sb *chip)
 			return err;
 		break;
 	default:
-		strcpy(card->mixername, "???");
+		strscpy(card->mixername, "???");
 	}
 	return 0;
 }
-- 
2.49.0

