Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA7720330;
	Sat,  1 Feb 2025 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738420785; cv=none; b=B3y6+CWWY2GesB+J23bSX26xkQrHr56G2bZ8Gf0t4dGTvoAInZnegMfV32t+1Pf1wjiWQEc25oVlyt78lrcRtJLoANtzhJgkdMZsQU6ILYXPn8JTvP2i6jjnZOkYthCwQbEgY6zI4PR+AXvIeJyOj5eeH9RRC3eXtM64W2bQk8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738420785; c=relaxed/simple;
	bh=wBkba/v5eoGhankCbBEeMFPQnnO6O3Aek9xKVukiObw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PAN7NnHpASWoDtgAjzsCJVuu2FeH2H89cwHsvRreE9wRc3z7WLzV+ksv/mIe31efgsiTBrBoo+Yw8Jlt66SxFl7DAj3shdgNzz89HM4xEeMg0v3Kp7jMra4LSrfxP3a8dysbIV5JwLo/2RyHO/0ADEtEgo912MN/VN5RbKi69FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xwx2w/20; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xwx2w/20"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso3958462a91.3;
        Sat, 01 Feb 2025 06:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738420783; x=1739025583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4IXATb3WD0Y8ZHgOSiPUXeVEOvohal0QGruJmsTw9ME=;
        b=Xwx2w/20hi57F6g4jMA6gDC11AHfB7oX9TnofPURt7ZWqmyq0YhpqzsFIr/H6tVvA1
         Rl/6eAj5CdBvZPy4ehG60pZ9W8Dvgv5x87m1V816HlObrGs9Nechfsjho/Q/Xgst9ScQ
         o3vIsui52MiF3KzgSbOhesQov/WlHSdcy2qJYJPrkYHH2UV37AVBdBIa5YKig5Bwiqn9
         bFfE/dFp7fIJNDvdCXMLtlza8b+zoVFFo+lULL7ePtznfIzxLCqAmca4/FDY1BgJwCKA
         ypB9LJhEr0vUolvoi3BWM+MLUP2/wK4ctFlpkl+azjxPlOMLRjQkVli4wKo/xFlowYc6
         OkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738420783; x=1739025583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IXATb3WD0Y8ZHgOSiPUXeVEOvohal0QGruJmsTw9ME=;
        b=DLAK57xCBpyZYWtdI+P7v2shO417tbAI0yhQipLho04wQ514ERkyYBDjDIw+9OmeoX
         RzPfvLLKHpVvHudsYzFI7wO0IE2a7vTvROyinWeV7kO9drxcaIACqSS6mpXqaMchwUhC
         cTGd8N0Gz6HxOVJYuGagVCnyE9+39TWb43RfWIId31nUq/tmHjdzmi/yJLu91iodPasP
         RNBT4+9KciKDNqy7TtxQ7jNaFuAz4t8Qp2+VYJ1BvD1uUDuLDc2EkqbY5geH16oMISif
         TN2kko4WEqOUw92itJ7zPvoBfCdhORMryQcDqAhcNdQ3GevG9S8AXCh6oyHweeC+D83n
         nPuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUph5o3t/94EBa//pi2SuWLNDwqpZQMp+X+C1jS0uEAgfeBXA/XXGbi10GYBVILOesqbLzOyu8vB2adwQ=@vger.kernel.org, AJvYcCXZwlYGtUM1HoIgpZnhQUDIx1T6LZqGIRFQoCDLcbdWpOn/aVGO/d/g/7w6YSqAsCOJualIFxJWWs+Wqpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd3YrTF+punWMTmHP1UbCG0V6Ss6bFJJRmyP9b5X5/J4/BBN4G
	wARNz0grX0YgfL4l5KI2+Bcw/uunKNT/2GSXmai6kkwSOfZ2yLXgSiBUAf6v
X-Gm-Gg: ASbGnctY1mQb4BgkOnKGed0qS5nmetm4xrkJtxV6LpneDoVhjQ2F7wJ/SN1xMtqNlv4
	FJORGgICkoFAZ6MXZUiEzrC6uHpucz6ynjDu6nLr2ElrbiLMnfsb1f+aMaU+u++gcovuFU84eAm
	0TWnL/plt6KRf4WTthJkaeHW9993g7PBGuzfMdqCDwcnHEHcd9rPdVIZygAug7tdmn9Sn8b+aGA
	odQMkKw32RjmKQtO9HEEAXb7sVwS22ZL1w9c1lwQxmM4y0lUFDAM+FO53l+CGnvLofGztP0PXgL
	0tMN+65sVRMM8aheUcSWgKcfjDo2GUJDzA==
X-Google-Smtp-Source: AGHT+IFXZFbqK2eUmc4gh4raMEoWcfL6O2X/FfhuuPctagKUb78DaN3ILVqu3SAPGctSc+tRJaYhBg==
X-Received: by 2002:a05:6a21:9991:b0:1e6:50a0:bbc5 with SMTP id adf61e73a8af0-1ed7a538361mr22586461637.21.1738420783285;
        Sat, 01 Feb 2025 06:39:43 -0800 (PST)
Received: from localhost.localdomain ([187.17.229.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6427b95sm5150016b3a.49.2025.02.01.06.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 06:39:43 -0800 (PST)
From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	edson.drosdeck@gmail.com
Subject: [PATCH]  ALSA: hda/realtek: Limit mic boost on Positivo ARN50
Date: Sat,  1 Feb 2025 11:39:30 -0300
Message-Id: <20250201143930.25089-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal mic boost on the Positivo ARN50 is too high.
Fix this by applying the ALC269_FIXUP_LIMIT_INT_MIC_BOOST fixup to the machine
to limit the gain.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8192be394d0d..ae0beb52e7b0 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11045,6 +11045,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d72, 0x1945, "Redmi G", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1f66, 0x0105, "Ayaneo Portable Game Player", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x2014, 0x800a, "Positivo ARN50", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0x0214, "VAIO VJFE-CL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0x0228, "Infinix ZERO BOOK 13", ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13),
 	SND_PCI_QUIRK(0x2782, 0x0232, "CHUWI CoreBook XPro", ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO),
-- 
2.39.5

