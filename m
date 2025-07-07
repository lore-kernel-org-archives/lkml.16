Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D7828934F;
	Mon,  7 Jul 2025 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888764; cv=none; b=uONKW9ZhruzqDLNflCEdiWAbLswuQ6afeFWOVLlQw8l8EjtpzjdclQdNt2yOY21wwcOxUKNdDrjsUVqtDVeKrNgl819GwaRCiYBwKziAajZP4ALyTS3Ik6zgl3GIcV/w3m62X6XL8w2jfBb7sNtIUCg+K+1zao17NpajJtllc2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888764; c=relaxed/simple;
	bh=h+C3lu8DbpcNd2XMiDQNSTEqXsS8Uyml5tOdN0NEOu0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qgPNdbQnvLpYxA0HG9/hBvY0aBlfwiwJLvXm7b1e726WCJ+vH79MG6jA7jWz6I7DqRsrZ5GQDaE1S7QrPo9kmzkFY6Zgbom3u5t3Uo8BDUflt+t9s3dy++Oo2LZPAvMZnbzH+aviATeWgQcgpOIqkngg3d9KHYEsiAYK6VypW7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jx2sG2nQ; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jx2sG2nQ"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-70100e9f709so38239236d6.0;
        Mon, 07 Jul 2025 04:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751888761; x=1752493561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FERGzDBVjjTeS83J5493eIs/wTf17cGGjgE0kbDQ8sI=;
        b=Jx2sG2nQ5QcQx41hWcjMuu20XsUhuK9cf4XHMCdKlqgxm/Sfkoj+0o1HakfjApztfV
         A1c5F32tgmi9DNgKJrmdBPdD1QcSO8vit8ybv0MN16Welai204U8HxEMChV7m8NFqOqc
         wkBFcpledavY7W04l5eAjLD0dMWJn2rYGlj17TZaPPHuZMWapOTHlUZ5C2I0snAndEQD
         GWHAT6U9vBMnOWfYt72BTum4qRH48FRD4/CVwTkUh5ul9KMG105MvqxWJ2YHquFyWtNt
         XaNVxltDPeUa+ySQN40Cy5BiwXMR+t5pEdX6CNdSmihjvQfNx7jPafudhY/T3dnxhB7V
         vxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751888761; x=1752493561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FERGzDBVjjTeS83J5493eIs/wTf17cGGjgE0kbDQ8sI=;
        b=A9IzsOv2xE4HRucmPk+SbqI/1UJsiC/XRqMxOQKFsWNqhTcqCPaIZ1she59GN0Nhp0
         +nfjxxiyV+RMd6CBUixR7xudVBPAl4Jk3oZLYWI1arCCp5HiHI/yLbgp11zmIvESn4Oi
         RFhDc7fPuZtOo6T76pHKlUUclpTVmETNz2p3T6b/1Wvq6iZHFZ33fbH+8FVDoG2ZiHh8
         ubNAdTZRLOq4JpujpU7b8pxKegQhoRxpyEHZDfd1U4P8e5lakFRzHRJMzYKbYhZol8Uz
         3w0yZ8DbxT0F1padg6oLPIx2xDRDT2Rg16hZsVDndDJLOICBGZ7IGWqmsbn6lBXb0Lfc
         /qPw==
X-Forwarded-Encrypted: i=1; AJvYcCW7SRODqWpV9He8A1VlWmWhtp5aIMN5Nk+RCKAcZGHgwAIxRPPmB9yGo/IS5vKM9ZdrjUNS0y1DuE068XE=@vger.kernel.org, AJvYcCXZjc8L4e39td8kMsaOPfhvexJ/4y1GfJiMY6lFdKA/TmQw69n+eCG3rNrRuGrKSwuEAbvSIiH/9wLC200=@vger.kernel.org
X-Gm-Message-State: AOJu0YxloDYfACEyJXvLARRsXKr2xbA7PsHia2QOpCY32mOK7CHertzM
	GD4SAl6/lEMuZSGekWsJr5KRe5TMumq+zEAl1I9I/baYSJONK07uGu71
X-Gm-Gg: ASbGncsY6h6F2HqwYjupZqxAH8elq0kb/+iv+OBS1ChVA/ZoBxLZQqHQtxAR4HGFnx1
	2xD5ULYwgEnrTXWf9AO5rRsK6tpeYLVZAFTVKzJy3MUKJ8udvafaA2QacanEV7r9N8jUp84vEV8
	KBDEIyhrqFKfRCyi3uA3OJDUh7Qpp4cUs4UW0peuwRs85Ml+KgSokdsg8AtRWJRIdlYu6YaCHsB
	Wr5vE28/mi5uW2p4zsQsqGty8C5bc2FrQRIMgfgDSnF/jgooj5134K8kRMEgQMz3Haj3K1zsV2c
	Gux3PsXmJa0Jk7UJLl6O6MWrdYkApg4AuuEShAgarmnwNuOphnQAT3n23abx7sFLnUCuqN390Jk
	MEVIOyQ==
X-Google-Smtp-Source: AGHT+IErly4/7hI6LPSos4xxcD1ZCEGoTZLO45FFG64I3QWQi5PpwLYpVzEJQFPl9oRBeZfmBKR5Fw==
X-Received: by 2002:a05:6214:3305:b0:702:bc78:a1ef with SMTP id 6a1803df08f44-702c4e0aab6mr173639156d6.3.1751888761338;
        Mon, 07 Jul 2025 04:46:01 -0700 (PDT)
Received: from localhost.localdomain ([187.17.229.251])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d51068sm56715736d6.68.2025.07.07.04.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 04:46:01 -0700 (PDT)
From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	chris.chiu@canonical.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	edson.drosdeck@gmail.com
Subject: [PATCH] ALSA: hda/realtek: Enable headset Mic on Positivo K116J
Date: Mon,  7 Jul 2025 08:45:37 -0300
Message-Id: <20250707114537.8291-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Positivo K116J is equipped with ALC269VC, and needs a fix to make
the headset mic to work.
Also must to limits the internal microphone boost.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 5d6d01ecfee2..d52e1a70deab 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11424,6 +11424,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x0228, "Infinix ZERO BOOK 13", ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13),
 	SND_PCI_QUIRK(0x2782, 0x0232, "CHUWI CoreBook XPro", ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO),
 	SND_PCI_QUIRK(0x2782, 0x1407, "Positivo P15X", ALC269_FIXUP_POSITIVO_P15X_HEADSET_MIC),
+	SND_PCI_QUIRK(0x2782, 0x1409, "Positivo K116J", ALC269_FIXUP_POSITIVO_P15X_HEADSET_MIC),
 	SND_PCI_QUIRK(0x2782, 0x1701, "Infinix Y4 Max", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1705, "MEDION E15433", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
-- 
2.39.5

