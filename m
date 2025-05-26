Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828381FE44B;
	Mon, 26 May 2025 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268482; cv=none; b=hBxrp/dmJSfbSG3d+13pUtsWOgUvrZ+MtDKbu+DMb/FC/0FWOzRbhsqC2g5KXGSeL9/uzLcMuiCNM7io7njSvwUZ9hdWRfg3xXldkfSF/iT/SaXFR24tkVR2MwbbSleN2BNoftTcNaxDVaWGL7NZSTE9NLeLvazItPYYxKj0e+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268482; c=relaxed/simple;
	bh=dEorDuCijfGtDXExtvVoCfx+DrWWw3LQ2tE3EeTTZ6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0FwMH2FMLQ1Bljc1RBaG3pPR1U5/6yy70TbwsdWCIJzQPxw5XsrzGQzZXMoAJVMQobMgMEvVSVnICBlXqZoobhR4lTwh0WSZgUkGHQ3nMBqeEF4Ysi97SLUw0jFgjo+MlCiFUmq1aAh1nMkv4F/SQdsUP2nzeX6K3nqyQE/fJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AfEl54Et; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AfEl54Et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748268478;
	bh=dEorDuCijfGtDXExtvVoCfx+DrWWw3LQ2tE3EeTTZ6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AfEl54EtruqV9B94Q+8g/ngj7SLtuioyqjqHuObQUQL4IVi/S4ywLdll1OB/8A/77
	 ncdvLFLPwOJpfJKm9XY2xACpIRaTLJpJhm4od4kJqqhu2XBSr/qocTANwKxofu8hx1
	 8LlR1G3YiXdafXeunTzE2Vy3B1VUE7CAb/9U7agBBGCjgebDOs/N36Nv5auT+QlTzx
	 ufNmc2YfNvhtR2mtzLObCS4z34syw7nHAaIHXSshKHDyD5fewiJ7ITD9tgU37H76rQ
	 8eEog0SD6lDCw98TMLfwmsePT2X06z7WhKLL4Cq/bNGB1Ju4y0WKeNo7Ani4TL42om
	 /UuSlxefqK0fA==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 68E8917E1595;
	Mon, 26 May 2025 16:07:58 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 17:07:41 +0300
Subject: [PATCH 2/9] ALSA: usb-audio: Fix whitespace & blank line issues in
 mixer_quirks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-alsa-jack-v1-2-1a821463b632@collabora.com>
References: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
In-Reply-To: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Address all whitespace & blank line(s) related issues reported by
checkpatch.pl:

  ERROR: trailing whitespace
  ERROR: space required after that ',' (ctx:VxV)
  WARNING: Missing a blank line after declarations
  CHECK: Please use a blank line after function/struct/union/enum declarations
  CHECK: Please don't use multiple blank lines

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/usb/mixer_quirks.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index c05861450465a653b982df2f13fb1ca0a4d73bf1..ec14b5ee61c20c9cc098582f078c5a54e9fb0d81 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -287,7 +287,7 @@ static int snd_usb_soundblaster_remote_init(struct usb_mixer_interface *mixer)
 	mixer->rc_setup_packet->wLength = cpu_to_le16(len);
 	usb_fill_control_urb(mixer->rc_urb, mixer->chip->dev,
 			     usb_rcvctrlpipe(mixer->chip->dev, 0),
-			     (u8*)mixer->rc_setup_packet, mixer->rc_buffer, len,
+			     (u8 *)mixer->rc_setup_packet, mixer->rc_buffer, len,
 			     snd_usb_soundblaster_remote_complete, mixer);
 	return 0;
 }
@@ -389,7 +389,7 @@ static int snd_audigy2nx_controls_create(struct usb_mixer_interface *mixer)
 			 mixer->chip->usb_id == USB_ID(0x041e, 0x3042) ||
 			 mixer->chip->usb_id == USB_ID(0x041e, 0x30df) ||
 			 mixer->chip->usb_id == USB_ID(0x041e, 0x3048)))
-			break; 
+			break;
 
 		knew = snd_audigy2nx_control;
 		knew.name = snd_audigy2nx_led_names[i];
