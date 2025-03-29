Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310641FC8;
	Sat, 29 Mar 2025 15:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743262918; cv=none; b=Y2FaPDZTkfvqBXa26Onhujn1M0n5lAT0BbJMwnPxVtLp13JgPYg3hWcppILi2pwDVBdozm7TKiUgZfRz0vhCJ9lkBXEX7zupQ6ypDlC3+Ep69e5ADKYZHXbgBCsFR6z5yzAqhwc1pXQLzXGrRlbXmSBrQtegNJEFON2MhZQKJRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743262918; c=relaxed/simple;
	bh=gPYJGBTsZ8hzQcxbbv67LaDnzDhW9kZgfemZ6do7AvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXBpJAwod4IlhdJPLlrhhD3s/PZKfHatmbfZW+7LVj+kWTFmiaY80+/N5yiKU8kZbahgs1zk3HLANKv98Jhukj1IRODNt8SmnvqzOnKwDdt8jSbSWJ/IAm6J5b8XLY1IJSI/+w4k1T3qc+mfkNGpiItcbpVKn+R+vLdfOkiEbRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2E4RrpH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2E4RrpH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224341bbc1dso59343805ad.3;
        Sat, 29 Mar 2025 08:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743262916; x=1743867716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h+NXkcm5v0VhO4YaDPRL881X5YJZWS4L/7DXYPEaZKs=;
        b=Y2E4RrpHWq4Xt1FytBwKenTJmjS0iVOIbPHR9nfpG0+LFzZHNKAmvR/bg1DKdc27UP
         k4x0mSwgBfeYpkjeJ7xD+84/qlRHPQWmU5Tn03DAlRkl8J5LZTcAl5FxknvWuASreahU
         pPV/ynnU5j0Yo5JAtrFykuSJKQKSgU5nNwOT4Xi9kzFsLiSUg0hopZ5dcmnGlGmK9cUP
         bwnfcnbNNOFbrGLipAiGKadOwubHKPdfQcnr6mgvEQateYqLbk+UBmrMziPVLDkBDUBW
         Hqlh/v1ZQ6eWrbQ5iuaW0z7EGe9nxRZ5TH5hPsQd8hDb5PggwUjV9v3YdLtv3lJ/M6AW
         H5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743262916; x=1743867716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+NXkcm5v0VhO4YaDPRL881X5YJZWS4L/7DXYPEaZKs=;
        b=qtODq0/ktNpj31eK6Jz2IdACOmWMa3yEux8lxJT2vGuHmEGIn230Yc17D/yIdF1nTk
         M2wmidsHIcY4XsLpietFcA5rSFPqu5znj/9ZidVNgU7RycZhQfe3T4oGKMb+zeNt3MrB
         Fw5djTh9ra6gJrnUWbGtJnCNkUOSa8xz8fF6OFOYnCLKkJ+wfmAv54+GJN+yDFw+R1ql
         0rFaWgCmqVHISQxo+r2y4p7vOY5Dpc6dFLu5296zwimZgPyJTbcc6bqRw3RAsCiDaSnk
         hQffHTRfrcx26wI+8rVry5cv3mLFqIbNjGvzA8ATAdNdXNMSb7Ux/M/Gy398BKKveDr1
         QX5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEOy+UrqpA0VfVm0ao/fOLrMpEqMDbqctWPJdfnTrxjd2Wv0XeRiPG2tpry/gSRAwB8xb2nopfQpdryGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJzfQKtbx5Zmr8pwL1VMSSvfHYCeV8UkqB72TpaaNSad8YQ8iz
	Wt8mppHZw5WP9mEZvLE4CjZHCOKJhc3F/vM037t1L1/0+q1/UyDmcxBLZ4TToCg=
