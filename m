Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3807423ABA6
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354938; cv=none; b=dtRFiu0LRT0bvqmQ9Rzptrj/HospEa6nZK0B/ol6ptRIGUOkMBwCGaBjOdbOgGD3JMUmRe4v9o9tv4BIFRadfmoSTLxl0NZ6KRk2y/ftdk5/TftewMjRf3JI71hAxy1IJe4O2rQPG3jSVkHwLMQ07tbkFNXgtHwAQwDG8R3gFFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354938; c=relaxed/simple;
	bh=L/OerO8K7dV84+t/54H44SeC92ZXlm5XpyIgZREAD0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JMgQlzYsLGYffD/1gd0Qkzox2GkNFM4Y3zyh7zXh9IdmgmPFmqJeNXTV6Z0oMNO79rdcooPJjE7C47FpRlocBx1NIMsPIeXnJnEi/j5u+JCo3t5xNqzl/SV/PCeJWObW8jCnLa2pM3N2KHDPBC6+6bKN0kxV9hrcLvZWHButbjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EwxdnANh; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EwxdnANh"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750354919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jloEniBJzWZUd3yTjD8bjym70kpKQBVd5Lz0POnC08Y=;
	b=EwxdnANhsAu7DLNTdnzO4Mj/dCZ4k/BzHHMniYeIbBBVo6Vgjy8Lvhq0LfAGcn7psyC43N
	WFq9gSXwxfrgW86FEVCS9UwzBRMdfZ5DDjd3l2zk/dCvTxpv6HCBJvEIQHfFASwMLmagQs
	xNXav/dWYqcoFwqiJY5KKZkuHgmwFhc=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Philipp Stanner <phasta@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: emu10k1: Replace deprecated strcpy() with strscpy()
Date: Thu, 19 Jun 2025 19:40:48 +0200
Message-ID: <20250619174057.175676-2-thorsten.blum@linux.dev>
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
 sound/pci/emu10k1/emu10k1.c  |  3 ++-
 sound/pci/emu10k1/emu10k1x.c | 13 +++++++------
 sound/pci/emu10k1/emufx.c    | 23 ++++++++++++-----------
 sound/pci/emu10k1/emumixer.c |  9 +++++----
 4 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index dadeda7758ce..548e7d049901 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -7,6 +7,7 @@
 
 #include <linux/init.h>
 #include <linux/pci.h>
+#include <linux/string.h>
 #include <linux/time.h>
 #include <linux/module.h>
 #include <sound/core.h>
@@ -154,7 +155,7 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 	} else {
 		struct snd_emu10k1_synth_arg *arg;
 		arg = SNDRV_SEQ_DEVICE_ARGPTR(wave);
-		strcpy(wave->name, "Emu-10k1 Synth");
+		strscpy(wave->name, "Emu-10k1 Synth");
 		arg->hwptr = emu;
 		arg->index = 1;
 		arg->seq_ports = seq_ports[dev];
diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index 30ac37b5a214..8c18ad987223 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -20,6 +20,7 @@
 #include <linux/pci.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/module.h>
 #include <sound/core.h>
 #include <sound/initval.h>
@@ -840,15 +841,15 @@ static int snd_emu10k1x_pcm(struct emu10k1x *emu, int device)
 	pcm->info_flags = 0;
 	switch(device) {
 	case 0:
-		strcpy(pcm->name, "EMU10K1X Front");
+		strscpy(pcm->name, "EMU10K1X Front");
 		map = snd_pcm_std_chmaps;
 		break;
 	case 1:
-		strcpy(pcm->name, "EMU10K1X Rear");
+		strscpy(pcm->name, "EMU10K1X Rear");
 		map = surround_map;
 		break;
 	case 2:
-		strcpy(pcm->name, "EMU10K1X Center/LFE");
+		strscpy(pcm->name, "EMU10K1X Center/LFE");
 		map = clfe_map;
 		break;
 	}
@@ -1461,7 +1462,7 @@ static int emu10k1x_midi_init(struct emu10k1x *emu,
 	spin_lock_init(&midi->open_lock);
 	spin_lock_init(&midi->input_lock);
 	spin_lock_init(&midi->output_lock);
-	strcpy(rmidi->name, name);
+	strscpy(rmidi->name, name);
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT, &snd_emu10k1x_midi_output);
 	snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_INPUT, &snd_emu10k1x_midi_input);
 	rmidi->info_flags |= SNDRV_RAWMIDI_INFO_OUTPUT |
