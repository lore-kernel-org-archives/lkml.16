Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792FF1DE4DC;
	Sat,  5 Apr 2025 23:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894979; cv=none; b=GXmTDtrqSpyzgjXXD6CCi7Abuvxdkxwzf3Yefgy1eP3zBYooQ92g9a4TNr/Eer8vnolsJ0d9ASCvlv8DlXGSWFzAf5YtSGXevfA3jy2kqrZ/dEp4FJiSidIHvfUm5xwlUxVvYlPjPkwcUw13IucVYmE67kLtNaH2MPDJlkqq9fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894979; c=relaxed/simple;
	bh=XXV0remiboIC8vT/YM3SXXEpSLWra8NHMrXB3bAOdSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N0NKoe9RsTM0+u9+yJKobMcgbVYk3yHEXa/cpk6k2vhVp85zefQksdsJgVJprUkDxv/qq8QrAdKotvFzXO5ERITbpiiIKItJ7iUFAZ8XI+AudLNXoUDIyEOhYsW69Gok3IO4QxZdO9S/P38CYiC3/j9/3/YGNoxICV1cV1aJw70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeJm+CxQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeJm+CxQ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-225477548e1so29965715ad.0;
        Sat, 05 Apr 2025 16:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743894977; x=1744499777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHqAHfmXNcrBiUX48Wdw61sXBWXoE7oTU9Eeqw/vr3c=;
        b=ZeJm+CxQo5Dx2UR0JKlbwJ6XkoXIyykwSnNB23Lwp/K63nNMDdRFbse/up9oY7R3+s
         bDsGWiuEYEE6vL/bh2erBDNGmSAkgtHfLeN+c7Egw/vjLxH6HlkBfdZIltwXL253oLfL
         OnknUmU4iotWRTuPaajoPC5JAo+IJPz7chB1iPeH21I/Obpw4Psw3ZgndOxa45JxhMHH
         mPeerNnS2vgB+7m0kzgZuEASn8R+Nuu7bWy9dG8bvQNAFU9v7FfE/e1dI3fwsOtpP6ly
         0PRpmdTzmz5+KmPS/gikaRrJQQS10cltIkQi4VUU+XY8qovUkVvt6Cm6iuLaef+LnPaj
         d7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743894977; x=1744499777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHqAHfmXNcrBiUX48Wdw61sXBWXoE7oTU9Eeqw/vr3c=;
        b=rQ3oGNP7hK06tWYKdZRzOghotUhqVAUqVG9LUhNeV9oeBdTOZ1kwemjNg7pC19Bl06
         DnEXv1UWdTn/bNMsiDw3i3ClVPVC1k5ZbishKotW4PK/wGlm8VTK1aLTGcbqlzFFzZE7
         VS8FZ5EV6E82LUfzl6N8LFYOmfKv8DrTIGCi78DeO0Brc/bQEOGSTdKhh00aenVx+tGH
         QaTRQlw+aewfVlFCko8svESlpAH2LVAHVSsPfLh80hOtJSTCQ1tZ0Upcdsd1hCqydpZt
         epZDieiNaj9/RYAAbjl6SXO4pc9Qd0nKPjKdscxCyGp0n6FIlLRbDDq8o50Rgs2omYSh
         iBvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2q58DdLydJDro1jUhBhLVh/l0Pv4I/pKm3z2QYtUBbq5QB5TsKl09wYBcTFDsJzb/RndVkhnQzGdjNfg=@vger.kernel.org, AJvYcCUBK6yBUeCU5Ru/y61xySMdqyNthsDcjjda0Q/fJ3Op4Y26b+k0+lIlQPLoau+sm4nSTq35kJhDasns/j8z@vger.kernel.org, AJvYcCV7fBVuZbCI4L3Squml/bm0TzwFDcwcbS6RDYd1CvTVVUtW5cuNVgxmvT75SYLg0X76qDAQUJWQ7bsH@vger.kernel.org, AJvYcCXrXVA+nO0DZ42j6ll3fLoRoCiotTVyswu+J/2oCN/vf4tzj29TWX3Y2hX/DXyD8Z3qtkH2Wznwx4n9bj4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+h91siSzLSwjfjK9hH5mr4mSnVH3SwdNwWZTs0jpYwsn3X+QF
	7otCUbQ+mU4nnnTm1UYlzQj0yUHF/UGrjZMi7HfnRSa3qvL4Nt9v
