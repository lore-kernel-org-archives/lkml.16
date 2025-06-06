Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76DB43AA9;
	Fri,  6 Jun 2025 19:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749238063; cv=none; b=X9mfvHHIfuCy8obWRma0hdKrovqueXr0dfmampTNl12sq0voqN39S7ZrVqHgx+W9vAyCmS8e6sZ7Ua30tWwTmLt5pMxoFK3cgzuhwoEw+NCzKj17P60WD9Kvh/yzgxjbCdYfHrxu4RmVnhl9z0cZu/B0JQG8Hgy7d11YN9pPiyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749238063; c=relaxed/simple;
	bh=faRcReKxhmUofDDkCeQVM6SzXCNDLDJuD4syhu+Fdgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GiirUJJ2cba+KVuBJB0Mkv0UwL0v5e2H6m/pGAf7dBv8A3skDwyJpNjdJSQ6x1r5EU0YIaO7Yr56LeQ9sVc85U3ZOELtncIA1XpkzdLObATYCm+IelKmwSXpHfViBvC50CV/ZyGA4CIhCtY+SW7eHXCkVJ09Lw6J1/45D/zGtpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaeSW+zt; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaeSW+zt"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6facacf521eso25437956d6.3;
        Fri, 06 Jun 2025 12:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749238060; x=1749842860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfNAXAYoR35jdBQCiZAgVgr8/Q8x1ESP6dlgjpAxiGU=;
        b=gaeSW+ztdCiPtjAGe5RPrrerQZzwKiIusT/P2toAdlC1GP5QVRWfQsVfiaSxEreihV
         IgT3SSNyyup5KibdJeHcx5w0D839hdDyE9DQMgfANpdwTxKO0JTFSksxIgIfQ1p5GcDZ
         AeFPnheBanH/fHUKEcI1jvBNzTJtFfFlvfAYeaxhVfaAu8/WACRlqBwky6FGEzT8UmA0
         o1QNnbRluTpW/vI5nV8OrSU9zVFKeg0x3gV1GBajhaUYG3iLONxbk/SOcuyThdP55gr+
         NfiBjBReP8ARvRCZnWaHNIw8+o3XsoOCnyUVMVtQF7rlf+EfTyNjRzzv+z/1mSRj0wNY
         ziWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749238060; x=1749842860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfNAXAYoR35jdBQCiZAgVgr8/Q8x1ESP6dlgjpAxiGU=;
        b=KLcyH7veqhKeJLjsFXEx7bni6BP5hbn/iyDeQB9c/ehSKUj83a1XZPoWAgkl4f6BFO
         eb+v3cofzCfePVtQtPJ0tqFCvb4fVFgjAzzoSO4hpx6H4vRaDdOGAj+76Nd9jfoYVzcM
         H3KHcdJvCrjJvcMrumYC2M5CVbTN8ingrYmE44lgRP+DxjxZlytx4bk31IC9UD1iFArw
         wAJmGNXBq3AUnCLRv+6SODgnQdfbbXvTRXrPHVQu9uQnA8aVVZdFYAE1QKKZrJfB2mZ9
         OG7qPijxhNAMbw9uFj6eolROddnWxc5UC3wea4yf/TIpJPaZXsjod1ToqDAu2ZRN53dJ
         wA6g==
X-Forwarded-Encrypted: i=1; AJvYcCUFeKa4HntNF25T8OElQbEaUQMsVbf04KftvYC+n85kHwM0bgSOJ9eV9QHL8SJpZWUJUDJzZ+KTy6s5qOc=@vger.kernel.org, AJvYcCVQrftFRP+5WA/EG4AUpM+a9sOPw7QqOcibVCigUXOs+gTcsaFLj8zsQc+IbPXvH9d7Obkmx+sqvTzMMP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH86U1cpXRIviJIn/pbRA+tAFJEBFqxzGpHQFsrQrtfUU/sYr9
	6R8oj+z4DTvkm96f7xu0ZOFSlYiXV0Qsb8/nF9AtH+cubW76Ny5cZTq/
X-Gm-Gg: ASbGnctvIzQwQYIYnmTm68+hv0m3AM1OsM6Z7vnkgbBHAYgtFCtM+Ohy8thW1zcVlRZ
	Zd06qbaXv2Xv7q+pE5kDR7fRY7fDn9QCfj11wP4Qb4G137t2ep66c48TaSinfrtN/UljW0hR9uj
	CV8Cw1QBhMDKqCfOMu7v1fnWTEQh3C7Y9hdqowKq4aas4jrlgPCVLH0FnuhMNWsRQrZ9iAQrF7A
	MPlakJNpR+qR1cITc1wBdjv9nngy6Ff2wVedVawzUtdqSL/DeH1desP6DU9ZB6LnTftMj19dwaa
	Clp1Lf0IjGDF3e0ggwJOsCyqPu0weILr1trWK2RfBTZxCP4iSUYhOgm0XQ5l8MinI0kG7Nhatit
	vxT7KI2KRR8zRCXSYpVzDPdksl6Nl
X-Google-Smtp-Source: AGHT+IFKK3dqPe3m+hyJ/34Eh4G/DiPSW4Ls1MsN2CSwtrtVQbJhawXArGvuztELDopYMt8ftm0fbQ==
X-Received: by 2002:a05:6214:e83:b0:6fa:c697:97b5 with SMTP id 6a1803df08f44-6fb08f6dbf8mr73843476d6.20.1749238060636;
        Fri, 06 Jun 2025 12:27:40 -0700 (PDT)
Received: from SunshineGrove.mtu.edu (rover-237-192.rovernet.mtu.edu. [141.219.237.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a59161dsm174932585a.51.2025.06.06.12.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:27:40 -0700 (PDT)
From: SunOfLife1 <sunoflife1.git@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: SunOfLife1 <sunoflife1.git@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek - Enable mute LED on HP Pavilion Laptop 15-eg100
Date: Fri,  6 Jun 2025 15:24:59 -0400
Message-ID: <20250606192650.10948-1-sunoflife1.git@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <87sekixkqg.wl-tiwai@suse.de>
References: <87sekixkqg.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Of course, thank you for notifying me. Is this better?

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

