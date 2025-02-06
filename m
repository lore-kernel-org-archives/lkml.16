Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACEC236A81;
	Thu,  6 Feb 2025 16:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738859533; cv=none; b=WmsveiaUYeNhbIPXE8Zram1f5UousyYUHjUYM4SdH2+F396wxCGzu9OoBzKPMbxvCGYamHIDfeCNk1cj1ZKI5x9jENmjxfO062dbA2TiOqNibEIkCc14KJe7pqPcOx7DvQiOSC/kKBiZxsyiUZbGkGcQGe2zjyDz6XnZlJXIi9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738859533; c=relaxed/simple;
	bh=e2Gkb6kxm01Sbt508lQrlNCJRG4V3ju0OAt93agiUbs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QQHb/CsIK4nEQj4x1ZGwM8CGEX5IjP0G+4flcw9gv0EMJK5d//J9tEj7Xd/fm9K6AB5kAKSe8DABSzxSL0xGBycttBbL76zMpZrFZoX9jBAEv/8/9mlE8E3fEl3b34YtxrOF/nOjJ15CTHcV9+sT6h0EbmCA10sfxMRXgWmIbO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=0MrKyL1u; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="0MrKyL1u"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id F38D81FA97;
	Thu,  6 Feb 2025 17:32:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1738859528;
	bh=arFmatuJa82qP48/8w3Z6YT78OJ5e5wH4+NCkf77kB8=; h=From:To:Subject;
	b=0MrKyL1upHmnHKNJgYB/0iiNVe7gY96eiX1JBXeyzntzOugpPBGCOzWVK3ZWPPkWL
	 B08CyfbT16tFSm5qY9JMRUKNCPaYEz6FnJs9Ib+h68GUjnJADYox9pMWPmB8Iumzes
	 U7abprShtVsoQ4bz2T3I1uRY48oOoyn07XdmCWRUO+iyKDrWrMCaJukhSFSngnzUtA
	 Z7rthjiPE3RQ6VVq0U3hSXNwxGeGt6QdcwTBQLgYpC88+xa7zaLv1yTplpxr19p8GC
	 QgwNAkMkDYtJSy9wGbbI7g/81JcBZLfCUyrxcyU4zQ4DFjrQ5GfYLDRplP+4PbBCti
	 U9MSl/JX6qnhg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 5/5] ASoC: wm8904: add DMIC support
Date: Thu,  6 Feb 2025 17:31:52 +0100
Message-Id: <20250206163152.423199-6-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250206163152.423199-1-francesco@dolcini.it>
References: <20250206163152.423199-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The WM8904 codec supports both ADC and DMIC inputs.

Get input pin functionality from the platform data and add the necessary
controls depending on the possible additional routing.

The ADC and DMIC share the IN1L/DMICDAT1 and IN1R/DMICDAT2 pins.

When both are connected to an analog input, only the ADC is used. When
both are connected to a DMIC, only the DMIC is used, and a mux is added
to select the DMIC source. When one line is a DMIC and the other an
analog input, the DMIC source is set from the platform data and a mux is
added to select whether to use the ADC or DMIC.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 sound/soc/codecs/wm8904.c | 82 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 899ef6679f7e..a024cfc136c3 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -844,6 +844,26 @@ static int out_pga_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static const char * const dmic_text[] = {
+	"DMIC1", "DMIC2"
+};
+
+static SOC_ENUM_SINGLE_DECL(dmic_enum, WM8904_DIGITAL_MICROPHONE_0,
+			    WM8904_DMIC_SRC_SHIFT, dmic_text);
+
+static const struct snd_kcontrol_new dmic_mux =
+	SOC_DAPM_ENUM("DMIC Mux", dmic_enum);
+
+static const char * const cin_text[] = {
+	"ADC", "DMIC"
+};
+
+static SOC_ENUM_SINGLE_DECL(cin_enum, WM8904_DIGITAL_MICROPHONE_0,
+			    WM8904_DMIC_ENA_SHIFT, cin_text);
+
+static const struct snd_kcontrol_new cin_mux =
+	SOC_DAPM_ENUM("Capture Input", cin_enum);
+
 static const char *input_mode_text[] = {
 	"Single-Ended", "Differential Line", "Differential Mic"
 };
@@ -963,6 +983,15 @@ SND_SOC_DAPM_AIF_OUT("AIFOUTL", "Capture", 0, SND_SOC_NOPM, 0, 0),
 SND_SOC_DAPM_AIF_OUT("AIFOUTR", "Capture", 1, SND_SOC_NOPM, 0, 0),
 };
 