X-Gm-Gg: ASbGncsL9Jygpv1/WgreL6ZWJGCBdJTjGq5cQu/o21zWcWz/NXUdAyJaXZVxB2WHXMW
	BeBHpCpkicoqy+9DjGT9AFtah9jOk4P0kFE0TS0avVAjqQVPI3lk6LpKtfeGpB0xoO39zmrP7z0
	AP8I1tN92H9MCF6pqYabedEnrm6RXDeVfGxAJuI7DV9cHwKJKDgydpulg6C9ht1I5pmv7EqAlgL
	RLDhTZfrwJ124+L0GBMkhmblyE21PNOri1Rbe/jSCvX9hfk6vJMBy3G3zld2h5AjlL+GeRS8J61
	b9iIDi9OOqEK/DpsEqV0c52/2jBWymGDJ/3kDD07q62CuQNvbg84nPP+0xdS2xyV0jxHl/6lSeG
	6XKJN4UVl+BFoiUO1K/xfw4mLaNImBncyZ5WOtVI=
X-Google-Smtp-Source: AGHT+IHzW/mEX3whjkwPsQueexYlvcirJnhXqeAaYH9+txAPgZ2hsFsVnFWAoyuWrrUtE4gQMK6Rdw==
X-Received: by 2002:a17:902:f690:b0:220:c34c:5760 with SMTP id d9443c01a7336-22a8a8e4508mr99504385ad.51.1743894976729;
        Sat, 05 Apr 2025 16:16:16 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c994esm55048345ad.102.2025.04.05.16.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 16:16:16 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 06 Apr 2025 09:15:10 +1000
Subject: [PATCH v5 6/8] ASoC: tas2764: Apply Apple quirks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250406-apple-codec-changes-v5-6-50a00ec850a3@gmail.com>
References: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
In-Reply-To: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9009;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=qZEzaa+3EpSBuiO12afRrJd3nOAchCfoa8/x3EZzfv0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfd3a5Hd5UlBPmKLMn9fjPK4Z7n51+90xG9OZKlYPnR
 WMXHRFR7yhlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAiEQKMDHcafj3l0+7w43ad
 67duuxbHtIwkmaVbX5bOWL3Q5PHph00Mf7jnLdgw9VS5ycIGibUJ1eFrGy72SZfnPLQ2cTvtW+7
 sxwUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Apple's SN012776 driver has some peculiar aspects to its behavior that
are suspected to work around issues in the codec part. Add a module
parameter for enabling individual quirks that should be imitated after
the Apple driver.

Setting some of these by default seems to be required. For example,
setting 0xf fixes an issue with transient overcurrent errors which
can crash the chip until the next system reboot. To be safe, let's
enable all of them by default.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764-quirks.h | 180 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.c        |  39 ++++++
 2 files changed, 219 insertions(+)

