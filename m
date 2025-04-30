Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEC0230BE2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008335; cv=none; b=DhAp3BIFYfUK7+Co7LjRVgmz3p9mkxIfcuwLgJBcrIAp2eBG4FmHXSrohv9U+S9l/Kzm1zrpqvpJfn5/8cBIKqpJ3f4UEznuwPS0SrOjcKYiV7Lii7quLGnf13LYTKm5Gr4BN+ap43ff/bTVeB30P0pWJ84MvqV+seuxV+YWdPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008335; c=relaxed/simple;
	bh=XKD0PCksM5koRt9yVwLvgk25O1hShPA9dC6+DMXXpqU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HXL8FfSVFtgpXEe6grIzV2TbevVCcNaPVY/Yx6/SQu7rpVNVy/Jo7pQ76mx191i/bqwaKjVIMEizzRyUgGtW8baV+5P80leMMaJ12h8Pnt0LYJ83qrdCkDpBkcnKUu4G3GThdo3QWK268pTKqW8J/a5oOiMUSgalOQxExRbFE2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=GEushoId; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="GEushoId"
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 59D7D3F2A8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1746008331;
	bh=tVEuiNCOW28XorGDVKTn4SAyImiaoHT4m0G5IE++oJE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=GEushoIdIGppyYTqRHKc97CnePGaqJsCyqsNT5aSrduMlwBurLuSwTp6IBZxRY6gR
	 wYfsIqkfnx8bnG/qfBibufYkGf5ycxT4jKiSAAZv+BKeNltUj6OYS9xwwtNkvOAnTI
	 siaa9wo8Pq9A4goHRxlnCy2MFPVtG0UBI2dpUagSwfrkAa2nU8hTY1YjXLoSWIpJUU
	 u8B5AWCiAO1xsI5uhcu/+s3XF3+Qxj+vxFI8LMvkGJV2DeW4L1M6yNZJYRJm3xn0mx
	 oFrBGhuMG4GNArBzFsTgMd/Cwz82hjnPcDSyxcPEdV6sj/m4mYbyl8u5RD+7i+yFaO
	 vlRWcs5FGujag==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-309c6e43a9aso10864916a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746008329; x=1746613129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVEuiNCOW28XorGDVKTn4SAyImiaoHT4m0G5IE++oJE=;
        b=K95PyQsQulgoQyibFmRZi84LUXTwlIuEo6uu40w4f5mB6FBtZhpW9Pp/lKE2S1ig2q
         seRrm+fG6Gbp7mcaycw0axhuVvfmh4dBNkfBLPIeoHMR580BcrQOBZ4hNT0GCVA5++Rw
         xY6hUn4JdW093N3t7QtsEEAKgW7P8zrkmUz3A9cKraaZ12ydigBiRLuCErkBF1ElNOZT
         L4gAitQd1xcHaD1UpYXI/H+uRROKjcUaylinSYepn63xvp5FUcVf4oLHKlIZiQhTenxP
         kwXaK6+1VXcHk7JQyJK7rmWEc8w1jhOnWUeYNAJAGhZKT+xtehuNDoL0X/bimQEqrEb0
         gLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ4sLJSFaZDdKZMz5lxSLs+gi/0XBBlIAEJEE3lio0PHNYSa7B58XctVDLh8Cj06sQebtLtoRwpDHID3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLuWxy/qhm3u/C5qN7CsAy0qrzbBtpZ7vQBs5Xp/9lFqMxjjeB
	F6e6nBGKwr26Bseq+BEAvnpSO+KNMkK2eELiyI2YPd9PAnA6fiIfXd40HtfdkA4DzH2j+fjjvob
	ywsRDWgy9rGpxkqs93JdwYsoHGKKPTE9aE9VGlQxgGvHSkXJfVlAcgKOyM150z0xzz5yU0lAWPa
	FwTxAx7WWYMgX8
X-Gm-Gg: ASbGncuwnqVNWjYxqya/tezql5TTE6/w26fm8Y3gIhuh6laT9NblF/PN6Syq0/s1qEX
	rAXYSlvxB3mSXDH8aDPlKhrz8HtllgTkzNQa6AQ+/cgBNv2u0v8l5XBT94pSuJDm1CvHTU9uW3f
	YNsrfnxKEDu0yC/82LgZC2csdsQl7lfopSVRu3S7cIIc4O+2CvvALfIc+wef78y2sJ6V33f/ts/
	uoTgGlVQXQUDLVxxQ7L35obLtTkqiA3dsy2xfXEPg7grhP1PZm7FzRU7j1x4nkvR6sAOju3V/zx
	h3ehPlsCm/I6NLBmsPwZMxsq6RY9d4j7uUjMKQpwIZ9y1PrXssR8w8pz4HlAfXcWilZd+yoaynb
	aR+cFmp/6LDFEhgdl1w==
X-Received: by 2002:a17:90b:3806:b0:2f2:a664:df20 with SMTP id 98e67ed59e1d1-30a343e80afmr3670415a91.7.1746008329721;
        Wed, 30 Apr 2025 03:18:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeL/tMtfO2t8GnWSPPOSEy8Dqh1At0ny/VZdUYYVFJjsUQk2ecHDqOWJSHod5AJKhfg9aE8Q==
X-Received: by 2002:a17:90b:3806:b0:2f2:a664:df20 with SMTP id 98e67ed59e1d1-30a343e80afmr3670372a91.7.1746008329293;
        Wed, 30 Apr 2025 03:18:49 -0700 (PDT)
Received: from u-XPS-9320.. (2001-b400-e173-1972-6944-c046-2d7b-f0bf.emome-ip6.hinet.net. [2001:b400:e173:1972:6944:c046:2d7b:f0bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a349e459dsm1323972a91.4.2025.04.30.03.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:18:49 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek - Add more HP laptops which need mute led fixup
Date: Wed, 30 Apr 2025 18:18:43 +0800
Message-Id: <20250430101843.150833-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More HP EliteBook with Realtek HDA codec ALC3247 and combined CS35L56
Amplifiers need quirk ALC236_FIXUP_HP_GPIO_LED to fix the micmute LED.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1799203af35a..6b5f54cd4030 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10863,8 +10863,11 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8de9, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8dec, "HP EliteBook 640 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8ded, "HP EliteBook 640 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dee, "HP EliteBook 660 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8def, "HP EliteBook 660 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8df0, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8df1, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8dfe, "HP EliteBook 665 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e11, "HP Trekker", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

