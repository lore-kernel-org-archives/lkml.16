Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14401215F43
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577395; cv=none; b=HV3650v9L8Ms74q4w3lItrYD2OfT/rU/Hit9uYgTv8U5H9Ohm9p49J9699M/5px5fYiTMpf6sDdP469avzUgitvXTrR4rcruSn3+yktGyR8FAQa+7Qr62nWeA0HO6rNq4kW5IiIzAeRkq38x6nkMMeQ9YSxR164Q1PsR5aBDtuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577395; c=relaxed/simple;
	bh=GFhXoZBpVouVR/8foGkBqc6Kk0Ehn+CPGRijq2Srx0g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ccnz220tjdtZ2IT+m3LZ/LT0M1GTVJBoOHUtMBfX9i+3GZZMxLDVb4z9N2j2JTvTNsMQCDHJV2BUD4ZufSHIBOMDtLA/9tYBmv0cKxnBFBZNfbwh+f5edDyfBZ1DmuHquWrUlZtnSyG55fvszK6x1y0yOE61/Q7R/cjO3BD6SZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=t6m2hYfc; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="t6m2hYfc"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 713113F2B6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745577384;
	bh=UlV8FLqMpG4IuhIj2Il3KviEhF74QoQwUOeBKHe1Qjc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=t6m2hYfcO565eI+i1/atb+QXBU1jWEL2m3kA0lMjNcU2t0oJkSgEclTKW8RYtldCJ
	 sblJ4LBqzT0Ip9Z+V03EDkRbKZdkrQCDXQYX+CGCi962rwlMQXrAAi0ysp+L+oMoNV
	 JGQ2t92rvRCAhQyeksO09fJBS5XBiTgb2m2dyAJR9HG3wVLJBvDDy2V313tUeRXOy4
	 l+72zXKlvW/tIGa/KARYjIg+5Wk/gnG4L3p7CgUXV1NHDAmSLbrbMCxCrML5TUMdEU
	 dOcGOHqOOehQIcrCpGbVPrfOyFiS5CtOZbejhj2Ynesa20+mDkueCkvQN0HAstcLiZ
	 y4zR9wa4DUyiA==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2241ae15dcbso24737445ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577383; x=1746182183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlV8FLqMpG4IuhIj2Il3KviEhF74QoQwUOeBKHe1Qjc=;
        b=fzWG016OiKFLwJG7h+g2auGM/JXtgQe2u390BphJkzNowcOSg+qj3TwIefURpShir3
         GxEdEA+TkBaY8HGUkd9GbH4pX434X+OaD2roCsmRmzfX4LkfpkTNoCuxPG9pe/MkpCNg
         ImNCJRGUEBwiPuurxG1r7SaE/bM+C0R4hrLcqnHV5VvM3TLlYGm7+fKbM2Hl4T/7D+XK
         qRHexplHXJ6rRGFfjllBnxVD/UA1dMlOKKyGJXeVONaZh2IEjgKjviV1557qEccDfWlw
         xD2SK+jBxXd9MUWyTgazsTkxW2UlO5cUo27krhtmADd0dps7vJuTDTu/4Ny5E8FItWNW
         Ir+A==
X-Forwarded-Encrypted: i=1; AJvYcCVPTqiRIzPzjKRPqP7Mb0pbLvgH4e1GNqK/6+OdY0LcxdoFZdzDqcbWF1fErxW/pDmixIHdVVXqyI2giZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzai0g/mvbydClJNfGxo17Yz/U57eCvHXp3mObrVF280ETWXi9Y
	6FHLqLTsWkiV5+deVVsvUW+k08a2HrLtkegkJPsg8mQaoDjvqZJk9wIb5mqv6VB8zwmz1kEJwj+
	z6OZ4eacicQBmXPhWOkAqpbDkTfH275pMMcuUlZN9RvCpz63tW5Hv06/l/tbdfNvV3Kqq0LU5Cb
	cvZQ==
X-Gm-Gg: ASbGncvwLSVaZwBWScf6vW3OrqwZXDDiKTUHcw+gzHcllPQa5F9jVWpOQixnrRZXdAz
	C33U6KDbNa3wxg/cFnYh5NaD4fyxbGMKkUaGqqnwFnLvjM5vX6GlsA1368JyJltuhr8NdYskq4D
	zIMhIY4i5ck0pvx77lvajnEa3q3Y/4Yw04IT/fN6kPhQ6JcLLaH40rPJG/dSNkCTFL3AY/Xdd3s
	JZHMk4NqQebjC6TCQhRZ1m9zJL1bHYdJ9R9pZnPmcoYLIW4E3N+WaW6bSc2VA1C5QZceUva4MB8
	wZvBES4pGAd/MHXnzI2Q0gTrBdxjwsAHf3fJ4VSaCZiuhtcnJznEFbMbMg==
