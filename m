Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECBC1A3056;
	Mon,  5 May 2025 05:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746422588; cv=none; b=ZE+9OenSNwFMYZ3HyqUdXEaPE1zmzeHRtFCLFIBT0XEP1ZS5xJQxp6qWAALP2+i5wx0IpCxpD7gpD1G+NakpieUgJ8n+BsT7lWGydBgSmJdrlMw83WlghhfgKRslmKTpNqnDdRUmRhB2Vk8ryMu0artjRVV/S7d7gDJxqktF+y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746422588; c=relaxed/simple;
	bh=dQVaf1cnvda5ZxCt/F2DCOLIgjM50oOzDMkhmfbkQI4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k7MY7OT0XbkJZqIC7r4rShHbcS3tFfmORH06ov1GPEBDBeK6NWrxLhnnh2M2fYjn9fQ0SHoYLklZFICIZh4aFzMnOjnXxzJ2Y3eM5PvBfzKpZyrP/Zo0aIdvqz2hVadSISMrS9CGyTDJpucb8qaGEX2ZxTZJnqFmnchGLAp13V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+gVblwb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+gVblwb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101E5C4CEE4;
	Mon,  5 May 2025 05:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746422587;
	bh=dQVaf1cnvda5ZxCt/F2DCOLIgjM50oOzDMkhmfbkQI4=;
	h=From:To:Cc:Subject:Date:From;
	b=E+gVblwbL92g3x7hlclyidOfykEFS6RyPQ+lkOQ6mocIPgw9Uji0PLoaXdFkxlFux
	 LmFsGS6I9i6L5nU6JfsBC6XSvtZob+vpetxRHATkvDjiXCDF3FYHMeN0uO5u4khivM
	 D6hA5ssBI3pSAI8flxa5tFGJb3VqWJzBjyQcvGueH+rsS5YAJdJvSnXTf6fWgVX82z
	 p3XAXdX2J1sTcNFpFW+mXXhaZgn112Pqu78vqsZJlPVurXjx6myunZWjrWIvYZcRWc
	 QgCp8G7G1Qv0+XZJl8M/bVotPEvhtvZjNypWW/XH+y1Dln8kAdjl+PWdr+ng0IGOO/
	 D/+0/pewOcBQQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/tas2781: select CONFIG_CRC8 for SND_HDA_SCODEC_TAS2781_I2C
Date: Mon,  5 May 2025 07:21:21 +0200
Message-Id: <20250505052303.1812002-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The crc8 function is used by the common fmwlib module, so this has
to be selected directly to avoid a link failure:

ERROR: modpost: "crc8" [sound/soc/codecs/snd-soc-tas2781-fmwlib.ko] undefined!

Fixes: 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c and leverage SND_SOC_TAS2781_FMWLIB")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d97ec8176ad5..21df6783dc26 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2026,6 +2026,7 @@ config SND_SOC_TAS2781_COMLIB_I2C
 
 config SND_SOC_TAS2781_FMWLIB
 	select SND_SOC_TAS2781_COMLIB
+	select CRC8
 	tristate
 	default n
 
-- 
2.39.5

