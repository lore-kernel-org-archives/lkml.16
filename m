Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16254275AE1;
	Fri, 13 Jun 2025 11:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815494; cv=none; b=Cx5HmOjkxnKW+hxqawe+pR7JhySUEwCua2lKnyZVJofe6wgCya5RdbHWD22XXw3Seu+KnMOlnOxUp1/CobbG5LyhJX1688kTP7cGaV3t/YqSZzH2sio4T+zlGuK6vxNJJ4Z55QQ4fI2WEGtqi3uE1YDq4O2GUo8cJyl3yVsK5ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815494; c=relaxed/simple;
	bh=2YaQMA/P3sso6tRVUrftw0eEpHckdSBVm49F8Yxx4wA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tmypKZkj2HNuljo2OrWy9ENmR9/jVTg2UIZsKmBrC06Jtb6wtQKTWoB+kdmYzLSd6Dkcr2Zsypcl8jH+0/Egkpsv/aVL7yTEejMl4YgViBKvgw9g71sVJKdeOlCI/Xb9jy/4EJ9SlzFtNVBfDFMxYmQRCfb4VE7HWVF6ZYqUOUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lm714X45; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lm714X45"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C35FC4CEF0;
	Fri, 13 Jun 2025 11:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749815493;
	bh=2YaQMA/P3sso6tRVUrftw0eEpHckdSBVm49F8Yxx4wA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Lm714X45swi8SAgpFvc1CDA36DKH1s+6rG2Qnx7SoqyJ3xSQN70lgD+p4YCBiEj96
	 2sJ5mBY9w0o1sR3fHRte/3x2Kc8c7yuUwJoJ2PTMnnR9NMO1Q25dAV9FGukMHej9Qz
	 bfqNg8qiK6awtObZe9It8oDbgdcpSZFVLM3iR6J9qsEAnyFAbXCHVcNmXMvJJw99+O
	 qX3mK+J6w+YQX1hLYk8WfCccRsxejzgnTcho7PVbnNS92907SoTAMEqbuel+E/fSfG
	 IPihd4BdLzFHyigOczLAMhDL84UgBivNaQx2PNHNVxWKpDzrGdNtalo4Nv6pK5LMwG
	 Dxy5uZ31e00eA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780E3C61DB2;
	Fri, 13 Jun 2025 11:51:33 +0000 (UTC)
From: Raven Black via B4 Relay <devnull+ravenblack.gmail.com@kernel.org>
Date: Fri, 13 Jun 2025 07:51:25 -0400
Subject: [PATCH] ASoC: amd: yc: update quirk data for HP Victus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-support-hp-victus-microphone-v1-1-bebc4c3a2041@gmail.com>
X-B4-Tracking: v=1; b=H4sIALwQTGgC/x3MwQqDMAwA0F+RnBeodQ7Zr4wdShvXHGxDoiKI/
 27Z8V3eCUbKZPDuTlDa2biWhv7RQcyh/Ag5NYN3fnSvfkDbRKqumAV3jutmuHDUKrkWwtm5NKX
 RP0MM0ApRmvn495/vdd2ZeuRYbgAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Raven Black <ravenblack@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749815492; l=967;
 i=ravenblack@gmail.com; s=20250613; h=from:subject:message-id;
 bh=/bACXv58cmQwq8+BzTLIvAZpJC8AGmmTuOuCZ0+0UMk=;
 b=xTamQF7Ox7AfzVbSqdl2WJ2aehKA1sXLoBYMMIHt4t5lDQBvpUfTfzF3uR3CmlDPtjct7mg0i
 oEdrNV2z+uMA3v04due/xp8ttfSkDZA1ZPneno5EuviXCV1ZrN4poCo
X-Developer-Key: i=ravenblack@gmail.com; a=ed25519;
 pk=8ECM1VXVU5AHsXWVPR5Gs6qmW8kY07IYbgnWZDe+ddY=
X-Endpoint-Received: by B4 Relay for ravenblack@gmail.com/20250613 with
 auth_id=431
X-Original-From: Raven Black <ravenblack@gmail.com>
Reply-To: ravenblack@gmail.com

From: Raven Black <ravenblack@gmail.com>

Make the internal microphone work on HP Victus laptops.

Signed-off-by: Raven Black <ravenblack@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 7e62445e02c1..3451d2f9c9ba 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -514,6 +514,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16z-n000"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Victus by HP Gaming Laptop 15-fb2xxx"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250613-support-hp-victus-microphone-f00d8d524aca

Best regards,
-- 
Raven Black <ravenblack@gmail.com>


