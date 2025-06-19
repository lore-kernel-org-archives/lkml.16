Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9EF30E84C;
	Thu, 19 Jun 2025 19:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360359; cv=none; b=MIXuYdLpEpS3zXeujIZiMbWKLJThaQDaS604Sf/Pl0rlhP7ANCERgblvA1oOY7vI+vbCHr4fi8S4MWI5zAtUUYZcY8ZWc9IyupzD3vX+eG2Um1EzoibNsGy767UI2OtDsM4drYMEgS0apy1XvH3fU1m/fbyU5UJXaqSPkPVQ8v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360359; c=relaxed/simple;
	bh=R7OEcV3JmJdkJksGV788Iornq11dtuV8nDwE2AnFlhk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fNVTawE2dswisAppOskd2/263pFb7f5gjIAjOiy23MvdvulGQGpYCjazFh/1DPvSkHh1sqzL+Zz1JYltGTPVcp+ccnBU5fZbYcnAvsEsuDHExjvnnI3qRtatwA5OSgQJQbI+kSn6Du7sqvh3mYssJsVA0O0SalP3QzIF09S3MDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrmxO2RE; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrmxO2RE"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so858510a91.1;
        Thu, 19 Jun 2025 12:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750360356; x=1750965156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=weiKDWZSXkGmRaOqB5fLfeZew30TFkAIzQxKNLX3stU=;
        b=UrmxO2REL1cRI/aF/0ObwF5vwerRrll5rToTdvsezxCXv+OZRpLaYcboKTlVHSrexO
         58hWwnEqcmh7r8vvp0/66df55Un/mHUoQ+piHAcChtdF7X+Vxe3CnWGhkXP56X3UUn51
         im3UuzLFopveyLSrl/g5KZYB6xVXxxf9F42xjkDlvp95BASprEdrSrbohzWWalys5nl+
         piEK44hMi9/kHa4xpnZtxYiVN+zxHIgHyDKsPyUz1dH6wsycYakUT2Iwilq29BcgcyrV
         81+j5OJgQRtXoxtJYlCfEO1V/TbHP2ybS4syyVwjSyRx8ApXux5Io1PSt3yg5LvGH7Nk
         qISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750360356; x=1750965156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weiKDWZSXkGmRaOqB5fLfeZew30TFkAIzQxKNLX3stU=;
        b=I68n2d2p/HZm1mHXkGYms1wVcBNT1moUk301l3CcvpL+w3ojTyJtHhqKsBrEcbcubO
         gzXbkflKagTL1HgRVSKG9G978VAPbQe818wBujwAQofbSVz2kqb7sOOw7Vmd04NnIxNF
         c271MG2fyXwG/DcA87/qhq4BZI8p8y3nJZQ27yptMX7ShYvhdK+kpjlwOy47/Kb+7gRH
         oOxK1zXT1lvRXi6qg3zhJ48+0cPr7yiU+EvD5OdN77VgQLeC3fUSFSJA1MFB5lzix04+
         ggqZQs797+BL0rYtbTjzRddKRrW1BcFxvQ5bm2/7O69OqXFlWSdgUms4Hv3SSQ19Yj1D
         wXMg==
X-Forwarded-Encrypted: i=1; AJvYcCXA3KLg5pw0xjbKwCckKxmkgAp/hXCbd7AG8ajMUCQtmq9XtExZfMZ+XnbT2YqlwEZaEuOTspPeozvs7Js=@vger.kernel.org, AJvYcCXp4mgpan+NY1Jb6L/8xdif4nZh7NNt6Aoioy31V9OttHhnEux/vNjRu6vWCNKgHuNK8x6Oe7Q0fMTu6OA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAJEvhBBVXYFHUz46CmFHgKusKnqQT0Oifc1vb7adpHW80yQYB
	kYAPCAlr7frWaHrKT5F8qhQ1xqx17RRX8lcX+zFpUoko6t8qM/7iGZSw
X-Gm-Gg: ASbGncvRXIWGCiEzUO9lt51F5Pg2oPGETM/QNMDrB3YmVQh1DsarprqpqitK1n6/LJ0
	VEntG3v8+0tAyoEnWYK3yTZq84RCtHPQ4/Rqz41VWq1TyhbSyZhUiEbJCgk50WIDuSxNL/b0q5b
	DCJeJd3YG9jWJWH+N4weykpwCGuQP/nMsos+f36grZ9TE6jv4qBx+i6WjRW3dNfqtyEE1K4s5u9
	RHK7Sy9l5Oj1ZA8SFq7sxl7bz3FG9xifae3yD76woM5c5jPStdxquG5iyPawu9cgkID68Vm07we
	rsYa1OV91Z5gwHg45koFCkMxzKxTO5O/pj+kQuXJYIs55YFAD6cKVtFnXjK9Z4ZX36uzJ1Bfk32
	3TXg+Dw==
X-Google-Smtp-Source: AGHT+IFaTL6RK7M9N3PMvi6XLhxF4Jv6MfjZqZe4R1m0Tdx7HOYTbpXK4ELg1za70/jrLnwZOy7N5g==
X-Received: by 2002:a17:90b:1fcc:b0:312:e76f:5213 with SMTP id 98e67ed59e1d1-3159d8dbf30mr536200a91.28.1750360355631;
        Thu, 19 Jun 2025 12:12:35 -0700 (PDT)
Received: from localhost.localdomain ([187.17.229.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e06a888sm56480a91.35.2025.06.19.12.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:12:35 -0700 (PDT)
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
Subject: [PATCH] ALSA: hda/realtek: Enable headset Mic on Positivo P15X
Date: Thu, 19 Jun 2025 16:12:15 -0300
Message-Id: <20250619191215.17203-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Positivo P15X is equipped with ALC269VC, and needs a fix to make
the headset mic to work.
Also must to limits the internal microphone boost.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cd0d7ba7320e..0cfe94a03c58 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8030,6 +8030,7 @@ enum {
 	ALC294_FIXUP_ASUS_CS35L41_SPI_2,
 	ALC274_FIXUP_HP_AIO_BIND_DACS,
 	ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2,
+	ALC269_FIXUP_POSITIVO_P15X_HEADSET_MIC,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -10414,6 +10415,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc274_fixup_hp_aio_bind_dacs,
 	},
+	[ALC269_FIXUP_POSITIVO_P15X_HEADSET_MIC] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc269_fixup_limit_int_mic_boost,
+		.chained = true,
+		.chain_id = ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -11384,6 +11391,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x0214, "VAIO VJFE-CL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0x0228, "Infinix ZERO BOOK 13", ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13),
 	SND_PCI_QUIRK(0x2782, 0x0232, "CHUWI CoreBook XPro", ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO),
+	SND_PCI_QUIRK(0x2782, 0x1407, "Positivo P15X", ALC269_FIXUP_POSITIVO_P15X_HEADSET_MIC),
 	SND_PCI_QUIRK(0x2782, 0x1701, "Infinix Y4 Max", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1705, "MEDION E15433", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
-- 
2.39.5

