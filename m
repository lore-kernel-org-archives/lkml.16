Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA44C2F2;
	Sat, 21 Jun 2025 05:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750484331; cv=none; b=YWSWkNTi+OECRtIAPc+EZEgH8H80p5ecnfLYe6tWs5eG4DCGmqyy4bKlPrkwrQMkZJJ9BJFu4+SD8usmdR1lXru69CjJ83OxVH62cSYeShcucsaJ6yU7grTGKWaBQRgf+t1Lh9fdWIGRzPRMgycbnsgTfGvczzGIOx2/GsEVkXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750484331; c=relaxed/simple;
	bh=BdhlG+/ZYFKsy36TMq7k0N1blm3bnhz+oYkqZIk4xK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrIyO6XEYMoeoifOwc7MGtIWsJo0GSY2YNd5r5yQQqZ9PEhlsCOK9UctIopTS73iRX/GBm0t0HVIjtxy8xr5cqay3VYzpt/8JQegY8xvrnTZIaHniFmA79HEIWb/8tqvJiy9edi/bq7cHfWzbBqsoyuBUH0qcm6dKgmagKVUqHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtYE6LcC; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtYE6LcC"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c13802133so748223a34.3;
        Fri, 20 Jun 2025 22:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750484329; x=1751089129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nIDp0Rp13WgGGaPRY2pUTccVwXNhPWHd1Non+Y0W/c=;
        b=JtYE6LcCHgXvFEALngzoflmXKLrZJsSt9G3Tsr6m20cIgYq5rA55uJoRGEgwNwluce
         kL/Qhp8p2j/fLhgwBdgbTQ5rmnZ66GGONo14e6+gSudMcPWGmDtVRU/ZWUOQdP4728cw
         WlsXs7pxSSo7NfkqqJBKnw0AUcAY1P1AGwRBEgvQn8xz/SnU9Kz2YwYEFy47+Ys08lkN
         bTjTsyo6BZXfOO1Q0d0DGDqAwdSu+/8luWO5t2+Wv5gsH/vMLcS45OeC7/wrh6Gdd1Sn
         IFkDw5vIRwSfSGHA4j53Hy8a8CRZQb45DDESNat/O5M0QLXH5c1W3yvNwfftwTOWtBRk
         dmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750484329; x=1751089129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nIDp0Rp13WgGGaPRY2pUTccVwXNhPWHd1Non+Y0W/c=;
        b=FBS1rp3UXsb8+vR7hRiEiU8kQgeABeWxetkt5CDBE7A12pTb9lQl07OeH/VTWl0ICL
         hjLNFKpSO7Zl/r4t6kEvF7vdqHjyd0Y45AKkvGdDtFvlv2ow63Hw9JaT58hzQMHLOJNC
         PXrr4EMaQhuSlTiy3XmYPj/RsWabAdPX4braDU6hRLnCSbguy3zKiXb//7TmbUYtsNuJ
         URuGqEld1WTIiSNULXCcsOtyoM+44PoEv27+pEzy7bCIrzdbABqFkzuXyKoEt4Kd0p0Y
         RtsQ0Q61BFAgwGuY71z0mQ81bva6Q6v5l38nHOjmfhKGb/iKB+jrfwVJ6oojBQOanHVr
         4LGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHi5xvC9C4zwv02VpP6wqidx+Y24aAMsBfJbEqa/AMKlSqhsC8IsS3zJvRPtd/r7cRSKF5D3m6rIaLI18=@vger.kernel.org, AJvYcCXJRhjHIfZIE2hcRTh0ir8mFpKDLyIhz/yZKaSPZt6Card4szFMT3D3jchMww2agxAGeYqW02slmSg6Wmo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0edAFWbKpUhHQJLElKnrUGhnuOMuyRHMb57HfjDUkqmiWgzHu
	qDg4KOYCgwhl5o/zPS2MyzdSTzGDrMdestpbuodadPxgcqrA2ONAYJXj
X-Gm-Gg: ASbGncsxQMEiJvheJ+Pibq5+XKF9x12ibQgl1ivna73fquJAyZ4JGAk5fQgLJ+i3MyQ
	2FJOXoCSgZIxrRIWoVaXDcIa25IalO9F+J1DlzpDQ+w0kaMTbNjv/Q2VvD72DY48wOR6ar62g1X
	XGb2080vgTISFfRxHdCNOfSUd6/5109/0TF5CWD7rOrz1A7SpIQy29LOyJdIWtmPeaWrX/+thwZ
	6RDjeTQH+rwD2vwuPwMzDsUvp0PUjR/xwqAa3tTQtgz9J9FLZh4gQcE6nVnF1+RgoUveMeowNld
	Uf4kGm0Fuz0ei26dWBz1iZAWNdNvJ9ktWV0YMpI4iBxEqQgaHXCqzHQDGXDiwh8bNLfIUOQzRUk
	yGi+jKl+RiVQj4lTbRYvfWnfnaV6bh3c=
X-Google-Smtp-Source: AGHT+IEXcVjVQnqzQLehMLRV+gxQjLlePuioswroxP2Ofz1tZGkFCRac5KZVp415MWi8OF8WGlQusQ==
X-Received: by 2002:a05:6870:b622:b0:2d8:957a:5176 with SMTP id 586e51a60fabf-2eeda4bba75mr3494022fac.5.1750484328743;
        Fri, 20 Jun 2025 22:38:48 -0700 (PDT)
Received: from SunshineGrove (syn-047-006-020-101.res.spectrum.com. [47.6.20.101])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee6655a39asm696818fac.15.2025.06.20.22.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 22:38:48 -0700 (PDT)
From: SunOfLife1 <sunoflife1.git@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: SunOfLife1 <sunoflife1.git@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek - Enable mute LED on HP Pavilion Laptop 15-eg100
Date: Sat, 21 Jun 2025 01:36:14 -0400
Message-ID: <20250621053832.52950-1-sunoflife1.git@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <87qzzu8tuc.wl-tiwai@suse.de>
References: <87qzzu8tuc.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry about that! This is my first time doing anything like this. ^^;
I've restored the original patch description with the proper sign-off. Hopefully this is suitable now. :)


The HP Pavilion Laptop 15-eg100 has Realtek HDA codec ALC287.
It needs the ALC287_FIXUP_HP_GPIO_LED quirk to enable the mute LED.

Signed-off-by: Yasmin Fitzgerald <sunoflife1.git@gmail.com>
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

