Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C9054BC6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059881; cv=none; b=aLSFXQpAUyOJ8Wfby2/B5fqBoTm/xoJGp1J9GeUCegFCNnqr3rRw6QXHPjM16C0yWgXMQPbtKX4S2vhJTkiGONGBX5qCvjV1n9j33zu36zTTK+MkTDy0XZTeWID+UrUMx2jyB0gdffOrdZe6fyBWSnDya/zLjd6PkCbKU9rX1Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059881; c=relaxed/simple;
	bh=nOc/n1KV0S5P3fT9GMJf7e5kLYWdERJAb3PbQtwye74=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HtonHcYrGhJoceKwjXZxCAEIQ6hlohU6JtbcoD9Sp98z7yd4epSeRfk+K281aYbe+rALFjlP+zRNGAtf2bNEcLzZipNPYlaPd2Mur1BjlV82M/z4PFL+B/3lNp97ccLaq119VC9kr2SMBVTqsY4Ly1TK+zFCPmtTTRKNKEmvtDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OQfR8UO4; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OQfR8UO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7k
	mj3Dx6LNtxMuBXInzuZTk0/cSW/2IYoCKygr1quCg=; b=OQfR8UO46X3vjCAwwG
	ZxCNBQq9L7Q93CZnAU6JwLPCH0B/EbFRzEGqzH9WYGAMFpi79p1KR1dpIm0XySjq
	ZbO7ZVxXnzMJrIEx0ZhyiMmrOK932tbNxZea6JCx8ETampCwWhDiugJS4gHD7st5
	6zNdPwmwF9QXysxYuOiYCIZuc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnznM0y09ow3E6Ig--.7585S2;
	Mon, 16 Jun 2025 15:43:48 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2] ALSA: hda/conexant: Renaming the codec with device ID 0x1f86 and 0x1f87
Date: Mon, 16 Jun 2025 15:43:31 +0800
Message-Id: <20250616074331.581309-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnznM0y09ow3E6Ig--.7585S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWfZr1UuFyxXw4UGw4kJFb_yoW5JF48pr
	18Way5JrW2qFn0vFWxJr4DGF43W3ZayF97JrWakryxtw15Xry7Wa4fWryIvF4fJFZ0gaya
	qFsrKF10qayYvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzWlkUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbBDQRuT2hPtVFw2wABsB

From: wangdicheng <wangdicheng@kylinos.cn>

Due to changes in the manufacturer's plan, all 0x14f11f86 will be named CX11880, and 0x14f11f87 will be named SN6140

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/pci/hda/patch_conexant.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 4985e72b9094..1366a33de8d3 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -42,7 +42,7 @@ struct conexant_spec {
 	unsigned int gpio_led;
 	unsigned int gpio_mute_led_mask;
 	unsigned int gpio_mic_led_mask;
-	bool is_cx8070_sn6140;
+	bool is_cx11880_sn6140;
 };
 
 
@@ -195,7 +195,7 @@ static int cx_auto_init(struct hda_codec *codec)
 	cxt_init_gpio_led(codec);
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
 
-	if (spec->is_cx8070_sn6140)
+	if (spec->is_cx11880_sn6140)
 		cx_fixup_headset_recog(codec);
 
 	return 0;
@@ -247,7 +247,7 @@ static void cx_update_headset_mic_vref(struct hda_codec *codec, struct hda_jack_
 {
 	unsigned int mic_present;
 
-	/* In cx8070 and sn6140, the node 16 can only be configured to headphone or disabled,
+	/* In cx11880 and sn6140, the node 16 can only be configured to headphone or disabled,
 	 * the node 19 can only be configured to microphone or disabled.
 	 * Check hp&mic tag to process headset plugin & plugout.
 	 */
@@ -1191,11 +1191,11 @@ static int patch_conexant_auto(struct hda_codec *codec)
 	codec->spec = spec;
 	codec->patch_ops = cx_auto_patch_ops;
 
-	/* init cx8070/sn6140 flag and reset headset_present_flag */
+	/* init cx11880/sn6140 flag and reset headset_present_flag */
 	switch (codec->core.vendor_id) {
 	case 0x14f11f86:
 	case 0x14f11f87:
-		spec->is_cx8070_sn6140 = true;
+		spec->is_cx11880_sn6140 = true;
 		snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
 		break;
 	}
@@ -1283,7 +1283,7 @@ static int patch_conexant_auto(struct hda_codec *codec)
  */
 
 static const struct hda_device_id snd_hda_id_conexant[] = {
-	HDA_CODEC_ENTRY(0x14f11f86, "CX8070", patch_conexant_auto),
+	HDA_CODEC_ENTRY(0x14f11f86, "CX11880", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f11f87, "SN6140", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f12008, "CX8200", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f120d0, "CX11970", patch_conexant_auto),
-- 
2.25.1