@@ -1540,8 +1541,8 @@ static int __snd_emu10k1x_probe(struct pci_dev *pci,
 
 	snd_emu10k1x_proc_init(chip);
 
-	strcpy(card->driver, "EMU10K1X");
-	strcpy(card->shortname, "Dell Sound Blaster Live!");
+	strscpy(card->driver, "EMU10K1X");
+	strscpy(card->shortname, "Dell Sound Blaster Live!");
 	sprintf(card->longname, "%s at 0x%lx irq %i",
 		card->shortname, chip->port, chip->irq);
 
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 03efc317e05f..7db0660e6b61 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -12,6 +12,7 @@
 #include <linux/capability.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/vmalloc.h>
 #include <linux/init.h>
 #include <linux/mutex.h>
@@ -1175,7 +1176,7 @@ snd_emu10k1_init_mono_control2(struct snd_emu10k1_fx8010_control_gpr *ctl,
 			       const char *name, int gpr, int defval, int defval_hr)
 {
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
-	strcpy(ctl->id.name, name);
+	strscpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 1;
 	if (high_res_gpr_volume) {
 		ctl->min = -1;
@@ -1199,7 +1200,7 @@ snd_emu10k1_init_stereo_control2(struct snd_emu10k1_fx8010_control_gpr *ctl,
 				 const char *name, int gpr, int defval, int defval_hr)
 {
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
-	strcpy(ctl->id.name, name);
+	strscpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 2;
 	if (high_res_gpr_volume) {
 		ctl->min = -1;
@@ -1224,7 +1225,7 @@ snd_emu10k1_init_mono_onoff_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
 				    const char *name, int gpr, int defval)
 {
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
-	strcpy(ctl->id.name, name);
+	strscpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 1;
 	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
 	ctl->min = 0;
@@ -1237,7 +1238,7 @@ snd_emu10k1_init_stereo_onoff_control(struct snd_emu10k1_fx8010_control_gpr *ctl
 				      const char *name, int gpr, int defval)
 {
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
-	strcpy(ctl->id.name, name);
+	strscpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 2;
 	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
 	ctl->gpr[1] = gpr + 1; ctl->value[1] = defval;
@@ -1325,7 +1326,7 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	/* clear TRAM data & address lines */
 	memset(icode->tram_valid, 0xff, 256 / 8);
 
-	strcpy(icode->name, "Audigy DSP code for ALSA");
+	strscpy(icode->name, "Audigy DSP code for ALSA");
 	ptr = 0;
 	nctl = 0;
 	gpr_map[bit_shifter16] = 0x00008000;
@@ -1563,7 +1564,7 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	 */
 	ctl = &controls[nctl + 0];
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
-	strcpy(ctl->id.name, "Tone Control - Bass");
+	strscpy(ctl->id.name, "Tone Control - Bass");
 	ctl->vcount = 2;
 	ctl->count = 10;
 	ctl->min = 0;
@@ -1572,7 +1573,7 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
 	ctl->translation = EMU10K1_GPR_TRANSLATION_BASS;
 	ctl = &controls[nctl + 1];
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
-	strcpy(ctl->id.name, "Tone Control - Treble");
+	strscpy(ctl->id.name, "Tone Control - Treble");
 	ctl->vcount = 2;
 	ctl->count = 10;
 	ctl->min = 0;
@@ -1849,7 +1850,7 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	/* clear TRAM data & address lines */
 	memset(icode->tram_valid, 0xff, 160 / 8);
 
-	strcpy(icode->name, "SB Live! FX8010 code for ALSA v1.2 by Jaroslav Kysela");
+	strscpy(icode->name, "SB Live! FX8010 code for ALSA v1.2 by Jaroslav Kysela");
 	ptr = 0; i = 0;
 	/* we have 12 inputs */
 	playback = SND_EMU10K1_INPUTS;
@@ -2160,7 +2161,7 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	 */
 	ctl = &controls[i + 0];
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
-	strcpy(ctl->id.name, "Tone Control - Bass");
+	strscpy(ctl->id.name, "Tone Control - Bass");
 	ctl->vcount = 2;
 	ctl->count = 10;
 	ctl->min = 0;
@@ -2170,7 +2171,7 @@ static int _snd_emu10k1_init_efx(struct snd_emu10k1 *emu)
 	ctl->translation = EMU10K1_GPR_TRANSLATION_BASS;
 	ctl = &controls[i + 1];
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
-	strcpy(ctl->id.name, "Tone Control - Treble");
+	strscpy(ctl->id.name, "Tone Control - Treble");
 	ctl->vcount = 2;
 	ctl->count = 10;
 	ctl->min = 0;
@@ -2623,7 +2624,7 @@ int snd_emu10k1_fx8010_new(struct snd_emu10k1 *emu, int device)
 	err = snd_hwdep_new(emu->card, "FX8010", device, &hw);
 	if (err < 0)
 		return err;
-	strcpy(hw->name, "EMU10K1 (FX8010)");
+	strscpy(hw->name, "EMU10K1 (FX8010)");
 	hw->iface = SNDRV_HWDEP_IFACE_EMU10K1;
 	hw->ops.open = snd_emu10k1_fx8010_open;
 	hw->ops.ioctl = snd_emu10k1_fx8010_ioctl;
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 05b98d9b547b..d665d5d1ad7c 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -12,6 +12,7 @@
 
 #include <linux/time.h>
 #include <linux/init.h>
+#include <linux/string.h>
 #include <sound/core.h>
 #include <sound/emu10k1.h>
 #include <linux/delay.h>
@@ -1983,7 +1984,7 @@ static int remove_ctl(struct snd_card *card, const char *name)
 {
 	struct snd_ctl_elem_id id;
 	memset(&id, 0, sizeof(id));
-	strcpy(id.name, name);
+	strscpy(id.name, name);
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	return snd_ctl_remove_id(card, &id);
 }
@@ -2188,11 +2189,11 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 	} else {
 	no_ac97:
 		if (emu->card_capabilities->ecard)
-			strcpy(emu->card->mixername, "EMU APS");
+			strscpy(emu->card->mixername, "EMU APS");
 		else if (emu->audigy)
-			strcpy(emu->card->mixername, "SB Audigy");
+			strscpy(emu->card->mixername, "SB Audigy");
 		else
-			strcpy(emu->card->mixername, "Emu10k1");
+			strscpy(emu->card->mixername, "Emu10k1");
 	}
 
 	if (emu->audigy)
-- 
2.49.0

