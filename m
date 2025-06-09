Received: from mail-m1973183.qiye.163.com (mail-m1973183.qiye.163.com [220.197.31.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B6C281379;
	Mon,  9 Jun 2025 08:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749456585; cv=none; b=V148plY8Xa1mEoOz6Bwfd8racsOsDOlc6i5rZBT42vW67BlsEWQ8zBGoHBFpJ9Oi3iUqQOx+soZb/jEGpkcPhZiIonuBgJ6Gi2eCuk64ZFz4eIZGX9Bi9sWE5IaZKHPrmUywZMuq6A7wC1w7gRSMq75cGU9cLtsD6woJAeupe38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749456585; c=relaxed/simple;
	bh=mhLDgR1V42W+Ux7CXpjqpKsltVehwem5kLAhAgpoQVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U3o5NSjrBvxzfzLIgKeC4rNjsO1/Jxvi5pHDKEecI+oofBgllLQF741kYT/IBdzQaLJ+t+YvxKc6zOQnTNptS420vU6OhHsJ8aEHCzgQa9QeoFEkQrjqP9++93VYByjvIa9CeTKnkwq8YmLB7Q2ruq9YIxQZ52OmfhlLnwW4imI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=bXYXgGN6; arc=none smtp.client-ip=220.197.31.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="bXYXgGN6"
Received: from f-15NBC1011.. (unknown [59.173.180.60])
	by smtp.qiye.163.com (Hmail) with ESMTP id 17fa83ee2;
	Mon, 9 Jun 2025 14:53:59 +0800 (GMT+08:00)
From: "feng.liu" <feng.liu@senarytech.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"feng.liu" <feng.liu@senarytech.com>
Subject: [PATCH] correct boot value
Date: Mon,  9 Jun 2025 14:53:30 +0800
Message-ID: <20250609065331.495109-1-feng.liu@senarytech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSk4YVkkZHh1ITEwdSxgaSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlOQlVKTEhVSkNLVU1LWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a975377a36a09d6kunma05c786b5fc08d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PjY6CSo4HDE3ExIOMEsKDAJC
	Kh0aFD1VSlVKTE9CT05JS09LSExLVTMWGhIXVR0eFRxVFxIOOwgeFRoJAg8eGBNVGBQWRVlXWRIL
	WUFZTkJVSkxIVUpDS1VNS1lXWQgBWUFITkhMNwY+
DKIM-Signature:a=rsa-sha256;
	b=bXYXgGN66/zbQG6e8tYTlpMNyXqeedjfLEM9g+hpVtkmgdjd32P8fCmfcszzoVKhiEJ4oly4V1ADYS1nYZI6CjNRmWdVDtHTyTh+QZm0kusZ8cBKTk2FY0+d97iRcWT3fs1mW//WqhqJ23SIgEyJc5Gvfcb7/7BkOkUFrycJzgc=; s=default; c=relaxed/relaxed; d=senarytech.com; v=1;
	bh=S12uKf9spm0opERSHYctai6dvUt6IhIlINdaX4aa0yE=;
	h=date:mime-version:subject:message-id:from;

  Read the Boost Level configured for input pins in the BIOS 
init verbs, and restore these settings during audio recording. 
This addresses issues of low recording volume or excessive 
background noise caused by incorrect boost configurations.
  Compare with the last commit:
  1.Correct the function definition; cxt_get_default_capture_gain_boost 
does not require a return value.
  2.Check array indices to prevent operations causing memory out-of-bounds
access.

Signed-off-by: feng.liu <feng.liu@senarytech.com>
---
 sound/pci/hda/patch_conexant.c | 49 ++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 34874039ad4..95c76bb8e3c 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -43,6 +43,8 @@ struct conexant_spec {
 	unsigned int gpio_mute_led_mask;
 	unsigned int gpio_mic_led_mask;
 	bool is_cx8070_sn6140;
+
+	unsigned char init_imux_boost_val[HDA_MAX_NUM_INPUTS];
 };
 
 
@@ -1178,6 +1180,51 @@ static void add_cx5051_fake_mutes(struct hda_codec *codec)
 	spec->gen.dac_min_mute = true;
 }
 
+static void cxt_fixed_mic_boost(struct hda_codec *codec,
+	unsigned char node_id,
+	unsigned char mic_boost)
+{
+	unsigned char value = 0;
+
+	value = snd_hda_codec_read(codec, node_id, 0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
+	if (value != mic_boost)
+		snd_hda_codec_amp_stereo(codec, node_id, HDA_INPUT, 0, HDA_AMP_VOLMASK, mic_boost);
+}
+
+static void cxt_cap_sync_hook(struct hda_codec *codec,
+					 struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct conexant_spec *spec = codec->spec;
+	hda_nid_t mux_pin = spec->gen.imux_pins[spec->gen.cur_mux[0]];
+
+	if (spec->init_imux_boost_val[mux_pin])
+		cxt_fixed_mic_boost(codec, mux_pin, spec->init_imux_boost_val[mux_pin]);
+}
+
+static void cxt_get_default_capture_gain_boost(struct hda_codec *codec)
+{
+	struct conexant_spec *spec = codec->spec;
+	int i;
+	unsigned int boost;
+
+	spec->init_imux_boost_val[0] = 0;
+	for (i = 0; i < HDA_MAX_NUM_INPUTS; i++) {
+		if (spec->gen.imux_pins[i] == 0)
+			continue;
+
+		if (spec->gen.imux_pins[i] < HDA_MAX_NUM_INPUTS) {
+			boost = snd_hda_codec_read(codec, spec->gen.imux_pins[i],
+				0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
+			spec->init_imux_boost_val[spec->gen.imux_pins[i]] = boost;
+			codec_info(codec, "%s, node_id = %x, mic_boost =%x", __func__,
+				spec->gen.imux_pins[i], boost);
+		}
+	}
+
+	spec->gen.cap_sync_hook = cxt_cap_sync_hook;
+}
+
 static int patch_conexant_auto(struct hda_codec *codec)
 {
 	struct conexant_spec *spec;
@@ -1245,6 +1292,8 @@ static int patch_conexant_auto(struct hda_codec *codec)
 	if (!spec->gen.vmaster_mute.hook && spec->dynamic_eapd)
 		spec->gen.vmaster_mute.hook = cx_auto_vmaster_hook;
 
+	cxt_get_default_capture_gain_boost(codec);
+
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
 	err = snd_hda_parse_pin_defcfg(codec, &spec->gen.autocfg, NULL,
-- 
2.45.2

