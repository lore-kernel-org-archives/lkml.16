Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A642212B3D;
	Thu, 29 May 2025 05:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748498254; cv=none; b=LVK7I4LIe7yPSaZfbyb1V8E1KfBs2Eb+1g73XKDA8tcsNolfrMa/AfLWTZYDCV5d4ju1BdtkAc9ar6aG3r2AoIT50JUt7K/XEBnmm7HH0HKdMZmTsl6QCovA5Tto5/n/4TbNQNgeCOYdOtqVnG2VmALKWOsdcqEM/JJG3WLGSzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748498254; c=relaxed/simple;
	bh=R+j6mlDjIaBPic/wSAzREhP2S5ZHIyVVa/ofgY+6HxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2jTVUIN1I4jKZ0b7ekxPymxDMZm95TBAZj+dnY68jYXUA8X+wUE/SAmL3lbv0qSN3aXL3BlQDc9M5Gczt+KYAF5CqiCQB0cIvZQ92CDjqokv3V5AMW88wFHJyyIiPns+zsHAJgTa/iOAf8vXDqXt0pBUaA131Yu/NoYUdqkXaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZePvceif; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZePvceif"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-72bc3987a05so396287a34.1;
        Wed, 28 May 2025 22:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748498250; x=1749103050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yugVrrM09czxB0TYqpV6dPSNuk3FM38NyrYCmVXybXY=;
        b=ZePvceifR+0sf6jPmhv4C30Z578eXbUdNJteBLHlB6sQTtraBxLEc1Z3U3GFEuLV+z
         +QV6tfFcEsNSoSfHsoc/dO5T8kS8Xp3Xrw/YH2vgj/mjzUYKjLdSNuBH2cTH8IANzlMk
         m1tfNra5bFYPKrj9OM2UAKDrNe31lA15sPDWPn6yiCG6d4tKRz2qTgpz1f2Jhg7gLfLN
         0FbA+u5NasYMrUAp/vos6A4Mmn92aZa2qO0GIwuXHgB6fl2RUcxQYC76j5xXXc/aMlVY
         g5JK7QRVGFS3793iHMnPMB2QrPAG7y9BYYiOjp9L6725o9yDjx7nq/2wMDhZ9UTd0jQH
         ebbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748498250; x=1749103050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yugVrrM09czxB0TYqpV6dPSNuk3FM38NyrYCmVXybXY=;
        b=gyDDuHTQTqdN+RUSKhB/jCWQ24IM1RYg5oAdTZ1Dya9FjX06YccsfKh/8e4X9YC+Ib
         3vDvIrnKOpGJXDTLu081hiN6YshJTmYx7KSDJioencLiOcrEDZkkn2fSTRRZCDsUUIt3
         s2pcaFFTkV3kqVD5LoTPjbIFQ2RQoLEqCLGQcdEAbJuZTuuLsUIyUwD2WptsT5ZjvWQH
         o4/9rytvIJMLsQtbfjQIV6XClLRCJIfmVmhMazIZx3zlScXds+E7xjWhFr238cqHEE7m
         Z+8hUb1KF7VW+HhkgAYLQt4N5/E6q4OvGxyZwQS5BIRGCQhjNFDmNP3Hi7rvBW79prC5
         WNew==
X-Forwarded-Encrypted: i=1; AJvYcCVbvbum42+i01NBLOh04y5WchyTUqVECB0xj+uT+qCNuFK205wmziTpNfxsrALpBLB9YIffU1GZMtQpznk=@vger.kernel.org, AJvYcCVyfCzlBgNvHTLVNnY3kkmrI9nxhfL9l3ECX9sq0AQrSlucR1nnM059UmV8jKIgMzgBqYPam+qVITiuu4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxz+foU9E3kNuzfHY+zVF5OEQIYa0YeL2cO0Rvh8m79jQ2nPdL
	RUhuapRO3zUXX377rQGGE1b+DRNhE/BpLRksmTEWuPhJHq4n4i3vugd4
X-Gm-Gg: ASbGncvtbaBjNDnMN9dsBhfHsv9ImaMWZ69D7swZATSN3Srgdz3kIhGTTXbfm3OIvVs
	6aYGhXp62A7OIXOGOYpCVJWEcwF+7IC9/GOip2gnVqZK2qyaQeyvwoESuKNhGlaZmPIbnVEIwwu
	gWQKtIZS51UFXBGVwiXw5zhzSowR+ikp9Y/akPDfnzdQKAtyXbpwAaAcYEMiuCiw4m/oZlFqXrH
	FJIcP6UeHdw1l0JtXPLsDgWTpDt4Luvkd9/Unf7/TfCkickS6P1fuTwoL8xCEDVhSmMnGVtz9Yw
	FyFP78RPT1XiqL/onmfWMQ7l6cirYjM5ib8jDZcPueT193aNUeyFTYuiynuld2mdVxlBRSDdZzI
	SZvh1YLkUCjnYBdeCJjFHGsVCXx0iep5pvBWwNixRIg==
X-Google-Smtp-Source: AGHT+IEDvi2sJO9xwqeDETpi9OPm7tdaH86fkqRhit+e4F6c/+vk/wYMZP91D5tz5GGndw5H1f0aTg==
X-Received: by 2002:a05:6830:4907:b0:72b:9140:f6d9 with SMTP id 46e09a7af769-735acf083admr1616723a34.4.1748498250481;
        Wed, 28 May 2025 22:57:30 -0700 (PDT)
Received: from localhost.localdomain (syn-047-006-020-101.res.spectrum.com. [47.6.20.101])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af82cffdsm152687a34.14.2025.05.28.22.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 22:57:30 -0700 (PDT)
From: SunOfLife1 <sunoflife1.git@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: SunOfLife1 <sunoflife1.git@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek - Enable mute LED on HP Pavilion Laptop 15-eg100
Date: Thu, 29 May 2025 01:54:26 -0400
Message-ID: <20250529055427.20683-1-sunoflife1.git@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Pavilion Laptop 15-eg100 has Realtek HDA codec ALC287.
It needs the ALC287_FIXUP_HP_GPIO_LED quirk to enable the mute LED.

Signed-off-by: SunOfLife1 <sunoflife1.git@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cd0d7ba7320e..0c09bcae2006 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10713,6 +10713,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8975, "HP EliteBook x360 840 Aero G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x897d, "HP mt440 Mobile Thin Client U74", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8981, "HP Elite Dragonfly G3", ALC245_FIXUP_CS35L41_SPI_4),
+	SND_PCI_QUIRK(0x103c, 0x898a, "HP Pavilion 15-eg100", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x898e, "HP EliteBook 835 G9", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x898f, "HP EliteBook 835 G9", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8991, "HP EliteBook 845 G9", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
-- 
2.49.0

