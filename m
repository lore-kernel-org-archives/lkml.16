Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C44D2417F0;
	Tue, 20 May 2025 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754827; cv=none; b=sw6smBzDUdBreks44L8yw9xNqfUQ+GpobT7wXEh2J+i2WBLULojVOaj8ZKTGI89jmZRE/CLpmGzQmKPok94lRlf5PpJHpUVg98SUKUYXr0Ba+lwTMm01I9xYwO6Ndi0g5Zw3O3o8XWFd8XzOexy1kuRZNVVwcCf2QikbFL/0MPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754827; c=relaxed/simple;
	bh=PK9R+rXvfduGiOBg6THsx1wuDsfStpwvIfZrpLa8Yfg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JxKaeO+2UxdDWXwWNCDL+EuFlKil3433hmpEm/WJvyfOPCyMRdeag3vMyYYdxWwntV/fONrtGdWFoOhkjAE7RhyuNvhGu51v5oPPD1fKXb0xDUJqBhKy/MF06AFd3Oeo2gHuAfAEl2ZhLIUl5/Ug8roA5JKqrBQkwjepshMndm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqUIn8CO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqUIn8CO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13390C4CEE9;
	Tue, 20 May 2025 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747754826;
	bh=PK9R+rXvfduGiOBg6THsx1wuDsfStpwvIfZrpLa8Yfg=;
	h=From:To:Cc:Subject:Date:From;
	b=NqUIn8CO/9hehnzHiTA158TFGyt5EJVLlXkDOVNtCHWt4XIvhvKuKvNQ/Q/1yFMdb
	 Mr7inE5T8EUcdl00dtTg0U92D9LvRDLWuCA/N1jz+ljmUymScdd4qlqr87fTJCxfKz
	 W02JSD51DQI2+TU2Pf37oYPv8AL2I0+ToL3aGHO3CRdN1n+3biyvU/sFsFXpAmGTAH
	 FjMtmdoixuB1QE+lCEtKDPR91DwnkYB3IyqiHp/ZCwzccDE8xzBOQT29o6tKiFEzwJ
	 Cll7a8+Wy9M/vl64SeZaZu+KbLZqSDzyQ4k6QTL3T1mdO5dkt8fuTWxbA5awG8EPrG
	 HpHp+EeGIHAtw==
From: Arnd Bergmann <arnd@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/cs35l56: select FW_CS_DSP
Date: Tue, 20 May 2025 17:26:50 +0200
Message-Id: <20250520152702.1976221-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When compile-testing this driver, the missing FW_CS_DSP module
causes a link failure:

aarch64-linux-ld: sound/pci/hda/cs35l41_hda.o: in function `cs35l41_shutdown_dsp':
cs35l41_hda.c:(.text+0x7e4): undefined reference to `cs_dsp_stop'
aarch64-linux-ld: cs35l41_hda.c:(.text+0x7ec): undefined reference to `cs_dsp_power_down'
aarch64-linux-ld: sound/pci/hda/cs35l41_hda.o: in function `cs35l41_hda_remove':
cs35l41_hda.c:(.text+0x14b4): undefined reference to `cs_dsp_remove'
aarch64-linux-ld: sound/pci/hda/cs35l41_hda.o: in function `cs35l41_smart_amp.isra.0':
cs35l41_hda.c:(.text+0x189c): undefined reference to `cs_dsp_halo_init'
aarch64-linux-ld: cs35l41_hda.c:(.text+0x1bd4): undefined reference to `cs_dsp_power_up'
aarch64-linux-ld: cs35l41_hda.c:(.text+0x1c38): undefined reference to `cs_dsp_run'
aarch64-linux-ld: cs35l41_hda.c:(.text+0x1c80): undefined reference to `cs_dsp_get_ctl'
aarch64-linux-ld: cs35l41_hda.c:(.text+0x1c90): undefined reference to `cs_dsp_coeff_read_ctrl'
aarch64-linux-ld: cs35l41_hda.c:(.text+0x1cd4): undefined reference to `cs_dsp_get_ctl'
aarch64-linux-ld: cs35l41_hda.c:(.text+0x1ce4): undefined reference to `cs_dsp_coeff_read_ctrl'

Fixes: 849c83fe4991 ("ALSA: hda/cs35l56: Remove dependency on COMPILE_TEST")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/pci/hda/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 339c80d2cce5..3d4badc3f0e0 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -109,6 +109,7 @@ config SND_HDA_SCODEC_CS35L41
 	tristate
 	select SND_HDA_GENERIC
 	select REGMAP_IRQ
+	select FW_CS_DSP
 
 config SND_HDA_SCODEC_COMPONENT
 	tristate
-- 
2.39.5

