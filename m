Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523DA1DF99C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750055349; cv=none; b=g7WEbeU5JF6qJRX+csCIWYVWKNepTpLWfMyyU4pibZCj64eV6Sn4nRJifC0S0JAHqJ28V3MRDBCsl+98mikm0rbx2Q06+dKqaltRX6UByaa0bdoPvnfZE8h0/PcAeRmbL2DzlgG7fNLikkjDhwTLg44hqyJbjSIsxunMSqCRtBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750055349; c=relaxed/simple;
	bh=nOc/n1KV0S5P3fT9GMJf7e5kLYWdERJAb3PbQtwye74=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L1tkwUxih74rrP0bivZAMZj/p3pvNiO4akFwl6OU1xQolvw41g6A8nBuszaXHreuR3Vo4GrMCL25lHC1ObpNF4hp6qfArVOj/B4MZXQS2aAnL+VytF1Q4MzUjjKTJS6uvPmCGrwySmlCD8jjuaM3XscmPvOIZ+GkOj/n6F6J5Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eIXC8fgC; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eIXC8fgC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7k
	mj3Dx6LNtxMuBXInzuZTk0/cSW/2IYoCKygr1quCg=; b=eIXC8fgCqhW51YyUuT
	z5sKx2J7ii9G4nHFklkOBqLe+N3JVWuwFiY0gHjzRupVwpinOPJhtp+91bmkSPn0
	uHGloeovr0lcPEDIJwAA15zIPFiTR9i5TdU9gjXh0APNkYD/IJDGc7dBG1XI/Ype
	sASIJvB+5XS09TJVAmYMP1uls=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgD3Q8t2uU9oJf4vAg--.3816S2;
	Mon, 16 Jun 2025 14:28:07 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] KYLIN: sound/conexant: Renaming the codec with device ID 0x1f86 and 0x1f87
Date: Mon, 16 Jun 2025 14:27:49 +0800
Message-Id: <20250616062749.553030-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgD3Q8t2uU9oJf4vAg--.3816S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWfZr1UuFyxXw4UGw4kJFb_yoW5JF48pr
	18Way5JrW2qFn0vFWxJr4DGF43W3ZayF97JrWakryxtw15Xry7Wa4fWryIvF4fJFZ0gaya
	qFsrKF10qayYvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzhFxUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbiRxZuT2hPtndN6wAAsw

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

