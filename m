Received: from e3i282.smtp2go.com (e3i282.smtp2go.com [158.120.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66A7215F6C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749294389; cv=none; b=Aa+bXIB1kmLdUY5Hg8tSzwnBmZnbir3Q+VOKgV1Ihz6uFW243fLJMTYoc7OENC+C0oaK+Hq04X7z7lF5KhYoIsCipW7CVEvMe8J/tX5J+ouD8OB0AC2ITzQbCWMwsrqxkNMuMeUbRlmEkDTr2wN1bp4/umDUgrKHXe+2f2FnPes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749294389; c=relaxed/simple;
	bh=nX74YXxYtHkzOexVkzDImxaKm+7hvrwPVrhY5bNpSrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qvwkiVj0fKMJFMp19VqCDI8n+gxLmKAHRvOqrc/JLk4x7XBlCAMkFvCN6sbmJMnhCaoxv6ayGR5XHU/HLfifws8PVrrWWgJJV9Z+/XRCHhqFDnteTNyJss9Vf71dvvl2bPNvx0b3CABfuuRdPIJ7CknnwcdmtzoM+Tf1wBuCTkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=pDMjzRHd; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=bgkbXsl4; arc=none smtp.client-ip=158.120.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="pDMjzRHd";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="bgkbXsl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1749293474; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=hOyF5qcsGk+wcyGuqz+JA3xcq8KlJ65GJ3VjxNyRqCA=;
 b=pDMjzRHdU3FogIf3jYNa+vPVqMoU/KlqmpANEdkkKjc1j3wVDsQNa1vyXunajXA7DiJHM
 fl+VH5iln436mnq+lBWIdj58Eog2NESxyrb/bXXDTemNkhT9CF5DI8R/yiyEtckdwyKIb5d
 WETTTKEX4tLuNscw66N4gH4rvrl9oy6pUZpAByEglzUBmRPJvxJSC5F75KHeFo+PeIFl+wY
 4Z2kKHLRFs1+Qt0w49fUx8AXDgCHA8IF6bq6mBd8N8GybS19AzO2kVmASFMDih8oxOKpjEf
 r4NgMp2CftwaWtlOihQnZ6rSlWAlZAYSiJDoTHaQ4wVrGNkITHa2OXnzbTPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1749293474; h=from : subject :
 to : message-id : date;
 bh=hOyF5qcsGk+wcyGuqz+JA3xcq8KlJ65GJ3VjxNyRqCA=;
 b=bgkbXsl4VGZYWRPYSRxuyWvjWJFhF4DFFCzqx3f7/dSEAX9YKNnqFgRx75XgpQF0rP1BC
 TIcU/DN0IIbMpKbkIknooo+Haf6YcvycLeXKNqn/QYjB+4B3S+bk+vmB2b8RpF+9nci15ua
 YUU2V7/2fffUQejK2kU6NLadCflssSB79lFEqiEnCk8HLr/eCEnaea8ftL+oMCLp4d58xQr
 eZImB1Vza1+R6Llo10k7aIuBEKhQYg+6kPPxJOHUB0e4nxBBtbBpteAEXiBy6eeZIAInJeI
 JgpXwDcdjPvaRboRSdvDDzT5h4kRouMbyKAu0EUIKHTWnOH+uB+CHVUfK+Xg==
Received: from [10.152.250.198] (helo=localhost.localdomain)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1uNr8l-4o5NDgrtezB-jxvq;
	Sat, 07 Jun 2025 10:51:08 +0000
From: edip@medip.dev
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek - Add mute LED support for HP Victus 16-s1xxx and HP Victus 15-fa1xxx
Date: Sat,  7 Jun 2025 13:50:51 +0300
Message-ID: <20250607105051.41162-1-edip@medip.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sdbwEFunTN
X-smtpcorp-track: RY3mYqRYs-In.a0PqPoo1hbB1.B_9Z6gs55nd

From: Edip Hazuri <edip@medip.dev>

The mute led on those laptops is using ALC245 but requires a quirk to work
This patch enables the existing quirk for the devices.

Tested on my Victus 16-s1011nt Laptop and my friend's Victus 15-fa1xxx. The LED behaviour works as intended.

Cc: <stable@vger.kernel.org>
Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cd0d7ba73..1e07da9c6 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10733,6 +10733,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8c9c, "HP Victus 16-s1xxx (MB 8C9C)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a28, "HP Envy 13", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a29, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a2a, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
@@ -10805,6 +10806,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
+	SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.49.0

