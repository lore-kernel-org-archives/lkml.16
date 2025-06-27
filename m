Received: from e3i282.smtp2go.com (e3i282.smtp2go.com [158.120.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC12ECD1F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057522; cv=none; b=C7I/7tKZhVuwVX42cyT4Lb5mEBsA0WM9CCCL4kQKEyFyAIikW8Q6gb7RAjbUiDM4pDR9PoD5lX3M9rtsCnfgwCQzxygTe68MXmc9Ac5jaIMOykxZ1R6htBzaQEchHLWRS1+eYig+GXPNRh3H2hXnzk8G/knm9uvtrhc/5pkq8lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057522; c=relaxed/simple;
	bh=hnIQiztxMqZWdOo1P+htuYxmTRJegAPaInqW5mKJO1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GkAm/ODqXhpXycOIewewsR9lve/eVao15SPBlpaJJUGglEwEdMt80Etkoq+bG/16mYzJGhGLLaIs8AzxRM9hTjfAPd3l1kteb8kylLtpmsnZU8ooHPxd5qIrMwIvUz2lLvWV/IZYAucOguYEndxukh2/OfJD7NIYSSLNk7Cme6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=av4kSKYL; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=Ly+Zqvtq; arc=none smtp.client-ip=158.120.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="av4kSKYL";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="Ly+Zqvtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1751056609; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=TqdWV7/vA1rvF4B46py+BIoi1Rg8y4mycuMpMH6ZDBQ=;
 b=av4kSKYLDByvQKFQewI0AeGRQpE6TT14Rq5yCQFv4TWsXzWEsYGmLRMBKtZrdqq+sMGnw
 n/auzkCIDFCoZ9/ij8jENxRfo23x9Ig+j3y1QYzIwtBPoQ2quxdOM6iPvUrjdMlRdVmHu0c
 h+GgDJLXt/NF0a7WPdKnpR7k+WDfVL/DSGRLvKZ31TfFhewvWlxTfmlafxdMD+ZN5RHHT0H
 u3dweNETCHu+2BMFXkTmYdBYAR47l1S0PttPcvQmty6bgQ9K4arLwVcmjnbqXAlqkrvaqYM
 GOJeQ8Zcl9zYI7PyYTdfDPXhVV5xMYyzFXiEhnYULm1npdsuD9JZfhORU2yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1751056609; h=from : subject :
 to : message-id : date;
 bh=TqdWV7/vA1rvF4B46py+BIoi1Rg8y4mycuMpMH6ZDBQ=;
 b=Ly+ZqvtqFPf8NbXHLWbg+++xHg3waNOtJWTSkUTj73ev2ALh1+ispds0Q/DV6fgFHlMNZ
 6Q++LHGodnUuyPTZ2aO1XRe34/9isRyKhtTeY5Gjc69WwBQPadbc+lrBGGRrUbWlsDOoxXU
 eAsgWK9g/GcHz8m5hf93w81yBTom8hukDiVYqRS0woXOby2fa6JxDNYfEcw7fW46iNGwcG3
 bhTembhvviKpxEillyvXrHws+omWleXDc5qDnpDSBH9TZnQAP/gaOxiB5R7ienZDwsGPMb0
 ph+tNtopb+m/l52lXir5id1REt8yVLRZdKhTmkzahTNpLrX17RLfIrherKJA==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1uVFoO-FnQW0hPsXUs-39tC;
	Fri, 27 Jun 2025 20:36:41 +0000
From: edip@medip.dev
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek - Add mute LED support for HP Victus 15-fb2xxx
Date: Fri, 27 Jun 2025 23:34:16 +0300
Message-ID: <20250627203415.56785-2-edip@medip.dev>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sS8hnAP156
X-smtpcorp-track: UnwhM9mHtMbX.i6ZMZODIbA4Z.-5GMkAxhpj1

From: Edip Hazuri <edip@medip.dev>

The mute led on this laptop is using ALC245 but requires a quirk to work
This patch enables the existing quirk for the device.

Tested on my friend's Victus 15-fb2xxx Laptop. The LED behaviour works as intended.

Cc: <stable@vger.kernel.org>
Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 5d6d01ecf..a33e8a654 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10881,6 +10881,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8ce0, "HP SnowWhite", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8cf5, "HP ZBook Studio 16", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d01, "HP ZBook Power 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d07, "HP Victus 15-fb2xxx (MB 8D07)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8d18, "HP EliteStudio 8 AIO", ALC274_FIXUP_HP_AIO_BIND_DACS),
 	SND_PCI_QUIRK(0x103c, 0x8d84, "HP EliteBook X G1i", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d85, "HP EliteBook 14 G12", ALC285_FIXUP_HP_GPIO_LED),
-- 
2.50.0