diff --git a/sound/soc/codecs/tas2764-quirks.h b/sound/soc/codecs/tas2764-quirks.h
new file mode 100644
index 0000000000000000000000000000000000000000..7a62b3ba5b40b3f06fc1ebeb590d9c32b1b2c7d3
--- /dev/null
+++ b/sound/soc/codecs/tas2764-quirks.h
@@ -0,0 +1,180 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __TAS2764_QUIRKS__
+#define __TAS2764_QUIRKS__
+
+#include <linux/regmap.h>
+
+#include "tas2764.h"
+
+/* Bitmask of enabled Apple quirks */
+#define ENABLED_APPLE_QUIRKS	0x3f
+
+/*
+ * Disable noise gate and flip down reserved bit in NS_CFG0
+ */
+#define TAS2764_NOISE_GATE_DISABLE	BIT(0)
+
+static const struct reg_sequence tas2764_noise_gate_dis_seq[] = {
+	REG_SEQ0(TAS2764_REG(0x0, 0x35), 0xb0)
+};
+
+/*
+ * CONV_VBAT_PVDD_MODE=1
+ */
+#define TAS2764_CONV_VBAT_PVDD_MODE	BIT(1)
+
+static const struct reg_sequence tas2764_conv_vbat_pvdd_mode_seq[] = {
+	REG_SEQ0(TAS2764_REG(0x0, 0x6b), 0x41)
+};
+
+/*
+ * Reset of DAC modulator when DSP is OFF
+ */
+#define TAS2764_DMOD_RST		BIT(2)
+
+static const struct reg_sequence tas2764_dmod_rst_seq[] = {
+	REG_SEQ0(TAS2764_REG(0x0, 0x76), 0x0)
+};
+
+/*
+ * Unknown 0x133/0x137 writes (maybe TDM related)
+ */
+#define TAS2764_UNK_SEQ0		BIT(3)
+
+static const struct reg_sequence tas2764_unk_seq0[] = {
+	REG_SEQ0(TAS2764_REG(0x1, 0x33), 0x80),
+	REG_SEQ0(TAS2764_REG(0x1, 0x37), 0x3a),
+};
+
+/*
+ * Unknown 0x614 - 0x61f writes
+ */
+#define TAS2764_APPLE_UNK_SEQ1		BIT(4)
+
+static const struct reg_sequence tas2764_unk_seq1[] = {
+	REG_SEQ0(TAS2764_REG(0x6, 0x14), 0x0),
+	REG_SEQ0(TAS2764_REG(0x6, 0x15), 0x13),
+	REG_SEQ0(TAS2764_REG(0x6, 0x16), 0x52),
+	REG_SEQ0(TAS2764_REG(0x6, 0x17), 0x0),
+	REG_SEQ0(TAS2764_REG(0x6, 0x18), 0xe4),
+	REG_SEQ0(TAS2764_REG(0x6, 0x19), 0xc),
+	REG_SEQ0(TAS2764_REG(0x6, 0x16), 0xaa),
+	REG_SEQ0(TAS2764_REG(0x6, 0x1b), 0x0),
+	REG_SEQ0(TAS2764_REG(0x6, 0x1c), 0x12),
+	REG_SEQ0(TAS2764_REG(0x6, 0x1d), 0xa0),
+	REG_SEQ0(TAS2764_REG(0x6, 0x1e), 0xd8),
+	REG_SEQ0(TAS2764_REG(0x6, 0x1f), 0x0),
+};
+
+/*
+ * Unknown writes in the 0xfd page (with secondary paging inside)
+ */
+#define TAS2764_APPLE_UNK_SEQ2		BIT(5)
+
+static const struct reg_sequence tas2764_unk_seq2[] = {
+	REG_SEQ0(TAS2764_REG(0xfd, 0x0d), 0xd),
+	REG_SEQ0(TAS2764_REG(0xfd, 0x6c), 0x2),
+	REG_SEQ0(TAS2764_REG(0xfd, 0x6d), 0xf),
+	REG_SEQ0(TAS2764_REG(0xfd, 0x0d), 0x0),
+};
+
+/*
+ * Disable 'Thermal Threshold 1'
+ */
+#define TAS2764_THERMAL_TH1_DISABLE	BIT(6)
+
+static const struct reg_sequence tas2764_thermal_th1_dis_seq[] = {
+	REG_SEQ0(TAS2764_REG(0x1, 0x47), 0x2),
+};
+
+/*
+ * Imitate Apple's shutdown dance
+ */
+#define TAS2764_SHUTDOWN_DANCE		BIT(7)
+
+static const struct reg_sequence tas2764_shutdown_dance_init_seq[] = {
+	/*
+	 * SDZ_MODE=01 (immediate)
+	 *
+	 * We want the shutdown to happen under the influence of
+	 * the magic writes in the 0xfdXX region, so make sure
+	 * the shutdown is immediate and there's no grace period
+	 * followed by the codec part.
+	 */
+	REG_SEQ0(TAS2764_REG(0x0, 0x7), 0x60),
+};
+
+static const struct reg_sequence tas2764_pre_shutdown_seq[] = {
+	REG_SEQ0(TAS2764_REG(0xfd, 0x0d), 0xd), /* switch hidden page */
+	REG_SEQ0(TAS2764_REG(0xfd, 0x64), 0x4), /* do write (unknown semantics) */
+	REG_SEQ0(TAS2764_REG(0xfd, 0x0d), 0x0), /* switch hidden page back */
+};
+
+static const struct reg_sequence tas2764_post_shutdown_seq[] = {
+	REG_SEQ0(TAS2764_REG(0xfd, 0x0d), 0xd),
+	REG_SEQ0(TAS2764_REG(0xfd, 0x64), 0x0), /* revert write from pre sequence */
+	REG_SEQ0(TAS2764_REG(0xfd, 0x0d), 0x0),
+};
+
+static int tas2764_do_quirky_pwr_ctrl_change(struct tas2764_priv *tas2764,
+					     unsigned int target)
+{
+	unsigned int curr;
+	int ret;
+
+	curr = snd_soc_component_read_field(tas2764->component,
+					       TAS2764_PWR_CTRL,
+					       TAS2764_PWR_CTRL_MASK);
+
+	if (target == curr)
+		return 0;
+
+	/* Handle power state transition to shutdown */
+	if (target == TAS2764_PWR_CTRL_SHUTDOWN &&
+	   (curr == TAS2764_PWR_CTRL_MUTE || curr == TAS2764_PWR_CTRL_ACTIVE)) {
+		ret = regmap_multi_reg_write(tas2764->regmap, tas2764_pre_shutdown_seq,
+					ARRAY_SIZE(tas2764_pre_shutdown_seq));
+		if (!ret)
+			ret = snd_soc_component_update_bits(tas2764->component,
+							TAS2764_PWR_CTRL,
+							TAS2764_PWR_CTRL_MASK,
+							TAS2764_PWR_CTRL_SHUTDOWN);
+		if (!ret)
+			ret = regmap_multi_reg_write(tas2764->regmap,
+						tas2764_post_shutdown_seq,
+						ARRAY_SIZE(tas2764_post_shutdown_seq));
+	}
+
+	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_PWR_CTRL,
+						    TAS2764_PWR_CTRL_MASK, target);
+
+	return ret;
+}
+
+/*
+ * Via devicetree (TODO):
+ *  - switch from spread spectrum to class-D switching
+ *  - disable edge control
+ *  - set BOP settings (the BOP config bits *and* BOP_SRC)
+ */
+
+/*
+ * Other setup TODOs:
+ *  - DVC ramp rate
+ */
+
+static const struct tas2764_quirk_init_sequence {
+	const struct reg_sequence *seq;
+	int len;
+} tas2764_quirk_init_sequences[] = {
+	{ tas2764_noise_gate_dis_seq, ARRAY_SIZE(tas2764_noise_gate_dis_seq) },
+	{ tas2764_dmod_rst_seq, ARRAY_SIZE(tas2764_dmod_rst_seq) },
+	{ tas2764_conv_vbat_pvdd_mode_seq, ARRAY_SIZE(tas2764_conv_vbat_pvdd_mode_seq) },
+	{ tas2764_unk_seq0, ARRAY_SIZE(tas2764_unk_seq0) },
+	{ tas2764_unk_seq1, ARRAY_SIZE(tas2764_unk_seq1) },
+	{ tas2764_unk_seq2, ARRAY_SIZE(tas2764_unk_seq2) },
+	{ tas2764_thermal_th1_dis_seq, ARRAY_SIZE(tas2764_thermal_th1_dis_seq) },
+	{ tas2764_shutdown_dance_init_seq, ARRAY_SIZE(tas2764_shutdown_dance_init_seq) },
+};
+
+#endif /* __TAS2764_QUIRKS__ */
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 718107fce3bcf6ef081f6fced7b89c708518b1a5..21c38b2394b71ef7d05b4c2e781fdf73926fec5b 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -45,6 +45,8 @@ struct tas2764_priv {
 	bool unmuted;
 };
 
