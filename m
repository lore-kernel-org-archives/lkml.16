Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE5523E35E
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344166; cv=none; b=O78V2PklTXUBWVILYyscPL0ZSTDmZ1MtBNJFDPQIzgDDU3i8+LLieJgNIXo3qPFulHFupfd3/qOISTKvXUJzztxP443Wh7B2LnuqyyDawiALzFeqmnT+PyEGH/VqIT6SdKRzBbn9IJWHfU7b2ARyE3iRJbXFj0t+x4WPZGqrphc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344166; c=relaxed/simple;
	bh=4fBzg0IECeatk98Un140p9pZO2EoxDTUIPqXK4PDwEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A55QA76qJ9OlE7po/7fgNIeIX//3VdFf4jml1kC2vq2eZIjVa09ctFv6h92e7oLYdjF22ZlfCS/3D3bfs9MVyxQmduBRo8MQoojzBcZHCmTG3TNzd0/MN1q/3CvTGH/hDA6uvWGq265meZaI6IPh/CydUDPfPhzAvXxhm8Jv9cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org; spf=fail smtp.mailfrom=openpixelsystems.org; dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b=bwB6wZW2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b="bwB6wZW2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-440685d6afcso40259855e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1748344161; x=1748948961; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iSn8HwNeIB4B6ODebFHk5PWqwMtncqzsIsvepp5c0us=;
        b=bwB6wZW2cqVhztAWwrNbx7pvDvIJZx0P503aLg/WjxTJRViE0tmxp89SHQhqJwmyzF
         a0nzMaolNfqEOoDJxqlYMEVyuIxYDeHq7jqgpPvkCcg131DN5PAjnUFvoolpV1BDn1Bj
         RXvwFglcdZbemPUQ00wGpcfLDwE7Cr39t3wH1ojaZLM3CrjPH9gvQxcGdDTccZZzcvcY
         EUrfjrNoui0CDWiVBY2qtScVsm97GsuOPEOS4/AnkrjEUNagbJjPdcY39e2s4cTAnLT0
         So47fyeLlG1psFRSopjLP2jVwUYGb/RAE23G3kbJ7sT5ZThqRWEfs8mHJtqgdOfyueOn
         engw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748344161; x=1748948961;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSn8HwNeIB4B6ODebFHk5PWqwMtncqzsIsvepp5c0us=;
        b=LmQBzn0pnLn8ljHuV5IcXvQQZqorFvOvCQne8b9hGIQRa8Wsrd5SYIAu+7wjWU2q4b
         aNI4vO3ugHYKx/9n5KSmFzSe+z26iMS2spN3EDimYX4pQ5qD8dRFO9WLj8Q9XpQ2dzK/
         pT/BCnr2EQHKg7Wus6gmWly4TRjWM/1gXa1j7v6uAhE76kBE3yhcYZYo4KKJ3pouaN41
         Ytn+HmujXRkfQNMZknn5x6k8Wujple8oJS678tRZ0edsw7kBtzvSsi51kI58NlKVhMqm
         KCTTZHM4Itab2Mm2gwn/CZJYdjpLr8SN6oFHYIy9NpN6gN/ZCngMicitlKv8torAPCuS
         hBiw==
X-Forwarded-Encrypted: i=1; AJvYcCXXtg+87hYjI5lZO+FmPBRHmKw7ioVatZQoS86HTNfgSl1NvD0id4zn1V3AN+bV2JhGvFCes6CmAE+ONe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjOgSICsadlpujLQu9morQCZKuyQ7rFe560Zv7/4qTmLCL7Y1N
	20WdgRgRoxmFodoR4bGD4Mtu1nKQ0YPM3PJL73QSmiV3lQED82pXlRD3/E7VSkDfl58=
X-Gm-Gg: ASbGncudj4UUrp4ItoShuWEJqzc1hpzKPI/FRUtb9V+61z6zeYCnL/dwNDu0Dd1vQk9
	KfWQmv4GdrT0rekI5t4hYDtHcamIuHYIPDAHYZ71IDNPI8muyxgslei6BRYpYi01gRPJgoWz+OZ
	iD0vFxajvSUOx73LXCrzTprrMB3W0Fe04qL4CdKfJhexCUsxt+9VIlhGYZT0Qm9lpEnHS5Cjqej
	gsBZZahRIkAl5iDYyFPY5E6l0FAdewjWzAG6LCveBiBI6a5PfLHltroX0+abyUW9Pfo51Dh3To8
	ZZ/2mvhHJMsQztcAEKMdMDzk/m4PB4C7PCSM/5ntkflZCHDjesQnb9WSO5qwXLRLqq2PXPnUeDt
	fytFMrWXyXj0ZMqdiZPCm8fHqjOO139BWE/rMtwX/Yt8=