X-Received: by 2002:a17:903:1b6e:b0:215:7421:262 with SMTP id d9443c01a7336-22dbf5ea7a3mr31007855ad.12.1745577383040;
        Fri, 25 Apr 2025 03:36:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGysfY06WhzX2e46KAEm2EG2sF0J+rz7RgUURgZ6K6tYGTQSbdcY3CtC7pl57V728dtecelSg==
X-Received: by 2002:a17:903:1b6e:b0:215:7421:262 with SMTP id d9443c01a7336-22dbf5ea7a3mr31007415ad.12.1745577382673;
        Fri, 25 Apr 2025 03:36:22 -0700 (PDT)
Received: from u-XPS-9320.. (114-36-218-122.dynamic-ip.hinet.net. [114.36.218.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef063c4csm3083821a91.20.2025.04.25.03.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:36:22 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda: Apply volume control on speaker+lineout for HP EliteStudio AIO
Date: Fri, 25 Apr 2025 18:36:18 +0800
Message-Id: <20250425103618.534951-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This hardware has ALC274 codec with speaker NID 0x17 and line out
NID 0x16 for audio output. The line out is routed correctly but
the speaker is not. Thus the volume can't be controlled.

This patch removes DAC NID 0x06 (without volume control) from the
connection list for speaker NID 0x17. Routing both speaker and line
out pins to DAC NID 0x02 which controls the output volume.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8ed613932c5b..38ed264c3a49 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6742,6 +6742,25 @@ static void alc274_fixup_bind_dacs(struct hda_codec *codec,
 	codec->power_save_node = 0;
 }
 
+/* avoid DAC 0x06 for speaker switch 0x17; it has no volume control */
+static void alc274_fixup_hp_aio_bind_dacs(struct hda_codec *codec,
+				    const struct hda_fixup *fix, int action)
+{
+	static const hda_nid_t conn[] = { 0x02, 0x03 }; /* exclude 0x06 */
+	/* The speaker is routed to the Node 0x06 by a mistake, thus the
+	 * speaker's volume can't be adjusted since the node doesn't have
+	 * Amp-out capability. Assure the speaker and lineout pin to be
+	 * coupled with DAC NID 0x02.
+	 */
+	static const hda_nid_t preferred_pairs[] = {
+		0x16, 0x02, 0x17, 0x02, 0x21, 0x03, 0
+	};
+	struct alc_spec *spec = codec->spec;
+
+	snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
+	spec->gen.preferred_dacs = preferred_pairs;
+}
+
 /* avoid DAC 0x06 for bass speaker 0x17; it has no volume control */
 static void alc289_fixup_asus_ga401(struct hda_codec *codec,
 				    const struct hda_fixup *fix, int action)
@@ -7970,6 +7989,7 @@ enum {
 	ALC294_FIXUP_BASS_SPEAKER_15,
 	ALC283_FIXUP_DELL_HP_RESUME,
 	ALC294_FIXUP_ASUS_CS35L41_SPI_2,
+	ALC274_FIXUP_HP_AIO_BIND_DACS,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -10340,6 +10360,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC,
 	},
+	[ALC274_FIXUP_HP_AIO_BIND_DACS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc274_fixup_hp_aio_bind_dacs,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -10774,6 +10798,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8ce0, "HP SnowWhite", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8cf5, "HP ZBook Studio 16", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d01, "HP ZBook Power 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d18, "HP EliteStudio 8 AIO", ALC274_FIXUP_HP_AIO_BIND_DACS),
 	SND_PCI_QUIRK(0x103c, 0x8d84, "HP EliteBook X G1i", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d85, "HP EliteBook 14 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d86, "HP Elite X360 14 G12", ALC285_FIXUP_HP_GPIO_LED),
@@ -10793,6 +10818,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8da1, "HP 16 Clipper OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8da7, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8da8, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8dd4, "HP EliteStudio 8 AIO", ALC274_FIXUP_HP_AIO_BIND_DACS),
 	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8de9, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8dec, "HP EliteBook 640 G12", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.34.1

