Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D711176ADB;
	Tue, 20 May 2025 16:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747758066; cv=none; b=BS9+iVH+iN+vSAom/aT2wEJjH0VTKzRTcdwVVV7A07HBXB8mXqVPkjQvJQpJxBJyNgjSDRwH9ImUnzJrjI8Y//+7ShFtyx6qljQrOXk9zfwDvxadw4Wbu5tB13CnXLfpxOWIvgBHMj35YrmhNji2cnEZF+xxkmyOQI3caGEyVSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747758066; c=relaxed/simple;
	bh=SSobZg4XWzqdSJWhFz9pnB5W2X6X9hVUrbmWeoRJY4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gq4ItDSux93dB776zo5q/QUsUkBKAgH0t2MktNhvoEPfddhnc//zVJCtZaRGrnbnmd2cYLT61Db2xFsHZ/pnPaBWpMx6fPb1YifKMHSiEsFyKc78zK7CMzbv7DMQj6i2l2065CRvxufPjknITCZrRF4moRikItAFXleo/LAtrPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Il3SQxfL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Il3SQxfL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A99DC4CEE9;
	Tue, 20 May 2025 16:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747758065;
	bh=SSobZg4XWzqdSJWhFz9pnB5W2X6X9hVUrbmWeoRJY4o=;
	h=From:To:Cc:Subject:Date:From;
	b=Il3SQxfLOJDWagSQuyZ2xPkF0lK36M5AGsuMd3WyrP45MCutzNlUA1uUZ8nqL9V52
	 CgXxSLXOMzLqmu4+LLtDt67FRQn39vqfcoZEpnW9HWDFjOXZugptOnzDwY5bg2Uq4H
	 C3tCZXpnNa2+3gywpFWLMSTk0v+lvXLyIZyKKGXkmSbqIPy5JQnyWhljHAoPQ6ACNN
	 s+0ufCuK7MIKrKYHEWGOIRxjYNdiT8Qga9DJUe+JMyhZmF+AjIKm778wQ2K2AksFm3
	 3m7odKUo2K/fhCCiscVMETPuwPPwAxReAIWrAr7lc5MzvogMu3kR/UkxVmATwUNYX2
	 RrlWwo0Davthg==
From: Arnd Bergmann <arnd@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] ALSA: hda/cs35l41_hda: select FW_CS_DSP
Date: Tue, 20 May 2025 18:20:48 +0200
Message-Id: <20250520162101.3929551-1-arnd@kernel.org>
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

Fixes: bdd9ea9187c4 ("ALSA: hda/hda_cs_dsp_ctl: Delete hda_cs_dsp_ctl module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: fix subject and Fixes line to point to the correct change
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

