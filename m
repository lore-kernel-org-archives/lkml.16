Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D5A1D54E9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660785; cv=none; b=B0Z24mc+JGkOuGTqlepuHwFxPySL2s4t3z7vzT8iIWR1aP8UQgxKLZx4vsJRSnkhhPImAOaSWNx1K2vVhWznMu5ElAPWoau/Xa2Cl78YrqpWHuMRCWiQAQQAlkg2iftVKZCt2+SF43SJzXb8GJCJ+KiEcan91HhmHv4MrdfgfSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660785; c=relaxed/simple;
	bh=wL9QlNfmqKvYdKXFuwTltASqCbw0DTBRa21yy/QzTW0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mboWNpfNaMoP6ogJoSyfKFTdEMw5RUcMN8QmnqGw/liAmPGYq9RgZP0F3mxihqRWGBc2G5E6rVmDq8sEOUjce5bLSJm58UCLAb/8wmzlOA7zZP+tgrOVVUp2/naNUnbYD5AcJg2nRhV2EC4S+8LM0+YJ7eyDqcwv01tMNz14eLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=UP4KcKak; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="UP4KcKak"
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4EA563F1DD
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1750660232;
	bh=vl643mA4T4uS099zf+eRPYilXKKuq+VZWfu4y9zT6vs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=UP4KcKakaN8MAX0tI+5ZTyWe2CbnJx4JZwT7LK9lsP77JY/temK25LScH0oxwyyb0
	 lMj9GEx6my4EtEPubtSdNeoFajtRSvJyw22ZJtVaBDIPeZvtrFkh916ofJlejHaJbP
	 ho2eQtSgCcWZkNDcpBlzmoIdbFGuqjccrvondIcdS3ViEcaeRbXsGXNMkPZQM1DH7Q
	 lJ0rI3luSYLw0tXIf9kjwTNZ9jx79B87b4efaQcYtxo3BBu/vmjyATCUtesnEb9Cev
	 rcimZ3NjyIX268o3/wwKP60A+yYIeExGfjMfy09FtgV9+7bdgM6Vq645wbbiwg+6an
	 TyU3uOVMJeWVQ==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313c3915345so5970772a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 23:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750660230; x=1751265030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vl643mA4T4uS099zf+eRPYilXKKuq+VZWfu4y9zT6vs=;
        b=giciYnUqmmmlrihJ22QtZvCn78Jyry73hKck6M1bpsBYX8+83S/40/rQq9Akfsw3WF
         Wu8cGUrTro7GInh1sdz2TeJm6nmCRamPcVA+M3bCNolHquQ9RFfzJd+4EZgbUgqOIReD
         CRBW3gYUMVJCuTczjVsia7Ms+zw2MHTdXL+lnXJaTiFHyXWLaFF7ifVcwKoBVs6Xy+r3
         AdOaywyGT6bVaESIejG6pwm93eal/F/tKlDJBorcHnd5Bld6yN+4sua57DhiPHOp6mUq
         fiXH0PfCcU83ERnV9HPdS4ZQXz53B+porpxXh1HjuGAwBgjYRbypEqvv3fP4qKnUmlWd
         ryyA==
X-Forwarded-Encrypted: i=1; AJvYcCVDw1/t/Qs+u3Zo+GBWMRdid4W0zei+10tOBUHZ4fcBS6siAgIFIQOY0g8WtDmj1jzFTnCWAW5tbn9w7MM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmoSBDA1luhv4m7ruBVH3rFOZMixR3I7+ZYMb2Mjru0fHQno/X
	vZgPMteUikod/j4HIUpPdtbWWnDw/RLYMQ6yFbvLxIKSWKKjViI7K5Wa3H7q6UvWEk5LD4idvtn
	D7lTyv+vxSK+tnWGEnAlYs/Urq+0Ipod2FzBjWImcpmwl6QlDgBYAbK0ufTj0R2hygxTuubAsKq
	FNshN4LobuRG3YoQ==
X-Gm-Gg: ASbGnct/SGqpF7hZCGniPOESUavX2bV0J4Snmm78b3wW0snfUm257KqgZW7/j1yX3bw
	8aS8Yu/dPp+ptCzT5RMiHbUC5xphm0jfFutwQB/hlpImAoo0quyHJEWtdh/GWp1vxPJTNmPTzOy
	iaKhQmCRx4WvEMgd3sAJEViIIyOrOzl2TjJ8GJUVTk6oe1jWAM2/v+TjM5q2BJym8AHuWTSXfsL
	dkmLYE4PJhLvHHChiDf2kmpVqeDEYu6PmAeFm4BVTjV/PlE2K/66qIszDBH4rv1Kuj5YNqrSaC3
	j3CrLo+bQELBCYhgHHVkAmI2Y7piMeWOAcqKrHL0hyNhhFIavaEHFX2LHg==
X-Received: by 2002:a17:90b:3f8c:b0:308:7270:d6ea with SMTP id 98e67ed59e1d1-3159d8df995mr15047856a91.30.1750660230555;
        Sun, 22 Jun 2025 23:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6WRmD3qhtaax+BPxwX+0NgQR8RYphmZjK/RnLysnchWXhF8kKwE8e2woEaFPwjDMBGMXOHg==
X-Received: by 2002:a17:90b:3f8c:b0:308:7270:d6ea with SMTP id 98e67ed59e1d1-3159d8df995mr15047828a91.30.1750660230166;
        Sun, 22 Jun 2025 23:30:30 -0700 (PDT)
Received: from u-XPS-9320.. (61-216-9-67.hinet-ip.hinet.net. [61.216.9.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e048346sm7907600a91.26.2025.06.22.23.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 23:30:29 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook 6 G1a
Date: Mon, 23 Jun 2025 14:30:23 +0800
Message-Id: <20250623063023.374920-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP EliteBook 6 G1a laptops use ALC236 codec and need the fixup
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF to make the mic/micmute LEDs
work.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 7aa2c461709e..d62bac7d10c7 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10923,7 +10923,9 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8def, "HP EliteBook 660 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8df0, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8df1, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8dfb, "HP EliteBook 6 G1a 14", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8dfd, "HP EliteBook 6 G1a 16", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfe, "HP EliteBook 665 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e11, "HP Trekker", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e12, "HP Trekker", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