X-Gm-Gg: ASbGncsZ8AbdI2ZpZnff4IoRKLjkpMU2acCP+zaHuU5K4fHYPxil4c9Rlzd390o7+nB
	6CtBzhwi49BFvgXUqSg/Vsaj+h7lH2phDY43cg0BFFgGP0+cot3HCep0VhGP9hzEVpWG+zdZHxD
	hUMx/QkCBANFSNu8hViSPNOmEPW+mIleypUhIdpwpRKG8P5BqFe4mWwLuEUugfK6ujFpnZV6gCE
	f+L3qpSMAw+OURnIZD9aLqq+J0CtRarv9S0ECK13O59ZkSm76Ba+pB99k3m5OlQpzGL4vFnng7Y
	9yWYb30fn+NtEK+mJy3IVx3Hx2LDMt+oid7KxT2y6DppYRGMCf8969CayNXFe34=
X-Google-Smtp-Source: AGHT+IHOk2IaBH5lvGuem+FzrpOh6fjer1lV7g88tDP/AMHHhnF9LRgFezHviuwkwRu3H6iO7WDkbQ==
X-Received: by 2002:a05:6a00:a27:b0:736:476b:fcd3 with SMTP id d2e1a72fcca58-7398047c382mr5348789b3a.24.1743262916227;
        Sat, 29 Mar 2025 08:41:56 -0700 (PDT)
Received: from localhost ([2401:4900:1cc8:2ed6:ee25:625f:27e2:17d9])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-739710b8001sm3707717b3a.156.2025.03.29.08.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 08:41:55 -0700 (PDT)
From: Sharan Kumar M <sharweshraajan@gmail.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sharan Kumar M <sharweshraajan@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Enable Mute LED on HP OMEN 16 Laptop xd000xx
Date: Sat, 29 Mar 2025 21:11:06 +0530
Message-ID: <20250329154105.7618-2-sharweshraajan@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the HP OMEN 16 Laptop xd000xx to enable mute led.
it uses ALC245_FIXUP_HP_MUTE_LED_COEFBIT with a slight modification setting mute_led_coef.off to 0(it was set to 4 i guess 
in that function) which i referred to your previous patch disscusion https://bugzilla.kernel.org/show_bug.cgi?id=214735 .
i am not sure whether i can modify the current working function so i added another version calling
ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT. and both works for me.

Tested on 6.13.4-arch1-1 to 6.14.0-arch1-1


Signed-off-by: Sharan Kumar M <sharweshraajan@gmail.com>


---
 sound/pci/hda/patch_realtek.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b4fe681ec3cb..98abec3833a0 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4743,6 +4743,22 @@ static void alc245_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
 	}
 }
 
+static void alc245_fixup_hp_mute_led_v1_coefbit(struct hda_codec *codec,
+					  const struct hda_fixup *fix,
+					  int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->mute_led_polarity = 0;
+		spec->mute_led_coef.idx = 0x0b;
+		spec->mute_led_coef.mask = 1 << 3;
+		spec->mute_led_coef.on = 1 << 3;
+		spec->mute_led_coef.off = 0;
+		snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
+	}
+}
+
 /* turn on/off mic-mute LED per capture hook by coef bit */
 static int coef_micmute_led_set(struct led_classdev *led_cdev,
 				enum led_brightness brightness)
@@ -7911,6 +7927,7 @@ enum {
 	ALC245_FIXUP_TAS2781_SPI_2,
 	ALC287_FIXUP_YOGA7_14ARB7_I2C,
 	ALC245_FIXUP_HP_MUTE_LED_COEFBIT,
+	ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT,
 	ALC245_FIXUP_HP_X360_MUTE_LEDS,
 	ALC287_FIXUP_THINKPAD_I2S_SPK,
 	ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD,
@@ -10164,6 +10181,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc245_fixup_hp_mute_led_coefbit,
 	},
+	[ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_hp_mute_led_v1_coefbit,
+	},
 	[ALC245_FIXUP_HP_X360_MUTE_LEDS] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc245_fixup_hp_mute_led_coefbit,
@@ -10658,6 +10679,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bdd, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bde, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bdf, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.49.0

