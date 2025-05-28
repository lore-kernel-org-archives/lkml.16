Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C91F37D3;
	Wed, 28 May 2025 17:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748455030; cv=none; b=QcrnSTx6aJcD00hBGrVTfQHcnt0igkISWPW5z2t3XmnUVFP3uvSWnwd7zsPM0RY5CiWohERfYLoW7THaQNqBHOxSU+HajZwIQdWmQmM30prittm2eCEtR1qO/LI0szhxxCGBXX8x6IczLJnPbH4mFcMoXoWBLM1271wgynZQVLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748455030; c=relaxed/simple;
	bh=VcMITpVr5gWwvB865s/OTvpGuzUj1bOsEtSF/dD4XZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=d5ec/rGInKCFUIA4WkcvsJNmHS8yylcmTcoiEuqxqibhzROED6twDrmWuYI3TbliwoSTObwF1Y/QYMroYS1UgyRrft5htOEcmn7bT435emg8vjsalhxQTpVsVCSOQOkUSZVoVhowPIp8EQHPloDeCoof89RWKcQlbANMSELC804=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjYUKwoL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjYUKwoL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5558C4CEE3;
	Wed, 28 May 2025 17:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748455029;
	bh=VcMITpVr5gWwvB865s/OTvpGuzUj1bOsEtSF/dD4XZY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=hjYUKwoLJ0SCGq7IOOtEC3HIsb7/6992uKIsixcRsoF9+TXNNvivw6YDE540ZNLDK
	 NMWFrW6RQfLzJVPyA6CyQD1r6RDPD0toM2Ema4cJoAU/dWCVS+n4DvpOcIbkFDlwN3
	 HcRtz+3MyTZM/qjeXBLhJjX74PIK35tUp6tYKJolCQsiy9eIfsfqrZUWUb4msn8Xgq
	 zHYBknm4gjEIp0e0q+Y5SXZCb26a3Q0ragUQS/cDptrmcbBaAXjAbmGgcAmzGDNwh/
	 dyQDl4NRlmES5ulplAUroYpF9XXvtAQ0nHjvs8w40GrbOKzZNIGoingiY225GNV9VK
	 m77psZn0ZYNHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D2CC3ABB2;
	Wed, 28 May 2025 17:57:09 +0000 (UTC)
From: meowmeowbeanz via B4 Relay <devnull+meowmeowbeanz.gmx.com@kernel.org>
Date: Wed, 28 May 2025 10:56:58 -0700
Subject: [PATCH] ASoC: amd: yc: Add support for Lenovo Yoga 7 16ARP8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-yoga-7-16arp8-microphone-fix-v1-1-bfeed2ecd0c2@gmx.com>
X-B4-Tracking: v=1; b=H4sIAGlON2gC/x3MTQqAIBBA4avIrBsw+6WrRAvRqWaRyghRRHdPW
 n5v8R7IJEwZJvWA0MmZYyioKwVut2EjZF8MRptOd2bEO24WB6x7K2nEg53EtMdAuPKFpAfv2r5
 tSBsoiyRU8r+fl/f9AJXfnF1uAAAA
X-Change-ID: 20250528-yoga-7-16arp8-microphone-fix-e07dc4643e02
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mario.limonciello@amd.com, alsa-devel@alsa-project.org, 
 meowmeowbeanz <meowmeowbeanz@gmx.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748455029; l=1199;
 i=meowmeowbeanz@gmx.com; s=20250528; h=from:subject:message-id;
 bh=pwC5yCZaXPRUyPuizllISjCOfre1eAHhzXvSoc3WKtk=;
 b=JdOuKTlrwAqDQaZnvlonVdIhlTPvxaOs7dr5et2hG5rqVyEKcXes5mNivLjLvz99mNAPqMp06
 KB/7zo6ufxxBiPBOsw3yUubthEW1aCB2WNPc+VfsoGaaUcvddWrzXJn
X-Developer-Key: i=meowmeowbeanz@gmx.com; a=ed25519;
 pk=gUBt2QAUfouneGh4/++G7dhBBU8WNcaw4woqB/QUV5M=
X-Endpoint-Received: by B4 Relay for meowmeowbeanz@gmx.com/20250528 with
 auth_id=415
X-Original-From: meowmeowbeanz <meowmeowbeanz@gmx.com>
Reply-To: meowmeowbeanz@gmx.com

From: meowmeowbeanz <meowmeowbeanz@gmx.com>

Add DMI quirk entry for Lenovo Yoga 7 16ARP8 (83BS) to enable
digital microphone support via ACP driver.

Fixes microphone detection on this specific model which was
previously falling back to non-functional generic audio paths.

Tested-by: meowmeowbeanz <meowmeowbeanz@gmx.com>
Signed-off-by: meowmeowbeanz <meowmeowbeanz@gmx.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 3d9da93d22ee84914a92cfdc1de7b977dfd3bfa4..7e62445e02c1d0632f5f5e35cf97265f42829ba0 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -311,6 +311,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83AS"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83BS"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {

---
base-commit: 76f8d35964e4de1b464de22e4f3fdc14937ed854
change-id: 20250528-yoga-7-16arp8-microphone-fix-e07dc4643e02

Best regards,
-- 
meowmeowbeanz <meowmeowbeanz@gmx.com>