X-Google-Smtp-Source: AGHT+IH4onwpn19mRvTfN2dRUOSQu6PABo0ta6MzwHwqf013Fr01WgZBUk8t5KUHN/34+a552MAetg==
X-Received: by 2002:a05:600c:3d8e:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-44c95aada01mr121881555e9.30.1748344161332;
        Tue, 27 May 2025 04:09:21 -0700 (PDT)
Received: from [10.0.12.41] (253.124-78-194.adsl-static.isp.belgacom.be. [194.78.124.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29672sm277655525e9.3.2025.05.27.04.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:09:20 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Date: Tue, 27 May 2025 13:08:49 +0200
Subject: [PATCH] ASoC: tas571x: add separate tas5733 controls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-tas5733-biquad-fix-v1-1-0d3d941700bb@openpixelsystems.org>
X-B4-Tracking: v=1; b=H4sIAECdNWgC/x2MywqAIBAAfyX23IIpovUr0WHLrfbSQyuC6N+Tj
 jMw80DiKJygKR6IfEmSdclQlQUMMy0To4TMoJW2ymqHByXrjMFe9pMCjnKj0z3X3gdiGiGHW+S
 s/2nbve8HMUwID2QAAAA=
X-Change-ID: 20250527-tas5733-biquad-fix-72be988daeaf
To: Kevin Cernekee <cernekee@chromium.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 peter@korsgaard.com, Bram Vlerick <bram.vlerick@openpixelsystems.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6027;
 i=bram.vlerick@openpixelsystems.org; h=from:subject:message-id;
 bh=4fBzg0IECeatk98Un140p9pZO2EoxDTUIPqXK4PDwEw=;
 b=owEBbQKS/ZANAwAIAblauka9BQbwAcsmYgBoNZ1gv3LNjvsi39NE/rtK4BAMRI8THp67U75G/
 LmVlji8zIiJAjMEAAEIAB0WIQQO7PtG7b77XLxuay25WrpGvQUG8AUCaDWdYAAKCRC5WrpGvQUG
 8FooEAC2ysQve1IJBwRGNg2Py7gGSOEHzber4GrE2TVB3tJ8KbeSchO+C9tMTQ9gryz3cFaJ2/n
 B2J59oMlTVaG7rBUlZRf2oX2I+nnCHzkIKH86auXLs+cp1OABznjyEibKC6ZQCi1khTapUBrWbF
 caLOTiRf98Qh1MGn4UezuEevDi/Yc3OW4bPEpYvsM18Xkml1zgHsbfVs6CijJB3/OmIRLLHLsz9
 f0oB8ZiZYcKDG0PqjvK3qm/S1JdF+UAs9bwBnCSJszvb+9umD5JSgzb/Yz8nvKQIiOS2HOfkj1E
 QN+GmGHusiEiXuHcacYPX5u6dLVJy6IlZSZeY0M3RJ8rhHOOoCgq/K/3siNZA/ZlKzPwwV2KumM
 Qgph+o5A3GJMJnHw/9QakgJ/GMAtclhsmDdSnM7iBamfwlagsY7dFTYQ4EhwJywVI7DowMDPZRN
 8sWV1JPzGjTjBD48VgdPkp9/00FCyQvtRrayFjpX6TkfjJrMWr/JRFGgmoKYAQL/uebzxpz3jC3
 1cJ4eiWJk1OpzzW/coQPvYGflH2cI9u7clezZsyTFMZghu7/FZHL9FkMw162ffR20RJWs+xogXU
 XZd/cZvIVE0nA1nOd3xyHplg2LyxHUNVGjigOXcO1SWW7Sl0yKbLY65JVRLvsa2w7VjpLFwR+6E
 5jvIGl3lw6eCOKw==
X-Developer-Key: i=bram.vlerick@openpixelsystems.org; a=openpgp;
 fpr=0EECFB46EDBEFB5CBC6E6B2DB95ABA46BD0506F0

The controls between the tas5717 and tas5733 should not be shared since
the biquad and register setup is not identical. For example, writing to
0x5c on the tas5717 modifies ch2_bq[10] while on the tas5733 this is
ch1_cross_bq[3].

see https://www.ti.com/lit/ds/symlink/tas5733l.pdf and
https://www.ti.com/lit/ds/symlink/tas5717.pdf for more details on the
register maps.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 sound/soc/codecs/tas571x.c | 65 +++++++++++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/tas571x.h | 34 ++++++++++++++++++++++++
 2 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 6c6e7ae07d80eeeefd0fdf713e09ec097ccda6a0..00b131294547812f1406056d17e6c42ddf92003f 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -718,6 +718,69 @@ static const struct regmap_config tas5721_regmap_config = {
 	.volatile_table			= &tas571x_volatile_regs,
 };
 
+static const struct snd_kcontrol_new tas5733_controls[] = {
+	/* MVOL LSB is ignored - see comments in tas571x_i2c_probe() */
+	SOC_SINGLE_TLV("Master Volume",
+		       TAS571X_MVOL_REG, 1, 0x1ff, 1,
+		       tas5717_volume_tlv),
+	SOC_DOUBLE_R_TLV("Speaker Volume",
+			 TAS571X_CH1_VOL_REG, TAS571X_CH2_VOL_REG,
+			 1, 0x1ff, 1, tas5717_volume_tlv),
+	SOC_DOUBLE("Speaker Switch",
+		   TAS571X_SOFT_MUTE_REG,
+		   TAS571X_SOFT_MUTE_CH1_SHIFT, TAS571X_SOFT_MUTE_CH2_SHIFT,
+		   1, 1),
+
+	SOC_DOUBLE_R_RANGE("CH1 Mixer Volume",
+			   TAS5717_CH1_LEFT_CH_MIX_REG,
+			   TAS5717_CH1_RIGHT_CH_MIX_REG,
+			   16, 0, 0x80, 0),
+
+	SOC_DOUBLE_R_RANGE("CH2 Mixer Volume",
+			   TAS5717_CH2_LEFT_CH_MIX_REG,
+			   TAS5717_CH2_RIGHT_CH_MIX_REG,
+			   16, 0, 0x80, 0),
+
+	/*
+	 * The biquads are named according to the register names.
+	 * Please note that TI's TAS57xx Graphical Development Environment
+	 * tool names them different.
+	 */
+	BIQUAD_COEFS("CH1 - Biquad 0", TAS5733_CH1_BQ0_REG),
+	BIQUAD_COEFS("CH1 - Biquad 1", TAS5733_CH1_BQ1_REG),
+	BIQUAD_COEFS("CH1 - Biquad 2", TAS5733_CH1_BQ2_REG),
+	BIQUAD_COEFS("CH1 - Biquad 3", TAS5733_CH1_BQ3_REG),
+	BIQUAD_COEFS("CH1 - Biquad 4", TAS5733_CH1_BQ4_REG),
+	BIQUAD_COEFS("CH1 - Biquad 5", TAS5733_CH1_BQ5_REG),
+	BIQUAD_COEFS("CH1 - Biquad 6", TAS5733_CH1_BQ6_REG),
+	BIQUAD_COEFS("CH1 - Biquad 7", TAS5733_CH1_BQ7_REG),
+	BIQUAD_COEFS("CH1 - Biquad 8", TAS5733_CH1_BQ8_REG),
+	BIQUAD_COEFS("CH1 - Biquad 9", TAS5733_CH1_BQ9_REG),
+	BIQUAD_COEFS("CH1 - Biquad 10", TAS5733_CH1_BQ10_REG),
+
+	BIQUAD_COEFS("CH2 - Biquad 0", TAS5733_CH2_BQ0_REG),
+	BIQUAD_COEFS("CH2 - Biquad 1", TAS5733_CH2_BQ1_REG),
+	BIQUAD_COEFS("CH2 - Biquad 2", TAS5733_CH2_BQ2_REG),
+	BIQUAD_COEFS("CH2 - Biquad 3", TAS5733_CH2_BQ3_REG),
+	BIQUAD_COEFS("CH2 - Biquad 4", TAS5733_CH2_BQ4_REG),
+	BIQUAD_COEFS("CH2 - Biquad 5", TAS5733_CH2_BQ5_REG),
+	BIQUAD_COEFS("CH2 - Biquad 6", TAS5733_CH2_BQ6_REG),
+	BIQUAD_COEFS("CH2 - Biquad 7", TAS5733_CH2_BQ7_REG),
+	BIQUAD_COEFS("CH2 - Biquad 8", TAS5733_CH2_BQ8_REG),
+	BIQUAD_COEFS("CH2 - Biquad 9", TAS5733_CH2_BQ9_REG),
+	BIQUAD_COEFS("CH2 - Biquad 10", TAS5733_CH2_BQ10_REG),
+
+	BIQUAD_COEFS("CH1 - Cross Biquad 0", TAS5733_CH1_CBQ0_REG),
+	BIQUAD_COEFS("CH1 - Cross Biquad 1", TAS5733_CH1_CBQ1_REG),
+	BIQUAD_COEFS("CH1 - Cross Biquad 2", TAS5733_CH1_CBQ2_REG),
+	BIQUAD_COEFS("CH1 - Cross Biquad 3", TAS5733_CH1_CBQ3_REG),
+
+	BIQUAD_COEFS("CH2 - Cross Biquad 0", TAS5733_CH2_CBQ0_REG),
+	BIQUAD_COEFS("CH2 - Cross Biquad 1", TAS5733_CH2_CBQ1_REG),
+	BIQUAD_COEFS("CH2 - Cross Biquad 2", TAS5733_CH2_CBQ2_REG),
+	BIQUAD_COEFS("CH2 - Cross Biquad 3", TAS5733_CH2_CBQ3_REG),
+};
+
 static const char *const tas5733_supply_names[] = {
 	"AVDD",
 	"DVDD",
@@ -770,7 +833,7 @@ static const struct regmap_config tas5733_regmap_config = {
 static const struct tas571x_chip tas5733_chip = {
 	.supply_names                   = tas5733_supply_names,
 	.num_supply_names               = ARRAY_SIZE(tas5733_supply_names),
-	.controls                       = tas5717_controls,
+	.controls                       = tas5733_controls,
 	.num_controls                   = ARRAY_SIZE(tas5717_controls),
 	.regmap_config                  = &tas5733_regmap_config,
 	.vol_reg_size                   = 2,
diff --git a/sound/soc/codecs/tas571x.h b/sound/soc/codecs/tas571x.h
index 5340d3bec31dfdee0be234aa80dab27b44037304..2b3eff4023b9fb3193e55c0c970b3f71b7b7620b 100644
--- a/sound/soc/codecs/tas571x.h
+++ b/sound/soc/codecs/tas571x.h
@@ -104,4 +104,38 @@
 #define TAS5717_CH2_LEFT_CH_MIX_REG	0x76
 #define TAS5717_CH2_RIGHT_CH_MIX_REG	0x77
 
+#define TAS5733_CH1_BQ0_REG		0x26
+#define TAS5733_CH1_BQ1_REG		0x27
+#define TAS5733_CH1_BQ2_REG		0x28
+#define TAS5733_CH1_BQ3_REG		0x29
+#define TAS5733_CH1_BQ4_REG		0x2a
+#define TAS5733_CH1_BQ5_REG		0x2b
+#define TAS5733_CH1_BQ6_REG		0x2c
+#define TAS5733_CH1_BQ7_REG		0x2d
+#define TAS5733_CH1_BQ8_REG		0x2e
+#define TAS5733_CH1_BQ9_REG		0x2f
+
+#define TAS5733_CH2_BQ0_REG		0x30
+#define TAS5733_CH2_BQ1_REG		0x31
+#define TAS5733_CH2_BQ2_REG		0x32
+#define TAS5733_CH2_BQ3_REG		0x33
+#define TAS5733_CH2_BQ4_REG		0x34
+#define TAS5733_CH2_BQ5_REG		0x35
+#define TAS5733_CH2_BQ6_REG		0x36
+#define TAS5733_CH2_BQ7_REG		0x37
+#define TAS5733_CH2_BQ8_REG		0x38
+#define TAS5733_CH2_BQ9_REG		0x39
+
+#define TAS5733_CH1_BQ10_REG		0x58
+#define TAS5733_CH1_CBQ0_REG		0x59
+#define TAS5733_CH1_CBQ1_REG		0x5a
+#define TAS5733_CH1_CBQ2_REG		0x5b
+#define TAS5733_CH1_CBQ3_REG		0x5c
+
+#define TAS5733_CH2_BQ10_REG		0x5d
+#define TAS5733_CH2_CBQ0_REG		0x5e
+#define TAS5733_CH2_CBQ1_REG		0x5f
+#define TAS5733_CH2_CBQ2_REG		0x60
+#define TAS5733_CH2_CBQ3_REG		0x61
+
 #endif /* _TAS571X_H */

---
base-commit: 914873bc7df913db988284876c16257e6ab772c6
change-id: 20250527-tas5733-biquad-fix-72be988daeaf

Best regards,
-- 
Bram Vlerick <bram.vlerick@openpixelsystems.org>

