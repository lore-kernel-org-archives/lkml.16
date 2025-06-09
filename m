Received: from e3i282.smtp2go.com (e3i282.smtp2go.com [158.120.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA99D2459D1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 08:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749456253; cv=none; b=GcQ1RQczV/TbI8xts8GnCe463enqlr3vAW0nE7AagOCOGpPC2zFlEHiBwtbKR5HkJT+CKiWXmL2PEmj9LK7gZXmbnBz8iA0dxWkeSQYDUhS7a3ll2eTOHqYiy6C771PJlCavwUnzsSV23Cv6RBH/hAvHECPNdlTkn8nLiwKBuEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749456253; c=relaxed/simple;
	bh=7VIXiVnLp6xUMZfeU9BYhxVdq25YMhx1Vl2EPXeFzSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZD+kHukKcftkufYGesWq2GSc8qfKAu6bpnD/d1+21WZ+ad9CIqy+R01GCssTTliq1CTCA0S6y2LkWJTqJikKt2rQRs4TZEW0IfsWoiILym0hxOpGTvEj/WvUI6A5tpd1CKWECplu4cNZOs020XVBiLJJTtzVSnJMZd0VL1UewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=pyF1bXyn; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=S/5Sq+gx; arc=none smtp.client-ip=158.120.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="pyF1bXyn";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="S/5Sq+gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1749456242; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=OAD1I4lKD9GurTiefje3GPSgP3drA15uqZbSTFtnYlY=;
 b=pyF1bXyn0nD2/TKm3d72U4PLMotNYyu/4qIqWpy3s1GL/TS7wt3OArBSeax63Wbyu5vNs
 0+rVPSbFMyTvDkIXDLaNtWfhIj8n2+jIwf60A1Xyvao24evohkMUkjAhhnGJEzkwjjyKhnl
 WFXMz45DoxdSsr8PlBq/Cz/Nf5RW8vHw2ukPrncEGbbJMT0r/eQDchOm45jCbUc1BeMBK+V
 S/OWGoNgUGp90XSBbeIPx7yyBBdm4tHGwAKo9QrxD1vymJwb9dydHhkb36i3ezHAu1l6nzD
 GDip9Zw1RKzIBkO5e6RjjUFqy7kQrEVQiy685TJ/HOvjooItHDi9PAGW8XaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1749456242; h=from : subject :
 to : message-id : date;
 bh=OAD1I4lKD9GurTiefje3GPSgP3drA15uqZbSTFtnYlY=;
 b=S/5Sq+gxzB8SV88a2vfKN8KLrwv/CQg2WWsxX/zGT3QzZrSHUSPallGHYsJRVsivqPg9U
 LObu9G78bCB8frSf3RJZ9Gp+PYUwCRAuhPhN0w1XrtK1Tm04FFO/R1I/I97/RXodPoYWZv9
 TqC0HQEEkKZN829XcZxxleGswJ+PKx9NwhXlmMDGrODG5aSDVxugZbfTHb/9sK6z7BI4ob3
 BYXBE0Rnzf+ei5dxvYZ4kMnnOFwb0KVrTrMAGWfLc4GrlA/430AatsTDa8wscQPHD6stmpo
 F9qYIeN3eiKTZAoSLZlicdVf0apJAb6LIWusB8fbYKBrAxKagwsO3aRXjRMQ==
Received: from [10.152.250.198] (helo=localhost.localdomain)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1uOXU0-FnQW0hPmmyb-hAwU;
	Mon, 09 Jun 2025 08:03:52 +0000
From: edip@medip.dev
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>,
	stable@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek - Add mute LED support for HP Victus 16-s1xxx and HP Victus 15-fa1xxx
Date: Mon,  9 Jun 2025 10:59:44 +0300
Message-ID: <20250609075943.13934-2-edip@medip.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sVoHSOn4rB
X-smtpcorp-track: sQwNTq7w3mzQ.WTbJk_JeEHmK.2nWZlwyMyRs

From: Edip Hazuri <edip@medip.dev>

The mute led on those laptops is using ALC245 but requires a quirk to work
This patch enables the existing quirk for the devices.

Tested on my Victus 16-s1011nt Laptop and my friend's Victus 15-fa1xxx. The LED behaviour works as intended.

v2:
- add new entries according to (PCI) SSID order
- link to v1: https://lore.kernel.org/linux-sound/20250607105051.41162-1-edip@medip.dev/#R


Cc: <stable@vger.kernel.org>
Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cd0d7ba73..c70bee626 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10787,6 +10787,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bdd, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bde, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
@@ -10840,6 +10841,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c91, "HP EliteBook 660", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8c97, "HP ZBook", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8c9c, "HP Victus 16-s1xxx (MB 8C9C)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8ca1, "HP ZBook Power", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ca2, "HP ZBook Power", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ca4, "HP ZBook Fury", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.49.0

