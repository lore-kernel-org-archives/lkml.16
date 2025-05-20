Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE822D9EF
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747286; cv=none; b=Q6HZ51vpcAwLS9c0TXSkGMVxu4GmXtuGE87WIoj8SfT6uH9HzO+QGkMvnXXMZcKfezUCzneJhzyh3Hs99hR0wjPXF5XOn1T7FgO0KuXeKpFbwExI0BOEBX6atz7RJPKVmsgsVbU18quQlh5kkpdVZJGNVmcfSdkLSBMTL/y7baw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747286; c=relaxed/simple;
	bh=TpebAyLrTsQ2vqsgZRkoW+Df1Y0c/BPv7SfZDFMV6JY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cNsoIRnauTicjM8ZtDs+3Vjc02AHOPiILKY5giZjKD/IX1wiaSTJw3Jou9XLTm9W1ymqvqEfOnknmAIJD9dVHjXCkYUELGX3W6aiPWE1S3LG6YU6zcQ8UJSzygJuGm/c8HPuxH0xVXtttipIRoIEwr2iQwVqTiKeMU00RW/c8Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=M//8ohOw; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="M//8ohOw"
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1AD6C3F849
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747747281;
	bh=2YA0M25+OlDCkL3jnXx/NrhA1ZlWn4MZqkLcWvkoDXA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=M//8ohOwF//hCvtWWGlfjZQKotrwe5Xj2znUWncAVgd/JyEnFtEOb/vqfN8ZXopUk
	 px7eA2fs37mKy4IpVy8WPHjCCDk7WAgTrlMLHrhqQ/O4QOXPaA610xQFs9a12kpfyT
	 KIs83bs+5qsyHCT5Wz0FCbsp7kNLOV4WxvNKBoadp6mg05GspdThCWNoreR7bGrQXK
	 gTFx7T9nN1DLcWFElZhvjqi4thewF4u2WwIWKbhTnc275O4QctXx+FP+8HCXeXzFc5
	 9lyqYCu8UdtU4k+NwnfJV6QlvI9wyZm6kapAcISE2rXgtUrRVXoSBLR8cXv5UY7x6P
	 YvtKZM1QOgo1w==
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af9564001cbso3688870a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747747279; x=1748352079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YA0M25+OlDCkL3jnXx/NrhA1ZlWn4MZqkLcWvkoDXA=;
        b=WRWxvLouJOfsWDKe6rfogdQPo7JDFv6YJV5bEBNMsuuD/+KG9YrlnxUVxXl3K7XzOe
         k9/1Ngrfn6SUzo+RZRwjt07702GKn0KTnrUiHMggSj/yv6WwcevdsOLuPLdYkhzQDqBs
         2Tqc9+O4PPjV58eKadVIGCI+q3U+Tf27uscvSeK8ofrpHcui6fengpBBXvL5yfj/2jiL
         pg+B7QyVqSapJCGGoBeLyTpUhd/Tmqdy6Qpf+2JXkQVpJIlpAVfbwGX904M+NHN/KJ+1
         xrg59IV9wp/4twQBZwYPCDW9ECi4tAV1kuXXO7PY330h0AkyQ6FY/Hn9mTF6a+j4qG5s
         e8lg==
X-Forwarded-Encrypted: i=1; AJvYcCW4c4OqbKHiFjJDfmmnzHjiHuS0Z/D5qdv61z4EdtzTV8u+6H8SlZRfOwQZ4oB4e1We9y4KmogETEPZq0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJM0Wdmr/8vCvQR1hwDpRfgKpIny4wnAAoKwH8v0bWPcbDAPW+
	fnhN161yx15eWrY/IZcmVfiNpiDJiQiGUR2WkvhOtnRKJM+3iY2Sybo5iLaiaVl5omq9JUR18RP
	LSsW6fLHXqThDFd7TwOUXX7bPqNoqvJbZwH9F2AslpVnp5tUUJm/9l+RT11GMpY/gGX30TEB0aK
	ejHXuISIqQP6ExQq80
X-Gm-Gg: ASbGncsUPcfEry3E3+RDuyEZ78LpzMhtHieXTWxbWVI9Xr3H+kxQpA32REhI25B9qkF
	vqird4SgF084bnKI+RA6sySK6sb7+3UDCEuuKI8ddIxLrgPZeyf5jCdafMIpCKQDAfJHBLAtnQr
	eAQoHfFXEgNzgKLjebOA8hwR9jvIHp2zbX6+8oiXUr/OBnrBMjaCkeNyK8d/YkZk3VS7awQ+K2Q
	Aw/zx+dIiX7bacBsPJByRdSSZnUrr9dti64QLvInFT+an7sC583FO4F66TxZvSEIscxmfFm29c3
	GSqNLfItxKN2xW5LiD1ch1MGX8lBlvnaT7HsduB9Vqaet6EoUf+iSDeQWA==
X-Received: by 2002:a05:6a21:999c:b0:210:1c3a:6804 with SMTP id adf61e73a8af0-216219f0430mr27053139637.31.1747747279312;
        Tue, 20 May 2025 06:21:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3Uk8VVEzFJdwamQAzEuxRNAeqlXcsa5LRVzwUT9hLQpcRSgf59fIJNIEMVtvNpIlyYlBWYg==
X-Received: by 2002:a05:6a21:999c:b0:210:1c3a:6804 with SMTP id adf61e73a8af0-216219f0430mr27053087637.31.1747747278881;
        Tue, 20 May 2025 06:21:18 -0700 (PDT)
Received: from u-XPS-9320.. (114-36-215-124.dynamic-ip.hinet.net. [114.36.215.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e589esm7890635b3a.9.2025.05.20.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:21:18 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com,
	simont@opensource.cirrus.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek - Add new HP ZBook laptop with micmute led fixup
Date: Tue, 20 May 2025 21:21:01 +0800
Message-Id: <20250520132101.120685-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New HP ZBook with Realtek HDA codec ALC3247 needs the quirk
ALC236_FIXUP_HP_GPIO_LED to fix the micmute LED.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8a2b09e4a7d5..13b1721365cb 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10882,6 +10882,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e1a, "HP ZBook Firefly 14 G12A", ALC245_FIXUP_HP_ZBOOK_FIREFLY_G12A),
 	SND_PCI_QUIRK(0x103c, 0x8e1b, "HP EliteBook G12", ALC245_FIXUP_HP_ZBOOK_FIREFLY_G12A),
 	SND_PCI_QUIRK(0x103c, 0x8e1c, "HP EliteBook G12", ALC245_FIXUP_HP_ZBOOK_FIREFLY_G12A),
+	SND_PCI_QUIRK(0x103c, 0x8e1d, "HP ZBook X Gli 16 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e2c, "HP EliteBook 16 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e36, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e37, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