+#include "tas2764-quirks.h"
+
 static const char *tas2764_int_ltch0_msgs[8] = {
 	"fault: over temperature", /* INT_LTCH0 & BIT(0) */
 	"fault: over current",
@@ -122,6 +124,9 @@ static int tas2764_update_pwr_ctrl(struct tas2764_priv *tas2764)
 	else
 		val = TAS2764_PWR_CTRL_SHUTDOWN;
 
+	if (ENABLED_APPLE_QUIRKS & TAS2764_SHUTDOWN_DANCE)
+		return tas2764_do_quirky_pwr_ctrl_change(tas2764, val);
+
 	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
 					    TAS2764_PWR_CTRL_MASK, val);
 	if (ret < 0)
@@ -548,6 +553,30 @@ static uint8_t sn012776_bop_presets[] = {
 
 static const struct regmap_config tas2764_i2c_regmap;
 
+static int tas2764_apply_init_quirks(struct tas2764_priv *tas2764)
+{
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(tas2764_quirk_init_sequences); i++) {
+		const struct tas2764_quirk_init_sequence *init_seq =
+						&tas2764_quirk_init_sequences[i];
+
+		if (!init_seq->seq)
+			continue;
+
+		if (!(BIT(i) & ENABLED_APPLE_QUIRKS))
+			continue;
+
+		ret = regmap_multi_reg_write(tas2764->regmap, init_seq->seq,
+					     init_seq->len);
+
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
@@ -617,6 +646,13 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 			if (ret < 0)
 				return ret;
 		}
+
+		/* Apply all enabled Apple quirks */
+		ret = tas2764_apply_init_quirks(tas2764);
+
+		if (ret < 0)
+			return ret;
+
 		break;
 	default:
 		break;
@@ -701,6 +737,9 @@ static bool tas2764_volatile_register(struct device *dev, unsigned int reg)
 	case TAS2764_INT_LTCH0 ... TAS2764_INT_LTCH4:
 	case TAS2764_INT_CLK_CFG:
 		return true;
+	case TAS2764_REG(0xf0, 0x0) ... TAS2764_REG(0xff, 0x0):
+		/* TI's undocumented registers for the application of quirks */
+		return true;
 	default:
 		return false;
 	}

-- 
2.49.0