+static const struct snd_soc_dapm_widget wm8904_dmic_dapm_widgets[] = {
+SND_SOC_DAPM_MUX("DMIC Mux", SND_SOC_NOPM, 0, 0, &dmic_mux),
+};
+
+static const struct snd_soc_dapm_widget wm8904_cin_dapm_widgets[] = {
+SND_SOC_DAPM_MUX("Left Capture Input", SND_SOC_NOPM, 0, 0, &cin_mux),
+SND_SOC_DAPM_MUX("Right Capture Input", SND_SOC_NOPM, 0, 0, &cin_mux),
+};
+
 static const struct snd_soc_dapm_widget wm8904_dac_dapm_widgets[] = {
 SND_SOC_DAPM_AIF_IN("AIFINL", "Playback", 0, SND_SOC_NOPM, 0, 0),
 SND_SOC_DAPM_AIF_IN("AIFINR", "Playback", 1, SND_SOC_NOPM, 0, 0),
@@ -1107,6 +1136,24 @@ static const struct snd_soc_dapm_route adc_intercon[] = {
 	{ "ADCR", NULL, "Right Capture PGA" },
 };
 
+static const struct snd_soc_dapm_route dmic_intercon[] = {
+	{ "DMIC Mux", "DMIC1", "IN1L" },
+	{ "DMIC Mux", "DMIC2", "IN1R" },
+
+	{ "ADCL", NULL, "DMIC Mux" },
+	{ "ADCR", NULL, "DMIC Mux" },
+};
+
+static const struct snd_soc_dapm_route cin_intercon[] = {
+	{ "Left Capture Input", "ADC", "Left Capture PGA" },
+	{ "Left Capture Input", "DMIC", "IN1L" },
+	{ "Right Capture Input", "ADC", "Right Capture PGA" },
+	{ "Right Capture Input", "DMIC", "IN1R" },
+
+	{ "ADCL", NULL, "Left Capture Input" },
+	{ "ADCR", NULL, "Right Capture Input" },
+};
+
 static const struct snd_soc_dapm_route dac_intercon[] = {
 	{ "DACL Mux", "Left", "AIFINL" },
 	{ "DACL Mux", "Right", "AIFINR" },
@@ -2052,6 +2099,7 @@ static void wm8904_handle_retune_mobile_pdata(struct snd_soc_component *componen
 
 static void wm8904_handle_pdata(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct wm8904_priv *wm8904 = snd_soc_component_get_drvdata(component);
 	struct wm8904_pdata *pdata = wm8904->pdata;
 	int ret, i;
@@ -2062,6 +2110,35 @@ static void wm8904_handle_pdata(struct snd_soc_component *component)
 		return;
 	}
 
+	if (pdata->in1l_as_dmicdat1 && pdata->in1r_as_dmicdat2) {
+		dev_dbg(component->dev, "Activating DMICDAT1 and DMICDAT2\n");
+		snd_soc_component_update_bits(component, WM8904_DIGITAL_MICROPHONE_0,
+					      WM8904_DMIC_ENA_MASK,
+					      1 << WM8904_DMIC_ENA_SHIFT);
+
+		/* Need a control and routing to switch between DMIC1 and 2 */
+		snd_soc_dapm_new_controls(dapm, wm8904_dmic_dapm_widgets,
+					  ARRAY_SIZE(wm8904_dmic_dapm_widgets));
+		snd_soc_dapm_add_routes(dapm, dmic_intercon,
+					ARRAY_SIZE(dmic_intercon));
+	} else if (pdata->in1l_as_dmicdat1 || pdata->in1r_as_dmicdat2) {
+		unsigned int dmic_src = pdata->in1l_as_dmicdat1 ? 0 : 1;
+
+		dev_dbg(component->dev, "DMIC_SRC (0 or 1): %d\n", dmic_src);
+		snd_soc_component_update_bits(component, WM8904_DIGITAL_MICROPHONE_0,
+					      WM8904_DMIC_SRC_MASK,
+					      dmic_src << WM8904_DMIC_SRC_SHIFT);
+
+		/* Need a control and routing to switch between DMIC and ADC */
+		snd_soc_dapm_new_controls(dapm, wm8904_cin_dapm_widgets,
+					  ARRAY_SIZE(wm8904_cin_dapm_widgets));
+		snd_soc_dapm_add_routes(dapm, cin_intercon,
+					ARRAY_SIZE(cin_intercon));
+	} else {
+		snd_soc_component_update_bits(component, WM8904_DIGITAL_MICROPHONE_0,
+					      WM8904_DMIC_ENA_MASK, 0);
+	}
+
 	dev_dbg(component->dev, "%d DRC configurations\n", pdata->num_drc_cfgs);
 
 	if (pdata->num_drc_cfgs) {
@@ -2117,10 +2194,11 @@ static int wm8904_probe(struct snd_soc_component *component)
 		return -EINVAL;
 	}
 
-	wm8904_handle_pdata(component);
-
 	wm8904_add_widgets(component);
 
+	/* This can add dependent widgets, so it is done after add_widgets */
+	wm8904_handle_pdata(component);
+
 	return 0;
 }
 
-- 
2.39.5