@@ -858,6 +858,7 @@ static const struct snd_kcontrol_new snd_mbox1_src_switch = {
 static int snd_mbox1_controls_create(struct usb_mixer_interface *mixer)
 {
 	int err;
+
 	err = add_single_ctl_with_resume(mixer, 0,
 					 snd_mbox1_clk_switch_resume,
 					 &snd_mbox1_clk_switch, NULL);
@@ -871,7 +872,7 @@ static int snd_mbox1_controls_create(struct usb_mixer_interface *mixer)
 
 /* Native Instruments device quirks */
 
-#define _MAKE_NI_CONTROL(bRequest,wIndex) ((bRequest) << 16 | (wIndex))
+#define _MAKE_NI_CONTROL(bRequest, wIndex) ((bRequest) << 16 | (wIndex))
 
 static int snd_ni_control_init_val(struct usb_mixer_interface *mixer,
 				   struct snd_kcontrol *kctl)
@@ -2183,6 +2184,7 @@ static const u32 snd_rme_rate_table[] = {
 	256000,	352800, 384000, 400000,
 	512000, 705600, 768000, 800000
 };
+
 /* maximum number of items for AES and S/PDIF rates for above table */
 #define SND_RME_RATE_IDX_AES_SPDIF_NUM		12
 
@@ -3271,7 +3273,6 @@ static int snd_rme_digiface_sync_state_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-
 static int snd_rme_digiface_format_info(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_info *uinfo)
 {
@@ -3283,7 +3284,6 @@ static int snd_rme_digiface_format_info(struct snd_kcontrol *kcontrol,
 				 ARRAY_SIZE(format), format);
 }
 
-
 static int snd_rme_digiface_sync_source_info(struct snd_kcontrol *kcontrol,
 					     struct snd_ctl_elem_info *uinfo)
 {
@@ -3566,7 +3566,6 @@ static int snd_rme_digiface_controls_create(struct usb_mixer_interface *mixer)
 #define SND_DJM_A9_IDX		0x6
 #define SND_DJM_V10_IDX	0x7
 
-
 #define SND_DJM_CTL(_name, suffix, _default_value, _windex) { \
 	.name = _name, \
 	.options = snd_djm_opts_##suffix, \
@@ -3578,7 +3577,6 @@ static int snd_rme_digiface_controls_create(struct usb_mixer_interface *mixer)
 	.controls = snd_djm_ctls_##suffix, \
 	.ncontrols = ARRAY_SIZE(snd_djm_ctls_##suffix) }
 
-
 struct snd_djm_device {
 	const char *name;
 	const struct snd_djm_ctl *controls;
@@ -3724,7 +3722,6 @@ static const struct snd_djm_ctl snd_djm_ctls_250mk2[] = {
 	SND_DJM_CTL("Output 3 Playback Switch", 250mk2_pb3, 2, SND_DJM_WINDEX_PB)
 };
 
-
 // DJM-450
 static const u16 snd_djm_opts_450_cap1[] = {
 	0x0103, 0x0100, 0x0106, 0x0107, 0x0108, 0x0109, 0x010d, 0x010a };
@@ -3749,7 +3746,6 @@ static const struct snd_djm_ctl snd_djm_ctls_450[] = {
 	SND_DJM_CTL("Output 3 Playback Switch", 450_pb3, 2, SND_DJM_WINDEX_PB)
 };
 
-
 // DJM-750
 static const u16 snd_djm_opts_750_cap1[] = {
 	0x0101, 0x0103, 0x0106, 0x0107, 0x0108, 0x0109, 0x010a, 0x010f };
@@ -3768,7 +3764,6 @@ static const struct snd_djm_ctl snd_djm_ctls_750[] = {
 	SND_DJM_CTL("Input 4 Capture Switch", 750_cap4, 0, SND_DJM_WINDEX_CAP)
 };
 
-
 // DJM-850
 static const u16 snd_djm_opts_850_cap1[] = {
 	0x0100, 0x0103, 0x0106, 0x0107, 0x0108, 0x0109, 0x010a, 0x010f };
@@ -3787,7 +3782,6 @@ static const struct snd_djm_ctl snd_djm_ctls_850[] = {
 	SND_DJM_CTL("Input 4 Capture Switch", 850_cap4, 1, SND_DJM_WINDEX_CAP)
 };
 
-
 // DJM-900NXS2
 static const u16 snd_djm_opts_900nxs2_cap1[] = {
 	0x0100, 0x0102, 0x0103, 0x0106, 0x0107, 0x0108, 0x0109, 0x010a };
@@ -3825,7 +3819,6 @@ static const u16 snd_djm_opts_750mk2_pb1[] = { 0x0100, 0x0101, 0x0104 };
 static const u16 snd_djm_opts_750mk2_pb2[] = { 0x0200, 0x0201, 0x0204 };
 static const u16 snd_djm_opts_750mk2_pb3[] = { 0x0300, 0x0301, 0x0304 };
 
-
 static const struct snd_djm_ctl snd_djm_ctls_750mk2[] = {
 	SND_DJM_CTL("Master Input Level Capture Switch", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
 	SND_DJM_CTL("Input 1 Capture Switch",   750mk2_cap1, 2, SND_DJM_WINDEX_CAP),
@@ -3838,7 +3831,6 @@ static const struct snd_djm_ctl snd_djm_ctls_750mk2[] = {
 	SND_DJM_CTL("Output 3 Playback Switch", 750mk2_pb3, 2, SND_DJM_WINDEX_PB)
 };
 
-
 // DJM-A9
 static const u16 snd_djm_opts_a9_cap_level[] = {
 	0x0000, 0x0100, 0x0200, 0x0300, 0x0400, 0x0500 };
@@ -3867,29 +3859,35 @@ static const struct snd_djm_ctl snd_djm_ctls_a9[] = {
 static const u16 snd_djm_opts_v10_cap_level[] = {
 	0x0000, 0x0100, 0x0200, 0x0300, 0x0400, 0x0500
 };
+
 static const u16 snd_djm_opts_v10_cap1[] = {
 	0x0103,
 	0x0100, 0x0102, 0x0106, 0x0110, 0x0107,
 	0x0108, 0x0109, 0x010a, 0x0121, 0x0122
 };
+
 static const u16 snd_djm_opts_v10_cap2[] = {
 	0x0200, 0x0202, 0x0206, 0x0210, 0x0207,
 	0x0208, 0x0209, 0x020a, 0x0221, 0x0222
 };
+
 static const u16 snd_djm_opts_v10_cap3[] = {
 	0x0303,
 	0x0300, 0x0302, 0x0306, 0x0310, 0x0307,
 	0x0308, 0x0309, 0x030a, 0x0321, 0x0322
 };
+
 static const u16 snd_djm_opts_v10_cap4[] = {
 	0x0403,
 	0x0400, 0x0402, 0x0406, 0x0410, 0x0407,
 	0x0408, 0x0409, 0x040a, 0x0421, 0x0422
 };
+
 static const u16 snd_djm_opts_v10_cap5[] = {
 	0x0500, 0x0502, 0x0506, 0x0510, 0x0507,
 	0x0508, 0x0509, 0x050a, 0x0521, 0x0522
 };
+
 static const u16 snd_djm_opts_v10_cap6[] = {
 	0x0603,
 	0x0600, 0x0602, 0x0606, 0x0610, 0x0607,
@@ -3918,7 +3916,6 @@ static const struct snd_djm_device snd_djm_devices[] = {
 	[SND_DJM_V10_IDX] = SND_DJM_DEVICE(v10),
 };
 
-
 static int snd_djm_controls_info(struct snd_kcontrol *kctl,
 				 struct snd_ctl_elem_info *info)
 {
@@ -4356,4 +4353,3 @@ void snd_usb_mixer_fu_apply_quirk(struct usb_mixer_interface *mixer,
 	    (cval->control == UAC_FU_MUTE || cval->control == UAC_FU_VOLUME))
 		snd_fix_plt_name(mixer->chip, &kctl->id);
 }
-

-- 
2.49.0

