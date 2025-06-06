Received: from mail-m155100.qiye.163.com (mail-m155100.qiye.163.com [101.71.155.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B657288511;
	Fri,  6 Jun 2025 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211793; cv=none; b=SGoHcXr3Vv10mw08hl9FAYcwhiuaW3rLpLj8tchJJzPQ+dD+TYT390cIzrOT4uCoFkb3P6AB+ohppLlD7IDUlZv6QqDXRXuPRr/8r8p39Qje3nkSwJ6X0MtDxaKLElDYxqa8ddF3vWwVEBE/Cz7huMcWD61Fv6D89noo3IXgdQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211793; c=relaxed/simple;
	bh=fKLaM3Y/zvFJjqno1ZuE4eCqxRCZBQdRSSXpdfOYEUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e5kiGe0St54BO3oD9JD25NON4wqKLHxmsxch4KZ32a5wpLAc1JQY2HNDpH+c0cwETxcBunP5ySvZvVQprT+AjF/E//I4v1fJyDGwh+E+Fiyvbxvrl9G0euR9cwPlzyrEyn0NiSxM7af5O9Lqn9PTjIy9pkpNdXH1b2z9mNocFSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=dpFK+QGy; arc=none smtp.client-ip=101.71.155.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="dpFK+QGy"
Received: from f-15NBC1011.. (unknown [59.173.180.60])
	by smtp.qiye.163.com (Hmail) with ESMTP id 17c70785f;
	Fri, 6 Jun 2025 19:34:15 +0800 (GMT+08:00)
From: "feng.liu" <feng.liu@senarytech.com>
To: perex@perex.cz,
	tiwai@susu.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"feng.liu" <feng.liu@senarytech.com>
Subject: [PATCH] Correct boost volume 
Date: Fri,  6 Jun 2025 19:33:49 +0800
Message-ID: <20250606113349.129746-1-feng.liu@senarytech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0lIVkMdGkhISEhCHkxPGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlOQlVKTEhVSkNLVU1LWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ01CVUpLS1
	VLWQY+
X-HM-Tid: 0a974505283309d6kunme17f59d81e151d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSo6Sww*MjE#PRgDMig3TToO
	Ii1PCR9VSlVKTE9CSUtCTU5NT09PVTMWGhIXVR0eFRxVFxIOOwgeFRoJAg8eGBNVGBQWRVlXWRIL
	WUFZTkJVSkxIVUpDS1VNS1lXWQgBWUFISUpJNwY+
DKIM-Signature:a=rsa-sha256;
	b=dpFK+QGyk0gMHMAteJBMJAceC9R4A/PKk+bff+0MnEaAhqnFHxLKItgVmX/k+FU2QtqSg/L2ke11icl/orAqOOp2yuao8NRlWYXkmR6G/adnflVKcYa196gt+UjJXIvA2BXKtDhavbfItkGGLxgNIi3IAUBC0J3i1Jk6sEMnawM=; s=default; c=relaxed/relaxed; d=senarytech.com; v=1;
	bh=pIG8r7shakLbmdpIlhngJPrd8+12FVKQFSGXxV9t87E=;
	h=date:mime-version:subject:message-id:from;

Read the Boost Level configured for input pins in the BIOS 
 init verbs, and restore these settings during audio recording. 
 This addresses issues of low recording volume or excessive 
 background noise caused by incorrect boost configurations. 

Signed-off-by: feng.liu <feng.liu@senarytech.com>

---
 sound/pci/hda/patch_conexant.c | 46 ++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 34874039ad4..77101363e06 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -43,6 +43,8 @@ struct conexant_spec {
 	unsigned int gpio_mute_led_mask;
 	unsigned int gpio_mic_led_mask;
 	bool is_cx8070_sn6140;
+
+	unsigned char init_imux_boost_val[HDA_MAX_NUM_INPUTS];
 };
 
 
@@ -1178,6 +1180,48 @@ static void add_cx5051_fake_mutes(struct hda_codec *codec)
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
+static int cxt_get_defaut_capture_gain_boost(struct hda_codec *codec)
+{
+	struct conexant_spec *spec = codec->spec;
+	int i;
+	unsigned int boost;
+
+	for (i = 0; i < HDA_MAX_NUM_INPUTS; i++) {
+		if (spec->gen.imux_pins[i] == 0)
+			continue;
+
+		boost = snd_hda_codec_read(codec, spec->gen.imux_pins[i],
+			0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
+		spec->init_imux_boost_val[spec->gen.imux_pins[i]] = boost;
+		codec_info(codec, "%s, node_id = %x, mic_boost =%x", __func__,
+			spec->gen.imux_pins[i], boost);
+	}
+
+	spec->gen.cap_sync_hook = cxt_cap_sync_hook;
+}
+
 static int patch_conexant_auto(struct hda_codec *codec)
 {
 	struct conexant_spec *spec;
@@ -1245,6 +1289,8 @@ static int patch_conexant_auto(struct hda_codec *codec)
 	if (!spec->gen.vmaster_mute.hook && spec->dynamic_eapd)
 		spec->gen.vmaster_mute.hook = cx_auto_vmaster_hook;
 
+	cxt_get_defaut_capture_gain_boost(codec);
+
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
 	err = snd_hda_parse_pin_defcfg(codec, &spec->gen.autocfg, NULL,
-- 
2.45.2

